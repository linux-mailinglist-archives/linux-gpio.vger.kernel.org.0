Return-Path: <linux-gpio+bounces-21155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8BAAD327E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 11:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBE26161772
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 09:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693CC28DB5B;
	Tue, 10 Jun 2025 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yl0Z/xrX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17DD28C85E
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548652; cv=none; b=DO9/NQgfQj+hFWEfqVjTvLSVV9AwoUCduMVSniqGwGZvc37i4UPbHPHYNxoJod4ZLWJ1fIPsNQNKKyZRKaaeTgcev2fUVhp1ZBl54gWVixzoVGInZ1K3vWyjffKkCDJaQEHIRY0EA0mGN2ITjB1Li+lTTyBFQexeh6fZG1NyvHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548652; c=relaxed/simple;
	bh=QWLCswuVXOzsyDLwB7rh4VyUKA23f/FOPB6FbILMyzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U4nTTDtCsVZn0HTIeHgb8ryvaYhv3QEp9MwFTfqk4d6JNkjQGZuEEoM9ygdercU5aEDkk10s53sMr3hG6YoRXWjM1lZw/MiLZ/Mk4GUKxDPkNsAGltIawX6tAKTJ3Uc47PpGniQNwqyQiG9x4Z3lap2QvFg45T6NuRXaL5jXvC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yl0Z/xrX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450dd065828so35270035e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 02:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749548647; x=1750153447; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AP2lApXT3oK4hCPR2yyZqkXMhT/gHqM9SDhESroajJo=;
        b=yl0Z/xrX2U1TsXV7KKpzRiwuHDBuLyMdHstT6hQjw27rxj2b6ZvnAes33HI/YGB6xe
         4eCGUI8jYcjFWg9lNzDZDeJfB8X/na24/PRyjxCGtEArrDAixxxh6VZTeWgQR7APhZ6V
         SCwTcDkaFrxxcIxF3eUeY3jvbdhfg2YurAIqhM5GaZNYG42wEtGhvCLLjD77H+ZKjJbw
         rOs2MBpGbiKG3bU6fBSlUljsvgORrB03dL/B+TF1SzlDLNDkrSRXJwVp+cXO88QvjWSn
         +SRKcW3K3t+4wlZwYYbyPkUkqPWxc0dhJLgkjGFTTfsGjXq8nC+CPWOJX1JKFTkukOQa
         dLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548647; x=1750153447;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AP2lApXT3oK4hCPR2yyZqkXMhT/gHqM9SDhESroajJo=;
        b=oGrdcPqrOrmZ9KXYbzRtHbn+RhXTIQRdRtVte+DJ37rJcqAEoPD94nIQ+BcretzJ3S
         dLALWCzI/8oTlmzzQB8TKJL04+6XCr20H7QmaWDFAi4niWBtnbFJAJwADtLj/ogRBFP6
         7Y1tcAtEYc4Jloz2cqxm9LptFVb3mcu2HZ8Lxrm/pEwYqtm19XnlNPK9FkyNAcAI17j5
         ZvYpVNppZGJX+9Mh9kf6Fw8//ITJl66AEW0PSQlTgjoHWwobeOHYVi2ZLzF2aIAs1+CQ
         9JvFRRizcw+YCUwkA8PFrrI8wBQ7h4Hu9xWoCoEj7iJESYOeJjN1pWtXJDTrV2wYEHn1
         jASg==
X-Forwarded-Encrypted: i=1; AJvYcCWoX4k04aZqOAgdv5FV6zoiW7/KBo0GG/MThNDpkZTOf4P4wUM97U+1v2V0Lpg9+fk35/WgRUJBVqyk@vger.kernel.org
X-Gm-Message-State: AOJu0YwiOelW5g/czaWVEuiwJVcryleXHqVMHQ7fcCUxHkhHBQczoIRy
	C6b3BoIhIm/IxRuVTR1i48VmVhzcrAb06O2/F0m0z5H++cMOsnx7FOyFbN+PHdl0eKY=
X-Gm-Gg: ASbGnctzDH4kR/ySYl07ZYVxVQx3/N01tSOizHAkoHRiVxutwwuVD3AqkYcBPEbWQ4x
	KKgEgA0H9s9++EkCy7avGZmmzDQH/Bnit2vOdSEGHd7zG5OqV/6vKXEoc0ZKEztwDitkT8ZP+jB
	B0Mc3GdctKRJVxXppPp2s6wDQ9a2SU78whcw0yCt4BjBAgzIUvWgsKQ1F7x3nxnMfkHk+EqhU99
	jG0cAummsgOWelSveL/6dhQT5/mxQvvq1J2P8HmxwsCpUQzLb+0H4+Z1y58vYUJqLmdAWka+fw2
	69afjrxp1Fi0TPqLIKygpn6fWRf8behS75MdCS14a2UcqbbAyYFV
X-Google-Smtp-Source: AGHT+IGc2KM5AHFDg0UZ+9LBR81/PsWs240h3WEszfvWbHPGb9vWNuxU4xjmtYVvcZ/UZFPLVTjYVA==
X-Received: by 2002:a05:6000:2512:b0:3a4:f722:f98d with SMTP id ffacd0b85a97d-3a531ab6df7mr13667513f8f.51.1749548641167;
        Tue, 10 Jun 2025 02:44:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6905sm136450895e9.8.2025.06.10.02.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:43:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 11:43:58 +0200
Subject: [PATCH RESEND] platform: cznic: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250610-gpiochip-set-rv-platform-cznic-v1-1-30afd2444756@linaro.org>
X-B4-Tracking: v=1; b=H4sIAF3+R2gC/4XNMQ+CMBQE4L9C3uwzlBYxTg6yOuhoGEop8BJsm
 5Y0KuG/2xB3x7tL7lsgaE86wClbwOtIgaxJge0yUKM0g0bqUoYiL8pc5AwHR1aN5DDoGX1EN8m
 5t/6J6mNIIZOMH9pOVLJsIZ04r3t6bcADbvW9vl6gSf1IYbb+vbmRbeuPOP4jIkOGindCV4UQn
 PfniYz0dm/9AM26rl+gg+3X1QAAAA==
X-Change-ID: 20250401-gpiochip-set-rv-platform-cznic-1a136bd47a5b
To: =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3702;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pYxbyIrnxsxPSFmRinhVqBD4ziNyGPLYFRlg+L3caks=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoR/5fvZhhVDSj8LyHz0YKZEKCPJ9Wl4mSygojm
 GeZuNtcyhyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEf+XwAKCRARpy6gFHHX
 crqrEADS5I0ITOeC63rZHdwLYW2YThlKx/Z1GfyAXXADsIMCoT8jpCLEoRwKMcu1C/iVghXuE/D
 9suaLKwU1QtXC9Tt/v1/7COZUGqWp+u4jsuyRtdMlFZ4VJ7Ho/ZPcKLDKzJnCw04DKIJlMyYIkY
 YPBuCNtaBC+2+/gYvOYjZnom2O6D9R9Ld1i7C51gWWeQ6ib7MgS1tppXjThvkY7XR2P4VnYmtiJ
 DYDBIuE4cCtstB+w4QmUYBwiqWVaglxpS3tjzuS02mK+GMDchaiVyYrtepmgONoCUGZ1+AdQHrf
 QCw5G48fa8yKuJChe0oYnxWARCJrz7jXRWFp6cfVtqMti56KL6ctWdXk2eU0+ZxCdKG3MBiZGtJ
 K4KhiuE7kiS7ANx0Y8SdKswXG1OGFk7zgrP0KGsQRmD63qrhyGsvrb40yx+blqOgsgYbMgjxSif
 d1+Q6LvmtJllSXVcg3JXMWe9kCjZZJvHfh4nshjVNgTJGlbeOkVzb6UAm0oJLgM8RMNyg711qnU
 KeKZlEdUZJLax1n4uMCGJcCRha6K9ATYgaYVt6PO81KyNEvLFnjjIg/F879U6qwc9P3EC2fem+o
 Ndn13ZtIEFtLlH3VoqkWIz27q9EGMLNkVAnhme8JR0atmQjCwcP60IXyUmcLNA8WRrICiPOc0W6
 uyHNsLYA7nZhG6Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Nodoby picked this one up for v6.16, resending for v6.17.

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones.
---
 drivers/platform/cznic/turris-omnia-mcu-gpio.c | 35 ++++++++++++++++----------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
index c2df24ea8686782c18b7cbdc62e3ff6aecd9503a..77184c8b42ea21a2e4194074bdb1eef1806a7ba7 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -439,27 +439,28 @@ static int omnia_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static void omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	const struct omnia_gpio *gpio = &omnia_gpios[offset];
 	struct omnia_mcu *mcu = gpiochip_get_data(gc);
 	u16 val, mask;
 
 	if (!gpio->ctl_cmd)
-		return;
+		return -EINVAL;
 
 	mask = BIT(gpio->ctl_bit);
 	val = value ? mask : 0;
 
-	omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
+	return omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
 }
 
-static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-				    unsigned long *bits)
+static int omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				   unsigned long *bits)
 {
 	unsigned long ctl = 0, ctl_mask = 0, ext_ctl = 0, ext_ctl_mask = 0;
 	struct omnia_mcu *mcu = gpiochip_get_data(gc);
 	unsigned int i;
+	int err;
 
 	for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
 		unsigned long *field, *field_mask;
@@ -488,13 +489,21 @@ static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 
 	guard(mutex)(&mcu->lock);
 
-	if (ctl_mask)
-		omnia_ctl_cmd_locked(mcu, OMNIA_CMD_GENERAL_CONTROL,
-				     ctl, ctl_mask);
+	if (ctl_mask) {
+		err = omnia_ctl_cmd_locked(mcu, OMNIA_CMD_GENERAL_CONTROL,
+					   ctl, ctl_mask);
+		if (err)
+			return err;
+	}
 
-	if (ext_ctl_mask)
-		omnia_ctl_cmd_locked(mcu, OMNIA_CMD_EXT_CONTROL,
-				     ext_ctl, ext_ctl_mask);
+	if (ext_ctl_mask) {
+		err = omnia_ctl_cmd_locked(mcu, OMNIA_CMD_EXT_CONTROL,
+					   ext_ctl, ext_ctl_mask);
+		if (err)
+			return err;
+	}
+
+	return 0;
 }
 
 static bool omnia_gpio_available(struct omnia_mcu *mcu,
@@ -1015,8 +1024,8 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
 	mcu->gc.direction_output = omnia_gpio_direction_output;
 	mcu->gc.get = omnia_gpio_get;
 	mcu->gc.get_multiple = omnia_gpio_get_multiple;
-	mcu->gc.set = omnia_gpio_set;
-	mcu->gc.set_multiple = omnia_gpio_set_multiple;
+	mcu->gc.set_rv = omnia_gpio_set;
+	mcu->gc.set_multiple_rv = omnia_gpio_set_multiple;
 	mcu->gc.init_valid_mask = omnia_gpio_init_valid_mask;
 	mcu->gc.can_sleep = true;
 	mcu->gc.names = omnia_mcu_gpio_names;

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250401-gpiochip-set-rv-platform-cznic-1a136bd47a5b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


