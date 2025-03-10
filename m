Return-Path: <linux-gpio+bounces-17370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F0AA594DB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 115DB16D5D7
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435E622D4C9;
	Mon, 10 Mar 2025 12:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wvFNxV/a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9C022B8D9
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610443; cv=none; b=EleEpBXi2vQsav4SE+iHzsrreLJ4763Tn0/oA8BcJmQv8SUKdQy3fwDiH2vC47WfDmSdZDXhwuGU2n2YL6RGTdWhSczOlQmXoJePPkH+2Wzb6DdUQIY42RErinNtVU7oAwIOko6ZngwcFz3uEJsMDPU/4zmuOCrgNLpR7KiuOuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610443; c=relaxed/simple;
	bh=KjNVSxMUcxXw2e8AzNxM5jaOttfS+Kefz7x1bNsPa9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S+nH8H6IG0y81X14KxJIezEXW5buJtkJ9ZLfXQtzKC4vsuRchC00NufSmsUVFTGQ9T5oCf7k47LXA5F/mv4mDl4yV4i39Gdo9D8rhDxYqSGFOwmLj9JbPG/SycOPR0F1y7QzY7Y8UdS8ivLhLcF8632sCPRrKMsayNLVfMpV4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wvFNxV/a; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso24716205e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 05:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610440; x=1742215240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUhOpFTq7T4Vaw84Qb5mjT/Mv6Dno+d4OQdMzLiCIb4=;
        b=wvFNxV/af+3MaPFV0qs199GuwUAAzPpxtqchTU79Ub5sdS9lhlYCLlF497AIe/qkBO
         GCJJWRbiK/9T0w1S32bHJRtbtz0IqrAU+V07V/b+dcSk1RshHvY2GvpZHTNFeZr9P4oR
         lajRT3cJ61bOxnF0gC2D0ocUIzUWClEWKqZXuEUwbx5XMzZ4R34H2hbLK6CzKLIfXcj1
         WcibZXYELoYcAVWpA2keEa45mp4PZW2qRaLm5GQedCKWdP7YN47krgbLGrF730YN0GHQ
         Myn14mb0qMprjmPogDxu/eGZ2jGe78R3bRTlT9JrnmgLwUipRC04gzTGPk5oohQiRFBc
         O7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610440; x=1742215240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUhOpFTq7T4Vaw84Qb5mjT/Mv6Dno+d4OQdMzLiCIb4=;
        b=ar1Pcu3qjHLNJEqxzzgUcDl3YiNdk0wdFEOnALsVu2EKDolejyBUbHtUBYhzXSnF9n
         MQ/G3n7fD+Wd3RCmg2v340FlnXpQ0OHeu6AfF7aL8nlTdHrBYUWXG31Dhk6581svmaez
         1NGb6IwhU7BhptVgaKJ6g0RZYbtkkwpYfgeF2fPmwhRZw8Qj6KbzUTrWiv6D5xhtgyA4
         xZanz/e/zhCf7YL90hJT9NLuKdUi6Qq4V2V5tsqA+nwf5viYskatyCFVX5+cLzFkzX1H
         vZSqhF1LwslbuQGhZ1B4VgPh6EgE+JfZMATURYDanFUcyTRx26cn6qZ8qw3iwUsPgeUe
         2TYw==
X-Gm-Message-State: AOJu0Yyq5yKpBJVWQJK4VwBBfQFVzk+fDN5sgfbJzlyd3zwz5yiDkXjt
	a+zFT+N+JjovKqehRZH8UFMMhHRNgf5pzUehFultyXr4aFFxO0uGxgdR3gRVqzk=
X-Gm-Gg: ASbGncsrxqWjRsHvjvwIdD78IDHyhBEDirSNkn+X9pZ/dXYN23r9ST8HFuY5yNoYYoK
	og7xWo8GzsZxN30HBVgtPyWuuzwFTQ3LJplEV1HnxITvl7VEHYXKBIUIop3ziB7evXyra9qB9vX
	PSps2PPhI6fb4u3nLgUo3M2APUYEeT58IIj4vyhDO+bHZwLCEi1V8Yz14DgVakJ4YxwGpdQuORl
	Zmq2AukMEKMc5iEOwtrS8vah0E2W5J5CyszAQ50YiRa5nYusinUL23TmXk8Tl4/iP1yNWY0sAx2
	SckFUYOCaYUhmWW+u25rpZiV/H++Oiq4pddRxw==
X-Google-Smtp-Source: AGHT+IFQaf2/quvTqoYP56zHi7rDJ1kU/oDCjLOtAqY2CrIIfApBxqj0fRiT+qyx0t2yLBZe47FKRA==
X-Received: by 2002:a05:6000:402b:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-39132db746amr7831737f8f.49.1741610440032;
        Mon, 10 Mar 2025 05:40:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:27 +0100
Subject: [PATCH 13/15] gpio: cs5535: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-13-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=upkC0sTnirOv8jzXmgfAKpOw7VETHSI74rIvOJP9nNY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt24AJd+rA6oBAhfBjVrJiAiOO4rj4bvTZfgG
 LSaiIwYXbCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87duAAKCRARpy6gFHHX
 cqFOEACetKHZ/3lXaDvu8xFsxkNP8cTKKcRF4221b90RoiJjw/dnUkAA1kFBAbNJsiuDNXhkGIH
 bjlGhxIoSV5KpWVGB8pDYH2YD1uJFHda7kXeZMoEzX0/R5mNw9qR0xwvXNy7x6nf5fdJIgwxNjR
 bEp5lAhjCw3D3VwvSmWgMzAZDKh09heJCGEw2ChM6CxyxV1SokLgFPM9LH8cqgQM0vVUwxn3Isy
 ncFXWgcMSJE68btyjRjEqs/ErRld0BpnEy+vMOa1fbLXsdk42eTsS6YVOWY2e6uLjCw7oPhhPP6
 418wKqULs3D/IMVbpfmfv5Pcr5EJz99hqm/zhjBgTdkBBe5FpOMsr0AuipkrsPq1Hj5Y5xeyt2U
 8lvDLwMF4ttEGMg3m3AUK8OMezkI21iei50FlV9shyKvqYDZ+drlPDFfy4rV+bTPhpHfEUT6CuH
 Ojq/DU1m0I1s4i9ryGQwdrLYotl4eSTY+OYXeqmuVvTOwQ6RNTf8jH3LJ4aZpfsfxCMtXilYanL
 OcY+h5dXmJ/1lxjTNoY/4pBZR7QFKX+i85Yb/zScLcILVujiCsbdKafvj43EbZh/+ATx+BIk8xp
 k4904Acu1ocjMI0Kc4CU1DfrqzPC9U4XclfcQxpOKDlsWPHnFNbeyhKgxkRuXpD2q4b7LAfdf3V
 pa2oV6E+9zRBYIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-cs5535.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 6da3a247614a..143d1f4173a6 100644
--- a/drivers/gpio/gpio-cs5535.c
+++ b/drivers/gpio/gpio-cs5535.c
@@ -232,12 +232,14 @@ static int chip_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return cs5535_gpio_isset(offset, GPIO_READ_BACK);
 }
 
-static void chip_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int chip_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	if (val)
 		cs5535_gpio_set(offset, GPIO_OUTPUT_VAL);
 	else
 		cs5535_gpio_clear(offset, GPIO_OUTPUT_VAL);
+
+	return 0;
 }
 
 static int chip_direction_input(struct gpio_chip *c, unsigned offset)
@@ -294,7 +296,7 @@ static struct cs5535_gpio_chip cs5535_gpio_chip = {
 		.request = chip_gpio_request,
 
 		.get = chip_gpio_get,
-		.set = chip_gpio_set,
+		.set_rv = chip_gpio_set,
 
 		.direction_input = chip_direction_input,
 		.direction_output = chip_direction_output,

-- 
2.45.2


