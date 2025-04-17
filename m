Return-Path: <linux-gpio+bounces-18994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6967A9129B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 07:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D268117F869
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 05:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D90E1DDC10;
	Thu, 17 Apr 2025 05:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPvfU0RJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BBD1A9B5D
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 05:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744867334; cv=none; b=LTYoS7ag7GexT8HgPr03RT7I9ijDwqvkFRUuzXIu5aahoS5dPFkx+zosR1Uai5UFUGDT53zV00xv3oDZxnNBumn+ojIkBq+9LfxjmxsCl2E52CQrCnq6cSQbhn0BHFrek4Ei/dwgcRmvggXQiO44zjS3GZpBfu8BPGpPCDhf/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744867334; c=relaxed/simple;
	bh=gc9aMIIGw1BuCoeaVsURuUTKV59qBpC2B1jmyP/likA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VcijIOiKyXwmdISFpuY22itu+JgwRG00lfcBzYUO8r30OnMafP+0q5UE+41c8WnTLj+Nwlu28EkoueSMWaMAoVJ6S74YGG3xYZIHitWu8CBcBCBPnkMDAvoYKkt/VVbI8zfMa+PZYtXeg/bZkpJOe32juLmQAUk07cY3nZtWl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lPvfU0RJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54298ec925bso642200e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 22:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744867330; x=1745472130; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X9Mewyg14QgCOZPXoMWJj/83ky2hzYLBNDphnRhxSDg=;
        b=lPvfU0RJD9yS2j98s5D923jywcCUMFriWCQlMiPK4V1WQ+lDMM+sJQeBGPBReEsOsx
         Tk1hhhjLQKqjlAXlr5vNvdU9ZDvViMS+NvzILc9c9Jd/lKg7Z+WDpSFguB2K2t8mMAXF
         /bdnCduML/yIe13DUA5eF/e6XbaF9FSM9irqphSjkF4ZDLQzS1TO9dPXqcBaQjHvfOqB
         Uul+U1oBOR9F4hZnxnZMY8oZzDd7Hs64T3+iT3AfNUpE/+VJbNmZE/ihWTBx+hWKbONL
         UMdety615flkpWnUloGSD6GDhE08kZr3gwlBwlsW0Up7XR4KJc7pnNPPx52dUBTF+Tl8
         jQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744867330; x=1745472130;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9Mewyg14QgCOZPXoMWJj/83ky2hzYLBNDphnRhxSDg=;
        b=tBIQjREtBRlgASakuJHGOoZpndPdeH6hdl/4oAGU4t27VKTKd3t183RwbIcjxhyZEw
         WKlSFfwZ8FOrJaWijHvPGucU2/WyGX2I45RhYX/jOkJjF0fFbMuikh1D0fNcK3JH52kb
         7KggSoCHtWr9+4b2RJS+EBCVArganE5w0b9Kr9EbwpCOl0UTUqYUTzBs8ppge7ymNXvw
         F5nHwbUTxKU6guVjiE27CovF5QplrgqnIYnZhvlOFsfrhaF4JYRrGmR1IIBFDnzkS5gO
         RyNVNhqGuWYyg9rCM3pzW2z4Gp2H/Q1PHuFyVvJcM+dQdEat427T48Eg+BFi93EW4V7W
         1osA==
X-Gm-Message-State: AOJu0YyKIIjWhdotr5Tu0q3F1ZGF/Ejuaaqrz0AsOceAIEw6oZlm8ZZS
	Pqeh2qJh7RBRJadYaT9Cqnd2N0xjEoUQYHMOXHDCSozdKansms404ni6wHkAqjAkbIEqEUzroHk
	nMyM=
X-Gm-Gg: ASbGnctm6nIlvcJ8g3/Pj5Ga2tKeBV4IwZqUSaVMvmMfZ28fXKYL3EyhRtw1uIqboD3
	xlK7TVbKVONNEv266/dukVrPdW7QkHozKEewsIj6VORECF1/ICh/6os1TEL/UNq1nDsOcm8I2wI
	UJXuyt1PrWIvWpAtgLA63xZk/diDLGADz5TKfMlX9XM49Qb6Gz044SJgMsYncp0TKQWOcE2PCpT
	Unxdxv9ndss4dN3ieOGVTKorE4MX60rr7AnrsCxI6Chz/iB07hEyy+SvYL803/SNxl/jj+HLfzu
	q65aMMruizAnZK0Hmr4ptI5My1bRxDk1lZcg9mcGWoqTsW1XTYDZ3b6xs7xeWQ==
X-Google-Smtp-Source: AGHT+IFnjRCU5jdKWMlc/FIxUDQGDUCjLiUsxiG3UUz5OiZd3uQEgvmCOYBR3ZUuO9mmoL2chkEhQg==
X-Received: by 2002:a05:6512:1594:b0:549:4f0e:8e28 with SMTP id 2adb3069b0e04-54d64a9c23bmr1373006e87.15.1744867329478;
        Wed, 16 Apr 2025 22:22:09 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d430d5dd1sm1736083e87.119.2025.04.16.22.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 22:22:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 07:22:09 +0200
Subject: [PATCH] pinctr: nomadik: abx500: Restrict compile test
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-abx500-pinctrl-v1-1-0691ad29e2a6@linaro.org>
X-B4-Tracking: v=1; b=H4sIAACQAGgC/x3MQQqAIBBA0avIrBNUFKmrRAuzqQbCRCME8e5Jy
 7f4v0LGRJhhYhUSvpTpDh1yYOBPFw7ktHWDEsoILS13azFC8EjBP+niatTaeo3GWQc9igl3Kv9
 wXlr7AG4yLhRgAAAA
X-Change-ID: 20250417-abx500-pinctrl-29447c4e5a7a
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

The ABX500 module depends hard on AB8500_CORE it cannot
be compile-tested in isolation.

Fixes: 720abc5c58d8 ("pinctrl: abx500: enable building modules with COMPILE_TEST=y")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
index 2c1f8a4f5d24d116da50b7fc29f8db628170efe0..1b4fe2a4c30283b8f9914b0a71275694d46aca36 100644
--- a/drivers/pinctrl/nomadik/Kconfig
+++ b/drivers/pinctrl/nomadik/Kconfig
@@ -3,7 +3,7 @@ if (ARCH_U8500 || COMPILE_TEST)
 
 config PINCTRL_ABX500
 	bool "ST-Ericsson ABx500 family Mixed Signal Circuit gpio functions"
-	depends on AB8500_CORE || COMPILE_TEST
+	depends on AB8500_CORE
 	select GENERIC_PINCONF
 	help
 	  Select this to enable the ABx500 family IC GPIO driver

---
base-commit: ccde4ddfe04f3c01e80591f4e0a53ddb9ac7d265
change-id: 20250417-abx500-pinctrl-29447c4e5a7a

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


