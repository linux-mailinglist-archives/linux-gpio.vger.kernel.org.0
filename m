Return-Path: <linux-gpio+bounces-3407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68154857E10
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Feb 2024 14:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D32EC1F25AD6
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Feb 2024 13:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D63112BF0A;
	Fri, 16 Feb 2024 13:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EqjqDDeE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ABB12B175
	for <linux-gpio@vger.kernel.org>; Fri, 16 Feb 2024 13:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708091543; cv=none; b=ZyWD+nUJhNQecL7R7D2Zss55j8sumgExmchR+VU6coJDPPV+wvNcix4/llP8/OF3Oz6vlIBtd2GMf37VOQL/sI6ggB7VYWGJDm0jpQFfmqJSWQ82E4fnFBkfKK/mGBqETaSDIhN4FoG/kryxzEM1v6e1DR0OaFHt0jJWTuu4ljM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708091543; c=relaxed/simple;
	bh=u9tEtOdYNtqmd9/AAMeHdwwwzLY9Mj2tgiqsEJ7VPpM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LC1cPOdHodDczJBbfQMrsaI4CrN3h1D5QP8QQZhmTKgMuGiJOIwOPbmJm3QErizaa6BwatD/3WlFCMYdtEvjEe67effGJKW12YaLmBouSNheOWL0+z2jheQvkYVx5eXw6KALIUAW1flsYYYVj5gXmBXKp5AjkzCKj/l5/B5h82Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EqjqDDeE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso3290092a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Feb 2024 05:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708091539; x=1708696339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eAoF57+HdoC1GvJ/hU1s41OTdJ+yNr5fmH12PpHzZhk=;
        b=EqjqDDeEeAgfHKRhm/7FXhs0vvIRfhisModT51YJU6FDzTZjjdAi01Z5nBex8wO3FX
         QiYjtpfTWT19pdvvbqHoNWneUeR+3/LamsjoyxSAEWfmiSqKhL+vtFjB7q9SZrBf7waA
         XSgHkvxqZSZaV0KElN0jf61j5Xh1+2j2ALP9E4SfVdnTCfuBwYAuoU013tzj6NS0Y1ey
         nYBHKDRzMxCaXDK4Kcu2+D3IoHNZFqYZedT1gZDTSf1UBoEtfcguP9I7SSiGkkq0SrDk
         4p/CheNZkRd9OFFvtiV4tHkcyrZS9rTbJ1e+2zydbwhFAcl6SD1/n7WYEzT/cKHgX7xk
         u0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708091539; x=1708696339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAoF57+HdoC1GvJ/hU1s41OTdJ+yNr5fmH12PpHzZhk=;
        b=KOuei8LIfI7kR4lU1mw3fMr0gO72flsDTjSveGbbgl/AIa6DwvesrD/B0gbj7dg2tW
         cVJKpVnTRiEpPrBK0N5LJzouus5xy5ghIOhcHHeJUtUXK+lP0xlp3kpj6PWj/Yt1Cptj
         8lXrMU5371KMWg7wd9kWWpHXKV31Vrhm0Ne21IaZoqm+zt0KkVbtUOsvim3qnTJQizs9
         ZMgSaEIM8h78x94/s/ZhloMvC2Z76M14VdYFZsLgiYMQ2aPvScNF1I+NYzTpRr7jcv+O
         j7tlOBKu8Kh1ufkj+o+btqC7gC7MYvCgdHKznmw8RGQZ4A3B7po+zLkW9pALZ2pfcCTE
         NyaA==
X-Forwarded-Encrypted: i=1; AJvYcCXRTnHBWhK4pjZGE76b7umDDReHGdFUEBIbiV4t8VEJ8wFxSrvRhoxw+UlwMsiyV8/mXZY1gWv3j2knraCsM6JQ0hrc3uhXPf5MnQ==
X-Gm-Message-State: AOJu0YxZT84d/BZbiBUxTCxJ5hMLQRfAf5Oq91P25y/LImkVlfbAUYNO
	59CXO7+yhgIc7VuI592+oMQscRvWThpEvIpbH1gMWVCo7svKrKcaGfF0wFY5zEsHPlDCovlk4xg
	d
X-Google-Smtp-Source: AGHT+IGIr51M+n4RbWiqG86O/TMKzx4D2zAaPxdwzmAymCsRVnzRuXwWYgdoG5YWn0HjGcOK7zRPyA==
X-Received: by 2002:a17:906:7c46:b0:a3b:e975:c530 with SMTP id g6-20020a1709067c4600b00a3be975c530mr3480002ejp.51.1708091539563;
        Fri, 16 Feb 2024 05:52:19 -0800 (PST)
Received: from krzk-bin.. ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id oq25-20020a170906cc9900b00a3cd41b3c19sm1559709ejb.199.2024.02.16.05.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:52:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] gpio: constify opaque pointer "data" in gpio_device_find()
Date: Fri, 16 Feb 2024 14:52:17 +0100
Message-Id: <20240216135217.129795-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The opaque pointer "data" in each match function used by
gpio_device_find() is a pointer to const, thus the same argument passed
to gpio_device_find() can adjusted similarly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 2 +-
 include/linux/gpio/driver.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0e332b24c7b8..8c9cb324b7a4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1112,7 +1112,7 @@ EXPORT_SYMBOL_GPL(gpiochip_remove);
  * If the function returns non-NULL, the returned reference must be freed by
  * the caller using gpio_device_put().
  */
-struct gpio_device *gpio_device_find(void *data,
+struct gpio_device *gpio_device_find(const void *data,
 				     int (*match)(struct gpio_chip *gc,
 						  const void *data))
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 51b23211794d..251a610f2234 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -628,7 +628,7 @@ int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc,
 				    void *data, struct lock_class_key *lock_key,
 				    struct lock_class_key *request_key);
 
-struct gpio_device *gpio_device_find(void *data,
+struct gpio_device *gpio_device_find(const void *data,
 				int (*match)(struct gpio_chip *gc, const void *data));
 struct gpio_device *gpio_device_find_by_label(const char *label);
 struct gpio_device *gpio_device_find_by_fwnode(const struct fwnode_handle *fwnode);
-- 
2.34.1


