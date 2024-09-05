Return-Path: <linux-gpio+bounces-9869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D3496E3A2
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 22:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E45352872F8
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 20:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9894318FC92;
	Thu,  5 Sep 2024 20:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nQ/hIZF5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72F33D6D;
	Thu,  5 Sep 2024 20:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725566559; cv=none; b=KNRibOdG6aWLVCfSZplSz7ZyMSl7571BBgrNXk0UoJV2EpxNZGhyd+byUJTDDqo7tg1Z3j0pfSFe6AIUHDaOrgSIy2lOL4hCg2lmA6c80rFwIJqsmuYLBbnBzac/2poTfBOrhLBm70BZT8jVPzgfpYo2OhE2Q9GjeUk6iv2bXJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725566559; c=relaxed/simple;
	bh=AyKX8+nt2yPLP/ENIDpA19SGhZiScbd4CUZUU3/QXes=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CxboaOP1zNRyRiMz4sq9IQJWR3hDUtUXJOdFId7sfASepSnopRn9/El5uSC/SDJMQFLr5g3Ugqyh1zDENVAmnDOzKT+CoXOg+anA0d1awfTxbzKZjA1EpBWvWtcWKUzXHM8L9NsbUsIYOWIHuj4VcAaolU+QoK2BrTc2vjmIMD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nQ/hIZF5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQQXj027901;
	Thu, 5 Sep 2024 20:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mn7XCQGjNFcU5zDL9Twrmr
	AgmrHe+mhCNT0PPdaYjVs=; b=nQ/hIZF5B3X1/LWuh4PkukuEeQQTnO6aPz5P5L
	jg02U2I16cnd+X2IFtbHg14Ld8kxYoSUKCJ/Nah6y4oVRviXF4vhSJecPvctBy5h
	Qg+LDj4Z+Iqs2Ng2QZc3nOwaHFu0HGb4NU7UCWxDliO4HJFi1V3Q87+rXkUHe/Wb
	DkCIf6NSsDz4IWenUSlHqslkocZ2yR5LvbXS0nKYrr6S5NprgRSfo8E6iDWNZLwz
	E2Hn7LkABS8IslO8VyNnH5nInCWT9LLMjVIkOeNyq2gII/ZmlRQxCRzi04cIFv/K
	nY7qJVSpgIe5HvRQQoF//ZBuiSVpx6OieErsX8i2XUFjyPTQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhx1r66y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 20:02:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485K2UqS029120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 20:02:30 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 13:02:27 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_psodagud@quicinc.com>,
        Nikunj Kela
	<quic_nkela@quicinc.com>
Subject: [PATCH v3] dt-bindings: pinctrl: Add SA8255p TLMM
Date: Thu, 5 Sep 2024 13:02:18 -0700
Message-ID: <20240905200218.3810712-1-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FvK5MaHPvxGa8ai8NNLf8c2LINvqpRXr
X-Proofpoint-GUID: FvK5MaHPvxGa8ai8NNLf8c2LINvqpRXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_15,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409050149

Add compatible for TLMM block representing support on SA8255p.

SA8255p uses the same TLMM block as SA8775p however the ownership
of pins are split between Firmware VM and Linux VM on SA8255p. For
example, pins used by UART are owned and configured by Firmware VM
while pins used by ethernet are owned and configured by Linux VM.
Therefore, adding a sa8255p specific compatible to mark the difference.

Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---

Changes in v3:
	- Removed the patch from original series[1]
	- Fixed mising spaces schema errors

Changes in v2:
	- Modified subject line
	- Fixed schema to include fallback

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
---
 .../devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
index e9abbf2c0689..749dbc563ac5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
@@ -17,7 +17,13 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sa8775p-tlmm
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sa8255p-tlmm
+          - const: qcom,sa8775p-tlmm
+      - items:
+          - const: qcom,sa8775p-tlmm
 
   reg:
     maxItems: 1
-- 
2.34.1


