Return-Path: <linux-gpio+bounces-10063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D45F977F77
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 14:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF61DB2275E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 12:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2C21DA313;
	Fri, 13 Sep 2024 12:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WVsj3mE+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F015F1DA305;
	Fri, 13 Sep 2024 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229631; cv=none; b=gMJTM4rECUtjNIk++7v/G0dafOc5GY/wbE2iKqn/vh2Gp8eZrALiAIynsW9ZyOaYWIau5SmChWquc9Ca4ANlQiF3pFaVDIBT8hE8c2aIjD8g9ucwsLuFwsuGPUzjEbAZ8+vn5y369vCAIpBrIITDtifRkUqphXfPNJReblMQDQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229631; c=relaxed/simple;
	bh=2ptrqawpzzG3PWtPQguS70311YVY8zzKG8ecWMvnQ18=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CIFCyeaD654SLbp62DyxkEmIsPU7k9ejbJmTEZS0lA8+ZJrhpxJVpVT4ePeXJcbmMVLP2JxRlGZt+DNle9Qgbsbr/tPWoGVUH7WW1C4uFZoF/eeAAMQMPj6shBqg0qrymnO1SQYgFx7zIe22xv+ho6Vk78RI+7L4BRIL0K3EsP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WVsj3mE+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAXZRe015853;
	Fri, 13 Sep 2024 12:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTVfbexG7Vc6xnRTBTBjFm7+W/lIDuV8svAHyrwZ0Us=; b=WVsj3mE+RatihgpU
	0tDqET9egFYMQjbPpGMWbkV961YLk6EXqu3zLXbJLXDWyyuTuR6LBT9wPHJhvZjN
	MvEBOee8gFvOII3vsyiS31qwdP4Sp5K3ANpHjhdg+NPSajKzclrqMi1aUEPhkyvA
	N/mPTVYhKc0HC9+cCxpEVlANG8zb5m21lm3DsJS9MkQVdv5vH1VzzIWFsCQffpeY
	1R046xWdjSvCOWQchomtfU1sr8lIw3T62XHJe1OmSdFCCd08ET/ULKA2NJJkUwbP
	F7bQWw0484C9cAH+WWjXZataK/PXP+ZYvGJeMbtMzT625OBvX1gbSvpko5u9tCiJ
	YlL0lw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5e7x68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:13:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DCDXWf031436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:13:33 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 05:13:26 -0700
From: Sricharan R <quic_srichara@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <p.zabel@pengutronix.de>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <neil.armstrong@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH 3/8] dt-bindings: mmc: sdhci-msm: add IPQ5424 compatible
Date: Fri, 13 Sep 2024 17:42:45 +0530
Message-ID: <20240913121250.2995351-4-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913121250.2995351-1-quic_srichara@quicinc.com>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q4comTM6XDh6UJ7C7daLUX3AYr6IHLXq
X-Proofpoint-GUID: q4comTM6XDh6UJ7C7daLUX3AYr6IHLXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130085

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The IPQ5424 supports eMMC with an SDHCI controller. Add the appropriate
compatible to the documentation.

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 11979b026d21..2b66c0f3129e 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -38,6 +38,7 @@ properties:
           - enum:
               - qcom,ipq5018-sdhci
               - qcom,ipq5332-sdhci
+              - qcom,ipq5424-sdhci
               - qcom,ipq6018-sdhci
               - qcom,ipq9574-sdhci
               - qcom,qcm2290-sdhci
-- 
2.34.1


