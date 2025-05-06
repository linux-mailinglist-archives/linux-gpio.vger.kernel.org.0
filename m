Return-Path: <linux-gpio+bounces-19644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A13EAABB9D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F06A01C43A21
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C529672637;
	Tue,  6 May 2025 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kupw8XaS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C996E7260E;
	Tue,  6 May 2025 06:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746512624; cv=none; b=sUTYXV5XSXsd2oXy4qH+3YiVsx6+fHfDM/gKZUivfrIxhgtYndx1okTZ7Ktl9urgW9ZGI0ZuCA4betfrQZzQ73/5385teQ5EtIszZN8E5fsQwvIaef1Ir8TEjERLoyHmAtmy0xprNix1AahpIDBuuyeRdigtkL+fA1FVc9GFmlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746512624; c=relaxed/simple;
	bh=uLOj3gzjzJHXb5dMIMlDQDK7dGmsb0GWN4kozaXfopI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=KieTdO9iJ9s+rfeq4dPFghsWFDcKMlB7ny8nqRA0wLi1Tj3JTSI2vHicm4yMRwOEu09+O29mrvQ+ALZUQk67e5zJ6SAxlGPeiOwwITyxXdRgiWfFMuImsYVoVUQPFkzXDiIrfE7SEerHTGoE0+Hq3q+Jabk+ARt6g2J7zCKpPIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kupw8XaS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545M4e85010779;
	Tue, 6 May 2025 06:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EcGgFtMnMHu7y/f6bO7AuW
	GTFEhhyK8BvFHxsHOBdjM=; b=Kupw8XaS4yFkt1czS+Q8DRQ9NGrNfvU7sIuwmc
	07aF8tpxQ+MZgF1C+i4+2yKHtWkdYooKie7/UNv9jo/rwgkY4dPLZuKJeDGwjGHr
	V5lMlQKf1OcmKNL+RCvXwaDNE1136KFbiEqSrv4CP2GmKK+myUFrHa7jUWGc9JGi
	8MXpuC24ssEtwgGyHILRdqrrQar2V8cy90rC7epL9KkB25yZ+AXttXYFvTZOZyHb
	wb3t0Yo7Ce74Ab5O2hYMkoVAQE0vNTe2UXzEpkQ3SZCfGl0qnQ1ITdKHJ9otjolg
	zvuhY/frNMr4lk4E+4RRFhXc6GjapBpUXy8BLj6y8Xh+vUjw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tb95ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 06:23:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5466NbJw023138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 06:23:37 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 May 2025 23:23:30 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH v3 0/4] Correct the number of GPIOs in gpio-ranges for
 QCS615 and QCS8300
Date: Tue, 6 May 2025 14:22:57 +0800
Message-ID: <20250506-correct_gpio_ranges-v3-0-49a7d292befa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMGqGWgC/22NzQ6CMBCEX4X0bE1/pAIn38MQgtsF9iDFLRIN4
 d0tnD1+k5lvVhGRCaOoslUwLhQpjAnsKRMwtGOPknxiYZTJVa6chMCMMDf9RKHhvRElts5eHTi
 lvRVpOTF29Dms9zrxQHEO/D1OFrunu++ijS7/+hYjldRl2xV5UfiHV7fXm4BGOEN4inrbth81k
 qC3uAAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Jingyi
 Wang" <quic_jingyw@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746512610; l=1774;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=uLOj3gzjzJHXb5dMIMlDQDK7dGmsb0GWN4kozaXfopI=;
 b=aMPICzuACzuB605bXfuI+uVxjqiMN5d3jmjW5WCcbM1kis9lFZR81Wx69I/OyUUDuP0jt3k6+
 DlB4NR18+daDWOal2/88mMobKVWa+NEUiVKQIBAx6yfl99qqCZYf/S0
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FjHJ9exTdrmn4dTfVv84QUesSzZQBKCd
X-Proofpoint-GUID: FjHJ9exTdrmn4dTfVv84QUesSzZQBKCd
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=6819aaea cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=Uo5fGkIgM_B_5ApAZXMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA1OSBTYWx0ZWRfX9KnuV38w98Nn
 OPVaOBH+OJcPpFPsZa8BS5j/x3+QBcWVk2r7ShgAUhGK5LaQ8F/Pqh0EqhjwbOPLiMNwzN/BOiT
 AbOpKpCxvHb23qbwAPJ0bR3yddz3giZJs/+8nnNBJd6xEs1L1GAn/ddtZaq//K8B9k3ggqL2UHL
 m/h6GOl8QKCP9WosE0YNvEzDmIB1PTtHYXl12z8G5yiPH+t3YQpVkHYqY6BKhsUL7mrypPx4Q14
 eeQjzY/eGvdb0hsitWGSKMgarD5uHtmAWTAziJ63dyQFyU3/UCBNco9zzMgCjM0EpPHxX+TWlzn
 ahiKcZlPaX2Bu29sAfnynqS1RP+NnzIRKwbr//avcMm1G1VTYTknXqwKxvEnLH+TR3YgzMgqCxm
 WNXUs6uE0aOQxnw+5Weqt9hcv3uw6sv6yAA8Wq0UwqwolQTAJomRmZbyhFjp7buTSbT496lJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=720 impostorscore=0 clxscore=1011 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060059

The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and exposed
through the GPIO framework. It is expected to be wired to the reset pin
of the primary UFS memory so that the UFS driver can toggle it.

The UFS_RESET pin is exported as GPIOs in addtion to the real GPIOs. The
QCS615 TLMM pin controller has GPIOs 0-122, so correct the gpio-rangs to
124. The QCS8300 TLMM pin controller has GPIOs 0-132, so correct the
gpio-rangs to 134.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Changes in v3:
- Add tags from Rob Herring and Konrad Dybcio.
- Remove applied patches.
- Link to v2: https://lore.kernel.org/r/20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com

Changes in v2:
- Update the introductory information in the cover letter
- Update the commit message
- Update the title of the TLMM driver patch
- Link to v1: https://lore.kernel.org/r/20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com

---
Lijuan Gao (4):
      dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs615
      dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs8300
      pinctrl: qcom: correct the ngpios entry for QCS615
      pinctrl: qcom: correct the ngpios entry for QCS8300

 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c                            | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c                           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 407f60a151df3c44397e5afc0111eb9b026c38d3
change-id: 20250506-correct_gpio_ranges-ea6376c601d3

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


