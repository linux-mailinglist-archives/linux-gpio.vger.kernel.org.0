Return-Path: <linux-gpio+bounces-19455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F78CAA0E35
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 16:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FA4A461D46
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 14:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D122D29DB;
	Tue, 29 Apr 2025 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HTYePRMd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2462D029B;
	Tue, 29 Apr 2025 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935714; cv=none; b=D08cn906JbeCBQ94w+/du0KyMVCz4DXtXY9AGWrR5kkeETDQy4pv6FKFbrRiSPh/gTs0JkxMpji4X1IObNOx0Uoq181ayvpJE7MblbNv+cQmMdIo325nqdLwf7oxdY2pB/2+YYEtPNYgyJBHPMdykJPIMhQ2xB+CkYBLv36H8fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935714; c=relaxed/simple;
	bh=0udMnBxaSo7emOkn3tUdW92jHDgXyOSrL2aCuBpZxhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZeYGGZXZ8id/eYtoPTWak5krfBdV+xlXHSYA5YpqihgBIAXyeyGtW+UZSeWDYA4n1M2j22635UOiCuE2SwpnyKPwM84J1wC1KW3snjLH2Zuv5C6wkKh3XKT6zK/gqcHRCXTB0m4xlaTrVjGoFUkLgknmiBape3oVN1zgUZculNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HTYePRMd; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBE35438C9;
	Tue, 29 Apr 2025 14:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745935710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOqgMiS34WNCAhUlvQGAVID5fzoSxvLRwNw2cMLhxyU=;
	b=HTYePRMdumu67qlJdWuscnX0OB0CSaKVaZh2YbBtjcJPg3f4I1Kg9x5jENrqhkJzpfObC4
	dWzjgcG6GQdEtHDViWaMDeDTyusmg6LboZNp1yQaodiHcsSSqsYiyr7Jz7/z6+McFhFu6F
	fZBYfZap9LkEvfeemRkbTaIS0Af4uM09Czodt58+mAUB9HObWMPb//IQK+hcIIR7tynUt4
	N48KNQL22zn/NXc6XKEx/nQSYJ2l4NYtz2HecRDxKM3PzriPtBR3/62i8rnohTfk+xOw9w
	XQJZLSJw/lrbK+cpnp8yYbKRhNWlpaQqUaUV2YdWvauIfrohXRTN3JtsZPJ5UQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 29 Apr 2025 16:08:17 +0200
Subject: [PATCH v4 03/12] pinctrl: core: add
 devm_pinctrl_register_mappings()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-aaeon-up-board-pinctrl-support-v4-3-b3fffc11417d@bootlin.com>
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieegtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepffgrnhhivghlvgevlhgvrhhisegrrggvohhnrdgvuhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Using devm_pinctrl_register_mappings(), the core can automatically
unregister pinctrl mappings.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pinctrl/core.c          | 27 +++++++++++++++++++++++++++
 include/linux/pinctrl/machine.h | 12 ++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 6dd48dd2c035..970da6d88589 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1543,6 +1543,33 @@ void pinctrl_unregister_mappings(const struct pinctrl_map *map)
 }
 EXPORT_SYMBOL_GPL(pinctrl_unregister_mappings);
 
+static void devm_pinctrl_unregister_mappings(void *data)
+{
+	pinctrl_unregister_mappings(*(const struct pinctrl_map **)data);
+}
+
+/**
+ * devm_pinctrl_register_mappings() - Resource managed pinctrl_register_mappings()
+ * @dev: device for which mappings are registered
+ * @maps: the pincontrol mappings table to register. Note the pinctrl-core
+ *	keeps a reference to the passed in maps, so they should _not_ be
+ *	marked with __initdata.
+ * @num_maps: the number of maps in the mapping table
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
index 0940fabb154d..8bf433dd4ef2 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -149,14 +149,19 @@ struct pinctrl_map {
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
+
 #else
 
 static inline int pinctrl_register_mappings(const struct pinctrl_map *map,
@@ -165,6 +170,13 @@ static inline int pinctrl_register_mappings(const struct pinctrl_map *map,
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


