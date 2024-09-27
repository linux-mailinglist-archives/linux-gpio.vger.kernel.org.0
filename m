Return-Path: <linux-gpio+bounces-10530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1468988B38
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 22:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47389B20D61
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F351C2DD5;
	Fri, 27 Sep 2024 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RK+zxniG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84511C2325;
	Fri, 27 Sep 2024 20:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727468874; cv=none; b=iIY/jgxm1izMrbSiQ3dnfNXWCQ84f0yvucFchfcFIxrd8u8p7zXHk1kZ3xBJb9ccqkn39oUUYSU3xbNmjkX4hzBMQMRiKMasNQYG+ulYLlXPlx0lZvztcH2YIyINbnkQQbdrjPaeynXsvpucXlD2Ymg0AbN21m80ztdX8Lmhsxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727468874; c=relaxed/simple;
	bh=Gx+F40nhTJgZsr3vg096lZ8Hgm7zvwdGk7H5aNedxfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gQ4u7JJWJHhE31wD4IgaVrFN0dzqCKpbl2KaoGoR8yhOff7lnWPY7lNbKEBYtIQyzSQ5xnzHbVDionFtHsrpdpDiUR+j/dCarj68U4TsxntgWR0qjrzNK+4FgP3LQBr1hAHPp3hjjwjzLticOPB8MEHJMnhcsoCbBqPQ7FSIU/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RK+zxniG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48REZUmp001917;
	Fri, 27 Sep 2024 20:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:list-id:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=lcG+MR0GVz0lcteCkPBfG0yQwl3LXds8hSBrgaMx4O8=; b=RK
	+zxniG2kpZSvMhOJpJD1K5RxjEvj1pLULrvBhsXog+gRxya2S75nY+4py6cty1Yb
	+viykrIkAPntD4rkvtIpQxTZUWscGnc0JltpIFqiXnJWS87p9tOsLgGBImnF+1fB
	TB6aQ1vFEfUT3M4UcafYxoriq0SmREup6Eh2t5DkpLBkTlIaJseR1wML8sd10N5H
	lQphhPl75yL5n99yVHuvzTNKomxWvlMgSVsIyCZt5YwuGI9sqSHDBlI0uMVKuCe4
	zFA3T73p/hfNreMxh0heUgHMzBhk0yYJ82ijcSbKucQmUgaIorNo9NhMBLWRjLO2
	9j8NnA0948wmrV3jxRGg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnmj9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 20:27:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48RKRltS009739;
	Fri, 27 Sep 2024 20:27:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41sq7ms5r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 20:27:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48RKRkU2009734;
	Fri, 27 Sep 2024 20:27:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48RKRkQU009733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 20:27:46 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 361C7586; Sat, 28 Sep 2024 01:57:45 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: quic_mojha@quicinc.com, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinmux: Use sequential access to access desc->pinmux data
Date: Sat, 28 Sep 2024 01:57:41 +0530
Message-ID: <20240927174206.602651-1-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240927174206.602651-1-quic_mojha@quicinc.com>
References: <20240927174206.602651-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Pqr9cbKE2pb6QEkER7EoJasirDXUsXgm
X-Proofpoint-GUID: Pqr9cbKE2pb6QEkER7EoJasirDXUsXgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270150

From: Mukesh Ojha <quic_mojha@quicinc.com>

When two client of the same gpio call pinctrl_select_state() for the
same functionality, we are seeing NULL pointer issue while accessing
desc->mux_owner.

Let's say two processes A, B executing in pin_request() for the same pin
and process A updates the desc->mux_usecount but not yet updated the
desc->mux_owner while process B see the desc->mux_usecount which got
updated by A path and further executes strcmp and while accessing
desc->mux_owner it crashes with NULL pointer.

Serialize the access to mux related setting with a spin lock.

	cpu0 (process A)			cpu1(process B)

pinctrl_select_state() {		  pinctrl_select_state() {
  pin_request() {				pin_request() {
  ...
						 ....
    } else {
         desc->mux_usecount++;
    						desc->mux_usecount && strcmp(desc->mux_owner, owner)) {

         if (desc->mux_usecount > 1)
               return 0;
         desc->mux_owner = owner;

  }						}

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
Changes in v2:
 - Used scoped_guard and renamed lock name as per suggestion from Linus.W .

 drivers/pinctrl/core.c   |   3 +
 drivers/pinctrl/core.h   |   2 +
 drivers/pinctrl/pinmux.c | 150 +++++++++++++++++++++------------------
 3 files changed, 86 insertions(+), 69 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 4061890a1748..b00911421cf5 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -220,6 +220,9 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 
 	/* Set owner */
 	pindesc->pctldev = pctldev;
+#ifdef CONFIG_PINMUX
+	spin_lock_init(&pindesc->mux_lock);
+#endif
 
 	/* Copy basic pin info */
 	if (pin->name) {
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 4e07707d2435..179e01dfacc2 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -12,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/radix-tree.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 #include <linux/pinctrl/machine.h>
@@ -177,6 +178,7 @@ struct pin_desc {
 	const char *mux_owner;
 	const struct pinctrl_setting_mux *mux_setting;
 	const char *gpio_owner;
+	spinlock_t mux_lock;
 #endif
 };
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 02033ea1c643..e4d535aabbb6 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -14,6 +14,7 @@
 
 #include <linux/array_size.h>
 #include <linux/ctype.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -127,29 +128,31 @@ static int pin_request(struct pinctrl_dev *pctldev,
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
-	if ((!gpio_range || ops->strict) &&
-	    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
-		dev_err(pctldev->dev,
-			"pin %s already requested by %s; cannot claim for %s\n",
-			desc->name, desc->mux_owner, owner);
-		goto out;
-	}
+	scoped_guard(spinlock_irqsave, &desc->mux_lock) {
> Any reason to use spinlock_irqsave and not mutex ? If spinlock is needed
> can we guard only the mux variables and exclude the printk
> as the same lock is used with pin_show API too.

> Moreover, is the mux_usecount variable in pinmux_can_be_used_for_gpio()
> needed guarding ?
+		if ((!gpio_range || ops->strict) &&
+		     desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
+			dev_err(pctldev->dev,
+				"pin %s already requested by %s; cannot claim for %s\n",
+				desc->name, desc->mux_owner, owner);
+			goto out;
+		}
 
-	if ((gpio_range || ops->strict) && desc->gpio_owner) {
-		dev_err(pctldev->dev,
-			"pin %s already requested by %s; cannot claim for %s\n",
-			desc->name, desc->gpio_owner, owner);
-		goto out;
-	}
+		if ((gpio_range || ops->strict) && desc->gpio_owner) {
+			dev_err(pctldev->dev,
+				"pin %s already requested by %s; cannot claim for %s\n",
+				desc->name, desc->gpio_owner, owner);
+			goto out;
+		}
 
-	if (gpio_range) {
-		desc->gpio_owner = owner;
-	} else {
-		desc->mux_usecount++;
-		if (desc->mux_usecount > 1)
-			return 0;
+		if (gpio_range) {
+			desc->gpio_owner = owner;
+		} else {
+			desc->mux_usecount++;
+			if (desc->mux_usecount > 1)
+				return 0;
 
-		desc->mux_owner = owner;
+			desc->mux_owner = owner;
+		}
 	}
 
 	/* Let each pin increase references to this module */
@@ -178,12 +181,14 @@ static int pin_request(struct pinctrl_dev *pctldev,
 
 out_free_pin:
 	if (status) {
-		if (gpio_range) {
-			desc->gpio_owner = NULL;
-		} else {
-			desc->mux_usecount--;
-			if (!desc->mux_usecount)
-				desc->mux_owner = NULL;
+		scoped_guard(spinlock_irqsave, &desc->mux_lock) {
+			if (gpio_range) {
+				desc->gpio_owner = NULL;
+			} else {
+				desc->mux_usecount--;
+				if (!desc->mux_usecount)
+					desc->mux_owner = NULL;
+			}
 		}
 	}
 out:
@@ -223,11 +228,13 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 		/*
 		 * A pin should not be freed more times than allocated.
 		 */
-		if (WARN_ON(!desc->mux_usecount))
-			return NULL;
-		desc->mux_usecount--;
-		if (desc->mux_usecount)
-			return NULL;
+		scoped_guard(spinlock_irqsave, &desc->mux_lock) {
+			if (WARN_ON(!desc->mux_usecount))
+				return NULL;
+			desc->mux_usecount--;
+			if (desc->mux_usecount)
+				return NULL;
+		}
 	}
 
 	/*
@@ -239,13 +246,15 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 	else if (ops->free)
 		ops->free(pctldev, pin);
 
-	if (gpio_range) {
-		owner = desc->gpio_owner;
-		desc->gpio_owner = NULL;
-	} else {
-		owner = desc->mux_owner;
-		desc->mux_owner = NULL;
-		desc->mux_setting = NULL;
+	scoped_guard(spinlock_irqsave, &desc->mux_lock) {
+		if (gpio_range) {
+			owner = desc->gpio_owner;
+			desc->gpio_owner = NULL;
+		} else {
+			owner = desc->mux_owner;
+			desc->mux_owner = NULL;
+			desc->mux_setting = NULL;
+		}
 	}
 
 	module_put(pctldev->owner);
@@ -608,40 +617,43 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 		if (desc == NULL)
 			continue;
 
-		if (desc->mux_owner &&
-		    !strcmp(desc->mux_owner, pinctrl_dev_get_name(pctldev)))
-			is_hog = true;
-
-		if (pmxops->strict) {
-			if (desc->mux_owner)
-				seq_printf(s, "pin %d (%s): device %s%s",
-					   pin, desc->name, desc->mux_owner,
+		scoped_guard(spinlock_irqsave, &desc->mux_lock) {
+			if (desc->mux_owner &&
+			    !strcmp(desc->mux_owner, pinctrl_dev_get_name(pctldev)))
+				is_hog = true;
+
+			if (pmxops->strict) {
+				if (desc->mux_owner)
+					seq_printf(s, "pin %d (%s): device %s%s",
+						   pin, desc->name, desc->mux_owner,
+						   is_hog ? " (HOG)" : "");
+				else if (desc->gpio_owner)
+					seq_printf(s, "pin %d (%s): GPIO %s",
+						   pin, desc->name, desc->gpio_owner);
+				else
+					seq_printf(s, "pin %d (%s): UNCLAIMED",
+						   pin, desc->name);
+			} else {
+				/* For non-strict controllers */
+				seq_printf(s, "pin %d (%s): %s %s%s", pin, desc->name,
+					   desc->mux_owner ? desc->mux_owner
+					   : "(MUX UNCLAIMED)",
+					   desc->gpio_owner ? desc->gpio_owner
+					   : "(GPIO UNCLAIMED)",
 					   is_hog ? " (HOG)" : "");
-			else if (desc->gpio_owner)
-				seq_printf(s, "pin %d (%s): GPIO %s",
-					   pin, desc->name, desc->gpio_owner);
+			}
+
+			/* If mux: print function+group claiming the pin */
+			if (desc->mux_setting)
+				seq_printf(s, " function %s group %s\n",
+					   pmxops->get_function_name(pctldev,
+						desc->mux_setting->func),
+					   pctlops->get_group_name(pctldev,
+						desc->mux_setting->group));
 			else
-				seq_printf(s, "pin %d (%s): UNCLAIMED",
-					   pin, desc->name);
-		} else {
-			/* For non-strict controllers */
-			seq_printf(s, "pin %d (%s): %s %s%s", pin, desc->name,
-				   desc->mux_owner ? desc->mux_owner
-				   : "(MUX UNCLAIMED)",
-				   desc->gpio_owner ? desc->gpio_owner
-				   : "(GPIO UNCLAIMED)",
-				   is_hog ? " (HOG)" : "");
-		}
+				seq_putc(s, '\n');
 
-		/* If mux: print function+group claiming the pin */
-		if (desc->mux_setting)
-			seq_printf(s, " function %s group %s\n",
-				   pmxops->get_function_name(pctldev,
-					desc->mux_setting->func),
-				   pctlops->get_group_name(pctldev,
-					desc->mux_setting->group));
-		else
-			seq_putc(s, '\n');
+		}
> Since we are introducing a lock, do we need to guard mux-settings too ?
 	}
 
 	mutex_unlock(&pctldev->mutex);

-- 
2.34.1



