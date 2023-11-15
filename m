Return-Path: <linux-gpio+bounces-178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB57EC8F0
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 17:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 392FCB20B9E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 16:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D603173A;
	Wed, 15 Nov 2023 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IE6usIVb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFBF2C849
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 16:50:08 +0000 (UTC)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4B4195
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 08:50:04 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-66d24ccc6f2so9555916d6.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 08:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700067004; x=1700671804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aC5w+N5Heh6KPJfLTmPFbd48gQJyNdKHiN7BtvnhWX4=;
        b=IE6usIVbu/wLj2HfOCYgU6Y38K8qnbu6Ff5lfBZpWHUEfzDvn++xf+Gk4/tmyJZX8I
         vUjKrPk80iZ0mMKyISeIsPfLtEFj4naapo6pP/0D51bzVCxv21Tzyo7Qosvgwaj7Tiqu
         9DVS4RNTZmOmGOeOwco6hxtdVntxLu28fmC/ro5JmdE4IQ6pt/ERlzWDB0UUS9oBhL6i
         OI/EA8+I2pOEpkYwbD/uLD6N0lqtt0vR5hlJvhAwIfZkAhaOmdepp0NjXJ21C1KNdrhy
         KVc0MNeoYHqNolgfJkCaQlj8ZoBqn/KdbjBtunSlRShbw7w25UMx4rFcucRG0SeGZu48
         kJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067004; x=1700671804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aC5w+N5Heh6KPJfLTmPFbd48gQJyNdKHiN7BtvnhWX4=;
        b=a7gmeD33HDTNf5Mi7GjnROXjlyxU7uliH3RFyXcoKjN5Go+sN++tnL7U1HIDC8rI8o
         U3/SRDqQyx/Nc7NneGcndNVZf7tnrDv6FoodZNpiISLCM3YUafodYKYLDbIIEI9LwRsI
         Hxcz4dcoaSUuY81nD/0/90HUZDxn5+suKeMR+hRp+aNSNlKmKT0MaRzsjYXkh/gNtqGn
         itKsoIyYZm0m3gyOw7ejvNoq9lQtRYgLt4p/+Vo9XiW+KvdRF/ydWZFnUoT4i6pH3zTE
         8Ccz1TPNYliz6w2XyecfuLUouLXe0wy6oZkAzF+533on6qNr99qMtC5ZF/2SIszRUeAo
         VOlA==
X-Gm-Message-State: AOJu0YxbUwnoB+yb3vuUrCbHWzxg749FA+oohlwTQT0x99lnMFxyZkje
	kPRw6S12aZZGvjj53dQKBC160w==
X-Google-Smtp-Source: AGHT+IFDXQyAglPrSiPusXkmaMsX7sU+swotUQYO5tBi1yQNW+84CElcs3yVu1MIDkx3y01bGva+lg==
X-Received: by 2002:a05:6214:c2c:b0:65a:feb1:ec46 with SMTP id a12-20020a0562140c2c00b0065afeb1ec46mr12565814qvd.6.1700067003998;
        Wed, 15 Nov 2023 08:50:03 -0800 (PST)
Received: from brgl-uxlite.. ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id mn16-20020a0562145ed000b00670a8921170sm658781qvb.112.2023.11.15.08.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:50:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/3] pinctrl: don't use gpiod_to_chip()
Date: Wed, 15 Nov 2023 17:49:58 +0100
Message-Id: <20231115165001.2932350-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's start working towards removing gpiod_to_chip() from the kernel.
Start with pinctrl. The first patch should go through the GPIO tree
and become available through an immutable tag so that we can get more
conversions in this cycle elsewhere.

Bartosz Golaszewski (3):
  gpiolib: provide gpio_devie_get_label()
  pinctrl: stop using gpiod_to_chip()
  pinctrl: don't include GPIOLIB private header

 drivers/gpio/gpiolib.c      | 14 ++++++++++++++
 drivers/pinctrl/core.c      | 18 ++++++++----------
 include/linux/gpio/driver.h |  1 +
 3 files changed, 23 insertions(+), 10 deletions(-)

-- 
2.40.1


