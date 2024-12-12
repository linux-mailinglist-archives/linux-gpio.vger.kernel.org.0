Return-Path: <linux-gpio+bounces-13805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4393D9EE2E4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 10:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 129211688DA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 09:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936AD212B3E;
	Thu, 12 Dec 2024 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JapCeuQP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B422120E716;
	Thu, 12 Dec 2024 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995476; cv=none; b=NcjZzJfoTUAj3XCOCCkvfCbzyqZPf2JVSZ8pRaGs7yEz0jT+e6cKkeDstidLJoHwhLUALDjVsbQSRyDcseMz63xiS9SUGlQGf+NnWKLrvM83O8+EQT+uiZsYcYPQYmbeIlf8cXOrESJwmDxHl1kClX/AG5hu03xpemc54mP6cv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995476; c=relaxed/simple;
	bh=+i5uX78QBsvHM8KijXJ2uhe/ghCk8bMIeV3FRGs7QIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ghgbwCxM3RP/trUSIbFcRHzgENgYuK64fJMUdw9K+Pozpa9hGSQsNA9cBA5CCuY9XFZMTMcFYJB0gFHVXn2tdQZNQiAZ//H6EXHZ/SNNUghLnMhiUij7mD5JSaEB/8JlkXjaxJn12l3D5wTw3DE3Px9piAs70mFZThrknJn6okw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JapCeuQP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC80jps002304;
	Thu, 12 Dec 2024 09:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUG8f1wguoQh7aNHKHRiY2Bj+TTjQ9emhtX+dD2voW4=; b=JapCeuQPmiDqsQCn
	hf/qflhSVfKTjdIIpLms7p5VGi1vdpaaATmQfvpPv7nF9F8kspTu4hgvVHA1rfbF
	YhUNuhPh+QR0xy/H3UTi8ClVWF0KbR9AtY0JwY61KfsKPJMkygBeJTctQYnfckF3
	drWJiUj3bcwKZt0bXJVKTFgRBww8hkpY6P+K2QtueWPAiOt+b+Hbd9mklDabKOLv
	W/86pzE+dRm3Vq3a97oujYh2i9KDVj4TVNU3Zrpipub4VrCtfy6NQyrdR72ydZpF
	Pze2xrjZxcN5K7nsc+3jP5ZEqoTxXcbi80mq2PjGbJoVY72Brz4229Om/Qsvbna2
	obiVcQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg64wg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9OTUo009892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:29 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 01:24:23 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 12 Dec 2024 17:24:02 +0800
Subject: [PATCH 3/6] pinctrl: qcom: correct the number of ngpios for QCS615
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-correct_gpio_ranges-v1-3-c5f20d61882f@quicinc.com>
References: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>
In-Reply-To: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733995452; l=1017;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=+i5uX78QBsvHM8KijXJ2uhe/ghCk8bMIeV3FRGs7QIg=;
 b=eZmuMfU3Vn9+ZqJ0yUmo0qfESrKeMvarT0E+rH9I5ibrl5mPyJITtx3azA355WWnRsHHx964r
 TjFsEwAFqF3DjNA2JP8X1ECW/BwhZOXn94wWtu8oDXs+BkRtB9RpzJd
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h7MD8SHkPW3-mmtYtRrl4SaKMgCW3adL
X-Proofpoint-ORIG-GUID: h7MD8SHkPW3-mmtYtRrl4SaKMgCW3adL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=901 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120065

The UFS_RESET pin is expected to be wired to the reset pin of the primary
UFS memory. Reorder the pins and expose it as a GPIO, so that the UFS
driver can toggle it. Therefore, correct the number of ngpios.

Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 23015b055f6a..17ca743c2210 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -1062,7 +1062,7 @@ static const struct msm_pinctrl_soc_data qcs615_tlmm = {
 	.nfunctions = ARRAY_SIZE(qcs615_functions),
 	.groups = qcs615_groups,
 	.ngroups = ARRAY_SIZE(qcs615_groups),
-	.ngpios = 123,
+	.ngpios = 124,
 	.tiles = qcs615_tiles,
 	.ntiles = ARRAY_SIZE(qcs615_tiles),
 	.wakeirq_map = qcs615_pdc_map,

-- 
2.46.0


