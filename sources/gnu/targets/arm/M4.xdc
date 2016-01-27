/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */
import xdc.bld.ITarget2;

/*!
 *  ======== M4.xdc ========
 *  Embedded Cortex M4, little endian, bare metal target
 *
 *  This module defines an embedded bare metal target on Cortex M4. The target
 *  generates code compatible with the "v7M" architecture.
 *
 */
metaonly module M4 inherits IM {
    override readonly config string name                = "M4"; 
    override readonly config string suffix              = "m4g";
    override readonly config string isa                 = "v7M4";

    override readonly config ITarget2.Command cc = {
        cmd: "$(rootDir)/$(LONGNAME) -c -MD -MF $@.dep",
        opts: "-mcpu=cortex-m4 -mthumb -msoft-float -mabi=aapcs -g"
    };

    readonly config ITarget2.Command ccBin = {
        cmd: "bin/arm-none-eabi-gcc -c -MD -MF $@.dep",
        opts: "-mcpu=cortex-m4 -mthumb -msoft-float -mabi=aapcs -g"
    };

    override readonly config ITarget2.Command asm = {
        cmd: "$(rootDir)/$(LONGNAME) -c -x assembler-with-cpp",
        opts: "-Wa,-mcpu=cortex-m4 -Wa,-mthumb"
    };

    readonly config ITarget2.Command asmBin = {
        cmd: "bin/arm-none-eabi-gcc -c -x assembler-with-cpp",
        opts: "-Wa,-mcpu=cortex-m4 -Wa,-mthumb"
    };

    override config ITarget2.Options lnkOpts = {
        prefix: "-mthumb -march=armv7e-m -nostartfiles -Wl,-static -Wl,--gc-sections ",
        suffix: "-Wl,--start-group -lgcc -lc -lm -Wl,--end-group -Wl,-Map=$(XDCCFGDIR)/$@.map -L$(XDCROOT)/packages/gnu/targets/arm/libs/install-native/$(GCCTARG)/lib/armv7e-m"
    };
}
/*
 *  @(#) gnu.targets.arm; 1, 0, 0,408; 3-12-2013 15:04:43; /db/ztree/library/trees/xdctargets/xdctargets-g22x/src/ xlibrary

 */

