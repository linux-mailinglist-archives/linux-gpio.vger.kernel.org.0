Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2762AA7053
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2019 18:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbfICQiP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Sep 2019 12:38:15 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:39650 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730927AbfICQiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2019 12:38:15 -0400
Received: by mail-wm1-f54.google.com with SMTP id n2so203443wmk.4
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2019 09:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Kl/j3HQkbEFr64JcM/Fm+lJNWBN+7AIzMGKPDZp6Fgs=;
        b=JjHS4t6kwgmYKwCwY7jOtmde02vh6zeLbHsqm7+IjhP4FW0jV0HHSQwRUidXFonqw+
         H75Dym8uz4S5Ldy3t7F5FTsjDExm97ggQSpiQB433x4nxupcsbs3f+rUpIPbi0VHxCs+
         tbc11Ri9qTYennTMTGWrBBFbmLaFwfuxqZ1fMRYEx1pKYFAqWJlgit3axf6I7pTIrNKa
         s0ig+ScdyD6lu8MRbUMta9HZbw+2pGMKlX6cwjxZLWVAOMWygG9JVmKFjNJZ6cQVvT02
         MzDrp/6L6S/sWCDfX+weNfkWDkBZMG+8rJAUEPPi8LZjfFLfow1mvq+DTgskTZ9SDKKl
         xIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Kl/j3HQkbEFr64JcM/Fm+lJNWBN+7AIzMGKPDZp6Fgs=;
        b=dzgX21V7f0zeXaZ4pwQdyodldV7gxqvZb3Cn6M/IAoidfV6Gdt0kUdTiqNyJFxPW5W
         wv+mbI2CyKaMpX4gmMSnd3xt4uZf7+2Hss26LUzsuF0b40AjHZ6tYen7kRb2XwZgfaDa
         uTx6nn+iPkGgYNbcFym6IqBzqv2B4Y+/5JJaGgav/QGpXvTVfpvKrl75mEgENEnmqiv6
         dR0EcyQxlLlASloiWPRBbsvPvI99VnqpJRbCLXn/d0Xel3cyZJVpiKxTUgdcqf4cyKKe
         zOl9hcGpJpHWK5UUPX1HNQ+RLdqTh/5d8y6Ls6x4MatOMyR3EzoJB8/99WH9FiheolV3
         dGBw==
X-Gm-Message-State: APjAAAUdrfV9DIpAPQ4KpTNbo8SAxQ+RDKVRMuJnq+J7hVSalXietBAo
        8fsY26+qOGLQ52Dbj6dYSmpaeherKUuwmA==
X-Google-Smtp-Source: APXvYqyDox7Sf7kTSvjpjFvSm83rpJn9R5q76kYMFNyYO7MprrxfATrC0lFd8sZbLKx+u7QPN/QAcw==
X-Received: by 2002:a1c:7513:: with SMTP id o19mr234004wmc.126.1567528692393;
        Tue, 03 Sep 2019 09:38:12 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t14sm19070028wrs.58.2019.09.03.09.38.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 09:38:11 -0700 (PDT)
Message-ID: <5d6e96f3.1c69fb81.390b4.3e2a@mx.google.com>
Date:   Tue, 03 Sep 2019 09:38:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-58-g8a6abcd04e4c
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.3-rc1-58-g8a6abcd04e4c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.3-rc1-58-=
g8a6abcd04e4c)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-58-g8a6abcd04e4c/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-58-g8a6abcd04e4c
Git Commit: 8a6abcd04e4cdf6088f11212570c3e5ec36ee5c3
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:
    nsim_hs_defconfig (gcc-8): 2 warnings

arm64:

arm:
    multi_v7_defconfig (gcc-8): 6 warnings

mips:
    32r2el_defconfig (gcc-8): 3 warnings

riscv:
    defconfig (gcc-8): 2 warnings

x86_64:


Warnings summary:

    7    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:129.4-18: Warning =
(reg_format): /mdio-bus-mux/mdio@200:reg: property has invalid length (4 by=
tes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    1    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warn=
ing (avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #=
size-cells value
    1    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warn=
ing (avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #=
address-cells value
    1    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (spi_bus_=
reg): Failed prerequisite 'reg_format'
    1    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (pci_devi=
ce_bus_num): Failed prerequisite 'reg_format'
    1    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (i2c_bus_=
reg): Failed prerequisite 'reg_format'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:129.4-18: Warning (reg_=
format): /mdio-bus-mux/mdio@200:reg: property has invalid length (4 bytes) =
(#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (pci_device_bu=
s_num): Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (i2c_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dtb: Warning (spi_bus_reg):=
 Failed prerequisite 'reg_format'
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #addre=
ss-cells value
    arch/arm/boot/dts/bcm47094-linksys-panamera.dts:128.22-132.5: Warning (=
avoid_default_addr_size): /mdio-bus-mux/mdio@200: Relying on default #size-=
cells value

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
