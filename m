Return-Path: <linux-gpio+bounces-13195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B03999D5F04
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 13:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D50D1F22587
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 12:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2FD1DEFC0;
	Fri, 22 Nov 2024 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oFrLjvH+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096E28BEE;
	Fri, 22 Nov 2024 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279534; cv=none; b=uOhRzCvjsXw9jwSXSlTzXujcWd+NRccckbkXkVYanwds6dFDFkBNhXsKPCPfs3cNBmMBHp4zo6uLGq2iRZ/1EBAAG82AJg/wMstG1sDEPbPPj452K8uOCrdsufJ/4gZidCKIlwciWCA6CDUld9NfRx25EUZGDze2O/SM4xMMteg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279534; c=relaxed/simple;
	bh=SEhI9Z88N6QU3KSwEDOkUq8TKvxkVDsWgkPZ6IsrbSY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVQZL5FRDdfMiWEnkgBz05AuLTuHniGpnMuO7ueD6NEiED0IUTYu7M0iOlZblLlE8rHqnrU4rnk/Nnj/a7+/fJyRhv4jWFTiHthDTI1u9mBxELzeGN9kUJw5ZueJD8kNS6ReMmSS7bwCSoe1tm43ufItQEFYkne5ryQIjUmekuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oFrLjvH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM7uNvc003296;
	Fri, 22 Nov 2024 12:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cl+NKhnn3LmqYacwRhS3A808QN8ZNpFL7tt6BiTuFPw=; b=oFrLjvH+7MfcJTKJ
	eZxpL3t+PJBj6FPzyWSlbD7xJkvyNFoJkn7qaxOxQ2Uue+wCkOZw/A8fa5XCU+6P
	UD/EuRtkj8tsqQ9YDrd8jFt8b8BZPoVVUMzqeYF30WRO/1thkGKl+HDdP5KDCVOH
	1/X4ElX0nu8fMsVcBGquhMEzTRbtWCRfbVRiNtMQsj1xgmyK1a5mpdc5/Z/3zJOc
	vqOsCKNl4DDg9hqMoNte/knB2XjbRbuvC4jIGmXsEsKskKyxdLoOesC8eXeD0nhe
	/ukZfBBt+NyEHLIxLEExFmwYgb+qQ83KyQVW9FH0BAOxDxUJmkApaSK2NE5WSdQH
	zt64mQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432p0d8rh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 12:45:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMCjSv4029066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 12:45:28 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 04:45:24 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 1/4] dt-bindings: pinctrl: qcom: update spi0 function
Date: Fri, 22 Nov 2024 18:15:02 +0530
Message-ID: <20241122124505.1688436-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122124505.1688436-1-quic_mmanikan@quicinc.com>
References: <20241122124505.1688436-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: fVoJKFx_sHCDpP7oAPSlGxe418TbqohB
X-Proofpoint-GUID: fVoJKFx_sHCDpP7oAPSlGxe418TbqohB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=943
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220108

The GPIO configuration differs for the spi0 clk, cs, miso, mosi pins.
Therefore, split the spi0 pin group and document each pin function.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 .../devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
index 5e64a232fc7a..df284d3645c1 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
@@ -79,8 +79,8 @@ $defs:
                 qdss_cti_trig_out_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_b1,
                 qdss_traceclk_a, qdss_tracectl_a, qdss_tracedata_a, qspi_clk,
                 qspi_cs, qspi_data, resout, rx0, rx1, rx2, sdc_clk, sdc_cmd,
-                sdc_data, spi0, spi1, spi10, spi11, tsens_max, uart0, uart1,
-                wci_txd, wci_rxd, wsi_clk, wsi_data ]
+                sdc_data, spi0_cs, spi0_clk, spi0_miso, spi0_mosi, spi1, spi10,
+                spi11, tsens_max, uart0, uart1, wci_txd, wci_rxd, wsi_clk, wsi_data ]
 
     required:
       - pins
-- 
2.34.1


