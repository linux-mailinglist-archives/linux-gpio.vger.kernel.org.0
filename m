Return-Path: <linux-gpio+bounces-21851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 171B9ADFFDA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4396E7AE618
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0256F27AC45;
	Thu, 19 Jun 2025 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M/UztOJ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F68D2797AC
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322020; cv=none; b=E1JhvW+ecT5I3IrZnSAiJGN7vA1QaunDuR7FXuqLDJJHV5jgB1iFf7waBSmbH73IxfgckMQrb7bV3Ux2bKngV5/QUFA6QHKMi3gPKaFlm9Eztde3bt8N5Xrj4keCdqvKx5x3Ow+jOSs/vRJqftFSnLsDMvpud9WVDtt9FtFnd64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322020; c=relaxed/simple;
	bh=COE46zuDiGK6rLwTnt7+1d3gjUwt5RswqdYUD5pUbdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DMKbZ5h9uYv8M88pwgtHYJcERdeycRVM6lnUnzKAd6h7pse55rAaJLgHULTE7IAyfJmota0tF1Zfl8ITxEJO14UssZOKKSkr3Pjb/S03zEZHLvp2eqTfsV7ozNpBpqmMQ/nxJH4NGm2wEj/0JD/O/GDAO8Vh5oIWLaNsa6uClqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M/UztOJ8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso222371f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322016; x=1750926816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUxEFCxSV+En4LdALjtxQKt1K3KufAQa0J+EdQHN8Wk=;
        b=M/UztOJ8RfBge7iEfPQGJ1+ml8t12dHjQzlaINUJ1l248wTJTAiS4W+gxFaoVNo5MD
         Q/+NjapzaK0R9uZKL1djiGJHsIiH2yMsxd+iqla/gslt5GOsTrN1sMliraR4dBhjv36T
         REkdH0wWQverMicS7p+anjliA32jQqZwt84Y1xOpIxA4V5wLn1Qniu6gKzE7R7qxOPRE
         srRU+o72s/EBM5O4NC2JeG6V7KvkEUgtK50+zv0q+K8/x+0mNiebLfBL26yYuEj/k81+
         4RghNVE3pxGFN1pgOtelXTVlEvkeYq0G+yWmUC2dtD8aCm9WhCdaSEYuRgWxqI/HGSqr
         4wJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322016; x=1750926816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUxEFCxSV+En4LdALjtxQKt1K3KufAQa0J+EdQHN8Wk=;
        b=Hn7z1NcIky1Ujyt1o9C9Fjei5mQjjuqiPGRQNcaxxISGvnqfaq7R17PgTm12w7Klp7
         +OIV9WkQuszWIkcPOTjgwEJEW9Cx++Pqo4j+P/YHbEZLVvv8hIxQ/vtvGvBJfH1XHPmv
         79wJZWk5Sm9IKPHT/tAL0BB9UmalP/iD7G8WMV342edyBH9hqr2ZaIOsRreDOWKOzceR
         bEgCMxgJ8641Bp6SD1+y07A8v3aqLzpFxTrnD+B7Tuyh221BHR1FRerGGxRDGF9X+uT1
         XMCbtEIskqlxHO7qam7++IfeD5Uh3qfsMGtTkJsW5l597B3ewvh7rlLZMJoh5VRnKRII
         Jwvw==
X-Gm-Message-State: AOJu0Yx+mebQ2SxPfrHpuJQMDviS/afl0pIrnuXCpzYhK1Yns8na+Akv
	nRJxoEs/x0XjGOCCD8UUMp1THztvggYJNUi2iv1aBxIyo4lp4CBw67g05o0l3MOcsBU=
X-Gm-Gg: ASbGncswyGZc52KTS2wuFcQnXTnDfPkjB/rml1p0VD2CVYTItGi6QD2Vf4Mpqm7QYYG
	Bnr4gYphys2O9Vk09vebrjd/wTFLazA3Ujsa1jnXtZncz4O1Lsi+g9f+rNjqO7XDx4JfQbd0XjH
	1oNh6SplxAEDiCjbTBP1IiZT5oaKBAVlWoSlsuTAa4BcqS76RjNlt940LJaWWnYkmZGa/DPmBYq
	1NXagI9rASgdbJ0+GJKaf6ZKM2BU6y1DfSeiKVYK5d0pN05t8b6SIaekD0OcHqcCjyjK4IAk5Kv
	PLj8J9DgceJPJXSrm+fZCMP1pSIzxqmK41QvNtNCCSXHmiGo8KzkKpwzJRvR86mguGA=
X-Google-Smtp-Source: AGHT+IFfsPhVrHgeuWzX3+6sQmR19Vl1yy5xDC5faeBVZQvTDHkV39fKCws88JWALuInD7mjUF9AVg==
X-Received: by 2002:a05:6000:4803:b0:3a5:3062:793a with SMTP id ffacd0b85a97d-3a572e79d41mr16470567f8f.33.1750322016552;
        Thu, 19 Jun 2025 01:33:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:23 +0200
Subject: [PATCH v2 10/12] gpio: rockchip: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-10-74abf689fbd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bJZscimERewZNLI5pGqQIjH00bD6YcA1Kc9nHnuKKr4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tTDKdHYa2tugbl7ZgbX8M1+hP8adwm5KKEh
 MqhI//NcwuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUwAKCRARpy6gFHHX
 cuAAEACjn7R+KR5/zt3QNdbTEUEkbL3xT1JlWMeyK1RMVSZHp3CYFxhOFf6/8w/Xq04lnJRQ2M/
 lvWSlbFLft/9IseHT/Ism4eMG7xKvNSHWLB3vEONd12JYS9fWNcn47eL61YBQUF1R3LknWWtW/x
 UHnsEEr1iYZB36AYooj0M4Z7raU6Xt8srnztoZ3xhNkaY+Pa+p9KHAhj/8kN/ipuyAphKXdk0r2
 knA1yAb59U2dR1V9Ru5eiUOenbf9shLNvwnW8Wkjl5uOpxFD2lt0mWpFGYVvfoyGaeMw4e/hERJ
 2dNPhzDGhylpw/va5zlOzxFjqzttvo9MzKX/Tvp5HrAsCreSibdjUR28e1VD+CqzNjDsmCpyqTT
 Czq3I7mLvtqc5cDZVsVoYve7pbUWNqsQSxKxo+cztDof+wRRCRb5IbAzrN2BBXg6S74kWSSImTZ
 DOjr+HHnDnLcca18BTWMAYdEXtFdeuvOqMTujZd3kUXVq1qZEOAClLVXpmVgxxDTNkaJ/cFC5jl
 IE3Nhh/5s2pbySabu6Q76yGyMgclCRvVhOsgKIPaeieT2bt/NtlP/vHLqXkK+ouSR/aeYlsX8jq
 5ohEONkE86sx7b0n6GxTh0XkaRULQDsItKSIkMa0QjnJLrB0EGYdtLnfz+ozQ/yxhndBWKEYMww
 QpzQm1rT3j0ULzw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rockchip.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 64700a003f9a17947dd38baea23a066e8c057caf..ecd60ff9e1dd1a090bfad204c8b86c4d7fb68ce7 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -177,8 +177,8 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
 	return 0;
 }
 
-static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			      int value)
+static int rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -186,6 +186,8 @@ static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	rockchip_gpio_writel_bit(bank, offset, value, bank->gpio_regs->port_dr);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
+
+	return 0;
 }
 
 static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -325,7 +327,7 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 static const struct gpio_chip rockchip_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = rockchip_gpio_set,
+	.set_rv = rockchip_gpio_set,
 	.get = rockchip_gpio_get,
 	.get_direction	= rockchip_gpio_get_direction,
 	.direction_input = rockchip_gpio_direction_input,

-- 
2.48.1


