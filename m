Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A42D8F78C
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2019 01:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732520AbfHOXWV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 19:22:21 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45175 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730338AbfHOXWV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 19:22:21 -0400
Received: by mail-wr1-f68.google.com with SMTP id q12so3638748wrj.12
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 16:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IgHFEa+Cbm7byCi6MszMEr8ccCcio3dBQviroBEHFXM=;
        b=KWEnzIY2jpwc+QXIiQaglbBj8GpupQcF9I2IjSI1RdmoWroasMf/aGYkdxdnyu0L0g
         uug9ai4Zm9Oe692OnYkfSktq44YLHgVjvbTWbNtq6dROghb1vzL1EXdLy6qyiE1ZwLS5
         XJex5Opso3brlHIeYQPLNhsZsoA/hPi0SigWoIlmbZZBa9MmkgojKL2nRkWtt/vAi81J
         21F5qcS3Iic0YFb32KcJvq7yJbyNA4GJO3HCE+HrchFfD6CbZAiuqvN9NeXIlLzOXSLi
         YMP62K/bJOvw/tG3gA15VM2QRF57YwlC3OuD7tWZ/aftAM6ZLY+mVGDnzhDEAOMqCx4B
         AazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IgHFEa+Cbm7byCi6MszMEr8ccCcio3dBQviroBEHFXM=;
        b=Au37/dD9TZALVUKrkzpnjKjq55Bph2TgQdRzhn7ab0AK/Xy0YrSraHG7i0yBlA/NG0
         vXWqUD8e1OTynWP7n7F1Wj1HaOxygovsVBBCVgqye0g8p8OMgX5BpP2KCisKSOna9vEa
         A7K8KfB/J2wMLUFvEz/RlXhCVu12CehMqWafwgzIvrgb6uMGhww8FNlt8mXnyewBSQns
         vI4MKUrGbCR1sLdpMPAE42WjWGil+GZtXSUREmA8J5MhdCdAsWz7lZf5dZcyRDhzIUAa
         NV1NdbQt60dvtQSC0qYPYVKyIjh6ZpcrUEtHccaMfZ83mwaRvx1RVpMVcXlFDHbwTn2L
         5baQ==
X-Gm-Message-State: APjAAAWckb4AsJK4y3JBgg2osRaAdutcuWNpxQko8pq7xwrba6YZKbkF
        X2BIeV66ShjX5AU0ceq/GQaRGrdhDHsy6g==
X-Google-Smtp-Source: APXvYqzZMQcDsLkL4jpPqjLFxodx+7N+CZnav0G0Qjcgf6AVLXIAlP37eQ8MZeIHGdv5QQUGOW3kUw==
X-Received: by 2002:adf:9b9d:: with SMTP id d29mr7439305wrc.132.1565911337902;
        Thu, 15 Aug 2019 16:22:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 12sm2677745wmi.34.2019.08.15.16.22.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 16:22:16 -0700 (PDT)
Message-ID: <5d55e928.1c69fb81.3724d.dc24@mx.google.com>
Date:   Thu, 15 Aug 2019 16:22:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-33-g02c05fd1775c
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 34 warnings (v5.3-rc4-33-g02c05fd1775c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 34 warnings (v5.3-rc4-=
33-g02c05fd1775c)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc4-33-g02c05fd1775c/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc4-33-g02c05fd1775c
Git Commit: 02c05fd1775c1c2e2a5be4ec3eec352e6538e3fa
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:
    nsim_hs_defconfig (gcc-8): 5 warnings

arm64:
    defconfig (gcc-8): 5 warnings

arm:
    multi_v7_defconfig (gcc-8): 21 warnings

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
    2    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    1    include/linux/compiler.h:328:5: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
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
    1    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:992:6: warning: this statem=
ent may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/dma/imx-dma.c:542:6: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    1    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    1    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section mi=
smatches

Warnings:
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 21 warnings, 0 se=
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
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:992:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:827:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    arch/arc/kernel/unwind.c:836:20: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
