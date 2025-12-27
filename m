Return-Path: <linux-gpio+bounces-29939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 489D9CDFAFE
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A79DC3026871
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C163321A6;
	Sat, 27 Dec 2025 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QgjuHIvC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2422132E72E
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838288; cv=none; b=PLam23y6E10Kwr7g5gFF5+3NZDxmCQt6OzfENhNp+BYznm3iYW7cMpkLXXTwFfYS00+/dsy3EIzsKtsWtGvojgmvDnoJJD1j9hfzelolvm5XDybW65w67yTGMTvp4Ri/6Pi+lZmFGf3RruxnD1jEKgZpU2/Dng5cm6lxPw+G8kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838288; c=relaxed/simple;
	bh=61ADjJrgT2o/i8020WOTVait6ro421Ajicl8SlsuO9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qICxkyUxDPqoJBSXQylAsK+VZTWv2KOaB2ePMRTseuhGTSd3+wxFfrJf5JbeOQDe6tsI6N5msD3KXtfoMiMnBDeKF2vqiI7CbiKxhBn8yPOdy2zNMwbPWev2a4q1l+ukPgaBn94kVa0ZdOuY91uwE5T/hI9tuDwNXD+eBVyb2jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QgjuHIvC; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b9d01e473so10537895a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838281; x=1767443081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RGJHpYPSzzQbbGCB4wy3BgFrQgesxTAcE0/qZgwEOg=;
        b=QgjuHIvCQ5py7O52/Jj4oZR6bhc4rf8+nVBWdogTfdPsRyC/OHquSadTl163SPvG5A
         WC9pZDOdodVBwMOWLdIjqDfI4jB/Qb7Er7CXvgSF37SeU8urtVHUDtY0AsI2Rm9wt+4x
         Lqp+yvsS1Mr1Fnuv+nlmaV13syk3+cgmJsQEoZizieoRVTEUSeJzfMMp3zGqLcJVsdS2
         znauhuMBjhkCbiTFRABwdht5p/l7tHC0as8ZmgWrSW97+YTbDbq7jF9Ak2ll+nx7l4D1
         V1XA8gtit4mE/Au8GeCuydaaIYGD3Qf5WKOK2KDV3QxR+qyxCAYldONbMzciJFzOB4NK
         DM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838281; x=1767443081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6RGJHpYPSzzQbbGCB4wy3BgFrQgesxTAcE0/qZgwEOg=;
        b=Nr2qE08gnwi3GkeXr+cxWOopXi9xpJQnlqNuNCSUqjbS+8wUH5I59U2G3dpeEt1Dt7
         xKVX/bjwVjPHUUiW+K/L68HaPZCYANHX2/biDS0wa9xig5kg1a6eDIsVU6omFUl5Lq9P
         HWDIBQvMdsZlh1lrhMcQgHwA4TzBQFrHxKlGuImQI5MddPtFdnV6YrZcmW6N7cW59lGC
         44B2NBZXbBfIWI8KGZSEPgyJr4gteEGV/A7qxA/XMwLj9dPkB9U0kinevi8duIaifXUJ
         5/a+1rIfoxTWtTDba1Yxgj0BlhVDGHoG7WqlHKgbhSAlSwoaxKzwb7nmo8EX8YVDZXQE
         BXuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEgDNYb3sEMotnXnOCjCatm8hOZHG2FFl1qpF0Y7LkMEZo4n0iUPygVOj1G8NN/3Koni73xx/WRTPi@vger.kernel.org
X-Gm-Message-State: AOJu0YxlGnI1d4jV79/Y/vt7cK5e1ENpKUIsfA1V+7+MpetKtuQb7xUO
	196XY19F06Kc4fd9dA8XBJH8+uNjhsRhlVgx0LFHBWazdNGLud5UVuSyk6uC+KWN/358ZNgtXVL
	iqo5WtuE=
X-Gm-Gg: AY/fxX5IXB888ImeqmIBg7TEBt1TpEEOONxJkFHzo7hYfmM7sRms9ZmlgFjxoewKTVN
	YfkFObpwK6FO5yjHphU8KSXB1KpFBdQsIFjskECO8oa/BRYAxFYD05EV++Z6bOWdHQO5/ad7Ixo
	bJBrhFlWImwNoWlRecclOeq9EzeSO2DiOEeqFdCe4/uG+YnXACCGl99e0F1yU5Hxc32T36OSLc7
	m8frja5ytKzc0L4we4vHRHg6DWbqiG0GV3aiO51zVEBtz0rdg1D4gg0WShAyjopmTSv9YxX3W1I
	wtfzi1FvMlwm+hg2YJxoSMKZEEnKmFfuw33NGZO1n7fUVo+mZsYjhryiLKFufo3YmqnLGJgBUkt
	1sLfUH+smAcaf4WDladf0dXM5Nlq4ZqwONGta5wANpWhKOac0wJTbd0iw6kyWHJPKq7xJd1NMbX
	rHoJgIQxqfoHXFtHXUl5AdhkZGNQ9Oc7q8bWvLEYjmUVHFT0rxyRTcLUCdyJXbeS+kfsEBDj+Rz
	swljA==
X-Google-Smtp-Source: AGHT+IEZhhM0KME5WuKQ84Ts8cerCjpsb60R6tSjSyudT0VTKXNA6pzXYu7jRUwWEVFLnHJWn9IpIQ==
X-Received: by 2002:a05:6402:51cb:b0:64b:3eeb:80b1 with SMTP id 4fb4d7f45d1cf-64b8ec6cb05mr22638603a12.22.1766838281265;
        Sat, 27 Dec 2025 04:24:41 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:41 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:43 +0000
Subject: [PATCH v5 21/21] regulator: s2mps11: enable-gpios is optional on
 s2mpg1x
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-21-0c04b360b4c9@linaro.org>
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

For s2mpg1x, enable-gpios is optional, but when not given, the driver
is complaining quite verbosely about the missing property.

Refactor the code slightly to avoid printing those messages to the
kernel log in that case.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 178a032c0dc192874118906aee45441a1bbd8515..2d5510acd0780ab6f9296c48ddcde5efe15ff488 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -352,7 +352,7 @@ static int s2mps11_regulator_set_suspend_disable(struct regulator_dev *rdev)
 }
 
 static int s2mps11_of_parse_gpiod(struct device_node *np,
-				  const char *con_id,
+				  const char *con_id, bool optional,
 				  const struct regulator_desc *desc,
 				  struct regulator_config *config)
 {
@@ -371,14 +371,19 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
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
 
@@ -409,7 +414,8 @@ static int s2mps11_of_parse_cb(struct device_node *np,
 	else
 		return 0;
 
-	return s2mps11_of_parse_gpiod(np, "samsung,ext-control", desc, config);
+	return s2mps11_of_parse_gpiod(np, "samsung,ext-control", false, desc,
+				      config);
 }
 
 static int s2mpg10_of_parse_cb(struct device_node *np,
@@ -528,7 +534,7 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 
 	++s2mpg10_desc->desc.ops;
 
-	return s2mps11_of_parse_gpiod(np, "enable", desc, config);
+	return s2mps11_of_parse_gpiod(np, "enable", true, desc, config);
 }
 
 static int s2mpg10_enable_ext_control(struct s2mps11_info *s2mps11,

-- 
2.52.0.351.gbe84eed79e-goog


