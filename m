Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 400119F35D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 21:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbfH0Tja (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 15:39:30 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:44958 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729626AbfH0Tja (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Aug 2019 15:39:30 -0400
Received: by mail-wr1-f53.google.com with SMTP id p17so2651wrf.11
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2019 12:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=guAeHzMwlhDbbT76ewYdE1dqSMzvJUqhbnBDz1wUtIU=;
        b=sq5/InYGv1gzav+EyxKc9g88SSsabCL+CpGNz+6fR5cKF4OB8/Bz5YXJG9xW80XS3i
         S/CWtCa83LmqT3gIIF2uu9DCBZvyBihPZmrWY+LLuKwvfs3jfDHxPR+oUTf6ndHkO4Ee
         bMdQ/vW7d1fcZP3Fn2kz1/tWDLm3jrOpzz6xegu56ukwpjFg2MTWVbN5sg+ZQdr5AWLm
         tTKPGeFddn65NpQdQtIsPFDd80+6z/Hq+SpwNzLHuTpy0D8UmJAVJ9Fw7z1o4Bp6mdB4
         YQmwoJ+g8ztxrzjaWLuVJookEpv06DNf7yomFC/9zYl5lI+PWLi6TYnggb9XK0rJxj9A
         9Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=guAeHzMwlhDbbT76ewYdE1dqSMzvJUqhbnBDz1wUtIU=;
        b=cJZVins94RPz1DhAnZJ3I3PJrI1/O+mezH4E2RPw1TxbhZpZ3DoPmoKgNf2LCZWdWv
         zLpme6E0ODTkkMTT+ZUKjtEEP0AA/tCdPEdT63DOl9Puu4bzpZvyb2VTBXQrJSS/SaoP
         JqOKOkOfiTSngRnjkNz01qrDdLx/kF7YEoSCUT/+aW6ZPGGS4bfMHHB+1pRltsfbv0SB
         JchM61Z9qUaj5bw2TbYGUB0dz5W0YkGICLGTjybh8FNel/aNybsCTgge2HqbM9dN4n5w
         INkAjBgBayjZfSD+fhmfqwW9Vw30s6tNZa5plvt4iW8fMptqyKu48pNoajAEEVKo4P2W
         FWWw==
X-Gm-Message-State: APjAAAW2S59RumVSci/aD8oSk9l6QkHAeHg9VJ3VAT6MhXo2cgxQIFsu
        frPqlKVwGV+HMU6g6Zh2cMmJ9M834cqK4g==
X-Google-Smtp-Source: APXvYqy7v1taaw3zD5JlyiR5Z0qUyJXeQgK7G9GC+4lfbJcWO7bP+YGF+osd2PXffTA/5oXfVhdlww==
X-Received: by 2002:adf:9e09:: with SMTP id u9mr31677027wre.169.1566934767462;
        Tue, 27 Aug 2019 12:39:27 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n8sm242796wma.7.2019.08.27.12.39.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 12:39:26 -0700 (PDT)
Message-ID: <5d6586ee.1c69fb81.84659.152f@mx.google.com>
Date:   Tue, 27 Aug 2019 12:39:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-46-gf4e9bcc05f4e
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.3-rc1-46-gf4e9bcc05f4e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.3-rc1-=
46-gf4e9bcc05f4e)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc1-46-gf4e9bcc05f4e/

Tree: linusw
Branch: for-next
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
