Return-Path: <linux-gpio+bounces-18294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13848A7D5A1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7706E3A42A0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029EE22DF81;
	Mon,  7 Apr 2025 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s1j3iBDL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE9122D790
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010299; cv=none; b=VM7NTOF7XrQzlGaC3OJvdORRjFWEwtU1pXLv8j0AamUMe3ieeZ6FptiDwCENj8Dkpl10N3Nhz4vOB4Od1zOCWMjxe0+C4EN+GNcO2OuieOAKku9OPdqoNDbP2m44tmYK6WJX5Spw+PqAsLm7toyktezB3bcLSKVG16Y12YnQ/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010299; c=relaxed/simple;
	bh=yKb2tGGtXxCNUOTqiL21FaJ7Q/pQ18+z3JJG5rRWGF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSed10my1MfcNYLJhIMawLNufoOv1sswDIPJIbuS+C7m5azyi1vweOCosnm/y/1efWgvcfVi9MbRlXP+P0jLFeJlBfHHETz5/dB0iZ51ketOcLL9Uuh45kgSMuW+peFPKrk11ZpIGkRjDvEwsY9GuTaAb7gkfUFiJcQilXZa91M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s1j3iBDL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so37165835e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010296; x=1744615096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zr9dH4mVj2rqDEhAd/rOCSxsNFKMREWDyIjOpr8UMM=;
        b=s1j3iBDLJ5a+l0jI1YchpfZOUKYmv1qZHDecXgv2yFM/9wwtBegWvzckNhoPcMiHPP
         H54FWCc4eeXivo+p1Sl9wdbJyoSc4ego5LtAHa0CgsKbXXpYdBGBYjwolo6Sw/9bR5SG
         uaL66SCa/+EYvDQvVApuw4FgyRPO7K4C5y9pAKPHfgQ/xHsZ3y6gBNaBodnI661iepST
         dSfm9w45ZrsM0oMLcEvGIH5KGyPKtHnJPJkhdd+YiPofksF3XY2pUVOHMYzvZkVrA+ZA
         JMW/mZkTDPYb5BL7MXgnPa7wtk/Am6PV5wz+TP0TnTzTkZ8mM3IxumG3VbH09xBNKUaN
         pQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010296; x=1744615096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zr9dH4mVj2rqDEhAd/rOCSxsNFKMREWDyIjOpr8UMM=;
        b=jLdFalvGx2OX06iHikhWBx3pd/dF5lNxkdfigKD4dfYp3D9u+k6VHITRwEwosMoy0/
         w1QfDgpGlOmRQSRO2o1JQlUZFvBhpLP7i2nFGrEX+wMKqAmnrQR+hg3RD9euSyzSL3/C
         /5Ai0+szwg+H6QJlVHg12zcF64HXiXuAnhj7r4y0f2DgOIdCeWi11LiDSr9HPn39cS1Z
         KbEx2rUmuQigh5A5wkc2eeOFhXvdFHgWsUSp2ZWBOGDI3zsCUVVYzB5qnUazZrd2mgb9
         owG2uIYhHjIuIpPuKxXkr0h23HNAR7YBgSGUFlgTXLNKSahgpTKayesxFs9GpiMvSeKQ
         4+cA==
X-Forwarded-Encrypted: i=1; AJvYcCUpS4vyztEry9DiEbFihbYQr2NCnch6h+BqVI7BlQmr5TJeBYXxYYK9Bo0wysyXABkRJim1tfYeukmb@vger.kernel.org
X-Gm-Message-State: AOJu0YzSahLMwro069K526jVp90LjlM/3/80E5zQORr2KuO+rGUK/5SN
	zoMNXlYqxZMvxJkxsOwgDXposlqTt4GQiwEGIzEROWYztB9NRD57LKiB43N1Yi4=
X-Gm-Gg: ASbGnctlgYc+fr5tVkH4cX75XjyLTGKWWzA6WgBKsCEL4eX3la8DwuTqnecUdHim0FA
	oHf/aFFUX0UzRP48ULY8kaFB/aJbyb7g98WJmbGbcZ4JoTIsmyUjF1odNi+01rh5swY2jk7d/02
	mwnXqkLeRrig1FMbDSTicCNGaE5WPvRMOJ8dwjhc6+zP6/3YClDyQwvKRa64q9ZF2NIZ/WavHoP
	vWWIYs6tkNVvVuGmsHKwgXKmpwyJaifNe7oMm0I8xmHnz3W5i6xuZw0AoZzJo334jkNqZqPdhZn
	geNH+Qm23yQA2N8g772lgcUP7icvOUjUW9rzZg==
X-Google-Smtp-Source: AGHT+IH/9uwnlRnmaoIBikMBaRB3L0kc3rHBg2XlSEvKBxasD0/FPM+b/UEUjfpSWzqebi/oRdsMRQ==
X-Received: by 2002:a05:600c:1d91:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43ecfa18d8fmr136443605e9.30.1744010296161;
        Mon, 07 Apr 2025 00:18:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:11 +0200
Subject: [PATCH 3/7] iio: dac: ad5592r: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-3-8431b003a145@linaro.org>
References: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fvRt+EK60paf1O61oPqPBqlLRQ5+ti2f8yEUANnZO/o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wze9ad+rXzcETMNxt0XZzZFqaeVLzfPfel6
 h4IbhEu6pyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MwAKCRARpy6gFHHX
 csMuD/9+px1e8RHxtlxU8UJjN1DhM5X64s7PbCqXanGef6mcVLK/TXyjyM8wUQ9EaLRC9JO+o5U
 biY0C7MiIf+JGLHulKVJfwLs5UTVeciarYmOJTUIEueUJVkOpmbABbaEBifCNqJtBm5rPnf/+9h
 E+0UfBZCnyusN+wxVG/Bim0jIurBS88YT4rTd7m0hCjvWJcU45PPGM+xEYT46pxGrrSmgGoF/09
 4j1vhpjvw3D6NECJyv3D+LTqKXDlcCn3PvFjGThs7r8J/LkYdoSzN21b73UjQvYATT/HlYTOq9f
 Y1u/hmcx+KBqjBCoeHckFu7FO5vTVlSOcOgAIgXUsR6nJre6rr6/YAyDIAwzYsPfqwcb+XPZpG3
 efJjdVb5JTzFCV66OVMUDYdu6j7DVikSdl57dHId7zBso7wS2fp2PKD5w/h5eoM7RwogoRMzJLp
 tq2H9+YnttGOYtYf0O/Dm0d3XDlHarB97/kD4bmQnpEo98zmUjhlCVnutl/gkdrbAkaFdly3MSP
 zOnMKJ6mZG82/ezqINko1TiIvs5EWLGddTY1nqZf/6uyy4M6OQCbURa/oNGqAFXVfXUohuXOj7N
 Xo1sXJTxRuHA98KCv2/QWHw//o+5wKeKK/82LzgZAeTi7oJKdwU2tMt3gS7BBh7HKrrgEqCy1JM
 uLwC+SKNvaBpvCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/dac/ad5592r-base.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index bbe3b52c6a12..ad650dcd73a0 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -40,7 +40,8 @@ static int ad5592r_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(offset));
 }
 
-static void ad5592r_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int ad5592r_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct ad5592r_state *st = gpiochip_get_data(chip);
 
@@ -51,7 +52,7 @@ static void ad5592r_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	else
 		st->gpio_val &= ~BIT(offset);
 
-	st->ops->reg_write(st, AD5592R_REG_GPIO_SET, st->gpio_val);
+	return st->ops->reg_write(st, AD5592R_REG_GPIO_SET, st->gpio_val);
 }
 
 static int ad5592r_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -128,7 +129,7 @@ static int ad5592r_gpio_init(struct ad5592r_state *st)
 	st->gpiochip.direction_input = ad5592r_gpio_direction_input;
 	st->gpiochip.direction_output = ad5592r_gpio_direction_output;
 	st->gpiochip.get = ad5592r_gpio_get;
-	st->gpiochip.set = ad5592r_gpio_set;
+	st->gpiochip.set_rv = ad5592r_gpio_set;
 	st->gpiochip.request = ad5592r_gpio_request;
 	st->gpiochip.owner = THIS_MODULE;
 	st->gpiochip.names = ad5592r_gpio_names;

-- 
2.45.2


