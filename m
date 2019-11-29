Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF4E10D8E9
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 18:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfK2RZs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 12:25:48 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55177 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfK2RZs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 12:25:48 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iak1U-0003D5-My; Fri, 29 Nov 2019 18:25:40 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iak1S-0003AL-KV; Fri, 29 Nov 2019 18:25:38 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, lee.jones@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, joel@jms.id.au, andrew@aj.id.au,
        lgirdwood@gmail.com, broonie@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH v3 0/6] DA9062 PMIC features
Date:   Fri, 29 Nov 2019 18:25:31 +0100
Message-Id: <20191129172537.31410-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

this series address all comments made on [1]. Patch "gpio: add support
to get local gpio number" is splitted into:
 - "gpio: treewide rename gpio_chip_hwgpio to gpiod_to_offset"
 - "gpio: make gpiod_to_offset() available for other users"
Please check the discussion [1] for more information. You need to apply
[2] to test the new features.

[1] https://lore.kernel.org/lkml/20191127135932.7223-1-m.felsch@pengutronix.de/
[2] https://lore.kernel.org/linux-gpio/20191129165817.20426-1-m.felsch@pengutronix.de/T/#m3da1fb0d16a37979c74bbcebdb29f3da9e89a9ac

Marco Felsch (6):
  gpio: treewide rename gpio_chip_hwgpio to gpiod_to_offset
  gpio: make gpiod_to_offset() available for other users
  dt-bindings: mfd: da9062: add regulator voltage selection
    documentation
  regulator: da9062: add voltage selection gpio support
  dt-bindings: mfd: da9062: add regulator gpio enable/disable
    documentation
  regulator: da9062: add gpio based regulator dis-/enable support

 .../devicetree/bindings/mfd/da9062.txt        |  16 ++
 drivers/gpio/gpio-aspeed.c                    |  15 +-
 drivers/gpio/gpiolib-sysfs.c                  |   9 +-
 drivers/gpio/gpiolib.c                        |  74 +++--
 drivers/gpio/gpiolib.h                        |   8 -
 drivers/regulator/da9062-regulator.c          | 258 ++++++++++++++++++
 include/linux/gpio/private.h                  |  27 ++
 7 files changed, 361 insertions(+), 46 deletions(-)
 create mode 100644 include/linux/gpio/private.h

-- 
2.20.1

