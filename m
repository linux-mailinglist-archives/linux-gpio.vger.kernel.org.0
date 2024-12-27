Return-Path: <linux-gpio+bounces-14250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC99FD10D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 08:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB7D2161EBA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 07:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EFB145A07;
	Fri, 27 Dec 2024 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hOL8jJDb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3668D13665A;
	Fri, 27 Dec 2024 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735284312; cv=none; b=cMyaUg3DgD5SGbuio11Q5HOO14GntH4HNS1DtdgWifEgPnZdDjsXeQ2KR/GbniJXs64n5QVYn+14foOUXTarxYBdcZiQMQOUb+CCZngD3gVcfZhQ8q0AGtxYAMSz9DWICQuxx0oBPrAqPLnC8CInSQkVEOLRoJlh0VI7u6WA2pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735284312; c=relaxed/simple;
	bh=MQGxUlCth0J5+jnrABNvPAM2v/hXnFQ0CEMCOWQPDUQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MIYZkOFqH2ThuVKqKHCTAIAsy7m6BkpsuLPYQ/koXg0wAyvIKHTCUzU9cunZgdI3oDDdUyNvuCZ2NmZ2XtqwLv2Z/B8jMbdusiFY+L+LM+8zd9od3jyHXCmBtdBPX/MhKYm81SwJMNz9zGlJG3WQ5XIlfe9EOR7EnpdJsoywQ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hOL8jJDb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR2VeUt018877;
	Fri, 27 Dec 2024 07:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ysx3tSwuMiivqxmSkkVEwe
	U5Nz+PhBGGTedaO8ubbZs=; b=hOL8jJDbS7laqAdU7UrF63Waea5lLjhffX5vje
	FkNmzZpWzV2CkXguuRB4x2LN7JQeTUfVGrvJPXIFI6yGrw9sCXSKqkDSGbppzbWA
	z08ztTjmZO2ire/WB7tBiUooV2c7To9IYmEuUz+BQgPiet3It3zQa6wSpJ0M/38J
	bSxjc9mEhHgZkgyEAkiIK0LHZUikEnBSDwRepamZSZN7mK+kH9Gjz6VGmKbvOW4C
	1ensbVhD5gkBwj0muZqJBVm/woiSv9eGKNeIdp/b9GeMftMsbaZB7kxTI1bZyOWn
	D0+5X1KXnfu7csrtBZyQXLZwXWdmDR41rbGm3oNL/WMTyDHA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43skhgsfam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BR7P5CJ030164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:05 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 23:25:01 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v3 0/6] Add SPI4 support for IPQ5424
Date: Fri, 27 Dec 2024 12:54:40 +0530
Message-ID: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JyaTzsoXqDmDpY-zU3I0si_HCks3Vfxy
X-Proofpoint-GUID: JyaTzsoXqDmDpY-zU3I0si_HCks3Vfxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=951 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270062

Add SPI4 node to the IPQ5424 device tree and update the relevant
bindings, GPIO pin mappings accordingly.

Changes in V3:
	- Rename SPI0 to SPI4 because SPI protocol runs on serial engine 4
	- Fixed all review comments from Konrad Dybico
	- Patch #1 to #4 added in V3 to rename SPI0 clocks, gpio pins to SPI4.  
	- Detailed change logs are added to the respective patches

V2 can be found at:
https://lore.kernel.org/linux-arm-msm/20241217091308.3253897-1-quic_mmanikan@quicinc.com/

V1 can be found at:
https://lore.kernel.org/linux-arm-msm/20241122124505.1688436-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (6):
  dt-bindings: pinctrl: qcom: rename spi0 pins on IPQ5424
  dt-bindings: clock: qcom: gcc-ipq5424: add spi4 clocks
  pinctrl: qcom: ipq5424: rename spi0 pins
  clk: qcom: ipq5424: rename spi0 clocks
  arm64: dts: qcom: ipq5424: add spi4 node
  arm64: dts: qcom: ipq5424: configure spi4 node for rdp466

 .../bindings/pinctrl/qcom,ipq5424-tlmm.yaml   |  2 +-
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts   | 43 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         | 11 +++++
 drivers/clk/qcom/gcc-ipq5424.c                | 20 ++++-----
 drivers/pinctrl/qcom/pinctrl-ipq5424.c        | 32 +++++++-------
 include/dt-bindings/clock/qcom,ipq5424-gcc.h  |  2 +
 6 files changed, 83 insertions(+), 27 deletions(-)


base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
-- 
2.34.1


