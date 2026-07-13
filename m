Return-Path: <linux-gpio+bounces-40010-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hdxkG0J1VWq0ogAAu9opvQ
	(envelope-from <linux-gpio+bounces-40010-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 01:31:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51474FBB2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 01:31:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40010-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40010-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B20F3034ABE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 23:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354F83B83E8;
	Mon, 13 Jul 2026 23:31:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38E834388A;
	Mon, 13 Jul 2026 23:31:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985471; cv=none; b=a495mQUcPWvRvcfo/FTaHRdBOVb+sIZz6//2/KJjddNC0I5YVw4clOC79YVh8MK0ITd8k71nwcsj7Vcp2/ghxIw/89gPlvBSnGzkDXSx5QIkJghSauEWX2J/Nppa6fiixgabUed6LhID8m5bvFU9FFSqRsxjidK0G0fZWe1M+wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985471; c=relaxed/simple;
	bh=qQhLs0bCrhNFjURSJookWUQUDRmPrMS36AzKJT1kcmc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtwjxLiOfaZQLko7zd6Ps8icCkpm1ZOQCri9/ZiIUsMABbjP3uEl++p6+Cvx+YbNrGoN6F3rHBJ9oD5RLRSXWHq278imnKcvANIbYUzj2kHOiz5YsLjb2mALIAdkwK+4J/9f4imA5BoAcCyqgg81cOkOaFba/AJmFzOk5TqOWq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wjQ6z-000000000zU-2AOm;
	Mon, 13 Jul 2026 23:30:57 +0000
Date: Tue, 14 Jul 2026 00:30:53 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] gpiolib: tolerate gpio-hogs lacking a hogging state
Message-ID: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-40010-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[makrotopia.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:frank-w@public-files.de,m:andriy.shevchenko@linux.intel.com,m:mika.westerberg@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,public-files.de,linux.intel.com,vger.kernel.org,lists.infradead.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daniel@makrotopia.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@makrotopia.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB51474FBB2

Commit d1d564ec4992 ("gpio: move hogs into GPIO core") made
gpiochip_add_hog() return -EINVAL for hog nodes lacking any of the
'input', 'output-low' or 'output-high' properties. The error is
propagated by gpiochip_hog_lines() and fails registration of the
whole GPIO chip.

The previous OF-specific implementation tolerated such nodes:
of_parse_own_gpio() warned "no hogging state specified, bailing out"
and of_gpiochip_add_hog() stopped processing the node without failing
chip registration.

Some boards deliberately ship hog nodes without a hogging state in
their base devicetree and supply the state via overlay, e.g. the PCIe
slot key selection hogs on the BananaPi R4 Pro added in
commit e309fa232d12 ("arm64: dts: mediatek: mt7988a-bpi-r4pro: rework
pcie gpio-hog handling"), as the polarity set in the base devicetree
could not be overridden from an overlay.

Booting such a board without an overlay applied now fails to register
the gpiochip. On the BananaPi R4 Pro this means the MT7988A pinctrl
device fails to probe, all peripherals including the console UART
defer forever, and the board finally hangs when clk_disable_unused()
gates the clocks of the UART still in use by earlycon:

  gpiochip_add_data_with_key: GPIOs 512..595 (pinctrl_moore) failed to register, -22
  mt7988-pinctrl 1001f000.pinctrl: error -EINVAL: Failed to add gpio_chip
  ...
  clk: Disabling unused clocks
  (hangs)

Restore the previous behaviour by warning about hog nodes lacking a
hogging state and skipping them instead of failing the registration
of the whole GPIO chip.

Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpio/gpiolib.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e5fb60111151..c433a095907f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -999,14 +999,17 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	if (ret < 0)
 		return ret;
 
-	if (fwnode_property_present(fwnode, "input"))
+	if (fwnode_property_present(fwnode, "input")) {
 		dflags |= GPIOD_IN;
-	else if (fwnode_property_present(fwnode, "output-low"))
+	} else if (fwnode_property_present(fwnode, "output-low")) {
 		dflags |= GPIOD_OUT_LOW;
-	else if (fwnode_property_present(fwnode, "output-high"))
+	} else if (fwnode_property_present(fwnode, "output-high")) {
 		dflags |= GPIOD_OUT_HIGH;
-	else
-		return -EINVAL;
+	} else {
+		gpiochip_warn(gc, "%pfwP: no hogging state specified, bailing out\n",
+			      fwnode);
+		return 0;
+	}
 
 	fwnode_property_read_string(fwnode, "line-name", &name);
 
-- 
2.55.0

