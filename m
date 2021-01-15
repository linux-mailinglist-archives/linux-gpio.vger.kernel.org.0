Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3981B2F811E
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 17:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbhAOQrq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 11:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbhAOQrq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 11:47:46 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDD3C061793
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 08:47:05 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0SFY-0001WS-IL; Fri, 15 Jan 2021 17:47:00 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0SFX-0004gy-Te; Fri, 15 Jan 2021 17:46:59 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] gpio: pca953x: Add support for pca9506
Date:   Fri, 15 Jan 2021 17:46:55 +0100
Message-Id: <20210115164658.187681-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

compared to (implicit) v1 (Message-Id:
20210113194952.104734-1-u.kleine-koenig@pengutronix.de) I split the
patch #1 into driver adaption and dt documenation (i.e. patches #1 and
#2 here).

For patch #3 I did s/chips/lines/ in the commit log and capitalized
"Increase" in the summary line.

Best regards
Uwe

Uwe Kleine-König (3):
  gpio: pca953x: Add support for pca9506
  dt-bindings: gpio: pca953x: Document new supported chip pca9506
  dt-bindings: gpio: pca953x: Increase allowed length for
    gpio-line-names

 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 ++-
 drivers/gpio/gpio-pca953x.c                              | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)


base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
-- 
2.29.2

