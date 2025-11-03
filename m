Return-Path: <linux-gpio+bounces-27986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF6EC2DDC9
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 20:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 637C93BCF03
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 19:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0E3325498;
	Mon,  3 Nov 2025 19:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oriiXeSU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A53A324B1B
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 19:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197300; cv=none; b=VeucCnnrwYe6moN1LeWFygThp89KtTjwpiA+sJ2gA2FvZfpItKbwjAW0ifAJeT16XL8tVgPmy3aNTXuCGLLmhnUzatYcy0wcjGVAXccvHMM7HSQswBkOwMs3COVC8jAnI+9HW+IuNGEeG9bcjpuPyY1kXcg7XW5bBqA2LyGFxFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197300; c=relaxed/simple;
	bh=z1TeLIGnrI/sXy9d3RoLQyUs+dI+CE4Pa/rEQHtDI4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnR/fzggDCEDjNRgF/atpqHLk4NttzMzj9ssSBcRozsWXwEa0jwbzbs+aMsOMS17uVWCjZdDHC/V8jhjyU7AMk3BDoDYl9ITYMeersa35m1rLjiVwqtiWtuDKdGwHpK/u0h4nAQTUXj/X8gmUIFr7xheN0feFyzXEpETXjiNFco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oriiXeSU; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so878508866b.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 11:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197292; x=1762802092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0uddmvQ1CQfXN2YuSKgPJJfVtJ1lE0VLXSC7VUVLAs=;
        b=oriiXeSU+uSUkhezhmTMNgsYyICFG+xJlqC5qpHj8hJ7iWwcKMF/vmLOaNfCcHNFlT
         VzvPTluitnWgxW9FSpqsm0Y1P43Ka7zq24sP0wpO13kYcmSXt/imQ6S7jJhCpUHcXBbI
         BHg3dJGxgAw1UywIP7HOxSULrFHDqJkWuv/y87oS0oaUBg3qxWCO1J0R+Z3gmkHZnHSN
         UuYP+lH2dQ81A0L7Ez/MiQcEIouRxgB79NBCRfNTPxXrjPbBol7/I1O1Uq+wUwnkgvD3
         cYZeh3cgUTvRx9Q0hRsvZ3+2VFs1VSjtNmKVbIcFIKIdure+BOsrK1ffrDlT8IT8Szq/
         3Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197292; x=1762802092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0uddmvQ1CQfXN2YuSKgPJJfVtJ1lE0VLXSC7VUVLAs=;
        b=TPnAH0eV+E1ItNyIz9OApBMZ17uMEJnCgvHLTgxhK9iR7MnxPDm8T6q5SZix5mq7Wr
         wbmlH7Ep97hw3pwxfhJZ160aUcR+s5tethaOXgGJV9wpPsN0Eh3dykyNUwWRisI3SYYD
         A3waA/+VljjPdOLZ/p3UYDvfwMw7xUTu1KIo9HYeXUzHSE29Eruj9ERFmSAxI9QMQedO
         Y7UxdEnK3RUjEFqvgGYonor3o8Ne+0HPJup4vQqoYmCdiU9m3wpLNL73SL4qExVH8APY
         59PPv+wz6TKI+vugUlXfryfkg0D4FavPQQ19oM3h2vxkHnW4XjHTOUsz56POulOTk0p8
         180w==
X-Forwarded-Encrypted: i=1; AJvYcCWIhAm/b2Xvpq5ypdgvxSlE8KAkgxve7e7KyJMEzL1qxraPN44ORs4Bev06FK+MXgfwhtkyhnGTnxzN@vger.kernel.org
X-Gm-Message-State: AOJu0YybhGKttMkPmyLPKfyclzKG3KumWkOkSPbJMWQnoSnqmM07MNin
	Pl/sm5PP9SIHuOU16aeyv0hEIMXOnVsFf8OQGlLz/Kq753V+899QusBfQccvlc+0IhQ=
X-Gm-Gg: ASbGncuMiocubw0ETmk0EUyq3Ygh3eGfMjdOjOcOsqwrca6q2p18aamkNL6iHzFXT6O
	fK3zrHktq+IZfrdvyIVNDKb1Kb1pjJagIcwpsXwyFWxUFieZYBcXB5qC4d/I4a1oHFZlt2UgyAf
	NDN0GIoNg5ZGR5Tz9TVZnO0xlJokKIBcWeNU3KqauvwtA+bsZLtiec88o1pBubGeMQ7AqOIktv/
	lLMk4fQWi4xCNBVtWbEx0jE5on+NOQuWEAs4kzpSsY4EJrTE8ASNg39jGfLIIOh3dUDDQoOrKml
	V4z+c/Co0sfUh0mzrFdeF9a8uPgw+LObvm3Qfj+68aULXkG37A2//oFU35MY/tpDgpZdNRvT8ET
	N1AQ7m8Jq+7m8qiEkgarshm2LJYD+L2cWJfWl99Om4X938O0xu99iwbx7i6kmZ/3mS4QEMqpGae
	wiD50duHf0T3mJ8Vhj6B9vN9dxRAfjyZgtwgQjcJV640mN583HCM9VCk19mPt4/S6cXmw9no4=
X-Google-Smtp-Source: AGHT+IEo+hgtGQPoGKT5ZNh/pR3Fj/4ej3Z37xV/8FISyxdUu77/ghgo/A6fJWZ5qGYbFJawBWEZcw==
X-Received: by 2002:a17:907:7253:b0:b3f:ccac:af47 with SMTP id a640c23a62f3a-b70705f3602mr1489495966b.31.1762197292202;
        Mon, 03 Nov 2025 11:14:52 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:51 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:57 +0000
Subject: [PATCH v3 18/20] regulator: s2mps11: refactor S2MPG10 regulator
 macros for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-18-b8b96b79e058@linaro.org>
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

Rails in the S2MPG11 share a very similar set of properties with
S2MPG10 with slight differences. Update the existing macros to allow
reuse by the upcoming S2MPG11 driver.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch complains about unused macro arguments _r_mask,
_r_table, and _r_table_sz, but these are false-positives due to patch
context.

v2:
- fix commit message typos: s2mp1 -> s2mpg1
- drop duplicated assignment of ::of_parse_cb in
  regulator_desc_s2mpg1x_buck_cmn() macro
---
 drivers/regulator/s2mps11.c | 69 +++++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index d840aec236dcbdc8b460f89b4cd04e42e3b3da7d..35cfea6b6d8091ba21f00e1cb82b11a8dc9bc3ec 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -650,31 +650,44 @@ static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
  * (12.5mV/μs) while our ::set_voltage_time() takes the value in ramp_reg
  * into account.
  */
-#define regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg) {		\
-	.name		= "buck"#_num "m",				\
-	.supply_name	= "vinb"#_num "m",				\
-	.of_match	= of_match_ptr("buck"#_num "m"),		\
+#define regulator_desc_s2mpg1x_buck_cmn(_name, _id, _supply, _ops,	\
+		_vrange, _vsel_reg, _vsel_mask, _en_reg, _en_mask,	\
+		_r_reg, _r_mask, _r_table, _r_table_sz,			\
+		_en_time) {						\
+	.name		= "buck" _name,					\
+	.supply_name	= _supply,					\
+	.of_match	= of_match_ptr("buck" _name),			\
 	.regulators_node = of_match_ptr("regulators"),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
-	.id		= S2MPG10_BUCK##_num,				\
-	.ops		= &s2mpg10_reg_buck_ops[0],			\
+	.id		= _id,						\
+	.ops		= &(_ops)[0],					\
 	.type		= REGULATOR_VOLTAGE,				\
 	.owner		= THIS_MODULE,					\
 	.linear_ranges	= _vrange,					\
 	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
 	.n_voltages	= _vrange##_count,				\
-	.vsel_reg	= S2MPG10_PMIC_B##_num##M_OUT1,			\
-	.vsel_mask	= 0xff,						\
-	.enable_reg	= S2MPG10_PMIC_B##_num##M_CTRL,			\
-	.enable_mask	= GENMASK(7, 6),				\
-	.ramp_reg	= S2MPG10_PMIC_##_r_reg,			\
-	.ramp_mask	= s2mpg10_buck_to_ramp_mask(S2MPG10_BUCK##_num	\
-						    - S2MPG10_BUCK1),	\
-	.ramp_delay_table = s2mpg10_buck_ramp_table,			\
-	.n_ramp_values	= ARRAY_SIZE(s2mpg10_buck_ramp_table),		\
-	.enable_time	= 30, /* + V/enable_ramp_rate */		\
+	.vsel_reg	= _vsel_reg,					\
+	.vsel_mask	= _vsel_mask,					\
+	.enable_reg	= _en_reg,					\
+	.enable_mask	= _en_mask,					\
+	.ramp_reg	= _r_reg,					\
+	.ramp_mask	= _r_mask,					\
+	.ramp_delay_table = _r_table,					\
+	.n_ramp_values	= _r_table_sz,					\
+	.enable_time	= _en_time, /* + V/enable_ramp_rate */		\
 }
 
+#define regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg)		\
+	regulator_desc_s2mpg1x_buck_cmn(#_num "m", S2MPG10_BUCK##_num,	\
+		"vinb"#_num "m", s2mpg10_reg_buck_ops, _vrange,		\
+		S2MPG10_PMIC_B##_num##M_OUT1, GENMASK(7, 0),		\
+		S2MPG10_PMIC_B##_num##M_CTRL, GENMASK(7, 6),		\
+		S2MPG10_PMIC_##_r_reg,					\
+		s2mpg10_buck_to_ramp_mask(S2MPG10_BUCK##_num		\
+					  - S2MPG10_BUCK1),		\
+		s2mpg10_buck_ramp_table,				\
+		ARRAY_SIZE(s2mpg10_buck_ramp_table), 30)
+
 #define s2mpg10_regulator_desc_buck_cm(_num, _vrange, _r_reg)		\
 	.desc = regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg),	\
 	.enable_ramp_rate = 12500
@@ -738,24 +751,24 @@ static const struct regulator_ops s2mpg10_reg_ldo_ramp_ops[] = {
 	}
 };
 
-#define regulator_desc_s2mpg10_ldo_cmn(_num, _supply, _ops, _vrange,	\
-		_vsel_reg_sfx, _vsel_mask, _en_reg, _en_mask,		\
+#define regulator_desc_s2mpg1x_ldo_cmn(_name, _id, _supply, _ops,	\
+		_vrange, _vsel_reg, _vsel_mask, _en_reg, _en_mask,	\
 		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz) {	\
-	.name		= "ldo"#_num "m",				\
+	.name		= "ldo" _name,					\
 	.supply_name	= _supply,					\
-	.of_match	= of_match_ptr("ldo"#_num "m"),			\
+	.of_match	= of_match_ptr("ldo" _name),			\
 	.regulators_node = of_match_ptr("regulators"),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
-	.id		= S2MPG10_LDO##_num,				\
+	.id		= _id,						\
 	.ops		= &(_ops)[0],					\
 	.type		= REGULATOR_VOLTAGE,				\
 	.owner		= THIS_MODULE,					\
 	.linear_ranges	= _vrange,					\
 	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
 	.n_voltages	= _vrange##_count,				\
-	.vsel_reg	= S2MPG10_PMIC_L##_num##M_##_vsel_reg_sfx,	\
+	.vsel_reg	= _vsel_reg,					\
 	.vsel_mask	= _vsel_mask,					\
-	.enable_reg	= S2MPG10_PMIC_##_en_reg,			\
+	.enable_reg	= _en_reg,					\
 	.enable_mask	= _en_mask,					\
 	.ramp_delay	= _ramp_delay,					\
 	.ramp_reg	= _r_reg,					\
@@ -770,10 +783,12 @@ static const struct regulator_ops s2mpg10_reg_ldo_ramp_ops[] = {
 		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz,	\
 		_pc_reg, _pc_mask)					\
 	[S2MPG10_LDO##_num] = {						\
-		.desc = regulator_desc_s2mpg10_ldo_cmn(_num, _supply,	\
-				_ops,					\
-				_vrange, _vsel_reg_sfx, _vsel_mask,	\
-				_en_reg, _en_mask,			\
+		.desc = regulator_desc_s2mpg1x_ldo_cmn(#_num "m",	\
+				S2MPG10_LDO##_num, _supply, _ops,	\
+				_vrange,				\
+				S2MPG10_PMIC_L##_num##M_##_vsel_reg_sfx, \
+				_vsel_mask,				\
+				S2MPG10_PMIC_##_en_reg, _en_mask,	\
 				_ramp_delay, _r_reg, _r_mask, _r_table,	\
 				_r_table_sz),				\
 		.pctrlsel_reg = _pc_reg,				\

-- 
2.51.2.997.g839fc31de9-goog


