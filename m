Return-Path: <linux-gpio+bounces-8123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D3B92BA80
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 15:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB53A1C20AFA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 13:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E8315ADB2;
	Tue,  9 Jul 2024 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P5t9WoN9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455331EA74;
	Tue,  9 Jul 2024 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530312; cv=none; b=udOtGHhQSe9+QqQ/jV1NtSyyTc/wSGu+QQPwTx5ZAI4h+O7zn3M9JsfDdhTgssR5RIDlQXYEF9bioQKB1giM+2WUjLrYOnSyogu8teqAa3Jbe6FOdwrMiDqE29leHwRAhiL9ZV8KyQ7PFTzDoB5w1WpW6xuqzzEjclLkuxQiPYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530312; c=relaxed/simple;
	bh=IE9hWPw5eHljDFsLKgbJx4uWyHIwPLLxLjnTz+9Y/J0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eE+F+vuav5jMhrsQA/5p/C9gftfaACz4iT4rcb0bUeet8Iv9j0dqc8FJ3qxUN3LEV9R9CLVTAUoID9WRevEN3xk6o92Mpjnqnrp70lzCM3N63VsGBIjeBJu1ZmnO/xIaHAD0pkKoi2V8vSaa4iMoo3GqZp5WlwlAplPDVZTpaxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P5t9WoN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BeNEa014159;
	Tue, 9 Jul 2024 13:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLUuy2vQIs8XY/VBd7sdeG66L82T94PHkQBy498fKOk=; b=P5t9WoN9MQwaGOte
	03rSCN60Gqitysc9HDw2otQcq59P41oWnwPV1lQR3qrMDgjcNpU+rik+pWwS4wL3
	y8xXFfdfgKc8NxgCwtS8qrxvVcePh2y+qKPw6o04xFiO4zZmiOHdW4fkLWqSAwK7
	ooCBTEqFs3oYQZ2sa6dVWGiqMxa3brqf9On4PKxVFmuBkM3fvtrPiOLP1NYlEgGX
	/YfJgbwJY9vMyJS4I4v6psHuC2XFe9M19IGI5GdDnfl5XpMYT79IOKDf33nT11oZ
	YcBCNvEH9Wf3pAfNiFbEPF7fqr27F0saINurRJNSUl935p8l5eRQnPxKVFv/FQMt
	ZpPSpA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xa66eam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 13:05:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469D55Pu008781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 13:05:05 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 06:05:01 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 21:04:41 +0800
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: add qcs9100-tlmm compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_tlmm_compatible-v2-1-d025b58ea196@quicinc.com>
References: <20240709-add_qcs9100_tlmm_compatible-v2-0-d025b58ea196@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_tlmm_compatible-v2-0-d025b58ea196@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720530298; l=1098;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=IE9hWPw5eHljDFsLKgbJx4uWyHIwPLLxLjnTz+9Y/J0=;
 b=CJMLkUmz/UjO5n/za+mqLrZ+mTfeL2zV4rQncbNIx7w0GcCZenTL9/MkUqfnCztMpH67N5a+Z
 nCY5QrvoLRzCAEbwTxjjoaCLAM6KUB355a7n4LEABeZHhAWDdYGYT0p
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PiL8T7U7YBO0ecEk9EL7ujhUm6FDMbSF
X-Proofpoint-ORIG-GUID: PiL8T7U7YBO0ecEk9EL7ujhUm6FDMbSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_02,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=764
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090083

Add qcs9100-tlmm compatible for QCS9100 SoC.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcs9100-tlmm" to describe non-SCMI based
pinctrl.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
index e9abbf2c0689..1bdec08efc4a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
@@ -17,7 +17,10 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sa8775p-tlmm
+    items:
+      - enum:
+          - qcom,qcs9100-tlmm
+          - qcom,sa8775p-tlmm
 
   reg:
     maxItems: 1

-- 
2.25.1


