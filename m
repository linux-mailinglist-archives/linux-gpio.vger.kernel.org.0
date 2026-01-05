Return-Path: <linux-gpio+bounces-30122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C904CF2979
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81507304F881
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BF632C958;
	Mon,  5 Jan 2026 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ghKjoxxp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC80932ABD0
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603710; cv=none; b=opQxaqlRXj7WLMSQ4ckxiXSf78nmvavrc3fMQOVxMGfjLybsihJjBADQyQi3Dr9A9Nfhlu6mQgyaR8cfN+Fqwn0q+l+wbh6Ypm4TvkJtlpbiXqKW26/8+uMRPiNBJTVIPZ0PfGCwQdkqtRM5fNubJKXp9+J/d2U9L/paX7USDRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603710; c=relaxed/simple;
	bh=Sa+/EIvgfLeQ0GYvhvwXdDpmw3zds0mNO7QpOW7aJP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HPberfs9VOQGVK4zPMujIyOt1qJVYSG9ttCRsLR4HqSD1KypN7LSYndQiISE5kbsA+OJLQXBgEh2znAnxbI4OMngJSRizWPYM0IcClQ+EwkbLHeXynRi6H4CxHrVlFvC0OBt7eMPvQHP+fU1xCCFHPLCOWkdWFkiCJD3JotVSLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ghKjoxxp; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7a72874af1so2341445166b.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603705; x=1768208505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EsAjr4P9fU1lByYIXjwfOyDc8iScS+Mv0Ho5Wv25Qo=;
        b=ghKjoxxpgGapqKcMIPuji8eoGIT0j+AYbbF9JiHVeRk4JbmxxNdjNJsEkewIWMowYN
         YThI87ryOqwdvHgfgfPKouXO4FWdGL5IFZOVB+Or/LcUCTs6HUn1XWLAWPxUAFIwvwvg
         XfwZU4upfhp0qv+nxGdHTyGZXWdg+sJbRNZZVySww1A5ZElg3oa/UvGrej/qkwTmsWJD
         9RLz7w5tnRElV1HZvnDbGewP7vY/jl5mTs/zJFxIntsHt10hOqGUCEOBaNn5W0o5Vs/s
         Us5k0kNURKu7H5k4iuS0oApjWkLBoHDJ3jTDxzg0Z+kOVcbjVEHhSWLyOugDCxEA0UVr
         l8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603705; x=1768208505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2EsAjr4P9fU1lByYIXjwfOyDc8iScS+Mv0Ho5Wv25Qo=;
        b=R/4IyDIYTnqA9jaIlYYgHYLMT1jUCNDuij7MuxsLM2vmTiuACVk4RkC4eWrhu1hm+/
         B5nuuOpDVcFNq07FLOmzyM0MzCoCEDobCDnwTr/Bmzf0ZOGlzZSx7XieeVl1O0bTuUEp
         cqG56q8mT1amsL3wvT/szSs6rBOeJPfF09Sbo+++VR+pyVMsw/d9qNHKVXotM3wjJYSM
         WrEqM9hjtcAbqD4RbV6tcDEkCXoyzmAtm6fx6DthmPi057M3wgPEp+61PIFYFJEbRv/D
         cXSzludLebP1UedzorLjCC+FVrCF8VIvy+L1x+B7W3VEGci9soS+9k5bPUJ3WmkB70Q0
         7IHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVseqQ+j15+plqqGdwE9a2L4a/rvDWTXHBV35ANssmnP4HsdYrUQllmrTrS7ouBLqz9NnFK1XXdI0PG@vger.kernel.org
X-Gm-Message-State: AOJu0YxgFQ/FCPffzb4AaTBO4j+529Ezg15iKjvQmUfzR401J8js1bEp
	4kDxiPiwdmsHo5U1iSpXMS+qJ1eKVZZY5JgLi5yaEO/CTGx/+mgdyz8xKLT5kJlyv70=
X-Gm-Gg: AY/fxX5sxYvMuyBe+rX8xRa5MSV1Ale/cBOq60TxgWvU5zzQshgOVoowbdHDXOQJeBY
	pWvHM9fREYo1j8W3r/zUkyp+3Yrjk9ETwpqR+ISTQy47MASst9cQ7RPGMBwvoIRjNJhIViLiaGI
	8bsPhf6E2bEvul13dbMZgscPDDnb3lsT8LApY9f+dgJPkU5hVCAjZoWacvqJLTsB0PRnzLjhJPr
	gZ8z56HWPi+ExYGUWu/RJH/+awEUv5F0flUXa89LRq6sfVxOMJ+qRdLk209eJUNTJAqKmwHouup
	Gva9vNgZK+6E2CX/TGtLw5ts7tgjkbEo5PQOZbup9XT1gfT83Lbjfh64TQWilvV/iRLwews2s8u
	GYgmxjwblZKUG6fTP9URklM0gGJ0Vn1qyM1uSZuYDfLbdeSZMHVUsDPKsvLZQYKVCI8XhTXzvWl
	ryx6HKOPauHzu0XJ6qFXinREYLXQNz+DVdbvcNOn4wfyHxo81qXr8uSyb3M4KdiTJb7kKvZzHNF
	RRMsg==
X-Google-Smtp-Source: AGHT+IGsg4QwJJ6nE7YlYsRudVVd4JOd6AfmZvrJr/Ta5DTxaAWNYoHtWSW1zCMbsyPo8hVD+zmlFA==
X-Received: by 2002:a17:907:948d:b0:b7a:1bde:1224 with SMTP id a640c23a62f3a-b80371e921fmr4785349666b.65.1767603704516;
        Mon, 05 Jan 2026 01:01:44 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:44 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:44 +0000
Subject: [PATCH v6 08/20] mfd: sec: s2mpg10: reorder regulators for better
 probe performance
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-8-80f4b6d1bf9d@linaro.org>
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

Bucks can reasonably be supplies for LDOs, but not the other way
around. Since rail registration is going to be ordered by 'enum
s2mpg10_regulators', it makes sense to specify bucks first, so that
during LDO registration it is more likely that the corresponding supply
is known already.

This can improve probe speed, as no unnecessary deferrals and retries
are required anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/s2mpg10.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/samsung/s2mpg10.h
index 9f5919b89a3c286bf1cd6b3ef0e74bc993bff01a..aec248c51f366359ff323f421e453a0ec1d1dfa3 100644
--- a/include/linux/mfd/samsung/s2mpg10.h
+++ b/include/linux/mfd/samsung/s2mpg10.h
@@ -407,6 +407,16 @@ enum s2mpg10_meter_reg {
 
 /* S2MPG10 regulator IDs */
 enum s2mpg10_regulators {
+	S2MPG10_BUCK1,
+	S2MPG10_BUCK2,
+	S2MPG10_BUCK3,
+	S2MPG10_BUCK4,
+	S2MPG10_BUCK5,
+	S2MPG10_BUCK6,
+	S2MPG10_BUCK7,
+	S2MPG10_BUCK8,
+	S2MPG10_BUCK9,
+	S2MPG10_BUCK10,
 	S2MPG10_LDO1,
 	S2MPG10_LDO2,
 	S2MPG10_LDO3,
@@ -438,16 +448,6 @@ enum s2mpg10_regulators {
 	S2MPG10_LDO29,
 	S2MPG10_LDO30,
 	S2MPG10_LDO31,
-	S2MPG10_BUCK1,
-	S2MPG10_BUCK2,
-	S2MPG10_BUCK3,
-	S2MPG10_BUCK4,
-	S2MPG10_BUCK5,
-	S2MPG10_BUCK6,
-	S2MPG10_BUCK7,
-	S2MPG10_BUCK8,
-	S2MPG10_BUCK9,
-	S2MPG10_BUCK10,
 	S2MPG10_REGULATOR_MAX,
 };
 

-- 
2.52.0.351.gbe84eed79e-goog


