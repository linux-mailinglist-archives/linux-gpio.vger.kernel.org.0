Return-Path: <linux-gpio+bounces-34251-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JARJPtjxmm+JAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34251-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:03:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D747534309F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 236D330DAD23
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F343E4C84;
	Fri, 27 Mar 2026 10:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJhCHq21";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THwXaWlL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486D33E3DA3
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608568; cv=none; b=Xkiyh3pW95/kBIwJ8KwmdXCE+7BmwdS5WIB7GQ1x9kWNaH5lEwoXjTSI0OXGxIjx3vcBOIo+lW/GhZBPHL5aOM33k+a73tVi20UuJTPDJ78r0lklSKjr4JToL5Mw1+LANAG5QVc8rHpCvMraxQguBnAwEpqKNleqT29SxELu8ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608568; c=relaxed/simple;
	bh=Ep73WedrebpbKJnetklA1VzKV2HFZc7cQPWWzqC1Pkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SstNjc1MXxf5QCDDK8i9XkKBHfdR7MlucwhaRqABwBc5XvOWFGgg0QwrhqB9/8j1UkzFN65EXm/qe8FFHKlOIcnD6Brjo52IUD892jL2+QfE5svyAcdJqD6izxqRp98tgXpcV3yXWtfG0OsTzihFxghL27o2ihpEBdiaf4cL+HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJhCHq21; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THwXaWlL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w8O13132274
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gh4fJreUbVkURHW/Am6A36Xt5BQCzDlbaLC/dDBeH4=; b=dJhCHq217PK5i8xD
	0GTDLGoNgJe4UYeo6P+16u0nvsaPjUYSwkK09rEyTe2yK4ptv4XdkbJQBUfNrBAF
	Bg8BBXT7un1OzbFpEiKz7Xpvoxl4ogziHoZyaYvHUDIZ4hazbenxPdKmFsS661qK
	YZZMi2Kvr+PDzgkU0LC/zieCgoP7JBLqW2BnT38zey/BLZsfMHx3pTDLLLKyf5fv
	5DhTfAizhSUo/MnSJKhpqEumvT8vThCEs/f+3CapW+IKk9h4yHfoCFvff0FeSLdb
	uXueE0/fJQG0TR1Nn2QoR5mVCCIHZY5bwpa+7Eze2gVcTtLXiqHFptqBcl2dAhiB
	cC0frg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s434kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b52a2d70cso53346861cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 03:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774608566; x=1775213366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gh4fJreUbVkURHW/Am6A36Xt5BQCzDlbaLC/dDBeH4=;
        b=THwXaWlL7yKcW8o1XlVSCULtVy4aFeSWf/qdZnO9+cdBY0/GQhozrKPzZCxwx2okLz
         mmus6e2AdRsQLVDHm0vcx3row7LG3K9FTEbMZs6RHdHz/nWJANBRQ+i1vJZakqE0kcRK
         mjmxK4HFhf0hyjcQ+MhpJfEy5I7R2yNnTPPXXoj3VmQg/XJe3KNQtC+g5cMZhyl7U0Gk
         m4Ibq0y8ba1gTGpRK4m2+0dAbkqbWwCFpndafDigGLYRKGXjNDOcaAhgWuu1EwRYAk4w
         aplROvIsmnlkzmC8bZ1MFaNsaWi+WMEh5BoLUgPLjYDGQVXHnvBe2Zv0iaAVaqcBzp/d
         s9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774608566; x=1775213366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3gh4fJreUbVkURHW/Am6A36Xt5BQCzDlbaLC/dDBeH4=;
        b=drorVHoEIs5hlDfOf1sulpV29SMG97NFZzNt7tptnHs/bYD9rEYfGJ9FSvO35a72oE
         uBv5KqDV0Y9/jerpiYW/6qT8er5wXkymffUJRbVPo5e2eSZt6KagpDHlei3PMFe6uqVl
         77aYlHmN1s+KnO2dNW6H9FwtRUvyuRmN6Xdhh+QgsgKBHo3u/+dw7xKqZtGz/PvJTS+K
         hp590HHf3kZa401OKLj4bC2B+XScm3W8k5ygOfj9kwbtnh1Tj/QrntdJZvGE+/tbl7d5
         hp4gh63SwvJb8XZR2AngB5e3FCYoyh2p+EXS8WnL5iwtvOqkbF9zwblfMEgdp2PRKsc7
         rtNA==
X-Forwarded-Encrypted: i=1; AJvYcCUkjbNnSjicWcH8QEy/UhoLrfY7MilB4E9etYRUXEab20o43KghJ9gs8Mx3msR8oDe0w4xog9M11aia@vger.kernel.org
X-Gm-Message-State: AOJu0YzNwjTYYRRv6TavOCofwRTbG3MOg8t0FCAujng11XyXjh2X6zCs
	rx7Sf0BW8DwA4HVMwB/xJ8NALG1LPI671LvEKziPJVKKtu462kQ+XSGv2tgyW1GSLm+AxO8Cy63
	jfYBQ3vUSSQac9PsMpNZfqpXtXdQrmYEdcw1NODr8oYeQIdGArA680InQJT+F6Niy
X-Gm-Gg: ATEYQzyX6vJcZXma/DdlJpyXNzITIhKwT1ji9nfbrN9dZjEETejatikXk9IBeKykkXI
	9eI7yYMlGmrbUL5EJ12cw3bSi2onJ31n3R0ob03QEFItyTtTE9QykxNHSlUT7RguRtu6weNJ7yQ
	+TxYSmoJEsdqJkCjrZ46YrOL0Y7GMmhbB+EhKCpY6FMJsm99mkXcRBChrMA2vT6hRrV/Xzk8Us7
	H6ZFx9KPnJB75FnZnOL0PFr8gijAnwsFCKdmlkcQaNY9BRw9WTGcUJqbWZHvslSrpwMnAjb5mfB
	ZG9Ulm51jAWXGtEZ2C8NRRS9nFcBqnzb57W1UIGJQv3iXqS06RV5g1Y0RKObUMAu8xzs6n3vnK+
	NEjh8SO/4VIcXHzax8GfuvRnP7kqtT1LKgJwXg9/8mSUNivEmJVQ=
X-Received: by 2002:a05:622a:215:b0:50b:4be1:7c95 with SMTP id d75a77b69052e-50ba3874520mr23200251cf.30.1774608565586;
        Fri, 27 Mar 2026 03:49:25 -0700 (PDT)
X-Received: by 2002:a05:622a:215:b0:50b:4be1:7c95 with SMTP id d75a77b69052e-50ba3874520mr23200021cf.30.1774608565186;
        Fri, 27 Mar 2026 03:49:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:94ec:a3a:baff:9151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e5f0sm14989445f8f.4.2026.03.27.03.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:49:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:49:09 +0100
Subject: [PATCH v3 3/4] gpio: timberdale: use device properties
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-gpio-timberdale-swnode-v3-3-9a1bc1b2b124@oss.qualcomm.com>
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
In-Reply-To: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2948;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ep73WedrebpbKJnetklA1VzKV2HFZc7cQPWWzqC1Pkg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxmCrMewKL3a7HaCH5yH5xN5btCwSdGah5379h
 PavOv/zMniJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacZgqwAKCRAFnS7L/zaE
 w80iD/49UWD8QLaOpsw83Cd+CIinyErFkj5e5Lor8pXv8StI5JwEiX97lB/+KfAhKvZktE1A9T9
 gVIx4T3T1mAhovcHpqUBWE356KoWA072Xax88DLLLWKKWKKiBxVkCtlyRJ+8zzMRYJ8/di8gBK9
 +VEEuQOeF3qlUv3v1Vxyovx7W9FV8T80DVJPZCk4SQN1BFz8WXPEXVBbgX72Q6kMGlqAABxPBMj
 SKS4nE7gFpkQehmWbSrDYfLyExUISAZnXcl1uUN0UVzGAjsiRnimYn3rye77b59GBRZGxslZVr0
 wKJ0Ekzy4pglGt++lPYnzsqeWV+QCAqELo6lxRilp0lHyXqT7/cHldrKQ6r3OpGBaK4c5quS4UF
 +KHlvrUvNA69TRDQa2qdSPYhX7Ry4V6c/YAzNoR8sojYdaKDbB1GXDG7GVIbXW14DtscK+2Wokn
 TGCr37X0dXrH2Ts6iUPQWk+nB3VownOykeTO/xt0mfy2HixZuSk/OhvznKSFsAvYwvtVAuSV0ao
 WuJcrYgb5lRGIvEzU+USRQHAVKhubef0fi22eek0eUn4/FvsGONAj+4d5T6yAphOLT+8ApT24fX
 Fsscr3dv6XPGe2jrX/mwM7CG4DmIo3Aa+zI8uSkgqbBitUw2H8EKkc/U4ehFID1gxezuCdCbrCO
 Wc3GmJfYs1bqMKg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: X9PCAfnr3frPeU6XjlaUThT2LWjz4l6M
X-Proofpoint-GUID: X9PCAfnr3frPeU6XjlaUThT2LWjz4l6M
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c660b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8x3tX-5dUG4wHQunnKcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfX11jh2oS3gZXo
 ZkVa53bJWbtsX+RCzkR6ok1xNMTha7sLV9TKnwdTY0i6H3LVd5D8C2wM8RzIHecYNPkWJVJcGGe
 qZNSVVmZdmVZYNpL4qDTKxdcsGCPWVugUqyXUWFtFAa4iXWdy91zIB8cunjp7OwXNMd8zH7mVK1
 yoIsVx7Z5jm3/m4uDWHz8iwjCC7MJCVWqH6qqdzHcV9CrjVpYdiHO5fIPpcki9hCwUyH5e9o6b0
 4EUhypu1OF4ejyruiBRNIiv5o1mH1EPpz28idH2uEzNTClFyDF7knkNA7dr+yvwsj/bjEUT40F5
 kPVCYNky6LQBkHtlcmuRBgzevWlLI0rfaFW1mOf5d2MeI39WIFb7gZgF6h2g2GLpVpo/SKvlWIb
 M+rLGMba9vYE29i62R2/ovsjreww7mWjWy1uLobKNSfEc85tRW1LcbfZofhTl0310jjECnalejw
 vZ6toswUxmq8Al3qpuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,intel.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34251-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D747534309F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The top-level MFD driver now passes the device properties to the GPIO
cell via the software node. Use generic device property accessors and
stop using platform data. We can ignore the "ngpios" property here now
as it will be retrieved internally by GPIO core.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-timberdale.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index f488939dd00a8a7f332d3af27962a38a3b7e6ecf..78fe133f5d32350567c28a1cc982d7bb3183ff2b 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -14,7 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/irq.h>
 #include <linux/io.h>
-#include <linux/timb_gpio.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
 
@@ -225,19 +224,21 @@ static int timbgpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_chip *gc;
 	struct timbgpio *tgpio;
-	struct timbgpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	int irq = platform_get_irq(pdev, 0);
 
-	if (!pdata || pdata->nr_pins > 32) {
-		dev_err(dev, "Invalid platform data\n");
-		return -EINVAL;
-	}
-
 	tgpio = devm_kzalloc(dev, sizeof(*tgpio), GFP_KERNEL);
 	if (!tgpio)
 		return -EINVAL;
 
-	tgpio->irq_base = pdata->irq_base;
+	gc = &tgpio->gpio;
+
+	err = device_property_read_u32(dev, "irq-base", &tgpio->irq_base);
+	if (err)
+		return err;
+
+	err = device_property_read_u32(dev, "gpio-base", &gc->base);
+	if (err)
+		return err;
 
 	spin_lock_init(&tgpio->lock);
 
@@ -245,8 +246,6 @@ static int timbgpio_probe(struct platform_device *pdev)
 	if (IS_ERR(tgpio->membase))
 		return PTR_ERR(tgpio->membase);
 
-	gc = &tgpio->gpio;
-
 	gc->label = dev_name(&pdev->dev);
 	gc->owner = THIS_MODULE;
 	gc->parent = &pdev->dev;
@@ -256,21 +255,22 @@ static int timbgpio_probe(struct platform_device *pdev)
 	gc->set = timbgpio_gpio_set;
 	gc->to_irq = (irq >= 0 && tgpio->irq_base > 0) ? timbgpio_to_irq : NULL;
 	gc->dbg_show = NULL;
-	gc->base = pdata->gpio_base;
-	gc->ngpio = pdata->nr_pins;
 	gc->can_sleep = false;
 
 	err = devm_gpiochip_add_data(&pdev->dev, gc, tgpio);
 	if (err)
 		return err;
 
+	if (gc->ngpio > 32)
+		return dev_err_probe(dev, -EINVAL, "Invalid number of pins\n");
+
 	/* make sure to disable interrupts */
 	iowrite32(0x0, tgpio->membase + TGPIO_IER);
 
 	if (irq < 0 || tgpio->irq_base <= 0)
 		return 0;
 
-	for (i = 0; i < pdata->nr_pins; i++) {
+	for (i = 0; i < gc->ngpio; i++) {
 		irq_set_chip_and_handler(tgpio->irq_base + i,
 			&timbgpio_irqchip, handle_simple_irq);
 		irq_set_chip_data(tgpio->irq_base + i, tgpio);

-- 
2.47.3


