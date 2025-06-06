Return-Path: <linux-gpio+bounces-21089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C73CAAD0498
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 17:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2334E189DECB
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 15:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B7028A3E1;
	Fri,  6 Jun 2025 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1yAVPmC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A4288CB4
	for <linux-gpio@vger.kernel.org>; Fri,  6 Jun 2025 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222206; cv=none; b=qrHOzSImElZMnQp59J1WaL3K+W/YA0xtaj4jNonXBxSJf9bGjVN8gnTy8gJ0MI59YJrskafBhkU/cBNaDP0cn7JOJzH4j6a6spAv2igw6Ct1+U/bmAVYkzjGQ7Lr2OvlQHn80FUI1dfvCNtQYtGxn7lWm6pQ8tka/FkVldR/a0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222206; c=relaxed/simple;
	bh=DtlBkmeFf9pjAxGCgmCN5Tg4/h2onm9CJStRVS1CP9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKA3dbhrYLzmRjkRKsfk5UT9a64y2SlDm+UCvFyuzvSNuS/LhcX6IJl8Js6wQ4RoPa7d53a7gIHZ3Bs4WVLbMqJK/FyV0F5rF1SPhbBE3DMFm5ubO0UKc/bQvH9vMgCmGRR7o8B0qnFnfFd5GnupyNPbgLX2Gv2JIRVEV758n0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1yAVPmC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad88d77314bso433831966b.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jun 2025 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222201; x=1749827001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7btE5VBq3UbP0k1jf4CzhHOohoUdya+2IgQP8EiGSvc=;
        b=B1yAVPmCn7q80Q46pfamFbOoJ/Hh3nPHnt3sW6UK+hbaCn70FYvVqGxYPoIcq+Cv/C
         FofI2H87hL+DOeqtIOhYILkDcYNu9icRb09QWVkFjlgeeGHfSbnMBhFBGMsN8D+Qgdmx
         porGVnj66Ijd/CFoFCjag2xQjx8J6s14mcWmXV8X7PzWPdzhzyrK+/jNizM31gpmnDAw
         2ppdkyJbG0rNGnzOh+YRp92rR21n4C6z+/xapj50CPj9CyvaW78DbkEB6C62tgPMJHX6
         KUMAEspgBxTlwCq6e2FlzHtYfk6Njhwt8UrR1uJ4yUzZgcJBwfcZ/KZ7Jbn96nfsNRP9
         Y68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222201; x=1749827001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7btE5VBq3UbP0k1jf4CzhHOohoUdya+2IgQP8EiGSvc=;
        b=Wq5FZlfK2TTGVgbVGrvFhk5GMOlTv7KF34NpUU9ta94fdqZZcnjw3uHDXGl60bobcI
         ql6ULSHwrgvZPJ7UVzfJ4aBBxdFFdgOR/Hh4PGk4EI0ckp0b1s8D3DSPq4iIN2but5Ot
         FLBJQf4NrUz01d3huK50qjqz8x9f5DtNuIFfA4uDRAeXA1FZ5JDPLQtfFwodf7sZFwXM
         dg7cUrnYli7Vm59ba5l9Jv82HYuGtIhypXUUpVnZGYbY+x5IGD9dJb4LHkOm0Vxy76+c
         v00hTzzlPzw2md3bXQd+qp2lUEEhitO5yW/qY3NjHu1xpJN8GvCk6N+1+0Jm8NpV6R+t
         rwqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7Zz/JTYKenoPuXDmnp72ihBCl0NMkrsRiFjJ1AGxRwe8AoT7kmRNeJenc5CHW0trmG6LfAU7o87C8@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3/HLQKyIBfTrUyUSE40oU76Anfp1IaqX+7qZOF/ZsSmzy8S7
	FDzG9oeVwkFQgrI25dKCNMLuIzdgrrRQO8dCeAbw0g0jqgjcNNMmZtbOUSe5efQo1s8=
X-Gm-Gg: ASbGncuLthGrVlepq5l/L6cK/LDC79dxECpSLohPtBwPV5S7p3lBxrGrrOa3KYlXFPK
	T2SLS91nh4jVeRNwfqzsdgLUZR7XjvF5G+s9WO2ZOjuXFKSj1F7FewWlxNoezos7FKLMivltcEO
	kzw5B0xDruGvm5DFxsCM0CMYgH8bHJ7bV4VNaWSJ5UZIuyUFSOFlyh+85qEZmvLjWMq4iOUDGcJ
	XFJez8sJ2RQC3jdS2vDay+6u8SbzBEk9HPNQPpFM+u1bTDGbq/jAQLCf8ujK8g9ET8rswpvBF8l
	9Q0Fp4BtCd+Iz0MJvysbnekgX5+SB8EbG+TfgCmjMMqSzgq2FoxzTU49n2NXjoKD0MJBXTcSu8X
	xASN1o9jzV4upa8OpMXMOCesi2lb/694ItiEpyCyC48LAgQ==
X-Google-Smtp-Source: AGHT+IGxnm6pBbHVIYIIe9hkMQ8JxTW7peP3cR4UL9qPSHSxqgc6/znfqj1QohdocTUC3/x18Pe/gQ==
X-Received: by 2002:a17:907:8694:b0:ad8:8529:4f73 with SMTP id a640c23a62f3a-ade1aa0e3e8mr353586166b.49.1749222199472;
        Fri, 06 Jun 2025 08:03:19 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:19 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:10 +0100
Subject: [PATCH v2 14/17] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-14-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
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

The upcoming S2MPG11 support needs a similar, but different version of
::set_voltage_time(). For S2MPG10, the downwards and upwards ramps for
a rail are at different offsets at the same bit positions, while for
S2MPG11 the ramps are at the same offset at different bit positions.

Refactor the existing version slightly to allow reuse.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 3f2993b96c3e54427f5c0af7bb045e2278daa671..76be81c75c898fddc9570a62a64da787bacad7d7 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -562,26 +562,23 @@ static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
 		+ DIV_ROUND_UP(curr_uV, s2mpg10_desc->enable_ramp_rate));
 }
 
-static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
-						   int old_uV, int new_uV)
+static int s2mpg1x_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV,
+						   unsigned int ramp_reg,
+						   unsigned int ramp_mask)
 {
-	unsigned int ramp_reg, ramp_sel, ramp_rate;
+	unsigned int ramp_sel, ramp_rate;
 	int ret;
 
 	if (old_uV == new_uV)
 		return 0;
 
-	ramp_reg = rdev->desc->ramp_reg;
-	if (old_uV > new_uV)
-		/* The downwards ramp is at a different offset. */
-		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
-
 	ret = regmap_read(rdev->regmap, ramp_reg, &ramp_sel);
 	if (ret)
 		return ret;
 
-	ramp_sel &= rdev->desc->ramp_mask;
-	ramp_sel >>= ffs(rdev->desc->ramp_mask) - 1;
+	ramp_sel &= ramp_mask;
+	ramp_sel >>= ffs(ramp_mask) - 1;
 	if (ramp_sel >= rdev->desc->n_ramp_values ||
 	    !rdev->desc->ramp_delay_table)
 		return -EINVAL;
@@ -591,6 +588,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
 	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_rate);
 }
 
+static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV)
+{
+	unsigned int ramp_reg;
+
+	ramp_reg = rdev->desc->ramp_reg;
+	if (old_uV > new_uV)
+		/* The downwards ramp is at a different offset. */
+		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
+
+	return s2mpg1x_regulator_buck_set_voltage_time(rdev, old_uV, new_uV,
+						       ramp_reg,
+						       rdev->desc->ramp_mask);
+}
+
 /*
  * We assign both, ::set_voltage_time() and ::set_voltage_time_sel(), because
  * only if the latter is != NULL, the regulator core will call neither during

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


