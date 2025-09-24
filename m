Return-Path: <linux-gpio+bounces-26556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C381B9AF50
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 19:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A256D3B1268
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 17:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4273B3164AA;
	Wed, 24 Sep 2025 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AV8ih3+5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9173168F7
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733290; cv=none; b=ikVGajurKsrJVY8DxP8ioQfsInCEYXLgX5kQjLk/8rH9tjA2H9y/Ceexn0qrIgjj9ckhiCqNdlbHef5URQraB2cwjOV4Kd0gyd0+elIuurz0eFIqN6cExKkYx/MYINxzN2Ehfm8e+FLX1Qh7yVxo5BfBnL/KkeMMRhLjLxIMY2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733290; c=relaxed/simple;
	bh=/aCT6AMn+DEBAszM+FafwAQnaRRZOfmB16zLDUBpxGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=INUtSIgRPmCiXGm9Mt95BCI8OdO5Ro7MlfvEB01yCuEuCJjECxzrODCB5IG+ZYAEaKCqptRiEFS4Zs+yIumjr+DTjCFomyUeShg9OOCO0w3dykwnry4Xy/PezovSV6wGYddh1kqu5g39pi/bKPm1dXshA8m/qKUjmPGFhmkrF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AV8ih3+5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCZoNH002789
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 17:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K94gZNJCyxLLjXcq/8C3d4M0HAtuU0U9u9rzRHmSpBg=; b=AV8ih3+5L5ShgFEc
	jUQGbPgQa+3ZTHZZxtWe6quQixGcAFzPPFavPQMm3mlsCARdaDH67ZZqlYX/oMwL
	G5lnvzOyXrG68n1IB1RKWqkwY1yW+k8hv0eEzLRW0MdMbF5osbGmeqhbAAS6B03R
	vrD4+3VqRTbaKZE+cumWdYZ50GyAXTVay0QHazHCRzVFOrvPER8QEofSXiEO+cOe
	0yq1uaKmEXM3JZkwY+Ctv5PtGvDUDmz6L7o4oH4GwNZ1xWjQJceLKvMJA7WUIkmF
	MqNMt0RcFoungbnUt2IQwXOa3+c1ufWWWG/ZGD++TdNu9oaRVRdv7Zo7z1cmep5+
	X7Jjzw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajeypum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 17:01:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eae48beaaso57616a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 10:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733286; x=1759338086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K94gZNJCyxLLjXcq/8C3d4M0HAtuU0U9u9rzRHmSpBg=;
        b=nKMm5s8IHzqy9jvc/l3Czr859IJI0HLcyGlQLgy+9wxLsDFxEI2lSwX8dlISjHiXR5
         3aiGKiWDoPFENSZ+ct5U6933Wfx7E6JXY/dtjmKQ3uFpmcBzloKStgQGWtrLnRydYHf3
         t9M8dXPi4mqnoVthSBVr6mMh6yxsTB9eu2KFnWnMpQ96SFw22x/85ylhmyrJtwElBLEk
         glFY9lTn2eOt3aX6vbibfLjuIoQeWHTSjOhx48cgFOBo2Tupckj0X+CIYlOEPNVt2bQM
         kS6+MAlQ7QTV70RXc6g949tQgo1koE5jShoCfAi1ZN5jOFTJMV/+2jISQq82rI5z8w2F
         LPcw==
X-Forwarded-Encrypted: i=1; AJvYcCWV/ftmMY1V3RPwq0BPIwqpTbUDcWW2fVnHZnlqWNmRG+y7klx2k69WZA2V2v2ngLXWUvSSzE9/6pBQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzF+NGCeJgoxp2BSjqoXOZC6Lfuda4s35OqvayRLqYn3kUN6rja
	Z+o8G4NcvPsM7tRmIqjXFiXo6HSXNAKJowV4SOsrdpolftoP9iplpVlRe68T1q3f3EnEB1oJg4i
	XQsNhD/TluGzZQw5jSL3x87xqUbgyzPyhr6tjPEjBetBW83+u5EJA08OvMaxJi8DT
X-Gm-Gg: ASbGncs9ckPVp35z+T+fyuTvuWiNk/KGL3DuAQcf98ZJbV6EUcG/Cae5//G2gLG2iC4
	JjRpXEtWmKHT+VD6T1DquMAsE6XveiuqUBPCeXthyr0CNsKWon8rrS7muaKpFufmRY9FWlMRX1C
	crNfZiM9dIJcneDEmp3F4zmnN2SAWSINPMwYnsDS6OKSl7e3BMgIfXZNgEQPMQ7HJ7nSmZJL3tj
	glJnKGX+YZDQLeOO+ZRYqHpz0ICtezuDu14sqZ1+eCI3o30GrlqThBhcVBL69aIl4NKjHPPFCkh
	77Vcwd3YcHJyU5foe+P1+8HrFSBuEcT7GHrduKYOruZe8GOAZUT5jEK+UlFs+PeXVgrwciBMQS+
	a4towl9HISNj8JlhExltIS2O7MA==
X-Received: by 2002:a17:90a:e710:b0:32e:ae12:9d32 with SMTP id 98e67ed59e1d1-3342a22beffmr419189a91.11.1758733286216;
        Wed, 24 Sep 2025 10:01:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAPpvCtd2d4vHGdIUOkRx6YtnUHb9m7wAZMK8a3e7Ta2Wt0f3XAL5MqaTZbYyUtxqvTDCxvA==
X-Received: by 2002:a17:90a:e710:b0:32e:ae12:9d32 with SMTP id 98e67ed59e1d1-3342a22beffmr419079a91.11.1758733285177;
        Wed, 24 Sep 2025 10:01:25 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda09a0sm2931299a91.9.2025.09.24.10.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:01:24 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 22:31:04 +0530
Subject: [PATCH v2 3/3] pinctrl: qcom: spmi-gpio: add support for {LV_VIN2,
 MV_VIN3}_CLK subtypes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-glymur-pinctrl-driver-v2-3-11bef014a778@oss.qualcomm.com>
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758733268; l=1502;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=CiPyfA3fDFL/yWTIk0JCWKj4mCCnWYx7OMCyiFzL4yM=;
 b=yJgfH64tWhhT/hfvUAVVym082LRueDGJbwARlk+JMQ/+MvtcmVuU3ceW9zhTTlBdRjWihOkjk
 Zkg/C8RHR2sBI20u8IGUaN2S8Wlxpsmcl9tgbhTfgYtEl17X30J6CgV
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: 1GbB6DfAwgbdTbsugDTiZgAbUSG-Pzc1
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d423e7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_LkKalIgBaL7gH2Y5XQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX7an+IsTDxkSZ
 6mqrYX4TTq8tpRJvlAlv5SwcV7n58f8TIbNGq8PLLBgvuIzG69WznP0GDXXBufbbaDarNa94m5n
 veBn+MJrQ1tUP0Iul61eA0ncKZwOq6Ff3GUd2Ie75Ixo7IlCSJtfA0L3/ZBo18NRxx326Ky7xUk
 j1xenjZT0gGkDFerngF566tEuanza2Rdb2v39e5gmaJ1bwyogczAdmY0h+evyJM6n23X7KiSVDm
 vShwQUpxo0sLtYelkUKZwEkOpNpZqGTkdKw5Id1e/8yRLvmyAAkJ8Iwm0vsPUCLnwT49jRSHmjm
 5hPj0Q0kgxh2zmGzt18qNgdPW4a42uS+ooGEYnr3YhUbbPzNot+9qNqF4Y607jbgkxqfaIdKe4n
 dMfQ3m5d
X-Proofpoint-ORIG-GUID: 1GbB6DfAwgbdTbsugDTiZgAbUSG-Pzc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

From: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>

Add support for SPMI PMIC GPIO subtypes GPIO_LV_VIN2_CLK and
GPIO_MV_VIN3_CLK.

Signed-off-by: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index c4f7d2d7a017684cd9c0d0850cb8d998668b543e..83f940fe30b26ae06373860616c54955c3b2253e 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -42,6 +42,8 @@
 #define PMIC_GPIO_SUBTYPE_GPIO_MV		0x11
 #define PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2		0x12
 #define PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3		0x13
+#define PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2_CLK	0x14
+#define PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3_CLK	0x15
 
 #define PMIC_MPP_REG_RT_STS			0x10
 #define PMIC_MPP_REG_RT_STS_VAL_MASK		0x1
@@ -852,11 +854,13 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
 		pad->lv_mv_type = true;
 		break;
 	case PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2:
+	case PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2_CLK:
 		pad->num_sources = 2;
 		pad->have_buffer = true;
 		pad->lv_mv_type = true;
 		break;
 	case PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3:
+	case PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3_CLK:
 		pad->num_sources = 3;
 		pad->have_buffer = true;
 		pad->lv_mv_type = true;

-- 
2.25.1


