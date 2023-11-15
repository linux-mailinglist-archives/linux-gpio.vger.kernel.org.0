Return-Path: <linux-gpio+bounces-177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D73397EC892
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 17:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 905052813FD
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 16:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765CD3BB24;
	Wed, 15 Nov 2023 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uNGX4SLQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B8E3BB28
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 16:29:09 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70A18E
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 08:29:07 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-41feb963f60so9387331cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 08:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700065747; x=1700670547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zWfB6Pfx3SaiRXKdJrtjr1wBtGr3UGnibkVdLL5HdSY=;
        b=uNGX4SLQZ3SqWe0BBeXTLRHw1X5RmIPM2HKEK1heYbj2zMwIZIvST+LKeq6j7zIOph
         iHH06GEb6Jyd/DFIcmIFAHm+599OXeimIYzMouUGPOqXtagZU1GRomDJYd6X2clT9fio
         Fm/CTcOL1Hy/iBp3d5N/EArWppcQlqDaE0/TIH6O84569Q/z5RDb/iqrtNR3PpzexzYA
         i+ISakhpbXEUjeSQ0zsvRUaYGjWlPAQDPm66rLhrjMabYMEq7PZcdzcdlV6IjyP03UJl
         kDYf5fUnqmgVQJadaveruAIqH30wkq2kGys5UNiQADBAG4zkbWNWj4t8TPgg/fyk+S7B
         KwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065747; x=1700670547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWfB6Pfx3SaiRXKdJrtjr1wBtGr3UGnibkVdLL5HdSY=;
        b=jBgfFe2o9IMLRVKHJq7kiPV6rhYcj45BTCFehy1+0x4+VX8YqRbjRjtJoyiFcbz5Ok
         9WW3VrU6qRvoXiZ9AmGaHej8HZ3Cw8LxJFLig6yMqinzuLGIivIL8PI1HFJXTeNODcrE
         c2BWuWLOiqsZQ1eH1a44GrGmhlS+9G6hsFJuezj9VeC37l/uJaFtjfvxMWp0jCyWezKA
         ZkbVYO5G03ad6YqJzI0mojyKznCCc1oXhKL2ED22EuHbkmROpEEQY2pERwtft74sWpOs
         HxnfggRoRVO3N4Pmxz8d9QZijW01QL/tVaNuVCqv6mSqX8/KFZOx6WHgI+L14TSvlQfg
         6Ccw==
X-Gm-Message-State: AOJu0Yx5QwAdUyMvpHy0RzIUWnEbYIHZfKt/cTuMxOlrGFb6pZgnk4rC
	GGmlyEN18zWO9kSe0p9rHvJpzQ==
X-Google-Smtp-Source: AGHT+IGbQpcw6KBTm98RikYpu9miHWjOeCRL5OJ7iTqf/uU0fxIkVuFIIbP5+Gm3dZbTwjRb7khCDQ==
X-Received: by 2002:a05:622a:18a9:b0:403:a662:a3c1 with SMTP id v41-20020a05622a18a900b00403a662a3c1mr10578328qtc.29.1700065747040;
        Wed, 15 Nov 2023 08:29:07 -0800 (PST)
Received: from brgl-uxlite.. ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id d22-20020ac86696000000b0041818df8a0dsm3645419qtp.36.2023.11.15.08.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:29:06 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: mockup: initialize a managed pointer in place
Date: Wed, 15 Nov 2023 17:29:01 +0100
Message-Id: <20231115162901.2575969-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The preferred pattern for autopointers is to initialize them when they're
declared unless it doesn't make sense. Move the declaration of the
managed device pointer to where it's initialized.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mockup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 4870e267a402..455eecf6380e 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -354,7 +354,6 @@ static const struct file_operations gpio_mockup_debugfs_ops = {
 static void gpio_mockup_debugfs_setup(struct device *dev,
 				      struct gpio_mockup_chip *chip)
 {
-	struct device *child __free(put_device) = NULL;
 	struct gpio_mockup_dbgfs_private *priv;
 	struct gpio_chip *gc;
 	const char *devname;
@@ -367,7 +366,7 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	 * There can only be a single GPIO device per platform device in
 	 * gpio-mockup so using device_find_any_child() is OK.
 	 */
-	child = device_find_any_child(dev);
+	struct device *child __free(put_device) = device_find_any_child(dev);
 	if (!child)
 		return;
 
-- 
2.40.1


