Return-Path: <linux-gpio+bounces-13802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F96D9EE2DA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 10:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 064BA188B694
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 09:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AED72116F9;
	Thu, 12 Dec 2024 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M7WAJLyh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AEE21149E;
	Thu, 12 Dec 2024 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995465; cv=none; b=bmSVGbhhHskaqwi7jkiFsuS6emzja7q4jktmNmhyrYJzAyYPOxKI1OevoHbPfQlwm2T7jKqbpw5oJ/hTWqbOeXHeg5dyAlsMIKNvMG5mGOk9cfe1AAbHcf2kTa5G5JfNhx9lnNLMmE3WLsa84DVL8/V9MynbZwos4/907BwsqBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995465; c=relaxed/simple;
	bh=6E/T+GZ5juoXqET0Uv5nEv8S2NdF/YnTyLRun6ttthE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=aW6vWOQ3n3smkGrZ2fRpvBpOSTzCZtzGo2SiQV/yRe522xQXlaByH5YMryeMoBATRYL0vzinM9BHQgBiw5i0GImQXQ7zwmZQ5AqJuYef+XtxstPoMpsFxxql/JrVWkwmrIioSDE8uUeYZWflAQMZPYXfLJPQadfB/Zi0jibITjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M7WAJLyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7QhB0029905;
	Thu, 12 Dec 2024 09:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vruSfhkHwPeSC3Q/54ME5b
	1o6qN3z5UKTYp8dgse4f8=; b=M7WAJLyhOPLPGiu3NKcHoww0oa98JZg9w6tlsV
	CaXdoJQAVAIVk8QWKC+VvslNh8unINRHUEOZrRjpAMJUbRwVyyW/Iq/5F0H7sESC
	QYWUyTcYbFkyM8wm1k3UcbKtLHLRAN1KxDeq/1KNFvlp/ropcGtygYtzfA0i5Xkh
	QqpbjI4KqTdjrRgc11ugO0Mslp6imfiMV3J/LnumLHr+LUgO31jyFyrtgcHndmYx
	91tpMwog6lcP2/fwJtyHgNHiTUEhAFsDb3ZcZ1CQ61ivCp+RgGDZ5bgAju+Qlbko
	YiPwm3wMaKNi5OQpTHIaimD2bNlOkuwu9NN8jTARioB0sbLw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xtd2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9OIYw022235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:18 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 01:24:12 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH 0/6] Correct the number of GPIOs in gpio-ranges for QCS615
 and QCS8300
Date: Thu, 12 Dec 2024 17:23:59 +0800
Message-ID: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+rWmcC/x2MQQqAIBAAvxJ7TsilKPpKhIhutheVNSKI/p51H
 JiZGwoJU4G5uUHo5MIpVtBtA263MZBiXxmww16j1solEXKHCZmTkc8oivxkcbAekUaoZRba+Pq
 vy/o8L/14FZdlAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733995452; l=1516;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=6E/T+GZ5juoXqET0Uv5nEv8S2NdF/YnTyLRun6ttthE=;
 b=UkpbjoW625oPEv/ILcZLPBMjVnya1NYP4EXRextdWohGRO61Oqpc9U67sTu4STeRagz7NFRK+
 ed+sshQow09CBtSQqM27T2e1qhoYuVmQ9xhXiVvrEAd1UeDz8ATVYZ7
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jqWGCh8gCKNZgrLQP0h_wPmOZYPrS16z
X-Proofpoint-GUID: jqWGCh8gCKNZgrLQP0h_wPmOZYPrS16z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=653 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120065

The UFS_RESET pin is expected to be wired to the reset pin of the
primary UFS memory, it's a general purpose output pin. Reorder it and
expose it as a gpio, so that the UFS driver can toggle it.

The QCS615 TLMM pin controller has GPIOs 0-122, so correct the
gpio-rangs to 124.

The QCS8300 TLMM pin controller has GPIOs 0-132, so correct the
gpio-rangs to 134.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Lijuan Gao (6):
      dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs615
      dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs8300
      pinctrl: qcom: correct the number of ngpios for QCS615
      pinctrl: qcom: correct the number of ngpios for QCS8300
      arm64: dts: qcom: correct gpio-ranges for QCS615
      arm64: dts: qcom: correct gpio-ranges for QCS8300

 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
 arch/arm64/boot/dts/qcom/qcs615.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi                            | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c                            | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c                           | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
change-id: 20241211-correct_gpio_ranges-ed8a25ad22e7

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


