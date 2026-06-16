Return-Path: <linux-gpio+bounces-38525-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MPukDGnDMGqqXAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38525-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 05:30:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A568BB13
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 05:30:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=aspeedtech.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38525-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38525-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C894730DD2D0
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 03:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BFC3C0A16;
	Tue, 16 Jun 2026 03:30:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7640B3C13FD;
	Tue, 16 Jun 2026 03:30:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781580613; cv=none; b=p7Jdx780SEJ3s7dBOxLwRf7yBuunXISy3UthF1T/X2Gb+D8phwyQRozmX5KitxhTKh6kAF3pBNToQWcqjoPt1gLY9DB4e6kaE4MRpujP4KEOnyB1DhH0c5MkEcZpOpEWYX60cWWVhuDWYBSKdYkCbz2dL7luIdG2ZLUIIMh4RYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781580613; c=relaxed/simple;
	bh=3g5Xwg8h1zZKhm3yigBW7k/XgEh1YvhsBXpVJn3jjYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PodfYqILzksl0hxMMP6pprG8o9qzxNrWyIRk1YCec3g8igO04O2O2zRJ4pwXN7gPzBcHtPEoV/2QnrZfIknYrG1cZ371AFK1GMlPHFd2voN3gGUiNU7L0Kx4wgvC6Pgd2mRwZd6oVHX11y2Eft/KcVVQN8NoyTuK3xynWD5f+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 16 Jun
 2026 11:30:02 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 16 Jun 2026 11:30:02 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 16 Jun 2026 11:30:02 +0800
Subject: [PATCH 2/2] pinctrl: aspeed: Split TRST out of the AST2700 SoC1
 JTAGM1 group
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260616-pinctrl-fix-v1-2-621036e45c7c@aspeedtech.com>
References: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
In-Reply-To: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij
	<linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Billy Tsai" <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781580602; l=1914;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=3g5Xwg8h1zZKhm3yigBW7k/XgEh1YvhsBXpVJn3jjYc=;
 b=8/rgiPAyR99n1WV2vAnALgdaOrGtS/4Pyejknog3mNZ6wbRX5G6acnNUpKvpkyOieYdOYck9k
 mkV47AQIGOhCU3adl3tEKUMaH7IRepbeciaAkhCja6uYFwxUU0eA1qV
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38525-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:billy_tsai@aspeedtech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,aspeedtech.com:email,aspeedtech.com:mid,aspeedtech.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B15A568BB13

The JTAGM1 group includes the D12 ball carrying the TRST signal, but
TRST is optional for a JTAG master and the ball may be needed for other
functions on designs that do not wire it. With TRST embedded in the
group, such designs cannot use the JTAG master at all.

Move D12 into a new JTAGM1TRST group under the same JTAGM1 function so
TRST is muxed only when a board requests it. Boards that do use TRST
now need to select both the JTAGM1 and JTAGM1TRST groups.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
index 50027d69c342..f8b4066699ce 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
@@ -1018,7 +1018,8 @@ PIN_GROUP(I3C6, AA22, AB20);
 PIN_GROUP(I3C7, AF18, AE19);
 PIN_GROUP(I3C8, AD20, AC20);
 PIN_GROUP(I3C9, AA21, AB21);
-PIN_GROUP(JTAGM1, D12, F10, E11, F11, F13);
+PIN_GROUP(JTAGM1, F10, E11, F11, F13);
+PIN_GROUP(JTAGM1TRST, D12);
 PIN_GROUP(LPC0, AF26, AF25, B16, D14, B15, B14, C17, B13, E14, C15);
 PIN_GROUP(LPC1, C16, C14, C11, D9, F14, D10, C12, C13, AE16, AE17);
 PIN_GROUP(LTPI, U25, U26, Y26, AA24);
@@ -1263,6 +1264,7 @@ static const struct pingroup aspeed_g7_soc1_groups[] = {
 	GROUP(I3C8),
 	GROUP(I3C9),
 	GROUP(JTAGM1),
+	GROUP(JTAGM1TRST),
 	GROUP(LPC0),
 	GROUP(LPC1),
 	GROUP(LTPI),
@@ -1528,7 +1530,7 @@ static const struct aspeed_g7_soc1_function aspeed_g7_soc1_functions[] = {
 	FUNC(I3C7, (1), "I3C7"),
 	FUNC(I3C8, (1), "I3C8"),
 	FUNC(I3C9, (1), "I3C9"),
-	FUNC(JTAGM1, (1), "JTAGM1"),
+	FUNC(JTAGM1, (1, 1), "JTAGM1", "JTAGM1TRST"),
 	FUNC(LPC0, (2), "LPC0"),
 	FUNC(LPC1, (2), "LPC1"),
 	FUNC(LTPI, (2), "LTPI"),

-- 
2.34.1


