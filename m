Return-Path: <linux-gpio+bounces-25825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D117B4FAD1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 14:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86DF67A22DB
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 12:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72ECC334392;
	Tue,  9 Sep 2025 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gw2G2OzH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C67B23ABB3
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420934; cv=none; b=ZUXwmY0D/EQ+WHE2XZBqlKyrq9p727LQlcHEpg0+5FS3SzmL18XIVSl2I1fiuZ/NCLLrTHztYyQaEi+UGzB6ky9Ro2/gcsjZjse/Ir3J5KolBr/UQbVbUQJ4qgpcb4evoELtNwHxbaIqX3bp6Ui5MfBnWZrH1aTKZR76pZmDDCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420934; c=relaxed/simple;
	bh=ezEJnI3SwZsre2ee+xoZMAwqvzODmNkSeY7tjhGHAFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z5mQygUpRmH6wJnt+KZK0KxnMoXW+Dtx+Cm6i0gVNyHHHSSj64b/AiS8zgDoHEBuC2gEC8nbOiaVQhLqRYbAkDGBKkiWYbo+qSLw4wRZGOnx0V9DpTcBzEYK7lQ5OIQi/pe7JiIc2Abghmg5e8wgt19ixWwP4voOWNqS/8vkjUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gw2G2OzH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so34115595e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757420929; x=1758025729; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qb5FRnhlRCoQ3+qlFKt5O0IjptZI1+S2TMCDEjTQCE4=;
        b=Gw2G2OzHKXQjZwtDH9quxOmRaNaNizB4LJ5GqiIbig5wyHBeXY4HnkYAkAnCEpXOro
         UJ+dKyEfwjSKTwzF23JNBrJn64h70RZcR0a65GLZ/7GRpEVL6ffgFnoYsdLEjlK8VDd2
         r1pMooNcvIiDiCU2yrGFH2gdfYMHIghAuMz6XteSX4B1SYNfft7aVf+TIaJW58P4XECk
         ALCZj6XErYStO8CWQTL6h35s/Vo+t1sgoxSq/i3FumiN17A4fQcC/IdUEBQq4ahYaGtr
         boPSaYrjn6b12XeHDL6IfVMatSnzjvOA+qNEPCxYtrp6Xiuk4FAi3SMqbWEF3yxONvV8
         uORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420929; x=1758025729;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qb5FRnhlRCoQ3+qlFKt5O0IjptZI1+S2TMCDEjTQCE4=;
        b=GtXw2HNZskpslDtvWETGfCTemiCFo2/kUcqhZaPbr8uC+vd6l9rbiTqPBqAGz4cu8v
         njCEsgLnAf33s/BHnYqSlAy/CwpvYUSRc4/SnRflca/GoSQQlzXBQYQTxi8MoD3rH/Sv
         kQeUX5vaCes+bdrbqdQ/cYwqsHur9cee/nn0AgVMq/fliCQ0fr03JdmrfrWdd/k8I8qV
         UnWytudLsP6J0Dk4fpln09dlW0MONXQ7cw1LpOhcVFhrVM3aXSSOjy4t387wvk9MRA5s
         a6nim/BLOAA1CiJA/MeWfZvllrIXfpeSUN2mWOefytzWifxWLdKlKWpTUtXvFjRcnpy2
         mUYA==
X-Gm-Message-State: AOJu0YyjhKmtf1FKaC8FXFEaN/tEiVlzlNyuk3H4yO85gIUWLGTrltz5
	kGyE4pJl2UdHsYSp+Bgrjq2VKn4e5rdXoAgMRgPAIXpOWkT+AwIq3S6sSNEvHHi4PII=
X-Gm-Gg: ASbGncv5kht3MayZ1oF0oxt2ELGVPxYWUCJpLLi7B+eekOcBZFxt2kBZ46U9x9tkYsl
	5hMGhiJA5AdAJ3JphmKQjEYHBvgIYTMLzpnz9vFnqdOpJGenrF/7YKFCkHB/uGlnW6vO1qhwu3k
	OYLPtUD7cNwV/YwdpBa0QnuPnx3H9nR7UuO50vwAMASCmrY/PO7j4gNdisd1T12X3DPE8LdUGjq
	pRZZMktZO6R+7ugMYSefVsLkEkpWMFhJArRZ//aB6v4A30npMBWWZh4FXFsTTH1qKtOciCOIm3+
	H/XUmE0Q90zSxeW+whDiXfEsgS4rudcbI7E7tqIMIqM+GGw7y7oo0vxg7wCDXAktv4ecXVUOZEz
	EJMMMVaA6lDP1d5qss5PPdtM11ArP
X-Google-Smtp-Source: AGHT+IElJ0tENtrH0HdLsHJk/FjxEHiEF7YjHkdnEYHJUj/r/XeOuRddtns+wip00O9AsYOb+/D+hw==
X-Received: by 2002:a05:600c:1993:b0:45d:db2a:ce30 with SMTP id 5b1f17b1804b1-45ddde0d828mr100996465e9.0.1757420928729;
        Tue, 09 Sep 2025 05:28:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd3aadbcesm213049775e9.17.2025.09.09.05.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:28:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 14:28:43 +0200
Subject: [PATCH] gpiolib: add a common prefix to GPIO descriptor flags
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-rename-gpio-flags-v1-1-bda208a40856@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHodwGgC/x3MQQqAIBBA0avIrBuwwMquEi2sRhsokxEiiO6et
 HyL/x/IJEwZBvWA0MWZz1hQVwqWzcVAyGsxNLox2mqLQtEdhCHxiX53IaOxvnfd7Fu9GihdEvJ
 8/89xet8P4wncdGMAAAA=
X-Change-ID: 20250909-rename-gpio-flags-59f8a7bf60d5
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=40092;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=f1N5EW/6KDdp2QYMBemD7QhTTzeeqxftz41o9qbYAQg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowB1/lLWLmZpa1FfilW+88/tNNePx76oOBJHaY
 9vYUBf2+26JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMAdfwAKCRARpy6gFHHX
 co8WD/4q/EGUzKCoKN4Dqn9arqbROgadfcuthkJi/PLuvw33uuzaal/bSMvbAx+nkTIBZss+w/D
 jSWRUQw1c4GN8kqi2EmYJP9qZgs5Pv/344aPeSLJgsljV6+ZvaNpfVQWJeQ/e4kaeXdUJMIM4Uo
 SDECNYg0yNJwcog733HEbocPF8NBzxCyLaDtjmYzWSGxWWjYBv+Dk0D6rQhPMPtDzHsuExwotBw
 epQj28MmifCsrAuMctI6a47o2FmCi0GVicXJfsPtx5PWj0/AwyBmZ1lePkw7GNs2LB4wklNUwB8
 ZKs4NmaNXbhSv02b0GJCY9wh+RD8XQkVI4h6jfEgcl8rqfl/YAcW8cpWKmKnFV8kT4H2WarBFoY
 /wi6La4Yv/Hui1zESO1KBe+efXQ8WHke0BDpreurrXeU0AJH8PfaWhCBdE3IisQue54Ym3quYb8
 tOFuzCve1ZmpbxqLCthWs2UdGxqJzKwTtlxoDdRmU7zfiK4Bl42AOACy7VDw879cS71owYbxDwB
 oxdEYx3VR2hsLaPOa5uoqsOGfFrXGoYD5CDn1ntGdMaXjE8Qtj+m24BeyNPyQgFy1j6r3wXgHG1
 6lyvWN5s2JkIcKB/EiGhkzwVteRlLa6bmOFCZ2V8keia4F1P2zVFcMMCeL/ASpRWEyie8IHcrK4
 rZYtsJX7OAfOnMQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While these flags are private within drivers/gpio/, when looking at the
code, it's not really clear they are GPIO-specific. Since these are GPIO
descriptor flags, prepend their names with a common "GPIOD" prefix.

While at it: update the flags' docs: make spelling consistent, correct
outdated information, etc.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c  |  90 +++++++++++------------
 drivers/gpio/gpiolib-of.c    |   2 +-
 drivers/gpio/gpiolib-sysfs.c |  46 ++++++------
 drivers/gpio/gpiolib.c       | 166 +++++++++++++++++++++----------------------
 drivers/gpio/gpiolib.h       |  36 +++++-----
 5 files changed, 170 insertions(+), 170 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e6a289fa0f8fd5edb3b180ef668ac8777e3dac86..175836467f216ae372a2cb6e2cd68c7867534938 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -144,17 +144,17 @@ static void linehandle_flags_to_desc_flags(u32 lflags, unsigned long *flagsp)
 {
 	unsigned long flags = READ_ONCE(*flagsp);
 
-	assign_bit(FLAG_ACTIVE_LOW, &flags,
+	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
 		   lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
-	assign_bit(FLAG_OPEN_DRAIN, &flags,
+	assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags,
 		   lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
-	assign_bit(FLAG_OPEN_SOURCE, &flags,
+	assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags,
 		   lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
-	assign_bit(FLAG_PULL_UP, &flags,
+	assign_bit(GPIOD_FLAG_PULL_UP, &flags,
 		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
-	assign_bit(FLAG_PULL_DOWN, &flags,
+	assign_bit(GPIOD_FLAG_PULL_DOWN, &flags,
 		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
-	assign_bit(FLAG_BIAS_DISABLE, &flags,
+	assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags,
 		   lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
 
 	WRITE_ONCE(*flagsp, flags);
@@ -238,7 +238,7 @@ static long linehandle_ioctl(struct file *file, unsigned int cmd,
 		 * All line descriptors were created at once with the same
 		 * flags so just check if the first one is really output.
 		 */
-		if (!test_bit(FLAG_IS_OUT, &lh->descs[0]->flags))
+		if (!test_bit(GPIOD_FLAG_IS_OUT, &lh->descs[0]->flags))
 			return -EPERM;
 
 		if (copy_from_user(&ghd, ip, sizeof(ghd)))
@@ -599,10 +599,10 @@ static void linereq_put_event(struct linereq *lr,
 
 static u64 line_event_timestamp(struct line *line)
 {
-	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
+	if (test_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
 		return ktime_get_real_ns();
 	else if (IS_ENABLED(CONFIG_HTE) &&
-		 test_bit(FLAG_EVENT_CLOCK_HTE, &line->desc->flags))
+		 test_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &line->desc->flags))
 		return line->timestamp_ns;
 
 	return ktime_get_ns();
@@ -725,11 +725,11 @@ static int hte_edge_setup(struct line *line, u64 eflags)
 	struct hte_ts_desc *hdesc = &line->hdesc;
 
 	if (eflags & GPIO_V2_LINE_FLAG_EDGE_RISING)
-		flags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
+		flags |= test_bit(GPIOD_FLAG_ACTIVE_LOW, &line->desc->flags) ?
 				 HTE_FALLING_EDGE_TS :
 				 HTE_RISING_EDGE_TS;
 	if (eflags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
-		flags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
+		flags |= test_bit(GPIOD_FLAG_ACTIVE_LOW, &line->desc->flags) ?
 				 HTE_RISING_EDGE_TS :
 				 HTE_FALLING_EDGE_TS;
 
@@ -831,7 +831,7 @@ static bool debounced_value(struct line *line)
 	 */
 	value = READ_ONCE(line->level);
 
-	if (test_bit(FLAG_ACTIVE_LOW, &line->desc->flags))
+	if (test_bit(GPIOD_FLAG_ACTIVE_LOW, &line->desc->flags))
 		value = !value;
 
 	return value;
@@ -939,7 +939,7 @@ static int debounce_setup(struct line *line, unsigned int debounce_period_us)
 			return level;
 
 		if (!(IS_ENABLED(CONFIG_HTE) &&
-		      test_bit(FLAG_EVENT_CLOCK_HTE, &line->desc->flags))) {
+		      test_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &line->desc->flags))) {
 			irq = gpiod_to_irq(line->desc);
 			if (irq < 0)
 				return -ENXIO;
@@ -1061,10 +1061,10 @@ static int edge_detector_setup(struct line *line,
 		return -ENXIO;
 
 	if (eflags & GPIO_V2_LINE_FLAG_EDGE_RISING)
-		irqflags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
+		irqflags |= test_bit(GPIOD_FLAG_ACTIVE_LOW, &line->desc->flags) ?
 			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
 	if (eflags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
-		irqflags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
+		irqflags |= test_bit(GPIOD_FLAG_ACTIVE_LOW, &line->desc->flags) ?
 			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
 	irqflags |= IRQF_ONESHOT;
 
@@ -1237,34 +1237,34 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 lflags,
 {
 	unsigned long flags = READ_ONCE(*flagsp);
 
-	assign_bit(FLAG_ACTIVE_LOW, &flags,
+	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
 		   lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
 
 	if (lflags & GPIO_V2_LINE_FLAG_OUTPUT)
-		set_bit(FLAG_IS_OUT, &flags);
+		set_bit(GPIOD_FLAG_IS_OUT, &flags);
 	else if (lflags & GPIO_V2_LINE_FLAG_INPUT)
-		clear_bit(FLAG_IS_OUT, &flags);
+		clear_bit(GPIOD_FLAG_IS_OUT, &flags);
 
-	assign_bit(FLAG_EDGE_RISING, &flags,
+	assign_bit(GPIOD_FLAG_EDGE_RISING, &flags,
 		   lflags & GPIO_V2_LINE_FLAG_EDGE_RISING);
-	assign_bit(FLAG_EDGE_FALLING, &flags,
+	assign_bit(GPIOD_FLAG_EDGE_FALLING, &flags,
 		   lflags & GPIO_V2_LINE_FLAG_EDGE_FALLING);
 
-	assign_bit(FLAG_OPEN_DRAIN, &flags,
+	assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags,
 		   lflags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
-	assign_bit(FLAG_OPEN_SOURCE, &flags,
+	assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags,
 		   lflags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
 
-	assign_bit(FLAG_PULL_UP, &flags,
+	assign_bit(GPIOD_FLAG_PULL_UP, &flags,
 		   lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
-	assign_bit(FLAG_PULL_DOWN, &flags,
+	assign_bit(GPIOD_FLAG_PULL_DOWN, &flags,
 		   lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
-	assign_bit(FLAG_BIAS_DISABLE, &flags,
+	assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags,
 		   lflags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
 
-	assign_bit(FLAG_EVENT_CLOCK_REALTIME, &flags,
+	assign_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags,
 		   lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
-	assign_bit(FLAG_EVENT_CLOCK_HTE, &flags,
+	assign_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags,
 		   lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE);
 
 	WRITE_ONCE(*flagsp, flags);
@@ -2115,10 +2115,10 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	}
 
 	if (eflags & GPIOEVENT_REQUEST_RISING_EDGE)
-		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
+		irqflags |= test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
 	if (eflags & GPIOEVENT_REQUEST_FALLING_EDGE)
-		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
+		irqflags |= test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
 	irqflags |= IRQF_ONESHOT;
 
@@ -2253,7 +2253,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 
 	scoped_guard(srcu, &desc->gdev->desc_srcu) {
 		label = gpiod_get_label(desc);
-		if (label && test_bit(FLAG_REQUESTED, &dflags))
+		if (label && test_bit(GPIOD_FLAG_REQUESTED, &dflags))
 			strscpy(info->consumer, label,
 				sizeof(info->consumer));
 	}
@@ -2270,10 +2270,10 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	 * The definitive test that a line is available to userspace is to
 	 * request it.
 	 */
-	if (test_bit(FLAG_REQUESTED, &dflags) ||
-	    test_bit(FLAG_IS_HOGGED, &dflags) ||
-	    test_bit(FLAG_EXPORT, &dflags) ||
-	    test_bit(FLAG_SYSFS, &dflags) ||
+	if (test_bit(GPIOD_FLAG_REQUESTED, &dflags) ||
+	    test_bit(GPIOD_FLAG_IS_HOGGED, &dflags) ||
+	    test_bit(GPIOD_FLAG_EXPORT, &dflags) ||
+	    test_bit(GPIOD_FLAG_SYSFS, &dflags) ||
 	    !gpiochip_line_is_valid(guard.gc, info->offset)) {
 		info->flags |= GPIO_V2_LINE_FLAG_USED;
 	} else if (!atomic) {
@@ -2281,34 +2281,34 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 			info->flags |= GPIO_V2_LINE_FLAG_USED;
 	}
 
-	if (test_bit(FLAG_IS_OUT, &dflags))
+	if (test_bit(GPIOD_FLAG_IS_OUT, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_OUTPUT;
 	else
 		info->flags |= GPIO_V2_LINE_FLAG_INPUT;
 
-	if (test_bit(FLAG_ACTIVE_LOW, &dflags))
+	if (test_bit(GPIOD_FLAG_ACTIVE_LOW, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
 
-	if (test_bit(FLAG_OPEN_DRAIN, &dflags))
+	if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
-	if (test_bit(FLAG_OPEN_SOURCE, &dflags))
+	if (test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
 
-	if (test_bit(FLAG_BIAS_DISABLE, &dflags))
+	if (test_bit(GPIOD_FLAG_BIAS_DISABLE, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
-	if (test_bit(FLAG_PULL_DOWN, &dflags))
+	if (test_bit(GPIOD_FLAG_PULL_DOWN, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
-	if (test_bit(FLAG_PULL_UP, &dflags))
+	if (test_bit(GPIOD_FLAG_PULL_UP, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
 
-	if (test_bit(FLAG_EDGE_RISING, &dflags))
+	if (test_bit(GPIOD_FLAG_EDGE_RISING, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_EDGE_RISING;
-	if (test_bit(FLAG_EDGE_FALLING, &dflags))
+	if (test_bit(GPIOD_FLAG_EDGE_FALLING, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
 
-	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &dflags))
+	if (test_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
-	else if (test_bit(FLAG_EVENT_CLOCK_HTE, &dflags))
+	else if (test_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE;
 
 	debounce_period_us = READ_ONCE(desc->debounce_period_us);
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 37ab78243faba2feefb36b7edc53598021543295..fad4edf9cc5c0c0469795b2069565e73e0d9c9ef 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -878,7 +878,7 @@ static void of_gpiochip_remove_hog(struct gpio_chip *chip,
 {
 	struct gpio_desc *desc;
 
-	for_each_gpio_desc_with_flag(chip, desc, FLAG_IS_HOGGED)
+	for_each_gpio_desc_with_flag(chip, desc, GPIOD_FLAG_IS_HOGGED)
 		if (READ_ONCE(desc->hog) == hog)
 			gpiochip_free_own_desc(desc);
 }
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index b64106f1cb7b90ac2c3595c5d1101cba93fa0e6a..9a849245b35880b66afeb042a8bb25520279e9a7 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -131,7 +131,7 @@ static ssize_t direction_show(struct device *dev,
 
 	scoped_guard(mutex, &data->mutex) {
 		gpiod_get_direction(desc);
-		value = !!test_bit(FLAG_IS_OUT, &desc->flags);
+		value = !!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
 	}
 
 	return sysfs_emit(buf, "%s\n", value ? "out" : "in");
@@ -226,14 +226,14 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 
 	irq_flags = IRQF_SHARED;
 	if (flags & GPIO_IRQF_TRIGGER_FALLING) {
-		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
+		irq_flags |= test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags) ?
 				IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
-		set_bit(FLAG_EDGE_FALLING, &desc->flags);
+		set_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
 	}
 	if (flags & GPIO_IRQF_TRIGGER_RISING) {
-		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
+		irq_flags |= test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags) ?
 				IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
-		set_bit(FLAG_EDGE_RISING, &desc->flags);
+		set_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
 	}
 
 	/*
@@ -260,8 +260,8 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 err_unlock:
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 err_clr_bits:
-	clear_bit(FLAG_EDGE_RISING, &desc->flags);
-	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
+	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
+	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
 
 	return ret;
 }
@@ -281,8 +281,8 @@ static void gpio_sysfs_free_irq(struct gpiod_data *data)
 	data->irq_flags = 0;
 	free_irq(data->irq, data);
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
-	clear_bit(FLAG_EDGE_RISING, &desc->flags);
-	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
+	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
+	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
 }
 
 static const char *const trigger_names[] = {
@@ -347,10 +347,10 @@ static int gpio_sysfs_set_active_low(struct gpiod_data *data, int value)
 	struct gpio_desc *desc = data->desc;
 	int status = 0;
 
-	if (!!test_bit(FLAG_ACTIVE_LOW, &desc->flags) == !!value)
+	if (!!test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags) == !!value)
 		return 0;
 
-	assign_bit(FLAG_ACTIVE_LOW, &desc->flags, value);
+	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags, value);
 
 	/* reconfigure poll(2) support if enabled on one edge only */
 	if (flags == GPIO_IRQF_TRIGGER_FALLING ||
@@ -373,7 +373,7 @@ static ssize_t active_low_show(struct device *dev,
 	int value;
 
 	scoped_guard(mutex, &data->mutex)
-		value = !!test_bit(FLAG_ACTIVE_LOW, &desc->flags);
+		value = !!test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags);
 
 	return sysfs_emit(buf, "%d\n", value);
 }
@@ -418,7 +418,7 @@ static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 			mode = 0;
 
 		if (!data->direction_can_change &&
-		    test_bit(FLAG_IS_OUT, &data->desc->flags))
+		    test_bit(GPIOD_FLAG_IS_OUT, &data->desc->flags))
 			mode = 0;
 #endif /* CONFIG_GPIO_SYSFS_LEGACY */
 	}
@@ -486,7 +486,7 @@ static int export_gpio_desc(struct gpio_desc *desc)
 	}
 
 	/*
-	 * No extra locking here; FLAG_SYSFS just signifies that the
+	 * No extra locking here; GPIOD_FLAG_SYSFS just signifies that the
 	 * request and export were done by on behalf of userspace, so
 	 * they may be undone on its behalf too.
 	 */
@@ -505,7 +505,7 @@ static int export_gpio_desc(struct gpio_desc *desc)
 	if (ret < 0) {
 		gpiod_free(desc);
 	} else {
-		set_bit(FLAG_SYSFS, &desc->flags);
+		set_bit(GPIOD_FLAG_SYSFS, &desc->flags);
 		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
 	}
 
@@ -515,11 +515,11 @@ static int export_gpio_desc(struct gpio_desc *desc)
 static int unexport_gpio_desc(struct gpio_desc *desc)
 {
 	/*
-	 * No extra locking here; FLAG_SYSFS just signifies that the
+	 * No extra locking here; GPIOD_FLAG_SYSFS just signifies that the
 	 * request and export were done by on behalf of userspace, so
 	 * they may be undone on its behalf too.
 	 */
-	if (!test_and_clear_bit(FLAG_SYSFS, &desc->flags))
+	if (!test_and_clear_bit(GPIOD_FLAG_SYSFS, &desc->flags))
 		return -EINVAL;
 
 	gpiod_unexport(desc);
@@ -748,14 +748,14 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	if (!guard.gc)
 		return -ENODEV;
 
-	if (test_and_set_bit(FLAG_EXPORT, &desc->flags))
+	if (test_and_set_bit(GPIOD_FLAG_EXPORT, &desc->flags))
 		return -EPERM;
 
 	gdev = desc->gdev;
 
 	guard(mutex)(&sysfs_lock);
 
-	if (!test_bit(FLAG_REQUESTED, &desc->flags)) {
+	if (!test_bit(GPIOD_FLAG_REQUESTED, &desc->flags)) {
 		gpiod_dbg(desc, "%s: unavailable (not requested)\n", __func__);
 		status = -EPERM;
 		goto err_clear_bit;
@@ -866,7 +866,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 #endif /* CONFIG_GPIO_SYSFS_LEGACY */
 	kfree(desc_data);
 err_clear_bit:
-	clear_bit(FLAG_EXPORT, &desc->flags);
+	clear_bit(GPIOD_FLAG_EXPORT, &desc->flags);
 	gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 	return status;
 }
@@ -937,7 +937,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 	}
 
 	scoped_guard(mutex, &sysfs_lock) {
-		if (!test_bit(FLAG_EXPORT, &desc->flags))
+		if (!test_bit(GPIOD_FLAG_EXPORT, &desc->flags))
 			return;
 
 		gdev = gpiod_to_gpio_device(desc);
@@ -956,7 +956,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 			return;
 
 		list_del(&desc_data->list);
-		clear_bit(FLAG_EXPORT, &desc->flags);
+		clear_bit(GPIOD_FLAG_EXPORT, &desc->flags);
 #if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 		sysfs_put(desc_data->value_kn);
 		device_unregister(desc_data->dev);
@@ -1073,7 +1073,7 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 		return;
 
 	/* unregister gpiod class devices owned by sysfs */
-	for_each_gpio_desc_with_flag(chip, desc, FLAG_SYSFS) {
+	for_each_gpio_desc_with_flag(chip, desc, GPIOD_FLAG_SYSFS) {
 		gpiod_unexport(desc);
 		gpiod_free(desc);
 	}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 98d2fa602490566b0c78ba0171297ed2ec11e393..01bdf8fad7cff6c507e79b8880e9335d7ee53173 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -127,10 +127,10 @@ const char *gpiod_get_label(struct gpio_desc *desc)
 	label = srcu_dereference_check(desc->label, &desc->gdev->desc_srcu,
 				srcu_read_lock_held(&desc->gdev->desc_srcu));
 
-	if (test_bit(FLAG_USED_AS_IRQ, &flags))
+	if (test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags))
 		return label ? label->str : "interrupt";
 
-	if (!test_bit(FLAG_REQUESTED, &flags))
+	if (!test_bit(GPIOD_FLAG_REQUESTED, &flags))
 		return NULL;
 
 	return label ? label->str : NULL;
@@ -450,8 +450,8 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	 * Open drain emulation using input mode may incorrectly report
 	 * input here, fix that up.
 	 */
-	if (test_bit(FLAG_OPEN_DRAIN, &flags) &&
-	    test_bit(FLAG_IS_OUT, &flags))
+	if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &flags) &&
+	    test_bit(GPIOD_FLAG_IS_OUT, &flags))
 		return 0;
 
 	if (!guard.gc->get_direction)
@@ -468,7 +468,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	if (ret > 0)
 		ret = 1;
 
-	assign_bit(FLAG_IS_OUT, &flags, !ret);
+	assign_bit(GPIOD_FLAG_IS_OUT, &flags, !ret);
 	WRITE_ONCE(desc->flags, flags);
 
 	return ret;
@@ -846,7 +846,7 @@ static void gpiochip_free_remaining_irqs(struct gpio_chip *gc)
 {
 	struct gpio_desc *desc;
 
-	for_each_gpio_desc_with_flag(gc, desc, FLAG_USED_AS_IRQ)
+	for_each_gpio_desc_with_flag(gc, desc, GPIOD_FLAG_USED_AS_IRQ)
 		gpiod_free_irqs(desc);
 }
 
@@ -1169,10 +1169,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		 * lock here.
 		 */
 		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index))
-			assign_bit(FLAG_IS_OUT, &desc->flags,
+			assign_bit(GPIOD_FLAG_IS_OUT, &desc->flags,
 				   !gc->get_direction(gc, desc_index));
 		else
-			assign_bit(FLAG_IS_OUT,
+			assign_bit(GPIOD_FLAG_IS_OUT,
 				   &desc->flags, !gc->direction_input);
 	}
 
@@ -2449,7 +2449,7 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	if (!guard.gc)
 		return -ENODEV;
 
-	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
+	if (test_and_set_bit(GPIOD_FLAG_REQUESTED, &desc->flags))
 		return -EBUSY;
 
 	offset = gpio_chip_hwgpio(desc);
@@ -2478,7 +2478,7 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	return 0;
 
 out_clear_bit:
-	clear_bit(FLAG_REQUESTED, &desc->flags);
+	clear_bit(GPIOD_FLAG_REQUESTED, &desc->flags);
 	return ret;
 }
 
@@ -2512,20 +2512,20 @@ static void gpiod_free_commit(struct gpio_desc *desc)
 
 	flags = READ_ONCE(desc->flags);
 
-	if (guard.gc && test_bit(FLAG_REQUESTED, &flags)) {
+	if (guard.gc && test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
 		if (guard.gc->free)
 			guard.gc->free(guard.gc, gpio_chip_hwgpio(desc));
 
-		clear_bit(FLAG_ACTIVE_LOW, &flags);
-		clear_bit(FLAG_REQUESTED, &flags);
-		clear_bit(FLAG_OPEN_DRAIN, &flags);
-		clear_bit(FLAG_OPEN_SOURCE, &flags);
-		clear_bit(FLAG_PULL_UP, &flags);
-		clear_bit(FLAG_PULL_DOWN, &flags);
-		clear_bit(FLAG_BIAS_DISABLE, &flags);
-		clear_bit(FLAG_EDGE_RISING, &flags);
-		clear_bit(FLAG_EDGE_FALLING, &flags);
-		clear_bit(FLAG_IS_HOGGED, &flags);
+		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
+		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
+		clear_bit(GPIOD_FLAG_OPEN_DRAIN, &flags);
+		clear_bit(GPIOD_FLAG_OPEN_SOURCE, &flags);
+		clear_bit(GPIOD_FLAG_PULL_UP, &flags);
+		clear_bit(GPIOD_FLAG_PULL_DOWN, &flags);
+		clear_bit(GPIOD_FLAG_BIAS_DISABLE, &flags);
+		clear_bit(GPIOD_FLAG_EDGE_RISING, &flags);
+		clear_bit(GPIOD_FLAG_EDGE_FALLING, &flags);
+		clear_bit(GPIOD_FLAG_IS_HOGGED, &flags);
 #ifdef CONFIG_OF_DYNAMIC
 		WRITE_ONCE(desc->hog, NULL);
 #endif
@@ -2568,7 +2568,7 @@ char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
 	if (IS_ERR(desc))
 		return NULL;
 
-	if (!test_bit(FLAG_REQUESTED, &desc->flags))
+	if (!test_bit(GPIOD_FLAG_REQUESTED, &desc->flags))
 		return NULL;
 
 	guard(srcu)(&desc->gdev->desc_srcu);
@@ -2736,11 +2736,11 @@ static int gpio_set_bias(struct gpio_desc *desc)
 
 	flags = READ_ONCE(desc->flags);
 
-	if (test_bit(FLAG_BIAS_DISABLE, &flags))
+	if (test_bit(GPIOD_FLAG_BIAS_DISABLE, &flags))
 		bias = PIN_CONFIG_BIAS_DISABLE;
-	else if (test_bit(FLAG_PULL_UP, &flags))
+	else if (test_bit(GPIOD_FLAG_PULL_UP, &flags))
 		bias = PIN_CONFIG_BIAS_PULL_UP;
-	else if (test_bit(FLAG_PULL_DOWN, &flags))
+	else if (test_bit(GPIOD_FLAG_PULL_DOWN, &flags))
 		bias = PIN_CONFIG_BIAS_PULL_DOWN;
 	else
 		return 0;
@@ -2882,7 +2882,7 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 		}
 	}
 	if (ret == 0) {
-		clear_bit(FLAG_IS_OUT, &desc->flags);
+		clear_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
 		ret = gpio_set_bias(desc);
 	}
 
@@ -2955,7 +2955,7 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	}
 
 	if (!ret)
-		set_bit(FLAG_IS_OUT, &desc->flags);
+		set_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
 	trace_gpio_value(desc_to_gpio(desc), 0, val);
 	trace_gpio_direction(desc_to_gpio(desc), 0, ret);
 	return ret;
@@ -3021,21 +3021,21 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 
 	flags = READ_ONCE(desc->flags);
 
-	if (test_bit(FLAG_ACTIVE_LOW, &flags))
+	if (test_bit(GPIOD_FLAG_ACTIVE_LOW, &flags))
 		value = !value;
 	else
 		value = !!value;
 
 	/* GPIOs used for enabled IRQs shall not be set as output */
-	if (test_bit(FLAG_USED_AS_IRQ, &flags) &&
-	    test_bit(FLAG_IRQ_IS_ENABLED, &flags)) {
+	if (test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags) &&
+	    test_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &flags)) {
 		gpiod_err(desc,
 			  "%s: tried to set a GPIO tied to an IRQ as output\n",
 			  __func__);
 		return -EIO;
 	}
 
-	if (test_bit(FLAG_OPEN_DRAIN, &flags)) {
+	if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &flags)) {
 		/* First see if we can enable open drain in hardware */
 		ret = gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_DRAIN);
 		if (!ret)
@@ -3043,7 +3043,7 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 		/* Emulate open drain by not actively driving the line high */
 		if (value)
 			goto set_output_flag;
-	} else if (test_bit(FLAG_OPEN_SOURCE, &flags)) {
+	} else if (test_bit(GPIOD_FLAG_OPEN_SOURCE, &flags)) {
 		ret = gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_SOURCE);
 		if (!ret)
 			goto set_output_value;
@@ -3070,7 +3070,7 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 	 * set the IS_OUT flag or otherwise we won't be able to set the line
 	 * value anymore.
 	 */
-	set_bit(FLAG_IS_OUT, &desc->flags);
+	set_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
 	return 0;
 }
 
@@ -3210,10 +3210,10 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 {
 	VALIDATE_DESC(desc);
 	/*
-	 * Handle FLAG_TRANSITORY first, enabling queries to gpiolib for
+	 * Handle GPIOD_FLAG_TRANSITORY first, enabling queries to gpiolib for
 	 * persistence state.
 	 */
-	assign_bit(FLAG_TRANSITORY, &desc->flags, transitory);
+	assign_bit(GPIOD_FLAG_TRANSITORY, &desc->flags, transitory);
 
 	/* If the driver supports it, set the persistence state now */
 	return gpio_set_config_with_argument_optional(desc,
@@ -3231,7 +3231,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 int gpiod_is_active_low(const struct gpio_desc *desc)
 {
 	VALIDATE_DESC(desc);
-	return test_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	return test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags);
 }
 EXPORT_SYMBOL_GPL(gpiod_is_active_low);
 
@@ -3242,7 +3242,7 @@ EXPORT_SYMBOL_GPL(gpiod_is_active_low);
 void gpiod_toggle_active_low(struct gpio_desc *desc)
 {
 	VALIDATE_DESC_VOID(desc);
-	change_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	change_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags);
 	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
 }
 EXPORT_SYMBOL_GPL(gpiod_toggle_active_low);
@@ -3448,7 +3448,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 			int hwgpio = gpio_chip_hwgpio(desc);
 			int value = test_bit(hwgpio, bits);
 
-			if (!raw && test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+			if (!raw && test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags))
 				value = !value;
 			__assign_bit(j, value_bitmap, value);
 			trace_gpio_value(desc_to_gpio(desc), 1, value);
@@ -3510,7 +3510,7 @@ int gpiod_get_value(const struct gpio_desc *desc)
 	if (value < 0)
 		return value;
 
-	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+	if (test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 
 	return value;
@@ -3593,7 +3593,7 @@ static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 	} else {
 		ret = gpiochip_direction_output(guard.gc, offset, 0);
 		if (!ret)
-			set_bit(FLAG_IS_OUT, &desc->flags);
+			set_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
 	}
 	trace_gpio_direction(desc_to_gpio(desc), value, ret);
 	if (ret < 0)
@@ -3620,7 +3620,7 @@ static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 	if (value) {
 		ret = gpiochip_direction_output(guard.gc, offset, 1);
 		if (!ret)
-			set_bit(FLAG_IS_OUT, &desc->flags);
+			set_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
 	} else {
 		ret = gpiochip_direction_input(guard.gc, offset);
 	}
@@ -3635,7 +3635,7 @@ static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 
 static int gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 {
-	if (unlikely(!test_bit(FLAG_IS_OUT, &desc->flags)))
+	if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
 		return -EPERM;
 
 	CLASS(gpio_chip_guard, guard)(desc);
@@ -3705,7 +3705,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			WARN_ON(array_info->gdev->can_sleep);
 
 		for (i = 0; i < array_size; i++) {
-			if (unlikely(!test_bit(FLAG_IS_OUT,
+			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT,
 					       &desc_array[i]->flags)))
 				return -EPERM;
 		}
@@ -3769,7 +3769,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			int hwgpio = gpio_chip_hwgpio(desc);
 			int value = test_bit(i, value_bitmap);
 
-			if (unlikely(!test_bit(FLAG_IS_OUT, &desc->flags)))
+			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
 				return -EPERM;
 
 			/*
@@ -3779,16 +3779,16 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			 */
 			if (!raw && !(array_info &&
 			    test_bit(i, array_info->invert_mask)) &&
-			    test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+			    test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags))
 				value = !value;
 			trace_gpio_value(desc_to_gpio(desc), 0, value);
 			/*
 			 * collect all normal outputs belonging to the same chip
 			 * open drain and open source outputs are set individually
 			 */
-			if (test_bit(FLAG_OPEN_DRAIN, &desc->flags) && !raw) {
+			if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags) && !raw) {
 				gpio_set_open_drain_value_commit(desc, value);
-			} else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags) && !raw) {
+			} else if (test_bit(GPIOD_FLAG_OPEN_SOURCE, &desc->flags) && !raw) {
 				gpio_set_open_source_value_commit(desc, value);
 			} else {
 				__set_bit(hwgpio, mask);
@@ -3854,12 +3854,12 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_value);
  */
 static int gpiod_set_value_nocheck(struct gpio_desc *desc, int value)
 {
-	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+	if (test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 
-	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
+	if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags))
 		return gpio_set_open_drain_value_commit(desc, value);
-	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
+	else if (test_bit(GPIOD_FLAG_OPEN_SOURCE, &desc->flags))
 		return gpio_set_open_source_value_commit(desc, value);
 
 	return gpiod_set_raw_value_commit(desc, value);
@@ -4063,16 +4063,16 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
 	}
 
 	/* To be valid for IRQ the line needs to be input or open drain */
-	if (test_bit(FLAG_IS_OUT, &desc->flags) &&
-	    !test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
+	if (test_bit(GPIOD_FLAG_IS_OUT, &desc->flags) &&
+	    !test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags)) {
 		chip_err(gc,
 			 "%s: tried to flag a GPIO set as output for IRQ\n",
 			 __func__);
 		return -EIO;
 	}
 
-	set_bit(FLAG_USED_AS_IRQ, &desc->flags);
-	set_bit(FLAG_IRQ_IS_ENABLED, &desc->flags);
+	set_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
+	set_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
 
 	return 0;
 }
@@ -4094,8 +4094,8 @@ void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset)
 	if (IS_ERR(desc))
 		return;
 
-	clear_bit(FLAG_USED_AS_IRQ, &desc->flags);
-	clear_bit(FLAG_IRQ_IS_ENABLED, &desc->flags);
+	clear_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
+	clear_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_unlock_as_irq);
 
@@ -4104,8 +4104,8 @@ void gpiochip_disable_irq(struct gpio_chip *gc, unsigned int offset)
 	struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
 
 	if (!IS_ERR(desc) &&
-	    !WARN_ON(!test_bit(FLAG_USED_AS_IRQ, &desc->flags)))
-		clear_bit(FLAG_IRQ_IS_ENABLED, &desc->flags);
+	    !WARN_ON(!test_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags)))
+		clear_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_disable_irq);
 
@@ -4114,14 +4114,14 @@ void gpiochip_enable_irq(struct gpio_chip *gc, unsigned int offset)
 	struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
 
 	if (!IS_ERR(desc) &&
-	    !WARN_ON(!test_bit(FLAG_USED_AS_IRQ, &desc->flags))) {
+	    !WARN_ON(!test_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags))) {
 		/*
 		 * We must not be output when using IRQ UNLESS we are
 		 * open drain.
 		 */
-		WARN_ON(test_bit(FLAG_IS_OUT, &desc->flags) &&
-			!test_bit(FLAG_OPEN_DRAIN, &desc->flags));
-		set_bit(FLAG_IRQ_IS_ENABLED, &desc->flags);
+		WARN_ON(test_bit(GPIOD_FLAG_IS_OUT, &desc->flags) &&
+			!test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags));
+		set_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
 	}
 }
 EXPORT_SYMBOL_GPL(gpiochip_enable_irq);
@@ -4131,7 +4131,7 @@ bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset)
 	if (offset >= gc->ngpio)
 		return false;
 
-	return test_bit(FLAG_USED_AS_IRQ, &gc->gpiodev->descs[offset].flags);
+	return test_bit(GPIOD_FLAG_USED_AS_IRQ, &gc->gpiodev->descs[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_irq);
 
@@ -4164,7 +4164,7 @@ bool gpiochip_line_is_open_drain(struct gpio_chip *gc, unsigned int offset)
 	if (offset >= gc->ngpio)
 		return false;
 
-	return test_bit(FLAG_OPEN_DRAIN, &gc->gpiodev->descs[offset].flags);
+	return test_bit(GPIOD_FLAG_OPEN_DRAIN, &gc->gpiodev->descs[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_open_drain);
 
@@ -4173,7 +4173,7 @@ bool gpiochip_line_is_open_source(struct gpio_chip *gc, unsigned int offset)
 	if (offset >= gc->ngpio)
 		return false;
 
-	return test_bit(FLAG_OPEN_SOURCE, &gc->gpiodev->descs[offset].flags);
+	return test_bit(GPIOD_FLAG_OPEN_SOURCE, &gc->gpiodev->descs[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_open_source);
 
@@ -4182,7 +4182,7 @@ bool gpiochip_line_is_persistent(struct gpio_chip *gc, unsigned int offset)
 	if (offset >= gc->ngpio)
 		return false;
 
-	return !test_bit(FLAG_TRANSITORY, &gc->gpiodev->descs[offset].flags);
+	return !test_bit(GPIOD_FLAG_TRANSITORY, &gc->gpiodev->descs[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_persistent);
 
@@ -4224,7 +4224,7 @@ int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 	if (value < 0)
 		return value;
 
-	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+	if (test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 
 	return value;
@@ -4806,10 +4806,10 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 	int ret;
 
 	if (lflags & GPIO_ACTIVE_LOW)
-		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+		set_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags);
 
 	if (lflags & GPIO_OPEN_DRAIN)
-		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
+		set_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags);
 	else if (dflags & GPIOD_FLAGS_BIT_OPEN_DRAIN) {
 		/*
 		 * This enforces open drain mode from the consumer side.
@@ -4817,13 +4817,13 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		 * should *REALLY* have specified them as open drain in the
 		 * first place, so print a little warning here.
 		 */
-		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
+		set_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags);
 		gpiod_warn(desc,
 			   "enforced open drain please flag it properly in DT/ACPI DSDT/board file\n");
 	}
 
 	if (lflags & GPIO_OPEN_SOURCE)
-		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		set_bit(GPIOD_FLAG_OPEN_SOURCE, &desc->flags);
 
 	if (((lflags & GPIO_PULL_UP) && (lflags & GPIO_PULL_DOWN)) ||
 	    ((lflags & GPIO_PULL_UP) && (lflags & GPIO_PULL_DISABLE)) ||
@@ -4834,11 +4834,11 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 	}
 
 	if (lflags & GPIO_PULL_UP)
-		set_bit(FLAG_PULL_UP, &desc->flags);
+		set_bit(GPIOD_FLAG_PULL_UP, &desc->flags);
 	else if (lflags & GPIO_PULL_DOWN)
-		set_bit(FLAG_PULL_DOWN, &desc->flags);
+		set_bit(GPIOD_FLAG_PULL_DOWN, &desc->flags);
 	else if (lflags & GPIO_PULL_DISABLE)
-		set_bit(FLAG_BIAS_DISABLE, &desc->flags);
+		set_bit(GPIOD_FLAG_BIAS_DISABLE, &desc->flags);
 
 	ret = gpiod_set_transitory(desc, (lflags & GPIO_TRANSITORY));
 	if (ret < 0)
@@ -4943,7 +4943,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	if (!guard.gc)
 		return -ENODEV;
 
-	if (test_and_set_bit(FLAG_IS_HOGGED, &desc->flags))
+	if (test_and_set_bit(GPIOD_FLAG_IS_HOGGED, &desc->flags))
 		return 0;
 
 	hwnum = gpio_chip_hwgpio(desc);
@@ -4951,7 +4951,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	local_desc = gpiochip_request_own_desc(guard.gc, hwnum, name,
 					       lflags, dflags);
 	if (IS_ERR(local_desc)) {
-		clear_bit(FLAG_IS_HOGGED, &desc->flags);
+		clear_bit(GPIOD_FLAG_IS_HOGGED, &desc->flags);
 		ret = PTR_ERR(local_desc);
 		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed, %d\n",
 		       name, gdev->label, hwnum, ret);
@@ -4974,7 +4974,7 @@ static void gpiochip_free_hogs(struct gpio_chip *gc)
 {
 	struct gpio_desc *desc;
 
-	for_each_gpio_desc_with_flag(gc, desc, FLAG_IS_HOGGED)
+	for_each_gpio_desc_with_flag(gc, desc, GPIOD_FLAG_IS_HOGGED)
 		gpiochip_free_own_desc(desc);
 }
 
@@ -5089,8 +5089,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		} else {
 			dflags = READ_ONCE(desc->flags);
 			/* Exclude open drain or open source from fast output */
-			if (test_bit(FLAG_OPEN_DRAIN, &dflags) ||
-			    test_bit(FLAG_OPEN_SOURCE, &dflags))
+			if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags) ||
+			    test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
 				__clear_bit(descs->ndescs,
 					    array_info->set_mask);
 			/* Identify 'fast' pins which require invertion */
@@ -5248,12 +5248,12 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 	for_each_gpio_desc(gc, desc) {
 		guard(srcu)(&desc->gdev->desc_srcu);
 		flags = READ_ONCE(desc->flags);
-		is_irq = test_bit(FLAG_USED_AS_IRQ, &flags);
-		if (is_irq || test_bit(FLAG_REQUESTED, &flags)) {
+		is_irq = test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags);
+		if (is_irq || test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
 			gpiod_get_direction(desc);
-			is_out = test_bit(FLAG_IS_OUT, &flags);
+			is_out = test_bit(GPIOD_FLAG_IS_OUT, &flags);
 			value = gpio_chip_get_value(gc, desc);
-			active_low = test_bit(FLAG_ACTIVE_LOW, &flags);
+			active_low = test_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
 			seq_printf(s, " gpio-%-3u (%-20.20s|%-20.20s) %s %s %s%s\n",
 				   gpio, desc->name ?: "", gpiod_get_label(desc),
 				   is_out ? "out" : "in ",
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 9b74738a9ca5b1a4826c8d56d871f8a7cf6ea1e7..2a003a7311e7ac5beeaa1c947d921149ad991acf 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -186,24 +186,24 @@ struct gpio_desc {
 	struct gpio_device	*gdev;
 	unsigned long		flags;
 /* flag symbols are bit numbers */
-#define FLAG_REQUESTED			0
-#define FLAG_IS_OUT			1
-#define FLAG_EXPORT			2	/* protected by sysfs_lock */
-#define FLAG_SYSFS			3	/* exported via /sys/class/gpio/control */
-#define FLAG_ACTIVE_LOW			6	/* value has active low */
-#define FLAG_OPEN_DRAIN			7	/* Gpio is open drain type */
-#define FLAG_OPEN_SOURCE		8	/* Gpio is open source type */
-#define FLAG_USED_AS_IRQ		9	/* GPIO is connected to an IRQ */
-#define FLAG_IRQ_IS_ENABLED		10	/* GPIO is connected to an enabled IRQ */
-#define FLAG_IS_HOGGED			11	/* GPIO is hogged */
-#define FLAG_TRANSITORY			12	/* GPIO may lose value in sleep or reset */
-#define FLAG_PULL_UP			13	/* GPIO has pull up enabled */
-#define FLAG_PULL_DOWN			14	/* GPIO has pull down enabled */
-#define FLAG_BIAS_DISABLE		15	/* GPIO has pull disabled */
-#define FLAG_EDGE_RISING		16	/* GPIO CDEV detects rising edge events */
-#define FLAG_EDGE_FALLING		17	/* GPIO CDEV detects falling edge events */
-#define FLAG_EVENT_CLOCK_REALTIME	18	/* GPIO CDEV reports REALTIME timestamps in events */
-#define FLAG_EVENT_CLOCK_HTE		19	/* GPIO CDEV reports hardware timestamps in events */
+#define GPIOD_FLAG_REQUESTED		0  /* GPIO is in use */
+#define GPIOD_FLAG_IS_OUT		1  /* GPIO is in output mode */
+#define GPIOD_FLAG_EXPORT		2  /* GPIO is exported to user-space */
+#define GPIOD_FLAG_SYSFS		3  /* GPIO is exported via /sys/class/gpio */
+#define GPIOD_FLAG_ACTIVE_LOW		6  /* GPIO is active-low */
+#define GPIOD_FLAG_OPEN_DRAIN		7  /* GPIO is open drain type */
+#define GPIOD_FLAG_OPEN_SOURCE		8  /* GPIO is open source type */
+#define GPIOD_FLAG_USED_AS_IRQ		9  /* GPIO is connected to an IRQ */
+#define GPIOD_FLAG_IRQ_IS_ENABLED	10 /* GPIO is connected to an enabled IRQ */
+#define GPIOD_FLAG_IS_HOGGED		11 /* GPIO is hogged */
+#define GPIOD_FLAG_TRANSITORY		12 /* GPIO may lose value in sleep or reset */
+#define GPIOD_FLAG_PULL_UP		13 /* GPIO has pull up enabled */
+#define GPIOD_FLAG_PULL_DOWN		14 /* GPIO has pull down enabled */
+#define GPIOD_FLAG_BIAS_DISABLE		15 /* GPIO has pull disabled */
+#define GPIOD_FLAG_EDGE_RISING		16 /* GPIO CDEV detects rising edge events */
+#define GPIOD_FLAG_EDGE_FALLING		17 /* GPIO CDEV detects falling edge events */
+#define GPIOD_FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
+#define GPIOD_FLAG_EVENT_CLOCK_HTE	19 /* GPIO CDEV reports hardware timestamps in events */
 
 	/* Connection label */
 	struct gpio_desc_label __rcu *label;

---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250909-rename-gpio-flags-59f8a7bf60d5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


