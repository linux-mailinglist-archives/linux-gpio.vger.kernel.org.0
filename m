Return-Path: <linux-gpio+bounces-26555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80270B9AF41
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 19:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 005B51BC01EA
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 17:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA9E3164C8;
	Wed, 24 Sep 2025 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EE/TDLoU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D25316189
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 17:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733286; cv=none; b=TSlgjg040v12YEyhi9G+5PEPRhhvPiwB9vE1MgYImS109sAph4SY2TdFvUYNDnZIqCuIb8/DRr9TZr6aLpttlwIl/zc67SQEy6uX0kw8INmSiq6BXwL3shmnxSqUpOufVUUejqepSdwvuoUmECmAD+Qnn2QJMrq4zr9AbW9NJWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733286; c=relaxed/simple;
	bh=R9LLcQCUiDMiN4HDFZueMIWI3JFHTF0opHifX3sulLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kxoHikCn3EKBdBi3DYuuIbM+6fJykDP7mpO3nEwXRdUFtf0fPIEe5KVfMAPpWF40f1J2HJM8Q1y7R3CA578U31/RTFruiteBPOI9KJmzAFKQX//r8kc0G4Za9ZaljNuXXs2NHzUCSvljFcJav6OJf+cUrpE79CruvjO6B161LLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EE/TDLoU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODFQ4M024258
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 17:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lg2dZN4a504FxnnfleNPhZdOEAS9VuA8ArU7WHTtyuQ=; b=EE/TDLoU6tEAsBw9
	Bj0dN/zSjgJ6i2EKSbWHoSOK7gH2qnkcMA+GhHfwORpNkU5UP+5BUNCGvZLoLpR/
	3t3q2GIZdfBMINdLOVAKJE7ubMDNtGWDmbS1FQP4lGWBLlqCNYs7Gtzzhs5nxWXP
	DCGs+CNscV8/wGWGc9Uw82lfOFNNHtOQ1p5gwAX2mqPFbomcmwSfmCEJXAD+T0zD
	j2+9qNF4Mf5/GEKf/423KUYuQaIpD563GI2wVahPxsmTjZTSuNF42TlvwCDBtYnZ
	PeNU00QzJoj87mniFAcgWx5ld4EUbLxdWNFhgshEFdIgaVDSUJQIFfoiLZWk8lMn
	QrNQCA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0c4xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 17:01:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-332560b7171so948191a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 10:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733282; x=1759338082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lg2dZN4a504FxnnfleNPhZdOEAS9VuA8ArU7WHTtyuQ=;
        b=pswN9SL7CIlVorqjMFDFj2sOm1REdixlKQ7BZ11oTtm2pgBTtXKG57NRHxku0xn1y2
         Kx4lEIIV/i4bAxvuwxNcQ24SlmPNSTnuTvLMNuZyX6DcEVmXubl+CnNAzEgxFSFUL9Fr
         nzp8Rr047a1jJ9C6gA9qF0OUDt0cBoZaE1IEymnRGDQprXjclztjr/Bu+GKU2XaUPQvH
         81MKj6xCj7eFa2ZuBTG42WpoJLxu8vgGg9xzwml1CLRuo+FhtXgT7AHLdae5g5njPo1C
         2jTrKULm8B5RnR3+rL+M2LAirkNNly+6UGI1/yb7RlY+DIu6Iy7RuTjEGllG0WdD9OIo
         zN3w==
X-Forwarded-Encrypted: i=1; AJvYcCVjdej7AhiViayM9HB/Fte1/U+zGvoOf+Pt+FWf/yYohXDq473ROjpP2XJBJxIEpn9tzWXnOh7MJfPJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzJTjo8sboVqMwWNxSXRlEKqqkG21lgZv65SfCPGUB5lVL0dMWk
	EJy/jCPxjFTwnbsdC1cBKLPUNj1AW418ISLmvpHgA1WsdXARJ5el5blwQ3d+jrmVhL/zAv+Fmw8
	CG2y72YWRxaY0144hgAF9YJQoiW553jI7MYBwIfVSwZFMfKwNW3EQr/jwGQE6Ob6H
X-Gm-Gg: ASbGncs2TMhUIfPwuJ0kjMktDA+HoWReJu9gXOd1iWg57cwyocbudmRS6N/g3hQvEJ6
	FpVGRif+fWg3tCE63xf2ASidx/4EmikoQ8nzCqCZXU2x5lWrTZONsQfP83vZQrOgaNp31qv/iG0
	oKYQlyqmpji2R3nlU99KXLG+9+UeDEbHTfB41/dS/d+k8MfkeD/yV2InMkb3hi6KQxhKin+8nGK
	AmsUPzZtmxWYygWXb6bodYe1cGZUh3kOUxX/tmQFOOK/TbDvdERkFVBwFCsDCd5oV3DVIDGMquD
	yhiz83qOCGnZm70XEfTvchmT1qDjSpuKL23NPnCpT5sQ2tT/A8x5TsGCT16fTm24mE8WEbfLSH8
	zt9NMK8q8/t4tOJGSEg+G3FbngA==
X-Received: by 2002:a17:90b:4a84:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-3342a4d0db0mr297889a91.13.1758733282063;
        Wed, 24 Sep 2025 10:01:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPcCFQIzAFDaXA6tXUInXliYPBp5RVngmJAQtTbozcooVbDTf1yHbtOc7dVqEBx4DPVF6h8w==
X-Received: by 2002:a17:90b:4a84:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-3342a4d0db0mr297784a91.13.1758733281307;
        Wed, 24 Sep 2025 10:01:21 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda09a0sm2931299a91.9.2025.09.24.10.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:01:20 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 22:31:03 +0530
Subject: [PATCH v2 2/3] pinctrl: qcom: spmi-gpio: Add PMCX0102, PMK8850 &
 PMH01XX PMICs support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-glymur-pinctrl-driver-v2-2-11bef014a778@oss.qualcomm.com>
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
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758733268; l=2001;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=OMxkfnXwCtLZpUJ7o9Qn3c4tuFeCwxOJk11xghTOPb8=;
 b=5T3cUPY7AEfS26a/5MEpzcgYqpdhV+qlmvzQcf/anRnyQG4qyG+XY9RNotMqjxaY0qiQq69si
 0sxfs6dflStABZWKQLWxzoRsbTUd4DlvTAFEdDIp0+6rGs0yyHXWfMm
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d423e3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Z8Dd91y0tYXrxlmI1QkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 6QweKTmatqbQLjBunZ6OoILahMK7qS5V
X-Proofpoint-ORIG-GUID: 6QweKTmatqbQLjBunZ6OoILahMK7qS5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX/vixtZNL2UnP
 Y+44I1jRLSVZ+/6i5dVkqpRPjm1LTw8yJcMJb26f3XoBKtxhcN3bZe5F2+HcgL4pwsU+8eKsEsO
 /s5ijNzeDxvfrQDJtA4b5OnxfCtcFt1rPVpaDT4KdHJregzPT9iBxJKL25WBJA0eqiThMPi9WPb
 +ty+hGiYIHT/09TuU5eNA1GLatq6tUMfAb5C3FhyUjttWdkkcTjGFsT6JP+qO2wz0Oa/xZzv4vP
 p5ATEeMRatF1wjhWQ0wiph4RaSR34Y5X7UD/9u/qKbU2BknNlwobA/jk7ortwAFLMq5UdiQNfmw
 izfpCvdVhp7GU9pfbq6RsA1SZPa0wpKsKJZ2wwBxWkZnn+zsJU8/OBQcy7OMZCqqLai3sgCUcAh
 UP5Yn6Bs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

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


