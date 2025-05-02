Return-Path: <linux-gpio+bounces-19543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD3EAA6EDF
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 12:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3DBB1BC2C13
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 10:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96AA0238C26;
	Fri,  2 May 2025 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IIcn0eGT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B5122D7B3
	for <linux-gpio@vger.kernel.org>; Fri,  2 May 2025 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180545; cv=none; b=CkYNLX8LXsYcdR4iwaDWjB4nzAJOeZLlAHWtfjOhTYB6MikfB0jXukPhcv7Qa81YLzW8YtJEYtujkPBfH7zICpSiMMfIuM/xceZTQ5xZ3/d+JWlPLUs12AktRqguKRNOmvSqcAJLBz2vA2LYOXfQw1nd5BjQD7OlWjl7pA79UQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180545; c=relaxed/simple;
	bh=G/yQbTWKw5+TnbyriGPn4AE4fOGUPbORB3d2ncVsOCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jXwYCOVc1m4+Dx61i7scY9wXa4D8/m/CqZsG6Scuwr3+S5noJqFMZ3ZZ/JL/X06Eg2PUJ0AmEz1VqF1LBBxotdHzDWImh6JAXPmJwOxVparHFIJgyArEs5fSnLCRON0dJZ8BJk/8xCO6e4SeI1KjRVCRlyqe0kTUhqFacE6RSm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IIcn0eGT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0782d787so11501615e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 03:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746180540; x=1746785340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gpbxUH5zKXlvd7Jg421zxuNqN0FwJbinQ6smtKhC/c=;
        b=IIcn0eGT5eCAKbH1QQbSw34/ym1+9eKcNKAoGFoU3pW81hXLhYHRTV4/RcS4usiyOv
         3IBaN12KsRtIATtuVeU1O+ZS4HIEp0x4t+Q7AMvPejYSnsQbSd9/Q68uFnyr8CWZSUBM
         WXiuSsvVBN8UC7p/kWstwBbFghFLRg1ZpolkA+yJE5eH4WbK3xKmyYjULIB0HLyDhtAE
         /1SGDinetrhz/lIHhQDStXVQoY5RmqZT61r+Y9VJksOE1yt4XZIpIIezi3/kc5SY/DpU
         yOBi9FBAFbELMgUVxdkcc3I1Gjfn1e9h/z41Sox2S+2zSuHXcGbUxgerEJYs8YpkoOP5
         B2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180540; x=1746785340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gpbxUH5zKXlvd7Jg421zxuNqN0FwJbinQ6smtKhC/c=;
        b=e+yJLb7FPi0Sw9i1TFsKAIWpjehj/fcDcRa5ud32l+gEvkU9N1fqto9f/b4t6BQqXr
         gHVXnqSSwARyUfiShLpRZ8sK22tXATo/oM877fTUPxiIO6yDW1ZIA48EubMlt00jEA/z
         IPRcrHTvqnPPz8PCZ2Ts3YLp74K3sU6ChgE+He3CxfNZ7syZ0EIRHJ6X/5ldjpuMwiaG
         pbGS/aA/EjUvroYn3yNhL3HY36/+C0LSK+61xsX7sr79FTxF2JQklsCs6LRUmXhvrPMi
         XmdWD8MbkwiIU+Cx+2EsSTosvjW33IqDlOlF2hclHyYBrsPcBXj9mgIZJZRcJtbzbJrV
         181A==
X-Forwarded-Encrypted: i=1; AJvYcCWSD0vMSEVM9KnsWhP2gVSPqsvglM+64+sx1eFbVMeYNQNv4aTPqhUJve3xcuMVbRtJQGNOdt+SPzTj@vger.kernel.org
X-Gm-Message-State: AOJu0YxqX3L3vHzOTRO8413XacgZQ3sYQTSZ+21L7Uqwxh16mOTT4r2Z
	6MwUHEASZOF9GP7ALYdukSV1VWtedYsxQ5/AYgBCXZ8iXH0AZuPBYI3VIu/hn+w=
X-Gm-Gg: ASbGncurDLYuVEVR8VCnOGFW1mfM0a+gePJLOnXTKWdg5fZBlL8VjqED4n/PKXDG0AY
	5BKLlNr1zgkU7pVpHqF6I1fk2jZy1rGVfsa18HbaJ2+R4ODhaZiAk25CPnuf2K9CIEIJt+8HLWJ
	2uzD4a3q/7q0uLRt3K9gvnm2Db33RIkVKVjdF9sm0lCmMlLEuHIfw4IhQ0y9g7sP8hKVb7t2UzD
	nSz+lk1fJkKI0f9t865FD+k9lHXUQmddnCAHiwkBWHehHjZLXZz3hFov+XVeCHnFtAoX6RaRm3J
	rurkdvpRjwXj+X6xSi0hlsOgBBJUe9fmFWvcg3+bUQ==
X-Google-Smtp-Source: AGHT+IE47vfNWr5eva9bcWEHLRezwNUBG4506xXlFZEBT+W4RLMrhKjqpzQGXO7HfBEF3Nn5qo8n3Q==
X-Received: by 2002:a05:600c:348b:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-441bbf31f09mr16912665e9.25.1746180540381;
        Fri, 02 May 2025 03:09:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ee39esm39361045e9.21.2025.05.02.03.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:09:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: at91: drop unneeded dependency on OF_GPIO
Date: Fri,  2 May 2025 12:08:41 +0200
Message-ID: <20250502100841.113091-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver does not use any symbols from gpiolib-of.c. There's no
reason for it to select OF_GPIO directly. This addresses a kismet issue
reported by the build bot.

Fixes: 8e86af65f39d ("pinctrl: at91: allow building the module with COMPILE_TEST=y")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505010447.kUlI61vt-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index db84d80b7e7d3..33db9104df178 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -107,7 +107,6 @@ config PINCTRL_AT91
 	select PINMUX
 	select PINCONF
 	select GPIOLIB
-	select OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to enable the at91 pinctrl driver
-- 
2.45.2


