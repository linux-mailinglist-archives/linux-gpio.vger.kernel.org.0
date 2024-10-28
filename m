Return-Path: <linux-gpio+bounces-12181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C1F9B24DE
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 07:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6CC7281E5D
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 06:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3553C18CC13;
	Mon, 28 Oct 2024 06:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FKZaqcNh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A5F152E1C;
	Mon, 28 Oct 2024 06:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730095546; cv=none; b=gl09YyTqy8cPPnu6bBoRTwYASoI+ZRYSHIh50iWF617Gm46WJ2o45cL2GNozT3SxZj4qJinMFfIuHD8/ZGUtMQfdAhwH8awIBn05NfL8S6F9ZnFp3VF9j+0P2SswYfgT13hdPFMeV+Dg1Ua39fJ3ZcAYCWT/LWk2Kj0gjijWF74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730095546; c=relaxed/simple;
	bh=4gWrOYe5qvxLUTmb5LuyRowPsNKJ36j2xpMUzXATJek=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=taeUfpmHdRGm3s4wilwmJSZ1lEdL+QfOQfPRieeQ8aPU4Y2blFxTBfDVW1Y0H5T+3IB4uGq9LTX7Hpo1qbggiFGFDyzatRP+/gXPerKvpz3eVxvCYMgUQXX65RNuwTfBw+N45/V/5KFD1DGZACQ6tc9xw7YMgsae+mlB79rK2Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FKZaqcNh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RMpsXR017168;
	Mon, 28 Oct 2024 06:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+7qMhBci9rzp/OSYh/QWFq
	7utSG5afw+UKAJn1ksEDk=; b=FKZaqcNhee0Jy3ouYu/1ItlfxDZMb6PnL+Et5c
	f3CwzCO5kPYnfw6d910wvM5oi1HQ9X4S9tmFq/TS9D2amHWdMxswXFqDvHVsi0h/
	qrbCzn6iKSql+gSqJuNemaaV7IhmwY9SFUkGkmrSuKEUFlkC8VKeI0YMjG0gokM+
	ci8sA9TtX76jwITWNLxOTGP/LNLO2AXHE3LJh2UND+vIWRxnpItTSnbNAoQMwT6z
	qHLxzZPNZjCNSsgOSCPIjQlBnoIeyiS0BgYqbeHi04jta5znqppqN8IGOxt/3GBG
	0qDcsE3omRf7A00Lax4VGnSYcdkUtD/9qku5TVETjaFb9yQw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe5utae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:05:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S65PXm018792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:05:25 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Oct 2024 23:05:19 -0700
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
Subject: [PATCH V5 0/6] Add minimal boot support for IPQ5424
Date: Mon, 28 Oct 2024 11:35:00 +0530
Message-ID: <20241028060506.246606-1-quic_srichara@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kTrVFiiyixg7UxeVzCN_m6scRJ6OU6Aq
X-Proofpoint-ORIG-GUID: kTrVFiiyixg7UxeVzCN_m6scRJ6OU6Aq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=850 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280050

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways and
Access Points.

This series adds minimal board boot support for ipq5424-rdp466 board.

Picked up patch [1] from previous post, this is a dependency for this
series.

[1] https://patchwork.kernel.org/project/linux-clk/patch/20240626143302.810632-2-quic_devipriy@quicinc.com/

[V5] only change in patch#2 to add Minitems for ipq5424 clk binding list
     Added reviewed tag for patch #6

[V4] Only change in patch #2 to fix adding 2 new clk bindings to end of list.
     Dropped patch #3 from [V3], since it is applied now.
     No change in other patches.

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

Sricharan Ramabadhran (5):
  dt-bindings: clock: Add Qualcomm IPQ5424 GCC binding
  clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC
  dt-bindings: qcom: Add ipq5424 boards
  arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support
  arm64: defconfig: Enable IPQ5424 RDP466 base configs

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../bindings/clock/qcom,ipq5332-gcc.yaml      |   41 +-
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
 13 files changed, 4189 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424.dtsi
 create mode 100644 drivers/clk/qcom/gcc-ipq5424.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h

-- 
2.34.1


