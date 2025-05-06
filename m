Return-Path: <linux-gpio+bounces-19646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA426AABBEA
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA574500B16
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDCF2741AB;
	Tue,  6 May 2025 06:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gaf4Jf2F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A475258CD7;
	Tue,  6 May 2025 06:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746512631; cv=none; b=VB3RUL5m0qFK4anftf8YQM+XUhaXiyTmxjNBM9W6VWHT9c3WC7hh4Om7iBNpKyee45OU0HLupUOCAmww8O4PyZHjDe/9etURTTPFyvLLXE4R3nBbU61pggvFP9P+05BHMMNhlnuMrg3l4t8iNPfT2tAKKXben2BNialInNUiwrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746512631; c=relaxed/simple;
	bh=DNFkB19GVt6Iboi6S4xG2zMCCacuLEnT8f1CCobvHdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lYGyCnIT9W4Cg4JSmbZA/Ohi0f6XFLfEJxK8DWJg6IwIanC53wbSo8C9hQawjmfm6kFeuYI+ZtkxQp/8EEvdF7/+wW4FrbMrLrP3RHsdh2J/ijsY9swgDzeW4v/FmdnlixN5ftGBB4uYB2qF+YnzBQs3vWKWqpA5B8kh8krLDV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gaf4Jf2F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KU1rF016526;
	Tue, 6 May 2025 06:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LmXvtLGFGD9pR0YbOKJbbDCw9jj/fLwCQEx+gzZwwo=; b=Gaf4Jf2FW5sOmQjR
	epu5W/qmg3OjC7omeBVN18gRh5hDFw6T2Ef4/a+dwn0uEuTQOgqvXaRASu0XmdYw
	wkFjeduPqs79tgPab03hftTJqX/QykQtyIVfIVhV0kDtOGVLrQwK1SHxJBg6r88i
	9Ixcc7MQ0jKfwhSGMAubuTZ8eyDuMe+5VykOkhYtOreQXqv8OpJiAGJSgs7WAdF8
	sJPdFXQTBq3nNTgGXTbd/73dT8++e6LCxR6UbX81A5WMfZXqQ13IAaVPS48Mk7PP
	5RRbNIT86/xyWc27NiLhoOR868ZdEpR3/xjbfhSqa/A+DKnpX2L2Jx34vxGmO7tK
	G62M8g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsw0qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 06:23:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5466NipM013750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 06:23:44 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 May 2025 23:23:38 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Tue, 6 May 2025 14:22:59 +0800
Subject: [PATCH v3 2/4] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples for qcs8300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250506-correct_gpio_ranges-v3-2-49a7d292befa@quicinc.com>
References: <20250506-correct_gpio_ranges-v3-0-49a7d292befa@quicinc.com>
In-Reply-To: <20250506-correct_gpio_ranges-v3-0-49a7d292befa@quicinc.com>
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
        Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746512610; l=1158;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=DNFkB19GVt6Iboi6S4xG2zMCCacuLEnT8f1CCobvHdA=;
 b=n0PYOOKGROFp/0ykCdmZfzMmwu+sBgb7F/ja5bqpAsArQZ1r8gHg+g9SmJ6NtihOyeP09AhLy
 26qBJqJa0GECpqXM0paVCX0dEBRONBq31I5pTlbGl87dp29nBoq5J0c
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gowoJ3Yip4pqkfZuWHXpAvI87wUCHLxa
X-Proofpoint-ORIG-GUID: gowoJ3Yip4pqkfZuWHXpAvI87wUCHLxa
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=6819aaf1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=MB3vSMhoTmvuE-jUjQ8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA1OSBTYWx0ZWRfX4U4ObTpOKkc/
 +/AHZcAxh4MlOxaHsAVfN+bUJvss+d+P6d8NOvsimQM5NgmmfiB+xlN7BPnDhC2QRyz1d/j4eig
 UrpjcKf02oxCElcNbDNKlbf+ucH942pwUxyVl5eNeGR7wcPpQmx+AkdxrmMAqGrhq490XT9D+WL
 ns0dqFh2UZNvgSd8N4jAQ4nbR2ckj2SJ/pNao156JeJV5PN4pmWQ7f3MyVNGg4sT4fPizU6gKqK
 UzMwvWpsSgqu0+u7ONB7GWUEbe6tYCDDfympm4D+nrU5zjDK+aEJAlJdQmTV7d9BcyhN5kF/omF
 8G6sSfgbqueEAG/Bjx2z4pIOV1eBoWn6noiMKHjNpYtabvse3QhADC1z6OJcXmOhnr6TJyZ3xMl
 XKoRrC94naMDP8lic9zgaYd0OJeRpVJo9vaidvJQqCJMwD4n4IcSF/D2uAdgK351mQoaUOsa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=597 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060059

Correct the gpio-ranges in the QCS8300 TLMM pin controller example to
include the UFS_RESET pin, which is expected to be wired to the reset
pin of the primary UFS memory. This allows the UFS driver to toggle it.

Fixes: 5778535972e2 ("dt-bindings: pinctrl: describe qcs8300-tlmm")
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
index bb0d7132886a..489b41dcc179 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
@@ -106,7 +106,7 @@ examples:
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
         gpio-controller;
         #gpio-cells = <2>;
-        gpio-ranges = <&tlmm 0 0 133>;
+        gpio-ranges = <&tlmm 0 0 134>;
         interrupt-controller;
         #interrupt-cells = <2>;
 

-- 
2.46.0


