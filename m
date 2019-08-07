Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88CB285069
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 17:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388844AbfHGP51 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 11:57:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39262 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388845AbfHGP51 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 11:57:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id t16so1786433wra.6
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=q4/qVbZZGeABlJmk6NbQK4WWOTUUyPrNwO/VjsjrihI=;
        b=uofljsNokoAF++re4bNCr32Rlihpjdg3iWxJzclrGf/UxlhqrjXTYrzyAe+pZ0dwBM
         1/fTfe+YCivDHqUkyfaShqYe2OPjEGnUbi2prqRsf/T9ZY6MWyb1hPZXq4B63ChaEwfF
         wL3jYAZK0i+8qG5b8w9aHIA1O/qC0tdpe0kDFZ/ciUrrxsh7qq6rX5E5LoTUyz4DGpJr
         vRb/6XBKouDJdUsDeVEo4jB0xPxcTRbzfSShBoqU8Bbh35HShqyFwZO5UCjzOamQerEO
         D6m4ixFVJPV06ger/p/4tQMajAXtgY8no5ttD58NqfjxZZ5Fjsp37f1nySKSjkp4gndS
         34jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=q4/qVbZZGeABlJmk6NbQK4WWOTUUyPrNwO/VjsjrihI=;
        b=Q/xyVL3RoWmYpdrKT2Ekn3mAyzuasZmboHN9gX38D2vxPTlyxPafRHEliwilsOs+VB
         amnTE+nrhahV9ij29Xm3facl+LaMvwVZ6JQG4bavb1fbmHCWk97oMONMJzCzt6PZOPcd
         UZ5NYKWCVnQrkxTmX86eB2ff+VZJvW5k68Zs4mID1M7BC1jtX6CqTpxIC+CA+4E1fIva
         Psm0nHFpVcDJy2Ryb48mkBp2T3F98dCzRew2l8Y/HwN73T2iNksi/M5A6J3fNbccRFwe
         y6Rqbz/77F5fkTDLVw6XL+vik5Y22EAKGzRKwS0wU/EThdW27is7VObVAHOqrhMHf9He
         aqCQ==
X-Gm-Message-State: APjAAAVr1g7MSJErefuCZfbLKeaYRDyiQsnKoypUglQpBDvxH80VdLQt
        DNTxFxomrmYK8aSAVaEwu+Dg6BhWBSV8nw==
X-Google-Smtp-Source: APXvYqwhI646CRI4UIRNTxDfbj5za/aRnLQoMmyEQwZSuUu2OauHudWy5FpwEdXcdWro2JO103THfA==
X-Received: by 2002:adf:8bd1:: with SMTP id w17mr12462053wra.50.1565193445214;
        Wed, 07 Aug 2019 08:57:25 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i66sm704075wmi.11.2019.08.07.08.57.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 08:57:24 -0700 (PDT)
Message-ID: <5d4af4e4.1c69fb81.c9442.3e16@mx.google.com>
Date:   Wed, 07 Aug 2019 08:57:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-18-g40b0bcd3e0e2
X-Kernelci-Branch: devel
X-Kernelci-Report-Type: build
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.3-rc1-18-g40b0bcd3e0e2)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.3-rc1-18-=
g40b0bcd3e0e2)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-18-g40b0bcd3e0e2/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-18-g40b0bcd3e0e2
Git Commit: 40b0bcd3e0e258cff3382717fb287f8be161a398
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
