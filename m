Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF7A7D1D3
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 01:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbfGaXXc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 19:23:32 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37306 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728171AbfGaXXc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 19:23:32 -0400
Received: by mail-wr1-f67.google.com with SMTP id n9so46409533wrr.4
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2019 16:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+glhOaYE24xaoJEXqk77vZP36enFjmGpEnZ0EDc0N48=;
        b=xgCR42isQLQkMmR9/9+ykWPv9nuCk3/l9B402n10DSbpyoEnON4nNC+6VCK9hGE1O7
         d4kd5xMRI+LZOomrwOToU8rcZ1NZRrqejsEkOmYGQxS8ROp2ZCZ9KdHhQF+P3DxXYlT6
         oQ/t23kGF4Ogz1e88G3eOStWIpwEu8PX33X4OjH8rQVpZHaL8CCsDmlvBGj9PsIkkoqj
         Ogun9PZCDX7mtVwa/Ck2krBxTZzhx5t+6nnA5kYp0Lh8ou6+BQJBRfYxgKcTDi29QgMJ
         M+ZL/ncV8fkk5Q6dlgt3cTD8Drs1aouxrm58PP/fffbruKgtxJHd86x7WaXU0gqXIMCO
         OWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+glhOaYE24xaoJEXqk77vZP36enFjmGpEnZ0EDc0N48=;
        b=aZll+U3bB5BVmZYaZY8lApu5LgtozJSde5+1l7zMJfMwd/wRmgvhSa45IiFXnuv/O+
         g55fuokDKkCAmaywlfG3wBj1bpOLmPPRqYHT2LT7f2TM1AWVIGh6X0W/SYnI10j+BTSR
         9xr9cTDdKY7K9VpoDK9435soT7Gk/bgeBdSyNLLhrdEv7DLrkElrrT6Pc0zHqods65Bn
         kmzjfnHvZa0WodkmWYhbPLMhSYS84p/5548GVYGERoMFAaebK7VSOA6HV/+sC+TxcEmN
         91mkIcVgv6/wS0SO6X1L0ssc/lvBaLMiHrxdPB8rwsEDHCXFI83GGpQ1jOjgieZiqiBP
         ls+Q==
X-Gm-Message-State: APjAAAXT/f39Hjwl0FPswwr7P6j5KfLIxOpPyTVAgF8tWozXYeuAewzQ
        9AtdkZNuYrP8tokgJ7TOakTKQFy4vp8=
X-Google-Smtp-Source: APXvYqw4Foks5LP8ntqPMc/ivmXbILJJcne6+p96/+7rjzuS/B/crS7QbgpSUESdGCw7pncRRwg8hw==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr9404829wrm.235.1564615408972;
        Wed, 31 Jul 2019 16:23:28 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a84sm88370031wmf.29.2019.07.31.16.23.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 16:23:28 -0700 (PDT)
Message-ID: <5d4222f0.1c69fb81.14163.e743@mx.google.com>
Date:   Wed, 31 Jul 2019 16:23:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-14-gc058275cfa13
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.3-rc1-14-gc058275cfa13)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.3-rc1-=
14-gc058275cfa13)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc1-14-gc058275cfa13/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc1-14-gc058275cfa13
Git Commit: c058275cfa138773636fb944dad64fa799d6d493
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
