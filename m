Return-Path: <linux-gpio+bounces-11088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 465EB996066
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 09:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E59051F24911
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 07:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343E417BB34;
	Wed,  9 Oct 2024 07:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o6Hw+WKv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7908E84E18;
	Wed,  9 Oct 2024 07:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728458053; cv=none; b=GBWp5xuUyZRbREDowR4QQKXUjIPko1rxKDeHzqnVzI3f+3HUBeP5cbnSd2dhOb9AVUvQmjd05NuKigBTR503/aKAtRjSlJ9/A92isy+midrht0X+9hVL4Toe8IJgH0dnayC0d0y8Md0aOgXfqWdLltsHK9qJ//zV88qJ/YEj2l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728458053; c=relaxed/simple;
	bh=Vpc6CtypIrBeA+t2wxXIHUdYi2CHXKC/vx3hC1pUF8c=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=OYkxCQ3JZC12xE+WFLEn5ABbE3XoQHj3/CKsX+ASbFTwB9O/uGRQ9OTJfWNZa/bnIb/EjhxisriCphTt/Kn4WhRrS+akJ3s/hIy8InfK9DLwxJL1+vrtVLUUpo4SA5BzChWpXZgNMQOfe3pjpiHdT0/jgwUt/SPlSGcMvHM18gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o6Hw+WKv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4996OLu3029436;
	Wed, 9 Oct 2024 07:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=swh+fhX7kn6sfhsfh3uCXm
	cCSdhUKNzSFvApjqIuplY=; b=o6Hw+WKvUXByBZh7DbKZFlTnaBBC2aKT/JYPgD
	EOefm3j6xk/1ge4w27l0znXe0yN/mvFkEX85a8D9/pCYnoSmLuBj9j1S4H7iEgRp
	iI2oDa2iWMpY+xUT16JqSx+1DFw5a1ow2tuaMn9QzAz9TahkO6S1cCTUXCMx1WTt
	W02L18eajw6VyVBv5Kmetrw63LL5z1Xdec/q4dPq25dS2ZBvdJ3urVO8Iq38J+B0
	mbu2sga2Mi4Jz2WCqpdINNjhBOCMj8QyFv1zU7hF0Z0X5jZsTuWk01aMpAwelgo8
	feDiVNc4cN4kQFj74sK7gzS9ejuiYlQxInaw1KMiAorMc1CQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424yj03njt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 07:14:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4997E0nM009111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 07:14:00 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 00:13:55 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Introduce Pinctrl for QCS8300
Date: Wed, 9 Oct 2024 15:13:32 +0800
Message-ID: <20241009-qcs8300_tlmm-v2-0-9e40dee5e4f1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0tBmcC/x2MwQ6CMBAFf4Xs2ZJtqbbl5H8YQkitsEaKtIgSw
 r9buL15ycwK0QVyEcpsheBmijT4BOKUge0a3zpG98QgUEiOaNhooy4Q6+nV90whl6rR1pylgKS
 8g3vQ78jdqsQdxWkIy1Gf+f4eIdTc4EWaosi5UlqgZJyNH7L1k3y7fK/7Jm9zO/RQbdv2BycaQ
 PunAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>
CC: <quic_tengfan@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728458035; l=888;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=Vpc6CtypIrBeA+t2wxXIHUdYi2CHXKC/vx3hC1pUF8c=;
 b=QWnnTgA/fmO3O8w535rwishTCG1VAdgZFVdNjGUMnE1/yvO+7dqQOvb/2JdKS9HLvonmpZ8Mr
 Wd9rjSSibR3BajEYfE+HefM9MrHPnImTQzD3ZQ3qs+RFN71ZUNK9+EE
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oT_lF-ILcuUqBrivI2J70YpyuUty4Eu7
X-Proofpoint-ORIG-GUID: oT_lF-ILcuUqBrivI2J70YpyuUty4Eu7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=767 mlxscore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090047

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
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
base-commit: 33ce24234fca4c083e6685a18b460a18ebb5d5c1
change-id: 20241009-qcs8300_tlmm-70147a8c9542

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


