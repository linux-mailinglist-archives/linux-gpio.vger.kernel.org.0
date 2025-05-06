Return-Path: <linux-gpio+bounces-19648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD92AABB9E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 882611C25808
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A55D27FB19;
	Tue,  6 May 2025 06:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RropvSm6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC564B1E57;
	Tue,  6 May 2025 06:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746512638; cv=none; b=UeoIGdDBx8s2LUFTvUR+Oqjr+j6afjtK3yM4L+4qEdW33cv/0vEGXoAt8RHUShbli9orl1BYLhNVQ6SYNXh3WZyS29tfQjgYwI5ptSY9f4o5J7mM+AxT646oUoBSdC/mC5OpptYMaW7qDNXDrIeMLkAPQQ+vMiUlsRi0P0X6MxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746512638; c=relaxed/simple;
	bh=WBaCNDDNLr/SBSX8elWpLvZOXsaysk3fPmHoCEHKfLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L0ooKxyYQwtaVvBjWo+NxwCYhmKsxbzbeB2pGIFocV104RZjTMiirBFS6W1ap2W7MpCG6oAma0n3FmqNXDjNvL7/LHN618wtcbwgcDJVWzrM2rsLyXQrYAqX6MqntX8TMYj9YdJV56hox0fWSwoGhK/s31jOc7lrAiPZehPxkhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RropvSm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545M6YhC014186;
	Tue, 6 May 2025 06:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UeU1mEjBAQ9F5mFQrXhDLPpwlXBMOluZ7AN5w3+Usw0=; b=RropvSm6LgcZOckJ
	toRDoiR7dzDswP8OYEosp2GLU6XXj9NPgGLEemP+QQoAWLMqqKnk9Eig9fFiPFXg
	vAFx1+rNMQ7f86d78CQxtk9NO8BNyjvN2x974pkt0ORCvW0DkvmKWuKlKdkBRrRO
	9mY00oKTKxMAvYwdMvVDWbm4zqlN5d6nKJjjREd1rKOW4X+QiRuLDhmCNTMPfG/x
	c35AIlOQyDHr6/7ZbfG3ZV9UOBEuQaPXi+BEMbFmpq1+nVTAS7VX2LWv7qDviEZZ
	xWnfSqjeD4/pnZV+B6Y8Qq18cfV/UThRSTRSG/R9uSpYvQwZxc6hl5xKKHyfgx5D
	UlLUxQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u415fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 06:23:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5466NpDZ013863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 06:23:51 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 May 2025 23:23:45 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Tue, 6 May 2025 14:23:01 +0800
Subject: [PATCH v3 4/4] pinctrl: qcom: correct the ngpios entry for QCS8300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250506-correct_gpio_ranges-v3-4-49a7d292befa@quicinc.com>
References: <20250506-correct_gpio_ranges-v3-0-49a7d292befa@quicinc.com>
In-Reply-To: <20250506-correct_gpio_ranges-v3-0-49a7d292befa@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Jingyi
 Wang" <quic_jingyw@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746512610; l=1117;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=WBaCNDDNLr/SBSX8elWpLvZOXsaysk3fPmHoCEHKfLo=;
 b=KAEwG7J5+LVhxis33UisqrOUqh+3AOFYCWkC8wYSqx65D1tf2wewCi/weNM6V/KoYeY/nDLdh
 qWwzqm/23QfA4WXlv4sNSwVgRrePDykgBhIqIxRIHuPyKRgUcw11Wvg
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=6819aaf8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=D_fDHrIwsaUpvRdOY_AA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8Mmj8uIaztG18TE4gLW-uUNDMtJWLtUK
X-Proofpoint-ORIG-GUID: 8Mmj8uIaztG18TE4gLW-uUNDMtJWLtUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA1OSBTYWx0ZWRfX5r9NHBmabDWM
 yhF7NIomrVEz1eOG/sCteV7DtDjmC0rA7U3eWZdvso+WWgneRuqEtoPuyQUUWA+DTmA9lH+dLcO
 P1WhC7+MmGvPESIA2SMUo9f/wPpIvskpti8wyqg/Knadb1T4tN3vqjNfzGSKCSzFfn4wfq2wSkG
 JqWF7uMLZb/vWjrbXWUPJxrQfEnEiAU5rh0F6fo1odMC03blSBhycOO8rSaje54TCGLunGd/1WG
 eYwwbEgmxCz4PSVYS6pu1ZyXAKBeDLwyfmA4iEyOv2EBVJ35xvcW3RpubIX9NzXEMW9dTTlTbwF
 EXz3Yt5ii6m5LDfCXX5Q1wqW8S6UTbTCV2C/IrD8ZHxTzVL1eQYgtZATLD6kJaucPi64mxT/wzL
 8z/5hm4GqQa8VwHjW/gY77ISV3G461/1KT+Odr88pTQWwO+HQPApve2U7NhWg1y4zxMSGQKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=779
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060059

Correct the ngpios entry to account for the UFS_RESET pin, which is
expected to be wired to the reset pin of the primary UFS memory and is
exported as GPIOs in addition to the real GPIOs, allowing the UFS driver
to toggle it.

Fixes: 0c4cd2cc87c8 ("pinctrl: qcom: add the tlmm driver for QCS8300 platforms")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index ba6de944a859..5f5f7c4ac644 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -1204,7 +1204,7 @@ static const struct msm_pinctrl_soc_data qcs8300_pinctrl = {
 	.nfunctions = ARRAY_SIZE(qcs8300_functions),
 	.groups = qcs8300_groups,
 	.ngroups = ARRAY_SIZE(qcs8300_groups),
-	.ngpios = 133,
+	.ngpios = 134,
 	.wakeirq_map = qcs8300_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(qcs8300_pdc_map),
 	.egpio_func = 11,

-- 
2.46.0


