Return-Path: <linux-gpio+bounces-32775-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P68Fxx9rWnx3QEAu9opvQ
	(envelope-from <linux-gpio+bounces-32775-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 14:43:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEFD230736
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 14:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BFCF3036638
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 13:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D62B38550C;
	Sun,  8 Mar 2026 13:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="nCQ+4oLR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527E3859D6;
	Sun,  8 Mar 2026 13:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772977364; cv=none; b=tH3Ntcqq+TauBwJPqE7ksmm98OtRKohKrYpt7YoNDCEIXYaTHqvTa3bV4vll1xnfMUmfdXmcE/hSi7EpmxAvOXNfYPcFI2hF0tQtwemBLEt24n760bThuhloMTKaWTzDB/icX8Bc8JA6CYIi1sYwcRpsi/QeerrAolU9GtSu0Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772977364; c=relaxed/simple;
	bh=rrGyO2F1XUUE+HsMS168kypAGTNq7QUgIvitPdO1BQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HhmRcpTcmUlE+vf2Z4Mdro0ckxIRDlUrm2ZXZW9WP7NMXddUQGNJOyB/IqT71KGQF0JQ5b5UaA3R2zl/VNZj0gVNhUJOGA56b3kOgkSpiJdchAAXo/7lIBw8416W/KCxVYDCn9MCf1ef0RsCcGN4sFqRdVuzuzCcMwRQ8L0x3lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=nCQ+4oLR; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=St0AyNXsSwKBzqSM+oRrqDno8Waxo4WGv/VDy+FEh5Q=; b=nCQ+4oLRHT0Scfga9gqQKqAdve
	DnhdxnX0eg9wsnslnUnWC0PW4yjt2hmNLUVC2EtMItuJVleuQ2a8xwqEONbRNrCJubNJn83ind0+T
	sLsSWLDkUCRp/yBBudHhDZxHuu6G8Qc/aotSIDynyMogqRPavEjAIdaZe8iB24CZLEZLwgyxGeYVf
	UXR+cdmrLCzUBklVYFhp6ZrD/tbgkh/d1Hg23dQ69LG9PVXhymL6PYbeVkwLBrzJ7zOaAuD51C5o4
	j1tYUEv4zqpb2JMHbWcZU2lSvFcaTMhHu3nvDDCHRBhyq2MxTu/jqm+xOltJdqZDacG7YrhYCu4Rs
	KwRw5gYA==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vzEOy-00000001bBU-1wll;
	Sun, 08 Mar 2026 14:42:36 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 08 Mar 2026 14:42:07 +0100
Subject: [PATCH v2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure when
 pinmux is unknown
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAK58rWkC/3WMQQqDMBBFryKz7pQk1hhd9R7FhZqxBqoJGZGKe
 PdG912+/3lvB6boiKHOdoi0OnZ+TqBuGfRjO78JnU0MSigtcmEw9go77xc8X1S6IlM8tM6LDpI
 TIg3ue/VeTeLR8eLjduVXea7/SqtEgbaslJVtaexgn9MUeOOFJr6HDzTHcfwAMnstaq4AAAA=
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>, 
 Andrey Skvortsov <andrej.skvortzov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772977354; l=2440;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=rrGyO2F1XUUE+HsMS168kypAGTNq7QUgIvitPdO1BQk=;
 b=yEJ8OTcrMY3hFIqred0NGwmGs6SEjFUz6A/HTFbFK40vun//DFrg4PhU9J9PebOKV5Gih+cv5
 YuVng+yvsP8A0LbrdP1AfM+h70wtsnDh7Nf1VuszYz/z0PgHcyPJuDe
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Rspamd-Queue-Id: BEEFD230736
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32775-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	NEURAL_HAM(-0.00)[-0.120];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,mmpsystems.pl,gmail.com,kernel.org,arm.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sholland.org:email,infradead.org:email]
X-Rspamd-Action: no action

Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.

The issue is caused by gpiochip::get_direction() which was returning
-ENODEV when gpio is in unitialized state.

Instead of failing when the current muxval is at default value, report
the line as input.

Tested on Orange Pi Zero 3.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
Suggested-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
---
This fixes a kernel hang during boot on the Orange Pi Zero 3 caused by
inability to set up interrupt for the AXP313A PMIC.

The issue is caused by gpiochip::get_direction() which was returning
-ENODEV when gpio is in unitialized state and its muxval is at default
value.

Instead of failing, report the line as input.

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org

Changes in v2:
- Dropped the previous faulty solution which was forcing the axp313 to
  use r_pio as interrupt controller as pointed out by Jernej Škrabec.
- Implemented suggestion from Andrey Skvortsov to return default
  direction as input
- Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index c990b6118172..e438cf35ff28 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -971,7 +971,7 @@ static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
 
 	func = sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pin, muxval);
 	if (!func)
-		return -ENODEV;
+		return GPIO_LINE_DIRECTION_IN;
 
 	if (!strcmp(func->name, "gpio_out"))
 		return GPIO_LINE_DIRECTION_OUT;

---
base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
change-id: 20260308-rc2-boot-hang-269e8546635b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


