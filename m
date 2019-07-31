Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E29C7B727
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 02:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfGaAXY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 20:23:24 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54523 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfGaAXX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 20:23:23 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so58854055wme.4
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 17:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nNxINWjm/xY1gy698Hmtqn7A3g5RA98O9tcLN/nWZi4=;
        b=gkCDWkFNwkpyqk9uVp/UuCudp1FAF1VxRXb5ESkU6Yf9ADMrqGlJq0WDYSIh4+mK7c
         ROhyKKOeP0ucF1Yd8dCJcP+Qewl3ywTRPoKzhVrX29pypVPPdxlNRYvoNjnEzr2z64dZ
         6ToqcUQ1rWsJqTiTrYPISfRLtKIXTdQCsec8Lqlo2AZkb+gna/g8tcbleANG2xfdyeH9
         b8Tx8hPYhFnMj/Y/HGM8Te/LTvsabSceOWj+EcAwolJ+po5fsLqgTVyNvVk7ugsKOaaD
         ZO7V0UlrRRgqvSemAkci4oWhXbK+H5dVq0k0QzXMVPbhsaGriRz1ygs94guwQMvaiOTL
         Ol8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nNxINWjm/xY1gy698Hmtqn7A3g5RA98O9tcLN/nWZi4=;
        b=ByTQ/2bTjr1ORPzWfEWefcUKnlNbjxfFBrj3f4E1/3HGTYBbgYC4DtqkUbX6oEboQs
         gh/GpOlLLpnaQM5zjiSU/IPDgpp5lDCD6u1P27i0MisEhAh2duXcyyvT4aE2pqxapac9
         prVrz/QW1Uk0N3X//d4Dl7EpJOLulut6hG+iCp8tVlWewl5sENn6wVWaQIdECYvKbDsb
         VYeolQNGk4oefTrdKpdpQ0l1YIhI2VzlXzXJPfjwNjiXRufJHH1ZsY1/yXV+/knTMDlb
         DzHO0D4Lj7FaOydrk7Szzh2m/VkVPWjhgQip0h2xIrU9FjwhEcCRgMdz54rmGXstu+FT
         u4mA==
X-Gm-Message-State: APjAAAVUpGdQ61A7CoH7WJIcPjh2kZvKcjK/AhdHYyYLz/zeFfVUC+Hz
        y2nxgtbNcnIFQLkMK3eBd7I2XQ1FWvY=
X-Google-Smtp-Source: APXvYqxhqD3uTCydLTPfEPvS43LVvCQTqzCByUU70q1ebhWSmWGR4+R95nZnIHQadHB9wXGOxrV/4Q==
X-Received: by 2002:a05:600c:2297:: with SMTP id 23mr53978754wmf.47.1564532600607;
        Tue, 30 Jul 2019 17:23:20 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t24sm62151247wmj.14.2019.07.30.17.23.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 17:23:19 -0700 (PDT)
Message-ID: <5d40df77.1c69fb81.11a25.aaf8@mx.google.com>
Date:   Tue, 30 Jul 2019 17:23:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-13-gfb9152b494a9
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.3-rc1-13-gfb9152b494a9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.3-rc1-=
13-gfb9152b494a9)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc1-13-gfb9152b494a9/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc1-13-gfb9152b494a9
Git Commit: fb9152b494a9bf9beec11a64b1f796d4e8755d07
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
