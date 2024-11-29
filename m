Return-Path: <linux-gpio+bounces-13338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EEA9DC000
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 08:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 043CA281638
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 07:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCAC158DD0;
	Fri, 29 Nov 2024 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dl0mMZ0j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCDB158558;
	Fri, 29 Nov 2024 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732867145; cv=none; b=BzNQkGU9zrjyyTEPeGKtT7mnDfp8Ht//hl7to+zpauDP8SBKBIG+tDVTzNCFunQCuflLua1sF/KNQ/SQX9AHz0SYjA6wC5UgIv0xyZ+roH96Nftq2Aa9IU774gr6x6IH9AQc2qJceRb8Pjikzq0XvaTSIbzml8qZXDfpyB58OqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732867145; c=relaxed/simple;
	bh=+Yc4b2vwMOMUcnhy+3PRkpU/S2QPiJtYGy+jm215PqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aRvbra70Pr3DIiCYvLlJ9Je7qxfG1dMbjmQqUX0Qsf79v4skpP8MbpJSL89Rwn+LB57uMt6l5L28lqsY/u2hF5ai3cYLc3Cx6i7ZehLWF+cEIkcrYwdpvqmBXad8B8zonLha3W++ncY+L/MLD/OCSMDjVIIx6DCOh/qU7dedtA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dl0mMZ0j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASMfxqI014340;
	Fri, 29 Nov 2024 07:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NS32UssW8dHqvhKdozniXo0XF8+DxtclGm3SwL51JBw=; b=dl0mMZ0jkdHd3lVP
	sb3OL8Xf3u709NIWOY2bF8opeZ683W5XNq/pGHcyRLVlnBGMBPHD4mZAt/yuc5Cu
	tYqzD+T0wddujDrlId4dkXHzXGo5YynPw5iKlQNk9PPUPchx5EFnAfwuFfm7Dfbd
	C55gBkvNvCsMPt0ntHsqz6lwBWyghe4mTLqi2bCv76HydZDDgWf97c9xNsfZPLbq
	Cpuk5t3r96gG3cOxZNw91kjdiDV71brfw1xbDIG4DAGgpBup2Xp28aG4SobNws12
	DL3MOfRqeUEAeApmo9EBKkGdVa3yBjDS+KrzdHzZjRX/h/kCxZkgGUlAZmsUgWzl
	V+I9Sw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43671ecrd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 07:58:42 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT7wfX5025117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 07:58:41 GMT
Received: from szioemm-lnxbld002.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 23:58:33 -0800
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Date: Fri, 29 Nov 2024 15:57:41 +0800
Subject: [PATCH 1/8] dt-bindings: display/msm: Document DP on QCS615
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241129-add-displayport-support-for-qcs615-platform-v1-1-09a4338d93ef@quicinc.com>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul
	<vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <quic_lliu6@quicinc.com>,
        <quic_fangez@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, Xiangxu Yin <quic_xiangxuy@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732867102; l=1433;
 i=quic_xiangxuy@quicinc.com; s=20241125; h=from:subject:message-id;
 bh=+Yc4b2vwMOMUcnhy+3PRkpU/S2QPiJtYGy+jm215PqY=;
 b=SM+aQp2qsJdegx3yOSGJbLaMppSV1CHq3Mi6hRrWpub+a6ouc+09NZqcx4CpfJn1uao4Qoo9P
 lqWZec09FRYAB/xemJprnGnysaxVHco7f4/5gRUZsEGQG/MKzZMWNbX
X-Developer-Key: i=quic_xiangxuy@quicinc.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eAIGp_6-P54BTI5KJ0I3w3Ct6dalNf2y
X-Proofpoint-GUID: eAIGp_6-P54BTI5KJ0I3w3Ct6dalNf2y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290064

Document the DP hardware found on the Qualcomm QCS615 platform.

Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a212f335d5ffae545d2e5bacec95299ca45e8405..a609245ae601bdc60b65f19d3e59c559886a969d 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,sc8280xp-dp
           - qcom,sc8280xp-edp
           - qcom,sdm845-dp
+          - qcom,sm6150-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
       - items:
@@ -109,6 +110,18 @@ properties:
   vdda-1p2-supply:
     deprecated: true
 
+  max-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Maximum allowed width for display modes
+    default: 7680
+
+  dp-hpd-gpio:
+    description: External GPIO for controlling HPD when a 3rd pinctrl is used
+    items:
+      - description: phandle to 3rd GPIO controller
+      - description: GPIO pin number
+      - description: Optional GPIO flags
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:

-- 
2.25.1


