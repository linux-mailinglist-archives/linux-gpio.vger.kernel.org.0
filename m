Return-Path: <linux-gpio+bounces-10480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC83987EE7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 08:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90DF6281AF5
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 06:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD7D1898EA;
	Fri, 27 Sep 2024 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ry7nBY4o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4128B17C7D5;
	Fri, 27 Sep 2024 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727420055; cv=none; b=tPqj9qVyN44rp/siYXkkWmxYqlHvXjuOU4286T98dTty3bpVAuxPZYTFA5C18I1kjm5wfr29psA/GE6vdOkaeprsKLQgyW2ZnYuQh8PzyfmPS7hCDoBw/BFHUzIsgi0Ky1R7tw8NlPAIxsh6zeFJAnAYNI4HS+eYOk7YwCPZIcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727420055; c=relaxed/simple;
	bh=MUxi8+hSu57XP4no15kY+CYWwuRr+uzY3Z37pE1nYyw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lxkV019i7EVVLrxL1N9aYF/rXgkgPrEtTstnlODdI4QfF67m6z2B8+G7cxLLuUVfLX+ChqiIrgMKof746jLDc/NZXvqD5Y8CSMeF4ibNngFVAX45QHcm81OnFUrT+vDP9aZ52ZLiQnblJuOuBljORWCaWomirB1pwWoOZSabbFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ry7nBY4o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6akoi000521;
	Fri, 27 Sep 2024 06:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31bJEj+97KJ2TIQEtRQXtykFG/pb6K80b8VqT3Hzp28=; b=Ry7nBY4oI6my1ZS4
	kEdnyFsSUa/amMRmqLW1eK862tgxXB8mQxKBxjhV11NdiGjS4/mX9V/omZmuhFeU
	7sD7iMbuvGwGToeg9KXvSZqAhstINGzIxSIYPc/IuP/ATJ66uBdGPKBZu9C8CMC/
	c5OPwoY8lXBnCDwAPXkUhlRXhKydWH8RM4IxZj4CXto+PiSLlBnjNUzAMNdIaeE7
	fQaOL3f1Fp695BmmW8rP790mUHSwtufPbdCqOnl4ODtYnt6ChaXmq/ZOt7k0knKJ
	OubiDkCDZn4NA3Iq0Fln19NzR646fh8az0nZuXmbv+TKPiBV2WrBcnuQIBgupsIq
	Gdei1Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe9hucp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:53:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48R6rwEl011616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:53:58 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Sep 2024 23:53:51 -0700
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
Subject: [PATCH V2 7/9] dt-bindings: qcom: Add ipq5424 boards
Date: Fri, 27 Sep 2024 12:22:42 +0530
Message-ID: <20240927065244.3024604-8-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927065244.3024604-1-quic_srichara@quicinc.com>
References: <20240927065244.3024604-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: D0EN-XDwvnDym8r3mcBgF4qVB6vsY9ii
X-Proofpoint-GUID: D0EN-XDwvnDym8r3mcBgF4qVB6vsY9ii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270046

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways
and access Points. It has a quad core Cortex-a55 with a per core
L1, Unified L2 caches and a common Unified L3 cache.

Document the new ipq5424 SoC/board device tree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 [v2] Added Krzysztof acked tag and added subject description.

 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c0529486810f..be4ba058d386 100644
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


