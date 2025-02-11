Return-Path: <linux-gpio+bounces-15725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07120A30B49
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47AA4188BA55
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7960B221DAB;
	Tue, 11 Feb 2025 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LQ1N6gAF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1CE215067
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275813; cv=none; b=PjErNDjLvEDnPY/1a4tlrM9XIBmf6IVa/TMoQZsGCTRw9XJTojskCnZeBLrRoKMt2KJq7oGUDFmTQZXbWpLi/QAAhasElDQc4lzZ/aUFFj2pbMOaXgI3q+Mp8ROPLwairN8vqKFGT7GUO0TsPYJHlRDSmX1kTg6XQ7M/exzaq5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275813; c=relaxed/simple;
	bh=W0ekafsbrVCouZpHE4eG0kXHeAxOvTBzf5r2BK5vEgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ElkZKBwUw/kqwiygIHPc7BLkTaBOEXkv2gMchcj9CPMhO2uGzHfpLVUTNA/MgUGzp1Xq5b7GWw5/33vEhwDNbGa0EPlHFXSyHRxjvukEyCcb+nzc9JbeDUN/aVE1yYzUcRZjHjNxJf5Cfll7Uk8QVDwDsbtKb2tnnvQQb6t3zaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LQ1N6gAF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394c192285so8400195e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275809; x=1739880609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtZyccNtwz7GO7SMXFqCDx0hPJnftyCPvzbSn44YoNE=;
        b=LQ1N6gAF44G3i0RoMT2LSXypHBoyDWDAQSr5AbUGO2h0l+T1kFnpQKouEdFNKTznjl
         zVhOi/9/cSkRmcJKx7IBZU3Cg2SeCEPNjt1K4l2ThRhh1Sz7db2OFOfIaBgXlIihlZ8m
         DRFgwRXlRSfFd4QbDIEaj6qARbpxNk7ctPGIkknz8LakRMVtgXR+kExSop75zy2xdeFu
         MSYtDVO3UmelVfJPLk9BolpB6XF+G4BA9TdEN3LTFAgF8g/JyCqFXzu3luIaDOWEjhVY
         nbs2RDKw4S5niTvfpZNDSx3Ll4LlJPflTO0qHT9dql9tGgAt0sSG1G67CKE/gl3TNvbF
         ZRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275809; x=1739880609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtZyccNtwz7GO7SMXFqCDx0hPJnftyCPvzbSn44YoNE=;
        b=n3uyle2AwIDCx2qQcIZXveN0somsAClXdCvCQLxmAPOIMPem5EHKn7gml9moLXO/BA
         5RLWOm2M2Ay6RUv+NBLwP9HjYhtEKn5gkDqkzVto4Tlg9OSO68WdNBA2hLOYd0/K2AX9
         0OokAhF+ECm1WjVnf3JDPV7QCxyxEj2DuJRMZnyAl/TYLoYGgQRq0wEYQ8ha2DYVZgQW
         qj3w3g1DbOsxv0LI2bMtfLGcIf/anDHGnw/h+Pp83eO7nTCOz1wmp00CMjyl19XRBztg
         RJiMJ2B6tqsi74f2FAbjZT9MjvH552WVA1fs/wj3JP3XUetCG+DykXu38VzbuWCd4BqY
         +pcw==
X-Gm-Message-State: AOJu0YzkVtyOauDvfzd5Ga0SX7qnFndrVUAJdDoxgSGav18Gsw287Rkm
	wIQFgWBmp53FvBjxyo+jXjTukIqWLeL91yBs0WZ1XEVzO/9pBmxt3CVediH8Y9I=
X-Gm-Gg: ASbGncvcUmoP9He6WAc6qxpPU0SFDqh/OZpeGBqDprnwpCEsFg0nKPWJMyuvw/hdd7z
	oLYEGmW6NsKCN/e+RjrSdGhAmff4MrYBbH9eMVJkt0RarVzNJ+tAJXdyf76qnKbcQkTRmrhPChl
	EJkzmg/aF5oL8InD4ZUIPXmF1nrOFEZRBRNqTTmpKeS9N1yc8xwsp76NbZ7ledr1uqpNtxqqD6w
	TuEcrCsOC5ja62Fhr6+IpePdz3/GUU3PIEPl+7tJjd5wgPkNL0vU1YVbqTD6kIOz1ftOgy8i8qw
	zouataE=
X-Google-Smtp-Source: AGHT+IEnMvyoo/QZ56r8MZxIXYEgI1p/EiVTUGp+SJgZOcRGb6rK51NPgCINgZNfS+tUEAg8bAFofQ==
X-Received: by 2002:a5d:6151:0:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-38dc8dcbedamr12335513f8f.21.1739275809307;
        Tue, 11 Feb 2025 04:10:09 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:42 +0100
Subject: [PATCH 08/14] gpio: mockup: use value returning setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-8-52d3d613d7d3@linaro.org>
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2141;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZKO1P8iGSR8T/mvTR/tsiumsFS1ImUO8BGNiB+Z+36c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4Xx8lzJ1ICR2vtBS4GXgsgBRjKJMCyceywC
 7CgiRlNo46JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FwAKCRARpy6gFHHX
 cp1oEACzhDjjFDZacvqn5bV9RGmwJ9uZnfrey2XQS3uKQSrgo058tYNz+DeubiHU6KjXVtjzujb
 wOv5jfsozxQ44d/DdDyKsRfUo5Ya6a4iTpO/6jqs81QXhMzUxwu6Xjk9HoVe04CYx2cJrBQmBWs
 fTsbBYosqQQM58XIPEnfJpUiDDB8UNtdPdsuzhsc4vxST12HSsMQkUdKGGwW+8N0FU1utfBNFgr
 SUZlJO51yem9WmIpMbCrWvMi1DfJ+2H0nMxrSgjWHUaUPAG8pYxndyR1B85/xd/Htdpz/kf7a/6
 7IoctrQA6CETrtiKJ3y9YJTIoqzwwLm0j+ItcP9OSW90f+QBnk30JJmZ0/vfA48uUTDYQo1nmim
 PuxV4RmnmtPjm5lACx5TPSKJ4V6xhBDK7Jn7SXo0zXylkwDEqGGO7PKvTwpKHqOyv+/h5Q1liza
 yctgepn3XoT2ZIgQrnz6lus+p26+ar5/Occm58lizltZHsYkVnatwISuNPzaOCDaNLoCIbcMU+5
 IJfSwM4ZTK9r9NIpx86h5gJvWnAeTM3WimaIspzhNU0zkvg+4U07DD/2tHgpdMCCufllr4HbpsU
 Hxa/xECE+TXScoqq7UVOv++YwHX77gpiBYzpqAf4gwLfhfK3PflSSSpFGn1EvKaSY+9YdYgeqJQ
 uBqgEKb+uXW7YqQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mockup.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d39c6618bade..266c0953d914 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -122,7 +122,7 @@ static void __gpio_mockup_set(struct gpio_mockup_chip *chip,
 	chip->lines[offset].value = !!value;
 }
 
-static void gpio_mockup_set(struct gpio_chip *gc,
+static int gpio_mockup_set(struct gpio_chip *gc,
 			   unsigned int offset, int value)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
@@ -130,10 +130,12 @@ static void gpio_mockup_set(struct gpio_chip *gc,
 	guard(mutex)(&chip->lock);
 
 	__gpio_mockup_set(chip, offset, value);
+
+	return 0;
 }
 
-static void gpio_mockup_set_multiple(struct gpio_chip *gc,
-				     unsigned long *mask, unsigned long *bits)
+static int gpio_mockup_set_multiple(struct gpio_chip *gc,
+				    unsigned long *mask, unsigned long *bits)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 	unsigned int bit;
@@ -142,6 +144,8 @@ static void gpio_mockup_set_multiple(struct gpio_chip *gc,
 
 	for_each_set_bit(bit, mask, gc->ngpio)
 		__gpio_mockup_set(chip, bit, test_bit(bit, bits));
+
+	return 0;
 }
 
 static int gpio_mockup_apply_pull(struct gpio_mockup_chip *chip,
@@ -445,9 +449,9 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	gc->owner = THIS_MODULE;
 	gc->parent = dev;
 	gc->get = gpio_mockup_get;
-	gc->set = gpio_mockup_set;
+	gc->set_rv = gpio_mockup_set;
 	gc->get_multiple = gpio_mockup_get_multiple;
-	gc->set_multiple = gpio_mockup_set_multiple;
+	gc->set_multiple_rv = gpio_mockup_set_multiple;
 	gc->direction_output = gpio_mockup_dirout;
 	gc->direction_input = gpio_mockup_dirin;
 	gc->get_direction = gpio_mockup_get_direction;

-- 
2.45.2


