Return-Path: <linux-gpio+bounces-14005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC89F7692
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41C30188A542
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90DE218AD4;
	Thu, 19 Dec 2024 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AvJGv2mz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2354A218AB4;
	Thu, 19 Dec 2024 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734595232; cv=none; b=VlCHCK7wPQPg2PY3Jv1fgRkLo2XQS+fWzV2VclaMV1GLuN6jgt5fnpUtt9awBGrSJX7B1I+yX7opiu1DXxtTVfM2e0QC+oOd2Min96lhBpB8OduQilR1tpB1qeHvI9fGeNeBR9gsKxVhnJevvw0KTcBFh4fczzBXza+iI+6trgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734595232; c=relaxed/simple;
	bh=u+nIKYuqz1QU6Wn+hoI1usArWWaFErdzelkf+oEfW38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iTN92NXaJp+BYhGuTcjL3YjaMy63h/3JmFc6MfEUTOK+B5J0YHg4YoezYwMtvKBUz5bSRwN8DbbzQz7LmrVIl1fGqCsvoK1D5UNU80h6RO+PBfKcbJnI7aTJYwhVltKy0dGeDPTuzjw+PQwtArk4gSxT5bQDJfmR8KXZebKxnJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AvJGv2mz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ3SY3g001370;
	Thu, 19 Dec 2024 08:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FvohhyQ09v/B9uMyNUwzzkx7xs4YjzO0pt0MdQN0Q5o=; b=AvJGv2mzhzyKZL7j
	uUQEYm9FkKQ589i9NgUbPAwee8u/OWj8w62Sw239VZ/TrzyMLPOlKLzwwXs5u5q0
	3wq6zr7CgmIKXzdOB2Q6lpTPZEnuTH2H4b2KOpKK1Fek+/475Ab8qdBKsoTcO5KY
	dYOGxiokMRzHrRewAgmWpBMjRiYsn6zEQdzMBbCs09ocvBGVNzfsxfALqa1AN/ZZ
	Zo5CGs3KqY5AWB3rvVfLeKq1YFppGVNviORfiUB31if8CvAfpoAEDBCpWUb9HC5M
	D83eo9df5Vf18Ux7EUCb7/L4loxBHgFEakoh5jRRf0HYeYXwDpbHAXn8FM11uRPV
	LkIt/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mbm60jgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ80QF6023027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:26 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 00:00:19 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 19 Dec 2024 15:59:48 +0800
Subject: [PATCH v2 6/6] arm64: dts: qcom: correct gpio-ranges for QCS8300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241219-correct_gpio_ranges-v2-6-19af8588dbd0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734595195; l=898;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=u+nIKYuqz1QU6Wn+hoI1usArWWaFErdzelkf+oEfW38=;
 b=29PaMEtP1yURlVO8VxgTP2ns7rQBbBqpfXyL9VeVcThv/zA3lTXz8JHhF5F9Cgq7UwgRE2ajL
 ZRa+MK5JzwPBeW4yiggf0n2tVuRkkKGpZQv84vT0E3yFuPOf7M+FKvm
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 08Jqw09mk_nqxHL4oqD5lcxo529eKxVH
X-Proofpoint-GUID: 08Jqw09mk_nqxHL4oqD5lcxo529eKxVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=468
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190062

Correct the gpio-ranges for the QCS8300 TLMM pin controller to include
GPIOs 0-132 and the UFS_RESET pin for primary UFS memory reset.

Fixes: 7be190e4bdd2 ("arm64: dts: qcom: add QCS8300 platform")
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 73abf2ef9c9f..07d6d3ff4365 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -971,7 +971,7 @@ tlmm: pinctrl@f100000 {
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 133>;
+			gpio-ranges = <&tlmm 0 0 134>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;

-- 
2.46.0


