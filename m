Return-Path: <linux-gpio+bounces-5158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A57089BB2D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 11:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD4311C21B9D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 09:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003043B782;
	Mon,  8 Apr 2024 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsTyM6EU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76774EB23;
	Mon,  8 Apr 2024 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712567117; cv=none; b=jV3nMG8+hl0L+pjtneyTi6dS1ketXKSNQMQnBxJW4NZLUuLXe+TiCc5oJ6gLf1o+JVXJzK3xN+820iP/QGqLcu4moDfJgT+NIpvel2dSR7MFjutAQhRTqGlWpWzLM+n8lCdnXDay00awQKkNkXHNsN4wHcHj7Xg+1caSpryd4mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712567117; c=relaxed/simple;
	bh=lFU7QE1+qNDLLzoZDrRR9JuIvf3twwy9PY9BpKcLv6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=lsN6iUsTJAQ9Y2D7dVNdXCWbuHsJw5Yw+E2rxJLiPk3o0oqITnWzOu1tbCm1kqGdJotRI2kI7pHisbxnyzjxMhZEuAfnl2BAPNTsCkzrpdjD3JSD5xCcBxlavzvoK5DoZqfxKhExUIQE9L/d3TCH5jPquWzI8I2YLfuKWwa4Cxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsTyM6EU; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e2ac1c16aso3696250a12.0;
        Mon, 08 Apr 2024 02:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712567114; x=1713171914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0VdWl81xUkhQ/9Yp0vD3aydPnMUvCiiOMIXPQn+0VSc=;
        b=MsTyM6EUGzHyme+ubvMU4m8XvVlQsmV7/EIOxSzkspF73l/Q5pDkQ4TXdrPhoG6JK0
         oDm6o1G36+f22Wd235Lo0x3tgvaUVzOK2KrhVelSMsL36gPuyCv3XOXHc9hODkvXf8kA
         bE1oV0phOUyO1v3aTeIw1gjWX4JRdQWAPApVJvz/kED0TMrCy2xJCqR+2IGttl+IAk+/
         PN5qAd2hLMRvI6BvvxSAQvXP7vnKzgRjaJ9MD5UTyofUqX1V48T4i78SvU/Te2SgzN3t
         1UKsBE8xKH5ugPZ6KzGcpGiZGPJWb0aW7uvS+y5as9YeaNBvGpX+FpEYba10Cq6bf3DY
         kPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567114; x=1713171914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VdWl81xUkhQ/9Yp0vD3aydPnMUvCiiOMIXPQn+0VSc=;
        b=bY71Ts1zFuzzDob7HDE1W/06BCYpMIfvHql4cHtwNOD0f8zxT8sY4KDUaCsuAuyifO
         2YVV6gy1zAMiV1bgyB9fohR4G18IsbxhBk6gBS7iGbyaFK42w0OTFvGb4mmNbOR4UwuR
         aQvl6FJP2lOoCCOqJNsenK6oQ3olw+maQl2ONJ6viaouiyI+CqnyLGLP7fCobLVm97kv
         EHXvH7tlkZzLmh2SdwiJkYGb35dzJJNEJO9PAVpvjYJhbWP33AI8c79YkAGkormVkLH7
         xODq/1b59zpPQEthSOubn8xeOz5Hz4bkQBK10n2EgUEqstGf+gGpUnLtARtKnjT7hrYP
         WcGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzkvV85Tvyg/5W3bGJI57oRc+DQ8E+NvyQF9+r4mbSINpLk0Dw6BttVPGyBrFX613ojWH36gAQ09YgDIx/fDRlCXk9WVimT4xmxa4MFmKt8IbzFWfRJHwghBepp/C1Ff7Rv2MaQ2M=
X-Gm-Message-State: AOJu0YwmYGZmR97UzZ0bMNfZTRHKsT0SlzDLGR53Iii/R4/qafozwto/
	1oCSNTaGogvfQVRRor+cBiAglKSvbR61gTHycr4K+B5JiS2ZG35j
X-Google-Smtp-Source: AGHT+IHoDPHjMBvKWWxI6l+a/pOx5BO9ETXLbsUsMeGrQvdnDpuv/Gs2Dn58wW/rDjO9l2t+4A7cUg==
X-Received: by 2002:a17:907:84b:b0:a51:df52:5a65 with SMTP id ww11-20020a170907084b00b00a51df525a65mr608198ejb.2.1712567113914;
        Mon, 08 Apr 2024 02:05:13 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id h1-20020a170906718100b00a51bd3bfec3sm2773969ejk.121.2024.04.08.02.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 02:05:13 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/3] dt-bindings: pinctrl: mediatek: mt7622: fix array properties
Date: Mon,  8 Apr 2024 11:05:04 +0200
Message-Id: <20240408090506.21596-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

Some properties (function groups & pins) are meant to be arrays and
should allow multiple entries out of enum sets. Use "items" for those.

Mistake was noticed during validation of in-kernel DTS files.

Fixes: b9ffc18c6388 ("dt-bindings: mediatek: convert pinctrl to yaml")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 92 ++++++++++---------
 1 file changed, 49 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index bd72a326e6e0..60f30a59f385 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -97,7 +97,8 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [emmc, emmc_rst]
+                  items:
+                    enum: [emmc, emmc_rst]
           - if:
               properties:
                 function:
@@ -105,8 +106,9 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [esw, esw_p0_p1, esw_p2_p3_p4, rgmii_via_esw,
-                         rgmii_via_gmac1, rgmii_via_gmac2, mdc_mdio]
+                  items:
+                    enum: [esw, esw_p0_p1, esw_p2_p3_p4, rgmii_via_esw,
+                           rgmii_via_gmac1, rgmii_via_gmac2, mdc_mdio]
           - if:
               properties:
                 function:
@@ -123,10 +125,11 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [i2s_in_mclk_bclk_ws, i2s1_in_data, i2s2_in_data,
-                         i2s3_in_data, i2s4_in_data, i2s_out_mclk_bclk_ws,
-                         i2s1_out_data, i2s2_out_data, i2s3_out_data,
-                         i2s4_out_data]
+                  items:
+                    enum: [i2s_in_mclk_bclk_ws, i2s1_in_data, i2s2_in_data,
+                           i2s3_in_data, i2s4_in_data, i2s_out_mclk_bclk_ws,
+                           i2s1_out_data, i2s2_out_data, i2s3_out_data,
+                           i2s4_out_data]
           - if:
               properties:
                 function:
@@ -159,10 +162,11 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pcie0_0_waken, pcie0_1_waken, pcie1_0_waken,
-                         pcie0_0_clkreq, pcie0_1_clkreq, pcie1_0_clkreq,
-                         pcie0_pad_perst, pcie1_pad_perst, pcie_pereset,
-                         pcie_wake, pcie_clkreq]
+                  items:
+                    enum: [pcie0_0_waken, pcie0_1_waken, pcie1_0_waken,
+                           pcie0_0_clkreq, pcie0_1_clkreq, pcie1_0_clkreq,
+                           pcie0_pad_perst, pcie1_pad_perst, pcie_pereset,
+                           pcie_wake, pcie_clkreq]
           - if:
               properties:
                 function:
@@ -178,11 +182,12 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pwm_ch1_0, pwm_ch1_1, pwm_ch1_2, pwm_ch2_0, pwm_ch2_1,
-                         pwm_ch2_2, pwm_ch3_0, pwm_ch3_1, pwm_ch3_2, pwm_ch4_0,
-                         pwm_ch4_1, pwm_ch4_2, pwm_ch4_3, pwm_ch5_0, pwm_ch5_1,
-                         pwm_ch5_2, pwm_ch6_0, pwm_ch6_1, pwm_ch6_2, pwm_ch6_3,
-                         pwm_ch7_0, pwm_0, pwm_1]
+                  items:
+                    enum: [pwm_ch1_0, pwm_ch1_1, pwm_ch1_2, pwm_ch2_0, pwm_ch2_1,
+                           pwm_ch2_2, pwm_ch3_0, pwm_ch3_1, pwm_ch3_2, pwm_ch4_0,
+                           pwm_ch4_1, pwm_ch4_2, pwm_ch4_3, pwm_ch5_0, pwm_ch5_1,
+                           pwm_ch5_2, pwm_ch6_0, pwm_ch6_1, pwm_ch6_2, pwm_ch6_3,
+                           pwm_ch7_0, pwm_0, pwm_1]
           - if:
               properties:
                 function:
@@ -260,33 +265,34 @@ patternProperties:
           pins:
             description:
               An array of strings. Each string contains the name of a pin.
-            enum: [GPIO_A, I2S1_IN, I2S1_OUT, I2S_BCLK, I2S_WS, I2S_MCLK, TXD0,
-                   RXD0, SPI_WP, SPI_HOLD, SPI_CLK, SPI_MOSI, SPI_MISO, SPI_CS,
-                   I2C_SDA, I2C_SCL, I2S2_IN, I2S3_IN, I2S4_IN, I2S2_OUT,
-                   I2S3_OUT, I2S4_OUT, GPIO_B, MDC, MDIO, G2_TXD0, G2_TXD1,
-                   G2_TXD2, G2_TXD3, G2_TXEN, G2_TXC, G2_RXD0, G2_RXD1, G2_RXD2,
-                   G2_RXD3, G2_RXDV, G2_RXC, NCEB, NWEB, NREB, NDL4, NDL5, NDL6,
-                   NDL7, NRB, NCLE, NALE, NDL0, NDL1, NDL2, NDL3, MDI_TP_P0,
-                   MDI_TN_P0, MDI_RP_P0, MDI_RN_P0, MDI_TP_P1, MDI_TN_P1,
-                   MDI_RP_P1, MDI_RN_P1, MDI_RP_P2, MDI_RN_P2, MDI_TP_P2,
-                   MDI_TN_P2, MDI_TP_P3, MDI_TN_P3, MDI_RP_P3, MDI_RN_P3,
-                   MDI_RP_P4, MDI_RN_P4, MDI_TP_P4, MDI_TN_P4, PMIC_SCL,
-                   PMIC_SDA, SPIC1_CLK, SPIC1_MOSI, SPIC1_MISO, SPIC1_CS,
-                   GPIO_D, WATCHDOG, RTS3_N, CTS3_N, TXD3, RXD3, PERST0_N,
-                   PERST1_N, WLED_N, EPHY_LED0_N, AUXIN0, AUXIN1, AUXIN2,
-                   AUXIN3, TXD4, RXD4, RTS4_N, CST4_N, PWM1, PWM2, PWM3, PWM4,
-                   PWM5, PWM6, PWM7, GPIO_E, TOP_5G_CLK, TOP_5G_DATA,
-                   WF0_5G_HB0, WF0_5G_HB1, WF0_5G_HB2, WF0_5G_HB3, WF0_5G_HB4,
-                   WF0_5G_HB5, WF0_5G_HB6, XO_REQ, TOP_RST_N, SYS_WATCHDOG,
-                   EPHY_LED0_N_JTDO, EPHY_LED1_N_JTDI, EPHY_LED2_N_JTMS,
-                   EPHY_LED3_N_JTCLK, EPHY_LED4_N_JTRST_N, WF2G_LED_N,
-                   WF5G_LED_N, GPIO_9, GPIO_10, GPIO_11, GPIO_12, UART1_TXD,
-                   UART1_RXD, UART1_CTS, UART1_RTS, UART2_TXD, UART2_RXD,
-                   UART2_CTS, UART2_RTS, SMI_MDC, SMI_MDIO, PCIE_PERESET_N,
-                   PWM_0, GPIO_0, GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5,
-                   GPIO_6, GPIO_7, GPIO_8, UART0_TXD, UART0_RXD, TOP_2G_CLK,
-                   TOP_2G_DATA, WF0_2G_HB0, WF0_2G_HB1, WF0_2G_HB2, WF0_2G_HB3,
-                   WF0_2G_HB4, WF0_2G_HB5, WF0_2G_HB6]
+            items:
+              enum: [GPIO_A, I2S1_IN, I2S1_OUT, I2S_BCLK, I2S_WS, I2S_MCLK, TXD0,
+                     RXD0, SPI_WP, SPI_HOLD, SPI_CLK, SPI_MOSI, SPI_MISO, SPI_CS,
+                     I2C_SDA, I2C_SCL, I2S2_IN, I2S3_IN, I2S4_IN, I2S2_OUT,
+                     I2S3_OUT, I2S4_OUT, GPIO_B, MDC, MDIO, G2_TXD0, G2_TXD1,
+                     G2_TXD2, G2_TXD3, G2_TXEN, G2_TXC, G2_RXD0, G2_RXD1, G2_RXD2,
+                     G2_RXD3, G2_RXDV, G2_RXC, NCEB, NWEB, NREB, NDL4, NDL5, NDL6,
+                     NDL7, NRB, NCLE, NALE, NDL0, NDL1, NDL2, NDL3, MDI_TP_P0,
+                     MDI_TN_P0, MDI_RP_P0, MDI_RN_P0, MDI_TP_P1, MDI_TN_P1,
+                     MDI_RP_P1, MDI_RN_P1, MDI_RP_P2, MDI_RN_P2, MDI_TP_P2,
+                     MDI_TN_P2, MDI_TP_P3, MDI_TN_P3, MDI_RP_P3, MDI_RN_P3,
+                     MDI_RP_P4, MDI_RN_P4, MDI_TP_P4, MDI_TN_P4, PMIC_SCL,
+                     PMIC_SDA, SPIC1_CLK, SPIC1_MOSI, SPIC1_MISO, SPIC1_CS,
+                     GPIO_D, WATCHDOG, RTS3_N, CTS3_N, TXD3, RXD3, PERST0_N,
+                     PERST1_N, WLED_N, EPHY_LED0_N, AUXIN0, AUXIN1, AUXIN2,
+                     AUXIN3, TXD4, RXD4, RTS4_N, CST4_N, PWM1, PWM2, PWM3, PWM4,
+                     PWM5, PWM6, PWM7, GPIO_E, TOP_5G_CLK, TOP_5G_DATA,
+                     WF0_5G_HB0, WF0_5G_HB1, WF0_5G_HB2, WF0_5G_HB3, WF0_5G_HB4,
+                     WF0_5G_HB5, WF0_5G_HB6, XO_REQ, TOP_RST_N, SYS_WATCHDOG,
+                     EPHY_LED0_N_JTDO, EPHY_LED1_N_JTDI, EPHY_LED2_N_JTMS,
+                     EPHY_LED3_N_JTCLK, EPHY_LED4_N_JTRST_N, WF2G_LED_N,
+                     WF5G_LED_N, GPIO_9, GPIO_10, GPIO_11, GPIO_12, UART1_TXD,
+                     UART1_RXD, UART1_CTS, UART1_RTS, UART2_TXD, UART2_RXD,
+                     UART2_CTS, UART2_RTS, SMI_MDC, SMI_MDIO, PCIE_PERESET_N,
+                     PWM_0, GPIO_0, GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5,
+                     GPIO_6, GPIO_7, GPIO_8, UART0_TXD, UART0_RXD, TOP_2G_CLK,
+                     TOP_2G_DATA, WF0_2G_HB0, WF0_2G_HB1, WF0_2G_HB2, WF0_2G_HB3,
+                     WF0_2G_HB4, WF0_2G_HB5, WF0_2G_HB6]
 
           bias-disable: true
 
-- 
2.35.3


