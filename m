Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F84F320187
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Feb 2021 00:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhBSXH0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 18:07:26 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:36927 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229745AbhBSXHZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 18:07:25 -0500
Received: from [77.244.183.192] (port=64500 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lDEQi-009zHK-65; Fri, 19 Feb 2021 23:39:20 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] mfd: lp87565: fix typo in define names
Date:   Fri, 19 Feb 2021 23:39:08 +0100
Message-Id: <20210219223910.1831-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

"GOIO" should be "GPIO" here.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 drivers/gpio/gpio-lp87565.c |  6 +++---
 include/linux/mfd/lp87565.h | 28 ++++++++++++++--------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-lp87565.c b/drivers/gpio/gpio-lp87565.c
index e1244520cf7d..fcde6708b5df 100644
--- a/drivers/gpio/gpio-lp87565.c
+++ b/drivers/gpio/gpio-lp87565.c
@@ -123,14 +123,14 @@ static int lp87565_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 		return regmap_update_bits(gpio->map,
 					  LP87565_REG_GPIO_CONFIG,
 					  BIT(offset +
-					      __ffs(LP87565_GOIO1_OD)),
+					      __ffs(LP87565_GPIO1_OD)),
 					  BIT(offset +
-					      __ffs(LP87565_GOIO1_OD)));
+					      __ffs(LP87565_GPIO1_OD)));
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		return regmap_update_bits(gpio->map,
 					  LP87565_REG_GPIO_CONFIG,
 					  BIT(offset +
-					      __ffs(LP87565_GOIO1_OD)), 0);
+					      __ffs(LP87565_GPIO1_OD)), 0);
 	default:
 		return -ENOTSUPP;
 	}
diff --git a/include/linux/mfd/lp87565.h b/include/linux/mfd/lp87565.h
index d44ddfb6bb63..2620554f357a 100644
--- a/include/linux/mfd/lp87565.h
+++ b/include/linux/mfd/lp87565.h
@@ -222,20 +222,20 @@ enum lp87565_device_type {
 #define LP87565_GPIO2_SEL			BIT(1)
 #define LP87565_GPIO1_SEL			BIT(0)
 
-#define LP87565_GOIO3_OD			BIT(6)
-#define LP87565_GOIO2_OD			BIT(5)
-#define LP87565_GOIO1_OD			BIT(4)
-#define LP87565_GOIO3_DIR			BIT(2)
-#define LP87565_GOIO2_DIR			BIT(1)
-#define LP87565_GOIO1_DIR			BIT(0)
-
-#define LP87565_GOIO3_IN			BIT(2)
-#define LP87565_GOIO2_IN			BIT(1)
-#define LP87565_GOIO1_IN			BIT(0)
-
-#define LP87565_GOIO3_OUT			BIT(2)
-#define LP87565_GOIO2_OUT			BIT(1)
-#define LP87565_GOIO1_OUT			BIT(0)
+#define LP87565_GPIO3_OD			BIT(6)
+#define LP87565_GPIO2_OD			BIT(5)
+#define LP87565_GPIO1_OD			BIT(4)
+#define LP87565_GPIO3_DIR			BIT(2)
+#define LP87565_GPIO2_DIR			BIT(1)
+#define LP87565_GPIO1_DIR			BIT(0)
+
+#define LP87565_GPIO3_IN			BIT(2)
+#define LP87565_GPIO2_IN			BIT(1)
+#define LP87565_GPIO1_IN			BIT(0)
+
+#define LP87565_GPIO3_OUT			BIT(2)
+#define LP87565_GPIO2_OUT			BIT(1)
+#define LP87565_GPIO1_OUT			BIT(0)
 
 /* Number of step-down converters available */
 #define LP87565_NUM_BUCK		6
-- 
2.30.0

