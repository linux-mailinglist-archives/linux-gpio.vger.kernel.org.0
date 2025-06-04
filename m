Return-Path: <linux-gpio+bounces-21000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8294EACE15E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE4187ABC75
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342FA19E7D0;
	Wed,  4 Jun 2025 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJpuLOao"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36EF1C84D9
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050759; cv=none; b=jk8oKDwtLgEKrFoJeOWfabmzeAj8tDvvLdhUolvnBT81obY3ti6gGyXLCkX7EAORZEjqUYSrMkhCYqk04FdUQAQCHfq12SqpjOMgoQS5wiPZ4ElgpOE3YpDFFqqqD108toHw9jHjR/hdR0SWmjqa5F2AdPz41kwRDTWi64Py3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050759; c=relaxed/simple;
	bh=hEZQpjBK7E4S4fNhXRiHmozkj65EBLBzpWmQesVJVXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRLpGogwFMISt388FE2epRRAkZCsEBqqEhB6iTuPkZCyf964eIIMssyGKXhy2VDHfUG6qHbdfby0oCofYIRPJS54EsoMH5BSHUTEWfOhvTChZC3Tnt1pp5KgD5BADS9PmRYIcpl2JS5V5Nn3JOE7ZqZsC2czoS94HVARRRLBaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJpuLOao; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-adb2bb25105so1130706666b.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050751; x=1749655551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSCk1RCEvOr7TDmN41Gm/t/3PTvQDV7fG4m/TbYxnM4=;
        b=SJpuLOaon3Cr+cl4zOdlPJQlrzncJdgmiY6i2JuXEQN45dGElW5R/wJRYwePhbAUjE
         plsmev73G8jNqnF1jaoD14uXQYHXwnNlAya7SCZc+4gxNmjwb3N232kVbPDmVYn3khex
         eAT/WOVn+QuQpItDiMhoRraMC3OcHbBHbErX7qxNHkvdd1EAZmySk4NFBBks6qieSZeD
         gNLQAVxZg3cXModP4f1kM2h1vpQ9YF7ih5VPK9RAHW7L+GmmvSaserZjc0dbhO5tTs7y
         xoE8UXq9MeQWMCmaWunwtOwy+5sqxOSxwyLPX8whHD7cN1tlEUroqhh15z+BAOh3tnNV
         yqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050751; x=1749655551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSCk1RCEvOr7TDmN41Gm/t/3PTvQDV7fG4m/TbYxnM4=;
        b=egiITtbl4uflu2o4Qa83szXcz6pfOFvOnxA/pVc5UwiQSu4Q6JAmpWI+oPKd8CYCYW
         aoacLZFzHQpwp8r+kMIpyT2g80SzQmztxZvUfP015r8kRwdKbnXgZqEAXyH/74FOjz70
         AsIGfT4w1VNezYplXRF0KOswlJFIn3mSY7OtD7GQWUW7N9pk986l+tSs72UB9Ot4S+NW
         2eXu0/pdw14Fy7haHjUKWRTvI6TA/f4i59WpX1Rn/0/HfSVlreg8U9cfhwiyKQOWb8Rd
         MojMAlKbW5KxYSpwailCSr5YxAcKJ9ZdLjUo5arI/TwEY034ht6N8pQCUIJbQA7hhUlW
         JTFg==
X-Forwarded-Encrypted: i=1; AJvYcCUY+cIlihzEeqsz5KBeyaoNOyoccILTQvrXvxDpleFX4pBX7v/UPsxryuWVO+ZCgphx6tAqZYllrbKX@vger.kernel.org
X-Gm-Message-State: AOJu0YwUj5y86JH8sNSWkO0lSl3vDJM+W1GNNGKbQKY1I1Dvh3lJttuo
	qdYhG0s5mqHM7tfoRQIY7KcBYY/ykGubymuMLadogDR36AUOZsmlgMopMp8J8qDmFfk=
X-Gm-Gg: ASbGncuJcntEERnQ+S4ZkL8lRX1jm5beMmEQ4/1hbRnRMQ4XrSJ792X3k3wV43RUL+N
	kCBwPyLMy721nZojW2Wuwi2u2QUtvN1Asoz7BSqz/FzPrkUeZ0KAuf8rDljxDv9fctBetK9v54s
	+J68+mvkxZBTa0Orq3g9wSMALU31wylEuEhtMnWWwjuYt3gj228w/mlLveyUJQ8ceqSOtIA461o
	+fxcbAh7xEWuBfeT0NdprJIHTzevtcBShGaAgpofrgQNYHyrCNV9jbs78LtrabDCtwK6quRL6e6
	XxBVvR2xUnT9GezSNtlJF5AaPutueHNcalYNQkyF/enrpmDbYvjj0qQzjRpjfI4iTZFKrBPkXXl
	i4MfglXtURIZ4xBmRDHM1UxdLJ3I1SKWuWA8=
X-Google-Smtp-Source: AGHT+IHxs49fPL3OhZlxz0pual1n3oAnI4X+vf8MtzzY07OyKvdLSmHWEZvMEza0KI0jlSsYkWJ2/g==
X-Received: by 2002:a17:907:9713:b0:add:ed3a:e792 with SMTP id a640c23a62f3a-addf8fb3ademr280186766b.47.1749050749542;
        Wed, 04 Jun 2025 08:25:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:47 +0100
Subject: [PATCH 08/17] mfd: sec: Add support for S2MPG11 PMIC via ACPM
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-8-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add support for Samsung's S2MPG11 PMIC, which is a Power Management IC
for mobile applications with buck converters, various LDOs, and power
meters. It typically complements an S2MPG10 PMIC in a main/sub
configuration as the sub-PMIC.

Like S2MPG10, communication is not via I2C, but via the Samsung ACPM
firmware.

Note: The firmware uses the ACPM channel ID and the Speedy channel ID
to select the PMIC address. Since these are firmware properties, they
can not be retrieved from DT, but instead are deducted from the
compatible for now.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch suggests to update MAINTAINERS, but the new file is
covered already due to using a wildcard.
---
 drivers/mfd/sec-acpm.c              | 213 +++++++++++++++++-
 drivers/mfd/sec-common.c            |  18 +-
 drivers/mfd/sec-irq.c               |  67 +++++-
 include/linux/mfd/samsung/core.h    |   1 +
 include/linux/mfd/samsung/irq.h     |  99 +++++++++
 include/linux/mfd/samsung/s2mpg11.h | 420 ++++++++++++++++++++++++++++++++++++
 6 files changed, 807 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 8b31c816d65b86c54a108fa994384abfac0e7da4..b44af6f8b1cdfcb75cf9d4c55c9d973a88fd510c 100644
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
@@ -325,16 +475,22 @@ static struct regmap *sec_pmic_acpm_regmap_init(struct device *dev,
 	return regmap;
 }
 
-static void sec_pmic_acpm_mask_common_irqs(void *regmap_common)
+static void sec_pmic_acpm_mask_common_s2mpg10_irqs(void *regmap_common)
 {
 	regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK, S2MPG10_COMMON_INT_SRC);
 }
 
+static void sec_pmic_acpm_mask_common_s2mpg11_irqs(void *regmap_common)
+{
+	regmap_write(regmap_common, S2MPG11_COMMON_INT_MASK, S2MPG11_COMMON_INT_SRC);
+}
+
 static int sec_pmic_acpm_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap_common, *regmap_pmic, *regmap;
 	const struct sec_pmic_acpm_platform_data *pdata;
 	struct sec_pmic_acpm_shared_bus_context *shared_ctx;
+	void (*masq_irqs_handler)(void *data);
 	const struct acpm_handle *acpm;
 	struct device *dev = &pdev->dev;
 	int ret, irq;
@@ -365,7 +521,19 @@ static int sec_pmic_acpm_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap_common);
 
 	/* Mask all interrupts from 'common' block, until successful init */
-	ret = regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK, S2MPG10_COMMON_INT_SRC);
+	switch (pdata->device_type) {
+	case S2MPG10:
+		ret = regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK, S2MPG10_COMMON_INT_SRC);
+		break;
+
+	case S2MPG11:
+		ret = regmap_write(regmap_common, S2MPG11_COMMON_INT_MASK, S2MPG11_COMMON_INT_SRC);
+		break;
+
+	default:
+		return dev_err_probe(dev, -EINVAL, "Unsupported device type %d\n",
+				     pdata->device_type);
+	}
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to mask common block interrupts\n");
 
@@ -374,10 +542,12 @@ static int sec_pmic_acpm_probe(struct platform_device *pdev)
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
@@ -392,13 +562,28 @@ static int sec_pmic_acpm_probe(struct platform_device *pdev)
 		devm_device_init_wakeup(dev);
 
 	/* Unmask PMIC interrupt from 'common' block, now that everything is in place. */
-	ret = regmap_clear_bits(regmap_common, S2MPG10_COMMON_INT_MASK,
-				S2MPG10_COMMON_INT_SRC_PMIC);
+	switch (pdata->device_type) {
+	case S2MPG10:
+		ret = regmap_clear_bits(regmap_common, S2MPG10_COMMON_INT_MASK,
+					S2MPG10_COMMON_INT_SRC_PMIC);
+		masq_irqs_handler = sec_pmic_acpm_mask_common_s2mpg10_irqs;
+		break;
+
+	case S2MPG11:
+		ret = regmap_clear_bits(regmap_common, S2MPG11_COMMON_INT_MASK,
+					S2MPG11_COMMON_INT_SRC_PMIC);
+		masq_irqs_handler = sec_pmic_acpm_mask_common_s2mpg11_irqs;
+		break;
+
+	default:
+		return dev_err_probe(dev, -EINVAL, "Unsupported device type %d\n",
+				     pdata->device_type);
+	}
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to unmask PMIC interrupt\n");
 
 	/* Mask all interrupts from 'common' block on shutdown */
-	ret = devm_add_action_or_reset(dev, sec_pmic_acpm_mask_common_irqs, regmap_common);
+	ret = devm_add_action_or_reset(dev, masq_irqs_handler, regmap_common);
 	if (ret)
 		return ret;
 
@@ -420,8 +605,18 @@ static const struct sec_pmic_acpm_platform_data s2mpg10_data = {
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
diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 8a1694c6ed8708397a51ebd4a49c22387d7e3495..497dcbb907c4e94db3be43c498f70996d72f13f6 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -43,6 +43,13 @@ static const struct mfd_cell s2mpg10_devs[] = {
 	MFD_CELL_OF("s2mpg10-gpio", NULL, NULL, 0, 0, "samsung,s2mpg10-gpio"),
 };
 
+static const struct mfd_cell s2mpg11_devs[] = {
+	MFD_CELL_NAME("s2mpg11-meter"),
+	MFD_CELL_BASIC("s2mpg11-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_BUCKS),
+	MFD_CELL_BASIC("s2mpg11-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_LDOS),
+	MFD_CELL_OF("s2mpg11-gpio", NULL, NULL, 0, 0, "samsung,s2mpg11-gpio"),
+};
+
 static const struct mfd_cell s2mps11_devs[] = {
 	MFD_CELL_NAME("s2mps11-regulator"),
 	MFD_CELL_NAME("s2mps14-rtc"),
@@ -86,8 +93,13 @@ static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
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
@@ -192,6 +204,10 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
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
index c5c80b1ba104e6c5a55b442d2f10a8554201a961..a04e46144baae6a195a84df56c53e399e3875e3d 100644
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
@@ -73,6 +74,58 @@ static const struct regmap_irq s2mpg10_irqs[] = {
 	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH7, 5, S2MPG10_IRQ_PWR_WARN_CH7_MASK),
 };
 
+static const struct regmap_irq s2mpg11_irqs[] = {
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
@@ -180,7 +233,7 @@ static const struct regmap_irq s5m8767_irqs[] = {
 	REGMAP_IRQ_REG(S5M8767_IRQ_WTSR, 2, S5M8767_IRQ_WTSR_MASK),
 };
 
-/* All S2MPG10 interrupt sources are read-only and don't require clearing */
+/* All S2MPG1x interrupt sources are read-only and don't require clearing */
 static const struct regmap_irq_chip s2mpg10_irq_chip = {
 	.name = "s2mpg10",
 	.irqs = s2mpg10_irqs,
@@ -190,6 +243,15 @@ static const struct regmap_irq_chip s2mpg10_irq_chip = {
 	.mask_base = S2MPG10_PMIC_INT1M,
 };
 
+static const struct regmap_irq_chip s2mpg11_irq_chip = {
+	.name = "s2mpg11",
+	.irqs = s2mpg11_irqs,
+	.num_irqs = ARRAY_SIZE(s2mpg11_irqs),
+	.num_regs = 6,
+	.status_base = S2MPG11_PMIC_INT1,
+	.mask_base = S2MPG11_PMIC_INT1M,
+};
+
 static const struct regmap_irq_chip s2mps11_irq_chip = {
 	.name = "s2mps11",
 	.irqs = s2mps11_irqs,
@@ -270,6 +332,9 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	case S2MPG10:
 		sec_irq_chip = &s2mpg10_irq_chip;
 		break;
+	case S2MPG11:
+		sec_irq_chip = &s2mpg11_irq_chip;
+		break;
 	case S2MPS11X:
 		sec_irq_chip = &s2mps11_irq_chip;
 		break;
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index d785e101fe795a5d8f9cccf4ccc4232437e89416..f5fba117bea61b3e3fb308759dc2748f6dd01dfb 100644
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
index b4805cbd949bd605004bd88cf361109d1cbbc3bf..08b1ab33bad48194491fef88d48d5d0027e06a7c 100644
--- a/include/linux/mfd/samsung/irq.h
+++ b/include/linux/mfd/samsung/irq.h
@@ -160,6 +160,105 @@ enum s2mpg10_irq {
 	S2MPG10_IRQ_NR,
 };
 
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
index 0000000000000000000000000000000000000000..e4de7665f19fdb05dc4fcb83752728013d7a79ff
--- /dev/null
+++ b/include/linux/mfd/samsung/s2mpg11.h
@@ -0,0 +1,420 @@
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
+	S2MPG11_BUCKBOOST,
+	S2MPG11_REGULATOR_MAX,
+};
+
+#endif /* __LINUX_MFD_S2MPG11_H */

-- 
2.49.0.1204.g71687c7c1d-goog


