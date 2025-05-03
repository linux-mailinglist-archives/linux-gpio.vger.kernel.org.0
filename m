Return-Path: <linux-gpio+bounces-19569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3354AA7E8F
	for <lists+linux-gpio@lfdr.de>; Sat,  3 May 2025 07:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F9504667D3
	for <lists+linux-gpio@lfdr.de>; Sat,  3 May 2025 05:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842C61A0BE0;
	Sat,  3 May 2025 05:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1vDQ/Mz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BE919D890
	for <linux-gpio@vger.kernel.org>; Sat,  3 May 2025 05:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250337; cv=none; b=ni0xCJedLDswVTR9ugEJz7yihNVrneYHhtXQf4O3Ad3LLGf+/Hsn1csfqo7cXKIZYtB0zXAe32/c2+tahO29jveSX0PStGx2RgdcDpSZakcuuJIk+N41Hq8By8m5EIYpJ827A95J78zqBZeUFDQoqMZBwr4OclOOtajMDNWzHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250337; c=relaxed/simple;
	bh=hhqwCX+CfMbW8a8LTyK1HCQvR2viDSbpyfZaXTz9FJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RU2omcdkPJVtokRmKepNoy4LkpxnMK9n2u63ROX3ZoxZJRxtUSeIFOAg3G5zAUbR1H/jiHHNanA2/PkI5URIE0bf3lW2D27XuCg50MuBQ+a0al9MSf2RSajnLk8Yv1K8Kgr7YrnP5oUWzLSXqd+yrHOPH3sHTxP1Zs1RQ5a6la4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1vDQ/Mz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434e4qR004767
	for <linux-gpio@vger.kernel.org>; Sat, 3 May 2025 05:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8rkPsKVUOAdzLtjw7eKW3hTPB+u82BaHGf8QxHqusYQ=; b=p1vDQ/MzSjshaKDu
	PAfTB4gEjG5TjZvowwkA/zBQcu0JutLeqKkyYCIakx+vrLLWTLqKw6EnPpr+Deau
	/uyrI44GoG2uhNOj9T1ov0azxfHoHx5ZVZfVz9r5kmlUKxdNlisyn0YIi/B7Y49V
	T8OkEVEAV47NqMrtWWUR5tA1DG8Fn81NK9+ZGRgh9U1z0FQEllO8IDm+0GOeK7VX
	ZiY773f4TZYwaqEddTqQN5xdN54nMNaLzpxhQVHtMmxxv62O3KsYCOqgVxZJDEPZ
	XrEPQ67i++2zyCOk8f/Gts3bU6Uj4aRVldAUqku7p1z0qyPkfM9DfzG3W6SA4Xyd
	lr+5+A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakg1u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 03 May 2025 05:32:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4767348e239so56725531cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 22:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250333; x=1746855133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rkPsKVUOAdzLtjw7eKW3hTPB+u82BaHGf8QxHqusYQ=;
        b=oi2wivDiGpqj1JT6nQeQyU6iAX9oy8j3QiNLDnyLwHbDA/u9PxrdtH6oyDK2FHdub4
         DwiedE42DB80A+QiMIml42B4L+63UvGMfWt3o6khkehQ4VZryzmm5wmDNmTHDtpd8yJk
         YxmK6SN2oSR1BBT/+8aRZSaX3qpTmw3/CrwudVzhA8SJItB8z/9hSIBgfyvpQN9WKFQs
         Z5hl6fZ4rQ1rvi5+NxJJKHl2rwqLAhJFA1F26DWcyvPCGwkFZxUL3GU8YesMrSbu/Qp/
         XivXjlHKIRRrHkxxLwoc5oWvym1uIDzbK0GX03djU0+ttf/+7Jn0qR/Oi/426wFtF4Xv
         1gxA==
X-Forwarded-Encrypted: i=1; AJvYcCVzASVmRPbavYs1/1G3er/5VRo1lbj5JhlmbAnUsUXbO0i/OQb1lby+expCEmIgRVk3m+YCeLwowzff@vger.kernel.org
X-Gm-Message-State: AOJu0YzVUVAUEJ3hGwk5ydQATaYYhvomrZRkAJg28qdRQnCzOA6a9Xk4
	SirGezzKwGTlQJv+JqgpFwxgxK5gJOa6iCdCJi1AQhTc4OsLmmWREBo3ywT+ZvkRhFUtXhbFgwi
	M4FNjp5/bs04HyWbiPcLwrefas5f6yjUmdGiLalXEt2+p7Er3EleBGwv6oDXb
X-Gm-Gg: ASbGncttHFy6IEqvcC0KWbDnbNbWGNuvbQGVWufBINFVyVE4g/shsu4v2EFZFnZmjAB
	WgfVhTEiFlhf2dSV2wMUQpRhMQIAazgPOkANJB6twEbATPfH/lr1jGOeYfS8unMHJqvzWPWF6qm
	5MhVuTmLqmeezQX0/cnxw17pgUPDknvzVgBsnm8P5OT6RrSV9/hz+WVNc8KrMf5lFTIAnfLjWHV
	jFT3/C0GlitKm2FKoY3DhJrjoroUZvXpIrthRGARud1GzL4BNSkscswS/6jLi16tI8341OJWS+C
	a9UuQ1TGGjY1AOn6l6UD9LRwzxXI4ORdptod0/TnAZA0YW9aNPchP1GXnapATe+yCc+Tq+9Nvx4
	/erc0ZrznGfKy47aXbnuZiKiO
X-Received: by 2002:a05:622a:406:b0:489:6869:5e54 with SMTP id d75a77b69052e-48d5dd6a2e4mr24660661cf.44.1746250333261;
        Fri, 02 May 2025 22:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnyIobiBcsKCXEIsgtb9OEiGQsSvvsQAtZOu7djNaXxrToq7E3Ypb6qrxXb4kavSHUd2bxSg==
X-Received: by 2002:a05:622a:406:b0:489:6869:5e54 with SMTP id d75a77b69052e-48d5dd6a2e4mr24660391cf.44.1746250332919;
        Fri, 02 May 2025 22:32:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017cc0sm6165841fa.39.2025.05.02.22.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:32:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 08:32:06 +0300
Subject: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3418;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hhqwCX+CfMbW8a8LTyK1HCQvR2viDSbpyfZaXTz9FJc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFapXsLBlrBwW87bgV39H64nz7f2YaR5Kcl/wy
 dPKRA+DYSCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBWqVwAKCRCLPIo+Aiko
 1QWTB/9HNZ8pyztcrM0SZVqWDoPJtc50Rb9jCcAKuqMXypKMYcbosAkdL5vG8FhM1nQ4ddPAnzS
 oXr7yZWkTfRNTBpSR8z5gXAbit/DlEdknLe074bwqXpTB+wl7s33YELwUYxLFNE3W/NYUOH98++
 kuzpgdtpge7xiXa6aljBmlYIa4IuAc2OpoKcVJhA9PVoc77Xm8wKiX5DYTlUDVaHhO2bhZNEWGy
 Q7BI/PIrsXAVl0MZnI44Rn503p78LM3OKPYPN5cTpV7j67KsrrvOgQXFNuPt2qxKNNv338Yx9z0
 gURIizPJEhZH0jWY3g0H9aJ2SqST92gvzb+jGFLU/sWsBTx7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NCBTYWx0ZWRfXzRUmAG6EWiBf
 0IRu9Sb84BuMsCbjcgYUbPZh0TognMHgDWJXCKoOa4ldtOQJlZxuZ8Y7Pk0Z6kRWimb2nbXU0j6
 pVHWET61sdwc1wgL5J4CEt9i1luL/aLyZg98U/J7yGigx87Opv9Ny1xHh8AjmiCxWpFmvrkTbG1
 lnPXYDvXRUcxm1Aa83W1Tu/zKBQ7z8XlhofYKG+9eClcvPoCKDPC+0KEd8VasdT5t+X0nj7mhss
 j2kthY+aiM4fqYeGTed37juMQ74b2Cm99WiXfqycsPmiQ9hRiFvrg1LJwSBtwVml9hIVrA4s2x4
 qFeaOzoL3CypDDumb7J/nHVSlGJQAps6aSpLb/tobKVl79DAT+YW8uEGdRl6+Qrxqq7rKk0EitT
 198wXqsSFxTqwRf2KV1p2eSQBuZ4HRUQ+AVYVEn+Cb/WYgL9XhvujPoQWouyDHP0id7xIgSa
X-Proofpoint-ORIG-GUID: MDxCyOK56VGvnPpLID_xEYL5Uh43BKEG
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6815aa5e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=F7q04jUIKJRoJ265B_sA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: MDxCyOK56VGvnPpLID_xEYL5Uh43BKEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030044

On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
valid_mask from direct assignments") gpiochip_line_is_valid() uses
gc->gpiodev, which is NULL when GPIO hog pins are being processed.
Thus after this commit using GPIO hogs causes the following crash. In
order to fix this, verify that gpiochip->gpiodev is not NULL.

Note: it is not possible to reorder calls (e.g. by calling
msm_gpio_init() before pinctrl registration or by splitting
pinctrl_register() into _and_init() and pinctrl_enable() and calling the
latter function after msm_gpio_init()) because GPIO chip registration
would fail with EPROBE_DEFER if pinctrl is not enabled at the time of
registration.

pc : gpiochip_line_is_valid+0x4/0x28
lr : msm_pinmux_request+0x24/0x40
sp : ffff8000808eb870
x29: ffff8000808eb870 x28: 0000000000000000 x27: 0000000000000000
x26: 0000000000000000 x25: ffff726240f9d040 x24: 0000000000000000
x23: ffff7262438c0510 x22: 0000000000000080 x21: ffff726243ea7000
x20: ffffab13f2c4e698 x19: 0000000000000080 x18: 00000000ffffffff
x17: ffff726242ba6000 x16: 0000000000000100 x15: 0000000000000028
x14: 0000000000000000 x13: 0000000000002948 x12: 0000000000000003
x11: 0000000000000078 x10: 0000000000002948 x9 : ffffab13f50eb5e8
x8 : 0000000003ecb21b x7 : 000000000000002d x6 : 0000000000000b68
x5 : 0000007fffffffff x4 : ffffab13f52f84a8 x3 : ffff8000808eb804
x2 : ffffab13f1de8190 x1 : 0000000000000080 x0 : 0000000000000000
Call trace:
 gpiochip_line_is_valid+0x4/0x28 (P)
 pin_request+0x208/0x2c0
 pinmux_enable_setting+0xa0/0x2e0
 pinctrl_commit_state+0x150/0x26c
 pinctrl_enable+0x6c/0x2a4
 pinctrl_register+0x3c/0xb0
 devm_pinctrl_register+0x58/0xa0
 msm_pinctrl_probe+0x2a8/0x584
 sdm845_pinctrl_probe+0x20/0x88
 platform_probe+0x68/0xc0
 really_probe+0xbc/0x298
 __driver_probe_device+0x78/0x12c
 driver_probe_device+0x3c/0x160
 __device_attach_driver+0xb8/0x138
 bus_for_each_drv+0x84/0xe0
 __device_attach+0x9c/0x188
 device_initial_probe+0x14/0x20
 bus_probe_device+0xac/0xb0
 deferred_probe_work_func+0x8c/0xc8
 process_one_work+0x208/0x5e8
 worker_thread+0x1b4/0x35c
 kthread+0x144/0x220
 ret_from_fork+0x10/0x20
Code: b5fffba0 17fffff2 9432ec27 f9400400 (f9428800)

Fixes: 8015443e24e7 ("gpio: Hide valid_mask from direct assignments")
Reported-by: Doug Anderson <dianders@chromium.org>
Closes: https://lore.kernel.org/r/CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 9ec15ae4a104cbeb9a7d819b964d341f3bba58ea..a99275f3c4a66a39f4d9318fe918101127ef4487 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -149,6 +149,13 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
 	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	struct gpio_chip *chip = &pctrl->chip;
 
+	/*
+	 * hog pins are requested before registering GPIO chip, don't crash in
+	 * gpiochip_line_is_valid().
+	 */
+	if (!chip->gpiodev)
+		return 0;
+
 	return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
 }
 

-- 
2.39.5


