Return-Path: <linux-gpio+bounces-13804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6C99EE2E3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 10:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17D5A188B8A8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 09:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C831212B1B;
	Thu, 12 Dec 2024 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dDKGAMZ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B6E211A2E;
	Thu, 12 Dec 2024 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995473; cv=none; b=pvx78aOHHVPOGjo7Xc5JC+rLEnuoCe0LxpuYEMnh9DIBz2DyTnYxWhLJEvMy67NTZWDog5HhM7Kbss6eIC92shTiVurdRBhGDCU19a+EHb9/H1e4amFcK3E38+sNRBR1M0B4a5ZNoZ3KtnA5bg4yJdrVOkSXBfpo3OxLMhem2CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995473; c=relaxed/simple;
	bh=zIYQ12j+feJAhrszipzOa0n87tGHIUhx7J6eA51hQ8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Z0yPlDXcHFqNyvyBGy0PA7lg4IANOgpPVqmmTARFhkyTSFa5gMyMO/PguNsFAtHpC0cjSa2nvk+pANXxIiTBLKb/W8468cGjTR/TiagNscAAjO6iNFrVcR2cIiLFR4K49VZ2WqgdXnYnWd8eBEf0+fQG1qH+tgaZOQhQIldjJ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dDKGAMZ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC76tXi027271;
	Thu, 12 Dec 2024 09:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGPsVvNHszyye1MfYO/taPkMBc6l185R+mTpkE54v6c=; b=dDKGAMZ6oiutuzRZ
	y7C4wCcz1/6iVvbzQlQI7ZsxmnUeRaGLFMPdDxzfyET0umHFrqih7O97hMVbUwrA
	vNTuC/B8aFGDoMnRSZF+UxkEbCLnn+Qq/wRYBPmSGKRvPERo1cVrxJL3m9f3Q0UX
	pVkM+nsMpFNY29taeeDpPk+UQlXdgdKPgKVIuD6P3xeVTV8cAqAsFF9fI8PJ8dN5
	x/7HJEo4NynsKDg3agrc6Iw+1w3MxeQPkVcAtwdtDNN92Hk9bNxnkcDeSLQ/vS7y
	wrEOVLUpGj4Zing8eQJVGhkLatg8j7F+1PUPBDYtZCkLvgtGVLhVHjRl67Z2ojZC
	/GycXw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8wnen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9OPs6007721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:26 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 01:24:18 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 12 Dec 2024 17:24:01 +0800
Subject: [PATCH 2/6] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples for qcs8300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-correct_gpio_ranges-v1-2-c5f20d61882f@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733995452; l=1093;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=zIYQ12j+feJAhrszipzOa0n87tGHIUhx7J6eA51hQ8c=;
 b=PSN2/ZDrQBBnUZSl9kqoVVG/1C4jQQVTqj/ycU1c+eyis8lItduSEmTAaLbk1hOoeMhp1GBu8
 JGE7TO8aFmyA4owOl0f4+nN0idI5j77QT1WLfNzijZkjwbOQpjJ+/Uf
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oShOqaZQLJDSU0N_22GSzrBYvgk0d_ia
X-Proofpoint-GUID: oShOqaZQLJDSU0N_22GSzrBYvgk0d_ia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=620 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120065

The QCS8300 TLMM pin controller have the UFS_RESET pin, which is expected
to be wired to the reset pin of the primary UFS memory. Include it in
gpio-ranges so that the UFS driver can toggle it.

Fixes: 5778535972e2 ("dt-bindings: pinctrl: describe qcs8300-tlmm")
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
index bb0d7132886a..489b41dcc179 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
@@ -106,7 +106,7 @@ examples:
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
         gpio-controller;
         #gpio-cells = <2>;
-        gpio-ranges = <&tlmm 0 0 133>;
+        gpio-ranges = <&tlmm 0 0 134>;
         interrupt-controller;
         #interrupt-cells = <2>;
 

-- 
2.46.0


