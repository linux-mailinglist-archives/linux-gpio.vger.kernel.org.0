Return-Path: <linux-gpio+bounces-12076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6DB9B0141
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FEC92845D1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B6A206048;
	Fri, 25 Oct 2024 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOIYspqH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3AF205158;
	Fri, 25 Oct 2024 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855523; cv=none; b=H/DNXN0uK/HhM8KgLnxNTcpegXfLcxhvv4BYKZVwV8DVzMAqM7POGO1VDE7Rj0A5RAMdUjobpNhwTlrJM1i2YcbqTFwToR7r1oyXtt0zzusfihJqhynrmwZ1/rA6xQ0skCjB8j2jUQV2io4CyhfjR6QLa+L8XnTvLtNIDr743qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855523; c=relaxed/simple;
	bh=kyHAPTKZB5mT8XCJ0jyUMcgti7f6+k1RLiIUUCWE+Oc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVzWZi1R1cQhiFWEArGfaiszJWKlM6HJluQiXFFsAQj/kNsaVz0hmfH2Ux4e+WaQGCXW7t1iWgFHtGb0ij/ss5BXYyfvbQ3OGTt7wRAirJ8sRd3C/hUglcPJ89N2K7c6LLmlymmRKI7FAhKmF8CVEugRNmeZyV2hJy32wY0WFDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOIYspqH; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1844942e87.3;
        Fri, 25 Oct 2024 04:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855519; x=1730460319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPEW+StB9yri6/7vzc+p+9fT8+1vMg/ckd/Nh55RyuM=;
        b=NOIYspqHdGd3nWNlbq0QvOwxCencJjV1FJxPN6/k5/20rSv5zekMBJggeNkfMgHtJ3
         innA9GgPLyFY8wRcFdbdG65KUjomOqVkb1pMBdTlQL5f2yzyNC+DNs9yt4FHBhbyPDav
         vf70BELaQBIYIiazqApkOsuSjCafi2BvWDpmPOocBG8TO1AgltTqqcqr7Ygyh0kakBco
         ZtrmkloKASDaQX5llByus/1u8VM1/E4zqslxwhpjEkwkggENZlqLwSWNVqwcEJ+ZORgs
         BntGIFo1C5T2M6VrpKRfElwFGcwahPkqHXI3edI0FlebpeL9HyjLowkAxQ7d+aOI/Z/1
         gNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855519; x=1730460319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPEW+StB9yri6/7vzc+p+9fT8+1vMg/ckd/Nh55RyuM=;
        b=LOhdNRXmGEB89NcuqcjEdPu1AVw9Z4m7HnU3AJu/mVVQ6TdVM14hfFBFvrBgWo7Om9
         CTIq6wbAPv5MUd2QKVDuKwJGfbn35Dy5VneZE0UQ3G3DwQzai5k/kppvfTiInZ6RSMnM
         N1+AVR/GyM0ungZcOWXY4q+dD1jler+swyo494bx9ZZqxS099dgL9ZQeEiwE+KA48Cj0
         vYVkzGqsyImoDxoX5aTdRDLscWlp1hCPKoBDU4xZPaCMa6Yiq3jHSn4GQPuTwWvSLfUG
         apJJSz5XwzIwag+7tZ0xckumQGZhrXdRaZPGIHr+1gxZhmyr/RsSqNyENFqjzLStSJ/Y
         T3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCW+lisilSXECEQscWrHrYSZKxC//9iB6mU1s2T90EW+/W8+wEy43MMloySDwxCCS/dbi0Mg2rkiw00bi9XiV4VcJA8=@vger.kernel.org, AJvYcCX+VgptQlQ/DYflg7D0oa4zRUOF7ii6wJ3psC1jEn4Q3EhT60QvgmBZ32sdnht62cTo5DNDS4VXt+cz@vger.kernel.org, AJvYcCXO+yS+ZY+2W55NYGFTxMjgZCEjCgPVdVTJG2fePRPdekJkWWBlEFLGUS1frX8DYdacLJUDnDDCyvL2n7fE@vger.kernel.org
X-Gm-Message-State: AOJu0Yynpvhv09+tq+8QuQ6zHGK/ayMX36L/fhKXmPYI5xtDV3EDDk7l
	wCwjaUJ3w5eUHuEupTfIU542kR+ygckVtnyL3KaChMJk6mznh17/zLod/w==
X-Google-Smtp-Source: AGHT+IGt1fCquMZ3NNZLwaagu9KRz7cZdz/Me6B7Rco1p8I/pwkT0SJo6jB3OOzEWB3h7ucjl3WGGg==
X-Received: by 2002:a05:6512:3991:b0:539:e454:942e with SMTP id 2adb3069b0e04-53b23de9aa0mr3452803e87.16.1729855518903;
        Fri, 25 Oct 2024 04:25:18 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:18 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:55 +0300
Subject: [PATCH v2 08/12] perf: arm_pmuv3: Add support for Samsung Mongoose
 PMU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-8-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1401;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=kyHAPTKZB5mT8XCJ0jyUMcgti7f6+k1RLiIUUCWE+Oc=;
 b=e18R1gAgBqNCItvEqiHWKV4mMiyFfaoPBdnl6l/utulFdQNuLswqV9JWRXelc4wgJJy11VQSs
 f8bgmqNff5wCYbqLk4IMUwUWHV5LEY26+RM8aVSOfPfuRr4WzerOxji
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add support for the Samsung Mongoose CPU core PMU.

This just adds the names and links to DT compatible strings.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

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


