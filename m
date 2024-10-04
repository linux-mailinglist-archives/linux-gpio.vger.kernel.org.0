Return-Path: <linux-gpio+bounces-10829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AACAA990109
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 12:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DAB9281468
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 10:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF7315622E;
	Fri,  4 Oct 2024 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BbBlHzrS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBFF155A30;
	Fri,  4 Oct 2024 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728037493; cv=none; b=OyPDwQXqdTcJycH1WEHhs6kUbJeLarDqp8m7hXVah8h/i3q6yozxZn1Ir6TRHwVplELaj7lEtDgg6ySOCvDMt7Q1VBTNqpUy4j3TIhNLeX3AECzjdc/cIbE8u9RosvxxmGbKBplHdclNeRIYheMcoXhD9KkAYvSp9JGeTQriJNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728037493; c=relaxed/simple;
	bh=nmHPQw4bQvdB36BUtR3QdJaXLbaSad1Swsq5ExFgGzs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnMM0ZRQRaAoUQrrbVZB7121D+a2NswGwEdhT3zswulgryXcLlpHSz0qxKqNuT/fYCpbsHvzJ18D4ARsYS8x+LBrWknrHGRHBMpMpI3pwuVLsjLnHsYw2xEu0h6WKxEd0pfjphJgeHiteeR+BCEjuXVCOMrvxZvhZGjyysCDM/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BbBlHzrS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493I0231025933;
	Fri, 4 Oct 2024 10:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSC10eup66MwJl6HbkEscMwnuB9wbzQBzBWnjJZBnt4=; b=BbBlHzrSdirUEu/1
	JGDoy1e6rgAHl5epoMWre9QeR0HRvnrrQOoIXPJHIDiOX9FWYCzwwbC/WKrCvixt
	QPj3HSysH2Wf4AHXbFpNrzJBk/fJuxY5REfrBW+xwL3L4VsdPkbi6o7ODzn531fD
	Tgi3GkLLmtiyY++iz3Ehn/Qm5jLKqbEpvVy13mhIUMWl/CjcYyVAQb1cECMGnqbt
	6l1fjibFJX5GgDE7tcx1RuxLSPFy30n24nTh0LNMjWqcYuePdzPTqFOsLl9mOe12
	aQMp0TbDqeyIEqdbtSZKsuaCgXALu5/Ahz/qAtecnoLusz87WFZwhMwRftcvFuvz
	YllHCw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205khrvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 10:24:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494AOaif021838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 10:24:36 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 03:24:29 -0700
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
Subject: [PATCH V3 5/7] dt-bindings: qcom: Add ipq5424 boards
Date: Fri, 4 Oct 2024 15:53:40 +0530
Message-ID: <20241004102342.2414317-6-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004102342.2414317-1-quic_srichara@quicinc.com>
References: <20241004102342.2414317-1-quic_srichara@quicinc.com>
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
X-Proofpoint-ORIG-GUID: lHoGsLpoVOKMcLOGciq50kSnD-utB2Kp
X-Proofpoint-GUID: lHoGsLpoVOKMcLOGciq50kSnD-utB2Kp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040075

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
index 5cb54d69af0b..9bac084c899e 100644
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


