Return-Path: <linux-gpio+bounces-14731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58554A0C455
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 23:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B2F2162E27
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 22:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA68D1D61A5;
	Mon, 13 Jan 2025 22:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjjDv+9q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF924024E;
	Mon, 13 Jan 2025 22:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736805797; cv=none; b=knPUoavShDo1/gvn41FLgmXHxeaUEcFsRb8C2jT98QzEm3lTc4fxN1JQD+6a043rCU5lil7cXpvthzepXX8qCR7sXvENBbIzOpZ3jJKFUoUqZnOqcmwc4U8CvqqordKBnjuryGgbFAPpk+at5iyEAjrjD70ODXV2UWc/rfYC/6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736805797; c=relaxed/simple;
	bh=MR0v32dNUF7wohdcuOpzCh95qxOvbpXpv2UKuS4ZPvc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VTqWbFV/6lfTpuAugiO5KtLAwPCSVZ0PtmILC5Gc2+UdMg1o7WgN2L2ee80QyF+pnPOquUK1xbsiID04TK62z3je9bl0lbtdYnbsZk7p7tB8ir3ImwT7hqSAsXckf7wpxlYJpALXIUuy9NmsfyyJO5KP5wv6r0UTp+fM/cOa/JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjjDv+9q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385dece873cso2368563f8f.0;
        Mon, 13 Jan 2025 14:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736805793; x=1737410593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iV/kdV3Fg3da90WgY68x3JI2QaUarDSnJpDCxlaQrsg=;
        b=OjjDv+9q5+GfDt0eibvUJ8dptevcN/7i9hoiDOEvLhHd2PAxzz0XL1gium6lWgkNpL
         Inzhfnv7H6Ey8vQkd+hLrLTKvKYQiacsZtb8iJj7wJ6rnfE2RPmKwyH3KT8lTZZdmZAs
         1tY4yE+RW9AGEeNfQJ8v4w6u6h/+nOHLP+50sm9mVUMMWw5liaG/bxTCs9cbwmHZut4z
         Tiz6NT4NVDLGCct2dRDyIxx7h/YbBwi7dVnzHkgqZFuGjwnOpcbNk/5Jj6z74xzdsZ8S
         VSDXysNL9EKIKiUReqUPTyMstLdL+ToGqOpIP9Z6bp2Qqy5/Q0DQTTrOHFWS+afeU/z5
         fHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736805793; x=1737410593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV/kdV3Fg3da90WgY68x3JI2QaUarDSnJpDCxlaQrsg=;
        b=Cq1eG93ycgn9twY6UjBputFLZRBurEw/yjPWo4/8WIX3y/mHqSbgFNR8iOAyyI8+Qp
         fMNk4Sj7cURZsi0k5WjM9O2uyNZt99hHM7z42HEkz6F9SONQYLWIsSt1MY5nFzH9BgXn
         Aljnr/Fe3iPuXJ3UhzpT/eDAXBulrOrpg6GF/Ve82EcK5Joy93/+7AGlUt7Jw8YBDmFQ
         1iLxCXmVv9DfU84CvB81SpPRDTCG6SK+I51WwkzO9vDcjTBRfuzTEk6tVTbo64KSNJXq
         HRdBnVTmS/eu8zks1Dvi87/Ivx+SZo0r1zXIlhNsF2PejzX4HFP3zXYPm1PP0aU3/bfZ
         acxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN+NOY4UAGUUDJcoeqbTb386g7U9ZushlhIvy0ZzK4Rz30JLme3hvwbhlpOIeR17T61KlvjOUUsye4RUCS@vger.kernel.org, AJvYcCW33OvSHCYZUROtnWfluh6yNT6dvzGiqV1XVc+ztNmtYY1FW0L2fUNR+QAGHgARAEshGf/pTdHAgxcN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt0T+3ssEEVdI50b+IeEIm2WxqKhqCw5+bVuDphndb/LdqeR9C
	54HKnX1NHRrxI4EGMWmI3Z4Bl87ld6PvzM9xeGo4Yj/fZ0HwCjII
X-Gm-Gg: ASbGncu6ZmRMg44QQtGQcGfGCNoCLG3eLetVq4/f4i7o/AGdNAWaWJhIwOxBA5sdofN
	Vj+qKaM44UYYe4ZTznB7c1iQGHiXCO1C+4TPcW64kFjWMvqJ99VrECAAwJtVKk9jEHKJuVEPv22
	MPPNuck6m3BrK/IJYLAxGZ7ViwQgGpdeu3UxG04aWA5Y/KZm53JVVlOeUBh+7rmOJ9NNpyNndiX
	viAFu3Mi+eIBat8ezGP0gpyZ56eA9poYSoHwcI0XcMlR71P9s6JgoHf4kX4JH041Rw+CzNwpmxc
	d8Pzcg==
X-Google-Smtp-Source: AGHT+IH4EHaxD+SgSy+BdcLZYeIcZLTBxTprU03+XOHASwPexAsRbYyBhqQ7SZmW0bkpjXb4q3GTVQ==
X-Received: by 2002:a5d:5f52:0:b0:38a:50f7:240c with SMTP id ffacd0b85a97d-38a8735760fmr19104134f8f.47.1736805792891;
        Mon, 13 Jan 2025 14:03:12 -0800 (PST)
Received: from togomori.. (248.223.66.37.rev.sfr.net. [37.66.223.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d111sm13498823f8f.18.2025.01.13.14.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 14:03:12 -0800 (PST)
From: lakabd <lakabd.work@gmail.com>
X-Google-Original-From: lakabd <koute102030@gmail.com>
To: mark.tomlinson@alliedtelesis.co.nz
Cc: andy.shevchenko@gmail.com,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abderrahim LAKBIR <abderrahim.lakbir@actia.fr>
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
Date: Mon, 13 Jan 2025 23:02:22 +0100
Message-Id: <20250113220221.13545-1-koute102030@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e407b7b58c966ee35e023618ad428a21f979e761.camel@alliedtelesis.co.nz>
References: <e407b7b58c966ee35e023618ad428a21f979e761.camel@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

I'm encountering exactly the same issue, and there is indeed a problem in the process of pca953x_irq_pending().

Mark has already explained the issue, but as apparently the discussion stopped, I've tried below to add some details to help better understand the issue. I've also a solution to propose.

The issue:
In the current implementation, when an IRQ occurs, the function pca953x_irq_pending() is called to fill the pending list of IRQs. This function will accomplish the following (for PCA_PCAL):
1- read the interrupt status register
2- read the latched inputs to clear the interrupt
3- apply filter for rising/falling edge selection on the input value
4- filter any bits that aren't related to the IRQ by applying a bitmap_and operation between: value calculated in step 3 and the value of ISR in step 1
5- return True with the pending bitmap if not empty

The problem here is that any interrupt that occurs between operation 1 and 2 will be lost even if latching is enabled !
Example:
* Interrupt occurs in pin 0 of port 0
1- Interrupt status register read (port0) = 0x10
** Interrupt occurs in pin 4 of port 0
2- input register read (port0) = 0x11 --> resets Interruptline
4- bitmap_and operation will remove the newly changed bit:0x11 & 0x10 = 0x10 and the returned pending bitmap will have only the pin0 interrupt !

The latching helps with very short interrupts to not be lost, but in the situation above it is not relevant.

Proposed solution:
In the 4th step apply bitmap_and between the filtered latched input and the bitmap of the unmasked interrupts. This will ensure the same outcome by letting only pins for which the IRQ is unmasked to pass but will not remove newly triggered interrupts.
This new unmasked interrupts bitmap can be filled in pca953x_irq_bus_sync_unlock() when an irq mask is getting set.
Also, by applying this, we can discard completely the read of the interrupt status register in step 1. Hence, the only I2C read that will be sent is the read of the Input register which minimizes the time to interrupt forwarding.


Signed-off-by: Abderrahim LAKBIR <abderrahim.lakbir@actia.fr>
--

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 272febc..886a287 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -215,6 +215,7 @@ struct pca953x_chip {
                DECLARE_BITMAP(irq_stat, MAX_LINE);
                DECLARE_BITMAP(irq_trig_raise, MAX_LINE);
                DECLARE_BITMAP(irq_trig_fall, MAX_LINE);
+             DECLARE_BITMAP(unmasked_interrupts, MAX_LINE);
 #endif
                atomic_t wakeup_path;

@@ -763,6 +764,9 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
                               /* Enable latch on interrupt-enabled inputs */
                               pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);

+                             /* Store irq_mask for later use when checking pending IRQs */
+                             bitmap_or(chip->unmasked_interrupts, chip->unmasked_interrupts, chip->irq_mask, gc->ngpio);
+
                               bitmap_complement(irq_mask, chip->irq_mask, gc->ngpio);

                               /* Unmask enabled interrupts */

@@ -842,11 +846,6 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
                int ret;

                if (chip->driver_data & PCA_PCAL) {
-                              /* Read the current interrupt status from the device */
-                              ret = pca953x_read_regs(chip, PCAL953X_INT_STAT, trigger);
-                              if (ret)
-                                              return false;
-
                               /* Check latched inputs and clear interrupt status */
                               ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
                               if (ret)
@@ -855,7 +854,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
                               /* Apply filter for rising/falling edge selection */
                               bitmap_replace(new_stat, chip->irq_trig_fall, chip->irq_trig_raise, cur_stat, gc->ngpio);

-                              bitmap_and(pending, new_stat, trigger, gc->ngpio);
+                             bitmap_and(pending, new_stat, chip->unmasked_interrupts, gc->ngpio);

                               return !bitmap_empty(pending, gc->ngpio);
                }

