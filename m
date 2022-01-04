Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4129B483918
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 00:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbiACXjz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 18:39:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiACXjy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jan 2022 18:39:54 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A48DC061761;
        Mon,  3 Jan 2022 15:39:54 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id 8so32487333qtx.5;
        Mon, 03 Jan 2022 15:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ncIb+jsBpIyCNEYUkcWgxTVrjUDrQlT+MkVhne4ZvLE=;
        b=AhNExDjlZr0Cr/wqfi4QgBYnjpLlj4w9ooRQGVL/HmDhwd3vOxI6aQCTLBNIpYdE2r
         01xZMDT0W9oloVXiF037pq0bgpMYd6Zv4bAvqe9dtP9WkGCjWPiFN46GQUBmtO4XU1CW
         7L8WlS8jIRVUzPYGVdQVHTgH4WH0lGoWchoWjupriPBWkCXi/vR+SkmJl860Vu6XpkE8
         5PAms71xLgNRduWbSU+iAUgGDBY4sm2IUb6bIPaZBYRWVOgRJzpHT3U+JfiFgJRgCvFb
         LXn7/biyJBAF9P2J8YVpOoom/cN5erMNdKlHe0VYzhQBbZUE3IhakJVJIqIPz02xHXCJ
         sePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ncIb+jsBpIyCNEYUkcWgxTVrjUDrQlT+MkVhne4ZvLE=;
        b=J67aEEX9HSizlPViXlsXKvoBmtfP6dJnyZn0+WevnAjFspBzs3XPod0RPtt4kgKusg
         WLRXD25nBEJn5w7YYH7xTKwvy2oE7valGhnpPp5lJFIwjkLB8JsPrOcPHCdNL0TZZjSQ
         8wi/ZTwFSkfwv9ZGJn56nI5hCWx+e0Cqsfq4IWSNjo8GZTi5StYly/gdz9BSTXJyOJvG
         VfY3exBTt0G2LDxrSmV47nvTrSWFy1I1tfwghYK5F/qx9pTPYekshNV9gT8aFw75ilzA
         eF18+8hrAlYCW/zOiGPpfJ/EjjxUZhLO92F1RDtC2BZtSi44BEiRknLzDaWvzIkJA2iW
         pvyA==
X-Gm-Message-State: AOAM53020imWD0uINBbPfItUbdJ4eythsB6Kz8hOhR9s5hNEDQnbFG8o
        JlKDQJF/e3tGfQa3qigwENI=
X-Google-Smtp-Source: ABdhPJwyivGdR7q9+zaDnfGWeABqmK/GVvYLJN2XUeKHTqiNrQH8RZesfXihw6vh+4esqH/03amT0A==
X-Received: by 2002:ac8:58cc:: with SMTP id u12mr42787952qta.385.1641253193349;
        Mon, 03 Jan 2022 15:39:53 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id o5sm26965991qkp.132.2022.01.03.15.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 15:39:53 -0800 (PST)
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
        nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH v7 0/7] Add initial support for the i.MXRTxxxx SoC family starting from i.IMXRT1050 SoC.
Date:   Mon,  3 Jan 2022 18:39:41 -0500
Message-Id: <20220103233948.198119-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset contains:
- i.MXRT10xx family infrastructure
- i.MXRT1050 pinctrl driver adaption
- i.MXRT1050 clock driver adaption
- i.MXRT1050 sd-card driver adaption
- i.MXRT1050 uart driver adaption
- i.MXRT1050-evk basic support

The i.MXRTxxxx family that could have support by Linux actually spreads
from i.MXRT1020 to i.MXRT1170 with the first one supporting 1 USB OTG &
100M ethernet with a cortex-M7@500Mhz up to the latter with i.MXRT1170
with cortex-M7@1Ghz and cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU,
2x 1Gb and 1x 100Mb ENET. The i.MXRT family is NXP's answer to
STM32F7XX, as it uses only simple SDRAM, it gives the chance of a 4 or
less layer PCBs. Seeing that these chips are comparable to the
STM32F7XXs which have linux ported to them it seems reasonable to add
support for them.

Giving Linux support to this family should ease the development process,
instead of using a RTOS they could use Embedded Linux allowing for more
portability, ease of design and will broaden the scope of people using
embedded linux.

The EVK has very little SDRAM, generally 32MB starting from
i.MXRT1020(the lowest P/N), although the i.MXRT1160/70 provide instead
64MB of SDRAM for more functionality.

At the moment we do not support XIP for either u-boot or Linux but it
should be done in the future. XIP will also save SDRAM.

Another interesting fact is the amount of internal SRAM, as the P/N
increases the SRAM will reach up to 2MB(some could be for cache and
some would be for video).

Also, some parts have embed flash of 4MB that can be used for
u-boot/Linux, if both correctly sized it will leave the SDRAM free.

External flash can be Quad SPI and HyperFlash, so throughput would be
decent.

The i.MXRT11xx series supports MIPI interface too.

The family in general provide CAN bus, audio I/O, 1 or more
USB(otg/host), 1 or more 100Mb/1Gb ethernet, camera interface, sd-card.

All this can be used for simple GUIs, web-servers, point-of-sale
stations, etc.


Giulio Benetti (4):
  ARM: imx: Add initial support for i.MXRT10xx family
  dt-bindings: imx: Add clock binding for i.MXRT1050
  ARM: dts: imx: Add i.MXRT1050-EVK support
  ARM: imxrt_defconfig: Add i.MXRT family defconfig

Jesse Taube (3):
  ARM: dts: imxrt1050-pinfunc: Add pinctrl binding header
  dt-bindings: clock: imx: Add documentation for i.MXRT1050 clock
  clk: imx: Add initial support for i.MXRT1050 clock driver

 .../bindings/clock/imxrt1050-clock.yaml       |  67 ++
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/imxrt1050-evk.dts           |  72 ++
 arch/arm/boot/dts/imxrt1050-pinfunc.h         | 993 ++++++++++++++++++
 arch/arm/boot/dts/imxrt1050.dtsi              | 160 +++
 arch/arm/configs/imxrt_defconfig              |  35 +
 arch/arm/mach-imx/Kconfig                     |   7 +
 arch/arm/mach-imx/Makefile                    |   2 +
 arch/arm/mach-imx/mach-imxrt.c                |  19 +
 drivers/clk/imx/Kconfig                       |   5 +
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imxrt1050.c               | 181 ++++
 include/dt-bindings/clock/imxrt1050-clock.h   |  72 ++
 13 files changed, 1616 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
 create mode 100644 arch/arm/boot/dts/imxrt1050-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1050-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imxrt1050.dtsi
 create mode 100644 arch/arm/configs/imxrt_defconfig
 create mode 100644 arch/arm/mach-imx/mach-imxrt.c
 create mode 100644 drivers/clk/imx/clk-imxrt1050.c
 create mode 100644 include/dt-bindings/clock/imxrt1050-clock.h

-- 
2.34.1

