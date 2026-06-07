Return-Path: <linux-gpio+bounces-38058-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eBI/Olf5JWo2QAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38058-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 01:05:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45273651E06
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 01:05:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=YLYpjYIo;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38058-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38058-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE4EF3019B9F
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 23:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C8D32143D;
	Sun,  7 Jun 2026 23:05:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A47F322B88;
	Sun,  7 Jun 2026 23:05:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780873529; cv=none; b=uABKNQzSxzMyaYAw7v4qJapf3GBcyVCGIv+kawIXU0+GeIdy9DlDewDZdILz+kHphfehewMGEvcvO8DrYlymAfXPwhuFL7nKi5AhPn6x8yCReIg6JYhbRFRcfpm4MKwkzzsSa8zX3S60wZ49zsmDYSmq99Q7UhfLXa+Xalj8NRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780873529; c=relaxed/simple;
	bh=q711bc1/xpTpKSaH1HBhtc+S33ctQC0+VT1Zj2JwGp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9pjWcDXFE1FKWeQTYOZLB+WYjebJJDQJL7gOY/4BYD9veJuNtvOW1eZ34lbczTBZi0ALY3bhkjUAFQUMY/ruEc3LK8Z1g4nrOVnIZVzM4VJAtpQuZs68tw8kgIef3Pm0lckeI/vY/g+6esjzXX8q+CbeMKFe6cM4R6SQB3xGyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YLYpjYIo; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9137026F45;
	Mon,  8 Jun 2026 01:05:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqCzfUV42IwC; Mon,  8 Jun 2026 01:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780873519; bh=q711bc1/xpTpKSaH1HBhtc+S33ctQC0+VT1Zj2JwGp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YLYpjYIogdESisH1zKL+54WfCLantKUKayYbq+XAdDaTaYB9FA1f3JbOItzaJFWvT
	 CsAyTE148AdWQs/KQe2pH/VF6BU7yaE0IyiECm/URwA/Q6SVkdOAxIzdH77h0e3rgd
	 VO4sd2GqJoWNHVqroVV724sBrvJ+KPb/mbiJjNxPTS+XhvktyQ59tiaj5pzI186Sve
	 NBMkhduG4/oNZw4A5WRtck4acT8qO7DPRuryf0WmDp7W46RRFZ3XvoHMfpIg12i8cQ
	 yK8FLdrlPmH0yyMiuCfFuYhTJePgdy4ngy0y5de85s//2V5l1Slq9YfyR1DsFgYC5v
	 f0x5pm0yDsvVQ==
From: Marco Scardovi <scardracs@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] gpio: rockchip: use devm_platform_ioremap_resource() to map registers
Date: Mon,  8 Jun 2026 01:05:03 +0200
Message-ID: <20260607230504.35392-3-scardracs@disroot.org>
In-Reply-To: <20260607230504.35392-1-scardracs@disroot.org>
References: <20260607230504.35392-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38058-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:heiko@sntech.de,m:jay.xu@rock-chips.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,disroot.org:mid,disroot.org:dkim,disroot.org:from_mime,disroot.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45273651E06

Currently, the driver retrieves the memory resource with
of_address_to_resource() and maps it with devm_ioremap_resource().

Since the bank device is a platform_device, simplify and modernize the
code by using devm_platform_ioremap_resource(). This also removes the
need for the local struct resource variable.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpio-rockchip.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 9478a58f1caa..8647d006d103 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -647,15 +647,10 @@ static void rockchip_clk_put(void *data)
 
 static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 {
-	struct resource res;
+	struct platform_device *pdev = to_platform_device(bank->dev);
 	int id = 0, ret;
 
-	if (of_address_to_resource(bank->of_node, 0, &res)) {
-		dev_err(bank->dev, "cannot find IO resource for bank\n");
-		return -ENOENT;
-	}
-
-	bank->reg_base = devm_ioremap_resource(bank->dev, &res);
+	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bank->reg_base))
 		return PTR_ERR(bank->reg_base);
 
-- 
2.54.0


