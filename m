Return-Path: <linux-gpio+bounces-17701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EED2A65881
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 17:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF461715E8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 16:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967761EB5D6;
	Mon, 17 Mar 2025 16:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nckDosPU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30DE165EFC;
	Mon, 17 Mar 2025 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742229494; cv=none; b=MaTHxJXyYRIezN1jlJ70PdYv6/6TJCgO+xquqf7r7veCWLKRL+zarG5kTS9BlWEdB71iGvwqB34J1s+8Ci8JqhwIW8L/JBcxFrGDcwplEe1g2F7sD/CVo2FMKqLIxPj9iNDGRdmPwEtvPODQnsSG07X6jMtLF2ntxs+63R+VDLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742229494; c=relaxed/simple;
	bh=9t1pdawn2FZ7NWIdQ/GARUR55HAqyNj1BWtqrutZTKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YjosvzjgdcjCjdoOCeTBDS3g1IAoxLF3q+cayxyToYdBp7NCCZEqmAMnYtKLx+nYTVGps3C6oALQruMfhTj20JGy2b0zTDlrcnXp7Ip4v96PU71uDWFenANVTvQtbSttfsu8/xMUST8i3QGf6cXLBFlJnmEE6nwZ/LUPlk0yChs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nckDosPU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223a7065ff8so48093675ad.0;
        Mon, 17 Mar 2025 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742229492; x=1742834292; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aTPbj1b195DRbTb39Xzp9sfX+PKRZYgeC3LAILUOanI=;
        b=nckDosPUoeq772CsH3bTFbbKBqmGUoShAarXyPMxIEgIGEHPXX7AKy3/9QtCCsX4oR
         9X58GK16Zp17vb9Im4VYpR7yoeSWRypXPS2vRV0JEkX+j77DZYza4FdMi1lLFStuI+8b
         Jy73tfCs3gyFBVuWki8PISyuNfAZR4Bbry9u8wgcos0IvrTdGh1oW5DePOcG6i/U/3MJ
         hPEWpqtjDeG2IsXqGrBe5BBp8O4KYGsEfuJlC3bIbHn4N1RZyREKAObcsvAhZZ6WwlC8
         aTdnHn5i3N2VdwNtt7TiXChjzyGj65ryX+5tmLqjianZwjxBvPFDJXjaHrDjQBNNjNba
         0ipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742229492; x=1742834292;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTPbj1b195DRbTb39Xzp9sfX+PKRZYgeC3LAILUOanI=;
        b=dY3zfnYg7Wg1zOvgNeN3CLC0osmLwIK+PYM0b4Lc5k/9dww2b92Y0nRvAuoyT2umVD
         292C+RaTEyWVZLxV9PIW/Ck7P1dICTOGiRqzX1Q53fVLfSc8NnfgqxcWpsTWE5opyPr9
         Cm3wzAk85bsrqCbzZxg6bO/DCd8x2d22tzsNdwVcwE5Od0gAbfsURlNbvrZcxdsQ9FMb
         9S/+7unULgrY9EXIOmuEHq/3jD7vfjyINpvf/kVYAqTQM/doEcWS4/9TIXiVHdBF/tN+
         DXGQuWHCMhIt+B4Dp2fTgkqPKqP7ZTfx46vF9X1m1kwVkltTaFM1ULjuZmVaVZrbadEi
         QZfw==
X-Forwarded-Encrypted: i=1; AJvYcCUAXRnFaXnnUhWsfHNTHFLCLzKJp3cwkHXkiHvQYvnlAM0rqf4v9UfHyAtzSt550TrayVTiooQHr8SlmHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyszOSY0O4u85uJw8pLQDZrqKje6epIHriGP3tOjrvUcBZcMk3d
	VFGUYW+/lplpRSTcFCzxdKYftcObDNoe0Dt/eVjuSexmzOHproHR
X-Gm-Gg: ASbGncvn5XAzxAwA6zerNbGiR+D7KdZkaSA5YkspNgdcpLHSH4UhOw9lGeHWTbUMJt4
	swVcep+DpSnI6dgW1RgZs2DCbhOARDd6jwKBHRt5cC+6I3i30Rc2feskWaTUpwf5N1TAJ9KrHI2
	0IePXbcb2vvNZICD64hWaVe960C4o8Ybv5Y2OQGk7JbnQUKKJaefM3t2GtSKH1ao7aNPrzNJVg5
	xQycqQo0/9lqU3neIdKX1x/RpdbyXVJu07tdIrbI7SxD9/YWd/utekz5I+fmxWycuNspV88GaWl
	r4T80f2Vb78Q3pm2Al/CvD+yyinKwEZ4aoRjjEBp3eCsqoE8m2tAZi8UluVu5nnzmz3lPvLokR6
	7If4vQAyv+/UHsqMOpkDAxA==
X-Google-Smtp-Source: AGHT+IFe3Ho08AMwCSP9qaSJjjg0vymK1Bqccz/fxA/lGP/fvE3RTVLTFzTwPodRuymd1I5f+3DYng==
X-Received: by 2002:a05:6a00:b91:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-737223b9098mr12931895b3a.11.1742229492005;
        Mon, 17 Mar 2025 09:38:12 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b3de4sm8038387b3a.179.2025.03.17.09.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 09:38:11 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 18 Mar 2025 00:35:48 +0800
Subject: [PATCH] gpio: pca953x: Add support for level-triggered interrupts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-gpio-pca953x-level-triggered-irq-v1-1-0c4943d92425@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGNP2GcC/x3NQQqDMBBG4avIrDtglNTWq5QuYvwTB0TjpIgg3
 t3Q5bd576QMFWTqq5MUu2RZlwLzqMhPbolgGYupqRtbt+bFMcnKybu3bQ+esWPmn0qMUIwsurH
 1oQvGu8E+DZVMUgQ5/ovP97pucduLX3IAAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Patrick Williams <patrick@stwcx.xyz>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742229490; l=4418;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=9t1pdawn2FZ7NWIdQ/GARUR55HAqyNj1BWtqrutZTKY=;
 b=NmrpVUZDoBEM42UHCMuoqqpPb/tFVbCVz2Wvy2ehlwCtBlbWqYo0zb/mMFrUsu3MQxg46S7AE
 9fxvjz5/ak9BL7bUemDpyIeAlincSwb7bQKK7isxpV4m2aVi/rbGID2
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
 drivers/gpio/gpio-pca953x.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index be4c9981ebc4..2c4034b39aff 100644
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
@@ -875,13 +884,25 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 
 	bitmap_copy(chip->irq_stat, new_stat, gc->ngpio);
 
-	if (bitmap_empty(trigger, gc->ngpio))
-		return false;
+	if (!chip->irq_trig_level_high && !chip->irq_trig_level_low) {
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


