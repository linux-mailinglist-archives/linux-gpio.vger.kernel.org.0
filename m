Return-Path: <linux-gpio+bounces-21004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF06ACE158
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D26A01762A5
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFE118B47D;
	Wed,  4 Jun 2025 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u/3wSDI2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5AF1AF0A4
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050761; cv=none; b=fSOxdETFcjzcFEeFjC64LnRe3quD2ILCk5q5c1iu9vEdfogQS6mvSS2ToS1/Ky07fwHs5fyN3AoVlDZ6pS7Ta/7ic05Su4sfZSyI6nCXPgCNPIyiaz0YY2wrSwGRWSRrhkMQc63TFQWUeoquSoRcqUpvcgupVw878YaAmgH9FWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050761; c=relaxed/simple;
	bh=38iyypFvEIDDo+XViI83hfrn7fp3ROVaa2JyQWVHtXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fJEimfwPol2btQmxOWcONCXIQC82iVgstS9MwxcYplJkirXXKhOCzPFYnVtpkugSPboNa3CX3LqPGumFtfWFw5Vv7HpCh7Xh6REcKM6eRVoTPmIQsql7591c0WXVAomM/fIGMuVLhUvVYSAsBtF241E3z/pLPxYc3yMTbc4MQ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u/3wSDI2; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-604b9c53f6fso3379639a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050755; x=1749655555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHL3sUIzhoW/yqDxEI2huZEz7k/6gYpbh53sq2QOYGk=;
        b=u/3wSDI20VetYzJBc0CaJdFq5W42zu+a5LNRj4z0kHkGckg00rVca3cQOl5nPmSfSr
         bW+S+zUmlhp+0T24YBXIfkzPdEjM2d5J0qdOdaJHwcbFUPC3I2jOZ8TSR0nWrMXs05Pl
         ZcynzZnVRH6btyyKRlDBgS6G+dptTK39xt8lq3EU0LOH+le1PWzI9z8WR8Rtrjly01Dr
         yEsJGISZs13eStjyQwFtTMgR7Zwb1ekeQo4UZ+ViijMuDoE1MA6G27uNtolX7LPttC75
         BkMQwq2LydaxTiBppH/0AB5s+sGko1FwGuBR5Dpm1YexdMDud76f/pP0t4nYFGqf8I47
         RAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050755; x=1749655555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHL3sUIzhoW/yqDxEI2huZEz7k/6gYpbh53sq2QOYGk=;
        b=N/cKPa9rgbyrqmIiGE8ht5qLhrlZdsHInetUss9vOM1UHzeNms+eTkG8y+LCBw2jR0
         C09msXn66rlUHab44TDKeMuymPjM/y90Ygyz8g4mFipA1YVsBglIQNa9ZBONAeHEHtna
         Kqo6DP6SNjBojJGfQLcijHlfureCsf5deIVrVw8TLZzOi2CC7ungnJwOynwmbljdDa+/
         HVkcT1Jlmsa9F88jwrEUsWKPnOl0LJi04otjUdl7dLAYfr8gKzzw7Shv7hbmIp5IQF4K
         Xe7wGeRLypzxbnEgrqnIclY8rWMxpRruxamUp8GZn5DFXMDmPvxFHJQO0jFuGAzYMoi6
         uM4A==
X-Forwarded-Encrypted: i=1; AJvYcCWKG9UUNvlRa8/RrR8vP+dRT3tKWzUi5621E16HmIMo5yFr5Cc/JDafBbxx3YYIpqp2pqJr8o/kGcTk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+6FnLu1M29gKaHwL0+Pu5zQfg5TzJB+dT3cketrBG0UJNXpS
	4fvvCdn4RIqDNUh4sSWpE5U6ulbSTy+FY1ZawYB5Snqm6Aq0r+SZn9ZeIP+85J+t1Ew=
X-Gm-Gg: ASbGncvMMrGRUT4oZpoHT2MMKJnjRLSxHTuFLKdpvH3d4TJAklsh/WSGtsMXUKWfio7
	KBwBw5RadelqqyFo0itIplNllj14xwOCmZF0C6VJi7HApJkWRinRKw2hJKzgbMF1lQcR86MDrNy
	gUIHrOTD6Scoiu019Ecv/Bf8gK1Vbv2EVk8PCIIHWHDiEMNWYJtPsQCL5vmkk7GJbUL8/x9IuTK
	8pcE5M9qap0/QyZp5kYlVNo+o1nW2CI7u1D27o2ge+44CRHfZr7nT69LGkXIOmZkuk8fjgWOWoQ
	0AbPAXucmWvZkfdTwb5IP+sGg8qa3eGiOj8R8EFlf1AluiL9Fa7jm5bbARzd/H1EudzW3M7sb39
	/rO+uEG/a1sSt9Au794IB3FRhBSCK4hbp43k=
X-Google-Smtp-Source: AGHT+IE5xsg7Femx+fxJUmqis3En5XL3tdeKdVoLZHO6BHxnqgQt3JKQXfamnwt6W3l2CrMDnwEtNA==
X-Received: by 2002:a05:6402:348d:b0:5fb:c126:12c9 with SMTP id 4fb4d7f45d1cf-606ea17d2c0mr3262215a12.25.1749050755202;
        Wed, 04 Jun 2025 08:25:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:56 +0100
Subject: [PATCH 17/17] regulator: s2mps11: more descriptive gpio consumer
 name
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-17-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
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

Currently, gpios claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 3b5f6f2f2b11be81f27bc39d5d48005da4afeace..a1bb4e420acf23ed048c356004930c586d21b39f 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -357,7 +357,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 					   "samsung,ext-control", 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.49.0.1204.g71687c7c1d-goog


