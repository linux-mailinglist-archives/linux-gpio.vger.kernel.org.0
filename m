Return-Path: <linux-gpio+bounces-28081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B72C34913
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 09:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DBF334F8701
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 08:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548F32E5B2A;
	Wed,  5 Nov 2025 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wxsI0aqW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D7F2DE719
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 08:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332489; cv=none; b=WLOaXAiK+JkZMq193CfJN3N8hoIfXmS++NNtt+QT99CdGkZYHH08wmttQUjBaXwu1/BBgqRsgCSoEcbuUYnxFVLrvVs1uPUDvIzP6vENnmpBjC23wlu0gB9Qq7ynY4eqxW1kWWDfilHdleB5dTGD1WhCCK+yhDUzQ/zvaUtmVSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332489; c=relaxed/simple;
	bh=X8edYpKFxJakc/RTqEB+Pipzfl1zQL02ONMlmJvW7is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQ5Q//JdicVttIyRdvfqOhnQ0Gm1VSB7E+Y7mxn5H4F5H7AAHSMtJiLzPgAoiAwlOGv24fYtLRQU8yq8Dy6243YaUABRZwIy2dk6fTAM7SZWBZ1N45UtFt61chvEgfFrAAW2+QH7pxBodboa+QQSH02auFbcRMUyU0eIX7qFQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wxsI0aqW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee130237a8so4067339f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 00:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762332485; x=1762937285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWWTasux6nuDvfpZkvePzyRGdU+qe2S0riWlt2ij+bg=;
        b=wxsI0aqWJHp2fdcFWv+TDXXYlICmmezR4sL4ipmQirG4lHI6IlXY6X9YP45+EFYo2P
         yKoQWVpYHw9VnqlUSknz5fKWTDF+ceDX82xAYd/NQB4OMj23L9BkAh0KzJI9vzToDIHv
         3diqvJ0fhO9c/RzlUsr4r3KjjXyXjdufl0zxUcV6gHd8+RM7oUYx2riyCzVnvMe51URE
         0+suzwwpO4dkNXxuXw06UtJVhonoe4v1LSBQfEcbgjbuIGKHDV+TC7+U6lEapGiMuoqG
         XcyaCiV9AONuyntFXDUcbcHk2j5VeA/OYCSIhAI6fQhnP7pCGD3vv6ok+FgMY+TNZs6O
         ufEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762332485; x=1762937285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWWTasux6nuDvfpZkvePzyRGdU+qe2S0riWlt2ij+bg=;
        b=SHemALMosDdJa1IycEI7kcPwOFl3iO1b4JhlmyLj8bT10tRulplLgFVHdX7juNkhUv
         hwGw7gqExjroC9osELyPyGxUrb3dD5+SMP0thejYQcwkJNV7xOkbSinjQOZPVPe6RR36
         S2FEUEf3TMqXxge4FkUdNVfO/S/ncQH4xbPbBKSgnLu2ttIufGYXVQsCypDx/N8RneQr
         rlfxT2hC1E6dRkJ/c0mUR5yMXpQ8nsQIdXNckyVQfvuNRyl85Jg15nfmidqs3Y+nyQgn
         C1V+W2IlHUAfI/gpzBOOqoE8K7JHXF0A1Aark2BvgRroHkXOXDP2M1d3BX6rArN2nR75
         Z1SQ==
X-Gm-Message-State: AOJu0Yz3IuvsHrYVAMlT49Qu8H+qU+SeCUBHtFn7OFBP23BHGfXStU2V
	pGsYIAJs/rL5ZsZPN/fUZTxYKjYQHCCI56D6wybXuTWrhpxVtt30BhZ82Jthb+HnvCY=
X-Gm-Gg: ASbGncvpqqeTHb94gqRhpgv9REH10nJJ80608CM8OhOfsiTA4vvqXnKCCP4T9WhJzqg
	AbpaB3Jue4J2FY8NQYkgLA5jFYcxMKTLq26VKOQJWvhrKKDoTmogM4WE1j1oWSVqOZGhYtz6iXY
	IbROVUhHwzleRCC0aLmZAvH3oyH6+jT/sQ5VRrzgsI8uWxQgnJuHmEHT2EbQN2uhxATwfNWjzfe
	4KmwIY3CCSJkmwFAxkBqLkygAlogA8GsnxudKs8QiJPqnGZptGeSOXReRUd880s6VPAMTk1sGoz
	iGs/KytbwwawJzNVOxkdP5ZhaY5FrvfMvPuRiI/QW19ngtozlOjvx9hSZRx7rTX2hLE+jAR/3yj
	rh7iUFFhg03HFhJwqixXrbi5ZAh2WqsngtES1WR6v/ZHEueGp9sMeRrEX419gUkD+TYSsgA==
X-Google-Smtp-Source: AGHT+IFKGljAN4NkKVJIQ54D8McX8K1Nf915phMDtJjjRKpgui/5LxN2/d8VKz+lQTYKVEd42J88qA==
X-Received: by 2002:a05:6000:220e:b0:425:7c1b:9344 with SMTP id ffacd0b85a97d-429e32e91b2mr2003985f8f.15.1762332485395;
        Wed, 05 Nov 2025 00:48:05 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4e71:8371:5a52:77e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f9cdbsm9315936f8f.34.2025.11.05.00.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 00:48:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 05 Nov 2025 09:47:36 +0100
Subject: [PATCH v5 5/8] reset: order includes alphabetically in
 reset/core.c
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-reset-gpios-swnodes-v5-5-1f67499a8287@linaro.org>
References: <20251105-reset-gpios-swnodes-v5-0-1f67499a8287@linaro.org>
In-Reply-To: <20251105-reset-gpios-swnodes-v5-0-1f67499a8287@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCw8x21Ejb1yFXnz2kosAyWpBJETwb/9mWsPQJ
 itx3PJY7NCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQsPMQAKCRARpy6gFHHX
 cjpCD/4nA48zw7npFITzKnfkqKIPQbwERTmdckcuMxGRycWKQT3YIusQjBVBT6yNHbh6qxOSmBy
 C/C+uO9mPBzlHmcCpdLJwg5MAZVNZzI7U9yzYYNkrt6OFKA8FEHwL71cn4Irjsx1JemJYg4QAGQ
 kdItL1908rDm9waGQ1hf2ak7FQquQwB2E6Y+u3bwsm+OB6I+isPXtp9IIfBr81XIKFE5Zj0O7Zs
 GzRQn6eKn5/JvXDsHKP9tkwOI5mYRTYz5K3rtg7+h0PwKzv/2/dl8PzqGhexkmuH10pG8EWyqD2
 Gl+/gw7s+2gqQa1jjmiFCjBZOBrJCYn3g1R4k3u0yognbCB8FgJdIAhjxL9tfqW+EweFryz8K+F
 /eq+nADel9SQ4Qk0ZlJ8IogXH8kB53U750N/cL5u2Aj1tFaCp88ZddnSehZ8UJdso1T8EzlBAE0
 8yIcWFlwy7i8Gz4eaYrSQdTlqQ60K/2zLB5E8+tCoOkcS5PJgNvHpRuQujagaoXQUC51V5etekn
 04qvF/eSDMmsfUD1NsfNUexn8h1aTJMLL5jqCQMaK5A/QTwk1yQxIkhb/Pa/dJ8GfqveMZBeO+p
 q/Nh/Ifxg7043rVJDbsMVXFqfZ8cQEFni1RpJKjjLPmu+GrRaosIf+lOBKMyRh2NHDvDutKeH/D
 uSP3TrjJFOYNrtA==
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


