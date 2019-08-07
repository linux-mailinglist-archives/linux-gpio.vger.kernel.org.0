Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE42F8519C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 19:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388488AbfHGRE3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 13:04:29 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:33773 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388480AbfHGRE2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 13:04:28 -0400
Received: by mail-wr1-f50.google.com with SMTP id n9so92225577wru.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kVdi7qekfiNRm76e7Uq46bmQwLLG7/lXPqxepN+apBE=;
        b=pEu9sGPRAJ205I8ls0EgaqbIbe7wVoHmzQMhuBmbQ7AIVPxBFzyjbRYZKyFvoGR6cu
         NT9x8j0IyK73WwKn2ZmlSBbrddBCUlQkwoIJmbMO1G4ymD/rypO3L9ow4Ho0YbqypLzA
         6rpD48OgKqALoFErO0Kjo7nGiVw3GSHuL/L0SOD2Tu9MA3nw8ICoFK82/eWQfOEQqwNo
         6MC+Xkt+I6GwW3iCNZu1zNxXkFN26sHPvqI+Q2rRK1cIAEL8eFqOJcoDFkdqjOM21nzs
         Mu2mMwO0F5fafEQumUpbASuKcM5G4gR4ODpVI2EFwUpKdUt56Bt2bkQKh5cRwEqHFjjO
         fQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kVdi7qekfiNRm76e7Uq46bmQwLLG7/lXPqxepN+apBE=;
        b=AqU7ysqkhZf8ABpY2LA0AkRG00JInH4zivuYrJvt1g9UEaIGZa9d+Oh4uR5VUuDQl0
         0AlwpWHt/9GiGys63UTzTDP8zlg+aFL09IppUeRLwL4mxZrwfhvV/nw47jPFjdw6oDHZ
         m00SqnyrNU39QwzJEjCqJFpqH3kZgRjFlwY1YxQ0eidD1k00T5ADWDx1h20icBR9O2DH
         vYr5Awbiq1E3eWvnus/noHdlpVfofPEB2AAofzn25lvVEd+VUnM7Ug8u3FhjWyREwQAC
         1Pe56sjK1ApukerGbNIuUB7G0ETFdjwm6YsmbkV5K3bwJWgAkxXriDkOPyj1owZGNSkY
         cBzA==
X-Gm-Message-State: APjAAAVOe8nn+xjXaBX/ofxnLSj4/OvRTjmuBW9gpbd2zrAkwFfDoz3x
        BFYMUeaDnUHsnrDe4c80gMAxE3KfmlE9sw==
X-Google-Smtp-Source: APXvYqzXT8IMSFEWft7GTK18DnXTMYriK2sGlXPZG1lEM7k8ypjQw+qgwOjoZXI9tkK3fSLrFUVgtw==
X-Received: by 2002:adf:f04d:: with SMTP id t13mr11859380wro.133.1565197465108;
        Wed, 07 Aug 2019 10:04:25 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 18sm312992wmg.43.2019.08.07.10.04.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 10:04:24 -0700 (PDT)
Message-ID: <5d4b0498.1c69fb81.5fe8a.1c14@mx.google.com>
Date:   Wed, 07 Aug 2019 10:04:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.3-3-20-g6926e30f09db
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 5 builds: 0 failed, 5 passed,
 13 warnings (gpio-v5.3-3-20-g6926e30f09db)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed, 13 warnings (gpio-v5.3=
-3-20-g6926e30f09db)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.3-3-20-g6926e30f09db/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.3-3-20-g6926e30f09db
Git Commit: 6926e30f09db0b77f5a3689c662d96ff85ef1a2a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 5 unique architectures

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

---
For more info write to <info@kernelci.org>
