Return-Path: <linux-gpio+bounces-8124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F371C92BA84
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 15:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA6502886D9
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 13:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFDA15EFA5;
	Tue,  9 Jul 2024 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pnu1tZev"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864101581FC;
	Tue,  9 Jul 2024 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530312; cv=none; b=u3RNjxtRMbpn84bRLLUAlv+WsvxUrt4HcQOghoUPtiIHjaoyeq920t46YKw8fFlX+B5OaFv6y0QQDbSraA58+8wBXVkZZGiqN0VAaMzX4BMXNisUzuRRy9dlVcaM0/KUlyIYFtAnvpbp+LoL8V7afK0DbM+8uGfKQXUuUYAXgrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530312; c=relaxed/simple;
	bh=9sNRl1MnVxLEfXaRwo0qrmSaRT68JK4pTrZhjdBgJDY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=k4I7xwLPMWufj/MYSZtodloOX2AkPZAaUhJdEVxiMw3Zb1NBvYzezHyTvB7s4g4eVti8CaPsw8KvqHMCKy6dAI+GtVG02AS1aGo6FNFu3T76Ni4tLuuAp7QqW6w3Q6qP25xYL7GCP/gFgLFieYQxhtjficCmi78R8BPiylyRX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pnu1tZev; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469ABP3u000592;
	Tue, 9 Jul 2024 13:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hB3QqxJUrMjWAQxogofR0D
	eijDSTZhPh92oYebEyWxk=; b=pnu1tZevSVlpkaIaw6YrZNfr7EZ+2Jz5bT4rJJ
	/CKlhJyLyEmLq1cC61lQYpW8g56uPCRj+oB+hqZtSZ4IGVIaJP5Qps0ONpKq0Gq6
	k+yb55dWLxq2Nh767iGPN9VUWH22/r+mlK77l0xfrI7AcY/Sgt6QG1z/EDy+qKIs
	bzupq+mWWT/lQGSe8QsCanvzeMEcyf0iHJjKj0STdWt/JbkcoXDdsCf2RVxZVUar
	2iAnT5mOTn9U6IlcCIZK/PefkBQj+ayEZ9fWm0242iN33+IpurFB3SFXVbc/+f13
	dkOrm+wE64zphzngeVkl591ZExgo3CbiCSojzJTivNy4rmGA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wjn6qjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 13:05:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469D55wq007979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 13:05:05 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 06:04:58 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Add the QCS9100 tlmm compatible
Date: Tue, 9 Jul 2024 21:04:40 +0800
Message-ID: <20240709-add_qcs9100_tlmm_compatible-v2-0-d025b58ea196@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGg1jWYC/32OzQ6CMBCEX8X0bMl2ESmefA9jCC2LbALlp0g0h
 He3mJjoxeM3yXwzi/A0Mnlx2i1ipJk9dy4A7nfC1oW7keQysEDAA6SQyaIs88H6TAHkU9O2ue3
 avpjYNCRTyowmZapKxyIY+pEqfrztl2vgmv3Ujc/32Ky29OONAROdQIQqRQAtlRzubPOJ3K0q3
 HkDdjYKW2ITzfhd/n9qRgnymNijUalCbcpf27quLwga1cAFAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720530298; l=1705;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=9sNRl1MnVxLEfXaRwo0qrmSaRT68JK4pTrZhjdBgJDY=;
 b=SvIL2Bq9cRXBB7/FaKet4VOsbxFpjtccyo0vkcDL1uT/uzM+cITjU0mKjQOQXSSDamttdyVeJ
 lVOs9riO109CxED3N2GwpVIe7eg+qAvxlp7K+6RvUX2X4gAKqRHVW6f
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mhjJOr82pfc_afyNvc0PUylwMflBt6FD
X-Proofpoint-GUID: mhjJOr82pfc_afyNvc0PUylwMflBt6FD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_02,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=640 clxscore=1015
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090083

Introduce support for the QCS9100 SoC device tree (DTSI) and the
QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
While the QCS9100 platform is still in the early design stage, the
QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
mounts the QCS9100 SoC instead of the SA8775p SoC.

The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
all the compatible strings will be updated from "SA8775p" to "QCS9100".
The QCS9100 device tree patches will be pushed after all the device tree
bindings and device driver patches are reviewed.

The final dtsi will like:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/

The detailed cover letter reference:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Changes in v2:
  - Split huge patch series into different patch series according to
    subsytems
  - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

---
Tengfei Fan (2):
      dt-bindings: pinctrl: add qcs9100-tlmm compatible
      pinctrl: qcom: add the tlmm driver support for qcs9100 platform

 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 5 ++++-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c                           | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-add_qcs9100_tlmm_compatible-7e9b8e1bff83

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


