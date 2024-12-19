Return-Path: <linux-gpio+bounces-13999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6CB9F767D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64E681889FEC
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA7E21771B;
	Thu, 19 Dec 2024 08:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N3At1zcZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAADB216E3E;
	Thu, 19 Dec 2024 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734595211; cv=none; b=W52u5gFtVH+cF5Xf16JEPeMUA95itEsMUNDRIl3KburJhFbNNW60dgK/0LZFPFcCodZiiHlVp8xHBKb9xbx3U9Bn/OsvvPifmgYSvCFDTdYJt/99IqSakU2Sz5JBjuY0AndA4tI0WnStL3T26IBWJ23Qw9Q7SRLkFDkYDvJQNEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734595211; c=relaxed/simple;
	bh=9hMaY7zGJKWVO0FsdZlpwBnef8Ifg8aPHP5wKx9m1AQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=As+tuChuD82ntazy6QFGdWdSWvo+RQj0aGomr/ORzFX0ITQ8oZQdpE7vA5RX/H3x9p1pLzwgCzLkANs+e4AZhR4V842uHRf9Q322x+BT+DAVNPaKCtHToqPB2es1CJwiPg1RLYqty4W3aF3RvmwGzZRAZqGuH6FKUGSmWwV/UCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N3At1zcZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ3rujM021183;
	Thu, 19 Dec 2024 08:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O+/klrTIid4fWHj04DPaNE
	vcMscn5pW3JBpPCYV39mE=; b=N3At1zcZxRDtkarafreB46px61XMCa22jUrtDX
	RShGvsQAslyE57WRJ5JOduu0BDLnWMJQ4QHlgyazfxUgFkdRW6t4fdL9VYxrFLtV
	tpBf2eEE9FPwIDHD04MYx1/R2Myq8ivSFHmdyxlQphLwa1+UIJ6VHkwFKlFicqdl
	sx8CMfHNwByyNibfV73ZpAGAejpmlxZBWywyfZkcVSLTOCA2MAXiPlA8vpmACfLP
	UqOafHlHXYxM563+3N4OF3OkiW+AgarmSkaYniK2KzV4D3b5vKofUOGMYx//SMeD
	yAmH7H3lwfQdCDgKaQlTrVjUsJFno86tQYmpQFBn5EsPYvVw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mbyxrgph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ803C8007347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:00:03 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 23:59:55 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH v2 0/6] Correct the number of GPIOs in gpio-ranges for
 QCS615 and QCS8300
Date: Thu, 19 Dec 2024 15:59:42 +0800
Message-ID: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7SY2cC/22NwQ6CMBBEf4Xs2Rq6ESWe/A9DCNluYQ9S3GKjI
 fy7hcSbxzeZebNAZBWOcC0WUE4SJYwZ8FAADd3YsxGXGbDEk0VrDQVVprntJwmtbo1o2NUdVp1
 D5Avk5aTs5b1b703mQeIc9LOfJLulPx/+9SVrSkOVx9KdbV2jvz1fQjLSkcIDmnVdv5c6pkm4A
 AAA
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Jingyi
 Wang" <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734595195; l=1842;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=9hMaY7zGJKWVO0FsdZlpwBnef8Ifg8aPHP5wKx9m1AQ=;
 b=7czlYe3kV8MlwL/C9MLNu01JpVkWPae4rTjaX43XuX0WQh/Z0OGFK6/eM6p/AA+R5NlqT1QQo
 gWqfrhrAqEJDmV25w0wKN+W5aVdqcvBFJyHg3NUAjn/SgOwsGfQCLb3
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vPy4d1m2SowILF2JBF01FX6BKMPyxFHM
X-Proofpoint-ORIG-GUID: vPy4d1m2SowILF2JBF01FX6BKMPyxFHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=634 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190062

The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and exposed
through the GPIO framework. It is expected to be wired to the reset pin
of the primary UFS memory so that the UFS driver can toggle it.

The UFS_RESET pin is exported as GPIOs in addtion to the real GPIOs. The
QCS615 TLMM pin controller has GPIOs 0-122, so correct the gpio-rangs to
124. The QCS8300 TLMM pin controller has GPIOs 0-132, so correct the
gpio-rangs to 134.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Changes in v2:
- Update the introductory information in the cover letter
- Update the commit message
- Update the title of the TLMM driver patch
- Link to v1: https://lore.kernel.org/r/20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com

---
Lijuan Gao (6):
      dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs615
      dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs8300
      pinctrl: qcom: correct the ngpios entry for QCS615
      pinctrl: qcom: correct the ngpios entry for QCS8300
      arm64: dts: qcom: correct gpio-ranges for QCS615
      arm64: dts: qcom: correct gpio-ranges for QCS8300

 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
 arch/arm64/boot/dts/qcom/qcs615.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi                            | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c                            | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c                           | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
change-id: 20241211-correct_gpio_ranges-ed8a25ad22e7

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


