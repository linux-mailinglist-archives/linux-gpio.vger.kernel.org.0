Return-Path: <linux-gpio+bounces-30124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B390DCF2986
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84A23305677F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC4D32D0F2;
	Mon,  5 Jan 2026 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kpym1xiZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3076F32B9B9
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603711; cv=none; b=HeNJma2iPb6qqNmfXU8fz5sKivIRTp5SOqko8BhYkGWIkVfTo4AYPZ9RiNqHJNerOdlsYMk3gyKRwJE9QJy0QDNX9FGT7KKJwgZH4+5uBpV1ci6deYXUHojoKYqDu641yDQm6pLwT9RMTjBkheyVX19kYr8yskLWxOBS9ZBMpYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603711; c=relaxed/simple;
	bh=ZETZajMfvd5Cj7AwABnaIbo8YXi84LCz2hhmRM9mv6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pPnNdtL7OA7adMNRnAYqDpwuI6tDq8A1CrNzx0c7py7wTR4hwoX0dy1LyMnwL4mPGxPDZuKMKkYDU489mow7QugI3GpAFhTDwwL4ZfRRYZwkvYNgFcjIF0eCb9zrcNUkK8LAvPHkqM7hUpkZTWn3AVkNLWbK5pQL+YQr6UxJODg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kpym1xiZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b736ffc531fso2517322066b.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603706; x=1768208506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydYm6Jwl4gZ6fxTGOTSVWGkOP7GwrBDA3cOK9JtPOwA=;
        b=Kpym1xiZuf7cScimQeO1H/x48ruE1eGm8QYvaGfgU2fXZxLzpuuOnFhJ+1EBs1xjzP
         QaujlZYVxGg/h/y1JugiVeVo0CDtvZXhY0qtVWGOjgF3UQxuCnUtDwGBJWbQzIakKeZx
         daYKOAT0fvh007ZaiNjCyOdYJyMOgXg/kVcGqJdwtO1J8ZF8jT56kt+N5eBRw2nNaTQ3
         76xF3vFnHnqcKuMs/wIIqlhpQab1w7tfaCSBcfE4Ca2z2UCdRIF4uocLLsTxmp8y4iwf
         22WB9wHzgDq7tpJ0yGPJQK9sVVhVJCEVyy/BfBigZxj2rBvVX41owHbMBcyuZJOmZehp
         2GnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603706; x=1768208506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ydYm6Jwl4gZ6fxTGOTSVWGkOP7GwrBDA3cOK9JtPOwA=;
        b=irmJq+/rCEZia7raoBajCryoxSP23+Hpwsp6ne5UBuQsCqtLxoUcOUbFq4X4e5eXIk
         y4NXAGWvlRu9HL765cRY6YkoLUAYlf2NICYgVbYeur6/yCR6nCRohyAdhAQY/X/HIcc4
         OzuzYKVDW08xsVCsqRVYNJ2LTMQmGcBWmMJiEVOK2crCICX301spSUq+bZYqX0koNZgf
         SgZ4t+gS87IarC2D9ylrCffX7w76xz9aV9HRjqTynnBN5zZMD/zr6AlBemQdilMlF8bT
         /65H+IoS5G+FQ5WjZE2bDVm0YJdVyDbOi/tDYhQSGKyu+4w/4JZL4tEVoG5DGkrAHlZF
         db/A==
X-Forwarded-Encrypted: i=1; AJvYcCUO60G9P05il1NicUHj0mxyH3wwoMf9HTMIhOcZMH9NmRDk4h4lD2g+JMrcE1CibbZUlBPeJXw8hEVo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2b8aG9uLFXBPebO0UeOKp9Mx0SG56cpy8ROFHzFFCJzxeYM2i
	PBBfeOVKuL4+ANbV28AJ2Zj0PfA7+mZ1PHR5onAD7HYNo+EjzV3yRoS2tpnhsuIvGpw=
X-Gm-Gg: AY/fxX4nOlRXErnj7VjVndwtpUFVXq1BRIDrNWPhs0xadbiGBF2A+wr0QMTFt+AEUQ9
	3EWtOdEvT1dyxfHHlN4YvAnNOPRCNDwOvMJka9YExWB71bkye8QexzU8x3O22lfQnbg8QMM/RwK
	jf0zfFWm4vzQf3uqfgZI0ml0SBH/kr3/viKvblcI5hrHUMZRi7pskDYfjTe5WDgabBd5jy6Nc4A
	wCZ1f+vRuXwvfx+lIIeJMcq9a5eRAwv3YThVr9k45sCfpJR9dcWMlsBvG/At1Q2okGCEDzoJ7I0
	e0N2XBt7qEJd+f01eaOs4YQVnATZZiuFbTWtnY9adXFSXQyZv5w2B+xLu0Eh6pNn1cKJ3SzPRkw
	PsB7t6kI2UvgDGlOeSSo1Dao1Ij9Go9sz5mNOQM+2SfWUIa2hM66t4sfc3PsEqJCcVChmz/MT9T
	BzBPdZbG7tefn0EfANKhrrlllDaP957Nwp/ne83n33DBwty9/kaCg1ZW+tvLOkKlEGACbuLzY4E
	q0Ciw==
X-Google-Smtp-Source: AGHT+IHlDkTLEXnDdmXJOAB496ZocW/7AWPPvHl6kR9niuqDxJVFfo22iK/G7e68AW5rLvwMIepbdQ==
X-Received: by 2002:a17:906:6a1d:b0:b79:f8ae:a893 with SMTP id a640c23a62f3a-b803719d4a1mr4700447566b.49.1767603705564;
        Mon, 05 Jan 2026 01:01:45 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:45 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:46 +0000
Subject: [PATCH v6 10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-10-80f4b6d1bf9d@linaro.org>
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

REGULATOR_LINEAR_VRANGE is similar to REGULATOR_LINEAR_RANGE, but
allows a more natural declaration of a voltage range for a regulator,
in that it expects the minimum and maximum values as voltages rather
than as selectors.

Using voltages arguably makes this macro easier to use by drivers and
code using it can become easier to read compared to
REGULATOR_LINEAR_RANGE.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
While this commit doesn't introduce any users, the upcoming s2mpg10 and
s2mpg11 drivers are using it.

v3:
- new patch
---
 include/linux/regulator/driver.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 978cf593b6624228fe1fd9c2a3e186b53ef172f8..977755db64c6dfaea7246067eab0d9a2971caa01 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -53,6 +53,11 @@ enum regulator_detection_severity {
 #define REGULATOR_LINEAR_RANGE(_min_uV, _min_sel, _max_sel, _step_uV)	\
 	LINEAR_RANGE(_min_uV, _min_sel, _max_sel, _step_uV)
 
+/* Initialize struct linear_range using voltages, not selectors */
+#define REGULATOR_LINEAR_VRANGE(_offs_uV, _min_uV, _max_uV, _step_uV)	\
+	LINEAR_RANGE(_min_uV, ((_min_uV) - (_offs_uV)) / (_step_uV),	\
+		     ((_max_uV) - (_offs_uV)) / (_step_uV), _step_uV)
+
 /**
  * struct regulator_ops - regulator operations.
  *

-- 
2.52.0.351.gbe84eed79e-goog


