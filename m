Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6994081909
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 14:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfHEMRh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 08:17:37 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45682 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbfHEMRg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 08:17:36 -0400
Received: by mail-wr1-f66.google.com with SMTP id f9so5273260wre.12
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=B0Kc1uRSHW9MdcQEFfoXHw8sZV2PfPYxLgdji3s62Fk=;
        b=V6fqTGepi1gtXlNwHEdPNyFZrCptfkEvwm1wnGo1v75zQZ3FLG6zxM0rXynuOdIyDB
         cj+fSOX1K9u4pnND4lnX4zuWkBYJpNLWBhfN5GrfzxiNRqREvT9FHy+TrFUDgnB8B1KB
         csDP6HMGczv0Xgr3WX02cz5NdDZzTKLNs2HtBZJGg+4SwY9oQICKqvYGlD+iYG4/gq8K
         wMBqKfQpRPAGm/MJb8E48cBNVVnKF7MkM1d2nSN4wM938bQIHtzSAdqPwH2Bnj7xP2XP
         p2sXTow9kulupdpDrS1u7QxwwjMf3bhI0hceoiTJlAk8OxWg32yw3eRoQALNikdII3aD
         tCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=B0Kc1uRSHW9MdcQEFfoXHw8sZV2PfPYxLgdji3s62Fk=;
        b=OVPIfko+EllyQJwKLU48XDhJQ+uLVtbf2vbzzkhxfcNnL1IUW/BU1/X7V6ZdCkyIs4
         xyZ5WqekpFKxPjRI83OGMzVWY7QXhZ7+mIrvHrkeyQ8UcaM0swIZLAMHmSdHwB7Grq78
         APOsW4JSb1sdB9g2JQ4+EFD2vsVdrWI6PoakStM+YrHZCPITiBz/+xgx1LDc457Kk4Q6
         eKHFRSWMViLruhrfj7jYNOC9mOg9tCwh7a440JEI+OdU9YXdMmmzxBxRK6LnWgk0R8EM
         MqAXuSYWEffnxhZ7xAgdwH1J9hmbvUBK1mnJ2B/UE1BUCesC4odKg+lImDvt107fFg2h
         8XjQ==
X-Gm-Message-State: APjAAAW4d3WiJMiPEGrWfx8IdQMdk6/RcKDihWzyZC4Jjo+HlHMlzQT7
        kPegIXT/wldQWgbcxwtTfxzozfwP6dU=
X-Google-Smtp-Source: APXvYqzOZlCvp29itPYE2Z2zEG9avlbC1jQ4Sk4QjCquDlNZYlcqx537tp+LJ/MtY2BekVuR+XwR2Q==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr125259207wrn.197.1565007453677;
        Mon, 05 Aug 2019 05:17:33 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b8sm113855256wmh.46.2019.08.05.05.17.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 05:17:33 -0700 (PDT)
Message-ID: <5d481e5d.1c69fb81.843ee.899f@mx.google.com>
Date:   Mon, 05 Aug 2019 05:17:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-17-g15bddb7d787a
X-Kernelci-Branch: devel
X-Kernelci-Report-Type: build
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.3-rc1-17-g15bddb7d787a)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.3-rc1-17-=
g15bddb7d787a)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-17-g15bddb7d787a/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-17-g15bddb7d787a
Git Commit: 15bddb7d787aebc837912cecf107b7eaccf03913
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
