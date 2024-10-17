Return-Path: <linux-gpio+bounces-11534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBD59A2256
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C976B1C23806
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 12:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE081DD861;
	Thu, 17 Oct 2024 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ANeo6lLC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6C5770E2;
	Thu, 17 Oct 2024 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729168641; cv=none; b=Gz2xBT0BkWYGZ2U+BBxb8Qgbn3W0IeEA3LrRGDi8YDBtrb69Vs86XM92NLnQaZn4G/0NmZi6kV/H/uaMtoyMF3G3EFc8BxMxQ4jUiqmQ/UCAjuS5SMOsou+bPX7lxNTF4FOse7Q2+1rjPD5R3xi4Tg5xvPNdAouDIQDX2ODZ7gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729168641; c=relaxed/simple;
	bh=P43vvQY7QwRBYdVwY9ZYKdcL19CO/phnKdn/2s2DWkk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Uo2IOFMzhHx7w4w4Few7p/Yv9aI9PcHK44FY71cZ4qsJtE9fuC5h6rmQSg9P+CvovRH+rErEx+8yn/J+D8GhMV7lhPitpvAHRbo3rXTLRUAQeP+SmCrOPG9VOcTYebh66eZdF9gWz6I54kVKHVgzZmmgHD2ut45j3XPVotM6nkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ANeo6lLC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H7fQrs001755;
	Thu, 17 Oct 2024 12:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ya+Bougvk+y8vWeqZgeUhx
	wz/Goy6iuGevzYINz6usg=; b=ANeo6lLCSeLLnwfpYnpIPwXbCVkpEbql5lo8BH
	uQvu6GknI2YAKYXX/M4D5q1RmrMaZaowGZT/u2JAmNjjlrE0ws3iChtr+HQ/B5Zg
	pyaKS9nAlNBLLRUAFvow4A6inMfqImK3v9rZWJreqYJ8IuzbOCLRgElOQVmReQWJ
	kJGsvtHCPR0U4W0HGPLnA+seVhKI5Ar0imFQLj9mAWuzv9vgYskUwPzwJr5oAPJF
	NW+Mn2gECpvET4L+jO9m7wXqQfsG6Wj+cf5GnTbFiQJnCi/h3TtUafqo82DN6nrv
	p/L5nlSpwWI1wIqYS72iLOaTkiQc4GLYXsce5xIYIKG6WoMQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5ahcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 12:36:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HCaqsJ021975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 12:36:52 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 05:36:46 -0700
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
Subject: [PATCH V4 0/6] Add minimal boot support for IPQ5424
Date: Thu, 17 Oct 2024 18:06:20 +0530
Message-ID: <20241017123626.204421-1-quic_srichara@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M8thuauK12XX8lSuWlzqFatioqJ7UvMw
X-Proofpoint-ORIG-GUID: M8thuauK12XX8lSuWlzqFatioqJ7UvMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=845
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170086

The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways and
Access Points.

This series adds minimal board boot support for ipq5424-rdp466 board.

Picked up patch [1] from previous post, this is a dependency for this
series.

[1] https://patchwork.kernel.org/project/linux-clk/patch/20240626143302.810632-2-quic_devipriy@quicinc.com/

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
 .../bindings/clock/qcom,ipq5332-gcc.yaml      |   40 +-
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
 13 files changed, 4188 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424.dtsi
 create mode 100644 drivers/clk/qcom/gcc-ipq5424.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h

-- 
2.34.1


