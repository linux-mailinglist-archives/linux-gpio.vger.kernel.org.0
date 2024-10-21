Return-Path: <linux-gpio+bounces-11726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9D29A93CD
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 01:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69D371F212FA
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 23:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FE91FF61E;
	Mon, 21 Oct 2024 23:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jvkrHfb6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CBD1FF60A;
	Mon, 21 Oct 2024 23:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729551872; cv=none; b=dlA3tnjqJtfwHaswnGiWpio8ScNuYPklo4zxPW6TBzeaJTVOeOYgT/roz/jxPeOfCOsfJNVzFrGjgjxX/d/HQnQS5EB+KHXTsuBDA82EnMjY0g/hBR4BR3dFC1bDzER5FIUVamT5ttxu7wvk4bfMKnfMrXsWThLzgGm3BTg0lXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729551872; c=relaxed/simple;
	bh=23Rqr4Coxrcmhk1R1HWswemu3Gnigsxve/vITIYNw4g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RMLxYlRh1gophzPZRaNKsffRAkMZt5xKMmigdYNiV78rptOywtcTvwFtVkrWlNZA41mEb+BL4YmVIB6cO917BFT0W1TJbY+EszFom44vv8GRU+qWDzqYhN9NHMJFg4p2K2JzLXI5CAygTWzLiHESF1hhxi0EVomwCuXX5Biv/Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jvkrHfb6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LLH80C026029;
	Mon, 21 Oct 2024 23:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rm5Iw+YFtw8VMKqs6/VvlB
	ZTdjDjkRpqsix9n0WJTxU=; b=jvkrHfb6YZPatoUJf7aWU1iexaZGoONPV4K/Ot
	z3vRm0H+aKVv2VhQ1LQphukCS81Jw4EZFyx8gQmMOlaIXQz9K6WySdY8OKNdpWrO
	0owKz9GZyrQbEsUogGo6b9kOkIHtfNj0EaSJhodbnnl4eswkdUyEFQfZK9OerJOn
	WzQN8eTGGAI/+UNeWaXDNN419l1mSaU20ffm4l9HE3wugX/7aHSfBkqrYbNWk7MC
	ewXNfxLw0N2121+2lCHA2QZGZF8OQ3PGEGEiTmGvy3wDJADKpJJVU8W7+FoGPhSl
	TVNXffA3+hcQl33Wq4Z+u5gTjukDBC+zGhFpzxtxL8jn78GQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rj67dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:04:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LN4QZx011536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:04:26 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 16:04:25 -0700
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
Subject: [PATCH 0/2] pinctrl: qcom: Introduce pinctrl for SM8750
Date: Mon, 21 Oct 2024 16:04:12 -0700
Message-ID: <20241021230414.2632428-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fQ9S3ey-5mkYe3V04TrFKbLhkC4kQ1dm
X-Proofpoint-ORIG-GUID: fQ9S3ey-5mkYe3V04TrFKbLhkC4kQ1dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=560 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410210163

Add pinctrl block for the SM8750 SoC.

The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
consumer mobile device SoCs. See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf

Melody Olvera (2):
  dt-bindings: pinctrl: qcom: Add sm8750 pinctrl
  pinctrl: qcom: Add sm8750 pinctrl driver

 .../bindings/pinctrl/qcom,sm8750-tlmm.yaml    |  138 ++
 drivers/pinctrl/qcom/Kconfig.msm              |    8 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8750.c         | 1734 +++++++++++++++++
 4 files changed, 1881 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8750.c


base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
-- 
2.46.1


