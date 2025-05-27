Return-Path: <linux-gpio+bounces-20615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBFEAC5CDD
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 00:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 969663AA7D7
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 22:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6986521770B;
	Tue, 27 May 2025 22:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLcwndHq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831652153CE;
	Tue, 27 May 2025 22:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384471; cv=none; b=R1WhKkLyopn/x/SRCfuQoN0fYjYyMmiEWum5OxVRLnlfZp8VC8G40gdFjUyK9AVvhZVOXvcQxaIUymBVUZggmujoO9P3bzsWF9AnBVCOd19kfbhuWRu+6SwYH8ZR0QuZxNkxdPw44NxUWHqycw/rbW4iwx7n+Vk2gAMU0Xh1Quo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384471; c=relaxed/simple;
	bh=S9UzBIYhErpJNG51/Ztt0ImHInbBe/SvcYUPvzGBUV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fE8k01tS+poMbJVIMqDa5vof36jXLVuZcy4XZw/v2+U+dMbxSwHciTLI8uVwwC9AGxI1DqINsfYxg52TkHn5WNqv/Xk0SgMNnYD79qut8epb3d04MEREQ6snE2fbUtbp6fgrtNzS/+XQXT+TuHKCuYLabkFhH1AxhWvpWx2xT3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLcwndHq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso41884085e9.0;
        Tue, 27 May 2025 15:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384468; x=1748989268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtRNQ56JCfgrnMcDjdIFoHIc0A/gd+Rgg9E20WRMEWg=;
        b=GLcwndHq9InENB2Tqf8r6ckKsmDJ1eS8m7fhh9jcGU7gvMjTLSlHQwiTU8or2dhWVD
         ZBMwbH/kg5hL/iDEfupyw2X1ueFUWduAKjnTgDSTZJyJq6WRE9hj8oF+bqZFpJim0Es1
         0S6jnWjovaFrU6xCoMODd1J+aQgDnMTBQ2iHap7hXVz+nMQIIz4HsKiPtPnf2utpPioR
         uZDo6bqDHXnfDG+ALcYUNQkUAJ3dcrGEbl83mrmUHIcFcEbbuI9GMBRMQp03iu/EgRlu
         GqBzmnxueujAu7gf5GMw78kiVtNWMGJG7NuBTUFdtxbUb9F0GFyjmjqXNCU40qmKNJzF
         9GUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384468; x=1748989268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtRNQ56JCfgrnMcDjdIFoHIc0A/gd+Rgg9E20WRMEWg=;
        b=bjtZHbqEKGsiNfektiufjQePl5m9HZ+lMdCzHdY6W+aIgG7BYN1QW2MuOBAq39Er8a
         IRVn0mHdKCjeKvwLzGuRjc1We8J3OhU6S+FCJ6Q3J6c/95HbZmBzgGxNTjJFkztLp1lz
         TFW6DSlee9GqUGC4/cWEFcENO7N6Af4uuRpA6V/b658fAtxmZCcEQjnc0v8NFGtOX53o
         MLpfAtJAq9rE9CuSAcKiPPjFzzGhLEULQU/wAIpCZf6aINP0OBUHEWFBNYmsMyr1LIqm
         I/JZppnNDq+xLu9Gcxz2Cs6IDPZKti62NiSUuQLrDrR4DfXJjqZzxrLEgaARFOPO6RpG
         DK1g==
X-Forwarded-Encrypted: i=1; AJvYcCUaWZQeWtJqLMI0XAWBQwDlzVgUgms9R3avmSwqYmpGz6MkclCF1ScAvgcOeNf7qwjd7DtarR/+qyXVHa/9@vger.kernel.org, AJvYcCW//i9BI2Pk3V/nD7eFTbOcJMOo1YBEuaO4+li9F0l85tu5q83dI0kYYPzObjQLwP1hHuqrARK+8cLv@vger.kernel.org, AJvYcCWTGWSuAahiLarF+6A2kbsEoGMeylCQiyy26+jexJjB2sTw+KIekKOZLBYTXv2sXoaDCV3Df+HfJ1rsLw==@vger.kernel.org, AJvYcCXB13XRpjRj2ixfc7trJch6Tdse86//XdOaYHa4GkXBoMnPAFTzStMVrk+LQ9NHJ6cVh4zvUbfx@vger.kernel.org
X-Gm-Message-State: AOJu0YybI5c2lx/TgwurXvJt3Tj1bAcYWgvTj8OijKTQd5BXX5Hx/itN
	qQxfWzHW1csWg7pLe+oZlu9lNZ5QEPQPNhmeR9m/uF5SnMHThWL3HjQr
X-Gm-Gg: ASbGncvXm3XzH3OkZjKfmOL6PqmuCjy3/e5fKDKT3ByCDE28xM5/ks573jQZBSNfi89
	wVC6PnfjN4ykZQE4Erf5e78ibHYn3ZnIhN4mHc98uVd/ZW1HIqEgpDGqlP+r7iaMCuChUolAAnD
	+7ecxn1qD8xCxBo/TD4mVfyX2Aw3TG52rJxVtxmW4D0m+6C+rOkTe5W45SBWcOdXxqR8gCZv2KT
	Er7LcdVSMsJ2fpunS6MW7LYV+R98JkafdUo04pBDKZjrYafjeXtRt2citYswsRfQRclAe3V84JV
	lVuVaiMZCan7yV7ImktzFJvJxWc8EGF/+ygn/Mm9d0KGOMlD/7GwlhvJc0F16lMUd4TAih9IhCk
	g6G44ZJttm+xU/3IyzsO2
X-Google-Smtp-Source: AGHT+IGJ4GaZDmuiWlWBMloHir3Uikj0Tke7oxruLs3NxHUz24IFjqZ/+AijntCgg1SM/vUTphqGVA==
X-Received: by 2002:adf:f192:0:b0:3a4:e629:6504 with SMTP id ffacd0b85a97d-3a4e6296763mr1500013f8f.49.1748384467687;
        Tue, 27 May 2025 15:21:07 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:06 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/6] pinctrl: airoha: fix wrong PHY LED mux value for LED1 GPIO46
Date: Wed, 28 May 2025 00:20:33 +0200
Message-ID: <20250527222040.32000-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250527222040.32000-1-ansuelsmth@gmail.com>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
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
index b97b28ebb37a..8ef7f88477aa 100644
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
2.48.1


