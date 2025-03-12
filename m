Return-Path: <linux-gpio+bounces-17476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E61DA5D74A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 08:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CD1D179985
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 07:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F5A1EDA0D;
	Wed, 12 Mar 2025 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WzeyzxuU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3441E9B07;
	Wed, 12 Mar 2025 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741764327; cv=none; b=BePaiwZbM5tq82EjF8RrcQueteTKFkmmWYIeg5fq4n7qzpe0p18aHFyMDRDc3wMFCWQZP08Z78ZOPIq6XPIgF4bTLV8RhLUYz6aRAK8C66UtHSjFcPK+PDTedWAk/2/B8ubVmz4XQIJegsljZX/u4dhE8yhvelF8CPOhF1G4nSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741764327; c=relaxed/simple;
	bh=4wdZt98ymgj77FL90+8Nxj6A/VyoknyKB/g7LX2gJ7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AT+d/4HXc8UJ/IBD4UMwg77eAV9jSwS/cquqeUG3G88GJWVzfEWHAjAzALr1RK32ZmPlQomIKIAk1hEpJ1qNw79JRnF8RcZB5RE0M4k/6lbjq58ljpskrfTKyl/ak/MzH7UF1nUNq6JIdpZrgCzyITI8/KOSHwBc4h31tOse4VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WzeyzxuU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHjM5024033;
	Wed, 12 Mar 2025 07:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aK3in16gEy3
	3G9FQggpuXTk0LxqM3EYxWi1KcXPCsh8=; b=WzeyzxuU5qJyLRE7SQfHg9sPNpw
	WNfAdEjm2MEW9vK9DGBZsc5SqpZuqnGV+TiO944laHisPghfOXks/qd0HtiAMRT4
	C6VdxHCyBhfEDkURjgEW5y9+iAcMnSlGRCMSoSSvVFTHIMmejXJXaMvw+da/2XaA
	368Es9AWGEOnAjPm7HbaPvfZrUzHlpafR9yqYIKsS/Q40qpBr1BQWAzMKrjyf8c+
	neTtTwkFvzxXOUukrZ5JLGP9e5rQnt4HVKnncuHi1QzpDFSEwskFBfW0pos8ni4J
	yWBTKfakXjRRQucay8oaa4l5fjP6DNtcFfT95Q++WqXqU9qC6CGhIzaNzpw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2mhfyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:25:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52C7KJ6R026194;
	Wed, 12 Mar 2025 07:25:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 458yn3ehmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:25:12 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52C7PCej032123;
	Wed, 12 Mar 2025 07:25:12 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 52C7PBUb032118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:25:12 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 33E014FD; Wed, 12 Mar 2025 12:55:11 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add egpio function for sa8775p
Date: Wed, 12 Mar 2025 12:55:08 +0530
Message-ID: <20250312072509.3247885-2-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312072509.3247885-1-quic_wasimn@quicinc.com>
References: <20250312072509.3247885-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cXsXetocu2SkClVS2zyRPUT3LKw-4thS
X-Authority-Analysis: v=2.4 cv=aKnwqa9m c=1 sm=1 tr=0 ts=67d136e3 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=5_jBa1z3s2bRgKnxzqEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cXsXetocu2SkClVS2zyRPUT3LKw-4thS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=958 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120049

Add egpio function for TLMM pinctrl on sa8775p platform.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 .../devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
index 749dbc563ac5..7a156b9bfaf3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
@@ -79,7 +79,7 @@ $defs:
                 cri_trng, cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0,
                 ddr_pxi1, ddr_pxi2, ddr_pxi3, ddr_pxi4, ddr_pxi5, edp0_hot,
                 edp0_lcd, edp1_hot, edp1_lcd, edp2_hot, edp2_lcd, edp3_hot,
-                edp3_lcd, emac0_mcg0, emac0_mcg1, emac0_mcg2, emac0_mcg3,
+                edp3_lcd, egpio, emac0_mcg0, emac0_mcg1, emac0_mcg2, emac0_mcg3,
                 emac0_mdc, emac0_mdio, emac0_ptp_aux, emac0_ptp_pps, emac1_mcg0,
                 emac1_mcg1, emac1_mcg2, emac1_mcg3, emac1_mdc, emac1_mdio,
                 emac1_ptp_aux, emac1_ptp_pps, gcc_gp1, gcc_gp2, gcc_gp3,
--
2.48.1


