Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA18AFC32
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 14:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfIKMIZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 08:08:25 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:55228 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbfIKMIZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 08:08:25 -0400
Received: by mail-wm1-f44.google.com with SMTP id p7so3171469wmp.4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HhP7wmcOPyKcqTQWSRKQApqm2erOdjhIVMxZ2peVrdA=;
        b=QZCLnTAmu3NFKTAF16ZNJPpB4SSpBEWNqZg2C61aXIZ6JmUH5XhJ2SbZMhHlE5lHpD
         3cqQYYMMgkL8qha/KQNLZs1mSOnL2l04wtVlc8/Y84GXDz3IozAMKmQQNAqEp6QmOLGB
         pr50ZKn3OJnCZJOXq1QwZcXZ1JGzf6YMKj5X4+7OApmiWBYcJ39yA7rwE/R9Gs2YCmqF
         rsSDQ1Mp7v+Dma3CS7JDbKeHvByO46bilEhQg/pfinGvyAo8z83IPPDLyT6Pby1R/X/X
         8GkzXc65+4D+2DJlxatPrOw81ajc4iz89VB+U4vcMlLt0eLp4Ss4HfYhza+VksVeIcNN
         qH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HhP7wmcOPyKcqTQWSRKQApqm2erOdjhIVMxZ2peVrdA=;
        b=VjP41TJp5JqmPj6pszDlAZEVQPolPt7XIQnY6nBXwnsuVE8DGhMOpm6kZG0w94CULM
         nMJyCsJ65vXzZvMso9IMcpic/spTevPVd7Mjpp+l2/ScOBseR0fioiCt6BAp6i1xbf2a
         ZktR6H7C2milhdE7XgPE3hfAFY1W0/LpTZg8xAGmk714SCQeDy8FKeNeAW5dHWcUDk3O
         B/eBGyHsroaE5phYZc8g38hfEuFfPYY94jWSqXfPdcKyeCA/CLShe62gd5hzXxDLTTrS
         w1kIvA/60Zqttjrsi9VHA5gLgoC6TclSuRamwtGD9AcUp7P28k8ZmY2xtOPfcAn2Cmnc
         +JAA==
X-Gm-Message-State: APjAAAUFm1n9/yejvAJt4XiRToL0N0/Ev+nQ89Y0XaTZf7Fuzfbl3IK+
        boZyF7i9pf/gxXnnEW5a5jfhnbg/6FDU8g==
X-Google-Smtp-Source: APXvYqw/l7Xlvnh/AASv/N4FbHDw1LoxWc1vie9eA2Yve3tdT+SWiUfMgtnyCj0edUAzIZUA67BXVQ==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr3521528wmk.18.1568203701924;
        Wed, 11 Sep 2019 05:08:21 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d28sm25364672wrb.95.2019.09.11.05.08.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 05:08:21 -0700 (PDT)
Message-ID: <5d78e3b5.1c69fb81.5e8eb.9e23@mx.google.com>
Date:   Wed, 11 Sep 2019 05:08:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-77-gab4a85534c3e
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 27 warnings (v5.3-rc7-77-gab4a85534c3e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 27 warnings (v5.3-rc7-77-=
gab4a85534c3e)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc7-77-gab4a85534c3e/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc7-77-gab4a85534c3e
Git Commit: ab4a85534c3ee67e9f54d3d5dda6e36072fbed89
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
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
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
