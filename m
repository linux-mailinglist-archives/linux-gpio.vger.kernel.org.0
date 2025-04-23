Return-Path: <linux-gpio+bounces-19183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA6A981F8
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDAEE5A212C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D6727932E;
	Wed, 23 Apr 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yJ+9L7cy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D758927584A
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394849; cv=none; b=GQhNB47dIBYroYU0QY0tD8jHSkOdBY6/6j2zoyqraz/eW0FhLAHaZHqdpisDrEfsVU1xmmmgk/5XQS6SgMxCg2RYR81yYuLElG/+3EZno0NrrM8H7BiBkUnHGyiSg0SLEpspOYffcN1QXAKIOXTyN+B5GSmEs5LxuLJZYl8zfNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394849; c=relaxed/simple;
	bh=VqGDq+aiJzH+1k4/p5pVXAekbmppDm03yyolVhT8cKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4QVKr0uwPGPP7CFaj2tYOKFiCePr7pWu9/Nx+bXxwqoXy3bfdPQGrsJxaHWNU/1ZXksYk7Xf7lHydObhgrFB8yf9P6skTTjr6dilRPkfKZ3UY1Py98vOt+hjTCW89gSlDdG8OR8cGpVlliCzSwCQjQX2LKtvUIb1HWQY5/n/mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yJ+9L7cy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so48437165e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745394845; x=1745999645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTFfJZb1P5uU8ezKo9spOiDP3fTS97bBPzPp1VNuiFE=;
        b=yJ+9L7cy5xIO1QVUjmi9YeiPTmQ7PuD63tm5UuRxkJBYFgRZN0FSYTHOVGN9FFFMFW
         CgtGeE2PoYmae2C7F1v+wqFFfoT6XF0nGtH2vgbVqbhlAJJEZDpoN81O9Ac/xfbOVe8T
         QVPcMFWvaU9TuWiuM3gugil2F5FYaxupnwGn38DJ4nbooyukMN+dDn+OcjEZqn66HTrK
         Ms9/ggo2XVvJwtw+Awx8smTUnzESrhIP6kak81WLJP/AyTM9arr/itEdk+hlIVskcDn6
         Qf7F/xN0TBjh6KdjZb0wit3WzBYtGLUXFh2f+jh85WRox2z6j+ZmdvnFRR8efh8pXjCS
         GVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394845; x=1745999645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTFfJZb1P5uU8ezKo9spOiDP3fTS97bBPzPp1VNuiFE=;
        b=dKgc60xdy2aOHk1cHyAS/0EqdfQFngIMSCH4+1mZz0FCxTNrSr4m3BYblktzYxyBD1
         gTQCgV0pV/IP24jGv1RQ6iS+s6y6CMgoM5zXsjlX94v5FZzBD8tg0b8VJxlek3O9o0uc
         kgNw7XYDuj/EwxiofOnugPE+t4gC0pmKvEfWartUfLMcjxGH40aSATvfAgUvAF0JDUmm
         nerToD6HrLPnDKfAcLXC4aZZRG4pchEcxCnU++zGyCOiWs5bh+eGCI+0VDJiDMeTJYDf
         ukG4ZUvkuxeAsLLrAik5FMbLt4y6Bf5zru/tCp0NZoGxGTXVdQm4JcAFmzmpZgICNrlg
         4HOg==
X-Forwarded-Encrypted: i=1; AJvYcCWm3eLsWoLmN/v5d2lZX7/4eSL2Jsl2DW52hJQFkQH3qvHqqQXTdxYxiLjvqB6VBAC7QBFLAsA8uRDy@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPPVbAdWCcJ1Quln3rSe3IOOpWw8spKYasb2q0x9q5DAkC2V0
	kPdPf6Wco+im7hdzzrhmBYOKdYNVrWv+GhWEwVymb7EHrbGd2g0o98tGcnEPp/M=
X-Gm-Gg: ASbGncuEpeabPxay3noHgU1c8rvZ7kmGSs9Q7gZhFkNj5SIyx/j3l0VXGTu9ADRMy/r
	LlAbVHvJTP4dZVZIOCODeg5/iD/cgYOXdR4STaEDFaUPY3JNGqrGPll+CxFaoQcEobDjY982jGj
	Gy/vzvxKWnj1ROyT+YDuhcXRD8BlllaGbPO5YXDzn5C64GMtgNiGFuPdpCh+ezPmd9F9kaG1Sjv
	zmTpxT1FTGc0C8EuJPyYaTLgf+b/TcsZ3BFNsbmjfhR7UVgQ8RZ3EsMIlHtnCAgJ5EDPGw4qmfs
	Xer+MNPqqvPw+gOtDrKxRnBJ2eVGdXDn6ECVSA5PMJHo
X-Google-Smtp-Source: AGHT+IGTjzRevoWNUsBJdpmO0+4XcLcpnz8hcwqfrYaEOvZnTxWcAwwm6v+Zm7rMHLQ3zUTTTB4kuA==
X-Received: by 2002:a05:600c:1548:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-4406ab7f661mr150504825e9.5.1745394845053;
        Wed, 23 Apr 2025 00:54:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4330d8sm18266655f8f.33.2025.04.23.00.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:54:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:53:53 +0200
Subject: [PATCH 4/4] leds: tca6507: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-leds-v1-4-2f42d8fbb525@linaro.org>
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Riku Voipio <riku.voipio@iki.fi>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=j50twcusbXfbWf3YimG8kilK3UrQntg92BiiLpapoiE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJyXXWKiAH3snFZHuRbLDBqkRUlZiVNabT/vi
 W2Az4GKo/aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiclwAKCRARpy6gFHHX
 csOmD/4z8pV0ShS8Bn+cluVeSrGpphqnovNsAHA6+L3NqKstpdKCMPStq21vJwK4g0mxS0hWlcS
 W/xwr4ddv3T9CvuZwJXyS7Qsh0WGkIrfEB6jWJn8zwbVmsNCnhvq+2geTenkaVPKnom/4ctM5j4
 JgsfG9W9EsKZmGRPe0IlnNhYGnrgwwKhPfh0FEzyqylBMBT3LDWTQ80EfwgIUjP2RsJz8laoB50
 ddVugrvsnNWDihdOrIbIo+zST06DfSO5zbXNSywQ/eAZ+/PLO4SpYiNOQRkbpwQkQ+9EzIcCOFn
 cXVbzHvISKu+pMczH2P959jlGJTH8z/bWQoQI8jQRqfHQSG1ty/je2WdbzcwPEhxmvIQMptJw8j
 cphEyFKe6MMttqhABUYsYNSBFfHYdZMDtGEfth03zput/5fK950xdoMp3rIdIUtPoLfbTeNv6GO
 hQfx7dRubXy1YAi/UYOKd5DXqD/NjH94DTTiI1jmVAClq6lQrdBg0jEvJYCSe+x1Dtulx2A7DMy
 XoRGElSeAKl6Xl0dphxCCmFmCdeqggex2mMrB2WtNCC8dvRYFOPV9mGqU3ScI5IliD6RvVjisvh
 SbVb4siNzfRdTGn/30tY7d5lK031ZpAZm55H710vzt14UeGyNepkLazvm3OW+IpHgdMCcJ4VT6X
 svAfxJVCje8xDhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/leds/leds-tca6507.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index acbd8169723c..89c165c8ee9c 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -588,8 +588,8 @@ static int tca6507_blink_set(struct led_classdev *led_cdev,
 }
 
 #ifdef CONFIG_GPIOLIB
-static void tca6507_gpio_set_value(struct gpio_chip *gc,
-				   unsigned offset, int val)
+static int tca6507_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				  int val)
 {
 	struct tca6507_chip *tca = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -604,13 +604,14 @@ static void tca6507_gpio_set_value(struct gpio_chip *gc,
 	spin_unlock_irqrestore(&tca->lock, flags);
 	if (tca->reg_set)
 		schedule_work(&tca->work);
+
+	return 0;
 }
 
 static int tca6507_gpio_direction_output(struct gpio_chip *gc,
 					  unsigned offset, int val)
 {
-	tca6507_gpio_set_value(gc, offset, val);
-	return 0;
+	return tca6507_gpio_set_value(gc, offset, val);
 }
 
 static int tca6507_probe_gpios(struct device *dev,
@@ -636,7 +637,7 @@ static int tca6507_probe_gpios(struct device *dev,
 	tca->gpio.base = -1;
 	tca->gpio.owner = THIS_MODULE;
 	tca->gpio.direction_output = tca6507_gpio_direction_output;
-	tca->gpio.set = tca6507_gpio_set_value;
+	tca->gpio.set_rv = tca6507_gpio_set_value;
 	tca->gpio.parent = dev;
 	err = devm_gpiochip_add_data(dev, &tca->gpio, tca);
 	if (err) {

-- 
2.45.2


