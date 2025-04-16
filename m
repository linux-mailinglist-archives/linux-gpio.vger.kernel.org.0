Return-Path: <linux-gpio+bounces-18957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A68BA905D4
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B829D461865
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31D91F872D;
	Wed, 16 Apr 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ib9hdrMJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55A18FDAF;
	Wed, 16 Apr 2025 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812499; cv=none; b=alN//QZz3VxlEZxdCCjpBNC4rNwjrhdvAvHqWDr4pwItBdeTeo/TIJalawMQdfNXTvBuKGwc1nrZajHjAD8V50FpnPFeXZVagR1SXC3E8komIkohP9OnL+fxQHUsuRpNxGfbzZnNO6oM/4wChvTcvpUapgWZMMKyYhgg6RsWJic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812499; c=relaxed/simple;
	bh=3tEp06k0wEFU951hwTqe5CHOYNIE2uuhh80QaVzlsXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oY0o93Z1ZEFGCIDjUKGXUUYY39XtY6IJiVkqua57zItPOxkWirNMUnMTJbyzYQ8gTB7jOgdtGuX5oOAgexKzNkY9atEsHyEACaMf5y7fnocyXqh+AaaeTAuN9WdXCfNcEXgMt7N4mUUuserVYADLVqK2jeS+ySE5BmdwB0sFWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ib9hdrMJ; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17B9643876;
	Wed, 16 Apr 2025 14:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=69QLjOXs+hUJARhcQJ5lp4MhpmN7/LQG4DVblLVj1gY=;
	b=Ib9hdrMJPx/Xi03FR5E8X172wHcX12lJ4sagkJ6DPZ1A3VP1Fh63FvHfFyCqhkq6mmi6fX
	VSSvO9ivD6rICPNb/7PNDCyFPckBnBu/NUg6O4npEfyvOoDp+dL9+e7PIktYZmxyNS7IAN
	6GSFbhV58LkmhKdTZNm6B23yjS9iU3SW4xRBDsw1syyK9ebNTtfXmdiNvPh4X3QVdxIIQa
	sbqNu7x1U09O5pdwUGgzUISWdaniiIO2wfj+w/SuIDtd5YFRB3U2vBi9ai/09OBM42J6CN
	oltSpMhhupiNHHx6SVPnm73LA/2SZMbzhn43vdwj8HOQILIYH2H/EmHBD4LL/w==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 16 Apr 2025 16:08:10 +0200
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
Message-Id: <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeiheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdtleemugdtgeejmeelieefrgemvdgvfhdumedujeeimeejsgegudemudhffheknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtleemugdtgeejmeelieefrgemvdgvfhdumedujeeimeejsgegudemudhffhekpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopefirghrhighrghnghesrggrvghonhdrtghomhdrthifpdhrt
 ghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhl
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


