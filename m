Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52FBE9B86F
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2019 00:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390340AbfHWWMF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 18:12:05 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:45521 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390281AbfHWWMF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 18:12:05 -0400
Received: by mail-wr1-f44.google.com with SMTP id q12so9864335wrj.12
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 15:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GoGrqX6b18Ffd/Khxni4k2DZahYj1JID4CfMoAC7lr0=;
        b=hzAXMaAPNTCNJj6XQUj7FMGdukbXsG1rAgDhxqUHsHvkusFMTYuHotPJywIRySWTIE
         AVigSxfRwGUNQHdTQh0rrnzYnETMqakKdKap5Cq17xt7ir3IWM15UDtPM0rk2rcdm+9K
         a5SyPXvB1rdlA3X8oqINvXvjykWEH3cnvXfJ33FS+HCME4AyWBO44b9HmFSAUZ0VPMaB
         sWpLFdkpRQVib3DX9mHRChNOQzVbTD792smj5mn+CvtyGAM42xiEbUX8x36GpTm3hbmo
         GBYuKMSxLI4oD/UfZQmvNH8KAmBNyZJuaoslD+PgSFufY0DvmwpDOJXNEMvqqqti33SF
         QTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GoGrqX6b18Ffd/Khxni4k2DZahYj1JID4CfMoAC7lr0=;
        b=WtgI4LMdrniOgs4KSZBA7YOT5lMS9s0LEwAkMMgWec4JJN4nOaj5Kx7OsONkqh9xME
         ogfqMFltCMkFFMFaDCP3xTru492JrF5aj7c1sxwa0hhbCFENgPciigp98Bi1jL1rWl4q
         Wi4wx8VrTN9VI9tbo5U9arcVdBMg9qSK4hz3Hm3nirNLVH7lqR5VCt+AWaiflJfYyXKW
         D+GnHYJYUw69I3mUBDagxdxXzQYiEqHhiEr1KQ0aevIN1sX/dHKQrpt2PTgCbQkwln/R
         hkhD71uYIcZDeVV42KSwazIfUSCHHxQTBrc6FCu2TMDD+K3YxquXxd0XYPcmfOMYn0jn
         Hxng==
X-Gm-Message-State: APjAAAWPWU7uBvqMgaSa/IcGxBwO5rq+B7oUfnf+YZ+rcBlhqyHfxaLX
        6c99Gzq+hZTsfW5bzKvdiVBXRdJff2rZ9g==
X-Google-Smtp-Source: APXvYqzcUq+mD+LY4lQAaFmlgTXYvaaEfHiWAG3M4zAaWqCDK2HqXWeDWp2eylu1K3g+tQbcQ9piUA==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr7226859wrn.223.1566598322224;
        Fri, 23 Aug 2019 15:12:02 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c11sm2948004wrs.86.2019.08.23.15.12.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2019 15:12:01 -0700 (PDT)
Message-ID: <5d6064b1.1c69fb81.a604.cb36@mx.google.com>
Date:   Fri, 23 Aug 2019 15:12:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-46-gf4e9bcc05f4e
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.3-rc1-46-gf4e9bcc05f4e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.3-rc1-46-=
gf4e9bcc05f4e)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-46-gf4e9bcc05f4e/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-46-gf4e9bcc05f4e
Git Commit: f4e9bcc05f4e8d543afbfc0ca1fd4435a2204776
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
