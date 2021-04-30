Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F161436FB27
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 15:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbhD3NHn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 09:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhD3NHm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 09:07:42 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F115FC06174A;
        Fri, 30 Apr 2021 06:06:53 -0700 (PDT)
Received: from mwalle01.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id A99472224F;
        Fri, 30 Apr 2021 15:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1619788011;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zC0r0cckX9eIpVeHFu6739oEE90Di2YevbPicKD2pSg=;
        b=TU6IwpCBl3tGzLfBPAmgBNQIYA9N5c+K6JqFeqxjc0g3pFDq/0HGHUKmj86cvqLs6yTOk3
        w3RYC2I6Mh4lHCRdaTgtDKx27OI+gGMTt+/oGXtvX1uj91YXbC6DJ/7RqE+OUE126gWuIu
        76NSs52gBhJ/jYaemAknXEX8Ij5FhzM=
From:   Michael Walle <michael@walle.cc>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH 1/2] regmap: add regmap_might_sleep()
Date:   Fri, 30 Apr 2021 15:06:44 +0200
Message-Id: <20210430130645.31562-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sometimes a driver needs to know if the underlying regmap could sleep.
For example, consider the gpio-regmap driver which needs to fill the
gpiochip->can_sleep property.

It might be possible to pass this information via the
gpio_regmap_config, but this has the following drawbacks. First, that
property is redundant and both places might contratict each other. And
secondly, the driver might not even know the type of the regmap because
it just gets an opaque pointer by querying the device tree.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/base/regmap/regmap.c | 11 +++++++++++
 include/linux/regmap.h       |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 297e95be25b3..f0661ff6bdcf 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1847,6 +1847,17 @@ size_t regmap_get_raw_write_max(struct regmap *map)
 }
 EXPORT_SYMBOL_GPL(regmap_get_raw_write_max);
 
+/**
+ * regmap_might_sleep - Returns whether a regmap access might sleep.
+ *
+ * @map: Map to check.
+ */
+bool regmap_might_sleep(struct regmap *map)
+{
+	return map->can_sleep;
+}
+EXPORT_SYMBOL_GPL(regmap_might_sleep);
+
 static int _regmap_bus_formatted_write(void *context, unsigned int reg,
 				       unsigned int val)
 {
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index f87a11a5cc4a..955fbe61557a 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1079,6 +1079,7 @@ int regmap_reinit_cache(struct regmap *map,
 			const struct regmap_config *config);
 struct regmap *dev_get_regmap(struct device *dev, const char *name);
 struct device *regmap_get_device(struct regmap *map);
+bool regmap_might_sleep(struct regmap *map);
 int regmap_write(struct regmap *map, unsigned int reg, unsigned int val);
 int regmap_write_async(struct regmap *map, unsigned int reg, unsigned int val);
 int regmap_raw_write(struct regmap *map, unsigned int reg,
@@ -1816,6 +1817,12 @@ static inline struct device *regmap_get_device(struct regmap *map)
 	return NULL;
 }
 
+static inline bool regmap_might_sleep(struct regmap *map)
+{
+	WARN_ONCE(1, "regmap API is disabled");
+	return true;
+}
+
 #endif
 
 #endif
-- 
2.20.1

