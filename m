Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE84179E88
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 04:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731175AbfG3CQY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 22:16:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51786 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729020AbfG3CQY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 22:16:24 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so55557532wma.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 19:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YcpX1iAuUd0pNUtAgZdcMrTJ1oUgoLuJvAlFq2eZh0I=;
        b=neNTFq+Vx9l4h8NPyvwars/A76FJqeD8Sf3K/yYHK8SjiE6vWQty79tyv8Vjf2Asq/
         6Bx4nwl8bHzmOj43G/k2SPRprwrc3sckRmzDelfw27A3b0It9kRzHmn1M8IxloiTPxDZ
         t3LIDsAPtP5sy7bN/B7zPFD+gDl3BuKc6qZuNTADnxE0txC1ONegsBFv8ccqKf9gFJDN
         cVjRHw1xA88nYMJEReqs8GcF6HQwvhs5MZge4Z8gzBuwaL8bD38RMQJC8PD/wGhYmgM3
         hQHjDpEFF/gL9D5Eqn1gAfk+RDppsLqePK4qskU3HB5waVGKdj/bOvRpqrEqj9gZhooM
         aXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YcpX1iAuUd0pNUtAgZdcMrTJ1oUgoLuJvAlFq2eZh0I=;
        b=Kcz8XCAQNTZD1gZNR5uJIj2nTMz/P79PpRl9fCxIlj8eXsbXpPOVSll0TsM1D8MQN8
         596aqaw7PxbYkcl+w2vp2I4m8xr3gqA9Q9wIGDYCeUmTiiJpmtB6JZNj/zNpxeNdk6ER
         J13A/scJs80K26VV6M//Izp860vH92qq1wXfWJYarX4eCAMNVaH0idbEbYvzMI8BCjSi
         MycvzCyKupazVW4XFwIZUwYIIaJFqkweIuv3D4FLcm3A8eA7ADJF5TIkAzGZasH5XE6C
         Lw0eDdeBcCnZ38VaP6jlqXFDTc63aLvlK08qYhubmkJ8ShdQgQPgYObdGsch9a5j/qm0
         7FPg==
X-Gm-Message-State: APjAAAU4WG2yeMqlwpld+WIVf9jM8VQK6CJYpejp30bnxsC3hqIdnFFm
        kHaEepcYSsVzC5Dhh5mhcJNt/Ukf86Q=
X-Google-Smtp-Source: APXvYqyfiQ7p+W5Ti91BFuHJXurIq3yVZixzkMr4LTdihMT+V76OCqe+S/mYT/JZBoTWwd8RS2m6Tw==
X-Received: by 2002:a7b:c857:: with SMTP id c23mr107569658wml.51.1564452981326;
        Mon, 29 Jul 2019 19:16:21 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q1sm48431963wmq.25.2019.07.29.19.16.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 19:16:20 -0700 (PDT)
Message-ID: <5d3fa874.1c69fb81.ec48.8c95@mx.google.com>
Date:   Mon, 29 Jul 2019 19:16:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-4-gd95da993383c
X-Kernelci-Branch: fixes
X-Kernelci-Report-Type: build
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.3-rc1-4-gd95da993383c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.3-rc1-4-g=
d95da993383c)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.3-rc1-4-gd95da993383c/

Tree: linusw
Branch: fixes
Git Describe: v5.3-rc1-4-gd95da993383c
Git Commit: d95da993383c78f7efd25957ba3af23af4b1c613
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
