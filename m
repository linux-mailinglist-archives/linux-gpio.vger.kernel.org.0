Return-Path: <linux-gpio+bounces-19645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC9AABBF7
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2406C7BF8E6
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CB726AAAF;
	Tue,  6 May 2025 06:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YZS4zISY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B3D267703;
	Tue,  6 May 2025 06:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746512629; cv=none; b=pOG8ap1xBti6tP3buSxW+552RXrb6lV6/yldNmaSnLt6uC/Q/2jNq3p0x6VRIEPksVgx0AlBHbeJGmVBvJk9+hm9gIR+EqdCqFg04JgYOxkbicXbi7bJL0L3oib6gyEHBBNZN3tP7f50b1Vlgf3qkyZWhDUeH0aTYVQG8uvSD1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746512629; c=relaxed/simple;
	bh=iF82xzb7MqPQ3XJrNrgOTP9cIKv0Zk5sAq0pc0Ikjt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UC7Qx0bR4PAERRSOFaXe231B1EA4pNE6GSBn2Nxm7lQs96sZowCrL+cQQz/CRtD4d2pwF/r3hnzC8tvWMASECkSNL0Uh9/c/YE73uqGrijH6Gf55Rnk2C9y5+nD5z2RoOsHsfhUBrRlbPz5CZiM0HwjNjJXe5bDB6wDuP3uVFIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YZS4zISY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KTXcD007910;
	Tue, 6 May 2025 06:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Zy6XD+qeVKcUv/wc3IOfoH/8z6BXzD4hsTb3e9glyU=; b=YZS4zISYP4jf7FFN
	wbN+u29QBi97I4fqjVcvp2SBNQDnAo+vp7qG3g1M0IMD1wHuKyJISXfHrtY9j3fj
	COtkO1R0hDKNtYyEaZZkymvpZuRl68Hka8mWA4PBg6T8CxKak/66M5CSMgky0HLP
	9o4HdxxqlBj7+LEDtATR1/3e8SpaAQT9MfJ4vG+oTrN75SbTewV9jzfbLuVEEMgK
	YKm1GXdPiaNUlxq6De78nK4aajkgWe1A7sS1aOjs5/YYRFlEPIgrM/gSzjllYRS2
	8SXxDnaUEYZwwo8slWmVtBu8Wdcpzve39l6Ur8j3vcFR4K5H0ceIvbJP5KrdW9cd
	+a13/A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep6ner-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 06:23:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5466NfqZ008305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 06:23:41 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 May 2025 23:23:35 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Tue, 6 May 2025 14:22:58 +0800
Subject: [PATCH v3 1/4] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples for qcs615
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250506-correct_gpio_ranges-v3-1-49a7d292befa@quicinc.com>
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
        Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746512610; l=1226;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=iF82xzb7MqPQ3XJrNrgOTP9cIKv0Zk5sAq0pc0Ikjt0=;
 b=pSYsUi4hxwJ+qDufRbcJ70KaQ/bSBF7kcGoPeEA9iMF8IbEViyTdzHqdOHnAd0Utf0CSF0DzZ
 EHUUJA4HrhrAByri2spgPWZ4Z8DdtcktXRcArN6vQsKFKtwnH1h7qtM
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6819aaee cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=MB3vSMhoTmvuE-jUjQ8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: C601t5LntSKfG4fbbE54XOjwjWIHwMUQ
X-Proofpoint-GUID: C601t5LntSKfG4fbbE54XOjwjWIHwMUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA1OSBTYWx0ZWRfX36HIjOSYGgak
 6H93BLKkWunFZgtaoDy6rCiOGcF5ei4zD+TRAKrnVnFDPBDLh/W6jHwndLvclxBNyuTzxoU9Ai3
 CfWr4e7bOZNks2tkvz+pn0xSgDjXZkqu4RsnOj8mdy2k2qW3MPypnZ/eQ6c7J+qY8d1AiVpV9xN
 PnEdp0WY6QV2mzldJs7KVKopOZHquRmPTM5x3dD+RDwXCseZaue4IEyNDtTQlZhYqPtgCQoIwVS
 I/f9TBXnrBBMyQF2Ib9Y9NwjKkhKcJjE6xpjPuhpOCOjQtHyAI+yAEbz3QD3xqevkdE9hw/FywH
 /bL52IV1CNpMuIDlJxKgIAs1mnMWezBBSC0x9FObJJthUImVyiOqpdwk/KTBta+b/oUf23smadT
 nMJdxY5zGLXb2QhMAZQNs66BI6lFYosAF679BNt2UEc5+oFrnpDmmEc2zWsY/17PASorGetp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=560 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060059

Correct the gpio-ranges in the QCS615 TLMM pin controller example to
include the UFS_RESET pin, which is expected to be wired to the reset
pin of the primary UFS memory. This allows the UFS driver to toggle it.

Fixes: 55c487ea6084 ("dt-bindings: pinctrl: document the QCS615 Top Level Mode Multiplexer")
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
index 1ce4b5df584a..2791e578c1de 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
@@ -110,7 +110,7 @@ examples:
               <0x03c00000 0x300000>;
         reg-names = "east", "west", "south";
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-        gpio-ranges = <&tlmm 0 0 123>;
+        gpio-ranges = <&tlmm 0 0 124>;
         gpio-controller;
         #gpio-cells = <2>;
         interrupt-controller;

-- 
2.46.0


