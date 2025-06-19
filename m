Return-Path: <linux-gpio+bounces-21846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D998BADFFCF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5C684A02DA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BE625EFBB;
	Thu, 19 Jun 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kCk4oxlO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937B926560A
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322014; cv=none; b=r171tGx3iEp26F+fpBWPm3oBcLxGN4FLTBX0iMP685UtmM1bOOt6KSt/+DsrZRFV8+b2YOTt6wXEsHsbrd9YBWekRMoZ5Oy6x4j1GvbiCktJVz9nHFYhFd+wAcPrO7CHvCRpozz5NjJrI+GzE4LEFuOvl/+F9NkIfP7iOYmGp8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322014; c=relaxed/simple;
	bh=bxD8Wln+1c1gwTOx2BtC9yxuB8rPQnYC6Cyew1Zz7wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HKw5znbhyHNprUjwFau1VEmZmjHOXXVrKOKPLLvBoe5Lv+aLhNSmee9XdURfQt+lKYTCXF7bRBS3Tm3TmgUu5X5YMk8dsS0esoYIKRT137Y7id6/UElOiEYabRyJa9ZFcwPbjdN9Dpap0aqT/dx9cxn3BGjxoHFKZili+W0C2JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kCk4oxlO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so2067755e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322010; x=1750926810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=;
        b=kCk4oxlOBP4BWr7VqPuUHZo8nB7bRtYi5NYivan8kre8soVW+hfKYAV8luG3rkWT5b
         AtGOlXhv4W66UaJoUIvDe5IYFsGI7wAhmID50SdsSQ8QhzOKaDGleOrtCkt8hThj+yJW
         95CEahqgDHxl9qYe0MR26UG4b93jZQD4Xs+Grt4FhU1PlpWGEun0gBLR8PcLWdtDDDQS
         CTQ6FKCfJNhwb7d04BzWbwo6rBvjPGP3zdCjpxjUJzyi6nC0rVw35+eAde/j2FCfLcTF
         MURo4jQUpE4FGFVqybAuQ/CVKhu6gPrlNI5+KYothHjURCIp250ktRymFHspDdQTdOLP
         WWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322010; x=1750926810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=;
        b=Oh7GTVy3lf0MPUrioK65Gd4+bPfmAV+kkzxREBC2od49I3TUvI/UYjXFWQrparTnMP
         qKe0h4bAVuG3vJuiTVPwus1dprr9S5g4wu/qtQBCl5Jyzm12IDrrJ6+tdxh31Ac7AFCk
         EuumbI8/zJ6cUH+miGq3NHgJDZ2LuHiWzitPyyfUCx3gQMShEDhshCMnC55Tfi1tnbBi
         YbuzxGa7Lj8hippolgUnxAd8cPc6zb4EUAnZgPbMfQX5zU8owVdS/BnOugC3rwhYkwKv
         bUEnCdcPeBqKBqNsx6QGtaIqbNMCQuQkOjXFAPn0NmdBumQYGKqR5bS/rxQALri9sYWq
         j/kg==
X-Gm-Message-State: AOJu0YyDFmBq2CK+0stjEefIRGOro8wF94sVIetHodZKpYM6+ijovEoY
	B3QyKi+SBIZev2MMOKIoySkDQSa/GrwBMn3Fw3RrB54B4geRXoludzdz53u16+FEmhk=
X-Gm-Gg: ASbGnctRGTSNUsthUCA7AOmqJojLgWxPhCzlxKKWXdQM/s00dmy3EW2gDd2DbDTXL9k
	sABmriJUH1Gl5HeGgGCH9YPm7n+hs7ed636Sl0MVQMdbo+itFhNO+gmBW9fIJcbCAARd9y86EC5
	pborSlHiLX4tWR37fEdmjRxkXcJOM1P208t2ZMqV33vPmPPx/6G70aF5pjWij62vfHUSI9CoYp2
	IzFLuEcH7LeKMWbkBH1cQOOoBtdIYEt4Sl1/wJBhgpaVm1nncEezWrVitFf+tRLPdpV/vv0l5Xx
	gRvk7HgHArWgUeYXQ8m+KNj8ns8E9WFrHLZI5uKzFoyEfZO0rTlexBCUdEhYviyg53U=
X-Google-Smtp-Source: AGHT+IEr0cQ3t4TpkTGvuVjGq7cZO5AQ6BZfBJ0TBysup1ZbbPr4xJbOqOBjen/dHiRJRCL3wPVhbA==
X-Received: by 2002:a05:6000:25f9:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3a572e9a4a5mr15722608f8f.53.1750322009911;
        Thu, 19 Jun 2025 01:33:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:17 +0200
Subject: [PATCH v2 04/12] gpio: pl061: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-4-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=a1x5aRsn4kpz4DTuXQ3tdXS/YzbAV4e8kj3b/qk6D/4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tRgkTy/UGYoAUmJiupC/RZztmRVGafnrAkg
 DK/05i+a6CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUQAKCRARpy6gFHHX
 cnO5EACetBLUgnxHHE9jFOzifG/ThcrCv2NXqdEgAKT3Y5Vy7gTAQa9+76iIHz6/1YKVhIqBc8v
 VC9froCuMPH3X3wFZZ0j7qu3QM3lsGd6ZHQjMxwaKEYMK2dj/tPdMULBW/2meqofEw6L8ruo9K1
 KlTutcobE1KjZ576wI0Eb3no+rxcKiOw8lESyoxR6YqA2oQ9lPtNO7HZAboqGg9IORRpLBT2FzH
 mI39kRMp0Wkd2cMdsPbQRmVgNjtPrqCUpzCZReVR1JQuW5YZ8YAk0gB9foxpkPRPNz6HYqgEZT1
 kr9fDu3aUqpt6y8vP4iKtzPpj+ilsyCVFqe/2STYbwkhtYE393F1GOa2BpW6xBvQg0bxEeXm6yp
 QIZ8qzI9+FpX/6EZYWBeHFRhddA6K92F0EgjXP1MkBdCGB6I9pxm/5sGSOsH4sVNDVVmq2dUvqi
 FnElD2iPkDLGaH7QxmbmcuLFBMgGmJdIEjDVZQSY4MDDhA99yiqiQKdtvqHP0vgAYtZ0syLQTIs
 NmPcMRd4jOXZ8OxShxyr/oXyYY7H0Mk60UBAQiUb2XQ1ASEY81pagI+54BCYqW8eMPdf+4PtUPf
 EEoLDdOq/+VJ3kDxQr3C5KU1pxKPudgdhDjEZiEbK/I8HN6IkDYHov6F0Hb0u6P4HKt701hZl3n
 K8gv+VNOpIv6MiQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 1c273727ffa3ac54d0f1e66bd6efb784d2a8604e..98cfac4eac85295915b801a62d62c8d78f6cbc4a 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -115,11 +115,13 @@ static int pl061_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!readb(pl061->base + (BIT(offset + 2)));
 }
 
-static void pl061_set_value(struct gpio_chip *gc, unsigned offset, int value)
+static int pl061_set_value(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 
 	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
+
+	return 0;
 }
 
 static int pl061_irq_type(struct irq_data *d, unsigned trigger)
@@ -328,7 +330,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	pl061->gc.direction_input = pl061_direction_input;
 	pl061->gc.direction_output = pl061_direction_output;
 	pl061->gc.get = pl061_get_value;
-	pl061->gc.set = pl061_set_value;
+	pl061->gc.set_rv = pl061_set_value;
 	pl061->gc.ngpio = PL061_GPIO_NR;
 	pl061->gc.label = dev_name(dev);
 	pl061->gc.parent = dev;

-- 
2.48.1


