Return-Path: <linux-gpio+bounces-39467-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QikIAeItSmpu/AAAu9opvQ
	(envelope-from <linux-gpio+bounces-39467-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 12:11:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FED709B3C
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 12:11:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Z394v9XR;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39467-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39467-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83A563010ECF
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 10:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9FF391845;
	Sun,  5 Jul 2026 10:11:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A95391853
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 10:11:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246292; cv=none; b=Rd88AFC4apXEedNPDClqoE0Ire9pk6PqdrkSS7+rEiW7HrnBfar0XhMasQaDb3MNSpDYsL6UNzIAY7eCBg9zHUv68LDw/5QvrhsFiysYITnSb5BkyDzxiuF8FNy7bwa9LUkeMq22MWfioY7LrAaK9fosP/GwVxVoJYL2Phn/ybY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246292; c=relaxed/simple;
	bh=IEmSU/by2VzFwJwSteAX1qEHitxDHjCToChDeMiGOtg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IbENPf6F3SnKrYuWZCrSAFWgsEDJNYbqyLfuwoGHOAgOv6ZZ69NgYwX8LnXXgsyMrWrIfqNVt6UOlJjZQNDk9cEH83l6N/+10Ux0jGyqvn421MHi2ey9IBdzaC+QaSksOkm0Y21RRbYzIeT79/oEbdoj0qMbeykY/BLfUA4NiBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z394v9XR; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so17952195e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 03:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783246288; x=1783851088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMf0EghcO1wU7SDI12QaKU3M5UeL2s+v1847s1Xy9Ew=;
        b=Z394v9XRdQ8NWpUu0n6MohPys3M07cbQ9CydneUv0xl6sNauWiCYxDLIBuZ1ThIUZq
         qxvW+0vcSUKSPBKdXbiTFEKEmI1mHSqDb5hb4GKzu55dkFKy+jo6ys7H4ejLjfx6quZw
         sifIsUeBpUzWdh8Y7vHcWt5j2T6V8xi4hUDJk7J1CFyujyBsoqPxRl2hp+el/Cy9XKSB
         a2vxFVVBwDfKz8uTwZ9iNV3zW0Q9E4WTANSSaXW+J4QZ6N0lTOS6CLpZHmBJcCwwVsrf
         WWTIRD6E+TZTjpiyT8hQri74y2mFGtCfhU0fzjXDxtl8S0I0YLzvFex9XuvP54OGDJnK
         PlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783246288; x=1783851088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NMf0EghcO1wU7SDI12QaKU3M5UeL2s+v1847s1Xy9Ew=;
        b=hxtGDBctWpFDNVlhPvP+k7GWoUFCeOc2SLMZNT8ruQ1QNVVqTPzwGPeFRdIdMxYrto
         oTzGHZxBwuJ2kYbNmZQ5vq79BccPIPw3EfeMlQtsCOFa93/ntHLWvonh34JLIb3jq3+L
         jTZ9LN0X9BUQGfFz+Ts5e+L/i5s5rR4qYsOBO1luwKADPUawkndcNDZq9CoGGggVHlx4
         T4uZF5PMP0/Dmm2tLLFkTi37ybwnXM0to7b6KgsnkZCWDoe4jR132+8xmuBvuxisKUAN
         fzfLzn9sEXVKcabpzJs37uy81LiUiNXAQx0Cr4rQGc8V7KlPgyXAZK64wTcbAZBH6Ld3
         HyLw==
X-Forwarded-Encrypted: i=1; AFNElJ9hC0XDUZkR/Cdswckx/UuuaOAqoQcrVBAABPm+HdbpHREVNSqDZr7yrWhy3R7ngHJWcIlK72W7U4c3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw777vQFWsHqtauI7KVw3O0CwBHwP95mgO4SrCYoYs++Q/tKmC0
	Bs/kn2+kfJhcdKIz+xdbOuf0IQqDbZs/RbA7TZvxHAciFXw+aZTa37dQ
X-Gm-Gg: AfdE7clphO916JFuzQH5q6IKS2X7jGHvbkrcpkSHK6erVJF+dUnHRmCmTGC7lhkyjSI
	32FLCNO9ixBJ5RvA2tE+81znFCHIS+QPJ1pypl3Eorj2jffhQTDKmrCELAR3uJIhHWa48zhRKYM
	+S0oQ4YDEeayk6UEjjCvzvqrWYdfLF2vThmeX5w66aPwFcVHS4iNPK2lGstzo/xuiYdtMkNf6Cp
	I4BqxyDitpqyG3gzX90x8k3+JA957983Gsf+TRpdoDInqsYtZKMYrsCnWhRT9tnGoaZfXpMVq/9
	zjLWDa42obiL/uujPQIK63aZGR7R0GfFnIv9SjXBX69z1gKo9Xa3yGnZoGJMkHEEKqiynKSMDKV
	Cb02rYpiCLi13zs7zJlb4wV8dB63nqk+xIuEEWBMbgAd23bi46eKSZCZasdqvpov53WrOcMabR1
	7OYdsI0bW+HsnNdbfH9Ijas5m6R8ZLwQbYjYkK1gw7+Mlk
X-Received: by 2002:a05:600d:844f:10b0:493:c1bc:79bd with SMTP id 5b1f17b1804b1-493d11f03acmr45744445e9.20.1783246288368;
        Sun, 05 Jul 2026 03:11:28 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bbcfsm261382715e9.6.2026.07.05.03.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:11:27 -0700 (PDT)
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
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v3 4/4] phy: cpcap-usb: add extcon support
Date: Sun,  5 Jul 2026 13:11:05 +0300
Message-Id: <20260705101105.1798069-5-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
References: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39467-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92FED709B3C

Register an Extcon device and report the detected cable state.

The driver already determines the type of cable attached during USB cable
detection. Export the detected state through the Extcon framework so
other drivers can consume it using a standard kernel interface.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/phy/motorola/phy-cpcap-usb.c | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
index 78bb1773e537..ba36d110df41 100644
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
@@ -134,12 +136,23 @@ struct cpcap_phy_ddata {
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
+	if (ddata->cable == EXTCON_CHG_USB_SDP)
+		extcon_set_state_sync(ddata->edev, EXTCON_USB, false);
+	else if (cable == EXTCON_CHG_USB_SDP)
+		extcon_set_state_sync(ddata->edev, EXTCON_USB, true);
+
+	if (ddata->cable != EXTCON_NONE)
+		extcon_set_state_sync(ddata->edev, ddata->cable, false);
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
@@ -346,6 +401,8 @@ static void cpcap_usb_detect(struct work_struct *work)
 		if (ddata->mode == CPCAP_USB)
 			cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_VALID);
 
+		cpcap_usb_set_extcon(ddata);
+
 		return;
 	}
 
@@ -358,6 +415,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 	ddata->mode = CPCAP_IDLE;
 	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
+	cpcap_usb_set_extcon(ddata);
 
 	return;
 
@@ -777,7 +835,18 @@ static int cpcap_usb_phy_probe(struct platform_device *pdev)
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


