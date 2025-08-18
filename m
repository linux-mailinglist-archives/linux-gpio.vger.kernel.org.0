Return-Path: <linux-gpio+bounces-24473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D08B29893
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 06:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07CBD1887BBD
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 04:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20866269B08;
	Mon, 18 Aug 2025 04:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neZ+gXwx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7756D2356A4
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 04:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755492104; cv=none; b=HuTSNuBSh9awOoE+A2n5oxEThl2dhNVSKD9RD/L0JqYzRGMBn3W/pcikSXGknS/JdFN6+Xs2AkByI12brUvMnh2WslSL81IX3qSpqOXlYa9FQGLQxH5AE8T/FPtqwfeMRsr4CNEK4IrnPmAdvcjldzYQwO/vXAUMTgDi0HJSMg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755492104; c=relaxed/simple;
	bh=GGuWQsaFj5N1Asx+oiUdrjXtCKQPDaS7TzmDRzr00Zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilHyOigv9ysS6+07j3BcnyldIyIZjxj8eZdBcp/v3lFzknHWCc7iapizBWXIS6uPquccSKY6BqwNg12tlYHAqB+k8EZiaUepS+9bBEwzMAwTeA3TJ9SbEM0p5VqIjpfaoGVKTYzy05gDuJBqcyoCjtSqNshl8ngY3c22Mn/s9F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neZ+gXwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HKOJxP030849
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 04:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0xnmUoPbLe3vT3NMmzy6zQdJ0mJHLlIGC1PWoFjBq8=; b=neZ+gXwxh7DYoV3Q
	RwltZb/MFrqFAdRbBoJhw1q+d3H+1qtZB06Hhg9owEftks5nyuSqwwBTc6K8ZRHB
	UUEgboC5ZjnJ507kGkmVx2XiAdPOFb5/1coFKYii/0nfWT3S9phecWXdshQB5yVb
	PHqKFFy48yWYBvUDHa9RfiM6gEZ4bOwabPQeJj+I8KruCAZgCAI3mmVrJy/5n1in
	AcRcurrw/5tAVtwjVQRVu9mO2ZFloWMlLxsc9svEK/TeG4ntUTXgDP/oNoz29IqJ
	UZJwFnIOvJ5ViXaRMz56/QdExvMzuKMK+XngfH6dC1/PxDbYMbBtcZP3TYjS/iZm
	fEVaCg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfu783-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 04:41:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445806dc88so95206305ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 17 Aug 2025 21:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755492102; x=1756096902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0xnmUoPbLe3vT3NMmzy6zQdJ0mJHLlIGC1PWoFjBq8=;
        b=u/tsLLvJmCuMZSqPQuzxHeGjALlbZciIY2cXFjfUwfHJNH05dB69m1UOl67H2iMyRs
         E5rJ8D5qGrkt+uKoeooGSURoIxR04d9kYCLfr8TFwQvydRHIqXW5hYcbgNWWqdoEnhdm
         1u7Mm5V/9vWMHA+iCd+k7cUHTHnqCgiiIYGqutDhSh/JrzIPuzvTukJtWftMrRHv4WyH
         eyF5plr7JmiwTnU11uMt0y39ivL6gdi7ceeAdJX/+wZGJ9DyUywRANor487DZ62w5G2B
         8oMiKPqZAgs7+8QSisfFNhQkQz+jat8/kxGMli/PVyJwMUqVu3sR7ZiBiBHO7cQ/RILC
         6sGA==
X-Gm-Message-State: AOJu0YxzCfvyDKBlG8/kv3mGr2cUnpIbiuLD85sQElGatWuUSlT8A9pT
	Q+uC6GpNk81ve6Rn/zx/vAs2XtGKGcQwvk2f6DouPaqs95IiJlCZcQ+abN7Mqj0xQbmp7NAd+Yl
	c5Ue7wwCNL2Q7+KEdnoARbKAtu83S8PDFn2FoV7DCHSJDpC4V57ECuPQI2tWTp5JbNlAw6qhv
X-Gm-Gg: ASbGncu/muVXMfK6Zq61PAqNUra6TNQDUWW6CaNAyTVnbJIvTWS52n4EAIybyH4ED01
	nRqVyPQc6eyxTyuVndOHfpMmVQ1hs1TvCnDgmoXc596OCrVVKHELhwgm4mwACGAaBp1T5kRUFSc
	/rXbuofzmCKFwNfWQVOVD8k4o7sJlAoDgDgH2CmYaoCfifCtECEvhOCrFkLI4UCZBV+0/ZZwoNW
	yd2UlTEPst+/6cHN3CIgSYZXBqeiJlX6Cb+ICsTjtO4/stn7z4YyiPdPgzag3p6uGe6riI1a1kE
	4P86ucqsx1eELS/9cAjR3zgL8MoMnVYmM/CVVRT1aDNPOMF5qsQdWDKDmUEPYHYI0NekQepPc9M
	rkujq2IgA6Yp8y/UEpWGHhRQ6OZLJEm48/7dOMRNUvvCNe2x5JGC9bUEQ
X-Received: by 2002:a17:902:da8d:b0:240:719c:65a7 with SMTP id d9443c01a7336-2446d6d32e0mr159087535ad.4.1755492101661;
        Sun, 17 Aug 2025 21:41:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2thLy29PrxJ70+GSafoj0wED9GTya2I7AqB3dNKWfIa9uz5OFViAwXFdIZoBJWmxi0q7J8g==
X-Received: by 2002:a17:902:da8d:b0:240:719c:65a7 with SMTP id d9443c01a7336-2446d6d32e0mr159087315ad.4.1755492101276;
        Sun, 17 Aug 2025 21:41:41 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53ba5fsm67547155ad.113.2025.08.17.21.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:41:40 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:41:23 +0800
Subject: [PATCH 1/2] pinctrl: sx150x: Make the driver tristate
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-modularize-sx150x-gpio-expander-v1-1-c2a027200fed@oss.qualcomm.com>
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
In-Reply-To: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755492094; l=1605;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=GGuWQsaFj5N1Asx+oiUdrjXtCKQPDaS7TzmDRzr00Zs=;
 b=tZXVod/q1p8wOuV7N1MK2nF9TrizbNNHavYakcjr8j4B/K2tK9z69Df6o3cEVnvu+upE1qyfH
 qFNvcdEP8QBDEW8+HicRx+0yB7Asdqfme9BgIIM/a8FZQg8jTsMVlbJ
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-GUID: Vhq8Ue2fdnX4I99-9OMh0_ixIm5foeln
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a2af06 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jVJqA2H4-3kyb8ebEaEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfXwSwlmqb45U4m
 24aXCse6iBwYlshCZzDX+g4Eirtm4W7+LfxgwR4xOVRdMjn4cUf8nozuR48u7Bfz5EI0+XKJDrb
 vJ4K8lO+eDkSxYfZay9F1dlKQ/gLYZJgkID8/xbJMuQaedLZyMNq4OUVdm9BAJ6a/Y0Ujnj1yVj
 VeS+0aXIOST98gseVhPs3i9vun+Do1awY6Fn+zifHd0rWzq06zGJ+ixv/DZ8QLXz4zwA44yxmM5
 U6KERDDA40HR5eiJOlViZ8SZbksvo27lDPJN+Kg+YcikLeqXFvT53rO41sR/dYKQ88VwGoGRPLT
 ZgBPliptZ451hKk09f+s6QJ/nVDfd/u9IcCqDJCh6zM4IvRu6/FJ1UoxKEEolNhC5NAMY+YUU1t
 hx2rtk6s
X-Proofpoint-ORIG-GUID: Vhq8Ue2fdnX4I99-9OMh0_ixIm5foeln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1011 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

Set PINCTRL_SX150X config option as a tristate and add
MODULE_DEVICE_TABLE()/MODULE_LICENSE() to export appropriate information.

Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
 drivers/pinctrl/Kconfig          | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index ddd11668457ceded9861438768f89945f2307e31..3d06f02a3da549317a9364540d1b598051b926f4 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -550,7 +550,7 @@ config PINCTRL_STMFX
 	  interrupt-controller.
 
 config PINCTRL_SX150X
-	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
+	tristate "Semtech SX150x I2C GPIO expander pinctrl driver"
 	depends on I2C=y
 	select PINMUX
 	select PINCONF
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 53cf8168b274c5310706512dcd3ba8d4d25f5049..b613568b42b73d1c1b220b641e292055e23f4de2 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -863,6 +863,7 @@ static const struct of_device_id sx150x_of_match[] = {
 	{ .compatible = "semtech,sx1509q", .data = &sx1509q_device_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, sx150x_of_match);
 
 static int sx150x_reset(struct sx150x_pinctrl *pctl)
 {
@@ -1266,3 +1267,6 @@ static int __init sx150x_init(void)
 	return i2c_add_driver(&sx150x_driver);
 }
 subsys_initcall(sx150x_init);
+
+MODULE_DESCRIPTION("Semtech SX150x I2C GPIO expander pinctrl driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


