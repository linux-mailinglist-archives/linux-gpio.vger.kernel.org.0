Return-Path: <linux-gpio+bounces-4261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2508879939
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Mar 2024 17:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7952E283105
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Mar 2024 16:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7687E58D;
	Tue, 12 Mar 2024 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUIqdQf6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B297E562
	for <linux-gpio@vger.kernel.org>; Tue, 12 Mar 2024 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710261875; cv=none; b=IYHr0FqLvfC7Wacn7ASrkp2WrZRnwMCPV7q90b9UyHyLxnF60/VmyrfyIVpI1Y3e2Hw4vCQmsk2LKQyO8in/S/QtmqqMmOE8v5liqA2J+Eke2F68hxPnratVKG89otu4/Q5tc6RFUO5120x0KlkPsKRYvRqNlcOxwNpaaskePkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710261875; c=relaxed/simple;
	bh=Fk5uU6zyYhx9aDWa29dx7h/E1IBtrqs1lxiuHV1hx+I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cywytIz5Z9HC1h+hORl2Ye4HZnZG4HyE0jsrbU4yMJpRfrjwO8iAW1wFCu9ojCzwIM4XmnLMGnsEkzy6eokmK82DtMap3VmSRoOqM92MLM5BigMOPOJJoEQ1ujP6nWPOwT5zHpZHM7sHg2XEpO4SoPJ5KoWmn6ezmXjQTbuUsuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUIqdQf6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41332a43ff7so8259995e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Mar 2024 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710261872; x=1710866672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oPefyJv3jgaXiRguSmpPsTI+6ju8zR2VGnAxsg3uNes=;
        b=BUIqdQf6YgqZWldQGMZ+LoQgbe+U37cF7IXXxAXX4xnSEW/IILi8mkmNpzR502bVTP
         fGEdHo209WCqwa+O6TEr2fEwycDi9uXgqNnPjDXAPGW7JPATU6a7pgAshsYy36LTvU0/
         1r5SXT0vrT+MSUsBvmL8unrrX9d1mvve2QICV/HKTwjsTnRlzU4NRORRABUnazDKrzCg
         IA+xuNwbAsErKaAr9NFsTZuERsFfCYHzuGrASX5c4NSs4fWQgUoa1hLitzcoGVgUMC3T
         RcaohZ1qIFVCzzC8Af4+X7gyXFEE5csqoE8NVakMm0HvOAf5xNSt4x0oWm6IT61vKNw+
         PT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710261872; x=1710866672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPefyJv3jgaXiRguSmpPsTI+6ju8zR2VGnAxsg3uNes=;
        b=EvOjtqQbtN4EyXPhRnT7EHoypXiZiqf8pQbPZXrMF7gE24MJ387+gbF+xewaFEEgR/
         7jZrj3BjcYoCpSpm1S7l8WOCJEedyjL9Bxemf1WrMjkLkN3CAsuvlg09ObNqO26Dq2a7
         a2qrKQrIpGxqhH72EGHd8VZVS1VvbjQzihbSKnjx6XtOWjQD/GQtjjEhmVu5ocZ4g1q7
         QlTJC8JTetCZtU0ebX16/0LB4wtunlz9IgYUZMz/C5d5nlstBlA+CVnRPh5UorsSTGpj
         l12iqz61ljGzit4SkrqlYCa2UVr7GhBqbPOVRXPsfgBiW0PHwBdCrQ5OmAI3GQWQG2LJ
         +FmA==
X-Forwarded-Encrypted: i=1; AJvYcCX/TBqZTGqD3isgFKGbq3HOpNFG6X0s0t9HzDI7eZyQrYdTELwYkz7Mr7Ed6K1PwNFI/2X/0kCWCh/wusUi9t9MfcPDi0Vbc2UByw==
X-Gm-Message-State: AOJu0YyexteeXTLXeI9K1qE6EeTd+QC4TMJpFE8FT1QtPUZ/enHYPEkO
	D5UJ/ry1esMM0E3wUrfjmkfUi4wySdv2KvTOrDlc6lxSGQ4n1gx608mDSVj96RM=
X-Google-Smtp-Source: AGHT+IEtDsLFmjCpNfll0bAX3QNgUNur7x4HOTS/D64waENoYVf59bNQE3ZkStaCiq9GSZnT8fRNQg==
X-Received: by 2002:a05:600c:3542:b0:412:ebce:4166 with SMTP id i2-20020a05600c354200b00412ebce4166mr6854781wmq.32.1710261871974;
        Tue, 12 Mar 2024 09:44:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id o17-20020a05600c4fd100b00413320f795fsm3231986wmq.35.2024.03.12.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 09:44:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: samsung: drop unused header with register constants
Date: Tue, 12 Mar 2024 17:44:28 +0100
Message-Id: <20240312164428.692552-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bindings header for Samsung pin controller DTS pin values (holding
register values in fact) was deprecated in v6.1 kernel in
commit 9d9292576810 ("dt-bindings: pinctrl: samsung: deprecate header
with register constants").  This was enough of time for users to switch
to in-DTS headers, so drop the bindings header.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS                           |  1 -
 include/dt-bindings/pinctrl/samsung.h | 95 ---------------------------
 2 files changed, 96 deletions(-)
 delete mode 100644 include/dt-bindings/pinctrl/samsung.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b033dec77f3a..bd60d3ce5d46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17471,7 +17471,6 @@ C:	irc://irc.libera.chat/linux-exynos
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
 F:	Documentation/devicetree/bindings/pinctrl/samsung,pinctrl*yaml
 F:	drivers/pinctrl/samsung/
-F:	include/dt-bindings/pinctrl/samsung.h
 
 PIN CONTROLLER - SINGLE
 M:	Tony Lindgren <tony@atomide.com>
diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
deleted file mode 100644
index d1da5ff68d0c..000000000000
--- a/include/dt-bindings/pinctrl/samsung.h
+++ /dev/null
@@ -1,95 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Samsung's Exynos pinctrl bindings
- *
- * Copyright (c) 2016 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- * Author: Krzysztof Kozlowski <krzk@kernel.org>
- */
-
-#ifndef __DT_BINDINGS_PINCTRL_SAMSUNG_H__
-#define __DT_BINDINGS_PINCTRL_SAMSUNG_H__
-
-/*
- * These bindings are deprecated, because they do not match the actual
- * concept of bindings but rather contain pure register values.
- * Instead include the header in the DTS source directory.
- */
-#warning "These bindings are deprecated. Instead use the header in the DTS source directory."
-
-#define EXYNOS_PIN_PULL_NONE		0
-#define EXYNOS_PIN_PULL_DOWN		1
-#define EXYNOS_PIN_PULL_UP		3
-
-#define S3C64XX_PIN_PULL_NONE		0
-#define S3C64XX_PIN_PULL_DOWN		1
-#define S3C64XX_PIN_PULL_UP		2
-
-/* Pin function in power down mode */
-#define EXYNOS_PIN_PDN_OUT0		0
-#define EXYNOS_PIN_PDN_OUT1		1
-#define EXYNOS_PIN_PDN_INPUT		2
-#define EXYNOS_PIN_PDN_PREV		3
-
-/* Drive strengths for Exynos3250, Exynos4 (all) and Exynos5250 */
-#define EXYNOS4_PIN_DRV_LV1		0
-#define EXYNOS4_PIN_DRV_LV2		2
-#define EXYNOS4_PIN_DRV_LV3		1
-#define EXYNOS4_PIN_DRV_LV4		3
-
-/* Drive strengths for Exynos5260 */
-#define EXYNOS5260_PIN_DRV_LV1		0
-#define EXYNOS5260_PIN_DRV_LV2		1
-#define EXYNOS5260_PIN_DRV_LV4		2
-#define EXYNOS5260_PIN_DRV_LV6		3
-
-/*
- * Drive strengths for Exynos5410, Exynos542x, Exynos5800 and Exynos850 (except
- * GPIO_HSI block)
- */
-#define EXYNOS5420_PIN_DRV_LV1		0
-#define EXYNOS5420_PIN_DRV_LV2		1
-#define EXYNOS5420_PIN_DRV_LV3		2
-#define EXYNOS5420_PIN_DRV_LV4		3
-
-/* Drive strengths for Exynos5433 */
-#define EXYNOS5433_PIN_DRV_FAST_SR1	0
-#define EXYNOS5433_PIN_DRV_FAST_SR2	1
-#define EXYNOS5433_PIN_DRV_FAST_SR3	2
-#define EXYNOS5433_PIN_DRV_FAST_SR4	3
-#define EXYNOS5433_PIN_DRV_FAST_SR5	4
-#define EXYNOS5433_PIN_DRV_FAST_SR6	5
-#define EXYNOS5433_PIN_DRV_SLOW_SR1	8
-#define EXYNOS5433_PIN_DRV_SLOW_SR2	9
-#define EXYNOS5433_PIN_DRV_SLOW_SR3	0xa
-#define EXYNOS5433_PIN_DRV_SLOW_SR4	0xb
-#define EXYNOS5433_PIN_DRV_SLOW_SR5	0xc
-#define EXYNOS5433_PIN_DRV_SLOW_SR6	0xf
-
-/* Drive strengths for Exynos850 GPIO_HSI block */
-#define EXYNOS850_HSI_PIN_DRV_LV1	0	/* 1x   */
-#define EXYNOS850_HSI_PIN_DRV_LV1_5	1	/* 1.5x */
-#define EXYNOS850_HSI_PIN_DRV_LV2	2	/* 2x   */
-#define EXYNOS850_HSI_PIN_DRV_LV2_5	3	/* 2.5x */
-#define EXYNOS850_HSI_PIN_DRV_LV3	4	/* 3x   */
-#define EXYNOS850_HSI_PIN_DRV_LV4	5	/* 4x   */
-
-#define EXYNOS_PIN_FUNC_INPUT		0
-#define EXYNOS_PIN_FUNC_OUTPUT		1
-#define EXYNOS_PIN_FUNC_2		2
-#define EXYNOS_PIN_FUNC_3		3
-#define EXYNOS_PIN_FUNC_4		4
-#define EXYNOS_PIN_FUNC_5		5
-#define EXYNOS_PIN_FUNC_6		6
-#define EXYNOS_PIN_FUNC_EINT		0xf
-#define EXYNOS_PIN_FUNC_F		EXYNOS_PIN_FUNC_EINT
-
-/* Drive strengths for Exynos7 FSYS1 block */
-#define EXYNOS7_FSYS1_PIN_DRV_LV1	0
-#define EXYNOS7_FSYS1_PIN_DRV_LV2	4
-#define EXYNOS7_FSYS1_PIN_DRV_LV3	2
-#define EXYNOS7_FSYS1_PIN_DRV_LV4	6
-#define EXYNOS7_FSYS1_PIN_DRV_LV5	1
-#define EXYNOS7_FSYS1_PIN_DRV_LV6	5
-
-#endif /* __DT_BINDINGS_PINCTRL_SAMSUNG_H__ */
-- 
2.34.1


