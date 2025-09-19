Return-Path: <linux-gpio+bounces-26412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2CB8B2A2
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 22:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3CD117C79F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 20:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E376D2D249F;
	Fri, 19 Sep 2025 20:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S67EvqpJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D662D2383
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 20:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758312059; cv=none; b=Cydu363ZXnM4RymU88nQsl451N/p3d/SFFp41elI3RJXazpJrd6y/MiYM+VbuI/okr5Z6lD3D9vQ5ceFhhoA+akpB4V4p/bzFCuuO1Cbqj2TIgahw1GWnMWvT+IW+pXYs00t+Gw09EZ5uCpV/gQB72L2GxS9kS/eaT1/GvLuD+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758312059; c=relaxed/simple;
	bh=R9LLcQCUiDMiN4HDFZueMIWI3JFHTF0opHifX3sulLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mRV/vthRDDQWF1Bw2zyqD/Mk3ct7hPm3KFWYgAgO2y1W6zhHTg5pipBWohEHpZkFI/RZyvoNzTa6Zq1Iyh7p2CgvqKw7Pnb+q/OuPqbF2Jmpp8bx9k4OVDGYmye7e0taKLnn7ihTbBX6W/3mAG4gTBLj4jWV0uJnKRTpdDU771M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S67EvqpJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JHV8Dk013449
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 20:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lg2dZN4a504FxnnfleNPhZdOEAS9VuA8ArU7WHTtyuQ=; b=S67EvqpJv4RgBtBI
	LkqRzNe2Uhl0+ITAvZZTiykrwc2vF+8Gp15tBAdDYgFBNojEJCEy67dzi//mSFdW
	gd0dUuiA08unkF0BcRG+k2580Mw/3gZwhD34GTHQZzb+kecJJp2gyVKWtzil0j0H
	iAdzn88obYQ1+dBsVghjDeuLz9JHcXXIO4Mz/dscOhC+DbmYBKUD3GUhU5pxImf0
	f5wOk68geI5X642vFfhPWcor5FCvC68ij0llOXsvEmIZenGCy6o7z2JrHVVDhSWX
	X0qdo1LVzHrgoyxftyMLsSDh91DoXc2YOqF3LAjRoApRnriBp8d/f/iPn+4Xf3Rf
	hL4/hg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499bmy0dt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 20:00:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458345f5dso32405765ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 13:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758312055; x=1758916855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lg2dZN4a504FxnnfleNPhZdOEAS9VuA8ArU7WHTtyuQ=;
        b=ezmIRk+64SiNv2cRou+sH+UszUYWMLP0kbCA5PrlPt/um5zOI/emitTIpJq624mAnb
         d47xIglbXJmCwRAC6enqST6VuhnnWdq/72x8e8SS7Nx+na89nZI30Iekg3jBGhnvp71V
         I4X078QmUHrAzXcWJYyb/0CL40+OSSm4fM3lOsRPVJ+dqu/pGu6QMahWJwfg+k12RuKm
         9aSrZK6I9j+7DPa654TbP0qe85qTKj+HQad6nj4vMkbNezKQch2qEw7BwAbqsYSyHFGu
         OMJrcGWqYsd2u3K0tb0mOlGFUDEzTS9VN9ClTfYZVzQGqpB7gXCSYWtkWlihgqzocmiJ
         MYZw==
X-Forwarded-Encrypted: i=1; AJvYcCUeO+0ZH8GRFrwimQQ4eRb6A87PsT3h1EkmJrivIbYdp8RidSibPTEWfi6gnonDyJH16Hs5lcTqMFZW@vger.kernel.org
X-Gm-Message-State: AOJu0YwqO80yQ9iRG/etsWDK7tZuXvuwfSel0m8LuMe+24jGXu34smIB
	LLiDHJa34LdiRfCXIle7EfVNCyOIcWXGyIt4w3TZEyIjDXIpASX83xyT0cNmKL7w1nv0IJueJVR
	W3gkPuABcSUkTDA9V+Lfs4IpqLNIZ1FhlCKW44HVtiBQNHl0mmvKm0n7mFiAPwS5/A1NRGkbt
X-Gm-Gg: ASbGncuLf18MOlF0OgFEtBrkcMS3/X1wSaC26X5/cXs1hI1AfoLbNHVQHTG5z8ZCqg+
	+X521rzfYdhqTbLsHuJKi4mkD/SOwo80Rq9+h23ZgBX/Ng1f/pPa9d1IpuOa5ByIl91uPeOl1zA
	aoldKEdNXy2hRUfSvu8qG6DrBIZjlwiJLBdM5Q03NpsGZTYCU6eJo5Yg6GXfJVy1k52l0xAwWdv
	qPOgsd1SC/B2WuL8ZLkq1cjGbn9Ieznxrxa5OwjziMFS0PnqlGpQQ1a3qxBBXhsig8wJTcLjSX8
	DAcMHXue6QoJeliXmifWQJtQyDHOBqgv7BKgl2ezQ8ZssuxVTVHA5ie1wQr8vj3TN3jQ+TCNCW8
	yC7HLQ5AYGAB7RFi3K9hV6YTcPA==
X-Received: by 2002:a17:902:cf4c:b0:267:776b:a315 with SMTP id d9443c01a7336-269ba508205mr60032325ad.32.1758312054936;
        Fri, 19 Sep 2025 13:00:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuTYvwq/wPby7Y4y7/K1/uv+U5nL9KZApekuONtplC0mHHJqgvJLkkDt+f1r0fIExybCz06Q==
X-Received: by 2002:a17:902:cf4c:b0:267:776b:a315 with SMTP id d9443c01a7336-269ba508205mr60031965ad.32.1758312054315;
        Fri, 19 Sep 2025 13:00:54 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698030ee20sm63053905ad.109.2025.09.19.13.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 13:00:53 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Sat, 20 Sep 2025 01:30:10 +0530
Subject: [PATCH 2/3] pinctrl: qcom: spmi-gpio: Add PMCX0102, PMK8850 &
 PMH01XX PMICs support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-glymur-spmi-v8-gpio-driver-v1-2-23df93b7818a@oss.qualcomm.com>
References: <20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com>
In-Reply-To: <20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758312044; l=2001;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=OMxkfnXwCtLZpUJ7o9Qn3c4tuFeCwxOJk11xghTOPb8=;
 b=t5iqFc6Jh8HL4OMjWMtXMVuq/3N2fVxA0RWwTjR4RjPpgcsghZWEWvsPpf4ka015GUSWvcOUf
 1E7ypyEqA6jAaxG5Mo6dDm1usLODpDG+S500ssgxCwxLcd9smZH4zSD
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: y_s-xDwUBF__auddcbWquxNWJJeOkfdF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDE2NCBTYWx0ZWRfX/8aX1GLJyCTn
 L9zYymCXuqVPuO9SOl2JIXVxb0e9mbeSELrQlphix+wtTFDSrDTjoFTq/lnF0koFW+kSLK7ocss
 eEsVlgtDBwFbY6hrFhX6+GDy+zG6NfONbdpWYkk/r0Qcm623dgXcBEgkfuwG8kIKwswej48OwIs
 yQUupQoL+Oxb2JyvJGt3+3YgoXhADVF9VS+rzM47m4L9kITd3aPH6MgJ/SyF8V6g3DYsQ5jC6WD
 Vffx7d9i6H7frpy7a0vgACN9Kr0mk1xVwa1gEd7Jg4tXirE7VZ7MwJC7do6yBqw+F+SviGzaQHc
 BKAma7LJ/UaRJCK+S+gyAPgtWNu69aIpetVCkEUWykDIWafmNlwqtCGCalVDL5OQKWOn15X2pyY
 d7MWDqiX
X-Proofpoint-ORIG-GUID: y_s-xDwUBF__auddcbWquxNWJJeOkfdF
X-Authority-Analysis: v=2.4 cv=ftncZE4f c=1 sm=1 tr=0 ts=68cdb679 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Z8Dd91y0tYXrxlmI1QkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 clxscore=1011 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509190164

From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>

Add support for PMCX0102, PMH0101, PMH0104, PMH0110 and PMK8850 PMIC
GPIOs with adding appropriate compatible strings.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 485b68cc93f8edac07c15aad50ff5c9c7894d8bc..c4f7d2d7a017684cd9c0d0850cb8d998668b543e 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1239,7 +1239,11 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
 	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
 	{ .compatible = "qcom,pmc8380-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pmcx0102-gpio", .data = (void *)14 },
 	{ .compatible = "qcom,pmd8028-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pmh0101-gpio", .data = (void *)18 },
+	{ .compatible = "qcom,pmh0104-gpio", .data = (void *)8 },
+	{ .compatible = "qcom,pmh0110-gpio", .data = (void *)14 },
 	{ .compatible = "qcom,pmi632-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pmi8950-gpio", .data = (void *) 2 },
 	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
@@ -1248,6 +1252,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmiv0104-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
+	{ .compatible = "qcom,pmk8850-gpio", .data = (void *)8 },
 	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmm8654au-gpio", .data = (void *) 12 },
 	/* pmp8074 has 12 GPIOs with holes on 1 and 12 */

-- 
2.25.1


