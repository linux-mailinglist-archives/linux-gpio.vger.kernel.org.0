Return-Path: <linux-gpio+bounces-14001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E549F7688
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BBF47A5CB0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDAE21858D;
	Thu, 19 Dec 2024 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HjN8ipF2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E046221858E;
	Thu, 19 Dec 2024 08:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734595217; cv=none; b=D67+KqxpbcpAfKpXJhcQ+Bel9bMwLLJkROHjz2QdyVRB17u8ZvpqblotUKscaiQKr1zF2wVSgLkltGqIXUkxWhS1Eiig+45z1MM95dzdp9JmHf5XE4HgbegJz5c1UNO8ZcW8jMlvkxi/5ro1Jagly5qWR47th2qHCZKpYk+mty0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734595217; c=relaxed/simple;
	bh=jV/77f9HhqzbK7rNxtNUb9/6GaQEWYDOcYVO0jy0Nsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QHvFdCzSSD7SnIGB/ecqfsJRtVDpBjsRWou2xjRAdj6JArF+L45e5s6vl2H9wRJOPJFWetb62FGGL74fAiDv4JiTfFjGDMHhVAgs2wOZ/vOk1AWyxbr7DvWgoxj8tMwiaeHGwFbMp41UJFjPaDOsQ+Z+FOaxbvORNVkQnp8ESvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HjN8ipF2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ5xk6q021974;
	Thu, 19 Dec 2024 08:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	si2j7ScPjGN8idyGY6UF6OqE8J8iPJEUsXV75ycJ1ts=; b=HjN8ipF2Z2EaWpyA
	kgIjVjCTUCY4rib9kbXia+z80R1g4v0ZDMtugbGbdWuU2jUdU1mm+v7sdMWRiTrw
	f+aPqKbADBfGUY4dfmaQgtKVG6oh4gjO7F2V/ggPSIVUPjOqaAEsqULwJ7KcayEa
	GQMbgQUy6pONQZ83XJRqoenmCYF1/SdvKXpMl/GwsIT94/uly9+OJ2Kdjss8I1PC
	VY6a6nF54yC33brFuoSSBEga92Y6FQZ+0b3LuJl+vNdo17RWm1F7ZSpoSoIGF4zV
	ZFh/+HAk+ea7Y/LCc3i4gMUwQAPH7yd5nMxGpMlphtkbuu2Tw8jMbPoj6OYbnvwf
	zJJiwA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mdu1g9dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ80APn021915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:10 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 00:00:04 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 19 Dec 2024 15:59:44 +0800
Subject: [PATCH v2 2/6] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples for qcs8300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241219-correct_gpio_ranges-v2-2-19af8588dbd0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734595195; l=1111;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=jV/77f9HhqzbK7rNxtNUb9/6GaQEWYDOcYVO0jy0Nsg=;
 b=TAlrGTLzC8eOjFj+NYjgKQN8YDB0Scv/3BbKLexr9MAsV5b8lJ7hD62p6mi7ZT6r4PYDKIz2M
 9s+S2ZVmX9gBMUUhg6oy6tVMem+bcMQ+ML4vwlj9VClHzcOC3yp032s
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4OG3kdUsboJbUqIO1_DLqMw4wBQy1nzP
X-Proofpoint-GUID: 4OG3kdUsboJbUqIO1_DLqMw4wBQy1nzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=591 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190062

Correct the gpio-ranges in the QCS8300 TLMM pin controller example to
include the UFS_RESET pin, which is expected to be wired to the reset
pin of the primary UFS memory. This allows the UFS driver to toggle it.

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


