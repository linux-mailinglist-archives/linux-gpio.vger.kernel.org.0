Return-Path: <linux-gpio+bounces-21942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 942B3AE2049
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 18:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D3676A0390
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 16:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0E42E6D15;
	Fri, 20 Jun 2025 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a32g3JZd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D894728C864
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 16:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750437840; cv=none; b=ODNr6OS8aW+22274mQXxmRE4YbbYZ4CH1yHP+pjnp8u5yKb1e4QhSTuiXph4GpYcosOW9TdHXO1rdVwmhzVManINL56ShAmGuNVyk4TWnlFe4t2BASOFR5eymF3g7WOPKcBpAQdIzLKxOY+LEeP/Kh6jGRoW63Wj9Bt/aRio9xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750437840; c=relaxed/simple;
	bh=0EVbeZfTsrFJAs+fr1YOAKUVFiNAZHXZYc7YeBvgxJY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L5hhi31ecpDx0TDzeyIg2b6+rQgrJKfVxT/lBY/8UWXNhTTlC2tu0cEkPTTcSNjiiJ6Rc0cWiA1zvJS2rhix2tlUqzRw10f0qWTDiORMTo/A3ipGaOZih52OaGbWexXJvWq/SIn3P0yIeuO2aXBHHrkqAIe3d2fuMbmWvw5WoPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a32g3JZd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KG2Q6K009011
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 16:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xuEtKw7CVCzY7rX/A/xyoVgknCTtkl+u8Ne
	wJyyFkL0=; b=a32g3JZdmtZ7HgruRhHyloY0BtIP7txAXMeGc328069AO5u68dp
	4pO/s8182d+JHKc9QZoL+xqSsaXXypI4zrf+Ehch+N1PZUdDx9x7OEZYCyuwszol
	qaNVpd3ogAsfZlQUoKqYWZsXCl8VeORlDxk+yp62LxRCge1cSP+quurQfimUEgOy
	Wdm7oMvsFq9xuzCATJcD56m9KmxOfmeJ19eiRyl7ZbVFNHOjE0WrthwRCkLiNS1T
	U9PEM9de/aju61emu0olGlCz7/qP5jXksor5XuQF9lprZJy9XxZjhD49kmoZVe/7
	vCB0oV9xencAggRhS/+iNlaIyJ0m6cAmvpg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47date03kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 16:43:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7489d1f5e9fso2461349b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 09:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750437835; x=1751042635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuEtKw7CVCzY7rX/A/xyoVgknCTtkl+u8NewJyyFkL0=;
        b=JtaW+Bk4TMTDrGZCzXotRN7TUg8oyT7QNS4xq0UEX1L2NA8CtI7gGRGNhGTvsaHO32
         4YVJviFKR/vpPildHle7iM3PUguQBclkY43+kTPw1npGYYPLOH8lbCre2j5eFmZJ6QPb
         J954BPO3ldbirBvDjOw9yhhD/wMM6xxO0jIdTzORH+hfp6axgB5sUIP3vzLuWlhlZic2
         E6IUsHxXQNNuMoHHi2VD+JoULafumQPn4RPRTXccWA4vUP9fa9XROMdnNyeMqyjCpe7K
         RytoHLoVprd5s+rENex3HT1nC2v+48TMx45bTMaVqy8OrY788k0I/1aldndEI8/xszxW
         ceSg==
X-Gm-Message-State: AOJu0YzT9kwzg9I8sWIJGBM3yMzPPrDkptlw8mARGzwzh1OVBb8+Dr/k
	6asRBzyThGnTw2hwYwBs5n2n20KC41R+84XYVIS+z7xDcUCbciBFzxvLUWWE9jHxt2UIWJlwvI6
	4piQv3cwY+glW/AKTM6dYunuUS0nzyyHB4/zQEW28UiCDD/BueWbWvuKQcI5v4A8Q5K+fKsD+
X-Gm-Gg: ASbGncvUm3gqRL6S1HkCW1bVvKUcngYuremnUpfVkMhKVrS6vUWuYfQCMtG5GIiTwNm
	VBeoT/Uo1bOn2K9PtYjyqzZK/Jt7aDgQIQ6mmyku1Kstqvnr0KTQru3lTzKqa4kKaouxj+NRO/T
	vzXe2L1vNr25poQ6PjezhYjryRofTAC6ssjp1D38U7aAqJnqbUj2MR+J6Dzl7GGZIVbYEKQfzi/
	G7eUqSGCy4zSNKQw5oUSpHd8gVPuVK0pn23ijyAy2oJoQa40AIxqiGb8g/pyykmqppefSnPlXC/
	HiFxwdR6uNONUoIVJ1cAYWK2kp84TuRw4rGg4Z5ZWLB4ybUEQw==
X-Received: by 2002:a05:6a00:2789:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7490d6089e3mr4881805b3a.13.1750437835184;
        Fri, 20 Jun 2025 09:43:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+mlnNp+NYv/5F3VQSUkNQ13bw4oYCkNCD2zEFLoQeeMCUK09WXH/1bwz8n1x/AWHoK21U8A==
X-Received: by 2002:a05:6a00:2789:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7490d6089e3mr4881763b3a.13.1750437834662;
        Fri, 20 Jun 2025 09:43:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6490c9sm2386919b3a.110.2025.06.20.09.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 09:43:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] pinmux: fix race causing mux_owner NULL with active mux_usecount
Date: Fri, 20 Jun 2025 22:13:24 +0530
Message-Id: <20250620164324.3616153-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExOCBTYWx0ZWRfX2OYqMuUym4Hn
 RYpB7MSF7wyfS9zz5guwlhhGjMVN8eEDfQo6F+D/fgDaQb83qsHuiVztc3zDR+pL6k0glw4U4Wo
 yRAS+ZOmGbiNWfIDFk23oTHmU/q9l55dFgaBgMo9TLaEF8kODb9JtHrh7HmU8XJw0g9eNKbRQCm
 koIDzXergkJz9UxuJj6mxLiZ8tcfaNLu6tOla+ad20nR5ZOnVOET2ByC2s0Ga5oxqwKR8ENfbEp
 Yi+gXt3XMSGA64IjQHfExLypwJLirhgJtWYsE+vGT8TeSLek67uln1O8Zm1QtU+63kTSnV2Hzgb
 JRzkkk7dXXnfgnQ49rs8L6n+ocWHK7Jl5ij/mS+c5zG+VuqnN31SMo5ZAIk2INPt+W13dmIOxWc
 lgARkc9/JuXswdOZqnT0GNrPTjtJYHU1t8kBd61gPlAHxfFA8ZczI+cqGsqR7O2GmuEkooU3
X-Proofpoint-GUID: kB4Lcz_Ul5DUCLoPViqwVu7ejIVHFVQo
X-Authority-Analysis: v=2.4 cv=DO6P4zNb c=1 sm=1 tr=0 ts=68558fcc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=PkRvFfspCsMwYezBOQkA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: kB4Lcz_Ul5DUCLoPViqwVu7ejIVHFVQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1011 suspectscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200118

Commit  ("pinmux: Use sequential access to access desc->pinmux data")
tried to address the issue when two client of the same gpio calls
pinctrl_select_state() for the same functionality, was resulting in
NULL pointer issue while accessing desc->mux_owner. However, issue
was not completely fixed due to the way it was handled and it can
still result in the same NULL pointer.

The issue occurs due to the following interleaving:

     cpu0 (process A)                   cpu1 (process B)

      pin_request() {                   pin_free() {

                                         mutex_lock()
                                         desc->mux_usecount--; //becomes 0
                                         ..
                                         mutex_unlock()

  mutex_lock(desc->mux)
  desc->mux_usecount++; // becomes 1
  desc->mux_owner = owner;
  mutex_unlock(desc->mux)

                                         mutex_lock(desc->mux)
                                         desc->mux_owner = NULL;
                                         mutex_unlock(desc->mux)

This sequence leads to a state where the pin appears to be in use
(`mux_usecount == 1`) but has no owner (`mux_owner == NULL`), which can
cause NULL pointer on next pin_request on the same pin.

Ensure that updates to mux_usecount and mux_owner are performed
atomically under the same lock. Only clear mux_owner when mux_usecount
reaches zero and no new owner has been assigned.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/pinctrl/pinmux.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 0743190da59e..1cea04d57ca2 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -235,19 +235,9 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 			desc->mux_usecount--;
 			if (desc->mux_usecount)
 				return NULL;
-		}
-	}
 
-	/*
-	 * If there is no kind of request function for the pin we just assume
-	 * we got it by default and proceed.
-	 */
-	if (gpio_range && ops->gpio_disable_free)
-		ops->gpio_disable_free(pctldev, gpio_range, pin);
-	else if (ops->free)
-		ops->free(pctldev, pin);
+		}
 
-	scoped_guard(mutex, &desc->mux_lock) {
 		if (gpio_range) {
 			owner = desc->gpio_owner;
 			desc->gpio_owner = NULL;
@@ -258,6 +248,15 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 		}
 	}
 
+	/*
+	 * If there is no kind of request function for the pin we just assume
+	 * we got it by default and proceed.
+	 */
+	if (gpio_range && ops->gpio_disable_free)
+		ops->gpio_disable_free(pctldev, gpio_range, pin);
+	else if (ops->free)
+		ops->free(pctldev, pin);
+
 	module_put(pctldev->owner);
 
 	return owner;
-- 
2.34.1


