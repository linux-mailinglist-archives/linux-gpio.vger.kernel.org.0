Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3A9E60B637
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 20:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbiJXSvA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 14:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232754AbiJXSum (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 14:50:42 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710404D802
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 10:31:35 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id p127so11548486oih.9
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 10:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XD7hg79XBu/u0C+oLffROZ02U3ZM/MRZVSv6uPMOgCw=;
        b=V5tG/SiNlYTEL53mXI5M8hbfiCH5L5x3oiAB4j9d+qpDjNmL5ShEsseRUkXsA+XHZB
         R6xry0Z/ulvyb/hIXJ/LNgeOjYuCGwYrU80muPIPIxrLgYsP7Q/JrXKzY82IkNAIKslx
         AHLxGjFrn8dl9PJu0DTquaJQne2fhe+d4zRP/o5JHwXtSq1G8tJrN6LqdpTTttCNrHxL
         NFNGBifgFegPKIcd07wCo5bjPCCARlxGTJmvICRSTX7E+te1zKNX+mUclR6jIdBJwB8F
         7IgxUB7d98AdrhxJtdE3dwAkqY02KdjjBpYeGJojZDTQQ3YEFQ0IDJosi4jyUQolcQnB
         6bsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XD7hg79XBu/u0C+oLffROZ02U3ZM/MRZVSv6uPMOgCw=;
        b=T6hzeQzlHacyRUdtf1iXn05fHlRde7cmoCuh0VfYfwDyOGDnHCD+XPODGRIJhDsL9a
         F28Jd/8mvPWkQBdbk0S3wi19LC0AUL+sWC5SJ1UDSpLu9Cl2Cb0nGtfHIVE6n02qUF7e
         tB2qqq0DatvYwJvr72msY1LEWOJFctcGEmMIRxcNrm7UF5aDmg5SnjgDCZp2geO7fuSm
         JY9US7KRN5AVmXaNwqCEwHMFFk9Tlm2zy7qNx0nX/T9/eFk0QDSxTA0cIBAFGTJlGdqu
         ouG5ihl0IP8pA/CDD3Gmmo6T1m2uS+5LBJQ+eiC8LCGPibAJJnLyb7w3E0McZ9ImNsNK
         SLqg==
X-Gm-Message-State: ACrzQf2DjoZLT1Kjhyat9jCSmTotrrP9kmFRdobLuVrLFmiLg2AV9MOD
        JxEI75C797fM2gyTX/bfTlmilv+yD3Vc25b9
X-Google-Smtp-Source: AMsMyM50p5mEX/7Y3rN7x4CGLjAWleWk7iHGkD2zcZqPv1wKxEJN5rEm4H1Vw35yZA4FRxP1m9XnqQ==
X-Received: by 2002:a17:90a:f198:b0:212:c3cf:b8f4 with SMTP id bv24-20020a17090af19800b00212c3cfb8f4mr24399662pjb.49.1666630443040;
        Mon, 24 Oct 2022 09:54:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id oa7-20020a17090b1bc700b001df264610c4sm1813778pjb.0.2022.10.24.09.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 09:54:02 -0700 (PDT)
Message-ID: <6356c32a.170a0220.1b241.1d86@mx.google.com>
Date:   Mon, 24 Oct 2022 09:54:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.1-rc1
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes build: 8 builds: 1 failed, 7 passed, 1 error,
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

linusw/fixes build: 8 builds: 1 failed, 7 passed, 1 error, 5 warnings (v6.1=
-rc1)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
6.1-rc1/

Tree: linusw
Branch: fixes
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
