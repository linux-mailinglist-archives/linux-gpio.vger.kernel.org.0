Return-Path: <linux-gpio+bounces-14002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F398D9F7690
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 296897A5AF2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFC1217710;
	Thu, 19 Dec 2024 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y28NPDEp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9F621882C;
	Thu, 19 Dec 2024 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734595223; cv=none; b=JT7PUNBDS+PeR+trybGof+NVz+0c57/+cVS7vaBRIV0/UQT+YGWpciyttFrWYu4igreavMQnP/UZNXEjx+TY/7DPqt7UGCj3LpuYNSfrT0Yn3AVGEeLiR7B4QFh7D6MwNUE5Mo7YEMESMFi2SKwCgKlrkbMN/sUEHnDhh8XLs6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734595223; c=relaxed/simple;
	bh=Uim+s4AokI9yZO5WLXvh5EmZjEbOQDduC8U1CVyOlLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eU7yovqyug9s7w37/l6vDE54f7pDQDWImU3LekdJV/BbuLuo+9DKjtNtjr/jhVPZekjVmcqf3oo9djNv6BjcuJWmIoG5GuByZYXf9KstqJMzG1Vsa8CVG/qNKCXVwGqFfRPB1JsH4jKdEC5c5P9Q16v8myT85L4u3l2LQc6uhas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y28NPDEp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIM2cRP027630;
	Thu, 19 Dec 2024 08:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Z1eswMVxj0ezCgJn6WvIXmirV5KV9PKtfifaFiWZtQ=; b=Y28NPDEp9Sg1hefQ
	jfGN0keq5u/wBCwMzHDIlvthKwxjDEjzxEOPSUtwo8E0b2VN4F36Qn3VeoBcGad9
	MfwvABcoZ1gKb7klltz6j7KkndDD4e1PohPhYQjIiJG62ggLhZoJ+ZoMk8PHN4gQ
	R9ia8aX7wr6jZ1/TOYOrZp2EMaMjf2TWxOuJLXUVfWSpRWJQ2uowfMFM1Cjhp1v4
	HqtOO6pAbE7Cmf2sbT7dA2h52ufjPnZ6LAXZcBZOP4nN9+DwV1O3341FnnFFCS4E
	UIpLxVjU6sJ6smvUEBpSfYalji2b1FuwgRlKgRlex67/jFCl0zSWmCg3/fZ5KIPk
	xJR+DA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m6ues4w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ80ENS013834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:14 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 00:00:08 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 19 Dec 2024 15:59:45 +0800
Subject: [PATCH v2 3/6] pinctrl: qcom: correct the ngpios entry for QCS615
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241219-correct_gpio_ranges-v2-3-19af8588dbd0@quicinc.com>
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
In-Reply-To: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734595195; l=962;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=Uim+s4AokI9yZO5WLXvh5EmZjEbOQDduC8U1CVyOlLc=;
 b=qtObG5Lhw4So6DHZrvymvmS7Cv7wNtRNWURoonccw4HJABl2cA7oT9bChl5/PmN8kjAr+5KeH
 3q9ettHMCCuBrsD8EEb7HoUln/7xby9iNWb2had0jdoDwyD7CFrMQkc
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0G2xYL-wWDLp1AjZH2nfl4tFX4cXYDSS
X-Proofpoint-ORIG-GUID: 0G2xYL-wWDLp1AjZH2nfl4tFX4cXYDSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=757 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412190062

Correct the ngpios entry to account for the UFS_RESET pin being exported
as a GPIO in addition to the real GPIOs, allowing the UFS driver to toggle
it.

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


