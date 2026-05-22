Return-Path: <linux-gpio+bounces-37373-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AM1MaVxEGqgXQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37373-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 17:09:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AAE5B6AC5
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 17:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95BC9304DB14
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 14:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B222F8EB7;
	Fri, 22 May 2026 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nyvLieXv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7990410D3E
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459123; cv=none; b=XklPDRWBzQASOlM2y8e9hdviNcIiQf1oMRwhnED81Y3TBX9sJdeVTYTam8MDhET9IVvgnlXUQ/q0H0vTXPLI7EbowyNaHtExOGsRkDock9/Wudkq4JPTDg3y5xei/Mz+NFOmVU8YX/O8SnMOWskYp+/k12VKIWyeNQxue3Nh3CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459123; c=relaxed/simple;
	bh=LOK18JoRaeQdrJ6kJo2lId9NtzfFZIMr3TWv1bBG748=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nQh964ZOT82v/VW4P+1LE/vra58OMt+IZhzjWPxrUKFco+g5ivvsfjFX0Y3gqhsofC7M+sfv+wqOx2tc0d5TZdCse1jC9eHWvCGin17wENYX3TUlImnZSIlDRByHOBiTk8/Ql7+13OiKxP53Scbg95m1G10SrhwZl29aGw3xr3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nyvLieXv; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d4c383f2fcso6279747a34.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779459116; x=1780063916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FSXE9Oey6vqItDyNGub1SS7syhqYd3bmpNkcjyrbyCI=;
        b=nyvLieXvqv+R4FoxyOPMrJQliovLi0Aup5i9CMDuKQLQk46VKaEv33QL4pC7w/gXcI
         nkrnsA3YKKaLKiynkQmPgxOffHUqcM9rV8J2tJO9Zp7xLhb+Nc0NLjklleg9AW5q+BlP
         SIjHf/xAaLPTS5LibZUen4SSx6C90RzSOMDfjfpCMI6ekcrOEKl36RMSOQpaOFM1nJK9
         qHnaOwNwlePwbn0p9Q6APxTamObsVGf7moMunYZacjPJf3tv3vqRBcaH/Za8zya9TAzX
         +s9oyabBbavDCtJXdIbWMoTVu7ZfyBEsIra1Jdbxk1s6vQR88VURbKrWYSVl7MIT6hME
         Z+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459116; x=1780063916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSXE9Oey6vqItDyNGub1SS7syhqYd3bmpNkcjyrbyCI=;
        b=TJu9reHos0tEnP9o34OEzyW6jirG8elBmglsSHZHpqsJDVLiZOCIrdjq+wEVqIBEEI
         /AtnTTGtt79EtLrL1/UCz4yy57IaucF+VOpiegAmNWp+c6uRFjt8RVYQsUGkIf6ANGBF
         xtFOULyr0gOB5I2mLEciH203yaqENP/ba39LOHe5F8wcxLvYzl/76CcObxs7ilPRr1Uf
         HN6wUSMAa7VzdDGLJSfmL87yfv0OKSC9pD16mrTYSPycM1kcu13Tp+N10ZzrO0XOrEc8
         Kj1oeyokDauxMNsll9oSB9XawoaltC5ypwWdwzXdw88kUK/6pMjPHGp4UI1ongn+A1yU
         L4oA==
X-Forwarded-Encrypted: i=1; AFNElJ/ocMMOVqcSLZKDd67tyqsGOnjLJ62qMHww2P7Q7oek6DBWKzHpqexDVMRYMAZzdD4blt1+saY/D+YL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv03s1LXb6yN7dntCiTZkmgtQq/GOfXsQkyfA9SXX9t6Ufz7L9
	D1DwnMG1WWMUN1Q8ECgAN0MN/BvzHxg2HDgbwAsZwT55mOA9Ynf9aUbz
X-Gm-Gg: Acq92OEkebLJj7XD9xJWobMfiU8/+7KnojVDYbIRU3ggvqzdjMh6tLtQhWM5Hk365ne
	Zqh1GQid2XBY+IYJQMQqKvB9BWkvgDEF2bD3oNuoFiz2x77Dp9iHFjdbHtJweA49w3djg/ZJSIP
	fVO3NH34IX37z8RFhpuuWjQAbyOc5TJoPT0aZseUg0Vs18WsajyXnhqWJNq04nT9vNPknb0Z6pN
	aBVrT0jHcrvHoR2g0oh7rrMACysvp9DOkzxgcsicOZyURTA8zSrlM+MlPq5WxHRs+AH+IZKq5Mp
	xsZtDReSnRuIWNWysqKssVFP5Qywja+NbcDtJHkRsnf5BwT5SBKK9Pcn84WOwH7pep1AsW6dEcP
	nKER7NwmUtzszkgx6jVRv6oc2BkpTIxFMr06flyLsGlM5YhQRnk36iEmZKdEJhWxWNuQ+AiMiDJ
	9h5vELBxExfb+WJur7Kmyzn30jFzQQhIBsvpGfzBV583cRMcrEOyeINUiD0lty
X-Received: by 2002:a4a:e50d:0:b0:69d:79f5:f63b with SMTP id 006d021491bc7-69d7eb6cd39mr1480704eaf.23.1779459115927;
        Fri, 22 May 2026 07:11:55 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b6351a772sm1915628fac.3.2026.05.22.07.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:11:55 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: andersson@kernel.org,
	linusw@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH] pinctrl: qcom: sm6115: Add egpio support
Date: Fri, 22 May 2026 16:11:48 +0200
Message-ID: <20260522141149.1425711-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37373-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C5AAE5B6AC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This mirrors the egpio support added to sc7280/sm8450/sm8250/etc. This change
is necessary for GPIOs 98-112 (15 GPIOs) to be used as normal GPIOs.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sm6115.c | 40 +++++++++++++++++----------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 234451fbf47b..97930db91476 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -47,6 +47,8 @@ enum {
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
+		.egpio_enable = 12,		\
+		.egpio_present = 11,		\
 		.oe_bit = 9,			\
 		.in_bit = 0,			\
 		.out_bit = 1,			\
@@ -374,6 +376,7 @@ enum sm6115_functions {
 	msm_mux_ddr_pxi1,
 	msm_mux_ddr_pxi2,
 	msm_mux_ddr_pxi3,
+	msm_mux_egpio,
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
@@ -451,6 +454,11 @@ static const char * const gpio_groups[] = {
 	"gpio105", "gpio106", "gpio107", "gpio108", "gpio109", "gpio110",
 	"gpio111", "gpio112",
 };
+static const char * const egpio_groups[] = {
+	"gpio98", "gpio99", "gpio100", "gpio101", "gpio102", "gpio103",
+	"gpio104", "gpio105", "gpio106", "gpio107", "gpio108", "gpio109",
+	"gpio110", "gpio111", "gpio112",
+};
 static const char * const ddr_bist_groups[] = {
 	"gpio0", "gpio1", "gpio2", "gpio3",
 };
@@ -681,6 +689,7 @@ static const struct pinfunction sm6115_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
+	MSM_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
@@ -839,21 +848,21 @@ static const struct msm_pingroup sm6115_groups[] = {
 	[95] = PINGROUP(95, WEST, nav_gpio, gp_pdm0, qdss_gpio, wlan1_adc1, _, _, _, _, _),
 	[96] = PINGROUP(96, WEST, qup4, nav_gpio, mdp_vsync, gp_pdm1, sd_write, jitter_bist, qdss_cti, qdss_cti, _),
 	[97] = PINGROUP(97, WEST, qup4, nav_gpio, mdp_vsync, gp_pdm2, jitter_bist, qdss_cti, qdss_cti, _, _),
-	[98] = PINGROUP(98, SOUTH, _, _, _, _, _, _, _, _, _),
-	[99] = PINGROUP(99, SOUTH, _, _, _, _, _, _, _, _, _),
-	[100] = PINGROUP(100, SOUTH, atest, _, _, _, _, _, _, _, _),
-	[101] = PINGROUP(101, SOUTH, atest, _, _, _, _, _, _, _, _),
-	[102] = PINGROUP(102, SOUTH, _, phase_flag, dac_calib, ddr_pxi2, _, _, _, _, _),
-	[103] = PINGROUP(103, SOUTH, _, phase_flag, dac_calib, ddr_pxi2, _, _, _, _, _),
-	[104] = PINGROUP(104, SOUTH, _, phase_flag, qdss_gpio, dac_calib, ddr_pxi3, _, _, _, _),
-	[105] = PINGROUP(105, SOUTH, _, phase_flag, qdss_gpio, dac_calib, ddr_pxi3, _, _, _, _),
-	[106] = PINGROUP(106, SOUTH, nav_gpio, gcc_gp3, qdss_gpio, _, _, _, _, _, _),
-	[107] = PINGROUP(107, SOUTH, nav_gpio, gcc_gp2, qdss_gpio, _, _, _, _, _, _),
-	[108] = PINGROUP(108, SOUTH, nav_gpio, _, _, _, _, _, _, _, _),
-	[109] = PINGROUP(109, SOUTH, _, qdss_gpio, _, _, _, _, _, _, _),
-	[110] = PINGROUP(110, SOUTH, _, qdss_gpio, _, _, _, _, _, _, _),
-	[111] = PINGROUP(111, SOUTH, _, _, _, _, _, _, _, _, _),
-	[112] = PINGROUP(112, SOUTH, _, _, _, _, _, _, _, _, _),
+	[98] = PINGROUP(98, SOUTH, _, _, _, _, _, _, _, _, egpio),
+	[99] = PINGROUP(99, SOUTH, _, _, _, _, _, _, _, _, egpio),
+	[100] = PINGROUP(100, SOUTH, atest, _, _, _, _, _, _, _, egpio),
+	[101] = PINGROUP(101, SOUTH, atest, _, _, _, _, _, _, _, egpio),
+	[102] = PINGROUP(102, SOUTH, _, phase_flag, dac_calib, ddr_pxi2, _, _, _, _, egpio),
+	[103] = PINGROUP(103, SOUTH, _, phase_flag, dac_calib, ddr_pxi2, _, _, _, _, egpio),
+	[104] = PINGROUP(104, SOUTH, _, phase_flag, qdss_gpio, dac_calib, ddr_pxi3, _, _, _, egpio),
+	[105] = PINGROUP(105, SOUTH, _, phase_flag, qdss_gpio, dac_calib, ddr_pxi3, _, _, _, egpio),
+	[106] = PINGROUP(106, SOUTH, nav_gpio, gcc_gp3, qdss_gpio, _, _, _, _, _, egpio),
+	[107] = PINGROUP(107, SOUTH, nav_gpio, gcc_gp2, qdss_gpio, _, _, _, _, _, egpio),
+	[108] = PINGROUP(108, SOUTH, nav_gpio, _, _, _, _, _, _, _, egpio),
+	[109] = PINGROUP(109, SOUTH, _, qdss_gpio, _, _, _, _, _, _, egpio),
+	[110] = PINGROUP(110, SOUTH, _, qdss_gpio, _, _, _, _, _, _, egpio),
+	[111] = PINGROUP(111, SOUTH, _, _, _, _, _, _, _, _, egpio),
+	[112] = PINGROUP(112, SOUTH, _, _, _, _, _, _, _, _, egpio),
 	[113] = UFS_RESET(ufs_reset, 0x78000),
 	[114] = SDC_QDSD_PINGROUP(sdc1_rclk, WEST, 0x75000, 15, 0),
 	[115] = SDC_QDSD_PINGROUP(sdc1_clk, WEST, 0x75000, 13, 6),
@@ -886,6 +895,7 @@ static const struct msm_pinctrl_soc_data sm6115_tlmm = {
 	.ntiles = ARRAY_SIZE(sm6115_tiles),
 	.wakeirq_map = sm6115_mpm_map,
 	.nwakeirq_map = ARRAY_SIZE(sm6115_mpm_map),
+	.egpio_func = 9,
 };
 
 static int sm6115_tlmm_probe(struct platform_device *pdev)
-- 
2.51.0


