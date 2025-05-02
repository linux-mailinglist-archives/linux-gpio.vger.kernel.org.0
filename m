Return-Path: <linux-gpio+bounces-19536-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC7AA6D6B
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 11:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 059471BC3B19
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 09:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3858022DF86;
	Fri,  2 May 2025 08:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PCFKe6fc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9F524467A
	for <linux-gpio@vger.kernel.org>; Fri,  2 May 2025 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176397; cv=none; b=oZsL5d77GWnuwlOdLuCX8AB9VjiMDghxNX5cwC1sbKnxwcJsyZl0R9RgRV934XSTWOKP9WGiMHb7ESpP7sVFJUu53ar80H/PHfmMFkoqlIxd4DNDX7ygYMnFspOPmLuO6hFZhCUDyp22aUfPvH856UifED7GZ1pFq3RxV7IPz68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176397; c=relaxed/simple;
	bh=0rvyNRmAVs22sEiy/QOTFVu+897s6keqDCf6txYk6JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YC0JDl9FSdxKm9/3+H/U0u1L7M3ynTlwFeQ5i8bcGQ2VZy1FjM8mjmFAda9l31tXsnVaTHR+OyTlcZJnPWwLHdmir9nZOl2GJYw0ErNKdPfeBh8XBbaF1RKrQsfXf4MjScH33BwoaO7AuU7I7vXj8kpCO9w2mtaaTgO1c8sV6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PCFKe6fc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1703344f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 01:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176393; x=1746781193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN+18LA857SctMCPq7PChnoB5bYuEFe9lArdedXnm4g=;
        b=PCFKe6fcmGYcvL0JzflxqYFd9SH4b7F06hG39DcUAmwgJWlnBozTdipnUPjmNMmvFw
         4NJde2XmNVx0j8IGYaecNFWgGAL1WQJv0a6JOp6d4WDNfo2K5cc5UonwF35TkZh+ix/f
         Y0vE048ZWfjEpoE2NNYiqarUaM1YiEt2HoM3rWSG3r8IDsyfXI2aIQpgc431VthYKqBL
         aDm9JOqRNJouywOx6hkMTkwoNarjioTdBKnNolybDLLDNvFaHnFzH25Y7EJu62vwedYP
         5z6UroZtehJreQkXHcpHfMTQnelNH41NomHh9q4lHOmGnPxkMXF9zkIrWwyPBb0iOiMR
         ImJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176393; x=1746781193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN+18LA857SctMCPq7PChnoB5bYuEFe9lArdedXnm4g=;
        b=LF9KiVAOvQzL6cbe5uELsoI/a4KmWAaxoJp+86jlK+L5y01bBVu/z5Lz0G9sC8MQOp
         3ZruWav5U9+v/4V4xaZuo1zA4tPAecJw0LX+y4UBgiFNbWofFtxwRJ4tb5/W3Nvx/F+S
         pdpuAIGEaBSnRSGcESl0sUkgse7ELZvXGtPIEtTbfpCqrFs6m+Q4esinBQQAka7UPaDw
         AF3WNOhw/jAm+ZbkiEpxQu50J2tGbvJ4jcS1P57kcglloG9nO6pP5BNX6j/40TtM6gGm
         HgHnL7WXc3mResr4qCKBJPI9+mfV9tqykenzWnawbjk15jEA+RBzc1XBk/spU/wUAWT4
         dNuA==
X-Forwarded-Encrypted: i=1; AJvYcCUwmwLjLCCQ1ByhAG3R1bdlgflXcebsdeifynkwDvSz8zc4A+srZyolb7JzGP9LmU1+uruIgeB2W6zg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ZCJPR7xvj7Zk/d+E0ZmLmG24vu+BO11Q/i1tudigfzytaWVh
	V87atGefX32S0PzfD/bZv9YFEmfGDjdC1PeIy7uN47toxVr5LxlE4sVgdZ6pmKtPUY1g2Nmnh1k
	EK+w=
X-Gm-Gg: ASbGncu7v47Icbed08pJcNLxBZA6YB856fVYHf6u2iLeWrooKUfZhG8Ty0Ya6Trg5Mw
	11njJM79KpVB4SNwTjMSyfhO3EsqWkIUmkmZcrg1vTy9vxLwkMEsXH11SB8eml8c5jx4e9vZiIm
	T/63sWb9zDCn4uNiaO6KrxlDbelfG35PjsqvAKLI5qWVH/jjtpnlDJJ5HcCDcNGHvEipAMRIBOt
	Fhd7oZ0R4viRZCThV4eNqNIVCwEOi+Buyexg0141QXZfADePuTzW5LdtszSflz4PjlI/i7/dAmp
	iFnbX95uV0u6Xl7g9/j7QUD6cgSrEBTCKEU=
X-Google-Smtp-Source: AGHT+IHdDxSM/FWZRtGoOZpkx03AgkDUaEUG/u3se1MxfUPpvgHvDAXIO8mVc8mZr+ucaQ37xObY0A==
X-Received: by 2002:a05:6000:4210:b0:3a0:8020:8aed with SMTP id ffacd0b85a97d-3a09846404dmr1749548f8f.21.1746176393327;
        Fri, 02 May 2025 01:59:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 02 May 2025 10:59:48 +0200
Subject: [PATCH v2 2/5] powerpc: 83xx/gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-2-488e43e325bf@linaro.org>
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N5uZ2gnFZdQj3L5KTNtg0bPlLnvDhqttnz7x8ZTZmpM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImF1uingLTiEjC1c1U5yBJ6QKL/UetAJDwss
 2MfnCf+vDuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhQAKCRARpy6gFHHX
 chpaD/9ia9Dv5hQRbtr0XBXvr4ParzZnQUg3MfXxDNrXszqdEGfJSGKw7ZvkKLFOajdDIdiP21F
 +/oHoYCMeHqai/Kp0EB22ZbR64mqrJb5+FHSI2uD4cpAVDggq0ypV9agRCKnY+kLuo7k1RWF32+
 TGXMRWRnzBsHLR/kYMPJEIFr2i6eCZbmIPSM9MpYmNJEZDAhljJRCPR2nC1MAmEqwLKBVOTOb/s
 R5l1OjrR9qkcE4K24qYfSI5/FD8ZMwvYF6EMz5jq9QdoNhwDTuiRmviA5wInU28fRNGpMJDHRGY
 Yf+k152e4dGm2edm9Q24ifx376enSdleBwyLbMXNo30+zTBDE58cuVqq95N0VruBoCfRXCs1wgI
 tR0VRALJdNnJaPtcNLT/Mo+8TJDEUIjg2Ok0MDlPe24Y2qA6AEpfAjTgs8YWY0VHsbDKxSfPQeb
 cjcP8Za1icbhGvpGdEHCZf9s2TWCU8eiwblsP/ggElw9wyxKIV4wwgLgphcmcXniWawlIlz4ehE
 Idwbmu8vIXSEuRuX0B2qXxPcejaNsg7jGA2i285fXa3api1N8J7QZS/pSVT3/AybJBRYqNLKCzO
 +BwMIxr4BUlUej+Kgchh8Qfu5MurvtggZLBy1KKI1EhoiMgoezZzWOfS1rvZDVDkJ7GUZZraHi/
 wlE0XEJAUuwQByA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 4d8fa9ed1a678..6e37dfc6c5c9e 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -92,10 +92,11 @@ static void mcu_power_off(void)
 	mutex_unlock(&mcu->lock);
 }
 
-static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct mcu *mcu = gpiochip_get_data(gc);
 	u8 bit = 1 << (4 + gpio);
+	int ret;
 
 	mutex_lock(&mcu->lock);
 	if (val)
@@ -103,14 +104,16 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	else
 		mcu->reg_ctrl |= bit;
 
-	i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctrl);
+	ret = i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL,
+					mcu->reg_ctrl);
 	mutex_unlock(&mcu->lock);
+
+	return ret;
 }
 
 static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	mcu_gpio_set(gc, gpio, val);
-	return 0;
+	return mcu_gpio_set(gc, gpio, val);
 }
 
 static int mcu_gpiochip_add(struct mcu *mcu)
@@ -123,7 +126,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
 	gc->can_sleep = 1;
 	gc->ngpio = MCU_NUM_GPIO;
 	gc->base = -1;
-	gc->set = mcu_gpio_set;
+	gc->set_rv = mcu_gpio_set;
 	gc->direction_output = mcu_gpio_dir_out;
 	gc->parent = dev;
 

-- 
2.45.2


