Return-Path: <linux-gpio+bounces-19459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E12AEAA0E3E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 16:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B8FC8424B7
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 14:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9322D3A7B;
	Tue, 29 Apr 2025 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bnyEb3cr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971141DD0C7;
	Tue, 29 Apr 2025 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935715; cv=none; b=frNGJtq3wd9BkINRZ4Vf5TVDp0occVDa/nltXS0QpBLxoORFt96wx0vcKpTU6wUW38uVXiYXIStF8o4dNewpXgod4VX7fBT5BmMQS76LWG9MuuPTNXE2vrotFOlKYk+BJvfJqNsytDL0E9zZ/cGkhoNr8yHy6bPpa5oqfM3UbvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935715; c=relaxed/simple;
	bh=uKy3yKnK8gTbsGuoLSmXYvigxs7SNveqtOvAqFxa5Po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fp+xGHhH/g8hX810TPolJrlhJ4Id+PmkUC+lPn3dncSpGcSa0w/Ex9eyXiwwrcZJycYmwTy5ujqFn8Xhg/OFa+qTAbX7Yl3LH3DmXx7U5dQN8C5O5zvXzkn9nYfCv6lZJMtEFvLZLGG9om64DPOd/ziK9lI8ovx+o7w7ZxybAHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bnyEb3cr; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F08A438D0;
	Tue, 29 Apr 2025 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745935711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nb+ZL9QaUTOW5YTAIJEjr3XiNfs58UD3muAjIYGiBYo=;
	b=bnyEb3cruzUtsKS/VYbu1bITWOR4cwJ9830uNIMjdR+zGddOqdVhhyrtBJjuT4k33AolLT
	VLy7pUj9pKcqIuAk54qr2bFdgt2JDONoDhwQZTfCDWsKJCaDkbRViKiJrQjWcosVpCGjoC
	6JHb7ftgEGDKTvrOkxeWzyFiTOOziQaFzRwbFiB8u7p0Q4cuIqDVOUmMwsVFTDm5vWvyrs
	LnJWBZwXmbjRElCJQjk855wbC1gvipBK6v9nKiHr9YSNMGZUZPhWP+Z4uHo3MTo2nJ0ySG
	hJKe8rWyTkfz3T2lzjKoNM/zR39gvDrmuu9U55TLjF82VCioB2BTOoOToO3kDg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 29 Apr 2025 16:08:20 +0200
Subject: [PATCH v4 06/12] gpio: aggregator: refactor the forwarder
 registration part
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-aaeon-up-board-pinctrl-support-v4-6-b3fffc11417d@bootlin.com>
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

Add a new function gpiochip_fwd_register(), which finalizes the
initialization of the forwarder and registers the corresponding gpiochip.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 78bb84ca8a05..0bf73584df2a 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -565,6 +565,18 @@ static int gpiochip_fwd_gpio_add(struct gpiochip_fwd *fwd,
 	return 0;
 }
 
+static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
+{
+	struct gpio_chip *chip = &fwd->chip;
+
+	if (chip->can_sleep)
+		mutex_init(&fwd->mlock);
+	else
+		spin_lock_init(&fwd->slock);
+
+	return devm_gpiochip_add_data(chip->parent, chip, fwd);
+}
+
 /**
  * gpiochip_fwd_create() - Create a new GPIO forwarder
  * @dev: Parent device pointer
@@ -602,18 +614,13 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 			return ERR_PTR(error);
 	}
 
-	if (chip->can_sleep)
-		mutex_init(&fwd->mlock);
-	else
-		spin_lock_init(&fwd->slock);
-
 	if (features & FWD_FEATURE_DELAY) {
 		error = gpiochip_fwd_setup_delay_line(dev, chip, fwd);
 		if (error)
 			return ERR_PTR(error);
 	}
 
-	error = devm_gpiochip_add_data(dev, chip, fwd);
+	error = gpiochip_fwd_register(fwd);
 	if (error)
 		return ERR_PTR(error);
 

-- 
2.39.5


