Return-Path: <linux-gpio+bounces-21151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6C9AD3252
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 11:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44673B58D7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 09:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1C328C031;
	Tue, 10 Jun 2025 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3V9xgL5F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793028B50A
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548412; cv=none; b=dhiOyvapQX5TUjw67xG8x9drHS+5sUjVcbbxTEgCR+O94nWPpoGZymbKdsiB7AorOAXpHJlsYnW4Q6qakKV5LUlaS22lils5dqjw+j6o/+41brFAvBXQ13GXAE//8eqhMOmDLgDVtIQyp1lYS1XcqtJouh3Z2WSoVHcLk1wNyNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548412; c=relaxed/simple;
	bh=4OzJPnbfFTAG/2npgoV8sSHsu/v3SbNkRCIb6UQqrxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=naBRfKRLsXqHP3WsvqjpAa+N68YAb6LVLIAs4HYSH0hlqMnbm0joVYPaId2KFEHiZriw8+RVZuvSJoNIoVXZBbZltKUN2fbo0RRLJxefA8fIahp7PSZVjqYC04m9Qa7W24vVNJOYEMptNO/O+0VVw0VmnP8OtiNS8d/lsrg3VtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3V9xgL5F; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450ce671a08so33079735e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749548408; x=1750153208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VU/OIVp1Ix9J2HIXNEwTULz0O5cS9CrQQSNEafNoGZ8=;
        b=3V9xgL5F2IxqswQyYBz/ihsi5fykm3MMZkAtu5gSwlcPwee6eU1BAJ0i1k0tTPr0yT
         bDxMt8fnKU8Psiqbmr9hTvawxLMjAIc3Dq/cqgIi/BZKMm5jm0Kw/S7VLtvhZH/mPgnP
         0SNRYCZ8qmFQtZ/Hj4wwbAQsXJmg/enie1akGU/iby3giDD0hRD3nYJY6OujwJTWKPoJ
         MSCiKgyOoh/q/zRo3nd4zAYtnvvTnzqvoUuE/1FXeDkznj2m0at17sVQO2QVrGEGq9eK
         1GuR8F5rFCHOPaIgc3mG8xSgmETwjs5pY3KsNJW8yAwqe6xCuzILjQSPjGjQzVhMxdLz
         PDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548408; x=1750153208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VU/OIVp1Ix9J2HIXNEwTULz0O5cS9CrQQSNEafNoGZ8=;
        b=miMY+pz0hrChCXF5TjG3pua+LskeDh/qhyffJlqlDEZck7EwePrAL8uMmaMn8nlx0C
         oLyPcIqIBCoaIMd4rgrV0OPTaWQd3QQrZTGZSRvLbuXXX4GE3WcTznSXOCcLAFy5ur/X
         iPCVV1eCDqiCGF1Oah8tLOmZtzR3rybYfaWjAhjSS11ahmDxW6GL+oMYjDePHsWWIXyc
         EOLiMbKqLTF/IR6gReFg7axwWSnnF6AFMC+o8PEbkRZsVawW8JY5vIl0V9TNCBXV0n06
         fdHsufqVlz/dMPOo7eHfukX1r2cXa6UU8fshAzqwyrHIkLMx80zoOyVHcK7qbMo6IASa
         KCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCw1WstUuXJLrzM4QQMD0KywutPoDtcwYGd5edDaGdDUUUxHTCtFuQZsUcfG47cz8r/iC+0rTPPYUB@vger.kernel.org
X-Gm-Message-State: AOJu0YzK8JZM3H8pf0uRQiAUl0YJpfb4nzDKod/BsBgNyM8mAqfaEYTZ
	s3K/Pfdr3EQTCvfve/s1G7fOQaGIO4CJWdKvDa5Vb9qyvaww5bi4zz+Xny+ZxjvFoBY=
X-Gm-Gg: ASbGncs/+A57PyM8zP48XU4ngP17rqxwoezzRzFaPUCaceWLeC34ylbqodbQ2FQyLsH
	E4v47oHXEcpFQGnfdUqluz9bkqF8UiKXS8r4zVmTl/1aNgAfadZ8+Zb/nBxBs0pLIMMfs1w1zkF
	9Ny+b1qJWj17nwm+ZdpJBmPm+mJGG6ybGawZEli3722tfb/RYF55/9tChv0Hvutbs5OylrSYinM
	eqUmekwN9cd98vA3CilNnY5Q9Q2+a9k/8cC/gzYiRfCv6PosxROUSkMBm7rQi1UWvB7fp2e3ZQM
	PeQoBVs1lmBSoq5HP5VXIPLa1BXCBvddsjQHdPeRXBPyOs+Ig2qJ
X-Google-Smtp-Source: AGHT+IHqr4QFKBekkAkLRtNcAcVe6DeuUz/hU7fpOo4EcWZuJA4X0CT7pCaULEQ3bxKSZR2prLHhJg==
X-Received: by 2002:a05:600c:1907:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-45201414a65mr121973985e9.21.1749548408118;
        Tue, 10 Jun 2025 02:40:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709729sm134388355e9.19.2025.06.10.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:40:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 11:39:59 +0200
Subject: [PATCH RESEND 2/3] Input: adp5588 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-input-v1-2-5875240b48d8@linaro.org>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=g2mEe+Yprwpzn/4/9kXNyjawagXdr1kzrPV+thj2Bh8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoR/10c3qd40EIC2XIYd+GggMVnckEKZgee1x73
 UaIfSjLrHyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEf9dAAKCRARpy6gFHHX
 chNuD/0ZjX9cH6gsCOH84FLosGXHz21Db9EPd885OORFVa2vnh0n45TNJt099NWxDcUcfqTfUg8
 Ai+vWygQ6VeAEDaE6V2d7vYMAvQd/Kh08KEeLpmQiZmQBeBAXAmd1i16Ao2qQyUorzVUpkxBbwU
 AbG6rkYDFd3z2QnPSgOwBEfy3vz6pOLEeUcmjtfg10rSCRh4lnZAt0594P/ielQRyoeqhxhkTJ4
 JNNVzEUAyRPeb11hXbkrSep9FmkDksnAeVZcA2tpt9krygy9OM1Msq67dhe1VxHODyHjt9o2khk
 F4FjiBtJYlWSlloRccM2KqZa/z/16KxHLOwofrDpMM6gx/mXJ9tjJ+LlPhuffCTYyvO3D8tha+N
 XeilZdpYUBQGal2+YBNqdmgymtD8JT3qWzKkO4RH7T+mx/QJ6ZUZ5EDXg6V54QN+degkA0mI+tZ
 U9LBbisClmKABFWhTv3BA6KrHt74blXx1zGL+I94S4irzU5eY23dTQ2+LWaU5frWAi9rezydoBD
 /UHSBdktYiHUIMNlAwoAD0t7bth8Kp8KBbmPvys6rg4FZ0xMOenwutozEXgh9aoJKkRW9QR4+eo
 QFhA5mf1m1bywVy6C7TQIHr8FjJb9LmQ/4yrkOhh2KxKI+70SOQMwnOkXduD/A5PXgmz04jdB8B
 PJ42QowSq108Mhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/keyboard/adp5588-keys.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index dc734974ce0687a6e850242b531979be8395b394..2b2aca08423a4ee658db56f77bae25ef5a18e7a6 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -232,8 +232,8 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 	return !!(val & bit);
 }
 
-static void adp5588_gpio_set_value(struct gpio_chip *chip,
-				   unsigned int off, int val)
+static int adp5588_gpio_set_value(struct gpio_chip *chip, unsigned int off,
+				  int val)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -246,7 +246,8 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank, kpad->dat_out[bank]);
+	return adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
+			     kpad->dat_out[bank]);
 }
 
 static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
@@ -424,7 +425,7 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 	kpad->gc.direction_input = adp5588_gpio_direction_input;
 	kpad->gc.direction_output = adp5588_gpio_direction_output;
 	kpad->gc.get = adp5588_gpio_get_value;
-	kpad->gc.set = adp5588_gpio_set_value;
+	kpad->gc.set_rv = adp5588_gpio_set_value;
 	kpad->gc.set_config = adp5588_gpio_set_config;
 	kpad->gc.can_sleep = 1;
 

-- 
2.48.1


