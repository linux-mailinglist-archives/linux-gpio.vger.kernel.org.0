Return-Path: <linux-gpio+bounces-744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7387FE72F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 03:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1DE9B21016
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 02:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7768FF51F;
	Thu, 30 Nov 2023 02:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FKvIxXQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFED1FEC;
	Wed, 29 Nov 2023 18:41:20 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ATNgv0I025348;
	Thu, 30 Nov 2023 02:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=CnGzzA4BRbO1d1p8Fzo+2MluM6VFPqMjpr9wXLXr5MM=;
 b=FKvIxXQFsPip0lS9rFZu1rmUTiya07+uELNVL7Z1BwidMrkcfYzc7usMd+0paFx2Qg6N
 57Ig20EiEI8t+cldmJRVmXaQ9x/2vtBqM6CjaqNIC3r8zK6sy+yTgH99it7M75ox9Qjp
 v+2eZzvG5OvqX7PKEffUeqLOT6d0ab9BFbxsQ87IgTmLy2ABi637K60cKX8981wR6YpM
 suFkXzULpu4VN9EBP9XRinIla/dI4Hk345ghLTWhNoRiX90Bdik0VjUvdRiYNSHJpA6+
 hWhEwVyBTxtKRjEeV3WyvtB4CF7AQybcmgLpadm9yO0wzkd6iyw7YkCM4dnmcVHfKXaH ew== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up37ya8g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:41:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AU2fEwW008398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:41:14 GMT
Received: from tengfan2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 18:41:09 -0800
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <agross@kernel.org>, <konrad.dybcio@linaro.org>,
        <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v5 0/4] pinctl: qcom: sm4450: Add SM4450 pinctrl driver
Date: Thu, 30 Nov 2023 10:40:42 +0800
Message-ID: <20231130024046.25938-1-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 55z1WgJluG1bh2lchH8GUiUbZdvqGCMJ
X-Proofpoint-GUID: 55z1WgJluG1bh2lchH8GUiUbZdvqGCMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_21,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=681 clxscore=1015 mlxscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300018

Add SM4450 pinctrl driver for support enable uart console.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
v4 -> v5:
  - Convert to platform remove callback returning void
  - correct incorrect address offset

v3 -> v4:
  - update gpio pins pattern

v2 -> v3:
  - update example pieces
  - update gpio pins pattern

v1 -> v2:
  - update right platform name
  - update gpio-reserved-ranges have right maxItems
  - update gpio-line-names have right maxItems
  - add min/maxItems for pins properties
  - redo dt_binding_check check
  - delete reserved gpios setting
  - combine separate pinctrl functions

previous discussion here:
[1] v4: https://lore.kernel.org/linux-arm-msm/20230920082102.5744-1-quic_tengfan@quicinc.com
[2] v3:	https://lore.kernel.org/linux-arm-msm/20230920064739.12562-1-quic_tengfan@quicinc.com
[3] v2:	https://lore.kernel.org/linux-arm-msm/20230915015808.18296-1-quic_tengfan@quicinc.com
[4] v1:	https://lore.kernel.org/linux-arm-msm/20230908063843.26835-1-quic_tengfan@quicinc.com

Tengfei Fan (4):
  dt-bindings: pinctrl: qcom: Add SM4450 pinctrl
  pinctrl: qcom: Add SM4450 pinctrl driver
  pinctrl: qcom: sm4450: Convert to platform remove callback returning
    void
  pinctrl: qcom: sm4450: correct incorrect address offset

 .../bindings/pinctrl/qcom,sm4450-tlmm.yaml    |  151 +++
 drivers/pinctrl/qcom/Kconfig.msm              |    8 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm4450.c         | 1013 +++++++++++++++++
 4 files changed, 1173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm4450.c


base-commit: 1f5c003694fab4b1ba6cbdcc417488b975c088d0
-- 
2.17.1


