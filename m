Return-Path: <linux-gpio+bounces-26909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8B5BC4653
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 12:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D67AD34C2E1
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 10:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0002F60CD;
	Wed,  8 Oct 2025 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uTOykZeE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD7B25D528
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759920197; cv=none; b=pVcnWyvvUHvrfKlASzZIM/5juzG52k0719lw9zdbJ75i8cmoxQ5LJDqOXtr2yGVGBLCComIF6h/4jjl+z2OliQKWzmHN5Qrg3UZS8Mou0duoIm5uomeW+1VMrdVMmdarPJ3dUJDv63X8Yub1rh8HfdtuWum2GKPLfOBg5WdLpac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759920197; c=relaxed/simple;
	bh=U/u/eowxh8ykqWPluGt9cIUTMqfcuowXol040OAY1I4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=gUoYlRKfiWIsdWrwIHxAsHtWCshPNbRiluWSeBAEH764TcRf9eIdZZ3qZHd0HRNgwJnhdgoMqW0/iUv69q1vvCYwpFFA/Q08cyLjrGB1daL7KwR6Mdkj1Hxmmy3Tr98eyAzcShMfFawt8MTawzacaCFWXfiZjFyeiPHyOvKkvLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uTOykZeE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e4f2696bdso87555805e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 03:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759920191; x=1760524991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0OwMCCoD8ii8nGpV6xfgZoqUxaH6ChQn4Lw2SHUWEY=;
        b=uTOykZeET6pD2v3wkCZiTIDTXBiw1DAMsgmjniBFnCgUyplO33KQ+9oyn1LCtkRbto
         0b1HuidfDeGCsiHBfrDxEraVAVZngfXSIurS1JzdKfcBuxCm0DhjOzRNiz6Et/QaNAFh
         KHjnsin6l5MaaKjydO+2OUXXE6JKj2zvgMbFhoPu4ewj6nNQkTdt1t4Liv/hgO+NNYDY
         FIOJc+FPvCFhhwFFSLvE2/RMe66gRNhBWTPm0+xyOWpH5E1ZJnT2t+xSDTTeS27ttSSS
         FONsFIp4Bp1A6qP6hztldLKQhQazHdxo1Y28g4g3/SmmyL3grLvkAPcdEViV4Fi2oFdW
         BGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759920191; x=1760524991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0OwMCCoD8ii8nGpV6xfgZoqUxaH6ChQn4Lw2SHUWEY=;
        b=h4CGNs38EhksEiU2CVj+6+sQeCXG5da8ikbunYHfYHWCoawTWWuvXs3fYnw9Jp4Me5
         ipbHXTIEVp6Heg+5k1ymyqlE12LR+jpU2tXOV+LBDYAzpvnc819liW/TaYkID4ECeZ/K
         Ht+9YSaoaD/8ajmKoUbjXxux9UYKvNgrvGOJyZ7MWfwrs/xxuoplQI9mgRe/9kOLmIYO
         MccRY0+NvOIXZA7+6mWoDRDq8JeEt/rwNE8hyyQZebIIulscgmufovEmExmKkyIgl2N9
         VAGs24ilWu9KPALpGBCJF1mIu8rXtj5WaeestMm1XZ751IIk25NK9IOGdE6N/MYDTriD
         3Lvw==
X-Forwarded-Encrypted: i=1; AJvYcCX8YPguRZoER+zFs0JwQwC7t0vFLf5XXQVtaOoE/g/qgOuMzhNXdnzYXdVo4O+5YWdfsfAYdBs9zCOm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5SzBQq7qx4gEUjRWmxZS3GI/SY7tp3y5QT0w66+0CceJkwwqW
	4+ql+/3ILkgvlGTqGn8MKuhidmBCC4M2HMCcN/BFQU+xYpmwHjM1VDhpNJQz/irgTW8=
X-Gm-Gg: ASbGncv+dYyZnkF8wTbUs2ALENFYFuFQMB1ue+TcJ/R0GJy3fermFTnoKMGfPg0TmfV
	NpZ3F5Gmiy/J7jn/oG1AdmkAS9Rk7Phn3s8WLw9hUk/b1HjsjdJ3RLeB7v0BndbZR9O7egbCgec
	q2YxW0japKVGFphvtAZ7Vp2vNCFUZY7n1UhFUxXgdAFLCp7wdxYWMbl3Or2gqa39dexaBRpSJfq
	9XZKjcv4H2bunPLveB73sK7+kEPcAkafwhE137Or04chYWgdHc72MmY8YcpAqB6Ig/c9Yjm1/3P
	OuJfnSRMmX8VCE08CviJjckDf8H8XojxSChE1zRUldpm1G24NaCdvan7EeMDh/Kl3JvR3aAU947
	DJx5FJpbhxpNX5wdzwUbDpMdhKnHAErLjkMZgp33NbEVCt1jQ62shJV8YM0hhu93ZFDSlWvlYJH
	Y=
X-Google-Smtp-Source: AGHT+IFnLxna9eNj0rGHU56dyhE9tf90bbvm/Bs51unq1s9ZiRzsv9xGR7isXB0YRqeC86NSqfUd6Q==
X-Received: by 2002:a05:6000:2f87:b0:3ea:63d:44c6 with SMTP id ffacd0b85a97d-4266e8f70dcmr1846995f8f.35.1759920190710;
        Wed, 08 Oct 2025 03:43:10 -0700 (PDT)
Received: from localhost (mob-176-247-60-194.net.vodafone.it. [176.247.60.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4256866060fsm23607749f8f.14.2025.10.08.03.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 03:43:10 -0700 (PDT)
From: Francesco Lavra <flavra@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: pca953x: enable latch only on edge-triggered inputs
Date: Wed,  8 Oct 2025 12:43:09 +0200
Message-Id: <20251008104309.794273-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959; i=flavra@baylibre.com; h=from:subject; bh=U/u/eowxh8ykqWPluGt9cIUTMqfcuowXol040OAY1I4=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBo5j/w4fHdAUy8GeDL3yYxoY0qDCS6GwYHvmn4v xV33kL9OGKJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCaOY/8AAKCRDt8TtzzpQ2 X0K3C/9s3zWhGO4wTbp4h46syZWk1Hv4c5jc4jN7NqZOpE+l7dS+ipawX8ISJixlDP/VpvrivkT 4m7AOaJHmZj29wlcjAL3aA36YEmMq6yPU/+D/Nkx7qR25Yik/Slfa9XSwPHA68Tm4QneY+2oO/y vVcV18/vItdV2GyPtjwoFoJiAk1dp52E0Q1N4klePyasqMzvAVhMnjLUsw9lU15GRWMuL9esmZG OMJ3QsFQdPqUcTOhMMjNETkElZq90elD/idcj6+uC6UKV+tI+WWJW4w53IaEkMGySPs4tMEDprL id2L8+egN7B+1mMJnDNIR1KWc5VwD7IYk/HF5lBD2EaBdH4+f635HnULaQTmxRoFSDx95BBy/5q aS6v41W/BsQZVU4dcRPBliwXE8nGmZdVmE6daPJSytfmxZqIC9niMYnsR8S2aqbM0NapvkEUZrm 1olLMt39IG5XOv4+iD8OGhDtS7yiYww7Z7O/h2sBf76Nb3pkLHwHSvuF1pAj4/YeSUeI4=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

The latched input feature of the pca953x GPIO controller is useful
when an input is configured to trigger interrupts on rising or
falling edges, because it allows retrieving which edge type caused
a given interrupt even if the pin state changes again before the
interrupt handler has a chance to run. But for level-triggered
interrupts, reading the latched input state can cause an active
interrupt condition to be missed, e.g. if an active-low signal (for
which an IRQ_TYPE_LEVEL_LOW interrupt has been configured) triggers
an interrupt when switching to the inactive state, but then becomes
active again before the interrupt handler has a chance to run: in
this case, if the interrupt handler reads the latched input state,
it will wrongly assume that the interrupt is not pending.
Fix the above issue by enabling the latch only on edge-triggered
inputs, instead of all interrupt-enabled inputs.

Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index e80a96f39788..e87ef2c3ff82 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -761,10 +761,13 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	int level;
 
 	if (chip->driver_data & PCA_PCAL) {
+		DECLARE_BITMAP(latched_inputs, MAX_LINE);
 		guard(mutex)(&chip->i2c_lock);
 
-		/* Enable latch on interrupt-enabled inputs */
-		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
+		/* Enable latch on edge-triggered interrupt-enabled inputs */
+		bitmap_or(latched_inputs, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
+		bitmap_and(latched_inputs, latched_inputs, chip->irq_mask, gc->ngpio);
+		pca953x_write_regs(chip, PCAL953X_IN_LATCH, latched_inputs);
 
 		bitmap_complement(irq_mask, chip->irq_mask, gc->ngpio);
 
-- 
2.39.5


