Return-Path: <linux-gpio+bounces-10483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C9C987EF8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 08:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 352DE280F4E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 06:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B11018A6BA;
	Fri, 27 Sep 2024 06:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hvktYrex"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D2A17F4F2;
	Fri, 27 Sep 2024 06:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727420068; cv=none; b=gK6ZPG/wjo3nac6ScaRcyju0WN8CPf9deOhFMf8TX+2lZGgvzPP/rmSXT1USZJX5WUR5PTVc+r7X8CxlX8XKD1tVk0a2Pvn4PA37XMjgGRx/ft8/h2kqi3fL3q+OX+oX1Pwxg97AjEmwxHdRzZ6g1IEHVznllB0pZlK3W2dQ7Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727420068; c=relaxed/simple;
	bh=QpvEcDNCljQ2ug6VDRACEFEoLDWUBUBn6kBHhdKEDaI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VCrlOfX4Ln9zXp7Bid1XPNPswE//uTfQVROycXNhhcVRaJuAwDH47MRtdFw021imTlWdfbNYLHg6S7gFmdtJGfZb4pYPkT0rS8Bd562Mfr9o5fFdCDrdliYsvvoz5zjG6rTTqwhpjuAVWojq2H/ovR/PoppYONyZynlubNXuIYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hvktYrex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48QG9mC6002825;
	Fri, 27 Sep 2024 06:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53RXqvoNw+Ed5CmycSGy7yLf7jC2bBG3RZhAfnu/tGg=; b=hvktYrexdaqsOILI
	Vpv4JRm+qwj9t6IVrfLU6ZY02aeiqqSREhnBuXYJ/+WMiqQpodMUAMxh3cbl4IRn
	3XP+hz2JV1ZGkewSQXYrHErxnhZN/KLktuADwzg2dfrRtBfmqj42QJICJrQmTq0C
	n6UywwF7cbyoVHu5zfDCFbDNJMjBbAVUKEoIMnSrgsOlerSYE6gdgnKE4bpFumDu
	B4UNQYfmpTI50+2RM8x5JB9o35hdE/rt7btxztiadDkKmQ6CPfqdjO6RWJ9T7t0Z
	fEHxBmPRIPtrMCwVhjABMX80NS5oJQpgfsQu+s6R4XWZsI3kN9vNoUiOrX6Seq//
	DL2L9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqaksm8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:54:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48R6sCtq022387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:54:12 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Sep 2024 23:54:05 -0700
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
Subject: [PATCH V2 9/9] arm64: defconfig: Enable IPQ5424 RDP466 base configs
Date: Fri, 27 Sep 2024 12:22:44 +0530
Message-ID: <20240927065244.3024604-10-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927065244.3024604-1-quic_srichara@quicinc.com>
References: <20240927065244.3024604-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kafJFIT8Cnar2ZoqCoNaovVlk9Rhw4MD
X-Proofpoint-GUID: kafJFIT8Cnar2ZoqCoNaovVlk9Rhw4MD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=737
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270046

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Enable GCC, Pinctrl for Qualcomm's IPQ5424 SoC which is required
to boot IPQ5424-RDP466 boards to a console shell.

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 [v2] Fixed subject description.

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 81ca46e3ab4b..f1043a40846a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -595,6 +595,7 @@ CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
+CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
 CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_IPQ9574=y
@@ -1304,6 +1305,7 @@ CONFIG_IPQ_APSS_6018=y
 CONFIG_IPQ_APSS_5018=y
 CONFIG_IPQ_GCC_5018=y
 CONFIG_IPQ_GCC_5332=y
+CONFIG_IPQ_GCC_5424=y
 CONFIG_IPQ_GCC_6018=y
 CONFIG_IPQ_GCC_8074=y
 CONFIG_IPQ_GCC_9574=y
-- 
2.34.1


