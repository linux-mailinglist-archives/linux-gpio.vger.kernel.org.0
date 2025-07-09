Return-Path: <linux-gpio+bounces-22952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC1BAFE044
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2869584CCC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F2C274FE3;
	Wed,  9 Jul 2025 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JbNK9ksK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC5026D4C9
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043346; cv=none; b=O6VXYaQ19ltqqI70pRWOq5J6AI9zEvSigDJAYbJeE9BRtfzG0SqFV8/YZkMXH0A6j6zPCnyMpOE69gMH3m+ZiFgwz3Sp3sRh4SHdnhFpTRs11StVg/AX06YPGhkzLwbRHl1wSFsB3K63iVZxJp1nLEkzSsC9DUPmOBZuOPuPzVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043346; c=relaxed/simple;
	bh=4JmqIyjcL42AfFjWi7vst5lmsV+almpJIMRqMtrvkZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1eDmQGqrQg3eTYXAaTi92x2MlJUhaGkPZP6xCuOweOOxF53ytgYWH4ndIqnhsZCbn8Z5IuA8r5O0ztBxX1384NtCCs3lIGxRVMPXETNclcVajIfUHrEDbzv2S9Hrz1jA2nyGs/re4XJaXR7ghKucxvT5Jr6Pi2WjvMnuv2GO9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JbNK9ksK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2899072f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043343; x=1752648143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0GTWsOu9uG2ti17ZWFd+vMXd12l4gYF9Zgggg+N/48=;
        b=JbNK9ksKaTk9WbMQkNAEfhitz1n1Gr0kCAEk0vIqT7BtDpLhtYhnbpwmA4NaQMmRtO
         QYc54avJNYMjZUEUYOxamhb/KhpJJD4dOPC5I+aOIxZufymRmGcSWwPSGokltBMQNy3U
         M4/elNwLbVPZTSynrSjh2ArocxDLYtzkD0UpW196cQ1s7STnpACA0ujKVw6kO7DVFewZ
         oQAvGTGMQofYUGaGKEQzcq7vcayloBCVmsXjl2c9leqmGTjTDf8y9nOc5Oah5Atu7puF
         JQngN1tePV2098KSUzYiWFp4w6ZfxbWAzrtF7sxXpSwH4Yjrqp7il/2FqUJ/EOhEE6jk
         ssfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043343; x=1752648143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0GTWsOu9uG2ti17ZWFd+vMXd12l4gYF9Zgggg+N/48=;
        b=U02LauvnNAIqK4XvvmKp9/s+aoi7XUyqfGokb8OrdrjQEAz1kqqrL+gW5v4c3Khdo/
         RSC21wAtAQSgbbwYL528W5gV7Ct3xEP2NTrfxm+7A5a+ufu4CONfhoxesbJJyHkCMkBO
         TM8RYDuBtpQWYkLrltkI8Mir6nddXgYkX+sAOOnIfsSkMEx3Ji7z8t6lcMSxBHY55BE8
         S8XHdyso9pwDzu2uSL1iee6hWPx9gCaSgSF2NAw5Dir3IgT5K+JY2/DkUjB4fHR54uCr
         JkQ6xaCf3hXiWHJa/sN54mDnUjRg1ENVvi1fiQj5teyJF6uWU2wT7QaNgMYQqSkMeqAo
         P2qg==
X-Gm-Message-State: AOJu0YwnaqMecFWPEg4sBdiH2UawNyVm7NTkGl5in/sCtkdMAwXy1dkD
	n7yquIIy2J08TfyZUDE2sh/7jTZoEgBjmAUqlLQeJbKlP+55Sldw6Fy9T9N+dPoRIpY=
X-Gm-Gg: ASbGncuCQmbEXKV+JjNHO/YkZRv7gZjLc+ZG3RlOZUREBAf2EjVTe3TZ1KirYGxF2Gj
	/6jqmmJzYlOx9sNbjdflD5OMhWV2y8Xs7dygdK2zUbUvcIdT+xfkVoK056Zfun8B5VYinY1t8gE
	Z7VhyjUPSHWglmHz1fHdKf59zwmpWkTf9or1hd6CV3/8Q4RVAZ60A9vwvF4eKMPlUFnuCQCRirz
	KtMZV1y1TxkikzrUxbb9q1cHzbjhtTzGsEH2nv7w8PYT0vXvx69lk7yoc9lbz4mhAoNw25EiBz0
	2CHWSBhkpXU3J0oIhCpZiuhZCbHRHJpwBs+8oO0zgfArXQzqhVLAKE24LqiFuMrcsX0=
X-Google-Smtp-Source: AGHT+IFbVMdr0d75L9LrJuFHc5bAfTPbriBXW9lunAoig812CMNUofxZz8NhxaXM8EzbVQEAg1u24w==
X-Received: by 2002:a05:6000:1889:b0:3b3:a6d1:6b57 with SMTP id ffacd0b85a97d-3b5e450feafmr929702f8f.44.1752043343330;
        Tue, 08 Jul 2025 23:42:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:45 +0200
Subject: [PATCH 08/19] gpio: wm8994: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-8-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bMvwtPNiNt63LSGpmR7OHG6qZ2xwr4UBH+2k6s0DqNs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9CCt462eI2pn9s3uEO4I0tk6oJMy8Tvp+7a
 3Nq0voElFCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQgAKCRARpy6gFHHX
 cgE0EACp3RSpGOITFPecyCp/0Xj3r9cidbDgW1F3GQ9BDbUKvb4s1Yvm/Cp/XgwvFiLzziYKjHS
 Izvo7p30VdlU4QZvfFDI21uaO06VuiDw+hOKGn0W6iebNslxzAH15QKrmc9bw39ZRYdzbea3vX3
 YRPZkLzi0PG0X+Z23xs20DuEsGFISlomz2ICShJzHSBpnzS495xrlqCmgbT2BaegDmlPxz4XPWB
 oa4kBwyt9uiSuxu3Vt6kyHCPBczXiVLGcLIAaaJrrilmlhUPSV7ydFNlhfBihSOE5VLvCQEV3AD
 i/3KZvSTgIv3D9pZAECKrR4ZmCbKujPdqY1MtJEw6loAt3zZx03/1CXMmcY/QwV2SfATnccSbol
 Qk6gT+SSq2uWK0d8ujUtf0PqvHzESnDvLY/SdtId0dN5V0CV+OUUAyz/LEFuQD8uOfrOgiTAmc+
 p0DylAqEuQPpBAGHnJHGejWrf40Ru4TzK143OVIVNYF/sJnmxQeZHu43d/6a14Hd6VU6oEluCRP
 /fSjRuHsSKDnIXr2FKl27mfAgLStmLtLzSJ50eIJpv1dqHl2YrAxFur8s4+zJGwKnFo0q49Tc2Y
 s21SwIPty2xRofxYtrfYojak7m8Pu9RrLW5Wc4XYS9S9j9yKqpi17qJ1Kvb8ZNLS8yuOtP1eH8W
 OdAeWmqZDOYJdIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wm8994.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index bf05c9b5882b89c1abbe7a0617f6a45e2968dd50..ccc005628dd278f2db5e5d8bbefe89dfb1fb2f67 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -89,7 +89,8 @@ static int wm8994_gpio_direction_out(struct gpio_chip *chip,
 			       WM8994_GPN_DIR | WM8994_GPN_LVL, value);
 }
 
-static void wm8994_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int wm8994_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
@@ -97,7 +98,8 @@ static void wm8994_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	if (value)
 		value = WM8994_GPN_LVL;
 
-	wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset, WM8994_GPN_LVL, value);
+	return wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset, WM8994_GPN_LVL,
+			       value);
 }
 
 static int wm8994_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -254,7 +256,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= wm8994_gpio_direction_in,
 	.get			= wm8994_gpio_get,
 	.direction_output	= wm8994_gpio_direction_out,
-	.set			= wm8994_gpio_set,
+	.set_rv			= wm8994_gpio_set,
 	.set_config		= wm8994_gpio_set_config,
 	.to_irq			= wm8994_gpio_to_irq,
 	.dbg_show		= wm8994_gpio_dbg_show,

-- 
2.48.1


