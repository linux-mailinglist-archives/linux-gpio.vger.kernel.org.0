Return-Path: <linux-gpio+bounces-28322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BF7C490E9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0D2D44EAAD3
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41C633E346;
	Mon, 10 Nov 2025 19:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sg1KrK4k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B342D338F5B
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802957; cv=none; b=r+R+AxHHXBLDUuf4QWyHuhCGSdYjkK90EBPCp1jXk2DZH1yznC8BX+m1M+89kSqx+VWzgPElECJ5smp6y9PLE7HpoOT3hmh+7CqtslYONO3Mt6JNGuX2wOgJC/1g9USYkWz6ILBqN1Gtsy8XGWXLIEu8B6fRpJAS+rizO/le/oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802957; c=relaxed/simple;
	bh=7RYo6unsQ7+HDRMAHC++2Io+4GHM9R9bMxMsFt9mVJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FyTwyOUrShoz+uNCXaCO2l6NVPn1PBNiw51mggLXzK+l+zAbSb4Ykl8uV0hWjgo2nDEm52+EN9wk6d/5K/FPVcMenCLbm1X+yCVfAn/X0tDv5VcYEhkmmcHw2gC922GTX8qT2ioJ2xRludHBCybTNU11EKjY9AYjmfyYr4VU6nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sg1KrK4k; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so5549167a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802948; x=1763407748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMqvUnPbNTY1aPQpVaQ420JQMz+SVwI+7u+4k+WMgB0=;
        b=Sg1KrK4k5AzSC7EDbde/7tce/v6yjo3vvhFZ3uTXx98vchKGx6joby5f2Mr3840jht
         UlRRKvB8ztOXNf7Ct5hRpLPdhDiqrc+PIaUsB80XzZw1rNdut6pJv9ty/wehdJgNOsC1
         EIXfWB3qf8lKHYh9veWgvkm9Bru2OuGgPpP1rbwsnshqOzEvTWCdcJ83TyT/sgfM2tHN
         uRWqnfWBCgfAVwBHrhKlrdXmpsykf6p9Qze3YG6Qv5AwrM9tE7wcVhwp1niKChcKZt6k
         KAxeM1qWGEoNJ36hQwsmhxrD+O7YG7NmIxs0TVavlvhp5pYgruMGfA5A63LwJVqO7xvb
         8W9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802948; x=1763407748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PMqvUnPbNTY1aPQpVaQ420JQMz+SVwI+7u+4k+WMgB0=;
        b=CCklY1RfzrWPEgN90yXNT0nMbkkJCFfjJ8UlTN/oTVhZv9XsiUNg1ZPJlKiCAUQaFS
         7QreU/pqGYCy/WoI4wt6VBGpECyT/1GQVYL4H4B/NKAXvxBTkEU/oe7k3MHYn4ZxuX4n
         XOwyvsNGDSSDWxHRpFt+c49dOdUCkngozw7TCBdWgZgRQJYWXFcWzfl9YsNOkmp94frO
         NhF/IH4wTqu5bB/mAUZD/bgwkIpwVHPxmnuqeyGZ7+p+zegiwOBCctZ7fBBH+qXkWu6t
         pHL1inYFEwquNaQcGNwNp1fi+2tl7ovM7g7W5vq0Cn8gg1gVFozkr7lOtnYPY9KI2isb
         Rhvg==
X-Forwarded-Encrypted: i=1; AJvYcCXbdTw2yjvNA/dIc7dm2tjzBiEMDwSZL6tn7vVhXBosPCVThrNtiZvl9aXQn2+8qLmQ7yk7YXPskSb9@vger.kernel.org
X-Gm-Message-State: AOJu0YyLxiggYbH1/Iz6x7Jn4CuiaLhFONf8CzVbor9EGQzcPfPb9osE
	R3M1rMDBGmhXRSOk+3XLRpxbzRojWBatFRvgdRp/6cpc7yzD0o5XfRS83e8awZiw4u0=
X-Gm-Gg: ASbGncvwsmTS/CLWIYyarKTHF2Maeu+5Y7Wpk8NGjos/j9S51d8t2V75F1GCsA8uzIP
	Lu27BfHiW+gHKtopbZPv9LGRht9mwTbbpmg8sAUAtLj7hh1GBnCHzXHzK46LxRTxxOuOzmhCMi4
	z7ZFDLiAT2HLxuWFyBfLnxJ1Nr+0qf3cpPdkb4zO9rq0LVmXiDpOv7GKh2ReHZL/c/WaRRektJB
	5cdpfw1JE39yh5HND258M5LNwH3QmQTRavvklg3QacS0S1ZkYXaLAPkUa6zMSfTlW4Ocs7mJFsO
	FYWyNVKNWzKWTXd0W+G7EUbz7Hx1CSANqlkYyPHFm47e22phlItIfSY+sBy+nHVpGUSF/vxCq9q
	ZVc/NAQueMj7j98nSQFC8wVnj9mKtNpmHLDvhGh1B9ypAjIeiSk4Q1kwfgr0LYkGAJ4Psg4N2a6
	J7ueAiJMhe+b52eMOGcZ0z1SS+kTYIcf5oahgwjETZFqqjYVk0t4fGFPFLh1qe
X-Google-Smtp-Source: AGHT+IFU/QO6cNOhBhG6gSRhNTCAuBYe3Blks9fCv8bk9i+ogpnT9nr6QMDIU3ZBpaBc6sUS+M7qig==
X-Received: by 2002:a17:907:1c81:b0:b47:2be3:bc75 with SMTP id a640c23a62f3a-b72e05040a4mr889120966b.60.1762802947523;
        Mon, 10 Nov 2025 11:29:07 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:07 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:59 +0000
Subject: [PATCH v4 16/20] regulator: s2mps11: add S2MPG10 regulator
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-16-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
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
index 9f5919b89a3c286bf1cd6b3ef0e74bc993bff01a..2c324a2bbbd9000f025eb49231ea601ac7b5008e 100644
--- a/include/linux/mfd/samsung/s2mpg10.h
+++ b/include/linux/mfd/samsung/s2mpg10.h
@@ -290,6 +290,30 @@ enum s2mpg10_pmic_reg {
 	S2MPG10_PMIC_LDO_SENSE4,
 };
 
+/* Rail controlled externally, based on PCTRLSELx */
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
2.51.2.1041.gc1ab5b90ca-goog


