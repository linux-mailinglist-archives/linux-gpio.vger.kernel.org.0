Return-Path: <linux-gpio+bounces-21637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F145ADA935
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAC5D16FE61
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D5C2147E3;
	Mon, 16 Jun 2025 07:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qDCrGNw6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531632101B3
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058351; cv=none; b=TyfrqmfuqivYU07Qjwkp4cCykbLTwMhUIbjNtz3PVMb6tNPZjFRuAewU0QdDGZoGCO4824Mf4fy29AOns8Z5wwzQaDWQ4hh0JVe4jl6X/tRWWAcNVlIh69Lq4iLunTF6dJ2JYcPdqgIe60SRU3KEcwDnupqpzBZc4YC4K/uZRcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058351; c=relaxed/simple;
	bh=j8Ee5zNRTgD6Im7szjj0YX+ao0qiLzGNAn/JhbhBZbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4rA4APqvlfhp4PZsqEidgL+QZzibk2ncTX3Qsnq8naM56iEvmRgw4sztQVhz/wNh42fN6MeoTt1EQZNpqtKLk+rcvdXWOWB03TnDEqPPC7ALbcArJW3/X+ygJYBPzTiw8VqLuj2eZ5isqOzhhL6S6wNro4LRNofAErPC7a48B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qDCrGNw6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4083762f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058348; x=1750663148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnEiJ0DPVJeTNWgLtlb3XDcjvamvu9NbT3oHT6+NmYs=;
        b=qDCrGNw6vOVtCYsWW6pZuP63jtcaTzjRYotoYEfzsBcsOw77W8+OTE6sqlWN2IplRj
         /Lw4SofKdSF5agcg/Ab3aQvGFlMSFeACELVDKms3zaZU0xZXOttedeNdzTwI9chwpeQM
         bLJLEOpGSAjSaU37wZiuN0BwFEsRAkGMhvJ5rfDixq87wbIW4eNjy8kG1/o+18mPbrhs
         w72yENPZ92jOI1BVtK7pToaDHZSwASfVUrdML4MH2Kq7RUWFB6Ep6YoVlYtONRa1X1RH
         aXZ/3cKlPu4tvP0Zy6Nn2u+UXIEZr+lNCv2zyZKx1b0Jbg/DaIQUONF8U8K9iVv5V5Gs
         P6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058348; x=1750663148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnEiJ0DPVJeTNWgLtlb3XDcjvamvu9NbT3oHT6+NmYs=;
        b=uSSjYxPmrmBiNj7x1z8s7QBuf340EL1BwVkTrVF/ElB6/IT1ghPLf5y2+JoSVc9Tfc
         SY2yPgVaUcFaFsEzExQ8cy+MSSzyTFbqhpNpK/c9+0JZPf+R55HfebCFC9PwVFs3zYJp
         Tqnng6FsEvQOaXnUeqtJCnr4tTB0zZWk2J4vXZwtbYzJfnzWVlNdkE3S0WRBGpFPyx+k
         f5RG1bWf1ETZbRj8Mv8/GpqNJfR1K1AmuQ9K8veyxOtASzoidJoB5MW8R8eKijfrBHG7
         ZUnllm2Z9qAIUIHpheXmbnxM+C3sa7su/B6J+aBVkO/J/d9gxy2dPjKWEN5SbbeTbJpG
         8nrw==
X-Forwarded-Encrypted: i=1; AJvYcCWSjB//k9IvDyqNRMEe2ycwBve1q+j6W+ObKbKkh5JpSpjExxCDe1xG/o9tX5byB4g7GpLyWpoBs+Za@vger.kernel.org
X-Gm-Message-State: AOJu0YyEruGxtGvSvkLCRltOC2W98Sk4LTgRqYsxmqETPxZsuyX3Xh0j
	itzFd4kaxkxyB/zvPta8UW1SjK7j6RimQjhU/f65Qs2avJEkeGAptlWY5Q0HxtsbYfk=
X-Gm-Gg: ASbGnctqwhBE5gQ9aYH0pP5TiOcJ0yOLg+HM5uClSfISfetYNqj+MxbtRlrhhEajNWK
	0dTTAna3KTqyVS7zGc7+nK9Q/uj6FbNnKy/NVyWyUPAzuDaVVFsQqnTvPZy7rCpWlUa5JmFeQWG
	FPHiw9Z1l0J1Q1jM82B6djPWx+hRqw3kpUdIFyr84Ol4tSMeENxLBhVWTedSL17GP/L4PusscuN
	7Ms0mFUN4Fgaa1JmGWquimSyAVGrrQoDZuzwLaEMLjkNgOsE/Ue+hrPZZpk38vNLTQ47qTkfIAz
	+bbM9NDbfbu8jjS72jKoamB6VP5acFhr80Ncbc80gG0Vvnz/nVyJBVN+
X-Google-Smtp-Source: AGHT+IF+qO7rWbAY/SNylys3RMK9GUs1aiqLgKMYCwlF9r3dPIWRev8VFgPCt2yqZehByEZR5PrtlA==
X-Received: by 2002:a05:6000:430e:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3a572e56dc1mr6643153f8f.55.1750058346514;
        Mon, 16 Jun 2025 00:19:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm10104675f8f.45.2025.06.16.00.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:19:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:18:56 +0200
Subject: [PATCH v2 7/7] media: i2c: max9286: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-media-v2-7-6825114f18b0@linaro.org>
References: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HgIaQmZBN+2BMb6XtS/4r6T+Stu0X4lPC1c0+Nqlo58=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8VhkafOCJzunwHbvzisJ4lCYekKB0yX6Z1BU
 lA0/7SwGLeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/FYQAKCRARpy6gFHHX
 ct50D/0R/5NlZeCsQ88EZ/XCDrW343VojK/G9nbfS4hJar5K6EYRhVcDHsK+tMtcwIOj+0f1ozw
 OjUPWbhs742QvGSlKtHOqOmq0AUJwSteNm3ejtzQa9EYOfB2dfGfxmuV40c36KwLbWsDvqQAiBe
 yy+ikCLRngH3/7nCo59Lo5rKfr+O8tb4jhbIY2p3R8UPlZEGn5mmyC6Nre6P4qcYRymZ1InB+YS
 8pTjnbsKf4znlbuzFq3DCWdw3kkLja6z/U+BK8h5N1wtkoYA26csJVzcxeFCSGTvGX1JbbOa1/E
 IbzmubKPKPUAiwp5T8yUhuCweat4prnW3G6L53LZ6An5q9WhvnYR/EFOb5IEyxlMLT+mCT6Go+S
 99sue8AZtPQ6RZc0UUKhuYM8EvHy0Sr9FylULPazl+k1DxGjqp6udkaAQcJ3fhdtHO5b4bmA1jB
 X/NVEzdIFrJh8ql+dxLTcROLtdTLpFBf+ErT2WrLXXRttzaGq7fx9ycItE1Ub8uh/kkEaOECwNA
 SvDORHEtVtlOjehTqC+sd29sNRNVxhLYEA15W0tcZYH5p+cOJt6NVH96vtEMgtZzbnDuLZ4w+oT
 N8HktFnOdHwD56w/WQ4v+yNbF/AYhECgLsA95l2vZ68K2cNVR8yaGTfzSUZ8b4GL4h+HysK/HlX
 QKE2oo1JlgG9XGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/i2c/max9286.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9fc4e130a273f8547d7e7ec194cade5b5e9c8df2..1d0b5f56f989874e46f87db4a49d935049e6e7ce 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1193,12 +1193,12 @@ static int max9286_gpio_set(struct max9286_priv *priv, unsigned int offset,
 			     MAX9286_0X0F_RESERVED | priv->gpio_state);
 }
 
-static void max9286_gpiochip_set(struct gpio_chip *chip,
-				 unsigned int offset, int value)
+static int max9286_gpiochip_set(struct gpio_chip *chip,
+				unsigned int offset, int value)
 {
 	struct max9286_priv *priv = gpiochip_get_data(chip);
 
-	max9286_gpio_set(priv, offset, value);
+	return max9286_gpio_set(priv, offset, value);
 }
 
 static int max9286_gpiochip_get(struct gpio_chip *chip, unsigned int offset)
@@ -1220,7 +1220,7 @@ static int max9286_register_gpio(struct max9286_priv *priv)
 	gpio->owner = THIS_MODULE;
 	gpio->ngpio = 2;
 	gpio->base = -1;
-	gpio->set = max9286_gpiochip_set;
+	gpio->set_rv = max9286_gpiochip_set;
 	gpio->get = max9286_gpiochip_get;
 	gpio->can_sleep = true;
 

-- 
2.48.1


