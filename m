Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F3124993F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 11:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgHSJYx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 05:24:53 -0400
Received: from muru.com ([72.249.23.125]:41082 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726903AbgHSJYw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Aug 2020 05:24:52 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8DEF9807A;
        Wed, 19 Aug 2020 09:24:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio: omap: Fix warnings if PM is disabled
Date:   Wed, 19 Aug 2020 12:24:45 +0300
Message-Id: <20200819092445.15702-1-tony@atomide.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix warnings for omap_gpio_resume and omap_gpio_suspend
defined but not used when PM is disabled as noticed when
doing make randconfig builds.

Fixes: f02a03985d06 ("gpio: omap: Add missing PM ops for suspend")
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpio/gpio-omap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1516,7 +1516,7 @@ static int __maybe_unused omap_gpio_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int omap_gpio_suspend(struct device *dev)
+static int __maybe_unused omap_gpio_suspend(struct device *dev)
 {
 	struct gpio_bank *bank = dev_get_drvdata(dev);
 
@@ -1528,7 +1528,7 @@ static int omap_gpio_suspend(struct device *dev)
 	return omap_gpio_runtime_suspend(dev);
 }
 
-static int omap_gpio_resume(struct device *dev)
+static int __maybe_unused omap_gpio_resume(struct device *dev)
 {
 	struct gpio_bank *bank = dev_get_drvdata(dev);
 
-- 
2.28.0
