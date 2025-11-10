Return-Path: <linux-gpio+bounces-28314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D67C49087
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 527D734B1EA
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A5A33B6E9;
	Mon, 10 Nov 2025 19:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="itFrFogV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714FD3358D2
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802953; cv=none; b=mZ0FRJtLUu0e0dcC9tAsiqcY10n9Iji3x6hjLKKAWx8MkM61Sr2BXBP+vUKBuqFz8iVz8iml59Co7NQs4O07tkM/ISjrT89fh6mLgPyt3lYYLY6WaXc1EGI1euJNHklZ0AuV3oTjwsPvweVL0pPfBeqGBG2seQ2wEWGyqfxudYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802953; c=relaxed/simple;
	bh=yoWFkHZtj46uF0EW4nm1cAv2iisUO6p8mkGLUTNAWgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QhCmxTKyZ4V5akrCsBjk4lSK7+rOr2Qj8AMKYDrSX9GuxKCWUnvVMFar2XTnNzqEmt0aUYeoXCpRPR6Dlb949CV5Nvib9zBkr1+iqi1jbonkIMJLbYiQ0cWBoUs/d6p7ANhceRIMIhiNoJghllpeyNoA3QkwXPZDA+8CsQTxt9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=itFrFogV; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b72dc0c15abso457391166b.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802944; x=1763407744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeUUtxVE/l6U3rYNomhig7G5mdbpyNRzMIJHR6C88h0=;
        b=itFrFogV/KrC/in+avJirWHOwVJ+Q5l3iUoUyFof7/SfYtLzSplG4s/BFB/X4nxpuD
         hyLzMjRt1/Z/yyxWwk4kjdsRcCEZQFCC6na3bNaM6kfagFMh7Y64kEVs6h0NeV9VlHuq
         y/cjje4pn+yrTBZCAU4L3/Xx4poJvJZIfSr3bd4yzwrQ48wzv4kWKaSZ3J4/zJnvWfsE
         8rruJejsT/3yrCu9ztIxDdWaireLL9yUcTFOLgcPGzimVZcJ0K2t/2yCpAziOPj9WNST
         b0EJPpSyTm58nw9N3QuEY0TunEFAOHoutGb0XupnpNrx/q7X0XWoJW5ZoqULvXL8sM0K
         YyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802944; x=1763407744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QeUUtxVE/l6U3rYNomhig7G5mdbpyNRzMIJHR6C88h0=;
        b=pmlNAj2fibEvdwSAbVVaUW8ox/vXNRvzwU0Gc0tY/VvOdq2Iwwec4yLdrI5kf9QIPj
         fYleD8DGvdKTXyo1zV51Gwmw7tX3ohpQo1tfOMkHW9YNgoVw0jAoj5whk+cV7wP7kITy
         Qigi9cTfczPaRxt6RT65EGfwZL2Bw7ZNOVUk5rlm128raDfTbtEdTCAEyVwyqPnLC5/9
         nRZxwiSJiVezNemb1PaUhGy1f2A6j6U+JJpquBClC11UKKZiB7cCmUTkufY+EyJq5aP7
         3O4PFTMZhLtLC2icOmj8aAl3JOW4w0XaW6h4l/8dNME3HbfAqpgkHi4tqa9/OSIyZORz
         9JEg==
X-Forwarded-Encrypted: i=1; AJvYcCXCzC9+UQDmADoIB4LW4ZdZfP8tZ5u2QiGttXqS0efHHYeLVuejPz2xfit40RvKOQJXi4Cyurd9JuU+@vger.kernel.org
X-Gm-Message-State: AOJu0YwzgkhPs5RJELJJxUpG6csBFrcGpxnwYoFo7RXZAvjjAhFRcl8t
	u9LFcEUd+1i8qEgk68vRSc+7s4xc44kR+xSkI3boUb/SlQzu1CQqdaXU7gThJRn64ac=
X-Gm-Gg: ASbGncvEBEpuEsaZ/700dwtbyyX7lVHmh2/AQgefgLE7FCabnDeODOsATL5dF86LEJP
	/SEctk2JUZXoR0kKu4AMaZj8NPmJALG+YuGd5PEQ/1f+39/Wf8aas0yHYNmnwg5ksgQmFk++Am2
	Jn5YTfjGItz7wyM3phtno8ZsYD8EM07m4XkrV09/Ah7EA3tvQb+AEuqMJVhtAqzahdMNG5sP+rm
	sztYYGqWI/sgRyXO0km351zmobX7wN4/WXQqiZgZToS1HNIYI3V5brBWJ6EGdvYU76JNZdbwwL2
	JdDD+1RR3mZqOthzhGOT+O/lvdVbSGBku6bf8eYrK5lbAB0O0kNdDCWhJwyzun2eSc5NLLksX0B
	y70kLxRcUEDM0khCvC/Zow0JghFo4BEi6CjeHkqLnzXLzCUQC3JrL99ThBdJTMO/sQATyr03ElB
	fib52jwXfp90b8tWdeCCkIlQRluJG4uVFm/a5JmKCLGmzqtLFH/GZSDvN98rqsl7E5Tonmt1A=
X-Google-Smtp-Source: AGHT+IFCwxqLkhOuR1fLThDVMMelLXW67BZ82zG7gRYpU2TMEHXfkTI5mn6Zu6XtzFQ4QrsAm2NbOA==
X-Received: by 2002:a17:907:96a6:b0:b72:614a:ab42 with SMTP id a640c23a62f3a-b72e0015fc2mr739140266b.0.1762802944631;
        Mon, 10 Nov 2025 11:29:04 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:04 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:53 +0000
Subject: [PATCH v4 10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-10-94c9e726d4ba@linaro.org>
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
2.51.2.1041.gc1ab5b90ca-goog


