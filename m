Return-Path: <linux-gpio+bounces-13194-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A76F9D5EFE
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 13:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD927B2336A
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 12:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CBB1DE2B9;
	Fri, 22 Nov 2024 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H+Bfo5q2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BCB2309BF;
	Fri, 22 Nov 2024 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279533; cv=none; b=BOhb3Uvm3vLuYc4ejjIuXCnOSs4gm7j+AS4VrTj27+oI2rcA+62s4FpirGNkNcYP9BaXLOYCDXraUvpuIfeqUnCAToITLpVLVeJrHUYud9QG1AKyEwy/Twz/nKVrEDUJezpRP1fMZuIVNOQ3FP2Ys38c1rSyu+Um9ODRsRwLFKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279533; c=relaxed/simple;
	bh=1yNZEMjZ0IP17UyaKybedpVyOSN2FDYSew1nP3KXufc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IvJO9tqCo8b5mbAgFaLAX/bYnYQPdHPQJgaBpsGhcivbMWraCf/hwyo0SFPWXLKeYfKA2vYntrPODjebkepzCxhpDML82Bg084X6EdSNGxmp5lii4ER5MJph1yBM3UUu4mwJNl9IjLNEOLSV6rRLL4UXSQXq68vCCxw9ZBjexj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H+Bfo5q2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM2MpK8027698;
	Fri, 22 Nov 2024 12:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3Kq5eqQOb1zVE56trFiqt1
	YJq1KZSUCIagq3ICq0o+8=; b=H+Bfo5q29DTrCf2hVjtc4cjM3EUfEd5RrSWD+Z
	qP74tFaP27WbV23YoFxrp3Q9yG+ourFp1B9G+YMq349ulia+D6vXbCGEAgBtj0wY
	A91Acl02HfBkHY8teHfmmX+pIs0NSKKEIHD96WRGrZMGPA2ck3joH9iVqb2OHXs4
	ypkhuzKKixJPdTt9xPju5qFhXccJjZiu31TBatuJG1VPTVmRhuyzILaUdMCY3gO+
	gHqcs+ccV0hxbo+48hoaxbwupXOFACaVQQEGQQWl+0umL1/NMIbv6c8M+aKP3YpL
	naPgt1AQuK9Vu8dbcFslcjtYCz/iOS6Pia9oJAuDtVoCDu+w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432h4dsdxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 12:45:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMCjNN9004984
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 12:45:23 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 04:45:20 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 0/4] Add SPI0 support for IPQ5424
Date: Fri, 22 Nov 2024 18:15:01 +0530
Message-ID: <20241122124505.1688436-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: zh0JExkdYyMKRm9-LbMlmqlMdyntOsNm
X-Proofpoint-GUID: zh0JExkdYyMKRm9-LbMlmqlMdyntOsNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1011 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=745 spamscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220108

Add an SPI0 node to the IPQ5424 device tree and update the relevant
bindings, GPIO pin mappings accordingly.

Manikanta Mylavarapu (4):
  dt-bindings: pinctrl: qcom: update spi0 function
  pinctrl: qcom: ipq5424: split spi0 pin group
  arm64: dts: qcom: ipq5424: add spi0 node
  arm64: dts: qcom: ipq5424: configure spi0 node for rdp466

 .../bindings/pinctrl/qcom,ipq5424-tlmm.yaml   |  4 +-
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts   | 45 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         | 11 +++++
 drivers/pinctrl/qcom/pinctrl-ipq5424.c        | 34 ++++++++++----
 4 files changed, 84 insertions(+), 10 deletions(-)

-- 
2.34.1


