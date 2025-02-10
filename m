Return-Path: <linux-gpio+bounces-15652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E93A2EA33
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 11:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01B307A5CF1
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125CB1E4110;
	Mon, 10 Feb 2025 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NtHDS7Jw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF2F1E2850
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184736; cv=none; b=NbYZcbGmzt0W63H4m+cNIWXoMAIGzB2KypEbW6+ITqaGoklvwkejELfzSX5PDnhxXA0D6JlL1Bbs+HPVItyLCTIfLm2mP7j1l6Odvu43Z4UaNBVC0tohR1K73K430aNsr/NfUH2qx2Tpdv3eaZ95X6QlDTRnYiLUZK45BVDJ0A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184736; c=relaxed/simple;
	bh=Tt49jpwzZ3ol8gmWUWuTAh+k9QZSdGkNwmYsZGaiOMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhdIlGgBNLGyqBxRx0O+E5tYFs9/FXg0kOSa8LSuNocV0KIMyuXJ/3vwYpqQAv1B0WBqI7RXEQebrLdD/kCnAQ8yYYOLly3vCDffRSaotTcyLzEn3itKNlLZx/yUoxzlHN+e0sSJQpRBGP0OLpcaHny6Y4I+5g11wDiZiioCcgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NtHDS7Jw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso1843551f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 02:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184733; x=1739789533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1+79In2bEjMxbwOZBK0mwGOJ1VVLwxcGp4ZvDTlgOY=;
        b=NtHDS7JwMrw0NbVU0WYyH+n8WEzZqx8yC3+SK3hxQDZXxmuAXH8Nrx9aYL8NGcxKAT
         k66EePqnotMhvvxRFeri4egfDLKS7P0QYgMsYUqTPlyBq7cWXYKY0iXFiS0RY3S1X56Q
         M35Yy390PdBtZwTG8TqShngd/9Nr9aBQ+SvrGq3P1YLXnMOLNdgN2oGEQgUjKDOOpLuN
         GdV47tZAHZM3uQ5rZ6+CKoeMo/yaGa6qQpwYi1C9Aw7zPl59z6CD5m6jW/uh2hLyjbew
         vkuC1XIikMDriOSzV2+lr8c6nfhnZoKx6ROSAHP646cwp4BRGTu+sXQniQ8YlFXFS8oG
         a9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184733; x=1739789533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1+79In2bEjMxbwOZBK0mwGOJ1VVLwxcGp4ZvDTlgOY=;
        b=Wsv6mNO7EYVv+P233nyXXlwx90MoQipbP/kiciYJBKJNG0vbnR/6gisoIp7E+PJ29d
         9Vla4p6gNIsokgYwv0sqrRgwsEgWbaVl5LLAFYHFd/GuVyHXhehjoiPB9Ne45MbISzr6
         pw61qtLh6zJvhKQYfOtoNpLEUIS0S5Lajfylhbb3LhwCiOHmeu8nAEjFIkOq1H9+ppzN
         LHqq+Yq+rnBFibd4GzTfMu7KwPPjJvlfcZ3RDX/xP77K4FXkQl+7yWkiNHrWaGLI6v3+
         we16jaugsIahIvaJJrXipXi30D3skHigg3SfOi031UlXbl33drkGtidUr0dx6LiLopmp
         LcxQ==
X-Gm-Message-State: AOJu0YwBXl48d7R0IlEWy6BskR6qi7hkxE1VZXKVs5Yct297Ct4zULX6
	fY+VeebDf+FRY39DBX9ZBELKheErcYSLnh6cl238e2ubFHMp/teH62yJHc+3LsU=
X-Gm-Gg: ASbGncsVq9NfrL8zs8xsP9mMk7By1jl3EcMxdjKT7F5c15HkQzkuGkp0iew9JHG0H8i
	8jGSjIIyDC5q/ut2j52Iok+ZRBoia1kKs+iG/wMmezJyt6EuIR75NfPJ9Jsqg70Ld9Pd40UTgRl
	tR2cgTeKP8/UAjY8+GI8y5cE3THE35MvZV97wE5L7nn6K3PpMcT3aYAL6lvXx+P9O1zMTDhkhPI
	7smdzGErG9sKsi6DC7BPmsSV9l/tGsNt/zSrb1IBaizuj/xGyVtzvtEazIoPs6t2Yzlx3rnJ48s
	oC98uWVD
X-Google-Smtp-Source: AGHT+IEAPJaOIykPBZKf10WDEwpUc48jTfw5DdMg+WEP+fcubB4B1vmlbiOPLCgUcSlejxMiJ97MeA==
X-Received: by 2002:a05:6000:402b:b0:38d:afc8:954e with SMTP id ffacd0b85a97d-38dbb251e08mr14592234f8f.11.1739184733273;
        Mon, 10 Feb 2025 02:52:13 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:12 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Feb 2025 11:52:01 +0100
Subject: [PATCH 7/8] gpiolib: sanitize the return value of
 gpio_chip::direction_input()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-sanitize-retvals-v1-7-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2283;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LPsmymBhAWix2fPGJHIO52f9SJsvYZKGQf0Il6uLLSI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpT8oXiXz9TnBI1D2A6CzeHwMoqa/NdBW/TW
 4K7Bj/U+4mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUwAKCRARpy6gFHHX
 crh+EAC9LNr/MGK2bSbtPtqpnVNx1KGQ8xzgGhBILcBQg6u2n5w2cReBWOif7fVpn4TEEV3kqjZ
 7HpF3DW/DbfyHCsVTtZVLhw6j8BXntb2UhDUUJSGnTBNK3vfW3MBESE72/PIuOZkCW0rVqVvPYa
 T+iXWydoCDKbPDpJVgzPcy0Bll2136Jeqi159psFDOrV/ggUQ2cO2IVmV+L7i9oJ+H6p4FjcPBK
 YJmjHcimq8oAx7mYShGy4YRQf39bssMIyjynccC/xki4cJ7uaqwfWY8umG2+NXSdQJP+k80Wp0D
 JmQmcsNHDVBiQbKfqnqHxUiq0x0sFDg042LghmXceMIrgVfRGSHpmfOu+aS97rCshyP6Uuk6oJ0
 KX+Kw7YuBTqAumA6kH1Z4yYJgmOYoiBhC8t9wkB8aztwSlqEVWhZK/R1X/uYHOoYa4Ovz7AKLVx
 KmfQOEoI3/hLKRX3X7KmIw9GujO32FqOzFigBkFhYGSSfPnhDe+efIFTUgfIPujoYcKWKUEfC7z
 KjS1WwrlkuSSY4lzerZsU3EKKnYB8JRbuN6vYYHYvxe+yolnANFeWenny5+2Qhm7FHZE6Gxte4y
 iyTBXx5Q5rapDFGP+AxpxbktzdEHFaqN7+fIlirQiTYt+vpqkvkv/C+8AX57DL0+6XNcP3ViIjr
 xHfoFdPEJetQGRA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The return value of the direction_input() callback may be propagated to
user-space. As per the API contract it can only return 0 or a negative
error number. Add a wrapper around the callback calls that filters out
anything else.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1f75ae6e208c..683a03d237c0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2683,6 +2683,22 @@ int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
 	return ret;
 }
 
+static int gpiochip_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	int ret;
+
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
+	if (WARN_ON(!gc->direction_input))
+		return -EOPNOTSUPP;
+
+	ret = gc->direction_input(gc, offset);
+	if (ret > 0)
+		ret = -EBADE;
+
+	return ret;
+}
+
 static int gpiochip_direction_output(struct gpio_chip *gc, unsigned int offset,
 				     int value)
 {
@@ -2751,8 +2767,8 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 	 * assume we are in input mode after this.
 	 */
 	if (guard.gc->direction_input) {
-		ret = guard.gc->direction_input(guard.gc,
-						gpio_chip_hwgpio(desc));
+		ret = gpiochip_direction_input(guard.gc,
+					       gpio_chip_hwgpio(desc));
 	} else if (guard.gc->get_direction) {
 		ret = guard.gc->get_direction(guard.gc,
 					      gpio_chip_hwgpio(desc));
@@ -3448,7 +3464,7 @@ static void gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 		return;
 
 	if (value) {
-		ret = guard.gc->direction_input(guard.gc, offset);
+		ret = gpiochip_direction_input(guard.gc, offset);
 	} else {
 		ret = gpiochip_direction_output(guard.gc, offset, 0);
 		if (!ret)
@@ -3479,7 +3495,7 @@ static void gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value
 		if (!ret)
 			set_bit(FLAG_IS_OUT, &desc->flags);
 	} else {
-		ret = guard.gc->direction_input(guard.gc, offset);
+		ret = gpiochip_direction_input(guard.gc, offset);
 	}
 	trace_gpio_direction(desc_to_gpio(desc), !value, ret);
 	if (ret < 0)

-- 
2.45.2


