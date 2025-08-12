Return-Path: <linux-gpio+bounces-24288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7910EB22673
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAACB507906
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA422EFDBB;
	Tue, 12 Aug 2025 12:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="x7wW6Z49"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202392EFD85
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000776; cv=none; b=fWg0TyrDmyszqrLwDAu+qPcIbomZJAcNyXwK5kNeB2wC7FvoeAOfNfshahtQn6WC+4u0GebhsB8754Me3HTfA7PNHJG9dLVGJqJ+gxtWCgo/bib7oRBCZTwLATIAXbY1NilQ+LnsKaBILzXxGFnK0WahqHjF5jn/I9CadsUohLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000776; c=relaxed/simple;
	bh=vkpZBLTpaIui+7bJpSkDPzFmEy+B6nYwKDayQOON0kA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aViZg8Nfb5gmCWg1paqx8RnljT2wPMRGV+HzMg/mtYpeCTdwY7mb6fN1oUk2UaSTzSr8YXxvI8WmbnMZpsjpPugKTJxyJYYupTZki23mdIxBMbokFCP2OAZk+P7ppQKUuculPWxg5Fo9NX5V9ZgKC/L6RVzGp5Vz2frBYQkF3+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=x7wW6Z49; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-459d7726ee6so27728935e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000773; x=1755605573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=x7wW6Z499699pZJrMPSKosMUyp+f4TKS2WyUih/4aLrtHas/iE3xWa+9OqdG/F6Ifr
         Ni+vtvxwO30uPuDkpjAhE/QeqFjCGvIhxxiW70Cog8TXNAbRJGfUE+B2FLVqpYNO5jhK
         r5uZbMrp1Sfj/t+JuxcMpQge34WK5cD4ZDs1Jpz82eTr3oqM8lx47EgPutaSluLHY4aJ
         SsrHilXSgsqv5y5ldIAD39BY/bxw3HNk/jbI5igeTQ6PAO8DfEkcYID1L973WGboNZBi
         8dOw7coftQWlcBn6fnRegnlPXwJ9o27Nxien6gvvVUG1c8cqFS9ySzR5plHqiXTZER6y
         VDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000773; x=1755605573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=rW2omFqdv3etPVaimquS6Hhp4UN45wp3vsMpjW3PFhWPwF2cHODkIsWkcpMQrqWHkj
         GzsqknHJ5k7XVV1YkFXZQs0iTyGHbsOwXRINYP4mzS3ZZNKsAwnjfbGK6uCQxvO7eazr
         gNv/w30e3iN9juVduPWy9VIqLQ1+Nn4H3ROvOgDI0CcvZS64Fl1sVHLWARARERiCpZSE
         56ddwhz3CD/uRFYIs1vmC/7ZodDhJC0wm4N3iau2n4BnBmh39AKq+r8KQrC9JHLoVGJ1
         vumiD5zkAb0ATxa2CmP9z0KTZjhUGIZs/sTis0SfG38RzSybQbxNOV0REPzHLOjC4xra
         peUw==
X-Gm-Message-State: AOJu0YxNVHc6FdY35kaU8TLK4BezNJeOGxJtqpPy+DK+vDDstV9N9Xd9
	mB3naJc6SHIdyzxAAM2U0T7RF5f+wZqGs3MuxZXh6YFMxb9GG3w2TylQhJO6WZua1VQ=
X-Gm-Gg: ASbGncsNTchQXiQx3+fhLhBwrrlX/W+q4JqvG+aRaQ4xCPdAWj3Aq4eaccCfMOEQXjc
	Q4XDi2BOUlWOvjQ/leL0rboV8UJhSpbQL7DH4QxkswtgeX0lgPO6hds7L7VQ/xBawEUk9rFQq1j
	H3wZEfFFQRTMma95LeEZtH2uBa0qp+TFieV7nyvmNwkju30o27D0dLagVIrbL2XXFSpPkG8zfLd
	iIZPk6oqpcrMJIyYPNuocc8CEWg5/HiX1Ed0z8Z1B++36AeFpiAmmZszwITjpMUqGrRSSb0d/PC
	9WVYeADEdVeVIdqzkItdpvwnpnB1qDx4UsetnwV8Kt173CRC3gzT2sTXJyuk806+If6H4hFhS9t
	oPIVkbvIblPK+frlmK3HkzCEv4Q==
X-Google-Smtp-Source: AGHT+IEjYBGc/KpeAWjFSaq+JuE16h38uymsb1ZFUiMpW7oYYK1p/4XlxpYj0LWPvpE4j2eNSqrp8Q==
X-Received: by 2002:a05:600c:1c04:b0:456:76c:84f2 with SMTP id 5b1f17b1804b1-45a152e2fccmr4110035e9.30.1755000773375;
        Tue, 12 Aug 2025 05:12:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:44 +0200
Subject: [PATCH RESEND 02/14] gpio: generic: provide helpers for reading
 and writing registers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-2-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OZyZWSGy8uPs2UaDZUWXQTJ09CV/XrDYoRGt1dr0Y80=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy+/0JW/AnHm83j5bW1jh0kc3KflCAbpm1Nez
 +QIf94ZPVSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvvwAKCRARpy6gFHHX
 ctCWD/9Gpiv2qp0sqepQR7gFmlFChmRPozyq4AM1g7kU1KkrWAwTQoI85kU6hAp/usYcU4rZpBj
 VjEnamt7ga6KGRF+TbWK0Srw72Z8giKyNnZK/VUgwWTf3vUcFRu1Y20himIjGP5tSw1OO37dXnh
 GrDIyhtiFYXzX+L8egWIS+XUSW4lzONXcXFjh6dkRie7SojGAxDqwGNMDPC+pegpHGFoeE8BSwG
 0zI1KijmtHhgf4PmRImBRE9LzQnaKGnh4WGgz0yBJBpXiBGdBK4YbJTkpQWXl1wPAJbP9zEZR69
 1Xqlveq/zYbY4c1fjV+Pcvd7ZrLCbImz2yl+u8LYNuYFjS145kHnwcJUDjVVLb98hmmdl9VAsv6
 mhjZkA4WX3fS1u6LP6YtqdvsW7LmtE5vfzczD1V6Rr1jWAXzQJJxmoTBGprIU99KZRmXaNBqEma
 SQ617U6c/BaiJK03BHURZUlP3QFwt153QiFv17oPRcODIRkfDm0m3BXuR4Mhhx98vGtkzz7hvdJ
 GJxNXumsYrZMvi3ethW/j6AGvYg30jVnMkXOymDVS2MkO8hKZ1QPG/OrTSto7qvgAfO7l8QI1Us
 TeAyfHigSJwMeiwvI9KSwA4ZAgYip48Xk4hQfrM8QXyuckZuqXHJmrcTnCVBMzld9KnVLSiMahq
 9u5gtMFrkye64EQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide helpers wrapping the read_reg() and write_reg() callbacks of the
generic GPIO API that are called directly by many users. This is done to
hide their implementation ahead of moving them into the separate generic
GPIO struct.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index 5a85ecbef8d234d9cf0c2f1db7a97f5f3781b2e4..4c0626b53ec90388a034bc7797eefa53e7ea064e 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -100,6 +100,37 @@ gpio_generic_chip_set(struct gpio_generic_chip *chip, unsigned int offset,
 	return chip->gc.set(&chip->gc, offset, value);
 }
 
+/**
+ * gpio_generic_read_reg() - Read a register using the underlying callback.
+ * @chip: Generic GPIO chip to use.
+ * @reg: Register to read.
+ *
+ * Returns: value read from register.
+ */
+static inline unsigned long
+gpio_generic_read_reg(struct gpio_generic_chip *chip, void __iomem *reg)
+{
+	if (WARN_ON(!chip->gc.read_reg))
+		return 0;
+
+	return chip->gc.read_reg(reg);
+}
+
+/**
+ * gpio_generic_write_reg() - Write a register using the underlying callback.
+ * @chip: Generic GPIO chip to use.
+ * @reg: Register to write to.
+ * @val: New value to write.
+ */
+static inline void gpio_generic_write_reg(struct gpio_generic_chip *chip,
+					  void __iomem *reg, unsigned long val)
+{
+	if (WARN_ON(!chip->gc.write_reg))
+		return;
+
+	chip->gc.write_reg(reg, val);
+}
+
 #define gpio_generic_chip_lock(gen_gc) \
 	raw_spin_lock(&(gen_gc)->gc.bgpio_lock)
 

-- 
2.48.1


