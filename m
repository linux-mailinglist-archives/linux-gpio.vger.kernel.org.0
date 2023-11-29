Return-Path: <linux-gpio+bounces-645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 723907FD380
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2410E282EC4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 10:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7C419475;
	Wed, 29 Nov 2023 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y8bzoUeI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B891E1;
	Wed, 29 Nov 2023 02:04:56 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ATA4rTh027423;
	Wed, 29 Nov 2023 10:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=JWvCvMixx1cFndEifO+XZZXyVb+8+kWj3TGddCobtlY=;
 b=Y8bzoUeIZpIUU83K78u37ASScrQu8N9HYHWK+XYLLD4oJhLn6Wiaf9pBm5gd1eSrCE0Z
 aiN0bZ2mW4qeu27CgpM6BQUNpfxmHUEfQ573lPnb7eB9S55y+YqaLgp9Xmptb8tD2yql
 9y4UHT/7pSGLpYlamtNAh1FPSPiB6MLMzeE01OoQgNTRqVGeH80K1/A8PorAbCJ8II9V
 WD7yqBkCr6BC5k/AYB4Tu/ouiQzeki5j8tvYfe0UKvjLZltb+gdKAXab8o8EyOh1MEcp
 1Y+g9MobPA1XQCqHrvmSmGPEMWwffeDe07RHDdPk4ZUm7Jp5x19nyUvQKdZtVRKtHrEB Tg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up37y8006-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 10:04:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATA4pMc025552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 10:04:51 GMT
Received: from tengfan2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 02:04:46 -0800
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <agross@kernel.org>, <konrad.dybcio@linaro.org>,
        <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH 1/2] pinctrl: qcom: Convert to platform remove callback returning void
Date: Wed, 29 Nov 2023 18:04:21 +0800
Message-ID: <20231129100422.16659-2-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231129100422.16659-1-quic_tengfan@quicinc.com>
References: <20231129100422.16659-1-quic_tengfan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: wOxCX6DEE_My-jZ5B8aB2iCMy-IJySgc
X-Proofpoint-GUID: wOxCX6DEE_My-jZ5B8aB2iCMy-IJySgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_07,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=995 clxscore=1015 mlxscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290074

Use .remove_new() instead of .remove() for converting to plarform remove
callback returning void.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-sm4450.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm4450.c b/drivers/pinctrl/qcom/pinctrl-sm4450.c
index 20ad639087ed..49e2e3a7a9cb 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4450.c
@@ -993,7 +993,7 @@ static struct platform_driver sm4450_tlmm_driver = {
 		.of_match_table = sm4450_tlmm_of_match,
 	},
 	.probe = sm4450_tlmm_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 MODULE_DEVICE_TABLE(of, sm4450_tlmm_of_match);
 
-- 
2.17.1


