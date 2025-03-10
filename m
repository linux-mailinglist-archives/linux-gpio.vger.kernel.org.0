Return-Path: <linux-gpio+bounces-17359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6CEA594BC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6B931887904
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D4F2288CB;
	Mon, 10 Mar 2025 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ov2MuRSi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A22225785
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610432; cv=none; b=R+sppD2xqk1B57WWfcMRGOczNxfjOXnD6w2cM1iS9w1c3svz0lX2bINEL337ledphh1bpVKhF48qu+y+NOQ/1KnD5V4srbwSLNUymDKXKwTi8USx/vMhr6h55xGT+ktDetdg56MAaG++I89r8rn+Nfal2g9di7DVLqzM33Jh7Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610432; c=relaxed/simple;
	bh=bI6mG7/fE9jq7Qq8jr8Olj76OfGfb5CZqhqJYkdpgIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvMIocL9FB55kr+X4zDs5ZYXqX7A2HI6wjBrIDyhlmiH1oCF8UsKGNs7rpWmgPxPcJfXJbVAa/CmAPyiSfeKzQx2ozKGholgI2zaeUh1F/NA5fL2UI3hEAx3btCdm/mWWqEuL7skX4Pe04jNmv6lw90uNunOsIP16L80A3Uhh/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ov2MuRSi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3390298f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 05:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610428; x=1742215228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/L0SErO8WvvIla0Y0YBFAJJ/7qX89FBxAZLtN/OcJaE=;
        b=Ov2MuRSikbx8MHFvw//I0JWpuNKWnZtw3nHdPUH7+ISOt+S3QN1x3fFjJGWzGk6q21
         roWOUx1PIP/8yCssXMkPkIvEp8awtrapRRK8TqxMYZDaa40UdIKjtCRiLyXDkSLOt6C+
         14QWZ6VlyggIgpsnVHxj/b0jrBLwg+LKhZctRi8GwRhZ28YwzX6CMRPq+zrC/RuWIJ5n
         BnrrjOa0KhQ7XHRuyN1GgZjLpDkOVU6ankyBUmC/qyC9b537YhDbw3wJi7myuCt9xN2y
         qmlG9AvFlgt1Bt1Cp6kI9Q09PZ1S+X3c0ALEzIgjq/dSjssKEWKnfqKrsq8K574pR+6E
         gwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610428; x=1742215228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/L0SErO8WvvIla0Y0YBFAJJ/7qX89FBxAZLtN/OcJaE=;
        b=KxopCkrYUOFi7zJd+c4AewhLYa2q/RA2oMvTuWIsk7cnnfVUxa1VsErx0sfpg2hzqb
         Y5uhiUx/2bOVjumJrmg6rXfwVuChjltAXDr3RkG/yfqyogr34aqOtjucWVkGAo/zNAcj
         /CsSxz++29qj+VVNMnvl1ct8hl+2LaTdwu4unD1MFs8Wa6DqE9AHZQsNoYAr01czZiZF
         5T/6tOIctFcGV52LrtjJJQ4zPfJfwJzBdaPZHVmleAp1lQxRc84/1kSeTbOwlZraIRUC
         NpcxjHm1OwkMYF2QdIrP96vaSlfhumh8skFghVGwBuUWOS49BypXMbg7R8sPua2Fw7em
         dJTw==
X-Gm-Message-State: AOJu0Yz2qDy9g3kloeSMcHFIfRyeqqBiKmjlZharZVZSIMQUFS+C0vsf
	oWeTI7OhqgGPenhQxRexE/enxnlJN12VKgceesl1IPctMtY1Z9VCDv0hYtluHas=
X-Gm-Gg: ASbGncsYb4r6s9lDVsfGfJPMg+tiDT9u+y6bocQLGfmBEjDKdkchuWGyUTrtbmyovZq
	6mJx1cKXraH9rQij4pH5JcpHlxLrsK20h0D0viabgIautnwSwRlteeNevkG+MvXOFGUm36pU4Bz
	51UAyJp4EZWGfSM2y2Yv17W6y5T6Ov4nWKTTG5l8ptcCW1nIHlV9b0HKU7jI7x1TZCvqFZ9SboR
	/DwQzcvOH00JRDKbgsLIz3Y+qd7tt8/0LH/Hekb1GLhBF/0ZeWVYxsqxhOUK7vMIJmFJJ20INCh
	/7PZD1YOuFHhNLCm+B+B6XbYezj3Ugt1rR0Mdg==
X-Google-Smtp-Source: AGHT+IEnaw7V2VP+vh9JbbBGJEoMvc9VnDBShuCZR28K0t7oQnFw+oD6yp2XEyGkyhvpHF2Q74qQhg==
X-Received: by 2002:a05:6000:1786:b0:391:4940:45c3 with SMTP id ffacd0b85a97d-39149404778mr2988461f8f.54.1741610427788;
        Mon, 10 Mar 2025 05:40:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:16 +0100
Subject: [PATCH 02/15] gpio: bcm-kona: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-2-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1815;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ena6WHE884GsVxxatzXeIBrVJoOFvrALfVCBpMq4+UM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt21X4gVG0AtYLf8B34gfdK26s44k/mluoSJR
 blcmhmybxWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtQAKCRARpy6gFHHX
 coauD/42zIRwrSrdastPpJO1Hv/NxiYRzjpa9b3Ox8STZOgaNunOonmOQFdcp//MpXn5/aNph5e
 veWkwQiYE1YuqCZl4nvbppnQM063SGSB7MFg82Es+DJ9CtS4v+RLlnzGgoVmkgWLFI5122W1q4X
 WrJtp7NzIjqbRIgx+meu5Ai91eHLAScqBMSp3WPL0nkSNYHDrXqJEYEW+dDm60EotES7PZpw5qw
 qfDb3I1iez6N3IHHfacjuHNdjAQEm/ZX7pxBsaLnrKLN1UJgeEdKFEQSwk0mBD9B4NDrxwKZEHl
 K1J3VCVEP0VBwmDWn5msWrNJ8vjv7zQ/sFLWxE97DyRbEDF5fDo8QD/XOaA4/XUJf1tbcoKMp69
 wRggj88FDQxA68q+4a3xXmW7V47tmZCezT0rSIwkWjbwtJige0rPXSnyczrfMtF946zGpKemP3D
 qFxk/InIE9k9+vLkj6p0oV+KPU07sOmRuCuthg4oQyZAnKafe+1PzZkWXr7h6zUwmS2N7pHwgkt
 4ZEfM1cK4RRM5JYnqyCgb28eKAMcJ/6ZbVTM3RJaw1g2uf1rPv438xrWT6GvA3ss11WYH06+xpP
 Pe6yB5govorUQ1JZHwcugOcqeGQ14qkm6rzKdeVBNQ0jh/ItcNY4i0THjySBTO1t5ApdVHA73dZ
 6bRvQwflztwfyrQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-bcm-kona.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index a7390b1f1173..17c287dc7471 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -149,7 +149,8 @@ static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
 	return val ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
-static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
+static int bcm_kona_gpio_set(struct gpio_chip *chip, unsigned int gpio,
+			     int value)
 {
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
@@ -164,13 +165,15 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 
 	/* this function only applies to output pin */
 	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
-		return;
+		return 0;
 
 	reg_offset = value ? GPIO_OUT_SET(bank_id) : GPIO_OUT_CLEAR(bank_id);
 
 	val = readl(reg_base + reg_offset);
 	val |= BIT(bit);
 	writel(val, reg_base + reg_offset);
+
+	return 0;
 }
 
 static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
@@ -336,7 +339,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input = bcm_kona_gpio_direction_input,
 	.get = bcm_kona_gpio_get,
 	.direction_output = bcm_kona_gpio_direction_output,
-	.set = bcm_kona_gpio_set,
+	.set_rv = bcm_kona_gpio_set,
 	.set_config = bcm_kona_gpio_set_config,
 	.to_irq = bcm_kona_gpio_to_irq,
 	.base = 0,

-- 
2.45.2


