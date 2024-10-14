Return-Path: <linux-gpio+bounces-11312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3711099D77C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 21:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ADC11C21AB3
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 19:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94BA1CC143;
	Mon, 14 Oct 2024 19:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aCWmSaCW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7871BD01F;
	Mon, 14 Oct 2024 19:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728934199; cv=none; b=MTsDIbVCeDk2i5Bn/SRR9wgEI5WYIVmmX7kueFvoaFeY/R/k4jHGgs6135/D67r0bM5p4vM4Nuv2ttCM2WHc1FIWNSvzoR74vyG8ICCH7F48//FuKD2PaaIyVqf7Gqkj/JtMgGe7E3fT2wuHzoAR7D0FMt6juqY0DOHMyckM3ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728934199; c=relaxed/simple;
	bh=IIc1taoQbO8/4lHIqvAxM5YIybXgrfDk1GH2JcKwalc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uUzRRimZ+Ztl9oq4Qbsvh6mVueqqSPyiAYJkvezmgLmJL92cZPb7HL+Vbf7fronGmNrq33huQpEeb1rD9w5MjQ79nhtHxuyY2TocK1DjHpLKpilFnfFOBvjYC9ysmQMPH3RXTUUNmG8NFgP1g+6QQ2YjX9OID4v3NXNZRSxKFnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aCWmSaCW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EAFuio011572;
	Mon, 14 Oct 2024 19:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tephfjupl5FlMaTSdIzxef
	Us/LaQXuNP5qmw5NzOUts=; b=aCWmSaCW+jfT769vJPOS0rekh/sVrS2vOdnQ3n
	NUERPB+vyyOc41ogC9hOYzVB0Ftmg06V6bLZxbl2G2npOdUNmXTt8KLZXYmFXmtO
	UEGIlIG0jiCPrtKGDCDQBWWrFekPVwhTwNYitvpKQ0lV1PTOFhZr9SIGljTQ8/1i
	esr5uN5mpxyMS3FA+UwMoqG8I5ijKshlkCAD6mSxyzdlIBKtv3+f20DXM+2IuQPi
	nm34cakcNfqQOSqSvJW5/7RDI14uRrNJntGTitEDTHjrXKHwXjARydXR8D+VrxQq
	GntE8riH04TM4ag806y9YXXFuVF3d0tSbzOzKS8K2viDW4MQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g45dgc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 19:29:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EJTsPg018865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 19:29:54 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 12:29:52 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mukesh Ojha
	<quic_mojha@quicinc.com>
Subject: [PATCH v3] pinmux: Use sequential access to access desc->pinmux data
Date: Tue, 15 Oct 2024 00:59:30 +0530
Message-ID: <20241014192930.1539673-1-quic_mojha@quicinc.com>
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
X-Proofpoint-GUID: BUy4u_6cgAE9GxCewcbHKQ8caA6byKEk
X-Proofpoint-ORIG-GUID: BUy4u_6cgAE9GxCewcbHKQ8caA6byKEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140138

When two client of the same gpio call pinctrl_select_state() for the
same functionality, we are seeing NULL pointer issue while accessing
desc->mux_owner.

Let's say two processes A, B executing in pin_request() for the same pin
and process A updates the desc->mux_usecount but not yet updated the
desc->mux_owner while process B see the desc->mux_usecount which got
updated by A path and further executes strcmp and while accessing
desc->mux_owner it crashes with NULL pointer.

Serialize the access to mux related setting with a mutex lock.

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
Changes in v3:
 - Used mutex instead of spinlock as per comment from Wasim.
 - Covered one more function pinmux_can_be_used_for_gpio() where
   the lock should be taken as mux->setting is being accessed
   as per comment from Wasim.

Changes in v2:
 - Used scoped_guard and renamed lock name as per suggestion from Linus.W .

 drivers/pinctrl/core.c   |   3 +
 drivers/pinctrl/core.h   |   1 +
 drivers/pinctrl/pinmux.c | 173 ++++++++++++++++++++++-----------------
 3 files changed, 100 insertions(+), 77 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 4061890a1748..b3eec63c00ba 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -220,6 +220,9 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 
 	/* Set owner */
 	pindesc->pctldev = pctldev;
+#ifdef CONFIG_PINMUX
+	mutex_init(&pindesc->mux_lock);
+#endif
 
 	/* Copy basic pin info */
 	if (pin->name) {
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 4e07707d2435..d6c24978e708 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -177,6 +177,7 @@ struct pin_desc {
 	const char *mux_owner;
 	const struct pinctrl_setting_mux *mux_setting;
 	const char *gpio_owner;
+	struct mutex mux_lock;
 #endif
 };
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 02033ea1c643..0743190da59e 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -14,6 +14,7 @@
 
 #include <linux/array_size.h>
 #include <linux/ctype.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -93,6 +94,7 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 	if (!desc || !ops)
 		return true;
 
+	guard(mutex)(&desc->mux_lock);
 	if (ops->strict && desc->mux_usecount)
 		return false;
 
@@ -127,29 +129,31 @@ static int pin_request(struct pinctrl_dev *pctldev,
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
-	if ((!gpio_range || ops->strict) &&
-	    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
-		dev_err(pctldev->dev,
-			"pin %s already requested by %s; cannot claim for %s\n",
-			desc->name, desc->mux_owner, owner);
-		goto out;
-	}
+	scoped_guard(mutex, &desc->mux_lock) {
+		if ((!gpio_range || ops->strict) &&
+		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
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
@@ -178,12 +182,14 @@ static int pin_request(struct pinctrl_dev *pctldev,
 
 out_free_pin:
 	if (status) {
-		if (gpio_range) {
-			desc->gpio_owner = NULL;
-		} else {
-			desc->mux_usecount--;
-			if (!desc->mux_usecount)
-				desc->mux_owner = NULL;
+		scoped_guard(mutex, &desc->mux_lock) {
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
@@ -219,15 +225,17 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 		return NULL;
 	}
 
-	if (!gpio_range) {
-		/*
-		 * A pin should not be freed more times than allocated.
-		 */
-		if (WARN_ON(!desc->mux_usecount))
-			return NULL;
-		desc->mux_usecount--;
-		if (desc->mux_usecount)
-			return NULL;
+	scoped_guard(mutex, &desc->mux_lock) {
+		if (!gpio_range) {
+			/*
+			 * A pin should not be freed more times than allocated.
+			 */
+			if (WARN_ON(!desc->mux_usecount))
+				return NULL;
+			desc->mux_usecount--;
+			if (desc->mux_usecount)
+				return NULL;
+		}
 	}
 
 	/*
@@ -239,13 +247,15 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 	else if (ops->free)
 		ops->free(pctldev, pin);
 
-	if (gpio_range) {
-		owner = desc->gpio_owner;
-		desc->gpio_owner = NULL;
-	} else {
-		owner = desc->mux_owner;
-		desc->mux_owner = NULL;
-		desc->mux_setting = NULL;
+	scoped_guard(mutex, &desc->mux_lock) {
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
@@ -458,7 +468,8 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 				 pins[i]);
 			continue;
 		}
-		desc->mux_setting = &(setting->data.mux);
+		scoped_guard(mutex, &desc->mux_lock)
+			desc->mux_setting = &(setting->data.mux);
 	}
 
 	ret = ops->set_mux(pctldev, setting->data.mux.func,
@@ -472,8 +483,10 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 err_set_mux:
 	for (i = 0; i < num_pins; i++) {
 		desc = pin_desc_get(pctldev, pins[i]);
-		if (desc)
-			desc->mux_setting = NULL;
+		if (desc) {
+			scoped_guard(mutex, &desc->mux_lock)
+				desc->mux_setting = NULL;
+		}
 	}
 err_pin_request:
 	/* On error release all taken pins */
@@ -492,6 +505,7 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 	unsigned int num_pins = 0;
 	int i;
 	struct pin_desc *desc;
+	bool is_equal;
 
 	if (pctlops->get_group_pins)
 		ret = pctlops->get_group_pins(pctldev, setting->data.mux.group,
@@ -517,7 +531,10 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 				 pins[i]);
 			continue;
 		}
-		if (desc->mux_setting == &(setting->data.mux)) {
+		scoped_guard(mutex, &desc->mux_lock)
+			is_equal = (desc->mux_setting == &(setting->data.mux));
+
+		if (is_equal) {
 			pin_free(pctldev, pins[i], NULL);
 		} else {
 			const char *gname;
@@ -608,40 +625,42 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
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
+		scoped_guard(mutex, &desc->mux_lock) {
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
+				seq_putc(s, '\n');
 		}
-
-		/* If mux: print function+group claiming the pin */
-		if (desc->mux_setting)
-			seq_printf(s, " function %s group %s\n",
-				   pmxops->get_function_name(pctldev,
-					desc->mux_setting->func),
-				   pctlops->get_group_name(pctldev,
-					desc->mux_setting->group));
-		else
-			seq_putc(s, '\n');
 	}
 
 	mutex_unlock(&pctldev->mutex);
-- 
2.34.1


