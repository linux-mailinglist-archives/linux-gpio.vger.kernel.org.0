Return-Path: <linux-gpio+bounces-12184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C149B24F1
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 07:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D07C28208E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 06:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B44C18E03A;
	Mon, 28 Oct 2024 06:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zd+gPW8i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64B18DF8D;
	Mon, 28 Oct 2024 06:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730095571; cv=none; b=iLQO30gCqlEs//k2OQwHXzFHeRH+MYbwQbc7fJVCcBG7J0Gx9YFRZ6yKFXP+JI60Ph7N3JiNEeBEUMYCBC+3mmTHGfOiorUKNqgRJ7BdEm3X4WC+f5krjfWf7WO3d4SkuvlqIpGBAsx+BrzbOPF9gHE4jC75FdeyzG2jyJeOY/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730095571; c=relaxed/simple;
	bh=zxClmlOfsNHVkOG0RUwNUbP0Va1IXbjRxfwaqpAHzSw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJs/l19K0Y16uTcAxdl5cIhj1EPY3aaOnSHliNSkGTVJrflpeIIb1sGqSsbsSCIg17LjbcaKK46HJo4yvW8UNlYvyj2G1IJnwmjBp7M7UtcAUWVkNBOJIC7g/7KqXbPgtXXfKZ0c2yCdMG8V5PIC4hUCRso/cZSAjbfEoBlnGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zd+gPW8i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNxPTT009343;
	Mon, 28 Oct 2024 06:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqw7iUxDzouWwAgTFfi1FVGIxqUuItr6XObCVVgxKR4=; b=Zd+gPW8iHsiFPl13
	2mPzKGu8RKGVgpEkWCb69vskG0jQIB3a4wKiIhyQg1B+UklDCn6FqK8fQTGrEIMc
	cgALiUC6EwVDoEWON6cxuTzYSCgz139uXW4UqxwHGzHDGK7Qhs7u9B7C/sAwLzvM
	o33GZ+Urpzodvu0CfiZQFj8OjxB9OpAzvqDvvGxE09C8YDZ38Jdr/H1VcrlmCmQY
	M6dfkyPAri7J5jFmRyJX+iLua/78BIL+ciYqPG0oefLIexlH2HNnkBWd374tHYDQ
	ghbp7bDXtWl5w0NXAmRnYkXMFC7TCrDQ8BmkBAAE62MlE5eKUuqevyjghdaQuexm
	ybMOxw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4uus5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:05:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S65pg1007498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:05:51 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Oct 2024 23:05:45 -0700
From: Sricharan R <quic_srichara@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <p.zabel@pengutronix.de>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <neil.armstrong@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH V5 4/6] dt-bindings: qcom: Add ipq5424 boards
Date: Mon, 28 Oct 2024 11:35:04 +0530
Message-ID: <20241028060506.246606-5-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028060506.246606-1-quic_srichara@quicinc.com>
References: <20241028060506.246606-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r7SmzSlPQ5gyow33tDc65k9F5Fx_yWzd
X-Proofpoint-ORIG-GUID: r7SmzSlPQ5gyow33tDc65k9F5Fx_yWzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280049

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways
and access Points. It has a quad core Cortex-a55 with a per core
L1, Unified L2 caches and a common Unified L3 cache.

Document the new ipq5424 SoC/board device tree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0f18cb35c774..59c325e8a63d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -25,6 +25,7 @@ description: |
         ipq4018
         ipq5018
         ipq5332
+        ipq5424
         ipq6018
         ipq8074
         ipq9574
@@ -351,6 +352,11 @@ properties:
               - qcom,ipq5332-ap-mi01.9
           - const: qcom,ipq5332
 
+      - items:
+          - enum:
+              - qcom,ipq5424-rdp466
+          - const: qcom,ipq5424
+
       - items:
           - enum:
               - mikrotik,rb3011
-- 
2.34.1


