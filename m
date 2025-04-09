Return-Path: <linux-gpio+bounces-18544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 942B1A82058
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 10:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F76B420006
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 08:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5D025DAE3;
	Wed,  9 Apr 2025 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jQvGp34M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AE025D8E8
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188055; cv=none; b=EeWYEMYinXnXAVL6l+JXeXwPsI1lkpAnB1GuXFbs1Yk6PezVtM5HMt9ia6RYC5dRHN4HRcBjBqegckn+P+qaK+njrBjI6VzbqSwiCBRrB0u6KUoktd0ueJZ3p8UCSTryFE6bjwVAR2ETbur1s33YAsCVUWyTqm7etP/0p9eTB/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188055; c=relaxed/simple;
	bh=fa5cTkRDqqhhVl7VbbjXyrlh+4Fb8+6MIvJLxTQ35n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5ZI9mrG2Qj2zYcGMlnCK7xXeyuhzw2UCLO0FbtPXzsR8wZkxnNX0E44KWPucohBfHWLWSdfWWVwc+Sazqo5sW3kHDxK7vpAonyrEnf/yqTXyCtN1q3NjH2IpJ7wgCPXqzDWetME9a10xiApEUUah14KbxzBZYr7Daj3Aq72QTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jQvGp34M; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe574976so44322255e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188052; x=1744792852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhxzR9twRT0d+wFu1RoPufbuenYk6hkExQ8ZTUxlkc8=;
        b=jQvGp34M7sZb7ZfVlPbw6ivlFeFgrY7slpF6sGZLSOoqpwfm+sqvFgHlap4EKNmCjW
         kJ8ppD+qRHWCvZOHVH5bX0+dmerNaLMNS90sDPSPD23FMuRfOu85AMLgJeJTlCtDxU85
         MzzKdInHbHHC5X047wJ7W3h+HZpZARpDTsWMbdD1AyNRDWsKfg4kVQr2DgkUGR/OTPkK
         JcCiba/TgFGK5GE4QDUEzPLVcQnvWV/XlFDI6ITjfYD5/IG2+g/YvqGnmJt+iYEwmO0Q
         e1JAEy614fFbJNCOeb+0Nn38EU9NZFeAZ13Y9XOkOYvvgH2FKVwaQaWHGVMxlty1ImPs
         3zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188052; x=1744792852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhxzR9twRT0d+wFu1RoPufbuenYk6hkExQ8ZTUxlkc8=;
        b=D2JMTpeR1ym2N6c17kN4OFLlB7kblrzIGQGNsFg7QTF09HoUMBy5p0pkhhiBn/sn0G
         nagqL91Ko5p79fsVqodHZ5+TrA93EXvkTdZYr9VZBVaSWWp+z2YpBxR4h9QB7Pe0Hx7R
         nr5OSiga2oBABRjpNdm+tqpigM/JrkHOu7T5isxuM3mD3CQ4LG/jbQm3EThF7UrV3+9r
         vb1HHG2/uZM1S/ursTQNvayjRVm9jYwrBs5uuFT2LIhfoOZkX4kZGuSAPQhjEGkA30GY
         iruyQMqevdlArPVwCI+dhTnXJIK0SrQd9Y+f+6C7k/BPNhclwLivZjmr1X+MGXLDY/TU
         bZhA==
X-Forwarded-Encrypted: i=1; AJvYcCVlC00Ajf5BhkHZLtk04Bn5jxH6XxkTtaUWx+y7sHLv2ZvpjR8ZdLOG/IaKhiFmvt4k7PJBfalgTaMU@vger.kernel.org
X-Gm-Message-State: AOJu0YyujBQzLhATrnNaRn7ewPWIRBtMdH88ka6rrPQnKpntJJEA8nY+
	0WIBvsR5bwbS9Pcz7/ZR5tIe22YTPSzoOTCVfy2r4wO2mbsbHLvDwWcedB1D7eU=
X-Gm-Gg: ASbGnctqBhiz9pZ/EEc8r1ffZJ9c+VGADCmO7LJIl/j8R+scoCrGP9CmtGvC0ilhnfe
	XpVomieMwAqCXdFdkwpdD++etvcntiIsDO+r7sjmdMu5s5BMItx2nITT/GvmZRzkDo+LguT3btj
	I/MrX7BEjjJvrVgHCzSduRm1jZ3AFDAN5MzLJ+md7mvLLI372y07crCMCDMippQ70F7b074iIfl
	hbLgC4VNkovGXlPj0TZ0jmUSe+IppCyGOq3edyS9xmcpvqSVCCxmnjGUjqvHUKL7dx9yT/pTjyG
	dUBXP0N8q8NEeIsJ0MBK4Xviz/FEYstdgg==
X-Google-Smtp-Source: AGHT+IE221ElSZ3Eo2bUES6uFsWN3M+0WY2cPstH40E4ixtMmAT4pmiQlZh/mIhEck0nLaMp936/aw==
X-Received: by 2002:a05:6000:1449:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-39d87ac6456mr1892672f8f.24.1744188051588;
        Wed, 09 Apr 2025 01:40:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Apr 2025 10:40:43 +0200
Subject: [PATCH v2 5/7] iio: adc: ad4130: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-gpiochip-set-rv-iio-v2-5-4b36428f39cb@linaro.org>
References: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
In-Reply-To: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9o+4uCrbiIXfKgm+/fV007oYqSqjRct9ZS0ApGPT4xk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKM1FVfNVaqoxhxfyFLosUXEqyUp2f7i934x
 MAAIDObnsyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyjAAKCRARpy6gFHHX
 cnAXD/9IprAnOZcPufRqcHQvtePIhG0TYa4+o2CvuaZHEicdGGElH5XQPpjmiuYnaq7qqt4d15Y
 Y5HweRrVh9z645WF2UVpD8TD3OVvqXMQAAhRJor31TzgsH7DXLsMRqqUZ5m4tEO0kEZMPKGLiQx
 j0Z5kwcAHf5XhPOLqBatPwkbrA6fuBlb4SCubNv332PhZRCksW3BcxcplZgMtHHLNisHVku4z4F
 WPX6Q3noTVxL7cQrlC0Aba+ErC+n7/BxXXvLF1UlcGV06EbzIl3oRRgEwl5Pjyd+m18hnagbe5C
 U88aVwBVvKpDeQNSw2NTPaZ3gGfmxemVq04bpGa9ZXQ/ZgzEGhzuD92k8iqEsWlED7pn88zQMnP
 7uUwUPTXoTCV+kwK162hygzH65G7Gcgb8LEqrVk4HLxW/67cQ3J1IIyeZedZ7LeCzCtqjedXNm1
 jBYVYNNDCH80gAU0tmgLBzMAxihKRFaRmeTvy3vgSPMtsdz869ZQZw2gb0BGWOX+O0hO4HMkzQM
 WDf1b1wnXh2GONKmW7TqcC6HlCutHr4Us8o0LTu/ubN3qk8UVyMD//AUPBJWNqGaomcn4D5vdug
 MPeYVMCm/AjJhCET+x6ripOhBgin9zRb3Yuimmtx15f2bP2XvynZVwi8LU9BMjqpxig6KoixUyU
 28JCLnPrNGShSgw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/adc/ad4130.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad4130.c b/drivers/iio/adc/ad4130.c
index 0f4c9cd6c102..6cf790ff3eb5 100644
--- a/drivers/iio/adc/ad4130.c
+++ b/drivers/iio/adc/ad4130.c
@@ -522,15 +522,15 @@ static int ad4130_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static void ad4130_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			    int value)
+static int ad4130_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			   int value)
 {
 	struct ad4130_state *st = gpiochip_get_data(gc);
 	unsigned int mask = FIELD_PREP(AD4130_IO_CONTROL_GPIO_DATA_MASK,
 				       BIT(offset));
 
-	regmap_update_bits(st->regmap, AD4130_IO_CONTROL_REG, mask,
-			   value ? mask : 0);
+	return regmap_update_bits(st->regmap, AD4130_IO_CONTROL_REG, mask,
+				  value ? mask : 0);
 }
 
 static int ad4130_set_mode(struct ad4130_state *st, enum ad4130_mode mode)
@@ -2064,7 +2064,7 @@ static int ad4130_probe(struct spi_device *spi)
 	st->gc.can_sleep = true;
 	st->gc.init_valid_mask = ad4130_gpio_init_valid_mask;
 	st->gc.get_direction = ad4130_gpio_get_direction;
-	st->gc.set = ad4130_gpio_set;
+	st->gc.set_rv = ad4130_gpio_set;
 
 	ret = devm_gpiochip_add_data(dev, &st->gc, st);
 	if (ret)

-- 
2.45.2


