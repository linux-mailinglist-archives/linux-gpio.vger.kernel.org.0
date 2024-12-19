Return-Path: <linux-gpio+bounces-14000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D07249F7680
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C912B1889DDD
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B442217F57;
	Thu, 19 Dec 2024 08:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UKyea7U1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB57217735;
	Thu, 19 Dec 2024 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734595213; cv=none; b=sfF3yVBJDlgsSQQ18x2H2siV7xi3h3bOtWkX1BIn2Dr8HOUIYws+hAl1V07ttgnDISbSkbtueoSXpvY/uv6eC4dte+KYBSF2KGWo1kMIL8X2dfWbcxSnNChTlkebr1qg46P10J64og1kUUhqwZSoHtJSoCqJ3ISyMuHB8hCszTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734595213; c=relaxed/simple;
	bh=9jk1D+wJrInBrG0/lQa7/HL/n0/ZqcMUeU2oZQycdzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ljCXlwS1RimBzrCsVBiCRQqwRFS/fLQStmjyk2nrpPpN/+PO2w4gDCpsaU3VHpIriRQ78/nMUN9iOBVoVxx8Je9r8HpNvGiVyzZWIiYf7R6GSpWQKp6r4lLQehJ5Dy3Eu0IyCmTSeZZFKwht+WebN3cI0MOd2e70wajpUF8vJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UKyea7U1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ27lCW016162;
	Thu, 19 Dec 2024 08:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uumV0RFumim0h5ewdxPorXIyNOHvxtX3hscwPoLucKE=; b=UKyea7U1NoyPydE3
	DfKcmK8ZBC/4zle0R2gIU3dW/0V0yvBjEHZtXSAFljBwvPVTYPNsGZULkUyjeGOY
	KTy1RBkiUFDaHQSwzRQ7E7pXM5afKPIZ3rMuR8PGbPWsudaWfD3DP4Nc7kqG6Ga+
	HXXrbEEIE5MCrbm9u4Fe+N9kpQ3yyx8BywaVn2fpmS785YBBBvfzyYJ4FKAUsVQF
	kzn4NLCX9jITschzkq5bsF6AY/x2E7EXsgylmwgYLk+JuCZAbP8/YhFrCRVhKb6g
	Wmr/w6jm+BZRKCUp+xxfgiIxBXMOWazIN+FDf3iYWvFuT/GzddZKxk91Po24UmL8
	/hrzMg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43maeagq78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ807RT031744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:07 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 23:59:59 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 19 Dec 2024 15:59:43 +0800
Subject: [PATCH v2 1/6] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples for qcs615
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241219-correct_gpio_ranges-v2-1-19af8588dbd0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734595195; l=1179;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=9jk1D+wJrInBrG0/lQa7/HL/n0/ZqcMUeU2oZQycdzc=;
 b=vMhHoPSrDxPkpyBf929qMviyFsbxKWVpAvjx5xN6vQTZKkjay4qLz9gBL0qGDGhfHvZC0BRH9
 lvR82KTmec1AnZJwWFrhOiD9hatfoeoyQ0wh58AEKYNFah1UgCkxtsn
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nElV5oyvAsPhKCPjdMdw5NHWTc4F5PeC
X-Proofpoint-GUID: nElV5oyvAsPhKCPjdMdw5NHWTc4F5PeC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxlogscore=582
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190062

Correct the gpio-ranges in the QCS615 TLMM pin controller example to
include the UFS_RESET pin, which is expected to be wired to the reset
pin of the primary UFS memory. This allows the UFS driver to toggle it.

Fixes: 55c487ea6084 ("dt-bindings: pinctrl: document the QCS615 Top Level Mode Multiplexer")
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


