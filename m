Return-Path: <linux-gpio+bounces-18950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5F3A905D2
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 767D33BD449
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109C71FF601;
	Wed, 16 Apr 2025 14:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kNoKdobi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C710F22F01;
	Wed, 16 Apr 2025 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812015; cv=none; b=iUuF6k3RVJntS9jviaggtwylANLdc8mmHg1wLvjw8u1ahoUY1F9oKEeVa1COY79c8xlQ8dla7i2NekYKyMkdoln9T6BPLhys27vF1zdipFFrC4d5dxRW+g2oYloR25i6s/295YRsfY3D3WVJvc+Z/T/XH3QRWXUoctS0J/14/pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812015; c=relaxed/simple;
	bh=3tEp06k0wEFU951hwTqe5CHOYNIE2uuhh80QaVzlsXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dEg6nmUy8l3/0Qv6yvI0uB5L6LkRZjWDL1YGb3ZTFmJk3ukFP2eWdD19pepL/dfJpYPbOgjhTVVy+ReCzV4k5Y+HceGQf4qww9inzF/XLM3GT/dZ3AkU83Fb7PgramKAZmS71azzlrmhxxfcI4FLYD5caaFhFdypjiMwGmHuYFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kNoKdobi; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72DCA43B70;
	Wed, 16 Apr 2025 14:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=69QLjOXs+hUJARhcQJ5lp4MhpmN7/LQG4DVblLVj1gY=;
	b=kNoKdobiW9W3BhSsozvXF204oonBgunJV7Xzv3CpA9pqFg5C1ksK0kuv6FXGuvQ5fqzFfo
	Lp4i8G0/kwkmgl2TzueIY1n+PyjCkTm5VvxBAUOYNL6zDrkj7bysyu/BkJAJz30g0qXIuu
	jOgEXP9qsK7cUPkJ2Slk9jQO/g+CFcH1W6q4EVkGn4alpM266bxuquYsZYCGo2PT+PUv4O
	sqAxyQWDwuFmxKbIctUvos2dBEl/WffnttWTiCEQvwqnL4VhTwU4kMIt5PinAbsFwCrvcj
	nIwb/h8mAETb5FEqQn23NiDF9Z1DLv36pv8pXXeJvbUQRioZY4Sr9GerPpv1Jg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 16 Apr 2025 15:59:54 +0200
Subject: [PATCH v3 02/10] pinctrl: core: add
 devm_pinctrl_register_mappings()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-aaeon-up-board-pinctrl-support-v3-2-9ca13aa57312@bootlin.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeiheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdtleemugdtgeejmeelieefrgemvdgvfhdumedujeeimeejsgegudemudhffheknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtleemugdtgeejmeelieefrgemvdgvfhdumedujeeimeejsgegudemudhffhekpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvl
 hesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepffgrnhhivghlvgevlhgvrhhisegrrggvohhnrdgvuhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

Using devm_pinctrl_register_mappings(), the core can automatically
unregister pinctrl mappings.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pinctrl/core.c          | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/pinctrl/machine.h | 10 ++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 6dd48dd2c035..f02c45b98512 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1543,6 +1543,43 @@ void pinctrl_unregister_mappings(const struct pinctrl_map *map)
 }
 EXPORT_SYMBOL_GPL(pinctrl_unregister_mappings);
 
+static void devm_pinctrl_unregister_mappings(struct device *dev, void *res)
+{
+	pinctrl_unregister_mappings(*(const struct pinctrl_map **)res);
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
+	const struct pinctrl_map **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_pinctrl_unregister_mappings, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = pinctrl_register_mappings(maps, num_maps);
+	if (!ret) {
+		*ptr = maps;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_pinctrl_register_mappings);
+
 /**
  * pinctrl_force_sleep() - turn a given controller device into sleep state
  * @pctldev: pin controller device
diff --git a/include/linux/pinctrl/machine.h b/include/linux/pinctrl/machine.h
index 673e96df453b..2c178328c468 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -155,6 +155,9 @@ struct pinctrl_map;
 
 extern int pinctrl_register_mappings(const struct pinctrl_map *map,
 				     unsigned int num_maps);
+extern int devm_pinctrl_register_mappings(struct device *dev,
+					  const struct pinctrl_map *map,
+					  unsigned int num_maps);
 extern void pinctrl_unregister_mappings(const struct pinctrl_map *map);
 extern void pinctrl_provide_dummies(void);
 #else
@@ -165,6 +168,13 @@ static inline int pinctrl_register_mappings(const struct pinctrl_map *map,
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


