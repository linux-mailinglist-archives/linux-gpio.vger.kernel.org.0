Return-Path: <linux-gpio+bounces-30968-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGnOH/A+c2mWtwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30968-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:27:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8FF7347A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63F10301D4D5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9F635F8D1;
	Fri, 23 Jan 2026 09:26:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5701A354AE7;
	Fri, 23 Jan 2026 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160410; cv=none; b=SehqFMTvvZbx+c+QbF0MJ7jABvvhtLEIXB/DTYIpDGZ3CmV/mtmxoyYVuE4LbwcLutAtcsuuZMWAKut5R1ipEuKXzPHBm3QygACPRthfhWhiRR3bo/q92vCzYSKhF388l+OCVmapxEv01AdONeb369Tpa1lejwWUCn597RXmGZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160410; c=relaxed/simple;
	bh=wq9nW1jVro6VbeJ8h0mIqtAis/vwp9TjCPIxWOSBwOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HxpohYQn8ed17DCJ/xr0koHFHRytOOldfK2HnP6ztFgd1MgVPwFPKXuNRUmBKZ4Xbx/Jpf2eqmE7YVa4rvmw3fS7nE2ztIPZi8qccP3BmCCNoFtWyoYeF70S5SgprbAlHi17CgWF+ZmPT4Rfn1HMF/meqnpc4evKJSoEe7WoMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 17:26:26 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 17:26:26 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 23 Jan 2026 17:26:27 +0800
Subject: [PATCH v2 2/6] gpio: aspeed-sgpio: Remove unused bank name field
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_sgpio-v2-2-69cfd1631400@aspeedtech.com>
References: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
In-Reply-To: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769160386; l=1327;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=wq9nW1jVro6VbeJ8h0mIqtAis/vwp9TjCPIxWOSBwOI=;
 b=YC9UInze1Bq7V+AeVOJPr9VhTHhX2yJDKM/ZG0zONoIDK+mvEveIiX4wTrP4BEdrd5OhEcCIj
 NdxYKnFKt9TCSaNByioCJ1UngylgmFMsaNFYivrP/D/Yo7N9Gt/NNhW
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30968-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:mid,aspeedtech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA8FF7347A
X-Rspamd-Action: no action

Drops the names array from the bank struct and its initializers, as it is
unused in the driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 318cd0e39741..a96ed6d8a55d 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -43,7 +43,6 @@ struct aspeed_sgpio_bank {
 	u16    rdata_reg;
 	u16    irq_regs;
 	u16    tolerance_regs;
-	const char  names[4][3];
 };
 
 /*
@@ -59,28 +58,24 @@ static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
 		.rdata_reg = 0x0070,
 		.irq_regs = 0x0004,
 		.tolerance_regs = 0x0018,
-		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x001C,
 		.rdata_reg = 0x0074,
 		.irq_regs = 0x0020,
 		.tolerance_regs = 0x0034,
-		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0038,
 		.rdata_reg = 0x0078,
 		.irq_regs = 0x003C,
 		.tolerance_regs = 0x0050,
-		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0090,
 		.rdata_reg = 0x007C,
 		.irq_regs = 0x0094,
 		.tolerance_regs = 0x00A8,
-		.names = { "M", "N", "O", "P" },
 	},
 };
 

-- 
2.34.1


