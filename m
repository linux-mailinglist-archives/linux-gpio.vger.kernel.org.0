Return-Path: <linux-gpio+bounces-26413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9451FB8B2AC
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 22:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B44B1BC87A1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 20:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95742C08A2;
	Fri, 19 Sep 2025 20:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VaJ8arMt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136F52D29D5
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 20:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758312062; cv=none; b=e5Rz0E+nEoyfS68Jz5wnrm+7AL29MMdD/7qpqMD1NEAftUeHUKsjfEgWrn5QJ0MmGdyDwwb7+4RTHnMhR/WojQk24tfkrvV+fdYvDuR1umGp+hLj6Az1/MfGP1L67hrkvcp6IOAGjHQ4IqkucDPFDZ0gDtFfVkdxBiM88yfM1Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758312062; c=relaxed/simple;
	bh=/aCT6AMn+DEBAszM+FafwAQnaRRZOfmB16zLDUBpxGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOvYPzxhx+DDMNfLWm7N8wayhRrwBfw1a8gULJO/0BigTk5jrUkqjDcddjUG72ymTFLEquBRJiGQGP2/wLVzFjkZEpY0iBZAsAwZbJHJbRySO27TVJro9STl+Rj4KA3sHA005eVEt74nEtYSpUEk9+LXtTnFdwVXT7SnB9o7Iqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VaJ8arMt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JHV30k012796
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 20:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K94gZNJCyxLLjXcq/8C3d4M0HAtuU0U9u9rzRHmSpBg=; b=VaJ8arMt0sXK/vvc
	WuySYrcuoPxGJJCb1R1P0X1NmCc3yuBq49+DLeO0euViY2TQBRYRQw7k850Xy2i3
	rOFs13rCv/2ZagvX0IgUtUgieuotIPAibSqEF+F9KFTNt4BPjLwK59da5mDtH5iU
	8sMcAG0A6WrXS+wOJm+3WpRJ3Ehwot2dT7euNYxUXlBsTjkSzxuK+BV8MfbvXTjb
	uOr6QZ3+NPOVP5KiKw93SYHUy7BQPAWxW9SDFyozD9+SLWJt4Jz41XXPbSpqXWT6
	RLz3wv56yjSD9k8QnuY0mjlt9beP99935OBs0YlYHGlzNAfjMQCUux0JjX9xZGsR
	x6j1FQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499bmy0dtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 20:00:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b551338c2c9so1426581a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 13:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758312058; x=1758916858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K94gZNJCyxLLjXcq/8C3d4M0HAtuU0U9u9rzRHmSpBg=;
        b=EJbld1FnM64ysQ+weBsivhBpQ9ZChFvz+LzPI2BuYqNvPiIbHLiUPlln9VLhl0MJZ7
         tEeVWJymZS1l15IP8cE1EEvZKRneqkks0TWr0Fz6beGzETolLoDUqlYElw0FneKA+40P
         vOSKBsO1dK9MBJuVdg1pXijF3/uxoCEaozQH+Fkdy58O6Z2EWlHSzAEZCc+izvxLUsGb
         ZJbJMWqb5zpIeXq3NVnboSNcbl1qgna9vapI6y/BD4tvnD8bmEvARDD3NbOFlCyQ8xTE
         nUfeJ0PPyl+x/y2oopiiegv8Ej1pT2OrI+d6BFA0UEuppaPOGvqpP4eYGHrKNTpI0hWE
         WOVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNmNjX3qCZo09AfMumKEvIGZaOnSqKMZwBkWOisSIWU7nEeKWYTcThPxXeE58fE0NO/PFTxE7ENdLI@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQCNeAMIXxKD3/mtXsmugFTcHa5ua1qhoCiZ6c0PsnTuTrmHH
	c+4qITibsRKpfs2taZlGASaHyXKEd33SFRH/OPtLFunI5N/KrLVWHkjHhFG7BxARi7HLyLrbNA/
	77qnK5yi3vGeanwLyxnejS20x057aSpwpUpXw4w7HNK3FiqrfEcm8ETEY9iqk4J1vMrEpDIzU
X-Gm-Gg: ASbGncuPcamBWKQLN+iOUd/IYH7eR1RLj5gh51w3TkBpLrMlfWa51qXsh+lafZZ28bo
	qWEIVVs/G7xSwKk3q/8W+Ai6dURiYf1QtUMfUjo8darg+vwBDyQggrjzk7XEfrx6+/fxKpNy4bZ
	7EVlUmAK7gjxIyQONeVIQaBg1sEgbtpvpGcG+F/BHzfE4j72QIO9UwB6mIdbnlYO95np193J/kO
	yrmfrtfbm3P9hfYozsrOtCmzLLRlfXt/TfplRrO2lFdUmZaTrpmGjXRwzkRnXdMlx1ldAtemUok
	ONQiSXh7r3ZuSLJcz8Pv66zjsJOnIMBvwy5jM6gk0ICJX07819gbpJsuOUSXITqOL9LJCQtf3qT
	86pubUBn3Z+dFok0M6OilYOVQYQ==
X-Received: by 2002:a17:903:2ace:b0:26c:bcb5:1573 with SMTP id d9443c01a7336-26cbcb51803mr27453825ad.53.1758312057966;
        Fri, 19 Sep 2025 13:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqRMuKYms0JN+AnMSRPMr6bwLIE6pahTEbvacteRwGgkGEd+6lWHLIQ8iRIIeo2zWClmYa9Q==
X-Received: by 2002:a17:903:2ace:b0:26c:bcb5:1573 with SMTP id d9443c01a7336-26cbcb51803mr27453585ad.53.1758312057420;
        Fri, 19 Sep 2025 13:00:57 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698030ee20sm63053905ad.109.2025.09.19.13.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 13:00:57 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Sat, 20 Sep 2025 01:30:11 +0530
Subject: [PATCH 3/3] pinctrl: qcom: spmi-gpio: add support for {LV_VIN2,
 MV_VIN3}_CLK subtypes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-glymur-spmi-v8-gpio-driver-v1-3-23df93b7818a@oss.qualcomm.com>
References: <20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com>
In-Reply-To: <20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758312044; l=1502;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=CiPyfA3fDFL/yWTIk0JCWKj4mCCnWYx7OMCyiFzL4yM=;
 b=vo+kuP/Xa2OvNsoMoxwqxQFsPysvdPfhVd51JJgJuNtTZukkJyMaY/f1cuqegwm6AyIdjsir8
 UXFGdIxN1wQB/CjSgADfVbjao/uan0KuM/qJ2gFdrRmCMofjXkol4xT
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: ZGYGOR1vdrjEaZdT57olceYKcI-pXWN6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDE2NCBTYWx0ZWRfXwq+JsZSzHxaU
 dXQX5GR/5VmnXlWpK8qzHRdhw7oDdctzPv63RvUPAWdGBMkNjq5CZLnjXbwKf8wKhm7zNierToJ
 vzZUSpSbBOpzZlAvTQsqVRxwxnW1ljN+W5SULLWNZFVvDyPIG8fXU9pmmM/HhJ72khzeNQSJeG/
 SbIA3q0O4wDo43HCaNr+WkgV2HucNX6ahi6YW2jExRpdMNc7DAouEuXee/IMbLUxGrwMexXDSkq
 uzrQ1hq2bqo2WvED6MFd+j98E7+/muEZ5grg99Yt3ti9OjIeGfUcDCmpsOvy2OWT9CMO01FtBrN
 C7SzlTMbNdjugYJRb50K59utHstzCftS6HaXnoofRaUqCQk2Nh7fnh1M/tr3h3KjnzP5SkhGa/n
 ZQtfftbi
X-Proofpoint-ORIG-GUID: ZGYGOR1vdrjEaZdT57olceYKcI-pXWN6
X-Authority-Analysis: v=2.4 cv=ftncZE4f c=1 sm=1 tr=0 ts=68cdb67b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_LkKalIgBaL7gH2Y5XQA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 clxscore=1011 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509190164

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


