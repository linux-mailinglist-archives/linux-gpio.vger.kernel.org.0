Return-Path: <linux-gpio+bounces-25844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C3CB50781
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 22:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F8DA1C638C1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 20:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0E634F497;
	Tue,  9 Sep 2025 20:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=viasat.com header.i=@viasat.com header.b="b/Yb2Pfz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0e-0085b301.gpphosted.com (mx0e-0085b301.gpphosted.com [67.231.147.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3801FF5F9;
	Tue,  9 Sep 2025 20:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.147.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757451240; cv=none; b=DftnwsWml5cC2z+EZ99M70wsNr+cnb623/yZN/HQrbobWF2hhk8rHNt/0zV/D0k/xTdOjzTW3LY3bY2lV1k5ZOKQva7FQZT86/VxcAOSCiQxsYX5UstrhEAyb8FP/4g/qFXS/z25Gm/D9LEx3afNh8wkB90GUyeNsnQ6HwtYkb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757451240; c=relaxed/simple;
	bh=bwYUMnb4a9XJTI7lxu4mt+ui09DeZb4n6G1uVevVJdU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vx48Bgc2v6SrU93XsxifeLgGBet9MS3dtwV1U5ow+Gq5kXJhlgcDlPXpxMjIQJ249S6NU0HTePIkdyzvN0+CrvzpjfDceLVzPXp8+k9SYZHkUCuxETTJHQZvq9JdTsLnm/D7WQi4FZphNCU/qeKSML/GOM6brpXq6ZhAdC6Dve4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=viasat.com; spf=pass smtp.mailfrom=viasat.com; dkim=pass (2048-bit key) header.d=viasat.com header.i=@viasat.com header.b=b/Yb2Pfz; arc=none smtp.client-ip=67.231.147.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=viasat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=viasat.com
Received: from pps.filterd (m0351329.ppops.net [127.0.0.1])
	by mx0e-0085b301.gpphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589Gg7C9024052;
	Tue, 9 Sep 2025 20:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=viasat.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pp1;
 bh=NVZpmwLeqE+t/XLs00/eH1SJ1VjOM3KIfmsWMMOkDXI=;
 b=b/Yb2PfzXEBSprvwOMSE2cOC5ORFpmWMnXE98SY5U6zU3w/Q7xDcOw5Qhxwt0S1T2yT8
 w8H7Js2v5blL+h7h5/Yn/u6dHGcUPi1IKI48S83GCkzGE/3bawYwZ/Nu8jJCLyvlj9ZI
 VkjJDT+0F/Q7SyxgpsoYl0FxEyFeq3I27vJgvax1zM8I4ZBfpSDZl3uUBg6YXAIbqW8i
 zzrI8bhyWLrezVPeRANMD8I2y3jLyouieV31dKOp/ODq6EEFV6XgJqLqdB8Gfz9i/L5O
 L+aJhiknCHgQSNaFgwXTCznWSYcue98eUmSlj1tk0dPQYUBPLjwteJTZ/YUDovqhqF5F yA== 
Received: from naw02exchp03.hq.corp.viasat.com ([8.37.108.42])
	by mx0e-0085b301.gpphosted.com (PPS) with ESMTPS id 492n9kbb38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 09 Sep 2025 20:53:42 +0000
Received: from C02CG2N7MD6P.hq.corp.viasat.com (10.228.130.2) by
 NAW02EXCHP03.hq.corp.viasat.com (10.228.7.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.55; Tue, 9 Sep 2025 13:53:40 -0700
From: Sean Parker <sean.parker@viasat.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sean Parker <sean.parker@viasat.com>
Subject: [PATCH v2] pinctrl: qcom: sm8250: Add egpio support
Date: Tue, 9 Sep 2025 13:52:48 -0700
Message-ID: <20250909205248.16169-1-sean.parker@viasat.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904170613.68855-1-sean.parker@viasat.com>
References: <20250904170613.68855-1-sean.parker@viasat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NAW02EXCHP03.hq.corp.viasat.com (10.228.7.173) To
 NAW02EXCHP03.hq.corp.viasat.com (10.228.7.173)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDIwNSBTYWx0ZWRfX2T0cWs4TraMh WLuW9kwwCstGai97EZy5wIg21nzU+ShiOAcW9Gzq31W2vzyOK1brr18t6c8rTfVxu0JXgbJCBwN IwPjQ0IUH7nC3DaLGE2fL+fvNzjx0JkNz8vWgxWaJvJ0MkNO8gZzARpsxXJLVv7R4ipT4of+6iw
 gWqVjrnsJcgkQRc5uFhK0PYki1TOvjjTz8uz1Vn23vt932elBWx2dtwl5cnF2LMVyGTqnggFY2F p9wzNPxwvLxYm2HNCJSssEegp9FO1ZjslUc7jDMIyMOOWQYcNtgeuaDfgsnUAcSNCKoPO39MSkj bp+TcKW5JB0UJ9se/VFBbczjcrbYpZNi/B8CTrBim7F3Um7RJrHsb3T5C4oeNBxUwLx7fOvwfwQ /me06Q0P
X-Proofpoint-GUID: dI72YQSc3WZk3qbSf2kdIK6WXQTBXU4h
X-Proofpoint-ORIG-GUID: dI72YQSc3WZk3qbSf2kdIK6WXQTBXU4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxlogscore=948 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509090205

This mirrors the egpio support added to sc7280/sm8450/etc. This change
is necessary for GPIOs 146 - 179 (34 GPIOs) to be used as normal GPIOs.

Signed-off-by: Sean Parker <sean.parker@viasat.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 81 ++++++++++++++++-----------
 1 file changed, 47 insertions(+), 34 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index fb6f005d64f5..ee31182be68b 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -49,6 +49,8 @@ enum {
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
 		.drv_bit = 6,				\
+		.egpio_enable = 12,			\
+		.egpio_present = 11,			\
 		.oe_bit = 9,				\
 		.in_bit = 0,				\
 		.out_bit = 1,				\
@@ -511,6 +513,7 @@ enum sm8250_functions {
 	msm_mux_ddr_pxi2,
 	msm_mux_ddr_pxi3,
 	msm_mux_dp_hot,
+	msm_mux_egpio,
 	msm_mux_dp_lcd,
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
@@ -830,6 +833,14 @@ static const char * const gpio_groups[] = {
 	"gpio171", "gpio172", "gpio173", "gpio174", "gpio175", "gpio176",
 	"gpio177", "gpio178", "gpio179",
 };
+static const char * const egpio_groups[] = {
+	"gpio146", "gpio147", "gpio148", "gpio149", "gpio150", "gpio151",
+	"gpio152", "gpio153", "gpio154", "gpio155", "gpio156", "gpio157",
+	"gpio158", "gpio159", "gpio160", "gpio161", "gpio162", "gpio163",
+	"gpio164", "gpio165", "gpio166", "gpio167", "gpio168", "gpio169",
+	"gpio170", "gpio171", "gpio172", "gpio173", "gpio174", "gpio175",
+	"gpio176", "gpio177", "gpio178", "gpio179",
+};
 static const char * const qdss_cti_groups[] = {
 	"gpio0", "gpio2", "gpio2", "gpio44", "gpio45", "gpio46", "gpio92",
 	"gpio93",
@@ -1018,6 +1029,7 @@ static const struct pinfunction sm8250_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
 	MSM_PIN_FUNCTION(dp_lcd),
+	MSM_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
@@ -1265,40 +1277,40 @@ static const struct msm_pingroup sm8250_groups[] = {
 	[143] = PINGROUP(143, WEST, lpass_slimbus, mi2s1_data0, ddr_bist, _, _, _, _, _, _),
 	[144] = PINGROUP(144, WEST, lpass_slimbus, mi2s1_data1, ddr_bist, _, _, _, _, _, _),
 	[145] = PINGROUP(145, WEST, lpass_slimbus, mi2s1_ws, _, _, _, _, _, _, _),
-	[146] = PINGROUP(146, WEST, _, _, _, _, _, _, _, _, _),
-	[147] = PINGROUP(147, WEST, _, _, _, _, _, _, _, _, _),
-	[148] = PINGROUP(148, WEST, _, _, _, _, _, _, _, _, _),
-	[149] = PINGROUP(149, WEST, _, _, _, _, _, _, _, _, _),
-	[150] = PINGROUP(150, WEST, _, _, _, _, _, _, _, _, _),
-	[151] = PINGROUP(151, WEST, _, _, _, _, _, _, _, _, _),
-	[152] = PINGROUP(152, WEST, _, _, _, _, _, _, _, _, _),
-	[153] = PINGROUP(153, WEST, _, _, _, _, _, _, _, _, _),
-	[154] = PINGROUP(154, WEST, _, _, _, _, _, _, _, _, _),
-	[155] = PINGROUP(155, WEST, _, _, _, _, _, _, _, _, _),
-	[156] = PINGROUP(156, WEST, _, _, _, _, _, _, _, _, _),
-	[157] = PINGROUP(157, WEST, _, _, _, _, _, _, _, _, _),
-	[158] = PINGROUP(158, WEST, _, _, _, _, _, _, _, _, _),
-	[159] = PINGROUP(159, WEST, cri_trng0, _, _, _, _, _, _, _, _),
-	[160] = PINGROUP(160, WEST, cri_trng1, qdss_gpio, _, _, _, _, _, _, _),
-	[161] = PINGROUP(161, WEST, cri_trng, qdss_gpio, _, _, _, _, _, _, _),
-	[162] = PINGROUP(162, WEST, sp_cmu, qdss_gpio, _, _, _, _, _, _, _),
-	[163] = PINGROUP(163, WEST, prng_rosc, qdss_gpio, _, _, _, _, _, _, _),
-	[164] = PINGROUP(164, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[165] = PINGROUP(165, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[166] = PINGROUP(166, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[167] = PINGROUP(167, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[168] = PINGROUP(168, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[169] = PINGROUP(169, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[170] = PINGROUP(170, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[171] = PINGROUP(171, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[172] = PINGROUP(172, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[173] = PINGROUP(173, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[174] = PINGROUP(174, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[175] = PINGROUP(175, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[176] = PINGROUP(176, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[177] = PINGROUP(177, WEST, qdss_gpio, _, _, _, _, _, _, _, _),
-	[178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, _),
-	[179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, _),
+	[146] = PINGROUP(146, WEST, _, _, _, _, _, _, _, _, egpio),
+	[147] = PINGROUP(147, WEST, _, _, _, _, _, _, _, _, egpio),
+	[148] = PINGROUP(148, WEST, _, _, _, _, _, _, _, _, egpio),
+	[149] = PINGROUP(149, WEST, _, _, _, _, _, _, _, _, egpio),
+	[150] = PINGROUP(150, WEST, _, _, _, _, _, _, _, _, egpio),
+	[151] = PINGROUP(151, WEST, _, _, _, _, _, _, _, _, egpio),
+	[152] = PINGROUP(152, WEST, _, _, _, _, _, _, _, _, egpio),
+	[153] = PINGROUP(153, WEST, _, _, _, _, _, _, _, _, egpio),
+	[154] = PINGROUP(154, WEST, _, _, _, _, _, _, _, _, egpio),
+	[155] = PINGROUP(155, WEST, _, _, _, _, _, _, _, _, egpio),
+	[156] = PINGROUP(156, WEST, _, _, _, _, _, _, _, _, egpio),
+	[157] = PINGROUP(157, WEST, _, _, _, _, _, _, _, _, egpio),
+	[158] = PINGROUP(158, WEST, _, _, _, _, _, _, _, _, egpio),
+	[159] = PINGROUP(159, WEST, cri_trng0, _, _, _, _, _, _, _, egpio),
+	[160] = PINGROUP(160, WEST, cri_trng1, qdss_gpio, _, _, _, _, _, _, egpio),
+	[161] = PINGROUP(161, WEST, cri_trng, qdss_gpio, _, _, _, _, _, _, egpio),
+	[162] = PINGROUP(162, WEST, sp_cmu, qdss_gpio, _, _, _, _, _, _, egpio),
+	[163] = PINGROUP(163, WEST, prng_rosc, qdss_gpio, _, _, _, _, _, _, egpio),
+	[164] = PINGROUP(164, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[165] = PINGROUP(165, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[166] = PINGROUP(166, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[167] = PINGROUP(167, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[168] = PINGROUP(168, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[169] = PINGROUP(169, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[170] = PINGROUP(170, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[171] = PINGROUP(171, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[172] = PINGROUP(172, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[173] = PINGROUP(173, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[174] = PINGROUP(174, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[175] = PINGROUP(175, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[176] = PINGROUP(176, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[177] = PINGROUP(177, WEST, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, egpio),
+	[179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, egpio),
 	[180] = UFS_RESET(ufs_reset, 0xb8000),
 	[181] = SDC_PINGROUP(sdc2_clk, 0xb7000, 14, 6),
 	[182] = SDC_PINGROUP(sdc2_cmd, 0xb7000, 11, 3),
@@ -1333,6 +1345,7 @@ static const struct msm_pinctrl_soc_data sm8250_pinctrl = {
 	.ntiles = ARRAY_SIZE(sm8250_tiles),
 	.wakeirq_map = sm8250_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(sm8250_pdc_map),
+	.egpio_func = 9,
 };
 
 static int sm8250_pinctrl_probe(struct platform_device *pdev)
-- 
2.25.1


