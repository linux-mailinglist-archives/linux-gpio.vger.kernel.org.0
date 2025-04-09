Return-Path: <linux-gpio+bounces-18591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 361A2A82AAC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 17:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FF0B7A5B2F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 15:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B9F259CB3;
	Wed,  9 Apr 2025 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1SGJ0/d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DC725F78F;
	Wed,  9 Apr 2025 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213193; cv=none; b=ipRzmid9R1CADTQwKXQJrqd5IJCxUlyCmSATN/E2RETaQSpsy0/JKl/Zv4rzpu+4ixy5IDsvPhVDTPzHYF7QWbYNMIH+EZ3lX3nBY1BXCI7vdOcdXZQ/LooRLHl8riA47A3nn9DnhUcr+4b/Dn8AT9ZRoPGCPQSXqmJDfelC/yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213193; c=relaxed/simple;
	bh=GfSem+VB4WRC6qzcNhbQShvkM1QwYr1BY2Qnl/BFdUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MxvR5nwuBcuRatwy/wCCL9Nk0GMvlrmPJi2A7koL+9z5YGZnWZEKXp3cSYzGscVnJSR+A5tbZlm1kdu1dOde7q4CGsSWJ8ER+ax43w7Z1lHlgMKxRrpTD6cs8rcZU7zoENQtZVZwAP60O/aNuKTRLyZwwM77nty8VHCSw+DFusg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1SGJ0/d; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22423adf751so70855505ad.2;
        Wed, 09 Apr 2025 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213191; x=1744817991; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMmY2oQEDgDhIgo9IwPocIKFjsr7LqfGTcE3HSB/03Y=;
        b=b1SGJ0/dieNPlKC5J0CblFSrjtb2lErP0vivwwOi5tJWGArzF8JClL6ZWDgvx9Sdgr
         wiEpiEcHsJ7N1+j+7E/vNYgeBj5zRYk5609iyuEyJUwz1cZbKD/SjLys5V5k+2E2l2nx
         0LquDUT1SG7gHXpO4yLMQX0SGp7w4gEEKAIJ7O0HG0ukAdmUj8GZ1pRjTNYsSiuVCLS+
         iNUYEqfnuj+9blZyCs1XVb5WWyOG3/44Pcw6lpfimWNtnyHXTwnlafSoyOS3pGSY+ou+
         Pkfmdvm2hZoqZpGFCW+k7SQ1Vlj23z7n2FwPnkOObTXabwTd/cps1VMOS+bcaDHGI6qg
         AASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213191; x=1744817991;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMmY2oQEDgDhIgo9IwPocIKFjsr7LqfGTcE3HSB/03Y=;
        b=Vhl1QFpmU0Cwk1xz/o1EZeBbhxusAfZ9+zvIAmuNtmOTvd2WZVcei/S7HerqzcYWhH
         sxSay1M7JEEz4Ql5VRX9/Wd+In7jo//hwBW/wr2OUZxkHOjf5y4Eoc1wz4kCBtJSWdP2
         /G/HwQuOELe9C1qgtfay3ggFdiBXhZSc2PQDeb5jDxV1VJ8+5ePadswjgr2bqhmz79RP
         MUehgtSjyIyGRKZtapMKef3diYyXoCXk9bf+2ksZA6CC/xo9GrW+q0fvfAl4zX7fpzk1
         mhmKqBBDMrBJd5NACNQq3eP3sJk1mVsceQsU/nAmc42KTGLz/O283NyZ2r0XNA0/PhAn
         D3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXNVR5UI49Bl3NLS6zWpW6oXuM6dXxn6Ymst3MlcnlNI5KF2oSWLUy/0JWR2RqQ2Ym02QeQRsjPlkoQiw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD4dXyAsejCq/fX+Wdwk2CHCT3sKEOlkCJlbfJi+cIZhOdnKNC
	of8+X5zKHnarho2WOpLxRuBoJrtN9ZpDWbqb5ydy976WUJApfeR9
X-Gm-Gg: ASbGncshWhTux328KdqoE4NyiNqHgdlPZ/yLb57DCv6qBTkrtPRkA44UTZoi2C99msb
	3tC/JvWeoTmjD2GUojbDE4ktYl/RR06Dv7+HtC1eMVZx/FHsBqrp4V/JO9rLqRa15P2uvnkMxps
	gtT29PfsnJzQo02Nw2iLntDDafVz5UCzD3o3WeQ2e1QmeaBsV5wXi11qpxxR0uubXTOx05ei6vq
	xp3S75Dj+OubeCYd50OaOEZKEyvQ4N4H5ZgWeXD2wnPvtTqs1WcGSBWDZkwz6b3RMeAcpg2Wmq7
	otZqnH+DoOMRivqVB6tNAkjSXplZ1jQAR9uZWnnrlz9LfPOk+QGbIRomdirnmn2U6qGazNaZdPB
	cTUHtsmg4nmbAi8aL0Q==
X-Google-Smtp-Source: AGHT+IHIow0BHY81/J7WvPJHqTKkJsnsxlZm+vj6KXt4mi1dR6yWXo/ZldWHxq7xs00XK/clilvPwQ==
X-Received: by 2002:a17:903:2c6:b0:223:26da:4b8e with SMTP id d9443c01a7336-22ac296e291mr61928045ad.4.1744213191089;
        Wed, 09 Apr 2025 08:39:51 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95c99sm13432885ad.139.2025.04.09.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:39:50 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 09 Apr 2025 23:37:30 +0800
Subject: [PATCH v3] gpio: pca953x: Add support for level-triggered
 interrupts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-gpio-pca953x-level-triggered-irq-v3-1-7f184d814934@gmail.com>
X-B4-Tracking: v=1; b=H4sIADmU9mcC/5XNOQ6DMBCF4asg15nIC2ZJlXtEKYwZzEhsMcgiQ
 tw9hiot5f+K721sRk84s0eyMY+BZhqHGOqWMNuawSFQHZtJLjVXogA30QiTNaVWK3QYsIPFk3P
 osQbyH9C2yRthTaUzwSIzeWxoPS9e79gtzcvov+djEMd6AQ8CBHCblqmqS5lK/XS9oe5ux54de
 JBXQRlBW1QGM445ivwf3Pf9B9DfEBshAQAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Patrick Williams <patrick@stwcx.xyz>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744213189; l=4851;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=GfSem+VB4WRC6qzcNhbQShvkM1QwYr1BY2Qnl/BFdUw=;
 b=rCgxD7YlNBNKYtLqOGXJpjQCFFqyVz6WdX+B4VivdsNzbixF3mLb+2U9JJzKiJQ7Qah+8ToGz
 IpnjEKBbFR3C8uA6HIydgP45RzRD7fzVohFWw9+vfF7AWqfzEDvaX6I
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=

Adds support for level-triggered interrupts in the PCA953x GPIO
expander driver. Previously, the driver only supported edge-triggered
interrupts, which could lead to missed events in scenarios where an
interrupt condition persists until it is explicitly cleared.

By enabling level-triggered interrupts, the driver can now detect and
respond to sustained interrupt conditions more reliably.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Adds support for level-triggered interrupts in the PCA953x GPIO
expander driver.
---
Changes in v3:
- rebase patch on v6.15-rc1
- Link to v2: https://lore.kernel.org/r/20250318-gpio-pca953x-level-triggered-irq-v2-1-c8bae60e7e17@gmail.com

Changes in v2:
- fix error of irq_trig_level_high & irq_trig_level_low check
- Link to v1: https://lore.kernel.org/r/20250318-gpio-pca953x-level-triggered-irq-v1-1-0c4943d92425@gmail.com
---
 drivers/gpio/gpio-pca953x.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 442435ded020..ab2c0fd428fb 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -215,6 +215,8 @@ struct pca953x_chip {
 	DECLARE_BITMAP(irq_stat, MAX_LINE);
 	DECLARE_BITMAP(irq_trig_raise, MAX_LINE);
 	DECLARE_BITMAP(irq_trig_fall, MAX_LINE);
+	DECLARE_BITMAP(irq_trig_level_high, MAX_LINE);
+	DECLARE_BITMAP(irq_trig_level_low, MAX_LINE);
 #endif
 	atomic_t wakeup_path;
 
@@ -774,6 +776,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
 
 	bitmap_or(irq_mask, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
+	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_high, gc->ngpio);
+	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_low, gc->ngpio);
 	bitmap_complement(reg_direction, reg_direction, gc->ngpio);
 	bitmap_and(irq_mask, irq_mask, reg_direction, gc->ngpio);
 
@@ -791,13 +795,15 @@ static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 	struct device *dev = &chip->client->dev;
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	if (!(type & IRQ_TYPE_EDGE_BOTH)) {
+	if (!(type & IRQ_TYPE_SENSE_MASK)) {
 		dev_err(dev, "irq %d: unsupported type %d\n", d->irq, type);
 		return -EINVAL;
 	}
 
 	assign_bit(hwirq, chip->irq_trig_fall, type & IRQ_TYPE_EDGE_FALLING);
 	assign_bit(hwirq, chip->irq_trig_raise, type & IRQ_TYPE_EDGE_RISING);
+	assign_bit(hwirq, chip->irq_trig_level_low, type & IRQ_TYPE_LEVEL_LOW);
+	assign_bit(hwirq, chip->irq_trig_level_high, type & IRQ_TYPE_LEVEL_HIGH);
 
 	return 0;
 }
@@ -810,6 +816,8 @@ static void pca953x_irq_shutdown(struct irq_data *d)
 
 	clear_bit(hwirq, chip->irq_trig_raise);
 	clear_bit(hwirq, chip->irq_trig_fall);
+	clear_bit(hwirq, chip->irq_trig_level_low);
+	clear_bit(hwirq, chip->irq_trig_level_high);
 }
 
 static void pca953x_irq_print_chip(struct irq_data *data, struct seq_file *p)
@@ -840,6 +848,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 	DECLARE_BITMAP(cur_stat, MAX_LINE);
 	DECLARE_BITMAP(new_stat, MAX_LINE);
 	DECLARE_BITMAP(trigger, MAX_LINE);
+	DECLARE_BITMAP(edges, MAX_LINE);
 	int ret;
 
 	ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
@@ -857,13 +866,26 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 
 	bitmap_copy(chip->irq_stat, new_stat, gc->ngpio);
 
-	if (bitmap_empty(trigger, gc->ngpio))
-		return false;
+	if (bitmap_empty(chip->irq_trig_level_high, gc->ngpio) &&
+	    bitmap_empty(chip->irq_trig_level_low, gc->ngpio)) {
+		if (bitmap_empty(trigger, gc->ngpio))
+			return false;
+	}
 
 	bitmap_and(cur_stat, chip->irq_trig_fall, old_stat, gc->ngpio);
 	bitmap_and(old_stat, chip->irq_trig_raise, new_stat, gc->ngpio);
-	bitmap_or(new_stat, old_stat, cur_stat, gc->ngpio);
-	bitmap_and(pending, new_stat, trigger, gc->ngpio);
+	bitmap_or(edges, old_stat, cur_stat, gc->ngpio);
+	bitmap_and(pending, edges, trigger, gc->ngpio);
+
+	bitmap_and(cur_stat, new_stat, chip->irq_trig_level_high, gc->ngpio);
+	bitmap_and(cur_stat, cur_stat, chip->irq_mask, gc->ngpio);
+	bitmap_or(pending, pending, cur_stat, gc->ngpio);
+
+	bitmap_complement(cur_stat, new_stat, gc->ngpio);
+	bitmap_and(cur_stat, cur_stat, reg_direction, gc->ngpio);
+	bitmap_and(old_stat, cur_stat, chip->irq_trig_level_low, gc->ngpio);
+	bitmap_and(old_stat, old_stat, chip->irq_mask, gc->ngpio);
+	bitmap_or(pending, pending, old_stat, gc->ngpio);
 
 	return !bitmap_empty(pending, gc->ngpio);
 }

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250318-gpio-pca953x-level-triggered-irq-5cf7f1cab561

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


