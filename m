Return-Path: <linux-gpio+bounces-12407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2EF9B842C
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 21:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A3B1F23D67
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 20:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB571A3BC3;
	Thu, 31 Oct 2024 20:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3P8uQheH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5019ABB4
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 20:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405332; cv=none; b=JwSQCNahgifLUR4UQedK6P4ZRMFV8RXf35/4Ife96wTt0iOcoVi/jSpIsBBcxBgxITqXNCCr2B83hq8zX5P3xQFrWss4WmpMAstPu0nUVqYhQW4AaVXK8vZaveExtjm0R1a8VSCIlJqQetoXF0/4qOk5afRUogOlvYLz+5xKr2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405332; c=relaxed/simple;
	bh=wOQFi5MSy6tbhEpG3jKFVCRi1anD7nHYDvspYaJfXoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IjsQNEHg713rhK9V1VJ8vD6NJcmlXi8tokIGusZZ7gN8ldoAqO84UP2IbD5JDfnnxPmSa0ZX/wnt8J1yndJcQcGStRqws+lGmOOyHtR/V4on3BVi0cHYN9NhOLH1e+dV5V06WTNLBKa3rkskbc8RqF+Q7Mvr79A8LeBMKd/Z2yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3P8uQheH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43161c0068bso10959925e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 13:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730405329; x=1731010129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kfHagDh6usyc8u7POry/8zIyiGSSk5lsRPg0r7Le7jY=;
        b=3P8uQheHR1MJ7NKdGPEKFDNRALUtd9r/6J1IirUUdzjRExL926XotubBOTK4U3Iy0w
         xTwH4b9uiTAz+GJFH0uZYP4Hw+pJY2Uz69x1ptx6iBus4mRu2D6MhuEl6bh2QZWctE0L
         rHWrISR71Ns48JcZhw0DDGjnxpU0kRYGO/K0WMAgmNike78tX8rDx3Ov9fmNjIiIGZfh
         Tgu6OgB3+D79Gt6iNV/4DagBei4a/ct4xgHKX7ntYbWTMrkf1sPjex/9Hr2gxPHomOk2
         xjv7tVZB7NcN4Dg37ojQcEc80QJHS/p62p5cLrePiKUYxMI4MwrmCmJXcFFDCw3seClJ
         om0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730405329; x=1731010129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfHagDh6usyc8u7POry/8zIyiGSSk5lsRPg0r7Le7jY=;
        b=SVl4X5FdBZWyo0RylTuQ8y3FyRpZD5AClOKOEfIfmgm1EI8pbxgCbNa0n3YZIGkDnN
         Fh7C1ncK6b2v1dYlHfkECPLjQdVQR4fK/pnX53KiSKLN1WChP/yGBEevpK+w6Z7fSTAA
         /OMCqJJC9w0H+WvTHtqcErX67a/KOnHQZaZuMuoNuGpUxEyCGSdAopKC8MWC85sy7nbu
         jFuxV9w+mx/zorCK2lSxd/HhdKKABlmIIo6IRcPFhrL5bbeJsEhczirOd0rQ2NDDxp7d
         RHThq1+2/qvkKRYydAm4tqpHNh4zsqL9FvcGBr/akPRPXzx6duVBIK3y664PN6NEYN4P
         YxUA==
X-Gm-Message-State: AOJu0YyQASccu1s4iYPAxZ9x7UqrLqeXZ60b5dQZkjgc8hyfgP8hij9N
	S83oN19cH6tgPI+6sreqSrKqZzfdJGQN5N58e97CMWnU99DSzbUTGPgzroc5bCY=
X-Google-Smtp-Source: AGHT+IHyxstUsfh00mPEKqx9SO8dh4Xe+8nJd5UICEep2LS8qUDyb+79q8iIkEcEmky/hZ/nNKREJg==
X-Received: by 2002:a05:600c:6046:b0:431:54f3:11b1 with SMTP id 5b1f17b1804b1-43283297a21mr9014205e9.34.1730405328806;
        Thu, 31 Oct 2024 13:08:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f39e:5519:d578:740])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852efsm36984475e9.30.2024.10.31.13.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 13:08:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: cdev: don't report GPIOs requested as interrupts as used
Date: Thu, 31 Oct 2024 21:08:41 +0100
Message-ID: <20241031200842.22712-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIOs used as shared irqs can still be requested by user-space (or
kernel drivers for that matter) yet we report them as used over the
chardev ABI. Drop the test for FLAG_USED_AS_IRQ from
gpio_desc_to_lineinfo().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 0ec162b0ea04..629e9372fd57 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2275,7 +2275,6 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	 */
 	if (test_bit(FLAG_REQUESTED, &dflags) ||
 	    test_bit(FLAG_IS_HOGGED, &dflags) ||
-	    test_bit(FLAG_USED_AS_IRQ, &dflags) ||
 	    test_bit(FLAG_EXPORT, &dflags) ||
 	    test_bit(FLAG_SYSFS, &dflags) ||
 	    !gpiochip_line_is_valid(guard.gc, info->offset)) {
-- 
2.45.2


