Return-Path: <linux-gpio+bounces-25732-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9048B48C45
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 13:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 518C17A6EB6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 11:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A035522FE15;
	Mon,  8 Sep 2025 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKl6E9OZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72692264B6;
	Mon,  8 Sep 2025 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757331277; cv=none; b=WWx8kuX4yJusX1Y8OpQt5RxBpTao3aOXOvcDvmKwY8BhamvRHz6EnXbHziIjM/pPm0S5dMFIiyG+LqeLWAbAcBUkSo8Y9fipucrGEsPgIJV9o8MDieLlN66rfus/Zt91wcOaVYM6BxjgMgt3Jo/vkVSxDazVY817ROLXUGHv+cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757331277; c=relaxed/simple;
	bh=6WiY6X64wqy0IDQMAk9kkploQbp6TQbfI/6+jSZT24s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hcO0ZiwOR/729FuVJGZlHK+vy9o7Pg7KX0SZqnpnLW42HfFJM3jm6ZAdYDMdAOe1piDoOSSpjHV5FpN9hZdNZcgssOYSEw3ajzcL/J2hPDgy7mdcTXFQttBawsO6XWMiMbpUZJMka8W8yytHbDTguNjcWNfSEPhHnzKoHaeNt38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKl6E9OZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45de6415102so7995885e9.1;
        Mon, 08 Sep 2025 04:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757331274; x=1757936074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GXLcNSM3ychZCxZIN4Cp4NC04/o4PrChSZkGJhWTGXk=;
        b=SKl6E9OZzJJo45c2QFwIFckuf+AiQAjZT9+3VDLUu8RYE8lDqWehzQfP0fXR70s6mt
         We+gHJzKvMSVcfp4VaIuNgBPv1fWKylg2lkZ1sHTqQMNr8J4yaOavQ91aFmS/MHdwsaj
         zHWO242ESaxGSv86CDa5FF8tdowbTM5i1QDpRVdi98nMt3dYKRigpU2LRKvGvYEKzXQr
         +SNhliZNIQEKXiD/P4GQou2TAJniNw9JXQqbkFJguzmlTV7fMYkZEGl0Js1niOm5oUln
         fajg3n0CohhkegD5JcqdQpKUDQmrCFLvEPy3kAmF8fhg+Eg21BVN5rQWSU+tRnwfRUv8
         F6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757331274; x=1757936074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXLcNSM3ychZCxZIN4Cp4NC04/o4PrChSZkGJhWTGXk=;
        b=lzy79/MBDBKFvcehsGzkoZVqrEv9J6boaPe1FB2dUpjQda/Qt7awcb4iISz+MOn+8I
         90IIFXkkTYW310AkoSYTDh85jXXVPvlgpzVRPIsQrxrSWvMAuEY0uzzIu5F3QkOQwqv0
         elElNtKQtC/NUKHGH9mBLE4U2wNiJtqct8d8qY14dNRIGVXAU2166KIPWVQrd1pKDw+l
         w9/Vrye7ijNvW+BHYxvWOYgH0KVSV/VIRKf8komCMJx5TO/MorUdwQ8CE8dbOl5hW4QL
         fQMadwrLHAq30E2YfsBCJAtrInaZcBHvXvMNdsghoOglUiXN77awhqTesfFFlGwpxsvO
         TLng==
X-Forwarded-Encrypted: i=1; AJvYcCUX3P7XRbvq0MQKZ5tn7UbYbrKO9xsEZg4Aj/dhZnmrLzSJHifjQpo1z7hwEDFLbGIEKguEgKu0@vger.kernel.org, AJvYcCVVDktZC23+nhyQGe0r2GjtbtWoJze9koX+10th0xfjROsnjktI8e5jaWYqJmq7lxwoyvOF5FLVXLsitvDP@vger.kernel.org, AJvYcCXDp78VXkQ2yIVvH+azUIDjd7vdSPalCRa44pMQwUaA06cCcE60wBUVlQwOsAO/jyuTaoCmXVBqBzlD@vger.kernel.org
X-Gm-Message-State: AOJu0YwXrUi17E1jXY37zTpv6lk+r/qGg4/zgYX7YiNZ8J59RoeeReyL
	dfw4O4WLnH2PO9oEnerZ6MHQOj+zIskguI4bQaBJoPebTOqBBXnxs7/v
X-Gm-Gg: ASbGncvNBCvK1RSgvR6WOha/RlAC1jh1HbgZiKRoMnklCkDyJ4vo5x3ErXv8a/5PB6C
	b4Q7QcljMG/oVfEhLroS3VeCvW20DIc9YHw/UKnqrrJwHaTfFcgwi5HFuNSpPZPNtASEdXZkJpC
	Rjn7tWBm17PCNAkBHU2rBGZXxWCa/iW8gOlQdGYO4JyrRE1gL8vmzCTAQTobYrJHHHBv5ridRqN
	3c1GvzWPvovZ7wy+nsUzNgITokuRsPBJO9zMx423jnZwih6wCZpFlfPPtGhdYBfGVyi5XZQ89SO
	hsAqL26WHhlaQOJchFGPt+e7FxxEgYyj02bSCYOko4d1LXDKBm9kfLtFc1/Yag7IJFYdAFBQmVa
	Q0ROYxA7DhYZmVwbhA851ykO1cT8+JQwNeU9VUjn0i/1tR2C8R5qvphhSDlHhOm9W7I5/QkTkQW
	8XgqlL5A==
X-Google-Smtp-Source: AGHT+IE65v8+Ze9QoGiKEzVRs4PA/d6RSnFM8u9pykGyKL2SGyoWipwe/h1BnWw8QIYeMI70RMST6A==
X-Received: by 2002:a05:600c:4708:b0:45b:7782:b4a3 with SMTP id 5b1f17b1804b1-45ddde8289amr62827505e9.14.1757331273790;
        Mon, 08 Sep 2025 04:34:33 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45de18f4824sm84683505e9.10.2025.09.08.04.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 04:34:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: airoha: fix wrong PHY LED mux value for LED1 GPIO46
Date: Mon,  8 Sep 2025 13:34:24 +0200
Message-ID: <20250908113425.31002-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In all the MUX value for LED1 GPIO46 there is a Copy-Paste error where
the MUX value is set to LED0_MODE_MASK instead of LED1_MODE_MASK.

This wasn't notice as there were no board that made use of the
secondary PHY LED but looking at the internal Documentation the actual
value should be LED1_MODE_MASK similar to the other GPIO entry.

Fix the wrong value to apply the correct MUX configuration.

Cc: stable@vger.kernel.org
Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5d84a778683d..f7f8fd2f35fc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1752,8 +1752,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1816,8 +1816,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1880,8 +1880,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1944,8 +1944,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
-- 
2.51.0


