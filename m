Return-Path: <linux-gpio+bounces-8789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCF49563F5
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 08:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 581C0B217E2
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 06:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E619D155C98;
	Mon, 19 Aug 2024 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VdPERHyX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A3917C77;
	Mon, 19 Aug 2024 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724050228; cv=none; b=nucsdRjgSm9ydKloD4qpEJ4nCsdpvBy2tXsYybnQEUD85fLNxZLNhb96yRfLAQ2Icv9/Ao821+b5GzUipY1nu0pd280IN+aJExM+DheEWNvsThGGeO8NCfjimGs00gTLAqaJzdCPaQuq1bDa7T7TbI8jz/s54s37saxMCiNuCDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724050228; c=relaxed/simple;
	bh=vB6iA25ZkUrZfSpLhyAAcSbfWJ0e8+V/hzCHlgVzVrA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jlZvtAVMCdM2+b7sBOnwG0tKS/EYydMSqnptbAwVUIk79cqh6GF+/IZoTyrM7xVgZ3GbvTrJ5XpUh36u2hm8Fan4rfrGIkgUueWDb9FOTwMGWHjO+S0zqnRqdQJ5Wqm5YoMBq3j9ReHWmhwhfcG21bdLSjTxKwUSL6N9dgwaEmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VdPERHyX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47J0Oa61002183;
	Mon, 19 Aug 2024 06:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=foAA78XAhbb5WvEu158KFx
	xJEnkhvquU0iRRmNiChJA=; b=VdPERHyXTN+wvv8AK3nMk32Dxf/sNLIMobXUTQ
	nozE4yfHzbg08GvMbJKMHLb/W6g+WMI3vtpZGIGopJgCfj/vOD6xLtFT4bpe55sO
	/RFB/vK6Q9SJBRj3bLUM/Fm8cnm8BPlUJ3edSsy2jXV5IatfQs2CKRHZ21D9/Lp4
	M3Y2eyjDES22JjNYsFEsSopDOOzwWu2+ojUyrdfpjjXNxSuTkp5u3WyZk+Kxzg7W
	PCrshKelLeU1ZNaLw8VsZEZCIz6MWwenT+WTTGGnWl/uXakii/HObuDyc+H/mRud
	dyHa1U2F1oB3krDmlM5i597xAxouM+MO0GYig9MTNVQ+JAiQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412key38x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 06:50:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J6oJjU007131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 06:50:19 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 18 Aug 2024 23:50:15 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linus.walleij@linaro.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>
CC: <quic_jingyw@quicinc.com>
Subject: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for QCS8300
Date: Mon, 19 Aug 2024 14:49:31 +0800
Message-ID: <20240819064933.1778204-1-quic_jingyw@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JbZhcyNank-Go8mNqbGbCmbWuvu1yBdI
X-Proofpoint-GUID: JbZhcyNank-Go8mNqbGbCmbWuvu1yBdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_04,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1011 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=665 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408190049

Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
QCS8300 SoC.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Jingyi Wang (2):
  dt-bindings: pinctrl: describe qcs8300-tlmm
  pinctrl: qcom: add the tlmm driver for QCS8300 platforms

 .../bindings/pinctrl/qcom,qcs8300-tlmm.yaml   |  118 ++
 drivers/pinctrl/qcom/Kconfig.msm              |    7 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-qcs8300.c        | 1226 +++++++++++++++++
 4 files changed, 1352 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcs8300.c

-- 
base-commit: 469f1bad3c1c6e268059f78c0eec7e9552b3894c
2.25.1


