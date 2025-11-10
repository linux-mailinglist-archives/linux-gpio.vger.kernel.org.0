Return-Path: <linux-gpio+bounces-28312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CD7C49077
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63B31188B1F0
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B3B339719;
	Mon, 10 Nov 2025 19:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vUV2Dt3s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9F7337111
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802949; cv=none; b=WwFi3itn4rffOfM8rTcwcLOhCB6xPx8QVdUiXJRw702bUdCsj4DS+fdppQLWLzpGn/kGD1MDRK9+wuZJJEiUcQ68FH0BmLRi9vr3HpEUyNci2QkfVsSVk/OGtWFEDrcl52G9hnA1c5cUpWUUUU5s67YQq/mF2hfyEPhfjwEZUd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802949; c=relaxed/simple;
	bh=sy0Mp0CqwDgoRltjBRlKUqvsjiUqK2kn5Rq5Mvw2mQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHkZt1trAq893KCwTsA01QNw7HihBP7xzPzCDRzCk6RDe774DF05I8MB2iC38KHw0CW/RV/X7kk9+LdF1bnB2EzI+gITNfH17Tou+xF/KedvpNBU/wawjvgmzsMGr/F6W+i9JteoLiJeMp50dRianJ6hREFPQHJ+GTRtc30urGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vUV2Dt3s; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so641550866b.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802944; x=1763407744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXUT8MAbGwFt4h3FDr0cqS9skzUUu9SY72yHCGd4cqg=;
        b=vUV2Dt3s6FkiygPMAn+cy83drpI7k1DEv9R/dK1v3nF6KqUqQA1S66UNngo7d1rd8C
         rk7dxUYIPntPtZY9wP005bCVLIa77OrHrFVcuXKA2ZtDPAQhF3HRhXGAjHHc0Vl7CwAx
         ksOYFaPSTohjUKhdeLTLWUr3nh6ydbXfrK1BHJV6e1eZQT8LJ5cGMUts3FyQ5g7m5T0b
         C6iQVuxmgL/u1VTJjJa6I7KU2BAJKmpllEXTgFeqiuWpPnd9oADxm486U2KFbS7ZbTL/
         RD91C7nTZNiwG7Q6yDNEcOr7PJJ9tcW8weUGjTaJK7MYcW52DBu/LO0+KFgQg+9iSWCh
         rF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802944; x=1763407744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DXUT8MAbGwFt4h3FDr0cqS9skzUUu9SY72yHCGd4cqg=;
        b=scKWQmb/gBBKkKT50mGRaBT+jtXqE00nvw0soHMi+HLXbsMY1UfCwyltY7eNI/laS7
         2y1FZ5tTrOSl4W9fWlRgiYrH7YMDx4ZvK0eAB7VSdxWKhT/nsaBHakWn3ixbZFspqukc
         R3YNI/PXtYgCaZoY1felHPaMj9haw03WSo3/GFp1T7gF8+ehF/xiBzMyh4yXZIxy4qlU
         nB70Zdqe1/6n5nDJWpSUE77noW2ydJToy2zilT/7N/EPMy4Xj10v7m8nUftw4RTaJVrj
         xbgl3ahkszBeAh/gpCAaaqMyWKaSMwmCXCIDrdCeo8crTubFXL52hhfq1uxP0YSeXGZw
         Cfxw==
X-Forwarded-Encrypted: i=1; AJvYcCXYRnoYC2VU1UNew0klCM8gUUrlNyfTpEyy44D3ZaWNNf5DAmejexRp6RpeRpgpsuAwyoWKVapVz10m@vger.kernel.org
X-Gm-Message-State: AOJu0YxWD+IzQdgyXaBrwXs24TerJ0pATbkK7nfeZ7MA4a85aGqSW12W
	aXJq7SPJGSaJSHBCumGU7IDpz4S28AvxnpYVSzEhSMemNEWIy5+gnZj/6x1GVX2IEqg=
X-Gm-Gg: ASbGncs2ayburOzoFjzmhTdS1rKzgjiTjyix6QQ++WZuBxtq8AyoO2no7pJYT9cZ/rR
	XGa3LHiuI3TFaoMWU6EjjxHYfxSC38L4bFIKPApYuNiiJ0V0ys+Z4CMin118F+C8/VwEkNgl1SL
	c8i0UqlTRttcA5T82vcBDOtvAVPbuAWiYHN2v9NyCiw5xCwY4403+MEvXU4DuA2biSvnlmw2sMd
	DZVgKFQB9OizhDUrD+NkGWIWS5h5IdiQ5GWEmM+t4d9s6b2d0WemUukk5fPwvMSI1sZaAeAwQF0
	f6Czf2FKLPu2oQ3/m+i+Pt/oa4daRw9Q5T/XyyfQSUvQjUM1DRuH/NhZopyRfwCz7fYlRnmrf/v
	6e+VMftiIKpoRxfZNjSvHKCm0amA3iYbssWvwKzLjKFGhSm+jy5AxCedJq0Pk/QQBO86sJZsVtD
	aziJ5kE8LA0PNklthtqbFGShEHz+8he5FgEl+CkYPw2XvuRaPykuxIcDdFOIUI
X-Google-Smtp-Source: AGHT+IEZCZuBttQZxzxdOT2T2JySWL8kFMqsfx/CDCdf7WzaLQnmas8T9ycXNltwEnGCHOnuaD/I+A==
X-Received: by 2002:a17:907:3e85:b0:b72:b289:6de3 with SMTP id a640c23a62f3a-b72e0623fd6mr993695366b.58.1762802943576;
        Mon, 10 Nov 2025 11:29:03 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:03 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:51 +0000
Subject: [PATCH v4 08/20] mfd: sec-common: Instantiate s2mpg10 bucks and
 ldos separately
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-8-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
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
2.51.2.1041.gc1ab5b90ca-goog


