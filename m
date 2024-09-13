Return-Path: <linux-gpio+bounces-10060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A914E977F62
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 14:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E83201C21B16
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 12:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B001D935F;
	Fri, 13 Sep 2024 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hXRPwYOD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A0D1D933F;
	Fri, 13 Sep 2024 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229612; cv=none; b=ceGYz4zx8fcsHOIeL60xjmo1TgY1HvvEM1UnQgY/nre4TqBxF6UHiK38p9/QxZcKHPGna/CTMlMiGG1i2qEohWE7Vmb1Gi3KjwYqQsBUVOQnMyn5h8nNvjlQqfWAj5HOjBCiVjS6+qx7ZvR2az2kg5z+L29r5+IkBwqZ/are6fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229612; c=relaxed/simple;
	bh=mhIAv4H4bcwUpsqnF9Q4kf2CpyTFg5Lh7gP4ThHjIS4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T5NA39K9v/vzvRoK9M/lGeAMMNg6XI6KLWjeoEUSihJEMnMlEzyvuDaxrAmMdy4liW6mEQbJGY5bPJOEi+hqwdQNaNgqw11CBBQosv+mCJnQ+kxwa/gU9NuXJ7F84sOvXzS8fNKUc+yWDpSW75m9xdsGGLmot5V8h+gvjbs22P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hXRPwYOD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DABMIa005030;
	Fri, 13 Sep 2024 12:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1AooGth89JOfoojAJjcewv
	cYbpjtGHpXrCI2N3XU/iw=; b=hXRPwYODX4YJcwpx30oYoD2tZB55qJfIvm0vrv
	6jJUa53n3lftbsTM0Ru1XCny/zz2tPUz8kVyHLOJIOg1gOi1PLlIIO1ozbPugW7j
	TUUjgw3U6V5OC74azB+MMOXPq6GzVE65jZschcB0lObhw4QbjORJsf+rWQSgEzRJ
	wFGspGq20cBi9nEYB/hGiLqIL4CpN2cysuw845/H/v7s+ALoaZIeI1eKOC56MSg7
	quqjQfnYSAbWG0/fftxgZ0yJhpSRoKK7AdlTYEwqmhayHMjT5CkEb0teMxx/Ya3p
	1e5WCu1LO0+b9q45XHIAClq9p+Go9b5ccZwI9CFiiGYjypvQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41kvma49wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:13:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DCDCiq031299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:13:12 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 05:13:06 -0700
From: Sricharan R <quic_srichara@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <p.zabel@pengutronix.de>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <neil.armstrong@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH 0/8] Add minimal boot support for IPQ5424
Date: Fri, 13 Sep 2024 17:42:42 +0530
Message-ID: <20240913121250.2995351-1-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bW8SnII2gw-AOFO15_z4RLMu-M2xaqEM
X-Proofpoint-GUID: bW8SnII2gw-AOFO15_z4RLMu-M2xaqEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=631 bulkscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130085

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways and
Access Points.

This series adds minimal board boot support for ipq5424-rdp466 board.

Depends upon [1]

[1] https://patchwork.kernel.org/project/linux-clk/patch/20240626143302.810632-2-quic_devipriy@quicinc.com/

Sricharan Ramabadhran (8):
  dt-bindings: clock: Add Qualcomm IPQ5424 GCC
  dt-bindings: pinctrl: qcom: add IPQ5332 pinctrl
  dt-bindings: mmc: sdhci-msm: add IPQ5424 compatible
  pinctrl: qcom: Introduce IPQ5424 TLMM driver
  clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC
  dt-bindings: qcom: Add ipq5424 boards
  arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support
  arm64: defconfig: Enable IPQ5424 SoC base configs

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../bindings/clock/qcom,ipq5424-gcc.yaml      |   58 +
 .../devicetree/bindings/mmc/sdhci-msm.yaml    |    1 +
 .../bindings/pinctrl/qcom,ipq5424-tlmm.yaml   |  115 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts   |   63 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  294 ++
 arch/arm64/configs/defconfig                  |    2 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-ipq5424.c                | 3333 +++++++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm              |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq5424.c        |  792 ++++
 include/dt-bindings/clock/qcom,ipq5424-gcc.h  |  156 +
 include/dt-bindings/reset/qcom,ipq5424-gcc.h  |  310 ++
 16 files changed, 5149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5424-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424.dtsi
 create mode 100644 drivers/clk/qcom/gcc-ipq5424.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq5424.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h

-- 
2.34.1


