Return-Path: <linux-gpio+bounces-31634-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF3zNxrXjWng7wAAu9opvQ
	(envelope-from <linux-gpio+bounces-31634-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 14:35:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3B12DD7D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 14:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13DFF300D086
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 13:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E07B35B64D;
	Thu, 12 Feb 2026 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUPMhkJP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4eE6hNx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4F72EBB8C
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770903316; cv=none; b=cI4kuSj9lO2Qg7dDFIDQHX74HXIMQO4ACjV02ufho6MjscPKCVf/aaRlHZFAHbtpW9QLBUTtCaKYbnhVeJWlgnLb2JyUf8fHvJQ6ljtSR02UM1Tazo9izDN+wk5uCBoXQaUgUFkxpT+6V/qHxOnnzRyIiHfBFm9+/JwkWhJQpws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770903316; c=relaxed/simple;
	bh=sOHPdiJV+WLttVq0TcWdwDT9t1CZym6vgPjhtivZVu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lFM1nDwNlcmjGrxTiwQBhlsDBKJyTCZEVPhnjbrSUDFOagEpQtsaQt6YEv5UqE/3bUeCVMBpfsDfftGznT4MrJ+RONbWpBJ9ueBFJNgTYJv6Dpu8b3L/JwfFLJD/Ao0ejuMK++luPJTQDBQ+EB66+wzmFmPf/xIPWv04JOzDSi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUPMhkJP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4eE6hNx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRec11074132
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 13:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qc2iAQ+caoPq5hxORFy3jvGkJgIpRAmga3z
	vPX/0hw0=; b=EUPMhkJPds9LD5o0sDkNpcwGNoHtEplWSL7Be1W6vLaHwRXyGgR
	vwgpdvdSPPell5j100AYvXGnc8G2+cLQfye5WIDSlLjKGUAjatGnWM+ya7pJ+0Z1
	wLlbc3ovIkitatTqeMurCFWH6huFmIdZJDkk3IL9k2di0kIFnfbs9DkhGSLWYfcW
	krJY/og3PygaCPrxNUFR75vukhwRDUzr+P+BxaBAVj3oXssNc2oGfCDGn7ZG63H5
	lbrsCow/089epv/Eqw9JcF5hsVdGxk5rs00KoS6GrsADMVfUSP1em5yoOfQh4+X5
	wPNZG0T8g9nZQD/qPkg3sZh9t12qlT5vgAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8nu525-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 13:35:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a129cd2so90304485a.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 05:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770903313; x=1771508113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc2iAQ+caoPq5hxORFy3jvGkJgIpRAmga3zvPX/0hw0=;
        b=e4eE6hNxDhrdDyPwVEkkkkLBe+G8iw2IjPrKY8PEAOEgLjrLy/7LG1zNetHnH5voSw
         dcFd0gp7vNhyMkTfKsQXPu8d04KzWAdsvT2IxAfJoH0OWRm/GC7ZIMZhemRaeZfp/RAZ
         BY5+PtzfUbUHJbfXxrVRsApLgjjdaJSzGegBbhOCrLgXLLNcDCadh2l3/RFU9fj05+tu
         3WBZIejtUNrMEMHhdnHkXYDzeiqe1kU2ZfLd62TT8tA7ou+yl/rKzYZjMorjDNb16r6+
         MqNoLuykE73TAMz3SzBq5MoW/g1Qa1oGg31u73MYkw/dAwjwYoMM3Fq9nQpa6uSDI6RM
         O2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770903313; x=1771508113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc2iAQ+caoPq5hxORFy3jvGkJgIpRAmga3zvPX/0hw0=;
        b=uysdjCj7kEEHNU3kZqbF6liWVPV8jgbW3D3yk1L8YUVqsourPRz87VshsCRbHTD+f5
         3VZVK+JRh6ZIa93v2u0se2z/xTRBOZZwm3vBDfxUf+6Jj+YziObTjR0c7DRpcDLJAtIP
         rKaUZegAsWbcgmrgIKSiw/RPpHJJBrAXa1kpycIezPP6/xZkQcUJbqiy164FGtMD9AQJ
         WcYQ5sz2g40Q21E2yYTlXgvQ5CIvDKlZFzoWoDiLmQJm5hz764BBilyZDeKou7YkMrbN
         xRdpDou987kvGZK2FaCzY6INuNLR2rRdCOSt94ow4mofnHcNe4yN17isJjKQLjSTFxny
         e1Rg==
X-Gm-Message-State: AOJu0Yx4mnSmGwRhIwa6h0uO3Wj21XzksrKOLYOxgd3hvF5pHxuJbCNr
	xGo4CHA0qea0LxjdXEqLv5uT/L84NjCsZXK5eUoF3VzAZkwE77oo+vADvHE5Uz5y01zYJrhGi9C
	ZG5ilakPSrTYekXsOmQU1epor/SpqEasWKLFs5wWVkRZsOCFIBlVpgbImfuaGHijp9/RmhnB3
X-Gm-Gg: AZuq6aL7gOmDsi9NkMJ3yujKXvV6A12ymCzaOvOyrV6gaS/wGuyUsZPLTImrHDY/JaF
	ys8L/t6jvFo6OBqTboKYMSk1GfgxjES80wCBHQG74zHUkROFgYTL9Vj365UTVOVLqiPp/vPDtCI
	n/+PIAtncd2022nu3UvkixXqR7CMezlo69Dtr/NCMTIRHCj696/k05n7oYSH7PqXve65r1l4RPz
	4KHq1s5xdm5yxwQnDFts63HUgjlW4YDIJQmJzwq/Ykx/ANSEijCyDrXg0rqWG2e+wL71uSYUYY1
	EyuDf/bzJfKe+/LWnkdTN56vrdSUqci8oDFkSPrfGRLBZSJ0pkN7vIvH7KYo68zBvgvRbmcJEiH
	zlUw3tTn4t0Rb+YJZxoQH2oFrtte0I9pv0Zb9hHb5iRksmtqBS1s=
X-Received: by 2002:a05:620a:4588:b0:8a0:7561:93c7 with SMTP id af79cd13be357-8cb33b957e0mr305571685a.17.1770903313259;
        Thu, 12 Feb 2026 05:35:13 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:8a0:7561:93c7 with SMTP id af79cd13be357-8cb33b957e0mr305567085a.17.1770903312749;
        Thu, 12 Feb 2026 05:35:12 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ed37:7547:7b8b:6eb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3ceb1d6esm1805043a12.2.2026.02.12.05.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 05:35:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] gpio: sysfs: fix chip removal with GPIOs exported over sysfs
Date: Thu, 12 Feb 2026 14:35:05 +0100
Message-ID: <20260212133505.81516-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEwMSBTYWx0ZWRfX+zOxN5OVd4Be
 0WxRwBQuKZZtA21uWrDNTp1LvDahN42rVathJaJ5+XORqkVIO0HDs/gcxDe7VfwrEaKsVB0lROV
 sWURg8LXbvEcUFzyA+mfryc0HA11kEidvS0KUiPyKcs/5yLkgL/GvXNBBvNLOwwGfhXvtQRabkl
 87UhxW7O78872qRQgtC5jA7nirbkE7EDiVAQH607Ex2SxF49o7girK1KrOTiRI7eKOqufPqf+9h
 RoVNk3hRz/dmUyRO/Pcn5XIRPxym24CfmLi4BA2DohkPAhxcq7TynMV4laXBpOgIDuz8MCoFMsV
 /DlAHIVXGFDT5BtS3jOiqTwH1NuoCNvtt9ZS385y2+ml965G0fG6JWpF9nEqMk+6rMlfjtrefMF
 sUxuyiVsZGdUt4AvAIxT0dtdR3WEH7KanSodYF3n0kbpbB1NgSJor/PTzTmQFt7nFGnuBYaUt2f
 Drhhi/X4OrWgiIzguFw==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698dd712 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CjzyuubHxb_HZ2d6ovcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XXEjLT3khO4QWX9JdKh1liA1gyjTMvaf
X-Proofpoint-ORIG-GUID: XXEjLT3khO4QWX9JdKh1liA1gyjTMvaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31634-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02C3B12DD7D
X-Rspamd-Action: no action

Currently if we export a GPIO over sysfs and unbind the parent GPIO
controller, the exported attribute will remain under /sys/class/gpio
because once we remove the parent device, we can no longer associate the
descriptor with it in gpiod_unexport() and never drop the final
reference.

Rework the teardown code: provide an unlocked variant of
gpiod_unexport() and remove all exported GPIOs with the sysfs_lock taken
before unregistering the parent device itself. This is done to prevent
any new exports happening before we unregister the device completely.

Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-sysfs.c | 106 ++++++++++++++++++-----------------
 1 file changed, 55 insertions(+), 51 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index cd553acf3055e..d4a46a0a37d8f 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -919,63 +919,68 @@ int gpiod_export_link(struct device *dev, const char *name,
 }
 EXPORT_SYMBOL_GPL(gpiod_export_link);
 
-/**
- * gpiod_unexport - reverse effect of gpiod_export()
- * @desc: GPIO to make unavailable
- *
- * This is implicit on gpiod_free().
- */
-void gpiod_unexport(struct gpio_desc *desc)
+static void gpiod_unexport_unlocked(struct gpio_desc *desc)
 {
 	struct gpiod_data *tmp, *desc_data = NULL;
 	struct gpiodev_data *gdev_data;
 	struct gpio_device *gdev;
 
-	if (!desc) {
-		pr_warn("%s: invalid GPIO\n", __func__);
+	if (!test_bit(GPIOD_FLAG_EXPORT, &desc->flags))
 		return;
-	}
 
-	scoped_guard(mutex, &sysfs_lock) {
-		if (!test_bit(GPIOD_FLAG_EXPORT, &desc->flags))
-			return;
-
-		gdev = gpiod_to_gpio_device(desc);
-		gdev_data = gdev_get_data(gdev);
-		if (!gdev_data)
-			return;
+	gdev = gpiod_to_gpio_device(desc);
+	gdev_data = gdev_get_data(gdev);
+	if (!gdev_data)
+		return;
 
-		list_for_each_entry(tmp, &gdev_data->exported_lines, list) {
-			if (gpiod_is_equal(desc, tmp->desc)) {
-				desc_data = tmp;
-				break;
-			}
+	list_for_each_entry(tmp, &gdev_data->exported_lines, list) {
+		if (gpiod_is_equal(desc, tmp->desc)) {
+			desc_data = tmp;
+			break;
 		}
+	}
 
-		if (!desc_data)
-			return;
+	if (!desc_data)
+		return;
 
-		list_del(&desc_data->list);
-		clear_bit(GPIOD_FLAG_EXPORT, &desc->flags);
+	list_del(&desc_data->list);
+	clear_bit(GPIOD_FLAG_EXPORT, &desc->flags);
 #if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
-		sysfs_put(desc_data->value_kn);
-		device_unregister(desc_data->dev);
-
-		/*
-		 * Release irq after deregistration to prevent race with
-		 * edge_store.
-		 */
-		if (desc_data->irq_flags)
-			gpio_sysfs_free_irq(desc_data);
+	sysfs_put(desc_data->value_kn);
+	device_unregister(desc_data->dev);
+
+	/*
+	 * Release irq after deregistration to prevent race with
+	 * edge_store.
+	 */
+	if (desc_data->irq_flags)
+		gpio_sysfs_free_irq(desc_data);
 #endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
-		sysfs_remove_groups(desc_data->parent,
-				    desc_data->chip_attr_groups);
-	}
+	sysfs_remove_groups(desc_data->parent,
+			    desc_data->chip_attr_groups);
 
 	mutex_destroy(&desc_data->mutex);
 	kfree(desc_data);
 }
+
+/**
+ * gpiod_unexport - reverse effect of gpiod_export()
+ * @desc: GPIO to make unavailable
+ *
+ * This is implicit on gpiod_free().
+ */
+void gpiod_unexport(struct gpio_desc *desc)
+{
+	if (!desc) {
+		pr_warn("%s: invalid GPIO\n", __func__);
+		return;
+	}
+
+	guard(mutex)(&sysfs_lock);
+
+	gpiod_unexport_unlocked(desc);
+}
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
 int gpiochip_sysfs_register(struct gpio_device *gdev)
@@ -1054,29 +1059,28 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 	struct gpio_desc *desc;
 	struct gpio_chip *chip;
 
-	scoped_guard(mutex, &sysfs_lock) {
-		data = gdev_get_data(gdev);
-		if (!data)
-			return;
+	guard(mutex)(&sysfs_lock);
 
-#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
-		device_unregister(data->cdev_base);
-#endif /* CONFIG_GPIO_SYSFS_LEGACY */
-		device_unregister(data->cdev_id);
-		kfree(data);
-	}
+	data = gdev_get_data(gdev);
+	if (!data)
+		return;
 
 	guard(srcu)(&gdev->srcu);
-
 	chip = srcu_dereference(gdev->chip, &gdev->srcu);
 	if (!chip)
 		return;
 
 	/* unregister gpiod class devices owned by sysfs */
 	for_each_gpio_desc_with_flag(chip, desc, GPIOD_FLAG_SYSFS) {
-		gpiod_unexport(desc);
+		gpiod_unexport_unlocked(desc);
 		gpiod_free(desc);
 	}
+
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
+	device_unregister(data->cdev_base);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
+	device_unregister(data->cdev_id);
+	kfree(data);
 }
 
 /*
-- 
2.47.3


