Return-Path: <linux-gpio+bounces-11537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E03C9A2269
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F3FA1C22592
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 12:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AC21DE2A1;
	Thu, 17 Oct 2024 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kXuX2O4Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C6C1D31A8;
	Thu, 17 Oct 2024 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729168662; cv=none; b=REL2//4Hiy9XY7ZClUvHW4XunbGerSYkk2M/hmL++Ic2X1/RuCdulkRqFpbPtXx8JqZI+sddtrV5AdzTGx5KZv4TJSjj0JZA4yyeF+bxRU6pGpVDQOr0MZFkIFseHLmyR/JGbdZQQooqNx3yAWt9lENkoOGcYBInNru2rSy+6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729168662; c=relaxed/simple;
	bh=g/5slegNOiR/VNyZCJCCLLE+ARI9W8qMC+Id5prqXUI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qSiG618ccpd9A8nXeKDLp3JGv2Bz+iONA0PhSdQi+Qmw080FE300Vk8ffsKLFO+Pc8Tf/x1hTgXJ89rzVWPnlbfy4gHTEMzqVMjknPczVjJOg9YoANrJaT5bun0xCiGvpC0Qb4ovqVuZof4CC7zjCJJRPbfBPZixyJU4FpqLe4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kXuX2O4Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HAMDc3018608;
	Thu, 17 Oct 2024 12:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PNRaUooVexYiPWNv4UoDmL3l3UxHRrcQlqsl+UdTWsA=; b=kXuX2O4QlKyhsH35
	O23TYg1hzI+L8pezEYaS6mWxaKMweeD0NkuWPqXXtToxV/DBjHEe/YNq7grkl078
	UI1wOgZURFDQpZs9+S+twyUV3mE1zTqriXlGTkpgNLw0NM7aaJysi+qnb2NoHPhE
	oiUiqgoWZ0ixDIim+vVdBoMhsS5X71W+R2IvxBnS9NzVwV6zhMLIRReQM6LWWg4r
	VwS9VN5nj3NzTPGPptempgYBceMUPONDBXCkwYfo/BlIoFPINzMl5chwESxIdUc3
	sHlEPMn7YWkwefTNCH7ZEcT8I3OdingKNiiK4uTvF+fGShAEb+km/wzLJyU6ZJ1d
	JMrGMg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b0rx0bxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 12:37:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HCbGZG013308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 12:37:16 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 05:37:10 -0700
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
Subject: [PATCH V4 4/6] dt-bindings: qcom: Add ipq5424 boards
Date: Thu, 17 Oct 2024 18:06:24 +0530
Message-ID: <20241017123626.204421-5-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017123626.204421-1-quic_srichara@quicinc.com>
References: <20241017123626.204421-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6V7V_t44V3p3HlVePyl9ddc6WxW0knXF
X-Proofpoint-ORIG-GUID: 6V7V_t44V3p3HlVePyl9ddc6WxW0knXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170086

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
index 5de6290cd063..c79d53e54522 100644
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
@@ -350,6 +351,11 @@ properties:
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


