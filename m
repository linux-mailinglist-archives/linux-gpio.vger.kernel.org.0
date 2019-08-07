Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E934584FF3
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 17:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388624AbfHGPdV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 11:33:21 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:42558 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387543AbfHGPdV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 11:33:21 -0400
Received: by mail-wr1-f44.google.com with SMTP id x1so41927792wrr.9
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=A2l0yh6wiuv0JQpNGSaHOym8xOinN2wc8RwxOwAR+N4=;
        b=jtYp3uS0EuaNRYw6Fn8TqiJ4HuAZgGxyBz93UIHNKMTUl5/zCJMMpMO52mIMQK4Taz
         1TMeOCvkrhK+DaFJ6grHp0ScRXdPzdeoYKofbrG/iXfO9gp0JaR/5ZGLPxpaXMxFlvQ6
         /FjEkS/WHL0JdDl3KpKGS7KRyvb3nyZOJVZZ3jSH/RaCfrtjovPedT5RrjPOrK8vEtA1
         Anz/n7Y51arserAlWpb7o8+2bXs/jFrf3q/9xvXOB5gRpI5tXRn/9WA6Jcu/BV9QPeVM
         ylBdGwGYDfdoWCAprNTVtyPSKOYXXIj+FRRb8Kjmrg7KsTbMOiiGNlGfVHM0GFAZTKXo
         xqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=A2l0yh6wiuv0JQpNGSaHOym8xOinN2wc8RwxOwAR+N4=;
        b=UYUbH6+7Q3o1NSLD+u7OPYmDYbY37CgFQmg2r6r0yHt/sgbryAkSlRKJswv8WS9PCb
         vfnY16a9hFxbCQw7fgDlLN+BWlyQeVFe2l3GGVoYXFTTw+8KV2UW/79aRiqgskirc1rX
         3Ot1IBCH88LXO7DY4TLuMocWmghi9C+cHklJQYos9bFoSvErLlTUwjXvp9jVHfk8jRwm
         8fggoUZevZLN1CgL5qZG3wTDXtXiAZ7dGH1LtRxXTFRN5XErbBWri3fJM7WVdz2F81Rm
         LF/KASo/2mXaOSP6AIsvn2qLkVuLC0VluK13Hf+cjO8Bu9kiIB6NbeBmUI2OUdk/66S6
         nYew==
X-Gm-Message-State: APjAAAXpTFDrdGKAhfsT84fXWUUOnSdcn2hODU+eM4ch9w6Ky1wAfbja
        gmIys72bnvERQb2+rMAiywgAC3budZrs8g==
X-Google-Smtp-Source: APXvYqz9fALCqfzi9ATCOsshPGGwDaTJKaZOg7yLRtYPTB4QgfeE1GUUyZSqlWAcwRL8dbOoyIdc1g==
X-Received: by 2002:a5d:4ecc:: with SMTP id s12mr11976174wrv.157.1565191997966;
        Wed, 07 Aug 2019 08:33:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 25sm185849wmi.40.2019.08.07.08.33.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 08:33:17 -0700 (PDT)
Message-ID: <5d4aef3d.1c69fb81.c325b.0f1b@mx.google.com>
Date:   Wed, 07 Aug 2019 08:33:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.3-3-1-g29c778ca612b
X-Kernelci-Branch: fixes
X-Kernelci-Report-Type: build
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 13 warnings (gpio-v5.3-3-1-g29c778ca612b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 13 warnings (gpio-v5.3-3-=
1-g29c778ca612b)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/g=
pio-v5.3-3-1-g29c778ca612b/

Tree: linusw
Branch: fixes
Git Describe: gpio-v5.3-3-1-g29c778ca612b
Git Commit: 29c778ca612b3462529fdf3f094843dbf4778c27
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
