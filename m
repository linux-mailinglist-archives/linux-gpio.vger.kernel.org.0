Return-Path: <linux-gpio+bounces-17744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC6DA6783E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 16:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AA6A16DE61
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 15:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E3720F091;
	Tue, 18 Mar 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7LbW7Vn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6700D207A01;
	Tue, 18 Mar 2025 15:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742312799; cv=none; b=j34/8LZVOYSkiR8Wb9KHHsxr1QHEAKZ3Kxbn24NVjvC8X+JYaxoGTjmsCot0MH7BLRMTOLmOMq3AaT9ZbdypFbBfWnmzjUR3Khvh8mVnGBwJc4obolwIl15MpwtRNdpiv5PjjF2X7dsTPvcKkEzy/kjiLy908Z6optBbsGFgeNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742312799; c=relaxed/simple;
	bh=TePDezQLPcN0tcOqSmvjFu28rr9FfjBOdxnQ0WBu8qQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pFFVynvbQw+Sk5bIcxdOTksb6v7QLi3KKWN1aImHKMf5VfzeZsldajQg7y+n7Kr+8fc4O0yG3aiT8zU51dZrp8CJG80gk1FggrbblQD5DnTGZFVeVKNaqbSJzMCzu7L304j/jy3Um7UxdBjkZwfWTbzO/1fMkbeuJD3CjTKA0nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7LbW7Vn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2241053582dso14424855ad.1;
        Tue, 18 Mar 2025 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742312797; x=1742917597; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZkEPbYcygIt00AczwOB2AOW3qxQNoMiOJEJIj5BPYo=;
        b=W7LbW7VnyxLKjWon4XAzUZAEHsr8hwMmNRBMR7sZuxBoMAphHSLoMJKFjyxEGqukzj
         OwteqbB05lRJiGPT3s7OBU82YmTK5XdUdPFknFH6HuNmCNBH4uYcSf+8L8ZJywkdxWL9
         uVQqBgGSuEu2qc+B3fcK70dnQWl5RlE1zy6+208qeH89+xqpclEL2KfUh86dyiOanFJS
         4fGW3edzAZ7W9zM8nfLlD7ING2jGuT91fP+dWk1uaZRt6MM0PEO2Dk1fegBkGL43pqyB
         3cI7Fd4rhcxPzs2FQmv2MjE4mWDqcB1zRSK+LUYlNC6Dctg8Z0QK5Pfluu/CTk9TlsNj
         Yexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742312797; x=1742917597;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZkEPbYcygIt00AczwOB2AOW3qxQNoMiOJEJIj5BPYo=;
        b=nm28uxwVokYCweDiG6iwt0xIv9EqBDNF2Isl7C3PLF0ecXbaXEWNSUK7XRDqGLrueh
         xieLbNidN3kGZfC9rgn2aWjcGldlEeWrphGjC0ljZPmbZZOJgdDA1Anabgi3ScNN+zJO
         +XUz92jW5pEJa2O3syXsI9TFbld+KaUS9EQvhySXkAuL7iRgvF0b3p3NQ1Pq4Wi6P22M
         QAxdObUqcAyr909U2oFZMgBsgpeiRJiZtLNVMGsgUJC8fEYHq42qMyQsFY+j98WTF/hj
         viS77C2XJJrljzWGa0KKjSAv0N/1xd6qDNuxkX/3LLCFXqLhA5oYRkO8mDpj2mF1e1Ia
         GPIA==
X-Forwarded-Encrypted: i=1; AJvYcCX8gDThD5sVEmU/mk7f05LD9v+FbkFsF6u9JC5mL8L+ncNeFrfXbcsGSs249dYLp9VDFFT9pQINDfbYuUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1khP2dMtmdrREl2pSK/YCTJqWzQC65x6gYPtTyvM4WK1VvigC
	Q008D9P0tLNoukQcJ2efNHvXHNTsHAKh17D3rUCSMZcc5ytFdjNkhueNuA==
X-Gm-Gg: ASbGncsmj9MkYaDtRgusQ0Ny5rJZr/31Um9taGxDTcTmHarV+7DZZIFJoDB9vBMRbOW
	VKm0jMWwjI9XU267/FnS9Q9qPECKhN6WTNzRmd/dpk9K3Iv7z5r7nEnH7taUBINzkPtuMJv81r2
	3JuDw05wyma84lTpcaE+BwnC5Q35e7Wyy27O4Hop0DYvBJz2Sgnubs+3YEbqEVXYuMV8IPCgKth
	q/w27I5qPKO97zeDYv65Uuvzj3Be/KRHkXuO9+FykVNMywRwz878euEpyn7KcjFtKjNLMLXEMiB
	YWzbwjKDIOxg6PbKx9K5Va3DyYfUdpb24Af01B/mTQl/TOfG2ARoxTXJxdlsgEZSNh61wZedJw+
	LaFjrFNPw2rfBNCax7e24nA==
X-Google-Smtp-Source: AGHT+IGc4phUFqvFR1hCHFocoOIbcCcBgnK6/AwfhfBGnDWYymXvUAlRNdbHEENJmbEgniQ0puYP9A==
X-Received: by 2002:a17:902:f693:b0:21d:3bd7:afdd with SMTP id d9443c01a7336-225e0868050mr223420325ad.0.1742312797129;
        Tue, 18 Mar 2025 08:46:37 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba712asm95434305ad.131.2025.03.18.08.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:46:36 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 18 Mar 2025 23:44:19 +0800
Subject: [PATCH v2] gpio: pca953x: Add support for level-triggered
 interrupts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-gpio-pca953x-level-triggered-irq-v2-1-c8bae60e7e17@gmail.com>
X-B4-Tracking: v=1; b=H4sIANKU2WcC/5WNQQ6CMBAAv0L27BpaqIon/2E41LKUTYDWljQYw
 t+t/MDjzGFmg0iBKcK92CBQ4shuziBPBZhBz5aQu8wgS6nKStzQenbojW5UteJIiUZcAltLgTr
 k8EZl+msvjH6pi4Cc8YF6Xo/Fs808cFxc+BzHJH72j3gSKLA0dVNXXSNrqR520jyejZug3ff9C
 6FN02LQAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Patrick Williams <patrick@stwcx.xyz>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742312795; l=4669;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=TePDezQLPcN0tcOqSmvjFu28rr9FfjBOdxnQ0WBu8qQ=;
 b=9MwxR/VZWAilJWq3CVIvJM45CkSaE+W4NgEYFgvL5KdqjCI9xskKnV4Jit8cSPaLftutXuo9r
 mqcsetOtZiBB0Kz8EdZwBG4iTIF1mA+JbGOt559RKUVtuRidbUOA96g
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
Changes in v2:
- fix error of irq_trig_level_high & irq_trig_level_low check
- Link to v1: https://lore.kernel.org/r/20250318-gpio-pca953x-level-triggered-irq-v1-1-0c4943d92425@gmail.com
---
 drivers/gpio/gpio-pca953x.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index be4c9981ebc4..6ca882493839 100644
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
 
@@ -773,6 +775,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
 
 	bitmap_or(irq_mask, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
+	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_high, gc->ngpio);
+	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_low, gc->ngpio);
 	bitmap_complement(reg_direction, reg_direction, gc->ngpio);
 	bitmap_and(irq_mask, irq_mask, reg_direction, gc->ngpio);
 
@@ -790,13 +794,15 @@ static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
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
@@ -809,6 +815,8 @@ static void pca953x_irq_shutdown(struct irq_data *d)
 
 	clear_bit(hwirq, chip->irq_trig_raise);
 	clear_bit(hwirq, chip->irq_trig_fall);
+	clear_bit(hwirq, chip->irq_trig_level_low);
+	clear_bit(hwirq, chip->irq_trig_level_high);
 }
 
 static void pca953x_irq_print_chip(struct irq_data *data, struct seq_file *p)
@@ -839,6 +847,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 	DECLARE_BITMAP(cur_stat, MAX_LINE);
 	DECLARE_BITMAP(new_stat, MAX_LINE);
 	DECLARE_BITMAP(trigger, MAX_LINE);
+	DECLARE_BITMAP(edges, MAX_LINE);
 	int ret;
 
 	if (chip->driver_data & PCA_PCAL) {
@@ -875,13 +884,26 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 
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
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250318-gpio-pca953x-level-triggered-irq-5cf7f1cab561

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


