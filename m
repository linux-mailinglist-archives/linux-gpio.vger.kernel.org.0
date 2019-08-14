Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0D28D0AE
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 12:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfHNKYu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 06:24:50 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39528 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfHNKYu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 06:24:50 -0400
Received: by mail-wr1-f66.google.com with SMTP id t16so20453428wra.6
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vXJxY5UH8tLvfb43FfCBW+Z+Cpl/0UGF3BDOSEIgVIk=;
        b=m2rlIIW/wpMCOrIc8r8CLMogHIaviyQKhHyznGVU8jjsH18NCLrzg+KstaKPt2gQXc
         iV8V/NpIh9Wy42jbdWXJtrY6rQKnQOPjPEbOAh1zA/GTumod0Cq/oqs9664KqSYKC11j
         1ZI2qRozZwLEuPdhWV0rVUhCgTz+mkE86BuQty1Tjn2ggJwaBYwXOuLDdPlz1CXUpJhm
         0Sm4HMAdwfacSx1JuOi0aR0jj9RaVUz0m7q+xND6UAG112dvBLdDbMw0zB6Q2rPROutY
         urFXKYj5NYy63QvDCyWMFEIIwUMU6pKp5J6XJvobuiCNkWr9cZZaTbxyiXkoXYLqe0aI
         bRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vXJxY5UH8tLvfb43FfCBW+Z+Cpl/0UGF3BDOSEIgVIk=;
        b=SSn55aKIIbaTk2HEfAboupUXNLuEvkMnWKGEu5f41TOWLUqjnpMz52pGeXkenC94Nu
         r8+lYJzGU2wKXRD8zhw388It9uF5/9XE82ddeppBzkLfr8TNFbuqei6PZEmS2xwQre5x
         sNjMXGhU30emajXuezpJHR1SWcYHflw2wDOmyIdY3sAUUUHp8mVDyST1+guUPAQrkMGO
         5yMFxXxCMh7x1Yd7Oo4YxPH+Sf80fpx8BS/Sd7j2WH9/v+VZEfpe4eRylF12cKnhaDjX
         Xa13dRyriW42vwPv9DJG3pikF+vNcfrh3xqja+STToK/rCAgYoLeF7ADSYFJaEM0ZI9s
         JAng==
X-Gm-Message-State: APjAAAXBSqIyAB082/K4ftjXfftxtKlxU/r6VZxjgWpKFLSgJxqDV35R
        4pEEUQr3Gwwc4IZKEslhqto+wHLQCvrIug==
X-Google-Smtp-Source: APXvYqwr5rHh4aWtWal5Km9kc3sTweRAOeGwpVEoSn0idOy3YsG64Fbta9C2+D81PRlm7v8uRXm89w==
X-Received: by 2002:a5d:6408:: with SMTP id z8mr50950312wru.246.1565778286957;
        Wed, 14 Aug 2019 03:24:46 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e9sm2375167wrt.69.2019.08.14.03.24.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 03:24:46 -0700 (PDT)
Message-ID: <5d53e16e.1c69fb81.74cda.c248@mx.google.com>
Date:   Wed, 14 Aug 2019 03:24:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-25-g470219c619e9
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.3-rc1-25-g470219c619e9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.3-rc1-25-=
g470219c619e9)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-25-g470219c619e9/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-25-g470219c619e9
Git Commit: 470219c619e9f76e41497b9a90f2ec61dbedf3f2
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
