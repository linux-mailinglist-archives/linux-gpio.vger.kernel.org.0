Return-Path: <linux-gpio+bounces-14355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 923999FE64E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 14:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB57C3A22F9
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 13:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C721F1ACEA6;
	Mon, 30 Dec 2024 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JKcEjcit"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC931A83ED;
	Mon, 30 Dec 2024 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735564950; cv=none; b=Z5AZRyBv1O5WPVWBGQU/JYv0Dg1wamoEy4LdMtKbBUZfzkZmN2e9vg2GLKxsF2GMRVYbSTE0/9T92GslA+d1JBvD8xYYW45pudlXp5yftMZVVhUEnHrkU5SIwE8A2v7oPOiTaAKdQ0rWg20NOauyG5sRAYsQGcjDcw8HEVK0u5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735564950; c=relaxed/simple;
	bh=itDdHLKXbbzyZ0JoOeIZSHSxCclHceriAM2H2KstmCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9v2sLxn2EPI00draCfbrvIVcXXyBsfmRmtNCEYEl84R2NEqPgUxmbjxeAJEZMfwJOxj905Xk817NgEonH8DXDKl77WZ1i56vGdo1zXXRnH75vvPPwE/rVSuLV0I84Y8SuJUF420z9PGUBXVdlAAE8GfYZ+DcRPTtkmvgh6QghU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JKcEjcit; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D81D240012;
	Mon, 30 Dec 2024 13:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735564945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3aixxuyP9DQfn6/ANYL+4jTxDoKgiOIK+tYi41OOALk=;
	b=JKcEjcitOJHRCFbKTwreXUJoSj/01Y06LSI0QdPU8eqP3ABncjui0s3OlokPGdqK6V/Yq/
	04R6Eb9Hp3mlppk4srIW4AmV+aGbxDvu53mz2djvd5IR7i00fpMCs6tkD0Q9PW0wFL02gk
	5SHGQbCLfTFmZdZhHUBdlj86esCvhbobn615LPhgMmX9b14p/Tl7PiFv/CqtZBJ8dcP0Zd
	9p+IulybLzg5nvk78w7/SGh79aau0s3Vb36eL30UZGMrhA0ZbFDIGi3UoLoLmvKBGDWqoe
	dfCEREQ+ZoRvB60hJX/mExZS7ztJN8VBkdYr1QGTsrlZYDKm3G28vxZmBIkRAQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 30 Dec 2024 14:22:10 +0100
Subject: [PATCH v4 8/9] i2c: Support dynamic address translation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-fpc202-v4-8-761b297dc697@bootlin.com>
References: <20241230-fpc202-v4-0-761b297dc697@bootlin.com>
In-Reply-To: <20241230-fpc202-v4-0-761b297dc697@bootlin.com>
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
X-GND-Sasl: romain.gantois@bootlin.com

The i2c-atr module keeps a list of associations between I2C client aliases
and I2C addresses. This represents the address translation table which is
programmed into an ATR channel at any given time. This list is only updated
when a new client is bound to the channel.

However in some cases, an ATR channel can have more downstream clients than
available aliases. One example of this is an SFP module that is bound to an
FPC202 port. The FPC202 port can only access up to two logical I2C
addresses. However, the SFP module may expose up to three logical I2C
addresses: its EEPROM on 7-bit addresses 0x50 and 0x51, and a PHY
transceiver on address 0x56.

In cases like these, it is necessary to reconfigure the channel's
translation table on the fly, so that all three I2C addresses can be
accessed when needed.

As there are currently no known ATR's which do not support dynamic address
translation, this feature can be enabled by default without breaking
existing use cases.

Modify the i2c-atr module to provide on-the-fly address translation. This
is achieved by modifying an ATR channel's translation table whenever an I2C
transaction with unmapped clients is requested.

Add a mutex to protect alias_list. This prevents
i2c_atr_dynamic_attach/detach_addr from racing with the bus notifier
handler to modify alias_list.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/i2c/i2c-atr.c | 249 +++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 188 insertions(+), 61 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 26de5b7ec89576e8e522627da1d9997b244f8a8c..54ffa756b5b2af3e152865315a5b8e0e3103b66a 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -16,6 +16,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/lockdep.h>
 
 #define ATR_MAX_ADAPTERS 100	/* Just a sanity limit */
 #define ATR_MAX_SYMLINK_LEN 11	/* Longest name is 10 chars: "channel-99" */
@@ -27,9 +28,17 @@
  * @alias:  I2C alias address assigned by the driver.
  *          This is the address that will be used to issue I2C transactions
  *          on the parent (physical) bus.
+ * @fixed:  Alias pair cannot be replaced during dynamic address attachment.
+ *          This flag is necessary for situations where a single I2C transaction
+ *          contains more distinct target addresses than the ATR channel can handle.
+ *          It marks addresses that have already been attached to an alias so
+ *          that their alias pair is not evicted by a subsequent address in the same
+ *          transaction.
+ *
  */
 struct i2c_atr_alias_pair {
 	struct list_head node;
+	bool fixed;
 	u16 addr;
 	u16 alias;
 };
@@ -58,6 +67,7 @@ struct i2c_atr_alias_pool {
  * @adap:            The &struct i2c_adapter for the channel
  * @atr:             The parent I2C ATR
  * @chan_id:         The ID of this channel
+ * @alias_pairs_lock: Mutex protecting @alias_pairs
  * @alias_pairs:     List of @struct i2c_atr_alias_pair containing the
  *                   assigned aliases
  * @alias_pool:      Pool of available client aliases
@@ -71,6 +81,8 @@ struct i2c_atr_chan {
 	struct i2c_atr *atr;
 	u32 chan_id;
 
+	/* Lock alias_pairs during attach/detach */
+	struct mutex alias_pairs_lock;
 	struct list_head alias_pairs;
 	struct i2c_atr_alias_pool *alias_pool;
 
@@ -155,16 +167,132 @@ static void i2c_atr_free_alias_pool(struct i2c_atr_alias_pool *alias_pool)
 	kfree(alias_pool);
 }
 
+/* Must be called with alias_pairs_lock held */
+static struct i2c_atr_alias_pair *i2c_atr_create_c2a(struct i2c_atr_chan *chan,
+						     u16 alias, u16 addr)
+{
+	struct i2c_atr_alias_pair *c2a;
+
+	lockdep_assert_held(&chan->alias_pairs_lock);
+
+	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
+	if (!c2a)
+		return NULL;
+
+	c2a->addr = addr;
+	c2a->alias = alias;
+
+	list_add(&c2a->node, &chan->alias_pairs);
+
+	return c2a;
+}
+
+/* Must be called with alias_pairs_lock held */
+static void i2c_atr_destroy_c2a(struct i2c_atr_alias_pair **pc2a)
+{
+	list_del(&(*pc2a)->node);
+	kfree(*pc2a);
+	*pc2a = NULL;
+}
+
+static int i2c_atr_reserve_alias(struct i2c_atr_alias_pool *alias_pool)
+{
+	unsigned long idx;
+	u16 alias;
+
+	spin_lock(&alias_pool->lock);
+
+	idx = find_first_zero_bit(alias_pool->use_mask, alias_pool->size);
+	if (idx >= alias_pool->size) {
+		spin_unlock(&alias_pool->lock);
+		return -EBUSY;
+	}
+
+	set_bit(idx, alias_pool->use_mask);
+
+	alias = alias_pool->aliases[idx];
+
+	spin_unlock(&alias_pool->lock);
+	return alias;
+}
+
+static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 alias)
+{
+	unsigned int idx;
+
+	spin_lock(&alias_pool->lock);
+
+	for (idx = 0; idx < alias_pool->size; ++idx) {
+		if (alias_pool->aliases[idx] == alias) {
+			clear_bit(idx, alias_pool->use_mask);
+			spin_unlock(&alias_pool->lock);
+			return;
+		}
+	}
+
+	spin_unlock(&alias_pool->lock);
+}
+
+/* Must be called with alias_pairs_lock held */
 static struct i2c_atr_alias_pair *
-i2c_atr_find_mapping_by_addr(const struct list_head *list, u16 phys_addr)
+i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 {
+	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
+	struct list_head *alias_pairs;
+	u16 alias;
+	int ret;
+
+	lockdep_assert_held(&chan->alias_pairs_lock);
 
-	list_for_each_entry(c2a, list, node) {
-		if (c2a->addr == phys_addr)
+	alias_pairs = &chan->alias_pairs;
+
+	list_for_each_entry(c2a, alias_pairs, node) {
+		if (c2a->addr == addr)
 			return c2a;
 	}
 
+	ret = i2c_atr_reserve_alias(chan->alias_pool);
+	if (ret < 0) {
+		// If no free aliases are left, replace an existing one
+		if (unlikely(list_empty(alias_pairs)))
+			return NULL;
+
+		list_for_each_entry_reverse(c2a, alias_pairs, node)
+			if (!c2a->fixed)
+				break;
+
+		if (c2a->fixed)
+			return NULL;
+
+		atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
+		c2a->addr = addr;
+
+		// Move updated entry to beginning of list
+		list_move(&c2a->node, alias_pairs);
+
+		alias = c2a->alias;
+	} else {
+		alias = ret;
+
+		c2a = i2c_atr_create_c2a(chan, alias, addr);
+		if (!c2a)
+			goto err_release_alias;
+	}
+
+	ret = atr->ops->attach_addr(atr, chan->chan_id, c2a->addr, c2a->alias);
+	if (ret) {
+		dev_err(atr->dev, "failed to attach 0x%02x on channel %d: err %d\n",
+			addr, chan->chan_id, ret);
+		goto err_del_c2a;
+	}
+
+	return c2a;
+
+err_del_c2a:
+	i2c_atr_destroy_c2a(&c2a);
+err_release_alias:
+	i2c_atr_release_alias(chan->alias_pool, alias);
 	return NULL;
 }
 
@@ -180,7 +308,7 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 {
 	struct i2c_atr *atr = chan->atr;
 	static struct i2c_atr_alias_pair *c2a;
-	int i;
+	int i, ret = 0;
 
 	/* Ensure we have enough room to save the original addresses */
 	if (unlikely(chan->orig_addrs_size < num)) {
@@ -196,11 +324,13 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 		chan->orig_addrs_size = num;
 	}
 
+	mutex_lock(&chan->alias_pairs_lock);
+
 	for (i = 0; i < num; i++) {
 		chan->orig_addrs[i] = msgs[i].addr;
 
-		c2a = i2c_atr_find_mapping_by_addr(&chan->alias_pairs,
-						   msgs[i].addr);
+		c2a = i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
+
 		if (!c2a) {
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
 				msgs[i].addr);
@@ -208,13 +338,19 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 			while (i--)
 				msgs[i].addr = chan->orig_addrs[i];
 
-			return -ENXIO;
+			ret = -ENXIO;
+			goto out_unlock;
 		}
 
+		// Prevent c2a from being overwritten by another client in this transaction
+		c2a->fixed = true;
+
 		msgs[i].addr = c2a->alias;
 	}
 
-	return 0;
+out_unlock:
+	mutex_unlock(&chan->alias_pairs_lock);
+	return ret;
 }
 
 /*
@@ -227,10 +363,24 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 static void i2c_atr_unmap_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 			       int num)
 {
+	struct i2c_atr_alias_pair *c2a;
 	int i;
 
 	for (i = 0; i < num; i++)
 		msgs[i].addr = chan->orig_addrs[i];
+
+	mutex_lock(&chan->alias_pairs_lock);
+
+	if (unlikely(list_empty(&chan->alias_pairs)))
+		goto out_unlock;
+
+	// unfix c2a entries so that subsequent transfers can reuse their aliases
+	list_for_each_entry(c2a, &chan->alias_pairs, node) {
+		c2a->fixed = false;
+	}
+
+out_unlock:
+	mutex_unlock(&chan->alias_pairs_lock);
 }
 
 static int i2c_atr_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
@@ -268,14 +418,23 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_adapter *parent = atr->parent;
 	struct i2c_atr_alias_pair *c2a;
+	u16 alias;
+
+	mutex_lock(&chan->alias_pairs_lock);
+
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
 
-	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_pairs, addr);
 	if (!c2a) {
 		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
+		mutex_unlock(&chan->alias_pairs_lock);
 		return -ENXIO;
 	}
 
-	return i2c_smbus_xfer(parent, c2a->alias, flags, read_write, command,
+	alias = c2a->alias;
+
+	mutex_unlock(&chan->alias_pairs_lock);
+
+	return i2c_smbus_xfer(parent, alias, flags, read_write, command,
 			      size, data);
 }
 
@@ -317,44 +476,6 @@ static const struct i2c_lock_operations i2c_atr_lock_ops = {
 	.unlock_bus =  i2c_atr_unlock_bus,
 };
 
-static int i2c_atr_reserve_alias(struct i2c_atr_alias_pool *alias_pool)
-{
-	unsigned long idx;
-	u16 alias;
-
-	spin_lock(&alias_pool->lock);
-
-	idx = find_first_zero_bit(alias_pool->use_mask, alias_pool->size);
-	if (idx >= alias_pool->size) {
-		spin_unlock(&alias_pool->lock);
-		return -EBUSY;
-	}
-
-	set_bit(idx, alias_pool->use_mask);
-
-	alias = alias_pool->aliases[idx];
-
-	spin_unlock(&alias_pool->lock);
-	return alias;
-}
-
-static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 alias)
-{
-	unsigned int idx;
-
-	spin_lock(&alias_pool->lock);
-
-	for (idx = 0; idx < alias_pool->size; ++idx) {
-		if (alias_pool->aliases[idx] == alias) {
-			clear_bit(idx, alias_pool->use_mask);
-			spin_unlock(&alias_pool->lock);
-			return;
-		}
-	}
-
-	spin_unlock(&alias_pool->lock);
-}
-
 static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 			       u16 addr)
 {
@@ -372,7 +493,9 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 
 	alias = ret;
 
-	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
+	mutex_lock(&chan->alias_pairs_lock);
+
+	c2a = i2c_atr_create_c2a(chan, alias, addr);
 	if (!c2a) {
 		ret = -ENOMEM;
 		goto err_release_alias;
@@ -380,22 +503,19 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 
 	ret = atr->ops->attach_addr(atr, chan->chan_id, addr, alias);
 	if (ret)
-		goto err_free;
+		goto err_del_c2a;
 
 	dev_dbg(atr->dev, "chan%u: addr 0x%02x mapped at alias 0x%02x\n",
 		chan->chan_id, addr, alias);
 
-	c2a->addr = addr;
-	c2a->alias = alias;
-	list_add(&c2a->node, &chan->alias_pairs);
-
-	return 0;
+	goto out_unlock;
 
-err_free:
-	kfree(c2a);
+err_del_c2a:
+	i2c_atr_destroy_c2a(&c2a);
 err_release_alias:
 	i2c_atr_release_alias(chan->alias_pool, alias);
-
+out_unlock:
+	mutex_unlock(&chan->alias_pairs_lock);
 	return ret;
 }
 
@@ -408,21 +528,25 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 
 	atr->ops->detach_addr(atr, chan->chan_id, addr);
 
-	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_pairs, addr);
+	mutex_lock(&chan->alias_pairs_lock);
+
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
 	if (!c2a) {
 		 /* This should never happen */
 		dev_warn(atr->dev, "Unable to find address mapping\n");
+		mutex_unlock(&chan->alias_pairs_lock);
 		return;
 	}
 
+	mutex_unlock(&chan->alias_pairs_lock);
+
 	i2c_atr_release_alias(chan->alias_pool, c2a->alias);
 
 	dev_dbg(atr->dev,
 		"chan%u: addr 0x%02x unmapped from alias 0x%02x\n",
 		chan->chan_id, addr, c2a->alias);
 
-	list_del(&c2a->node);
-	kfree(c2a);
+	i2c_atr_destroy_c2a(&c2a);
 }
 
 static int i2c_atr_bus_notifier_call(struct notifier_block *nb,
@@ -633,6 +757,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
 	chan->atr = atr;
 	chan->chan_id = chan_id;
 	INIT_LIST_HEAD(&chan->alias_pairs);
+	mutex_init(&chan->alias_pairs_lock);
 	mutex_init(&chan->orig_addrs_lock);
 
 	snprintf(chan->adap.name, sizeof(chan->adap.name), "i2c-%d-atr-%d",
@@ -709,6 +834,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
 err_fwnode_put:
 	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
 	mutex_destroy(&chan->orig_addrs_lock);
+	mutex_destroy(&chan->alias_pairs_lock);
 	kfree(chan);
 	return ret;
 }
@@ -745,6 +871,7 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
 
 	fwnode_handle_put(fwnode);
 	mutex_destroy(&chan->orig_addrs_lock);
+	mutex_destroy(&chan->alias_pairs_lock);
 	kfree(chan->orig_addrs);
 	kfree(chan);
 }

-- 
2.47.1


