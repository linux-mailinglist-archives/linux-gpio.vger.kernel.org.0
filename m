Return-Path: <linux-gpio+bounces-27984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93363C2DDAB
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 20:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1837434BF2C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 19:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA2A327214;
	Mon,  3 Nov 2025 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GUhih2No"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34893233E3
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 19:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197300; cv=none; b=UNqHkupuEBhvsnR1VXB9Jzbz0fLUjONlyNY5wB6NDn5CBCs1s1KE3xdeV+8huwH1rabH1lBc+Fe36ozFDyJV1SYk54t06TpXkFzo4T1KHZ0hPsrKHiq52FHRP4loBjUIxZDO6Q+GAh/yPqD21oN5NQNZhngHpOksV9FvgBX2vyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197300; c=relaxed/simple;
	bh=vpW4RnBiOC6waELIU8sYXSsZ86D2GIFEu50+HEdda+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9gumo3Fmhj3FOaRkogkE1KpiJGvU4s+iAxH3IdvRZ23+LEMqY1xjJ9CtUIOmeiE7LApATOUpMKLSqbPg5e9qWVxjcfx9O4JFLyy/qMbigSjwsr3GedR5D7uDUT9XWPiU0Ftt0SBMwGTAvF/FNC+zIiRpThKgNsc2WVlDQL8ehE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GUhih2No; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b710601e659so173882566b.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 11:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197291; x=1762802091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NeZKnbfjUPFIjiWLwcMZwQ89QQDQ2j8HsArvr4NK1Hw=;
        b=GUhih2NoCYUXderfya0SfJnzrEheMGJwJsUQ+PjBGFmKKQ8vguEXTRrfYibx1jqbs7
         cxXzVILnBw0P7b6E0NohhCeeglynor/7BKEVV9aJOxZAuGtG76nSULvv8htKGa9gcxik
         F8xlSYvIMHeypcNFIVNuEMcaFH/xA8kiS1oYQ9UgE4Qht9jddIjQSjjC5vGcmxLLUd8L
         p3AbmMortCj1oTckWvUB9iue448ofYyTJ/K4gXyvUan0kbEPW/ORJfjs/Te4pLhnMLPk
         Hwe4J3FxmEzdsV05mVw66/hRUXhzAS1nokOTVHQs0hSx6J3TAfYvwSYSAYK2LEo4lpuh
         uexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197291; x=1762802091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeZKnbfjUPFIjiWLwcMZwQ89QQDQ2j8HsArvr4NK1Hw=;
        b=Rn31eBP4PHtxzM2HQ8i1Pal3x2ekKMgyaPTwMyzO9VcF24N51pTnhaD1new1ysvPJR
         WS4zoyWMtBoNC+R4Cns9XBIoV11Fi/iiXU0lmPXvE09I8kLBx9kxZencBDIINEaJwklT
         CwEhR/RONbZ9ypvVq45WZP9fZlhI1FOUHHvVaZGdM7KeVT7im48+5SVb3E9YrFMbfqAr
         PaktDQIY9DT6D+COTBx7aLkDYi591g3wzR7xZyuNhHTLprJ2+g5QkcMQWnwFjYb3mZ65
         zr7hQ2V3tDliY92iZoTtnTizKW6DH/bydYP5yPL1FHJz+SUBmRgndLSTuPTlDTsv2kpG
         6RFg==
X-Forwarded-Encrypted: i=1; AJvYcCVt3oA5XHc/7w3t6VzaPEt3Ccxt1f4fET/tl9hsFShSq2cN6hr0RCvsecIVHbOmfL3KqYpxixuCYYmU@vger.kernel.org
X-Gm-Message-State: AOJu0YwfRxukilIjOLi5pE6FmM02izYyuPm9+SwL2lhsR1CZonhgPI/e
	VFcTDLTf2cCr4TOQ0HRF+/agj7HJPiCZ9T3mErgOHlqygITlxTbOTPz6FdY6bkRdpkg=
X-Gm-Gg: ASbGncs3E3WDerq7pD9f8FdSi/YQL2zwCNegr3761UrUeRqxow9khTJEL18XrqL3fKA
	NGximRwp+Gn0/81Qva7Y3m/UWz2Hhn9RlSxLkD76ZfSIY5EBoj6T+yg9f9WZBj/iMH8FwBStjlf
	k2EtNachkd2sInFU4ULuUfTNta0VsYZo+OOyRQjUdqj438hAAm/kgWypDxS7xl6jdUU0zZxqWIb
	VxuRSiyQY6OnMkFlpqnHdDkHhGr0yFvRavauwLzFeQ7O2nnFfW0S6r8dmCv8bBiPyONw+Y07KYE
	0Ucfc5vsWCislqLkeaH+PxyltYN0u5YAb13HaPP59IdkxuwRsI73tSOIIDZY15aRGMIXmIDbuXv
	MgKxsiTqBPEgk40DOjcKQBwEZ/2chAn48f65OTjQlq9nJnktsp5Nm33HvC6NZN7W+2uJhKlBd+c
	4Di1qY48c0/pNBIjssittq4V5a/wKeximqYgiwwPSE4VpEnOeAcqLXYyaV38jF
X-Google-Smtp-Source: AGHT+IEVkdFxu5cLmmir8A1zABx4aa6TxZwHgJs5qbstlKxdEzu5uIfdXnMahNlE/s8l/mgjJvTmqA==
X-Received: by 2002:a17:907:25c2:b0:b49:a5e4:754a with SMTP id a640c23a62f3a-b707061f128mr1512004466b.43.1762197291242;
        Mon, 03 Nov 2025 11:14:51 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:50 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:55 +0000
Subject: [PATCH v3 16/20] regulator: s2mps11: add S2MPG10 regulator
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-16-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The S2MPG10 PMIC is a Power Management IC for mobile applications with
buck converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIO interfaces.

It has 10 buck and 31 LDO rails. Several of these can either be
controlled via software (register writes) or via external signals, in
particular by:
    * one out of several input pins connected to a main processor's:
        * GPIO pins
        * other pins that are e.g. firmware- or power-domain-controlled
          without explicit driver intervention
    * a combination of input pins and register writes.

Control via input pins allows PMIC rails to be controlled by firmware,
e.g. during standby/suspend, or as part of power domain handling where
otherwise that would not be possible. Additionally toggling a pin is
faster than register writes, and it also allows the PMIC to ensure that
any necessary timing requirements between rails are respected
automatically if multiple rails are to be enabled or disabled quasi
simultaneously.

This commit implements support for all these rails and control
combinations.

Additional data needs to be stored for each regulator, e.g. the input
pin for external control, or a rail-specific ramp-rate for when
enabling a buck-rail. Therefore, probe() is updated slightly to make
that possible.

Note1: For an externally controlled rail, the regulator_ops provide an
empty ::enable() and no ::disable() implementations, even though Linux
can not enable the rail and one might think ::enable could be NULL.
Without ops->enable(), the regulator core will assume enabling such a
rail failed, though, and in turn never add a reference to its parent
(supplier) rail. Once a different (Linux-controlled) sibling (consumer)
rail on that same parent rail gets disabled, the parent gets disabled
(cutting power to the externally controlled rail although it should
stay on), and the system will misbehave.

Note2: The rails are instantiated as separate driver instances for each
rail, because S2MPG10 is typically used with an S2MPG11 sub-PMIC where
some bucks of one typically supply at least some of the LDOs of the
other. Using separate instances avoids issues around circular
dependencies which occur otherwise.

Note3: While external control via input pins appears to exist on other
versions of this PMIC, there is more flexibility in this version, in
particular there is a selection of input pins to choose from for each
rail (which must therefore be configured accordingly if in use),
whereas other versions don't have this flexibility.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
- one instance per actual rail, not per rail type (LDO or buck)
- use REGULATOR_LINEAR_VRANGE macro
- sort s2mpg10 bucks before LDOs throughout (alphabetic ordering)
- LDO 1 and 7 also support setting a ramp rate
- add ::enable() to ops for signal-controlled rails and update commit
  message detailing why
- more details around signal controlled rails in commit message
- switch to 'enable-gpios' instead of samsung,ext-control-gpios for
  OS-controlled GPIOs (Krzysztof)

v2:
- move assignment of ::of_parse_cb in regulator_desc_s2mpg10_buck() to
  match order of struct definition
---
 drivers/regulator/s2mps11.c         | 599 +++++++++++++++++++++++++++++++++++-
 include/linux/mfd/samsung/s2mpg10.h |  24 ++
 2 files changed, 617 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index bb0a4f35ef47551f7171321fdde2c0202ce86ede..aff85138fa5da4cff83bdec5cdb3086a58afc7ce 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2012-2014 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
+#include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/err.h>
@@ -15,7 +16,9 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
+#include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -23,6 +26,11 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 
+enum {
+	S2MPG10_REGULATOR_OPS_STD,
+	S2MPG10_REGULATOR_OPS_EXTCONTROL,
+};
+
 /* The highest number of possible regulators for supported devices. */
 #define S2MPS_REGULATOR_MAX		S2MPS13_REGULATOR_MAX
 struct s2mps11_info {
@@ -42,6 +50,21 @@ struct s2mps11_info {
 	DECLARE_BITMAP(suspend_state, S2MPS_REGULATOR_MAX);
 };
 
+#define to_s2mpg10_regulator_desc(x) container_of((x), struct s2mpg10_regulator_desc, desc)
+
+struct s2mpg10_regulator_desc {
+	struct regulator_desc desc;
+
+	/* Ramp rate during enable, valid for bucks only. */
+	unsigned int enable_ramp_rate;
+
+	/* Registers for external control of rail. */
+	unsigned int pctrlsel_reg;
+	unsigned int pctrlsel_mask;
+	/* Populated from DT. */
+	unsigned int pctrlsel_val;
+};
+
 static int get_ramp_delay(int ramp_delay)
 {
 	unsigned char cnt = 0;
@@ -329,14 +352,14 @@ static int s2mps11_regulator_set_suspend_disable(struct regulator_dev *rdev)
 }
 
 static int s2mps11_of_parse_gpiod(struct device_node *np,
+				  const char *con_id,
 				  const struct regulator_desc *desc,
 				  struct regulator_config *config)
 {
 	struct gpio_desc *ena_gpiod;
 	int ret;
 
-	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np),
-					   "samsung,ext-control", 0,
+	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 					   "s2mps11-regulator");
@@ -385,9 +408,533 @@ static int s2mps11_of_parse_cb(struct device_node *np,
 	else
 		return 0;
 
-	return s2mps11_of_parse_gpiod(np, desc, config);
+	return s2mps11_of_parse_gpiod(np, "samsung,ext-control", desc, config);
+}
+
+static int s2mpg10_of_parse_cb(struct device_node *np,
+			       const struct regulator_desc *desc,
+			       struct regulator_config *config)
+{
+	const struct s2mps11_info *s2mps11 = config->driver_data;
+	struct s2mpg10_regulator_desc *s2mpg10_desc = to_s2mpg10_regulator_desc(desc);
+	static const u32 ext_control_s2mpg10[] = {
+		[S2MPG10_EXTCTRL_PWREN] = S2MPG10_PCTRLSEL_PWREN,
+		[S2MPG10_EXTCTRL_PWREN_MIF] = S2MPG10_PCTRLSEL_PWREN_MIF,
+		[S2MPG10_EXTCTRL_AP_ACTIVE_N] = S2MPG10_PCTRLSEL_AP_ACTIVE_N,
+		[S2MPG10_EXTCTRL_CPUCL1_EN] = S2MPG10_PCTRLSEL_CPUCL1_EN,
+		[S2MPG10_EXTCTRL_CPUCL1_EN2] = S2MPG10_PCTRLSEL_CPUCL1_EN2,
+		[S2MPG10_EXTCTRL_CPUCL2_EN] = S2MPG10_PCTRLSEL_CPUCL2_EN,
+		[S2MPG10_EXTCTRL_CPUCL2_EN2] = S2MPG10_PCTRLSEL_CPUCL2_EN2,
+		[S2MPG10_EXTCTRL_TPU_EN] = S2MPG10_PCTRLSEL_TPU_EN,
+		[S2MPG10_EXTCTRL_TPU_EN2] = S2MPG10_PCTRLSEL_TPU_EN2,
+		[S2MPG10_EXTCTRL_TCXO_ON] = S2MPG10_PCTRLSEL_TCXO_ON,
+		[S2MPG10_EXTCTRL_TCXO_ON2] = S2MPG10_PCTRLSEL_TCXO_ON2,
+		[S2MPG10_EXTCTRL_LDO20M_EN2] = S2MPG10_PCTRLSEL_LDO20M_EN2,
+		[S2MPG10_EXTCTRL_LDO20M_EN] = S2MPG10_PCTRLSEL_LDO20M_EN,
+	};
+	u32 ext_control;
+
+	if (s2mps11->dev_type != S2MPG10)
+		return 0;
+
+	if (of_property_read_u32(np, "samsung,ext-control", &ext_control))
+		return 0;
+
+	switch (s2mps11->dev_type) {
+	case S2MPG10:
+		switch (desc->id) {
+		case S2MPG10_BUCK1 ... S2MPG10_BUCK7:
+		case S2MPG10_BUCK10:
+		case S2MPG10_LDO3 ... S2MPG10_LDO19:
+			if (ext_control > S2MPG10_EXTCTRL_TCXO_ON2)
+				return -EINVAL;
+			break;
+
+		case S2MPG10_LDO20:
+			if (ext_control < S2MPG10_EXTCTRL_LDO20M_EN2 ||
+			    ext_control > S2MPG10_EXTCTRL_LDO20M_EN)
+				return -EINVAL;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+
+		if (ext_control > ARRAY_SIZE(ext_control_s2mpg10))
+			return -EINVAL;
+		ext_control = ext_control_s2mpg10[ext_control];
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * If the regulator should be configured for external control, then:
+	 * 1) the PCTRLSELx register needs to be set accordingly
+	 * 2) regulator_desc::enable_val needs to be:
+	 *    a) updated and
+	 *    b) written to the hardware
+	 * 3) we switch to the ::ops that provide an empty ::enable() and no
+	 *    ::disable() implementations
+	 *
+	 * Points 1) and 2b) will be handled in _probe(), after
+	 * devm_regulator_register() returns, so that we can properly act on
+	 * failures, since the regulator core ignores most return values from
+	 * this parse callback.
+	 */
+	s2mpg10_desc->pctrlsel_val = ext_control;
+	s2mpg10_desc->pctrlsel_val <<= (ffs(s2mpg10_desc->pctrlsel_mask) - 1);
+
+	s2mpg10_desc->desc.enable_val = S2MPG10_PMIC_CTRL_ENABLE_EXT;
+	s2mpg10_desc->desc.enable_val <<= (ffs(desc->enable_mask) - 1);
+
+	++s2mpg10_desc->desc.ops;
+
+	return s2mps11_of_parse_gpiod(np, "enable", desc, config);
+}
+
+static int s2mpg10_enable_ext_control(struct s2mps11_info *s2mps11,
+				      struct regulator_dev *rdev)
+{
+	const struct s2mpg10_regulator_desc *s2mpg10_desc;
+	int ret;
+
+	switch (s2mps11->dev_type) {
+	case S2MPG10:
+		s2mpg10_desc = to_s2mpg10_regulator_desc(rdev->desc);
+		break;
+
+	default:
+		return 0;
+	}
+
+	ret = regmap_update_bits(rdev_get_regmap(rdev),
+				 s2mpg10_desc->pctrlsel_reg,
+				 s2mpg10_desc->pctrlsel_mask,
+				 s2mpg10_desc->pctrlsel_val);
+	if (ret)
+		return dev_err_probe(rdev_get_dev(rdev), ret,
+				     "failed to configure pctrlsel for %s\n",
+				     rdev->desc->name);
+
+	/*
+	 * When using external control, the enable bit of the regulator still
+	 * needs to be set. The actual state will still be determined by the
+	 * external signal.
+	 */
+	ret = regulator_enable_regmap(rdev);
+	if (ret)
+		return dev_err_probe(rdev_get_dev(rdev), ret,
+				     "failed to enable regulator %s\n",
+				     rdev->desc->name);
+
+	return 0;
+}
+
+static int s2mpg10_regulator_enable_nop(struct regulator_dev *rdev)
+{
+	/*
+	 * We need to provide this, otherwise the regulator core's enable on
+	 * this regulator will return a failure and subsequently disable our
+	 * parent regulator.
+	 */
+	return 0;
+}
+
+static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
+{
+	const struct s2mpg10_regulator_desc * const s2mpg10_desc =
+		to_s2mpg10_regulator_desc(rdev->desc);
+	const struct regulator_ops * const ops = rdev->desc->ops;
+	int vsel, curr_uV;
+
+	vsel = ops->get_voltage_sel(rdev);
+	if (vsel < 0)
+		return vsel;
+
+	curr_uV = ops->list_voltage(rdev, vsel);
+	if (curr_uV < 0)
+		return curr_uV;
+
+	return (rdev->desc->enable_time
+		+ DIV_ROUND_UP(curr_uV, s2mpg10_desc->enable_ramp_rate));
 }
 
+static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV)
+{
+	unsigned int ramp_reg, ramp_sel, ramp_rate;
+	int ret;
+
+	if (old_uV == new_uV)
+		return 0;
+
+	ramp_reg = rdev->desc->ramp_reg;
+	if (old_uV > new_uV)
+		/* The downwards ramp is at a different offset. */
+		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
+
+	ret = regmap_read(rdev->regmap, ramp_reg, &ramp_sel);
+	if (ret)
+		return ret;
+
+	ramp_sel &= rdev->desc->ramp_mask;
+	ramp_sel >>= ffs(rdev->desc->ramp_mask) - 1;
+	if (ramp_sel >= rdev->desc->n_ramp_values ||
+	    !rdev->desc->ramp_delay_table)
+		return -EINVAL;
+
+	ramp_rate = rdev->desc->ramp_delay_table[ramp_sel];
+
+	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_rate);
+}
+
+/*
+ * We assign both, ::set_voltage_time() and ::set_voltage_time_sel(), because
+ * only if the latter is != NULL, the regulator core will call neither during
+ * DVS if the regulator is disabled. If the latter is NULL, the core always
+ * calls the ::set_voltage_time() callback, which would give incorrect results
+ * if the regulator is off.
+ * At the same time, we do need ::set_voltage_time() due to differing upwards
+ * and downwards ramps and we can not make that code dependent on the regulator
+ * enable state, as that would break regulator_set_voltage_time() which
+ * expects a correct result no matter the enable state.
+ */
+static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
+	[S2MPG10_REGULATOR_OPS_STD] = {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.is_enabled		= regulator_is_enabled_regmap,
+		.enable			= regulator_enable_regmap,
+		.disable		= regulator_disable_regmap,
+		.enable_time		= s2mpg10_regulator_buck_enable_time,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time	= s2mpg10_regulator_buck_set_voltage_time,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	},
+	[S2MPG10_REGULATOR_OPS_EXTCONTROL] = {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.enable			= s2mpg10_regulator_enable_nop,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time	= s2mpg10_regulator_buck_set_voltage_time,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	}
+};
+
+#define s2mpg10_buck_to_ramp_mask(n) (GENMASK(1, 0) << (((n) % 4) * 2))
+
+/*
+ * The ramp_delay during enable is fixed (12.5mV/μs), while the ramp during
+ * DVS can be adjusted. Linux can adjust the ramp delay via DT, in which case
+ * the regulator core will modify the regulator's constraints and call our
+ * .set_ramp_delay() which updates the DVS ramp in ramp_reg.
+ * For enable, our .enable_time() unconditionally uses enable_ramp_rate
+ * (12.5mV/μs) while our ::set_voltage_time() takes the value in ramp_reg
+ * into account.
+ */
+#define regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg) {		\
+	.name		= "buck"#_num "m",				\
+	.supply_name	= "vinb"#_num "m",				\
+	.of_match	= of_match_ptr("buck"#_num "m"),		\
+	.regulators_node = of_match_ptr("regulators"),			\
+	.of_parse_cb	= s2mpg10_of_parse_cb,				\
+	.id		= S2MPG10_BUCK##_num,				\
+	.ops		= &s2mpg10_reg_buck_ops[0],			\
+	.type		= REGULATOR_VOLTAGE,				\
+	.owner		= THIS_MODULE,					\
+	.linear_ranges	= _vrange,					\
+	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
+	.n_voltages	= _vrange##_count,				\
+	.vsel_reg	= S2MPG10_PMIC_B##_num##M_OUT1,			\
+	.vsel_mask	= 0xff,						\
+	.enable_reg	= S2MPG10_PMIC_B##_num##M_CTRL,			\
+	.enable_mask	= GENMASK(7, 6),				\
+	.ramp_reg	= S2MPG10_PMIC_##_r_reg,			\
+	.ramp_mask	= s2mpg10_buck_to_ramp_mask(S2MPG10_BUCK##_num	\
+						    - S2MPG10_BUCK1),	\
+	.ramp_delay_table = s2mpg10_buck_ramp_table,			\
+	.n_ramp_values	= ARRAY_SIZE(s2mpg10_buck_ramp_table),		\
+	.enable_time	= 30, /* + V/enable_ramp_rate */		\
+}
+
+#define s2mpg10_regulator_desc_buck_cm(_num, _vrange, _r_reg)		\
+	.desc = regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg),	\
+	.enable_ramp_rate = 12500
+
+#define s2mpg10_regulator_desc_buck_gpio(_num, _vrange, _r_reg,		\
+					 _pc_reg, _pc_mask)		\
+	[S2MPG10_BUCK##_num] = {					\
+		s2mpg10_regulator_desc_buck_cm(_num, _vrange, _r_reg),	\
+		.pctrlsel_reg = S2MPG10_PMIC_##_pc_reg,			\
+		.pctrlsel_mask = _pc_mask,				\
+	}
+
+#define s2mpg10_regulator_desc_buck(_num, _vrange, _r_reg)		\
+	[S2MPG10_BUCK##_num] = {					\
+		s2mpg10_regulator_desc_buck_cm(_num, _vrange, _r_reg),	\
+	}
+
+/* ops for S2MPG1x LDO regulators without ramp control */
+static const struct regulator_ops s2mpg10_reg_ldo_ops[] = {
+	[S2MPG10_REGULATOR_OPS_STD] = {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.is_enabled		= regulator_is_enabled_regmap,
+		.enable			= regulator_enable_regmap,
+		.disable		= regulator_disable_regmap,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+	},
+	[S2MPG10_REGULATOR_OPS_EXTCONTROL] = {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.enable			= s2mpg10_regulator_enable_nop,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+	}
+};
+
+/* ops for S2MPG1x LDO regulators that have ramp control */
+static const struct regulator_ops s2mpg10_reg_ldo_ramp_ops[] = {
+	[S2MPG10_REGULATOR_OPS_STD] = {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.is_enabled		= regulator_is_enabled_regmap,
+		.enable			= regulator_enable_regmap,
+		.disable		= regulator_disable_regmap,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	},
+	[S2MPG10_REGULATOR_OPS_EXTCONTROL] = {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.enable			= s2mpg10_regulator_enable_nop,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	}
+};
+
+#define regulator_desc_s2mpg10_ldo_cmn(_num, _supply, _ops, _vrange,	\
+		_vsel_reg_sfx, _vsel_mask, _en_reg, _en_mask,		\
+		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz) {	\
+	.name		= "ldo"#_num "m",				\
+	.supply_name	= _supply,					\
+	.of_match	= of_match_ptr("ldo"#_num "m"),			\
+	.regulators_node = of_match_ptr("regulators"),			\
+	.of_parse_cb	= s2mpg10_of_parse_cb,				\
+	.id		= S2MPG10_LDO##_num,				\
+	.ops		= &(_ops)[0],					\
+	.type		= REGULATOR_VOLTAGE,				\
+	.owner		= THIS_MODULE,					\
+	.linear_ranges	= _vrange,					\
+	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
+	.n_voltages	= _vrange##_count,				\
+	.vsel_reg	= S2MPG10_PMIC_L##_num##M_##_vsel_reg_sfx,	\
+	.vsel_mask	= _vsel_mask,					\
+	.enable_reg	= S2MPG10_PMIC_##_en_reg,			\
+	.enable_mask	= _en_mask,					\
+	.ramp_delay	= _ramp_delay,					\
+	.ramp_reg	= _r_reg,					\
+	.ramp_mask	= _r_mask,					\
+	.ramp_delay_table = _r_table,					\
+	.n_ramp_values	= _r_table_sz,					\
+	.enable_time	= 130, /* startup 20+-10 + ramp 30..100μs */	\
+}
+
+#define s2mpg10_regulator_desc_ldo_cmn(_num, _supply, _ops, _vrange,	\
+		_vsel_reg_sfx, _vsel_mask, _en_reg, _en_mask,		\
+		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz,	\
+		_pc_reg, _pc_mask)					\
+	[S2MPG10_LDO##_num] = {						\
+		.desc = regulator_desc_s2mpg10_ldo_cmn(_num, _supply,	\
+				_ops,					\
+				_vrange, _vsel_reg_sfx, _vsel_mask,	\
+				_en_reg, _en_mask,			\
+				_ramp_delay, _r_reg, _r_mask, _r_table,	\
+				_r_table_sz),				\
+		.pctrlsel_reg = _pc_reg,				\
+		.pctrlsel_mask = _pc_mask,				\
+	}
+
+/* standard LDO via LxM_CTRL */
+#define s2mpg10_regulator_desc_ldo(_num, _supply, _vrange)		\
+	s2mpg10_regulator_desc_ldo_cmn(_num, _supply,			\
+		s2mpg10_reg_ldo_ops, _vrange, CTRL, GENMASK(5, 0),	\
+		L##_num##M_CTRL, BIT(7),				\
+		0, 0, 0, NULL, 0,					\
+		0, 0)
+
+/* standard LDO but possibly GPIO controlled */
+#define s2mpg10_regulator_desc_ldo_gpio(_num, _supply, _vrange,		\
+					_pc_reg, _pc_mask)		\
+	s2mpg10_regulator_desc_ldo_cmn(_num, _supply,			\
+		s2mpg10_reg_ldo_ops, _vrange, CTRL, GENMASK(5, 0),	\
+		L##_num##M_CTRL, GENMASK(7, 6),				\
+		0, 0, 0, NULL, 0,					\
+		S2MPG10_PMIC_##_pc_reg, _pc_mask)
+
+/* LDO with ramp support and possibly GPIO controlled */
+#define s2mpg10_regulator_desc_ldo_ramp(_num, _supply, _vrange,		\
+		_en_mask, _r_reg, _pc_reg, _pc_mask)			\
+	s2mpg10_regulator_desc_ldo_cmn(_num, _supply,			\
+		s2mpg10_reg_ldo_ramp_ops, _vrange, CTRL1, GENMASK(6, 0), \
+		LDO_CTRL2, _en_mask,					\
+		6250, S2MPG10_PMIC_##_r_reg, GENMASK(1, 0),		\
+		s2mpg10_ldo_ramp_table,					\
+		ARRAY_SIZE(s2mpg10_ldo_ramp_table),			\
+		S2MPG10_PMIC_##_pc_reg, _pc_mask)
+
+#define S2MPG10_VOLTAGE_RANGE(_prefix, _idx, _offs_uV, _min_uV,		\
+			      _max_uV, _step_uV)			\
+static const struct linear_range _prefix##_vranges##_idx[] = {		\
+	REGULATOR_LINEAR_VRANGE(_offs_uV, _min_uV, _max_uV, _step_uV)	\
+};									\
+static const unsigned int _prefix##_vranges##_idx##_count =		\
+	((((_max_uV) - (_offs_uV)) / (_step_uV)) + 1)
+
+/* voltage range for s2mpg10 BUCK 1, 2, 3, 4, 5, 7, 8, 9, 10 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_buck, 1, 200000, 450000, 1300000, STEP_6_25_MV);
+
+/* voltage range for s2mpg10 BUCK 6 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_buck, 6, 200000, 450000, 1350000, STEP_6_25_MV);
+
+static const unsigned int s2mpg10_buck_ramp_table[] = {
+	6250, 12500, 25000
+};
+
+/* voltage range for s2mpg10 LDO 1, 11, 12 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 1, 300000, 700000, 1300000, STEP_12_5_MV);
+
+/* voltage range for s2mpg10 LDO 2, 4, 9, 14, 18, 19, 20, 23, 25, 29, 30, 31 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 2, 700000, 1600000, 1950000, STEP_25_MV);
+
+/* voltage range for s2mpg10 LDO 3, 5, 6, 8, 16, 17, 24, 28 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 3, 725000, 725000, 1300000, STEP_12_5_MV);
+
+/* voltage range for s2mpg10 LDO 7 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 7, 300000, 450000, 1300000, STEP_12_5_MV);
+
+/* voltage range for s2mpg10 LDO 13, 15 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 13, 300000, 450000, 950000, STEP_12_5_MV);
+
+/* voltage range for s2mpg10 LDO 10 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 10, 1800000, 1800000, 3350000, STEP_25_MV);
+
+/* voltage range for s2mpg10 LDO 21, 22, 26, 27 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 21, 1800000, 2500000, 3300000, STEP_25_MV);
+
+/* possible ramp values for s2mpg10 LDO 1, 7, 11, 12, 13, 15 */
+static const unsigned int s2mpg10_ldo_ramp_table[] = {
+	6250, 12500
+};
+
+static const struct s2mpg10_regulator_desc s2mpg10_regulators[] = {
+	s2mpg10_regulator_desc_buck_gpio(1, s2mpg10_buck_vranges1, DVS_RAMP1,
+					 PCTRLSEL1, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_buck_gpio(2, s2mpg10_buck_vranges1, DVS_RAMP1,
+					 PCTRLSEL1, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_buck_gpio(3, s2mpg10_buck_vranges1, DVS_RAMP1,
+					 PCTRLSEL2, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_buck_gpio(4, s2mpg10_buck_vranges1, DVS_RAMP1,
+					 PCTRLSEL2, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_buck_gpio(5, s2mpg10_buck_vranges1, DVS_RAMP2,
+					 PCTRLSEL3, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_buck_gpio(6, s2mpg10_buck_vranges6, DVS_RAMP2,
+					 PCTRLSEL3, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_buck_gpio(7, s2mpg10_buck_vranges1, DVS_RAMP2,
+					 PCTRLSEL4, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_buck(8, s2mpg10_buck_vranges1, DVS_RAMP2),
+	s2mpg10_regulator_desc_buck(9, s2mpg10_buck_vranges1, DVS_RAMP3),
+	s2mpg10_regulator_desc_buck_gpio(10, s2mpg10_buck_vranges1, DVS_RAMP3,
+					 PCTRLSEL4, GENMASK(7, 4)),
+	/*
+	 * Standard LDO via LxM_CTRL but non-standard (greater) V-range and with
+	 * ramp support.
+	 */
+	s2mpg10_regulator_desc_ldo_cmn(1, "vinl3m", s2mpg10_reg_ldo_ramp_ops,
+				       s2mpg10_ldo_vranges1,
+				       CTRL, GENMASK(6, 0),
+				       L1M_CTRL, BIT(7),
+				       6250, S2MPG10_PMIC_DVS_RAMP6,
+				       GENMASK(5, 4), s2mpg10_ldo_ramp_table,
+				       ARRAY_SIZE(s2mpg10_ldo_ramp_table),
+				       0, 0),
+	s2mpg10_regulator_desc_ldo(2, "vinl9m", s2mpg10_ldo_vranges2),
+	s2mpg10_regulator_desc_ldo_gpio(3, "vinl4m", s2mpg10_ldo_vranges3,
+					PCTRLSEL5, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(4, "vinl9m", s2mpg10_ldo_vranges2,
+					PCTRLSEL5, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_gpio(5, "vinl3m", s2mpg10_ldo_vranges3,
+					PCTRLSEL6, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(6, "vinl7m", s2mpg10_ldo_vranges3,
+					PCTRLSEL6, GENMASK(7, 4)),
+	/*
+	 * Ramp support, possibly GPIO controlled, non-standard (greater) V-
+	 * range and enable reg & mask.
+	 */
+	s2mpg10_regulator_desc_ldo_cmn(7, "vinl3m", s2mpg10_reg_ldo_ramp_ops,
+				       s2mpg10_ldo_vranges7,
+				       CTRL, GENMASK(6, 0),
+				       LDO_CTRL1, GENMASK(4, 3),
+				       6250, S2MPG10_PMIC_DVS_RAMP6,
+				       GENMASK(7, 6), s2mpg10_ldo_ramp_table,
+				       ARRAY_SIZE(s2mpg10_ldo_ramp_table),
+				       S2MPG10_PMIC_PCTRLSEL7, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(8, "vinl4m", s2mpg10_ldo_vranges3,
+					PCTRLSEL7, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_gpio(9, "vinl10m", s2mpg10_ldo_vranges2,
+					PCTRLSEL8, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(10, "vinl15m", s2mpg10_ldo_vranges10,
+					PCTRLSEL8, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_ramp(11, "vinl7m", s2mpg10_ldo_vranges1,
+					GENMASK(1, 0), DVS_SYNC_CTRL3,
+					PCTRLSEL9, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_ramp(12, "vinl8m", s2mpg10_ldo_vranges1,
+					GENMASK(3, 2), DVS_SYNC_CTRL4,
+					PCTRLSEL9, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_ramp(13, "vinl1m", s2mpg10_ldo_vranges13,
+					GENMASK(5, 4), DVS_SYNC_CTRL5,
+					PCTRLSEL10, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(14, "vinl10m", s2mpg10_ldo_vranges2,
+					PCTRLSEL10, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_ramp(15, "vinl2m", s2mpg10_ldo_vranges13,
+					GENMASK(7, 6), DVS_SYNC_CTRL6,
+					PCTRLSEL11, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(16, "vinl5m", s2mpg10_ldo_vranges3,
+					PCTRLSEL11, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_gpio(17, "vinl6m", s2mpg10_ldo_vranges3,
+					PCTRLSEL12, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(18, "vinl10m", s2mpg10_ldo_vranges2,
+					PCTRLSEL12, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_gpio(19, "vinl10m", s2mpg10_ldo_vranges2,
+					PCTRLSEL13, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(20, "vinl10m", s2mpg10_ldo_vranges2,
+					PCTRLSEL13, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo(21, "vinl14m", s2mpg10_ldo_vranges21),
+	s2mpg10_regulator_desc_ldo(22, "vinl15m", s2mpg10_ldo_vranges21),
+	s2mpg10_regulator_desc_ldo(23, "vinl11m", s2mpg10_ldo_vranges2),
+	s2mpg10_regulator_desc_ldo(24, "vinl7m", s2mpg10_ldo_vranges3),
+	s2mpg10_regulator_desc_ldo(25, "vinl10m", s2mpg10_ldo_vranges2),
+	s2mpg10_regulator_desc_ldo(26, "vinl15m", s2mpg10_ldo_vranges21),
+	s2mpg10_regulator_desc_ldo(27, "vinl15m", s2mpg10_ldo_vranges21),
+	s2mpg10_regulator_desc_ldo(28, "vinl7m", s2mpg10_ldo_vranges3),
+	s2mpg10_regulator_desc_ldo(29, "vinl12m", s2mpg10_ldo_vranges2),
+	s2mpg10_regulator_desc_ldo(30, "vinl13m", s2mpg10_ldo_vranges2),
+	s2mpg10_regulator_desc_ldo(31, "vinl11m", s2mpg10_ldo_vranges2)
+};
+
 static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
@@ -1271,6 +1818,18 @@ static int s2mps11_handle_ext_control(struct s2mps11_info *s2mps11,
 		ret = s2mps14_pmic_enable_ext_control(s2mps11, rdev);
 		break;
 
+	case S2MPG10:
+		/*
+		 * If desc.enable_val is != 0, then external control was
+		 * requested. We can not test s2mpg10_desc::ext_control,
+		 * because 0 is a valid value.
+		 */
+		if (!rdev->desc->enable_val)
+			return 0;
+
+		ret = s2mpg10_enable_ext_control(s2mps11, rdev);
+		break;
+
 	default:
 		return 0;
 	}
@@ -1281,11 +1840,13 @@ static int s2mps11_handle_ext_control(struct s2mps11_info *s2mps11,
 static int s2mps11_pmic_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
+	const struct mfd_cell *cell = mfd_get_cell(pdev);
 	struct regulator_config config = { };
 	struct s2mps11_info *s2mps11;
 	unsigned int rdev_num;
 	int i, ret;
 	const struct regulator_desc *regulators;
+	const struct s2mpg10_regulator_desc *s2mpg1x_regulators = NULL;
 
 	s2mps11 = devm_kzalloc(&pdev->dev, sizeof(struct s2mps11_info),
 				GFP_KERNEL);
@@ -1294,6 +1855,16 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 
 	s2mps11->dev_type = platform_get_device_id(pdev)->driver_data;
 	switch (s2mps11->dev_type) {
+	case S2MPG10:
+		if (cell->id >= ARRAY_SIZE(s2mpg10_regulators))
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "Unsupported regulator ID %d\n",
+					     cell->id);
+
+		rdev_num = 1;
+		s2mpg1x_regulators = &s2mpg10_regulators[cell->id];
+		BUILD_BUG_ON(ARRAY_SIZE(s2mpg10_regulators) > S2MPS_REGULATOR_MAX);
+		break;
 	case S2MPS11X:
 		rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
@@ -1338,15 +1909,30 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	config.regmap = iodev->regmap_pmic;
 	config.driver_data = s2mps11;
 	for (i = 0; i < rdev_num; i++) {
+		const struct regulator_desc *rdesc;
 		struct regulator_dev *regulator;
 
+		if (s2mpg1x_regulators) {
+			struct s2mpg10_regulator_desc *s2mpg10_desc;
+
+			s2mpg10_desc = devm_kmemdup(&pdev->dev,
+						    &s2mpg1x_regulators[i],
+						    sizeof(*s2mpg10_desc),
+						    GFP_KERNEL);
+			if (!s2mpg10_desc)
+				return -ENOMEM;
+
+			rdesc = &s2mpg10_desc->desc;
+		} else {
+			rdesc = &regulators[i];
+		}
+
 		regulator = devm_regulator_register(&pdev->dev,
-						&regulators[i], &config);
+						    rdesc, &config);
 		if (IS_ERR(regulator))
 			return dev_err_probe(&pdev->dev, PTR_ERR(regulator),
 					     "regulator init failed for %d/%s\n",
-					     regulators[i].id,
-					     regulators[i].name);
+					     rdesc->id, rdesc->name);
 
 		ret = s2mps11_handle_ext_control(s2mps11, regulator);
 		if (ret < 0)
@@ -1357,6 +1943,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_pmic_id[] = {
+	{ "s2mpg10-regulator", S2MPG10},
 	{ "s2mps11-regulator", S2MPS11X},
 	{ "s2mps13-regulator", S2MPS13X},
 	{ "s2mps14-regulator", S2MPS14X},
diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/samsung/s2mpg10.h
index 9f5919b89a3c286bf1cd6b3ef0e74bc993bff01a..995b99b2d583158f546b61d60a3b7011004650fa 100644
--- a/include/linux/mfd/samsung/s2mpg10.h
+++ b/include/linux/mfd/samsung/s2mpg10.h
@@ -290,6 +290,30 @@ enum s2mpg10_pmic_reg {
 	S2MPG10_PMIC_LDO_SENSE4,
 };
 
+/* rail controlled externally, based on PCTRLSELx */
+#define S2MPG10_PMIC_CTRL_ENABLE_EXT BIT(0)
+
+/* For S2MPG10_PMIC_PCTRLSELx */
+#define S2MPG10_PCTRLSEL_PWREN           0x1 /* PWREN pin */
+#define S2MPG10_PCTRLSEL_PWREN_TRG       0x2 /* PWREN_TRG bit in MIMICKING_CTRL */
+#define S2MPG10_PCTRLSEL_PWREN_MIF       0x3 /* PWREN_MIF pin */
+#define S2MPG10_PCTRLSEL_PWREN_MIF_TRG   0x4 /* PWREN_MIF_TRG bit in MIMICKING_CTRL */
+#define S2MPG10_PCTRLSEL_AP_ACTIVE_N     0x5 /* ~AP_ACTIVE_N pin */
+#define S2MPG10_PCTRLSEL_AP_ACTIVE_N_TRG 0x6 /* ~AP_ACTIVE_N_TRG bit in MIMICKING_CTRL */
+#define S2MPG10_PCTRLSEL_CPUCL1_EN       0x7 /* CPUCL1_EN pin */
+#define S2MPG10_PCTRLSEL_CPUCL1_EN2      0x8 /* CPUCL1_EN & PWREN pins */
+#define S2MPG10_PCTRLSEL_CPUCL2_EN       0x9 /* CPUCL2_EN pin */
+#define S2MPG10_PCTRLSEL_CPUCL2_EN2      0xa /* CPUCL2_E2 & PWREN pins */
+#define S2MPG10_PCTRLSEL_TPU_EN          0xb /* TPU_EN pin */
+#define S2MPG10_PCTRLSEL_TPU_EN2         0xc /* TPU_EN & ~AP_ACTIVE_N pins */
+#define S2MPG10_PCTRLSEL_TCXO_ON         0xd /* TCXO_ON pin */
+#define S2MPG10_PCTRLSEL_TCXO_ON2        0xe /* TCXO_ON & ~AP_ACTIVE_N pins */
+
+/* For S2MPG10_PMIC_PCTRLSELx of LDO20M */
+#define S2MPG10_PCTRLSEL_LDO20M_EN2      0x1 /* VLDO20M_EN & LDO20M_SFR */
+#define S2MPG10_PCTRLSEL_LDO20M_EN       0x2 /* VLDO20M_EN pin */
+#define S2MPG10_PCTRLSEL_LDO20M_SFR      0x3 /* LDO20M_SFR bit in LDO_CTRL1 register */
+
 /* Meter registers (type 0xa00) */
 enum s2mpg10_meter_reg {
 	S2MPG10_METER_CTRL1,

-- 
2.51.2.997.g839fc31de9-goog


