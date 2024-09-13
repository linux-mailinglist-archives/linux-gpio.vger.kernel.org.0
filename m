Return-Path: <linux-gpio+bounces-10068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F71977FA9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 14:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4F7328C5B7
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 12:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793861DC1BE;
	Fri, 13 Sep 2024 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gv19HO+2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6E31DC1AB;
	Fri, 13 Sep 2024 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229664; cv=none; b=M2AqkekmrzchL+bBNc081Cl5aWa2wwmz58Q3IzI0EB6MOX53DRpsMQ9F9294A5LwCjpkBL3+rs/boEgfnsID0ae5x212IlEphzkslZ2sycwrpNgoS8djr6HDTlyi6sC8qaCQ8GCYcYE3JVzKMR9qra23DmEhFDeIlSWAK0Iv7SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229664; c=relaxed/simple;
	bh=KgfY8k7wTknCOX44F318lCCemudzZ9UCAXxYkdXtuj4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRKCMFMyIOIaSlYq/jIFOI8Qhi/0kWvH1YqJjsH/WGr4wJn4iIIG6Z69o14XXhhArZXo0vitI8xEii35Bk9hQttSuEsK7gXO7XzhDRw+JyrbYUKEUyLH+1PQVzQwIrrsQzVtBRseKXTsRkXNq1E2CNZZA9MXLm+BJRSXEmQSxPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gv19HO+2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAXLvn003012;
	Fri, 13 Sep 2024 12:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTW+xQ0YHxfd5LtDcLYmSzFyUCzTD7kHhUihQvVtYB0=; b=gv19HO+2Bfnwf1h1
	/EIiqzgOmFpoUX2X1aPd4mLnHDN8vt3bxk0cWK2tnmf8DIal9Z/ABiv7Uo/ycsxM
	INNB9lCqvC606sBpPxn9ONsVga60tlc0BkXpNhuKr99Fqo7C4U0/m8U0lwqfNw6x
	Fx4w5ByKBkPDpywG85KmWq3AS+PZ3aMbZ4QZxC+EzslkYlNThhZkeFMAHzLqW9TL
	9oMdutM/sGLKno7W4gYv/ivjUzhC/ynAg98Iui+3k7K52OdauAmkybJMIL59EQwi
	rkletoGvFLtmPcnkBAuj9LJ6g0B8oVu23ne2BUg4As6qT9a8diFjkzZ3CUEGZ1uQ
	UdVvEg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybq0j3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:14:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DCE7LK003370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:14:07 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 05:14:01 -0700
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
Subject: [PATCH 8/8] arm64: defconfig: Enable IPQ5424 SoC base configs
Date: Fri, 13 Sep 2024 17:42:50 +0530
Message-ID: <20240913121250.2995351-9-quic_srichara@quicinc.com>
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
X-Proofpoint-ORIG-GUID: IdqCOB_-2rioZ6hJ81bmqBoTCKMB0awn
X-Proofpoint-GUID: IdqCOB_-2rioZ6hJ81bmqBoTCKMB0awn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=695 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130085

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Enable the clock and pinctrl configs for Qualcomm IPQ5332 SoC

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
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


