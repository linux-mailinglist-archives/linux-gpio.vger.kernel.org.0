Return-Path: <linux-gpio+bounces-16675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A78FA477F8
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 09:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB2913B11BB
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 08:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FED227E80;
	Thu, 27 Feb 2025 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qREKVhqc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F21B227B81
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740645476; cv=none; b=hsb5ZMMSC+5A/JZvZ6EPUZp5HlRN0AnNZls4kmLcBIr5tnc7W1Cl5ciWfqDE/s0nyuE48F8XLq460Z1Yf689D7pk37w7es8iwH4naWQ4nwLSa0SbB2sr4WuFCNWlzHjAUnTLt9rkzp6Jhj+oqKfoS4AjPjrN0WzoKXw1yg9t5Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740645476; c=relaxed/simple;
	bh=u8vigGjAaMQvBBuQ8bp/AyqnsxKM4sSkXDlgfvFZCMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+/996NHG2squorcgGZxJJtr7cIjMdhX/16Qm9wqh7TRfdZDU5G4+j5fFzMHvkXjv4vGFeiGjTVSW0DKQZnMu3A21jw/ER+UdB0PsUgx/kycLmWSU8hKflQ59/Qi8VXqAESKcttnGwlS8Vkv3pGT05/+kpe5Kn6LV764CPq7cUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qREKVhqc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so367366f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 00:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740645472; x=1741250272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqVMnD1+GtMM5zFymro1Aj7xaYR0IcOz2yMl4sCZCxo=;
        b=qREKVhqcD0plaZPrNlwx9Uo14UGTFgFpaq8ZGwOecoTJYkQQKGbuicWyGpYgYwn99J
         AL3cM/VIXdXJP6e/LT3Bx27oyAd1bXj6lwXQ65PoGu3/lGVJME8MJZ+9cPnr+/hcwHNC
         U6MHw3y3nNH1ehjOL/zJxMijcq9QiJ+hL009uUxR2+a+jvMsZfuvzvTTJ9P8jUnza7U/
         +V9V6KXdIetCurPAAeL8SnP0ytOLsknkZ/Hb+DBsjeUBxu7+X5VZYG1DVshRy7XE8qED
         yP2/ALmlpC+AbArV1Aq3T1mhtlJjdwqMmCj+8F1BLhp4bdpZ28e9xiuf8yuKu90s0k03
         Ij8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740645472; x=1741250272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqVMnD1+GtMM5zFymro1Aj7xaYR0IcOz2yMl4sCZCxo=;
        b=lyKpssmphWcwQ1otPYGnQmusNDVLEHV/ruGHkRIXU+bY9e4JxaCqenr+j1kuK8wwlS
         YJarqCyo/xG9D+c6VetDjFtErvL9HMh2LRSdtyo0LCo/Nux4ekDAYPflFH4z+BrV15mf
         OLLG3MJLvLAYh5V2erpeZQB9m+h3noZfemnpVHOrXIjpxVYXjSHTORtHdXy5HX3Oj60X
         BQ/JkuE2vIpJVWMvm/q3BWm8LPT9y61HYGbL8JbCEwx3DLK+vyv18Fm7CXlpOEkiYiTl
         7lH5D0fE8PO0PfRfqQtTZLZIKLQjpTOzDxFrdNPagPHIr+lAzF+8EWDXd7u8wRRgwF7J
         E9jQ==
X-Gm-Message-State: AOJu0YznI20KlLGvh9nQmv1H/SWWzEqlEv2wQySHYHyFYsNVwZzCxU4F
	Jk2DC+MgrsQnVfWt690/UvV+Wc2H0DLEb7XmQ0rl4S2TrADiYeElFeO8vMgE3Ghp8YkSUP1w3oy
	FLj0=
X-Gm-Gg: ASbGnctPg49PFm1Lve8vJ8BiWKpa7bE1CwbJeDaFVqPZkFgd3jvings8eC9NotiUsup
	cnimtoxRUrIysTXkMEdSF3awTeyci0gI5eMC0v16eK621h0S6n+8kQhDCtd1EEgv4Gdahx1x9w8
	14Bd79Hw9AG1P65/OSIO3Ocmxceb/xclvrDGaoRowP+mfA6nKpySxLe+0iCV3oHtaQoevd5f1H3
	Rp+cUccngb3LfTC7iCzkS5ICDEximCCh0f7zBHMRV32HAXol05nuDpfvXEX1y2mSi6RffXAHKh2
	MgRw6roCDq6s6G8y6f77Sz+nkQ==
X-Google-Smtp-Source: AGHT+IGFl1KxTGfaLHV9H7+brnJu5tqMqU/6gqiVfNJ3Es6J5KBHCTaUKEPrjOIrFWK26pSGozrvIg==
X-Received: by 2002:a5d:5f93:0:b0:390:e195:33f3 with SMTP id ffacd0b85a97d-390e1953549mr1566963f8f.49.1740645472610;
        Thu, 27 Feb 2025 00:37:52 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b50f:c403:bf52:2dbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e479608fsm1313765f8f.14.2025.02.27.00.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:37:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpiolib: update kerneldocs for value setters
Date: Thu, 27 Feb 2025 09:37:48 +0100
Message-ID: <20250227083748.22400-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250227083748.22400-1-brgl@bgdev.pl>
References: <20250227083748.22400-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Value setters now return int and can indicate failure. Update the
kerneldocs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d0108cf2ee0b..4671a66f5672 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3764,6 +3764,9 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
  *
  * This function can be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
  */
 int gpiod_set_raw_value(struct gpio_desc *desc, int value)
 {
@@ -3782,6 +3785,9 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_value);
  * This sets the value of a GPIO line backing a descriptor, applying
  * different semantic quirks like active low and open drain/source
  * handling.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
  */
 static int gpiod_set_value_nocheck(struct gpio_desc *desc, int value)
 {
@@ -3806,6 +3812,9 @@ static int gpiod_set_value_nocheck(struct gpio_desc *desc, int value)
  *
  * This function can be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
  */
 int gpiod_set_value(struct gpio_desc *desc, int value)
 {
@@ -4230,6 +4239,9 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_value_cansleep);
  * regard for its ACTIVE_LOW status.
  *
  * This function is to be called from contexts that can sleep.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
  */
 int gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value)
 {
@@ -4248,6 +4260,9 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_value_cansleep);
  * account
  *
  * This function is to be called from contexts that can sleep.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
  */
 int gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 {
-- 
2.45.2


