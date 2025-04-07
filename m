Return-Path: <linux-gpio+bounces-18300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DD6A7D5CE
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AE253BE1A3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8FB22AE45;
	Mon,  7 Apr 2025 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jIUPdJvK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F9122ACF1
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010363; cv=none; b=ZDQGZOkR/V/L/ntmiWzl2mE0e2FhhnLDS9ti3/SwwAHZgyY/vSQuWRmZ0eh7zeof7HCfFXRWtJiiP8dRSEWkD4J8BSMmcEG3DkMMy4GDJRgqb6EvqLA8FubBblojcV8paGbudZJu8whZYgH0wZB7wuZURnP+qttVLR80hFx8H/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010363; c=relaxed/simple;
	bh=+deuLPSQkEJHMd1oN95jU1WrKRZsQUmYNkgMgUdiHfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQ7GX5VvZdllaWqz5dnEfdeArWugn2buF47wr6l2Ll/b48XUWuWZQTLxnuUecgPRSsj5UPTDfzHjraEk9NphAIY5WcwjLVjFZS8eHi+j2RfH+cQfF+12xIUt5szpGf7W1kWU74lwfMZTFSt/p+KD2Hi11ZG1PGM1G4fZ34kMDf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jIUPdJvK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso36722625e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010360; x=1744615160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChXOA9p44Ws7ALTa8sIdL/yKUHK+mgWVc1wgenfZZQc=;
        b=jIUPdJvKW0zUaPcv6jYIZw9bUSZquBFCMgkXHCx/MOgbnwdqQXYqyQrvhSGV4Ny7ok
         e7qn0XOQzKLGR1Y2S/6ndt86fL9U1lL2Ur40pRuviqyLY5KxDkoFy0wt3pPPWOsqPWIp
         arVdaRnskhRO+VMxRTmVj9yqmWDG7EBmgsxEGCAJGkXeJXrVOH6D1JY+YRhGfveb2tTv
         3aq3M0rSucHP98Fn2QJEHoodNU/eyuoXmm8EAyAaabILY9meQtHJk2lNLubbWQsmINHd
         Ky54dUmKDMiFkErbacL3gPvkhw61eshYf0WDU3p4/9B6KTka+UQ8UMeaxwLqkEHHMfBR
         2efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010360; x=1744615160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChXOA9p44Ws7ALTa8sIdL/yKUHK+mgWVc1wgenfZZQc=;
        b=v57BwiK+TNMUFDpB2Hc/0RFs8riujReCNPEfN1PKy0bv3oiTdB9g15lzvJIyf73fox
         4fTfSTt0ux5ZCXAZ8QBDBMxQ/7PBD5T6GqUSbq8wTrghupv6eNuYHUFywN3me+Ot27bz
         NVG96ylOuWRZ5mHcgXLyVIDM1e4NzquIt6FpsWpL+tp2E6WHU7Hbudh7rd4gro1PCDbY
         6d9ATrznN7Vb3sI3cWO/xz2Ub0BpxipJ4P4lVs/lzS8efTmD0KdK2/MOw4QNDmtR0Tm9
         MfhskPpBrpScWkECahCMf0QQBfvSMhLfWOYSE/fiZtX7jyxdmB+++yq3IMdlduwHfa2E
         QnLw==
X-Forwarded-Encrypted: i=1; AJvYcCXVwzCdtUX9Zb8bnErwsT1M4G3drQQsBKN7bo403oNakHn7uvsNCSXItBURHdNHBAc0Z7XRNbDJkoVK@vger.kernel.org
X-Gm-Message-State: AOJu0YxGhgofIynQtpQPlG2a1VkWMweESRDxJTeyzPVt+swPDCxBSeOO
	YKRmtHO25AphicT/CD9kA4Da9gBqIMlAB64zuyz9lZy5fXWnFdRlZ4aGfnx2jME=
X-Gm-Gg: ASbGncstjxBs+YSfs2Um+03/maUt/kdScc43o4Vv/N8BYpAAKCZohU2CnhmSRhy3nKX
	5lXFpOVZFPVI1lAg6yFWPyIjdDwi7iPkY78PO7nJEQGUL2Hw1ozokPZthjeXZ7qXk2xuPqxv+Rx
	Z0qRyuPDpwRZNUuhStfaIQe4dNWIKBeJ0B6as1DHnuifUf6nBccrWl9X1yLd3U2itKGTfFAu6Mj
	PtJOfOhNovEl9siIxluAc3StZDNufFyRJxK4Gpg34b/h9Q/y+WCIF2RQTDQJgrMauVBUokE5Jrl
	a5pj3hLikelXgX6jrQbljxYqAvz40vMYhyJvag==
X-Google-Smtp-Source: AGHT+IFV4P8oQ3nG1OU2BDLNtmclbNouSwMD4cLpZlwSZElcCaMEGPNksjQsv2nIGYL2m479ZPgS9g==
X-Received: by 2002:a05:600c:1389:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-43ecf9c77c7mr84576565e9.20.1744010360289;
        Mon, 07 Apr 2025 00:19:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm120215145e9.25.2025.04.07.00.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:19:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:19:11 +0200
Subject: [PATCH 2/3] Input: adp5588 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-input-v1-2-a8b45b18e79c@linaro.org>
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o8UJdITbenIEBWagS9tbUTRGEbSz2Bo2wwxkVvQkfuo=;
 b=owEBbAKT/ZANAwAKARGnLqAUcddyAcsmYgBn83xvqP9Ph+Wa7aamh/W98Tk8+U6/kt9q1kKzL
 05h47rIvU2JAjIEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8bwAKCRARpy6gFHHX
 cotzD/UbHDgftNnyNJ8HCygByrRKaQFZ3aVycjBz4aWVoHfft7cLF9QRClurpPH5B6EURB0jL1V
 a0RXvV3COSo5AGBpew/77WVrjil5NBTUiZTan6AT2WF8JuKA4U+mkC/lAP88ylLZ8dtt19wDdAm
 5oqlO5wxa2+Idky0zIakj8SU8Zcy9VG6Kc1f3nBGFKgKmVDc5yYI54dwJu2RUK9j2TI0Dw4E4rF
 QJOQ1sRCE9Ecqa2rcFyi50PZXKrx7Z87Wyqjyo4NWrkkpNCphgyGNXdwhr2hRn7VMB+VDzj95w4
 MIuG+wuPGvjtRbdLG8XnM6SSSHpkTkIzDLqGFWJVWlbk7t3Yuk1RlPTEzoax3PzeicvlYK8MZii
 fB8DzqERSRcDBy+ii/ZNgPEQwMfPaSs/XVKVMrQumqss35lI/D+bQ4Iw+dCpEVW5DT0xNMdfN0U
 ermT0MKJknP5URBrPtN0+ua3StIuqDXebEqp50PvrHdHctcN1zie4uTrCoquTp8VMxEaGpaVykr
 ++LB0/0XSElxUmX3LTa2b0EOyhDvgMijDA1xK10XqtQ48lr9rpJy8z84X/9xXbTn1+cFod47Qbm
 ExQc9D9s/iia3aqiKqZxw914ArOYaV0BQRyOY3YnP7rDuXZ6aw6CSaRr735fSLigKVzdRy3QBIY
 eOQws7vTqgCa3
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
index dc734974ce06..2b2aca08423a 100644
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
2.45.2


