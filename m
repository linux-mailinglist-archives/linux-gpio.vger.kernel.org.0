Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11924701A9B
	for <lists+linux-gpio@lfdr.de>; Sun, 14 May 2023 00:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjEMWwD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 May 2023 18:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjEMWwC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 May 2023 18:52:02 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A5F2699
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 15:52:01 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64395e2a715so11514288b3a.3
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 15:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684018320; x=1686610320;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HYIDtetzCFdUfwRbzIS04waV0IfvvWAmLwTn8rRJoe8=;
        b=X/FGDc3PsI2XliTheEMyQp4pqn2C7fbmDKAHCeu6X76V2pTICE4V6YZizYb8GkCJ/g
         QpZvVEGQzSMG8r9nKCXtwbaf2C7/c7TYXUbTOKJCpRv3ePn8t/bUhpOfKDfgJ4FnmcPn
         Ch9p1l6bKUTnxTGexR3NFNxRJajHEvAVY4oVq0c59BzJU1Sr6cWNgJN3S4GUCUoN3ooj
         BMDnks6/UCk4IIRCwp7MMqaJL6Icei1rV4AeXRGlHI1d38BeXmupcOxmPP/e1PfUjD8p
         S8tcgPCCNqs4JZ3f2xNI44APbNwrYKnRx7JG/2Duzvsbigdl6QqBAE7mJAUYdKgiXMXi
         U6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684018320; x=1686610320;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYIDtetzCFdUfwRbzIS04waV0IfvvWAmLwTn8rRJoe8=;
        b=L+xKXFJoW6k/hDFjbDQdUdYojm/H3LwlQ1YIyY7qxeSivGNA2fCmE9WeIUt00+wwxa
         CF0ZnBbG9nZRigIV5Dc/qo0Ba/JYXGMEovHBoL0CSMo7cQ8XI7pdX5X3UBimZM3XledS
         CuGhjsVj1+RBWKYlMVYJ0ciaweLgjCfUNueBPD8Zt99LjQPwaJpiHEI/4vPI8eFj8vdy
         aT/p3UQbZX7mDJizar/wy4Vxw9G+e02yIH6ZEywNCHGTqNdQBg68Z2/kcK5Z7y/Jl/As
         GOSV68rVHuufGfKydrMUyKXb7AOitZk0LSYS9/gQh7tIzC0C958iG+XlAF5sGFvPpAL9
         2Zkg==
X-Gm-Message-State: AC+VfDzVSFOiwbnYn4+SwSC4OcIYwlt2iJJzB2t6p3JH97E+4/bzn1dI
        ysm0ExbwiGvioJZlaDL1VDqW/7vliTiqUEr8h+o=
X-Google-Smtp-Source: ACHHUZ7KHw8fdM8bBRhZewBF1JN6yXIWhlcgcU77dfUinBS+g1qi5Xvf3+VjEQiFIZLaE7bCMJ09zA==
X-Received: by 2002:a05:6a00:1741:b0:649:93a7:571b with SMTP id j1-20020a056a00174100b0064993a7571bmr13044505pfc.13.1684018320582;
        Sat, 13 May 2023 15:52:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u12-20020aa7848c000000b0063f00898245sm9463406pfn.146.2023.05.13.15.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 15:51:59 -0700 (PDT)
Message-ID: <6460148f.a70a0220.f01ec.33ec@mx.google.com>
Date:   Sat, 13 May 2023 15:51:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v6.2-rc1
X-Kernelci-Report-Type: build
Subject: linusw/fixes build: 8 builds: 0 failed, 8 passed,
 5 warnings (v6.2-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 8 builds: 0 failed, 8 passed, 5 warnings (v6.2-rc1)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
6.2-rc1/

Tree: linusw
Branch: fixes
Git Describe: v6.2-rc1
Git Commit: 1b929c02afd37871d5afb9d498426f83432e71c2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 8 unique architectures

Warnings Detected:

arc:

arm64:

arm:

i386:

mips:
    32r2el_defconfig (gcc-10): 1 warning

riscv:

sparc:
    sparc64_defconfig (gcc-10): 4 warnings

x86_64:


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
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
