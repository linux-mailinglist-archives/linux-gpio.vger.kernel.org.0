Return-Path: <linux-gpio+bounces-15318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353BA26E5E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 10:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA7A43A13CB
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 09:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5B920C000;
	Tue,  4 Feb 2025 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YSpyImKx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611702080C1;
	Tue,  4 Feb 2025 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661369; cv=none; b=VSDCbmcZAB0y09KJK8F5UoFOf+mYbMIuF+bsGnsqKGw5kEVJY710LrFgbEJUpaD50Sb9bB2BykgXWqkdU7JXN5KJ4mX1gyO/tTDg9q0ObJVUKs0+frkl34JMr9bgw9TZvNefOejhfIu3TSn30k4Q63nPwd6bUi2axbEq7wdtILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661369; c=relaxed/simple;
	bh=kOHgtMJQnzKTtOt9UOB8BLauX2P0LGwAyEj/Qx4o4sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fRQH03vJb0zptHRpiDx0ARnyqoX7l3xjdHDEq0tQnWVV3UjJ4AABjpvvdypH9hRUJ7YUNjmNqnFQJ4gugilVGlQbU7Rb8IkXawzbmkMiWhEbiszoAqX8oNKQEDIBjMMXEUWhnD/SsXEkTbyjZFASC7Vya1ABpymGFT01P1DphoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YSpyImKx; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09EFC44369;
	Tue,  4 Feb 2025 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738661365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ug2eWia+k3UQyHA7NujRxo07jigzgpiMJPEbVVCS7B4=;
	b=YSpyImKxu6JERshcVkkasyeV01jsVqToCjQBHbSHfpP2RCrDec7CczudFx9TOhEE2cVBUP
	2WQtA0RmLZTaj54aqWEHgxMhpICjMdPn0/RK9dWOAx3EA1AOwZN5YzrwI+SsUwPx7r6Qsi
	hk1eI7lQF0JdflgExq8DkNGTtIbqUAwuiy6Epd1XR1IOdhAPRKKJdJFLNnSAIocrBHKvN2
	OS/uyjufdWGBZICDt/4bgTTt7fBjSF6u4fuqKPfchlEyHgSOi9YdSPnpuaHLJ6EpW6h3YS
	/PvWSznN/gXMeE2lBwLLUcgT3LnTGe/uVNzR0/F4RLClASQeEOgUdjakYIc/tQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 04 Feb 2025 10:29:16 +0100
Subject: [PATCH v7 5/9] i2c: move ATR alias pool to a separate struct
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-fpc202-v7-5-78b4b8a35cf1@bootlin.com>
References: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
In-Reply-To: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeelieefteelffeuheevtdetkefhfffhteffkefgtefhkeevudeutdeugfffheegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrudefngdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguvghrvghkrdhkihgvrhhnrghnsegrmhgurdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghns
 ehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegurhgrghgrnhdrtghvvghtihgtsegrmhgurdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

Each I2C address translator (ATR) has a pool of client aliases which can be
used as translation targets. Some ATRs have a single alias pool shared by
all downstream channels, while others have a separate alias pool for each
channel. Currently, this alias pool is represented by the "aliases",
"num_aliases", and "use_mask" fields of struct i2c_atr.

In preparation for adding per-channel alias pool support, move the
"aliases", "num_aliases", "use_mask" and associated lock to a new struct
called "struct alias_pool".

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/i2c/i2c-atr.c | 172 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 107 insertions(+), 65 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 118fd7d764dce51de587e274ef452e031ccff52d..e9c6b85e3e4a4ff84fdf9ad139f05fdceb441120 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -34,6 +34,23 @@ struct i2c_atr_alias_pair {
 	u16 alias;
 };
 
+/**
+ * struct i2c_atr_alias_pool - Pool of client aliases available for an ATR.
+ * @size:     Total number of aliases
+ *
+ * @lock:     Lock protecting @aliases and @use_mask
+ * @aliases:  Array of aliases, must hold exactly @size elements
+ * @use_mask: Mask of used aliases
+ */
+struct i2c_atr_alias_pool {
+	size_t size;
+
+	/* Protects aliases and use_mask */
+	spinlock_t lock;
+	u16 *aliases;
+	unsigned long *use_mask;
+};
+
 /**
  * struct i2c_atr_chan - Data for a channel.
  * @adap:            The &struct i2c_adapter for the channel
@@ -67,10 +84,7 @@ struct i2c_atr_chan {
  * @algo:      The &struct i2c_algorithm for adapters
  * @lock:      Lock for the I2C bus segment (see &struct i2c_lock_operations)
  * @max_adapters: Maximum number of adapters this I2C ATR can have
- * @num_aliases: Number of aliases in the aliases array
- * @aliases:   The aliases array
- * @alias_mask_lock: Lock protecting alias_use_mask
- * @alias_use_mask: Bitmask for used aliases in aliases array
+ * @alias_pool: Pool of available client aliases
  * @i2c_nb:    Notifier for remote client add & del events
  * @adapter:   Array of adapters
  */
@@ -86,17 +100,54 @@ struct i2c_atr {
 	struct mutex lock;
 	int max_adapters;
 
-	size_t num_aliases;
-	const u16 *aliases;
-	/* Protects alias_use_mask */
-	spinlock_t alias_mask_lock;
-	unsigned long *alias_use_mask;
+	struct i2c_atr_alias_pool *alias_pool;
 
 	struct notifier_block i2c_nb;
 
 	struct i2c_adapter *adapter[] __counted_by(max_adapters);
 };
 
+static struct i2c_atr_alias_pool *i2c_atr_alloc_alias_pool(size_t num_aliases)
+{
+	struct i2c_atr_alias_pool *alias_pool;
+	int ret;
+
+	alias_pool = kzalloc(sizeof(*alias_pool), GFP_KERNEL);
+	if (!alias_pool)
+		return ERR_PTR(-ENOMEM);
+
+	alias_pool->size = num_aliases;
+
+	alias_pool->aliases = kcalloc(num_aliases, sizeof(*alias_pool->aliases), GFP_KERNEL);
+	if (!alias_pool->aliases) {
+		ret = -ENOMEM;
+		goto err_free_alias_pool;
+	}
+
+	alias_pool->use_mask = bitmap_zalloc(num_aliases, GFP_KERNEL);
+	if (!alias_pool->use_mask) {
+		ret = -ENOMEM;
+		goto err_free_aliases;
+	}
+
+	spin_lock_init(&alias_pool->lock);
+
+	return alias_pool;
+
+err_free_aliases:
+	kfree(alias_pool->aliases);
+err_free_alias_pool:
+	kfree(alias_pool);
+	return ERR_PTR(ret);
+}
+
+static void i2c_atr_free_alias_pool(struct i2c_atr_alias_pool *alias_pool)
+{
+	bitmap_free(alias_pool->use_mask);
+	kfree(alias_pool->aliases);
+	kfree(alias_pool);
+}
+
 static struct i2c_atr_alias_pair *
 i2c_atr_find_mapping_by_addr(const struct list_head *list, u16 phys_addr)
 {
@@ -259,44 +310,42 @@ static const struct i2c_lock_operations i2c_atr_lock_ops = {
 	.unlock_bus =  i2c_atr_unlock_bus,
 };
 
-static int i2c_atr_reserve_alias(struct i2c_atr *atr)
+static int i2c_atr_reserve_alias(struct i2c_atr_alias_pool *alias_pool)
 {
 	unsigned long idx;
+	u16 alias;
 
-	spin_lock(&atr->alias_mask_lock);
+	spin_lock(&alias_pool->lock);
 
-	idx = find_first_zero_bit(atr->alias_use_mask, atr->num_aliases);
-	if (idx >= atr->num_aliases) {
-		spin_unlock(&atr->alias_mask_lock);
-		dev_err(atr->dev, "failed to find a free alias\n");
+	idx = find_first_zero_bit(alias_pool->use_mask, alias_pool->size);
+	if (idx >= alias_pool->size) {
+		spin_unlock(&alias_pool->lock);
 		return -EBUSY;
 	}
 
-	set_bit(idx, atr->alias_use_mask);
+	set_bit(idx, alias_pool->use_mask);
 
-	spin_unlock(&atr->alias_mask_lock);
+	alias = alias_pool->aliases[idx];
 
-	return atr->aliases[idx];
+	spin_unlock(&alias_pool->lock);
+	return alias;
 }
 
-static void i2c_atr_release_alias(struct i2c_atr *atr, u16 alias)
+static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 alias)
 {
 	unsigned int idx;
 
-	spin_lock(&atr->alias_mask_lock);
+	spin_lock(&alias_pool->lock);
 
-	for (idx = 0; idx < atr->num_aliases; ++idx) {
-		if (atr->aliases[idx] == alias) {
-			clear_bit(idx, atr->alias_use_mask);
-			spin_unlock(&atr->alias_mask_lock);
+	for (idx = 0; idx < alias_pool->size; ++idx) {
+		if (alias_pool->aliases[idx] == alias) {
+			clear_bit(idx, alias_pool->use_mask);
+			spin_unlock(&alias_pool->lock);
 			return;
 		}
 	}
 
-	spin_unlock(&atr->alias_mask_lock);
-
-	 /* This should never happen */
-	dev_warn(atr->dev, "Unable to find mapped alias\n");
+	spin_unlock(&alias_pool->lock);
 }
 
 static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
@@ -308,9 +357,11 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	u16 alias;
 	int ret;
 
-	ret = i2c_atr_reserve_alias(atr);
-	if (ret < 0)
+	ret = i2c_atr_reserve_alias(atr->alias_pool);
+	if (ret < 0) {
+		dev_err(atr->dev, "failed to find a free alias\n");
 		return ret;
+	}
 
 	alias = ret;
 
@@ -336,7 +387,7 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 err_free:
 	kfree(c2a);
 err_release_alias:
-	i2c_atr_release_alias(atr, alias);
+	i2c_atr_release_alias(atr->alias_pool, alias);
 
 	return ret;
 }
@@ -357,7 +408,7 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 		return;
 	}
 
-	i2c_atr_release_alias(atr, c2a->alias);
+	i2c_atr_release_alias(atr->alias_pool, c2a->alias);
 
 	dev_dbg(atr->dev,
 		"chan%u: detached alias 0x%02x from addr 0x%02x\n",
@@ -411,12 +462,11 @@ static int i2c_atr_bus_notifier_call(struct notifier_block *nb,
 
 static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
 {
+	struct i2c_atr_alias_pool *alias_pool;
 	struct device *dev = atr->dev;
-	unsigned long *alias_use_mask;
 	size_t num_aliases;
 	unsigned int i;
 	u32 *aliases32;
-	u16 *aliases16;
 	int ret;
 
 	ret = fwnode_property_count_u32(dev_fwnode(dev), "i2c-alias-pool");
@@ -428,12 +478,23 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
 
 	num_aliases = ret;
 
-	if (!num_aliases)
+	alias_pool = i2c_atr_alloc_alias_pool(num_aliases);
+	if (IS_ERR(alias_pool)) {
+		ret = PTR_ERR(alias_pool);
+		dev_err(dev, "Failed to allocate alias pool, err %d\n", ret);
+		return ret;
+	}
+
+	atr->alias_pool = alias_pool;
+
+	if (!alias_pool->size)
 		return 0;
 
 	aliases32 = kcalloc(num_aliases, sizeof(*aliases32), GFP_KERNEL);
-	if (!aliases32)
-		return -ENOMEM;
+	if (!aliases32) {
+		ret = -ENOMEM;
+		goto err_free_alias_pool;
+	}
 
 	ret = fwnode_property_read_u32_array(dev_fwnode(dev), "i2c-alias-pool",
 					     aliases32, num_aliases);
@@ -443,43 +504,27 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
 		goto err_free_aliases32;
 	}
 
-	aliases16 = kcalloc(num_aliases, sizeof(*aliases16), GFP_KERNEL);
-	if (!aliases16) {
-		ret = -ENOMEM;
-		goto err_free_aliases32;
-	}
-
 	for (i = 0; i < num_aliases; i++) {
 		if (!(aliases32[i] & 0xffff0000)) {
-			aliases16[i] = aliases32[i];
+			alias_pool->aliases[i] = aliases32[i];
 			continue;
 		}
 
 		dev_err(dev, "Failed to parse 'i2c-alias-pool' property: I2C flags are not supported\n");
 		ret = -EINVAL;
-		goto err_free_aliases16;
-	}
-
-	alias_use_mask = bitmap_zalloc(num_aliases, GFP_KERNEL);
-	if (!alias_use_mask) {
-		ret = -ENOMEM;
-		goto err_free_aliases16;
+		goto err_free_aliases32;
 	}
 
 	kfree(aliases32);
 
-	atr->num_aliases = num_aliases;
-	atr->aliases = aliases16;
-	atr->alias_use_mask = alias_use_mask;
-
-	dev_dbg(dev, "i2c-alias-pool has %zu aliases", atr->num_aliases);
+	dev_dbg(dev, "i2c-alias-pool has %zu aliases\n", alias_pool->size);
 
 	return 0;
 
-err_free_aliases16:
-	kfree(aliases16);
 err_free_aliases32:
 	kfree(aliases32);
+err_free_alias_pool:
+	i2c_atr_free_alias_pool(alias_pool);
 	return ret;
 }
 
@@ -500,7 +545,6 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	mutex_init(&atr->lock);
-	spin_lock_init(&atr->alias_mask_lock);
 
 	atr->parent = parent;
 	atr->dev = dev;
@@ -520,13 +564,12 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	atr->i2c_nb.notifier_call = i2c_atr_bus_notifier_call;
 	ret = bus_register_notifier(&i2c_bus_type, &atr->i2c_nb);
 	if (ret)
-		goto err_free_aliases;
+		goto err_free_alias_pool;
 
 	return atr;
 
-err_free_aliases:
-	bitmap_free(atr->alias_use_mask);
-	kfree(atr->aliases);
+err_free_alias_pool:
+	i2c_atr_free_alias_pool(atr->alias_pool);
 err_destroy_mutex:
 	mutex_destroy(&atr->lock);
 	kfree(atr);
@@ -543,8 +586,7 @@ void i2c_atr_delete(struct i2c_atr *atr)
 		WARN_ON(atr->adapter[i]);
 
 	bus_unregister_notifier(&i2c_bus_type, &atr->i2c_nb);
-	bitmap_free(atr->alias_use_mask);
-	kfree(atr->aliases);
+	i2c_atr_free_alias_pool(atr->alias_pool);
 	mutex_destroy(&atr->lock);
 	kfree(atr);
 }

-- 
2.47.1


