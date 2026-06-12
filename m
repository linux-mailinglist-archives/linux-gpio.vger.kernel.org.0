Return-Path: <linux-gpio+bounces-38384-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pbgPBwh/LGp/RgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38384-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 23:50:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F34E67C918
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 23:49:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BZtFgNU0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38384-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38384-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 910D930E9BF5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 21:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67FC37F740;
	Fri, 12 Jun 2026 21:49:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA72A1E515;
	Fri, 12 Jun 2026 21:49:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781300997; cv=none; b=eiZcwsZHy8uDYLVEf/ImXpN7+drZMp07vXTUAVUZXaDaVwUKRSBQDfT5DTtxwIokXdYLopXMVGrVW9Ix8PC9/1h2n2EJm2jWmdRgAsoTssf0oMiABUkZIUBJPH4z6aEfvt+6ZRYJRd5TYGPnDMdqTdQB5JFirgP89+hVWfW1+Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781300997; c=relaxed/simple;
	bh=S9ta0Js/9wD+HsepdYBP7J4b8HhQoD07R5p++jiure4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SxUa7ASVZyth2S1vcjbUPfcSHd9kC4Vaksk0ASV+1wgcTHYesRJ5Z9QcLpJfEvepGQkuuRqVo+T4CmD2pi+2gy4uim9JWmiNsRufNNWGYyLW6rGY0lGJRVMImpO/DKPZKYvGfxBVcgHK2tz1nvcnxZUzalTVjgfNqw1nfcRMY/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZtFgNU0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC681F000E9;
	Fri, 12 Jun 2026 21:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781300996;
	bh=5wnQHmqrGIZDNQrN7U/jxMi4k1qdtaoiocoy3cp5RI4=;
	h=From:To:Cc:Subject:Date;
	b=BZtFgNU0hUkkdcYLO0UjyfbxiAgKg7vLoYzNabrgECqXZ6qx5Sgl2Ze8sHr9UEAgy
	 IV1A9tee0wwaJfvqH+yU7DKOSDzFg/G11q19S5r0UCa/LwZEnjp8LDeFEayXaS2Q6U
	 i9TXgvB5Mdp3XH3Pfid87Rl61qsc+vBaklKJYho3F1wkJpe+CWJrLFAL7orWBxGzJ9
	 rYorFr1qKJxTPj7abTBCJBBKMoTOmFjxoXL8/l28bl2AT1cLyxDmqPrtmy8f2XktoX
	 VmwwUSBOG2lC7AALaXhEDdLCiwhWv1LO/NdccAungZlfT6omZ4moFpMjn78LtLXqmi
	 PUsvLXgBSW81Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: Match DT helper types
Date: Fri, 12 Jun 2026 16:49:38 -0500
Message-ID: <20260612214939.1883911-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38384-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F34E67C918

The affected pinctrl drivers either check for the presence of a standard
property or read a property documented with an 8-bit cell encoding.
Using boolean or u32 helpers for those cases disagrees with the binding.

Use a presence helper for "gpio-ranges" and read
"microchip,spi-present-mask" with the u8 helper documented by the
binding.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
 drivers/pinctrl/pinctrl-mcp23s08_spi.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 8c353676f2af..e20f7dc79d43 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -868,7 +868,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	gc->set = iproc_gpio_set;
 	gc->get = iproc_gpio_get;
 
-	chip->pinmux_is_supported = of_property_read_bool(dev->of_node,
+	chip->pinmux_is_supported = of_property_present(dev->of_node,
 							"gpio-ranges");
 
 	/* optional GPIO interrupt support */
diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index 54f61c8cb1c0..76d4c135db11 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -143,13 +143,13 @@ static int mcp23s08_probe(struct spi_device *spi)
 	unsigned int addr;
 	int chips;
 	int ret;
-	u32 v;
+	u8 v;
 
 	info = spi_get_device_match_data(spi);
 
-	ret = device_property_read_u32(dev, "microchip,spi-present-mask", &v);
+	ret = device_property_read_u8(dev, "microchip,spi-present-mask", &v);
 	if (ret) {
-		ret = device_property_read_u32(dev, "mcp,spi-present-mask", &v);
+		ret = device_property_read_u8(dev, "mcp,spi-present-mask", &v);
 		if (ret) {
 			dev_err(dev, "missing spi-present-mask");
 			return ret;
-- 
2.53.0


