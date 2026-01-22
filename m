Return-Path: <linux-gpio+bounces-30926-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J6TOslGcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30926-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:48:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6088069306
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E835B3001C71
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A5647F2DB;
	Thu, 22 Jan 2026 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MID5vbQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9243644C3
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096644; cv=none; b=uGQtub5+gUbPfo6BeJLQbNl7Mn9CHz+mEMiVQOSxXuOydjWhESm/nsvAzQsY295/pay3eC1/yH0TuCTgmt3RtgjyL4zX5dAVDs6KWRQNSPYlRAfLbjAuTYk7DkjmhLwuJfc+vKs+yLltUf9r1+gC2ECAF2chawfB7p6jZhLwS/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096644; c=relaxed/simple;
	bh=qZwi0VBdEjXKYAJmcVLy03jwB2048b4QRMXyR5EnHQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnaAsZE8B/dFf39piChcUqOBoDJFwIXsNJd6PC73iTmOE0bInLsVJrCsLsXfJQWbnZAGCZMkQCP8JKZMS7V2tIhRtY0CVcY1mTc6i955085QWUTmNZZXm2XMdwfP85hlQAaZ1cxvYTbWlLorVFQ/Mc4/lAd6febB3DhZq/lG4UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MID5vbQF; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so1782962a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096626; x=1769701426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbATD9gH/jg77F2vOXb69VjDypI/0O8i8+As0LO3lMk=;
        b=MID5vbQFsDMz35KD2z4l5ykRaDPTNQqqeR7q+DPXdU7fdSr4zVkf9V3I0rzFz6uT2H
         0tqdw1pF858TMcfWi5uDuxWH+fNMk/1MgXncI39eiqri8FDklAQO1uuPqxRQhfjmAYXu
         3MikbyEbDnMfTUr0dZa74CQd9dT555rul2EiI7Yh7uXFim6lvQElrNnUJNWPbRX/Ky2G
         cbWy9+UudeAP7Oom8AmVPCGs0oIlKElSvtTgJlE3eWsUDeFWcs8SDOL5xgMzMFVi9qHZ
         KMrlPn7WkaGpzNvpIm/W4u4jUmJDf2hXcCfpi4XEvExQySpnOgjWEVHW5MTQkvm/n/tl
         DmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096626; x=1769701426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IbATD9gH/jg77F2vOXb69VjDypI/0O8i8+As0LO3lMk=;
        b=uKZSDyRv8QjjgTNZmO1r/mVM6GhY3ErtAiN8Rd3c2dJUbuZRKbBP9jyq9xbckA2gd9
         /OH/W+k+wWGdYfONSHO82Fd1UnxOPJBuUWnFxJTH2t1OyK0NZJweDuBNigaFg076tBMt
         5OXzDHuuBG96uM2BVa4R8Imgz3vTH624pG02W4NzpXCDR5/4ScXcpW7jQ7//6XYdzGgz
         qQoY3fxFgo7BHkkG+S3AZUEqwkT56qP3IQO9ivnK33yi1a3+tITG8aWPFqrGwScZ0b77
         lfNK/oqyJHX/WX1o1YHKXTVgA4AKVeUAJHefC2LEYJvqftZHfOdBYaSHZ17xU2DMpY78
         dk4w==
X-Forwarded-Encrypted: i=1; AJvYcCXuXOS9r3vYEAQegbCZJmjt1h3y3P0UXgso3bZX/RrBhqQh3gBdloWgHivbA0SQZZD8nYafYNgV4FRs@vger.kernel.org
X-Gm-Message-State: AOJu0YzKExm8k2qGQkOUBtKRLF3dtjkBmjeIUuTFW5zic+b+9YtoOXxR
	HiW39EMoofL7ZdSEjdnqgQBDKFWWDScahs5jCSyoX2L8bUzgTBq8O/qUJwb2DyrHIvU=
X-Gm-Gg: AZuq6aJEdPhnYuC82W3fU9WcH/ZKZhtXAGgkIa/PyHvOGGS69vWitfrp1txXdwfKujd
	YhkuO0dx4TGrr7ADv49HmxN+o83wUbIfPg3F8/yWTJpsGG6H+eixbuqss9t358yO/57ScwIBHAa
	4tfrtE6QHM3s+DJw0A9QzjKnGlwSAc91QwCqu0cMQkzPpz1KEx8bE1mpmo6ymmSACnp7u7om1dB
	CPQY4s0NTjdMbL7AJMPmynV7oIxOX+eM6AJdNDqMeDdP2Zfk98prbLGTZCryxLTIaNPxDzglJCV
	Uo7WoOIxzR2QDcXRd5z860iYvuP68r6QK4MlNWZLfWMn1LoND0rb9Lzu21fnYad8L4pPLKm0poN
	Skg57lHLYkgmX2eHAwftB/VosT14YAbucvvGDVNCJlnz8dy8gP7tsEBYNYBI5XHkwPLf294Su/q
	mBrOmBlO0UUJY4hGVdF93P1HC35w28GoYCC7D8acnZZlitnSHvlco1Bxh7cYjbyyYUAfHJcYXHq
	yH0nA==
X-Received: by 2002:a05:6402:2552:b0:64f:cfa0:9008 with SMTP id 4fb4d7f45d1cf-6584874e1bbmr49315a12.4.1769096626312;
        Thu, 22 Jan 2026 07:43:46 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:46 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:42 +0000
Subject: [PATCH v7 15/20] regulator: s2mps11: refactor handling of external
 rail control
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-15-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30926-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6088069306
X-Rspamd-Action: no action

Refactor s2mps14_pmic_enable_ext_control() and s2mps11_of_parse_cb()
slightly as a preparation for adding S2MPG10 and S2MPG11 support, as
both of those PMICs also support control of rails via GPIOs.

This also includes the following to avoid further updates in follow-up
commits:
* On S2MPG10 and S2MPG11, external rail control can be via GPIO or via
  non-GPIO signals, hence passing a GPIO is allowed to be optional.
  This avoids inappropriate verbose driver messages.
* Prepare to allow use of standard DT property name 'enable-gpios' for
  newer platforms instead of vendor-specific 'samsung,ext-control'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- add 'optional' flag to this commit (Bartosz)
- add 'con_id' to this commit
---
 drivers/regulator/s2mps11.c | 100 +++++++++++++++++++++++++++++---------------
 1 file changed, 67 insertions(+), 33 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 88e21c90832a45547e5791b15cd1de274f81fed6..7f4db6673b43ebd533c2afb568ae3481351a9c60 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -328,29 +328,15 @@ static int s2mps11_regulator_set_suspend_disable(struct regulator_dev *rdev)
 				  rdev->desc->enable_mask, state);
 }
 
-static int s2mps11_of_parse_cb(struct device_node *np,
-			       const struct regulator_desc *desc,
-			       struct regulator_config *config)
+static int s2mps11_of_parse_gpiod(struct device_node *np,
+				  const char *con_id, bool optional,
+				  const struct regulator_desc *desc,
+				  struct regulator_config *config)
 {
-	const struct s2mps11_info *s2mps11 = config->driver_data;
 	struct gpio_desc *ena_gpiod;
 	int ret;
 
-	if (s2mps11->dev_type == S2MPS14X)
-		switch (desc->id) {
-		case S2MPS14_LDO10:
-		case S2MPS14_LDO11:
-		case S2MPS14_LDO12:
-			break;
-
-		default:
-			return 0;
-		}
-	else
-		return 0;
-
-	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np),
-					   "samsung,ext-control", 0,
+	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 					   "s2mps11-regulator");
@@ -361,14 +347,19 @@ static int s2mps11_of_parse_cb(struct device_node *np,
 		if (ret == -EPROBE_DEFER)
 			return ret;
 
-		if (ret == -ENOENT)
+		if (ret == -ENOENT) {
+			if (optional)
+				return 0;
+
 			dev_info(config->dev,
 				 "No entry for control GPIO for %d/%s in node %pOF\n",
 				 desc->id, desc->name, np);
-		else
+		} else {
 			dev_warn_probe(config->dev, ret,
 				       "Failed to get control GPIO for %d/%s in node %pOF\n",
 				       desc->id, desc->name, np);
+		}
+
 		return 0;
 	}
 
@@ -380,6 +371,29 @@ static int s2mps11_of_parse_cb(struct device_node *np,
 	return 0;
 }
 
+static int s2mps11_of_parse_cb(struct device_node *np,
+			       const struct regulator_desc *desc,
+			       struct regulator_config *config)
+{
+	const struct s2mps11_info *s2mps11 = config->driver_data;
+
+	if (s2mps11->dev_type == S2MPS14X)
+		switch (desc->id) {
+		case S2MPS14_LDO10:
+		case S2MPS14_LDO11:
+		case S2MPS14_LDO12:
+			break;
+
+		default:
+			return 0;
+		}
+	else
+		return 0;
+
+	return s2mps11_of_parse_gpiod(np, "samsung,ext-control", false, desc,
+				      config);
+}
+
 static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
@@ -903,10 +917,16 @@ static const struct regulator_desc s2mps15_regulators[] = {
 };
 
 static int s2mps14_pmic_enable_ext_control(struct s2mps11_info *s2mps11,
-		struct regulator_dev *rdev)
+					   struct regulator_dev *rdev)
 {
-	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
-			rdev->desc->enable_mask, S2MPS14_ENABLE_EXT_CONTROL);
+	int ret = regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
+				     rdev->desc->enable_mask,
+				     S2MPS14_ENABLE_EXT_CONTROL);
+	if (ret < 0)
+		return dev_err_probe(rdev_get_dev(rdev), ret,
+				     "failed to enable GPIO control over %d/%s\n",
+				     rdev->desc->id, rdev->desc->name);
+	return 0;
 }
 
 static int s2mpu02_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
@@ -1244,6 +1264,26 @@ static const struct regulator_desc s2mpu05_regulators[] = {
 	regulator_desc_s2mpu05_buck45(5),
 };
 
+static int s2mps11_handle_ext_control(struct s2mps11_info *s2mps11,
+				      struct regulator_dev *rdev)
+{
+	int ret;
+
+	switch (s2mps11->dev_type) {
+	case S2MPS14X:
+		if (!rdev->ena_pin)
+			return 0;
+
+		ret = s2mps14_pmic_enable_ext_control(s2mps11, rdev);
+		break;
+
+	default:
+		return 0;
+	}
+
+	return ret;
+}
+
 static int s2mps11_pmic_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
@@ -1314,15 +1354,9 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 					     regulators[i].id,
 					     regulators[i].name);
 
-		if (regulator->ena_pin) {
-			ret = s2mps14_pmic_enable_ext_control(s2mps11,
-							      regulator);
-			if (ret < 0)
-				return dev_err_probe(&pdev->dev, ret,
-						     "failed to enable GPIO control over %d/%s\n",
-						     regulator->desc->id,
-						     regulator->desc->name);
-		}
+		ret = s2mps11_handle_ext_control(s2mps11, regulator);
+		if (ret < 0)
+			return ret;
 	}
 
 	return 0;

-- 
2.52.0.457.g6b5491de43-goog


