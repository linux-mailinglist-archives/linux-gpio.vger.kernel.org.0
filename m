Return-Path: <linux-gpio+bounces-18314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEF7A7D61C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D25D166902
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820DA230BC8;
	Mon,  7 Apr 2025 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tUy9/G9E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3F322655E
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010718; cv=none; b=KwiaImE7D585zvxt3YMBD0y4ok3dTsxzTaCDjmqyVY3xBrJZlirzTHe91c31KD3munJWuIZrgbQYR5308oV7VScsKweZ0Tq15HSkBhSiaXPQjxW5Y1O5g1fLvlmogXR4ikhOy72hUOGmm1l/SAtlhROcnEP0ucrlAcRNHf1Y34E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010718; c=relaxed/simple;
	bh=Ax41jy3zxLJq1OzL1kpgDgz6ARtv/qptagSpz+6EJr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=meQtYk6IeIi+8c5tD6fvI47q64DYb4XkBNiJPwx0YO+E58r29Vc6fwqMs2KyJIsE2wvUwYNuEW0Ih6MpsWumowqqbKdKb9xB3at3kl2ksmkx+Iua+tMOGgsPinNGUfKoeZRu/q8E/eVzRM/Y0sBc9fUaZKiQqnWB+emJDvN3Ddg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tUy9/G9E; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso2236221f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010715; x=1744615515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNhSgMGplf5oGBEIrMViU0U9WgssKL1as5n4ysnnmCA=;
        b=tUy9/G9ESuITpP+D61+N8ZoiHeYlMczVZD9IaS++91mU4ldXX8+PrH4kN1gp7fsTM4
         VxwvkLOhYUz22OnltF6E4k/ShvKU8OQBOjTJq3G1HeVY0+iJq+AjjkUS1vUmcaI5HBkB
         gCbod8PoZ/1a9wwy+FBsPwgYGB4w89SvhsAaRcR463OY4VOgfhAOGw+iU6RQaoJYirD1
         4dTfvJju4vcABKHb6ePOX55F8AmXgTgARsOaaZrEasYTV1YFDlt475yQLevqz21j8J1T
         F5vCZd9Bf1gs9o43OGHKtnEayqn124Yhb3zcG5j0pwxX7fwcrcWF/kwwwRRTbY1xhu+o
         RGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010715; x=1744615515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNhSgMGplf5oGBEIrMViU0U9WgssKL1as5n4ysnnmCA=;
        b=fqTYcZsB9h3adoH4yLhQphL8fZ9xXWKt1rHAIjWiRSAq80RHH5R3wKy/A2wAe+kesJ
         R0yXpyDDBTjME5qKZS468DvFB7bhNeTxl0RaFg567Z1GAVkXRHOT8y7TyfB+t+N0eUgG
         hwA+WUfQvkY6C4iXR7gDaoaPjoM451Y3oceW4mE9adPY2OYHnkJW9nOC18bDMiwOKmFh
         0HvZtTtp0tHYxO2L3xVORM+Y3qiNkinGHqfvG8Be6GjO/5ouBNyjTbbjUVHL9jRrxE+v
         RjMBq72dtYLsGP2/rC8kaOIWgIvNU6iZJUWS3yUyWGqCRN/K0FMDkTNXJYR9GlBPrd90
         SUMA==
X-Forwarded-Encrypted: i=1; AJvYcCXI1yFI6iBSe1di6ZApzBPkWVEkuj4DeHOKdhekXrGxy6YNlTaxZn4qvvMbf8DZm49GPzTatIxJMzPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkn037iKacNYtURlvFLLkmytOKGlX0IAyJN2qviDtEPAIaksu
	+BLnJKa2fsP1CW/cCJiuCszagfaGv8epfLgdKHWEKk+XR37AGxGqtyg2NnBld4MLDzbQi21bm3v
	olls=
X-Gm-Gg: ASbGncvX7eWov+RSTGGLEQA5skE/DSHycBAy23b8Lv69NmYdMfiI+QAFvkKw1R7wj3l
	av9PiDOASvq6SJivqPlERyFWEVsYNSE3CuFagCHt9TvcGslvmPwyYKLtrd5cDTW+N8bViNU7GHc
	kGhR8CHgpPojEwKqE4T/vKGAl50bq0GOtN7XEmcJ3/L4v0IKL3zFAc+ADIgg+QEYYirbL0haimT
	d2DJYB1o7R5d/tkDrEkCKJOH8HnjUI+haMjOF90NrPYI1aWjfaG4EdQMofVE/wv0dyYaU7QXMSn
	mhyed2gs1C/paVe0kmK1w1Gsjk+LWA0apUppWw==
X-Google-Smtp-Source: AGHT+IHam7+xN8c/DGz0e92vj4GbqJ5LA5IyFRpQM8R8lpulsfaFTR0LBRmTd4CJPCCfU36RbspZTQ==
X-Received: by 2002:a05:6000:1445:b0:38f:5057:5810 with SMTP id ffacd0b85a97d-39cb35a6bd8mr9104554f8f.25.1744010714672;
        Mon, 07 Apr 2025 00:25:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b760bsm11303051f8f.55.2025.04.07.00.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:25:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:25:09 +0200
Subject: [PATCH 3/4] MIPS: alchemy: gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-mips-v1-3-e7f74a4eee2b@linaro.org>
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UjNDMh2IWukp0PBsmULb5YkNhn92yw4sALp82a7piR0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn833Xp3EAtyCtkru/439hE7k1fodc6/hY47OTv
 NWz4Ajqv5CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N91wAKCRARpy6gFHHX
 ckszD/97TvOeimGQ7S3KbDK9jdrXuE/NB4ECPwRE/aYg/jg6UJJJvYFdJk2Klj7aOKNP1Bt6N/U
 Zls4kFshu9SFU4HFCuDNaNDeJk87tUW4yQcCLOS3QnacOoTpR9iFkFqUKboMbHsBZ1s04eGHCM2
 fXGjghBFpABTUWOZP7iLsEfxf30NWfz/houcTcApdXtkLBH0OroQFN5f7bM6jzxyrI4oJS11Opc
 V+njGyXcqA2PXsBs72Ei3TC6lT3gW/rTGwJAmXLZn9kRD9HiPnetkdwe7lqLtyEiB9bjcEjVTUh
 D22QyU5d5Iu5C6ZQfBKfZpM+FMcAbLmsCo5YhEQGkETL+8B9MhzUCj876OB4hPHE03sdOSXFW7T
 I+3aUMXfuGfUaG6K1oAwfCGc6mBpzY1Q+jQzTsiQXC2bKWWfYa6CBvG5ULY4rJ55vZGcKftQ9pM
 kC91ovXCldoKt+osXWLkZ4KogYE9umZ/jsodgTSz0r9tC+Hw0QjOqf7ym56bEBlaKatRA4Sj8EB
 w5Er3WUowr3u1way70OaVIr16TZYHq92ko+WHQgF2ncJ22Cy9SqPJMtV0+SwHRdfL/sM4+xH05n
 IVnZzjJ+yV9nz/rMHeyds4f13icUCbW6tNS9Pbxm/z5q9mjuGaI7261seACXzPf8AK1Zxou8M4a
 uc+SZsUM+PqxFJg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/mips/alchemy/common/gpiolib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index 1b16daaa86ae..411f70ceb762 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -119,9 +119,11 @@ static int alchemy_gpic_get(struct gpio_chip *chip, unsigned int off)
 	return !!au1300_gpio_get_value(off + AU1300_GPIO_BASE);
 }
 
-static void alchemy_gpic_set(struct gpio_chip *chip, unsigned int off, int v)
+static int alchemy_gpic_set(struct gpio_chip *chip, unsigned int off, int v)
 {
 	au1300_gpio_set_value(off + AU1300_GPIO_BASE, v);
+
+	return 0;
 }
 
 static int alchemy_gpic_dir_input(struct gpio_chip *chip, unsigned int off)
@@ -145,7 +147,7 @@ static struct gpio_chip au1300_gpiochip = {
 	.direction_input	= alchemy_gpic_dir_input,
 	.direction_output	= alchemy_gpic_dir_output,
 	.get			= alchemy_gpic_get,
-	.set			= alchemy_gpic_set,
+	.set_rv			= alchemy_gpic_set,
 	.to_irq			= alchemy_gpic_gpio_to_irq,
 	.base			= AU1300_GPIO_BASE,
 	.ngpio			= AU1300_GPIO_NUM,

-- 
2.45.2


