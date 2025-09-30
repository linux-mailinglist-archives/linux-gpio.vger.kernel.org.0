Return-Path: <linux-gpio+bounces-26675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE1CBACC3C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 14:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CB7A7A1BBE
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4852F83B8;
	Tue, 30 Sep 2025 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ifVEKiEp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8952726A0E7
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759233795; cv=none; b=EYGXo1leMdMlXjoIZb/61CLApgEVDdPBVFQXZZwxVxinW7Ie8/3LNAF1C5QJLlVIigpCClXxegqaEVgyFP8K7WZVG5Stv/iZflu+U3WxMBO9AF1i0Cwo0mw/dvKvdEeYexi76jJdDDzwYLyRUYuxO+x+c078sfR0s8nGbr0hzVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759233795; c=relaxed/simple;
	bh=toulNxUVw8rbU4R+JfcCULrYjZoxZB3GdDgR4OB11UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kr8iW1S+P+vCE0AMfz3COCH+ccmfJBjQG08HPCuMjps7kXHUToybnQjMhTuSVYkmW+xhkbX40do4zvYtHIKQZe4Lx5BjYuzk1Y2fyiIt+yHN88zp+Vyix9vfrzdUN0XTjZObMi/qVgD/E91BbxiwDZ+0Qtc24txMRila/RpLq/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ifVEKiEp; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-85630d17586so805782785a.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759233791; x=1759838591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pq6trfk2mHBVBojx+enWdqrC6XcW5YYn2Uc0IH50R5Y=;
        b=ifVEKiEp7DKoRvGRZKDXtXXr+Cg9ooG28FobBO82kGJEzesfYLEUgtBqtPU34ji0Sp
         uIykaLzWnCif0DTwmsqOaqNarJqh0oDsg2+9mwvCKPirl+1V+EAztvKne+WpnjUQ2wEH
         SsDkvacZSpfkLGRZPlmJnDr27X7bnmML58PU6Ue71B/vWa0LCkcpak8uE2kxfWECtSl6
         g+3MKcBrJ0MgZ1LGCGIG9tQK3BF8CaU6R+TeKbZz7rkPLzVLmWRO/B9x5eP0ic4UQO+e
         rSrNWsopBe1DfCwLujukW4UclOGWpTnqxrpUS6yV2FGSWO7glLp8028qerGGfuY8ypX5
         xdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233791; x=1759838591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pq6trfk2mHBVBojx+enWdqrC6XcW5YYn2Uc0IH50R5Y=;
        b=mszxnDdtvxGNEPXdj3z8MPFLcldwJWlmvL92EAujcgfzc6cllS15gM/VGi8SaQExEH
         2Mx4yCTrITIeRCFP9jHYB+hW46HSp2DjATB6nPrKsPTLGsEfDAGjrwNoVxcuJRVjRgPq
         B5RwF7PCWpNPwC99/8z0hEBPfFxh/7GKHO3q7g/WULlUEqWTXWa9H+jszQdIWvRU7om/
         AbRe/ORIlXjLjnHOz5nlBjB6nRt2NRvbHDTNPF58O/INjtOqwGU5tYEkVlMUkR4L7BBm
         yjAmqp8BG94ygrM/vRXb768H5uNc3CR/ZynY+2cS5jhUJCkhKnyh0Bkwxbau2cXIaIjc
         pqLQ==
X-Gm-Message-State: AOJu0Yw5Ft4FEHNCEFq2g0Yl00tGsIo1xneCbl4BqBtLYS59lN+G+Q25
	5+d2fQdUlcDjPf9zj+AZ0UHPi6e8UiEbZtJbc7G4lELdJlwo5kXhLv5T7HlaD8szk2A=
X-Gm-Gg: ASbGncsKgP9EYNcmuvzGzM36r0dkoSNk+t4U+Muu8/torkrIePYAONx6uT+BWUjX5SX
	QNZHVXEhSsqxwqsLQIixCBbSByBBsZtFPtqYiWAsV/A+SPE1K4atVtHoAKFJ9OrkPn2VeELLhaY
	hcYVTEBmThj6p9joz853XW049/uSXFf+8pBGGfs5GoQBOpspHIrANxfJ3KWIn2jKxjLrwxi5zG3
	tqFdpel3826g/lXDIMBi560ewnyG0CZf+zb4A1GyZku9ilmJPf57N0BykphtmageS/7udfIOb+g
	zEHKj/2h+u1lzN4G7c6PWSeAf+Ey2E0sWGm23zK+C7ABBb87o5sQ+8xMJ0GL6+sGMVANRw32B5r
	WFQde8rNqN1GqT8h+wkFTddyU3iRIqyX+/VoeMvm6fu+scz1ADrQTXPpaaA==
X-Google-Smtp-Source: AGHT+IHp2jUzT5fm9gYujt5mYww9FXfZZnv5eszGFiAneJydykJgIsj/FI2C+T1CYovQNmsHAxajQQ==
X-Received: by 2002:a05:620a:1707:b0:81b:dd0:5877 with SMTP id af79cd13be357-85ae2c63924mr2408694285a.15.1759233790663;
        Tue, 30 Sep 2025 05:03:10 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c306b5f64sm1020160885a.32.2025.09.30.05.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:03:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:02:50 +0200
Subject: [PATCH 3/6] pinctrl: bcm: bcmbca: Prefix all BCM4908 data
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-bcmbca-pinctrl-v1-3-73218459a094@linaro.org>
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
In-Reply-To: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

Prefix all the BCM4908 groups and functions with bcm4908_*
and move the SoC info together with the pins, groups and
functions.

This is needed to namespace the different BCMBCA SoC:s
we add to this driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcmbca.c | 378 +++++++++++++++++------------------
 1 file changed, 186 insertions(+), 192 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcmbca.c b/drivers/pinctrl/bcm/pinctrl-bcmbca.c
index 5a18a5fadd94ddb5f237f2dca560f1d4b8186dad..b7b2552fd48227b2d318bb37f81a58e03656b954 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcmbca.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcmbca.c
@@ -16,8 +16,6 @@
 #include "../core.h"
 #include "../pinmux.h"
 
-#define BCM4908_NUM_PINS			86
-
 #define BCMBCA_TEST_PORT_BLOCK_EN_LSB			0x00
 #define BCMBCA_TEST_PORT_BLOCK_DATA_MSB			0x04
 #define BCMBCA_TEST_PORT_BLOCK_DATA_LSB			0x08
@@ -53,188 +51,188 @@ struct bcmbca_pinctrl {
 	struct pinctrl_desc pctldesc;
 };
 
-/*
- * Groups
- */
-
 struct bcmbca_pinctrl_pin_setup {
 	unsigned int number;
 	unsigned int function;
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_0_pins_a[] = {
+/* BCM4908 groups and functions */
+
+#define BCM4908_NUM_PINS 86
+
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_0_pins_a[] = {
 	{ 0, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_1_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_1_pins_a[] = {
 	{ 1, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_2_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_2_pins_a[] = {
 	{ 2, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_3_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_3_pins_a[] = {
 	{ 3, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_4_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_4_pins_a[] = {
 	{ 4, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_5_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_5_pins_a[] = {
 	{ 5, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_6_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_6_pins_a[] = {
 	{ 6, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_7_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_7_pins_a[] = {
 	{ 7, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_8_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_8_pins_a[] = {
 	{ 8, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_9_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_9_pins_a[] = {
 	{ 9, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_10_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_10_pins_a[] = {
 	{ 10, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_11_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_11_pins_a[] = {
 	{ 11, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_12_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_12_pins_a[] = {
 	{ 12, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_13_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_13_pins_a[] = {
 	{ 13, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_14_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_14_pins_a[] = {
 	{ 14, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_15_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_15_pins_a[] = {
 	{ 15, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_16_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_16_pins_a[] = {
 	{ 16, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_17_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_17_pins_a[] = {
 	{ 17, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_18_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_18_pins_a[] = {
 	{ 18, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_19_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_19_pins_a[] = {
 	{ 19, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_20_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_20_pins_a[] = {
 	{ 20, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_21_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_21_pins_a[] = {
 	{ 21, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_22_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_22_pins_a[] = {
 	{ 22, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_23_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_23_pins_a[] = {
 	{ 23, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_24_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_24_pins_a[] = {
 	{ 24, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_25_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_25_pins_a[] = {
 	{ 25, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_26_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_26_pins_a[] = {
 	{ 26, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_27_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_27_pins_a[] = {
 	{ 27, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_28_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_28_pins_a[] = {
 	{ 28, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_29_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_29_pins_a[] = {
 	{ 29, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_30_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_30_pins_a[] = {
 	{ 30, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_31_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_31_pins_a[] = {
 	{ 31, 3 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_10_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_10_pins_b[] = {
 	{ 8, 2 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_11_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_11_pins_b[] = {
 	{ 9, 2 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_12_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_12_pins_b[] = {
 	{ 0, 2 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_13_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_13_pins_b[] = {
 	{ 1, 2 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup led_31_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_led_31_pins_b[] = {
 	{ 30, 2 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup hs_uart_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_hs_uart_pins[] = {
 	{ 10, 0 },	/* CTS */
 	{ 11, 0 },	/* RTS */
 	{ 12, 0 },	/* RXD */
 	{ 13, 0 },	/* TXD */
 };
 
-static const struct bcmbca_pinctrl_pin_setup i2c_pins_a[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_i2c_pins_a[] = {
 	{ 18, 0 },	/* SDA */
 	{ 19, 0 },	/* SCL */
 };
 
-static const struct bcmbca_pinctrl_pin_setup i2c_pins_b[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_i2c_pins_b[] = {
 	{ 22, 0 },	/* SDA */
 	{ 23, 0 },	/* SCL */
 };
 
-static const struct bcmbca_pinctrl_pin_setup i2s_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_i2s_pins[] = {
 	{ 27, 0 },	/* MCLK */
 	{ 28, 0 },	/* LRCK */
 	{ 29, 0 },	/* SDATA */
 	{ 30, 0 },	/* SCLK */
 };
 
-static const struct bcmbca_pinctrl_pin_setup nand_ctrl_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_nand_ctrl_pins[] = {
 	{ 32, 0 },
 	{ 33, 0 },
 	{ 34, 0 },
@@ -244,7 +242,7 @@ static const struct bcmbca_pinctrl_pin_setup nand_ctrl_pins[] = {
 	{ 56, 1 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup nand_data_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_nand_data_pins[] = {
 	{ 35, 0 },
 	{ 36, 0 },
 	{ 37, 0 },
@@ -255,156 +253,160 @@ static const struct bcmbca_pinctrl_pin_setup nand_data_pins[] = {
 	{ 42, 0 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup emmc_ctrl_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_emmc_ctrl_pins[] = {
 	{ 46, 0 },
 	{ 47, 0 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup usb0_pwr_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_usb0_pwr_pins[] = {
 	{ 63, 0 },
 	{ 64, 0 },
 };
 
-static const struct bcmbca_pinctrl_pin_setup usb1_pwr_pins[] = {
+static const struct bcmbca_pinctrl_pin_setup bcm4908_usb1_pwr_pins[] = {
 	{ 66, 0 },
 	{ 67, 0 },
 };
 
 static const struct bcmbca_pinctrl_grp bcm4908_pinctrl_grps[] = {
-	{ "led_0_grp_a", led_0_pins_a, ARRAY_SIZE(led_0_pins_a) },
-	{ "led_1_grp_a", led_1_pins_a, ARRAY_SIZE(led_1_pins_a) },
-	{ "led_2_grp_a", led_2_pins_a, ARRAY_SIZE(led_2_pins_a) },
-	{ "led_3_grp_a", led_3_pins_a, ARRAY_SIZE(led_3_pins_a) },
-	{ "led_4_grp_a", led_4_pins_a, ARRAY_SIZE(led_4_pins_a) },
-	{ "led_5_grp_a", led_5_pins_a, ARRAY_SIZE(led_5_pins_a) },
-	{ "led_6_grp_a", led_6_pins_a, ARRAY_SIZE(led_6_pins_a) },
-	{ "led_7_grp_a", led_7_pins_a, ARRAY_SIZE(led_7_pins_a) },
-	{ "led_8_grp_a", led_8_pins_a, ARRAY_SIZE(led_8_pins_a) },
-	{ "led_9_grp_a", led_9_pins_a, ARRAY_SIZE(led_9_pins_a) },
-	{ "led_10_grp_a", led_10_pins_a, ARRAY_SIZE(led_10_pins_a) },
-	{ "led_11_grp_a", led_11_pins_a, ARRAY_SIZE(led_11_pins_a) },
-	{ "led_12_grp_a", led_12_pins_a, ARRAY_SIZE(led_12_pins_a) },
-	{ "led_13_grp_a", led_13_pins_a, ARRAY_SIZE(led_13_pins_a) },
-	{ "led_14_grp_a", led_14_pins_a, ARRAY_SIZE(led_14_pins_a) },
-	{ "led_15_grp_a", led_15_pins_a, ARRAY_SIZE(led_15_pins_a) },
-	{ "led_16_grp_a", led_16_pins_a, ARRAY_SIZE(led_16_pins_a) },
-	{ "led_17_grp_a", led_17_pins_a, ARRAY_SIZE(led_17_pins_a) },
-	{ "led_18_grp_a", led_18_pins_a, ARRAY_SIZE(led_18_pins_a) },
-	{ "led_19_grp_a", led_19_pins_a, ARRAY_SIZE(led_19_pins_a) },
-	{ "led_20_grp_a", led_20_pins_a, ARRAY_SIZE(led_20_pins_a) },
-	{ "led_21_grp_a", led_21_pins_a, ARRAY_SIZE(led_21_pins_a) },
-	{ "led_22_grp_a", led_22_pins_a, ARRAY_SIZE(led_22_pins_a) },
-	{ "led_23_grp_a", led_23_pins_a, ARRAY_SIZE(led_23_pins_a) },
-	{ "led_24_grp_a", led_24_pins_a, ARRAY_SIZE(led_24_pins_a) },
-	{ "led_25_grp_a", led_25_pins_a, ARRAY_SIZE(led_25_pins_a) },
-	{ "led_26_grp_a", led_26_pins_a, ARRAY_SIZE(led_26_pins_a) },
-	{ "led_27_grp_a", led_27_pins_a, ARRAY_SIZE(led_27_pins_a) },
-	{ "led_28_grp_a", led_28_pins_a, ARRAY_SIZE(led_28_pins_a) },
-	{ "led_29_grp_a", led_29_pins_a, ARRAY_SIZE(led_29_pins_a) },
-	{ "led_30_grp_a", led_30_pins_a, ARRAY_SIZE(led_30_pins_a) },
-	{ "led_31_grp_a", led_31_pins_a, ARRAY_SIZE(led_31_pins_a) },
-	{ "led_10_grp_b", led_10_pins_b, ARRAY_SIZE(led_10_pins_b) },
-	{ "led_11_grp_b", led_11_pins_b, ARRAY_SIZE(led_11_pins_b) },
-	{ "led_12_grp_b", led_12_pins_b, ARRAY_SIZE(led_12_pins_b) },
-	{ "led_13_grp_b", led_13_pins_b, ARRAY_SIZE(led_13_pins_b) },
-	{ "led_31_grp_b", led_31_pins_b, ARRAY_SIZE(led_31_pins_b) },
-	{ "hs_uart_grp", hs_uart_pins, ARRAY_SIZE(hs_uart_pins) },
-	{ "i2c_grp_a", i2c_pins_a, ARRAY_SIZE(i2c_pins_a) },
-	{ "i2c_grp_b", i2c_pins_b, ARRAY_SIZE(i2c_pins_b) },
-	{ "i2s_grp", i2s_pins, ARRAY_SIZE(i2s_pins) },
-	{ "nand_ctrl_grp", nand_ctrl_pins, ARRAY_SIZE(nand_ctrl_pins) },
-	{ "nand_data_grp", nand_data_pins, ARRAY_SIZE(nand_data_pins) },
-	{ "emmc_ctrl_grp", emmc_ctrl_pins, ARRAY_SIZE(emmc_ctrl_pins) },
-	{ "usb0_pwr_grp", usb0_pwr_pins, ARRAY_SIZE(usb0_pwr_pins) },
-	{ "usb1_pwr_grp", usb1_pwr_pins, ARRAY_SIZE(usb1_pwr_pins) },
-};
-
-/*
- * Functions
- */
-
-static const char * const led_0_groups[] = { "led_0_grp_a" };
-static const char * const led_1_groups[] = { "led_1_grp_a" };
-static const char * const led_2_groups[] = { "led_2_grp_a" };
-static const char * const led_3_groups[] = { "led_3_grp_a" };
-static const char * const led_4_groups[] = { "led_4_grp_a" };
-static const char * const led_5_groups[] = { "led_5_grp_a" };
-static const char * const led_6_groups[] = { "led_6_grp_a" };
-static const char * const led_7_groups[] = { "led_7_grp_a" };
-static const char * const led_8_groups[] = { "led_8_grp_a" };
-static const char * const led_9_groups[] = { "led_9_grp_a" };
-static const char * const led_10_groups[] = { "led_10_grp_a", "led_10_grp_b" };
-static const char * const led_11_groups[] = { "led_11_grp_a", "led_11_grp_b" };
-static const char * const led_12_groups[] = { "led_12_grp_a", "led_12_grp_b" };
-static const char * const led_13_groups[] = { "led_13_grp_a", "led_13_grp_b" };
-static const char * const led_14_groups[] = { "led_14_grp_a" };
-static const char * const led_15_groups[] = { "led_15_grp_a" };
-static const char * const led_16_groups[] = { "led_16_grp_a" };
-static const char * const led_17_groups[] = { "led_17_grp_a" };
-static const char * const led_18_groups[] = { "led_18_grp_a" };
-static const char * const led_19_groups[] = { "led_19_grp_a" };
-static const char * const led_20_groups[] = { "led_20_grp_a" };
-static const char * const led_21_groups[] = { "led_21_grp_a" };
-static const char * const led_22_groups[] = { "led_22_grp_a" };
-static const char * const led_23_groups[] = { "led_23_grp_a" };
-static const char * const led_24_groups[] = { "led_24_grp_a" };
-static const char * const led_25_groups[] = { "led_25_grp_a" };
-static const char * const led_26_groups[] = { "led_26_grp_a" };
-static const char * const led_27_groups[] = { "led_27_grp_a" };
-static const char * const led_28_groups[] = { "led_28_grp_a" };
-static const char * const led_29_groups[] = { "led_29_grp_a" };
-static const char * const led_30_groups[] = { "led_30_grp_a" };
-static const char * const led_31_groups[] = { "led_31_grp_a", "led_31_grp_b" };
-static const char * const hs_uart_groups[] = { "hs_uart_grp" };
-static const char * const i2c_groups[] = { "i2c_grp_a", "i2c_grp_b" };
-static const char * const i2s_groups[] = { "i2s_grp" };
-static const char * const nand_ctrl_groups[] = { "nand_ctrl_grp" };
-static const char * const nand_data_groups[] = { "nand_data_grp" };
-static const char * const emmc_ctrl_groups[] = { "emmc_ctrl_grp" };
-static const char * const usb0_pwr_groups[] = { "usb0_pwr_grp" };
-static const char * const usb1_pwr_groups[] = { "usb1_pwr_grp" };
+	{ "led_0_grp_a", bcm4908_led_0_pins_a, ARRAY_SIZE(bcm4908_led_0_pins_a) },
+	{ "led_1_grp_a", bcm4908_led_1_pins_a, ARRAY_SIZE(bcm4908_led_1_pins_a) },
+	{ "led_2_grp_a", bcm4908_led_2_pins_a, ARRAY_SIZE(bcm4908_led_2_pins_a) },
+	{ "led_3_grp_a", bcm4908_led_3_pins_a, ARRAY_SIZE(bcm4908_led_3_pins_a) },
+	{ "led_4_grp_a", bcm4908_led_4_pins_a, ARRAY_SIZE(bcm4908_led_4_pins_a) },
+	{ "led_5_grp_a", bcm4908_led_5_pins_a, ARRAY_SIZE(bcm4908_led_5_pins_a) },
+	{ "led_6_grp_a", bcm4908_led_6_pins_a, ARRAY_SIZE(bcm4908_led_6_pins_a) },
+	{ "led_7_grp_a", bcm4908_led_7_pins_a, ARRAY_SIZE(bcm4908_led_7_pins_a) },
+	{ "led_8_grp_a", bcm4908_led_8_pins_a, ARRAY_SIZE(bcm4908_led_8_pins_a) },
+	{ "led_9_grp_a", bcm4908_led_9_pins_a, ARRAY_SIZE(bcm4908_led_9_pins_a) },
+	{ "led_10_grp_a", bcm4908_led_10_pins_a, ARRAY_SIZE(bcm4908_led_10_pins_a) },
+	{ "led_11_grp_a", bcm4908_led_11_pins_a, ARRAY_SIZE(bcm4908_led_11_pins_a) },
+	{ "led_12_grp_a", bcm4908_led_12_pins_a, ARRAY_SIZE(bcm4908_led_12_pins_a) },
+	{ "led_13_grp_a", bcm4908_led_13_pins_a, ARRAY_SIZE(bcm4908_led_13_pins_a) },
+	{ "led_14_grp_a", bcm4908_led_14_pins_a, ARRAY_SIZE(bcm4908_led_14_pins_a) },
+	{ "led_15_grp_a", bcm4908_led_15_pins_a, ARRAY_SIZE(bcm4908_led_15_pins_a) },
+	{ "led_16_grp_a", bcm4908_led_16_pins_a, ARRAY_SIZE(bcm4908_led_16_pins_a) },
+	{ "led_17_grp_a", bcm4908_led_17_pins_a, ARRAY_SIZE(bcm4908_led_17_pins_a) },
+	{ "led_18_grp_a", bcm4908_led_18_pins_a, ARRAY_SIZE(bcm4908_led_18_pins_a) },
+	{ "led_19_grp_a", bcm4908_led_19_pins_a, ARRAY_SIZE(bcm4908_led_19_pins_a) },
+	{ "led_20_grp_a", bcm4908_led_20_pins_a, ARRAY_SIZE(bcm4908_led_20_pins_a) },
+	{ "led_21_grp_a", bcm4908_led_21_pins_a, ARRAY_SIZE(bcm4908_led_21_pins_a) },
+	{ "led_22_grp_a", bcm4908_led_22_pins_a, ARRAY_SIZE(bcm4908_led_22_pins_a) },
+	{ "led_23_grp_a", bcm4908_led_23_pins_a, ARRAY_SIZE(bcm4908_led_23_pins_a) },
+	{ "led_24_grp_a", bcm4908_led_24_pins_a, ARRAY_SIZE(bcm4908_led_24_pins_a) },
+	{ "led_25_grp_a", bcm4908_led_25_pins_a, ARRAY_SIZE(bcm4908_led_25_pins_a) },
+	{ "led_26_grp_a", bcm4908_led_26_pins_a, ARRAY_SIZE(bcm4908_led_26_pins_a) },
+	{ "led_27_grp_a", bcm4908_led_27_pins_a, ARRAY_SIZE(bcm4908_led_27_pins_a) },
+	{ "led_28_grp_a", bcm4908_led_28_pins_a, ARRAY_SIZE(bcm4908_led_28_pins_a) },
+	{ "led_29_grp_a", bcm4908_led_29_pins_a, ARRAY_SIZE(bcm4908_led_29_pins_a) },
+	{ "led_30_grp_a", bcm4908_led_30_pins_a, ARRAY_SIZE(bcm4908_led_30_pins_a) },
+	{ "led_31_grp_a", bcm4908_led_31_pins_a, ARRAY_SIZE(bcm4908_led_31_pins_a) },
+	{ "led_10_grp_b", bcm4908_led_10_pins_b, ARRAY_SIZE(bcm4908_led_10_pins_b) },
+	{ "led_11_grp_b", bcm4908_led_11_pins_b, ARRAY_SIZE(bcm4908_led_11_pins_b) },
+	{ "led_12_grp_b", bcm4908_led_12_pins_b, ARRAY_SIZE(bcm4908_led_12_pins_b) },
+	{ "led_13_grp_b", bcm4908_led_13_pins_b, ARRAY_SIZE(bcm4908_led_13_pins_b) },
+	{ "led_31_grp_b", bcm4908_led_31_pins_b, ARRAY_SIZE(bcm4908_led_31_pins_b) },
+	{ "hs_uart_grp", bcm4908_hs_uart_pins, ARRAY_SIZE(bcm4908_hs_uart_pins) },
+	{ "i2c_grp_a", bcm4908_i2c_pins_a, ARRAY_SIZE(bcm4908_i2c_pins_a) },
+	{ "i2c_grp_b", bcm4908_i2c_pins_b, ARRAY_SIZE(bcm4908_i2c_pins_b) },
+	{ "i2s_grp", bcm4908_i2s_pins, ARRAY_SIZE(bcm4908_i2s_pins) },
+	{ "nand_ctrl_grp", bcm4908_nand_ctrl_pins, ARRAY_SIZE(bcm4908_nand_ctrl_pins) },
+	{ "nand_data_grp", bcm4908_nand_data_pins, ARRAY_SIZE(bcm4908_nand_data_pins) },
+	{ "emmc_ctrl_grp", bcm4908_emmc_ctrl_pins, ARRAY_SIZE(bcm4908_emmc_ctrl_pins) },
+	{ "usb0_pwr_grp", bcm4908_usb0_pwr_pins, ARRAY_SIZE(bcm4908_usb0_pwr_pins) },
+	{ "usb1_pwr_grp", bcm4908_usb1_pwr_pins, ARRAY_SIZE(bcm4908_usb1_pwr_pins) },
+};
+
+static const char * const bcm4908_led_0_groups[] = { "led_0_grp_a" };
+static const char * const bcm4908_led_1_groups[] = { "led_1_grp_a" };
+static const char * const bcm4908_led_2_groups[] = { "led_2_grp_a" };
+static const char * const bcm4908_led_3_groups[] = { "led_3_grp_a" };
+static const char * const bcm4908_led_4_groups[] = { "led_4_grp_a" };
+static const char * const bcm4908_led_5_groups[] = { "led_5_grp_a" };
+static const char * const bcm4908_led_6_groups[] = { "led_6_grp_a" };
+static const char * const bcm4908_led_7_groups[] = { "led_7_grp_a" };
+static const char * const bcm4908_led_8_groups[] = { "led_8_grp_a" };
+static const char * const bcm4908_led_9_groups[] = { "led_9_grp_a" };
+static const char * const bcm4908_led_10_groups[] = { "led_10_grp_a", "led_10_grp_b" };
+static const char * const bcm4908_led_11_groups[] = { "led_11_grp_a", "led_11_grp_b" };
+static const char * const bcm4908_led_12_groups[] = { "led_12_grp_a", "led_12_grp_b" };
+static const char * const bcm4908_led_13_groups[] = { "led_13_grp_a", "led_13_grp_b" };
+static const char * const bcm4908_led_14_groups[] = { "led_14_grp_a" };
+static const char * const bcm4908_led_15_groups[] = { "led_15_grp_a" };
+static const char * const bcm4908_led_16_groups[] = { "led_16_grp_a" };
+static const char * const bcm4908_led_17_groups[] = { "led_17_grp_a" };
+static const char * const bcm4908_led_18_groups[] = { "led_18_grp_a" };
+static const char * const bcm4908_led_19_groups[] = { "led_19_grp_a" };
+static const char * const bcm4908_led_20_groups[] = { "led_20_grp_a" };
+static const char * const bcm4908_led_21_groups[] = { "led_21_grp_a" };
+static const char * const bcm4908_led_22_groups[] = { "led_22_grp_a" };
+static const char * const bcm4908_led_23_groups[] = { "led_23_grp_a" };
+static const char * const bcm4908_led_24_groups[] = { "led_24_grp_a" };
+static const char * const bcm4908_led_25_groups[] = { "led_25_grp_a" };
+static const char * const bcm4908_led_26_groups[] = { "led_26_grp_a" };
+static const char * const bcm4908_led_27_groups[] = { "led_27_grp_a" };
+static const char * const bcm4908_led_28_groups[] = { "led_28_grp_a" };
+static const char * const bcm4908_led_29_groups[] = { "led_29_grp_a" };
+static const char * const bcm4908_led_30_groups[] = { "led_30_grp_a" };
+static const char * const bcm4908_led_31_groups[] = { "led_31_grp_a", "led_31_grp_b" };
+static const char * const bcm4908_hs_uart_groups[] = { "hs_uart_grp" };
+static const char * const bcm4908_i2c_groups[] = { "i2c_grp_a", "i2c_grp_b" };
+static const char * const bcm4908_i2s_groups[] = { "i2s_grp" };
+static const char * const bcm4908_nand_ctrl_groups[] = { "nand_ctrl_grp" };
+static const char * const bcm4908_nand_data_groups[] = { "nand_data_grp" };
+static const char * const bcm4908_emmc_ctrl_groups[] = { "emmc_ctrl_grp" };
+static const char * const bcm4908_usb0_pwr_groups[] = { "usb0_pwr_grp" };
+static const char * const bcm4908_usb1_pwr_groups[] = { "usb1_pwr_grp" };
 
 static const struct bcmbca_pinctrl_function bcm4908_pinctrl_functions[] = {
-	{ "led_0", led_0_groups, ARRAY_SIZE(led_0_groups) },
-	{ "led_1", led_1_groups, ARRAY_SIZE(led_1_groups) },
-	{ "led_2", led_2_groups, ARRAY_SIZE(led_2_groups) },
-	{ "led_3", led_3_groups, ARRAY_SIZE(led_3_groups) },
-	{ "led_4", led_4_groups, ARRAY_SIZE(led_4_groups) },
-	{ "led_5", led_5_groups, ARRAY_SIZE(led_5_groups) },
-	{ "led_6", led_6_groups, ARRAY_SIZE(led_6_groups) },
-	{ "led_7", led_7_groups, ARRAY_SIZE(led_7_groups) },
-	{ "led_8", led_8_groups, ARRAY_SIZE(led_8_groups) },
-	{ "led_9", led_9_groups, ARRAY_SIZE(led_9_groups) },
-	{ "led_10", led_10_groups, ARRAY_SIZE(led_10_groups) },
-	{ "led_11", led_11_groups, ARRAY_SIZE(led_11_groups) },
-	{ "led_12", led_12_groups, ARRAY_SIZE(led_12_groups) },
-	{ "led_13", led_13_groups, ARRAY_SIZE(led_13_groups) },
-	{ "led_14", led_14_groups, ARRAY_SIZE(led_14_groups) },
-	{ "led_15", led_15_groups, ARRAY_SIZE(led_15_groups) },
-	{ "led_16", led_16_groups, ARRAY_SIZE(led_16_groups) },
-	{ "led_17", led_17_groups, ARRAY_SIZE(led_17_groups) },
-	{ "led_18", led_18_groups, ARRAY_SIZE(led_18_groups) },
-	{ "led_19", led_19_groups, ARRAY_SIZE(led_19_groups) },
-	{ "led_20", led_20_groups, ARRAY_SIZE(led_20_groups) },
-	{ "led_21", led_21_groups, ARRAY_SIZE(led_21_groups) },
-	{ "led_22", led_22_groups, ARRAY_SIZE(led_22_groups) },
-	{ "led_23", led_23_groups, ARRAY_SIZE(led_23_groups) },
-	{ "led_24", led_24_groups, ARRAY_SIZE(led_24_groups) },
-	{ "led_25", led_25_groups, ARRAY_SIZE(led_25_groups) },
-	{ "led_26", led_26_groups, ARRAY_SIZE(led_26_groups) },
-	{ "led_27", led_27_groups, ARRAY_SIZE(led_27_groups) },
-	{ "led_28", led_28_groups, ARRAY_SIZE(led_28_groups) },
-	{ "led_29", led_29_groups, ARRAY_SIZE(led_29_groups) },
-	{ "led_30", led_30_groups, ARRAY_SIZE(led_30_groups) },
-	{ "led_31", led_31_groups, ARRAY_SIZE(led_31_groups) },
-	{ "hs_uart", hs_uart_groups, ARRAY_SIZE(hs_uart_groups) },
-	{ "i2c", i2c_groups, ARRAY_SIZE(i2c_groups) },
-	{ "i2s", i2s_groups, ARRAY_SIZE(i2s_groups) },
-	{ "nand_ctrl", nand_ctrl_groups, ARRAY_SIZE(nand_ctrl_groups) },
-	{ "nand_data", nand_data_groups, ARRAY_SIZE(nand_data_groups) },
-	{ "emmc_ctrl", emmc_ctrl_groups, ARRAY_SIZE(emmc_ctrl_groups) },
-	{ "usb0_pwr", usb0_pwr_groups, ARRAY_SIZE(usb0_pwr_groups) },
-	{ "usb1_pwr", usb1_pwr_groups, ARRAY_SIZE(usb1_pwr_groups) },
+	{ "led_0", bcm4908_led_0_groups, ARRAY_SIZE(bcm4908_led_0_groups) },
+	{ "led_1", bcm4908_led_1_groups, ARRAY_SIZE(bcm4908_led_1_groups) },
+	{ "led_2", bcm4908_led_2_groups, ARRAY_SIZE(bcm4908_led_2_groups) },
+	{ "led_3", bcm4908_led_3_groups, ARRAY_SIZE(bcm4908_led_3_groups) },
+	{ "led_4", bcm4908_led_4_groups, ARRAY_SIZE(bcm4908_led_4_groups) },
+	{ "led_5", bcm4908_led_5_groups, ARRAY_SIZE(bcm4908_led_5_groups) },
+	{ "led_6", bcm4908_led_6_groups, ARRAY_SIZE(bcm4908_led_6_groups) },
+	{ "led_7", bcm4908_led_7_groups, ARRAY_SIZE(bcm4908_led_7_groups) },
+	{ "led_8", bcm4908_led_8_groups, ARRAY_SIZE(bcm4908_led_8_groups) },
+	{ "led_9", bcm4908_led_9_groups, ARRAY_SIZE(bcm4908_led_9_groups) },
+	{ "led_10", bcm4908_led_10_groups, ARRAY_SIZE(bcm4908_led_10_groups) },
+	{ "led_11", bcm4908_led_11_groups, ARRAY_SIZE(bcm4908_led_11_groups) },
+	{ "led_12", bcm4908_led_12_groups, ARRAY_SIZE(bcm4908_led_12_groups) },
+	{ "led_13", bcm4908_led_13_groups, ARRAY_SIZE(bcm4908_led_13_groups) },
+	{ "led_14", bcm4908_led_14_groups, ARRAY_SIZE(bcm4908_led_14_groups) },
+	{ "led_15", bcm4908_led_15_groups, ARRAY_SIZE(bcm4908_led_15_groups) },
+	{ "led_16", bcm4908_led_16_groups, ARRAY_SIZE(bcm4908_led_16_groups) },
+	{ "led_17", bcm4908_led_17_groups, ARRAY_SIZE(bcm4908_led_17_groups) },
+	{ "led_18", bcm4908_led_18_groups, ARRAY_SIZE(bcm4908_led_18_groups) },
+	{ "led_19", bcm4908_led_19_groups, ARRAY_SIZE(bcm4908_led_19_groups) },
+	{ "led_20", bcm4908_led_20_groups, ARRAY_SIZE(bcm4908_led_20_groups) },
+	{ "led_21", bcm4908_led_21_groups, ARRAY_SIZE(bcm4908_led_21_groups) },
+	{ "led_22", bcm4908_led_22_groups, ARRAY_SIZE(bcm4908_led_22_groups) },
+	{ "led_23", bcm4908_led_23_groups, ARRAY_SIZE(bcm4908_led_23_groups) },
+	{ "led_24", bcm4908_led_24_groups, ARRAY_SIZE(bcm4908_led_24_groups) },
+	{ "led_25", bcm4908_led_25_groups, ARRAY_SIZE(bcm4908_led_25_groups) },
+	{ "led_26", bcm4908_led_26_groups, ARRAY_SIZE(bcm4908_led_26_groups) },
+	{ "led_27", bcm4908_led_27_groups, ARRAY_SIZE(bcm4908_led_27_groups) },
+	{ "led_28", bcm4908_led_28_groups, ARRAY_SIZE(bcm4908_led_28_groups) },
+	{ "led_29", bcm4908_led_29_groups, ARRAY_SIZE(bcm4908_led_29_groups) },
+	{ "led_30", bcm4908_led_30_groups, ARRAY_SIZE(bcm4908_led_30_groups) },
+	{ "led_31", bcm4908_led_31_groups, ARRAY_SIZE(bcm4908_led_31_groups) },
+	{ "hs_uart", bcm4908_hs_uart_groups, ARRAY_SIZE(bcm4908_hs_uart_groups) },
+	{ "i2c", bcm4908_i2c_groups, ARRAY_SIZE(bcm4908_i2c_groups) },
+	{ "i2s", bcm4908_i2s_groups, ARRAY_SIZE(bcm4908_i2s_groups) },
+	{ "nand_ctrl", bcm4908_nand_ctrl_groups, ARRAY_SIZE(bcm4908_nand_ctrl_groups) },
+	{ "nand_data", bcm4908_nand_data_groups, ARRAY_SIZE(bcm4908_nand_data_groups) },
+	{ "emmc_ctrl", bcm4908_emmc_ctrl_groups, ARRAY_SIZE(bcm4908_emmc_ctrl_groups) },
+	{ "usb0_pwr", bcm4908_usb0_pwr_groups, ARRAY_SIZE(bcm4908_usb0_pwr_groups) },
+	{ "usb1_pwr", bcm4908_usb1_pwr_groups, ARRAY_SIZE(bcm4908_usb1_pwr_groups) },
+};
+
+static const struct bcmbca_soc_info bcm4908_pinctrl_soc_info = {
+	.num_pins = BCM4908_NUM_PINS,
+	.groups = bcm4908_pinctrl_grps,
+	.num_groups = ARRAY_SIZE(bcm4908_pinctrl_grps),
+	.functions = bcm4908_pinctrl_functions,
+	.num_functions = ARRAY_SIZE(bcm4908_pinctrl_functions),
 };
 
 /*
@@ -471,14 +473,6 @@ static const struct pinctrl_desc bcmbca_pinctrl_desc = {
 	.pmxops = &bcmbca_pinctrl_pmxops,
 };
 
-static const struct bcmbca_soc_info bcm4908_pinctrl_soc_info = {
-	.num_pins = BCM4908_NUM_PINS,
-	.groups = bcm4908_pinctrl_grps,
-	.num_groups = ARRAY_SIZE(bcm4908_pinctrl_grps),
-	.functions = bcm4908_pinctrl_functions,
-	.num_functions = ARRAY_SIZE(bcm4908_pinctrl_functions),
-};
-
 static const struct of_device_id bcmbca_pinctrl_of_match_table[] = {
 	{
 		.compatible = "brcm,bcm4908-pinctrl",

-- 
2.51.0


