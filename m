Return-Path: <linux-gpio+bounces-19689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C4AAC97A
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 17:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 689417B0AD5
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 15:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7557284690;
	Tue,  6 May 2025 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QT961ZCS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03F283C8D;
	Tue,  6 May 2025 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544897; cv=none; b=fuIaN/djLKeTvfOEYZAI89zugBBSFJFtZQ9uEeSyTQY/oKKWWWRl91LjfB/YLQ4ZrSPU9yymjzThnAbETlaSrxtTdAgJne2CGUV84vdwx4enjL7v9JSt0NkBLUQOsG/06X1XGF0f+ldOF/99zZ8g+0JmuX14LXy2WTDGNSo6Ex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544897; c=relaxed/simple;
	bh=w4N7KqRA8Nlo0iFeeW1pPDRKcPmWnBcx7ukfAQkiz5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EMYLmpnaRXDDNXplFDxNnunoj8jKE80pFfYVVtSFQ+JzCAmx0RTSbP5CcLv5BMbh0/T4pu8qcya2LNcglu+XWndwVFa3IxQcT4NvJuAxh8qH6gvwhM2VU3onyOe+yW+tiXj7EZSfyH8WsxHgNfAq3SGYeLMSPW0RcE6erALsFZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QT961ZCS; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F0AB43B3A;
	Tue,  6 May 2025 15:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746544887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uG8S/JidauisAuQdchy3W96wedqpyUbkFYJXuGX6xqw=;
	b=QT961ZCSK1vzKE4MYo6VfI2fkXTQNqHm+N4u5BPjJqkOB+yTPGbF8uu8aywL5jT+QvLkeW
	PZ53zwvY/bv2yrakKIJrEN5uTE8oQPKBDH//ro4T+tT6e8OyEh3Nn6eV5ExFdQ6+W94Yfy
	KebmXR6pM63cIaDjvRgrLIAtRw5xAvjlAcJndivGhntsqH+KIa+gasP+whk7fznEwkT3Jw
	rWspkwiWSm5AMk4J3+5geX+XukMBxO6+rq00EmZ/s/WQCt0hEZ+5zwP4DQfZAaWDeaHENE
	l6LtyFozZc6ccpbIINjOVFRKTErjejpWOJQUV1ijWBdX8DOGVBILjxDBFD8Vlw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 06 May 2025 17:21:22 +0200
Subject: [PATCH v5 04/12] gpio: aggregator: move GPIO forwarder allocation
 in a dedicated function
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-aaeon-up-board-pinctrl-support-v5-4-3906529757d2@bootlin.com>
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

Move the GPIO forwarder allocation and static initialization in a dedicated
function.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 47 ++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index d232ea865356..4268ef94914d 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -498,6 +498,36 @@ static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *c
 }
 #endif	/* !CONFIG_OF_GPIO */
 
+static struct gpiochip_fwd *
+devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
+{
+	const char *label = dev_name(dev);
+	struct gpiochip_fwd *fwd;
+	struct gpio_chip *chip;
+
+	fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)), GFP_KERNEL);
+	if (!fwd)
+		return ERR_PTR(-ENOMEM);
+
+	chip = &fwd->chip;
+
+	chip->label = label;
+	chip->parent = dev;
+	chip->owner = THIS_MODULE;
+	chip->get_direction = gpio_fwd_get_direction;
+	chip->direction_input = gpio_fwd_direction_input;
+	chip->direction_output = gpio_fwd_direction_output;
+	chip->get = gpio_fwd_get;
+	chip->get_multiple = gpio_fwd_get_multiple_locked;
+	chip->set_rv = gpio_fwd_set;
+	chip->set_multiple_rv = gpio_fwd_set_multiple_locked;
+	chip->to_irq = gpio_fwd_to_irq;
+	chip->base = -1;
+	chip->ngpio = ngpios;
+
+	return fwd;
+}
+
 /**
  * gpiochip_fwd_create() - Create a new GPIO forwarder
  * @dev: Parent device pointer
@@ -518,14 +548,12 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 						struct gpio_desc *descs[],
 						unsigned long features)
 {
-	const char *label = dev_name(dev);
 	struct gpiochip_fwd *fwd;
 	struct gpio_chip *chip;
 	unsigned int i;
 	int error;
 
-	fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)),
-			   GFP_KERNEL);
+	fwd = devm_gpiochip_fwd_alloc(dev, ngpios);
 	if (!fwd)
 		return ERR_PTR(-ENOMEM);
 
@@ -549,19 +577,6 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 			chip->set_config = gpio_fwd_set_config;
 	}
 
-	chip->label = label;
-	chip->parent = dev;
-	chip->owner = THIS_MODULE;
-	chip->get_direction = gpio_fwd_get_direction;
-	chip->direction_input = gpio_fwd_direction_input;
-	chip->direction_output = gpio_fwd_direction_output;
-	chip->get = gpio_fwd_get;
-	chip->get_multiple = gpio_fwd_get_multiple_locked;
-	chip->set_rv = gpio_fwd_set;
-	chip->set_multiple_rv = gpio_fwd_set_multiple_locked;
-	chip->to_irq = gpio_fwd_to_irq;
-	chip->base = -1;
-	chip->ngpio = ngpios;
 	fwd->descs = descs;
 
 	if (chip->can_sleep)

-- 
2.39.5


