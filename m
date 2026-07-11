Return-Path: <linux-gpio+bounces-39904-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jV4aKB2rUmptSAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39904-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:44:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 387E0742D4E
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:44:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bvNcRQTV;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39904-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39904-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36640303DA8C
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 20:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2EE318B9D;
	Sat, 11 Jul 2026 20:42:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526AA3161BF
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 20:42:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783802567; cv=none; b=CL+IknLkBbkfusd5Bt3KFPfwQ9W1mwvnMhjRy/vp6j4WFJnMHnQXzO6Y09Vn73hczQ2hqXD8z061tdTD7dAe2gX0XIhJkXgEZCUMVPdPoNCu/lTpy+X5UAc495RYzU0FfbXJMqneVjQoKY1iV2ZgtjCeYw9naoH/wDgQtBZkUh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783802567; c=relaxed/simple;
	bh=Ks2eP/cpFMNIiN5iTQ0FeCLHneQLovfhgH+//9ums1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p43N4YvnMGb2VZggAb1LH13EuOgSD8hns5SmlCECJtEhgVftbkalA8kWJsr86SMPs443EMV3w9yuSmF1anF/E+NjWvHhsuq9KJdd5oLDHXVEZ8CIvrBztlmI12nk59BOnrsD1M4okDjqs7dYGOQfBFTWrOD7YcgudK1r0cMZOos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvNcRQTV; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c19bad03so17130975e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783802565; x=1784407365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OR+gVYl7lNIahaA/xS643KgVQohpeipjmcrGmazJ6MU=;
        b=bvNcRQTVVw8n7mMb16mUwF1RBVaHYV+09ypgkxTkb1FOPa6kuMof7CgQv01ABJeDKW
         tvPKp0HatvIkDf8fjvxfIwsBfQQeupcXo3ufOnXhw8VbuxEINFk7Qo3tIzdV3Tc5Pxyl
         CAQ/IjJfbzRwQGYZPx+ME8bSVhR1vt/m7jZKKmlyatqChpD3KaQr7MVcGBg+8v5+zFYL
         eZUIW/jh+zTENTDlBJpzN4pzZHoATWhJAo1Hz1YDnygOakMjnFzPmYZpJBuReJYhdT2Q
         DM8U1wZ1SCyATKfSSI0gfmMrNsW4pUczv0EL8davQJbS0JCJiTPtadxPHRlNuj7X9/f9
         t1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783802565; x=1784407365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OR+gVYl7lNIahaA/xS643KgVQohpeipjmcrGmazJ6MU=;
        b=ZGl0xWLeYNZIU4WW5tQStqdEcwiVeBH9OQq4N2oEE2czxpunKUhs18t4Wax43Jw/+M
         eMTSyM2PVe27ULvUdDlcKXAuMgYtxO4J/WJaqKWL8AQJS0YmRsmeNb0/JnFqHt8bHTRx
         dZOkwZRIqv8NSZGgOSLWHMZC4RHoHbE7zVjRHZSeZzXPFfeLiWdgT6XlepfpuNtuVnzM
         /z5TWaq3dZ0JtyffGXeg0vN7w5oEQkwTnvom5pEc8ddK3uR33/VL5SlUajCzmdpd9Voi
         wp9HiiyrCSFWgbNbWDNtTW6AaMkaapyl+ZZUKdBWkGx5I4G0G+etT4sPK8lwSXxNTL5k
         YTRg==
X-Forwarded-Encrypted: i=1; AHgh+Rrmb00EXyWopz5mSFmsLbnrwzUJAwe++irZyx7pZBxeotw8N2D4I0GjKisomftpgkYpRKlAGw6Dnugg@vger.kernel.org
X-Gm-Message-State: AOJu0YxLmUo4S6FZkRdR2rTnHAvB9W1L0LQQxc46Ww4oFYKmvLZQllNC
	m7UFuV/fliw4+sA5/ubXzkEoRP4NUbTNDLVW6mAFmOF/asEd8NJPm1LI
X-Gm-Gg: AfdE7cm+izljATsjLiZ+SF2RacNxNu/QDbCr+Yg3AV4ZLkz42uQkwNWgyGvDBm+OB+z
	fNMXvKLgVS/Jv69rKjrPwHND4PY6tXJn2NZT8TpW+SKDUvKJRjYqSSPPe3NV9UWWn2mTYL/mu32
	22Q2/GIxfpZVWqHAvKLMDIMALPN5wBEoPFaRdsdFfK0LbJSTJZVeyTqUCR3A4IAHuqgippoXkxs
	7/qxdI/h5y2dd7tUN4RFogdwUmSXvIQLvWgHgMT1MoQHcscTEXZH9he1nQA8xaicCQf77O2EBI6
	O3Dr0QO8omX4ELDzn7XHteNmXT9LkacH+MAyR1kE1rXLxB44ICSZhRxC4C7ScWxXcyBNweXGJp3
	q7LIjlFtRLzNiUwhqJSmSb34ZdNxtnVX2e9KJ51aLMw+4+XXE69r3aNVn+466fo0KDQd5UYpOjt
	IujIBXAZJ+dykX4NXsRZRAYObfrILuPFTYRuoVX25yYX9J
X-Received: by 2002:a05:600c:46ce:b0:493:bc92:ef45 with SMTP id 5b1f17b1804b1-493f8820951mr35073795e9.24.1783802564720;
        Sat, 11 Jul 2026 13:42:44 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm172704725e9.2.2026.07.11.13.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 13:42:43 -0700 (PDT)
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
Subject: [PATCH v5 3/7] phy: cpcap-usb: fix IRQ teardown race
Date: Sat, 11 Jul 2026 23:42:06 +0300
Message-Id: <20260711204210.197144-4-ivo.g.dimitrov.75@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-39904-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 387E0742D4E

there is a race between IRQ handler and remove:

IRQ thread:
    ddata->active == 1

remove():
    ddata->active = 0
    cancel_delayed_work_sync()

IRQ thread:
    schedule_delayed_work()

The IRQ handler can therefore queue detect work after it has been canceled
during remove(). Free the IRQ handlers before canceling detect work to
prevent new work from being scheduled during teardown.

Reported by Sashiko

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/phy/motorola/phy-cpcap-usb.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
index 7cb020dd3423..741145c89e5b 100644
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -393,6 +393,19 @@ static int cpcap_usb_init_interrupts(struct platform_device *pdev,
 	return 0;
 }
 
+static void cpcap_usb_fini_interrupts(struct platform_device *pdev,
+				     struct cpcap_phy_ddata *ddata)
+{
+	int i, irq;
+
+	for (i = 0; i < ARRAY_SIZE(cpcap_phy_irqs); i++) {
+		irq = platform_get_irq_byname(pdev, cpcap_phy_irqs[i]);
+
+		if (irq >= 0)
+			devm_free_irq(ddata->dev, irq, ddata);
+	}
+}
+
 /*
  * Optional pins and modes. At least Motorola mapphone devices
  * are using two GPIOs and dynamic pinctrl to multiplex PHY pins
@@ -691,6 +704,8 @@ static void cpcap_usb_phy_remove(struct platform_device *pdev)
 	int error;
 
 	atomic_set(&ddata->active, 0);
+	cpcap_usb_fini_interrupts(pdev, ddata);
+	cancel_delayed_work_sync(&ddata->detect_work);
 	error = cpcap_usb_set_uart_mode(ddata);
 	if (error)
 		dev_err(ddata->dev, "could not set UART mode\n");
@@ -698,7 +713,6 @@ static void cpcap_usb_phy_remove(struct platform_device *pdev)
 	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
 
 	usb_remove_phy(&ddata->phy);
-	cancel_delayed_work_sync(&ddata->detect_work);
 	regulator_disable(ddata->vusb);
 }
 
-- 
2.39.5


