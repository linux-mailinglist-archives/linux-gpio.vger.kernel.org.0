Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D460E74EEF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2019 15:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbfGYNPk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jul 2019 09:15:40 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:57334 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729960AbfGYNPk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jul 2019 09:15:40 -0400
X-Greylist: delayed 328 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Jul 2019 09:15:39 EDT
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 785EC73A34D; Thu, 25 Jul 2019 15:10:06 +0200 (CEST)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: mockup: don't depend twice on GPIOLIB
Date:   Thu, 25 Jul 2019 15:10:02 +0200
Message-Id: <20190725131002.14597-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

config GPIO_MOCKUP is defined in a big if GPIOLIB ... endif block so it
doesn't need to depend explicitly on GPIOLIB.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bb13c266c329..856fcd260ba2 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1465,7 +1465,6 @@ endmenu
 
 config GPIO_MOCKUP
 	tristate "GPIO Testing Driver"
-	depends on GPIOLIB
 	select IRQ_SIM
 	help
 	  This enables GPIO Testing driver, which provides a way to test GPIO
-- 
2.20.1

