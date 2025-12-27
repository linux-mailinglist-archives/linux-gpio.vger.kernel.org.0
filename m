Return-Path: <linux-gpio+bounces-29930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C4CCDFA83
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 407793018D5F
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5A932ED2C;
	Sat, 27 Dec 2025 12:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+Imsscd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F0332F770
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838276; cv=none; b=Ce3GtjWwlk55FvI0Gz6cfTbzbH8pyagj9q62kKThmAUaSy6Xtkx/o+zi76gZyn240mFCCzxZFUu+wDVSpvy2jqCI2Ng7KtC2SlYZgk5ugW8IgTBnEILcZgpzHrGe/6NwtvnS42ynxDgf3geXkD4UQNPLqsaLySAoH437uQtQoVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838276; c=relaxed/simple;
	bh=Sa+/EIvgfLeQ0GYvhvwXdDpmw3zds0mNO7QpOW7aJP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4IOOi9xTf1ekY7LlusMQGO7OqyXAoYb2TxQxFP4sLzbUnJLO2354QVPvyg69DB3/b2blhuKTsH98Lf8WxLuDF8PFbvnvKT7AbFivVuXZwI8koWqDF1u84s4SoDVzu0o6TdNRORq/FctJL4pTcuf/DjY9Im815jjPXW6pUBKDIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+Imsscd; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so13008447a12.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838272; x=1767443072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EsAjr4P9fU1lByYIXjwfOyDc8iScS+Mv0Ho5Wv25Qo=;
        b=q+Imsscd6e3Io91cQKSmMv0AG+p7pknEnMbtNQPVu85ElFe0qpUPeccsUfzPzW5gNm
         3kW95v4PIALX8ZRw9IJDkMuFdFslgB9iaISpxjCgFKj8EaUtikf1yWzuAJed+wDCElFK
         XFTCNNH6S7q520+Wr0xyD+92RSGLFfTmLQHNMYDQw2aAYZe81rLrDxONAwboxzu1i8AM
         cm+9l6AUuTTVN84Zrm7O7d3GTFZUZ+XS1Rr0WNjbL8JI78m5P+ItVAe+nfQUd4Yl1/hn
         GWErdSDamiQJm0did2yucRI2NYHEaHIjV/9+b7WK9surdmEw9pPTSPTSX3CtVVyFdwmY
         BO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838272; x=1767443072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2EsAjr4P9fU1lByYIXjwfOyDc8iScS+Mv0Ho5Wv25Qo=;
        b=YMwf/lzSNAmBXrDhvuNeB2xAbq6/cmapfKb2qtvPyiEIe3XOqtONsNtnpxF3L9dRjU
         JPfGry6xQXcWAC1ITlKu99mtKS7Wx1SZAmCqJLOobz5/O4ON2WVAjPYATWcPnveG2/hK
         xXxebPfGHTSUbrwe8YWTyQ/E8vFNs63AGIVcHHoVUCEo/KnJidJcO0FDqNWYq7cD2gnU
         xP5chG5kYyUB8dGYIDilrGJIy1ltrRJhdhQgn3iL5TBNzrKqepcQTgfx3prJE8T7hh2k
         bOzkWDvlYs6MZdiP3FSbPHNmF3cz3TYVAa4uY/EJHz2n7FXanMpjqA1fWLJ97MG614T9
         5T8g==
X-Forwarded-Encrypted: i=1; AJvYcCV9aXBhHjr+91YxsT5flzmIZeWsEVG6cDvAV+ZPezp6OJAfV6axKiJ4HQ/hD7Y/3wtjciW8Fybo5ljy@vger.kernel.org
X-Gm-Message-State: AOJu0YwMtmaj4DT9W0Ko8vLQPT8QbxGhBRVl+jDSfj57nvg+MhytaHWB
	7hWQeTFEy7M8LA+ZSwTnpq3uaEpHAoMVjSHKfsLcUG50xyT8bVP/2gOyvUKYaCkAU/Q=
X-Gm-Gg: AY/fxX4ucb/yIZBMBmqfs43C/C/8xezJgtkhmtWw0vXOZi0qpORuc13C7eK48uhsDCL
	FcJ++riDXppaVVu/p8jU/UyVg4CjwTha0NNgG0hRsWfcxq7iekiMtQX3gN350xLH2+MeYTqu5/8
	bsJjWX+F5I6oLwpnKdqbM+M/ceIJsmrDAf5v3OgV/85P0bqTl/r88BXprnj2rko62ksZ1rst5b4
	nKPNu5gJOtedOHlQAHb+17M/Nmww/HRZsb6f68FQ4KCqn223DSNTI8RPwcMQJ2hdXMCGd6yjhGZ
	fgcJeQ0uYN+hsnzHcBwNoeUz7e386a9B3tCWxCQHqfpIqjQ8YsQmSW8TIraWN5Wo9ujhos2gvfr
	GLDigcSaYld3fHeiUZNB3dr5PDehxEOABOE8K/KKkUBwQ0yLTkN34zXlD2b5k6SAt9oWcXXsb3O
	DKOoefyBzMmcQ1eeagCEztW+Znsnk/R8/uJKpM77a97P8rRJDmP4geNNAQDNt5leq4ekjpUBlQR
	YPDNA==
X-Google-Smtp-Source: AGHT+IHjKhYBTBvWqO2W8/12tTR4DWjtT3htxTA2IN9EmSRdLTSfBMLtisk7LyXjZOtzhcPGroxtMg==
X-Received: by 2002:a05:6402:1ed6:b0:64d:1f6b:f59c with SMTP id 4fb4d7f45d1cf-64d1f6bf81fmr18185315a12.32.1766838271649;
        Sat, 27 Dec 2025 04:24:31 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:30 +0000
Subject: [PATCH v5 08/21] mfd: sec: s2mpg10: reorder regulators for better
 probe performance
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-8-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
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


