Return-Path: <linux-gpio+bounces-11186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F8D99A354
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89EF7285F37
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 12:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C43F2194A6;
	Fri, 11 Oct 2024 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKQiCiB6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7AC212F13;
	Fri, 11 Oct 2024 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648383; cv=none; b=Y3ndcctQ5lFsEGqOZrbajACU0ZsFOImgBuZmTQ1LzH9n1qS7WC0UmvvC+W2lYr4815+YHSADqdN61uqV2GpxezlCb7F/O7JMQ+tYBHbxY3HfLxee+3/l+Ri4+RI+0iDHXpfpvO8CfqivxIsAs0EFgH5dP4aRpX/jsUgSGa+IsD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648383; c=relaxed/simple;
	bh=QtRVSEbu05JeEzOJiSEA1lppPfWOR1PEqgrjS1p/kCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=duP0CAEg+9t2neiaZF2wsrLVjoJIJ+F77qg9FSj+dB6kWADAvce7GFuLCpmSoII6dUwTrNc6CeBL7d5n6AM/HJ5OVgejpaNU+hqlfqH4D85p955v+eNCOA/ahyPHeP6C8Yzv5vt9KLTbeytizibUBSrDHQz1E8Kv3Fq9CzG34R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKQiCiB6; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c8af23a4fcso2531977a12.0;
        Fri, 11 Oct 2024 05:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648378; x=1729253178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf70HhnEAJwO7Tk+1v0Q294VCbe6pC8nPQltZmEkfSA=;
        b=FKQiCiB67REmlxLsCekOqMBVIN9PJDrnTX1X84/Ceq5kwTwmW/otO0brlQc6FgrWnc
         FOKcZxjdbPFkwbE1RVPvQrkHAG/XwcCmWdV9gtKH+vuMSBAVjkdfx9DBh92662ZecMCA
         flXxE+Z2nlL92A2TKhFJ7ArkOQ1Pi6ZyA2tqTCH70DYpC779B0eq90YfgiM7V0Ga2Lf7
         cRzyF7L4FOu7zDeWKaiJE43R8CN/syTrYRH6s4sso+Gv1s5NMPnGqFTK4eddwygBG/N7
         tGYGCVclD5Y92yfsbuBKFeZmr0jSDzv1vQObXvJ7TO5HKnG6EerXDEsWmX63oK/hTnoZ
         91AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648378; x=1729253178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sf70HhnEAJwO7Tk+1v0Q294VCbe6pC8nPQltZmEkfSA=;
        b=AoFd9H5KKTw43ElOBSV8Fd6CRM+7lAwVQMlPqyibkhOo5us35Api3CKEWxkKFf5Zdg
         9qIfvHbssK4EL2Iv3aWNXuz8iO0egosGYP3OTP7AUEcNJi/mwnUMDZI4aWQdvjkSEh2/
         4xUF9RhC+xvxe8ZErHGXGIs9VVkvEKqvTYX7qGMPlxdCeg2RAxCPrA0IWIornav2vXDy
         1p0WMX3WFkfeX2BAy2t2TcmvI/7Bj1kTaIsoo0ymdIO5FdL0wX5X9W0GmWj8o39/oYml
         HkoJkd7/Cfh7v89btCpp+UambQ2KdHH/7+SaNmCRoHBK4NKnVDo4WK/vZZmEMpKqv4O8
         jHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV02bLbXv55qgT+gz1aZNZB4IHVda4fkrku4PXWkhbUctgCaMig/dydw4A+O2Kcu1jKDXLKWdwvIKPeZQ==@vger.kernel.org, AJvYcCWPfM0RGXgf2XaHxzQRVWqC4tSaq1RmDhXjCdpa3TEhLxQYVm4gnN2lIk4jxriApe/APz/VJ3VhKnRf@vger.kernel.org, AJvYcCXLcc7TuEZBWoJkUsaijG6HCo3Q8ijr/mFH7BDTc8UhFp6yJe5m6dgaouVOawmbj83G47yVU/dwGBDny5WA@vger.kernel.org
X-Gm-Message-State: AOJu0YytuDxLA/ZjSLMymvD7j+FejaqYB+fnatsQFI6s7wqrlIMslhLV
	GSKe+J2cBCIANwOmcrsrWN0FJ8cs9TqueVp0qikBlGvKQNmgiXsU
X-Google-Smtp-Source: AGHT+IEDQgHWY3UCMK/PCbWJe2ncT331qGX1W5rg8jh8c22DwBU9dM+gefhRPeVNaZ1v3t23PT5kZg==
X-Received: by 2002:a17:907:94d3:b0:a99:5560:a84f with SMTP id a640c23a62f3a-a99b93cb708mr213120366b.31.1728648377167;
        Fri, 11 Oct 2024 05:06:17 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:06:16 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 6/8] dt-bindings: pinctrl: mediatek: Add bindings for MT6735 pin controller
Date: Fri, 11 Oct 2024 15:03:51 +0300
Message-ID: <20241011120520.140318-7-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add DT bindings for the MT6735 pin controller, which consist of macros
to be used as values for the pinmux property. Each macro corresponds
to a unique possible pin-function combination.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 MAINTAINERS                                   |    6 +
 .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++++++++++++++
 2 files changed, 1154 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e336dab6fdd1a..f95ae886f9fd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18311,6 +18311,12 @@ F:	drivers/pinctrl/mediatek/pinctrl-rt2880.c
 F:	drivers/pinctrl/mediatek/pinctrl-rt305x.c
 F:	drivers/pinctrl/mediatek/pinctrl-rt3883.c
 
+PIN CONTROLLER - MEDIATEK MT6735
+M:	Yassine Oudjana <y.oudjana@protonmail.com>
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
+
 PIN CONTROLLER - MICROCHIP AT91
 M:	Ludovic Desroches <ludovic.desroches@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h b/include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
new file mode 100644
index 0000000000000..1134caf9022c5
--- /dev/null
+++ b/include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
@@ -0,0 +1,1148 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H__
+#define __DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H__
+
+#include "mt65xx.h"
+
+#define PINMUX_GPIO0__FUNC_GPIO0			(MTK_PIN_NO(0) | 0)
+#define PINMUX_GPIO0__FUNC_IDDIG			(MTK_PIN_NO(0) | 1)
+#define PINMUX_GPIO0__FUNC_DPI_D4			(MTK_PIN_NO(0) | 2)
+#define PINMUX_GPIO0__FUNC_CLKM4			(MTK_PIN_NO(0) | 3)
+#define PINMUX_GPIO0__FUNC_EXT_FRAME_SYNC		(MTK_PIN_NO(0) | 4)
+#define PINMUX_GPIO0__FUNC_PWM3				(MTK_PIN_NO(0) | 5)
+#define PINMUX_GPIO0__FUNC_KCOL2			(MTK_PIN_NO(0) | 6)
+#define PINMUX_GPIO0__FUNC_C2K_ARM_EINT0		(MTK_PIN_NO(0) | 7)
+
+#define PINMUX_GPIO1__FUNC_GPIO1			(MTK_PIN_NO(1) | 0)
+#define PINMUX_GPIO1__FUNC_PWM2				(MTK_PIN_NO(1) | 1)
+#define PINMUX_GPIO1__FUNC_DPI_D5			(MTK_PIN_NO(1) | 2)
+#define PINMUX_GPIO1__FUNC_MD_EINT0			(MTK_PIN_NO(1) | 3)
+#define PINMUX_GPIO1__FUNC_TDD_TDO			(MTK_PIN_NO(1) | 4)
+#define PINMUX_GPIO1__FUNC_CONN_MCU_TDO			(MTK_PIN_NO(1) | 5)
+#define PINMUX_GPIO1__FUNC_PTA_RXD			(MTK_PIN_NO(1) | 6)
+#define PINMUX_GPIO1__FUNC_C2K_ARM_EINT1		(MTK_PIN_NO(1) | 7)
+
+#define PINMUX_GPIO2__FUNC_GPIO2			(MTK_PIN_NO(2) | 0)
+#define PINMUX_GPIO2__FUNC_CLKM0			(MTK_PIN_NO(2) | 1)
+#define PINMUX_GPIO2__FUNC_DPI_D6			(MTK_PIN_NO(2) | 2)
+#define PINMUX_GPIO2__FUNC_MD_EINT0			(MTK_PIN_NO(2) | 3)
+#define PINMUX_GPIO2__FUNC_USB_DRVVBUS			(MTK_PIN_NO(2) | 4)
+#define PINMUX_GPIO2__FUNC_CONN_MCU_DBGACK_N		(MTK_PIN_NO(2) | 5)
+#define PINMUX_GPIO2__FUNC_PTA_TXD			(MTK_PIN_NO(2) | 6)
+#define PINMUX_GPIO2__FUNC_C2K_ARM_EINT2		(MTK_PIN_NO(2) | 7)
+
+#define PINMUX_GPIO3__FUNC_GPIO3			(MTK_PIN_NO(3) | 0)
+#define PINMUX_GPIO3__FUNC_CLKM1			(MTK_PIN_NO(3) | 1)
+#define PINMUX_GPIO3__FUNC_DPI_D7			(MTK_PIN_NO(3) | 2)
+#define PINMUX_GPIO3__FUNC_SPI_MIB			(MTK_PIN_NO(3) | 3)
+#define PINMUX_GPIO3__FUNC_MD_EINT0			(MTK_PIN_NO(3) | 4)
+#define PINMUX_GPIO3__FUNC_CONN_MCU_DBGI_N		(MTK_PIN_NO(3) | 5)
+#define PINMUX_GPIO3__FUNC_CONN_MCU_AICE_TMSC		(MTK_PIN_NO(3) | 6)
+#define PINMUX_GPIO3__FUNC_C2K_ARM_EINT3		(MTK_PIN_NO(3) | 7)
+
+#define PINMUX_GPIO4__FUNC_GPIO4			(MTK_PIN_NO(4) | 0)
+#define PINMUX_GPIO4__FUNC_CLKM2			(MTK_PIN_NO(4) | 1)
+#define PINMUX_GPIO4__FUNC_DPI_D8			(MTK_PIN_NO(4) | 2)
+#define PINMUX_GPIO4__FUNC_SPI_MOB			(MTK_PIN_NO(4) | 3)
+#define PINMUX_GPIO4__FUNC_TDD_TCK			(MTK_PIN_NO(4) | 4)
+#define PINMUX_GPIO4__FUNC_CONN_MCU_TCK_0		(MTK_PIN_NO(4) | 5)
+#define PINMUX_GPIO4__FUNC_CONN_MCU_AICE_TCKC		(MTK_PIN_NO(4) | 6)
+#define PINMUX_GPIO4__FUNC_C2K_DM_EINT0			(MTK_PIN_NO(4) | 7)
+
+#define PINMUX_GPIO5__FUNC_GPIO5			(MTK_PIN_NO(5) | 0)
+#define PINMUX_GPIO5__FUNC_UCTS2			(MTK_PIN_NO(5) | 1)
+#define PINMUX_GPIO5__FUNC_DPI_D9			(MTK_PIN_NO(5) | 2)
+#define PINMUX_GPIO5__FUNC_SPI_CSB			(MTK_PIN_NO(5) | 3)
+#define PINMUX_GPIO5__FUNC_TDD_TDI			(MTK_PIN_NO(5) | 4)
+#define PINMUX_GPIO5__FUNC_CONN_MCU_TDI			(MTK_PIN_NO(5) | 5)
+#define PINMUX_GPIO5__FUNC_I2S1_DO			(MTK_PIN_NO(5) | 6)
+#define PINMUX_GPIO5__FUNC_MD_URXD			(MTK_PIN_NO(5) | 7)
+
+#define PINMUX_GPIO6__FUNC_GPIO6			(MTK_PIN_NO(6) | 0)
+#define PINMUX_GPIO6__FUNC_URTS2			(MTK_PIN_NO(6) | 1)
+#define PINMUX_GPIO6__FUNC_DPI_D10			(MTK_PIN_NO(6) | 2)
+#define PINMUX_GPIO6__FUNC_SPI_CKB			(MTK_PIN_NO(6) | 3)
+#define PINMUX_GPIO6__FUNC_TDD_TRSTN			(MTK_PIN_NO(6) | 4)
+#define PINMUX_GPIO6__FUNC_CONN_MCU_TRST_B		(MTK_PIN_NO(6) | 5)
+#define PINMUX_GPIO6__FUNC_I2S1_LRCK			(MTK_PIN_NO(6) | 6)
+#define PINMUX_GPIO6__FUNC_MD_UTXD			(MTK_PIN_NO(6) | 7)
+
+#define PINMUX_GPIO7__FUNC_GPIO7			(MTK_PIN_NO(7) | 0)
+#define PINMUX_GPIO7__FUNC_UCTS3			(MTK_PIN_NO(7) | 1)
+#define PINMUX_GPIO7__FUNC_DPI_D11			(MTK_PIN_NO(7) | 2)
+#define PINMUX_GPIO7__FUNC_SDA1				(MTK_PIN_NO(7) | 3)
+#define PINMUX_GPIO7__FUNC_TDD_TMS			(MTK_PIN_NO(7) | 4)
+#define PINMUX_GPIO7__FUNC_CONN_MCU_TMS			(MTK_PIN_NO(7) | 5)
+#define PINMUX_GPIO7__FUNC_I2S1_BCK			(MTK_PIN_NO(7) | 6)
+#define PINMUX_GPIO7__FUNC_TDD_TXD			(MTK_PIN_NO(7) | 7)
+
+#define PINMUX_GPIO8__FUNC_GPIO8			(MTK_PIN_NO(8) | 0)
+#define PINMUX_GPIO8__FUNC_URTS3			(MTK_PIN_NO(8) | 1)
+#define PINMUX_GPIO8__FUNC_C2K_UIM0_HOT_PLUG_IN		(MTK_PIN_NO(8) | 2)
+#define PINMUX_GPIO8__FUNC_SCL1				(MTK_PIN_NO(8) | 3)
+#define PINMUX_GPIO8__FUNC_PCM1_DO1			(MTK_PIN_NO(8) | 4)
+#define PINMUX_GPIO8__FUNC_MD_EINT1			(MTK_PIN_NO(8) | 5)
+#define PINMUX_GPIO8__FUNC_KCOL4			(MTK_PIN_NO(8) | 6)
+#define PINMUX_GPIO8__FUNC_UTXD0			(MTK_PIN_NO(8) | 7)
+
+#define PINMUX_GPIO9__FUNC_GPIO9			(MTK_PIN_NO(9) | 0)
+#define PINMUX_GPIO9__FUNC_C2K_UIM1_HOT_PLUG_IN		(MTK_PIN_NO(9) | 1)
+#define PINMUX_GPIO9__FUNC_PCM1_DO0			(MTK_PIN_NO(9) | 2)
+#define PINMUX_GPIO9__FUNC_I2S3_MCK			(MTK_PIN_NO(9) | 3)
+#define PINMUX_GPIO9__FUNC_MD_EINT2			(MTK_PIN_NO(9) | 4)
+#define PINMUX_GPIO9__FUNC_CLKM2			(MTK_PIN_NO(9) | 5)
+#define PINMUX_GPIO9__FUNC_I2S1_MCK			(MTK_PIN_NO(9) | 6)
+#define PINMUX_GPIO9__FUNC_DBG_MON_A29			(MTK_PIN_NO(9) | 7)
+
+#define PINMUX_GPIO10__FUNC_GPIO10			(MTK_PIN_NO(10) | 0)
+#define PINMUX_GPIO10__FUNC_PWM1			(MTK_PIN_NO(10) | 1)
+#define PINMUX_GPIO10__FUNC_CLKM1			(MTK_PIN_NO(10) | 2)
+#define PINMUX_GPIO10__FUNC_KROW2			(MTK_PIN_NO(10) | 3)
+#define PINMUX_GPIO10__FUNC_MD_EINT0			(MTK_PIN_NO(10) | 4)
+#define PINMUX_GPIO10__FUNC_I2S1_MCK			(MTK_PIN_NO(10) | 5)
+#define PINMUX_GPIO10__FUNC_SDA3			(MTK_PIN_NO(10) | 6)
+#define PINMUX_GPIO10__FUNC_DBG_MON_A30			(MTK_PIN_NO(10) | 7)
+
+#define PINMUX_GPIO11__FUNC_GPIO11			(MTK_PIN_NO(11) | 0)
+#define PINMUX_GPIO11__FUNC_MD_EINT1			(MTK_PIN_NO(11) | 1)
+#define PINMUX_GPIO11__FUNC_IRTX_OUT			(MTK_PIN_NO(11) | 2)
+#define PINMUX_GPIO11__FUNC_C2K_UIM0_HOT_PLUG_IN	(MTK_PIN_NO(11) | 3)
+#define PINMUX_GPIO11__FUNC_CLKM0			(MTK_PIN_NO(11) | 4)
+#define PINMUX_GPIO11__FUNC_I2S2_MCK			(MTK_PIN_NO(11) | 5)
+#define PINMUX_GPIO11__FUNC_SCL3			(MTK_PIN_NO(11) | 6)
+#define PINMUX_GPIO11__FUNC_URXD0			(MTK_PIN_NO(11) | 7)
+
+#define PINMUX_GPIO12__FUNC_GPIO12			(MTK_PIN_NO(12) | 0)
+#define PINMUX_GPIO12__FUNC_I2S0_MCK			(MTK_PIN_NO(12) | 1)
+#define PINMUX_GPIO12__FUNC_C2K_UIM1_HOT_PLUG_IN	(MTK_PIN_NO(12) | 2)
+#define PINMUX_GPIO12__FUNC_KCOL2			(MTK_PIN_NO(12) | 3)
+#define PINMUX_GPIO12__FUNC_MD_EINT2			(MTK_PIN_NO(12) | 4)
+#define PINMUX_GPIO12__FUNC_IRTX_OUT			(MTK_PIN_NO(12) | 5)
+#define PINMUX_GPIO12__FUNC_SRCLKENAI2			(MTK_PIN_NO(12) | 6)
+#define PINMUX_GPIO12__FUNC_PCM1_DO1			(MTK_PIN_NO(12) | 7)
+
+#define PINMUX_GPIO13__FUNC_GPIO13			(MTK_PIN_NO(13) | 0)
+#define PINMUX_GPIO13__FUNC_WB_CTRL0			(MTK_PIN_NO(13) | 1)
+#define PINMUX_GPIO13__FUNC_C2K_ARM_EINT0		(MTK_PIN_NO(13) | 3)
+#define PINMUX_GPIO13__FUNC_DBG_MON_A0			(MTK_PIN_NO(13) | 7)
+
+#define PINMUX_GPIO14__FUNC_GPIO14			(MTK_PIN_NO(14) | 0)
+#define PINMUX_GPIO14__FUNC_WB_CTRL1			(MTK_PIN_NO(14) | 1)
+#define PINMUX_GPIO14__FUNC_C2K_ARM_EINT1		(MTK_PIN_NO(14) | 3)
+#define PINMUX_GPIO14__FUNC_DBG_MON_A1			(MTK_PIN_NO(14) | 7)
+
+#define PINMUX_GPIO15__FUNC_GPIO15			(MTK_PIN_NO(15) | 0)
+#define PINMUX_GPIO15__FUNC_WB_CTRL2			(MTK_PIN_NO(15) | 1)
+#define PINMUX_GPIO15__FUNC_C2K_ARM_EINT2		(MTK_PIN_NO(15) | 3)
+#define PINMUX_GPIO15__FUNC_DBG_MON_A2			(MTK_PIN_NO(15) | 7)
+
+#define PINMUX_GPIO16__FUNC_GPIO16			(MTK_PIN_NO(16) | 0)
+#define PINMUX_GPIO16__FUNC_WB_CTRL3			(MTK_PIN_NO(16) | 1)
+#define PINMUX_GPIO16__FUNC_C2K_ARM_EINT3		(MTK_PIN_NO(16) | 3)
+#define PINMUX_GPIO16__FUNC_DBG_MON_A3			(MTK_PIN_NO(16) | 7)
+
+#define PINMUX_GPIO17__FUNC_GPIO17			(MTK_PIN_NO(17) | 0)
+#define PINMUX_GPIO17__FUNC_WB_CTRL4			(MTK_PIN_NO(17) | 1)
+#define PINMUX_GPIO17__FUNC_C2K_DM_EINT0		(MTK_PIN_NO(17) | 3)
+#define PINMUX_GPIO17__FUNC_WATCHDOG			(MTK_PIN_NO(17) | 4)
+#define PINMUX_GPIO17__FUNC_DBG_MON_A4			(MTK_PIN_NO(17) | 7)
+
+#define PINMUX_GPIO18__FUNC_GPIO18			(MTK_PIN_NO(18) | 0)
+#define PINMUX_GPIO18__FUNC_WB_CTRL5			(MTK_PIN_NO(18) | 1)
+#define PINMUX_GPIO18__FUNC_C2K_DM_EINT1		(MTK_PIN_NO(18) | 3)
+#define PINMUX_GPIO18__FUNC_DBG_MON_A5			(MTK_PIN_NO(18) | 7)
+
+#define PINMUX_GPIO19__FUNC_GPIO19			(MTK_PIN_NO(19) | 0)
+#define PINMUX_GPIO19__FUNC_ANT_SEL0			(MTK_PIN_NO(19) | 1)
+#define PINMUX_GPIO19__FUNC_IRTX_OUT			(MTK_PIN_NO(19) | 2)
+#define PINMUX_GPIO19__FUNC_IRDA_TX			(MTK_PIN_NO(19) | 3)
+#define PINMUX_GPIO19__FUNC_C2K_UART0_TXD		(MTK_PIN_NO(19) | 4)
+#define PINMUX_GPIO19__FUNC_GPS_FRAME_SYNC		(MTK_PIN_NO(19) | 5)
+#define PINMUX_GPIO19__FUNC_LTE_UTXD			(MTK_PIN_NO(19) | 6)
+#define PINMUX_GPIO19__FUNC_DBG_MON_A6			(MTK_PIN_NO(19) | 7)
+
+#define PINMUX_GPIO20__FUNC_GPIO20			(MTK_PIN_NO(20) | 0)
+#define PINMUX_GPIO20__FUNC_ANT_SEL1			(MTK_PIN_NO(20) | 1)
+#define PINMUX_GPIO20__FUNC_C2K_UIM1_HOT_PLUG_IN	(MTK_PIN_NO(20) | 2)
+#define PINMUX_GPIO20__FUNC_IRDA_RX			(MTK_PIN_NO(20) | 3)
+#define PINMUX_GPIO20__FUNC_C2K_UART0_RXD		(MTK_PIN_NO(20) | 4)
+#define PINMUX_GPIO20__FUNC_MD_EINT2			(MTK_PIN_NO(20) | 5)
+#define PINMUX_GPIO20__FUNC_LTE_URXD			(MTK_PIN_NO(20) | 6)
+#define PINMUX_GPIO20__FUNC_DBG_MON_A7			(MTK_PIN_NO(20) | 7)
+
+#define PINMUX_GPIO21__FUNC_GPIO21			(MTK_PIN_NO(21) | 0)
+#define PINMUX_GPIO21__FUNC_ANT_SEL2			(MTK_PIN_NO(21) | 1)
+#define PINMUX_GPIO21__FUNC_PWM2			(MTK_PIN_NO(21) | 2)
+#define PINMUX_GPIO21__FUNC_IRDA_PDN			(MTK_PIN_NO(21) | 3)
+#define PINMUX_GPIO21__FUNC_CORESONIC_SWCK		(MTK_PIN_NO(21) | 4)
+#define PINMUX_GPIO21__FUNC_MD_EINT1			(MTK_PIN_NO(21) | 5)
+#define PINMUX_GPIO21__FUNC_C2K_UIM0_HOT_PLUG_IN	(MTK_PIN_NO(21) | 6)
+#define PINMUX_GPIO21__FUNC_DBG_MON_A8			(MTK_PIN_NO(21) | 7)
+
+#define PINMUX_GPIO22__FUNC_GPIO22			(MTK_PIN_NO(22) | 0)
+#define PINMUX_GPIO22__FUNC_RDN0			(MTK_PIN_NO(22) | 1)
+
+#define PINMUX_GPIO23__FUNC_GPIO23			(MTK_PIN_NO(23) | 0)
+#define PINMUX_GPIO23__FUNC_RDP0			(MTK_PIN_NO(23) | 1)
+
+#define PINMUX_GPIO24__FUNC_GPIO24			(MTK_PIN_NO(24) | 0)
+#define PINMUX_GPIO24__FUNC_RDN1			(MTK_PIN_NO(24) | 1)
+
+#define PINMUX_GPIO25__FUNC_GPIO25			(MTK_PIN_NO(25) | 0)
+#define PINMUX_GPIO25__FUNC_RDP1			(MTK_PIN_NO(25) | 1)
+
+#define PINMUX_GPIO26__FUNC_GPIO26			(MTK_PIN_NO(26) | 0)
+#define PINMUX_GPIO26__FUNC_RCN				(MTK_PIN_NO(26) | 1)
+
+#define PINMUX_GPIO27__FUNC_GPIO27			(MTK_PIN_NO(27) | 0)
+#define PINMUX_GPIO27__FUNC_RCP				(MTK_PIN_NO(27) | 1)
+
+#define PINMUX_GPIO28__FUNC_GPIO28			(MTK_PIN_NO(28) | 0)
+#define PINMUX_GPIO28__FUNC_RDN2			(MTK_PIN_NO(28) | 1)
+
+#define PINMUX_GPIO29__FUNC_GPIO29			(MTK_PIN_NO(29) | 0)
+#define PINMUX_GPIO29__FUNC_RDP2			(MTK_PIN_NO(29) | 1)
+
+#define PINMUX_GPIO30__FUNC_GPIO30			(MTK_PIN_NO(30) | 0)
+#define PINMUX_GPIO30__FUNC_RDN3			(MTK_PIN_NO(30) | 1)
+
+#define PINMUX_GPIO31__FUNC_GPIO31			(MTK_PIN_NO(31) | 0)
+#define PINMUX_GPIO31__FUNC_RDP3			(MTK_PIN_NO(31) | 1)
+
+#define PINMUX_GPIO32__FUNC_GPIO32			(MTK_PIN_NO(32) | 0)
+#define PINMUX_GPIO32__FUNC_RDN0_A			(MTK_PIN_NO(32) | 1)
+#define PINMUX_GPIO32__FUNC_CMHSYNC			(MTK_PIN_NO(32) | 2)
+#define PINMUX_GPIO32__FUNC_CMCSD0			(MTK_PIN_NO(32) | 3)
+
+#define PINMUX_GPIO33__FUNC_GPIO33			(MTK_PIN_NO(33) | 0)
+#define PINMUX_GPIO33__FUNC_RDP0_A			(MTK_PIN_NO(33) | 1)
+#define PINMUX_GPIO33__FUNC_CMVSYNC			(MTK_PIN_NO(33) | 2)
+#define PINMUX_GPIO33__FUNC_CMCSD1			(MTK_PIN_NO(33) | 3)
+
+#define PINMUX_GPIO34__FUNC_GPIO34			(MTK_PIN_NO(34) | 0)
+#define PINMUX_GPIO34__FUNC_RDN1_A			(MTK_PIN_NO(34) | 1)
+#define PINMUX_GPIO34__FUNC_CMDAT9			(MTK_PIN_NO(34) | 2)
+#define PINMUX_GPIO34__FUNC_CMCSD2			(MTK_PIN_NO(34) | 3)
+
+#define PINMUX_GPIO35__FUNC_GPIO35			(MTK_PIN_NO(35) | 0)
+#define PINMUX_GPIO35__FUNC_RDP1_A			(MTK_PIN_NO(35) | 1)
+#define PINMUX_GPIO35__FUNC_CMDAT8			(MTK_PIN_NO(35) | 2)
+#define PINMUX_GPIO35__FUNC_CMCSD3			(MTK_PIN_NO(35) | 3)
+
+#define PINMUX_GPIO36__FUNC_GPIO36			(MTK_PIN_NO(36) | 0)
+#define PINMUX_GPIO36__FUNC_RCN_A			(MTK_PIN_NO(36) | 1)
+#define PINMUX_GPIO36__FUNC_CMDAT7			(MTK_PIN_NO(36) | 2)
+
+#define PINMUX_GPIO37__FUNC_GPIO37			(MTK_PIN_NO(37) | 0)
+#define PINMUX_GPIO37__FUNC_RCP_A			(MTK_PIN_NO(37) | 1)
+#define PINMUX_GPIO37__FUNC_CMDAT6			(MTK_PIN_NO(37) | 2)
+
+#define PINMUX_GPIO38__FUNC_GPIO38			(MTK_PIN_NO(38) | 0)
+#define PINMUX_GPIO38__FUNC_RDN2_A			(MTK_PIN_NO(38) | 1)
+#define PINMUX_GPIO38__FUNC_CMDAT5			(MTK_PIN_NO(38) | 2)
+
+#define PINMUX_GPIO39__FUNC_GPIO39			(MTK_PIN_NO(39) | 0)
+#define PINMUX_GPIO39__FUNC_RDP2_A			(MTK_PIN_NO(39) | 1)
+#define PINMUX_GPIO39__FUNC_CMDAT4			(MTK_PIN_NO(39) | 2)
+
+#define PINMUX_GPIO40__FUNC_GPIO40			(MTK_PIN_NO(40) | 0)
+#define PINMUX_GPIO40__FUNC_RDN3_A			(MTK_PIN_NO(40) | 1)
+#define PINMUX_GPIO40__FUNC_CMDAT3			(MTK_PIN_NO(40) | 2)
+
+#define PINMUX_GPIO41__FUNC_GPIO41			(MTK_PIN_NO(41) | 0)
+#define PINMUX_GPIO41__FUNC_RDP3_A			(MTK_PIN_NO(41) | 1)
+#define PINMUX_GPIO41__FUNC_CMDAT2			(MTK_PIN_NO(41) | 2)
+
+#define PINMUX_GPIO42__FUNC_GPIO42			(MTK_PIN_NO(42) | 0)
+#define PINMUX_GPIO42__FUNC_CMDAT0			(MTK_PIN_NO(42) | 1)
+#define PINMUX_GPIO42__FUNC_CMCSD0			(MTK_PIN_NO(42) | 2)
+#define PINMUX_GPIO42__FUNC_CMMCLK1			(MTK_PIN_NO(42) | 3)
+#define PINMUX_GPIO42__FUNC_ANT_SEL5			(MTK_PIN_NO(42) | 5)
+#define PINMUX_GPIO42__FUNC_CLKM5			(MTK_PIN_NO(42) | 6)
+#define PINMUX_GPIO42__FUNC_DBG_MON_A9			(MTK_PIN_NO(42) | 7)
+
+#define PINMUX_GPIO43__FUNC_GPIO43			(MTK_PIN_NO(43) | 0)
+#define PINMUX_GPIO43__FUNC_CMDAT1			(MTK_PIN_NO(43) | 1)
+#define PINMUX_GPIO43__FUNC_CMCSD1			(MTK_PIN_NO(43) | 2)
+#define PINMUX_GPIO43__FUNC_CMFLASH			(MTK_PIN_NO(43) | 3)
+#define PINMUX_GPIO43__FUNC_MD_EINT0			(MTK_PIN_NO(43) | 4)
+#define PINMUX_GPIO43__FUNC_CMMCLK1			(MTK_PIN_NO(43) | 5)
+#define PINMUX_GPIO43__FUNC_CLKM4			(MTK_PIN_NO(43) | 6)
+#define PINMUX_GPIO43__FUNC_DBG_MON_A10			(MTK_PIN_NO(43) | 7)
+
+#define PINMUX_GPIO44__FUNC_GPIO44			(MTK_PIN_NO(44) | 0)
+#define PINMUX_GPIO44__FUNC_CMPCLK			(MTK_PIN_NO(44) | 1)
+#define PINMUX_GPIO44__FUNC_CMCSK			(MTK_PIN_NO(44) | 2)
+#define PINMUX_GPIO44__FUNC_CMCSD2			(MTK_PIN_NO(44) | 3)
+#define PINMUX_GPIO44__FUNC_KCOL3			(MTK_PIN_NO(44) | 4)
+#define PINMUX_GPIO44__FUNC_SRCLKENAI2			(MTK_PIN_NO(44) | 5)
+#define PINMUX_GPIO44__FUNC_PWM0			(MTK_PIN_NO(44) | 6)
+#define PINMUX_GPIO44__FUNC_DBG_MON_A11			(MTK_PIN_NO(44) | 7)
+
+#define PINMUX_GPIO45__FUNC_GPIO45			(MTK_PIN_NO(45) | 0)
+#define PINMUX_GPIO45__FUNC_CMMCLK0			(MTK_PIN_NO(45) | 1)
+#define PINMUX_GPIO45__FUNC_DBG_MON_A12			(MTK_PIN_NO(45) | 7)
+
+#define PINMUX_GPIO46__FUNC_GPIO46			(MTK_PIN_NO(46) | 0)
+#define PINMUX_GPIO46__FUNC_CMMCLK1			(MTK_PIN_NO(46) | 1)
+#define PINMUX_GPIO46__FUNC_IDDIG			(MTK_PIN_NO(46) | 2)
+#define PINMUX_GPIO46__FUNC_LTE_MD32_JTAG_TRST		(MTK_PIN_NO(46) | 3)
+#define PINMUX_GPIO46__FUNC_TDD_TRSTN			(MTK_PIN_NO(46) | 4)
+#define PINMUX_GPIO46__FUNC_DM_JTINTP			(MTK_PIN_NO(46) | 5)
+#define PINMUX_GPIO46__FUNC_KCOL6			(MTK_PIN_NO(46) | 6)
+#define PINMUX_GPIO46__FUNC_DBG_MON_A13			(MTK_PIN_NO(46) | 7)
+
+#define PINMUX_GPIO47__FUNC_GPIO47			(MTK_PIN_NO(47) | 0)
+#define PINMUX_GPIO47__FUNC_SDA0			(MTK_PIN_NO(47) | 1)
+
+#define PINMUX_GPIO48__FUNC_GPIO48			(MTK_PIN_NO(48) | 0)
+#define PINMUX_GPIO48__FUNC_SCL0			(MTK_PIN_NO(48) | 1)
+
+#define PINMUX_GPIO49__FUNC_GPIO49			(MTK_PIN_NO(49) | 0)
+#define PINMUX_GPIO49__FUNC_SDA1			(MTK_PIN_NO(49) | 1)
+
+#define PINMUX_GPIO50__FUNC_GPIO50			(MTK_PIN_NO(50) | 0)
+#define PINMUX_GPIO50__FUNC_SCL1			(MTK_PIN_NO(50) | 1)
+
+#define PINMUX_GPIO51__FUNC_GPIO51			(MTK_PIN_NO(51) | 0)
+#define PINMUX_GPIO51__FUNC_SDA2			(MTK_PIN_NO(51) | 1)
+
+#define PINMUX_GPIO52__FUNC_GPIO52			(MTK_PIN_NO(52) | 0)
+#define PINMUX_GPIO52__FUNC_SCL2			(MTK_PIN_NO(52) | 1)
+
+#define PINMUX_GPIO53__FUNC_GPIO53			(MTK_PIN_NO(53) | 0)
+#define PINMUX_GPIO53__FUNC_SDA3			(MTK_PIN_NO(53) | 1)
+#define PINMUX_GPIO53__FUNC_IDDIG			(MTK_PIN_NO(53) | 3)
+#define PINMUX_GPIO53__FUNC_MD_EINT2			(MTK_PIN_NO(53) | 5)
+#define PINMUX_GPIO53__FUNC_C2K_UIM1_HOT_PLUG_IN	(MTK_PIN_NO(53) | 6)
+
+#define PINMUX_GPIO54__FUNC_GPIO54			(MTK_PIN_NO(54) | 0)
+#define PINMUX_GPIO54__FUNC_SCL3			(MTK_PIN_NO(54) | 1)
+#define PINMUX_GPIO54__FUNC_IDDIG			(MTK_PIN_NO(54) | 3)
+#define PINMUX_GPIO54__FUNC_MD_EINT1			(MTK_PIN_NO(54) | 5)
+#define PINMUX_GPIO54__FUNC_C2K_UIM0_HOT_PLUG_IN	(MTK_PIN_NO(54) | 6)
+
+#define PINMUX_GPIO55__FUNC_GPIO55			(MTK_PIN_NO(55) | 0)
+#define PINMUX_GPIO55__FUNC_SRCLKENAI0			(MTK_PIN_NO(55) | 1)
+#define PINMUX_GPIO55__FUNC_PWM2			(MTK_PIN_NO(55) | 2)
+#define PINMUX_GPIO55__FUNC_CLKM5			(MTK_PIN_NO(55) | 3)
+#define PINMUX_GPIO55__FUNC_CORESONIC_SWD		(MTK_PIN_NO(55) | 4)
+#define PINMUX_GPIO55__FUNC_ANT_SEL6			(MTK_PIN_NO(55) | 5)
+#define PINMUX_GPIO55__FUNC_KROW5			(MTK_PIN_NO(55) | 6)
+#define PINMUX_GPIO55__FUNC_DISP_PWM			(MTK_PIN_NO(55) | 7)
+
+#define PINMUX_GPIO56__FUNC_GPIO56			(MTK_PIN_NO(56) | 0)
+#define PINMUX_GPIO56__FUNC_SRCLKENA1			(MTK_PIN_NO(56) | 1)
+
+#define PINMUX_GPIO57__FUNC_GPIO57			(MTK_PIN_NO(57) | 0)
+#define PINMUX_GPIO57__FUNC_URXD2			(MTK_PIN_NO(57) | 1)
+#define PINMUX_GPIO57__FUNC_DPI_HSYNC0			(MTK_PIN_NO(57) | 2)
+#define PINMUX_GPIO57__FUNC_UTXD2			(MTK_PIN_NO(57) | 3)
+#define PINMUX_GPIO57__FUNC_MD_URXD			(MTK_PIN_NO(57) | 4)
+#define PINMUX_GPIO57__FUNC_SRCLKENAI1			(MTK_PIN_NO(57) | 5)
+#define PINMUX_GPIO57__FUNC_KROW4			(MTK_PIN_NO(57) | 6)
+#define PINMUX_GPIO57__FUNC_DBG_MON_A14			(MTK_PIN_NO(57) | 7)
+
+#define PINMUX_GPIO58__FUNC_GPIO58			(MTK_PIN_NO(58) | 0)
+#define PINMUX_GPIO58__FUNC_UTXD2			(MTK_PIN_NO(58) | 1)
+#define PINMUX_GPIO58__FUNC_DPI_VSYNC0			(MTK_PIN_NO(58) | 2)
+#define PINMUX_GPIO58__FUNC_URXD2			(MTK_PIN_NO(58) | 3)
+#define PINMUX_GPIO58__FUNC_MD_UTXD			(MTK_PIN_NO(58) | 4)
+#define PINMUX_GPIO58__FUNC_TDD_TXD			(MTK_PIN_NO(58) | 5)
+#define PINMUX_GPIO58__FUNC_KROW5			(MTK_PIN_NO(58) | 6)
+#define PINMUX_GPIO58__FUNC_DBG_MON_A15			(MTK_PIN_NO(58) | 7)
+
+#define PINMUX_GPIO59__FUNC_GPIO59			(MTK_PIN_NO(59) | 0)
+#define PINMUX_GPIO59__FUNC_URXD3			(MTK_PIN_NO(59) | 1)
+#define PINMUX_GPIO59__FUNC_DPI_CK0			(MTK_PIN_NO(59) | 2)
+#define PINMUX_GPIO59__FUNC_UTXD3			(MTK_PIN_NO(59) | 3)
+#define PINMUX_GPIO59__FUNC_UCTS2			(MTK_PIN_NO(59) | 4)
+#define PINMUX_GPIO59__FUNC_PWM3			(MTK_PIN_NO(59) | 5)
+#define PINMUX_GPIO59__FUNC_KROW6			(MTK_PIN_NO(59) | 6)
+#define PINMUX_GPIO59__FUNC_DBG_MON_A16			(MTK_PIN_NO(59) | 7)
+
+#define PINMUX_GPIO60__FUNC_GPIO60			(MTK_PIN_NO(60) | 0)
+#define PINMUX_GPIO60__FUNC_UTXD3			(MTK_PIN_NO(60) | 1)
+#define PINMUX_GPIO60__FUNC_DPI_DE0			(MTK_PIN_NO(60) | 2)
+#define PINMUX_GPIO60__FUNC_URXD3			(MTK_PIN_NO(60) | 3)
+#define PINMUX_GPIO60__FUNC_URTS2			(MTK_PIN_NO(60) | 4)
+#define PINMUX_GPIO60__FUNC_PWM4			(MTK_PIN_NO(60) | 5)
+#define PINMUX_GPIO60__FUNC_KROW7			(MTK_PIN_NO(60) | 6)
+#define PINMUX_GPIO60__FUNC_DBG_MON_A17			(MTK_PIN_NO(60) | 7)
+
+#define PINMUX_GPIO61__FUNC_GPIO61			(MTK_PIN_NO(61) | 0)
+#define PINMUX_GPIO61__FUNC_PCM1_CLK			(MTK_PIN_NO(61) | 1)
+#define PINMUX_GPIO61__FUNC_DPI_D0			(MTK_PIN_NO(61) | 2)
+#define PINMUX_GPIO61__FUNC_I2S0_BCK			(MTK_PIN_NO(61) | 3)
+#define PINMUX_GPIO61__FUNC_KROW4			(MTK_PIN_NO(61) | 4)
+#define PINMUX_GPIO61__FUNC_ANT_SEL3			(MTK_PIN_NO(61) | 5)
+#define PINMUX_GPIO61__FUNC_IRTX_OUT			(MTK_PIN_NO(61) | 6)
+#define PINMUX_GPIO61__FUNC_DBG_MON_A18			(MTK_PIN_NO(61) | 7)
+
+#define PINMUX_GPIO62__FUNC_GPIO62			(MTK_PIN_NO(62) | 0)
+#define PINMUX_GPIO62__FUNC_PCM1_SYNC			(MTK_PIN_NO(62) | 1)
+#define PINMUX_GPIO62__FUNC_DPI_D1			(MTK_PIN_NO(62) | 2)
+#define PINMUX_GPIO62__FUNC_I2S0_LRCK			(MTK_PIN_NO(62) | 3)
+#define PINMUX_GPIO62__FUNC_KCOL7			(MTK_PIN_NO(62) | 4)
+#define PINMUX_GPIO62__FUNC_CLKM3			(MTK_PIN_NO(62) | 5)
+#define PINMUX_GPIO62__FUNC_CMFLASH			(MTK_PIN_NO(62) | 6)
+#define PINMUX_GPIO62__FUNC_DBG_MON_A19			(MTK_PIN_NO(62) | 7)
+
+#define PINMUX_GPIO63__FUNC_GPIO63			(MTK_PIN_NO(63) | 0)
+#define PINMUX_GPIO63__FUNC_PCM1_DI			(MTK_PIN_NO(63) | 1)
+#define PINMUX_GPIO63__FUNC_DPI_D2			(MTK_PIN_NO(63) | 2)
+#define PINMUX_GPIO63__FUNC_I2S0_DI			(MTK_PIN_NO(63) | 3)
+#define PINMUX_GPIO63__FUNC_PCM1_DO0			(MTK_PIN_NO(63) | 4)
+#define PINMUX_GPIO63__FUNC_CLKM5			(MTK_PIN_NO(63) | 5)
+#define PINMUX_GPIO63__FUNC_KROW3			(MTK_PIN_NO(63) | 6)
+#define PINMUX_GPIO63__FUNC_DBG_MON_A20			(MTK_PIN_NO(63) | 7)
+
+#define PINMUX_GPIO64__FUNC_GPIO64			(MTK_PIN_NO(64) | 0)
+#define PINMUX_GPIO64__FUNC_PCM1_DO0			(MTK_PIN_NO(64) | 1)
+#define PINMUX_GPIO64__FUNC_DPI_D3			(MTK_PIN_NO(64) | 2)
+#define PINMUX_GPIO64__FUNC_I2S0_MCK			(MTK_PIN_NO(64) | 3)
+#define PINMUX_GPIO64__FUNC_PCM1_DI			(MTK_PIN_NO(64) | 4)
+#define PINMUX_GPIO64__FUNC_SRCLKENAI2			(MTK_PIN_NO(64) | 5)
+#define PINMUX_GPIO64__FUNC_KCOL5			(MTK_PIN_NO(64) | 6)
+#define PINMUX_GPIO64__FUNC_DBG_MON_A21			(MTK_PIN_NO(64) | 7)
+
+#define PINMUX_GPIO65__FUNC_GPIO65			(MTK_PIN_NO(65) | 0)
+#define PINMUX_GPIO65__FUNC_SPI_CSA			(MTK_PIN_NO(65) | 1)
+#define PINMUX_GPIO65__FUNC_EXT_FRAME_SYNC		(MTK_PIN_NO(65) | 2)
+#define PINMUX_GPIO65__FUNC_I2S3_MCK			(MTK_PIN_NO(65) | 3)
+#define PINMUX_GPIO65__FUNC_KROW2			(MTK_PIN_NO(65) | 4)
+#define PINMUX_GPIO65__FUNC_GPS_FRAME_SYNC		(MTK_PIN_NO(65) | 5)
+#define PINMUX_GPIO65__FUNC_PTA_RXD			(MTK_PIN_NO(65) | 6)
+#define PINMUX_GPIO65__FUNC_DBG_MON_A22			(MTK_PIN_NO(65) | 7)
+
+#define PINMUX_GPIO66__FUNC_GPIO66			(MTK_PIN_NO(66) | 0)
+#define PINMUX_GPIO66__FUNC_SPI_CKA			(MTK_PIN_NO(66) | 1)
+#define PINMUX_GPIO66__FUNC_USB_DRVVBUS			(MTK_PIN_NO(66) | 2)
+#define PINMUX_GPIO66__FUNC_I2S3_BCK			(MTK_PIN_NO(66) | 3)
+#define PINMUX_GPIO66__FUNC_KCOL2			(MTK_PIN_NO(66) | 4)
+#define PINMUX_GPIO66__FUNC_PTA_TXD			(MTK_PIN_NO(66) | 6)
+#define PINMUX_GPIO66__FUNC_DBG_MON_A23			(MTK_PIN_NO(66) | 7)
+
+#define PINMUX_GPIO67__FUNC_GPIO67			(MTK_PIN_NO(67) | 0)
+#define PINMUX_GPIO67__FUNC_SPI_MIA			(MTK_PIN_NO(67) | 1)
+#define PINMUX_GPIO67__FUNC_SPI_MOA			(MTK_PIN_NO(67) | 2)
+#define PINMUX_GPIO67__FUNC_I2S3_DO			(MTK_PIN_NO(67) | 3)
+#define PINMUX_GPIO67__FUNC_PTA_RXD			(MTK_PIN_NO(67) | 4)
+#define PINMUX_GPIO67__FUNC_IDDIG			(MTK_PIN_NO(67) | 5)
+#define PINMUX_GPIO67__FUNC_UCTS1			(MTK_PIN_NO(67) | 6)
+#define PINMUX_GPIO67__FUNC_DBG_MON_A24			(MTK_PIN_NO(67) | 7)
+
+#define PINMUX_GPIO68__FUNC_GPIO68			(MTK_PIN_NO(68) | 0)
+#define PINMUX_GPIO68__FUNC_SPI_MOA			(MTK_PIN_NO(68) | 1)
+#define PINMUX_GPIO68__FUNC_SPI_MIA			(MTK_PIN_NO(68) | 2)
+#define PINMUX_GPIO68__FUNC_I2S3_LRCK			(MTK_PIN_NO(68) | 3)
+#define PINMUX_GPIO68__FUNC_PTA_TXD			(MTK_PIN_NO(68) | 4)
+#define PINMUX_GPIO68__FUNC_ANT_SEL4			(MTK_PIN_NO(68) | 5)
+#define PINMUX_GPIO68__FUNC_URTS1			(MTK_PIN_NO(68) | 6)
+#define PINMUX_GPIO68__FUNC_DBG_MON_A25			(MTK_PIN_NO(68) | 7)
+
+#define PINMUX_GPIO69__FUNC_GPIO69			(MTK_PIN_NO(69) | 0)
+#define PINMUX_GPIO69__FUNC_DISP_PWM			(MTK_PIN_NO(69) | 1)
+#define PINMUX_GPIO69__FUNC_PWM1			(MTK_PIN_NO(69) | 2)
+#define PINMUX_GPIO69__FUNC_LTE_MD32_JTAG_TRST		(MTK_PIN_NO(69) | 3)
+#define PINMUX_GPIO69__FUNC_TDD_TRSTN			(MTK_PIN_NO(69) | 4)
+#define PINMUX_GPIO69__FUNC_ANT_SEL7			(MTK_PIN_NO(69) | 5)
+#define PINMUX_GPIO69__FUNC_DM_JTINTP			(MTK_PIN_NO(69) | 6)
+
+#define PINMUX_GPIO70__FUNC_GPIO70			(MTK_PIN_NO(70) | 0)
+#define PINMUX_GPIO70__FUNC_JTMS			(MTK_PIN_NO(70) | 1)
+#define PINMUX_GPIO70__FUNC_CONN_MCU_TMS		(MTK_PIN_NO(70) | 2)
+#define PINMUX_GPIO70__FUNC_LTE_MD32_JTAG_TMS		(MTK_PIN_NO(70) | 3)
+#define PINMUX_GPIO70__FUNC_TDD_TMS			(MTK_PIN_NO(70) | 4)
+#define PINMUX_GPIO70__FUNC_CORESONIC_SWD		(MTK_PIN_NO(70) | 5)
+#define PINMUX_GPIO70__FUNC_DM_OTMS			(MTK_PIN_NO(70) | 6)
+#define PINMUX_GPIO70__FUNC_DFD_TMS			(MTK_PIN_NO(70) | 7)
+
+#define PINMUX_GPIO71__FUNC_GPIO71			(MTK_PIN_NO(71) | 0)
+#define PINMUX_GPIO71__FUNC_JTCK			(MTK_PIN_NO(71) | 1)
+#define PINMUX_GPIO71__FUNC_CONN_MCU_TCK_1		(MTK_PIN_NO(71) | 2)
+#define PINMUX_GPIO71__FUNC_LTE_MD32_JTAG_TCK		(MTK_PIN_NO(71) | 3)
+#define PINMUX_GPIO71__FUNC_TDD_TCK			(MTK_PIN_NO(71) | 4)
+#define PINMUX_GPIO71__FUNC_CORESONIC_SWCK		(MTK_PIN_NO(71) | 5)
+#define PINMUX_GPIO71__FUNC_DM_OTCK			(MTK_PIN_NO(71) | 6)
+#define PINMUX_GPIO71__FUNC_DFD_TCK_XI			(MTK_PIN_NO(71) | 7)
+
+#define PINMUX_GPIO72__FUNC_GPIO72			(MTK_PIN_NO(72) | 0)
+#define PINMUX_GPIO72__FUNC_JTDI			(MTK_PIN_NO(72) | 1)
+#define PINMUX_GPIO72__FUNC_CONN_MCU_TDI		(MTK_PIN_NO(72) | 2)
+#define PINMUX_GPIO72__FUNC_LTE_MD32_JTAG_TDI		(MTK_PIN_NO(72) | 3)
+#define PINMUX_GPIO72__FUNC_TDD_TDI			(MTK_PIN_NO(72) | 4)
+#define PINMUX_GPIO72__FUNC_DM_OTDI			(MTK_PIN_NO(72) | 6)
+#define PINMUX_GPIO72__FUNC_DFD_TDI			(MTK_PIN_NO(72) | 7)
+
+#define PINMUX_GPIO73__FUNC_GPIO73			(MTK_PIN_NO(73) | 0)
+#define PINMUX_GPIO73__FUNC_JTDO			(MTK_PIN_NO(73) | 1)
+#define PINMUX_GPIO73__FUNC_CONN_MCU_TDO		(MTK_PIN_NO(73) | 2)
+#define PINMUX_GPIO73__FUNC_LTE_MD32_JTAG_TDO		(MTK_PIN_NO(73) | 3)
+#define PINMUX_GPIO73__FUNC_TDD_TDO			(MTK_PIN_NO(73) | 4)
+#define PINMUX_GPIO73__FUNC_DM_OTDO			(MTK_PIN_NO(73) | 6)
+#define PINMUX_GPIO73__FUNC_DFD_TDO			(MTK_PIN_NO(73) | 7)
+
+#define PINMUX_GPIO74__FUNC_GPIO74			(MTK_PIN_NO(74) | 0)
+#define PINMUX_GPIO74__FUNC_URXD0			(MTK_PIN_NO(74) | 1)
+#define PINMUX_GPIO74__FUNC_UTXD0			(MTK_PIN_NO(74) | 2)
+#define PINMUX_GPIO74__FUNC_MD_URXD			(MTK_PIN_NO(74) | 3)
+#define PINMUX_GPIO74__FUNC_SDA3			(MTK_PIN_NO(74) | 4)
+#define PINMUX_GPIO74__FUNC_C2K_UART0_RXD		(MTK_PIN_NO(74) | 5)
+#define PINMUX_GPIO74__FUNC_LTE_URXD			(MTK_PIN_NO(74) | 6)
+#define PINMUX_GPIO74__FUNC_AUXIF_ST			(MTK_PIN_NO(74) | 7)
+
+#define PINMUX_GPIO75__FUNC_GPIO75			(MTK_PIN_NO(75) | 0)
+#define PINMUX_GPIO75__FUNC_UTXD0			(MTK_PIN_NO(75) | 1)
+#define PINMUX_GPIO75__FUNC_URXD0			(MTK_PIN_NO(75) | 2)
+#define PINMUX_GPIO75__FUNC_MD_UTXD			(MTK_PIN_NO(75) | 3)
+#define PINMUX_GPIO75__FUNC_TDD_TXD			(MTK_PIN_NO(75) | 4)
+#define PINMUX_GPIO75__FUNC_C2K_UART0_TXD		(MTK_PIN_NO(75) | 5)
+#define PINMUX_GPIO75__FUNC_LTE_UTXD			(MTK_PIN_NO(75) | 6)
+
+#define PINMUX_GPIO76__FUNC_GPIO76			(MTK_PIN_NO(76) | 0)
+#define PINMUX_GPIO76__FUNC_URXD1			(MTK_PIN_NO(76) | 1)
+#define PINMUX_GPIO76__FUNC_UTXD1			(MTK_PIN_NO(76) | 2)
+#define PINMUX_GPIO76__FUNC_MD_URXD			(MTK_PIN_NO(76) | 3)
+#define PINMUX_GPIO76__FUNC_SCL3			(MTK_PIN_NO(76) | 4)
+#define PINMUX_GPIO76__FUNC_LTE_URXD			(MTK_PIN_NO(76) | 5)
+#define PINMUX_GPIO76__FUNC_C2K_UART0_RXD		(MTK_PIN_NO(76) | 6)
+#define PINMUX_GPIO76__FUNC_AUXIF_CLK			(MTK_PIN_NO(76) | 7)
+
+#define PINMUX_GPIO77__FUNC_GPIO77			(MTK_PIN_NO(77) | 0)
+#define PINMUX_GPIO77__FUNC_UTXD1			(MTK_PIN_NO(77) | 1)
+#define PINMUX_GPIO77__FUNC_URXD1			(MTK_PIN_NO(77) | 2)
+#define PINMUX_GPIO77__FUNC_MD_UTXD			(MTK_PIN_NO(77) | 3)
+#define PINMUX_GPIO77__FUNC_TDD_TXD			(MTK_PIN_NO(77) | 4)
+#define PINMUX_GPIO77__FUNC_LTE_UTXD			(MTK_PIN_NO(77) | 5)
+#define PINMUX_GPIO77__FUNC_C2K_UART0_TXD		(MTK_PIN_NO(77) | 6)
+
+#define PINMUX_GPIO78__FUNC_GPIO78			(MTK_PIN_NO(78) | 0)
+#define PINMUX_GPIO78__FUNC_I2S0_DI			(MTK_PIN_NO(78) | 1)
+#define PINMUX_GPIO78__FUNC_PCM1_DI			(MTK_PIN_NO(78) | 2)
+#define PINMUX_GPIO78__FUNC_I2S3_DO			(MTK_PIN_NO(78) | 3)
+#define PINMUX_GPIO78__FUNC_I2S1_DO			(MTK_PIN_NO(78) | 4)
+#define PINMUX_GPIO78__FUNC_PWM0			(MTK_PIN_NO(78) | 5)
+#define PINMUX_GPIO78__FUNC_I2S2_DI			(MTK_PIN_NO(78) | 6)
+#define PINMUX_GPIO78__FUNC_DBG_MON_A26			(MTK_PIN_NO(78) | 7)
+
+#define PINMUX_GPIO79__FUNC_GPIO79			(MTK_PIN_NO(79) | 0)
+#define PINMUX_GPIO79__FUNC_I2S0_LRCK			(MTK_PIN_NO(79) | 1)
+#define PINMUX_GPIO79__FUNC_PCM1_SYNC			(MTK_PIN_NO(79) | 2)
+#define PINMUX_GPIO79__FUNC_I2S3_LRCK			(MTK_PIN_NO(79) | 3)
+#define PINMUX_GPIO79__FUNC_I2S1_LRCK			(MTK_PIN_NO(79) | 4)
+#define PINMUX_GPIO79__FUNC_PWM3			(MTK_PIN_NO(79) | 5)
+#define PINMUX_GPIO79__FUNC_I2S2_LRCK			(MTK_PIN_NO(79) | 6)
+#define PINMUX_GPIO79__FUNC_DBG_MON_A27			(MTK_PIN_NO(79) | 7)
+
+#define PINMUX_GPIO80__FUNC_GPIO80			(MTK_PIN_NO(80) | 0)
+#define PINMUX_GPIO80__FUNC_I2S0_BCK			(MTK_PIN_NO(80) | 1)
+#define PINMUX_GPIO80__FUNC_PCM1_CLK			(MTK_PIN_NO(80) | 2)
+#define PINMUX_GPIO80__FUNC_I2S3_BCK			(MTK_PIN_NO(80) | 3)
+#define PINMUX_GPIO80__FUNC_I2S1_BCK			(MTK_PIN_NO(80) | 4)
+#define PINMUX_GPIO80__FUNC_PWM4			(MTK_PIN_NO(80) | 5)
+#define PINMUX_GPIO80__FUNC_I2S2_BCK			(MTK_PIN_NO(80) | 6)
+#define PINMUX_GPIO80__FUNC_DBG_MON_A28			(MTK_PIN_NO(80) | 7)
+
+#define PINMUX_GPIO81__FUNC_GPIO81			(MTK_PIN_NO(81) | 0)
+#define PINMUX_GPIO81__FUNC_KROW0			(MTK_PIN_NO(81) | 1)
+#define PINMUX_GPIO81__FUNC_CONN_MCU_DBGI_N		(MTK_PIN_NO(81) | 3)
+#define PINMUX_GPIO81__FUNC_CORESONIC_SWCK		(MTK_PIN_NO(81) | 4)
+#define PINMUX_GPIO81__FUNC_C2K_TCK			(MTK_PIN_NO(81) | 5)
+#define PINMUX_GPIO81__FUNC_C2K_DM_EINT1		(MTK_PIN_NO(81) | 7)
+
+#define PINMUX_GPIO82__FUNC_GPIO82			(MTK_PIN_NO(82) | 0)
+#define PINMUX_GPIO82__FUNC_KROW1			(MTK_PIN_NO(82) | 1)
+#define PINMUX_GPIO82__FUNC_CONN_MCU_TRST_B		(MTK_PIN_NO(82) | 3)
+#define PINMUX_GPIO82__FUNC_CORESONIC_SWD		(MTK_PIN_NO(82) | 4)
+#define PINMUX_GPIO82__FUNC_C2K_NTRST			(MTK_PIN_NO(82) | 5)
+#define PINMUX_GPIO82__FUNC_USB_DRVVBUS			(MTK_PIN_NO(82) | 6)
+#define PINMUX_GPIO82__FUNC_C2K_DM_EINT2		(MTK_PIN_NO(82) | 7)
+
+#define PINMUX_GPIO83__FUNC_GPIO83			(MTK_PIN_NO(83) | 0)
+#define PINMUX_GPIO83__FUNC_KROW2			(MTK_PIN_NO(83) | 1)
+#define PINMUX_GPIO83__FUNC_USB_DRVVBUS			(MTK_PIN_NO(83) | 2)
+#define PINMUX_GPIO83__FUNC_C2K_TDI			(MTK_PIN_NO(83) | 5)
+#define PINMUX_GPIO83__FUNC_C2K_DM_EINT3		(MTK_PIN_NO(83) | 7)
+
+#define PINMUX_GPIO84__FUNC_GPIO84			(MTK_PIN_NO(84) | 0)
+#define PINMUX_GPIO84__FUNC_KCOL0			(MTK_PIN_NO(84) | 1)
+#define PINMUX_GPIO84__FUNC_URTS0			(MTK_PIN_NO(84) | 2)
+#define PINMUX_GPIO84__FUNC_CONN_MCU_DBGACK_N		(MTK_PIN_NO(84) | 3)
+#define PINMUX_GPIO84__FUNC_SCL2			(MTK_PIN_NO(84) | 4)
+#define PINMUX_GPIO84__FUNC_C2K_TDO			(MTK_PIN_NO(84) | 5)
+#define PINMUX_GPIO84__FUNC_AUXIF_CLK			(MTK_PIN_NO(84) | 6)
+
+#define PINMUX_GPIO85__FUNC_GPIO85			(MTK_PIN_NO(85) | 0)
+#define PINMUX_GPIO85__FUNC_KCOL1			(MTK_PIN_NO(85) | 1)
+#define PINMUX_GPIO85__FUNC_UCTS0			(MTK_PIN_NO(85) | 2)
+#define PINMUX_GPIO85__FUNC_UCTS1			(MTK_PIN_NO(85) | 3)
+#define PINMUX_GPIO85__FUNC_SDA2			(MTK_PIN_NO(85) | 4)
+#define PINMUX_GPIO85__FUNC_C2K_TMS			(MTK_PIN_NO(85) | 5)
+#define PINMUX_GPIO85__FUNC_AUXIF_ST			(MTK_PIN_NO(85) | 6)
+#define PINMUX_GPIO85__FUNC_DBG_MON_A31			(MTK_PIN_NO(85) | 7)
+
+#define PINMUX_GPIO86__FUNC_GPIO86			(MTK_PIN_NO(86) | 0)
+#define PINMUX_GPIO86__FUNC_KCOL2			(MTK_PIN_NO(86) | 1)
+#define PINMUX_GPIO86__FUNC_URTS1			(MTK_PIN_NO(86) | 3)
+#define PINMUX_GPIO86__FUNC_C2K_RTCK			(MTK_PIN_NO(86) | 5)
+#define PINMUX_GPIO86__FUNC_DBG_MON_A32			(MTK_PIN_NO(86) | 7)
+
+#define PINMUX_GPIO87__FUNC_GPIO87			(MTK_PIN_NO(87) | 0)
+#define PINMUX_GPIO87__FUNC_BPI_BUS5			(MTK_PIN_NO(87) | 1)
+#define PINMUX_GPIO87__FUNC_LTE_C2K_BPI_BUS5		(MTK_PIN_NO(87) | 2)
+#define PINMUX_GPIO87__FUNC_C2K_BPI_BUS5		(MTK_PIN_NO(87) | 5)
+#define PINMUX_GPIO87__FUNC_DBG_MON_B0			(MTK_PIN_NO(87) | 7)
+
+#define PINMUX_GPIO88__FUNC_GPIO88			(MTK_PIN_NO(88) | 0)
+#define PINMUX_GPIO88__FUNC_BPI_BUS6			(MTK_PIN_NO(88) | 1)
+#define PINMUX_GPIO88__FUNC_LTE_C2K_BPI_BUS6		(MTK_PIN_NO(88) | 2)
+#define PINMUX_GPIO88__FUNC_C2K_BPI_BUS6		(MTK_PIN_NO(88) | 5)
+#define PINMUX_GPIO88__FUNC_DBG_MON_B1			(MTK_PIN_NO(88) | 7)
+
+#define PINMUX_GPIO89__FUNC_GPIO89			(MTK_PIN_NO(89) | 0)
+#define PINMUX_GPIO89__FUNC_BPI_BUS7			(MTK_PIN_NO(89) | 1)
+#define PINMUX_GPIO89__FUNC_LTE_C2K_BPI_BUS7		(MTK_PIN_NO(89) | 2)
+#define PINMUX_GPIO89__FUNC_CLKM0			(MTK_PIN_NO(89) | 3)
+#define PINMUX_GPIO89__FUNC_C2K_BPI_BUS7		(MTK_PIN_NO(89) | 5)
+#define PINMUX_GPIO89__FUNC_DBG_MON_B2			(MTK_PIN_NO(89) | 7)
+
+#define PINMUX_GPIO90__FUNC_GPIO90			(MTK_PIN_NO(90) | 0)
+#define PINMUX_GPIO90__FUNC_BPI_BUS8			(MTK_PIN_NO(90) | 1)
+#define PINMUX_GPIO90__FUNC_LTE_C2K_BPI_BUS8		(MTK_PIN_NO(90) | 2)
+#define PINMUX_GPIO90__FUNC_CLKM1			(MTK_PIN_NO(90) | 3)
+#define PINMUX_GPIO90__FUNC_C2K_BPI_BUS8		(MTK_PIN_NO(90) | 5)
+#define PINMUX_GPIO90__FUNC_DBG_MON_B3			(MTK_PIN_NO(90) | 7)
+
+#define PINMUX_GPIO91__FUNC_GPIO91			(MTK_PIN_NO(91) | 0)
+#define PINMUX_GPIO91__FUNC_BPI_BUS9			(MTK_PIN_NO(91) | 1)
+#define PINMUX_GPIO91__FUNC_LTE_C2K_BPI_BUS9		(MTK_PIN_NO(91) | 2)
+#define PINMUX_GPIO91__FUNC_CLKM2			(MTK_PIN_NO(91) | 3)
+#define PINMUX_GPIO91__FUNC_C2K_BPI_BUS9		(MTK_PIN_NO(91) | 5)
+#define PINMUX_GPIO91__FUNC_DBG_MON_B4			(MTK_PIN_NO(91) | 7)
+
+#define PINMUX_GPIO92__FUNC_GPIO92			(MTK_PIN_NO(92) | 0)
+#define PINMUX_GPIO92__FUNC_BPI_BUS10			(MTK_PIN_NO(92) | 1)
+#define PINMUX_GPIO92__FUNC_LTE_C2K_BPI_BUS10		(MTK_PIN_NO(92) | 2)
+#define PINMUX_GPIO92__FUNC_CLKM3			(MTK_PIN_NO(92) | 3)
+#define PINMUX_GPIO92__FUNC_C2K_BPI_BUS10		(MTK_PIN_NO(92) | 5)
+#define PINMUX_GPIO92__FUNC_DBG_MON_B5			(MTK_PIN_NO(92) | 7)
+
+#define PINMUX_GPIO93__FUNC_GPIO93			(MTK_PIN_NO(93) | 0)
+#define PINMUX_GPIO93__FUNC_BPI_BUS11			(MTK_PIN_NO(93) | 1)
+#define PINMUX_GPIO93__FUNC_LTE_C2K_BPI_BUS11		(MTK_PIN_NO(93) | 2)
+#define PINMUX_GPIO93__FUNC_C2K_BPI_BUS11		(MTK_PIN_NO(93) | 5)
+#define PINMUX_GPIO93__FUNC_DBG_MON_B6			(MTK_PIN_NO(93) | 7)
+
+#define PINMUX_GPIO94__FUNC_GPIO94			(MTK_PIN_NO(94) | 0)
+#define PINMUX_GPIO94__FUNC_BPI_BUS12			(MTK_PIN_NO(94) | 1)
+#define PINMUX_GPIO94__FUNC_LTE_C2K_BPI_BUS12		(MTK_PIN_NO(94) | 2)
+#define PINMUX_GPIO94__FUNC_C2K_BPI_BUS12		(MTK_PIN_NO(94) | 5)
+#define PINMUX_GPIO94__FUNC_DBG_MON_B7			(MTK_PIN_NO(94) | 7)
+
+#define PINMUX_GPIO95__FUNC_GPIO95			(MTK_PIN_NO(95) | 0)
+#define PINMUX_GPIO95__FUNC_BPI_BUS13			(MTK_PIN_NO(95) | 1)
+#define PINMUX_GPIO95__FUNC_LTE_C2K_BPI_BUS13		(MTK_PIN_NO(95) | 2)
+#define PINMUX_GPIO95__FUNC_C2K_BPI_BUS13		(MTK_PIN_NO(95) | 5)
+#define PINMUX_GPIO95__FUNC_DBG_MON_B8			(MTK_PIN_NO(95) | 7)
+
+#define PINMUX_GPIO96__FUNC_GPIO96			(MTK_PIN_NO(96) | 0)
+#define PINMUX_GPIO96__FUNC_BPI_BUS14			(MTK_PIN_NO(96) | 1)
+#define PINMUX_GPIO96__FUNC_LTE_C2K_BPI_BUS14		(MTK_PIN_NO(96) | 2)
+#define PINMUX_GPIO96__FUNC_C2K_BPI_BUS14		(MTK_PIN_NO(96) | 5)
+#define PINMUX_GPIO96__FUNC_DBG_MON_B9			(MTK_PIN_NO(96) | 7)
+
+#define PINMUX_GPIO97__FUNC_GPIO97			(MTK_PIN_NO(97) | 0)
+#define PINMUX_GPIO97__FUNC_BPI_BUS15			(MTK_PIN_NO(97) | 1)
+#define PINMUX_GPIO97__FUNC_LTE_C2K_BPI_BUS15		(MTK_PIN_NO(97) | 2)
+#define PINMUX_GPIO97__FUNC_C2K_BPI_BUS15		(MTK_PIN_NO(97) | 5)
+#define PINMUX_GPIO97__FUNC_DBG_MON_B10			(MTK_PIN_NO(97) | 7)
+
+#define PINMUX_GPIO98__FUNC_GPIO98			(MTK_PIN_NO(98) | 0)
+#define PINMUX_GPIO98__FUNC_BPI_BUS16			(MTK_PIN_NO(98) | 1)
+#define PINMUX_GPIO98__FUNC_LTE_C2K_BPI_BUS16		(MTK_PIN_NO(98) | 2)
+#define PINMUX_GPIO98__FUNC_C2K_BPI_BUS16		(MTK_PIN_NO(98) | 5)
+#define PINMUX_GPIO98__FUNC_DBG_MON_B11			(MTK_PIN_NO(98) | 7)
+
+#define PINMUX_GPIO99__FUNC_GPIO99			(MTK_PIN_NO(99) | 0)
+#define PINMUX_GPIO99__FUNC_BPI_BUS17			(MTK_PIN_NO(99) | 1)
+#define PINMUX_GPIO99__FUNC_LTE_C2K_BPI_BUS17		(MTK_PIN_NO(99) | 2)
+#define PINMUX_GPIO99__FUNC_C2K_BPI_BUS17		(MTK_PIN_NO(99) | 5)
+#define PINMUX_GPIO99__FUNC_DBG_MON_B12			(MTK_PIN_NO(99) | 7)
+
+#define PINMUX_GPIO100__FUNC_GPIO100			(MTK_PIN_NO(100) | 0)
+#define PINMUX_GPIO100__FUNC_BPI_BUS18			(MTK_PIN_NO(100) | 1)
+#define PINMUX_GPIO100__FUNC_LTE_C2K_BPI_BUS18		(MTK_PIN_NO(100) | 2)
+#define PINMUX_GPIO100__FUNC_C2K_BPI_BUS18		(MTK_PIN_NO(100) | 5)
+#define PINMUX_GPIO100__FUNC_DBG_MON_B13		(MTK_PIN_NO(100) | 7)
+
+#define PINMUX_GPIO101__FUNC_GPIO101			(MTK_PIN_NO(101) | 0)
+#define PINMUX_GPIO101__FUNC_BPI_BUS19			(MTK_PIN_NO(101) | 1)
+#define PINMUX_GPIO101__FUNC_LTE_C2K_BPI_BUS19		(MTK_PIN_NO(101) | 2)
+#define PINMUX_GPIO101__FUNC_C2K_BPI_BUS19		(MTK_PIN_NO(101) | 5)
+#define PINMUX_GPIO101__FUNC_DBG_MON_B14		(MTK_PIN_NO(101) | 7)
+
+#define PINMUX_GPIO102__FUNC_GPIO102			(MTK_PIN_NO(102) | 0)
+#define PINMUX_GPIO102__FUNC_BPI_BUS20			(MTK_PIN_NO(102) | 1)
+#define PINMUX_GPIO102__FUNC_LTE_C2K_BPI_BUS20		(MTK_PIN_NO(102) | 2)
+#define PINMUX_GPIO102__FUNC_C2K_BPI_BUS20		(MTK_PIN_NO(102) | 5)
+#define PINMUX_GPIO102__FUNC_DBG_MON_B15		(MTK_PIN_NO(102) | 7)
+
+#define PINMUX_GPIO103__FUNC_GPIO103			(MTK_PIN_NO(103) | 0)
+#define PINMUX_GPIO103__FUNC_C2K_TXBPI			(MTK_PIN_NO(103) | 1)
+#define PINMUX_GPIO103__FUNC_DBG_MON_B16		(MTK_PIN_NO(103) | 7)
+
+#define PINMUX_GPIO104__FUNC_GPIO104			(MTK_PIN_NO(104) | 0)
+#define PINMUX_GPIO104__FUNC_RFIC1_BSI_EN		(MTK_PIN_NO(104) | 1)
+#define PINMUX_GPIO104__FUNC_C2K_RX_BSI_EN		(MTK_PIN_NO(104) | 5)
+#define PINMUX_GPIO104__FUNC_DBG_MON_B17		(MTK_PIN_NO(104) | 7)
+
+#define PINMUX_GPIO105__FUNC_GPIO105			(MTK_PIN_NO(105) | 0)
+#define PINMUX_GPIO105__FUNC_RFIC1_BSI_CK		(MTK_PIN_NO(105) | 1)
+#define PINMUX_GPIO105__FUNC_C2K_RX_BSI_CLK		(MTK_PIN_NO(105) | 5)
+#define PINMUX_GPIO105__FUNC_DBG_MON_B18		(MTK_PIN_NO(105) | 7)
+
+#define PINMUX_GPIO106__FUNC_GPIO106			(MTK_PIN_NO(106) | 0)
+#define PINMUX_GPIO106__FUNC_RFIC1_BSI_D0		(MTK_PIN_NO(106) | 1)
+#define PINMUX_GPIO106__FUNC_C2K_RX_BSI_DATA		(MTK_PIN_NO(106) | 5)
+#define PINMUX_GPIO106__FUNC_DBG_MON_B19		(MTK_PIN_NO(106) | 7)
+
+#define PINMUX_GPIO107__FUNC_GPIO107			(MTK_PIN_NO(107) | 0)
+#define PINMUX_GPIO107__FUNC_RFIC1_BSI_D1		(MTK_PIN_NO(107) | 1)
+#define PINMUX_GPIO107__FUNC_C2K_TX_BSI_EN		(MTK_PIN_NO(107) | 5)
+#define PINMUX_GPIO107__FUNC_DBG_MON_B20		(MTK_PIN_NO(107) | 7)
+
+#define PINMUX_GPIO108__FUNC_GPIO108			(MTK_PIN_NO(108) | 0)
+#define PINMUX_GPIO108__FUNC_RFIC1_BSI_D2		(MTK_PIN_NO(108) | 1)
+#define PINMUX_GPIO108__FUNC_C2K_TX_BSI_CLK		(MTK_PIN_NO(108) | 5)
+#define PINMUX_GPIO108__FUNC_DBG_MON_B21		(MTK_PIN_NO(108) | 7)
+
+#define PINMUX_GPIO109__FUNC_GPIO109			(MTK_PIN_NO(109) | 0)
+#define PINMUX_GPIO109__FUNC_C2K_TX_BSI_DATA		(MTK_PIN_NO(109) | 5)
+#define PINMUX_GPIO109__FUNC_DBG_MON_B22		(MTK_PIN_NO(109) | 7)
+
+#define PINMUX_GPIO110__FUNC_GPIO110			(MTK_PIN_NO(110) | 0)
+#define PINMUX_GPIO110__FUNC_RFIC0_BSI_EN		(MTK_PIN_NO(110) | 1)
+#define PINMUX_GPIO110__FUNC_SPM_BSI_EN			(MTK_PIN_NO(110) | 4)
+#define PINMUX_GPIO110__FUNC_DBG_MON_B23		(MTK_PIN_NO(110) | 7)
+
+#define PINMUX_GPIO111__FUNC_GPIO111			(MTK_PIN_NO(111) | 0)
+#define PINMUX_GPIO111__FUNC_RFIC0_BSI_CK		(MTK_PIN_NO(111) | 1)
+#define PINMUX_GPIO111__FUNC_SPM_BSI_CLK		(MTK_PIN_NO(111) | 4)
+#define PINMUX_GPIO111__FUNC_DBG_MON_B24		(MTK_PIN_NO(111) | 7)
+
+#define PINMUX_GPIO112__FUNC_GPIO112			(MTK_PIN_NO(112) | 0)
+#define PINMUX_GPIO112__FUNC_RFIC0_BSI_D2		(MTK_PIN_NO(112) | 1)
+#define PINMUX_GPIO112__FUNC_SPM_BSI_D2			(MTK_PIN_NO(112) | 4)
+#define PINMUX_GPIO112__FUNC_DBG_MON_B25		(MTK_PIN_NO(112) | 7)
+
+#define PINMUX_GPIO113__FUNC_GPIO113			(MTK_PIN_NO(113) | 0)
+#define PINMUX_GPIO113__FUNC_RFIC0_BSI_D1		(MTK_PIN_NO(113) | 1)
+#define PINMUX_GPIO113__FUNC_SPM_BSI_D1			(MTK_PIN_NO(113) | 4)
+#define PINMUX_GPIO113__FUNC_DBG_MON_B26		(MTK_PIN_NO(113) | 7)
+
+#define PINMUX_GPIO114__FUNC_GPIO114			(MTK_PIN_NO(114) | 0)
+#define PINMUX_GPIO114__FUNC_RFIC0_BSI_D0		(MTK_PIN_NO(114) | 1)
+#define PINMUX_GPIO114__FUNC_SPM_BSI_D0			(MTK_PIN_NO(114) | 4)
+#define PINMUX_GPIO114__FUNC_DBG_MON_B27		(MTK_PIN_NO(114) | 7)
+
+#define PINMUX_GPIO115__FUNC_GPIO115			(MTK_PIN_NO(115) | 0)
+#define PINMUX_GPIO115__FUNC_AUXIN0			(MTK_PIN_NO(115) | 1)
+
+#define PINMUX_GPIO116__FUNC_GPIO116			(MTK_PIN_NO(116) | 0)
+#define PINMUX_GPIO116__FUNC_AUXIN1			(MTK_PIN_NO(116) | 1)
+
+#define PINMUX_GPIO117__FUNC_GPIO117			(MTK_PIN_NO(117) | 0)
+#define PINMUX_GPIO117__FUNC_AUXIN2			(MTK_PIN_NO(117) | 1)
+
+#define PINMUX_GPIO118__FUNC_GPIO118			(MTK_PIN_NO(118) | 0)
+#define PINMUX_GPIO118__FUNC_TXBPI			(MTK_PIN_NO(118) | 1)
+
+#define PINMUX_GPIO119__FUNC_GPIO119			(MTK_PIN_NO(119) | 0)
+#define PINMUX_GPIO119__FUNC_BPI_BUS0			(MTK_PIN_NO(119) | 1)
+#define PINMUX_GPIO119__FUNC_DBG_MON_B28		(MTK_PIN_NO(119) | 7)
+
+#define PINMUX_GPIO120__FUNC_GPIO120			(MTK_PIN_NO(120) | 0)
+#define PINMUX_GPIO120__FUNC_BPI_BUS1			(MTK_PIN_NO(120) | 1)
+#define PINMUX_GPIO120__FUNC_DBG_MON_B29		(MTK_PIN_NO(120) | 7)
+
+#define PINMUX_GPIO121__FUNC_GPIO121			(MTK_PIN_NO(121) | 0)
+#define PINMUX_GPIO121__FUNC_BPI_BUS2			(MTK_PIN_NO(121) | 1)
+#define PINMUX_GPIO121__FUNC_DBG_MON_B30		(MTK_PIN_NO(121) | 7)
+
+#define PINMUX_GPIO122__FUNC_GPIO122			(MTK_PIN_NO(122) | 0)
+#define PINMUX_GPIO122__FUNC_BPI_BUS3			(MTK_PIN_NO(122) | 1)
+#define PINMUX_GPIO122__FUNC_DBG_MON_B31		(MTK_PIN_NO(122) | 7)
+
+#define PINMUX_GPIO123__FUNC_GPIO123			(MTK_PIN_NO(123) | 0)
+#define PINMUX_GPIO123__FUNC_BPI_BUS4			(MTK_PIN_NO(123) | 1)
+#define PINMUX_GPIO123__FUNC_DBG_MON_B32		(MTK_PIN_NO(123) | 7)
+
+#define PINMUX_GPIO124__FUNC_GPIO124			(MTK_PIN_NO(124) | 0)
+#define PINMUX_GPIO124__FUNC_BPI_BUS21			(MTK_PIN_NO(124) | 1)
+#define PINMUX_GPIO124__FUNC_DPI_HSYNC1			(MTK_PIN_NO(124) | 5)
+#define PINMUX_GPIO124__FUNC_KCOL2			(MTK_PIN_NO(124) | 6)
+#define PINMUX_GPIO124__FUNC_TDD_TXD			(MTK_PIN_NO(124) | 7)
+
+#define PINMUX_GPIO125__FUNC_GPIO125			(MTK_PIN_NO(125) | 0)
+#define PINMUX_GPIO125__FUNC_BPI_BUS22			(MTK_PIN_NO(125) | 1)
+#define PINMUX_GPIO125__FUNC_DPI_VSYNC1			(MTK_PIN_NO(125) | 5)
+#define PINMUX_GPIO125__FUNC_KROW2			(MTK_PIN_NO(125) | 6)
+#define PINMUX_GPIO125__FUNC_MD_URXD			(MTK_PIN_NO(125) | 7)
+
+#define PINMUX_GPIO126__FUNC_GPIO126			(MTK_PIN_NO(126) | 0)
+#define PINMUX_GPIO126__FUNC_BPI_BUS23			(MTK_PIN_NO(126) | 1)
+#define PINMUX_GPIO126__FUNC_DPI_CK1			(MTK_PIN_NO(126) | 5)
+#define PINMUX_GPIO126__FUNC_I2S2_MCK			(MTK_PIN_NO(126) | 6)
+#define PINMUX_GPIO126__FUNC_MD_UTXD			(MTK_PIN_NO(126) | 7)
+
+#define PINMUX_GPIO127__FUNC_GPIO127			(MTK_PIN_NO(127) | 0)
+#define PINMUX_GPIO127__FUNC_BPI_BUS24			(MTK_PIN_NO(127) | 1)
+#define PINMUX_GPIO127__FUNC_CONN_MCU_DBGI_N		(MTK_PIN_NO(127) | 3)
+#define PINMUX_GPIO127__FUNC_EXT_FRAME_SYNC		(MTK_PIN_NO(127) | 4)
+#define PINMUX_GPIO127__FUNC_DPI_DE1			(MTK_PIN_NO(127) | 5)
+#define PINMUX_GPIO127__FUNC_SRCLKENAI1			(MTK_PIN_NO(127) | 6)
+#define PINMUX_GPIO127__FUNC_URXD0			(MTK_PIN_NO(127) | 7)
+
+#define PINMUX_GPIO128__FUNC_GPIO128			(MTK_PIN_NO(128) | 0)
+#define PINMUX_GPIO128__FUNC_BPI_BUS25			(MTK_PIN_NO(128) | 1)
+#define PINMUX_GPIO128__FUNC_GPS_FRAME_SYNC		(MTK_PIN_NO(128) | 3)
+#define PINMUX_GPIO128__FUNC_I2S2_DI			(MTK_PIN_NO(128) | 5)
+#define PINMUX_GPIO128__FUNC_PTA_RXD			(MTK_PIN_NO(128) | 6)
+#define PINMUX_GPIO128__FUNC_UTXD0			(MTK_PIN_NO(128) | 7)
+
+#define PINMUX_GPIO129__FUNC_GPIO129			(MTK_PIN_NO(129) | 0)
+#define PINMUX_GPIO129__FUNC_BPI_BUS26			(MTK_PIN_NO(129) | 1)
+#define PINMUX_GPIO129__FUNC_DISP_PWM			(MTK_PIN_NO(129) | 2)
+#define PINMUX_GPIO129__FUNC_I2S2_LRCK			(MTK_PIN_NO(129) | 5)
+#define PINMUX_GPIO129__FUNC_PTA_TXD			(MTK_PIN_NO(129) | 6)
+#define PINMUX_GPIO129__FUNC_LTE_URXD			(MTK_PIN_NO(129) | 7)
+
+#define PINMUX_GPIO130__FUNC_GPIO130			(MTK_PIN_NO(130) | 0)
+#define PINMUX_GPIO130__FUNC_BPI_BUS27			(MTK_PIN_NO(130) | 1)
+#define PINMUX_GPIO130__FUNC_I2S2_BCK			(MTK_PIN_NO(130) | 5)
+#define PINMUX_GPIO130__FUNC_IRTX_OUT			(MTK_PIN_NO(130) | 6)
+#define PINMUX_GPIO130__FUNC_LTE_UTXD			(MTK_PIN_NO(130) | 7)
+
+#define PINMUX_GPIO131__FUNC_GPIO131			(MTK_PIN_NO(131) | 0)
+#define PINMUX_GPIO131__FUNC_LTE_PAVM0			(MTK_PIN_NO(131) | 1)
+
+#define PINMUX_GPIO132__FUNC_GPIO132			(MTK_PIN_NO(132) | 0)
+#define PINMUX_GPIO132__FUNC_LTE_PAVM1			(MTK_PIN_NO(132) | 1)
+
+#define PINMUX_GPIO133__FUNC_GPIO133			(MTK_PIN_NO(133) | 0)
+#define PINMUX_GPIO133__FUNC_MIPI1_SCLK			(MTK_PIN_NO(133) | 1)
+
+#define PINMUX_GPIO134__FUNC_GPIO134			(MTK_PIN_NO(134) | 0)
+#define PINMUX_GPIO134__FUNC_MIPI1_SDATA		(MTK_PIN_NO(134) | 1)
+
+#define PINMUX_GPIO135__FUNC_GPIO135			(MTK_PIN_NO(135) | 0)
+#define PINMUX_GPIO135__FUNC_MIPI0_SCLK			(MTK_PIN_NO(135) | 1)
+
+#define PINMUX_GPIO136__FUNC_GPIO136			(MTK_PIN_NO(136) | 0)
+#define PINMUX_GPIO136__FUNC_MIPI0_SDATA		(MTK_PIN_NO(136) | 1)
+
+#define PINMUX_GPIO137__FUNC_GPIO137			(MTK_PIN_NO(137) | 0)
+#define PINMUX_GPIO137__FUNC_RTC32K_CK			(MTK_PIN_NO(137) | 1)
+
+#define PINMUX_GPIO138__FUNC_GPIO138			(MTK_PIN_NO(138) | 0)
+#define PINMUX_GPIO138__FUNC_PWRAP_SPIDO		(MTK_PIN_NO(138) | 1)
+#define PINMUX_GPIO138__FUNC_PWRAP_SPIDI		(MTK_PIN_NO(138) | 2)
+
+#define PINMUX_GPIO139__FUNC_GPIO139			(MTK_PIN_NO(139) | 0)
+#define PINMUX_GPIO139__FUNC_PWRAP_SPIDI		(MTK_PIN_NO(139) | 1)
+#define PINMUX_GPIO139__FUNC_PWRAP_SPIDO		(MTK_PIN_NO(139) | 2)
+
+#define PINMUX_GPIO140__FUNC_GPIO140			(MTK_PIN_NO(140) | 0)
+#define PINMUX_GPIO140__FUNC_LTE_MD32_JTAG_TRST		(MTK_PIN_NO(140) | 3)
+#define PINMUX_GPIO140__FUNC_TDD_TRSTN			(MTK_PIN_NO(140) | 4)
+#define PINMUX_GPIO140__FUNC_DM_JTINTP			(MTK_PIN_NO(140) | 5)
+
+#define PINMUX_GPIO141__FUNC_GPIO141			(MTK_PIN_NO(141) | 0)
+#define PINMUX_GPIO141__FUNC_PWRAP_SPICK_I		(MTK_PIN_NO(141) | 1)
+
+#define PINMUX_GPIO142__FUNC_GPIO142			(MTK_PIN_NO(142) | 0)
+#define PINMUX_GPIO142__FUNC_PWRAP_SPICS_B_I		(MTK_PIN_NO(142) | 1)
+
+#define PINMUX_GPIO143__FUNC_GPIO143			(MTK_PIN_NO(143) | 0)
+#define PINMUX_GPIO143__FUNC_AUD_CLK_MOSI		(MTK_PIN_NO(143) | 1)
+
+#define PINMUX_GPIO144__FUNC_GPIO144			(MTK_PIN_NO(144) | 0)
+#define PINMUX_GPIO144__FUNC_AUD_DAT_MISO		(MTK_PIN_NO(144) | 1)
+#define PINMUX_GPIO144__FUNC_AUD_DAT_MOSI		(MTK_PIN_NO(144) | 3)
+
+#define PINMUX_GPIO145__FUNC_GPIO145			(MTK_PIN_NO(145) | 0)
+#define PINMUX_GPIO145__FUNC_AUD_DAT_MOSI		(MTK_PIN_NO(145) | 1)
+#define PINMUX_GPIO145__FUNC_AUD_DAT_MISO		(MTK_PIN_NO(145) | 3)
+
+#define PINMUX_GPIO146__FUNC_GPIO146			(MTK_PIN_NO(146) | 0)
+#define PINMUX_GPIO146__FUNC_LCM_RST			(MTK_PIN_NO(146) | 1)
+
+#define PINMUX_GPIO147__FUNC_GPIO147			(MTK_PIN_NO(147) | 0)
+#define PINMUX_GPIO147__FUNC_DSI_TE			(MTK_PIN_NO(147) | 1)
+
+#define PINMUX_GPIO148__FUNC_GPIO148			(MTK_PIN_NO(148) | 0)
+#define PINMUX_GPIO148__FUNC_SRCLKENA			(MTK_PIN_NO(148) | 1)
+
+#define PINMUX_GPIO149__FUNC_GPIO149			(MTK_PIN_NO(149) | 0)
+#define PINMUX_GPIO149__FUNC_WATCHDOG			(MTK_PIN_NO(149) | 1)
+
+#define PINMUX_GPIO150__FUNC_GPIO150			(MTK_PIN_NO(150) | 0)
+#define PINMUX_GPIO150__FUNC_TDP0			(MTK_PIN_NO(150) | 1)
+
+#define PINMUX_GPIO151__FUNC_GPIO151			(MTK_PIN_NO(151) | 0)
+#define PINMUX_GPIO151__FUNC_TDN0			(MTK_PIN_NO(151) | 1)
+
+#define PINMUX_GPIO152__FUNC_GPIO152			(MTK_PIN_NO(152) | 0)
+#define PINMUX_GPIO152__FUNC_TDP1			(MTK_PIN_NO(152) | 1)
+
+#define PINMUX_GPIO153__FUNC_GPIO153			(MTK_PIN_NO(153) | 0)
+#define PINMUX_GPIO153__FUNC_TDN1			(MTK_PIN_NO(153) | 1)
+
+#define PINMUX_GPIO154__FUNC_GPIO154			(MTK_PIN_NO(154) | 0)
+#define PINMUX_GPIO154__FUNC_TCP			(MTK_PIN_NO(154) | 1)
+
+#define PINMUX_GPIO155__FUNC_GPIO155			(MTK_PIN_NO(155) | 0)
+#define PINMUX_GPIO155__FUNC_TCN			(MTK_PIN_NO(155) | 1)
+
+#define PINMUX_GPIO156__FUNC_GPIO156			(MTK_PIN_NO(156) | 0)
+#define PINMUX_GPIO156__FUNC_TDP2			(MTK_PIN_NO(156) | 1)
+
+#define PINMUX_GPIO157__FUNC_GPIO157			(MTK_PIN_NO(157) | 0)
+#define PINMUX_GPIO157__FUNC_TDN2			(MTK_PIN_NO(157) | 1)
+
+#define PINMUX_GPIO158__FUNC_GPIO158			(MTK_PIN_NO(158) | 0)
+#define PINMUX_GPIO158__FUNC_TDP3			(MTK_PIN_NO(158) | 1)
+
+#define PINMUX_GPIO159__FUNC_GPIO159			(MTK_PIN_NO(159) | 0)
+#define PINMUX_GPIO159__FUNC_TDN3			(MTK_PIN_NO(159) | 1)
+
+#define PINMUX_GPIO160__FUNC_GPIO160			(MTK_PIN_NO(160) | 0)
+#define PINMUX_GPIO160__FUNC_MD_SIM2_SCLK		(MTK_PIN_NO(160) | 1)
+#define PINMUX_GPIO160__FUNC_MD_SIM1_SCLK		(MTK_PIN_NO(160) | 2)
+#define PINMUX_GPIO160__FUNC_UIM0_CLK			(MTK_PIN_NO(160) | 3)
+#define PINMUX_GPIO160__FUNC_UIM1_CLK			(MTK_PIN_NO(160) | 4)
+
+#define PINMUX_GPIO161__FUNC_GPIO161			(MTK_PIN_NO(161) | 0)
+#define PINMUX_GPIO161__FUNC_MD_SIM2_SRST		(MTK_PIN_NO(161) | 1)
+#define PINMUX_GPIO161__FUNC_MD_SIM1_SRST		(MTK_PIN_NO(161) | 2)
+#define PINMUX_GPIO161__FUNC_UIM0_RST			(MTK_PIN_NO(161) | 3)
+#define PINMUX_GPIO161__FUNC_UIM1_RST			(MTK_PIN_NO(161) | 4)
+
+#define PINMUX_GPIO162__FUNC_GPIO162			(MTK_PIN_NO(162) | 0)
+#define PINMUX_GPIO162__FUNC_MD_SIM2_SDAT		(MTK_PIN_NO(162) | 1)
+#define PINMUX_GPIO162__FUNC_MD_SIM1_SDAT		(MTK_PIN_NO(162) | 2)
+#define PINMUX_GPIO162__FUNC_UIM0_IO			(MTK_PIN_NO(162) | 3)
+#define PINMUX_GPIO162__FUNC_UIM1_IO			(MTK_PIN_NO(162) | 4)
+
+#define PINMUX_GPIO163__FUNC_GPIO163			(MTK_PIN_NO(163) | 0)
+#define PINMUX_GPIO163__FUNC_MD_SIM1_SCLK		(MTK_PIN_NO(163) | 1)
+#define PINMUX_GPIO163__FUNC_MD_SIM2_SCLK		(MTK_PIN_NO(163) | 2)
+#define PINMUX_GPIO163__FUNC_UIM1_CLK			(MTK_PIN_NO(163) | 3)
+#define PINMUX_GPIO163__FUNC_UIM0_CLK			(MTK_PIN_NO(163) | 4)
+
+#define PINMUX_GPIO164__FUNC_GPIO164			(MTK_PIN_NO(164) | 0)
+#define PINMUX_GPIO164__FUNC_MD_SIM1_SRST		(MTK_PIN_NO(164) | 1)
+#define PINMUX_GPIO164__FUNC_MD_SIM2_SRST		(MTK_PIN_NO(164) | 2)
+#define PINMUX_GPIO164__FUNC_UIM1_RST			(MTK_PIN_NO(164) | 3)
+#define PINMUX_GPIO164__FUNC_UIM0_RST			(MTK_PIN_NO(164) | 4)
+
+#define PINMUX_GPIO165__FUNC_GPIO165			(MTK_PIN_NO(165) | 0)
+#define PINMUX_GPIO165__FUNC_MD_SIM1_SDAT		(MTK_PIN_NO(165) | 1)
+#define PINMUX_GPIO165__FUNC_MD_SIM2_SDAT		(MTK_PIN_NO(165) | 2)
+#define PINMUX_GPIO165__FUNC_UIM1_IO			(MTK_PIN_NO(165) | 3)
+#define PINMUX_GPIO165__FUNC_UIM0_IO			(MTK_PIN_NO(165) | 4)
+
+#define PINMUX_GPIO166__FUNC_GPIO166			(MTK_PIN_NO(166) | 0)
+#define PINMUX_GPIO166__FUNC_MSDC1_CMD			(MTK_PIN_NO(166) | 1)
+#define PINMUX_GPIO166__FUNC_LTE_MD32_JTAG_TMS		(MTK_PIN_NO(166) | 2)
+#define PINMUX_GPIO166__FUNC_C2K_TMS			(MTK_PIN_NO(166) | 3)
+#define PINMUX_GPIO166__FUNC_TDD_TMS			(MTK_PIN_NO(166) | 4)
+#define PINMUX_GPIO166__FUNC_CONN_DSP_JMS		(MTK_PIN_NO(166) | 5)
+#define PINMUX_GPIO166__FUNC_JTMS			(MTK_PIN_NO(166) | 6)
+#define PINMUX_GPIO166__FUNC_CONN_MCU_AICE_TMSC		(MTK_PIN_NO(166) | 7)
+
+#define PINMUX_GPIO167__FUNC_GPIO167			(MTK_PIN_NO(167) | 0)
+#define PINMUX_GPIO167__FUNC_MSDC1_CLK			(MTK_PIN_NO(167) | 1)
+#define PINMUX_GPIO167__FUNC_LTE_MD32_JTAG_TCK		(MTK_PIN_NO(167) | 2)
+#define PINMUX_GPIO167__FUNC_C2K_TCK			(MTK_PIN_NO(167) | 3)
+#define PINMUX_GPIO167__FUNC_TDD_TCK			(MTK_PIN_NO(167) | 4)
+#define PINMUX_GPIO167__FUNC_CONN_DSP_JCK		(MTK_PIN_NO(167) | 5)
+#define PINMUX_GPIO167__FUNC_JTCK			(MTK_PIN_NO(167) | 6)
+#define PINMUX_GPIO167__FUNC_CONN_MCU_AICE_TCKC		(MTK_PIN_NO(167) | 7)
+
+#define PINMUX_GPIO168__FUNC_GPIO168			(MTK_PIN_NO(168) | 0)
+#define PINMUX_GPIO168__FUNC_MSDC1_DAT0			(MTK_PIN_NO(168) | 1)
+#define PINMUX_GPIO168__FUNC_LTE_MD32_JTAG_TDI		(MTK_PIN_NO(168) | 2)
+#define PINMUX_GPIO168__FUNC_C2K_TDI			(MTK_PIN_NO(168) | 3)
+#define PINMUX_GPIO168__FUNC_TDD_TDI			(MTK_PIN_NO(168) | 4)
+#define PINMUX_GPIO168__FUNC_CONN_DSP_JDI		(MTK_PIN_NO(168) | 5)
+#define PINMUX_GPIO168__FUNC_JTDI			(MTK_PIN_NO(168) | 6)
+
+#define PINMUX_GPIO169__FUNC_GPIO169			(MTK_PIN_NO(169) | 0)
+#define PINMUX_GPIO169__FUNC_MSDC1_DAT1			(MTK_PIN_NO(169) | 1)
+#define PINMUX_GPIO169__FUNC_LTE_MD32_JTAG_TDO		(MTK_PIN_NO(169) | 2)
+#define PINMUX_GPIO169__FUNC_C2K_TDO			(MTK_PIN_NO(169) | 3)
+#define PINMUX_GPIO169__FUNC_TDD_TDO			(MTK_PIN_NO(169) | 4)
+#define PINMUX_GPIO169__FUNC_CONN_DSP_JDO		(MTK_PIN_NO(169) | 5)
+#define PINMUX_GPIO169__FUNC_JTDO			(MTK_PIN_NO(169) | 6)
+
+#define PINMUX_GPIO170__FUNC_GPIO170			(MTK_PIN_NO(170) | 0)
+#define PINMUX_GPIO170__FUNC_MSDC1_DAT2			(MTK_PIN_NO(170) | 1)
+#define PINMUX_GPIO170__FUNC_LTE_MD32_JTAG_TRST		(MTK_PIN_NO(170) | 2)
+#define PINMUX_GPIO170__FUNC_C2K_NTRST			(MTK_PIN_NO(170) | 3)
+#define PINMUX_GPIO170__FUNC_TDD_TRSTN			(MTK_PIN_NO(170) | 4)
+#define PINMUX_GPIO170__FUNC_CONN_DSP_JINTP		(MTK_PIN_NO(170) | 5)
+#define PINMUX_GPIO170__FUNC_DM_JTINTP			(MTK_PIN_NO(170) | 6)
+
+#define PINMUX_GPIO171__FUNC_GPIO171			(MTK_PIN_NO(171) | 0)
+#define PINMUX_GPIO171__FUNC_MSDC1_DAT3			(MTK_PIN_NO(171) | 1)
+#define PINMUX_GPIO171__FUNC_C2K_RTCK			(MTK_PIN_NO(171) | 3)
+
+#define PINMUX_GPIO172__FUNC_GPIO172			(MTK_PIN_NO(172) | 0)
+#define PINMUX_GPIO172__FUNC_MSDC0_CMD			(MTK_PIN_NO(172) | 1)
+
+#define PINMUX_GPIO173__FUNC_GPIO173			(MTK_PIN_NO(173) | 0)
+#define PINMUX_GPIO173__FUNC_MSDC0_DSL			(MTK_PIN_NO(173) | 1)
+
+#define PINMUX_GPIO174__FUNC_GPIO174			(MTK_PIN_NO(174) | 0)
+#define PINMUX_GPIO174__FUNC_MSDC0_CLK			(MTK_PIN_NO(174) | 1)
+
+#define PINMUX_GPIO175__FUNC_GPIO175			(MTK_PIN_NO(175) | 0)
+#define PINMUX_GPIO175__FUNC_MSDC0_DAT0			(MTK_PIN_NO(175) | 1)
+
+#define PINMUX_GPIO176__FUNC_GPIO176			(MTK_PIN_NO(176) | 0)
+#define PINMUX_GPIO176__FUNC_MSDC0_DAT1			(MTK_PIN_NO(176) | 1)
+
+#define PINMUX_GPIO177__FUNC_GPIO177			(MTK_PIN_NO(177) | 0)
+#define PINMUX_GPIO177__FUNC_MSDC0_DAT2			(MTK_PIN_NO(177) | 1)
+
+#define PINMUX_GPIO178__FUNC_GPIO178			(MTK_PIN_NO(178) | 0)
+#define PINMUX_GPIO178__FUNC_MSDC0_DAT3			(MTK_PIN_NO(178) | 1)
+
+#define PINMUX_GPIO179__FUNC_GPIO179			(MTK_PIN_NO(179) | 0)
+#define PINMUX_GPIO179__FUNC_MSDC0_DAT4			(MTK_PIN_NO(179) | 1)
+
+#define PINMUX_GPIO180__FUNC_GPIO180			(MTK_PIN_NO(180) | 0)
+#define PINMUX_GPIO180__FUNC_MSDC0_DAT5			(MTK_PIN_NO(180) | 1)
+
+#define PINMUX_GPIO181__FUNC_GPIO181			(MTK_PIN_NO(181) | 0)
+#define PINMUX_GPIO181__FUNC_MSDC0_DAT6			(MTK_PIN_NO(181) | 1)
+
+#define PINMUX_GPIO182__FUNC_GPIO182			(MTK_PIN_NO(182) | 0)
+#define PINMUX_GPIO182__FUNC_MSDC0_DAT7			(MTK_PIN_NO(182) | 1)
+
+#define PINMUX_GPIO183__FUNC_GPIO183			(MTK_PIN_NO(183) | 0)
+#define PINMUX_GPIO183__FUNC_MSDC0_RSTB			(MTK_PIN_NO(183) | 1)
+
+#define PINMUX_GPIO184__FUNC_GPIO184			(MTK_PIN_NO(184) | 0)
+#define PINMUX_GPIO184__FUNC_F2W_DATA			(MTK_PIN_NO(184) | 1)
+#define PINMUX_GPIO184__FUNC_MRG_CLK			(MTK_PIN_NO(184) | 2)
+#define PINMUX_GPIO184__FUNC_C2K_DM_EINT2		(MTK_PIN_NO(184) | 3)
+#define PINMUX_GPIO184__FUNC_PCM0_CLK			(MTK_PIN_NO(184) | 4)
+
+#define PINMUX_GPIO185__FUNC_GPIO185			(MTK_PIN_NO(185) | 0)
+#define PINMUX_GPIO185__FUNC_F2W_CK			(MTK_PIN_NO(185) | 1)
+#define PINMUX_GPIO185__FUNC_MRG_DI			(MTK_PIN_NO(185) | 2)
+#define PINMUX_GPIO185__FUNC_C2K_DM_EINT3		(MTK_PIN_NO(185) | 3)
+#define PINMUX_GPIO185__FUNC_PCM0_DI			(MTK_PIN_NO(185) | 4)
+
+#define PINMUX_GPIO186__FUNC_GPIO186			(MTK_PIN_NO(186) | 0)
+#define PINMUX_GPIO186__FUNC_WB_RSTB			(MTK_PIN_NO(186) | 1)
+#define PINMUX_GPIO186__FUNC_URXD3			(MTK_PIN_NO(186) | 4)
+#define PINMUX_GPIO186__FUNC_UTXD3			(MTK_PIN_NO(186) | 5)
+
+#define PINMUX_GPIO187__FUNC_GPIO187			(MTK_PIN_NO(187) | 0)
+#define PINMUX_GPIO187__FUNC_WB_SCLK			(MTK_PIN_NO(187) | 1)
+#define PINMUX_GPIO187__FUNC_MRG_DO			(MTK_PIN_NO(187) | 2)
+#define PINMUX_GPIO187__FUNC_PCM0_DO			(MTK_PIN_NO(187) | 4)
+
+#define PINMUX_GPIO188__FUNC_GPIO188			(MTK_PIN_NO(188) | 0)
+#define PINMUX_GPIO188__FUNC_WB_SDATA			(MTK_PIN_NO(188) | 1)
+#define PINMUX_GPIO188__FUNC_MRG_SYNC			(MTK_PIN_NO(188) | 2)
+#define PINMUX_GPIO188__FUNC_PCM0_SYNC			(MTK_PIN_NO(188) | 4)
+
+#define PINMUX_GPIO189__FUNC_GPIO189			(MTK_PIN_NO(189) | 0)
+#define PINMUX_GPIO189__FUNC_WB_SEN			(MTK_PIN_NO(189) | 1)
+#define PINMUX_GPIO189__FUNC_UTXD3			(MTK_PIN_NO(189) | 4)
+#define PINMUX_GPIO189__FUNC_URXD3			(MTK_PIN_NO(189) | 5)
+
+#define PINMUX_GPIO190__FUNC_GPIO190			(MTK_PIN_NO(190) | 0)
+#define PINMUX_GPIO190__FUNC_GPS_RXQN			(MTK_PIN_NO(190) | 1)
+
+#define PINMUX_GPIO191__FUNC_GPIO191			(MTK_PIN_NO(191) | 0)
+#define PINMUX_GPIO191__FUNC_GPS_RXQP			(MTK_PIN_NO(191) | 1)
+
+#define PINMUX_GPIO192__FUNC_GPIO192			(MTK_PIN_NO(192) | 0)
+#define PINMUX_GPIO192__FUNC_GPS_RXIN			(MTK_PIN_NO(192) | 1)
+
+#define PINMUX_GPIO193__FUNC_GPIO193			(MTK_PIN_NO(193) | 0)
+#define PINMUX_GPIO193__FUNC_GPS_RXIP			(MTK_PIN_NO(193) | 1)
+
+#define PINMUX_GPIO194__FUNC_GPIO194			(MTK_PIN_NO(194) | 0)
+#define PINMUX_GPIO194__FUNC_WB_RXQN			(MTK_PIN_NO(194) | 1)
+
+#define PINMUX_GPIO195__FUNC_GPIO195			(MTK_PIN_NO(195) | 0)
+#define PINMUX_GPIO195__FUNC_WB_RXQP			(MTK_PIN_NO(195) | 1)
+
+#define PINMUX_GPIO196__FUNC_GPIO196			(MTK_PIN_NO(196) | 0)
+#define PINMUX_GPIO196__FUNC_WB_RXIN			(MTK_PIN_NO(196) | 1)
+
+#define PINMUX_GPIO197__FUNC_GPIO197			(MTK_PIN_NO(197) | 0)
+#define PINMUX_GPIO197__FUNC_WB_RXIP			(MTK_PIN_NO(197) | 1)
+
+#define PINMUX_GPIO198__FUNC_GPIO198			(MTK_PIN_NO(198) | 0)
+#define PINMUX_GPIO198__FUNC_MSDC2_CMD			(MTK_PIN_NO(198) | 1)
+#define PINMUX_GPIO198__FUNC_SDA1			(MTK_PIN_NO(198) | 2)
+#define PINMUX_GPIO198__FUNC_C2K_UART0_RXD		(MTK_PIN_NO(198) | 3)
+#define PINMUX_GPIO198__FUNC_C2K_TMS			(MTK_PIN_NO(198) | 4)
+#define PINMUX_GPIO198__FUNC_ANT_SEL6			(MTK_PIN_NO(198) | 5)
+#define PINMUX_GPIO198__FUNC_DM_OTMS			(MTK_PIN_NO(198) | 7)
+
+#define PINMUX_GPIO199__FUNC_GPIO199			(MTK_PIN_NO(199) | 0)
+#define PINMUX_GPIO199__FUNC_MSDC2_CLK			(MTK_PIN_NO(199) | 1)
+#define PINMUX_GPIO199__FUNC_SCL1			(MTK_PIN_NO(199) | 2)
+#define PINMUX_GPIO199__FUNC_C2K_UART0_TXD		(MTK_PIN_NO(199) | 3)
+#define PINMUX_GPIO199__FUNC_C2K_TCK			(MTK_PIN_NO(199) | 4)
+#define PINMUX_GPIO199__FUNC_ANT_SEL7			(MTK_PIN_NO(199) | 5)
+#define PINMUX_GPIO199__FUNC_TDD_TXD			(MTK_PIN_NO(199) | 6)
+#define PINMUX_GPIO199__FUNC_DM_OTCK			(MTK_PIN_NO(199) | 7)
+
+#define PINMUX_GPIO200__FUNC_GPIO200			(MTK_PIN_NO(200) | 0)
+#define PINMUX_GPIO200__FUNC_MSDC2_DAT0			(MTK_PIN_NO(200) | 1)
+#define PINMUX_GPIO200__FUNC_ANT_SEL6			(MTK_PIN_NO(200) | 2)
+#define PINMUX_GPIO200__FUNC_GPS_FRAME_SYNC		(MTK_PIN_NO(200) | 3)
+#define PINMUX_GPIO200__FUNC_C2K_TDI			(MTK_PIN_NO(200) | 4)
+#define PINMUX_GPIO200__FUNC_UTXD0			(MTK_PIN_NO(200) | 5)
+#define PINMUX_GPIO200__FUNC_DM_OTDI			(MTK_PIN_NO(200) | 7)
+
+#define PINMUX_GPIO201__FUNC_GPIO201			(MTK_PIN_NO(201) | 0)
+#define PINMUX_GPIO201__FUNC_MSDC2_DAT1			(MTK_PIN_NO(201) | 1)
+#define PINMUX_GPIO201__FUNC_ANT_SEL3			(MTK_PIN_NO(201) | 2)
+#define PINMUX_GPIO201__FUNC_PWM0			(MTK_PIN_NO(201) | 3)
+#define PINMUX_GPIO201__FUNC_C2K_TDO			(MTK_PIN_NO(201) | 4)
+#define PINMUX_GPIO201__FUNC_URXD0			(MTK_PIN_NO(201) | 5)
+#define PINMUX_GPIO201__FUNC_DM_OTDO			(MTK_PIN_NO(201) | 7)
+
+#define PINMUX_GPIO202__FUNC_GPIO202			(MTK_PIN_NO(202) | 0)
+#define PINMUX_GPIO202__FUNC_MSDC2_DAT2			(MTK_PIN_NO(202) | 1)
+#define PINMUX_GPIO202__FUNC_ANT_SEL4			(MTK_PIN_NO(202) | 2)
+#define PINMUX_GPIO202__FUNC_SDA2			(MTK_PIN_NO(202) | 3)
+#define PINMUX_GPIO202__FUNC_C2K_NTRST			(MTK_PIN_NO(202) | 4)
+#define PINMUX_GPIO202__FUNC_UTXD1			(MTK_PIN_NO(202) | 5)
+#define PINMUX_GPIO202__FUNC_KCOL3			(MTK_PIN_NO(202) | 6)
+#define PINMUX_GPIO202__FUNC_DM_JTINTP			(MTK_PIN_NO(202) | 7)
+
+#define PINMUX_GPIO203__FUNC_GPIO203			(MTK_PIN_NO(203) | 0)
+#define PINMUX_GPIO203__FUNC_MSDC2_DAT3			(MTK_PIN_NO(203) | 1)
+#define PINMUX_GPIO203__FUNC_ANT_SEL5			(MTK_PIN_NO(203) | 2)
+#define PINMUX_GPIO203__FUNC_SCL2			(MTK_PIN_NO(203) | 3)
+#define PINMUX_GPIO203__FUNC_C2K_RTCK			(MTK_PIN_NO(203) | 4)
+#define PINMUX_GPIO203__FUNC_URXD1			(MTK_PIN_NO(203) | 5)
+#define PINMUX_GPIO203__FUNC_KCOL6			(MTK_PIN_NO(203) | 6)
+
+#endif /* __DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H__ */
-- 
2.46.2


