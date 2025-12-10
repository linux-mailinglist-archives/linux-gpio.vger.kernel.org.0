Return-Path: <linux-gpio+bounces-29417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3E9CB2070
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 06:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D37E301B260
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 05:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D9B30F819;
	Wed, 10 Dec 2025 05:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wc0oh3hd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZtOys9pT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F712D47F4
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 05:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765345838; cv=none; b=AKoGGSkCZcX+kwG5aJX4xYaWnEWL2m5Pv65LjI99PqWyuWkoClM4Pqd5owcAVsp+gKCxq5kdaAuXrY1HXur1hytWJ4H5hnuriFmgDjULrXA5492Td6o89zF0lCT+EvXRkDDYclEX7+wwRHESoGVktjeIIlboA5K/k8phXCxz8i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765345838; c=relaxed/simple;
	bh=lcsyQf4UxPiCjXDI1KY/+xtK5CrD+Zf7CMDAWtKgq60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKKk91Lqf49IQbLgKxebOsUrXYLTTPBKgR0GBTaD2x5gRSoH+NUwkLy/C9Uv8IzNIMJ7uStQmTRQgfW4l9atjQ/rhrkiUdphVvrIQTnZ90KqUX9rdEeirPjkCvoBlA9QGtWjpdXypcXG12QtgKQ/qWFrdmWNYiV4rIUZ64P1oFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wc0oh3hd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZtOys9pT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3Lfrc1590451
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 05:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R5DGJ108mUbuVQqJ1QfznaNVSvccvTt3Lwa
	3uPob5to=; b=Wc0oh3hdwrC2b/df9Q3a1diVX6RzoxPQy/POpLLmxzJdyoZ+vhC
	LhDuDBU8JOODllZW9tnfANLvWLAfodUKe1CCZSRIDS4nPSIjaN1nwFJ+G7i+TEhX
	brd3IiqYkHgZ4WYoMavGIe4pzKauH3d/J41dFnJHn5L6qEftpHARiKyM/RJa4E2H
	+VmXBL9QclNw0ygkMpbOl2jVtmKDHdvC5vOz30c5vTBxI5gyv48mII3Qx6xC7don
	DXtFM6KgW/UAR1+mxcNbRwOSYDM8OFLKIme+2k2vXVetYRV4s7cMgOLA4jpbsxFd
	fz5R9ZRH7JJwVdFzn4iYtJPFCRk3rNJ7hTA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p2jtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 05:50:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29ea258c1d8so33440535ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Dec 2025 21:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765345834; x=1765950634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5DGJ108mUbuVQqJ1QfznaNVSvccvTt3Lwa3uPob5to=;
        b=ZtOys9pTjEaQy6H5mMnKj/5RUa6ynXO91GDWI5/s9WbF8s2FqY64DZRoGs3p1iVYjn
         r2oPm56ydcu9gXfoAotaOT+/C+CscsIugvsDipBCsE8hTAO0s2BVb9Iz2ozCDJhgG4Ud
         zyz7yEyW94swRRv+puORpChnGpyhzHN5Iz7xTL6fHmdu45ZEWsbyjjaiEW0SoLyXsJ5l
         JhIOGVpAsFUMgTGonr9No0/BfjrIj+kwgtp8ijQWFuwzL2jD3rGjvmsnZ6J70nd5geV5
         Uw82qvRvxuBleCmV8sIRiGXf5lVzOVkCqmiE7ctITUqy7V3+LmXaWF2VLrSy5sgG8XhE
         D+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765345834; x=1765950634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5DGJ108mUbuVQqJ1QfznaNVSvccvTt3Lwa3uPob5to=;
        b=vV4Be2RB+LjhIaUIWIFtfiQFOQ6AUt8Tu6LWZWPJmoLx449tEkE3YcmyWpKPXMo43S
         pCPOzs5KlmcGNbnzyArFl38VZonLW4Ht3kXl8DUQYgyt96aT+MIIBF8SCUzQD+BprR1k
         cp25SPf6nSa0eFERuEyajml65P36T4S0JpVRIdaLWR7Jv4exulRwEN/OcNJ3BaCoL265
         uRdDCabk04OpBcnSue+4vvsLtL7yJudInou045J4TRgIoDNvKrGsXMdI45IT0o2nk0br
         vQqWjweOcopOI/Go3/hIKV+Hz2ciREGuBx42cIOxdxCt0a9L6n8ohgAxJl+ziqw46EnL
         I+Rg==
X-Gm-Message-State: AOJu0YyynjSJEh+4XogO8DH1JafxNt5AxQxgb4bU3d6eVgT50OgGfDRD
	DapFHbvUxfNeOIQIXatIeaLAD/R5xRkTIygwqudPetqSVnGFIDCI3p8IHSbKP397YbnobPfg9xd
	Je5PPLcOZGDXW2q3TJASrWEpvd+IaSTa3yJ8fOPcnbSgUV+CnQ81BDtkktnmva/4/
X-Gm-Gg: AY/fxX564Jez58qrvUr/hR1uVq6ojniX0+JNUrlvtXZCUbQL5UYmL6aAxW6C3VRlQIj
	NWrdzHLI5sq7tA0bjEi6dYN5TCwg23yAroHiSKVcPEZINtK+PvJ+sBf6xyUn31u0Ksa+1nl+mjw
	/f4gmP1IKcIju8hadcKYp2RSrZqKKFvMvthNT6pwBUYm7CS8TwPFZ1Wwi0ZTlgq7pJ+n+6GJoNz
	rkqXj3UbzY1m/DgFxoC2jeldcLTtf0JSSPg3IYl4y3RmdONIwy9OV38W4INeU4k6qhwM999h2Z6
	2eK4LvqvcY/eVbr8IocPerYxlwef3FnGTT/LEbuR9z1I8ZDqiWO2D7+rI8/92zbwn0tQUPtJYfJ
	BJJI0CGH0Nmwhs9ZUATbjC/q6IRNM6Ht5laA8vdhA1tDf1BpmC1ZJgltJCxqAORO+
X-Received: by 2002:a17:902:f552:b0:290:c516:8c53 with SMTP id d9443c01a7336-29ec27cfdfamr13587995ad.40.1765345834244;
        Tue, 09 Dec 2025 21:50:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9Gy4kxqUR84QCilgEZJhdsj7xu6Yz8ywjB9TSaGSO564ifSvnEfdR7/zWtbXNDVj6RAIamw==
X-Received: by 2002:a17:902:f552:b0:290:c516:8c53 with SMTP id d9443c01a7336-29ec27cfdfamr13587835ad.40.1765345833828;
        Tue, 09 Dec 2025 21:50:33 -0800 (PST)
Received: from brgl-uxlite (p7838221-ipoefx.ipoe.ocn.ne.jp. [123.225.39.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29e4f15accfsm74305065ad.35.2025.12.09.21.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 21:50:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v2] gpio: it87: balance superio enter/exit calls in error path
Date: Wed, 10 Dec 2025 06:50:26 +0100
Message-ID: <20251210055026.23146-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6bhWjL_AiD58A3Iv7UQlUqn7MMxzQ7Qk
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=69390a2b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=cRv1ukX+bdz2y/k5ONU6nQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Sy5YQ2dlLMr9iM_hulIA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA0OCBTYWx0ZWRfXzoXGjnoGuTjd
 WhzjvX8lzY+j4XK/LYtHn2zCxqvavPSs4cfvuqjXekB5EZlCdbHPzz0S9szQNsKMKtyjXFpe9fu
 g1HU5h7/QDcG38mXsoZQ3WScdpqaceXwsgPOPkj10kBDqDNhFRy69dKpzjLZ8CBLqPolEpnFCpQ
 z+6wUrSpsJG8+1IcHS/VVaFRT1vP0GoGNLUeqNpPBpH3ONdSnfD054OfuNUMct81ikypWlV6IWz
 ajZcYq8aARzi3M7U26aibvcorAH1BUSFsLZ6d4YUy6ZaLYHzYL4CIfqFbmpsdrNgxNY26GavnMr
 QNiXMnE0/dNqn9CHLUVJKF718iXhdf7AkQ3H+gHZjffCgroLXlC0UeyW/D4HqCeA61pWij1YZ6c
 i2z7ocFYg8DJM732HxtB3sPAoQMv1w==
X-Proofpoint-GUID: 6bhWjL_AiD58A3Iv7UQlUqn7MMxzQ7Qk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100048

We always call superio_enter() in it87_gpio_direction_out() but only
call superio_exit() if the call to it87_gpio_set() succeeds. Move the
label to balance the calls in error path as well.

Fixes: ef877a159072 ("gpio: it87: use new line value setter callbacks")
Reported-by: Daniel Gibson <daniel@gibson.sh>
Closes: https://lore.kernel.org/all/bd0a00e3-9b8c-43e8-8772-e67b91f4c71e@gibson.sh/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- don't call superio_exit() if superio_enter() failed

 drivers/gpio/gpio-it87.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index 5d677bcfccf2..2ad3c239367b 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -12,6 +12,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -241,23 +242,17 @@ static int it87_gpio_direction_out(struct gpio_chip *chip,
 	mask = 1 << (gpio_num % 8);
 	group = (gpio_num / 8);
 
-	spin_lock(&it87_gpio->lock);
+	guard(spinlock)(&it87_gpio->lock);
 
 	rc = superio_enter();
 	if (rc)
-		goto exit;
+		return rc;
 
 	/* set the output enable bit */
 	superio_set_mask(mask, group + it87_gpio->output_base);
 
 	rc = it87_gpio_set(chip, gpio_num, val);
-	if (rc)
-		goto exit;
-
 	superio_exit();
-
-exit:
-	spin_unlock(&it87_gpio->lock);
 	return rc;
 }
 
-- 
2.51.0


