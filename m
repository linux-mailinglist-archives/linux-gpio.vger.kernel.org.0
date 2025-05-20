Return-Path: <linux-gpio+bounces-20338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BF3ABD95A
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1F6E3BF867
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 13:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B286243379;
	Tue, 20 May 2025 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DgrGoV9x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0824110F;
	Tue, 20 May 2025 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747734; cv=none; b=PhnF37F0+mmZarHUR3Y2UsOY6CndWN2DWZn4YerNxR32K2KM629eysxTqRYOVUMXAQyshureB/ZaRG7tIOn/2eYsx6yU9MzZ60Fhs37dVRGOGF/FVzKf9gtFzJWR2O73b6cmsgi1Gw0RD3PpBUqp/W1Kzk0Qj7tiO+6AT8JCmVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747734; c=relaxed/simple;
	bh=Zi4kUK8V8exQ/jYlGTZpiqNPDV/K0PVGeQF8lZgoC1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7lU5F/v60av/t7cp+YECdm2LCtBJ5Rr9YHNWOoyKSBFjvEulmZkfE9ZKpOM4W8rRHsn6bv9WcBef5dqSu6uqotT1r8BzKi9hxAhPrUWRSmInsAwiAUDEy+mIkVkPNi18T7/CrRw7v4s2W8VnX5o29sbBCs6qDg49PIeZb+hnLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DgrGoV9x; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3EBB43B3D;
	Tue, 20 May 2025 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747747725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QXkFTZPAhN5Z4nXJ2+2nFSRY5GnUn0Nq/yGjDLyOt5Q=;
	b=DgrGoV9xVt8JfeurDowIKf6nsF32spDyApQmerRy0Dmwji/+aCrKLwVbX1ONGLeaHoRUUh
	DzDJpy9QncKeE2iHOJ79fJlxzy7Md3L0Ii3eYkY/Y5IQRm0Q8SCGa5AJcKiadQ4TcRqQTK
	D106cJHWZUcnB1I9oE/yZ1CQJIpGQalmPG6CYEgR8FJ5ouH6eANLGL9D89vjR6OFXVoN4i
	gQGc/1JDXRtP737sLGAv+V8k9HbTBZu+XWOSiv9lOkzHH41tsp9wbJOE7STWTlTWxA0oT0
	TVT7NQWNsYeeFU69pV5OcYx1nr74y+N4Pch8IotDZrXNy5mmiuxdVK+fg3Z6jw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 20 May 2025 15:28:27 +0200
Subject: [PATCH v6 03/12] pinctrl: core: add
 devm_pinctrl_register_mappings()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-aaeon-up-board-pinctrl-support-v6-3-dcb3756be3c6@bootlin.com>
References: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
In-Reply-To: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 linux-hardening@vger.kernel.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkedthedvieethedtleetffehudevleegledvteegvdeujeeghffhkeeggfefudevnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrt
 ghpthhtohepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefirghrhighrghnghesrggrvghonhdrtghomhdrthifpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.richard@bootlin.com

Using devm_pinctrl_register_mappings(), the core can automatically
unregister pinctrl mappings.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pinctrl/core.c          | 29 +++++++++++++++++++++++++++++
 include/linux/pinctrl/machine.h | 11 +++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 4bdbf6bb26e2..9046292d1360 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1530,6 +1530,35 @@ void pinctrl_unregister_mappings(const struct pinctrl_map *map)
 }
 EXPORT_SYMBOL_GPL(pinctrl_unregister_mappings);
 
+static void devm_pinctrl_unregister_mappings(void *maps)
+{
+	pinctrl_unregister_mappings(maps);
+}
+
+/**
+ * devm_pinctrl_register_mappings() - Resource managed pinctrl_register_mappings()
+ * @dev: device for which mappings are registered
+ * @maps: the pincontrol mappings table to register. Note the pinctrl-core
+ *	keeps a reference to the passed in maps, so they should _not_ be
+ *	marked with __initdata.
+ * @num_maps: the number of maps in the mapping table
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int devm_pinctrl_register_mappings(struct device *dev,
+				   const struct pinctrl_map *maps,
+				   unsigned int num_maps)
+{
+	int ret;
+
+	ret = pinctrl_register_mappings(maps, num_maps);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_pinctrl_unregister_mappings, (void *)maps);
+}
+EXPORT_SYMBOL_GPL(devm_pinctrl_register_mappings);
+
 /**
  * pinctrl_force_sleep() - turn a given controller device into sleep state
  * @pctldev: pin controller device
diff --git a/include/linux/pinctrl/machine.h b/include/linux/pinctrl/machine.h
index 0940fabb154d..25620229b1d6 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -149,12 +149,16 @@ struct pinctrl_map {
 #define PIN_MAP_CONFIGS_GROUP_HOG_DEFAULT(dev, grp, cfgs)		\
 	PIN_MAP_CONFIGS_GROUP(dev, PINCTRL_STATE_DEFAULT, dev, grp, cfgs)
 
+struct device;
 struct pinctrl_map;
 
 #ifdef CONFIG_PINCTRL
 
 int pinctrl_register_mappings(const struct pinctrl_map *map,
 			      unsigned int num_maps);
+int devm_pinctrl_register_mappings(struct device *dev,
+				   const struct pinctrl_map *map,
+				   unsigned int num_maps);
 void pinctrl_unregister_mappings(const struct pinctrl_map *map);
 void pinctrl_provide_dummies(void);
 #else
@@ -165,6 +169,13 @@ static inline int pinctrl_register_mappings(const struct pinctrl_map *map,
 	return 0;
 }
 
+static inline int devm_pinctrl_register_mappings(struct device *dev,
+						 const struct pinctrl_map *map,
+						 unsigned int num_maps)
+{
+	return 0;
+}
+
 static inline void pinctrl_unregister_mappings(const struct pinctrl_map *map)
 {
 }

-- 
2.39.5


