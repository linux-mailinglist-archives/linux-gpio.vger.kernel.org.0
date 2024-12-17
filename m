Return-Path: <linux-gpio+bounces-13948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805C39F4725
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 10:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AECD7A571E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 09:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA1E1DF253;
	Tue, 17 Dec 2024 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JxWe63ZC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1411DED58;
	Tue, 17 Dec 2024 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426829; cv=none; b=JeuDujv+KZRIC1lroOHb0ogCzZZC7PTZ6M34PLNsdUmdBniJYe61b3oY3jBDnYWgX/otKtLc7MO7gZM1sWzJSvJvAui+f+S/MV1grbkJ3wS40pFeHfYeTFPsKdYayXxZ+qnvMb/2Ed4LPW1+yLF2g/rErxHreZIXDK3/D4w6CgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426829; c=relaxed/simple;
	bh=pMj3M/O8IGph5Hs+eW6Nq4KmmIec27pIQXx1+eu+nAI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fph1HVvQ75Keo0mFIkiH7CLny163cHuewiN0BcpC4+gM+kJJXlzIaRwfgfRl6ka01UIlPGuLlFcvRhW0DSj4QNU5KOzV0Mrqwg+DLT7SjGDaepkwGkgCdN8VuaDZzoD0dsTNTzppRIizGYyEtJAXWMDR3gjcwgGCpfbo3wfTZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JxWe63ZC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH4la4Z013531;
	Tue, 17 Dec 2024 09:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HmGZFR/8CigOfofNpThp3U
	/9ZsAg5kWYJm0QibuUrOs=; b=JxWe63ZCMu2h5QaJ79VIi4i0nBRn+Y9n71IRcY
	SSdpLxud6vejDLHRzjYLOu03rN3dm6VcdxJGC0UpIe/+DqnHjSQH9qk9pQ0gfwX/
	dPOmySCq9dYkZGxwEORZhmHKYaOyx7zdzaO8h6PVz/uzC7yOLt6aTLuMSWbxfpxg
	eG+O4NDbR+mAm3/z/UUehs/qW3DWSVZvODKCKdSnts9q7QuRNw+qjNjZIkuiYgfx
	E6wbtu1j5ZzEwivkpD17fluvrLc5j42DTzVihYQAuUeKzyr4Vdk7N6lo7xkhKOWu
	TfVwk22R8FVV/tOvU+8/jTDnI+4I1k3uya8Z9PEDYKh7DqWA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2k7gmut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:13:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9DiP4006749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:13:44 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:13:39 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <quic_srichara@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>
Subject: [PATCH v2 0/4] Add SPI0 support for IPQ5424 
Date: Tue, 17 Dec 2024 14:43:04 +0530
Message-ID: <20241217091308.3253897-1-quic_mmanikan@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _x7e91nJwm0Ko--WeavxaBtzY88SZ7ES
X-Proofpoint-GUID: _x7e91nJwm0Ko--WeavxaBtzY88SZ7ES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=675 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170075

Add an SPI0 node to the IPQ5424 device tree and update the relevant
bindings, GPIO pin mappings accordingly.

Changes in V2:
	- Fixed all review comments from Konrad Dybico, Krzysztof
	  Kozlowski
	- Detailed change logs are added to the respective patches 

V1 can be found at:
https://lore.kernel.org/linux-arm-msm/20241122124505.1688436-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (4):
  dt-bindings: pinctrl: qcom: update spi0 function
  pinctrl: qcom: ipq5424: split spi0 pin group
  arm64: dts: qcom: ipq5424: add spi0 node
  arm64: dts: qcom: ipq5424: configure spi0 node for rdp466

 .../bindings/pinctrl/qcom,ipq5424-tlmm.yaml   |  4 +-
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts   | 43 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         | 11 +++++
 drivers/pinctrl/qcom/pinctrl-ipq5424.c        | 34 +++++++++++----
 4 files changed, 82 insertions(+), 10 deletions(-)


base-commit: e25c8d66f6786300b680866c0e0139981273feba
-- 
2.34.1


