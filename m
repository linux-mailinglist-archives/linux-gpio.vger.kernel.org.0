Return-Path: <linux-gpio+bounces-11888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA359AD7CE
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 00:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DBFB2847B2
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 22:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D67C1FE100;
	Wed, 23 Oct 2024 22:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/B/d6Me"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0001FF03F;
	Wed, 23 Oct 2024 22:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723048; cv=none; b=dFVK4RalWOVyP4Ia+4gDC+73SBrGc4C7w2BwQfQ3TTIJSdMaAH1Xor44JyVTrmaRHEfBLK9/CkcK1VnzfUbIAcbwdWXTM73QNqiflHF7ywaZxeBSnkSK4Tirsv6grNwMUnSgckk3pyEV3uV3XBCH+EgatjUhk7djpXht3J/+7iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723048; c=relaxed/simple;
	bh=nQQbu4onLgjxpUEL6v69QQSst4e5z7h+LcPxyX3sihU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DfTv6uqQjr4e96TS0Z3hl0iBdgJ+YkNEuOslQjnBBxpROxyF0bF8q+n6qTz1uh3v1Hexv/MDh/WwSDRYSqRrvoVOCGoFpnBQgM3cqB9ztMW+d251TyOSK2VoMvkgBwpg6qkSQUqIv8n3PPK9XfH+26tKL2+r1RtC/cAZn0EDwL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/B/d6Me; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c935d99dc5so310066a12.1;
        Wed, 23 Oct 2024 15:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723044; x=1730327844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2XM3Jplq8/EbJJC1OO1W3bzQVXel65Gy7KIsJ85dgQ=;
        b=G/B/d6MeLZkqXvwWtZPZYZzHBxmSQDyeHDuu29n4AgDlDHFtlHqSXRrzXDuFwfhWPU
         DgKGGiAmfHFIhh4AAz+0IjLX8aPNxZY3buJ9Xqf9EkCscRk6Tv7KIvOVXjfIHnHiRl38
         6rscrlkBzHvnS9HWiM1WP2fnvafJyv3cPlWCDzn/V2dwW8SUXI8/gwm4sV5mKy9jFvun
         yEEy3d/YkFu61yEtnKFDZXCwl/z9JpT7kk2ShLNllgH6e4oKz0lSCUi6dDGXc78PGka9
         pxO9XbLKpyZS9m4/3XIYPCUsl/V5RJTOkH/yzoBVwrF93uBEF7N2vlc6i/giB5Xjy+Dk
         UN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723044; x=1730327844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2XM3Jplq8/EbJJC1OO1W3bzQVXel65Gy7KIsJ85dgQ=;
        b=kDW9gbBxZEfQN60J7S/9PkUXbJAgpZjJE/D5+QUrh+tIxN2rMxA1J1bAiijxzFdT/0
         Ekm0Efu7UnxrPtXe9xxxAblNB9KPZnHokbAZcKae5gVE/LfDOr8v7IOdX0s6MldbZeQ+
         15jkHzNxMqCpVFyQxODcWeLNEcDqn5LWGpX9xv5o5UQwzVsXp5f2H/hINg99WkrB9uQ6
         KkbC4bBizDLu+7zHMGAgqoFrEct019Y0Ehu60MsKsKVMxhibBvZch3mxTaNoa6hflnPm
         svv+xHzNsou2P5FUV92XM6KzXqNhmrnHofJaNkfk4w70GTLAOGfuVQuDQblzZdbECWTo
         mk0A==
X-Forwarded-Encrypted: i=1; AJvYcCVDLEnSsy/SlSxzHPt4FA9rEi384Kl1v8U0lFffSmmJYMPklvNBLyVxYvYAh5CFvZB+SLtBZQPP7BZn@vger.kernel.org, AJvYcCX0nbCeC9k+tSbhosFpTbtxV2C5097VlI+cTes3re6vONC6+9pFXQoSRu/YL/g70Rh/iaA19suJ/0yJ7V/w@vger.kernel.org, AJvYcCXG3sW9PV7Fr1bM5hU06zfJKmWTZ1h9cakR5APfILyTYh5DoRkoXXTvM7DP277W6xoY4MhNoLxhJw0ngpszcrX6oHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz62Y6t+OoSqX31sXs08H4svI8Kc4ck59lUZOKAEDlTOsZTt2yA
	8nQMtESZLRYGv7SjbwHm+YQLhCrzDHwlv7UWzsdr+NQBRuquoqfo
X-Google-Smtp-Source: AGHT+IGGOKlIqWKq/XzZ1d3yP1+cqdDO1i0NcdTYIW30vhzrfZLkX8Xf2wVVNdiDv/YUTtBY0MXIHw==
X-Received: by 2002:a05:6402:1ec8:b0:5cb:9968:b4de with SMTP id 4fb4d7f45d1cf-5cb9968b667mr889645a12.22.1729723044407;
        Wed, 23 Oct 2024 15:37:24 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:24 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:39 +0300
Subject: [PATCH 08/12] perf: arm_pmuv3: Add support for Samsung Mongoose
 PMU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-8-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=1343;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=nQQbu4onLgjxpUEL6v69QQSst4e5z7h+LcPxyX3sihU=;
 b=sg4+SVEsg+HRJRfFMRpU/sHqKpBVGugHB3ed5T9oUx8+nJ0XJggdevDa4myRkuSz1SfL+yGP6
 WR8EB+pYycNBDNOjXtsYSb3DW4MUeJ2XsnRkiExliTJTmN5cEUBU2xc
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add support for the Samsung Mongoose CPU core PMU.

This just adds the names and links to DT compatible strings.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/perf/arm_pmuv3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 0afe02f879b45a8600b9cea1bfd88e6a68096a67..9eb5603e1dda18c4bdd2745304737932a27fde8a 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1364,6 +1364,8 @@ PMUV3_INIT_SIMPLE(armv8_neoverse_v3ae)
 PMUV3_INIT_SIMPLE(armv8_nvidia_carmel)
 PMUV3_INIT_SIMPLE(armv8_nvidia_denver)
 
+PMUV3_INIT_SIMPLE(armv8_samsung_mongoose)
+
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a35, armv8_a53_map_event)
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a53, armv8_a53_map_event)
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a57, armv8_a57_map_event)
@@ -1409,6 +1411,7 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "brcm,vulcan-pmu",	.data = armv8_brcm_vulcan_pmu_init},
 	{.compatible = "nvidia,carmel-pmu",	.data = armv8_nvidia_carmel_pmu_init},
 	{.compatible = "nvidia,denver-pmu",	.data = armv8_nvidia_denver_pmu_init},
+	{.compatible = "samsung,mongoose-pmu",	.data = armv8_samsung_mongoose_pmu_init},
 	{},
 };
 

-- 
2.46.2


