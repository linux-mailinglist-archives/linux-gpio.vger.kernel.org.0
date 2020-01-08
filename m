Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91965133FA0
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 11:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgAHKsP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 05:48:15 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54313 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727937AbgAHKsL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 05:48:11 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip8se-0000eZ-56; Wed, 08 Jan 2020 11:48:04 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip8sd-000154-Ht; Wed, 08 Jan 2020 11:48:03 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, lee.jones@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-gpio@vger.kernel.org
Subject: [PATCH v4 0/3] Add DA9062 GPIO support
Date:   Wed,  8 Jan 2020 11:47:43 +0100
Message-Id: <20200108104746.1765-1-m.felsch@pengutronix.de>
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

this v4 adds the missing PIN_CONFIG_BIAS_DISABLE support so
pull-ups/-downs can be disconnected. I also added all git-tag already
made on my v3 [1].

@Lee
checkpatch complains about the "Acked-for-MFD-by" tag. I kept it but is
this behaviour on purpose?

Regards,
  Marco

[1] https://lkml.org/lkml/2019/12/12/601

Marco Felsch (3):
  dt-bindings: mfd: da9062: add gpio bindings
  mfd: da9062: add support for the DA9062 GPIOs in the core
  pinctrl: da9062: add driver support

 .../devicetree/bindings/mfd/da9062.txt        |  10 +
 MAINTAINERS                                   |   1 +
 drivers/mfd/da9062-core.c                     |  16 +-
 drivers/pinctrl/Kconfig                       |  12 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-da9062.c              | 300 ++++++++++++++++++
 6 files changed, 339 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/pinctrl-da9062.c

-- 
2.20.1

