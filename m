Return-Path: <linux-gpio+bounces-30126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEB3CF299A
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E21243065E31
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B4432D7D9;
	Mon,  5 Jan 2026 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mgMGTxKN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128932B9BB
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603713; cv=none; b=C0FfoTLoqVM7qQlH8+FngAl9AgTmMQmJdxBdTNszQjp2YmSE61ancatOEpIwLquDZOcUM/YGJ8E+LHe3EqKiRDc6mLPbI1mp8a/EPxUtubNx8tk15wBY2v7vQnOivMeJJiHdHhpff79gX9iRvthAUuTpjyQ/J6dVHzjOA7EEs8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603713; c=relaxed/simple;
	bh=yZZkGzvYwGQerFFmscbOyxyRbKuF5tXIu+UVibCOYp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3OMTzZ1Kb/WTB15/ptyCYJBpIjonjELOzFpA/4axbHxMv9uHOsfW8ES3Qz1toOcxrbqa4uCugsWBq1JWQByLFBRw0CYIDiwCFot4zvK42p5jzu44nPua/mCWZ7wCG5EnW9AbsVKqPwlJxkFrSL1tOoVL/qGY/T77G1IWpgP/b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mgMGTxKN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b83122f9d78so1190872966b.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603705; x=1768208505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYTDA1f3xrFUlmoHbXpxr5Q98/BstkNpIFscwqGCaCw=;
        b=mgMGTxKN0Esp8lgB3XSPXkSqXalp1lel9iX4WCpKh4/KbGF5SIUFaBeqAHI/vule31
         8Omr3qdC2OUcD03ddt6VlndHNBPKkzBVzvwb9uc/Sz2wt8zLifqWRRlbhIxU6/IXV5jC
         /C1BAtwNrzY2QFs5/2EWU5un3hc4M3zV/zN6gVFwUOkrNySyZO+lf9j2tMOAplqFC7Io
         YCo4MupUFOF24+tqXJ9OO75T9Jny+je3Yhx8NS0E+eKPAfqSGlqf5vSD3wUUpCjq7zGE
         0A31ZxqXqFs2GBIsZXWYc0ADPCJEfSjjzctzMr7ZZmVW7SUtzjq+nHRXXvFQTubnN6xu
         BIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603705; x=1768208505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KYTDA1f3xrFUlmoHbXpxr5Q98/BstkNpIFscwqGCaCw=;
        b=JidwJ/VXxKjZD2e76chkJRIH001hj5BVUM/cBgAC2Uic+xqDj69XdhzoiXOZUFYZBK
         qpcjvmTvcOEpm/TLMw2fNPuQjwYVE1UOSIvWECJHAHdZIRcSBXiYuEPWw0BTSz9XCfZs
         nnGcVTVoJhr8dP6ZYgVsDw4FmTFxX2rgPxTZXCqnVofSy3E23WwuXSwzNTjODLK7B0d1
         XJbMaD4gpR5vZWtE2gPizwIz0VVxNaJxq3STGMmhVHxmHJ8bOD9U18mpwFMReGRw7UTS
         inaODavq7hVWQmWZdL/zU9WpPm0Ne9RoV3ySzlR0f9pFv6b0Y+ILFbb52qqQsiNd2WLc
         jFfg==
X-Forwarded-Encrypted: i=1; AJvYcCX50A5uvGO6Ydl69Y6JAkuQIgkDJEZ/XQ/kd3xnCLN45ZzX9iNt6jFtqsXqcb7OWbnXU2ktPaS92qFO@vger.kernel.org
X-Gm-Message-State: AOJu0YxvZ0iI3xElQ6MQzuA9dpFnW4mvM9aeeTSPkftpU05WRiQtBGot
	q24nqZ1fmw5t18iXB2+sR1ZUY8Uo6PEtIpXzaMt17/FjMG6dDuy4NrXPCMeBRc9d8SM=
X-Gm-Gg: AY/fxX4hmfz4Eddj7UYKd3idMeMjrwe+xcRtXTaQNFzgs7+Mkq+3dsvv4rI0cxr8X9m
	Q7iFOG2W7SzLl7VZBinZU1zEoI35N7DXblQLr2k8iqVAufc2aZMzgR59j63ukV9brzdeRqGSB2O
	fzOMKrj/sm9kzZ/2EtUxK5a0/aWYvozb+XVfg8omNXimcN/PspAckWZR/AfWoMoMpPv5AYTZ+sd
	1bLfrAbsmurp1le0hDBgmITU2HmcwbtSglO6k7ULG/6URcvHRzxQ/moj1u3L4Rc3EOlQVDpykLq
	M+d+j0xFLDxgB9SkAzflyOdGFcDkcyHyViWfqYaJRtope2aJ1k08GUfu2tTWodSXDqDotbuClt0
	RcoVuJn5DhUVRF/HHLVOts85+8xjPEvy6CuxCpzt+/BSdhRy7TSOc53jROA3r8V2BCigSd/CU5Q
	JvWEj4nR92FenAeYqutZdCHDcOWjntjsdDVMd5Tg1No/9jn8qwdpO5ksPDaM+kCoHhVFKwuj47o
	5s94g==
X-Google-Smtp-Source: AGHT+IErNv0ZZDraaLv8chvM0LCLBDzrrDPxYHd1p5/4AOMS8a+s7c0oPdvuULn3IaosSMzr06rRxw==
X-Received: by 2002:a17:906:9f91:b0:b72:ddfd:bca7 with SMTP id a640c23a62f3a-b8037058ba5mr4765183066b.35.1767603705079;
        Mon, 05 Jan 2026 01:01:45 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:44 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:45 +0000
Subject: [PATCH v6 09/20] mfd: sec: Add support for S2MPG11 PMIC via ACPM
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-9-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add support for Samsung's S2MPG11 PMIC, which is a Power Management IC
for mobile applications with buck converters, various LDOs, power
meters, NTC thermistor inputs, and additional GPIO interfaces. It
typically complements an S2MPG10 PMIC in a main/sub configuration as
the sub-PMIC.

Like S2MPG10, communication is not via I2C, but via the Samsung ACPM
firmware.

While at it, we can also switch to asynchronous probe, which helps with
probe performance, as the drivers for s2mpg10 and s2mpg11 can probe in
parallel.

Note: The firmware uses the ACPM channel ID and the Speedy channel ID
to select the PMIC address. Since these are firmware properties, they
can not be retrieved from DT, but instead are deducted from the
compatible for now.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch suggests to update MAINTAINERS, but the new file is
covered already due to using a wildcard.

v5:
- rebase
- one MFD cell per PMIC, not per PMIC rail (Mark)
- enable PROBE_PREFER_ASYNCHRONOUS

v4:
- rebase against next-20251121

v3:
- mention NTC thermistor inputs in commit message
- one instance per actual rail, not per rail type (LDO or buck)

v2:
- mention GPIOs in commit message
---
 drivers/mfd/sec-acpm.c              | 171 +++++++++++++-
 drivers/mfd/sec-common.c            |  17 +-
 drivers/mfd/sec-irq.c               |  85 ++++++-
 include/linux/mfd/samsung/core.h    |   1 +
 include/linux/mfd/samsung/irq.h     | 105 +++++++++
 include/linux/mfd/samsung/s2mpg11.h | 434 ++++++++++++++++++++++++++++++++++++
 6 files changed, 807 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 36622069a7885c9b5fc74329efec34e1e4bcc106..537ea65685bfebae205a09a9650c162721833286 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/rtc.h>
 #include <linux/mfd/samsung/s2mpg10.h>
+#include <linux/mfd/samsung/s2mpg11.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -216,6 +217,155 @@ static const struct regmap_config s2mpg10_regmap_config_meter = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct regmap_range s2mpg11_common_registers[] = {
+	regmap_reg_range(0x00, 0x02), /* CHIP_ID_S, INT, INT_MASK */
+	regmap_reg_range(0x0a, 0x0c), /* Speedy control */
+	regmap_reg_range(0x1a, 0x27), /* Debug */
+};
+
+static const struct regmap_range s2mpg11_common_ro_registers[] = {
+	regmap_reg_range(0x00, 0x01), /* CHIP_ID_S, INT */
+	regmap_reg_range(0x25, 0x27), /* Debug */
+};
+
+static const struct regmap_range s2mpg11_common_nonvolatile_registers[] = {
+	regmap_reg_range(0x00, 0x00), /* CHIP_ID_S */
+	regmap_reg_range(0x02, 0x02), /* INT_MASK */
+	regmap_reg_range(0x0a, 0x0c), /* Speedy control */
+};
+
+static const struct regmap_range s2mpg11_common_precious_registers[] = {
+	regmap_reg_range(0x01, 0x01), /* INT */
+};
+
+static const struct regmap_access_table s2mpg11_common_wr_table = {
+	.yes_ranges = s2mpg11_common_registers,
+	.n_yes_ranges = ARRAY_SIZE(s2mpg11_common_registers),
+	.no_ranges = s2mpg11_common_ro_registers,
+	.n_no_ranges = ARRAY_SIZE(s2mpg11_common_ro_registers),
+};
+
+static const struct regmap_access_table s2mpg11_common_rd_table = {
+	.yes_ranges = s2mpg11_common_registers,
+	.n_yes_ranges = ARRAY_SIZE(s2mpg11_common_registers),
+};
+
+static const struct regmap_access_table s2mpg11_common_volatile_table = {
+	.no_ranges = s2mpg11_common_nonvolatile_registers,
+	.n_no_ranges = ARRAY_SIZE(s2mpg11_common_nonvolatile_registers),
+};
+
+static const struct regmap_access_table s2mpg11_common_precious_table = {
+	.yes_ranges = s2mpg11_common_precious_registers,
+	.n_yes_ranges = ARRAY_SIZE(s2mpg11_common_precious_registers),
+};
+
+static const struct regmap_config s2mpg11_regmap_config_common = {
+	.name = "common",
+	.reg_bits = ACPM_ADDR_BITS,
+	.val_bits = 8,
+	.max_register = S2MPG11_COMMON_SPD_DEBUG4,
+	.wr_table = &s2mpg11_common_wr_table,
+	.rd_table = &s2mpg11_common_rd_table,
+	.volatile_table = &s2mpg11_common_volatile_table,
+	.precious_table = &s2mpg11_common_precious_table,
+	.num_reg_defaults_raw = S2MPG11_COMMON_SPD_DEBUG4 + 1,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static const struct regmap_range s2mpg11_pmic_registers[] = {
+	regmap_reg_range(0x00, 0x5a), /* All PMIC registers */
+	regmap_reg_range(0x5c, 0xb7), /* All PMIC registers */
+};
+
+static const struct regmap_range s2mpg11_pmic_ro_registers[] = {
+	regmap_reg_range(0x00, 0x05), /* INTx */
+	regmap_reg_range(0x0c, 0x0d), /* STATUS OFFSRC */
+	regmap_reg_range(0x98, 0x98), /* GPIO input */
+};
+
+static const struct regmap_range s2mpg11_pmic_nonvolatile_registers[] = {
+	regmap_reg_range(0x06, 0x0b), /* INTxM */
+};
+
+static const struct regmap_range s2mpg11_pmic_precious_registers[] = {
+	regmap_reg_range(0x00, 0x05), /* INTx */
+};
+
+static const struct regmap_access_table s2mpg11_pmic_wr_table = {
+	.yes_ranges = s2mpg11_pmic_registers,
+	.n_yes_ranges = ARRAY_SIZE(s2mpg11_pmic_registers),
+	.no_ranges = s2mpg11_pmic_ro_registers,
+	.n_no_ranges = ARRAY_SIZE(s2mpg11_pmic_ro_registers),
+};
+
+static const struct regmap_access_table s2mpg11_pmic_rd_table = {
+	.yes_ranges = s2mpg11_pmic_registers,
+	.n_yes_ranges = ARRAY_SIZE(s2mpg11_pmic_registers),
+};
+
+static const struct regmap_access_table s2mpg11_pmic_volatile_table = {
+	.no_ranges = s2mpg11_pmic_nonvolatile_registers,
+	.n_no_ranges = ARRAY_SIZE(s2mpg11_pmic_nonvolatile_registers),
+};
+
+static const struct regmap_access_table s2mpg11_pmic_precious_table = {
+	.yes_ranges = s2mpg11_pmic_precious_registers,
+	.n_yes_ranges = ARRAY_SIZE(s2mpg11_pmic_precious_registers),
+};
+
+static const struct regmap_config s2mpg11_regmap_config_pmic = {
+	.name = "pmic",
+	.reg_bits = ACPM_ADDR_BITS,
+	.val_bits = 8,
+	.max_register = S2MPG11_PMIC_LDO_SENSE2,
+	.wr_table = &s2mpg11_pmic_wr_table,
+	.rd_table = &s2mpg11_pmic_rd_table,
+	.volatile_table = &s2mpg11_pmic_volatile_table,
+	.precious_table = &s2mpg11_pmic_precious_table,
+	.num_reg_defaults_raw = S2MPG11_PMIC_LDO_SENSE2 + 1,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static const struct regmap_range s2mpg11_meter_registers[] = {
+	regmap_reg_range(0x00, 0x3e), /* Meter config */
+	regmap_reg_range(0x40, 0x8a), /* Meter data */
+	regmap_reg_range(0x8d, 0x9c), /* Meter data */
+};
+
+static const struct regmap_range s2mpg11_meter_ro_registers[] = {
+	regmap_reg_range(0x40, 0x9c), /* Meter data */
+};
+
+static const struct regmap_access_table s2mpg11_meter_wr_table = {
+	.yes_ranges = s2mpg11_meter_registers,
+	.n_yes_ranges = ARRAY_SIZE(s2mpg11_meter_registers),
+	.no_ranges = s2mpg11_meter_ro_registers,
+	.n_no_ranges = ARRAY_SIZE(s2mpg11_meter_ro_registers),
+};
+
+static const struct regmap_access_table s2mpg11_meter_rd_table = {
+	.yes_ranges = s2mpg11_meter_registers,
+	.n_yes_ranges = ARRAY_SIZE(s2mpg11_meter_registers),
+};
+
+static const struct regmap_access_table s2mpg11_meter_volatile_table = {
+	.yes_ranges = s2mpg11_meter_ro_registers,
+	.n_yes_ranges = ARRAY_SIZE(s2mpg11_meter_ro_registers),
+};
+
+static const struct regmap_config s2mpg11_regmap_config_meter = {
+	.name = "meter",
+	.reg_bits = ACPM_ADDR_BITS,
+	.val_bits = 8,
+	.max_register = S2MPG11_METER_LPF_DATA_NTC7_2,
+	.wr_table = &s2mpg11_meter_wr_table,
+	.rd_table = &s2mpg11_meter_rd_table,
+	.volatile_table = &s2mpg11_meter_volatile_table,
+	.num_reg_defaults_raw = S2MPG11_METER_LPF_DATA_NTC7_2 + 1,
+	.cache_type = REGCACHE_FLAT,
+};
+
 struct sec_pmic_acpm_shared_bus_context {
 	const struct acpm_handle *acpm;
 	unsigned int acpm_chan_id;
@@ -364,10 +514,12 @@ static int sec_pmic_acpm_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap_pmic))
 		return PTR_ERR(regmap_pmic);
 
-	regmap = sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_ACPM_ACCESSTYPE_RTC,
-					   pdata->regmap_cfg_rtc, true);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+	if (pdata->regmap_cfg_rtc) {
+		regmap = sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_ACPM_ACCESSTYPE_RTC,
+						   pdata->regmap_cfg_rtc, true);
+		if (IS_ERR(regmap))
+			return PTR_ERR(regmap);
+	}
 
 	regmap = sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_ACPM_ACCESSTYPE_METER,
 					   pdata->regmap_cfg_meter, true);
@@ -399,8 +551,18 @@ static const struct sec_pmic_acpm_platform_data s2mpg10_data = {
 	.regmap_cfg_meter = &s2mpg10_regmap_config_meter,
 };
 
+static const struct sec_pmic_acpm_platform_data s2mpg11_data = {
+	.device_type = S2MPG11,
+	.acpm_chan_id = 2,
+	.speedy_channel = 1,
+	.regmap_cfg_common = &s2mpg11_regmap_config_common,
+	.regmap_cfg_pmic = &s2mpg11_regmap_config_pmic,
+	.regmap_cfg_meter = &s2mpg11_regmap_config_meter,
+};
+
 static const struct of_device_id sec_pmic_acpm_of_match[] = {
 	{ .compatible = "samsung,s2mpg10-pmic", .data = &s2mpg10_data, },
+	{ .compatible = "samsung,s2mpg11-pmic", .data = &s2mpg11_data, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sec_pmic_acpm_of_match);
@@ -408,6 +570,7 @@ MODULE_DEVICE_TABLE(of, sec_pmic_acpm_of_match);
 static struct platform_driver sec_pmic_acpm_driver = {
 	.driver = {
 		.name = "sec-pmic-acpm",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm = pm_sleep_ptr(&sec_pmic_pm_ops),
 		.of_match_table = sec_pmic_acpm_of_match,
 	},
diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 0021f9ae8484fd0afc2e47c813a953c91fa38546..bd8b5f9686892b286a953909c6d3c72e1ae85199 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -49,6 +49,12 @@ static const struct mfd_cell s2mpg10_devs[] = {
 	MFD_CELL_OF("s2mpg10-gpio", NULL, NULL, 0, 0, "samsung,s2mpg10-gpio"),
 };
 
+static const struct mfd_cell s2mpg11_devs[] = {
+	MFD_CELL_NAME("s2mpg11-meter"),
+	MFD_CELL_NAME("s2mpg11-regulator"),
+	MFD_CELL_OF("s2mpg11-gpio", NULL, NULL, 0, 0, "samsung,s2mpg11-gpio"),
+};
+
 static const struct resource s2mps11_rtc_resources[] = {
 	DEFINE_RES_IRQ_NAMED(S2MPS11_IRQ_RTCA0, "alarm"),
 };
@@ -104,8 +110,13 @@ static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
 	unsigned int val;
 
 	/* For s2mpg1x, the revision is in a different regmap */
-	if (sec_pmic->device_type == S2MPG10)
+	switch (sec_pmic->device_type) {
+	case S2MPG10:
+	case S2MPG11:
 		return;
+	default:
+		break;
+	}
 
 	/* For each device type, the REG_ID is always the first register */
 	if (!regmap_read(sec_pmic->regmap_pmic, S2MPS11_REG_ID, &val))
@@ -211,6 +222,10 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 		sec_devs = s2mpg10_devs;
 		num_sec_devs = ARRAY_SIZE(s2mpg10_devs);
 		break;
+	case S2MPG11:
+		sec_devs = s2mpg11_devs;
+		num_sec_devs = ARRAY_SIZE(s2mpg11_devs);
+		break;
 	case S2MPS11X:
 		sec_devs = s2mps11_devs;
 		num_sec_devs = ARRAY_SIZE(s2mps11_devs);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 11a56154d36d251d40b40e91da514db0faa15ae3..47425deae5871ce97363d4c8addf510678fe9813 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -11,6 +11,7 @@
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/s2mpg10.h>
+#include <linux/mfd/samsung/s2mpg11.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps14.h>
 #include <linux/mfd/samsung/s2mpu02.h>
@@ -79,6 +80,64 @@ static const struct regmap_irq s2mpg10_pmic_irqs[] = {
 	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH7, 5, S2MPG10_IRQ_PWR_WARN_CH7_MASK),
 };
 
+static const struct regmap_irq s2mpg11_irqs[] = {
+	REGMAP_IRQ_REG(S2MPG11_COMMON_IRQ_PMIC, 0, S2MPG11_COMMON_INT_SRC_PMIC),
+	/* No documentation or other reference for remaining bits */
+	REGMAP_IRQ_REG(S2MPG11_COMMON_IRQ_UNUSED, 0, GENMASK(7, 1)),
+};
+
+static const struct regmap_irq s2mpg11_pmic_irqs[] = {
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PWRONF, 0, S2MPG11_IRQ_PWRONF_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PWRONR, 0, S2MPG11_IRQ_PWRONR_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PIF_TIMEOUT_MIF, 0, S2MPG11_IRQ_PIF_TIMEOUT_MIF_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PIF_TIMEOUTS, 0, S2MPG11_IRQ_PIF_TIMEOUTS_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_WTSR, 0, S2MPG11_IRQ_WTSR_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_SPD_ABNORMAL_STOP, 0, S2MPG11_IRQ_SPD_ABNORMAL_STOP_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_SPD_PARITY_ERR, 0, S2MPG11_IRQ_SPD_PARITY_ERR_MASK),
+
+	REGMAP_IRQ_REG(S2MPG11_IRQ_140C, 1, S2MPG11_IRQ_INT140C_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_120C, 1, S2MPG11_IRQ_INT120C_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_TSD, 1, S2MPG11_IRQ_TSD_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_WRST, 1, S2MPG11_IRQ_WRST_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_NTC_CYCLE_DONE, 1, S2MPG11_IRQ_NTC_CYCLE_DONE_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PMETER_OVERF, 1, S2MPG11_IRQ_PMETER_OVERF_MASK),
+
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_B1S, 2, S2MPG11_IRQ_OCP_B1S_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_B2S, 2, S2MPG11_IRQ_OCP_B2S_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_B3S, 2, S2MPG11_IRQ_OCP_B3S_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_B4S, 2, S2MPG11_IRQ_OCP_B4S_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_B5S, 2, S2MPG11_IRQ_OCP_B5S_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_B6S, 2, S2MPG11_IRQ_OCP_B6S_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_B7S, 2, S2MPG11_IRQ_OCP_B7S_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_B8S, 2, S2MPG11_IRQ_OCP_B8S_MASK),
+
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_B9S, 3, S2MPG11_IRQ_OCP_B9S_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_B10S, 3, S2MPG11_IRQ_OCP_B10S_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_BDS, 3, S2MPG11_IRQ_OCP_BDS_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_BAS, 3, S2MPG11_IRQ_OCP_BAS_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_OCP_BBS, 3, S2MPG11_IRQ_OCP_BBS_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_WLWP_ACC, 3, S2MPG11_IRQ_WLWP_ACC_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_SPD_SRP_PKT_RST, 3, S2MPG11_IRQ_SPD_SRP_PKT_RST_MASK),
+
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PWR_WARN_CH0, 4, S2MPG11_IRQ_PWR_WARN_CH0_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PWR_WARN_CH1, 4, S2MPG11_IRQ_PWR_WARN_CH1_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PWR_WARN_CH2, 4, S2MPG11_IRQ_PWR_WARN_CH2_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PWR_WARN_CH3, 4, S2MPG11_IRQ_PWR_WARN_CH3_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PWR_WARN_CH4, 4, S2MPG11_IRQ_PWR_WARN_CH4_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PWR_WARN_CH5, 4, S2MPG11_IRQ_PWR_WARN_CH5_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PWR_WARN_CH6, 4, S2MPG11_IRQ_PWR_WARN_CH6_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_PWR_WARN_CH7, 4, S2MPG11_IRQ_PWR_WARN_CH7_MASK),
+
+	REGMAP_IRQ_REG(S2MPG11_IRQ_NTC_WARN_CH0, 5, S2MPG11_IRQ_NTC_WARN_CH0_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_NTC_WARN_CH1, 5, S2MPG11_IRQ_NTC_WARN_CH1_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_NTC_WARN_CH2, 5, S2MPG11_IRQ_NTC_WARN_CH2_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_NTC_WARN_CH3, 5, S2MPG11_IRQ_NTC_WARN_CH3_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_NTC_WARN_CH4, 5, S2MPG11_IRQ_NTC_WARN_CH4_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_NTC_WARN_CH5, 5, S2MPG11_IRQ_NTC_WARN_CH5_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_NTC_WARN_CH6, 5, S2MPG11_IRQ_NTC_WARN_CH6_MASK),
+	REGMAP_IRQ_REG(S2MPG11_IRQ_NTC_WARN_CH7, 5, S2MPG11_IRQ_NTC_WARN_CH7_MASK),
+};
+
 static const struct regmap_irq s2mps11_irqs[] = {
 	REGMAP_IRQ_REG(S2MPS11_IRQ_PWRONF, 0, S2MPS11_IRQ_PWRONF_MASK),
 	REGMAP_IRQ_REG(S2MPS11_IRQ_PWRONR, 0, S2MPS11_IRQ_PWRONR_MASK),
@@ -186,7 +245,7 @@ static const struct regmap_irq s5m8767_irqs[] = {
 	REGMAP_IRQ_REG(S5M8767_IRQ_WTSR, 2, S5M8767_IRQ_WTSR_MASK),
 };
 
-/* All S2MPG10 interrupt sources are read-only and don't require clearing */
+/* All S2MPG1x interrupt sources are read-only and don't require clearing */
 static const struct regmap_irq_chip s2mpg10_irq_chip = {
 	.name = "s2mpg10",
 	.status_base = S2MPG10_COMMON_INT,
@@ -205,6 +264,24 @@ static const struct regmap_irq_chip s2mpg10_irq_chip_pmic = {
 	.num_irqs = ARRAY_SIZE(s2mpg10_pmic_irqs),
 };
 
+static const struct regmap_irq_chip s2mpg11_irq_chip = {
+	.name = "s2mpg11",
+	.status_base = S2MPG11_COMMON_INT,
+	.mask_base = S2MPG11_COMMON_INT_MASK,
+	.num_regs = 1,
+	.irqs = s2mpg11_irqs,
+	.num_irqs = ARRAY_SIZE(s2mpg11_irqs),
+};
+
+static const struct regmap_irq_chip s2mpg11_irq_chip_pmic = {
+	.name = "s2mpg11-pmic",
+	.status_base = S2MPG11_PMIC_INT1,
+	.mask_base = S2MPG11_PMIC_INT1M,
+	.num_regs = 6,
+	.irqs = s2mpg11_pmic_irqs,
+	.num_irqs = ARRAY_SIZE(s2mpg11_pmic_irqs),
+};
+
 static const struct regmap_irq_chip s2mps11_irq_chip = {
 	.name = "s2mps11",
 	.irqs = s2mps11_irqs,
@@ -303,6 +380,11 @@ static struct regmap_irq_chip_data *sec_irq_init_s2mpg1x(struct sec_pmic_dev *se
 		chained_irq_chip = &s2mpg10_irq_chip_pmic;
 		chained_pirq = S2MPG10_COMMON_IRQ_PMIC;
 		break;
+	case S2MPG11:
+		irq_chip = &s2mpg11_irq_chip;
+		chained_irq_chip = &s2mpg11_irq_chip_pmic;
+		chained_pirq = S2MPG11_COMMON_IRQ_PMIC;
+		break;
 	default:
 		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
 					 sec_pmic->device_type);
@@ -339,6 +421,7 @@ struct regmap_irq_chip_data *sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
 	case S2MPG10:
+	case S2MPG11:
 		return sec_irq_init_s2mpg1x(sec_pmic);
 	case S2MPS11X:
 		sec_irq_chip = &s2mps11_irq_chip;
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index c7c3c8cd8d5f99ef0cc3188e1c3b49031f4750f2..4480c631110a6924bedb2d3a307a4fa7ddb2c87d 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -40,6 +40,7 @@ enum sec_device_type {
 	S2DOS05,
 	S2MPA01,
 	S2MPG10,
+	S2MPG11,
 	S2MPS11X,
 	S2MPS13X,
 	S2MPS14X,
diff --git a/include/linux/mfd/samsung/irq.h b/include/linux/mfd/samsung/irq.h
index 8402a5f8e18ab62b4bec89541d785442674adee0..6eab95de6fa8376e114dc5b347e61552a595331f 100644
--- a/include/linux/mfd/samsung/irq.h
+++ b/include/linux/mfd/samsung/irq.h
@@ -166,6 +166,111 @@ enum s2mpg10_irq {
 	S2MPG10_IRQ_NR,
 };
 
+enum s2mpg11_common_irq {
+	/* Top-level (common) block */
+	S2MPG11_COMMON_IRQ_PMIC,
+	S2MPG11_COMMON_IRQ_UNUSED,
+};
+
+enum s2mpg11_irq {
+	/* PMIC */
+	S2MPG11_IRQ_PWRONF,
+	S2MPG11_IRQ_PWRONR,
+	S2MPG11_IRQ_PIF_TIMEOUT_MIF,
+	S2MPG11_IRQ_PIF_TIMEOUTS,
+	S2MPG11_IRQ_WTSR,
+	S2MPG11_IRQ_SPD_ABNORMAL_STOP,
+	S2MPG11_IRQ_SPD_PARITY_ERR,
+#define S2MPG11_IRQ_PWRONF_MASK			BIT(0)
+#define S2MPG11_IRQ_PWRONR_MASK			BIT(1)
+#define S2MPG11_IRQ_PIF_TIMEOUT_MIF_MASK	BIT(3)
+#define S2MPG11_IRQ_PIF_TIMEOUTS_MASK		BIT(4)
+#define S2MPG11_IRQ_WTSR_MASK			BIT(5)
+#define S2MPG11_IRQ_SPD_ABNORMAL_STOP_MASK	BIT(6)
+#define S2MPG11_IRQ_SPD_PARITY_ERR_MASK		BIT(7)
+
+	S2MPG11_IRQ_140C,
+	S2MPG11_IRQ_120C,
+	S2MPG11_IRQ_TSD,
+	S2MPG11_IRQ_WRST,
+	S2MPG11_IRQ_NTC_CYCLE_DONE,
+	S2MPG11_IRQ_PMETER_OVERF,
+#define S2MPG11_IRQ_INT140C_MASK	BIT(0)
+#define S2MPG11_IRQ_INT120C_MASK	BIT(1)
+#define S2MPG11_IRQ_TSD_MASK		BIT(2)
+#define S2MPG11_IRQ_WRST_MASK		BIT(5)
+#define S2MPG11_IRQ_NTC_CYCLE_DONE_MASK	BIT(6)
+#define S2MPG11_IRQ_PMETER_OVERF_MASK	BIT(7)
+
+	S2MPG11_IRQ_OCP_B1S,
+	S2MPG11_IRQ_OCP_B2S,
+	S2MPG11_IRQ_OCP_B3S,
+	S2MPG11_IRQ_OCP_B4S,
+	S2MPG11_IRQ_OCP_B5S,
+	S2MPG11_IRQ_OCP_B6S,
+	S2MPG11_IRQ_OCP_B7S,
+	S2MPG11_IRQ_OCP_B8S,
+#define S2MPG11_IRQ_OCP_B1S_MASK	BIT(0)
+#define S2MPG11_IRQ_OCP_B2S_MASK	BIT(1)
+#define S2MPG11_IRQ_OCP_B3S_MASK	BIT(2)
+#define S2MPG11_IRQ_OCP_B4S_MASK	BIT(3)
+#define S2MPG11_IRQ_OCP_B5S_MASK	BIT(4)
+#define S2MPG11_IRQ_OCP_B6S_MASK	BIT(5)
+#define S2MPG11_IRQ_OCP_B7S_MASK	BIT(6)
+#define S2MPG11_IRQ_OCP_B8S_MASK	BIT(7)
+
+	S2MPG11_IRQ_OCP_B9S,
+	S2MPG11_IRQ_OCP_B10S,
+	S2MPG11_IRQ_OCP_BDS,
+	S2MPG11_IRQ_OCP_BAS,
+	S2MPG11_IRQ_OCP_BBS,
+	S2MPG11_IRQ_WLWP_ACC,
+	S2MPG11_IRQ_SPD_SRP_PKT_RST,
+#define S2MPG11_IRQ_OCP_B9S_MASK		BIT(0)
+#define S2MPG11_IRQ_OCP_B10S_MASK		BIT(1)
+#define S2MPG11_IRQ_OCP_BDS_MASK		BIT(2)
+#define S2MPG11_IRQ_OCP_BAS_MASK		BIT(3)
+#define S2MPG11_IRQ_OCP_BBS_MASK		BIT(4)
+#define S2MPG11_IRQ_WLWP_ACC_MASK		BIT(5)
+#define S2MPG11_IRQ_SPD_SRP_PKT_RST_MASK	BIT(7)
+
+	S2MPG11_IRQ_PWR_WARN_CH0,
+	S2MPG11_IRQ_PWR_WARN_CH1,
+	S2MPG11_IRQ_PWR_WARN_CH2,
+	S2MPG11_IRQ_PWR_WARN_CH3,
+	S2MPG11_IRQ_PWR_WARN_CH4,
+	S2MPG11_IRQ_PWR_WARN_CH5,
+	S2MPG11_IRQ_PWR_WARN_CH6,
+	S2MPG11_IRQ_PWR_WARN_CH7,
+#define S2MPG11_IRQ_PWR_WARN_CH0_MASK	BIT(0)
+#define S2MPG11_IRQ_PWR_WARN_CH1_MASK	BIT(1)
+#define S2MPG11_IRQ_PWR_WARN_CH2_MASK	BIT(2)
+#define S2MPG11_IRQ_PWR_WARN_CH3_MASK	BIT(3)
+#define S2MPG11_IRQ_PWR_WARN_CH4_MASK	BIT(4)
+#define S2MPG11_IRQ_PWR_WARN_CH5_MASK	BIT(5)
+#define S2MPG11_IRQ_PWR_WARN_CH6_MASK	BIT(6)
+#define S2MPG11_IRQ_PWR_WARN_CH7_MASK	BIT(7)
+
+	S2MPG11_IRQ_NTC_WARN_CH0,
+	S2MPG11_IRQ_NTC_WARN_CH1,
+	S2MPG11_IRQ_NTC_WARN_CH2,
+	S2MPG11_IRQ_NTC_WARN_CH3,
+	S2MPG11_IRQ_NTC_WARN_CH4,
+	S2MPG11_IRQ_NTC_WARN_CH5,
+	S2MPG11_IRQ_NTC_WARN_CH6,
+	S2MPG11_IRQ_NTC_WARN_CH7,
+#define S2MPG11_IRQ_NTC_WARN_CH0_MASK	BIT(0)
+#define S2MPG11_IRQ_NTC_WARN_CH1_MASK	BIT(1)
+#define S2MPG11_IRQ_NTC_WARN_CH2_MASK	BIT(2)
+#define S2MPG11_IRQ_NTC_WARN_CH3_MASK	BIT(3)
+#define S2MPG11_IRQ_NTC_WARN_CH4_MASK	BIT(4)
+#define S2MPG11_IRQ_NTC_WARN_CH5_MASK	BIT(5)
+#define S2MPG11_IRQ_NTC_WARN_CH6_MASK	BIT(6)
+#define S2MPG11_IRQ_NTC_WARN_CH7_MASK	BIT(7)
+
+	S2MPG11_IRQ_NR,
+};
+
 enum s2mps11_irq {
 	S2MPS11_IRQ_PWRONF,
 	S2MPS11_IRQ_PWRONR,
diff --git a/include/linux/mfd/samsung/s2mpg11.h b/include/linux/mfd/samsung/s2mpg11.h
new file mode 100644
index 0000000000000000000000000000000000000000..66daa3bafa6e55eef5831b50143e8d580bb43f72
--- /dev/null
+++ b/include/linux/mfd/samsung/s2mpg11.h
@@ -0,0 +1,434 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2015 Samsung Electronics
+ * Copyright 2020 Google Inc
+ * Copyright 2025 Linaro Ltd.
+ */
+
+#ifndef __LINUX_MFD_S2MPG11_H
+#define __LINUX_MFD_S2MPG11_H
+
+/* Common registers (type 0x000) */
+enum s2mpg11_common_reg {
+	S2MPG11_COMMON_CHIPID,
+	S2MPG11_COMMON_INT,
+	S2MPG11_COMMON_INT_MASK,
+	S2MPG11_COMMON_SPD_CTRL1 = 0x0a,
+	S2MPG11_COMMON_SPD_CTRL2,
+	S2MPG11_COMMON_SPD_CTRL3,
+	S2MPG11_COMMON_MON1SEL = 0x1a,
+	S2MPG11_COMMON_MON2SEL,
+	S2MPG11_COMMON_MONR,
+	S2MPG11_COMMON_DEBUG_CTRL1,
+	S2MPG11_COMMON_DEBUG_CTRL2,
+	S2MPG11_COMMON_DEBUG_CTRL3,
+	S2MPG11_COMMON_DEBUG_CTRL4,
+	S2MPG11_COMMON_DEBUG_CTRL5,
+	S2MPG11_COMMON_DEBUG_CTRL6,
+	S2MPG11_COMMON_TEST_MODE1,
+	S2MPG11_COMMON_SPD_DEBUG1,
+	S2MPG11_COMMON_SPD_DEBUG2,
+	S2MPG11_COMMON_SPD_DEBUG3,
+	S2MPG11_COMMON_SPD_DEBUG4,
+};
+
+/* For S2MPG11_COMMON_INT and S2MPG11_COMMON_INT_MASK */
+#define S2MPG11_COMMON_INT_SRC       GENMASK(2, 0)
+#define S2MPG11_COMMON_INT_SRC_PMIC  BIT(0)
+
+/* PMIC registers (type 0x100) */
+enum s2mpg11_pmic_reg {
+	S2MPG11_PMIC_INT1,
+	S2MPG11_PMIC_INT2,
+	S2MPG11_PMIC_INT3,
+	S2MPG11_PMIC_INT4,
+	S2MPG11_PMIC_INT5,
+	S2MPG11_PMIC_INT6,
+	S2MPG11_PMIC_INT1M,
+	S2MPG11_PMIC_INT2M,
+	S2MPG11_PMIC_INT3M,
+	S2MPG11_PMIC_INT4M,
+	S2MPG11_PMIC_INT5M,
+	S2MPG11_PMIC_INT6M,
+	S2MPG11_PMIC_STATUS1,
+	S2MPG11_PMIC_OFFSRC,
+	S2MPG11_PMIC_COMMON_CTRL1,
+	S2MPG11_PMIC_COMMON_CTRL2,
+	S2MPG11_PMIC_COMMON_CTRL3,
+	S2MPG11_PMIC_MIMICKING_CTRL,
+	S2MPG11_PMIC_B1S_CTRL,
+	S2MPG11_PMIC_B1S_OUT1,
+	S2MPG11_PMIC_B1S_OUT2,
+	S2MPG11_PMIC_B2S_CTRL,
+	S2MPG11_PMIC_B2S_OUT1,
+	S2MPG11_PMIC_B2S_OUT2,
+	S2MPG11_PMIC_B3S_CTRL,
+	S2MPG11_PMIC_B3S_OUT1,
+	S2MPG11_PMIC_B3S_OUT2,
+	S2MPG11_PMIC_B4S_CTRL,
+	S2MPG11_PMIC_B4S_OUT,
+	S2MPG11_PMIC_B5S_CTRL,
+	S2MPG11_PMIC_B5S_OUT,
+	S2MPG11_PMIC_B6S_CTRL,
+	S2MPG11_PMIC_B6S_OUT1,
+	S2MPG11_PMIC_B6S_OUT2,
+	S2MPG11_PMIC_B7S_CTRL,
+	S2MPG11_PMIC_B7S_OUT1,
+	S2MPG11_PMIC_B7S_OUT2,
+	S2MPG11_PMIC_B8S_CTRL,
+	S2MPG11_PMIC_B8S_OUT1,
+	S2MPG11_PMIC_B8S_OUT2,
+	S2MPG11_PMIC_B9S_CTRL,
+	S2MPG11_PMIC_B9S_OUT1,
+	S2MPG11_PMIC_B9S_OUT2,
+	S2MPG11_PMIC_B10S_CTRL,
+	S2MPG11_PMIC_B10S_OUT,
+	S2MPG11_PMIC_BUCKD_CTRL,
+	S2MPG11_PMIC_BUCKD_OUT,
+	S2MPG11_PMIC_BUCKA_CTRL,
+	S2MPG11_PMIC_BUCKA_OUT,
+	S2MPG11_PMIC_BB_CTRL,
+	S2MPG11_PMIC_BB_OUT1,
+	S2MPG11_PMIC_BB_OUT2,
+	S2MPG11_PMIC_BUCK1S_USONIC,
+	S2MPG11_PMIC_BUCK2S_USONIC,
+	S2MPG11_PMIC_BUCK3S_USONIC,
+	S2MPG11_PMIC_BUCK4S_USONIC,
+	S2MPG11_PMIC_BUCK5S_USONIC,
+	S2MPG11_PMIC_BUCK6S_USONIC,
+	S2MPG11_PMIC_BUCK7S_USONIC,
+	S2MPG11_PMIC_BUCK8S_USONIC,
+	S2MPG11_PMIC_BUCK9S_USONIC,
+	S2MPG11_PMIC_BUCK10S_USONIC,
+	S2MPG11_PMIC_BUCKD_USONIC,
+	S2MPG11_PMIC_BUCKA_USONIC,
+	S2MPG11_PMIC_BB_USONIC,
+	S2MPG11_PMIC_L1S_CTRL1,
+	S2MPG11_PMIC_L1S_CTRL2,
+	S2MPG11_PMIC_L2S_CTRL1,
+	S2MPG11_PMIC_L2S_CTRL2,
+	S2MPG11_PMIC_L3S_CTRL,
+	S2MPG11_PMIC_L4S_CTRL,
+	S2MPG11_PMIC_L5S_CTRL,
+	S2MPG11_PMIC_L6S_CTRL,
+	S2MPG11_PMIC_L7S_CTRL,
+	S2MPG11_PMIC_L8S_CTRL,
+	S2MPG11_PMIC_L9S_CTRL,
+	S2MPG11_PMIC_L10S_CTRL,
+	S2MPG11_PMIC_L11S_CTRL,
+	S2MPG11_PMIC_L12S_CTRL,
+	S2MPG11_PMIC_L13S_CTRL,
+	S2MPG11_PMIC_L14S_CTRL,
+	S2MPG11_PMIC_L15S_CTRL,
+	S2MPG11_PMIC_LDO_CTRL1,
+	S2MPG11_PMIC_LDO_DSCH1,
+	S2MPG11_PMIC_LDO_DSCH2,
+	S2MPG11_PMIC_DVS_RAMP1,
+	S2MPG11_PMIC_DVS_RAMP2,
+	S2MPG11_PMIC_DVS_RAMP3,
+	S2MPG11_PMIC_DVS_RAMP4,
+	S2MPG11_PMIC_DVS_RAMP5,
+	S2MPG11_PMIC_DVS_RAMP6,
+	/* Nothing @ 0x5a */
+	S2MPG11_PMIC_DVS_SYNC_CTRL1 = 0x5c,
+	S2MPG11_PMIC_DVS_SYNC_CTRL2,
+	S2MPG11_PMIC_OFF_CTRL1,
+	S2MPG11_PMIC_OFF_CTRL2,
+	S2MPG11_PMIC_OFF_CTRL3,
+	S2MPG11_PMIC_SEQ_CTRL1,
+	S2MPG11_PMIC_SEQ_CTRL2,
+	S2MPG11_PMIC_SEQ_CTRL3,
+	S2MPG11_PMIC_SEQ_CTRL4,
+	S2MPG11_PMIC_SEQ_CTRL5,
+	S2MPG11_PMIC_SEQ_CTRL6,
+	S2MPG11_PMIC_SEQ_CTRL7,
+	S2MPG11_PMIC_SEQ_CTRL8,
+	S2MPG11_PMIC_SEQ_CTRL9,
+	S2MPG11_PMIC_SEQ_CTRL10,
+	S2MPG11_PMIC_SEQ_CTRL11,
+	S2MPG11_PMIC_SEQ_CTRL12,
+	S2MPG11_PMIC_SEQ_CTRL13,
+	S2MPG11_PMIC_SEQ_CTRL14,
+	S2MPG11_PMIC_SEQ_CTRL15,
+	S2MPG11_PMIC_SEQ_CTRL16,
+	S2MPG11_PMIC_SEQ_CTRL17,
+	S2MPG11_PMIC_SEQ_CTRL18,
+	S2MPG11_PMIC_SEQ_CTRL19,
+	S2MPG11_PMIC_SEQ_CTRL20,
+	S2MPG11_PMIC_SEQ_CTRL21,
+	S2MPG11_PMIC_SEQ_CTRL22,
+	S2MPG11_PMIC_SEQ_CTRL23,
+	S2MPG11_PMIC_SEQ_CTRL24,
+	S2MPG11_PMIC_SEQ_CTRL25,
+	S2MPG11_PMIC_SEQ_CTRL26,
+	S2MPG11_PMIC_SEQ_CTRL27,
+	S2MPG11_PMIC_OFF_SEQ_CTRL1,
+	S2MPG11_PMIC_OFF_SEQ_CTRL2,
+	S2MPG11_PMIC_OFF_SEQ_CTRL3,
+	S2MPG11_PMIC_OFF_SEQ_CTRL4,
+	S2MPG11_PMIC_OFF_SEQ_CTRL5,
+	S2MPG11_PMIC_OFF_SEQ_CTRL6,
+	S2MPG11_PMIC_OFF_SEQ_CTRL7,
+	S2MPG11_PMIC_OFF_SEQ_CTRL8,
+	S2MPG11_PMIC_OFF_SEQ_CTRL9,
+	S2MPG11_PMIC_OFF_SEQ_CTRL10,
+	S2MPG11_PMIC_OFF_SEQ_CTRL11,
+	S2MPG11_PMIC_OFF_SEQ_CTRL12,
+	S2MPG11_PMIC_OFF_SEQ_CTRL13,
+	S2MPG11_PMIC_OFF_SEQ_CTRL14,
+	S2MPG11_PMIC_OFF_SEQ_CTRL15,
+	S2MPG11_PMIC_OFF_SEQ_CTRL16,
+	S2MPG11_PMIC_OFF_SEQ_CTRL17,
+	S2MPG11_PMIC_PCTRLSEL1,
+	S2MPG11_PMIC_PCTRLSEL2,
+	S2MPG11_PMIC_PCTRLSEL3,
+	S2MPG11_PMIC_PCTRLSEL4,
+	S2MPG11_PMIC_PCTRLSEL5,
+	S2MPG11_PMIC_PCTRLSEL6,
+	S2MPG11_PMIC_DCTRLSEL1,
+	S2MPG11_PMIC_DCTRLSEL2,
+	S2MPG11_PMIC_DCTRLSEL3,
+	S2MPG11_PMIC_DCTRLSEL4,
+	S2MPG11_PMIC_DCTRLSEL5,
+	S2MPG11_PMIC_GPIO_CTRL1,
+	S2MPG11_PMIC_GPIO_CTRL2,
+	S2MPG11_PMIC_GPIO_CTRL3,
+	S2MPG11_PMIC_GPIO_CTRL4,
+	S2MPG11_PMIC_GPIO_CTRL5,
+	S2MPG11_PMIC_GPIO_CTRL6,
+	S2MPG11_PMIC_GPIO_CTRL7,
+	S2MPG11_PMIC_B2S_OCP_WARN,
+	S2MPG11_PMIC_B2S_OCP_WARN_X,
+	S2MPG11_PMIC_B2S_OCP_WARN_Y,
+	S2MPG11_PMIC_B2S_OCP_WARN_Z,
+	S2MPG11_PMIC_B2S_SOFT_OCP_WARN,
+	S2MPG11_PMIC_B2S_SOFT_OCP_WARN_X,
+	S2MPG11_PMIC_B2S_SOFT_OCP_WARN_Y,
+	S2MPG11_PMIC_B2S_SOFT_OCP_WARN_Z,
+	S2MPG11_PMIC_BUCK_OCP_EN1,
+	S2MPG11_PMIC_BUCK_OCP_EN2,
+	S2MPG11_PMIC_BUCK_OCP_PD_EN1,
+	S2MPG11_PMIC_BUCK_OCP_PD_EN2,
+	S2MPG11_PMIC_BUCK_OCP_CTRL1,
+	S2MPG11_PMIC_BUCK_OCP_CTRL2,
+	S2MPG11_PMIC_BUCK_OCP_CTRL3,
+	S2MPG11_PMIC_BUCK_OCP_CTRL4,
+	S2MPG11_PMIC_BUCK_OCP_CTRL5,
+	S2MPG11_PMIC_BUCK_OCP_CTRL6,
+	S2MPG11_PMIC_BUCK_OCP_CTRL7,
+	S2MPG11_PMIC_PIF_CTRL,
+	S2MPG11_PMIC_BUCK_HR_MODE1,
+	S2MPG11_PMIC_BUCK_HR_MODE2,
+	S2MPG11_PMIC_FAULTOUT_CTRL,
+	S2MPG11_PMIC_LDO_SENSE1,
+	S2MPG11_PMIC_LDO_SENSE2,
+};
+
+/* For S2MPG11_PMIC_PCTRLSELx */
+#define S2MPG11_PCTRLSEL_PWREN           0x1 /* PWREN pin */
+#define S2MPG11_PCTRLSEL_PWREN_TRG       0x2 /* PWREN_TRG bit in MIMICKING_CTRL */
+#define S2MPG11_PCTRLSEL_PWREN_MIF       0x3 /* PWREN_MIF pin */
+#define S2MPG11_PCTRLSEL_PWREN_MIF_TRG   0x4 /* PWREN_MIF_TRG bit in MIMICKING_CTRL */
+#define S2MPG11_PCTRLSEL_AP_ACTIVE_N     0x5 /* ~AP_ACTIVE_N pin */
+#define S2MPG11_PCTRLSEL_AP_ACTIVE_N_TRG 0x6 /* ~AP_ACTIVE_N_TRG bit in MIMICKING_CTRL */
+#define S2MPG11_PCTRLSEL_G3D_EN          0x7 /* G3D_EN pin */
+#define S2MPG11_PCTRLSEL_G3D_EN2         0x8 /* G3D_EN & ~AP_ACTIVE_N pins */
+#define S2MPG11_PCTRLSEL_AOC_VDD         0x9 /* AOC_VDD pin */
+#define S2MPG11_PCTRLSEL_AOC_RET         0xa /* AOC_RET pin */
+#define S2MPG11_PCTRLSEL_UFS_EN          0xb /* UFS_EN pin */
+#define S2MPG11_PCTRLSEL_LDO13S_EN       0xc /* VLDO13S_EN pin */
+
+/* Meter registers (type 0xa00) */
+enum s2mpg11_meter_reg {
+	S2MPG11_METER_CTRL1,
+	S2MPG11_METER_CTRL2,
+	S2MPG11_METER_CTRL3,
+	S2MPG11_METER_CTRL4,
+	S2MPG11_METER_CTRL5,
+	S2MPG11_METER_BUCKEN1,
+	S2MPG11_METER_BUCKEN2,
+	S2MPG11_METER_MUXSEL0,
+	S2MPG11_METER_MUXSEL1,
+	S2MPG11_METER_MUXSEL2,
+	S2MPG11_METER_MUXSEL3,
+	S2MPG11_METER_MUXSEL4,
+	S2MPG11_METER_MUXSEL5,
+	S2MPG11_METER_MUXSEL6,
+	S2MPG11_METER_MUXSEL7,
+	S2MPG11_METER_LPF_C0_0,
+	S2MPG11_METER_LPF_C0_1,
+	S2MPG11_METER_LPF_C0_2,
+	S2MPG11_METER_LPF_C0_3,
+	S2MPG11_METER_LPF_C0_4,
+	S2MPG11_METER_LPF_C0_5,
+	S2MPG11_METER_LPF_C0_6,
+	S2MPG11_METER_LPF_C0_7,
+	S2MPG11_METER_NTC_LPF_C0_0,
+	S2MPG11_METER_NTC_LPF_C0_1,
+	S2MPG11_METER_NTC_LPF_C0_2,
+	S2MPG11_METER_NTC_LPF_C0_3,
+	S2MPG11_METER_NTC_LPF_C0_4,
+	S2MPG11_METER_NTC_LPF_C0_5,
+	S2MPG11_METER_NTC_LPF_C0_6,
+	S2MPG11_METER_NTC_LPF_C0_7,
+	S2MPG11_METER_PWR_WARN0,
+	S2MPG11_METER_PWR_WARN1,
+	S2MPG11_METER_PWR_WARN2,
+	S2MPG11_METER_PWR_WARN3,
+	S2MPG11_METER_PWR_WARN4,
+	S2MPG11_METER_PWR_WARN5,
+	S2MPG11_METER_PWR_WARN6,
+	S2MPG11_METER_PWR_WARN7,
+	S2MPG11_METER_NTC_L_WARN0,
+	S2MPG11_METER_NTC_L_WARN1,
+	S2MPG11_METER_NTC_L_WARN2,
+	S2MPG11_METER_NTC_L_WARN3,
+	S2MPG11_METER_NTC_L_WARN4,
+	S2MPG11_METER_NTC_L_WARN5,
+	S2MPG11_METER_NTC_L_WARN6,
+	S2MPG11_METER_NTC_L_WARN7,
+	S2MPG11_METER_NTC_H_WARN0,
+	S2MPG11_METER_NTC_H_WARN1,
+	S2MPG11_METER_NTC_H_WARN2,
+	S2MPG11_METER_NTC_H_WARN3,
+	S2MPG11_METER_NTC_H_WARN4,
+	S2MPG11_METER_NTC_H_WARN5,
+	S2MPG11_METER_NTC_H_WARN6,
+	S2MPG11_METER_NTC_H_WARN7,
+	S2MPG11_METER_PWR_HYS1,
+	S2MPG11_METER_PWR_HYS2,
+	S2MPG11_METER_PWR_HYS3,
+	S2MPG11_METER_PWR_HYS4,
+	S2MPG11_METER_NTC_HYS1,
+	S2MPG11_METER_NTC_HYS2,
+	S2MPG11_METER_NTC_HYS3,
+	S2MPG11_METER_NTC_HYS4,
+	/* Nothing @ 0x3f */
+	S2MPG11_METER_ACC_DATA_CH0_1 = 0x40,
+	S2MPG11_METER_ACC_DATA_CH0_2,
+	S2MPG11_METER_ACC_DATA_CH0_3,
+	S2MPG11_METER_ACC_DATA_CH0_4,
+	S2MPG11_METER_ACC_DATA_CH0_5,
+	S2MPG11_METER_ACC_DATA_CH0_6,
+	S2MPG11_METER_ACC_DATA_CH1_1,
+	S2MPG11_METER_ACC_DATA_CH1_2,
+	S2MPG11_METER_ACC_DATA_CH1_3,
+	S2MPG11_METER_ACC_DATA_CH1_4,
+	S2MPG11_METER_ACC_DATA_CH1_5,
+	S2MPG11_METER_ACC_DATA_CH1_6,
+	S2MPG11_METER_ACC_DATA_CH2_1,
+	S2MPG11_METER_ACC_DATA_CH2_2,
+	S2MPG11_METER_ACC_DATA_CH2_3,
+	S2MPG11_METER_ACC_DATA_CH2_4,
+	S2MPG11_METER_ACC_DATA_CH2_5,
+	S2MPG11_METER_ACC_DATA_CH2_6,
+	S2MPG11_METER_ACC_DATA_CH3_1,
+	S2MPG11_METER_ACC_DATA_CH3_2,
+	S2MPG11_METER_ACC_DATA_CH3_3,
+	S2MPG11_METER_ACC_DATA_CH3_4,
+	S2MPG11_METER_ACC_DATA_CH3_5,
+	S2MPG11_METER_ACC_DATA_CH3_6,
+	S2MPG11_METER_ACC_DATA_CH4_1,
+	S2MPG11_METER_ACC_DATA_CH4_2,
+	S2MPG11_METER_ACC_DATA_CH4_3,
+	S2MPG11_METER_ACC_DATA_CH4_4,
+	S2MPG11_METER_ACC_DATA_CH4_5,
+	S2MPG11_METER_ACC_DATA_CH4_6,
+	S2MPG11_METER_ACC_DATA_CH5_1,
+	S2MPG11_METER_ACC_DATA_CH5_2,
+	S2MPG11_METER_ACC_DATA_CH5_3,
+	S2MPG11_METER_ACC_DATA_CH5_4,
+	S2MPG11_METER_ACC_DATA_CH5_5,
+	S2MPG11_METER_ACC_DATA_CH5_6,
+	S2MPG11_METER_ACC_DATA_CH6_1,
+	S2MPG11_METER_ACC_DATA_CH6_2,
+	S2MPG11_METER_ACC_DATA_CH6_3,
+	S2MPG11_METER_ACC_DATA_CH6_4,
+	S2MPG11_METER_ACC_DATA_CH6_5,
+	S2MPG11_METER_ACC_DATA_CH6_6,
+	S2MPG11_METER_ACC_DATA_CH7_1,
+	S2MPG11_METER_ACC_DATA_CH7_2,
+	S2MPG11_METER_ACC_DATA_CH7_3,
+	S2MPG11_METER_ACC_DATA_CH7_4,
+	S2MPG11_METER_ACC_DATA_CH7_5,
+	S2MPG11_METER_ACC_DATA_CH7_6,
+	S2MPG11_METER_ACC_COUNT_1,
+	S2MPG11_METER_ACC_COUNT_2,
+	S2MPG11_METER_ACC_COUNT_3,
+	S2MPG11_METER_LPF_DATA_CH0_1,
+	S2MPG11_METER_LPF_DATA_CH0_2,
+	S2MPG11_METER_LPF_DATA_CH0_3,
+	S2MPG11_METER_LPF_DATA_CH1_1,
+	S2MPG11_METER_LPF_DATA_CH1_2,
+	S2MPG11_METER_LPF_DATA_CH1_3,
+	S2MPG11_METER_LPF_DATA_CH2_1,
+	S2MPG11_METER_LPF_DATA_CH2_2,
+	S2MPG11_METER_LPF_DATA_CH2_3,
+	S2MPG11_METER_LPF_DATA_CH3_1,
+	S2MPG11_METER_LPF_DATA_CH3_2,
+	S2MPG11_METER_LPF_DATA_CH3_3,
+	S2MPG11_METER_LPF_DATA_CH4_1,
+	S2MPG11_METER_LPF_DATA_CH4_2,
+	S2MPG11_METER_LPF_DATA_CH4_3,
+	S2MPG11_METER_LPF_DATA_CH5_1,
+	S2MPG11_METER_LPF_DATA_CH5_2,
+	S2MPG11_METER_LPF_DATA_CH5_3,
+	S2MPG11_METER_LPF_DATA_CH6_1,
+	S2MPG11_METER_LPF_DATA_CH6_2,
+	S2MPG11_METER_LPF_DATA_CH6_3,
+	S2MPG11_METER_LPF_DATA_CH7_1,
+	S2MPG11_METER_LPF_DATA_CH7_2,
+	S2MPG11_METER_LPF_DATA_CH7_3,
+	/* Nothing @ 0x8b 0x8c */
+	S2MPG11_METER_LPF_DATA_NTC0_1 = 0x8d,
+	S2MPG11_METER_LPF_DATA_NTC0_2,
+	S2MPG11_METER_LPF_DATA_NTC1_1,
+	S2MPG11_METER_LPF_DATA_NTC1_2,
+	S2MPG11_METER_LPF_DATA_NTC2_1,
+	S2MPG11_METER_LPF_DATA_NTC2_2,
+	S2MPG11_METER_LPF_DATA_NTC3_1,
+	S2MPG11_METER_LPF_DATA_NTC3_2,
+	S2MPG11_METER_LPF_DATA_NTC4_1,
+	S2MPG11_METER_LPF_DATA_NTC4_2,
+	S2MPG11_METER_LPF_DATA_NTC5_1,
+	S2MPG11_METER_LPF_DATA_NTC5_2,
+	S2MPG11_METER_LPF_DATA_NTC6_1,
+	S2MPG11_METER_LPF_DATA_NTC6_2,
+	S2MPG11_METER_LPF_DATA_NTC7_1,
+	S2MPG11_METER_LPF_DATA_NTC7_2,
+};
+
+/* S2MPG11 regulator IDs */
+enum s2mpg11_regulators {
+	S2MPG11_BUCKBOOST,
+	S2MPG11_BUCK1,
+	S2MPG11_BUCK2,
+	S2MPG11_BUCK3,
+	S2MPG11_BUCK4,
+	S2MPG11_BUCK5,
+	S2MPG11_BUCK6,
+	S2MPG11_BUCK7,
+	S2MPG11_BUCK8,
+	S2MPG11_BUCK9,
+	S2MPG11_BUCK10,
+	S2MPG11_BUCKD,
+	S2MPG11_BUCKA,
+	S2MPG11_LDO1,
+	S2MPG11_LDO2,
+	S2MPG11_LDO3,
+	S2MPG11_LDO4,
+	S2MPG11_LDO5,
+	S2MPG11_LDO6,
+	S2MPG11_LDO7,
+	S2MPG11_LDO8,
+	S2MPG11_LDO9,
+	S2MPG11_LDO10,
+	S2MPG11_LDO11,
+	S2MPG11_LDO12,
+	S2MPG11_LDO13,
+	S2MPG11_LDO14,
+	S2MPG11_LDO15,
+	S2MPG11_REGULATOR_MAX,
+};
+
+#endif /* __LINUX_MFD_S2MPG11_H */

-- 
2.52.0.351.gbe84eed79e-goog


