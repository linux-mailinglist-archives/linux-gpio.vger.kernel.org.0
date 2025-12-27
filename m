Return-Path: <linux-gpio+bounces-29941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E49CDFAF5
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E4993025FAC
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA2832E748;
	Sat, 27 Dec 2025 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwLpD/5q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A70330B37
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838289; cv=none; b=BYvqTLw3ybm6s0EWNiTGDVD6Yer6r1VWGnNkr/L7pG8s1OOeGkwamWE67e9t4KnudYunKa2s3+pWeF0J3YtDcEiOVfYd5SCyf2l32lUomrhnpFsiALg0MTWvK2NxAX8+4yAUpyQSlaiXBK3jEBJ/2BZhXfrV+9vhgtsPjDmVYf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838289; c=relaxed/simple;
	bh=zY4HDzqBb7/UAvPLwmWGSo1BI//NAtywMvqMn/JOYCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acB7rrU4BmJM033D3mrpVLbBoVWVT2teP4JZgh+qgzYsJQ2ydYgFmmX5JWDVrwQiMUqnKYGTzzP5DTIUKi236A5tHeYgfExY4l2NSc5mDpMxFrfTf7EXJ7H4fzunVwNgF4Qox6Ej9edo+MR6qzDX33ER5BzyK6eWR310Tye1siU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xwLpD/5q; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b728a43e410so1464638166b.1
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838281; x=1767443081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERvEdThlWsJXRM1ZMwEPHPXp21IS92Dke7PuPKQGFoY=;
        b=xwLpD/5qgkDKyLQpDuUWqEBnsrnBa5zvvw40CZ2JEnWBcs35b4+5E5yrfj3lftMRwR
         lKYMUY3iL+ygfZoxV9071Uuaw+BYFXnQk4zMSrYuZ/syAk7ymGNbCD1bUwIUYOAbymTb
         OjTJLkUF9YkNge9LtmNmLSM4Jq2SNWcF/z8IGs9m+7GDlTgiQd3glHB47QAaCY4mwzV3
         lRFu8hRbvMGRO+Q9qWlUfjNbKZ4LbwStwlk/ONOalhTlQVAuTe8Hxi89NK5rBgVtoyAl
         GtpBMvT5faDWNtAxpI4OrB8vvC8xa8lQFZxEyodZKkRHSe45sJB4wtDU3gz10E28aIUF
         IMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838281; x=1767443081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ERvEdThlWsJXRM1ZMwEPHPXp21IS92Dke7PuPKQGFoY=;
        b=lLG57vkyOral1OlyUMr9hsJ78ZNEQ7jRvZFR7y1d3aZR7fYFPubZizoupIdKVNWQ25
         +yp6jDwHY6DEQJdQX8Mfs9g/84xDybOgseCuJuIDzkQtGnFgDgbxSY87Hx5O0EnnoPCV
         +dghrcgFhJppsT4mqNB6vbxQ6riP/whth4X3e3eajcSHrKPqP029PdmU5S940akskaSw
         89brOLDSbJyqHwNYUjaJ9F3wXYIcWCuhNmhTmRn/bChBf2jhZF76px7T+s4DXRsOm7ur
         FwLp8hwn+RnuHUUc0ImXG8o1dV9iUN8H/63xfy2arZhetkByRMfjIzSHJUoFgYnuYaa5
         5Rig==
X-Forwarded-Encrypted: i=1; AJvYcCW18kk6+Rq+vRmnHMDfxYhtEigy9Uv0wSxFqjZN2FKuterQBTXHbD58yqpxRBYRNiNR5aGYkVrSRZwa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+X1/kbNwJ158TQLkY3rRYV30eaz9yAjivG+MHDrGmvwGsxbMm
	UfCD2HYhiNGxkdkkS8sc3VwyIq0LDY6a7c66lTun69gFdGWQrJthZP56wDZmBxQv04w=
X-Gm-Gg: AY/fxX5TexGzpeAYrIAfi9o887KkD5DzmblNlTsPZMOpkGSWtfXUmECDtLthvxQXwq/
	1Is1HS8lGjysoZJp+iL0Zp3yBAphND1huDqEQ3G4gZK9PMqoAxiYZixElZxuyqSsGt7M4I7x0E1
	JpjarYD3O7ulvbeS9mufxRJ/gV52uWh+A+OphzpINCt//1ha51JvqZGZYyKrvzlTae1DYKA0hDE
	fQCMbfwXaQzbuZiac033LB3vIFN+1HNigPYQXkr6l8+02ki1Yq54qYgr9MOUXFblLIL+SZLM2cJ
	i32BCTbEFTKNod7e4DpEbekqUwpOdMawNstR/OEifXYHgUubCfNccmTRn9DiilbONLymAfrm4du
	GA6s716wY5HwyiFMI6ST42LWPxZhid6JFpLvuet76MCRIekoKS9msf+bCRwN0mRRe7I+4TyAx/U
	RkWWO2DD+wU4m17DNjIQJRLnWziRD012Jj+8mSTHbdFUEfuoRDjaBomNuW5NlIeTfs8NsE5OwS7
	7AdfQ==
X-Google-Smtp-Source: AGHT+IHycmOXztf3tQPqUFMR3ZDzjnCJajLUop6kueKe0OALY79Qu3QaZ0E1mu52XExCIbSh/groQw==
X-Received: by 2002:a17:907:7eaa:b0:b76:d89d:3710 with SMTP id a640c23a62f3a-b8036ebbe32mr2775195166b.8.1766838280740;
        Sat, 27 Dec 2025 04:24:40 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:42 +0000
Subject: [PATCH v5 20/21] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-20-0c04b360b4c9@linaro.org>
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

Currently, GPIOs claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index f068b795ab51845bddac84eca08be0efdcf4f164..178a032c0dc192874118906aee45441a1bbd8515 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -362,7 +362,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.52.0.351.gbe84eed79e-goog


