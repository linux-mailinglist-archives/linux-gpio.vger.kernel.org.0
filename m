Return-Path: <linux-gpio+bounces-17867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6B0A6BEB0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 16:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CBE73B8A60
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 15:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC54227E99;
	Fri, 21 Mar 2025 15:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oje+pfty"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EB64A00
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572193; cv=none; b=cal8LpskL0rM6SV3gP+viMvIPsQUxulLC7ZO37XE3I20p5REMb/lNolra5hWnyIvDHrggom8KMEx3vldcncVUUDMOJ7u2p8hmL/G+cFPdrbPgvzAmcaB/vSsOycmcGFUaOTyozS0Mlaehk0D4zwvdP8WYzmpO7+U30X8NDgiXlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572193; c=relaxed/simple;
	bh=xfFNU31W60ls5/B0+qZld8bL1H0RP3qxyrF5eUJ3AEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eanE87n9cuyknDvxLouMjuBFIQkdyQR5daViPN/+Zqzstr4G76V5KQTsJw204ujhtZbdPj5omDGdAi3p0JtJXkVAJAd5loP/kiBMGFJzH2V25idxn3d8C0Bm2HdpdQQ3z80YLlF9wDjAhu3Q6Qz5vlH5aS/1u0i89fhJcioSxjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oje+pfty; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so12777155e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742572190; x=1743176990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWUyEMW5KQjAKQoUCWTi97VpcXQaHbmA9ju/RhUyagc=;
        b=oje+pftyFAgF5k9UaDWtv/TAD2ZW0pic0er5NMUutxsfDyKFHKpKiyPCknj6BD3Nh4
         A/3N+kejgT+qBM1dxDSRLpHSZJcA2MfOqkDVIeMOykGyYmR6yj/685GaPl2Ds0zT/l86
         rHrZsmDND0U9tpnTIfUmgbhxEwPx073JTWC14lsu5OEXHUQ9J1PP1/oZo2wYjgXNgtJi
         T5XvwYfrROtHA5Zha5tjqebslMlXG/hrK7o4pk4nr/uYFLh3Ft3MnOEg8mk8xbw+FTqi
         IcJoUqVL68DUTSR2QOuJRYcJ6rYaXDxf+xDk/Y70XjaCUNic7PfS6YBoOj7pGvaGho/E
         ImkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572190; x=1743176990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWUyEMW5KQjAKQoUCWTi97VpcXQaHbmA9ju/RhUyagc=;
        b=feoxbRaq5CtMkQk43NqcbRn9FkblgHqHC7nhx9JLfBGLH/71fVPz25qm/2NqwjlkL7
         SE/LlKXuP5tWUPujyCzM+NgL6DQbp5ZyV1pJ2otAgGDjnJe/7s2O+6Ah5FSjXj0oKNyh
         9nu4kq58nvxWqAhpxFZW46+E/4RfNAjrhoqujCgAXunPCUbu/yyNAu67sXDM4eD/zkxD
         aytED7Ekyd0lk4w1tj84cfw3qTd9eryalQ44+IbCMPyXR9G/RH0nJ0iLaHH+EDkn2TJA
         8DSHO9x+A12nw11Gh4uaf0DCZ83A85Yn+hf2f32sSE/7Vpe9m8a8T2F9UAvlULH7/2LV
         D3GA==
X-Gm-Message-State: AOJu0YyH+JR0qwpiV9sRLg2PMDzJ7U6aoBZJNfVO1fk2aFV16qqZeroj
	uMbZvuEticuLeOznXjHt9NjAGd2GFlJewaCtTXsz/wjoghlGvy5YcI0NOuuJ+X0=
X-Gm-Gg: ASbGncttbeKpeGWoXKcqo0xt4TE6NdychvqU1XOap6Y1VKHESX/wVUCMz3D55YZ37TK
	qKR1g5pfjW0CdDocE1n4pjsTGiTE+t7HD9WJU9iKToUtpc4BJmOFghBNgVzwDaTIGgVySyaU2MU
	gtZdSJngteuHiaPRzaJI7RrwhVFBjx1amtY3S7oIOJ1LArhslbS3q9Rb/1MLWEFM2OSfNabisdO
	AUGEeOcpSQroY5BnTWfbYshVxNZcYsoDtFciFvn3BZEXOhfCx1vKLhdNcrCWrGQ1WKo7MYT9q4g
	K8/K+tl6hZbI5u4+sYctT4QPYU2VZTkmYIHjrRorzfL4JkIC
X-Google-Smtp-Source: AGHT+IE9lsPNP1ZpJFXQ7VFz7zhG//tQlNCV7FJUrZF3RN9Uf96S8er9qf9JKofSiXbIQXaI/6aa/Q==
X-Received: by 2002:a05:600c:34cc:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-43d50a3cb58mr36631715e9.28.1742572189203;
        Fri, 21 Mar 2025 08:49:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1aa4:f3ec:847a:32d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3b4bsm2664406f8f.25.2025.03.21.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:49:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Mar 2025 16:49:35 +0100
Subject: [PATCH 3/6] gpio: TODO: remove the pinctrl integration task
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-gpio-todo-updates-v1-3-7b38f07110ee@linaro.org>
References: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org>
In-Reply-To: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VovuR27EPmJKuj6f4avilmOJ1pGh2kyGMd0etNsaBCQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn3YqZ1tkYpRWno3Z/Y7xshya85wixSLxYkf9iP
 ifdoWP+JJuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ92KmQAKCRARpy6gFHHX
 cjfAEADAGfmoFuMkJrBJZEyLGkaBMd/6Cj8ZPvX58vT6O8BaGZkaC+lBSp8InOv2z9XyVJyS10n
 GNl0DTkFCxVIhrNv5VZWVHEfgwlGD5OH4+vrDAzgYm2Aw/bkFG1d0Emq8972i4eeAHswc2WZN4c
 EOpQuAgr7dShPxj7rSlnjuxfFbruv/GOfrIhN0slV+RAGLQjpVfwEz1W5+e0eIP8MHFMuMP9j8g
 nXOYAAF1ieiCBFQ5JQU+9LxE1ZV1QDYvBAJ26ebTY3t4t3bvyAi2LNKs+1k+4l2klCi6uNevlGM
 AQhTYug1G8IMIotFTA3vkVmqAcPH3NRuyADRFyyarWcNFJ+Wlx6dSrC+ZCzJ1Utgx+WnaBv6IzA
 0Z0j5q7DnE6UNW4KXIa9CrREOP0b4StVrDFZZYIl+1YPoDS6MxHNxnnon3vaY7Dn/lSZQ38Lcmh
 fyvpJxrDFzRqXh9qjHJfT9bwKy7ZF+XS9WJDayximKvpjLY9ykW2mJEpXrV0ZOJd74W08MOJZm7
 zdnBTgKAz6YYMtM1FG+pOvB23e4U70ONxP5erYWarNlPiLfzzm98gO1ZBoFyc0ikQgdXOeQLoP0
 ypHEf++QEq8mhnowtadu9hHDEdx/f//Hg+9C77sTIEAIqlHwD4stlkBOGOTBG1O2eQ7UeX48h3F
 E4lyHVDbMnvAhKg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While there are surely some arguments in favor of integrating the GPIO
and pinctrl subsystems into one, I believe this is not the right
approach.

The GPIO subsystem uses intricate locking with SRCU to handle the fact
that both consumers and providers may run in different contexts.
Pin-controller drivers are always meant to run in process context. This
alone is a huge obstacle to any attempt at integration as evident by
many problems we already encountered during the hotplug rework.

The current glue code is pretty minimal and for most part already allows
GPIO controllers to query pinctrl about the information they need.

I suggest to drop this task and keep the subsystems separate even if
many pin-controllers implement GPIO functionality in addition to pin
functions.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index ff955befd0ccf..08ff60c65abbb 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -136,17 +136,6 @@ try to cover any generic kind of irqchip cascaded from a GPIO.
   dry-code conversions to gpiolib irqchip for maintainers to test
 
 
-Increase integration with pin control
-
-There are already ways to use pin control as back-end for GPIO and
-it may make sense to bring these subsystems closer. One reason for
-creating pin control as its own subsystem was that we could avoid any
-use of the global GPIO numbers. Once the above is complete, it may
-make sense to simply join the subsystems into one and make pin
-multiplexing, pin configuration, GPIO, etc selectable options in one
-and the same pin control and GPIO subsystem.
-
-
 Moving over to immutable irq_chip structures
 
 Most of the gpio chips implementing interrupt support rely on gpiolib

-- 
2.45.2


