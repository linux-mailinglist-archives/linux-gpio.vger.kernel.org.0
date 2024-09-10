Return-Path: <linux-gpio+bounces-9932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C6973349
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 12:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 624CF1C24D9E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 10:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18816199FC6;
	Tue, 10 Sep 2024 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GmnD8tzD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C87818E778;
	Tue, 10 Sep 2024 10:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725964008; cv=none; b=E4GT6k8f/xdm1tWFRPuOHk+QAzr7HdRWdk82c99Mrvnu58eAKs5XOI5qgE8ivSDAgKgfRRKXfpWfDvscObDmF4KkJS2VwkWjyQMrwCYF3ds0ppz6uSxtB34/XLf06trW2hYFN+CcsQt2su2o9kFp+pnjSWzYdZ4KHFujDi3otcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725964008; c=relaxed/simple;
	bh=A+3OLdpimudkms3tByzvzHCppYe6z/Si3Ti0qCO/73Q=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=hUiyzU0+5ych8ZMAUQAkEL5ZdkV1W4ryxkwiL7/lcgpegeuuSiPmcNJKuDZxQj9qP9YfcL4NV/ve1OaBtVfyFvvkpH0B0C+EteCxX7YaOj6vm3/E1wEhEOBnZsT+d5pbpBj+S6LjTmuBR6YRejRZ34YszWKr8x7Fcq47HDirdKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GmnD8tzD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A3K2g1023785;
	Tue, 10 Sep 2024 10:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XMcNMOa7T3YiCgYS23Em1q
	KtvEpsX9ZqsjtO4s457gk=; b=GmnD8tzDmbQFqyVTGp1BdQ1dSVJGX4glZ98cvX
	PMvVbr8bYeAEDIUM/YDZk6/NmBTGhF9NBGYz5fMznN3AJDLuMkc9LPlasFPfCxLE
	aw9nm120DRVDN+STePOGEECVXpM9vTdmaKuF4GJUXHRMKbnkDaeeCPKWjSPGE6GL
	PWpFSTKiL2MU0PgI28fBs65AMDm7RCyB7f4RoSd0Of7uOIMQvCWfdT1Nm3OkufJj
	rgKJPL02CWu4juDs7BqkiNUUxSP1RNBW5xPGwyhdygET8iR+3toGJVhdzxMh9Nbg
	sHCIPRKMlIWum8Tu7ra974r4NnSgLnc6unQDjKEkh3JDbJ2A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6p5h5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 10:26:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48AAQhG8005712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 10:26:43 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 03:26:37 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH 0/2] dt-bindings: pinctrl: describe qcs615-tlmm
Date: Tue, 10 Sep 2024 18:26:13 +0800
Message-ID: <20240910-add_qcs615_pinctrl_driver-v1-0-36f4c0d527d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMUe4GYC/43OTW4CMQwF4KugrBtkJ5lp01XvUaFRfpxiqZ2Bh
 EZUaO7eDKgLVAlYPsv+/E6iUGYq4nV1EpkqF57GFvBpJcLWjR8kObYsFCgDFnrpYhz2ofTYDTs
 ewyF/DjFzpSzJW3TWeOV7FO1+lynx8Wy/b1recjlM+ef8quIy/VPtDbWiBGkiBkwvoSMd3vbfH
 NrOOkxfy5uLgXDXgEA6JtdZMFfG0q2qh/uoZqHWmAzGSAj/Lf2wpZde1j07rz0k3V9b8zz/Arc
 aFQqgAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>, <kernel@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725963997; l=1162;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=A+3OLdpimudkms3tByzvzHCppYe6z/Si3Ti0qCO/73Q=;
 b=EB13IPRKg0cFCajqfG4jwBGzDe6tRJRzQgUCQl+MmTQkcLx7PxfL2MmJbvHItDGW65DTdqe1U
 NJCHkF5KxBRCbB/4a0BJaNN+a5MXSAYo2c+EzuwNoLmnQ30M0LHWcjL
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eLD9BiGoqUZwwxNb7tEXkXQz5r890xwy
X-Proofpoint-GUID: eLD9BiGoqUZwwxNb7tEXkXQz5r890xwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=895 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100078

Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
QCS615 SoC.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
patch made the following modifications and verifications:
 - Successfully ran dt_binding_check for the current binding file.
 - Sorted enums, function names, and groups alphabetically.
 - Specified each tile in DeviceTree referenced with pinctrl-sm8150.c.
 - Consolidated duplicate functions.
 - Verified functional with UART function on QCS615 ride board.

---
Lijuan Gao (2):
      dt-bindings: pinctrl: document the QCS615 Top Level Mode Multiplexer
      pinctrl: qcom: add the tlmm driver for QCS615 platform

 .../bindings/pinctrl/qcom,qcs615-tlmm.yaml         |  123 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |    7 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-qcs615.c              | 1107 ++++++++++++++++++++
 4 files changed, 1238 insertions(+)
---
base-commit: fdadd93817f124fd0ea6ef251d4a1068b7feceba
change-id: 20240906-add_qcs615_pinctrl_driver-eb91a94b2b61

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


