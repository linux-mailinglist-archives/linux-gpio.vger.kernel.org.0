Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FC13A50D1
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 23:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbhFLVPj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 17:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbhFLVPi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jun 2021 17:15:38 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1BFC061767
        for <linux-gpio@vger.kernel.org>; Sat, 12 Jun 2021 14:13:38 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:a4dd:c59:8cbd:ee0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 24FE020C9CD;
        Sat, 12 Jun 2021 23:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1623532414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wGMyTGqExOUC7fcBNcFG8EWKgKVZcX6itOO0TIv9aY0=;
        b=Hki/FRU/5sgbOdptnEi7Qtz+P4sxe3DEbzVZ32Bzhc53QEgi+BdnfCuFz8iNRB4LPlrFf8
        osQxi5/4+ckM7XBSs+Eg1lYdqujBfy5OWDl8qwF7BtwEEXVaz7IjmUDxzF1zLDg7TT13qy
        Tvp4GBsKcpNlnbeY0quKIOHkG7urXL0P8eYRzWht0yqM3wnFti/mtvoqbX/vgvRtU39X3p
        l4txFpk3hOD/xxpr9gwx7Lw5Lw8aLpJ0hxdVAUPdM2p8xzmZnsRP1Tob3+k2yXzBEgE6KV
        ZY2jsMKhzSCA3Ly8ocxYbPOgd93b0jVDHxIkoIcD6zwP1xwzx3k7smZBDBTh9w==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v5 1/8] regmap: Support atomic forced uncached reads
Date:   Sat, 12 Jun 2021 23:12:31 +0200
Message-Id: <e1be20bb92cff2688153125b534b738b71c3a743.1623532208.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623532208.git.sander@svanheule.net>
References: <cover.1623532208.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When a user wants to read a single uncached register, cache bypassing
can be enabled. However, this is not atomic unless an external lock is
used for the regmap. When using regcache_cache_bypass, the original
bypass state also cannot be restored.

Add support to atomically read a single uncached value, bypassing any
regmap cache.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/base/regmap/regmap.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/regmap.h       |  8 ++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index fe3e38dd5324..a828f05535b7 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2745,6 +2745,39 @@ int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val)
 }
 EXPORT_SYMBOL_GPL(regmap_read);
 
+/**
+ * regmap_read_bypassed() - Read a value from a single register, bypassing the cache
+ *
+ * @map: Register map to read from
+ * @reg: Register to be read from
+ * @val: Pointer to store read value
+ *
+ * A value of zero will be returned on success, a negative errno will
+ * be returned in error cases.
+ */
+int regmap_read_bypassed(struct regmap *map, unsigned int reg, unsigned int *val)
+{
+	bool bypass;
+	int ret;
+
+	if (!IS_ALIGNED(reg, map->reg_stride))
+		return -EINVAL;
+
+	map->lock(map->lock_arg);
+
+	bypass = map->cache_bypass;
+	map->cache_bypass = true;
+
+	ret = _regmap_read(map, reg, val);
+
+	map->cache_bypass = bypass;
+
+	map->unlock(map->lock_arg);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(regmap_read_bypassed);
+
 /**
  * regmap_raw_read() - Read raw data from the device
  *
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index f5f08dd0a116..a54dc00326ba 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1133,6 +1133,7 @@ int regmap_multi_reg_write_bypassed(struct regmap *map,
 int regmap_raw_write_async(struct regmap *map, unsigned int reg,
 			   const void *val, size_t val_len);
 int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val);
+int regmap_read_bypassed(struct regmap *map, unsigned int reg, unsigned int *val);
 int regmap_raw_read(struct regmap *map, unsigned int reg,
 		    void *val, size_t val_len);
 int regmap_noinc_read(struct regmap *map, unsigned int reg,
@@ -1607,6 +1608,13 @@ static inline int regmap_read(struct regmap *map, unsigned int reg,
 	return -EINVAL;
 }
 
+static inline int regmap_read_bypassed(struct regmap *map, unsigned int reg,
+				       unsigned int *val)
+{
+	WARN_ONCE(1, "regmap API is disabled");
+	return -EINVAL;
+}
+
 static inline int regmap_raw_read(struct regmap *map, unsigned int reg,
 				  void *val, size_t val_len)
 {
-- 
2.31.1

