Return-Path: <linux-gpio+bounces-18151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 753AEA77B3A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 14:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3565416C2C5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 12:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855032040A6;
	Tue,  1 Apr 2025 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DVqHWIUW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1E2036F6
	for <linux-gpio@vger.kernel.org>; Tue,  1 Apr 2025 12:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743511623; cv=none; b=hRu2gL/KwpVgT4Kb4wZRCxc8+mQz5JQB+XCdrND4EH0N8Ng48SFHXMSHO0QiJsBRnY63OOv8H4DRXpj8t7DHRSnuZSd4EnuTQ3qRNMozXXqIxCi8CteRk04bPwLYBShYEbxWDT2ks38JmyJ+B7MIWOn9xsVcw7pxalAQztke7+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743511623; c=relaxed/simple;
	bh=GnrucwK3wBDJOuGf993QhhGPNa9SjUynbuL3Y9sy9PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ev3cAVZPbZPZyvRk0yX0/hlvu+GXrX3ctslUXY9Km6ZtcyNmiNuTNdMVq/Ri5IUqs6rPGqZrMnaRyWQIp7+LbYzlDyek4zlNqx+WswSr3+fOSfiEMCb+um/0mm11R2D5oDwXEyHcMiYF4CfOFY5Guuw5wmYIxlGc019CItYPy6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DVqHWIUW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso25648965e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Apr 2025 05:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743511620; x=1744116420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ru/kCs6fPOtEnmEL1xXoiZTrgpc2bJaLexsQ8fcTImU=;
        b=DVqHWIUWpie5gEHBtHKIqUDzasR+bZ0tE5zP2fEA6s0gk3xRR9h7sGO5f0pZL76iWE
         u0Of6kwnrmo0LthNMZNljJxNGysgmjJ37VAGUFtIIihIwzcfQVBikwD79W70oIljOkNu
         BNHWIgWlH756qkV6Bv8LmT86DMKny1A7DbbCIdgjTKTDbQIcuQ6K6FaQliPO8oZQ67uE
         XOTI6cmkWX2BzPL0qAh6tKAmxthEO58CwnRYPqX3+mMMfik8smdc1yNXhRLNWhj3BMxs
         bEy2u0oUSkgQ41MQI3u5gqqfxy6t9fvhKEDQPKdQZQcuFrappX0jnSrimabIIrg7PrZD
         S8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743511620; x=1744116420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ru/kCs6fPOtEnmEL1xXoiZTrgpc2bJaLexsQ8fcTImU=;
        b=fos2JnVaZ2Cnuh6af2NVgv9uvj/ME+WXINkuBcetc7JRI1jQUcAGAVa+IyA4j2hJBx
         rN1azKkUNghuUVJshoIVGKaTrgQvy/lBb5YQ9zfmNPIwFb7g2jITrwZRurB2CjyYCsaK
         tJEvsKqfoCAhsZfceWgnwSQ09bNO5m2k4hz2XKxWVw3ihwclNPbR1uidyjiYOoYawmXU
         aop7qmurruBfIg+KxmLfvHfOjwYmszUOlMX7QjtpV25OWvdzHEZFHXjsApHBSxvxqzhR
         A3T45nxRevLc5srHIwttT55EKmv98yZpVWjErOlbW9mSBXaH2ac4l7wigJ5Xkln6+j0R
         fnmA==
X-Gm-Message-State: AOJu0Yxcx3XJwKg30vReQEpkTlURoTqtB3EYAMg1mwzNE3dygmZ1FxnE
	T0X28JWrcqXG4ARboTr+nhueOwHu+QHBlZOgxIrJ176ygplIFX5legFm/3nuyBMPIxSs8nLEDnq
	Q
X-Gm-Gg: ASbGncu1p+qOygw6pldluZS5SGE+RY+T28eLSwxvbaMmTTxt/eshbvRxKnFl8hV4FSM
	zlC8dUHrFqB/e4PC5mDHny6RMdKW+tnaiGfmYY4DzhbRWTBBsojAXSKAc+qJ4+3KgAu79xspCHX
	uoCW9mNGAIZEXjo44mHpkUb0FzIu6pI+Xu6xJglx6wB1yA7ctPu7HZiY/fJaCgaE8fW0s1j0OmK
	PRjVYR+SFRiZIDZELCs1Ok5aoenA2wMVIiWMf+FIWIKsiFyQDVWqWfhEnuMxo5gjRUWxV7O/kOX
	fpHbycB/MBZr0EjyyQhQwl+0vHaj6pNi/Bcv
X-Google-Smtp-Source: AGHT+IHItyHH2EZ4mRoUhQ9o3NHL0wZrgwkzTBEFAtYB1xr5BdYYW0bABHCjSUvE7hwZnh5gnfHZ8g==
X-Received: by 2002:a05:600c:3d9b:b0:43d:10c:2f60 with SMTP id 5b1f17b1804b1-43db62b763dmr116400685e9.24.1743511619813;
        Tue, 01 Apr 2025 05:46:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a1d1:bbb:e2a6:2a9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc1889sm154711095e9.16.2025.04.01.05.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:46:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Apr 2025 14:46:45 +0200
Subject: [PATCH v2 4/4] gpio: TODO: track the removal of regulator-related
 workarounds
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-gpio-todo-remove-nonexclusive-v2-4-7c1380797b0d@linaro.org>
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
In-Reply-To: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zc1zKN3/KwCiY/o3NNRg2Y1Q2MbeVO4dJU8b/Lwp/As=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn6+A/6+i4htRXdHudS4uj3buYx3Z220bI+AxQo
 xOYk8MMoxGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ+vgPwAKCRARpy6gFHHX
 cijsD/wJ7YiUVP0UYIZ8BUaAUNToJYtnpFiE0Pqy/HNjTu1WLJe+lXN891Vm80+KmsDxzq7zTYA
 vemMk401D7rmc7DcBQotzV2NVGEyp5RMiiQH7sLPFtICJaiLzQgOs4I7FPGuEy4hVmoxplm6Td/
 47rEpNdnIHBlV1LIF58v9iCTxXcuBxC837cyQglzUNQc+ZZVu9CjmS3axBO2UlaIFUe2iOsTTwk
 q+pOoQvNSqq2o68z2Mx9UdHBsIXXEYJziJcLhK3ocDTbcfglJmwd75muvbQ6aWUpeMzp+gE6tTP
 JBvJD1HyUCmaWpYoYdpnyZSFrhJ10ICG5gBxKVPdEjozOymJ65zXD0cTDWKerTs3gy7FqQF1Ey+
 Gg28WcmVvMhE7Pwbt4ZMERl5vkfs7kOcT4SPeW2EDLk6Oi4Yg3MlF4lXX8YyMVlLsrc77KBI2Qy
 +j203DMerbur9A4o+KVf1FuiiJVFxIVikEtvgs553R0h5pcgCqgn4apCCxpf2Ky0rTiM78TpzKP
 ecbB3ntZ1ICjgQZytaW53GN+Eh7BsM8p6v7lvHu7lRRcb3FUsX6E658AvdgKA1PXvZLlCEtLvRZ
 BuUchLgz7YVK1BfVE+7GaAGMwVFnOjwR2EakSX40zTjg6fVv0WZTwChurOXRap+7i5YUxWhgktz
 BvcLoVlMI76pmig==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag and devm_gpiod_unhinge() function
should be replaced with a better solution. The pwrseq subsystem is a good
candidate. GPIOs themselves should remain a unique resource. Add a task
for tracking the removal of these deprecated symbols.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index b5f0a7a2e1bf..4b70cbaa1caa 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -186,3 +186,37 @@ their hardware offsets within the chip.
 
 Encourage users to switch to using them and eventually remove the existing
 global export/unexport attribues.
+
+-------------------------------------------------------------------------------
+
+Remove GPIOD_FLAGS_BIT_NONEXCLUSIVE
+
+GPIOs in the linux kernel are meant to be an exclusive resource. This means
+that the GPIO descriptors (the software representation of the hardware concept)
+are not reference counted and - in general - only one user at a time can
+request a GPIO line and control its settings. The consumer API is designed
+around full control of the line's state as evidenced by the fact that, for
+instance, gpiod_set_value() does indeed drive the line as requested, instead
+of bumping an enable counter of some sort.
+
+A problematic use-case for GPIOs is when two consumers want to use the same
+descriptor independently. An example of such a user is the regulator subsystem
+which may instantiate several struct regulator_dev instances containing
+a struct device but using the same enable GPIO line.
+
+A workaround was introduced in the form of the GPIOD_FLAGS_BIT_NONEXCLUSIVE
+flag but its implementation is problematic: it does not provide any
+synchronization of usage nor did it introduce any enable count meaning the
+non-exclusive users of the same descriptor will in fact "fight" for the
+control over it. This flag should be removed and replaced with a better
+solution, possibly based on the new power sequencing subsystem.
+
+-------------------------------------------------------------------------------
+
+Remove devm_gpiod_unhinge()
+
+devm_gpiod_unhinge() is provided as a way to transfer the ownership of managed
+enable GPIOs to the regulator core. Rather than doing that however, we should
+make it possible for the regulator subsystem to deal with GPIO resources the
+lifetime of which it doesn't control as logically, a GPIO obtained by a caller
+should also be freed by it.

-- 
2.45.2


