Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F03F37D92E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 12:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbfHAKTn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 06:19:43 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:37553 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729011AbfHAKTm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 06:19:42 -0400
Received: by mail-wr1-f46.google.com with SMTP id n9so47883815wrr.4
        for <linux-gpio@vger.kernel.org>; Thu, 01 Aug 2019 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gHSebKnSzDoz9slPFACl3tU8MPOYh8XcEa+dJL/rXY0=;
        b=SJEoGSlGDDa5M0Zd8TYvvJMZZ/TPssGXoJMx3pR1Sk6bVe2litjN6glwyEHU7uwFgQ
         f5pHEhQxHEWRLT4psNwwPj1fIdi8v1I+mZmiHCavJkXe7IWe1vFFcUeqwdwALFrUhnEt
         vE9qqFpaFNv2HYEERL8kZXHw6ekkcSCTgD5PV3P2yOZ7WWHiaLqsQuPv/vHpNtc6WE7r
         rmBOmEFkrZyspCRnSw8efi1tAa+Ovk+4+WYdZ/cYmpgE6IxQo/ulaCyKEWvHX2QETFZj
         ImT4+nO/lPPYsO4W3XW3sd7/cUpkE+Ov+8Bkf87r7ksZ6dNBr6osHl1MHsyu/jefLQu7
         M9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gHSebKnSzDoz9slPFACl3tU8MPOYh8XcEa+dJL/rXY0=;
        b=i4CUuw16dvESGmB95X/OHOEOZGLp70LpeRvaKTHCiXct+9biJre50PiWrxj4vI1PBV
         HCyTzSvItkP8S7zh+9MLC8WtNi4o25co+banYagJBpk2zLoH3Kw7+HDNI6wwNE+6WqH0
         L4Zs4A4886oW4p+Y2DgVCBWjo2WbGMu00boHVumsF+u4NFSUho1p629SYT0CuoYjtKpY
         /H/uuy9ou2KkCw93YhN6ozzUVsWSlyAyQiSkSaYCeH4Iy0clxToIXUBreLzW3slt1qwF
         3zjtyuPE3rHQxcOtqLxYfDNtBrQCWZBWKCf/AZkGr2EpBeudOq0bGE8ydO8JA+LOh92e
         tbhA==
X-Gm-Message-State: APjAAAVg698edzGDLuc/hR2jm7VISvi5QZ93fASnQA78uvOlRWBuUym2
        /hPLlTTjimqWHD/eALWzya0bzhAS3kA=
X-Google-Smtp-Source: APXvYqy6CHfVrFHjMaTN685Fu+KrKm3JskvK3tgakczOT8pPKkCcrEDCeWwlTZC6o+fShBz4o+nAvA==
X-Received: by 2002:adf:fc52:: with SMTP id e18mr18229486wrs.14.1564654779795;
        Thu, 01 Aug 2019 03:19:39 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f17sm67263389wmf.27.2019.08.01.03.19.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 03:19:39 -0700 (PDT)
Message-ID: <5d42bcbb.1c69fb81.90047.0665@mx.google.com>
Date:   Thu, 01 Aug 2019 03:19:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.3-3-10-g27b7f71a7b92
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 13 warnings (gpio-v5.3-3-10-g27b7f71a7b92)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 13 warnings (gpio-v5.3=
-3-10-g27b7f71a7b92)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.3-3-10-g27b7f71a7b92/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.3-3-10-g27b7f71a7b92
Git Commit: 27b7f71a7b92900eee979c2ba3675e0095e71e00
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
