Return-Path: <linux-gpio+bounces-11940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B549AE3FA
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 13:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 807591C22352
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 11:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178AD1D5AB5;
	Thu, 24 Oct 2024 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ECmI8sZM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C251E1D096F
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769581; cv=none; b=jHrVEf+9d0otYKZNo2/2DqF434i64S4w4uT9OpS28I6FXNwhh7k6+7Jh4rsXH3j9g1Sy7dtZUaHw9VHaCPClG6mwDAkiavSP4uwevytTOePaDRasb4H+WeFi+UtvRDet/mORAvYCEcUvZpMsNQdhO27ox7xEafLCFYZ2FfMY+m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769581; c=relaxed/simple;
	bh=Pgjbt4XEQg7IVvK0FnWvm567PSzKpKRl5JNn8e/2W1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RtRpg25vq5kFEzoc+iT6k/WxR7C6a8DuHMr3KdXG43mC+BrLHzcsqAEZbv2WK3Yl1uIc9+ybvVmpdWiG40n8HJSlwgUjSXbyUtC44J7J5CqVf7svcw3PVG6D3dKbUBO766A8D3kp9MdoWMQASjonEMz82oO5oX1DFwRFOFPpK6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ECmI8sZM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-431616c23b5so5788515e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 04:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729769578; x=1730374378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eppHTEc5juuyQhtpfQNDsJTRqz3tSRocJdtDsSnuBKU=;
        b=ECmI8sZM630DdPugC9s73Uq4toUSefGrB54Py84HMULLoBNlneoJXEjaK7EHl/61KZ
         0XrUjlYdtelgBEY8m3O/YvrS/oGOMBqgQDWsT6yjCA2FU5MY5eP3SOqnMrfOIB8zWgM5
         7JCPnGgGU9epz4SB2AREJULgZUcVVnlUSvO1eQ86otURnW+i1y32RHSRwkLNQvCT/B8S
         4kjfwMyjkwCHAl7QMH1eCyPzeRtjW7YyK4JgQgaCts2UOYBrwjhMqjqsEx/PZ8jqqL3F
         jfWSddxdy8emzTrhUWhnRx9Auny8bpptLBmR5Rv0dAMFi8+raMcw/1wJ0G8Gl4482O0J
         RtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769578; x=1730374378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eppHTEc5juuyQhtpfQNDsJTRqz3tSRocJdtDsSnuBKU=;
        b=rII6kAAVqKSMaoRraFSux4C2CImYg6PsrEkX9O3R0zpG29qZ1gtDDMOwWuU0blutjn
         rN7PD28tz4IAiMUbWMJ/npsM8ZvNBD2pNuXtRQnsqrDNUx7LVKnMrYqRv7NN+2qmYTNA
         654+MCWEUM8ZnmW0G8OFKGfJxOlsGZntlWBxDSynpUzzo4LooXFrn04CtbJnHPQOHvgi
         Po6snMpBj81kbs7gFisHB6dFHUs2LN3IB4E19IOmA+WYbrP4+Cn6SNLRzNZYS+uc+BD8
         foIUC04yBt78YDL10YpWQoBEmnrBEwqUeXV0iSi5gnjgeaShakw++WLYD5/AQfLdkXvI
         p3VA==
X-Gm-Message-State: AOJu0YypQnPP/FqiPfZhdYQqg/iFXMei4JMTA3q3cGi3zxsG0OLZgfT9
	RITXYddFAuXZ4vaeIJMh9r8F6afmE8mw1f10/YWJ/TMYbaqWc8r9gGzWe0HAGRg=
X-Google-Smtp-Source: AGHT+IFAqZOlDHc20yl4zCduffrqTXZO5TEJq9dnErjWksgz18FfOD/vpC5qpY6ZCJZqLnaDJ5ChqQ==
X-Received: by 2002:a05:600c:3d95:b0:431:4fbd:f571 with SMTP id 5b1f17b1804b1-4318bc8e1aemr10970115e9.13.1729769577994;
        Thu, 24 Oct 2024 04:32:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:17a2:e679:56a4:a25a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f484sm14592705e9.13.2024.10.24.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:32:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Oct 2024 13:32:47 +0200
Subject: [PATCH 4/5] gpio: sysfs: emit chardev line-state events on
 active-low changes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-gpio-notify-sysfs-v1-4-981f2773e785@linaro.org>
References: <20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org>
In-Reply-To: <20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=781;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XnelKBDV2L3pjwhf9M2fvoOno9GcTcQCBzk36loA66E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnGjBlyWyQzGnbxAarpCwmXTQ62BDPLfW2FkmRd
 1sEt7+T3ryJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxowZQAKCRARpy6gFHHX
 cgW2D/946L+i6FaZgycLVtPIWSfoY21UtUpvxZt9JAC3byWmPIQ2BZrUcnTAun7sJFvVRDVPsy5
 7zGpkJXvMBSJftbE8Iaoz4aLadyVoD+aDPsbeT6Hqlfly7t1Fb+w1Jxye3dDbw496Uajz4uR5v0
 jXEJDeQRqaX+zjm1+BqoKgUh+COKFo5GKGfmKGIVO07gGkQyIQi/IjntiTPB6LNbaSzVK240yQY
 YNjNA1kszgmzc1OMX33hNztkMPhXZ+MuGGdeNFYrf9X09hy73iC/gtyQ3mBIsNY3TqKKDBAfDRe
 jXS5l/r4aD6VdUUeHL4jJgi6pU8ZInK63OErro8unnGI0VXBaNVXvoMzIxrwnYAA1cXHZAnJ/Al
 Xc0UXw8/ZaiA0HljspmQf9/B1XdiP0tENtBYK3xfh4PHolG8k77/Yt7A/divJwga2vXfLyFC93G
 M5dRMt6ROZvVt1uoK/oZMbPAwJH/2OzqYmnIkPwluLbDzcg9iFGgtnIB7Om++q/9XMpkSP04oty
 t+KZa0P0dTLvgoLIfoSYpeaPOlnTSmKYGPUbwHnQcIXp1ESFZ2urW7f35qJG1TRiZq7R9gXxqR0
 X7ecYb4i+pjN/Sm0jG/clsbhh9bDZZQlXeswBF+wv1qad5ICn3RIRzTP0Z3fmiSGRcZxTPJkids
 J2DGBrpG5SuDrUw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The sysfs active_low attribute doesn't go through the usual paths so it
doesn't emit the line-state event. Add the missing call to
gpiod_line_state_notify() to gpio_sysfs_set_active_low().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 3f24bf278b77..b967b76ea046 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -305,6 +305,8 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 		status = gpio_sysfs_request_irq(dev, flags);
 	}
 
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+
 	return status;
 }
 

-- 
2.45.2


