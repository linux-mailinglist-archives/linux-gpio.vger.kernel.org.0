Return-Path: <linux-gpio+bounces-39906-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nFvJOkqrUmp1SAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39906-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:44:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7BC742D5F
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:44:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qtzeryNK;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39906-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39906-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AE5B3046FF8
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 20:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66733148D8;
	Sat, 11 Jul 2026 20:42:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E67312819
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 20:42:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783802573; cv=none; b=MnuYISp0U+ychr5zRCLSPBqa6HTNfsQfltcdTwknOxlukr0iHnyjP0ohZjh20xOiCxrJKBvkPOyOdTuqJ6W7K9ttj5JvGC/n3lVxrBMsyi+NTrt2IeIXhUn2tau976AdS5bJ3uHqqSDsls3VGhZFC/HK0PrjwjEJClE3uAgM2W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783802573; c=relaxed/simple;
	bh=keh7k5g99s9JFAlPqxaGS+ggiP+D3wffEqkcASw/DCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uctxvc8A6WvFGOfQRaG/77n6MK0LY7/sF3rIik/j6+w/ANMEYvcgjDKf0cWAsoiRJ9b7jcG6ZThmbxN+32/vUDcMfnXwk6CFpx1KZcV9vG0ydJUluDOrKN4aUfB91Om3zb0y1wnXtB/wbMTzBhfRilcu02uK2/KhvkXMb0IVh1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtzeryNK; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso13574295e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783802568; x=1784407368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bSIbMOG7dMBWAgtFylVuhg8C83qfhMuIPQBzICKRrc=;
        b=qtzeryNKQwbRA3kgmXQEil/yVhyupYXX600fJLd46ydEjBHn+UUtGqlngxblws8Y7P
         BHwg+fOITfb6GMck8STTAkI0+tbkfiPv35q8hiIjnV2jcpbJFY3CWYJSu4gszj8+uTCe
         InOExOtd0Z84+ouhdeQXxQnN0tfaYaEEgUQetrZsRklqw7jQWehAPJiN/Kp+iSQFCZ/Y
         bkRxcJ9tRcRTTWYJTBNBqxJ39K66UckipfVMzu/oQN4tVBmpWPjvhcnqfgzy30tyYS9Z
         tY5wTgPsO9qBdtiqJKYw+JhZ1mQvPsEvvYxyCixUj9yoFmlpQrBpEy7HoAsya1QV4SNa
         /KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783802568; x=1784407368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bSIbMOG7dMBWAgtFylVuhg8C83qfhMuIPQBzICKRrc=;
        b=bLNN4EKfXx9b29SeVirGhScl6fZcxGBsMuRQAesEy4Mjv5dUI8ApKkkAcWyKxDyMKC
         +fcprHdZQ9byenXwUKOHI1BSEeTdRAorEkWL6vE1KfFIFCG+vuj7Ngw7cWjTGlDfEqyf
         bSNS/2/DQfPwDQW9FVDZ8vnk5Q1pT06WVOzhxIYqH7/fbY9DlBcEdyid6pQ+sDy9kbql
         6x0CBSWhebx6PJg2y4XTZEOt8+hibC96qdPTpD1K3NLKcDX45QgYoBvncHQN3UnMHDTH
         RgDbIYB90AOouxBl0kfLB2NpwWYefiaxOnFCXU19PNbcOUm1+4L1eYoOLsruk4No85HD
         +Icw==
X-Forwarded-Encrypted: i=1; AHgh+RoWg4dopw7T7pyGmBgW3NMfrh3rZN8XfHMRtitesLh6s9TAuvhhEu70vu8oPH/9IWi7xzKQYMuxmmAg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr6lm5qj0SXfoLM7yUl9zAxXMBHyTxIPOfyHuoYRKX8rmF/LXd
	HREU5yQHaVu8RvZx4Ll9pim+y5OLjnUU/9ilnkWBa8+3BsEYmRvHheRK
X-Gm-Gg: AfdE7ckf4u+9e8WU/KKlGUsjAVlV2NXbO9L4S23m4jbHbFctURcrdpDnOZLsTzFMbLD
	Tjf7sGnTUH6PwJMt78ELQf/H7nkZhd8/AAuX9iHCVPFcQkr4a6nXq8S6lxBbUG1DOE5eJdc7p7D
	LdCrZdDUxGUAE0tPnTd9MVfPUCEsoktIgBuwUL12GYkjrOWoAHOIMl6e7TI3o0/k8X19QpIHYbz
	tOVYpcA/pO2qFUerDnhsXZ47aB9//d2YNJPPLPPdo/tgaxFNhH/PZqHUUPOvN8bCZLXYRAgbhq2
	sEbqYa573eaSEuKHYjaATmuC4QtUvV/NEJKBb0hThWMwbJWI1aAsqrX5sFx3bxarMPz7yIa5n/C
	o1F0B9n3+/MmBQ1JExrQwGo30yJFZy+PZwnrHtHoY58XswN2aXeNgOTWObSd4vOA+J/oeLSWCVz
	dB8enpcspGyFEm+NW51B4xftOwGAohs+qhww==
X-Received: by 2002:a05:600c:2d56:b0:493:f639:9b2f with SMTP id 5b1f17b1804b1-493f8834f8amr22456715e9.39.1783802568144;
        Sat, 11 Jul 2026 13:42:48 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm172704725e9.2.2026.07.11.13.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 13:42:47 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	--cc=linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v5 5/7] phy: cpcap-usb: add extcon support
Date: Sat, 11 Jul 2026 23:42:08 +0300
Message-Id: <20260711204210.197144-6-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-39906-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:--cc=linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E7BC742D5F

Register an Extcon device and report the detected cable state.

The driver already determines the type of cable attached during USB cable
detection. Export the detected state through the Extcon framework so
other drivers can consume it using a standard kernel interface.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/phy/motorola/phy-cpcap-usb.c | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
index 2d770ff19e93..23d8709a0026 100644
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/extcon-provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -123,6 +124,7 @@ struct cpcap_phy_ddata {
 	struct regmap *reg;
 	struct device *dev;
 	struct usb_phy phy;
+	struct extcon_dev *edev;
 	struct delayed_work detect_work;
 	struct pinctrl *pins;
 	struct pinctrl_state *pins_ulpi;
@@ -135,12 +137,23 @@ struct cpcap_phy_ddata {
 	struct regulator *vusb;
 	atomic_t active;
 	enum cpcap_mode mode;
+	int cable;
 };
 
 static bool cpcap_enable_uart;
 module_param_named(enable_uart, cpcap_enable_uart, bool, 0644);
 MODULE_PARM_DESC(enable_uart,
 		 "Enable UART on the USB connector while idle (increases power consumption)");
+
+/* List of detectable cables */
+static const unsigned int cpcap_extcon_cables[] = {
+	EXTCON_USB,
+	EXTCON_USB_HOST,
+	EXTCON_CHG_USB_SDP,
+	EXTCON_CHG_USB_DCP,
+	EXTCON_NONE,
+};
+
 static bool cpcap_usb_vbus_valid(struct cpcap_phy_ddata *ddata)
 {
 	int error, value = 0;
@@ -226,6 +239,46 @@ static void cpcap_usb_try_musb_mailbox(struct cpcap_phy_ddata *ddata,
 		__func__, error);
 }
 
+static void cpcap_usb_set_extcon(struct cpcap_phy_ddata *ddata)
+{
+	int cable;
+
+	switch (ddata->mode) {
+	case CPCAP_CHARGER:
+		cable = EXTCON_CHG_USB_DCP;
+		break;
+	case CPCAP_USB:
+		cable = EXTCON_CHG_USB_SDP;
+		break;
+	case CPCAP_USB_HOST:
+	case CPCAP_DOCK:
+		cable = EXTCON_USB_HOST;
+		break;
+	case CPCAP_IDLE:
+		cable = EXTCON_NONE;
+		break;
+	case CPCAP_UNKNOWN:
+		dev_warn_once(ddata->dev, "called with unknown PHY mode\n");
+		return;
+	}
+
+	if (cable == ddata->cable)
+		return;
+
+	if (ddata->cable != EXTCON_NONE)
+		extcon_set_state_sync(ddata->edev, ddata->cable, false);
+
+	if (ddata->cable == EXTCON_CHG_USB_SDP)
+		extcon_set_state_sync(ddata->edev, EXTCON_USB, false);
+	else if (cable == EXTCON_CHG_USB_SDP)
+		extcon_set_state_sync(ddata->edev, EXTCON_USB, true);
+
+	if (cable != EXTCON_NONE)
+		extcon_set_state_sync(ddata->edev, cable, true);
+
+	ddata->cable = cable;
+}
+
 static void cpcap_usb_detect(struct work_struct *work)
 {
 	struct cpcap_phy_ddata *ddata;
@@ -275,6 +328,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 		ddata->mode = CPCAP_DOCK;
 		cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
+		cpcap_usb_set_extcon(ddata);
 
 		/*
 		 * Force check state again after musb has reoriented,
@@ -303,6 +357,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 		ddata->mode = CPCAP_USB_HOST;
 		cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
+		cpcap_usb_set_extcon(ddata);
 
 		return;
 	}
@@ -351,6 +406,8 @@ static void cpcap_usb_detect(struct work_struct *work)
 		if (ddata->mode == CPCAP_USB)
 			cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_VALID);
 
+		cpcap_usb_set_extcon(ddata);
+
 		return;
 	}
 
@@ -369,6 +426,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 	ddata->mode = CPCAP_IDLE;
 	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
+	cpcap_usb_set_extcon(ddata);
 
 	return;
 
@@ -813,7 +871,18 @@ static int cpcap_usb_phy_probe(struct platform_device *pdev)
 	if (!otg)
 		return -ENOMEM;
 
+	ddata->edev = devm_extcon_dev_allocate(&pdev->dev, cpcap_extcon_cables);
+	if (IS_ERR(ddata->edev)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(ddata->edev),
+				     "failed to allocate extcon device\n");
+	}
+
+	error = devm_extcon_dev_register(&pdev->dev, ddata->edev);
+	if (error < 0)
+		return error;
+
 	ddata->mode = CPCAP_UNKNOWN;
+	ddata->cable = EXTCON_NONE;
 	ddata->dev = &pdev->dev;
 	ddata->phy.dev = ddata->dev;
 	ddata->phy.label = "cpcap_usb_phy";
-- 
2.39.5


