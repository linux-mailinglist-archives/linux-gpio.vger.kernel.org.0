Return-Path: <linux-gpio+bounces-16584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 457D2A44BB1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 20:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1F0F7ADEC6
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 19:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F320220C033;
	Tue, 25 Feb 2025 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mbGE39Dr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE911EBFE6
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 19:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740512440; cv=none; b=J3OZlH5l2cvaMwlHi9m4TnQNAw8HB2AelvkjPIcdz+FnMsHnx31tJJ/oUHgwyWUb5AQpcYxY4iCs5KNMqEVDfxUFtp4bSseFVdwERTl8sOx4ktcaGkQwxcudmjGFJA6GJ7UB2hnUKLS+8jyuIxeenCQ4bOwyrMIwIs2fvM0jHG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740512440; c=relaxed/simple;
	bh=JnkVoJVEvt9wSbfZJwKuTmFUsqCBtk0hMWljeyVPBxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5VfCwjC1GM2rfBW2LwRIJqRBFXlN8+Z5ul73OW2k3P+wFA9FzJPrh3dOkskr7CDX0enPbeb+pRZ2LNPgqNdPdeSp/da/1ow7r8Kic5gT0ZA/woxMeMuFYHCu+SL4FPkjCxm3bIV4gYbYFIgjcqttF0DgysWHo/Bbf6Fic8ifz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mbGE39Dr; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30795988ebeso62708921fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 11:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740512437; x=1741117237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeJ7a/9Q7Y4DFP2keHrgY23a3sacV+V2x1QKfVZGDtA=;
        b=mbGE39Dr1tWrw4kNUYKlPfFbtUf1X2f+mtR9hZh7h2TsTbtSqmsyaCDoPCE8eMfb/4
         +02jEnPs6u5EvBXpaqPDQsDx/EV+sXA8kGZyh3mP59W0767HBIZEAEoiH6frOteKvyJR
         PrlM5Ld6/Sp885+VArpRCnS7Xg2wIKeCVWVnClB743b3nG75yHAgQF6Jpq8He8d68Ew9
         GkpRjR6xATOeR+rZBTH3cTIDol6xfb5rsRA08m5ZwLYuJ+CBDe+KnyEL/F4cu7L2nt/H
         xil9fU7yqVU/hfWI6VtPp23Jw4vGr9HWmq6Mx+jyNFq+XusLIfyET1ohywYDRUG7Re7W
         g5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740512437; x=1741117237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeJ7a/9Q7Y4DFP2keHrgY23a3sacV+V2x1QKfVZGDtA=;
        b=wdBACoznn2KpdOK2Gd134zDebafZKUdGaXwMiDZ6fUgpRQVRImxrbxgSjjjCH9wdbG
         NxkMnjtF5sNlxSIncO1Bzam9VgYTUbPYlUPrDZR+BjwTdvUFL9VpIVXJqvDyzVYc8j6i
         tCU82Iotx3Yb1j2r/7oryMLB4kgqG0ZkW11qiVbj92fIHISZoYfKQ7TD5xI8DFW8LnHF
         610oRWZ5QuflKuQjgQ3UTrYtDCMVFgq8IL2G1/Mqimc3FeuNb+uhmtXiOiGqhDSeOxS6
         yN0z3+Wdf5Qe+bKkGrtz/slFq2rr4iVyxOBsF347WwvIEW8TUDN4CnHaDYFengXDDjK8
         gfIA==
X-Forwarded-Encrypted: i=1; AJvYcCUqV1iZf9BhdX3v/uws4lCpsc4sNVkrBIy/6YcA7p6Kos2CNtdg5y0MkM5TFFYHaLtFbHw8Y9LwxMho@vger.kernel.org
X-Gm-Message-State: AOJu0YxB27g1dlnhYL9mMOvc9DZxhpUmPKfatzMgmgR4c9NsHK/YvEFJ
	Zzw8P60Rx2CbpqFYLoZDH4Oc65mBEgE82jRnKyxa0yrgIX94ZSnWxtF4j26XpD0=
X-Gm-Gg: ASbGnctp6zHwDi86oeUY9r6ZsWLit/05987FKaDz7PzNo0EvLGtRI27GRwJFEkxX3B2
	oJeDoGTJdDex1Ckq25K9ykK9WRpD0xyWwIUeZv9vAbbSP1p5xOrGIVGVQRrsjW3EtyiAumydMwZ
	tNpSeyP0KhyHIsWEMHbizHdyvURk6paDgeMHfza6LOIY8Tkyh4xFQ4Xyu5HjrQp6D0pu/kKHO32
	2V4BLZPWQABpOuCLI2fVgEioi5QaQ/sIuObpMjk8MVWTvXyYOijMmr3vMRuHmMhcwaYS1GFPGxr
	axMHWSRze/vzuHJ4hee/xGYCLNS0NyLKQI4n
X-Google-Smtp-Source: AGHT+IFTqWSZomOSuAP/ATSSMRp65Ny/RXKj63O0ukDsYSnOg9Uk8nYn334WNgPzDBBDjL7898oKJw==
X-Received: by 2002:a2e:321a:0:b0:309:bc3:36b4 with SMTP id 38308e7fff4ca-30a80c0f0c9mr22439111fa.6.1740512436920;
        Tue, 25 Feb 2025 11:40:36 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a818164e2sm3089721fa.0.2025.02.25.11.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 11:40:35 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 20:40:33 +0100
Subject: [PATCH v3 1/2] gpiolib: of: Use local variables
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-gpio-ranges-fourcell-v3-1-860382ba4713@linaro.org>
References: <20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org>
In-Reply-To: <20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org>
To: Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2

Instead of modifying the contents of the array of values read
in from a phandle, use local variables to store the values.
This makes the code easier to read and the array immutable.

Reviewed-by: Alex Elder <elder@riscstar.com>
Tested-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2e537ee979f3e2b6e8d5f86f3e121a66f2a8e083..86405218f4e2ddc951a1a9d168e886400652bf60 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1057,6 +1057,9 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 	const char *name;
 	static const char group_names_propname[] = "gpio-ranges-group-names";
 	bool has_group_names;
+	int offset; /* Offset of the first GPIO line on the chip */
+	int pin; /* Pin base number in the range */
+	int count; /* Number of pins/GPIO lines to map */
 
 	np = dev_of_node(&chip->gpiodev->dev);
 	if (!np)
@@ -1075,13 +1078,17 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		if (!pctldev)
 			return -EPROBE_DEFER;
 
+		offset = pinspec.args[0];
+		pin = pinspec.args[1];
+		count = pinspec.args[2];
+
 		/* Ignore ranges outside of this GPIO chip */
-		if (pinspec.args[0] >= (chip->offset + chip->ngpio))
+		if (offset >= (chip->offset + chip->ngpio))
 			continue;
-		if (pinspec.args[0] + pinspec.args[2] <= chip->offset)
+		if (offset + count <= chip->offset)
 			continue;
 
-		if (pinspec.args[2]) {
+		if (count) {
 			/* npins != 0: linear range */
 			if (has_group_names) {
 				of_property_read_string_index(np,
@@ -1095,27 +1102,27 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 			}
 
 			/* Trim the range to fit this GPIO chip */
-			if (chip->offset > pinspec.args[0]) {
-				trim = chip->offset - pinspec.args[0];
-				pinspec.args[2] -= trim;
-				pinspec.args[1] += trim;
-				pinspec.args[0] = 0;
+			if (chip->offset > offset) {
+				trim = chip->offset - offset;
+				count -= trim;
+				pin += trim;
+				offset = 0;
 			} else {
-				pinspec.args[0] -= chip->offset;
+				offset -= chip->offset;
 			}
-			if ((pinspec.args[0] + pinspec.args[2]) > chip->ngpio)
-				pinspec.args[2] = chip->ngpio - pinspec.args[0];
+			if ((offset + count) > chip->ngpio)
+				count = chip->ngpio - offset;
 
 			ret = gpiochip_add_pin_range(chip,
 					pinctrl_dev_get_devname(pctldev),
-					pinspec.args[0],
-					pinspec.args[1],
-					pinspec.args[2]);
+					offset,
+					pin,
+					count);
 			if (ret)
 				return ret;
 		} else {
 			/* npins == 0: special range */
-			if (pinspec.args[1]) {
+			if (pin) {
 				pr_err("%pOF: Illegal gpio-range format.\n",
 					np);
 				break;
@@ -1140,7 +1147,7 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 			}
 
 			ret = gpiochip_add_pingroup_range(chip, pctldev,
-						pinspec.args[0], name);
+						offset, name);
 			if (ret)
 				return ret;
 		}

-- 
2.48.1


