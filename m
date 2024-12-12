Return-Path: <linux-gpio+bounces-13807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8D9EE2EF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 10:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ACE6188B9F4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 09:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F1C212FBC;
	Thu, 12 Dec 2024 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iBkWxwzT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFFA212FB2;
	Thu, 12 Dec 2024 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995482; cv=none; b=G18rixP/dOFmrQga1Hw/x91QjlyNkTUFBJ0YkOVd5/IxWipHnbSLt+Dj7Ufx5ngxHewv79ZFELOmyxHn8AVUoHxhRBfb2PLMcP+jeQ3cKhQSArjOPCvMithhq2xKHUuzklku0FEZhNZkz/7DKaSLyWyPafYZkgKoO08QGJwEAlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995482; c=relaxed/simple;
	bh=zmlcVEEE4LOyzCKiTZ08CjbPHJqJvWMQMxb07XqmTic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qFOBuwR4C/s5hsTEGA27guzmY7E5dKUj4U8WJ2TH+GlPVuijDLhkt/TuEnNH//1apuamyMQg1OPQ71V1eWY1IPc6DnWbGn40499bK19X3Xrp3Z022sdTRCzRO1LTN4OOM+EzHL6x3Hs0eCydFchdcLccJJevw8birx0fU2wGsSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iBkWxwzT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7btgb000976;
	Thu, 12 Dec 2024 09:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tpy5qGBgVeg517b+QAYHK7Cv7Pry8irb88EBowJU1bs=; b=iBkWxwzTdsQdUCPv
	Sr+YuhVZS6nzJgeiwvyBvpY9yaXR2zJk+h9b9g2/nOorQbephxzn04S4HP83WJE8
	Bqb6XNZ1+gWcr6hEfH/lWxr4cyk4cPV4NCJ3hKgxYC9PZbeC9v7zGMR9BfeU7zTL
	JUlZ65cvYKge/3vDvf//NRdd4xh5cUfBmlMlj8DvF7O/4dCQ2K2m9beeD+ai7Ye2
	p9xRiDg7DBsUNrNPjF1QTXDnwWT3pyqwBn/pnuxHmsFGo8GfwMG10zB0S5RetLr2
	DKmFgIEZkIEa5Mgb5TETrgl4HyesDqiCvBBoZmKT07Xik/RKg4y6Dhv3G/Bi+vwh
	4RRXRQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f70w3ph4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9ObYC031725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:37 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 01:24:30 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 12 Dec 2024 17:24:04 +0800
Subject: [PATCH 5/6] arm64: dts: qcom: correct gpio-ranges for QCS615
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-correct_gpio_ranges-v1-5-c5f20d61882f@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733995452; l=902;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=zmlcVEEE4LOyzCKiTZ08CjbPHJqJvWMQMxb07XqmTic=;
 b=NNuyEWSkg2p4PeOlH2sszHzs/p+58ZJl3jJjnNDqfh7Qv/Kl7RpAdJg9E7Hcp4M4Jw8aJAVgC
 YRqvQ1Zr7EMDrb2oX0z/Fq4/4f8QDqE9wcm+siGmei/E5v7dZX5QvGO
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KI1qnA9_-rd1-zwgNMZlbvF7qD84uHU3
X-Proofpoint-ORIG-GUID: KI1qnA9_-rd1-zwgNMZlbvF7qD84uHU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=504 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120065

The QCS615 TLMM pin controller has GPIOs 0-122, it also has UFS_RESET
pin for primary UFS memory reset, so correct the gpio-ranges for the UFS
driver can toggle it.

Fixes: 8e266654a2fe ("arm64: dts: qcom: add QCS615 platform")
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index c0e4b376a1c6..4c3d8e39ce0b 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -938,7 +938,7 @@ tlmm: pinctrl@3100000 {
 				    "west",
 				    "south";
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-ranges = <&tlmm 0 0 123>;
+			gpio-ranges = <&tlmm 0 0 124>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;

-- 
2.46.0


