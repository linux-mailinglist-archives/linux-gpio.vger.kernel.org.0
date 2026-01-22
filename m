Return-Path: <linux-gpio+bounces-30925-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ6pBA5HcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30925-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:49:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA7A69386
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F17713013273
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89FC47DFA8;
	Thu, 22 Jan 2026 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yreLf6gx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1DB44E047
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096642; cv=none; b=S7S8arwKFaSNHWC32Pqxenu/dfWBvoqyo6WSuajLLi8K/BW1P1nSEAU17EpcSMLuyfTFImgpd8xfJvnZw9Umkw5vwaGhtsjd2VNKjOqoToAt+dxaRpsq9SFOX4SPZfj3ZjBze5Dmr6C+644ALoKyzfs88FxWLRcRtb551nZZmFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096642; c=relaxed/simple;
	bh=CV/1AntRv4i6Nx8kbTbv/dJgDCUxidMgMOHRqzlspiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cA2iAdh34KnNLmxMHSRpFwejOONlstMJc3W2RxJ0LFgHTrJLETVW7sqDWSm+X4EUv+XpRr9N65/VUEUgK2mS4g6ltqZm3/L2idSBv4gfIyJDT6ns38yKGamVV8uoh4My8qlmdlyEy6iiFuUXr+AXZTHO4FcX0XeGhX6IFp+uMzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yreLf6gx; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so1943395a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096627; x=1769701427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0vnLX9gJoSUgj6PsEAnovUE20jhGMuNkb9xOcVBvuw=;
        b=yreLf6gxFTMDiCSuL/QPpteElIX5CalBHW6acpzCNfoYvNCO44mtHTgJR8Kloc3nqJ
         48CBvMOl6pMC3pDasDUaBZt/9wiUmdJUTmUWQ+OwGyWa/uWYST7raiDIlQtjzbf7gDg6
         SQq0I9id8ATFVnwepuAyPOtBa0dmLCmWvexMABxOSrhrX3GLNtDoUfnwa4jkEJWYluZy
         ZGt1E+Iej5mAY/8c1k+jXPpdWPK4eE7sIC00YzsqrBVl5yntXtl/E0nzwuPbJA0rk8UM
         W2CXJPvhvwXhFkoLcBp93vhWmLhtNW/BX+c5knis5MABOM/1yUocE4Vdvd26YlF0ex3+
         oC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096627; x=1769701427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q0vnLX9gJoSUgj6PsEAnovUE20jhGMuNkb9xOcVBvuw=;
        b=jAT8pYThLVOnwieYI1+/qkVUTTLLj4NO2+aDeoH3Vo3w8O3SwXSU5iSdNPKljm4itl
         XU62xjvu/ilvJsKVdYW8SW5Sy3Mpxa/jEDFvmdeLmkOqiNFsaRqYy0fUQaSwDlCAadGo
         Yom7zR7hjxzZnSoG3r0iMN0ASTmTAWToLcZAm49JkcxbGMk6noqBPpXIO2OSiYKRDcQU
         0hPcPZ7PRGmAlMqJFp3woxzrBvUcRy/z1Cyso91s10R8tlU08vzjWv2K3pYFwZJ8zqKe
         Cv/Psas4olRfYPt13/V0D0v3lcfXic0T/SHbW3tdYT/zMDKRLQHaT6nnNH7u6kIvRItq
         DqOA==
X-Forwarded-Encrypted: i=1; AJvYcCXgFH5PbbAAt30ihIWkSroV94Mh2vuOBMeBGpmXRh3QmzF9XkZnCxd6Au+BwGiweBm6FB8yV9DovAIn@vger.kernel.org
X-Gm-Message-State: AOJu0YzS1Ity39ZK0IcsssZ6olVILVUYmsY+JgdEyg1sqWcRPW//9fmX
	hUpaAoDgw8mC4C1aypWtg3E83iL60rkKmE72uwkgnlWW8RhTMnmR5OOTGcxi3bGars4=
X-Gm-Gg: AZuq6aKFl4FP+A53reTdvwMzWpfR+LT6Fi2FT6txEx3nUEQtX4fZ8C9U2znzr7ikU5A
	Z5IiMry1/WXrQCQrNfljPKkaA+WObN+k519lfNPPpHgh+XD1QjLG5/QwqgThz85OTeWQpPl2Bms
	ci1B4vjCB4Zo0vu5J8VcD2IrDd4SJRmlVYEB8jbDFb8IxtJGZkyKBk4MWhmSxqIYcs+imrPJlQN
	4ZJQ3twrquN0WsKI8LOi8TwM5VSiAkFoq9yWGLVg4pSmyLIOAtWyvvDsQTUgr7SZsiNli9UxQcT
	I9QPshsnLrSn69QD0nvo7saoU7U4s0EGhLHI3kg0JEsnOEA+rvfE7XMRV/HC7STv+intUsUPOk/
	Obi747Q9ugpvi3He7BX7erZUgRTa1IPpjvVHprgDFDX9p6jLhgN1zoDkh/wr4pCpOkBaNW56sIv
	78A/YX8jWRoGgT4p1X2HzY44q+zPBc55LU4TOx8za17g54SlaltT4MvD5qdJ/h99zobqO6AQmNa
	NVEzg==
X-Received: by 2002:a05:6402:2115:b0:649:a63f:bea9 with SMTP id 4fb4d7f45d1cf-6584879fd4fmr26109a12.16.1769096627408;
        Thu, 22 Jan 2026 07:43:47 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:47 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:44 +0000
Subject: [PATCH v7 17/20] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-17-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30925-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 6EA7A69386
X-Rspamd-Action: no action

The upcoming S2MPG11 support needs a similar, but different version of
::set_voltage_time(). For S2MPG10, the downwards and upwards ramps for
a rail are at different offsets at the same bit positions, while for
S2MPG11 the ramps are at the same offset at different bit positions.

Refactor the existing version slightly to allow reuse.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 0b6b28ce6465bdbc98ed72f627dc5565479ec7c0..5e35840605472e20019ef936d283be2c38146854 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -566,26 +566,23 @@ static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
 		+ DIV_ROUND_UP(curr_uV, s2mpg10_desc->enable_ramp_rate));
 }
 
-static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
-						   int old_uV, int new_uV)
+static int s2mpg1x_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV,
+						   unsigned int ramp_reg,
+						   unsigned int ramp_mask)
 {
-	unsigned int ramp_reg, ramp_sel, ramp_rate;
+	unsigned int ramp_sel, ramp_rate;
 	int ret;
 
 	if (old_uV == new_uV)
 		return 0;
 
-	ramp_reg = rdev->desc->ramp_reg;
-	if (old_uV > new_uV)
-		/* The downwards ramp is at a different offset. */
-		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
-
 	ret = regmap_read(rdev->regmap, ramp_reg, &ramp_sel);
 	if (ret)
 		return ret;
 
-	ramp_sel &= rdev->desc->ramp_mask;
-	ramp_sel >>= ffs(rdev->desc->ramp_mask) - 1;
+	ramp_sel &= ramp_mask;
+	ramp_sel >>= ffs(ramp_mask) - 1;
 	if (ramp_sel >= rdev->desc->n_ramp_values ||
 	    !rdev->desc->ramp_delay_table)
 		return -EINVAL;
@@ -595,6 +592,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
 	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_rate);
 }
 
+static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV)
+{
+	unsigned int ramp_reg;
+
+	ramp_reg = rdev->desc->ramp_reg;
+	if (old_uV > new_uV)
+		/* The downwards ramp is at a different offset. */
+		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
+
+	return s2mpg1x_regulator_buck_set_voltage_time(rdev, old_uV, new_uV,
+						       ramp_reg,
+						       rdev->desc->ramp_mask);
+}
+
 /*
  * We assign both, ::set_voltage_time() and ::set_voltage_time_sel(), because
  * only if the latter is != NULL, the regulator core will call neither during

-- 
2.52.0.457.g6b5491de43-goog


