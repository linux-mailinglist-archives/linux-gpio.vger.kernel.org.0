Return-Path: <linux-gpio+bounces-21135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B93BBAD2F96
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 10:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 716F916EDAF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 08:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234AA280320;
	Tue, 10 Jun 2025 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B2L/6sPv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B6A28003C
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543126; cv=none; b=ZuEDVmDB7x6XgUd81A7xVfdlYvT/n4LrZUAqwE3zWFPUYLsza2VbDEwhW0I9wZv31cogdK4F1YW/ox9qltelpWCh84J+eC+9ZJ5I7+62DlSg6dtJ+J6fOt2UND+SUFIOrCUgLu3mEaDAuLBd12sWpmBSz/LSYGxX7eWHq5fPp8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543126; c=relaxed/simple;
	bh=yvgWF5tnQNZRDjc0fGYDrUE1mlV0Lq+VUCZV1FeRugA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9g5RqiKDx0yfQHa2huqSoqT4oVeVw4nUuedtYk7Tjj+LsTYh55bbwdkVsp2Cn6srOfq4RAOy7I07briqyOpp+dJ+GUbSkBhAnAh3Ysrqdz6FzrM3hqgK1MQRr35r0OWukT8sExCQvQMOGhxfF786TFTPtjdA+JEdC+KFh6pbdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B2L/6sPv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cf214200so47570975e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543124; x=1750147924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjgQIJ76dKbmwwjeGXopIMo/gsZHO8kBrQYsSavUt0k=;
        b=B2L/6sPv4hjzgzss/Y2f2WHnLWyp9sYdo19Olow9g9PDb/yXFShZzQ9piKhvc3trpC
         yhpDpBgGwdy4UBxUB4IIMIT1BvF3EH9qXOXUtw9GC0O3cksdqHKlfUdBfYam2iflpPy2
         Nojx5YbuXh99Ge7RUW1Ji8+RVNtM2M6QAzk+k6/TVIhCBKiUtUaItqAhEnaS0bYBpA4A
         h0cDAYljIHXTGUlYwoEcq3slWgVXIJ0639p0/ock22bLDGPqWtsBVep71qxQq6dxNkAn
         F06T/r3zmozbUbLo+39aYxRjckIWk7/Z1qYrRbifIYTtwjj2D9iRnsXa4NlTn2pBHIHa
         Irrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543124; x=1750147924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjgQIJ76dKbmwwjeGXopIMo/gsZHO8kBrQYsSavUt0k=;
        b=Qpohcdam/vJmCkDfES8lMlFBzFaEi8bkh7CHyKAQyWbIA32wgMW0xA3KZW4QvIbpoF
         xwtojY0pRHHpcxCi6KLu17/Tt9AVbXlhkYF3zB9FVJ1M+I0FgPbjOpPuX5MOPcKPHo4+
         PhJbhrUj86BpGs8+DINoFH6j/HJAIDu9jTQLyWAQgHU19zMU+NijGI1xwL3qLAciohLe
         EyMTcOtjwDcCliBHKmOSuoo1B3H1KWTJcZ9lgtkv0KBPwLKgHu94p9LQcuYuC6vFczjv
         nGTTSXSg57837IvM/X3+FvY9ebJRvkRCwMiUHzqcZuaLDzWRh6XATYldT6BQ22lWn8hn
         Sb8w==
X-Forwarded-Encrypted: i=1; AJvYcCVWKHx3dL4tZPEtbRnPlcLJZlNVe9uaLUerpGVVXlwkY4ifZ1EGrzW60Qbo32uwFrhMnzqiIIrOlq4j@vger.kernel.org
X-Gm-Message-State: AOJu0YzHzDNHV8c4h4ECboZdTBZ915IVXWbwTIv6tULIhyFeOdtzoqgF
	yAYjwB97RILi9bOSyVgHE4pztiYQb7veDIGe0vtIolM6JLMRRfqRZ6nVcYPHfRd/J40=
X-Gm-Gg: ASbGncv7LFFS+hPVG2edIT/tNIJGaKrMIbc38gTlX7X7J2L+YHfem0OFua6H1A/aJbu
	xI3WrwY/3rBnSQEmgJltMk6gfoq96z3XvGN5Uxwrr8MM08T5rQS0fem+iveZiXtI/4fZpJ1e187
	1vgM0E8x+9f7eM+lvPGGqZhtRCzB7Wdl9kcTj2nPadKBHKmHyNfWE3XnmqdG1q9H+/wwM6DedMr
	96TCauys2X/GIfLoh9d9QVzr6Wtb4wL7i5ofA+vZ/e22Rc3A6rzIjNRnReRaGZ8VfsQP00A3Tt4
	nReAi331ek3NV98+V91GWWR0GQCVAgkySi8hm2d/fRJbzx7qap/jnhbIXe88
X-Google-Smtp-Source: AGHT+IHw7/V7r+W55JJPgOoMHWnb03kXm/kQE97NwVLeZNevpDtk4rbU8g1Mkp4wQwowMYR4Dz0aYg==
X-Received: by 2002:a05:600c:528a:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4530efe68f4mr70110725e9.12.1749543123640;
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
Date: Tue, 10 Jun 2025 10:11:51 +0200
Message-ID: <174954311123.28634.1499230964159731709.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 01 Jun 2025 00:21:37 +0300, Andy Shevchenko wrote:
> devm_gpio_request() is used by a single driver. Replace it there and
> kill the legacy API. Assumed to be routed via GPIO tree.
> 
> Andy Shevchenko (2):
>   usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
>   gpiolib: Remove unused devm_gpio_request()
> 
> [...]

Applied, thanks!

[1/2] usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
      https://git.kernel.org/brgl/linux/c/32f6d31dc0401e6af7c48e5e2381997b6d957d85
[2/2] gpiolib: Remove unused devm_gpio_request()
      https://git.kernel.org/brgl/linux/c/a5589313383074c48a1b3751d592a6e084ae0573

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

