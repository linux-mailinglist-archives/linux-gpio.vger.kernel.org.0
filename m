Return-Path: <linux-gpio+bounces-20100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE75AB5C68
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 20:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7719866522
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 18:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403CF2C031C;
	Tue, 13 May 2025 18:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnA0q9ku"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CBD2BFC9C
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 18:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161551; cv=none; b=IF+CflRu+5NJgqX32ZZ9djCbVcDerRa9kJw0GYPgYxBFI4TrJxs/X0wBw01Wtj92tGrLLAdw1AZ+CHgyn9f8l9ivQsUqr5xV7KOa3TdYobRak0HjvkjvedmOBTkvEN30T7d0Hfd1peMFnsH2P06MT2UxmdV6h1K9X+vyogUKG/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161551; c=relaxed/simple;
	bh=/mPP7LUjsm5a3AYJ45yK78U2SSvUhN9glXB7b/297zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pvn0VFwBNZtIb5pEQLh6oqA9wAJhOTFZZMZSGOSHoMjCmoDicanqz9wIOxmLzXnYvcd8VwQrKeEW+ZHizz6GIuz2jsSm+ZpB4cNFuF1cAMyyHQ2Pry5H2L8GIo+kOH5PNmyecJKLecY98Pki2xWv/LxDXRFXmW6v8Tu8FszYZKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnA0q9ku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIRXaJ016767
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 18:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bmm/Z5+zAJ+GMjEm5WuoeHNssuHI0duAPzumFQz+FuE=; b=KnA0q9kuKL3YnQCd
	qMLX6LsNb2h4n+Wsf284CJwxZarp6bqACnfwCFLb6p2Hda1+i8rql6EkuZrfUTZJ
	4H3QOglQ7n3gdvbGHo2/JdPGxs5RqjimQ77JEUxv34x6BLDTzf5x8jVnoqbq2XNB
	ro63covDkyVZLzj35PMZNl17DhjFjhfbVHqtETFawIL8xrWy7LvRsAv9r0abUxOn
	JvK3XliJjLP/KuoZcNBQDHNd/egL5JDj2E3Z8QEsfD/eSkj6ihEgfHKBnQnIqhAM
	amWFUJFeiUXNkD57lAe4NrFPL7UHEpTQVNIA1BQlwluQ5/8OtYG2wHYdwqZCqKVH
	3V5jJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmr17y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 18:39:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4769273691dso97629201cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 11:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747161546; x=1747766346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bmm/Z5+zAJ+GMjEm5WuoeHNssuHI0duAPzumFQz+FuE=;
        b=p4IZhHqByRbQfy/rGX/WSqNcxbqCYmWDiFflZlZWI/Jlg4RpGAPKpDNIki8WfutSPL
         ZkZsdNm3/CYwmaR/At1OAlBhwdHQf0JjXuzmmyqfNulAjddkFv0rlorfa4fd9YWdk4Ud
         pPn+HzwOYve/InDxCzUUWNmvTcK260RGfQH6MNEo2UqQjriDNd3E3ByLY1TxyfFwcvgl
         dn+RF/ltba+INSHpkgeQsovIkoEZnZUq1gzYQMc/hTevucdAwuOgpJoDQ7kCsJqzGu4W
         pgb8aqe6b5NMIloWi4Mukoxb5trK6OZFXnEqUPzeZ430w+h6PitUP3a9jN2v3lKSrh5U
         AxeA==
X-Forwarded-Encrypted: i=1; AJvYcCXIRxQRf4j6u+SYsiHvQEBu/2KiynqDTWeNCaLMg7doJQL+8DIA3UqedvqDywJH8AS0KUL0YKPVzAzS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9JTd3xtQvtJcx/TYeVTYqXJbkQxaq9KNSpfprUVYDSfnaA5Qt
	Ky+Y4dgLvuKrN97gOrjtn4Yly11FPWmcM3JB+HM5ZYoA8VM5TT0KWbSld5AZEAJMBrmKq1rG1rB
	UYmrK3EyVvRAo6/3joN7leK+KQ4srytTQoFQ5ZCIHWs0SwbMRtrMAQNNHlaNn
X-Gm-Gg: ASbGncvkzvTeRe05hBSm6CCYllMzyVrEdGne/laGEu9N4mkWMyYto4aNdcvD8eUmRra
	PlNMEFQY6PiNDNbnyt+jj9D/SqNpcUXtWbrE4aysmO0dBmxVgoNbOkqm62xCncmMR1n4KBrUomb
	PCbHwUqNDX6FP18NKlPUuxvACRRGT4gAIICSdKna8pn49mw68OQcPIMqaYLGe9IlPdXwjpTF8O6
	nP0eMbDLdFXgHQ9Lwbfd1u/2xWY1t07wy02+k8sLSW8yAT74C1xCxJl4z9GYYLDcC71tkEi7a9G
	+rrX3rs4a8EsBjT5YFX8wdgbFBikb7/hESyM3dy2wpKqpQzpID3ismt32DNwPCrHBuRYs/x0hDs
	8yscSNZuEMfr32Wa1CQ66tcwY
X-Received: by 2002:a05:622a:1b14:b0:476:ad9d:d4e9 with SMTP id d75a77b69052e-49495cb5b81mr7594511cf.24.1747161545446;
        Tue, 13 May 2025 11:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv46mmG3PotEg9vfO+MOqZn+YkAsixtOeNppHNgTaa9RnQyB4q6gfa/9ZSXAilT6M/H18yrQ==
X-Received: by 2002:a05:622a:1b14:b0:476:ad9d:d4e9 with SMTP id d75a77b69052e-49495cb5b81mr7593991cf.24.1747161544866;
        Tue, 13 May 2025 11:39:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33c12b7sm17383921fa.50.2025.05.13.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:39:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 May 2025 21:38:59 +0300
Subject: [PATCH v2 3/3] pinctrl: qcom: switch to devm_gpiochip_add_data()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-pinctrl-msm-fix-v2-3-249999af0fc1@oss.qualcomm.com>
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=34886;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/mPP7LUjsm5a3AYJ45yK78U2SSvUhN9glXB7b/297zg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoI5HCs1QFstaI+n45YN7w2VOJpJziFpt4OyFt+
 ge0HvFsXkCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCORwgAKCRCLPIo+Aiko
 1ch4B/9DnQdThxiK7fZEEJwlphCV287mFVj8d48PF508u0rftpHf27fGAfX6eM7ZghptrRgi7Af
 T98kpFH6+e9GL0DHISm9QhzY9B0LlLZb7Tv14ML4LDtygBsV4mhzZwZReV0xUppQHw4f0G14Pdv
 fV7CVK974rIkG+Uw9eSWBuIWe8rNzOuzcRZhfBBqjXx7hHKy4ntm5As5CimR7U4SgNYkIZFBcTj
 OtbgdfTop60p0TX8FFsTbyPa5pTpRkX1mBZfRlPga34Dtxlm6xHedub1i5G/OkUGbxO4nkcNHLk
 FoG/vP35F+aGiFu4t4Ug932ShIGfjUKx9Tew07KsrD8OlHVM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: fQypeIkKadANzyMjmsPHWV7pnMnU3gAJ
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=682391cb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=HEy92-61m365HJIm5JYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: fQypeIkKadANzyMjmsPHWV7pnMnU3gAJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE3NyBTYWx0ZWRfX8wRA0LAddkAC
 wCVEPTqMP8zF5qHl6G6Jz8+oIjz8yHSNskIhe8HRGiljbTMrze5/Pn3MglchARKY+dZJgW51BOA
 TTjnBqP+l6uJHLdpgePQABtoQrY5IibTIY2/gYpDtJiwJrlTyaGYf7TKG7SCg5RDl8LQREREz6J
 85Gli5fUVqPym7eriq2kgIbHF2rmVubeCALAvad4snAPOY9teJh9OqmfZmMxtnxt8//UnMBWuf2
 cXMTHn9TYvPlIg6hXcv2v/6Z200nseCKeFIWvGLLoyqeU/OgWswOXoxmWepwViQoyRFOj58MRuC
 Gpf6yjAT0cHS59BAEOpcnApWztj3FGlsNpD+UKV+v8CEZtUGUs/wtxVIWILTEf3QRPOcdIR9qOX
 LL4qzk+2fiDcy4zQrP4O8GHrkXU1do8QCr4RMSJrapPSODryJb4s5q9agjZnDAVnQDKnVVzB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130177

In order to simplify cleanup actions, use devres-enabled version of
gpiochip_add_data().  As the msm_pinctrl_remove() function is now empty,
drop it and all its calls from the corresponding pinctrl drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-apq8064.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-apq8084.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq4019.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5018.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5332.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5424.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq6018.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8064.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8074.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq9574.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9607.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9615.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm.c      | 11 +----------
 drivers/pinctrl/qcom/pinctrl-msm.h      |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8226.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8660.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8909.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8916.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8917.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8953.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8960.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8976.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8994.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8996.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8998.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8x74.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qcm2290.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs404.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs615.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs8300.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qdu1000.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sa8775p.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sar2130p.c |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7180.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7280.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8180x.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm660.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm670.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm845.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx55.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx65.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx75.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sm4450.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6115.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6125.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6350.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6375.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm7150.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8150.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8250.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8350.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8450.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8550.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8650.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8750.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-x1e80100.c |  1 -
 58 files changed, 1 insertion(+), 67 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-apq8064.c b/drivers/pinctrl/qcom/pinctrl-apq8064.c
index 20c3b9025044515477f39bc25f0202dcca561743..3654913f1ae584394f5d08305f49e72a9b49fe5a 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8064.c
@@ -629,7 +629,6 @@ static struct platform_driver apq8064_pinctrl_driver = {
 		.of_match_table = apq8064_pinctrl_of_match,
 	},
 	.probe = apq8064_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init apq8064_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-apq8084.c b/drivers/pinctrl/qcom/pinctrl-apq8084.c
index 3fc0a40762b631ad3dc15c9a7624ab705f367e74..27693cd648818bbcf6236cffad2efcd31c92018b 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8084.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8084.c
@@ -1207,7 +1207,6 @@ static struct platform_driver apq8084_pinctrl_driver = {
 		.of_match_table = apq8084_pinctrl_of_match,
 	},
 	.probe = apq8084_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init apq8084_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index 1f7944dd829d1b9cb8c445ee075e0e29a12294b9..6ede3149b6e1730ea432a1636152abcbf0fa73b2 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -710,7 +710,6 @@ static struct platform_driver ipq4019_pinctrl_driver = {
 		.of_match_table = ipq4019_pinctrl_of_match,
 	},
 	.probe = ipq4019_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq4019_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
index e2951f81c3eeb3f4d52c3941ab6f591da0254a23..10b99d5d8a11db644e974a80b9d7d04ffc09bd4c 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
@@ -754,7 +754,6 @@ static struct platform_driver ipq5018_pinctrl_driver = {
 		.of_match_table = ipq5018_pinctrl_of_match,
 	},
 	.probe = ipq5018_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq5018_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5332.c b/drivers/pinctrl/qcom/pinctrl-ipq5332.c
index 625f8014051f6acf8e6f91d48d0406b8c2bd8caf..1ac2fc09c11923cd716495b16a7f4af5686ce398 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5332.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5332.c
@@ -834,7 +834,6 @@ static struct platform_driver ipq5332_pinctrl_driver = {
 		.of_match_table = ipq5332_pinctrl_of_match,
 	},
 	.probe = ipq5332_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq5332_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5424.c b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
index 0d610b076da3bb7940c99cfaf4c69261f9509390..7ff1f8acc1a3a81037298464130fda59f329d53e 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5424.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
@@ -791,7 +791,6 @@ static struct platform_driver ipq5424_pinctrl_driver = {
 		.of_match_table = ipq5424_pinctrl_of_match,
 	},
 	.probe = ipq5424_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq5424_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq6018.c b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
index 0ad08647dbcdf0b1fa21a618310f150a1bde2fae..a4ba980252e187879947e7057004fa48815f2620 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq6018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
@@ -1080,7 +1080,6 @@ static struct platform_driver ipq6018_pinctrl_driver = {
 		.of_match_table = ipq6018_pinctrl_of_match,
 	},
 	.probe = ipq6018_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq6018_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8064.c b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
index e2bb94e86aef6e0055860794a1c64649c722aebc..0a9e357e64c60d61a094000f167defc80503e649 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
@@ -631,7 +631,6 @@ static struct platform_driver ipq8064_pinctrl_driver = {
 		.of_match_table = ipq8064_pinctrl_of_match,
 	},
 	.probe = ipq8064_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq8064_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8074.c b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
index 337f3a1c92c19285f16f59a79f3e2b20561ae19a..482f13282fc2be951032cbe6dc5100bf9129ea5f 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8074.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
@@ -1041,7 +1041,6 @@ static struct platform_driver ipq8074_pinctrl_driver = {
 		.of_match_table = ipq8074_pinctrl_of_match,
 	},
 	.probe = ipq8074_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq8074_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq9574.c b/drivers/pinctrl/qcom/pinctrl-ipq9574.c
index e2491617b2364a64169297426351e723c37f030c..89c05d8eb55034dea3e1c7299ede6567c20e0159 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq9574.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq9574.c
@@ -799,7 +799,6 @@ static struct platform_driver ipq9574_pinctrl_driver = {
 		.of_match_table = ipq9574_pinctrl_of_match,
 	},
 	.probe = ipq9574_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq9574_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9607.c b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
index e7cd3ef1cf3e815ae25aa9e0c6872fbbd2c8ac79..3e18ba124fede923f56eab1aec5aaf875f06e343 100644
--- a/drivers/pinctrl/qcom/pinctrl-mdm9607.c
+++ b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
@@ -1059,7 +1059,6 @@ static struct platform_driver mdm9607_pinctrl_driver = {
 		.of_match_table = mdm9607_pinctrl_of_match,
 	},
 	.probe = mdm9607_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init mdm9607_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9615.c b/drivers/pinctrl/qcom/pinctrl-mdm9615.c
index 0a2ae383d3d57bd4101efb7a2093b68b8920b426..bea1ca3d1b7f84c28c23af2a52cc464da44a90b0 100644
--- a/drivers/pinctrl/qcom/pinctrl-mdm9615.c
+++ b/drivers/pinctrl/qcom/pinctrl-mdm9615.c
@@ -446,7 +446,6 @@ static struct platform_driver mdm9615_pinctrl_driver = {
 		.of_match_table = mdm9615_pinctrl_of_match,
 	},
 	.probe = mdm9615_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init mdm9615_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f012ea88aa22ca3e184b05c39da9a1f7c2b3c74f..5c4687de1464a60355e6cb1e456b487ad368275a 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1442,7 +1442,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	girq->handler = handle_bad_irq;
 	girq->parents[0] = pctrl->irq;
 
-	ret = gpiochip_add_data(&pctrl->chip, pctrl);
+	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "Failed register gpiochip\n");
 		return ret;
@@ -1463,7 +1463,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 			dev_name(pctrl->dev), 0, 0, chip->ngpio);
 		if (ret) {
 			dev_err(pctrl->dev, "Failed to add pin range\n");
-			gpiochip_remove(&pctrl->chip);
 			return ret;
 		}
 	}
@@ -1599,13 +1598,5 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL(msm_pinctrl_probe);
 
-void msm_pinctrl_remove(struct platform_device *pdev)
-{
-	struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&pctrl->chip);
-}
-EXPORT_SYMBOL(msm_pinctrl_remove);
-
 MODULE_DESCRIPTION("Qualcomm Technologies, Inc. TLMM driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 63852ed702957b8111b364267af17737b7a582a1..d7dc0947bb161868c8f433dc2536719b8afc8bd8 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -171,6 +171,5 @@ extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
 
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data);
-void msm_pinctrl_remove(struct platform_device *pdev);
 
 #endif
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8226.c b/drivers/pinctrl/qcom/pinctrl-msm8226.c
index 64fee70f1772c41f5d8e20deb270ed66cb20a151..f9a957347340813f87e58d3bcbea81faa9d6255e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8226.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8226.c
@@ -654,7 +654,6 @@ static struct platform_driver msm8226_pinctrl_driver = {
 		.of_match_table = msm8226_pinctrl_of_match,
 	},
 	.probe = msm8226_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8226_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8660.c b/drivers/pinctrl/qcom/pinctrl-msm8660.c
index 999a5f867eb5081232443a893773d73c8dc65d1b..4dbc19ffd80efcdab059a253904e1ffe95fd36f7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8660.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8660.c
@@ -981,7 +981,6 @@ static struct platform_driver msm8660_pinctrl_driver = {
 		.of_match_table = msm8660_pinctrl_of_match,
 	},
 	.probe = msm8660_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8660_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8909.c b/drivers/pinctrl/qcom/pinctrl-msm8909.c
index 756856d20d6b5f2d4e764ff32f2493de24ca677c..0aa4f77b774f45947ffade7d167dd25cc4da5297 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8909.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8909.c
@@ -929,7 +929,6 @@ static struct platform_driver msm8909_pinctrl_driver = {
 		.of_match_table = msm8909_pinctrl_of_match,
 	},
 	.probe = msm8909_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8909_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8916.c b/drivers/pinctrl/qcom/pinctrl-msm8916.c
index cea5c54f92fec1829c5378a8441eb8710fd500f0..0dfc6dd33d58b2d9df7a5cc3f7ff8890976207d3 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8916.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8916.c
@@ -969,7 +969,6 @@ static struct platform_driver msm8916_pinctrl_driver = {
 		.of_match_table = msm8916_pinctrl_of_match,
 	},
 	.probe = msm8916_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8916_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8917.c b/drivers/pinctrl/qcom/pinctrl-msm8917.c
index 350636807b07d9ab0e207368de63837bc5fa5502..2e1a94ab18b219f818c591ff3b07280578822d1a 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8917.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8917.c
@@ -1607,7 +1607,6 @@ static struct platform_driver msm8917_pinctrl_driver = {
 		.of_match_table = msm8917_pinctrl_of_match,
 	},
 	.probe = msm8917_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8917_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8953.c b/drivers/pinctrl/qcom/pinctrl-msm8953.c
index 998351bdfee1369fe0f369648d66a1a05493c8fb..956383341a7a777edf28c710353dc6deab124ef9 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8953.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8953.c
@@ -1816,7 +1816,6 @@ static struct platform_driver msm8953_pinctrl_driver = {
 		.of_match_table = msm8953_pinctrl_of_match,
 	},
 	.probe = msm8953_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8953_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8960.c b/drivers/pinctrl/qcom/pinctrl-msm8960.c
index ebe230b3b437ccc63535fdf51639e64a67fe05eb..a937ea867de709326a2aea77f980cae1d8480f35 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8960.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8960.c
@@ -1246,7 +1246,6 @@ static struct platform_driver msm8960_pinctrl_driver = {
 		.of_match_table = msm8960_pinctrl_of_match,
 	},
 	.probe = msm8960_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8960_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8976.c b/drivers/pinctrl/qcom/pinctrl-msm8976.c
index c30d80e4e98ca68ccede66001445967a47d6ec8f..3bcb03387781f803bf7e0251496a88a43b562b8d 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8976.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8976.c
@@ -1096,7 +1096,6 @@ static struct platform_driver msm8976_pinctrl_driver = {
 		.of_match_table = msm8976_pinctrl_of_match,
 	},
 	.probe = msm8976_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8976_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8994.c b/drivers/pinctrl/qcom/pinctrl-msm8994.c
index b1a6759ab4a5e70501aba4325e80db2359251204..7a3b6cbccb687c8b5040ee6bf372f092f21aa872 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8994.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8994.c
@@ -1343,7 +1343,6 @@ static struct platform_driver msm8994_pinctrl_driver = {
 		.of_match_table = msm8994_pinctrl_of_match,
 	},
 	.probe = msm8994_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8994_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8996.c b/drivers/pinctrl/qcom/pinctrl-msm8996.c
index 1b5d80eaab83c7e2c81c96019e8b0cc6f5461c69..d86d83106d3ba12343a4685e5b87c661f823c35b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8996.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8996.c
@@ -1920,7 +1920,6 @@ static struct platform_driver msm8996_pinctrl_driver = {
 		.of_match_table = msm8996_pinctrl_of_match,
 	},
 	.probe = msm8996_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8996_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8998.c b/drivers/pinctrl/qcom/pinctrl-msm8998.c
index b7cbf32b3125a91081c6644cd3d343e08499dd1f..1daee815888f54b711505dfacefd614df83affc0 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8998.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8998.c
@@ -1535,7 +1535,6 @@ static struct platform_driver msm8998_pinctrl_driver = {
 		.of_match_table = msm8998_pinctrl_of_match,
 	},
 	.probe = msm8998_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8998_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8x74.c b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
index 238c83f6ec4f41ff2dc572fd910c1c9aef9d290a..8253aa25775b247dc54a377c9781094e465e22b6 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8x74.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
@@ -1083,7 +1083,6 @@ static struct platform_driver msm8x74_pinctrl_driver = {
 		.of_match_table = msm8x74_pinctrl_of_match,
 	},
 	.probe = msm8x74_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8x74_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
index f885af571ec93d66533f4909e935e5c7a2dd0511..85c951305abd6640b33cc4d8bf2283ffab18bbc4 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -1125,7 +1125,6 @@ static struct platform_driver qcm2290_pinctrl_driver = {
 		.of_match_table = qcm2290_pinctrl_of_match,
 	},
 	.probe = qcm2290_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init qcm2290_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs404.c b/drivers/pinctrl/qcom/pinctrl-qcs404.c
index ae7224012f8aa00a41350b3ce670511aa8ce18bd..54e3b44353494e9398a88702945b7a85ff901b4d 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs404.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs404.c
@@ -1644,7 +1644,6 @@ static struct platform_driver qcs404_pinctrl_driver = {
 		.of_match_table = qcs404_pinctrl_of_match,
 	},
 	.probe = qcs404_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init qcs404_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 23015b055f6a925e8157363952f3ce659059d719..0c3182808d021616848c31d605383296eb4e8e43 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -1087,7 +1087,6 @@ static struct platform_driver qcs615_tlmm_driver = {
 		.of_match_table = qcs615_tlmm_of_match,
 	},
 	.probe = qcs615_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init qcs615_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index ba6de944a859a0b637812e5d39c9eab7ea3ef8ed..e4ca2c0c12a6eb7460cdbf6f2e4a3086313a5a55 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -1227,7 +1227,6 @@ static struct platform_driver qcs8300_pinctrl_driver = {
 		.of_match_table = qcs8300_pinctrl_of_match,
 	},
 	.probe = qcs8300_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init qcs8300_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
index b5808fcfb13cdebd04c0c71b24043b924094a683..9ecc4d40e4dc4f36aafc70309102b9e66ce024c0 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
@@ -145,7 +145,6 @@ static struct platform_driver qdf2xxx_pinctrl_driver = {
 		.acpi_match_table = qdf2xxx_acpi_ids,
 	},
 	.probe = qdf2xxx_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init qdf2xxx_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qdu1000.c b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
index 47bc529ef550d2ab9a13341295eacc08faed24c4..eacb89fa388850ef39ceb50497df9e5cca54191c 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdu1000.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
@@ -1248,7 +1248,6 @@ static struct platform_driver qdu1000_tlmm_driver = {
 		.of_match_table = qdu1000_tlmm_of_match,
 	},
 	.probe = qdu1000_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init qdu1000_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index a5b38221aea851ce09448eb7eb71f7f94721443a..1b62eb3e6620c978225c5fd2ab541451cbe93093 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -1540,7 +1540,6 @@ static struct platform_driver sa8775p_pinctrl_driver = {
 		.of_match_table = sa8775p_pinctrl_of_match,
 	},
 	.probe = sa8775p_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sa8775p_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sar2130p.c b/drivers/pinctrl/qcom/pinctrl-sar2130p.c
index 19a2e37826c7b25f6d37f130a0fb5ef4cdadb61c..3dd1b5e5cfee489ec34b16ee2ae1c8d2c2756553 100644
--- a/drivers/pinctrl/qcom/pinctrl-sar2130p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sar2130p.c
@@ -1486,7 +1486,6 @@ static struct platform_driver sar2130p_tlmm_driver = {
 		.of_match_table = sar2130p_tlmm_of_match,
 	},
 	.probe = sar2130p_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sar2130p_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
index 6eb0c73791c0bc9883bf0b740b8930fe7c7fced0..c43fe10b71add7d6294c90e86578ed472b8759a3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
@@ -1159,7 +1159,6 @@ static struct platform_driver sc7180_pinctrl_driver = {
 		.of_match_table = sc7180_pinctrl_of_match,
 	},
 	.probe = sc7180_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sc7180_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index 0c10eeb60b55e742a73dfd43d647f7009471b1b0..1b070e9d41f5972470d245edb821d202ca24522b 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -1505,7 +1505,6 @@ static struct platform_driver sc7280_pinctrl_driver = {
 		.of_match_table = sc7280_pinctrl_of_match,
 	},
 	.probe = sc7280_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sc7280_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
index d6a79ad41a40a804c503d97a6279db4b533f0047..26dd165d154348a8659720335ec16c3e5ace30ef 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -1720,7 +1720,6 @@ static struct platform_driver sc8180x_pinctrl_driver = {
 		.acpi_match_table = sc8180x_pinctrl_acpi_match,
 	},
 	.probe = sc8180x_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sc8180x_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
index 96f4fb5a5d297f784e63f4335e294ebdee5f487f..6ccd7e5648d420072f7ce467d92ef0764a6d7764 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
@@ -1926,7 +1926,6 @@ static struct platform_driver sc8280xp_pinctrl_driver = {
 		.of_match_table = sc8280xp_pinctrl_of_match,
 	},
 	.probe = sc8280xp_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sc8280xp_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660.c b/drivers/pinctrl/qcom/pinctrl-sdm660.c
index 907e4ffca5e7df48aed8f917455f35c0da8c6265..1a78288f1bc832837d5c72d9eb1659f397d79b94 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660.c
@@ -1442,7 +1442,6 @@ static struct platform_driver sdm660_pinctrl_driver = {
 		.of_match_table = sdm660_pinctrl_of_match,
 	},
 	.probe = sdm660_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdm660_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670.c b/drivers/pinctrl/qcom/pinctrl-sdm670.c
index c76183ba95e17473d1ed313090e8cc3546431348..0fe1fa94cd6da13591397442a63ce8daec9f4674 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670.c
@@ -1337,7 +1337,6 @@ static struct platform_driver sdm670_pinctrl_driver = {
 		.of_match_table = sdm670_pinctrl_of_match,
 	},
 	.probe = sdm670_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdm670_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index cc05c415ed15512f1f99a598650d3adfdc795a6d..0446e291aa4831da439af12b7934fbda5915ee5a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -1351,7 +1351,6 @@ static struct platform_driver sdm845_pinctrl_driver = {
 		.acpi_match_table = ACPI_PTR(sdm845_pinctrl_acpi_match),
 	},
 	.probe = sdm845_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdm845_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
index 8826db9d21d04cecca844b0607984e21a500f15b..2c17bf889146362edf9f482d33b17d35a255882e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
@@ -990,7 +990,6 @@ static struct platform_driver sdx55_pinctrl_driver = {
 		.of_match_table = sdx55_pinctrl_of_match,
 	},
 	.probe = sdx55_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdx55_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx65.c b/drivers/pinctrl/qcom/pinctrl-sdx65.c
index f6f319c997fc7a39d672872c0df1fa2ea821b2d9..85b5c0206dbd199c6efc15aad10784d20c1addde 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx65.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx65.c
@@ -939,7 +939,6 @@ static struct platform_driver sdx65_pinctrl_driver = {
 		.of_match_table = sdx65_pinctrl_of_match,
 	},
 	.probe = sdx65_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdx65_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx75.c b/drivers/pinctrl/qcom/pinctrl-sdx75.c
index 3cfe8c7f04df816a93252a162ccfa502854411fe..ab13a3a57a830781f35916ff508ca65d6699271d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx75.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx75.c
@@ -1124,7 +1124,6 @@ static struct platform_driver sdx75_pinctrl_driver = {
 		.of_match_table = sdx75_pinctrl_of_match,
 	},
 	.probe = sdx75_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdx75_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4450.c b/drivers/pinctrl/qcom/pinctrl-sm4450.c
index 622f20e6f6f859ee4f132809304bc3f0685e8ff3..1ecdf1ab4f275ede7cb629321f9c37d3f81a25e9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4450.c
@@ -994,7 +994,6 @@ static struct platform_driver sm4450_tlmm_driver = {
 		.of_match_table = sm4450_tlmm_of_match,
 	},
 	.probe = sm4450_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 MODULE_DEVICE_TABLE(of, sm4450_tlmm_of_match);
 
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 4e91c75ad952487e755e0abdf861b1f118bf4de5..c273efa4399630a2187845382e231fe150d997fd 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -907,7 +907,6 @@ static struct platform_driver sm6115_tlmm_driver = {
 		.of_match_table = sm6115_tlmm_of_match,
 	},
 	.probe = sm6115_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm6115_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6125.c b/drivers/pinctrl/qcom/pinctrl-sm6125.c
index c188842047aae054929e124f650290034cfad979..5092f20e0c1bdee2e99b768f12cfbec31972c24c 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6125.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6125.c
@@ -1266,7 +1266,6 @@ static struct platform_driver sm6125_tlmm_driver = {
 		.of_match_table = sm6125_tlmm_of_match,
 	},
 	.probe = sm6125_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm6125_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350.c b/drivers/pinctrl/qcom/pinctrl-sm6350.c
index f3828c07b134500e4307db1d42aabae389a03360..ba4686c86c54b8c1dc32522c83587521e149a5ae 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6350.c
@@ -1373,7 +1373,6 @@ static struct platform_driver sm6350_tlmm_driver = {
 		.of_match_table = sm6350_tlmm_of_match,
 	},
 	.probe = sm6350_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm6350_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6375.c b/drivers/pinctrl/qcom/pinctrl-sm6375.c
index c82c8516932ea2e1880284fa86bdaf3683f024cc..49031571e65ee3291fb1e5269e071a08a77c87de 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6375.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6375.c
@@ -1516,7 +1516,6 @@ static struct platform_driver sm6375_tlmm_driver = {
 		.of_match_table = sm6375_tlmm_of_match,
 	},
 	.probe = sm6375_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm6375_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm7150.c b/drivers/pinctrl/qcom/pinctrl-sm7150.c
index 3c7fd8af6635b94df107f44e3e0e68a2778a25e7..6e89966cd70e34bcb74cfb50e80e110e40655b0e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm7150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm7150.c
@@ -1255,7 +1255,6 @@ static struct platform_driver sm7150_tlmm_driver = {
 		.of_match_table = sm7150_tlmm_of_match,
 	},
 	.probe = sm7150_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm7150_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
index 01aea9c70b7a78168ee063f5ac88afc0d7290bcb..794ed99463f76032f56be9464a4aa3018537df94 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
@@ -1542,7 +1542,6 @@ static struct platform_driver sm8150_pinctrl_driver = {
 		.of_match_table = sm8150_pinctrl_of_match,
 	},
 	.probe = sm8150_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8150_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index e9961a49ff9811bfa3ed3c6c1a8f1cf90afa1d29..fb6f005d64f53f318d58e69681f07e36404439cf 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1351,7 +1351,6 @@ static struct platform_driver sm8250_pinctrl_driver = {
 		.of_match_table = sm8250_pinctrl_of_match,
 	},
 	.probe = sm8250_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8250_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
index 9c69458bd9109119e7a88d1a92f633bbf188ed0c..c8a3f39ce6f1b8565a783f04100269b3cadb9bcc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
@@ -1642,7 +1642,6 @@ static struct platform_driver sm8350_tlmm_driver = {
 		.of_match_table = sm8350_tlmm_of_match,
 	},
 	.probe = sm8350_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8350_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450.c b/drivers/pinctrl/qcom/pinctrl-sm8450.c
index d11bb1ee9e3d8dfbb1e810051d5c854a959b428b..f2e52d5a0f9369d21922d0651539908d592301e5 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450.c
@@ -1677,7 +1677,6 @@ static struct platform_driver sm8450_tlmm_driver = {
 		.of_match_table = sm8450_tlmm_of_match,
 	},
 	.probe = sm8450_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8450_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550.c b/drivers/pinctrl/qcom/pinctrl-sm8550.c
index 3c847d9cb5d93bbc7bb5a9b0b2ee707e14de6387..1b4496cb39eb46b2b660ef213e1f3c8fdac2b21e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550.c
@@ -1762,7 +1762,6 @@ static struct platform_driver sm8550_tlmm_driver = {
 		.of_match_table = sm8550_tlmm_of_match,
 	},
 	.probe = sm8550_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8550_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650.c b/drivers/pinctrl/qcom/pinctrl-sm8650.c
index 104708252d12a82a887aa2bdaecf31d3308a102c..449a0077f4b10666ecd9dfaae8e0057a91e181a6 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650.c
@@ -1742,7 +1742,6 @@ static struct platform_driver sm8650_tlmm_driver = {
 		.of_match_table = sm8650_tlmm_of_match,
 	},
 	.probe = sm8650_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8650_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index 1af11cd95fb0e69fcc876fe069cc2cd6fd6679fd..b2764b722a560e932660f3d0557ad745880b91c4 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -1709,7 +1709,6 @@ static struct platform_driver sm8750_tlmm_driver = {
 		.of_match_table = sm8750_tlmm_of_match,
 	},
 	.probe = sm8750_tlmm_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8750_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index 419cb8facb2f3d261558593800a26694eddb4817..d4b215f34c39bf67a0656a3f894b8639491e898b 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1861,7 +1861,6 @@ static struct platform_driver x1e80100_pinctrl_driver = {
 		.of_match_table = x1e80100_pinctrl_of_match,
 	},
 	.probe = x1e80100_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
 };
 
 static int __init x1e80100_pinctrl_init(void)

-- 
2.39.5


