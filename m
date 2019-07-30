Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73FA479EC3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 04:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731312AbfG3CeY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 22:34:24 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35318 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731050AbfG3CeY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 22:34:24 -0400
Received: by mail-wm1-f67.google.com with SMTP id l2so55157906wmg.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 19:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=G+oW/YeGE03YA7VgOeGy2xWpEsI28/0+6tdEB031Ncw=;
        b=rYTjJXt/JZAc0yzxJRQlpGZQ5s2XccYjgUNmViJWkmlJhM4L8yWhj4W49nqkYUczHg
         IEW1ew809JREVlOeJmqcsgde8diq5MYZAoiQR+NC4hA+frJm85G8nGu+XPqyGGxnkltE
         P4Dqp+1A3DFqKtXMQ9v3LYnxgimhOHwaahsmzacbknGzmOxCZdxo5gHlLmS1/4OfPWDx
         mjnoElQee7QT/NITuzXykeTnK2KHv/ah2tguKm7MKWqLqXCntbuK5vptccycUwLuRxWO
         pS5xKM6ys4owtnuaeNrcEYCCL8f+vdDG94vKwypANgA6vBBtCkhL1V+8KA1WWr6xnd9x
         D/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=G+oW/YeGE03YA7VgOeGy2xWpEsI28/0+6tdEB031Ncw=;
        b=T6PqG9JPryUVwKfsewdSa7OH1hOX0JKT+2MLIlNQOaGCzKjmAxVgfOFSpAY0QgAAb1
         Rg3Hv+d8MNEzoePfJpFcnjNasCuqXTGfZlFSa69xN4s6vM25DH/fRZ6d7K0eZvpFR++R
         QEjGRpGqxhoFcktctNNuV8J+FY+bZncyu3PhI3ubt3M+3ROSsmrjDRNgXm2dgTMj7iRQ
         CMH9o3FJ7DlZ1la2oPczJCnRkkFJ0cHX5e/3v4IYEUMX6Bce7/BTzVZbckPwo5U4p73+
         MyWX01N/grOZ4Qey7Ox+bPgMBGnHP3v7Zkb1HO+Bbkd4pWCxwQP1NPaN4lCxjfLOn+Ff
         aNoA==
X-Gm-Message-State: APjAAAVL3A36pYK0hSf/W0ZT6ctGQYkOCbvel9eY175f3JbuMOMmA81b
        PZFjd4RkCfAJUzcg7G1+yInmcLaBvj8=
X-Google-Smtp-Source: APXvYqx4mEf1lRX03sUJXZWqPCETwVKJCaTDBffKcf3ZlRsFZ69A3ei5X/PzAhvUcHWEvjVFlxaq3g==
X-Received: by 2002:a1c:1a4c:: with SMTP id a73mr41349261wma.109.1564454061380;
        Mon, 29 Jul 2019 19:34:21 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w7sm72447250wrn.11.2019.07.29.19.34.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 19:34:20 -0700 (PDT)
Message-ID: <5d3facac.1c69fb81.b72f8.5b7d@mx.google.com>
Date:   Mon, 29 Jul 2019 19:34:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-10-gd2a561ae1961
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.3-rc1-10-gd2a561ae1961)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.3-rc1-=
10-gd2a561ae1961)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc1-10-gd2a561ae1961/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc1-10-gd2a561ae1961
Git Commit: d2a561ae19613c14bfbc437bc9dbdb2c9d1d1b95
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
