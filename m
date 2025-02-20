Return-Path: <linux-gpio+bounces-16264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41571A3D5B8
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 11:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2B2E7AA12A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 09:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FE31F2C58;
	Thu, 20 Feb 2025 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="haR/VqJx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42571F131A
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045445; cv=none; b=rUwtOyCRznEFmzjPPofo0BWIRzjIe3yWXHM0PbcCPHHHaHYmgFaqch5GiatpaNX6kztPe+PmSl4JyaeDQvRVC5VCaclqO7W+ml1uv8Gaj51FfY2Y8lg622gtAJL3sexzlYsD2PxACBn9oUwNb2NwLJYgT1AwhY3OIRmUxFB8qJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045445; c=relaxed/simple;
	bh=1UjJdHNauFVk729dL8prbwqVaPRcft/vij4kOr5O0Us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q0GnEuTwLi/gAH7yDckft6THLiov4KXwkWRqqEryo+3IBny4nu10eM4qzrgb3pMAO5f6yFQcag2n2HwqkiApzHX4E698MZWVbZoUfDhHa0xfTxHzg9dKiI9HsXRMSuwgpYB6xVcHL2c7R2Hz3zExJvcZp7LK4Plmg2iEwj5i6DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=haR/VqJx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f488f3161so320856f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 01:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740045442; x=1740650242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t60BHMJdvNDDOtnPhpQoRS4maFib25qiqZp8WGeStdo=;
        b=haR/VqJxZlbQHpcvpZE45NXXDq9yD+ZSGzRg/ahCSlM13arO3BzJGmqALcLbfJ4LEa
         //OAP8ciPyqUtv8QlNAp/hU21BQ7FLD8OjHfq2cLDgnQXSp+IZqNbBqyIDJHAowmsM7l
         q0xNbvf1PrXRAO3XtPmQVw/zR0rR4TDhVDTpYo0Q6+fW67YHA9Ere6PSW/2hceOV1RPA
         hd8auheF9U9sJTLKmIxfawqidmg1ltYsNsMqt2V+egn+b9MPotRzRWOwCpR0fxaq11Ps
         bMnYqQUFk6CySNg1h0TwJviL+QbSO/L0DorPzGdF1npYzmRxmXYe78wszGLAlohtkBHd
         zNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740045442; x=1740650242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t60BHMJdvNDDOtnPhpQoRS4maFib25qiqZp8WGeStdo=;
        b=I9S6L+jpznTYvxcuRxCPMbD1SXd1pBKbA5PCftBjGI+2PKeUZUDMNeSpxNq5s5AaDD
         V484IctENj/nfaI5lPXxOop+yWkf+mO4TjvVodvEl0Z1cCCU4FPe7YV7uUwcVpyDSQsG
         HEjWXKpY242OoILQCG4iH8/6o/w5DVO/xSiaE/BrYCF0lSCLoVbZhiKnrIJnaqdcUtWW
         zJI69hYntrgc8oQyI8CV9lL9C9gH0N7sg7f4P/RW9IfhGMqIqBu71wanox78ib/zMmMl
         Fmvg/musP9zsnmYfNqTYQsMF6X7PEzHxsgTK4WQwD1c9cyPDiOcARcAon6kCxmDCoSRE
         JDcw==
X-Gm-Message-State: AOJu0YyWcI8NB476vaBVx1NWpc5NFRfOy8ve3tz2vP5nWjvQDOypmVtE
	aDF/eLh1hWMyChgPFyUSstdeVFJgUhTFbhZYnRveQnxITKCiL8Z7lovGIy3eXOA=
X-Gm-Gg: ASbGncvAjJYaBp5DJIimAgP3sSW+VwDMmAcAbCn9Vj7MQegjdaynSuZdMcv7f1HF91d
	Kwb+e+AE4Fb9bfNy/gN7aPIa0y/TD5tmjPdCsC2bHqvBJUJhC8zGrGoqrkUNBXUajSuhQCONkUy
	iYE3lSG2Xq6UaqMH5QNb0YQcb8M4ZshyWIokmBKEZcaMeJEJ7PWLxhzK0QUYNw1eW4aZvxfUVA1
	qSfRsvy005Bo8O+UsyxH7aAJGklr87QsiwL0ufVggoctPqSl27DVQW6f1dCHqoES7NmM0PQBO9Z
	W3HM8VE=
X-Google-Smtp-Source: AGHT+IE5QNqdk+twDbNUhvP7+J2lq1T3+ma8ljzAbCQVNS0Hh2jrL74ho7WbRmWA2rdWE+z+Ft5e4Q==
X-Received: by 2002:a05:6000:1568:b0:38f:3de0:d16 with SMTP id ffacd0b85a97d-38f3de00e0amr17797107f8f.52.1740045442100;
        Thu, 20 Feb 2025 01:57:22 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e2e4:418d:7462:9cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm20509174f8f.64.2025.02.20.01.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:57:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 10:57:04 +0100
Subject: [PATCH v2 07/15] gpio: regmap: use value returning setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-gpio-set-retval-v2-7-bc4cfd38dae3@linaro.org>
References: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
In-Reply-To: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ajHrG1VX7C/nWZ29Fct+EqLq889nbEm3K33yBSsLTBo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBntvx3jLBtB7CENnstPrIM2B6PKOnXqNRsn95+M
 +Ysn0UAcuCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ7b8dwAKCRARpy6gFHHX
 cu3nEACkzb0x+z65N8v2cg/+XtzldFO8IMZ7sxqO+ofgpVuC2p3poQZkoXBQNSD3rRAJoAEaP2h
 fZj9B1uTFDXuaP3XWUVIeNg6Tb3BUVAJ5uwuO9JzLlZHtLJArF3Wx5/VhJVy0KQ97dDVr7ajL+4
 S4Kr8EIM3L6yarxaB8c2hBCsXWY/8mVuAY6Jg39mGx+NRAhLhZB8KbuPvlK5p+DoZ3/YesI8dJf
 wjVFLk+2EFN9L2iUT9cNrUQU/j/fvkcg9aCk6HbV77JSe78PC2ed0j/ZFM43BBx8hC9t0vFW2jB
 DAyPfWd/aOpxeGJ5NVR3IeZdJEwtO/MYTqI0lMtR89T3FWv7akfxxjPEh92yqa6me291NlcvEbC
 eUHjJOYjp6T97xW4GdkPc4eVGnqquCjanHWTg7p3aXg+8FjvAGqQpFqRpfGrsaY4xDXzcSZ7tRD
 +ieRexxMnVl/mowKqnIxrf362PtJwoPsTU/syw2ZSNYZfR4JM3jS9P6rQ87DtyUqOMN11v2mGx3
 9E+cEiG8fVhi0UF+IiYQSjXxx5hzkwf670DQbEwMUTXnzDob53slbA7m8xx+34n+PEV2kEzUR2y
 GRXCmfJ+yahems9vTdzDJXFAsa08Jdm4eK5g2WgkWiXWdd7i7k1IK6Dm22lrbjZnoYNNhh6Bzqx
 UFMz1oRfr/Mdr7w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-regmap.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 05f8781b5204..10d043596247 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -81,33 +81,43 @@ static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & mask);
 }
 
-static void gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
-			    int val)
+static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
+			   int val)
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
 	unsigned int base = gpio_regmap_addr(gpio->reg_set_base);
 	unsigned int reg, mask;
+	int ret;
+
+	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	if (ret)
+		return ret;
 
-	gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
 	if (val)
-		regmap_update_bits(gpio->regmap, reg, mask, mask);
+		ret = regmap_update_bits(gpio->regmap, reg, mask, mask);
 	else
-		regmap_update_bits(gpio->regmap, reg, mask, 0);
+		ret = regmap_update_bits(gpio->regmap, reg, mask, 0);
+
+	return ret;
 }
 
-static void gpio_regmap_set_with_clear(struct gpio_chip *chip,
-				       unsigned int offset, int val)
+static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
+				      unsigned int offset, int val)
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
 	unsigned int base, reg, mask;
+	int ret;
 
 	if (val)
 		base = gpio_regmap_addr(gpio->reg_set_base);
 	else
 		base = gpio_regmap_addr(gpio->reg_clr_base);
 
-	gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
-	regmap_write(gpio->regmap, reg, mask);
+	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	if (ret)
+		return ret;
+
+	return regmap_write(gpio->regmap, reg, mask);
 }
 
 static int gpio_regmap_get_direction(struct gpio_chip *chip,
@@ -266,9 +276,9 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	chip->free = gpiochip_generic_free;
 	chip->get = gpio_regmap_get;
 	if (gpio->reg_set_base && gpio->reg_clr_base)
-		chip->set = gpio_regmap_set_with_clear;
+		chip->set_rv = gpio_regmap_set_with_clear;
 	else if (gpio->reg_set_base)
-		chip->set = gpio_regmap_set;
+		chip->set_rv = gpio_regmap_set;
 
 	chip->get_direction = gpio_regmap_get_direction;
 	if (gpio->reg_dir_in_base || gpio->reg_dir_out_base) {

-- 
2.45.2


