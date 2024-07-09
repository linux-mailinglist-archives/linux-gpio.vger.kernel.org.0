Return-Path: <linux-gpio+bounces-8125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2266392BA89
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 15:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFCB8288ADD
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 13:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706CC16848F;
	Tue,  9 Jul 2024 13:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SS/XMzjK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EB915F3FB;
	Tue,  9 Jul 2024 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530315; cv=none; b=m8bRN9l/9/6MOwAhprx/eOPGWUybLUJ9jUUa5VfnSv8Ysw/x9zu/ZfvhCiXY5nkfhoTwF8B1IwjOnOetcKcCCe2WKxcVSCzo9jy9TsbW/0uhcREu1pjtFUKpUzERSpNOr65B2Ns4EjFaHpvnFdcmKfJt6SFK6lQ1XXYYBPRxPwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530315; c=relaxed/simple;
	bh=g/aUHvXxTHPX3JZ0mMm7mcozUkYkAfOncDbXklq0rUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bPtgj34jond2PZfrxTeMJdR8n08srsnk6aVk5xX2kvdMH/ia37fKMy/ktQU46DLeZZdrJY/VTGUbMIf/wJxTxPjx7rVOHfuulsqDk1eHuqgUYOYs8fPII4Gdmtf3Om3RfHNgObWhKM98fTDpbQECobLUY52epPb9W+vytUem5Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SS/XMzjK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469C1gs4015979;
	Tue, 9 Jul 2024 13:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RFP9mblTC+dtoKt+RILYJIoD/joQNTFBFgSa9cehOQ=; b=SS/XMzjKa4MfuRln
	ROwN+/1Mu2S4uoHeEnYwArGZvo5g2B+lbRB8YCfzQV5f6/7bFn5arcbjHzRhAE95
	DhFxE/X38t9cp4Aua4cse117USsF9kORpk+QkmpwfHaOcLJOPBQz05rbRO8ksFao
	3fu9Y1yd8SNcPnuMWEyOBGRw1pJh2aTTr6U5czyNZrpS4j0G6MTTNllWpAESAvip
	nARbvY3hOizyycS2F17w1Pwb4i5QiiUtNzmbPbjW4kKGTK8dyZwnFXfIMQ0jtKUK
	x/IgbBppc3trG1syNdkXqpPMskGx8dQEkDqZifkaV7zXNhQS414IYOml4GLi/NYh
	ZTyyHQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y3he86k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 13:05:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469D5950012863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 13:05:09 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 06:05:03 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 21:04:42 +0800
Subject: [PATCH v2 2/2] pinctrl: qcom: add the tlmm driver support for
 qcs9100 platform
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_tlmm_compatible-v2-2-d025b58ea196@quicinc.com>
References: <20240709-add_qcs9100_tlmm_compatible-v2-0-d025b58ea196@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_tlmm_compatible-v2-0-d025b58ea196@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720530298; l=1001;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=g/aUHvXxTHPX3JZ0mMm7mcozUkYkAfOncDbXklq0rUY=;
 b=MoRGAsdTcwuzyHQDMDkfK7tqJLU3Y0UjXLe4MCp13T+b0bwEKwpJNBc2+AD/42gq415V5wl11
 d7i+LLRaOkCDivv3ujGXQx0sl560KRa2B1tC0W19MOCoYR+85o3Y9Sm
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C2cAdL8ZpgZT2fwTf0PiqB1e0tD0N7Ym
X-Proofpoint-GUID: C2cAdL8ZpgZT2fwTf0PiqB1e0tD0N7Ym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_02,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=982 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090083

Add the tlmm driver support for QCS9100 platform.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-tlmm" to the pinctrl device
match table.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 5459c0c681a2..4687e11dfe75 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -1519,6 +1519,7 @@ static int sa8775p_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sa8775p_pinctrl_of_match[] = {
+	{ .compatible = "qcom,qcs9100-tlmm", },
 	{ .compatible = "qcom,sa8775p-tlmm", },
 	{ },
 };

-- 
2.25.1


