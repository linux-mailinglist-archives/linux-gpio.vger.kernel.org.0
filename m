Return-Path: <linux-gpio+bounces-13803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A01619EE2DB
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 10:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8E6C284888
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 09:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BF7211A1B;
	Thu, 12 Dec 2024 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XzHCts1N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0646621149E;
	Thu, 12 Dec 2024 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995470; cv=none; b=IanpjVuldZMU4dWHMDmOmRCXlaW9FHtLeHDkW/q3yulPYHjWEiC4h+g+YC5JdDiQ4ZPfpcVx3P+vYM37b0gFVxNig71S/fSGPE4fVI1iDcsZRUrfAo54Cxoz2pVYL9saTFLkJztgXi2PKO+V/Wfj9n3XmPKezNNBOQlgFdpVhrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995470; c=relaxed/simple;
	bh=4riYm+eCjUP9tJg1L9J/Z1MbwY+Bp/C3D+zImPyU4a4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kC6nBX41mudwsHMgpuY4SWzVL1OPwecP+Jg0PNQy+lA6pl3FpeQCGyuSDIu/XFY8qi5a7cB6WHcF6rXnE4aVpXQQOdIvf1p3i+LcDdZJIHJ1+yluyZtHC86IA8hq45hHbYbri58y2+09+OXUMWgQim3w4imz1sV7kglH66G8zUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XzHCts1N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6o6NU001765;
	Thu, 12 Dec 2024 09:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	01CX5ftzXrGJMq5C6nOlxyCr/RDu1p7KBMIRX1kXimc=; b=XzHCts1NN6bq9fVJ
	9rje+a/2CxlA9ofUp5tqlBFBkzpQ+h8btHtqQa7NMkRzfkhkNKZUMA1izaNUYwUp
	kCQGk1j4GOdyIFtz5ahaFrbgtED9DQr7pAiou2oYI4rDRLU0XJPQRpLOCfz8GmGk
	SmxF/G4SCMtTOTH0ngCsiR33JEQEYpmEEN5MqC3nkgWiXnInrTLHHvT33RfTR0F/
	5GxxC9T6QCLPJf5j9gwNlQpjnZnY4xL/DGdJ3zj7AJpOqlIC7wG7izMTLnwVs6GF
	JcYtssK4V+RjdMzwKnep2/jmx7bn4UNxiDKob1hkM2mitqfbefakW/0i5bCSvTJC
	ZG4zzA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg64wfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9OM0A009344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:22 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 01:24:15 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 12 Dec 2024 17:24:00 +0800
Subject: [PATCH 1/6] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples for qcs615
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-correct_gpio_ranges-v1-1-c5f20d61882f@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733995452; l=1161;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=4riYm+eCjUP9tJg1L9J/Z1MbwY+Bp/C3D+zImPyU4a4=;
 b=oEOHmwnWVanBok5feSmSg47qCnPJKd1ZQb81DaCHLuLT+FEFMFehAeyy6rL7We3Ueg3bOP8Rb
 p+ksnNctDHNAOPzlVO9iccJndGEm34K35VMyZV6Yt6kV/n8iLL2rIxx
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0cnVb3hmHzxpJFaivJwcx-llOqDUu3ga
X-Proofpoint-ORIG-GUID: 0cnVb3hmHzxpJFaivJwcx-llOqDUu3ga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=612 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120065

The QCS615 TLMM pin controller have the UFS_RESET pin, which is expected
to be wired to the reset pin of the primary UFS memory. Include it in
gpio-ranges so that the UFS driver can toggle it.

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


