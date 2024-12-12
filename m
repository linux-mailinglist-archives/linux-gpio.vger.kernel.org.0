Return-Path: <linux-gpio+bounces-13808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA89EE2F7
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 10:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEB8B188BB6F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 09:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C645C21324A;
	Thu, 12 Dec 2024 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jHMnIMmy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C732210188;
	Thu, 12 Dec 2024 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995485; cv=none; b=giuv7UGc0Vi7oLLgdtneC+ha5PhUUaaE7SkEPsVfSuqWuOx1pnzBz0iQUPcL2GgPpULT40oSK0515RJ5vcg8+e/en0lGq4PaWbeU94+2oxo2F7/7HZL6SI4kyC9OQY4hXX3Ustq0w9NrMf5sVlVSGWlR2oo7/gLE05+1D0JlXxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995485; c=relaxed/simple;
	bh=vCwIhGCjXmjCA1Ma9uLFUEilpiYAlaITDHBCZV3B3xU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YMazuY86gFivVBSZCnoFpGSjc+8V6yWLz7xkd/h65EWMEBoWZSffdXsT3HQuL5jrGgf6DRcijjU4jkYQNCLIbWHnuEH8B5CDnB1A91jJA8OgEADGIYJ6cK7JRxbx54FEzO12M9z0ibTgDQd0liWkhseAbNiKrO5XRYxMP0QVPoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jHMnIMmy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7qAXk032186;
	Thu, 12 Dec 2024 09:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H5LtfJQ/X6iDOog7zMSQfkIHxNYMjH3TDsbDmW8i4gs=; b=jHMnIMmy3brPRvkH
	SKoEZGuTIaUzUJaRmbMFu+TMr2DT/xxeNp9NdOb+ivnOUGp/4Ba8RBrrpBE/0wCs
	vhIu+S51EkzrFBKnE87E23m2Nb7PzC/CIsn7KqmXHphOfYhFUcMJMUlaWtG9yAIP
	RVi4aqstYxWEJtsZFOu06sGU4If2xt3blbaGeFd+Glu+ospYrwAi6JSePunbiGf/
	/+U8IaPTj/tuDcFORUkhuxVCdOKf1eJP2q+MYH7zqEC/1y/0OzhPTWgDKoQXi2/9
	3CLQGhP0/MFpl2k82JVqExyZKwYX9OtwjHlFCu2sed0jilqT9rqQoQBTdMaUvFQ2
	WmJ2LQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfbnju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9OeTi031749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:24:40 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 01:24:34 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 12 Dec 2024 17:24:05 +0800
Subject: [PATCH 6/6] arm64: dts: qcom: correct gpio-ranges for QCS8300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-correct_gpio_ranges-v1-6-c5f20d61882f@quicinc.com>
References: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>
In-Reply-To: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Jingyi
 Wang" <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733995452; l=930;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=vCwIhGCjXmjCA1Ma9uLFUEilpiYAlaITDHBCZV3B3xU=;
 b=w+W3WF3kQoLwjmYrXjKI7sLkJeHlHrk4L8f6KD8OKjfbHaV9uUUStyVrVouwmAzvhNOcoxPTx
 OdugC6s5BqjAbEbsFC4EIZLPLlHyElUNJ9sKUZqQ7eSbjloN5rCYd+O
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DC4x-V6h9tQ5jBP2VdOtxJdGGvJ1rLiJ
X-Proofpoint-ORIG-GUID: DC4x-V6h9tQ5jBP2VdOtxJdGGvJ1rLiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=470 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120065

The QCS8300 TLMM pin controller has GPIOs 0-132, it also has UFS_RESET
pin for primary UFS memory reset, so correct the gpio-ranges for the UFS
driver can toggle it.

Fixes: 7be190e4bdd2 ("arm64: dts: qcom: add QCS8300 platform")
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 73abf2ef9c9f..07d6d3ff4365 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -971,7 +971,7 @@ tlmm: pinctrl@f100000 {
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 133>;
+			gpio-ranges = <&tlmm 0 0 134>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;

-- 
2.46.0


