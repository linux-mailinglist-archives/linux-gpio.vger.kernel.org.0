Return-Path: <linux-gpio+bounces-25608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4287B44489
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C4B47BF93B
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 17:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3550030E0FB;
	Thu,  4 Sep 2025 17:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=viasat.com header.i=@viasat.com header.b="KfbEeRm0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0e-0085b301.gpphosted.com (mx0e-0085b301.gpphosted.com [67.231.147.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79C42FB99E;
	Thu,  4 Sep 2025 17:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.147.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757007326; cv=none; b=rb8wWn2oy67GSEdQCMicfD1462jKDv3HbZzaSPXvs48wlxP7nd4ky+i7cjZtrfC5Jsq8k1c6oM4Rfp+1M69orf5EloZBRYt6YI/qEVA/9ag5w90RJ52asyJymKjAEXkkGaDi0gjMm+rAe3th0JaL+dAYqdQrSfljrQSh3Yr3R4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757007326; c=relaxed/simple;
	bh=rmDJLXJWdrLz+T7dlLWIk3MLNmKL5Uk56E1y4/s8u8Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eqYHaKNWLeCHULBhkXtsEqa9v2+EJqiNwAY5jcjk0xQvkP0C7KmNnXz4dkYp9BPCDiiruaCHpI14IuLsxhNqFEFlUq1p8xzbynEWyPOmw9xelSRIDdLlDBtCQJpiXZcWElgbYe+0XXEv0XFrXHToAJcXRP1bFTr7sLNAuQM2ddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=viasat.com; spf=pass smtp.mailfrom=viasat.com; dkim=pass (2048-bit key) header.d=viasat.com header.i=@viasat.com header.b=KfbEeRm0; arc=none smtp.client-ip=67.231.147.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=viasat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=viasat.com
Received: from pps.filterd (m0351329.ppops.net [127.0.0.1])
	by mx0e-0085b301.gpphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584CIbAa016382;
	Thu, 4 Sep 2025 17:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=viasat.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pp1; bh=cTwM2EAj/wFu9sEQp/YMF/SkeWLZXAes3xgx2G9UV58=;
 b=KfbEeRm0PhoAc4KBDwGGs15CGJLxClqC0+WythzfXTmvm/I+XtE4L56S3MUzj9PJokl6
 ebLqaxejkxqzEmw4NXIHUaTMhwGeRJ1xRwedVFnFyjA2LnKGHlEAa2qncHDVYDqO+fd2
 gZhdI7d2bzS+VNafHRzj8dCtHmS17xL5eq2up5auKAxDlLhmqugbjL9TbJCuMWJBLUD9
 etajgVFCeOeyc63VtgsUHQvmyGz6pV65Y/7ve3j4SbJhAKPpRQxsB5UOFuYb2w+7mWGY
 hjcXGL9u50WONa5+W3PjmL5b09ogxXndp18s5mW5IelznFNI7zox8p5qytQZzt63BTWX 3w== 
Received: from naw02exchp03.hq.corp.viasat.com ([8.37.108.42])
	by mx0e-0085b301.gpphosted.com (PPS) with ESMTPS id 48yannj9yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 04 Sep 2025 17:06:58 +0000
Received: from C02CG2N7MD6P.hq.corp.viasat.com (10.228.130.2) by
 NAW02EXCHP03.hq.corp.viasat.com (10.228.7.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.55; Thu, 4 Sep 2025 10:06:57 -0700
From: Sean Parker <sean.parker@viasat.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.parker@viasat.com>
Subject: [PATCH] pinctrl: qcom: sm8250: Add egpio support
Date: Thu, 4 Sep 2025 10:04:26 -0700
Message-ID: <20250904170613.68855-1-sean.parker@viasat.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NAW02EXCHP04.hq.corp.viasat.com (10.228.7.174) To
 NAW02EXCHP03.hq.corp.viasat.com (10.228.7.173)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2OCBTYWx0ZWRfX3YDH/12w3ojC g3RPgJZUwUTQaqeHk+aV3iYoJWQWy7wJQaNE0zoP04CW/bomPUWrCsl3Au7GWuX1uuBA6TOj/a2 mHoroTTrV2SjJ9AP/TmVABps3lR3WIshtqmhbP6fVi+sLJuGmSiEkIvqgdE2Ex6LUtw7DTCc0aV
 m50qQjlgXi0bDldDbiY7EzX9nxwY1tWnl7OOrfGdEsUre0n/5TLngBDjof91d31TdJNfaCVLYf2 /8vK2tam8nWed81HwuGaFFTqpAenkYvTiJPdtt2UOyE8KVmh+RbIqKNXF7zOhiDrRiyg4/H0DGQ FcI1KszSeUt1cAD7CDrnZYmNrwcSQANASMrN9N+ll0Li6WtMztnogKecNY2Fb1IQ5ZhRBy2h1z0 l027Yn5z
X-Proofpoint-GUID: -4PME17N9hj7N2t-XXJzycKQU59kb9Em
X-Proofpoint-ORIG-GUID: -4PME17N9hj7N2t-XXJzycKQU59kb9Em
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=925 mlxscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509040168

This mirrors the egpio support added to sc7280/sm8450/etc. This change
is necessary for GPIOs 146 - 180 (34 GPIOs) to be used as normal GPIOs.

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


