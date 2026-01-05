Return-Path: <linux-gpio+bounces-30132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF886CF29F7
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D318D309709C
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5CF32E744;
	Mon,  5 Jan 2026 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qxMie2pP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2721B32D0E1
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603720; cv=none; b=cdFbU+XiOwDv7k06qVEahhsN/CSSZi8vJP6+CSaY00TYTIXjoNkyqJTvBt6BW1bUHSNyjU4ijtWyWdMqwVwlMH1Ru1sOKgIvn4mWm3AWWiTzVbS4006CXbogM3Hr2iiRTpDBXVlDlYj4MWd0cWMoa463X0ej5JFVsBDrDtO56EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603720; c=relaxed/simple;
	bh=1menO0fBSkUW0MtTCpqvtd42Vh4P4s4iIYyRbqhJ/ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P74ECxT3jBbVhlhLici+FbJmOhvyfO5JqDVpURIffsjSJjBrQRiHHn4USmaxba2f5ilB2Z3n7vQ1I4+i/VmKB9BJTaNmkvDtPv3WFJuYxuVzYd5bxPmVItRKfzaq/6j04cS9wunGrYXxNWj/4t6JcqFiQfapUgyyJSI+4kNTSVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qxMie2pP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so3391351466b.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603710; x=1768208510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dC9VDRJnOwlCcRDhQPQQu53R7hQJLYaY27+igTcrXvs=;
        b=qxMie2pPpryCTJXoG5djMamLy1WFIh1ie0KDLG7p00D2vp6dzbIbfdqdocRwZCXWgR
         BDK2Aa1je/4X3hse3uTWHXBmcumtb6PAeJSYqbajYaqZedYmOzDBSuBBGo1YaSaeicue
         E5rYWz3B7Vdas4eosSUzzkggeECVI59T/KD2rLldibqk/F4ZHhCeCbw7YFEcWm6s4Ino
         8VgakqK2DFcoUZ4uBmTEuVtoePXZ4gIpV0hLvQIaFFdVE3DtUkHkZ5gxxge+PjsOyWLr
         t06vgDwKq6rbTVmEWwVqrhYWOT/IxpnxSdUbaL/HVrpH15JNJ14kYQRnuz4tiWKg5NeC
         1ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603710; x=1768208510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dC9VDRJnOwlCcRDhQPQQu53R7hQJLYaY27+igTcrXvs=;
        b=QLyosDcpSBERojjhidDlH0f+WJaOj24Hflzb5OAiKRTMEZXxunpRU1Y+0eiK3nEPSs
         mVoqc3xFOU50U4nmiLiwLfxdsXrgWuLmf9QtTpT3+B9xmQZRFXxL5sVXcMZcl9NSl9cx
         iH1tZ0DRnnqyEMnK5D7QnLknDSmwzxeWqP0IUoBJZWeRSp1wsPADg09qVlFNlCR8Pfgj
         cVuD0t8bBp+XOVluyhnA2lUQWzTcvqlu0kzX3W0KvpNGLemCky8PTJYnRpSL7xdhOYFo
         313rN9xZTE9Xp35iOZRRgSXLvz+2HGkKJdlZbqrOO3jHhmrYLqxYKNKW2P3WdQx20VOD
         gzoA==
X-Forwarded-Encrypted: i=1; AJvYcCUyq3hfjAokmB9MxqIBqJE5lxB8Rz/fUz9wef+E0192+I2NJV09htqwYLXr9VJylL38+wEbsK+z8vep@vger.kernel.org
X-Gm-Message-State: AOJu0YxsBYmmwKvcqeLsd/2Lp3Y1fo1Mqo0qikAhTvnpVX62/6SzHF64
	Wywgm7jGfrNDZigHNy5k9AqqG/KDAtMuKDRwsE/YhV7+8UZZ8ZFnIeG8/mCFrrxu1Yo=
X-Gm-Gg: AY/fxX77hvfDWkUDH6P4jpd/qseDvL6uNtCJMOEHsuFBUuXCKGBR1nKs//79W8B1xKo
	xQbS1nflNqV1w3jlNnRWJ58NqqKOOej2ipc/5h0w6bc29CXTwWgoSX3vOYSzxpXYATNsBkSNBUp
	07tp2dLWR0r/JWYfol19AbCCWnCLezmT/3BvFB1HyJzXpGpgrNJZ6jr61xgKO4w/KE1Dw0JKDPN
	NmU9Gy/SHu95nzL0FoPu2gQc1ysnTLeAOrjbD164eFA3QDNQ1nPpDZ1S2Mqx59XHZAfRHhJTAKN
	pyLw7jtaREWejGoZb1xaV8VZVFZkpEZBYWdSY3d5zTdLeyAsm4UMPKvw/74KnMq6QKF1CC3wLma
	76TQGKGkYgmKvAdfJ+GM9ZBHZcF3JwRcKo7pSIRbZ7bNu3r7hwF3fDsnn9ENVzZAaw1EegbH7fw
	pXGaebOstoiUZ++qrh8OUVGYi8GW4w74OXygZp3kaCOWhIp00I8WP8C9YCdC9t1ED55RKEKzMXh
	g7Cjw==
X-Google-Smtp-Source: AGHT+IGhhOYZKctaAXiwtJlAY6LMlw15A19l/KGDBsNXnrAfc1iEEPIKY6CiPlM62gJVzelai6XHLA==
X-Received: by 2002:a17:907:7e9a:b0:b76:6c85:9fd3 with SMTP id a640c23a62f3a-b8036960757mr5100493366b.0.1767603709360;
        Mon, 05 Jan 2026 01:01:49 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:49 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:52 +0000
Subject: [PATCH v6 16/20] regulator: s2mps11: add S2MPG10 regulator
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-16-80f4b6d1bf9d@linaro.org>
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

Note2: While external control via input pins appears to exist on other
versions of this PMIC, there is more flexibility in this version, in
particular there is a selection of input pins to choose from for each
rail (which must therefore be configured accordingly if in use),
whereas other versions don't have this flexibility.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v5:
- one instance per PMIC, not per rail or rail type (Mark)

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
 drivers/regulator/s2mps11.c         | 587 +++++++++++++++++++++++++++++++++++-
 include/linux/mfd/samsung/s2mpg10.h |  24 ++
 2 files changed, 608 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 7f4db6673b43ebd533c2afb568ae3481351a9c60..0b6b28ce6465bdbc98ed72f627dc5565479ec7c0 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2012-2014 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
+#include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/err.h>
@@ -16,6 +17,7 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/mfd/samsung/core.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -23,6 +25,11 @@
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
@@ -42,6 +49,21 @@ struct s2mps11_info {
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
@@ -394,6 +416,530 @@ static int s2mps11_of_parse_cb(struct device_node *np,
 				      config);
 }
 
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
+	return s2mps11_of_parse_gpiod(np, "enable", true, desc, config);
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
+}
+
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
@@ -1277,6 +1823,18 @@ static int s2mps11_handle_ext_control(struct s2mps11_info *s2mps11,
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
@@ -1292,6 +1850,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	unsigned int rdev_num;
 	int i, ret;
 	const struct regulator_desc *regulators;
+	const struct s2mpg10_regulator_desc *s2mpg1x_regulators = NULL;
 
 	s2mps11 = devm_kzalloc(&pdev->dev, sizeof(struct s2mps11_info),
 				GFP_KERNEL);
@@ -1300,6 +1859,11 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 
 	s2mps11->dev_type = platform_get_device_id(pdev)->driver_data;
 	switch (s2mps11->dev_type) {
+	case S2MPG10:
+		rdev_num = ARRAY_SIZE(s2mpg10_regulators);
+		s2mpg1x_regulators = s2mpg10_regulators;
+		BUILD_BUG_ON(ARRAY_SIZE(s2mpg10_regulators) > S2MPS_REGULATOR_MAX);
+		break;
 	case S2MPS11X:
 		rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
@@ -1336,6 +1900,17 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 				     s2mps11->dev_type);
 	}
 
+	if (s2mpg1x_regulators) {
+		size_t regulators_sz = rdev_num * sizeof(*s2mpg1x_regulators);
+
+		s2mpg1x_regulators = devm_kmemdup(&pdev->dev,
+						  s2mpg1x_regulators,
+						  regulators_sz,
+						  GFP_KERNEL);
+		if (!s2mpg1x_regulators)
+			return -ENOMEM;
+	}
+
 	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
 
 	platform_set_drvdata(pdev, s2mps11);
@@ -1344,15 +1919,20 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	config.regmap = iodev->regmap_pmic;
 	config.driver_data = s2mps11;
 	for (i = 0; i < rdev_num; i++) {
+		const struct regulator_desc *rdesc;
 		struct regulator_dev *regulator;
 
+		if (s2mpg1x_regulators)
+			rdesc = &s2mpg1x_regulators[i].desc;
+		else
+			rdesc = &regulators[i];
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
@@ -1363,6 +1943,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_pmic_id[] = {
+	{ "s2mpg10-regulator", S2MPG10},
 	{ "s2mps11-regulator", S2MPS11X},
 	{ "s2mps13-regulator", S2MPS13X},
 	{ "s2mps14-regulator", S2MPS14X},
diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/samsung/s2mpg10.h
index aec248c51f366359ff323f421e453a0ec1d1dfa3..8e5cf21cbd5a0bcfa36c89b8300a8c3247d6c6f8 100644
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
2.52.0.351.gbe84eed79e-goog


