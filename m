Return-Path: <linux-gpio+bounces-15516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681AAA2BDEA
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 09:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9073C3A2CA1
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 08:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1255419F13B;
	Fri,  7 Feb 2025 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eeoIgaWp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C9017C208
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917036; cv=none; b=p58YX8/lFSTQqRV2qHkYz/yUTJhmQQYmWfGYoHWFNLxPSiKi2u0iIeUulnYWbGBNb3xYXI6O1za5Z4QJKN+CnkUK/pOh1F8240ue1NNuCy8C9Imhlh2QLxjGVjYtmzLi83pkr703324RvdVkRwlaEUaWa2ZcM5SQfaMd8AEVHBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917036; c=relaxed/simple;
	bh=3d5+Y4uR8zcFm5IfpgDo9porvzDL1xbawGz9puR1NZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nKkjd6MwtF8qhjPS+rwj5llgw8M96SXl2abKHn5IBj58txInF8TSyaYAczvvlghd3IJZM9kZ0p5OZeKrKMtv1wn2My5vRDWvcO/trvI24nUEOpWd3KOG73f6vW7VBfsYEv+78eiJX6SgaXho/O0R4VeJwoyC4El+fB82+chZVRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eeoIgaWp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43622267b2eso17866215e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 00:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738917033; x=1739521833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=73Bx6sMUjpDwcY4TcpO+hq8L+ySz1RxtLedlR3Xlx8I=;
        b=eeoIgaWpZvTPdLQfMP+e6O5X0hbRVt2/c/exgY75+7V2g2FbABfTD1QrYa5hIv+rBo
         Bnszcjtow+wQKMGdwv/8Ptr+M0oN7mjjq/8Rgh9pWmAp74Qdskvdy80HAXYSj3bvQk7L
         Gemsk++aSJiGt6o3kOLaGQRL+UWCvAHaCETphwjDcwKYzK8cDgwB8saogIN+jLaia004
         vTfoc+BlWm2kChfbFP0m2MoJtZwnhxb2P15BTrzaDlW70Q1uSCA1V8/8/kJiL3ZgubDQ
         40F7rETv2OLhHx9z+5k3porlCniTdMHez04Kq0nJDgzFXBud/lp+CqMp6GebEOTWB8z8
         M5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917033; x=1739521833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73Bx6sMUjpDwcY4TcpO+hq8L+ySz1RxtLedlR3Xlx8I=;
        b=VvuYE20ek13L5WM3j4jiq8DHO0gOkiI0RyLqYmq9jmmNMd1hHP3xA/qPLraU+OcZRW
         RcByUXKhePxw6CtYhGlP2z/NvO3jUZjX9F3RXKtIdTnZhNsXvT4xZJKCcL3x8+hhLlk0
         IpwKOrYqn6BC51z4GiCbqe2uK2Sm1vCSWMSf9i9CGmBXFxJs4b3dBWxf1UbPkawU2Xfl
         ik4LygCdCqb2m204itbHCcmNyRpnpTYW+/u0RQQBcPLB3s+HnV0lV4Gn+Vn0r8PhjzZ9
         P7RUpMwPe2vMlf2igKQnajqW3af1+QAUUbhOlQQtwk3fiT+eTQyZCcpysOWF8RvLPxbh
         SFRw==
X-Gm-Message-State: AOJu0YwwfsfBVGtfaHRWSQR9d/QdfkGHpQhfBnO8OJVQigkDrVIXeZeL
	nK1cGT36k3TzpFrfDSuZa3Q6Sl0FZv50dRDNm4pZ5VMutaDG34f4qmomUe9kLZk=
X-Gm-Gg: ASbGnctCPqe1QW1qrXFfrd6iqYGaczcTkR0vSdkI+FYHmQVbVIFMf77Aha++BNmLOub
	3uUYkQl5dfRXdJAfpWQkIr7Uf9Po1ic3dkdLmoJ64cnZtTkI52Xx+1THHik8E2sWJldzg4Jxj2Y
	+VFGAiZ+V/kRK4K6lflp9lp6h06ywEVWvJXlCcNJibDuNHTR4gmKxzXlfOsxUvRI/inRj6Wd65D
	2fKsgjXogAQ0vaeT9yCwTmRNQj/t1jJ+I6APogAGWvPgOI24m6V0pEueQhMtAS7P/6GGdN3FU0Y
	yNwfc9evFPmUWw==
X-Google-Smtp-Source: AGHT+IEokqIBuLTvDSKYe/t0RdgRU4F+oz32fcFnrb8Lmu+kXbvW+w42zMkOLpDsbFOK/Apc5zfIJg==
X-Received: by 2002:a05:600c:1547:b0:438:e256:a77d with SMTP id 5b1f17b1804b1-439249921f0mr21475505e9.15.1738917033411;
        Fri, 07 Feb 2025 00:30:33 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ae69:c28e:8e23:dca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc888csm45566155e9.27.2025.02.07.00.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:30:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: add missing include
Date: Fri,  7 Feb 2025 09:30:30 +0100
Message-ID: <20250207083030.17698-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With some randconfigs I'm seeing the following error:

In file included from drivers/gpio/gpiolib-swnode.c:19:
./include/linux/gpio/consumer.h: In function ‘gpiod_enable_hw_timestamp_ns’:
./include/linux/gpio/consumer.h:557:17: error: implicit declaration of function ‘WARN_ON’ [-Wimplicit-function-declaration]
  557 |                 WARN_ON(desc);
      |                 ^~~~~~~

Pull in bug.h to fix it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/consumer.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edb..0b1acd014186 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,6 +3,7 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
+#include <linux/bug.h>
 #include <linux/types.h>
 
 struct acpi_device;
-- 
2.45.2


