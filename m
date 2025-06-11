Return-Path: <linux-gpio+bounces-21414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA359AD5FF8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 22:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86C751893237
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 20:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CFA2BE7D0;
	Wed, 11 Jun 2025 20:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="l8KOkARZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0513925F989
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 20:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749673131; cv=none; b=uAWFF+KpnU5YfgxGjd+mnovE7JRZTURv6Ec+7krFMP6uI0aPkx6zkn0rNMMDV2pkPVRIPwf1bpOcz1y0kq+gOQQJkTOZtPWDp84/9PNIbC4sRcWFZF5jrfWwZn3SaA98gSE8/cQoqcxTbkH4czhMNE7Ru8rYLnSO/DEZr6NDdrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749673131; c=relaxed/simple;
	bh=X+l1siqRVwIi6D1PzhyWFvmI4xdYsdCpoCSsUZIeM9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTw34F5gM2nYmYL5etFKjgW9qijn5LDMAUnOdVxG4g1R6gBmJCP94cNARx+fyNvww8jEB8p7XY0Om6tQe423/Ui5ankp1urdBZ4eda0H3UdUNTkxQmNTftpMpCfUR8PeYnqTcQQPP9GIptOKkn5HE2Ua/safr3oW7e1QljSACoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=l8KOkARZ; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-407a3913049so121105b6e.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 13:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673129; x=1750277929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/+rrjhna+/Vax4rD8HC3TVO3EBLeff26p2DbcJCfS4=;
        b=l8KOkARZZIiADfYr/w3lTJabzOUjgNLnsovDoJRBzYrweRADMUz3Tmy3dqzoJYwbdD
         4dzko7K/8l4bF1gJAJOB9jlFrlDu28Dqz+fsX50/iVaPLTJ44ApPP0eIMCi8o8rDkyUy
         FEqAECmJIFIWWFlCCotHSB5bXG296hrFNi4+4HeOEmxwDpHk3CCutUpBC43uA+T1wiha
         DgAEbR4N8FIjizNec6yCRkhvExmL66YflvHp13VNGyLc8f0OSv48GibXw8tWDOuudy/g
         N9QO4Rxj45wf0sVwejwLx8ZSTk/lKEf68+U+02VZXQcIROQaQ2YmeE5EV70Ymr6sXIbn
         sUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673129; x=1750277929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/+rrjhna+/Vax4rD8HC3TVO3EBLeff26p2DbcJCfS4=;
        b=fiaEAR/xC9h+eQzImK6NnxokfPlfhArQgD/HyLKGRA+Lncuh4vSHkJgrXGiu/bnytt
         0twspDXIYStt2CY2wFcTU3boU/oEuNKZfrvIIlZeV9FSmhMSFPTIqcKNreQ9Xq9CEGuk
         SRmbiJ0k/bLLn+XBFeYnFjL74+uPUgBlf4LVn5Qx1WpJBYq9rYN9Ia1eQvXAAPrbh63Y
         Vx1B8FcVH+g0FjegyXnLGRJdeHW5fWuWQuNkend7pBX5Ce5Jz43H0rbyqOTRmsYJmHnH
         CMxQ+qiafiebMWAwCanQAwfI6he0wu0uXwADXXv4Ujvdigfn1G/1A9Ud/TJaQoQGKk1m
         T6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUOHhgknh0yRy54Qnl+niBlh59VMp1HA796UpxXFRUkwqo3KP6gdkd+AJNAPnuWSWYI7/uqSKdl/f3C@vger.kernel.org
X-Gm-Message-State: AOJu0Yyht6jeX6zloiN0QPoOV83JsViPkA3YtH7rm6FLGw/WoGpjlgND
	hfPA2ZtpCd0s45L5SfTiwl2/50EvF1cb7HVjG4RpkXBZr0e9/EMcLiml0EJ9TD2njyyocVYoEye
	Hzi4E
X-Gm-Gg: ASbGncsGuFDbDcGS5U68lSm+O9Ip9on+LlUPLbOJDxPmVBp79UCIqYhXSNe+k+d+QCC
	xaw81Ztgg7RnwH/9GsHu8XE5xhxLUJE7R+ObQ0lMstHmrXcxp+DANZ2XshPkFU/mjH3wOviZSyF
	2oGLgFQ8+FaRRKBqwUP1shDqIurIaQu9oiNZrbpphT4XrT3d7obeHM7/yVK+Z3Eziknhwwn0JRC
	4yvw9sMN484ThaPHtBdFjD+aUVjfA56e2hRbliGXl4iKhB6SEpNi6X5EmQA/zGhfwuWfHqVTp2p
	dne5twU2L7YiKw0wT2dmm7S8CNfm9bhjgaj6Rl1o6fHfOzJu5Ca7T9O3KAi7lAPKVg4K
X-Google-Smtp-Source: AGHT+IGD+DufvyN+5hzy7lg7VM5lfJsR43tAUQCYEJ3xhmONm3bDhzEoWmouYj722aMk3p5q+QWyrQ==
X-Received: by 2002:a05:6808:80a6:b0:406:6d79:49d2 with SMTP id 5614622812f47-40a5d14fa9emr3327936b6e.26.1749673129216;
        Wed, 11 Jun 2025 13:18:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d80d967sm467732b6e.4.2025.06.11.13.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:18:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 15:18:11 -0500
Subject: [PATCH v4 3/3] bus: ts-nbus: use bitmap_set_value8()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpio-set-array-helper-v4-3-fb86a9b499ab@baylibre.com>
References: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
In-Reply-To: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=X+l1siqRVwIi6D1PzhyWFvmI4xdYsdCpoCSsUZIeM9Y=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSeSY/IJ6nkRrANAy2h70ciXzsWX6tvkao1sxD
 4OB69BklISJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEnkmAAKCRDCzCAB/wGP
 wANcB/wM1esoiB5PaiuSRQBoxKnk8REf7zJM4aV0H6/M2/3mbM0ehJVngqtwdJ0thNdO+U0LWG6
 XdHZpt4wJR1rc00U1rqILg0nxcEbrpOJ06KpGyloyzjGzRnx/JNr6ZIzsdNFGh7juRM1HaD7h5Z
 t47OOLSzgr1s9sPy03/lg3kuOK6BKfkZy8h00F0HnfgzzSFvFKxBn7Z8Ct4jyCVpDiq4GaUwpej
 wH2z0XaWliiQPfYo5AB/bGlE2jcnSmAn5hleY65LDObf1MpSHQaUT8/GGXYZHO1Jnl8iGZvFYx+
 7212QTKdyNcP98xvaCHkgAobE2zpI7HZeiHiP/8C6jzd4AnQ
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use bitmap_set_value8() instead of accessing the bitmap directly.

Accessing the bitmap directly is not considered good practice. We now
have a helper function that can be used instead, so let's use it.

The bitmap has to be zero-initialized now to avoid a compiler warning
since bitmap_set_value8() does read/modify/write rather than just the
write that this is replacing.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
v4 changes:
- Fix typo s/get/set/ in commit message
- Zero-initialize the bitmap to avoid compiler warning
---
 drivers/bus/ts-nbus.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index b4c9308caf0647a3261071d9527fffce77784af2..17540034e64a4e591ea61b0b4eef86a2081b02f5 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -10,6 +10,7 @@
  * TS-4600 SoM.
  */
 
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
@@ -105,9 +106,9 @@ static void ts_nbus_set_direction(struct ts_nbus *ts_nbus, int direction)
  */
 static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 {
-	DECLARE_BITMAP(values, 8);
+	DECLARE_BITMAP(values, 8) = { };
 
-	values[0] = 0;
+	bitmap_set_value8(values, byte, 0);
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
@@ -149,9 +150,9 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
  */
 static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
-	DECLARE_BITMAP(values, 8);
+	DECLARE_BITMAP(values, 8) = { };
 
-	values[0] = byte;
+	bitmap_set_value8(values, byte, 8);
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }

-- 
2.43.0


