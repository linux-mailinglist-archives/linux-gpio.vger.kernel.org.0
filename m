Return-Path: <linux-gpio+bounces-17696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FB0A655EE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 16:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CC183B8E45
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 15:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150AD24A078;
	Mon, 17 Mar 2025 15:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jPC0DvyQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EB2248872;
	Mon, 17 Mar 2025 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225904; cv=none; b=r6wmOUPrdOhhaUwWGGygHjL8Nm+PrDzabjhIl23r7ZBgcUu63oWIllhVRy89FaYnAFqIaXSrEmEkFNkrl+ftwdcN3pBftBa1yqnQmjzIMQJ0hZa6UIUpu5XaRg/gMFy00Rp5Ee4TNHb64OT5bhsnIl+PyvAprux9s/6zqr6IaMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225904; c=relaxed/simple;
	bh=7KArgFaaKI1+e5MR2ZYKbBC06YfRSX5pNbBaEm35TuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iz+s5qHcVJ3AUA6j4NEYbSYyYA0aN9Y0quzVsTMCTyfqGGJQDFxsOzappyAc+UDUylrUu2fB7SkH1siAyjzTlB5YN0Rmb91ot07oazf6YniKvjKqgC+rRzyVWpgibKsApyXQl1lHoFIcMWg9yWFhXFmloDo2QBidFgLFg5p5v90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jPC0DvyQ; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B88672058E;
	Mon, 17 Mar 2025 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742225901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DgINo7HEgsvBFVcZUlOn/x84SJEPQBLA8ZPb+VkgLTk=;
	b=jPC0DvyQkcZwBn/deYFNoXxTg7aIbY0LM8xFhrvo1fHRCIopDeiIpjxcUGUE/YyKfTDHkQ
	L4eNmry2Y9LNtKy19anUsCVitPsWgn/gq0wrYN4mFmMq7UVCL6w+oMncXkXzQVRFdpVWUn
	rRIXoBQHTRA+U8+D47RsNZW7xe23kZbpGwcf+o8fVbHpurRBKwb//lBOKQz0w0b6ITzrXv
	POpG7L8tJI3/dg9ZRAmxLIq87BpfSR2lwMXlD/17KiZNlH/L5VUXWdsRhvwx09cQY5z4Qu
	bF5kMpqxkv4gWpWjSAPZ9EtbNWK18U+ddz13xYTiTDjF2nhrtb4hdtEa9A6bag==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 17 Mar 2025 16:38:03 +0100
Subject: [PATCH RFC v2 5/6] gpio: aggregator: add possibility to attach
 data to the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-aaeon-up-board-pinctrl-support-v2-5-36126e30aa62@bootlin.com>
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
In-Reply-To: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijhesl
 hhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtohepifgrrhihhggrnhhgsegrrggvohhnrdgtohhmrdhtfi
X-GND-Sasl: thomas.richard@bootlin.com

Add a data pointer to store private data in the forwarder.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 6 ++++--
 include/linux/gpio/gpio-fwd.h  | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index b9026ff2bfdc1..3c78c47ce40ae 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -556,7 +556,7 @@ int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
 }
 EXPORT_SYMBOL_GPL(gpiochip_fwd_add_gpio_desc);
 
-int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
+int gpiochip_fwd_register(struct gpiochip_fwd *fwd, void *data)
 {
 	struct gpio_chip *chip = &fwd->chip;
 	struct device *dev = fwd->dev;
@@ -579,6 +579,8 @@ int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 	else
 		spin_lock_init(&fwd->slock);
 
+	fwd->data = data;
+
 	error = devm_gpiochip_add_data(dev, chip, fwd);
 
 	return error;
@@ -625,7 +627,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 			return ERR_PTR(error);
 	}
 
-	error = gpiochip_fwd_register(fwd);
+	error = gpiochip_fwd_register(fwd, NULL);
 	if (error)
 		return ERR_PTR(error);
 
diff --git a/include/linux/gpio/gpio-fwd.h b/include/linux/gpio/gpio-fwd.h
index 80ec34ee282fc..c242cc1888180 100644
--- a/include/linux/gpio/gpio-fwd.h
+++ b/include/linux/gpio/gpio-fwd.h
@@ -10,6 +10,7 @@ struct gpiochip_fwd_timing {
 struct gpiochip_fwd {
 	struct device *dev;
 	struct gpio_chip chip;
+	void *data;
 	struct gpio_desc **descs;
 	union {
 		struct mutex mlock;	/* protects tmp[] if can_sleep */
@@ -50,6 +51,6 @@ int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd,
 			       struct gpio_desc *desc,
 			       unsigned int offset);
 
-int gpiochip_fwd_register(struct gpiochip_fwd *fwd);
+int gpiochip_fwd_register(struct gpiochip_fwd *fwd, void *data);
 
 #endif

-- 
2.39.5


