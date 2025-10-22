Return-Path: <linux-gpio+bounces-27451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4B0BFC1C8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9013B19A7A85
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1E726ED40;
	Wed, 22 Oct 2025 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGnM+U4G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C7A26ED47
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761139428; cv=none; b=kK2HUTPwGNJttwcKXKu2XfxYyJeuBiGHLJh0ISgHvnHUvIZJGHb6K1GSJw9l6oE9CZ97Kv0FwIgW0k1Uakn2jCzS59JiQIz11/OWQQznf0F5DeAepKg59Hsnq29ucgXLQZJfrZu6np1f/XVKd9Ac2J8mAGQ5we2k6n0cjzCpofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761139428; c=relaxed/simple;
	bh=ZpE/7S7GtQIALupKSOrKXj8AW6jjvgMChwr0aowCra8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZUACqvRorIFSMTxJFer2eEMERtXqNlnXFXkdFk1uN97C5fgCKWnGdM9eE9sUWJiLo43vdvVp6jgixDkZ8r38ahU72F+RSEiWgdwbkf9Ylk5oO8hQ5yzeWaAd3+AM4oWdWo+1cfOs4PddZH71HI3xT4VBrQ9jJbSn8GcPOjZbw4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGnM+U4G; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso6385649e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761139424; x=1761744224; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2GndUcYd/HXzsTZvYfLTa6i9DcqI9St8//jsAiD8//4=;
        b=oGnM+U4GdRDOan1q0TtLntdTi555D0pM50Cx0Jj9PtCghyWoiFa+3tJ7EA2gYkUicx
         rtmbqb0Rnc0AjkYl1t8DGMPaJVM7ZpLc/kTfjiiuYQf7qE1YiB2EK4VjubNBybFGwtYt
         oW0g5JTB9DHJMnF0AxKwdEnBjZKcQbZqRrZIgebRe58UOJ7qk0xczkHnor6W75b2ds82
         9v/Y4kDo+Fn/BbYUDqRez1t/95JUSf79EgDT1RzaJFi7lAlgBjYAlfj3QGk9whvR2PqO
         IH8zQeZZrkH264j7+4NGA+VfQbWf4jyS2tiEP5l3gflVVW3S/imUaplSeTAdvM4XNc7z
         KKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761139424; x=1761744224;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GndUcYd/HXzsTZvYfLTa6i9DcqI9St8//jsAiD8//4=;
        b=wEXgYCmFN3zneCWTsCVwiw2DnHOQfPeZ3BphmhhXgDTAGeGogpPM7bTmjG4qZ9js1h
         qEJN4+VIjGAhalQPhAjdkYsOL41cyZtg3HAmbrulibPZqZrYsYLzoGOI9hfheVekf6Dg
         VRJ23AYeHIkz7ea2I9CFQglMp8RhpoIw3IDhICkVsxyfxOOObSLQEUP38gaILsiJi7iI
         hbMrsCgwYlOlKJzPzhBiEKC5mHLtXlHaCQFQCS1DtEI5mcW4uN1xj/yHWAQXXhZazGy/
         OkAQUhBWF4dKNnXzj54IUWYPJsnVfXk4Kn8MknFt87gHjjYLq9iA5rGcbRv8+E/Xqx00
         3fpw==
X-Gm-Message-State: AOJu0Yyqu8HodMJZCuwjEwqbAiACPvhpiJCBdThpZfg3tcMgajH/MUk2
	PNPGkB2bZ6dsVNhOknCT3oN2ae2PA9zHIo0by3SbVtheOq+4P658ztzqSCpOAT8/eAo3UF1rsY1
	ASZh1nN8=
X-Gm-Gg: ASbGncsmDolTk5l5ffpczpHZjlihZyYmtTmSpxZz5SqTKvQZG0dArSrUFdQRs/MIUz/
	d9aIQSCQG9qDvA+G8LBmzU/HvqgUKkhO63UQe41maFlQYv+HEV5W9DcfmiUHq2A+ScN9fADdXX4
	4ODKZ/8U1lDwBiDMgUZeOz/IXyTihn1STq6KejAfnqnzpcKh0OgquW/hm2NTTWp2qVBRp+REQYW
	dVZul6vazSJ+6P/0/0rLQFqf3gPwfoV2jUu6tZ4WklhyWD31345xV4adOh+xtYa7fdSde7AG6Ew
	terKcQmGFusrF5gp26dBMiFhlxnosn9KtRDgj9ipZgV7BJoEUy2JZGoefcd6NjQ0ENnnBRuNtja
	aPJR/u0U71L9D1ceZnjhIeq+uLXcPqqTIO+/EFj05E0OuAKV7CKlzNyV2HA5qNTrU5pw8eP7oTy
	uHEbfeFmMxTAQ=
X-Google-Smtp-Source: AGHT+IEW8/J0UqlkAXfW1BzoZ0cRES7NMqkR8urgwKIzXGwVTVlxiv7ybovVkjuSq8A2Y5JDRnK76A==
X-Received: by 2002:ac2:4e0c:0:b0:590:7b29:77c8 with SMTP id 2adb3069b0e04-591d854a485mr7484711e87.17.1761139423606;
        Wed, 22 Oct 2025 06:23:43 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f2abf4b2sm291208e87.80.2025.10.22.06.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:23:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Oct 2025 15:23:42 +0200
Subject: [PATCH v3] pinctrl: pinmux: Add missing .function_is_gpio
 kerneldoc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-function-is-gpio-kerneldoc-v3-1-7f6930bebb2b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAN3a+GgC/43NwQ7CIAyA4VcxnMVAxzR48j2MB8bK1rjAApNol
 r27bCe9GNPT3zRfZ5YwEiZ23s0sYqZEwZeo9jtme+M75NSWZiCglkIq7h7eTuWIU+LdSIHfMXo
 c2mA56KZM63QDhhVgjOjoueHXW+me0hTia/uV5br9i82SS67wqJUw0FQndxnImxgOIXZsdTN8W
 AA/LSgWSgdCGK1s/W0ty/IGbCCBfBEBAAA=
X-Change-ID: 20251014-function-is-gpio-kerneldoc-29b9b9df9b2a
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This callback was undocumented, add the docs.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Still managed to leave a speling error in there, I don't believe it.
- Link to v2: https://lore.kernel.org/r/20251022-function-is-gpio-kerneldoc-v2-1-e1f200a94c5f@linaro.org

Changes in v2:
- Think over how this function is actually used and make the docs
  more useful.
- Fix grammar and words.
- Link to v1: https://lore.kernel.org/r/20251014-function-is-gpio-kerneldoc-v1-1-4e6940a2b37f@linaro.org
---
 include/linux/pinctrl/pinmux.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index 6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81..094bbe2fd6fd5ea3c5fdf5b6d6d9a7639700b50b 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -35,6 +35,16 @@ struct pinctrl_gpio_range;
  *	name can be used with the generic @pinctrl_ops to retrieve the
  *	actual pins affected. The applicable groups will be returned in
  *	@groups and the number of groups in @num_groups
+ * @function_is_gpio: determine if the indicated function selector passed
+ *	corresponds to the GPIO function which is used by the accelerated GPIO
+ *	functions @gpio_request_enable, @gpio_disable_free and
+ *	@gpio_set_direction. When the pin control core can properly determine
+ *	if a function is a GPIO function, it is easier to use the @strict mode
+ *	on the pin controller. Since a single function is passed, this is
+ *	only useful on pin controllers that use a specific function for GPIO,
+ *	and that usually presupposes that a one-group-per-pin approach is
+ *	used, so that a single function can be set on a single pin to turn
+ *	it to GPIO mode.
  * @set_mux: enable a certain muxing function with a certain pin group. The
  *	driver does not need to figure out whether enabling this function
  *	conflicts some other use of the pins in that group, such collisions

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251014-function-is-gpio-kerneldoc-29b9b9df9b2a

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


