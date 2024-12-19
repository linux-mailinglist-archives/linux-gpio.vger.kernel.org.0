Return-Path: <linux-gpio+bounces-14003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEB19F768B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D042216458A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A27F218841;
	Thu, 19 Dec 2024 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nP152Ppc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2EB217671;
	Thu, 19 Dec 2024 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734595225; cv=none; b=nzLIZvGmSRsBk3klqd2GNQRLY9dK1L2QyPQwEPJM7Dm+YiGpKmF7uH5EL3AWA1AED6RGGFPb5wBVlrF6fBKhsEB+vk2gGvY6W4bkEtwhD2U+7+HnxvBj1NFb49AdS+pBW6sbEApzmcGvApgur5GvULPKMr9fWYWYi9nND4//JHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734595225; c=relaxed/simple;
	bh=RjW2U5crHQLYme/GsQF+5cWHB9saCQOi0cQcvhQtDUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VsiXJ6SH4mZXIZBF1IoGJInNHtYuaB/Y5XREkbrvzQHLym/Ye9dJCRS4zeY1CBMG7d5epAWySlUCEpZ6xi91Y5sW61UJA5Q8lc4aOIgOibo5MvLvGKT9/g5MuakN7rAKfhyGOFS/7WzVPjvSjfUU6SSmZ8SxHEoY/aX2DeYyAAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nP152Ppc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIMh1bD027842;
	Thu, 19 Dec 2024 08:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Xxcqw4o5lTjGAsQpSW8wI8njvlcb7wrZyOjLaOVRjw=; b=nP152Ppc7kkgn3CU
	p2EDTZArJFJ+Y0NnBlphIaOOiLcNUnNYNaelJW1JiRIMjRJNXa/zuJcA7swKxPR6
	+tvK44SdibpBVRaFUFVuH+A9msgNIR4A9aOW3LfrQJDFbH95GCD0cxW1b7sXFWSg
	K8fYJzfhugo5lg2LOCzOFrAVLPS+krgF5mXMkoqO1yOzxnK0pbiRTXxvAORwALRR
	vfE0RCBvcm3R9XM4d9nPNPpuVT9pBejRtNiZ3cnSJ66gG7DIbLqMg4kspOxLPuWf
	nbE6nzFraLPK7yuCQNDZASjBmfYF9K39uW/2GPYoFPBfLmpAzLbRJIbi+7LYE1QG
	OuKq5g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m7eb140p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ80JH4007960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:19 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 00:00:11 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 19 Dec 2024 15:59:46 +0800
Subject: [PATCH v2 4/6] pinctrl: qcom: correct the ngpios entry for QCS8300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241219-correct_gpio_ranges-v2-4-19af8588dbd0@quicinc.com>
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
In-Reply-To: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Jingyi
 Wang" <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734595195; l=1056;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=RjW2U5crHQLYme/GsQF+5cWHB9saCQOi0cQcvhQtDUg=;
 b=OQl8DorWSN6Wwwpog7u71wPwD1bHuQLAMeiARrxPW3jHizypzTtLgUUv8VJfHiMeegZqomGOi
 433cn7OfQJlAXMhy6HClzEqXmMxh5Qq0X0F7+hQDsNtICeCg8OxBGj3
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FRBffX_i_sPT8mxLikN2HfgYtq9z2Wf7
X-Proofpoint-ORIG-GUID: FRBffX_i_sPT8mxLikN2HfgYtq9z2Wf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=864 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190062

Correct the ngpios entry to account for the UFS_RESET pin, which is
expected to be wired to the reset pin of the primary UFS memory and is
exported as GPIOs in addition to the real GPIOs, allowing the UFS driver
to toggle it.

Fixes: 0c4cd2cc87c8 ("pinctrl: qcom: add the tlmm driver for QCS8300 platforms")
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index ba6de944a859..5f5f7c4ac644 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -1204,7 +1204,7 @@ static const struct msm_pinctrl_soc_data qcs8300_pinctrl = {
 	.nfunctions = ARRAY_SIZE(qcs8300_functions),
 	.groups = qcs8300_groups,
 	.ngroups = ARRAY_SIZE(qcs8300_groups),
-	.ngpios = 133,
+	.ngpios = 134,
 	.wakeirq_map = qcs8300_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(qcs8300_pdc_map),
 	.egpio_func = 11,

-- 
2.46.0


