Return-Path: <linux-gpio+bounces-22127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1FAE7A15
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FB327A8447
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2257626CE1A;
	Wed, 25 Jun 2025 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jK3IIQpI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A30626C39E;
	Wed, 25 Jun 2025 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840192; cv=none; b=eECwxZcVNbLXm3GICCG/2ji8jBCAqStIh2ctH+rMa8Eu3FFXGHZruyUJpQ1GgBJO46gMCHy8meaE+yMHUX1MHWOZ/DXDxyVb1vLWvfvIbUPzR4QnmzJGBsMmE95KLalG9GS/MVOqRos0XmoljA3FToUkJn8sepBc0S3p2Ej63ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840192; c=relaxed/simple;
	bh=jd/ME4RBzQ++LTfqxSPqMFAzscFIcav5xgKVe9X+qN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cEgmL6tTn3rGmGGLZgvCEEzLXJg7fTCdnuARNMM4q3Bp/MT/kFsIV2oaptDclcxB01wQx58XcQtJ56Y0PJeG2X534E4nfY0J/cv4VB2Ik5k0JY+aeIkqZwWXFvWbcFu9DSCGavUOiVcKhqrlJwpooaPsBasbe1bkML/re/MQGAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jK3IIQpI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5UaPW014612;
	Wed, 25 Jun 2025 08:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jiCgt6Q/FKl
	Fl2P6MNNudSjBQgrE/yE8+G0moVmAdpA=; b=jK3IIQpIZIJEqhNI4Ld52Gy0jgM
	vddUuc+zu/lrqmk/IKkDv6uMPlqyQEySyIlT+YkVn4fjO6/KGqkkRfv3mKst61aS
	JHbtaXEIOv54+jXKCuPq0/hprX13caYGJwGLYyLmVNr2JhKnf9MnHsyvHGfuB9MZ
	RgYHspuE/qFoJMvVG79N8Gym+JdlPphxQEAokWmWIbCtbkKm7RppPJcKeCmCqFsv
	woQdmKoMJr2OjdoGlutY82+WGbNZg+rOJaF99q6EHRrUTiTiM240wYWJ5zOZqxwT
	pJeH1NH/M1tbOKZfDJkgsogx7y9ehXGkYlvZbE4rz7pVTnxOhaJfKL0bjvQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpycaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P8ThfD032597;
	Wed, 25 Jun 2025 08:29:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntm2epk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55P8Thdb032576;
	Wed, 25 Jun 2025 08:29:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55P8TgFj032569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id A72905CA; Wed, 25 Jun 2025 13:59:41 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v5 3/9] ASoC: qcom: dt-bindings: qcom,lpass-va-macro: Update bindings for clocks to support ADSP
Date: Wed, 25 Jun 2025 13:59:21 +0530
Message-Id: <20250625082927.31038-4-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
References: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685bb37a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=GgEp1UNpQFzzL2smpCsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2MiBTYWx0ZWRfX4Lvt0G9LsvH4
 a21q+QmuT1eXuCKoRt/+xbWRZJ9AUrrujoJchDBiqT+5bUHg68m8I4DPUH3lKyM90ekRXz6jiCO
 LGqFdPIwb/4/4yCct1RgREw7GAonuXr+T8hk60sEZsP+AJ+i0GPla9TwXPCBE0xhlYNXiemjSQT
 bpFwfZnfLeL5C7MGGTahNqzEdlWiphnmeTeAa7Q9zoOUNtDPBLd8UAVl4bkpJVFCCIxHG8nIkzN
 R3d8X3jQXUbloMpVm+Q6mV3F+OiVx9Tbaa4jsGEvg2UiMr3q+Lih1zk74YE3BmYLyzxzSlBQO2g
 wwBoXKrvZnm8BhW53jCqHEuTgkjUq7/BOTOAGdF/7u2yOSm90hwfGzZacyAX+OpQJFemtzHirEa
 3p8V5QzflI/NisbPs2NwFv2LaEd7aRdTEQ7tnkhYdaQKbax/zWCGzfa0Ajr8StJvbio5FLm/
X-Proofpoint-ORIG-GUID: jJGRK_XO6SGGvqeGK8kt1O8kVzTd1j5q
X-Proofpoint-GUID: jJGRK_XO6SGGvqeGK8kt1O8kVzTd1j5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250062

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Manage clock settings for ADSP solution.

On Existing ADSP bypass solutions, The macro and dcodec GDSCs are
enabled using power domains in lpass-va-macro which is not applicable
for ADSP based platform.

Reference:
 - qcom,lpass-tx-macro.yaml
 - qcom,lpass-rx-macro.yaml

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index f41deaa6f4df..38679a4f21fa 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -75,14 +75,20 @@ allOf:
         compatible:
           contains:
             const: qcom,sc7280-lpass-va-macro
+
     then:
       properties:
         clocks:
-          maxItems: 1
+          minItems: 1
+          maxItems: 3
         clock-names:
-          items:
-            - const: mclk
-
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
   - if:
       properties:
         compatible:
-- 
2.34.1


