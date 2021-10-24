Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0927D438A1D
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 17:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbhJXPnB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 11:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbhJXPmv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 11:42:51 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C48C061745;
        Sun, 24 Oct 2021 08:40:30 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id o20so5672949qvk.7;
        Sun, 24 Oct 2021 08:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LV+Kgtvh7+La2ITtz0O2xUdXeTpFbYkBF1tkOGmeqvo=;
        b=W8sl0oty4LeSR/wD4twzLfVyyTY9S3Ml1JSOgTX1o8FBFMPDEzNMEbBGerE9WlXQ/+
         Vjw6h+ZFPZn8ivalJy7pppYq7YWG5czHuAsuVi76+baVObp20qqawXV6NR6YxZRCGE0r
         1NIzvWlXWaze7PK+kDq9J3yJfqC4H19jda0oKMKDauhnR2gBJ0txw9brYJg3PMuYpiB5
         sQ9j7b+mr2FKFCp8wDODpJ8ibvy0acsuanHLDqD7zVKYknWbM06zb5xeBft7o+/Gjj2S
         6fHMxbyR/dF1CYC9znrHTeE7rBr7ykQyUc32B4bHtn99qzj2bIXXFUW1lDoab8vAbPaB
         VU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LV+Kgtvh7+La2ITtz0O2xUdXeTpFbYkBF1tkOGmeqvo=;
        b=flOrpzRzB6iAbnL9T95hpY/VseAhc19GyxNdrHktkEWZICpSe96cpyj9EVvhmZxAGP
         XUPvjY+TYw6N1wUTEbrsgda2oZ558g2fwDiCu2AFHM2e14j7XRaWTfnurz9t/o6s902V
         KZl7UER5zhu/vwA4dnbsZIx86/QsOrP894a+bRSxfnqA/70NpmAwNvcs24DsC5Nt+g0Z
         jRXivi3vVR0bhtAbWWkzWA1ddWRj7dVOwWLYsQ+8F/yrCWb9hz9WTcyzH0rFNeparLH8
         y5sbEIqayqisEq/g3hlBTP1gjMsQqtmoL4TO0BoaO/djTgUY7ywIiePfRTomOSLl+05J
         K+vw==
X-Gm-Message-State: AOAM5300NwPa5EnGTMVrDVdkQAMhKzoLaLywkNSrPmXMSeM5pWnKmOyS
        FOZgSvZUnn8TGQDAOlg5cgg=
X-Google-Smtp-Source: ABdhPJxrfcYCPfz68n11err6efPvJC+z85O2b06D7iuXsggzwGZIZGXiSuLoNWvtuBAH76Yljnt2Ww==
X-Received: by 2002:a0c:cdd0:: with SMTP id a16mr11304302qvn.40.1635090029708;
        Sun, 24 Oct 2021 08:40:29 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:29 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
        b20788@freescale.com, Mr.Bossman075@gmail.com, fugang.duan@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 00/13] This patchset aims to add initial support for the i.MXRT10xx family
Date:   Sun, 24 Oct 2021 11:40:14 -0400
Message-Id: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add initial support for the i.MXRT10xx SoC family
starting with the i.IMXRT1050 SoC.
This patchset contains:
- i.MXRT10xx family infrastructure
- i.MXRT1050 pinctrl driver adaption
- i.MXRT1050 clock driver adaption
- i.MXRT1050 sd-card driver adaption
- i.MXRT1050 uart driver adaption
- i.MXRT1050-evk basic support

Giulio Benetti (6):
  ARM: imx: add initial support for i.MXRT10xx family
  dt-bindings: imx: Add pinctrl binding doc for i.MXRT1050
  pinctrl: freescale: Add i.MXRT1050 pinctrl driver support
  dt-bindings: imx: Add clock binding for i.MXRT1050
  ARM: dts: imx: add i.MXRT1050-EVK support
  ARM: imxrt_defconfig: add i.MXRT family defconfig

Jesse Taube (7):
  dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
  dt-bindings: clock: imx: Add documentation for i.MXRT clock
  clk: imx: Add initial support for i.MXRT clock driver
  dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
  tty: serial: fsl_lpuart: add i.MXRT support
  dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible string
  mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series

 .../bindings/clock/imxrt-clock.yaml           |  57 +
 .../bindings/mmc/fsl-imx-esdhc.yaml           |   1 +
 .../bindings/pinctrl/fsl,imxrt1050.yaml       |  85 ++
 .../bindings/serial/fsl-lpuart.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/imxrt1050-evk.dts           | 164 +++
 arch/arm/boot/dts/imxrt1050.dtsi              | 179 ++++
 arch/arm/configs/imxrt_defconfig              | 157 +++
 arch/arm/mach-imx/Kconfig                     |   9 +
 arch/arm/mach-imx/Makefile                    |   2 +
 arch/arm/mach-imx/mach-imxrt.c                |  19 +
 drivers/clk/imx/Kconfig                       |   3 +
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imxrt.c                   | 156 +++
 drivers/mmc/host/sdhci-esdhc-imx.c            |   7 +
 drivers/pinctrl/freescale/Kconfig             |   7 +
 drivers/pinctrl/freescale/Makefile            |   1 +
 drivers/pinctrl/freescale/pinctrl-imxrt1050.c | 349 ++++++
 drivers/tty/serial/fsl_lpuart.c               |   8 +
 include/dt-bindings/clock/imxrt1050-clock.h   |  72 ++
 include/dt-bindings/pinctrl/pins-imxrt1050.h  | 993 ++++++++++++++++++
 21 files changed, 2273 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
 create mode 100644 arch/arm/boot/dts/imxrt1050-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1050.dtsi
 create mode 100644 arch/arm/configs/imxrt_defconfig
 create mode 100644 arch/arm/mach-imx/mach-imxrt.c
 create mode 100644 drivers/clk/imx/clk-imxrt.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imxrt1050.c
 create mode 100644 include/dt-bindings/clock/imxrt1050-clock.h
 create mode 100644 include/dt-bindings/pinctrl/pins-imxrt1050.h

-- 
2.33.0

