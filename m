Return-Path: <linux-gpio+bounces-10301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A6297D220
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 10:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FBD5284233
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 08:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1794D8B9;
	Fri, 20 Sep 2024 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eMJxCrX1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D1438F82;
	Fri, 20 Sep 2024 08:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726819237; cv=none; b=PeCSA3gZwuEAZHK6+V7iiEAYWIkuHrgobJdB3WuX2tFZVnel77SewpQ3DujfixpQfPaZNX87WtSiGdg1Lk6r5lPf7NnlN9jQILVqlmkEW0ui1FIKu0TkiFuIQdGckVMpM9azdNFyNFuJQHieFLFPlvhgpevEgespxstpR57giS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726819237; c=relaxed/simple;
	bh=U0kYuqKVa3ezLzWzDXPQXANGRQyc8VOCBbRvDsHigOM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=jI9LKJR4mv+f0BS/qopCd6guy/RoQH1u3l0swpeOQ6JCTdyZdy4S4wP/D35F5qUJKyU2i2amvJ6mDeRGwOuFbiPb7y41RtkFna+ryIwAf3ij7nsO3xmfer+eyk98KwKWsUCFomKtyboHw6jmxUB2IO8rrWhSLN4cvK6/vwu77uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eMJxCrX1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K7lC4F018621;
	Fri, 20 Sep 2024 08:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b87vCf9lRSBsbtiIt8LJh2
	zlQ4Za1SW6AsnMRRx3+fo=; b=eMJxCrX174Beh7TQsoEayQAtlM6A8RPjlwNYhf
	3njVoEbkfkOLU1JzDfMXSHGgNDwubO4tC5f8+NpkRJrXLBNox7Uc5QqNKL8cU3tK
	Sy9FexiKX7Db6aHYQaEPqnGG+sMSmvPJBUzEoQKcSQA9O0POAhkgSXYxqzaPS+9x
	Tzl/2kh66rAtrQ79GOyADa9eB/Ykc6idPbnZvOhw4eNENXMcdAS+tehgpsy/5oOJ
	xrITeUV099m02y7qpy5LzjjMj1gVrW1GyWHg/yeInSRYrx1ec6xGBrkxyRfxyfsY
	0FxbsalKp8ql2CScfbrvxr2X3mdvTk/zHtr2ZF0UxI96XF0w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4j70c84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 08:00:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48K80R3c010158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 08:00:27 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 01:00:22 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH v2 0/2] dt-bindings: pinctrl: describe qcs615-tlmm
Date: Fri, 20 Sep 2024 16:00:08 +0800
Message-ID: <20240920-add_qcs615_pinctrl_driver-v2-0-e03c42a9d055@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIkr7WYC/32NzQ6CMBCEX4Xs2Zq2QP05+R6GkKZdZBOlsMVGQ
 3h3K/Hs8ZvMfLNARCaMcC4WYEwUKQwZ9K4A19vhhoJ8ZtBSV/KkpbDet5OLRtXtSIOb+d56poQ
 sOmOtKWttK4uQ9yNjR6/NfW0y9xTnwO/tKqlv+rOqf9akhBSl6Sonfa0P/niZnuRyZ+/CA5p1X
 T/Lrz5exAAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, lijuang <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726819221; l=1366;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=U0kYuqKVa3ezLzWzDXPQXANGRQyc8VOCBbRvDsHigOM=;
 b=o6P570peiqN+5LmJCFz18IC5fxhSZU+B2Ik5uduIf55MbsDDpyfwUHTCxvY5PYyVBvvO2/Zg5
 m+Q34pgk9fyDQ13mACoZPWsruZCXXM/nGQ2A9xTJJYdmpiCNqg9bzkQ
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aWZlC_tHQYLR5ogDtmpJD1BZwCB5jEBF
X-Proofpoint-GUID: aWZlC_tHQYLR5ogDtmpJD1BZwCB5jEBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200055

Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
QCS615 SoC.

Signed-off-by: lijuang <quic_lijuang@quicinc.com>
---
patch made the following modifications and verifications:
 - Successfully ran dt_binding_check for the current binding file.
 - Sorted enums, function names, and groups alphabetically.
 - Specified each tile in DeviceTree referenced with pinctrl-sm8150.c.
 - Consolidated duplicate functions.
 - Verified functional with UART function on QCS615 ride board.

Changes in v2:
- Rebased patchset on next-20240919
- Added 'type: object' before patternProperties
- Link to v1: https://lore.kernel.org/r/20240910-add_qcs615_pinctrl_driver-v1-0-36f4c0d527d8@quicinc.com

---
Lijuan Gao (2):
      dt-bindings: pinctrl: document the QCS615 Top Level Mode Multiplexer
      pinctrl: qcom: add the tlmm driver for QCS615 platform

 .../bindings/pinctrl/qcom,qcs615-tlmm.yaml         |  124 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |    7 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-qcs615.c              | 1107 ++++++++++++++++++++
 4 files changed, 1239 insertions(+)
---
base-commit: 3621a2c9142bd490af0666c0c02d52d60ce0d2a5
change-id: 20240920-add_qcs615_pinctrl_driver-f6aa6352a4ae

Best regards,
-- 
lijuang <quic_lijuang@quicinc.com>


