Return-Path: <linux-gpio+bounces-11585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81539A3341
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 05:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 162211C233CB
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 03:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA12152196;
	Fri, 18 Oct 2024 03:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T/Aj9Dqp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8B3FB3B;
	Fri, 18 Oct 2024 03:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729221613; cv=none; b=t3FNzQPXV8nOw5Aai+w6jXZF1DOEU0eLirzgGBiFvc0PM2PZDD4hXfW71ge0SIuHMMBJ6ztJ4sCPnHuhONqKV5oxWYFoNcOEjPc/oFEiX7Yo6nMnGx/NFqAHZDlrnjy1OmO6je/jnOokuQaSWrCIpM8cvpotkTLJv3QAx3+UuxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729221613; c=relaxed/simple;
	bh=Rk9USwdOWg29jTWE77KnBJYWuHxNmqgbnOH+Z5wN2A4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=tVHmPrntEQckJt/zbpDuJgBWwIhTVhfP9qE3yvgEjZHhLMOa4/QPBOGi2G5ZkihFppRBcqMkQJ4TKxwvasdmVppiay/UaIY2eoq7ahDIkKVK26G511kIRJehBs9a0JGalXmg+uS6qhhFh4keHbeiOxFarUbNu7lRFqf914zlr5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T/Aj9Dqp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HIW9AF027187;
	Fri, 18 Oct 2024 03:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3hvRkaM0lRFgY47USwgjre
	+8pCBEMuvYF6GQOWIEpLA=; b=T/Aj9DqpoazPdrypl533Oty2CFWVEtCjtZHtPQ
	IV1ZWXMWTGWg83rukN+CHJPSSJm0pp8qHhzyJovR5/1CElEnwxCc1jShrQH4ZddW
	e/td+XVJBKjAnciOtofcuHyKntfZqT4wVxwwvx8NqH0tJDJqKsZEi0Ug9nZ/fMro
	43JDaml4+S6OjxAPW/x3F7O6Fps46Y9uxhVd+ew3CuH2e/2BmGaEAW+Xl3FIIKm4
	ub6jofUVWAmqBpgU6os++mbtsJ6nW1PRc6Rv7HELQ4EHc6nSjPINNeStdz0pEH42
	3iiqzhr+jhMKu6RDVyWXBRnlq0NjomU83HUCWmHU5vCVGB3g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ay8jar8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 03:20:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I3K4H4013945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 03:20:04 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 20:20:00 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for QCS8300
Date: Fri, 18 Oct 2024 11:19:30 +0800
Message-ID: <20241018-qcs8300_tlmm-v3-0-8b8d3957cf1a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMLTEWcC/1WOzQ6CMBAGX8X0bMn2B2g9+R7GEC0LrBGQFlFCe
 HeBgwm3nS+ZyU4soCcM7HSYmMeBArXNAup4YK66NSVyyhdmEqQWIAzvXDAKIOufdc1NEUsrIcH
 8nrJFeXks6LvlLteFKwp968etPoh13UJghIVEW6UikaZGguaCd29y2YOacvyc15saF7m2Zmtnk
 H9XANj9E4PkwC1qyBFj1IXY6/M8/wAfNeP25gAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729221600; l=1182;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=Rk9USwdOWg29jTWE77KnBJYWuHxNmqgbnOH+Z5wN2A4=;
 b=NERBjJbQ2KwajGCAjJnRa+Z27mK1KAYksHMsRQqApEICPy9TZeK/6hRGu0rtAYKQhgunfiPpg
 nnHhtbCcASBDtRvOmR2IMwdJuRJf+qzr73S8MPANo3OIv/J1BP4pcIt
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ctgvk8xVLX4cv9sKqKWcFLR2zrmxfEuS
X-Proofpoint-ORIG-GUID: Ctgvk8xVLX4cv9sKqKWcFLR2zrmxfEuS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=743 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180018

Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
QCS8300 SoC.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v3:
- fix ngpios num in tlmm driver
- change the name of callback from "remove_new" to "remove"
- Link to v2: https://lore.kernel.org/r/20241009-qcs8300_tlmm-v2-0-9e40dee5e4f1@quicinc.com

Changes in v2:
- Add Reviewed-by tag for binding change
- Patch rebased on new tag to avoid conflict
- codestyle fixup
- Link to v1: https://lore.kernel.org/r/20240819064933.1778204-1-quic_jingyw@quicinc.com

---
Jingyi Wang (2):
      dt-bindings: pinctrl: describe qcs8300-tlmm
      pinctrl: qcom: add the tlmm driver for QCS8300 platforms

 .../bindings/pinctrl/qcom,qcs8300-tlmm.yaml        |  118 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    7 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             | 1246 ++++++++++++++++++++
 4 files changed, 1372 insertions(+)
---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241018-qcs8300_tlmm-8f529206edb7

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


