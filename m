Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6C5FB063D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 02:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbfILAjv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 20:39:51 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:35369 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfILAjv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 20:39:51 -0400
Received: by mail-wr1-f47.google.com with SMTP id g7so26580166wrx.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 17:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=e8BBQV4TJbqlQJKEPXyB+Ls2iftrOgIj9607gNcsQ0s=;
        b=B6SF8CF9ULJkZ8NuxJgpyPnop4oQor5BchsVycEgckJyC7ua9fK7D693VbDSWQbT7m
         OxYmT48bpVh97ToCediw5QaT49ZV/TcCtQW+pFXf1cnDL0zW0Ad8PEW3FKFZdumd81++
         AcdkcTPHeOij62kXkXvSV4896uUDkvcHXx2tGjwhz8R5sQUkiayAbVI0e5JwX1UkD0XP
         DyYyFq6Lr5eACREM483zYhBuPl7J98evpTlDXvbUnJLuA+FUdrXy6KkZrH8hYJyJ1dyK
         hXvKVipkvPjRjIU6JMGdlgarMCh3WgRGLpcYQ6is+gIxD6qDSAEbLh/Y2RLnawUMWo67
         zGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=e8BBQV4TJbqlQJKEPXyB+Ls2iftrOgIj9607gNcsQ0s=;
        b=sQqm0H+Zwpwm42fme6uuUimgTiYt5Eo8bNG1dIsRuijFEoF1/P3KiIrgwlLjdZEHXW
         jN2vo+0kaSG2Dm8hw/Gnj4SfRXL06xKhlEefihHNudPzl5Xn11KvTLLlqQta8oTPjTmg
         ZVL0zgXxZJsOXKV3bJsAAhfQY1ow0JROE/HiOBz7mFphOmz5pBMirtkHJSVv2TS3jSk/
         VXur1hhTjConQ7kLpnXlhTTSTVfv5K/5BoPziID5w+cXmmOyt9Ywa3BkwKxngVyQvzp1
         E1zGzH7a/lfJiVhibCAyGiIQ9oZBjUjdDWKKmhvMovcMh2UM4RjwCTWxTUMViydo8UZd
         tRqQ==
X-Gm-Message-State: APjAAAV8qaCrlmpY0H5vrbYxlIz5sd8rT0r5f77XZ/OKRX0uGnNL6RH8
        1/lKvqbu2XIncVv+Ziqx0SlPeslzpRmx6w==
X-Google-Smtp-Source: APXvYqxS+cCVjwh3v5FbiOakXux9sq3N6jKdBA6g0mMW1H17RJb7kxA5KsoBDVdMJ9gxm2BGt5XW2A==
X-Received: by 2002:adf:dec2:: with SMTP id i2mr16611118wrn.92.1568248786027;
        Wed, 11 Sep 2019 17:39:46 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r2sm3298039wrm.3.2019.09.11.17.39.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 17:39:45 -0700 (PDT)
Message-ID: <5d7993d1.1c69fb81.41f15.0d5f@mx.google.com>
Date:   Wed, 11 Sep 2019 17:39:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc8-90-ga6ef71d0ac87
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 27 warnings (v5.3-rc8-90-ga6ef71d0ac87)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 27 warnings (v5.3-rc8-=
90-ga6ef71d0ac87)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc8-90-ga6ef71d0ac87/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc8-90-ga6ef71d0ac87
Git Commit: a6ef71d0ac87c479579ad92eb9963972dac18b7a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:
    nsim_hs_defconfig (gcc-8): 2 warnings

arm64:
    defconfig (gcc-8): 3 warnings

arm:
    multi_v7_defconfig (gcc-8): 19 warnings

mips:
    32r2el_defconfig (gcc-8): 3 warnings

riscv:

x86_64:


Warnings summary:

    5    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    1    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    1    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    1    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    1    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/dma/imx-dma.c:542:6: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]

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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section mi=
smatches

Warnings:
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 19 warnings, 0 se=
ction mismatches

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

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
