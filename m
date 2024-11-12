Return-Path: <linux-gpio+bounces-12836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5289C4B17
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 01:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16B82B2E2D7
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 00:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D98B1F4FDA;
	Tue, 12 Nov 2024 00:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k9cX72uM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2981F26FA;
	Tue, 12 Nov 2024 00:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371366; cv=none; b=rzEEWGY0q8ADo9Khp9vWPMOrLikZKq2kMgN0D4DTAcCTvf1LBIoYE9F2ALYCKY9uGB3YdWY48o/DKyru/SYGc0YzmlmJ05WeYQdKSW02e/lOz+wzG07l3wujZZRGzGuO8V/oI6v8HFqSEAoulqtpXoLQUKJRhCjn/ZtFAU1eJsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371366; c=relaxed/simple;
	bh=dMgntkJ65xoE74mufaQDWDdl67fJxCXvGSGwoLkllUE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=giBFX/JSkQ4McfDc06NfcdmdbieYDCZ7YhqwhDR7Ds8Gpu5szg8/7CehWnGTvJO8HCCFvhSleO4QJUI22Dz8MCtIWJ0frtxgJkdNlYunfzBzafDOG5Z4fGBrfuztVjm48WPG6Mt48hbXG4hC89xCQXmDkM6QZgKMj2n0PYLsn/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k9cX72uM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABBm8tv002630;
	Tue, 12 Nov 2024 00:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bIi52ZL4EebAIKHAQjn878
	6XwzEVQ1NH47T4RZ8ChUk=; b=k9cX72uMzIVXX3IuJH4SqDB3/ZG9vahvjZtBtl
	Cjs9okAMbNeKYuWHNpzouLxEgiiZyBOm1QDP3LVta7T+/nu/TYTapnsZil4qePW4
	690PZ7rsJnxlamewlnX6tFxtFTjIyErvRuhQKAZfvp49kdbD2jizGkCLrtlFWmeq
	e1Eju7ixDTN5frlsCc799S3Xps5yp221rs690E0lqWwgiZMuLs445pNwjBZxw7FO
	QInmTZeugLlUsHfe1ye01PBGrsoJh8PZcMku8tYdI1LN5JXg05naU86b36mV/TBP
	fQcA+rzLj/3QYfPpObSazPFbZuIQnSvKzTTK0UarJAA5RlMQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sweedup6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:29:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0TLkb006797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:29:21 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:29:20 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Melody
 Olvera" <quic_molvera@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] pinctrl: qcom: Introduce pinctrl for SM8750
Date: Mon, 11 Nov 2024 16:28:41 -0800
Message-ID: <20241112002843.2804490-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LbwglTy2UFhtKnxnrMggrfo9Ei8mHcth
X-Proofpoint-GUID: LbwglTy2UFhtKnxnrMggrfo9Ei8mHcth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=614 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120002

Add pinctrl block for the SM8750 SoC.

The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
consumer mobile device SoCs. See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf

Changes in V2:
- corrected example dt node in the bindings
- removed reserved gpios (moved to dt)
- lowercased letters in hex numbers

Melody Olvera (2):
  dt-bindings: pinctrl: qcom: Add sm8750 pinctrl
  pinctrl: qcom: Add sm8750 pinctrl driver

 .../bindings/pinctrl/qcom,sm8750-tlmm.yaml    |  138 ++
 drivers/pinctrl/qcom/Kconfig.msm              |    8 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8750.c         | 1729 +++++++++++++++++
 4 files changed, 1876 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8750.c


base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.46.1


