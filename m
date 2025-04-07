Return-Path: <linux-gpio+bounces-18306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 155D3A7D5C5
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24B04178573
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8545522B8D1;
	Mon,  7 Apr 2025 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="l5XYa4Ye"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6586022C331
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010488; cv=none; b=LFmf6TrfQtjpvYgvSFxCrmH4IC6hJ+Dj6LyVvCTJgRcKLaNTiMWZW0YfJ65bh3BLksGJ+vUR5+vMPWvjE3phQq9fpd63JBuZTGHcNfX/Hp4kXnlBjKunbzHvlvmot3DS3R44PjJT4g7J01DzV+EaZyEexFdrhrIIpCcxLcyVebE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010488; c=relaxed/simple;
	bh=a+X2xbpBMey7kHH4SZHjVwfqMfk31JwTN71fTF53W5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lp3V9xzBln8f+TJThgNR0pZQgVnjJqiU6Xs1L0qymnY2W0/aqd6J9i0nVSZ2v8qT0YV73o/ZqCUzfzpdTcm9HIw6DujwnfYRSx2tZ4DaxzMBJ/bp8HUvUQeGpGu6S2n5J1Q8S2W85AP4Nt9C1NlJZDAWJmlY2a8qUOHpFcr7kPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=l5XYa4Ye; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso36809285e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010484; x=1744615284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtgBZ7eU2RyQ7K9QClD4KK4V7G50PAjgBWwYE6tDnr4=;
        b=l5XYa4Ye9XNYijVUo/jis9T3jp2c660XZ+HkwMH+gg+yjSEN2fYvRyHWvvVg4iKEnQ
         sOQdCb0r7PxyO3wKGHTHM0bU4yRIO4mv3UqmF+NBaR9eDcaiFxY1Do1LjYCRs+V3eA2u
         L3sFuXVNCL8aLBHt1w+AFGtqegMF8X7SKOEzn7B8Ir0KeypRYiDMyjWEvPLWOXucX9Jb
         kRYV9oUBmiT4OUXZO8BfmzLL86q5MaHk6Mx5ncqduzN2d9vuefDEiWZrcEMysiuxd/vF
         F9MKrYjQhi29wgRkqfOrq/rU0/Dp2AqHPhqYE7SLP2tE4JBILfKbKwXLNZ5OvR2VNvDU
         1PrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010484; x=1744615284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtgBZ7eU2RyQ7K9QClD4KK4V7G50PAjgBWwYE6tDnr4=;
        b=vMcdlNusFxDTE7RTIAqe3PC5NLzB5NpU/yyXSDmPA0EXZYLokO2VEVnfWeykBY7fN6
         bfEDaEzKhX1chSeJy6Ob6hl1fPfzym1hi8b90MUw5e36GzZVDUCPTvTYoUKidya3+XZT
         zpEWd+bbNiOwLJFzjYwiSyJvGb20uDJW836V33DsGzX8T4MweK4liFEP6o/7NK4QwhVi
         +kDwZusI2AxbirRZA//S4QEYgUPOMPQ0gOvOOaKiWlGcq+N2ymFwY82A8F2zVfAOvjcv
         Fpl7fxFbEHVm7b6DJJRBhRJoIl216bgK6Gky4kfHVxWNgsi3dXJLVTNj7CHdoYAVjFVz
         wmvg==
X-Forwarded-Encrypted: i=1; AJvYcCWbC4EnAx8pfGnLpvYjxffgXIHBu9BgXd/lblrbPNmULSbMHGdFa9fTUcUQ9+WYdMxSGE/u51X0SS41@vger.kernel.org
X-Gm-Message-State: AOJu0YwtWNBCqbF9sJq/zOjdbuhTozK232lghEqezMBFxUAyXyHEll5B
	QyhB2j603g1hz+zhj/wYrBKaZecvtXemS2jih13VFb7heAbtZ/K1WUtL/rwIsNYsZ/y6k/e3Uc7
	+Tzg=
X-Gm-Gg: ASbGncsBPr+qfeBWC633LHguoE3PbGm9H8tNW51Vj7LkpfZdjY5uUC5CUcY/1BIO//1
	oujztKz0K+9znf3Ud2l5lnGaQ+FGs11TE0hEvda+Y/5gLVQH6eNTjC1VpRbGA7IVIA73mBdPj+s
	N8pTpoSStnILES20l5HsqiWX6MyL6RH0tUDFrbUZlztZf14OF90Q87eLg+UHaCS37P8bDEM2VqC
	AskFNlKg03suLtgEoceWSahO9NMbHFuLLq6HehdWNrBZCZHVdQImv3G7OUGQUCFP62AcnGRiUUX
	E9s1VbRi9251RprODOlrbkIVbFbvD9KH49+kDg==
X-Google-Smtp-Source: AGHT+IEFfF6NsFb+iD2Dwb5PIsfcjTtavnPo1FW572AhfERUhpnGldlTQTty75Rd5V3CGThwZu431g==
X-Received: by 2002:a05:600c:4449:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-43ecfa18d6amr74518805e9.28.1744010484347;
        Mon, 07 Apr 2025 00:21:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbd9csm119983655e9.20.2025.04.07.00.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:21:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:21:20 +0200
Subject: [PATCH 2/2] memory: omap-gpmc: remove GPIO set() and
 direction_output() callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-memory-v1-2-5ab0282a9da7@linaro.org>
References: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jArihSAhBxkP93ay/ZjcYrFJIACv3IqWH8LZYxUU1yI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83zxZ31S8gqjE6RumdrktJc88LidiJj2N2ODy
 PHjicRRsMaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N88QAKCRARpy6gFHHX
 ctBlEACgHv2EfbXGd6EpZZRTqnj38TMqOfFUzwWMCCrTlcfcRnT54k3uqFNxJhTNeordcuXHUxP
 H3t5PtMye9H/3zNS/z1vF6QxBbk0iX93iIoapVmHYGr8q/1vf5uguVbh+rbmGngIfp4zGLO6bqJ
 MjvrcDkZ2uVd7pS+gVGe7nN2Nby0yZVBcMw6fcYLcHUmmt+hMHzvdYPeX/WEqlJYh8Qg1FIk/jA
 eAdjOZoMy8p8ccg4W+fN1KkJskmsr+WvvDujB1ElpsPDKZe8a6GpNKKHqjYIuECh6WPpTU/2gUy
 5ohToPPkGrrjRdG1QYNlVMGoYzSOhCPolc5jdjIfvTXw/RVpM1sXqRodWv30w0b7tKNkSNzCZW+
 YQ+LzxNQ+FMRUeEXE7MiPiyUF5837ryugHAvKuucndYp7iLBhgO0RTypz0x74/vvZwhuCdBR0iU
 mFiyIcY4jqZMFF8asaURPotDzhHOugldYONXW10Vt9DDzLG6jRdRQd/XMT1F3E9YrztTkgb4SvA
 wh4lX2tS4jhk9o4gKjZSDvuA2aylctO3chJKWQA7IpUpRYhfLqgkgm8lsvGfPsU48VgQ+QU+f7X
 arm0viz+ZZTgdsILX9vUwDpG5FPdSBcMkEkNoEC8L0FOXrg42PZAurLO9Hy6+wdtzb2DKFRI9g7
 pC3+JklCL61b41g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver implements an input-only GPIO controller. There's no need to
implement the set() and direction_output() callbacks in this case, the
GPIO core will handle it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/memory/omap-gpmc.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index d4fe4c5a57e7..a61e71c31f20 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2385,17 +2385,6 @@ static int gpmc_gpio_direction_input(struct gpio_chip *chip,
 	return 0;	/* we're input only */
 }
 
-static int gpmc_gpio_direction_output(struct gpio_chip *chip,
-				      unsigned int offset, int value)
-{
-	return -EINVAL;	/* we're input only */
-}
-
-static void gpmc_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			  int value)
-{
-}
-
 static int gpmc_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	u32 reg;
@@ -2417,8 +2406,6 @@ static int gpmc_gpio_init(struct gpmc_device *gpmc)
 	gpmc->gpio_chip.ngpio = gpmc_nr_waitpins;
 	gpmc->gpio_chip.get_direction = gpmc_gpio_get_direction;
 	gpmc->gpio_chip.direction_input = gpmc_gpio_direction_input;
-	gpmc->gpio_chip.direction_output = gpmc_gpio_direction_output;
-	gpmc->gpio_chip.set = gpmc_gpio_set;
 	gpmc->gpio_chip.get = gpmc_gpio_get;
 	gpmc->gpio_chip.base = -1;
 

-- 
2.45.2


