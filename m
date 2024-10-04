Return-Path: <linux-gpio+bounces-10825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E99900EE
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 12:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F9761F221B9
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 10:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351F31553AF;
	Fri,  4 Oct 2024 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IaW3pW74"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8E1145B11;
	Fri,  4 Oct 2024 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728037462; cv=none; b=LwHIshQqbz9YwhFeR4q9TjQmG5anTpgh47OmAx7fd+viKy+1AzYMfgwblg7PtXUMo39OnginHQ6xmfbC463EuKZWJYIGiXF4q5hO6i+Q/N1EAfuYH/0V1aF0xi/qEuBv+rfKH2VriPtu8iHEbYaXc0W2PYV/MyUghb3iD+5rKac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728037462; c=relaxed/simple;
	bh=bItbYsvdYtidM9VsK22DUC20AQkgKht8iK3XkA6fxy0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jQMqQ4q6RSIywD/8qf5MB5ZNbxNdqw/EZn+6Tu10/J5YFGiOUlIHJLDOOMHT2rA2xEHNddjGCfjhd6ceFWBNzOv4yIwFijKM85FK/7ei23m6EKjuh5mI1uadAWXNNkBeO+wcw9N7sQU+SMpwBr/yQafGXj96CcoSfqiFuDiLyv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IaW3pW74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494ACKY7029088;
	Fri, 4 Oct 2024 10:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DHjTQ7/IAtljew/sL+CBL3
	7mTAknLshHuYCG91wq3YU=; b=IaW3pW74oRGZYCCq8zHvJuOVlniRkSd8o14zCh
	K+92JcPgM7HzQktwHO+Dz4DVc+7zReIpdnBaAnoNIAOr3f2gti9bWW2QINCkBQEv
	+Myo0D0dwWKLzsZlYbHMzx296DAae0fvRpk7qwJkUAdmzUe1i7ww4a5NOjalPF5J
	H3DudJWhN65WDl7PZpwyqdWMdWPEPgH90utZeTy2qf5Pce/9xAk6jRRNPtrpSApI
	+RywST3IY2wZfcPO6AhcLJ55GjjKKwMCFLaDq0aDblGZKhTmvdPuyT4LS49Ei33S
	d/D9JozJFsw8BCktmrFylICXxITQ7+7lZ/nk7ZTQBadkprJA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205h9rj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 10:24:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494AO1Gi024087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 10:24:01 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 03:23:55 -0700
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
Subject: [PATCH V3 0/7] Add minimal boot support for IPQ5424
Date: Fri, 4 Oct 2024 15:53:35 +0530
Message-ID: <20241004102342.2414317-1-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i0O2eVFrK81L_jR3MG40tQCHGyo_FrA1
X-Proofpoint-ORIG-GUID: i0O2eVFrK81L_jR3MG40tQCHGyo_FrA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=830 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040075

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways and
Access Points.

This series adds minimal board boot support for ipq5424-rdp466 board.

Picked up patch [1] from previous post, this is a dependency for this
series.

[1] https://patchwork.kernel.org/project/linux-clk/patch/20240626143302.810632-2-quic_devipriy@quicinc.com/

[V3]
    Fixed patch#2 as per Krzysztof Kozlowski comments
    Added Reviewed tag for patch #5
    Dropped patch #3 and #5 , pinctrl --> Already merged

[v2]
   Fixed all review comments from Dmitry Baryshkov, Krzysztof Kozlowski,
   Varadarajan Narayanan.
   Added Rob Herring acked-by for patch #3.
   Added Krzysztof Kozlowski reviewed-by and acked-by for patch #2,
   and patch #6 respectively.
   Added detailed description about change in respective patch.

Devi Priya (1):
  clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL support for ipq9574

Sricharan Ramabadhran (6):
  dt-bindings: clock: Add Qualcomm IPQ5424 GCC binding
  dt-bindings: mmc: sdhci-msm: add IPQ5424 compatible
  clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC
  dt-bindings: qcom: Add ipq5424 boards
  arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support
  arm64: defconfig: Enable IPQ5424 RDP466 base configs

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../bindings/clock/qcom,ipq5332-gcc.yaml      |   40 +-
 .../devicetree/bindings/mmc/sdhci-msm.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts   |   59 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  291 ++
 arch/arm64/configs/defconfig                  |    2 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |   11 +
 drivers/clk/qcom/clk-alpha-pll.h              |    1 +
 drivers/clk/qcom/gcc-ipq5424.c                | 3309 +++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5424-gcc.h  |  156 +
 include/dt-bindings/reset/qcom,ipq5424-gcc.h  |  310 ++
 14 files changed, 4189 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424.dtsi
 create mode 100644 drivers/clk/qcom/gcc-ipq5424.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h

-- 
2.34.1


