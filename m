Return-Path: <linux-gpio+bounces-18274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F03A7D523
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C6CE3AC24D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7D4225765;
	Mon,  7 Apr 2025 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NXaIbDDm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1902879CF
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009999; cv=none; b=ct6yRyI4CovMlJwVX4tJ8hBp4Zskds2KqEW7C/dAAZiWBX9zGsOk1jBU4TpQXIX+xz5SN+2d8yQfUYV3pPNZnslUm6zYTauTbtezoIryB9k5L4PJRFTBOhQKZZoPxZwF6ZpE/sPZZhykKJqKRoXccd1BWgG95558DYBt+NgGlPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009999; c=relaxed/simple;
	bh=/5Sjz3aLnWW1HWrOcAYyweVPpFM7vC+vJtoK/pB1it0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYnf6Q2pFZYIRRldF3s1vLaml78T50JTU/BSx7+WEaxfh5VXk3y4lUNJ3n3/46vmDfSiWh3W11Nld4G6GAO4yn2+0wM5uWEvv/V7l3Zp1XjHbOMweIaG//bz0GrCLjbHUFSeoqOwte7hWaY8f6FtWqDmG1C3A4P0a0QWEE7R+dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NXaIbDDm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3135239f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009996; x=1744614796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5irncOO7SE3DLhdbNeNA8jd9DPgwzCzzTwzb8eKHP+I=;
        b=NXaIbDDmSle1F0IPCwn+YbBmNvDZ43f3hyUwKSjrmnbH8Zlw2w6pJ7ViJbpq1Dc9sn
         psRkom2vRBgHZE3vpN0DmNxp4wPGvVi8sg9DGPitZJjver6a4RC4AEyLf8fy/EYtqw2J
         c97rp9rssqNLvETLkF4A0kxOvdGZME4m2jCJUcUgrlUUL9UP2rOF81tAanVds/HTu2u1
         xYL/Vt9+v3b80VDIQIBfOfaI1j5q+dZDiaom1kioA/cUFODrXfo5CAExPdmiTjjQrs8e
         PAoVIsLDGNnltFI9Znt7nfY2vP9dLz1an8wHINT3chS1do5bC51PmzM9C2XYGbjiKRvf
         pDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009996; x=1744614796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5irncOO7SE3DLhdbNeNA8jd9DPgwzCzzTwzb8eKHP+I=;
        b=BLoizyO3EtT1JvYPPRDrhp2h+bbMf5fAqHp1/KVzkTj1ZQvoWD3a5Bjr8GCbgdNPjo
         YHTgC16C8UwVXRMr7H8kQVvIwsYFjKZnwCj0vZWzL+ij1jVC11/D1Rc0ZyIcDo5hqMQ9
         KL5bqLUrFmKtmwv5ftRwMcRYoZ9MgQzfF/vXaTTcvlXZxPeUV9LURoarSPqhaFeV2YBp
         H7UBxwoqqxiNF/S5AYo5Yp004kcRGNVwj0xaoOkAEkBON4bfsYPv0pC9tQf+ORgeV+Cj
         6fzcrFke7OjEFrvzlw4PXYL8omhCGu2kvjVAHVngIbLGkJtZFgyMk1bcP8WzMbgtsXBo
         ngVA==
X-Gm-Message-State: AOJu0Yx7QLViFz/3gM028JawLhUMaFefpxCsjXW2XNT7FdP1DxvLW031
	mxPjivdMtjhGBlov9rQTro/91zQgVV4B/cnfYJQ/urd0+tDYOOjcZqgC4zYbRtU=
X-Gm-Gg: ASbGnctNzKcXmmHTSXJxKAXKX5F4AZ8heMoMF+Z29N3GbeN2L+UQdI1rQbJyIRhYwI+
	7HMw35tS65p+IVkFtopzkCn1Ke1kyX+L0vbftohLeYqOrBVMKJMOzLcVEeJLXIx6MSAh2LRDswZ
	mI90TlIn9vLmpOM2qpLGVO1EWyE3DTG0IxmQigER8EM3W3KUNSg+HS9MtXCu8ZwrZ0IUGfEINN+
	PrqrnS44EMYGY4c11Sng/7cekKViCYA1s1Az2fBCDRT0gVnNkR00cE7wJQvwL3WI8AZODmZZvNi
	MaREMdVCxu/24EZ4UZBOWyV/5KIC/55Zne4dqg==
X-Google-Smtp-Source: AGHT+IFBHgqI/Cxfb0Fe7GnSQX0dBTR8Ei+wg1va5UMyVSuvAr5jqU2pls0VxHNJRirZpFzVr6R2gA==
X-Received: by 2002:a05:6000:4027:b0:38f:4acd:975c with SMTP id ffacd0b85a97d-39d0de28abfmr8610281f8f.27.1744009996357;
        Mon, 07 Apr 2025 00:13:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:10 +0200
Subject: [PATCH 01/12] gpio: dln2: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-1-78399683ca38@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+n19bsYgJ9JYV2dFC3UJAuU3dlkEyRxjh8PBYfyEbIM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sIgmH9ntPZ/6dk4gBE6hPGCGhE/lByx8cce
 k8UINLyU+iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CAAKCRARpy6gFHHX
 chDqD/0Z9/1FeuoUlnMoAXDIXhzac/3fSTa6xFAnJgTyJfbhsEsUh5CIYenipRVpDmY5T81G7cH
 eWYEhbJKuQLRvi9UXr4HhimopV1bi7S0wAg2xoz27GPQAXkW/OxgQs7XfZrgFqaAmUhpf8xj9/l
 MQQlRFfK2w1olppK1HpMvCSXKQHxeh2r3+ma9sgdTYkWatE4PCI9gZaWjjJi1sGzZzX7FdcP8T8
 rYBvaVoMirOR4BmWbhp2vJq4+CKR5TTnTZ/8TZFj6Ibb/gFun89CaQdAH3QVe3myF6YSpeIgXDv
 U3uv6i4VgMFMuvFP0uvHOa6FN3kD4HDI/Nj1eMPlcdX7NbjC98UCysrNoJqlxngT7QsENrhFeeY
 vjs2Wik4oEkIiNWChZPE8Mbb54H32/VYDlXenzlw+Iy+UPa04d+5pn6z4zwrAEvWQ4z9Ojl303J
 Uj25cc2Nl8XKdn+YCb86uOarCsfvisuRAXbOTE4g87GG/5Ssa9S0hmP70yj2SHhYq4o9c9GTAS5
 DwDJ2Da246eeAE67fyWnaIrOkPc/YEYSLFhCquFBUdp/gZgTYlhwG/2z9pIxHN2Xl6lBQfF7xgo
 uoyy4gDFXFQyp18mUyQERyxZLF9nUN4/Do2SdLM47h6x63M8FYf0mVFoDzkhGXgWp+sFkLNunLs
 MJOQzIRGZ6Q8eLg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-dln2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 596da59d4b13..4bd3c47eaf93 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -220,11 +220,12 @@ static int dln2_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return dln2_gpio_pin_get_out_val(dln2, offset);
 }
 
-static void dln2_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int dln2_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			 int value)
 {
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 
-	dln2_gpio_pin_set_out_val(dln2, offset, value);
+	return dln2_gpio_pin_set_out_val(dln2, offset, value);
 }
 
 static int dln2_gpio_set_direction(struct gpio_chip *chip, unsigned offset,
@@ -468,7 +469,7 @@ static int dln2_gpio_probe(struct platform_device *pdev)
 	dln2->gpio.base = -1;
 	dln2->gpio.ngpio = pins;
 	dln2->gpio.can_sleep = true;
-	dln2->gpio.set = dln2_gpio_set;
+	dln2->gpio.set_rv = dln2_gpio_set;
 	dln2->gpio.get = dln2_gpio_get;
 	dln2->gpio.request = dln2_gpio_request;
 	dln2->gpio.free = dln2_gpio_free;

-- 
2.45.2


