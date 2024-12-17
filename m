Return-Path: <linux-gpio+bounces-13949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFFB9F472A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 10:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C496316EEFA
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 09:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E481DF99D;
	Tue, 17 Dec 2024 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JBmAsTVR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F58E1DF975;
	Tue, 17 Dec 2024 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426834; cv=none; b=t9CUp8Zz2CV/GN+jgw48V277h++JJDXUsiu8Xyy/e1KjMSvA8UrE5oRg3Nc+VhGLq9wdW4F69b//E/8rEcIgE4XgQyAhQqnSQR7kOFHGnlSZLjd7J3vdyyoINQee8DC61HYvDhCRHPxral6NnzwxDNXRZdw3UOVIy1YA7DJ3N4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426834; c=relaxed/simple;
	bh=Whx0o1/PhzRCL/17x9OG7z1MNTJCU6mesr7CYnIl0WQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j9EUd6agij3ziKgzg55UM0pJlK3jQDOOJ1YtWPh9V67Fxs5aJDo08WwDOZYjiUNCtxeTu/u0doUj/DNS76JhffyJ6s+3rvbXQSOaMofGVFMDn3N0lnd5BLXDb4yXeOFBt1LhDQ2FqGOgCD3GaQyI1Y+0BS6iO3mBzVcnreBlEQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JBmAsTVR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH4la4a013531;
	Tue, 17 Dec 2024 09:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWjzieypPCWLFp/Pn//EENaejqjA6uBSOffgqoQX2UI=; b=JBmAsTVRVsaJyQi7
	GlswI5g7o74xjOXtMmwr2FxXpylLkfmgo/A90rbsHrMtos+M9JP8sZmaZxCwbchL
	Xvw6Wan9CBpLKJ8zBtGf7qvUBrC0X0abPcrLUbcdBIBcH2dDUKAR3lu0nf/4lJvA
	AH7vwyyXxqykLR3lQ3HaEhr0muv5Ynai/WSwveC+oea6HpojsGy1TaZatUAPtANd
	3xlpElmzUwWDYvOWmaDsMFCVm0WY0Zjh5T6y6fKes3T5ohN2fl85JqRxI+Aek60U
	mpI0B8oohedDEDz4esPzzakaQ9GIwDz7SU+koXRR9jA0UuCuI3UQ1cm3bg5ElsLu
	SIG3Bw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2k7gmv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:13:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9DmEx025643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:13:48 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:13:44 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <quic_srichara@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: qcom: update spi0 function
Date: Tue, 17 Dec 2024 14:43:05 +0530
Message-ID: <20241217091308.3253897-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217091308.3253897-1-quic_mmanikan@quicinc.com>
References: <20241217091308.3253897-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: XzQrPClnOd4CzP5wqMPDJtxl1pvS9OIH
X-Proofpoint-GUID: XzQrPClnOd4CzP5wqMPDJtxl1pvS9OIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170075

The GPIO configuration differs for the spi0 clk, cs, miso, mosi pins.
Therefore, split the spi0 pin group and document each pin function.

Fixes: b88752d3133b ("dt-bindings: pinctrl: qcom: add IPQ5424 pinctrl")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V2:
	- Pick up A-b tag
	- Add Fixes tag

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


