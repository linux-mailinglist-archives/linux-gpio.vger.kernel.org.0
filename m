Return-Path: <linux-gpio+bounces-19571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFE6AA7E97
	for <lists+linux-gpio@lfdr.de>; Sat,  3 May 2025 07:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9E997B661D
	for <lists+linux-gpio@lfdr.de>; Sat,  3 May 2025 05:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8389E1A7AF7;
	Sat,  3 May 2025 05:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6SH1/P5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE301A4F0A
	for <linux-gpio@vger.kernel.org>; Sat,  3 May 2025 05:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250341; cv=none; b=KO2TLIfIDO3nBbUWihJ3RDm/D4EpKcc6O14TsO0ETgeESwvL+jdOtEzsy8XBkkWGZfVxBAArxyGL7fRvMNCZSKo5M/BxDIp9udv9dIbXy6CONJ/94i+oo9iLh43xzi/SlnO40D96ojnnuwFJAF3E2CGgFrUGhlN1FKKUeW8oHv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250341; c=relaxed/simple;
	bh=lxvekQGPDsOMYef1m807SVoHXf2uXvzLwYRmS9A6iAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6xOUxQiY+SRGDZ/qLug9wrqmqtfMA7TuJryDJ8jQFXdvmCWZcRxZWS0MiiFJDfvu+h8ClhZfUIfpFId+5SbwCj6Bopen5lozFwrS6ww3ANZiU+0biADAonhheqnZICybquSKORUWhx7j5jHyWOZ8fvZbhPLqBcfVTmXbeeWMUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6SH1/P5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434BinH006570
	for <linux-gpio@vger.kernel.org>; Sat, 3 May 2025 05:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YLxjbqM9PSW7oEolDee1xiNk/Q1KHNR7QJsWA/AIg1k=; b=C6SH1/P5jRelggFM
	jH5mBWY0G8kLiH4Lnx2X8AD7OopyfOO5PolWhygJAYzaxUH4DX7p0iacv0e0wwnb
	0xWmdgaOqPgPxDFkNKJJBZl4vzt2sF1LFm2E+S56gPxKDxeRChoszrd6XfaKxJO+
	3uWqj5AAuJjp8E4arHEmne45TwLI8PMGxUk8L3cHb1vNS/m7kaOshak5zt5GUccR
	uVrpkchKgPu4bSBQhk4ZeRfQJZ7dP0FhaBMyyD63HG6PQTDAuqkHLXiWO96wbZKD
	NUNtKh77wmUPLQegxX8H9uti1zyvyXfIHDCm1rXNy07JQ7i5hJmjpQF1jbxp5Sge
	fW96sA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfg2pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 03 May 2025 05:32:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476a44cec4cso48341061cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 22:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250336; x=1746855136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLxjbqM9PSW7oEolDee1xiNk/Q1KHNR7QJsWA/AIg1k=;
        b=jgcuzskkBHoi2iWsqNTaXHN7J2EqIlGorxpXFe1zh0Pp4M6N2uCFzPuWg832ovYdtI
         DQ4XgE52Ct9fnHI03ldgjG6uLFBzDe2Hr4bblTyy2OpCbSmijoSfswFKCITaAWFKwzpa
         tevWmTG1+XxUJZcV0muplK65ccv8MBnwoGz2DhvRHAl5w2eu9uQl1pOC2m14NwEXOIOJ
         KOsfHorkWxDBrwOd1jnYRwdgssZnmhRXX7cqE8zzF01B8Jt6RPOoq5MIKFviysQyL8En
         DwWFhdgxwFj0P0mclkBGhhTaDev8S/SwSuxI/4vwPx8M0OBcKODeiAFVrDNWK9/Ea6mk
         u86w==
X-Forwarded-Encrypted: i=1; AJvYcCVBwGG5WvgYIep1BALbr3L9v7JInSA+gYwcc9MP+/LSSlDP8w2d/FFhDzx5xvq3xX3hIfoXmwg1b9gQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4n7zqB9QwJ9WWICSrr8jR1oI1PuFBkg0F4ybGFmDj5v/tfjV1
	gQFI9Tjp3/t6dPfMlUqIy4Dmi9R8merRMv8mjx0Z6JgDNSavL091f2LNOQuP4P21lxmDCB4iX/i
	kwo4nFo1fd2qFnbKp9GXYnTKU0mpEABUcos2LNcMtpoaqNkxUYkJ5W1jhXDSj
X-Gm-Gg: ASbGncspxMeOSRqdfCcikYdj8TCTxBb1k/09czOWpv867Xoj1OCYLgBRYlHtWcE7oVr
	A/C5jm3ovol2qdvsAYL5/F9z0ugZ2MoT/IXYCPlO+hWlA4SEfGFLQPxpBF3sbVHY/aczjPqV/n7
	IPiBqW8Q2BEyT4OGjXoGsqtXEpliNFsRzm0RQZ3QcjP2c8OEMdDdKLZKWwhTJSiL5mH40OLPkK6
	hDuQS+F+0ll/gpTa04NKs8+aD5tUKcePLoPBIfvv+O6wrDXV7oUQ2fSmfwZrs8njlvVXmr7/31P
	aEjx8f+366w/rRnWOiL0TmX+04JGSZ8rlJCanmhP+RE7o6gYhY/cA7b9Dm4XF75eNje8wvpNvGJ
	bSyFhALxRAT+oLrxC6SVuTaD4
X-Received: by 2002:ac8:5756:0:b0:48c:4512:568a with SMTP id d75a77b69052e-48d5b96cbdcmr24116481cf.2.1746250336696;
        Fri, 02 May 2025 22:32:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTs25BvVtFCFuCcyCdpmXaV7jb4YgOclzlqSXZmWEcq9CovXVDxtZt7lIGjGZ2T9NIbNewhA==
X-Received: by 2002:ac8:5756:0:b0:48c:4512:568a with SMTP id d75a77b69052e-48d5b96cbdcmr24116391cf.2.1746250336393;
        Fri, 02 May 2025 22:32:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017cc0sm6165841fa.39.2025.05.02.22.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:32:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 08:32:08 +0300
Subject: [PATCH 3/4] pinctrl: qcom: switch to devm_gpiochip_add_data()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com>
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lxvekQGPDsOMYef1m807SVoHXf2uXvzLwYRmS9A6iAA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFapXZb6OKq+z//iyeZr/AmTBOABud1Az5/Ibx
 XbLDa4Nh5+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBWqVwAKCRCLPIo+Aiko
 1dW1B/4/H8EvUOxYkySSbIaOqwGKUP8s76idmHDQ+SXplOVQ5t8vJ85UvryWnDddYDriqHjv6Mp
 yFR/5yRd/c/laBCtZRrm3wZY84JHjQr/iREwEHFng8Vb+vLE08XKQQRS7GalFCYxsa7qxuEWIpm
 qPaoSJqiVKfyfujGC8MEJCKtPikx05xkdp1SY4U2xRSH2WZWecGv1Sxb57PXy4ZUzvHJlPMmZ9s
 Ay1YA+qeDcIZ+2Bex0/JVyNCieEGnHceafd/nbTSJ+6IO2LG0Z+y/K58cUjaY1/6tZ29pm3GZ5+
 JwWH23qlxchhnAXcg5U1wtBN0LvTNdQ8G9nF0hsh71zVT2GE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: XC85lsl4VGPOxzcSjKp2n9WVVIBpXfT-
X-Proofpoint-GUID: XC85lsl4VGPOxzcSjKp2n9WVVIBpXfT-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NCBTYWx0ZWRfXzcfl1U/RoSuA
 N44+07ZtOiaam4P/mm/fgJUzRfHiUhvT6v+O17Lv8M3SHbc+rDPqzvYbd/SqaTwlK/rlJwTBDRb
 a+mp3UPrX+QFnpMDpwaHbsARk9kK/Y+mBv493pBLWIa2dYgFGKWIVq9tjSBYIFM5y1CMLM8V5yY
 VDXtK33NBgJgCK+3D6m7WTH72aWhGySRBBNWmLiDsoyUpT8zCD3IEiHYvPJA8a3KsqHq4FPasRo
 4OrKdmmv5PchJ/FGutgaUf2MbbcHmf4PndnFGIAQLnos/dBVjY6EgxLbq8HedpPN/AnwsCpnVwl
 w98+TRRktzYxkRSDSg641sVONS4mbyj+64gHOHg2UIj0y6/4rISJFD3Os0G746r6Oullcz7szwC
 oaJZ3SlpGYeapKldrs3tjs5TgyqC74ITg45UI5MjvYUBwO6UJldeyHlU2ha9M+br10SyWs/N
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6815aa62 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=04QupZ5m7bBPoSiWPbYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030044

In order to simplify cleanup actions, use devres-enabled version of
gpiochip_add_data().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 88dd462516c76d58b43d49accbddeea38af8f1ec..b2e8f7b3f3e3d5d232b2bd60e5cace62b21ffb03 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1449,7 +1449,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	girq->handler = handle_bad_irq;
 	girq->parents[0] = pctrl->irq;
 
-	ret = gpiochip_add_data(&pctrl->chip, pctrl);
+	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "Failed register gpiochip\n");
 		return ret;
@@ -1470,7 +1470,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 			dev_name(pctrl->dev), 0, 0, chip->ngpio);
 		if (ret) {
 			dev_err(pctrl->dev, "Failed to add pin range\n");
-			gpiochip_remove(&pctrl->chip);
 			return ret;
 		}
 	}
@@ -1608,9 +1607,6 @@ EXPORT_SYMBOL(msm_pinctrl_probe);
 
 void msm_pinctrl_remove(struct platform_device *pdev)
 {
-	struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&pctrl->chip);
 }
 EXPORT_SYMBOL(msm_pinctrl_remove);
 

-- 
2.39.5


