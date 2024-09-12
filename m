Return-Path: <linux-gpio+bounces-10001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AB6976BEB
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 16:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16DA91F28323
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 14:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923EE1AD9CB;
	Thu, 12 Sep 2024 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o76bNaYT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749E12209B;
	Thu, 12 Sep 2024 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726151121; cv=none; b=fduLQf7++7PCmEvZBNyQZEE09gTiH4eFlkDFuhiZ+7TD9c1dt4GVOJqYGOf2LdzALTCTvS0RDIrMSbXtt9t8Lf4h+rXh82mW9eYTniNSUHSY2Dn4eqEr9SDFFYmhWr4O1sSdrUaDPWdz24A6e7WnzZwVgPid9TdXGo6jUNT9q3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726151121; c=relaxed/simple;
	bh=LjwN1XGE8xpKec16AGnLn9xRA7evSuVcud+uclGTJ1k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N7ez+ApfvWZKqn49aCQ1y7k93iQqDnMPlIlKH+VBHJQgRUgvkVKA0fFOINypq67dx84DfUBTErxWBKX+8LEm+nfbGZfmj/7zvedijNMPPCCNHfvtV2zz1r843Kpulr+/bLIa3l8defu+7bRBhwDH1AvN7rGJoqeMIfaWKmsHYfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o76bNaYT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CEFgLd029223;
	Thu, 12 Sep 2024 14:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Gco7ZympUogi7IQbtDrnSe
	9raLsgbqzeGl5rY3Bg1ZA=; b=o76bNaYTOnzoKsxKtUQoOft2k0hmRMlCg8dKtv
	7he8h5iOptycP7qqaaICJ9ZP10Gh3GIuFLOxOMKa7+W/mDj9Q/jkvjEyqMhjah8i
	JPXriuKKW7dSCbn+44tSxMYABlHPgkP2Y+rmsaaZyZ/OWDqe6KlzHa/AoPovIUWL
	jlaQcdwuq7p+UDRuP9paGgqNArcalzjSI+/9yeq3HqCz9q35of4Y8ma0VnIGOjul
	VdMCXNmuto1u6eaHVqEsBUWo00FDlP0yi4oVNI6PvMeioD5lcfU45yAlqwD4lDY5
	bcM1mN2tQsNQJSvqCPCs5HoBi/jtmP8bHijuwzTOzuFLwaPw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy8p5k8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 14:25:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48CEPGVT027466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 14:25:16 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Sep 2024 07:25:14 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mukesh Ojha
	<quic_mojha@quicinc.com>
Subject: [RFC PATCH] pinmux: Use sequential access to access desc->pinmux data
Date: Thu, 12 Sep 2024 19:54:47 +0530
Message-ID: <20240912142447.981590-1-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W0mCjWnrbvBKlZt1AOesDLV_H0JePLmS
X-Proofpoint-ORIG-GUID: W0mCjWnrbvBKlZt1AOesDLV_H0JePLmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120105

When two client of the same gpio call pinctrl_select_state() for the
same functionality, we are seeing NULL pointer issue while accessing
desc->mux_owner.

Let's say two processes A, B executing in pin_request() for the same pin
and process A updates the desc->mux_usecount but not yet updated the
desc->mux_owner while process B see the desc->mux_usecount which got
updated by A path and further executes strcmp and while accessing
desc->mux_owner it crashes with NULL pointer.

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
 drivers/pinctrl/core.c   |  3 +++
 drivers/pinctrl/core.h   |  2 ++
 drivers/pinctrl/pinmux.c | 21 +++++++++++++++++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 314ab93d7691..e451af82eff2 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -220,6 +220,9 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 
 	/* Set owner */
 	pindesc->pctldev = pctldev;
+#ifdef CONFIG_PINMUX
+	spin_lock_init(&pindesc->lock);
+#endif
 
 	/* Copy basic pin info */
 	if (pin->name) {
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 4e07707d2435..afc651ce3985 100644
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
+	spinlock_t lock;
 #endif
 };
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index aae71a37219b..75735618646d 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -115,6 +115,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
 	int status = -EINVAL;
+	unsigned long flags;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -127,6 +128,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
+	spin_lock_irqsave(&desc->lock, flags);
 	if ((!gpio_range || ops->strict) &&
 	    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
 		dev_err(pctldev->dev,
@@ -151,6 +153,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
 
 		desc->mux_owner = owner;
 	}
+	spin_unlock_irqrestore(&desc->lock, flags);
 
 	/* Let each pin increase references to this module */
 	if (!try_module_get(pctldev->owner)) {
@@ -178,6 +181,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
 
 out_free_pin:
 	if (status) {
+		spin_lock_irqsave(&desc->lock, flags);
 		if (gpio_range) {
 			desc->gpio_owner = NULL;
 		} else {
@@ -185,6 +189,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
 			if (!desc->mux_usecount)
 				desc->mux_owner = NULL;
 		}
+		spin_unlock_irqrestore(&desc->lock, flags);
 	}
 out:
 	if (status)
@@ -211,6 +216,7 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
 	struct pin_desc *desc;
 	const char *owner;
+	unsigned long flags;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -223,11 +229,13 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 		/*
 		 * A pin should not be freed more times than allocated.
 		 */
+		spin_lock_irqsave(&desc->lock, flags);
 		if (WARN_ON(!desc->mux_usecount))
-			return NULL;
+			goto out;
 		desc->mux_usecount--;
 		if (desc->mux_usecount)
-			return NULL;
+			goto out;
+		spin_unlock_irqrestore(&desc->lock, flags);
 	}
 
 	/*
@@ -239,6 +247,7 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 	else if (ops->free)
 		ops->free(pctldev, pin);
 
+	spin_lock_irqsave(&desc->lock, flags);
 	if (gpio_range) {
 		owner = desc->gpio_owner;
 		desc->gpio_owner = NULL;
@@ -247,10 +256,14 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 		desc->mux_owner = NULL;
 		desc->mux_setting = NULL;
 	}
+	spin_unlock_irqrestore(&desc->lock, flags);
 
 	module_put(pctldev->owner);
 
 	return owner;
+out:
+	spin_unlock_irqrestore(&desc->lock, flags);
+	return NULL;
 }
 
 /**
@@ -586,6 +599,7 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
 	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
 	unsigned int i, pin;
+	unsigned long flags;
 
 	if (!pmxops)
 		return 0;
@@ -611,6 +625,7 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 		if (desc == NULL)
 			continue;
 
+		spin_lock_irqsave(&desc->lock, flags);
 		if (desc->mux_owner &&
 		    !strcmp(desc->mux_owner, pinctrl_dev_get_name(pctldev)))
 			is_hog = true;
@@ -645,6 +660,8 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 					desc->mux_setting->group));
 		else
 			seq_putc(s, '\n');
+
+		spin_unlock_irqrestore(&desc->lock, flags);
 	}
 
 	mutex_unlock(&pctldev->mutex);
-- 
2.34.1


