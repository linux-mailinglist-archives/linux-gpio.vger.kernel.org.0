Return-Path: <linux-gpio+bounces-27977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24468C2DD7B
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 20:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CFAD3B39D7
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 19:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8712631BC95;
	Mon,  3 Nov 2025 19:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UyMJzH0i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643E320A04
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197295; cv=none; b=bhkE7Qdm9J1FX1CGnRN761HwCK7iFMK94Lx6adVXTM9Kb0zMq/NhdMFbDTxU02Hn6U6H0DpGdLfak5NXtkNkr8gsnKwgEeD2d5rPCZY5t19Ws6dnbxKfhYxXeLjFlY6SkC4O9fa2hP4ZD5m18lv5L0ioGhWJkVHBZKXtFbs2GOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197295; c=relaxed/simple;
	bh=tJW2qo5jNEaZaNYXdZuM6VL2mVqD5GLaWZ365Sj0BfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtHPmlgGkmEZwybP73k6xBIIADFZZDNtEib6yQVU3KOGtNU4UPpMD4Lb1UKgFZE16/8oSfrngPf5pzecFi8EAkwfbtT+hVyeUW4pFjgJKDPnEHBWHkaME1U4FDW2Q3PHu0UMbIArAxDYSniaYFVC/+co32e4Wv6XKlwlx8r/scg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UyMJzH0i; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b70bee93dc4so195797966b.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 11:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197287; x=1762802087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4/A+B4VgxoRb5vUJbk6PwfwBX4dDM1se6Ey7R7aTIg=;
        b=UyMJzH0iQAdoPYBv0vqm2NuntyxviQhslzMyBQ+qRIutZ52FuM/8DTfNT5h++nvRIy
         nUDJHb6Oi0fUJlOLfL+StD/8Ke0hwkINTcgfnME2yYYNAXPVTWEjpI//ssFBKDsMyj4i
         56j8FKxSDw5N9lpFXYbWWmR0OMjmi7bYZDOgvuGhyW85SIL4WoVBf6vl9bWaiM0hdS+q
         7isW5xTYzxSYBMZh1eKam7YnjmQ7wGXhX8H68Yx7Df7JSVxFHkKDsR41Pu9w7yxbjH1s
         /lwmp627QPNufkdAQwcf0/5buWB9/oeVunxjsA1SVYB2uEa+xU6bdB8M7yky6NDLoHl2
         A4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197287; x=1762802087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4/A+B4VgxoRb5vUJbk6PwfwBX4dDM1se6Ey7R7aTIg=;
        b=WG9Ot0VfeKGDTV3lwGC8YdIbirXqUJlywoLmVTbOtanwj8Fo2AXkjOsXiNxkLtcmJV
         NfQwOhadG3Zvn+eAdT7+auyhn4tON+JG/i1W9A56sbfjYOHhRyyBl11emvezOkz8kLcv
         LpE72oi7y+LS1aO3dILurBQ0b0Nr+ZAmmlEqzWt3Z1S3RyWxREUKANABJ2x5ErHwf+uB
         y/DMIE6CypDEkFmZLefI8DcJsZKNUwm+3dejKCgXMU9353My/sXq0D060LPayMuWirJA
         4Rt0uxk7Ix17+fHRWMwIsJUSiY6XzIiUn4nCuJqhD1/lisc9Ged8zS1ueFpyB3aZk97o
         0EGA==
X-Forwarded-Encrypted: i=1; AJvYcCUKwQMU3uFhbyOWFvk8MH/jGsMKhcIicobH7ZpfQo02xQdEiP46aa9Acb9Z4HLKPljQiOw2KPalCBV1@vger.kernel.org
X-Gm-Message-State: AOJu0YwB+rOMhfsr99e4K+RqhBarjCMjCOYhGq2eb82jPOiW1YiSHvYa
	WIarcVaChbt91f7suc8bCgw0x3EgK0c2PMseEYTUWnPYczfSCREJ8PvHqH/Iip/keMk=
X-Gm-Gg: ASbGncuOedcHVP1KTlfXn2BZ2vHC/LbfkzzTEK+trLBDXSu4RZAn4fOQFbNHAjDxtOm
	h+PN8Gz4nw0X73u1Rv82nAYekW6D8sPzMMf3xN9tubORm8r4Ms2NEoRT9YipqQWQfdCCi1EYbmp
	dt1nqm+nMtO5kl7E+MMnfXzW1KRrjeGqALJMYyje4QJOOkDKG6FM3VXot54fLLzo433hMCCpkbd
	VPD3UaoFcYfBGJCfX7hpulAQD/dxfCH2ou6L6lu1xsNh8zRzumlLw9V6Ze+8Ev6ueWW7Bz+xkyb
	2EVG6d0ZI59X1q1Zoy+ZARPM5IemDTuUufkoikGcZId3IciYVc3oUKjCvDln1qZYNb8cGngmU3o
	H67arGS+jNJXZklQcqiPwwOdrZF9McunDv4syl7zCcvIRT7adyHv4K8hJLj7B8fN3LREyqkUltg
	ioAmWizB37I1C5lkNrG6rJSoZsN06zZ3AfdwmyggTSkaPItCDgXY5x/rOVf/sitcRsi9Li6CQ=
X-Google-Smtp-Source: AGHT+IE5L2BkQ9hgxqoe4IqMTwmhmVVvjrYtbu40lsvC+MHdoumyALaxv3l8E/aAd9mMGANNqmTAlA==
X-Received: by 2002:a17:906:eecd:b0:b6d:5aac:5062 with SMTP id a640c23a62f3a-b70701290demr1467279466b.14.1762197287253;
        Mon, 03 Nov 2025 11:14:47 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:46 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:47 +0000
Subject: [PATCH v3 08/20] mfd: sec-common: Instantiate s2mpg10 bucks and
 ldos separately
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-8-b8b96b79e058@linaro.org>
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

Bucks can conceivably be used as supplies for LDOs, but currently it
can be impossible to mark BUCKs as LDO supplies. This becomes
particularly an issue with the upcoming support for the S2MPG11 PMIC.

The typical use of the S2MPG10 PMIC is in combination with an S2MPG11
PMIC in a main/sub configuration. Bucks of one are usually used as
supplies for LDOs of either itself or of the other: several S2MPG10
LDOs are consumers of various S2MPG10 bucks & S2MPG11 bucks, and
several S2MPG11 LDOs are supplied by various S2MPG10 bucks & S2MPG11
bucks.

So we have a circular dependency here - LDOs (and potentially also
bucks) of one PMIC depend on bucks of the other.

This means that if all S2MPG10 rails are handled by the same instance
of the S2MPG10 regulator driver, probe of all rails will defer, because
the supplies to the LDOs can not be resolved during probe. The same
goes for S2MPG11.

The result is that neither driver can probe successfully and probe will
ultimately fail. In other words it's currently impossible to mark BUCKs
as LDO supplies.

Additionally, multiple (LDO-) rails may share the same (buck) supply
rail and some of these LDOs might supply important consumers, e.g. RAM.
To stay with RAM, if one of those consumers needs to defer probe before
the rail supplying RAM has probed, the shared (buck) supply gets
disabled and the whole system comes to a halt, since Linux hasn't seen
the DDR-supplying rail yet, and hasn't had a chance to mark the buck
rail as having another consumer.

By splitting all rails into separate driver instances, the circular
dependency is gone, each individual instance can probe when its supplies
are ready. This approach also solves the multiple-consumers-on-one-rail
issue during probe.

The mfd_cell's ::id field is used to inform the regulator driver which
regulator to instantiate.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
- one instance per actual rail, not per rail type (LDO or buck)
- more descriptive commit message

v2:
- fix commit message typos: s2mp1 -> s2mpg1
---
 drivers/mfd/sec-common.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 42d55e70e34c8d7cd68cddaecc88017e259365b4..b722481594801e545d24014af6afd5e1e39d7522 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -14,6 +14,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/module.h>
@@ -35,7 +36,47 @@ static const struct mfd_cell s2dos05_devs[] = {
 
 static const struct mfd_cell s2mpg10_devs[] = {
 	MFD_CELL_NAME("s2mpg10-meter"),
-	MFD_CELL_NAME("s2mpg10-regulator"),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_BUCK1),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_BUCK2),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_BUCK3),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_BUCK4),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_BUCK5),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_BUCK6),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_BUCK7),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_BUCK8),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_BUCK9),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_BUCK10),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO1),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO2),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO3),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO4),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO5),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO6),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO7),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO8),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO9),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO10),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO11),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO12),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO13),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO14),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO15),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO16),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO17),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO18),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO19),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO20),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO21),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO22),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO23),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO24),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO25),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO26),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO27),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO28),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO29),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO30),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_LDO31),
 	MFD_CELL_NAME("s2mpg10-rtc"),
 	MFD_CELL_OF("s2mpg10-clk", NULL, NULL, 0, 0, "samsung,s2mpg10-clk"),
 	MFD_CELL_OF("s2mpg10-gpio", NULL, NULL, 0, 0, "samsung,s2mpg10-gpio"),

-- 
2.51.2.997.g839fc31de9-goog


