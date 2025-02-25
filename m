Return-Path: <linux-gpio+bounces-16571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09591A445BD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 17:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D65F19C6703
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 16:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF5518E023;
	Tue, 25 Feb 2025 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p6GXzx9i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC14216631C
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500152; cv=none; b=Cp4zDFHxuwnAc9JbLRBwRf9fo5OfH1hdcupaB6RZ57pWyTZCdAXLhVZvZlt0Lyyq9GuWIrm0e0rXUsfWug/QFSsPMrrKiLCFlxgs9d/bw9BQL8+XXUwqE8r/s8nk63x68B58u47zdBt8ZC4hNEKmcRyIRAF6yPTw8No/zqhIBMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500152; c=relaxed/simple;
	bh=JnkVoJVEvt9wSbfZJwKuTmFUsqCBtk0hMWljeyVPBxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=teAE8k4bkPJi6c5PrWNZ1jEILGSJ+htcEkggp5xvDemTYVPQ+KCe0LpezxY2Mp/y/LHuX3SbjU3jSyRU5xbLJKuLp9sm7On8n2/P4tYwfuo8Ua6FddL2xPXjyGr0d1H6iPUaq4DZlwLWcL1z6pzisaHZSkTNEAjwLi7qtDg7y/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p6GXzx9i; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so6654351e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 08:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740500149; x=1741104949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeJ7a/9Q7Y4DFP2keHrgY23a3sacV+V2x1QKfVZGDtA=;
        b=p6GXzx9iYpSnjmUdXqZGTmVqpQBLTDDHDRLpx/LJdX1CQQOp3ELAcCbqz5eOu9LmgK
         p+exlB1R6hdD9a/Jfln+V/TABntrAOb1ytmIUgRwt/gTSpcOeL9EKwkHRRdMcIkvaA3U
         mQSRjROKc4/uVdMvGu1DpS7S1vjiDHC4VpCfu9lgSiolelARDyEw+RHy5WzVQZBoc6ln
         COkcnV25N9gMwggT0TqRASpl3f5co55QC1DnJ3jiGcGIeG3Nz61UvUEN4QjyzeQPuIor
         U7P8ys7O4hrn0udS0cDqZBCb7m4D4skG6tmNYlKDxEMWkIj7LzsxaIutvHqmsN5emGMV
         KsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500149; x=1741104949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeJ7a/9Q7Y4DFP2keHrgY23a3sacV+V2x1QKfVZGDtA=;
        b=ATINulVFTLyJPAdhPcgqdLyRAS/AO5Y3NnicfLiwfHVNd5+q+lDl4APv9z+78HZl14
         je/r5S2CBLUavbgVNCPflV3vrxCzLWiExTFQMsb8/mwIxJVK9xY+sXcgHKdUggLuxtuY
         v+hVM3F/cp678avVa5bfYT3Ll0yaG2dLYnICQ9e86a+eBrnDSvzuuSEaRRWz4+Zi12Bi
         x0WhgSiOdTV0p/G+/jBvZ4cZgChAlz4hmtDpY7pViRC8N8avkZ3kYgi++Sbm+4ElKxJY
         4EjswyHIOVjEONUR/PtCa7ipiKjtZGzZ2SGSfiM1Xo2kcsDnKHefrpBP2Ly9FVjUYNig
         ziVg==
X-Forwarded-Encrypted: i=1; AJvYcCUxSZ1jbajBBykk0Vo5L8GB0ZeNAwM9b9POlxCKAjxLGvMEQG0tS45bXJTd6IThwhJTlrTC2KTFu7DT@vger.kernel.org
X-Gm-Message-State: AOJu0YzqUYdhnVVWUWubfOAEVnAwwi8ROO9JUg0tKcQUD0brzZKU9tU2
	tYxSKaSsV+E09zq8jWEHpPTqbD+53FgagOvDCS/T+H7i3F+JmlnNP955sdePcZI=
X-Gm-Gg: ASbGncu7aqjo3XRdG7WSCKe0lm/xHyluz5ODfElBr753sURryEGhmaT1qbMmgwnHAbA
	t9wzECb142LsysBZUHvmVZkUDyBA4G46+2OfX/MOImicXs2qfp03UCfNnYsKjjNJneO2TcuMRhp
	7QN0Sgc+iDOzWlSlXgOH1vq4oAnBTmPocuULk7lHjoVsNY1RJDAbZVQEb7Pt9TIq4+yqXyht8pS
	SPaLBIpmd7PzGmhH7F02X1e/2HDsWe73rF3P5QIOvwGSbjZjJOA17JY6n1F3X46soRjbDkpEbWs
	d3E5xaCQyKpPAE0686zx8AOAKwhE1BZytBI4
X-Google-Smtp-Source: AGHT+IHDFqFy5T5AX9GqngoqEJ/mxO1vDf4PSBGFifn5ldQ4LUId8AmEPiotb+ECWFs58w0ck8wnLw==
X-Received: by 2002:a05:6512:3b97:b0:545:d70:1d1c with SMTP id 2adb3069b0e04-54838ee2993mr8619007e87.11.1740500149027;
        Tue, 25 Feb 2025 08:15:49 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f512dsm212587e87.178.2025.02.25.08.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:15:48 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:15:46 +0100
Subject: [PATCH v2 1/2] gpiolib: of: Use local variables
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-gpio-ranges-fourcell-v2-1-8da9998fa976@linaro.org>
References: <20250225-gpio-ranges-fourcell-v2-0-8da9998fa976@linaro.org>
In-Reply-To: <20250225-gpio-ranges-fourcell-v2-0-8da9998fa976@linaro.org>
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


