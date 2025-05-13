Return-Path: <linux-gpio+bounces-20099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91428AB5C67
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 20:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6448B4A78C6
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 18:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8337A2BFC7F;
	Tue, 13 May 2025 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1LT9ybT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E462BF994
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161547; cv=none; b=n3R9AZ2cnNPfjK428+p4e6oPe8JoGZoPsISwIRPSAYaDO0ngE1mmUGqyeoJgI69eM4bpTCfDQfpWINV2qgemc0bG+05Jrlwd/f/Gm3imnptoTuRNTEqr9j2k/oAq/MVG66mcMndHIpIJiGrn2CMMLbIYQxlwyp6MeWhB8DV3wSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161547; c=relaxed/simple;
	bh=ulXM6UtooOJcoFgLVDtqli1pFpfzRkUJPnnDkn4Hq8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z8WEmHj/fjL4zkwiKlW8HpJWOffzvRnrd8WDNPiP0TJ4SwnjSdmtqqM/NGZC7fdpi2ewYpCe3Xe4NRyxaqZwZHzb4NowCiOfFx8403g4yWWckKIHESTHsh13HO2WSfKgC4wjjuvo3L5N2rtMDvUVicVq3DS4QIE7NvntI0dJ8xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1LT9ybT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIRuKP029492
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 18:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXN65qDcg0TnuJT/xzuzO/6MqpFg2S+kXLyRi1uWQXo=; b=P1LT9ybTYgL6I2sm
	PXvX3okpYueXMf/gK2kLfIvs3VaQXrLUyijAoeS+dxHPnlz/hui8XixYrTyFYIC9
	rygmzsw0CMKc+zuLPI011RU5aZ7+9bubhV2sOVw04eTf2YbymFsDDTGph15biwCx
	3USx7jt3tOKG976kZ1Slo5VNclu+p3PXLmjOyxUsq6AV0SHnrlDoNZBracKh6BZw
	JwjQAhJt4bOLa4hlCq6dI0SyxQ67T0Go+5AudDtK0O5c/9kWdJhLWBerue6zD/7q
	fk7lkfPbSLekJ9WLIAakR2/5aECfKR1bx9I6wXwEtu4k5UVK38l85GBBCAoztFno
	8ww03w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcng13x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 18:39:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2b0a75decso167917616d6.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 11:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747161544; x=1747766344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXN65qDcg0TnuJT/xzuzO/6MqpFg2S+kXLyRi1uWQXo=;
        b=UhQTZkVOJ0nLEoypCxBkkos+mbp/2ltKn/eej4xbpX2WfwBYLXMgN0W9mz3mzNvw4B
         ZvyykkGHm84D+vXDneSGvvWr/tgHOtQT+E/K7OI7/rEU5iwKHmxF5tigFq8d67ZYX4PL
         IG4+79RPaYvBd7uiPCdtwAijLDF350vphuEeeIKmJ3XEgQcy5/SKaW+uPD6Q4ZI6NyPu
         oxnU6mX66aBBlemG/LCqnypmxbp9yvKv1+Tm7FJryUfM9m9lZ7lvUu9KJBdxzf65/5up
         qphuj9jd7rXHkyOXlSzzl96F5MRnkioLJyppK2N0euVrQu/57CkapJ7D3oC1z3JpMDwo
         9MBw==
X-Forwarded-Encrypted: i=1; AJvYcCWwq4o4E/tRdCHwtyijUE+Y9U4R4f4le0kK++1Xf1cxT6uLmhQgaGRGTu1IytZqUoiT+6sJZrNnJ7Ef@vger.kernel.org
X-Gm-Message-State: AOJu0YxeSsLHsLTzVKJOwa6dYkP9rrn0ep2BBrFCSKs0ldM17VUfhmJr
	3tqu/btAKCu+Oe0dStxLjTK+g0amXGxNNg5eXXxKMXSS4ScvkzeYqbCaZQCytucToAAiK9aVFqt
	Mym6ABsAiNFpXPxEk9Jm3TS++c7XEmXMrpG3XCNs0ZpoYn/Sx3lTAggdPDB/U
X-Gm-Gg: ASbGncuNBTMwx7HgbEt4b2WDguKjV5dkEbW/iAL8K0bqFk+itz+5sF2H/91FJWdsDcy
	FltvRbThlZRAcZibF0AffeBKrnpUkJfCeXNOxvyr8wiVy0Txa9IAAAWqdlWgURmxDmx37hMU0ea
	0OhRTCB/U7EXGqz+mf5rAYdYCI3BY2jNlQqY/ikO//OJtUI7ermfPCJxzdSFj8DxSU9+GO38mFP
	cve/2hY4MKWZORiY+WQcYA460TA7cMsfKC55ATUc00XRC5i1cpYwtAqYbpfKqZiBot+ziqPd7wg
	tGlP+tT2b3fWuNfqMcIzOJ7z2xezVD9DCd7hK/dc4Ia4J3gn7GcgxqHIH3qSvFJ6H8X+II20T5J
	1WJkEeDBl3at5ul2/hRu8tyrM
X-Received: by 2002:a05:6214:29ce:b0:6e8:90eb:e591 with SMTP id 6a1803df08f44-6f896e56b1amr6889066d6.24.1747161543621;
        Tue, 13 May 2025 11:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv1eLu1Dq93MX8DLPhVNkQnzNfWT+qJFQMn1A1CvHy9lPL6Hy1fXb2mEWQw3TsN8pDynP2Tw==
X-Received: by 2002:a05:6214:29ce:b0:6e8:90eb:e591 with SMTP id 6a1803df08f44-6f896e56b1amr6888656d6.24.1747161543233;
        Tue, 13 May 2025 11:39:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33c12b7sm17383921fa.50.2025.05.13.11.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:39:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 May 2025 21:38:58 +0300
Subject: [PATCH v2 2/3] pinctrl: qcom: switch to
 devm_register_sys_off_handler()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-pinctrl-msm-fix-v2-2-249999af0fc1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3068;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ulXM6UtooOJcoFgLVDtqli1pFpfzRkUJPnnDkn4Hq8k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoI5HChnJKtCHeKwyOnDiVPwBAR9A0O8Cj7O54a
 LKwMMN1irSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCORwgAKCRCLPIo+Aiko
 1Rc1B/45VD2JUZbK9qjcqBCVk6LdO8nOheSxk3s+Zn+upiPaj3jebHbfTyAiDSceLj8+1dXonhS
 mLYOb9P2PwiXMSjY2pmbXbyjRHK/l8Swwv7LkuP04OTVAc4K2rN9HMud9HqjlZgQn1k/ejyPA5T
 VwyJR0N+B2ACpSwdXsbAYZkH12pzd0/1n3alx8QVpTS4aKC8wVOo1p5axqDFWKdvChDUEaf1fH4
 r5uZl09AwdRIcj4U4woVuhbLcbbadVxtr6chpDRLXpROHwGfiQz3//34Dmve8MAlbHzaL2w8Mup
 RnqBTvoSqvDFAbGz1NY+tYPdcPjnbZySih2Oy2Pu3csHCnTs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JSYnea4Ta0Uxn81WLvKOMS_XgAPWAkP-
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=682391c8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=AQMnIOBPTmT00GrUaA0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: JSYnea4Ta0Uxn81WLvKOMS_XgAPWAkP-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE3NyBTYWx0ZWRfXwWWplyfct5Eq
 ifAwf7jntJLa9LkzvaYXyL663LlFZV3b+X/NWY1RcOyKtOVBO2N8wmDr6KIfVZLxXhdmawtOn1d
 SKAa//cX5tgbrBko6Fem7zcTy3Xc6GH13vOKFRimXhp3dhXQebJnB0YWM5zhdFYa5mAI23pfnqX
 9lJ8hjN/yimgNO+U/YLYMWhqWervmEnjhNvI3M9TKI4aasa8QgYCkreGh0rlB3rikn8WN3n9KuY
 lRcANdKKFwzHy1qcKwnItAqcmJqf5lh9Wywpaa76AYvrZ3Wu5gtFa9ahwAB12xWpJ0RtiqVUcVV
 BTjUq7OC9HwvoTaClrruRRhx5T1i9a9XvkDH1g2DNKRsq2+78S/EjPOXX9huVOmDB9JBnuh5Y9a
 TB+gwRNUcft1fy8fdf7Q54hXvg/DxWBkwbLCt+1vgN1cdyXTywBAYPpNvMCV21JWdYtLbYfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505130177

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
index 9ec15ae4a104cbeb9a7d819b964d341f3bba58ea..f012ea88aa22ca3e184b05c39da9a1f7c2b3c74f 100644
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
 
@@ -1473,10 +1471,9 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
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
@@ -1487,7 +1484,11 @@ static struct msm_pinctrl *poweroff_pctrl;
 
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
@@ -1497,9 +1498,11 @@ static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
 
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
@@ -1601,8 +1604,6 @@ void msm_pinctrl_remove(struct platform_device *pdev)
 	struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&pctrl->chip);
-
-	unregister_restart_handler(&pctrl->restart_nb);
 }
 EXPORT_SYMBOL(msm_pinctrl_remove);
 

-- 
2.39.5


