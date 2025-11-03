Return-Path: <linux-gpio+bounces-27945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B3EC2ACC6
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 10:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 416503A53BE
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 09:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2F72F12B6;
	Mon,  3 Nov 2025 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AmGj0Gfd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699CC2EBDCA
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162552; cv=none; b=GtjI8rhK9r/4r/w5umzRYgv+noiCP8VY7nLZg5eOklB7qIIWp8cRkdek1Oi0R5ZTxXeAyPJDMaiBzFBqq/fZafJOPEIdt7c+7c7ReJ7ltO4ICAt7BnGRaONkS0snR0Jg1k1tsJDLRSGLqq2N/AqgyGlfHiwnkzOaFoSiEG7ELNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162552; c=relaxed/simple;
	bh=X8edYpKFxJakc/RTqEB+Pipzfl1zQL02ONMlmJvW7is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8pnY4tFyuRA2zv2mSZVovHwmEZ95oXzlj656uq7Y462EgtnXASNYFS9ATyCjS7uX5A9ulwkuI4KWThAi6l6n6fevMpfXl47/g8v3f6UJGPHcvWXcIkbEo/Xy+62U7CmXF/Ngiz0LMHq+c9uICVhcSCm9Vsd7jgQiiQjGaPhzZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AmGj0Gfd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so24589475e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 01:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762162549; x=1762767349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWWTasux6nuDvfpZkvePzyRGdU+qe2S0riWlt2ij+bg=;
        b=AmGj0GfdP/mDrRKWTedw4Rgv8zuFKIaNzeDXqjZc/Vjxl9ApdUYC/iC/XYkoNgnjLs
         cWLdOFIk11hdgvjLwn/GroEnrupCzDhR8rY/Tsq/8y8FBdN21/WQ47V6kuGbRKWnBS/+
         C0Y9TnipT4Ss9ZemYRowi1f0uwIap+ICcU44Ewu2/xv302E1lCMaZnvID7dUzvIy9CDo
         zXwd9uiHcw/Uc4Ck60t2/tz8FocENU+HYV90H5GoqbL+sQVNuS+IJj3ghSsyGnByqXll
         SQcEvnAv9DFA26cpNSAH8uNPr5gFlhF3MMxbczYG9aTIFYnW9LjQd7WngEVFOdjhIi7F
         So4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762162549; x=1762767349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWWTasux6nuDvfpZkvePzyRGdU+qe2S0riWlt2ij+bg=;
        b=ahUTlwVyqNsJfB7DQDHuVetjaDBcO0gVH3ys99yWdlvsOyUlLu/QLc1NZ9OLyidt1L
         y2k9rF565UiwBVu9F3BXGuTXYylsDMGvNVMkCh0/Dh5sdr9zM/ZgXwVSf/H4ZCf41L11
         swIhD/kdhFQKMWKLKBjqFnOBnPp2/RdPgc2WpsokjY+FBW56n7RCQVl7Q2LzSM0Q2tkX
         UkvBvOhjzIfcyfb0e6j0ZE3bJtrLsUDM9LvNxKKO4hppG1bEvoVwHInzGxJunrmYmUHg
         DIMrDXUJSDTr9tPsGRoS0w7O5ZfK0sOroFOlhn6hw9wmxEOozmoCd9+X8Nis5BsAmEMf
         fz8w==
X-Gm-Message-State: AOJu0Yw2JH0Fm+ItqVP9osr0AyptSzRNkd474zy4cQTH7y6kpTEabrGJ
	HQ6CX01EPBevSUc08DoR5RinTHex8S7nV9Hgkc66rEpBGOx/P1IHIvNaqStoprHql2k=
X-Gm-Gg: ASbGncvxAsoLTdm6hz4qZg3q5UMkuKF+onrf6rZ4eQ67GEJW8SUCK12sIFCIjhj3KjQ
	kbMSB6Df0j95tjlfTZwnon8OVpJbHD6lzuDOWGzTbt/OGhp3nYjyw0965FIuPAq6P8JrjG8iLYM
	WQEUqCsU6J16CLBRJb7xW4NM+LQjGmYdYql3g9+u1YkbcR3ojXJRLusRmfzW8U5koLC2dexDrXE
	sIrVbv4INgax56B9iv3iS3p58HOcGY418Mslu7WiorzJTX9ALoWcpPIvrHn1rkM5AIdEu+WQ5//
	YiY6FKFsLwgTq7gwfJAx7q7A7dg14147l+qpYSQh1DqlRROw6ji3vSj9VXc10N7mw8YzpRKVfdk
	wDBHc95IXJFLSmRfesL/akqTbpjDcXzII6nrDRWDZhD7QyD4ANOiPR5MVu8qotI8FKKnDQs7B98
	jM5U/U
X-Google-Smtp-Source: AGHT+IHTI3Dcsqc4uC3LQQ73BmLmMpPwE9u0YqBqg1oMnpavHHPbOsA+9fvHiegS+pBrTB9gZhDBKg==
X-Received: by 2002:a05:600c:524f:b0:475:dc98:4489 with SMTP id 5b1f17b1804b1-477308be79dmr107241655e9.33.1762162548808;
        Mon, 03 Nov 2025 01:35:48 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e6eb:2a19:143f:b127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac5d6sm147285675e9.8.2025.11.03.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:35:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Nov 2025 10:35:27 +0100
Subject: [PATCH v4 07/10] reset: order includes alphabetically in
 reset/core.c
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-reset-gpios-swnodes-v4-7-6461800b6775@linaro.org>
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
In-Reply-To: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=YAQBLalSG4YSjo0vg2GdIJVruVYhGTc+UD/iGlJqB84=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCHdlq6kd9Yl07Rn0ewcMbLfCxB7GjAIR7zLAt
 imA7T5evWSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQh3ZQAKCRARpy6gFHHX
 cm57EAC3PVKe2zUsYx1icgb79Xrv0aqVB2RM1/lt2Jx7FxN8V8efLZgwbdrIdJfE7RS6qIBMIqB
 o1Z5vzbNsmLvn+N4sn8IpnoRQxKjsTpGfQG/X3CM82URbN+O/QCn3xyyhgq3XxxrTY0i9DSnzmw
 V2Akd/1BNKlHTlAnxVugDd5MDIHv4PCi6Nqs06g7QrvN+ws2Fze6GGEyEbafvGMZgKPf4MwMvT8
 A1mVQlpKRqkofi3Ux8LSedqigF6P55B07oHMs3rm19gN9LKNWT8zpKvquM+9UMqeGwLSTgYeJWn
 zfifBMxDjt/OjOYye7hW3tY0PRqdbodf4Yh9n3QrJcQ4VGEgRUCTD6B7eD+w07+odweUMDTHzeb
 1l24dscgPw9pUoWd6x2y8KtlmkcclxqPv2eL1QTR0eqxNKMsyuqYPUcUO/BZVDV01a++FyeVjcj
 S2flkLwYXCArRgyw4CcTcqtv9i5H4QvN9GCD/kWXDDHhIbdaTAZ/ZiMfYNaraUqpaDuUMyJBmbW
 lO/ZQafaV+DCPlvWjG96NwStFRLI+QkWaZC4Sn5Kb58QCd8sLLK6QkcSRQJXi5JtcDsWdpG91ul
 eN/3F0DTLN543R8fcmxjO6FO25GurrDMS8xIjiz8NRVoy6OPy4Rrbo4PAZLdtpu+/dJLjixJg+j
 pfy8Pj7guhK5R/Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For better readability and easier maintenance order the includes
alphabetically.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/reset/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 4fbaa67a6f79a4af62855c88f6b74f92c3d97159..a368b14144e7bc29ae23becab2eb7a96a4adbe44 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -4,19 +4,20 @@
  *
  * Copyright 2013 Philipp Zabel, Pengutronix
  */
+
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
-#include <linux/kernel.h>
-#include <linux/kref.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>

-- 
2.51.0


