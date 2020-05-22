Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F1B1DDDAA
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 05:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgEVDIN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 May 2020 23:08:13 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:59167 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727123AbgEVDIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 May 2020 23:08:13 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.106233|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0832929-0.000859812-0.915847;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03307;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.HbxBGFJ_1590116882;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.HbxBGFJ_1590116882)
          by smtp.aliyun-inc.com(10.147.41.178);
          Fri, 22 May 2020 11:08:08 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, p.zabel@pengutronix.de,
        frank@allwinnertech.com, huangshuosheng@allwinnertech.com,
        tiny.windzz@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 0/4] Allwinner A100 Initial support
Date:   Fri, 22 May 2020 11:07:39 +0800
Message-Id: <20200522030743.10204-1-frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch set adds initial support for allwinner a100 soc,
which is a 64-bit tablet chip.

Frank Lee (4):
  clk: sunxi-ng: add support for the Allwinner A100 CCU
  pinctrl: sunxi: add support for the Allwinner A100 pin controller
  arm64: allwinner: A100: add the basical Allwinner A100 DTSI file
  arm64: allwinner: A100: add support for Allwinner Perf1 board

 arch/arm64/boot/dts/allwinner/Makefile        |    1 +
 .../allwinner/sun50i-a100-allwinner-perf1.dts |   27 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  173 +++
 drivers/clk/sunxi-ng/Kconfig                  |   10 +
 drivers/clk/sunxi-ng/Makefile                 |    2 +
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c      |  206 +++
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.h      |   14 +
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c        | 1255 +++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-a100.h        |   14 +
 drivers/pinctrl/sunxi/Kconfig                 |   10 +
 drivers/pinctrl/sunxi/Makefile                |    2 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c |  105 ++
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c   |  710 ++++++++++
 include/dt-bindings/clock/sun50i-a100-ccu.h   |  141 ++
 include/dt-bindings/clock/sun50i-a100-r-ccu.h |   25 +
 include/dt-bindings/reset/sun50i-a100-ccu.h   |   68 +
 include/dt-bindings/reset/sun50i-a100-r-ccu.h |   18 +
 17 files changed, 2781 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
 create mode 100644 include/dt-bindings/clock/sun50i-a100-ccu.h
 create mode 100644 include/dt-bindings/clock/sun50i-a100-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-a100-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-a100-r-ccu.h

-- 
2.24.0

