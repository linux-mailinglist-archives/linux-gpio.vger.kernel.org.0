Return-Path: <linux-gpio+bounces-7396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05D9051B9
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 13:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1306FB24CA3
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 11:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3131B16F84C;
	Wed, 12 Jun 2024 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gdDC8Auq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0173A16F27F
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193372; cv=none; b=dOAR21xkbzNQpauOfJHrO9HfUlbrFO/alv1ST5oJne7IybLRDjfVKSnrV64msUenrxAi3T4vg66TSMpgf7bcIxvuucZ/HplQGN2Wu/0i8omqzA4X3aUrBrzzl/R0wzp1NEPBLdSkzvlwJjuvAuI4nFxIHGy99y274IYFol2hBSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193372; c=relaxed/simple;
	bh=RSHRfB7yFv744+oXoN0fW/gI1EQ2qQj7XY9p4L9Iaxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8csLj+5OnSFtyNT2tfkZCQmqASubLqW7E7x89g774Y8ziKKOujYls57DhDS9J8y2+GzmWfuRdPwfE/H/WVjuvcv6cVEHuNoYJZXwvMckIk9zig6wVEKc/Cf7VNGbqOGQ4joJWHmx+Cb6F3GcthcC8p+GdSr4BV+nLIIHFv+bbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gdDC8Auq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6f253a06caso250630266b.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718193368; x=1718798168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hP6Lz1CO+lqIq0GdN2MgiAFkI30RBlWJtTtLyJkZjNQ=;
        b=gdDC8Auq8muVh2hDW/9o1jfPTZsbwqiNPd9m9xQieakWWZHTPWmEzWm4UurXEHQRw9
         rKS6w65DvkLuqYHnJvikjPLuaaEZ2eJVNG9kSZX0kmAiOqb+OEGOaR2O3m/M0L3JVdyp
         r8/GQKBlZ61mhCV23LI1eAgF2BUnLqDUBrEQypXy6xoDIyX21UlivBKYJrrtM3WzZMiB
         7JtVRXU4mTaEyHIXu9q47bPHkIl44lAaQ0fYIyiiBWZNeUUVBywrK4QLwWOFolH2TpLN
         wiT4KHlvH64H3IA+pZIE01K66h6lhtCLVqYtAxbyooRhXKJc5OWP03tBc/LgW4Kovq3H
         yosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718193368; x=1718798168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hP6Lz1CO+lqIq0GdN2MgiAFkI30RBlWJtTtLyJkZjNQ=;
        b=JFuUbocJ5QZlFPb0x7moRVHyUn6iCOrAie1lichwwUzXfIj73w6zjn8aBuB8hMFrO1
         B9Q/MlBA8/LkSX3M57nwHYZZYSu0uDCWD7cjrLmocaD6J6gJp7lIyyJW3QGoityNbdzB
         tMEEmpxLWXk5ZU2ZxkwQD5S+/8AHIyxpXENeO24SppFx9YQrA5ks0t1ZwxfxcNFPjps/
         HUqPmVxtCNAKRCH+SC/flhVidHmL7eFj8yb095elzX+iJqAvEgMQY+Q491mY7/v1U7jt
         ltdq5jjHsSf1g/Ry8o611jhERYUblZi7Y7nIjyuWHqZ+xn3mFkJ/w5s0n695wFWpxYBr
         4XbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9wGLZOQu6+Des7nO+67SUxqPw9FNKjBY+QKEEuWxqxtSXg4zwJm4PepFhNxbNY5hfSuWDQv62QVN9jTzcTyEHxL/Ji5qEG3FYQQ==
X-Gm-Message-State: AOJu0Ywj8cJTPWJrGRjjnc64YggfmhJrFQVtBQuTErdNrdAVktHX38Bu
	xmt561nQdOI7VzARujH+oTHaG7t3yCh+lM/0zIgslURrjHiz57D+Mpn3OtV/qAk=
X-Google-Smtp-Source: AGHT+IH1jC2vCdXrbjvSJd0c+mFGs8vkIxaNxkYX+w+9n2rtK2mfM2wQ1Loa+Tu/InRPwXMp+rVrSg==
X-Received: by 2002:a17:906:3408:b0:a6f:2de0:54d with SMTP id a640c23a62f3a-a6f4801a4d9mr131732066b.76.1718193368277;
        Wed, 12 Jun 2024 04:56:08 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f2f8bd62esm275762266b.141.2024.06.12.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 04:56:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 12 Jun 2024 12:55:45 +0100
Subject: [PATCH v2 2/2] pinctrl: qcom: Introduce SM4250 LPI pinctrl driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-sm4250-lpi-v1-2-f19c33e1cc6e@linaro.org>
References: <20240612-sm4250-lpi-v1-0-f19c33e1cc6e@linaro.org>
In-Reply-To: <20240612-sm4250-lpi-v1-0-f19c33e1cc6e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11218;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=RSHRfB7yFv744+oXoN0fW/gI1EQ2qQj7XY9p4L9Iaxw=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmaYzUcoIu4UR+Qz/1zQLGVoyFXy0x8bj1ar2oB
 6WvgHIqGV+JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmmM1AAKCRB6of1ZxzRV
 N2n8B/4qwVZZCDc29/ljKmyTX1L2dBWs8oOuFC20cwMwGyDQdzGjBoZwPvXKr6iwmFxQTBYavhM
 mqqE8w8Bz0JFNDlqdUQ9D0gGCaJbqKSuzuKm6d5vGvg331vcPetI/Z0fyojLnpT++e52CwlIeVY
 OviEHR2VaPW0wOgx70+HBJdjIRydwCjFgxMgDW77ocHcgbZlhQY55ESN3xXjeaVXX21WWLcLjlp
 HBZ0UWM8qPESitm1n8zt7oGehfDqeyM+mOPkfd0p86EY60Sp/LnZ3mdSBY8/TOtw/oHIeo+hUCE
 D2fVKvLqDdW+i7GNIGtROveu80Pf5r5PhQVLb94VuGf5bTIe
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Add support for the pin controller block on SM4250 Low Power Island.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig                    |   9 +
 drivers/pinctrl/qcom/Makefile                   |   1 +
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c | 236 ++++++++++++++++++++++++
 3 files changed, 246 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 24619e80b2cc..dd9bbe8f3e11 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -68,6 +68,15 @@ config PINCTRL_SC7280_LPASS_LPI
 	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SC7280 platform.
 
+config PINCTRL_SM4250_LPASS_LPI
+	tristate "Qualcomm Technologies Inc SM4250 LPASS LPI pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_LPASS_LPI
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc SM4250 platform.
+
 config PINCTRL_SM6115_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SM6115 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index e2e76071d268..eb04297b6388 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SDX55) += pinctrl-sdx55.o
 obj-$(CONFIG_PINCTRL_SDX65) += pinctrl-sdx65.o
 obj-$(CONFIG_PINCTRL_SDX75) += pinctrl-sdx75.o
+obj-$(CONFIG_PINCTRL_SM4250_LPASS_LPI) += pinctrl-sm4250-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SM4450) += pinctrl-sm4450.o
 obj-$(CONFIG_PINCTRL_SM6115) += pinctrl-sm6115.o
 obj-$(CONFIG_PINCTRL_SM6115_LPASS_LPI) += pinctrl-sm6115-lpass-lpi.o
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
new file mode 100644
index 000000000000..2d2c636a3e20
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020, 2023 Linaro Ltd.
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-lpass-lpi.h"
+
+enum lpass_lpi_functions {
+	LPI_MUX_dmic01_clk,
+	LPI_MUX_dmic01_data,
+	LPI_MUX_dmic23_clk,
+	LPI_MUX_dmic23_data,
+	LPI_MUX_dmic4_clk,
+	LPI_MUX_dmic4_data,
+	LPI_MUX_ext_mclk0_a,
+	LPI_MUX_ext_mclk0_b,
+	LPI_MUX_ext_mclk1_a,
+	LPI_MUX_ext_mclk1_b,
+	LPI_MUX_ext_mclk1_c,
+	LPI_MUX_i2s1_clk,
+	LPI_MUX_i2s1_data,
+	LPI_MUX_i2s1_ws,
+	LPI_MUX_i2s2_clk,
+	LPI_MUX_i2s2_data,
+	LPI_MUX_i2s2_ws,
+	LPI_MUX_i2s3_clk,
+	LPI_MUX_i2s3_data,
+	LPI_MUX_i2s3_ws,
+	LPI_MUX_qup_io_00,
+	LPI_MUX_qup_io_01,
+	LPI_MUX_qup_io_05,
+	LPI_MUX_qup_io_10,
+	LPI_MUX_qup_io_11,
+	LPI_MUX_qup_io_25,
+	LPI_MUX_qup_io_21,
+	LPI_MUX_qup_io_26,
+	LPI_MUX_qup_io_31,
+	LPI_MUX_qup_io_36,
+	LPI_MUX_qua_mi2s_data,
+	LPI_MUX_qua_mi2s_sclk,
+	LPI_MUX_qua_mi2s_ws,
+	LPI_MUX_slim_clk,
+	LPI_MUX_slim_data,
+	LPI_MUX_sync_out,
+	LPI_MUX_swr_rx_clk,
+	LPI_MUX_swr_rx_data,
+	LPI_MUX_swr_tx_clk,
+	LPI_MUX_swr_tx_data,
+	LPI_MUX_swr_wsa_clk,
+	LPI_MUX_swr_wsa_data,
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static const struct pinctrl_pin_desc sm4250_lpi_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
+	PINCTRL_PIN(15, "gpio15"),
+	PINCTRL_PIN(16, "gpio16"),
+	PINCTRL_PIN(17, "gpio17"),
+	PINCTRL_PIN(18, "gpio18"),
+	PINCTRL_PIN(19, "gpio19"),
+	PINCTRL_PIN(20, "gpio20"),
+	PINCTRL_PIN(21, "gpio21"),
+	PINCTRL_PIN(22, "gpio22"),
+	PINCTRL_PIN(23, "gpio23"),
+	PINCTRL_PIN(24, "gpio24"),
+	PINCTRL_PIN(25, "gpio25"),
+	PINCTRL_PIN(26, "gpio26"),
+};
+
+static const char * const dmic01_clk_groups[] = { "gpio6" };
+static const char * const dmic01_data_groups[] = { "gpio7" };
+static const char * const dmic23_clk_groups[] = { "gpio8" };
+static const char * const dmic23_data_groups[] = { "gpio9" };
+static const char * const dmic4_clk_groups[] = { "gpio10" };
+static const char * const dmic4_data_groups[] = { "gpio11" };
+static const char * const ext_mclk0_a_groups[] = { "gpio13" };
+static const char * const ext_mclk0_b_groups[] = { "gpio5" };
+static const char * const ext_mclk1_a_groups[] = { "gpio18" };
+static const char * const ext_mclk1_b_groups[] = { "gpio9" };
+static const char * const ext_mclk1_c_groups[] = { "gpio17" };
+static const char * const slim_clk_groups[] = { "gpio14" };
+static const char * const slim_data_groups[] = { "gpio15" };
+static const char * const i2s1_clk_groups[] = { "gpio6" };
+static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
+static const char * const i2s1_ws_groups[] = { "gpio7" };
+static const char * const i2s2_clk_groups[] = { "gpio10" };
+static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
+static const char * const i2s2_ws_groups[] = { "gpio11" };
+static const char * const i2s3_clk_groups[] = { "gpio14" };
+static const char * const i2s3_data_groups[] = { "gpio16", "gpio17" };
+static const char * const i2s3_ws_groups[] = { "gpio15" };
+static const char * const qup_io_00_groups[] = { "gpio19" };
+static const char * const qup_io_01_groups[] = { "gpio21" };
+static const char * const qup_io_05_groups[] = { "gpio23" };
+static const char * const qup_io_10_groups[] = { "gpio20" };
+static const char * const qup_io_11_groups[] = { "gpio22" };
+static const char * const qup_io_25_groups[] = { "gpio23" };
+static const char * const qup_io_21_groups[] = { "gpio25" };
+static const char * const qup_io_26_groups[] = { "gpio25" };
+static const char * const qup_io_31_groups[] = { "gpio26" };
+static const char * const qup_io_36_groups[] = { "gpio26" };
+static const char * const qua_mi2s_data_groups[] = { "gpio2", "gpio3", "gpio4", "gpio5" };
+static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
+static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
+static const char * const sync_out_groups[] = { "gpio19", "gpio20", "gpio21", "gpio22",
+						"gpio23", "gpio24", "gpio25", "gpio26"};
+static const char * const swr_rx_clk_groups[] = { "gpio3" };
+static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
+static const char * const swr_tx_clk_groups[] = { "gpio0" };
+static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2" };
+static const char * const swr_wsa_clk_groups[] = { "gpio10" };
+static const char * const swr_wsa_data_groups[] = { "gpio11" };
+
+
+static const struct lpi_pingroup sm4250_groups[] = {
+	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
+	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
+	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
+	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk0_b, qua_mi2s_data, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic01_clk, i2s1_clk, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic01_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic23_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic23_data, i2s1_data, ext_mclk1_b, _),
+	LPI_PINGROUP(10, 16, i2s2_clk, swr_wsa_clk, dmic4_clk, _),
+	LPI_PINGROUP(11, 18, i2s2_ws, swr_wsa_data, dmic4_data, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic23_clk, i2s2_data, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, dmic23_data, i2s2_data, ext_mclk0_a, _),
+	LPI_PINGROUP(14, LPI_NO_SLEW, i2s3_clk, slim_clk, _, _),
+	LPI_PINGROUP(15, LPI_NO_SLEW, i2s3_ws, slim_data, _, _),
+	LPI_PINGROUP(16, LPI_NO_SLEW, i2s3_data, _, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, i2s3_data, ext_mclk1_c, _, _),
+	LPI_PINGROUP(18, 20, ext_mclk1_a, swr_rx_data, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, qup_io_00, sync_out, _, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, qup_io_10, sync_out, _, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, qup_io_01, sync_out, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, qup_io_11, sync_out, _, _),
+	LPI_PINGROUP(23, LPI_NO_SLEW, qup_io_25, qup_io_05, sync_out, _),
+	LPI_PINGROUP(25, LPI_NO_SLEW, qup_io_26, qup_io_21, sync_out, _),
+	LPI_PINGROUP(26, LPI_NO_SLEW, qup_io_36, qup_io_31, sync_out, _),
+};
+
+static const struct lpi_function sm4250_functions[] = {
+	LPI_FUNCTION(dmic01_clk),
+	LPI_FUNCTION(dmic01_data),
+	LPI_FUNCTION(dmic23_clk),
+	LPI_FUNCTION(dmic23_data),
+	LPI_FUNCTION(dmic4_clk),
+	LPI_FUNCTION(dmic4_data),
+	LPI_FUNCTION(ext_mclk0_a),
+	LPI_FUNCTION(ext_mclk0_b),
+	LPI_FUNCTION(ext_mclk1_a),
+	LPI_FUNCTION(ext_mclk1_b),
+	LPI_FUNCTION(ext_mclk1_c),
+	LPI_FUNCTION(i2s1_clk),
+	LPI_FUNCTION(i2s1_data),
+	LPI_FUNCTION(i2s1_ws),
+	LPI_FUNCTION(i2s2_clk),
+	LPI_FUNCTION(i2s2_data),
+	LPI_FUNCTION(i2s2_ws),
+	LPI_FUNCTION(i2s3_clk),
+	LPI_FUNCTION(i2s3_data),
+	LPI_FUNCTION(i2s3_ws),
+	LPI_FUNCTION(qup_io_00),
+	LPI_FUNCTION(qup_io_01),
+	LPI_FUNCTION(qup_io_05),
+	LPI_FUNCTION(qup_io_10),
+	LPI_FUNCTION(qup_io_11),
+	LPI_FUNCTION(qup_io_25),
+	LPI_FUNCTION(qup_io_21),
+	LPI_FUNCTION(qup_io_26),
+	LPI_FUNCTION(qup_io_31),
+	LPI_FUNCTION(qup_io_36),
+	LPI_FUNCTION(qua_mi2s_data),
+	LPI_FUNCTION(qua_mi2s_sclk),
+	LPI_FUNCTION(qua_mi2s_ws),
+	LPI_FUNCTION(slim_clk),
+	LPI_FUNCTION(slim_data),
+	LPI_FUNCTION(sync_out),
+	LPI_FUNCTION(swr_rx_clk),
+	LPI_FUNCTION(swr_rx_data),
+	LPI_FUNCTION(swr_tx_clk),
+	LPI_FUNCTION(swr_tx_data),
+	LPI_FUNCTION(swr_wsa_clk),
+	LPI_FUNCTION(swr_wsa_data),
+};
+
+static const struct lpi_pinctrl_variant_data sm4250_lpi_data = {
+	.pins = sm4250_lpi_pins,
+	.npins = ARRAY_SIZE(sm4250_lpi_pins),
+	.groups = sm4250_groups,
+	.ngroups = ARRAY_SIZE(sm4250_groups),
+	.functions = sm4250_functions,
+	.nfunctions = ARRAY_SIZE(sm4250_functions),
+};
+
+static const struct of_device_id lpi_pinctrl_of_match[] = {
+	{ .compatible = "qcom,sm4250-lpass-lpi-pinctrl", .data = &sm4250_lpi_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
+
+static struct platform_driver lpi_pinctrl_driver = {
+	.driver = {
+		.name = "qcom-sm4250-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove_new = lpi_pinctrl_remove,
+};
+
+module_platform_driver(lpi_pinctrl_driver);
+MODULE_DESCRIPTION("QTI SM4250 LPI GPIO pin control driver");
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org>");
+MODULE_LICENSE("GPL");

-- 
2.25.1


