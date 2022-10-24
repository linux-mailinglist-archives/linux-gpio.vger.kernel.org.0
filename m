Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7162060B586
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 20:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbiJXSaw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 14:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiJXSaP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 14:30:15 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B1ECE1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 10:11:59 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id l6so4992411pjj.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tM04am4mFk7KgqfKhUHJG8329Z4M5s7LHKN5Dl3Xtbo=;
        b=TaT5ZiUy/fmuXGl2K8Tp6PeWjRs2iYOb4lW5QNk33FCc4VFNVAZcmaQb/JUVnu/a43
         ojfv9iQ9XgrVF6b0RiNKQzI8EpW2VaxwZppOppLjlzAd8M8bZfB6tIuRoM8599+6AC+h
         PEAn76prpXCrc063yjHTzwPxFVbBCVBSE0rwA+B/6fG5P77FDtZ++nUmqmVV32KjVQhw
         sx36NUpieqIqwFQqAwZ8XluGuMxj7SmcZroyugcIe5YGFNadV6B20aMOmLJU/+aeTXbz
         UyU9JR0zB1x0kk8fb2peNXtY0XZyQh0WPi1acnt8T4ViEiGJsV2GTBsGpIuTkt2bc9VO
         MCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tM04am4mFk7KgqfKhUHJG8329Z4M5s7LHKN5Dl3Xtbo=;
        b=ErQ55KjqVv3xD6sGJFx4kXagPNA/s6E1uiy0R6Ojq13+52DzR8g0QQ2C2iqqelReS6
         Bg9Ysx5VonSsMK4+gzOW4AAg7nMxM/fQLOqxbCxxzGXBk76cIQ+6udDMYtuvPQg3q3i1
         jd35cRhbkVE63GsEdRyZrYjp2iVwpgpLoa0sP3aP6r45aM5+2xEmg/SBj1syMhcvERSX
         mqP/dkuml8r6O5Mvqvydmj8W4gJaAgBjALopqh8fX1hOi02/4Abdb/ro8jWqcqvineCl
         A5Fv8GcD04k5e4sF7FGK8vnLybnD+l2GdulOLeHryElIARwc6gyRPbs/oyTavMPH5F9g
         FmOw==
X-Gm-Message-State: ACrzQf1hrQiA0/GITU5hFN0OU5gsz6RNJz1La9gxpgCDl430lZ2kRdtM
        pMmh96eQGkuqIHDcRWHChmfi4/JO3piXzt+W
X-Google-Smtp-Source: AMsMyM5OgRIkzWrF9Yfk9q8IqXNKmrkbZR0IvZyqcwiAAXKGlahvf5wzg32f8vSjePwQtQpWgkmSzA==
X-Received: by 2002:a17:90b:264e:b0:212:d06f:35ad with SMTP id pa14-20020a17090b264e00b00212d06f35admr20790327pjb.2.1666631437861;
        Mon, 24 Oct 2022 10:10:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t9-20020a17090a4e4900b002001c9bf22esm156954pjl.8.2022.10.24.10.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 10:10:37 -0700 (PDT)
Message-ID: <6356c70d.170a0220.63142.0594@mx.google.com>
Date:   Mon, 24 Oct 2022 10:10:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.1-rc1
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel build: 8 builds: 1 failed, 7 passed, 1 error,
 5 warnings (v6.1-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 8 builds: 1 failed, 7 passed, 1 error, 5 warnings (v6.1=
-rc1)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
6.1-rc1/

Tree: linusw
Branch: devel
Git Describe: v6.1-rc1
Git Commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 8 unique architectures

Build Failure Detected:

riscv:
    defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:

arm64:

arm:

i386:

mips:
    32r2el_defconfig (gcc-10): 1 warning

riscv:
    defconfig (gcc-10): 1 error

sparc:
    sparc64_defconfig (gcc-10): 4 warnings

x86_64:

Errors summary:

    1    ERROR: modpost: "riscv_cbom_block_size" [arch/riscv/kvm/kvm.ko] un=
defined!

Warnings summary:

    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    ERROR: modpost: "riscv_cbom_block_size" [arch/riscv/kvm/kvm.ko] undefin=
ed!

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>
