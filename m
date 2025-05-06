Return-Path: <linux-gpio+bounces-19688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C7AAC954
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 17:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76AC198260E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 15:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3CF284677;
	Tue,  6 May 2025 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nnkmRuVY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CD1283C94;
	Tue,  6 May 2025 15:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544897; cv=none; b=k5WCRZGl2Xa8Wqf9RH12Hx4GKZjKtThWqbZGU2aiWh8cSffDGgUeaG/cWKvm+olEocKAJ1+WslH+1F/zBM3fYd0Zm+qexSHp+DPWE8e6z2+DrJLNedVTKVFEQz+frGtAyefaSYi0uv9ONRjGcKrQl7/q2V+h8nlFSG/0QSmbfk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544897; c=relaxed/simple;
	bh=LM2iFEgMbtNke6NMYAqnjE4d+/qvxBKcq5oPNLRfjA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fy/d7SG3fz0GYUDOEzNoXv7WXpfa8kdANSz21oZuGYpy0iVBzbXldFXuBM5AzYoO6AY44AMSxSz5tg2vRDy40NH0wxGHPP2UbpOiz9je2I052TOiRs5hyA1cxnVZa2CV+ydNCL37xql7mWg1ETHJC1vd5XugtmbUdXV1bsPTxhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nnkmRuVY; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0D0A43B27;
	Tue,  6 May 2025 15:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746544887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CvPjKxjylgfhC14NcJPCUvKX8Z1QrI+WRe+JS+bhNVM=;
	b=nnkmRuVYT0l4wYYi4JuZMftHQmT1K7YQSlMY1DlwI9D+BlEpIUTPjRzEovxTtXB3YlZ8x7
	hH/GbQpxbAfhaswec9u1kvALPuUrPMBkWwyPGMz/j1cEYyqdHY7cAYdR43MJUEp5nIa/Mg
	RzwK8wS3HKq9vSBF5QJ8sbNIwRPdNo/LRRt0GPEZRFrN2lJ26TV/CWPzL0UySD9Ro4kJOq
	UCNHFnmPbpfLJtLashPyYmWmehBPDAThSIR+LQMsutPJDJbojdCPhtxQaqlUdZouWmNwWJ
	kiTEJFP6vCb+g7xd5nRqWKCh/YPSHm3socoyF5dq3EXWlD4yO5z6T6hBpsS0sw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 06 May 2025 17:21:21 +0200
Subject: [PATCH v5 03/12] pinctrl: core: add
 devm_pinctrl_register_mappings()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-aaeon-up-board-pinctrl-support-v5-3-3906529757d2@bootlin.com>
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeegfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvt
 ghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
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
index 93aceb92681b..00c196061605 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -149,11 +149,15 @@ struct pinctrl_map {
 #define PIN_MAP_CONFIGS_GROUP_HOG_DEFAULT(dev, grp, cfgs)		\
 	PIN_MAP_CONFIGS_GROUP(dev, PINCTRL_STATE_DEFAULT, dev, grp, cfgs)
 
+struct device;
 struct pinctrl_map;
 
 #ifdef CONFIG_PINCTRL
 
 int pinctrl_register_mappings(const struct pinctrl_map *map, unsigned int num_maps);
+int devm_pinctrl_register_mappings(struct device *dev,
+				   const struct pinctrl_map *map,
+				   unsigned int num_maps);
 void pinctrl_unregister_mappings(const struct pinctrl_map *map);
 void pinctrl_provide_dummies(void);
 #else
@@ -164,6 +168,13 @@ static inline int pinctrl_register_mappings(const struct pinctrl_map *map,
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


