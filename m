Return-Path: <linux-gpio+bounces-17369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 072B1A594D9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40C9A188C0B7
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695B022CBE6;
	Mon, 10 Mar 2025 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Qwi6/gDh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9AD22B8B6
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610442; cv=none; b=Ic1j5/ahcwejXcUIdwxK3btH3z61OLiXiTdpJZaQ4LDlzuq5XFQ97DOqBt7/Z+0SeGBOHz+IcA8kjlrd4CBcS0aMzgmRUwUufVSNcyESb5bqq1ciagdmRu/vnsk70Wis32dcipoY23611O84HoeeFAjMVA6TuFqNyI+4IOkUFpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610442; c=relaxed/simple;
	bh=W6bsbnseBY25ByUGe8kY8ymh0ENffkUvrW6x3HhNht8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwN8Yzs2t4mXPQUg2qfYruul1K039e3E20dXaRnriwJwqRZKQIESXCHHfwtEdaddUFMZHI1TGJPr8EX74JKoIfEVUVLp5aWYI3x/dK5AmLzIirCAkzrm4LNuhzKio0aVZn4a9K22yEEaeGNO9qv/Vlp7EIu1CZpVDUqpKyyjywM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Qwi6/gDh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913fdd0120so832472f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610439; x=1742215239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZMXz92h+Kc6DuqlUd9j32ZQvM67O+7ril4p2VpiO5s=;
        b=Qwi6/gDhwqowHt/osiwbOgRGufaCEkxIVdD+EaA0GSIzneyfh/IZYLpOgbopxEScXp
         V/hgiB3fj1E2bdK638Ujwhcms3wsP4V2ZJPYkDOmw3o9umXh6pD1IoYkrf5kkXPfaJV5
         ZL6hpCzw98Z1/goaw0AW8WvlDBVRdrh4+oAuUcFS/BBfwi3aBICpNvylkbS1oeejQZfA
         NcLSnvvTicXvnq+cwU7Glcss9ue8aCJEGQKPh972FqEMSrrP/1aKyjtyi6OhG9fzza61
         NcLpuZons4VvGb0crsijWpkvuU6BzupEWxHu8UNS5FLG65hTMR6QgYc5sZxiu/ybw6xK
         7FZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610439; x=1742215239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZMXz92h+Kc6DuqlUd9j32ZQvM67O+7ril4p2VpiO5s=;
        b=fLdaD5/ytCJ8tbrOxWu5IVVeoiTcdEKvkpi1LycUyEZ4chaUjDu4KaS0DywuXi0v70
         33krfNdc4vG2lZ5yi40EiGed2S0QcyIGnWl2ehLP6pfgtNaOzEsIOPSA49Ub15FFjOsF
         PlA0dR6sW08aCK0OfgnKO3QMd36zcjPKvKYq+g/lMjl9WgK3W5637I7in1AnGAXbCD7d
         msoGcFhiXOHPW385ZVKDj5TjrfjlFB62cN2E8SsiNtD0u9qhLnnE8L50D0K//UMVPVFs
         4QR5r2305D8HsJUqC6rJckSEYiBulgKC/zdbiGYOLevNUNBg4Awr030/z0UNggcQLTXY
         lLkQ==
X-Gm-Message-State: AOJu0YzV8BpYiD/vy+Q/l7ziar5YwKjLOEP39doXf9Pnu4J9OGLog9x4
	hOwGikWXoVslWMkUcdaWmPqXU0pUalw+aJEDmIyCo+tf0+wUt4zXeLBUZYbAca4=
X-Gm-Gg: ASbGncu4ptHEFaR+AjbdWaPaA6P70Berx5jNeH0BKHWDmnpDo55xy937G4BtjPp1zyi
	Nu7uHRU7dbUTCcVVGJICeukIUkEqapNUOfuWzHW1UL7YGiTHygj9jV0AlNoUT4Ov9yLmXog7H83
	lkURgz6qR1Ec32BSdMzIk1qJvxxQC+tEZ9/gfKqbnyDyRPrZQIkrdYE6dx+fhX8g25+7+NKBjij
	wHqZrJVzUJepMZX8ZpB1SrMWglP+Y6/0Us4S8vmgHpwu//e95MvjS+gS0VSVwO9Ifgec2pl8+vB
	ZLjmKliHEiXBYrrygSEheJz+f0H5/0T1H781aA==
X-Google-Smtp-Source: AGHT+IF8RfpOiMZdB1vExW4K5rzQNK0TgHRaqy0wyeiXC3V7IuSnH5Ub5H5GptqU8/5m0SRjRsT7KA==
X-Received: by 2002:a5d:59ae:0:b0:390:f5e3:e833 with SMTP id ffacd0b85a97d-39132d379e9mr7758009f8f.23.1741610438927;
        Mon, 10 Mar 2025 05:40:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:26 +0100
Subject: [PATCH 12/15] gpio: crystalcove: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-12-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BhBIMadvw0Ns81letqcS3Gn7LQUbTtR4jE3YMqJLxY0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt23jeX23+pF1Eafov7hkFKa1djj2w9+iJp8/
 rRbFcWDIzyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtwAKCRARpy6gFHHX
 ctiQEACLoEP5YjVmtd6+kD5O63MERvwFhHg696nwDJsEw4K7bxv1j7WVoDQSM8jNdik9mTvfovn
 5SfFW1mHDptBe0mIsph5P7HoaEv1X+SmebpPUd1wIz6iK7hcM2jNWa6MnFuwNiV9aOGTRhk4dkb
 xdNwrJHRhlP3AM5UFsi/QdDYgrwgQI93D4LnO9px8QNuTUzR6yenOLLg8jDZuwEG4usybEHVF+I
 jbs3x/CuzeEjHS03A6RTUBEA1IxG+UKWaed1+7mbIoBKU+KUJG/iFLIB31w3iR1+UyBV/pZ1dJs
 Eg0GQ2KH0w5xXSVUm76LpvGws0ITabwYJxPefpT4AH1ZRM2bDSVftyR/g677SOqKISCc+eFNRsX
 rBIfE/X+8cndGryG2b/CVy6mhGoxi0E22Xem6ZmrEUArHwU34X+0f/UHHxh7dlA75HbvgF/f3/N
 6U5tCKLDrBDhco1pjls0ddyJivXlolubpgM025TdDKMTSmDEXWga1QxEb5qSJuy+pzmG4CX43kx
 sMJtg1HfP/YUBJpOEcmknfcDb3wtmGCctcGL6NQlvMcHvtih0bWO1hBEoJDRfdzqMCHOU3Ow+l4
 D/XO5TIkjJPHfUfMMnn5hvKIfZS1Op+ZymdB18sbNP/3ssmJG1Xv9No2figbVnxN9kktk4suJa6
 BhVdTqgjCfqWgxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-crystalcove.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 56effd0f50c7..8db7cca3a060 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -168,18 +168,18 @@ static int crystalcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return val & 0x1;
 }
 
-static void crystalcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int crystalcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 	int reg = to_reg(gpio, CTRL_OUT);
 
 	if (reg < 0)
-		return;
+		return 0;
 
 	if (value)
-		regmap_update_bits(cg->regmap, reg, 1, 1);
-	else
-		regmap_update_bits(cg->regmap, reg, 1, 0);
+		return regmap_update_bits(cg->regmap, reg, 1, 1);
+
+	return regmap_update_bits(cg->regmap, reg, 1, 0);
 }
 
 static int crystalcove_irq_type(struct irq_data *data, unsigned int type)
@@ -349,7 +349,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 	cg->chip.direction_input = crystalcove_gpio_dir_in;
 	cg->chip.direction_output = crystalcove_gpio_dir_out;
 	cg->chip.get = crystalcove_gpio_get;
-	cg->chip.set = crystalcove_gpio_set;
+	cg->chip.set_rv = crystalcove_gpio_set;
 	cg->chip.base = -1;
 	cg->chip.ngpio = CRYSTALCOVE_VGPIO_NUM;
 	cg->chip.can_sleep = true;

-- 
2.45.2


