Return-Path: <linux-gpio+bounces-18236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2975A7BC0D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 14:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B00A7A554C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 11:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597A31F12EB;
	Fri,  4 Apr 2025 11:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="adcyiKhl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F851F0E51
	for <linux-gpio@vger.kernel.org>; Fri,  4 Apr 2025 11:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767847; cv=none; b=hdqeu5o1W/rn0lWAUBr80PYL8PL1ceJ56ZAIIIrKzsD90160dCQXxM1DsRg223NhSWvz9nDJgHEUnNI/EJoi6sbuOpv9KRMmMDzp8Vt5abQ+kNaLAL+vLiyCbr/Ko+Xv1ZA+ZZbHbh0poz1xGzuMxxgxJwncBGfbICrW1GniUqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767847; c=relaxed/simple;
	bh=ua5zgSNobMAzdOd3gGboXIkQUVeUMK5UKTmz1jdpjmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YqG4mx8Q0tEhLAozT0BcO+ZTFH/Tdu+57mKtnC3qUinVKKfjye43AffiSxG5KXXoTzTlMK5bccQNsO1bgmiwO40OlmTXmn5I6sOHEwVGLWLHaBoI1CLeVsa038T2U+2XIftqlfM02YVsZABLPQ+0YcrKXA0z2FCDOWSiV+QjA84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=adcyiKhl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so1376615e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767843; x=1744372643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3JdFQg9OP+vObOtg3YucUTBQsfmVEuB77cG86LXLR4=;
        b=adcyiKhlByv36kKW009qNqbAjIymcypcbpQty+vq11AcRCuhVI3iiKyPpSpJ4u1B2+
         KLIbhiB+SNi6i/rS0IaVETZxBU/W+EfQdp0/1Shllia92pFXCukjjff0ABMjnMLqUTPv
         fGsUywHlbW2HzS4RRvymW6nKjJ8FF+Hq9qVvgqUsV2PdqOZHTt3nBFt1LSr8zRv6Xmxw
         6XJhdiBsvo9M5rDdB98BWLThAvnsZzpMlgcCCgZiV85YYXLcIDVIfGYwEJEqmVdf4jnI
         Qy1slrV0TZMhtjWdBhu4ubMwobl/tHK0uNU+MXQohlARKralP2hADmpiihG7oPvDAVsn
         dI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767843; x=1744372643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3JdFQg9OP+vObOtg3YucUTBQsfmVEuB77cG86LXLR4=;
        b=RIF6qZgynevOK/pO/bVKdDBZmnnNPuIaT3RK1CU0awnOpco1W473RjVOCu+Di2f6gf
         VraC/PgpIm4nqDVyUQ1rzmC2YtSilzL1MCcV7zdjEcEQzbN6qO5VTR5EIKq5fD97ugQ6
         gF7thDm1v2jx28I5y/bAgDxggPxLcWsGFDcr0F0DFUijAq+h+xo7Ds+I/7Mb2LQy84Zb
         ADrW8LPAZ6Qu9yPm47YjjP2QKxuKNzPEndTvlSJgUXxPQWdhuHuUSp6Pw88CuIb1ye9X
         i95XwYVOK68crQFsiLXo16iKfHuEmbiQbDVpi+s0d6Ojrw/cuE9lB2wERerUgnK4nFVE
         1PeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtBQtuAN7gbeEUoFSLNtry0160FsxW0Td6ILIhNjgWHOTvXHGlVj6W9/IlrCHGgAGJQElxcYmiTGb5@vger.kernel.org
X-Gm-Message-State: AOJu0YxR9iEx2xwLEsahxCL+ZtlB8HFah1ow9U0KOgCQfPGnOpwxA/ou
	z4jaPnFY8q01xv+/FMcHHdhJVYPGldmhv1vutZY7+VeEjRqk9utwQhbmq44CORM=
X-Gm-Gg: ASbGncs6UdUefS35pOhNkxQt/IyPcz+NxUw32MieQ0rrhgao7uuclGB9ei/l4pQUgOO
	6gKf1pmgXqspZNFtNqqkPTV44nzDrUWNtEY679Tw99Pm3nQZfVFR4D3PGAL+HVQnA6xyMP3CRF4
	WSQNj3j2BAB4HS0z117VTDo/v81Zat3IHSwoiIkcXWY/pzTQjUzt9gjj/8AY45l/DeVXZsmdA18
	OKSz/4cTOF5M1Btxpa7URMye45EunI8w3RdFydPUSovMWBarQBLJ3I2+Pb4SozgPFSqS6niTNhS
	NdFYb70S4mXa2GJyVymSmr+H4N5ZcfvnC5YSY/gIgaY63sKeeOAqcg==
X-Google-Smtp-Source: AGHT+IErSp1UfkWiyQZSYQ4Fs3U5j3CAQMjPo78hcc56nmGo8lsKvG80Q29kD9bY+/gtM61oyOPwyg==
X-Received: by 2002:a05:600c:1c1c:b0:43d:fa59:bce9 with SMTP id 5b1f17b1804b1-43ecfa4d95bmr7235225e9.9.1743767843351;
        Fri, 04 Apr 2025 04:57:23 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm4209455f8f.60.2025.04.04.04.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] pinctrl: meson: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 13:57:18 +0200
Message-ID: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/meson/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index 90639bc171f6..0315e224bce6 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -3,7 +3,7 @@ menuconfig PINCTRL_MESON
 	tristate "Amlogic SoC pinctrl drivers"
 	depends on ARCH_MESON || COMPILE_TEST
 	depends on OF
-	default y
+	default ARCH_MESON
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
@@ -17,25 +17,25 @@ config PINCTRL_MESON8
 	bool "Meson 8 SoC pinctrl driver"
 	depends on ARM
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON8B
 	bool "Meson 8b SoC pinctrl driver"
 	depends on ARM
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_GXBB
 	tristate "Meson gxbb SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_GXL
 	tristate "Meson gxl SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON8_PMX
 	tristate
@@ -44,7 +44,7 @@ config PINCTRL_MESON_AXG
 	tristate "Meson axg Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_AXG_PMX
 	tristate
@@ -53,24 +53,24 @@ config PINCTRL_MESON_G12A
 	tristate "Meson g12a Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_A1
 	tristate "Meson a1 Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_S4
 	tristate "Meson s4 Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_A4
 	bool "AMLOGIC pincontrol"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	help
 	  This is the driver for the pin controller found on Amlogic SoCs.
 
@@ -82,12 +82,12 @@ config PINCTRL_AMLOGIC_C3
 	tristate "Amlogic C3 SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_T7
 	tristate "Amlogic T7 SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 endif
-- 
2.45.2


