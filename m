Return-Path: <linux-gpio+bounces-27408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D03BF8079
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 20:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2708D4E41F3
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 18:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943AA34C814;
	Tue, 21 Oct 2025 18:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZsJhADB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1DD257821
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 18:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761070620; cv=none; b=OKdrTq+JTUGs9QiDZVW7gaeQUMNoV2U2UGM5MKVU0ku5VRTI4uhFmAfzVUTOx90rkhuSZ0IWQ0VkoBeVjPhpjvFECKNAb2DULZ4cida6Gw2dR4rdUTcZ+7Sfg41yi15+SfYMcR8n4mLcAhBD0m2ilsgCDRs0ffgudXlzu2NRk98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761070620; c=relaxed/simple;
	bh=kZOWY6JMDDz6tZv9AtSD0B2cuHs83Ph+Lw30vWeNKWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSRqXqV6JuyY50u5sH65QYd5DvK6sUcsWAEMyTEcv5LRAmDvBvTmkzA8vudPPccGLFAU25Tg2QJsCDiSjutiDahtw7IHdzfTZwIVLDspJdsKJYD9ciEWlv8dnipYwQtO1C4Gfv7wi0xmf7tmAgjhOeQcBAQTDqM5DNHwp75Q0OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZsJhADB; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3ece1102998so5010016f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 11:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761070617; x=1761675417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2WcC5Yj4O8iFwcWtj14bHD/J4MzaQs1gHT8i+XN9QYA=;
        b=bZsJhADBXjsrNeC/WywuowtHzBLHS0Ve7oeJ5fi3lYk4cvN5U8mpKB8Bvk7g0jHqV6
         +snqgx5118n0Xa04tS9HhyVP7go9LxVtNI8vvc6Of5YJpNNQhfNoB8k3NCmaGcBBLh3F
         3oK8G+gHtwbUVyaLOn7yXqOjLek+GwGgGXg2RFSdAuDAVeMHI6oLrlE/3maG9M0QknGw
         I6Sg5byQLiayN7xin2JEVZKgjR1hjGxRFoQzIM8/Hk1fEpw7ndMap9y3yol8w2U+s0qy
         /M9PRga3Ia69ycGTEhCV8jZiWtj8iyLds69SH34LjzpohBbNT8AMAAhyNar1toagHLRD
         vzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761070617; x=1761675417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WcC5Yj4O8iFwcWtj14bHD/J4MzaQs1gHT8i+XN9QYA=;
        b=WVDkuEA6LRF4VW3HE86hxZAzgXCdtl32vBEzQZUoKoIYAbZQi7ZId9rha9Vghty2/j
         XvNfhjeROkXcT/JL2s9MtchCAhI+MdnPquBoAZRGSfCRGtp/d1/rVFHXj5bUCkPjxKmR
         nBpYRO2J9wpnyO3QWj1UteaX5fl8GUQscC5avfpo/PcQp9N6R7JG56rM5IhBVzOpaKQb
         wZ+/aK8z89H+eD1No5kzcgNcxBXILYDMhRvHOb7i2FxRvXn8XO2ANnkBuoDx3QmTUoGw
         AwPXhj0vK6r4mLFiJoFkQbSnm/IqcI/afHVR0FOE8bQAE7gzrcjuAV7i7wwjv8fH5uae
         lsig==
X-Forwarded-Encrypted: i=1; AJvYcCWBUfmFmHTslE6syEuGoyOHfE/+bH0My46kAXfnsxtQj6QOch9t9yyu/096tIrvKPMd34YNnWW6+ebv@vger.kernel.org
X-Gm-Message-State: AOJu0YwuQi5Bros9HNFaJOyzdaZBFUNK1JO+ZKwr5bmVPcj6cMIB0psV
	zemuiXhDibLLj/5MTM6bzRFBMCgK2ConsHOTx1lXiMGv9SBFqmrtmj1Q
X-Gm-Gg: ASbGnct/jxZSL8Gi9R2+8BU2dqsnWRqokVxihdOOPA1WMnh3DmH0FiYmgrZfrMVqSlT
	5nNb2SCsF2G8tSGOq28xIOOkBLeXcPkeMOWHfraccmJl0CBKenyi13fthoGZsbo4wUpUy1RWDrM
	MrgG2e+ada+ZEBvd3r0NnyVCFuc93kxo+qGivIxkOICogVz5HiHrzo5SQx7X6pUKaaZJjuCwFOx
	QWm1rSjU83VOzZIYSXufx7TIi9qdm3420p89C+pClwI/aRYEybA0XqBG9dLAZKz41vwZ1lRrjRW
	SFIGE6MrDdqUb94vsQD2P/2L4JqSGRNHmKAMHOHmY1oBvw30Y4Finddh8MoOrdrCokeHY9Q1vMU
	1tIxYY2H+oIjQwV4dPSgnAJCD5CgvxZSYoBDJJH0U43zTuvsx/NaBvMbaF3t3onDwGxYWx+J9nI
	hVoW9WmYp7DIBbPBgN5XqM8h96316HatE=
X-Google-Smtp-Source: AGHT+IH8ohr126cVW7kli1cWkoQTKhgJPU//PvVUWOvvxFkw5/xR/ldVcYvGM8kcSFx7OtVljK6Z/g==
X-Received: by 2002:a05:6000:2089:b0:427:608:c660 with SMTP id ffacd0b85a97d-4270608c8b7mr11681948f8f.59.1761070617066;
        Tue, 21 Oct 2025 11:16:57 -0700 (PDT)
Received: from localhost.localdomain ([39.46.217.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b3esm3936125e9.13.2025.10.21.11.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:16:56 -0700 (PDT)
From: Ali Tariq <alitariq45892@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-kernel@vger.kernel.org,
	Ali Tariq <alitariq45892@gmail.com>
Subject: [PATCH] pinctrl: starfive: use dynamic GPIO base allocation
Date: Tue, 21 Oct 2025 18:16:30 +0000
Message-ID: <20251021181631.25442-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JH7110 pinctrl driver currently sets a static GPIO base number from
platform data:

  sfp->gc.base = info->gc_base;

Static base assignment is deprecated and results in the following warning:

  gpio gpiochip0: Static allocation of GPIO base is deprecated,
  use dynamic allocation.

Set `sfp->gc.base = -1` to let the GPIO core dynamically allocate
the base number. This removes the warning and aligns the driver
with current GPIO guidelines.

Tested on VisionFive 2 (JH7110 SoC).

Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 05e3af75b09f..eb5cf8c067d1 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -938,7 +938,7 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
 	sfp->gc.set = jh7110_gpio_set;
 	sfp->gc.set_config = jh7110_gpio_set_config;
 	sfp->gc.add_pin_ranges = jh7110_gpio_add_pin_ranges;
-	sfp->gc.base = info->gc_base;
+	sfp->gc.base = -1;
 	sfp->gc.ngpio = info->ngpios;
 
 	jh7110_irq_chip.name = sfp->gc.label;
-- 
2.43.0


