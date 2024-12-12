Return-Path: <linux-gpio+bounces-13806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C49EE2E5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 10:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9562D284CE9
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 09:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FED212F89;
	Thu, 12 Dec 2024 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ol8SbJdh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6EF20FA84;
	Thu, 12 Dec 2024 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995479; cv=none; b=OrPFYLOaW+6GeLl6pI5Z/n/IkUDZl/wEuEvIzfPCm+V4SWJhqJ84QAFFwp2yRD559GOQ0ht6GC+EnjrtBxdizNX+eDrYQt/FW27Z26O+u5Tt2hdPgzklV2j0pBIsXbcAKEwh7HK2f6CRmnWBPCldhmjvhBjl8cFSqwLUfmi31Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995479; c=relaxed/simple;
	bh=5LKK+SO5hC2cAnTEvvztAGb2N9GBiH9/PsX1WuT1hEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fjX3AbHEM8/x7eABAqiQYnytOv40ssS1WKNCU8fyFKNmMaI6DYfXX2vW3OULWzkgxOU2voeuUNUu2YUebkT3V/WIMCM6gMcE+xzwl4uKNUxTv5BOQZE/gSvzWWJxNNS4ONA7I3kdyHJz9lLs8w1YZij4DUvRPj9aM6R+He1DzGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ol8SbJdh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC83iVV001054;
	Thu, 12 Dec 2024 09:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdYH/N0RLO4O3+8/PEhOKVUoDutC+fmKmJGNstXxLY4=; b=Ol8SbJdhRTSkwl2D
	JCfcIc0fd6gJRaH84kza65qvHuulhVwBg+n46j/STyHj2gyFncPtmOEFKc+K3h8l
	hN0GDp+Wjyiz/bBDIzTLSOo4glVVSFUq1CsvlGBpoXPZ07lCrQ2G/TFMmP89iddg
	iZTVlsWqJPoLa/Kon6fPWx+xOts30tlG8z1pK8rhoizKrXQ/rd8pIzSOw0TOjag/
	a+MrqIdWsV++VnUg0Gc/PkOwQi710TXK79oC/y1P2BMYxIhB4eLfGgLWmPVGb1oA
	PyF6zemLlOUV/Es7N14HPptcJQf04ID8qYK1FRg10pCcAC5DbuGURAltLo+ykDag
	/wLB4Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f70w3pgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9OWoN022857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:32 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 01:24:26 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 12 Dec 2024 17:24:03 +0800
Subject: [PATCH 4/6] pinctrl: qcom: correct the number of ngpios for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-correct_gpio_ranges-v1-4-c5f20d61882f@quicinc.com>
References: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>
In-Reply-To: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733995452; l=1036;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=5LKK+SO5hC2cAnTEvvztAGb2N9GBiH9/PsX1WuT1hEg=;
 b=3Rv5ttP9W22wugBJwlDWK06ul1PWxYTnJB5WDsMJo01P+nRUjIfDMhnxn34G5yQlPchJo3e2v
 LMgGNRTluZeBkYbQgFOypcC6dBCLEBBFzoR6F6W/RbUxpgu7caoYisz
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N88glhk3Onon_6l2135LEypFfdDe9atr
X-Proofpoint-ORIG-GUID: N88glhk3Onon_6l2135LEypFfdDe9atr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=936 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120065

The UFS_RESET pin is expected to be wired to the reset pin of the primary
UFS memory. Reorder the pins and expose it as a GPIO, so that the UFS
driver can toggle it. Therefore, correct the number of ngpios.

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


