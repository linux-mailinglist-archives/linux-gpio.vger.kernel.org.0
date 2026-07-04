Return-Path: <linux-gpio+bounces-39443-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eQJVADi6SGo9tAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39443-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 09:46:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB44706FD6
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 09:45:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pfkEtWfM;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39443-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39443-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E4853063F31
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jul 2026 07:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B14639C63E;
	Sat,  4 Jul 2026 07:40:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF89397332
	for <linux-gpio@vger.kernel.org>; Sat,  4 Jul 2026 07:39:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150803; cv=none; b=LlKirFU41T8h1UvIoHRfUjwdlvyKm/q+8rHpA5LlM6KLYRm7z9Y2AgAHdJLH6gfH0JTGEJEymT+Xm/2SEmj2s6RJgLy9qDIeJAIvpsnjygTiw40FOkOdP66RHmvA0f8sa8/qf5W73m9d33/R9R0irnkGkt1yq+UdHNcOhEaL06k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150803; c=relaxed/simple;
	bh=b4iUr65hHHCVaSWsSZyZa4GjL3PiNleLinM59ZwAh08=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WRul4XZP95LG52hZ8JiwwcRYBhV9lguyKBEAZZ3a66Kkmy/TpHKrIwN1gZckum+Y/8L/D04U177m7AoIYSyNzPy/jJ6rXJiE/Pzo7skm1N5cjvybWfsHOvfXrTbkhNSpygwvNQQ5oPa+bgZX1IntTiEW1yfbQPkhGtdFAX8NU/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfkEtWfM; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so11623445e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 04 Jul 2026 00:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783150763; x=1783755563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzRzJB6u7MYAPuTB3vZnPlGmNDCrN8auNwAuOBFkv0c=;
        b=pfkEtWfMdWOZ4rgCiLjwkzLdw9CwciDYT9ggt3HuEpmidlqDOqQkEad+ZDTtmKUA3/
         SvLay/yqTBRIwHpkxkVTLrmgUInhGKvaMw+k2IzYfo+j4Njh0o31cL7LG8xVNJt6RiE9
         M26cLLOUH8VrbL4Xi5mnULrb0STBC5wuPw0zs8y6Q7ceN8tRovCf1/xiCQxn6vu9fxlU
         uJWfEKkpKccImwIdRazm2T7Fsb5dzIWmui5MLQEiW1w6ubsesPr9Uv+Df0xCjWV+oe/Y
         7xE/Ff+UnmeuZfQCeRmt+PAL4VZGXcXwbO/Y0s8ysPyTXKjBoI0MTth0CqKTB5Yei2B2
         IntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783150763; x=1783755563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OzRzJB6u7MYAPuTB3vZnPlGmNDCrN8auNwAuOBFkv0c=;
        b=LC5giQ4sAz6UQ73dQhWS0BFpkRrn8m3kvtTabrlZZvtAkz2buSWhpDNCgDhxg0iu5t
         kYngULb6yejfuiDm4xGkgKM8ltOVLof8H8Lqov73nsgRGcH5ZK5hi+DtULI0+LAL3rQr
         GuUWPo2KeyHSq0CdJKo6/WpCQPlE7W3JyIlMasGGDK00jyBY1wXs/STpW9qwvbNMOAVH
         ZXwuP0XkLBmlI90huSrRHth2Qi8PJ21zg6B0WGbb/Va+CJHtyKXae1pl5aeZKBaN9r+b
         o3Ny+jU4Fb/XjawdCYsbyRzqvChTTY0Xn3kSSf9uQA+jefUybJywZdiQOhr4TkKD1pET
         h2VA==
X-Forwarded-Encrypted: i=1; AFNElJ8XlQRssW8vI6dJMdPH5x/DUq3+6Dk/6ltTFim3RIXUepiEc6ZBGgcYEJjAXuOxnsFgCNRcuG+cAVng@vger.kernel.org
X-Gm-Message-State: AOJu0YwwLQNgF9xugRf954SI7qaKAYwNCVwQHqbNpgeaIRSrK4PsAFQV
	O9KCTrkvjUpTywepAdVsKHNc7VGPCEqP4Q+WBT/hoi7K8hogwOuOMoiR
X-Gm-Gg: AfdE7cklfREUr2c+1ZE95Oh38EBPncHATDHKmCuC3NTb8mIKOIM9JF4ipYpx6H0tz+2
	14QxF05EeBCIHJE/vF80CD/AihXbvz+SUp7blUSoRoUQd2pZaGuqQ2UDVqVK1qQ4Ydq/T/Kxggf
	UfxM0JVN+M7EviQttG/gxMbqP8ho3qW30NBj8ztT6VWMwAY/d8W9rPVlNCES6QQNukF2KwNamOd
	bizvBH92yekRGaSX2Tm0KJfdcF7/uwN2RohDn7Dow+Xmi/so5Cw0k34JO0v9g4g3cENFqgPcuJZ
	X+NsKpE+grywc9zSbRZueyae+RGER77SJn4N4cRH8ouxGViEQJTobsgeHIbKW4VOPar+z6+zwlN
	ig2psghwfrvkL3SElRxqulO90sHa+dAjs1v3RmPd7omuKFcW197VkBygKcNecHAvhK9dFuu0EP8
	xhrDVPrW8jfDj1ipPS/XhqFbTk4G5NX1yXSA==
X-Received: by 2002:a05:600c:314f:b0:493:b2c1:b2f9 with SMTP id 5b1f17b1804b1-493d11cf274mr24679345e9.8.1783150762899;
        Sat, 04 Jul 2026 00:39:22 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm6565488f8f.7.2026.07.04.00.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 00:39:22 -0700 (PDT)
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
Subject: [PATCH 5/5] phy: cpcap-usb: add extcon support
Date: Sat,  4 Jul 2026 10:38:43 +0300
Message-Id: <20260704073843.1750458-6-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
References: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39443-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CB44706FD6

Register an Extcon device and report the detected cable state.

The driver already determines the type of cable attached during USB cable
detection. Export the detected state through the Extcon framework so
other drivers can consume it using a standard kernel interface.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/phy/motorola/phy-cpcap-usb.c | 68 ++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
index 3be2b3afaaf4..8978a95c1c19 100644
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
@@ -226,6 +239,43 @@ static void cpcap_usb_try_musb_mailbox(struct cpcap_phy_ddata *ddata,
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
+	}
+
+	if (cable == ddata->cable)
+		return;
+
+	if (ddata->cable == EXTCON_CHG_USB_SDP)
+		extcon_set_state(ddata->edev, EXTCON_USB, false);
+	else if (cable == EXTCON_CHG_USB_SDP)
+		extcon_set_state(ddata->edev, EXTCON_USB, true);
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
@@ -276,6 +326,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 			goto out_err;
 
 		cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
+		cpcap_usb_set_extcon(ddata);
 
 		/*
 		 * Force check state again after musb has reoriented,
@@ -306,6 +357,8 @@ static void cpcap_usb_detect(struct work_struct *work)
 		if (error)
 			goto out_err;
 
+		cpcap_usb_set_extcon(ddata);
+
 		return;
 	}
 
@@ -343,6 +396,8 @@ static void cpcap_usb_detect(struct work_struct *work)
 		if (ddata->mode == CPCAP_USB)
 			cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_VALID);
 
+		cpcap_usb_set_extcon(ddata);
+
 		return;
 	}
 
@@ -356,6 +411,8 @@ static void cpcap_usb_detect(struct work_struct *work)
 	if (error)
 		goto out_err;
 
+	cpcap_usb_set_extcon(ddata);
+
 	return;
 
 out_err:
@@ -781,11 +838,22 @@ static int cpcap_usb_phy_probe(struct platform_device *pdev)
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
 	ddata->dev = &pdev->dev;
 	ddata->phy.dev = ddata->dev;
 	ddata->phy.label = "cpcap_usb_phy";
 	ddata->phy.otg = otg;
 	ddata->phy.type = USB_PHY_TYPE_USB2;
+	ddata->cable = EXTCON_NONE;
 	otg->set_host = cpcap_usb_phy_set_host;
 	otg->set_peripheral = cpcap_usb_phy_set_peripheral;
 	otg->usb_phy = &ddata->phy;
-- 
2.25.1


