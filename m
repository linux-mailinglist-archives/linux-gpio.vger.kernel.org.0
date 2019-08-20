Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C41F95BC7
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 11:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729618AbfHTJ55 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 05:57:57 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:53762 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfHTJ55 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 05:57:57 -0400
Received: by mail-wm1-f49.google.com with SMTP id 10so2059091wmp.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 02:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qe8CN8ssfZ6YCyU598ZXKMyRJ73Aq083J/wgUzUvHsQ=;
        b=vxI9rtnEliIqO9NoztDDIq7UclcCgLARBpEEil3dKN0HW/TQDhXgkrxqXN/4/3vxwO
         Gkhl58HBdVZztAawJ9cQrSyP0F5mzRd1KuBkgQrZMB94iPQxycDqTEeoQfaDC9JrpbEj
         cUwRRCdbhgi8U4w61lFppAShQyzW9CVdkB7eqxNqxWcONqH0eoVPJqPK3QABuWGIcDaF
         khD3sPowMQBbLrrzuvzvNbbkkVSp/fo73uGpLYjTlq51jLbIEACNq2Npc0S0ppUYHvkl
         kYUpLxH7UgeocuT6YRzNFQAbWT8cBvHWMBFPhqFcO1b9NhW2z+b5xqzpRiFVZ7bVenQ6
         OilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qe8CN8ssfZ6YCyU598ZXKMyRJ73Aq083J/wgUzUvHsQ=;
        b=VrDaJvB3/gsRrpmuP7nH7Mzle9h2wzrUcsmtV8rtsNOES21GjDxg+e6yZtAG+j2K4S
         P2llksjjLVYLIKizrrU9cl3zzDc7qNFxS8ELdHHmLr6Wg/lDMBQr3GZJAS8Jxeo3xuPT
         ElJtKGUXzsehPV3Qcgqe9MIHHNTzroqdn88XtqRZ4VgPpyhqO1pS9L8st+Q9NvBiiZFb
         eUPEQvpjmenA5zSdOLTuOFCqbSEN55EoZM4btWs29K/7U1hvm8PV+oOJqMsL0pcA9ZYq
         MKkwW1NxEYZrp+74VliEdNbEXUFn0yIBdVBDOZlVnY8Tq9Lwr8tQkIAjkIwKQGCg46Rj
         czEw==
X-Gm-Message-State: APjAAAWYD3I6CC1jg2amN794/VmFzI+AtAZpFRuia4TGofhO4atHDk5c
        7nUJhA5DEVd/q/5Qqs0mAJPnR/u4jIJYUQ==
X-Google-Smtp-Source: APXvYqxEvhQPGbbcELZXNbHTjfhgAXBs4Dah1tuBQpYDb9hpkPvDvedzLVM5yIBOel4aTpbxDWFjOg==
X-Received: by 2002:a7b:c0d4:: with SMTP id s20mr23465807wmh.122.1566295074286;
        Tue, 20 Aug 2019 02:57:54 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q3sm19037252wma.48.2019.08.20.02.57.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 02:57:53 -0700 (PDT)
Message-ID: <5d5bc421.1c69fb81.a43d3.bc03@mx.google.com>
Date:   Tue, 20 Aug 2019 02:57:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-35-ga7e42142926f
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.3-rc1-35-ga7e42142926f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.3-rc1-35-=
ga7e42142926f)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-35-ga7e42142926f/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-35-ga7e42142926f
Git Commit: a7e42142926f815c776f745d027f69a53415d99c
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
