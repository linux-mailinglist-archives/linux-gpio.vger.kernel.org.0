Return-Path: <linux-gpio+bounces-18283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0F4A7D53B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BADCF18914E9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D70225A40;
	Mon,  7 Apr 2025 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PoK7OOs+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A881225791
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010025; cv=none; b=arW8eiV/FqVrJguH6AWdgVFqBzCYWBLTnbc3Q7rDzxzx9k0Ig6tr50Q9er8PdhlzQUSOIcZnsi3Rb0fz+nVQWnORw/QWJhRDydShikpoKsvz1nnMl3pOIR+3kWhKIXWUxcO5O8XUV5K/SfoLy5V/tyB/75emZGtwEXsvfDayAxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010025; c=relaxed/simple;
	bh=2smVCm4Nk4w6RvDJ4CqdV/kiPrD8nX20fQhszPXa8tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2wMj0T/l9M46OmJkZcofVySzoD78IS+zIVC6bx1K0/1YG7nMv3XfwMsc97LDUOKDpdxbldyI9zg/NLj9R8OXWdnFV3hbqtkuqQj3zeS0c1y+9cPt1dbHQVzHipGp+ZDozwj5bh/yFINKePiJa64b5Gva2y+EN2+kZ33bNShW3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PoK7OOs+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso20522465e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010022; x=1744614822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3ZLoOGIRhYWLQwldcB7o4t1OYiqucFtR/EYliiQwSY=;
        b=PoK7OOs+P2NWjmc85gQg1kBwLJ6y2F5hikZcc0FQ3/cKYyCs+46C0NzfpK3VZ5CG3L
         WHOOOvhB5UNsDrMVWxeIO6IOwaQ0nPQnh6m7rgMIjKDN38cOjeXey/wogPxEGTVpm2wH
         6x5sh4yizKVYJ6UL61ZXJYUN4R9PaMjQVtTeclErC/eTR4+/JIXIviXLMQWDg+tHSAml
         XAGf0mtqk/snwTqtmiinjnaV0wrOGNQ87SiKSWnxsjbIEgBBUru0bF02hlgCrJnBhWbZ
         +c4xJdF8shGONg9m6EwZyEGkQcYF0cZa22Vu6nNt09ojWBuoNe8jI+aFb9cc+9XpXvhX
         nX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010022; x=1744614822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3ZLoOGIRhYWLQwldcB7o4t1OYiqucFtR/EYliiQwSY=;
        b=W32hTJOyl+z7GXIY/tSPAxBxI+PeWijAiLOOh1cJMl214CAC+XDJwf1IlA7Y2wuU7K
         FJu7ddYh0VkSDmOAlOJ6GQNd+uiqwfdR6bJQk+aUa/dWcp2ta2h2b/c4AmpAnHh3W5O4
         NWBobiN971HMdeY+lFIgLGTImmc13UE6B5FiNoIfts+txX/Myc0j2lN35gshI7Z/PFBg
         n52+IF7bk3rI9W1PXECuBmOKMD0Vez0Fwaj7tpc3rPypLUV06WlR/akDYl/VQSw25RRw
         A6iLBP4WG0dcqta0HD2G4nmdwhdG8iVxK3KU2mxY1QFtuVLq5EDbYVhrMRACEfTQkTT7
         i6ZQ==
X-Gm-Message-State: AOJu0YweYl2DdLq0X+77WcU0ISR8BHdy92ulqoQ2KPVcRDkOWYabJl9K
	TzGZFsOmxLmZyIOJ7MIsTrt57s4Y4odauZS4VXq5t5LorvxXA5BIADnZUDXu0eA=
X-Gm-Gg: ASbGnct9oBx2dCedAk6JrIHK2C5XHQO7Re2WyAmLQNcqzUpL426a8vjOV+QcWly4hkq
	8YDH5j21LT0LlpDSECdujLr43No2lx/1xjqcL2sb2N0QnqJHDKDsht/Bk1NAbTNuRhCyKjqH+9p
	1WpBl9/r1g2bRSizywZZUqFoJ2o6rzkn6Lv7qh8zW/f4n6HVfO+p6wLJmIxF5GiBHRlYZKS2XFC
	gMg1bJj81nxUvgDO94gCYaPNkJNs+U+30NWJi9CqXbzu83QmzQ4XYQuOpE1DcH6kXWr2UfGNLUt
	zRaW/jY2hU+/NrtstD0ioHCOEPnzvjM0haj+zmlxC4txK//O
X-Google-Smtp-Source: AGHT+IHGaYmYpxNVnlyOG51iCDGtU+hWITXEbdFp5vavb6DlKfFZk7Ry0ytW0HLUXQjm/j4UfMjV/w==
X-Received: by 2002:a05:600c:1e0e:b0:43c:f5e4:895e with SMTP id 5b1f17b1804b1-43ee0616fa2mr64246275e9.1.1744010022069;
        Mon, 07 Apr 2025 00:13:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:19 +0200
Subject: [PATCH 10/12] gpio: htc-egpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-10-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/0ieRZabGPzeqDnW6NtaCAv65QiJcpFkSEoCNKaBrcI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sKCwFZg+pd2UMOnz6PapQrLb1sfFgqPsewe
 18VkiXsPOuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CgAKCRARpy6gFHHX
 coIpD/9SQklsSGCPmSQA469tG2UiGGue5EihdJi/WdifoIEy2qA01bF80+nYDeSB7I7/5mEkTfM
 2u350IQaN4ougKJsPGs9WkWp6N5gObAITokFjnbLXZE/8ooSpShmVBNBYgvMkF056aN81p5/1RS
 VGflKBLet3lS9VKp5SBbq3nr3v5Kuz7TJio2HQtBl06gonn/LBCcjTL/hxGVtBnbd/iHpEQBW1A
 TH2BoN1i/avF9XV1QXKwkJPHdauISYbaK5GbIzxeQX+hI+EkOMeKswMyLWYMBbgqdW10/UrUoHc
 q4vYEVK673bVlRiNamQFMImTBHtWM3yTZMFNf9qMjWhTxi+KNzMqlXeBnXzRuLbMpYoNwjvZCgO
 6D8wtnM0RmtrzPKkTOmdSmQITxOVBsQzeX7WryVxwyvA1VTel/AskV+OysEySia1y8aMWFGPp+Q
 aY5RNmlQURlaS8sXyd1ukXqolnyJYhs7XHAJ+sp2iNCocr4xO0QgBy5AL+mZDQbWZ2/s8k2oXOj
 N1lSBX1mD7iJUqeJDM6K/it0PYcHtZuJslM6z0nIRswJMHV2pmzwxn+xC77N5T5VThA50jxy+lM
 IdV5eGgs61u8TzZyHk1NVbYVJFPEw85YAjgIgqtWa5W8K5ffIy2yh1Xb/wXVJuHPgc9tBoCbmQi
 GJ6rz6KPoPxJYcA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-htc-egpio.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index a40bd56673fe..b1844a676c7c 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -170,7 +170,7 @@ static int egpio_direction_input(struct gpio_chip *chip, unsigned offset)
  * Output pins
  */
 
-static void egpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int egpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	unsigned long     flag;
 	struct egpio_chip *egpio;
@@ -198,6 +198,8 @@ static void egpio_set(struct gpio_chip *chip, unsigned offset, int value)
 		egpio->cached_values &= ~(1 << offset);
 	egpio_writew((egpio->cached_values >> shift) & ei->reg_mask, ei, reg);
 	spin_unlock_irqrestore(&ei->lock, flag);
+
+	return 0;
 }
 
 static int egpio_direction_output(struct gpio_chip *chip,
@@ -206,12 +208,10 @@ static int egpio_direction_output(struct gpio_chip *chip,
 	struct egpio_chip *egpio;
 
 	egpio = gpiochip_get_data(chip);
-	if (test_bit(offset, &egpio->is_out)) {
-		egpio_set(chip, offset, value);
-		return 0;
-	} else {
-		return -EINVAL;
-	}
+	if (test_bit(offset, &egpio->is_out))
+		return egpio_set(chip, offset, value);
+
+	return -EINVAL;
 }
 
 static int egpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -324,7 +324,7 @@ static int __init egpio_probe(struct platform_device *pdev)
 		chip->parent          = &pdev->dev;
 		chip->owner           = THIS_MODULE;
 		chip->get             = egpio_get;
-		chip->set             = egpio_set;
+		chip->set_rv          = egpio_set;
 		chip->direction_input = egpio_direction_input;
 		chip->direction_output = egpio_direction_output;
 		chip->get_direction   = egpio_get_direction;

-- 
2.45.2


