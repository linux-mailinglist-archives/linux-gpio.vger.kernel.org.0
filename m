Return-Path: <linux-gpio+bounces-14251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F4D9FD112
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 08:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 682F23A06BB
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 07:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82FF1487C5;
	Fri, 27 Dec 2024 07:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ekbu47FA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306FA146A71;
	Fri, 27 Dec 2024 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735284316; cv=none; b=gVyDc1RysnqZ9OJnWoq1GDxO8iEB79YrtFL6QmL0sv9XcRNTwNXCBvlKT5UVMGjP9Kk8YqA5jEjcA75+styPJtjO9tnN+rJ0D72h1VJ2JcTSytgxSLAQo/8fU3erZtBHBapm5SPg7JuSCosSyoNvwOJ/qZpE3GqehGhc2FkGVGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735284316; c=relaxed/simple;
	bh=Bwx4a0ZEY9+M7pERSmkiTSRlo36Bts2rzp3x5RnRyyY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lypIgXUDPqTIkhkOBs6uh2nGS1nyMRVJlixFDyJtdFPMEonv3e70L2YQjBWCZUfU25yzjio/HlVVxVwi7VG34zZhBMvI7YUrAWh1j83ihdxNZSPOWC/caHZXKOtP9f44KLSSnYSnIEurbZjBy8qiMLlE5GCFzBxCt623XvpfXYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ekbu47FA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQF8JxH016471;
	Fri, 27 Dec 2024 07:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0mPJvl+ot5GQvmJOrDY/ksPUNVwXjZIAgyZoAPd8A0A=; b=ekbu47FA8nIKTcy2
	FfkgueKHNC/AvH8dWX22wXNBr3c0jabarpZpx3O35IiQh1MP6MawnxwkTk8vcgjW
	T5e/erWDniIRvTtxjZxKNHw4Pl+JE4T3boeCxFtNHQMCnxqzHgUHlDj8zW1Kn01N
	jHuNERBfOkewqWW+zDRDmGLo7/W3gfEHdvdld15n9/gxjHhnWMFhXCDpIt0nVOz5
	04Rrk/0tqvjev3bj1shNau2mrM87V61xdI+7CLyOF+erkvi7vlmFy9Zp3mz9dvTp
	By/kwqRH8EFwCzA6Ec7X1cxegUPrsEO/4IIqXQwFg41QpmOdlpwuYGRmvAv5V9AC
	qikGSg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s9gvka88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BR7PAxN014971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:10 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 23:25:05 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v3 1/6] dt-bindings: pinctrl: qcom: rename spi0 pins on IPQ5424
Date: Fri, 27 Dec 2024 12:54:41 +0530
Message-ID: <20241227072446.2545148-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2VVkE0dUjbfy1MABPxqUe9SnvnJZQpvt
X-Proofpoint-GUID: 2VVkE0dUjbfy1MABPxqUe9SnvnJZQpvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270062

SPI protocol runs on serial engine 4. Hence rename
spi0 pins to spi4 like spi0_cs to spi4_cs etc.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 .../devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
index df284d3645c1..4e0be380caf6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
@@ -79,7 +79,7 @@ $defs:
                 qdss_cti_trig_out_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_b1,
                 qdss_traceclk_a, qdss_tracectl_a, qdss_tracedata_a, qspi_clk,
                 qspi_cs, qspi_data, resout, rx0, rx1, rx2, sdc_clk, sdc_cmd,
-                sdc_data, spi0_cs, spi0_clk, spi0_miso, spi0_mosi, spi1, spi10,
+                sdc_data, spi4_cs, spi4_clk, spi4_miso, spi4_mosi, spi1, spi10,
                 spi11, tsens_max, uart0, uart1, wci_txd, wci_rxd, wsi_clk, wsi_data ]
 
     required:
-- 
2.34.1


