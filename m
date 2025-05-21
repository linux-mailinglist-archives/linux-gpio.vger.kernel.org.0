Return-Path: <linux-gpio+bounces-20390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB61ABED01
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27EA67A78DA
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 07:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F522356B4;
	Wed, 21 May 2025 07:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2mr5M5je"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6A722D9E0
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 07:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812268; cv=none; b=MtQqTumIJB+n6kefJRbB/tr5PKM+8J91uDyx8GES/EIdMsPzAmCsLInV9oZajAnoRbpKIMPPotFaqxG10nFJCd4a9aquV3t2gDY7bxN7GFI5GUfAcJIpPW6SHzX9Ay0J3QbInwyTkPSVHh/0WZZfPBeoiW+BT8j2BLQV3Gq3qaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812268; c=relaxed/simple;
	bh=SSZC0mitB82FZFU2pushoizPNNrodpz4MhJe+R1PAp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GA374nD53qN+IdgBNmnO0a7HJbpOmYEx/sjJHpNyWXPGq+cBX+5T8Eva0MmjXPkS8YlU/tvJnpCBpKWSaGbfSLWmWXa/bjcqhxLbB1knFRGNpt44edWDv5tHhMwtnT4VKUVnKllLZT0+mUwtJMeYkdhJSLBsdGKOcovpdienr6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2mr5M5je; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a3683d8314so3323870f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 00:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747812264; x=1748417064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7tmry+gZIN6Abs3LRmBcQGrKF8Syxq0FRmSnVON+VdA=;
        b=2mr5M5jeCC8x4gYTmVkNGHebWKBBlPLUem4VJlkY97uwDKB4jKsK2JO2htT1qyCHQg
         7eWz3g10iz5D9H0nE1yQtwiyMMiNQkBDBmSLjKpi7gLwCDX5x7FkFg4ToegO3MZTrKTo
         uHJ7kRtLxNP4wPXszpCll77pb3DOQixPwnb3z3im74TjK/PrG3n/CeE64Op6+Jqp8WFi
         BFDT556y9UjTK5UxFIbKUd992Y8P+W/nfl90YUCv27wOwSi1eiR1ZIV+MOWH4aGv1tDj
         b59YxsC7kk2PtlKfNvZJtjs7DROK9r2qIUCeblETd/E9TPwYidPRnCSoPsD+9B6ASu/5
         WEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747812264; x=1748417064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tmry+gZIN6Abs3LRmBcQGrKF8Syxq0FRmSnVON+VdA=;
        b=djBQdPpzUtoBJ3gMbxbKG8GjFUn6ekRoxvaZzzDgH3NqrRxU8RWPrdv6FulJ8yh87o
         xuxzodkzqCtGU6AM5PrPapeK5422Kb8Ja+GYDi+H5pGQUn1b1g0Ww2GXAbgMeKY/vSCu
         2U8aLK2XcDAAn+Zgv+wIUfKvASnlN6aVHN/S+UQbaZegh96AiKM4iFUvYc7nuk5yrEBN
         Oobrr1+1DVA76q8mY+oIbLv4GIP4UkHB4UHMwTOOIeVroTscOzDIlQT+ROgbeEBay5mD
         8xgNCuQ0e8kqsO6BGH2KAIAHibmZLA6aU7wZ+i8icXJlVG2OXv+aMiwUQbh+bZK/5+5x
         6MQg==
X-Gm-Message-State: AOJu0YzUQSMHX7YG5HzSl13rHJi4Fxsrz8cNVWsVdveqAkbFM4WJmwox
	46maJjQtIRaDbqMr4AXYyCs0/8wcgVFRoytQevGANjWRprxKhcTNCMK16KvFrY46N0c=
X-Gm-Gg: ASbGnctSsX9EPsMHaxaynzNkub6FqYqsCxdzP/gzCeUhDwIUV58gxvM5QIX7ktZTBee
	lDDQ3ne04Aqu5QqjnKwNoVDchQthpIA2sb6eMU9ckR6/2IFRVmPbh1EZaT8qL3o1WiQrgDjz+j4
	izcKnyPKOrN4UtobtxA3QoIY/6WGtUKjdATLPpDWZzyTJ9FQwefOcYqMR8cHUmBW7GoxFJ0RA5N
	eVEKwdwTcUgfXtcYj0vBF648SLQOJAh1uFzKAiIq0bA8a1APnlmiTfV5PS3A+zFs6uCOqvmAmS1
	U+P8Wf5ZO9wIHI7DV69uGhWuaPLrXgTYMyqo7Jyv4FsCbktNt5eE
X-Google-Smtp-Source: AGHT+IGyYaRZvMP4i91OpL2d/MEyFpMwzmSlJEKLV5gVV0Yn2UjpOWp3lJXMaKAOj7C3UWJ1TLETDg==
X-Received: by 2002:a05:6000:1a88:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a3659592b3mr12867311f8f.41.1747812263764;
        Wed, 21 May 2025 00:24:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b545:3055:5b24:d6c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a364d2636bsm16188060f8f.99.2025.05.21.00.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 00:24:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Date: Wed, 21 May 2025 09:24:16 +0200
Message-ID: <20250521072416.57505-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.

Fixes: 3f50bb3124d7 ("gpio: davinci: Make irq_chip immutable")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505210606.PudPm5pC-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Another one signalled by the build bot. Peng: if you could go through
the other patches you sent and verify their dependencies are satisfied,
that would be awesome.

 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bbc71cdde9ed6..5bc31b56b5157 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -253,6 +253,7 @@ config GPIO_DAVINCI
 	tristate "TI Davinci/Keystone GPIO support"
 	default y if ARCH_DAVINCI
 	depends on ((ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || ARCH_K3)) || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to enable GPIO support for TI Davinci/Keystone SoCs.
 
-- 
2.48.1


