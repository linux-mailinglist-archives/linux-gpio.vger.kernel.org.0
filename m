Return-Path: <linux-gpio+bounces-21635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0947ADA92E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4748816F96F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACCA1A0BFD;
	Mon, 16 Jun 2025 07:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Yk7SGk2c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D85D202F8E
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058348; cv=none; b=E9LZWdqRREhp6T0nxL5yiKW0BCbC7/edqXplfHzPxKHads7D7xqp1gXko7RiAyBy8hOnfY7JKmI6hCWxwpwUZOf+KFJsa0kAtSTLcN4kJxNZ2O8tDykpLSCUH9Ts/ckFHw2C9ZF1hSfEXne52cDgpvoMBIC3L94kwqje/MYcY84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058348; c=relaxed/simple;
	bh=kgpyXSnZmCFwqfmomq7FGHn3gBVV4OHMPubpvkjXFrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EyjZs9RhpnUBy+kdst+E0MElNjshjfnyBTygC5SVy8FV2M6xj6YKBM6dRiPlXkAZ4hGVZn2nI5XEk9qmAxC1i3qUceiTeI8fl/JBiA4ukBIR/WgD8E++ZabIKeKc+EQorZQ0pQeGxSHVL16nm5t7JD8h2qPacm3YK6qSliUuDSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Yk7SGk2c; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so3438975f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058344; x=1750663144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmUjxGb9YXlrFmgTBSGtVdHlWeBBc2YrESubaUeQXrg=;
        b=Yk7SGk2cUaQrxHdo+Cmw3V7rIXT21M8xtRYzyFrUXsM3LttxxV6DkZCLwPZO9BIBd5
         sVCpOe7EF/mr37LHz4NXISyWxZFNDqqkl4jerxFg7+tu/draaozz3cIL6v+EeA4AvXTa
         k4PpFOE6ice0zu3SaQjOonFN/ohGT3QJMH/JfFUJKWSunO+wQ6dAxsK8Vlg8mHVvg86C
         xIBW6WEgLmPmjWhqv4nkv+GNaDtM6xpR/nD5p9/IVfkkyz13SVYc9BxCaUBwsTKh4W32
         it1buN3iyNUXO0JFXpBT+ekoJpvF9LSBZVYNz7mNOjfxaLfx31u8l4F0efblzhAq5AbY
         mttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058344; x=1750663144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmUjxGb9YXlrFmgTBSGtVdHlWeBBc2YrESubaUeQXrg=;
        b=fzzxNrbmwewkuj4yFd2nZUEQiyUqM56Phe4DtEVOKoLvfNOtHt6uZwVrej2669RwvF
         N5ZUntN8WRJHH8ttpNaOgfy/MZJreHZkKpfs/926hc5pOSyXEb49YEm5nurqPyavM3gR
         1FuaAzMmYtMlTuvox9qePo7QhZpZa4L1yRlotl0L1n2HR/lky7EnX7RMk0m8Xmli8HJB
         TMz4EquB55NhssDVEaIwUtQxTsWiOB8PBz6akBV/U70QbWnczPMo9qdgk297tYI7y1wQ
         yeDVYUyg/qfhev+tuKsGMf/1t/M1kT3kgrQilyzuCOXO/QX6T0tjD9XF9gMz35ExqdWP
         9GhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1VVp8efQYaJD782tKBiYaYBZ8ObAqUffzbyA+IJcIjrOt6zA/sgF3vry8rDJWA+O3stZmtC4x051b@vger.kernel.org
X-Gm-Message-State: AOJu0Yz55fD9L9wJmYCj1iKxtxCpHYxIM0dWZnsyVSPARJohFdqM9YmK
	9xgXn0+pGiFOKVBq7xdrLTzLANeLaqhaeu+RQPk1/cBGmSqL7P6QHp0WmmgbLhnVlHU=
X-Gm-Gg: ASbGncuf7irfKWsoMFwVXmWKLtuNJh+S1QBcdc7X5OXP0hAgzmSY2HRFOmDhCmOSmay
	8117twfIHrMyXhOhW/1xz/zfYSoToDu8Z23GxP9gmSEsuPjAx+IyP/n8r0fgkFpna3fsTa2dxnT
	Q0i+ksOzSYtHhbhzCgbcsT83/wBt9C1mMsTCMGecyY0Kug1GZKT8hQDIWnDeD3oukdF8DJZXMz1
	zjSGMZQ7vzi+2dUh+RlKBositkFACkPJAlOmWvcH7xY7t7kofhhZfx+e1+APeL1BzLNvoTE+8xI
	cC/1dElOPp+Oe2OBdyrFlXvm/4RSa6xmkEKpg+zrrvpISgdzWpMcTsIR
X-Google-Smtp-Source: AGHT+IGz82INEfm0MrBcQOnfOvjXW+7kZRw4hSg52Kw3fKhlwkINRRZt46P4IvIxeYULedfUDuAn2A==
X-Received: by 2002:a05:6000:4308:b0:3a4:cfbf:519b with SMTP id ffacd0b85a97d-3a572c455d4mr7114649f8f.44.1750058344156;
        Mon, 16 Jun 2025 00:19:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm10104675f8f.45.2025.06.16.00.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:19:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:18:54 +0200
Subject: [PATCH v2 5/7] media: i2c: ds90ub913: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-media-v2-5-6825114f18b0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uirTvdGFKLj1HJ829gQF9CK8Tn6xJqSzhqLKMW/nEqE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8Vg+JQxKi0/cLa/njC60fyp3VsUhtFUxANbk
 eGSVyRl2Y+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/FYAAKCRARpy6gFHHX
 cu/PEACIrLPskE3Cw9Fq5/8R9425tpr+lSdYx/OQR1KNyOkXNpvTibWSiDJ4ipusnmH870tGlOt
 XXXBh3avCHvuPMfv8hQN3nANOImkOtLDt6333qnRFAvJsPbiYXvIhzxjBYCaLStZlAIAkjxFCmg
 Wlc/nS3aaqSUaQIvy55jpV2bL8kiHAISTJhdIEKnlXG3fs/Z/wpgpMeEnjLJyix8k2diDf/L9st
 Td/YJuetQOMZX6aJYPulZ2VW3OizRSr03tueMjZTWn8a9b80YypEo2QtQW1nVXx49cMi12DlSp9
 EMRKglTjv+TSa5gvoIu2th1p7hbbg/XvTYCEryChn0sNuaXbbWLvZ1q82lrrZ/DTQyREyEg49gv
 hMwSW5kEHAAyZ6SgYDI2sBAbeSLt/ET8x2TFPCps5Ff8sMtArSTZa1k0REaidF9rienGiifo8PE
 +7HqS2ETNyqQbWX7KFIGJpCMskfQacSrXxzl/2Dst2Z6b2WXPAM29doi+isHi81esf8+fKZGCGh
 M7FC0jBfBOatPBt4l9HXhmb9U0MXJftJ4yi4GNzIqqsJlvEtxf6qjoG1o30WW7Gd95DSCtzIHae
 kR9KkQmHmiOA8nOI9y6KZ3iYSDif1AVvXBiW1yf+QAnUi3gfZgwqkpmYp6ls/MvZ1Gx4AJwUdFZ
 iwenE4uVn5nKqLA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/i2c/ds90ub913.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 6d3f8617ef136c6f47871f5886193fe934c6f3b7..c34ffeae5f5080875463b6b6d45acbd9e107d461 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -203,9 +203,9 @@ static int ub913_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 						   0));
 }
 
-static void ub913_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int ub913_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
-	ub913_gpio_direction_out(gc, offset, value);
+	return ub913_gpio_direction_out(gc, offset, value);
 }
 
 static int ub913_gpio_of_xlate(struct gpio_chip *gc,
@@ -235,7 +235,7 @@ static int ub913_gpiochip_probe(struct ub913_data *priv)
 	gc->ngpio = UB913_NUM_GPIOS;
 	gc->get_direction = ub913_gpio_get_direction;
 	gc->direction_output = ub913_gpio_direction_out;
-	gc->set = ub913_gpio_set;
+	gc->set_rv = ub913_gpio_set;
 	gc->of_xlate = ub913_gpio_of_xlate;
 	gc->of_gpio_n_cells = 2;
 

-- 
2.48.1


