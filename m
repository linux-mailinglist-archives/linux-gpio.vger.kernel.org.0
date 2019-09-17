Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12593B4C6F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 12:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfIQK7J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 06:59:09 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57431 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbfIQK7I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Sep 2019 06:59:08 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iABCK-0006HK-Uq; Tue, 17 Sep 2019 12:59:04 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iABCK-0000Na-Gu; Tue, 17 Sep 2019 12:59:04 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, support.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 0/3] Add DA9062 GPIO support
Date:   Tue, 17 Sep 2019 12:58:59 +0200
Message-Id: <20190917105902.445-1-m.felsch@pengutronix.de>
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

this series adds the PMIC mfd GPIO support. In addition to the other
DA90* implementations it adds a small helper function which can be used
by the other da9062 drivers. Also instead of setting the GPIO input
logic statically to active-low as the da9052/53 drivers do we extract
the logic from the device tree.

Regards,
  Marco

Marco Felsch (3):
  dt-bindings: mfd: da9062: add gpio bindings
  mfd: da9062: add support for the DA9062 GPIOs in the core
  gpio: da9062: add driver support

 .../devicetree/bindings/gpio/gpio-da9062.txt  |  26 ++
 .../devicetree/bindings/mfd/da9062.txt        |   3 +
 drivers/gpio/Kconfig                          |  11 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-da9062.c                    | 265 ++++++++++++++++++
 drivers/mfd/da9062-core.c                     |  16 +-
 include/linux/mfd/da9062/gpio.h               |  13 +
 7 files changed, 334 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-da9062.txt
 create mode 100644 drivers/gpio/gpio-da9062.c
 create mode 100644 include/linux/mfd/da9062/gpio.h

-- 
2.20.1

