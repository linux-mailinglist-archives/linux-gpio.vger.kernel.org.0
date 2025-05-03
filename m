Return-Path: <linux-gpio+bounces-19570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10717AA7E92
	for <lists+linux-gpio@lfdr.de>; Sat,  3 May 2025 07:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE7261BA117D
	for <lists+linux-gpio@lfdr.de>; Sat,  3 May 2025 05:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DA51A2564;
	Sat,  3 May 2025 05:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRtarRr9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0D119F42F
	for <linux-gpio@vger.kernel.org>; Sat,  3 May 2025 05:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250338; cv=none; b=tFyI81JZBgdo8mQTk6OOWXvvzMZspMwuB0tMDOg4DKF3n2kVRToc/OJNx4JK3pDj75GwSHuPodsf+XnY+q9vrFNuXAUPmEv9WYfdDyctre2n2MjorZ/DOiGz3Z5HM+uDrINdO6DJ+pWcXLlUMvyZ6vmpnSDcX27Ef+tQ1xF4N5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250338; c=relaxed/simple;
	bh=8sMD+0BVdsqhR32JkSGai+DhVKURkFAaa3llxtrnZ+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jM5HYSk5md/kdcKm/1G+7tUCt9c93E7SIK0G4gmEKeioLdj3ZRnvBLDF19G9oofJm3VBp+opqnXYf2J4jCU0ncepMOJYlZAOke0o3U8ZtUikS8u4mVXvJ7yGql5tJkLkFQPlnnF8spCg7ki6LUqUB1/+q0OsNm/uILDUzNXHGOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRtarRr9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433XIq7001291
	for <linux-gpio@vger.kernel.org>; Sat, 3 May 2025 05:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+g1lzezxgX4iuf48n6TvpSmGyCyTlu+pITz96aE0xc=; b=LRtarRr9v6i+ZL8+
	Ee4SkRqeW02oikeWCbS8l5ixzjAnQ9CA04baaKqRNOs6M+Ovc6TOoT1qfdXzfZYA
	eXeGAgXuvjb0Iv45hg/001BaRArZm5ImwbYGgZ1PzfrVZlr62mnXhON4I9illlrF
	D+q8BQqJn/1a3IuCtN/Ts9HUsubF4ie4fTU/KPl9QlNEvlNeNSUKLt+DQIYsheM5
	mepCKYJYc8JK85CXBVwQNzZTGO3fVxmxmqf9Z4M3bhjx5dtwTg+BB+m4GGQLaxKV
	ZX0LK7Q+sg9xEuAEty0xNZoq/LMveVPp8jgeH88KcIzlxpXzdmHTsnVyNl0Vrw7/
	s7xY1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkr84d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 03 May 2025 05:32:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c82c6d72so474516585a.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 22:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250335; x=1746855135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+g1lzezxgX4iuf48n6TvpSmGyCyTlu+pITz96aE0xc=;
        b=mt2Za86z8VYjFKtJUS/qn/fH7mLJgUA3WBGki3WTa0X7+Yq/sR6M2IE3fslA10MI1n
         M3MerTadRfnljCa8hbNBvWPnhLhdipcjCgLgci3RfXrWpg8yrgYrB0AyTrYAgELliej9
         MAuVUOs+Hyq/JvNx8A6GVynZf1pIfeJdGpRDk14WN1dr5sSijiHzylF76xK0wFkjmJSp
         I4KTZAs7Gz6h1CVNbiLgyhEshny1ENnTo/TnBffvv4resCsWA5PgCjRKeRKYagrTX4MY
         bj2Z66qOMn5M28QSeTioLMPK80dYpyp7nMuNejDeHDhH6o2YH2UrMXdcjmGVygUc2pHn
         zihA==
X-Forwarded-Encrypted: i=1; AJvYcCWHbfx5wDe2TbQGCRKlAOpZFXXJoEWwtqD7mGKzT0YA7a2tmoFSMQ2bG0pxhXlsPmUNy9J0s5kMap40@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt8/LXC/MRg5i5l2pQ3jJQZhljtTh+k861M/8xZasyQ2cCrTJW
	B3pD7iagUQoS0BusKlCzIZTkzsQyNRaFZRsSMoFBNnjkxD+yvcfOJzz4Vk592NgVsy73rSoZt2b
	ZmbBRdn0jrkx2gEJ/u0aKwjIcNqvBr/5bAieN/Ol0RzuiZVTvpEsBTxkd5w14
X-Gm-Gg: ASbGncvhE96cXhMh3GlctgNjTMb3xJKpQ+EEBgJ8Fjh1903c7v7nJmnh9JkytTaDo5y
	ahj+fKr4eiy5SnmLg/7/w+cqSF58aDvXyaemu8QG8Da8Ly7yuzBzFFFEroFAY+cK7E56IY4IGad
	OUIJegskcEpQBpCCthcrYbJJEIOoJc7neMP4UhL1QRvpeo+xe/1n329lBiMMmcu2R5NZ2VsPgMe
	ORyHTddbj7gH3ayjv9a0uFQqHUxj0Mzqabg33qHo5lM7prdLSeGiNj65lBqcoDBz99bVJwwC0ek
	YOPQF+OiMZAgsBsSIF19dSUtLIELIrmDrx5ZNdpsDj9/zq4l5XD2a0GzRh47Z6qQVVvKFfIknAq
	yLbv/Mb/HZC/NAO6Uyl8OXslJ
X-Received: by 2002:ac8:690f:0:b0:476:95dd:520e with SMTP id d75a77b69052e-48c31354610mr87128501cf.16.1746250335051;
        Fri, 02 May 2025 22:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcU2f7JBnJ76SoDjfiVAvyoGalGlzmKSZO2Wv94frd/Ay5rnbqepQqBsqyL9pDoI0HlTxCWw==
X-Received: by 2002:ac8:690f:0:b0:476:95dd:520e with SMTP id d75a77b69052e-48c31354610mr87128281cf.16.1746250334641;
        Fri, 02 May 2025 22:32:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017cc0sm6165841fa.39.2025.05.02.22.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:32:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 08:32:07 +0300
Subject: [PATCH 2/4] pinctrl: qcom: switch to
 devm_register_sys_off_handler()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-pinctrl-msm-fix-v1-2-da9b7f6408f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3068;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8sMD+0BVdsqhR32JkSGai+DhVKURkFAaa3llxtrnZ+o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFapXfvCnOffRs0fkj4X03+IWWD0MsP3qve7Kw
 pBDkgq5RZqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBWqVwAKCRCLPIo+Aiko
 1cmkB/wJDYZIgtJ8LSNVqmYkO3j5uVA6JDmzP3kf6UDwNTbAetQqjNhmN1YQDP0VLa6aVGY275R
 NRlTUoXo59z3b+onaCFVPt49d6D4jeADyF297xPheS+pzobyELSmBRsX9QDoWwjLg/XT7nTQsjB
 fG+/Wq+aq95Uvi/XMPDkuHTmNeIFuyC/nk5XvltGzwb7xUTiY9aatQuQPNn+n0T5QrBwP25AEOA
 539/qeT6zDh41xUKFrA7ZzHB1i0lWecY7nptLPBdjboAm7MQBe1NFpjphP+N3iCzQWN/puHZsol
 9ArXkrU6jEXR3SuNXElo8/GJSKYrpTuJBrLh17yJkzu20V+t
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NCBTYWx0ZWRfXxtfIkQrBjYBm
 H6q9vjX5lzd0yZO2hkJllvKG+ARGTq5NJLD3xsTM4sXOqfXl8KwH67IjSjJhfzJDsV2Mr2VvvqH
 edAmt7bjOmE8PVzKZrAwdZMpmhkh/CUWKf5UoPXQCrxaYfQvQj7ogd3VOpjthMPoW57RqK2MJv5
 GacZ0Qd7Bf4hjL21jmM1OHN/enaYGTbiNyPqUQqKF1VHZivEUzFPKcFm4Asxs0O6rj0AOiJIw86
 qO4NcK3idvrk15K47uapOYVLR/ljSdZ89qg+lNauuK19AlsJPpzD//S74hlN9FE350vxok0RotD
 0J6+eM6eBS3P3SXRs50Pz9XtJHOJWFtRH+BbrGxtk1MRZq3EVGg8XysdRmge/iGV22cHQ9daIuT
 KZEmbfE5BbIYsj1SFdwK2+1qroYIPt6NDYgo9KEjwWfEJfuJnSbqVTXr84QBIC5Sn16Qjnj+
X-Proofpoint-GUID: KkOrGaeo8fAo2MP9T5QnRDBmAbvMGyxL
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6815aa60 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=AQMnIOBPTmT00GrUaA0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: KkOrGaeo8fAo2MP9T5QnRDBmAbvMGyxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030044

Error-handling paths in msm_pinctrl_probe() don't call
a function required to unroll restart handler registration,
unregister_restart_handler(). Instead of adding calls to this function,
switch the msm pinctrl code into using devm_register_sys_off_handler().

Fixes: cf1fc1876289 ("pinctrl: qcom: use restart_notifier mechanism for ps_hold")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a99275f3c4a66a39f4d9318fe918101127ef4487..88dd462516c76d58b43d49accbddeea38af8f1ec 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -44,7 +44,6 @@
  * @pctrl:          pinctrl handle.
  * @chip:           gpiochip handle.
  * @desc:           pin controller descriptor
- * @restart_nb:     restart notifier block.
  * @irq:            parent irq for the TLMM irq_chip.
  * @intr_target_use_scm: route irq to application cpu using scm calls
  * @lock:           Spinlock to protect register resources as well
@@ -64,7 +63,6 @@ struct msm_pinctrl {
 	struct pinctrl_dev *pctrl;
 	struct gpio_chip chip;
 	struct pinctrl_desc desc;
-	struct notifier_block restart_nb;
 
 	int irq;
 
@@ -1480,10 +1478,9 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	return 0;
 }
 
-static int msm_ps_hold_restart(struct notifier_block *nb, unsigned long action,
-			       void *data)
+static int msm_ps_hold_restart(struct sys_off_data *data)
 {
-	struct msm_pinctrl *pctrl = container_of(nb, struct msm_pinctrl, restart_nb);
+	struct msm_pinctrl *pctrl = data->cb_data;
 
 	writel(0, pctrl->regs[0] + PS_HOLD_OFFSET);
 	mdelay(1000);
@@ -1494,7 +1491,11 @@ static struct msm_pinctrl *poweroff_pctrl;
 
 static void msm_ps_hold_poweroff(void)
 {
-	msm_ps_hold_restart(&poweroff_pctrl->restart_nb, 0, NULL);
+	struct sys_off_data data = {
+		.cb_data = poweroff_pctrl,
+	};
+
+	msm_ps_hold_restart(&data);
 }
 
 static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
@@ -1504,9 +1505,11 @@ static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
 
 	for (i = 0; i < pctrl->soc->nfunctions; i++)
 		if (!strcmp(func[i].name, "ps_hold")) {
-			pctrl->restart_nb.notifier_call = msm_ps_hold_restart;
-			pctrl->restart_nb.priority = 128;
-			if (register_restart_handler(&pctrl->restart_nb))
+			if (devm_register_sys_off_handler(pctrl->dev,
+							  SYS_OFF_MODE_RESTART,
+							  128,
+							  msm_ps_hold_restart,
+							  pctrl))
 				dev_err(pctrl->dev,
 					"failed to setup restart handler.\n");
 			poweroff_pctrl = pctrl;
@@ -1608,8 +1611,6 @@ void msm_pinctrl_remove(struct platform_device *pdev)
 	struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&pctrl->chip);
-
-	unregister_restart_handler(&pctrl->restart_nb);
 }
 EXPORT_SYMBOL(msm_pinctrl_remove);
 

-- 
2.39.5


