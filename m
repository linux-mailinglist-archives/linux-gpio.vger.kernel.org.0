Return-Path: <linux-gpio+bounces-644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271B7FD37E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 008511F20FE3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 10:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C66E1945B;
	Wed, 29 Nov 2023 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oATx+9Dd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAFFE1;
	Wed, 29 Nov 2023 02:04:52 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT4fklb009681;
	Wed, 29 Nov 2023 10:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=bFE0mdsf/eZNNoKB7chGZc1B+62b/EGTOCMWbs983Hw=;
 b=oATx+9DdgsRiS3aqunsVbarAEttXZrU1Ie8X5MITU2dFJ3O9KDzscv5IUGUyxlPVyTpY
 iDdCVsIwGruBEtQx+Mawej0RYGCh4QXwg12ZwlIM8yZH8NcDxeQy9asfOOSbLdvDxz/s
 8YvktqUOvzhrykkbIvVJX2vQ7CgOu7WCusqOh03HCDkE96y3qPp1u4gIvPlpNAFshJR8
 2zIsG+SsBLO6e2tpznZC6iacc3f0RqykuXgkj7OYTj3KDVAIS5kvmsd36oiJLMHDSRLl
 a1XpwfBT69euPghMnaNI2wLLWULJ8yZAW/v8gVv54aFd2IV3KJ7fT8CurFIq7wOXiJyk mg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unmraa11n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 10:04:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATA4mdl019334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 10:04:48 GMT
Received: from tengfan2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 02:04:44 -0800
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <agross@kernel.org>, <konrad.dybcio@linaro.org>,
        <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH 0/2] pinctrl: qcom: fix some sm4450 pinctrl issue
Date: Wed, 29 Nov 2023 18:04:20 +0800
Message-ID: <20231129100422.16659-1-quic_tengfan@quicinc.com>
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
X-Proofpoint-GUID: 0gxOd9_p7qVexl54PoCSStMf4eaIAz8Z
X-Proofpoint-ORIG-GUID: 0gxOd9_p7qVexl54PoCSStMf4eaIAz8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_07,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=368 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290075

Use .remove_new() instead of .remove() for converting to plarform remove
callback returning void. Correct incorrect address offset which used by
ufs and sdc.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
"[PATCH v4 0/2] pinctl: qcom: Add SM4450 pinctrl driver"
https://lore.kernel.org/linux-arm-msm/20230920082102.5744-1-quic_tengfan@quicinc.com/

Tengfei Fan (2):
  pinctrl: qcom: Convert to platform remove callback returning void
  pinctrl: qcom: correct incorrect address offset

 drivers/pinctrl/qcom/pinctrl-sm4450.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)


base-commit: 1f5c003694fab4b1ba6cbdcc417488b975c088d0
-- 
2.17.1


