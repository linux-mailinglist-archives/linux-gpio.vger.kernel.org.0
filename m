Return-Path: <linux-gpio+bounces-18529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAE4A81F04
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 10:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 784777B5104
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 07:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956CC25A637;
	Wed,  9 Apr 2025 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoN8zveM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716DB25A35E;
	Wed,  9 Apr 2025 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185649; cv=none; b=pEgi7zU6JAVamlPc5BupVfotcOy9XxjzYeOXRL8n50yYBDelUyhgGS4tDdg7jT0D8srq6UXYw83OE498ydl8PK7B059AEwaLuWG6y5IJ+VFychlSkMkI/78xVZ18jSrc7qyNjjYjpGXWxH0dZ1F3a9uLI/PngnMtrfDq5WGZNkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185649; c=relaxed/simple;
	bh=lai/0uIpGhoob1j7YYLfN9RhgTWvu4LC5LrNo8HVgmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ctCbIlmSQhBC4oLQ63WDa1PeRCmbP22R7wWHlbSB/bvZot4zsuvM9MeZxmZkHkQaBmHTVjp+fSbAw40g4nWKhMIEL4UJm+gJaJafGfnNMhkkwUTsgvJzN+j2uUE6d2o7TwXoh4zFQspSFO3ryJuGGfyYcrFkQNL6tSzO07wG2nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoN8zveM; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso7718010e87.0;
        Wed, 09 Apr 2025 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744185645; x=1744790445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GBbnnLl0KVKjf6mjo45SSeu87gd4uemqTNQJ2BYDFwU=;
        b=PoN8zveM+TNWMum/dfCVwNZidd5tgzG6UEIhoFRMY0IPARVllInpxLXT6+RJrKG3o7
         A4qtnePtIWzmCgoxcusrWFEbeO9Nc0cRvfX/8xrR47ygm0NreS+4FiR6vYGlc7bxXeK1
         Pn7Rd/uGQ/PA5g1WgJs9COyFOpZQSXIcJgnXbL1OOUwHsIu4yqwGQdah8Jxh0D/2eLRs
         E1IZFrkaagxtanSNhDgLm4EVFGdl1eXrG9b3FMsHhA5xmQ337jzi79Mmh1DpOT96wj1J
         936EOf5I7wHv1ouVaR/SeI3kJEkX6JyI0uENvkx/Pb7tLdW4w5QagPZet35IwodtQTRX
         t31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744185645; x=1744790445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBbnnLl0KVKjf6mjo45SSeu87gd4uemqTNQJ2BYDFwU=;
        b=kFxb72n2NIbL2kYAqYIo921bvWyndZYnjYDlU+LGBnhK3Mb0mO+DQQGnuiGkpwzBJC
         CxK963QSMRez7QGSsJtOyum133joJmucUWkXvoompo9e4/SdNLuqLsCuairArhS8punE
         Qi5W6qYN9DdL7MgxCF7283jbuTwc2mo4cJRHhbER3Zaa7Rkr+V+RvGKFSzMk1/20u8Ww
         bOih7NZvYGZxKstW6FNQb/IYN/BVgUFXNzMKfrf8dRaugfHcoJy9gahWn66ANvk/1zF3
         +MD+RKDYrFTBjF5vRrLIAe6ke/USNGsO5iqWCJ0d1JfYImkVk27Su25WQsQTtFRUuu9Y
         j96Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjj7qEcm3MISq1fZlPb675vbxXTpV/OMqIrq/+elXpiYs/9QKwYTn9OJKZSfn3Id/KqhH/XjTmLTTYGNsz@vger.kernel.org, AJvYcCX5lWvuVTrBNl2ZjtfYkxLiUgkb1Pi80oSy1Q6+tR0ICTE/2jqud6jrUTU0ca53MWxkUTnP+pv6UkX5Z+VH@vger.kernel.org, AJvYcCXn2vzEute7o35dKmXLaNmu1ancA7ANM17Js0q32GRslqBx2SjndrtE1ODHh7Ava0bojlij1ZOFJKy6Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4ZJkCVkjegBUudxYdmA6551OIOkXtti3JW4o9skfhNuwys39
	hjG9QZfjOz17K4JJR4C4vsfjgHiI4iZWLds8OwWEAdn0QIiuS8QU
X-Gm-Gg: ASbGncu88Wq4EmLqUXeZvqa6b6+RBCCyQr95vyMRzecxvw3bp71lnecCSCXwtC/XkDS
	saq/uzq3ngGYmTzgB6n0KiuxSJC5gVzNRn//2oaQ3g6hj1RueBJYuKvcSm5U+Z80hxlGzObvqzN
	BjvECWiPcmcAoEN5crdQCqbr5TSQMc8/d1csd8VCAH82oUTCfBZZg1zQmO8ddAUnVtMb5HkwCbA
	vyf402yOp6PcVMg4+2p6RLoGdZIyfSV4KSlJpjn2lH4KYEZZGxPeSbRfvnx6fSeDZByFhGDrCf/
	10Q0aF94aqlxgFUvVk1HM3uzYYCXAwdXi7Pdf6rC
X-Google-Smtp-Source: AGHT+IHmm3xwFUNBjJf7Z0s3XKqvoj33/yIUNMY6ovsT12BpAUgSNVPHON4VBQkOdsDaLeakrQ9q6w==
X-Received: by 2002:a05:6512:32c1:b0:545:3031:40aa with SMTP id 2adb3069b0e04-54c436f0cbcmr452590e87.9.1744185645324;
        Wed, 09 Apr 2025 01:00:45 -0700 (PDT)
Received: from T15.. ([46.175.113.10])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-54c4565f79csm70790e87.114.2025.04.09.01.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:00:44 -0700 (PDT)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Wojciech Slenska <wojciech.slenska@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add egpio support
Date: Wed,  9 Apr 2025 10:00:29 +0200
Message-Id: <20250409080030.62254-1-wojciech.slenska@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcm2290 supports the egpio feature on GPIOs ranging from 98 to 126.
This change is necessary to allow these GPIOs to be driven by TLMM.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-qcm2290.c | 70 +++++++++++++++-----------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
index ba699eac9ee8..f885af571ec9 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -37,6 +37,8 @@
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
+		.egpio_enable = 12,		\
+		.egpio_present = 11,		\
 		.oe_bit = 9,			\
 		.in_bit = 0,			\
 		.out_bit = 1,			\
@@ -387,6 +389,7 @@ enum qcm2290_functions {
 	msm_mux_ddr_pxi1,
 	msm_mux_ddr_pxi2,
 	msm_mux_ddr_pxi3,
+	msm_mux_egpio,
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
@@ -816,6 +819,13 @@ static const char * const sd_write_groups[] = {
 static const char * const jitter_bist_groups[] = {
 	"gpio96", "gpio97",
 };
+static const char * const egpio_groups[] = {
+	"gpio98", "gpio99", "gpio100", "gpio101", "gpio102", "gpio103",
+	"gpio104", "gpio105", "gpio106", "gpio107", "gpio108", "gpio109",
+	"gpio110", "gpio111", "gpio112", "gpio113", "gpio114", "gpio115",
+	"gpio116", "gpio117", "gpio118", "gpio119", "gpio120", "gpio121",
+	"gpio122", "gpio123", "gpio124", "gpio125", "gpio126",
+};
 static const char * const ddr_pxi2_groups[] = {
 	"gpio102", "gpio103",
 };
@@ -851,6 +861,7 @@ static const struct pinfunction qcm2290_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
+	MSM_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
@@ -1037,35 +1048,35 @@ static const struct msm_pingroup qcm2290_groups[] = {
 	[95] = PINGROUP(95, nav_gpio, gp_pdm0, qdss_gpio, wlan1_adc1, _, _, _, _, _),
 	[96] = PINGROUP(96, qup4, nav_gpio, mdp_vsync, gp_pdm1, sd_write, jitter_bist, qdss_cti, qdss_cti, _),
 	[97] = PINGROUP(97, qup4, nav_gpio, mdp_vsync, gp_pdm2, jitter_bist, qdss_cti, qdss_cti, _, _),
-	[98] = PINGROUP(98, _, _, _, _, _, _, _, _, _),
-	[99] = PINGROUP(99, _, _, _, _, _, _, _, _, _),
-	[100] = PINGROUP(100, atest, _, _, _, _, _, _, _, _),
-	[101] = PINGROUP(101, atest, _, _, _, _, _, _, _, _),
-	[102] = PINGROUP(102, _, phase_flag, dac_calib, ddr_pxi2, _, _, _, _, _),
-	[103] = PINGROUP(103, _, phase_flag, dac_calib, ddr_pxi2, _, _, _, _, _),
-	[104] = PINGROUP(104, _, phase_flag, qdss_gpio, dac_calib, ddr_pxi3, _, pwm_8, _, _),
-	[105] = PINGROUP(105, _, phase_flag, qdss_gpio, dac_calib, ddr_pxi3, _, _, _, _),
-	[106] = PINGROUP(106, nav_gpio, gcc_gp3, qdss_gpio, _, _, _, _, _, _),
-	[107] = PINGROUP(107, nav_gpio, gcc_gp2, qdss_gpio, _, _, _, _, _, _),
-	[108] = PINGROUP(108, nav_gpio, _, _, _, _, _, _, _, _),
-	[109] = PINGROUP(109, _, qdss_gpio, _, _, _, _, _, _, _),
-	[110] = PINGROUP(110, _, qdss_gpio, _, _, _, _, _, _, _),
-	[111] = PINGROUP(111, _, _, _, _, _, _, _, _, _),
-	[112] = PINGROUP(112, _, _, _, _, _, _, _, _, _),
-	[113] = PINGROUP(113, _, _, _, _, _, _, _, _, _),
-	[114] = PINGROUP(114, _, _, _, _, _, _, _, _, _),
-	[115] = PINGROUP(115, _, pwm_9, _, _, _, _, _, _, _),
-	[116] = PINGROUP(116, _, _, _, _, _, _, _, _, _),
-	[117] = PINGROUP(117, _, _, _, _, _, _, _, _, _),
-	[118] = PINGROUP(118, _, _, _, _, _, _, _, _, _),
-	[119] = PINGROUP(119, _, _, _, _, _, _, _, _, _),
-	[120] = PINGROUP(120, _, _, _, _, _, _, _, _, _),
-	[121] = PINGROUP(121, _, _, _, _, _, _, _, _, _),
-	[122] = PINGROUP(122, _, _, _, _, _, _, _, _, _),
-	[123] = PINGROUP(123, _, _, _, _, _, _, _, _, _),
-	[124] = PINGROUP(124, _, _, _, _, _, _, _, _, _),
-	[125] = PINGROUP(125, _, _, _, _, _, _, _, _, _),
-	[126] = PINGROUP(126, _, _, _, _, _, _, _, _, _),
+	[98] = PINGROUP(98, _, _, _, _, _, _, _, _, egpio),
+	[99] = PINGROUP(99, _, _, _, _, _, _, _, _, egpio),
+	[100] = PINGROUP(100, atest, _, _, _, _, _, _, _, egpio),
+	[101] = PINGROUP(101, atest, _, _, _, _, _, _, _, egpio),
+	[102] = PINGROUP(102, _, phase_flag, dac_calib, ddr_pxi2, _, _, _, _, egpio),
+	[103] = PINGROUP(103, _, phase_flag, dac_calib, ddr_pxi2, _, _, _, _, egpio),
+	[104] = PINGROUP(104, _, phase_flag, qdss_gpio, dac_calib, ddr_pxi3, _, pwm_8, _, egpio),
+	[105] = PINGROUP(105, _, phase_flag, qdss_gpio, dac_calib, ddr_pxi3, _, _, _, egpio),
+	[106] = PINGROUP(106, nav_gpio, gcc_gp3, qdss_gpio, _, _, _, _, _, egpio),
+	[107] = PINGROUP(107, nav_gpio, gcc_gp2, qdss_gpio, _, _, _, _, _, egpio),
+	[108] = PINGROUP(108, nav_gpio, _, _, _, _, _, _, _, egpio),
+	[109] = PINGROUP(109, _, qdss_gpio, _, _, _, _, _, _, egpio),
+	[110] = PINGROUP(110, _, qdss_gpio, _, _, _, _, _, _, egpio),
+	[111] = PINGROUP(111, _, _, _, _, _, _, _, _, egpio),
+	[112] = PINGROUP(112, _, _, _, _, _, _, _, _, egpio),
+	[113] = PINGROUP(113, _, _, _, _, _, _, _, _, egpio),
+	[114] = PINGROUP(114, _, _, _, _, _, _, _, _, egpio),
+	[115] = PINGROUP(115, _, pwm_9, _, _, _, _, _, _, egpio),
+	[116] = PINGROUP(116, _, _, _, _, _, _, _, _, egpio),
+	[117] = PINGROUP(117, _, _, _, _, _, _, _, _, egpio),
+	[118] = PINGROUP(118, _, _, _, _, _, _, _, _, egpio),
+	[119] = PINGROUP(119, _, _, _, _, _, _, _, _, egpio),
+	[120] = PINGROUP(120, _, _, _, _, _, _, _, _, egpio),
+	[121] = PINGROUP(121, _, _, _, _, _, _, _, _, egpio),
+	[122] = PINGROUP(122, _, _, _, _, _, _, _, _, egpio),
+	[123] = PINGROUP(123, _, _, _, _, _, _, _, _, egpio),
+	[124] = PINGROUP(124, _, _, _, _, _, _, _, _, egpio),
+	[125] = PINGROUP(125, _, _, _, _, _, _, _, _, egpio),
+	[126] = PINGROUP(126, _, _, _, _, _, _, _, _, egpio),
 	[127] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x84004, 0, 0),
 	[128] = SDC_QDSD_PINGROUP(sdc1_clk, 0x84000, 13, 6),
 	[129] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x84000, 11, 3),
@@ -1095,6 +1106,7 @@ static const struct msm_pinctrl_soc_data qcm2290_pinctrl = {
 	.ngpios = 127,
 	.wakeirq_map = qcm2290_mpm_map,
 	.nwakeirq_map = ARRAY_SIZE(qcm2290_mpm_map),
+	.egpio_func = 9,
 };
 
 static int qcm2290_pinctrl_probe(struct platform_device *pdev)
-- 
2.34.1


