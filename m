Return-Path: <linux-gpio+bounces-10474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA70987EC0
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 08:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 497942812C8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 06:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC057178368;
	Fri, 27 Sep 2024 06:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BVQ5cIr4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0000815D5C1;
	Fri, 27 Sep 2024 06:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727420009; cv=none; b=e7ndZQopq/XDGLLcPG90KBcm/Z+eKJ0zxpMghITk/0qAJOLs2Co1yVZHbJ9j9dQ2pD75ctkAwIA8VNa2ii+s6Rq57GK78NHdQ/JkkZ+CDRWasb+uFypccaRqFsNdhLevITcABTOV0V8ZuKW+x3Q9AIDWGvjIBvBiGfSvO/djEcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727420009; c=relaxed/simple;
	bh=yvmViugiFex5b0y3rWwQibi0nHtH64tGDdbcxkNdIpw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g3A5zIXeiS0BrX2f9DPD4jlqpH8ApwXWs5lfyVfJKDerA3tg5qxYCBFiEdV5UZlIWzc52OVKO95ZM55DkVHAcivQRpFxjz0RwhMsJ8jebOQkRpgCRqDW0JuFzUUmfA9KzSRdXk64WMNngGdzy+Fn1iaCli4f3kbw2jklsQSCEfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BVQ5cIr4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6plfg000911;
	Fri, 27 Sep 2024 06:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QPnKklUB4Vef1zfJ1tXD8w
	kjvpK986b+/snWCHcKXMs=; b=BVQ5cIr4Eke267n4raR6SH9Ca4CnxWFZwtRHV8
	Yf5StYQt9LjaL1BE3rzVBNU1wS63IqOgwb+wSyHEtSk6B7n+Tgtt1W+0ex8BTEVx
	sk0VdvrNKB0SRMlqunxQiJ4Mt334t0CBHv+EnB+uIP6MPNfM5p98A/2t3ue1PFBX
	b3FoYLhGR8zfHd8stokSePp/e0znGBebl+IxHQKTsihSGtse5/hfEe3bf2h9lwID
	k7GYWLU8RFT04cglvR+bbssozngSK/3QD3U8OL6ZO8Oy83JunpD1LJcpFT5RlGrE
	Jo7Uxvbv2MheqxHsYJynjcUqzRD4tf1vmc+iJFnWptYOakFQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn3shxcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:53:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48R6r9oq015410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:53:09 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Sep 2024 23:53:02 -0700
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
Subject: [PATCH V2 0/9] Add minimal boot support for IPQ5424
Date: Fri, 27 Sep 2024 12:22:35 +0530
Message-ID: <20240927065244.3024604-1-quic_srichara@quicinc.com>
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
X-Proofpoint-GUID: p2kx0kOQL7Fi_nUWFwP4BZ9Ex2t46uqa
X-Proofpoint-ORIG-GUID: p2kx0kOQL7Fi_nUWFwP4BZ9Ex2t46uqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=738 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270046

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways and
Access Points.

This series adds minimal board boot support for ipq5424-rdp466 board.

Picked up patch [1] from previous post, this is a dependency for this
series.

[1] https://patchwork.kernel.org/project/linux-clk/patch/20240626143302.810632-2-quic_devipriy@quicinc.com/

[v2]
   Fixed all review comments from Dmitry Baryshkov, Krzysztof Kozlowski,
   Varadarajan Narayanan.
   Added Rob Herring acked-by for patch #3.
   Added Krzysztof Kozlowski reviewed-by and acked-by for patch #2,
   and patch #6 respectively.
   Added detailed description about change in respective patch.

Devi Priya (1):
  clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL support for ipq9574

Sricharan Ramabadhran (8):
  dt-bindings: clock: Add Qualcomm IPQ5424 GCC binding
  dt-bindings: pinctrl: qcom: add IPQ5424 pinctrl
  dt-bindings: mmc: sdhci-msm: add IPQ5424 compatible
  pinctrl: qcom: Introduce IPQ5424 TLMM driver
  clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC
  dt-bindings: qcom: Add ipq5424 boards
  arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support
  arm64: defconfig: Enable IPQ5424 SoC base configs

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../bindings/clock/qcom,ipq5332-gcc.yaml      |   37 +-
 .../devicetree/bindings/mmc/sdhci-msm.yaml    |    1 +
 .../bindings/pinctrl/qcom,ipq5424-tlmm.yaml   |  114 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts   |   59 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  291 ++
 arch/arm64/configs/defconfig                  |    2 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |   11 +
 drivers/clk/qcom/clk-alpha-pll.h              |    1 +
 drivers/clk/qcom/gcc-ipq5424.c                | 3309 +++++++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm              |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq5424.c        |  792 ++++
 include/dt-bindings/clock/qcom,ipq5424-gcc.h  |  156 +
 include/dt-bindings/reset/qcom,ipq5424-gcc.h  |  310 ++
 18 files changed, 5105 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424.dtsi
 create mode 100644 drivers/clk/qcom/gcc-ipq5424.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq5424.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h

-- 
2.34.1


