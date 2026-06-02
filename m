Return-Path: <linux-gpio+bounces-37776-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKB6EPlkHmrCiwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37776-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:07:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2D6285C4
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F133230A8CCF
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 05:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D026325487C;
	Tue,  2 Jun 2026 05:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQ9xQXz4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3C21A681B
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 05:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376528; cv=none; b=Vp9NfJIX+eetKV3v2XeknmkxTsD1Lq/of6vHcayZUA7lpMNLgyxWI+px3OLeraUYssRNVGm+tPXyqEvRR1Xsi/9ciPOTlWgesD6V8WiSRYFmqXP809sYYyiLuVDTg8/7BOFRs1T7E+ewF553qwqsQiYZ9TjQjytB2eb5P7PLLbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376528; c=relaxed/simple;
	bh=YvQLjBWJRjLxKpMXlc55gK1BvM98fsTCqmx+fq/wk7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlxA7dwKb23gfG7DogYtOwNj89FXdnrEI67bAFsUqZ+GfoIeOEnec0avWWvDlj8DS749Nr9q6kHMTVYTZ1olKLLJBYCjRwQSdpbP68lTG3Ik35BwzU8zakSGmxq1SkA2mb5EaYUO0NhwCWSAKHZ1atAxATPU9aIEZzO2zgorbHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQ9xQXz4; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so2432128a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 22:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780376522; x=1780981322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3KbSzoRI/icX/VWbVUw16WYqo0/swLg71aVPGe0bc4=;
        b=cQ9xQXz4fsmKfPrQwcnPY5ceEz1IfoRepnqIwQbhoMCPg0B2kEZY7aq947ryErH/im
         Dmw+l4nv0rmSksv8qFrVgJloBPD2jU2yIhwN49oIi2MiAYlr+67bFRN7JsrZfmRJYiUL
         hxTl4N0kyE0hagXbtn+cHiA8E2vMWlaS8R6jU16nx2iqCnt62eT19JZ3J0PfJZuxOMU3
         ApigeYtiVdHREJkc8iR+CLzEUpv/SmLT5P7duYM1RGSB3wA9DDdDlB6p1htBD6hc5iIh
         r1PZkAfM+fJC7ks/Aq5x+rqvD1Vvtv1bDTppfXJtMDBYxnY15l8LFpKOwxsEq0w+DbRw
         i5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376522; x=1780981322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p3KbSzoRI/icX/VWbVUw16WYqo0/swLg71aVPGe0bc4=;
        b=ssHBYfSHGaFcKBmwMsWctfp5pQ3GnI9+DMqOj9p6doGemQBg1HwJZ+G6lyXs6Lowqw
         5uY49uHs6bYlfPcnZXE+0h8r0OqibjSu8h18oqsC+FOhinrxCAdMAQiV26bycaiSh+jN
         Lg3raCoKa/Y4oROeLorwjyz4o+LvJYvWQ/kR03nKpiPvvG3Rj1GihgK/smLf2OLCutfH
         XQtATf/kxQ/OuHnUpHxzfUmNvfkVEp9jEpC704LgFI1h7qB0f6L7jcbScqtlArpV6hz7
         5/8DZ7Bp158sUhn4mFrHfYDlwoit9Imbn01mt7e3ZrYlzk43TTQmJ/tJWAox81YGKs/g
         ZZBw==
X-Gm-Message-State: AOJu0Yw1aGEa/eMJS8SYGas4GbQjiLWMTASoqcKioXLjvnE/1yIslZ89
	VPs6N5a0Klsh3owtxr6ZCqltrdrCKw/q7DRkAd5IxdXALTsOoOdCDRufpTM17Bk8
X-Gm-Gg: Acq92OHK8Uiqw5b38CxGwkj9Of84brNvLOPhCMc7DiiiCVUZGv5o18KaQjLOm0qxMkL
	nhMf7RrJhLdPbJr01jmvrn8m+haPmnC1zSyv6vquS0j6GZArQHFvqxYoAgaqwFEyAejvT5WGjv6
	BpyL4JkFs1iilD1Q6Cu2wpYBI5n8Q4M2003pHN+WLlo/0nzLvo4NCpgKOrnpcNTDvcSMvpC24Mt
	s3OkagTufJy2uSsMIddOF3tYkKM0LMQ2QEyHcCg3s9U/H3G71t5ov62+1KhwS9D3VkXFbLPMHqh
	4KAN7sjlyFheoE9WVVswSRY2o0Q1Ec0u3OKjMSFJ/npAO3xQqzQBsDs7hEpYeublKEF4dYi7evU
	QXTNLleliQ08bTE5QrUqEGIf3ZICeuHBPw2Ggy9nsiC5ycDxtBLb3VFTa8fiCpDVwWnb/b0ZyZF
	390WXlNSlJ7W9C4L4msgNerpfkSCFtX/2isViczMP0S5Cg7B1z9Ov3ptg2DKDWCafLfbKLBSnpl
	8rCdWxzZHPwbyMk9w4eydsbrCXUhp1791oqlEtZ0qQoNA==
X-Received: by 2002:a05:6a20:748d:b0:3a3:a55f:405d with SMTP id adf61e73a8af0-3b427c572e9mr15361175637.13.1780376522535;
        Mon, 01 Jun 2026 22:02:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8589d055c7sm8958467a12.9.2026.06.01.22.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 22:02:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/7] gpio: ppc44x: Convert GPIO to generic MMIO
Date: Mon,  1 Jun 2026 22:01:29 -0700
Message-ID: <20260602050131.856789-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602050131.856789-1-rosenp@gmail.com>
References: <20260602050131.856789-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-37776-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D7F2D6285C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use gpio_generic_chip_init() to set up the PPC44x GPIO chip
instead of open-coding the basic get, set, locking and state handling.

Keep the PPC44x-specific direction callbacks because they still need to
program ODR and the OSR/TSR registers around the generic data and
direction registers.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 82 +++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index b30ca357ab74..6b4814ed12b5 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -11,10 +11,9 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/spinlock.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
@@ -45,9 +44,8 @@ struct ppc4xx_gpio {
 };
 
 struct ppc4xx_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *regs;
-	spinlock_t lock;
 };
 
 /*
@@ -56,55 +54,35 @@ struct ppc4xx_gpio_chip {
  * There are a maximum of 32 gpios in each gpio controller.
  */
 
-static int ppc4xx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
-{
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc4xx_gpio __iomem *regs = chip->regs;
-
-	return !!(in_be32(&regs->ir) & GPIO_MASK(gpio));
-}
-
 static inline void
 __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc4xx_gpio __iomem *regs = chip->regs;
+	struct gpio_generic_chip *gen_gc = &chip->chip;
 
 	if (val)
-		setbits32(&regs->or, GPIO_MASK(gpio));
+		gen_gc->sdata |= GPIO_MASK(gpio);
 	else
-		clrbits32(&regs->or, GPIO_MASK(gpio));
-}
+		gen_gc->sdata &= ~GPIO_MASK(gpio);
 
-static int ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-{
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
-	unsigned long flags;
-
-	spin_lock_irqsave(&chip->lock, flags);
-
-	__ppc4xx_gpio_set(gc, gpio, val);
-
-	spin_unlock_irqrestore(&chip->lock, flags);
-
-	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
-
-	return 0;
+	gpio_generic_write_reg(gen_gc, gen_gc->reg_set, gen_gc->sdata);
 }
 
 static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct gpio_generic_chip *gen_gc = &chip->chip;
 	struct ppc4xx_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	gpio_generic_chip_lock_irqsave(gen_gc, flags);
 
 	/* Disable open-drain function */
 	clrbits32(&regs->odr, GPIO_MASK(gpio));
 
 	/* Float the pin */
 	clrbits32(&regs->tcr, GPIO_MASK(gpio));
+	gen_gc->sdir &= ~GPIO_MASK(gpio);
 
 	/* Bits 0-15 use TSRL/OSRL, bits 16-31 use TSRH/OSRH */
 	if (gpio < 16) {
@@ -115,7 +93,7 @@ static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
 	}
 
-	spin_unlock_irqrestore(&chip->lock, flags);
+	gpio_generic_chip_unlock_irqrestore(gen_gc, flags);
 
 	return 0;
 }
@@ -124,10 +102,11 @@ static int
 ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct gpio_generic_chip *gen_gc = &chip->chip;
 	struct ppc4xx_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	gpio_generic_chip_lock_irqsave(gen_gc, flags);
 
 	/* First set initial value */
 	__ppc4xx_gpio_set(gc, gpio, val);
@@ -137,6 +116,7 @@ ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	/* Drive the pin */
 	setbits32(&regs->tcr, GPIO_MASK(gpio));
+	gen_gc->sdir |= GPIO_MASK(gpio);
 
 	/* Bits 0-15 use TSRL, bits 16-31 use TSRH */
 	if (gpio < 16) {
@@ -147,7 +127,7 @@ ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
 	}
 
-	spin_unlock_irqrestore(&chip->lock, flags);
+	gpio_generic_chip_unlock_irqrestore(gen_gc, flags);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
 
@@ -159,33 +139,43 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = dev->of_node;
 	struct ppc4xx_gpio_chip *chip;
+	struct gpio_generic_chip_config config;
 	struct gpio_chip *gc;
+	struct ppc4xx_gpio __iomem *regs;
+	int ret;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	spin_lock_init(&chip->lock);
-
-	gc = &chip->gc;
+	chip->regs = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(chip->regs))
+		return PTR_ERR(chip->regs);
 
-	gc->parent = dev;
+	regs = chip->regs;
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = &regs->ir,
+		.set = &regs->or,
+		.dirout = &regs->tcr,
+		.flags = GPIO_GENERIC_BIG_ENDIAN |
+			 GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER,
+	};
+
+	ret = gpio_generic_chip_init(&chip->chip, &config);
+	if (ret)
+		return ret;
+
+	gc = &chip->chip.gc;
 	gc->fwnode = dev_fwnode(dev);
-	gc->base = -1;
-	gc->ngpio = 32;
 	gc->direction_input = ppc4xx_gpio_dir_in;
 	gc->direction_output = ppc4xx_gpio_dir_out;
-	gc->get = ppc4xx_gpio_get;
-	gc->set = ppc4xx_gpio_set;
 
 	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
 	if (!gc->label)
 		return -ENOMEM;
 
-	chip->regs = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(chip->regs))
-		return PTR_ERR(chip->regs);
-
 	return devm_gpiochip_add_data(dev, gc, chip);
 }
 
-- 
2.54.0


