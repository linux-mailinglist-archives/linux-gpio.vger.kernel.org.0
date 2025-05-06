Return-Path: <linux-gpio+bounces-19647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A54ABAABBF0
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C46E04C1312
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB74927C86F;
	Tue,  6 May 2025 06:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dOvrRmMF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15090278744;
	Tue,  6 May 2025 06:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746512633; cv=none; b=OPAGUCsUPYOCMGGbFKjUy4UGpcvw2++5J8bOE9bjjQRC5FprlfFXk7URoe24i2JAE0s5V9Bcow8OQSNIEP7zqX88Z9Ystz2YsWNuuNAmvdtHkfpm/DFO9owu+t97HovMe1ZsTCHXKqtnj4mj6bLMl2/u0AzbLop+ute7eVSc3Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746512633; c=relaxed/simple;
	bh=6W9jb71l73ncm6Lmy9bnvQK4dE7BbPVdg/NIAEmnACQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mJKb9I2Qab20+fV5Y5Kz77ULdmzefjfKCN4X/0BQLQulY1Pb6xU2vTXWNKHpvx6OgX0kiGbMWfyhgbPazv5jKk/jh7Ygm1AjYGFgusy99P+YD6VqwtskeJQaUfXOnQK2EPi1oR5zHxD1EJr8kZNFYcEJZ5qWPR++XQGDKGXwtXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dOvrRmMF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54619Xu6007057;
	Tue, 6 May 2025 06:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zfl38aYtTXGq/3qSL8BAlvyIp0l3cEqPeBYt/DuHltg=; b=dOvrRmMF3AQI57Us
	Zwnl4F/jT5iN/DA2rkG1bTAGloT+xvedOeMr1MfI54g7iSSLBadOYOQ3a82tt2r+
	k2bSpvfC1WLONmVur5CCFMEdn6O3Sm0ZMasctFxPQBlmqDcxKaeKr3iut9M9iBvw
	GQ/nWoBAc8DujAdyBlsjwBSZq51RFse3qlyGcCuUJes9jqKEdg07fDTb9Ny1iYwI
	ZP4wxsz2SnSXGp3tqtmf/mchvq4Xch8OTVvJZ4AlUToYS1k9cKiWW8Ai/GPX36Ol
	eeT0I+ZocMrkdixSJBnYFfwWXYjgqLoaBObG06lD3k3zVvVPIAUcrCKX0Cfv/Aiu
	vB4H2Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f8gw0rgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 06:23:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5466Nl8L019563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 06:23:47 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 May 2025 23:23:42 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Tue, 6 May 2025 14:23:00 +0800
Subject: [PATCH v3 3/4] pinctrl: qcom: correct the ngpios entry for QCS615
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250506-correct_gpio_ranges-v3-3-49a7d292befa@quicinc.com>
References: <20250506-correct_gpio_ranges-v3-0-49a7d292befa@quicinc.com>
In-Reply-To: <20250506-correct_gpio_ranges-v3-0-49a7d292befa@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Jingyi
 Wang" <quic_jingyw@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746512610; l=1023;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=6W9jb71l73ncm6Lmy9bnvQK4dE7BbPVdg/NIAEmnACQ=;
 b=34255QokuQNCJwZB90bR+zAYmc0Sz/6yy2voumbrQ/244i/gEGnCEjkpCbPplXUvUbKgzT8xU
 U7j14vrpOKfC3f0SVtGsiv4yiyYtbholKTw7n709fyZrJRv+7hFFlnc
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SExbLAp_tP0h_1Xr96Slq4DiPkv7hnwx
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=6819aaf4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=CrFJ5LNVHEz5L8QHvu8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SExbLAp_tP0h_1Xr96Slq4DiPkv7hnwx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA1OSBTYWx0ZWRfX+AMpEQqTCvDt
 bP6NWERsYCnaLTjSlZTO9ryBv95HcsLU9StggFFbWP2r0PASei/KJbW00X2reEunufC4JHq8Rec
 5MEqKAlLWxIZ/NPXd/b6IrrJMBGHHPehahuf0kz5OzKStq/H9bdIbNgY3om00o3FriorUMC1pO9
 uhCB5rUvIfzsT47hB1KAxyks7rKvBmZqST326vrWdoRz69EgKKkith1obTtYPEEqBv9/aaVKT1S
 Km9qt3Fjp/52CgXRE9B/XOp6iFn/pLtqpV2Q1iSYUCSnrp0/87R1hukdH4tJ10Htz9uNX+oWY5k
 81tMdMdVM/RekCcNsugM3RqSWhWN+Y3aNnr4ZyLALzJ1Jch44Z1cMOVQQUn3ouIdDQgC7UDVtlU
 cjBpjGx4inA7/CdvVKK0nVhEuWVT0H2GiaWb3VIHvnJMIh8BpH4TYiNgsPsIsMwbaiBKAY5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=680 impostorscore=0
 spamscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060059

Correct the ngpios entry to account for the UFS_RESET pin being exported
as a GPIO in addition to the real GPIOs, allowing the UFS driver to toggle
it.

Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 23015b055f6a..17ca743c2210 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -1062,7 +1062,7 @@ static const struct msm_pinctrl_soc_data qcs615_tlmm = {
 	.nfunctions = ARRAY_SIZE(qcs615_functions),
 	.groups = qcs615_groups,
 	.ngroups = ARRAY_SIZE(qcs615_groups),
-	.ngpios = 123,
+	.ngpios = 124,
 	.tiles = qcs615_tiles,
 	.ntiles = ARRAY_SIZE(qcs615_tiles),
 	.wakeirq_map = qcs615_pdc_map,

-- 
2.46.0


