Return-Path: <linux-gpio+bounces-14004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 246589F7699
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FC6C7A68EE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657EC218852;
	Thu, 19 Dec 2024 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q5uqRcIZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E377217701;
	Thu, 19 Dec 2024 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734595230; cv=none; b=Zd9FBiHdg7XUdbD/9V7fy6sDQ0DPuaXsKwxXSbxmzeu6J2R6LHO9RpTfAM7+tagbk3R8zxJDDVWG/ZX7MwBef/MrziOuCqkRDFSVkS4Anlm3tSPgUmJ65WJm3xwykp10sEpWTIrxB0v6ooPch6WxMdWhIze8zN03TjbAsCPGSD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734595230; c=relaxed/simple;
	bh=Cr2v38MDZjbwZle0dk23yprQ+jNoMblUxVJYo8Za5uE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kaTXgHmfk376y1RcJ6CMI6FX32YLenQEImPCi8X3MGSH/o2rdlvxlsA3wM1K9aEsdlvRVvnBCWjlxfA6RbIqwoyDhLgq1ymiPotd+/9y57UBJk517fBO5DyBqjfVX11vdkWYfXsCJHO7+9Xpp5HWo/c/7FR8w+TcltuTDc1LWnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q5uqRcIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ3rujR021183;
	Thu, 19 Dec 2024 08:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omQWYdz/ILBjVi3LcwNjLzFnbULm0/dBkQSXNfXgALo=; b=Q5uqRcIZHPtt09Xs
	iBDIqLXtav2b4Y2BdSIXJi1omGAteVKSkyiwjbljCJDxL/8FcArFgxhXG+zoAyN9
	LKjF2dEC/LA+AHTk665jxdpZLQyz3Ob99XPKyKitVYpNSW5s5lYSZ0OQPbugwlHY
	Ye+mEd8E3J7lx39NVWolTipPx/ynEdQRchas2K7okhNUsLwWxb3db6fSkqi4Xx8/
	gu80XgWgPz8LVu12xt6LzMwkQG2DSgSOzAUAfjdOpUBQmT3/dNR8J5mRfgn9nPS+
	MagbQ0xhPMRk+tdMQ/FdoXsvgWJlSiOSRaq8vkuqDA7t6IzrzmcrUmJvaJ9pseEq
	rDGsIA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mbyxrgqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ80Mjx014125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:22 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 00:00:16 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 19 Dec 2024 15:59:47 +0800
Subject: [PATCH v2 5/6] arm64: dts: qcom: correct gpio-ranges for QCS615
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241219-correct_gpio_ranges-v2-5-19af8588dbd0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734595195; l=870;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=Cr2v38MDZjbwZle0dk23yprQ+jNoMblUxVJYo8Za5uE=;
 b=a7c0+Afh6EOjxsPkTG1bAHIjAJiFPztIC3vsNN0nAxMS+x2lO8vyX7WDgxXD0stE6XgQPg1RE
 2FdROpTvLNVDWFgOsgvc7Mp8319yRtw/yGaT1rOcsG6nnqz9KxS1ykh
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9m89I067-Oa8qsJd3_nMv-ut3Z31s4HV
X-Proofpoint-ORIG-GUID: 9m89I067-Oa8qsJd3_nMv-ut3Z31s4HV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=509 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190062

Correct the gpio-ranges for the QCS615 TLMM pin controller to include
GPIOs 0-122 and the UFS_RESET pin for primary UFS memory reset.

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


