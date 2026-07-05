Return-Path: <linux-gpio+bounces-39459-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gm32OsAOSmqn9wAAu9opvQ
	(envelope-from <linux-gpio+bounces-39459-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 09:58:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D240170948B
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 09:58:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hYGdJLAR;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39459-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39459-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 433043006173
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 07:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A37C242D9B;
	Sun,  5 Jul 2026 07:58:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B154B367B94
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 07:58:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238328; cv=none; b=iBfq0fkoGOCZnSNHmlD6TcUJ2miWP+GFTmpaf32CtKGpBb+14NslmAljGqEMaC7woovr6Qcm5tPvvjJqTfw6xr40BwcYZYcPTg8Uf29mnDxbbNNER+ymgPdkM1FjSOgxGRjIh2OeeU5zM13tDVL4IBJvBzLJwdozgK5c0uJ5wiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238328; c=relaxed/simple;
	bh=Xsqlm+rF7jIXTcXnCSKMaVUBX15NQaxokCbcRbwJDbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FpBrPvuv0GoIDPfsSlQrsESyvDWN0s9Kt2i1jOS3XlKCpfAoeoemVTegHbDNZBQ8FGjNZ0ByAB7s4f9Kgc6e6Tx6lDPtJDxh9aLnsjCEmIbTGspTuR4nfG0gw5iRrxw+rgVljClfzxF5fZKankYLiBEMsOybdBwjD9GU0sqUJUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYGdJLAR; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b27c7451so26530945e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783238325; x=1783843125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UY6T/viKs724YCtcNe87O9J53G3jzdQBIfSFXtvLiY=;
        b=hYGdJLARmwxCbLPEIWM2rTWsbsaHXjiAF6n9sxu6oR9+ZmVlcAQhb0H8gAE8/xSpw6
         4d/ZgTzE4FG3VQrZnSixkuVxv1A8rICCKEEVnhecWRYPlhlJ67ECL4GewCi/y8Y2kA2+
         xUkGXVv9402JLEn7qJ3hTjfBgjNr2/wrbIMk3q2LfapAWghiL59zPPO+ElaAgE1+CJcy
         bs964wiwxz2eVDQPqO52lpWHqEWya7Bzyj8zlnotqOwXobWjDmDm4WWraIOrqDs+muzC
         5KBlX3TJSHTAIFsBvuzatpJsbYrnsPRIY+X97xFZCOhBmtHXrdzc/nJ9o1n11BBQLbyo
         D+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238325; x=1783843125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7UY6T/viKs724YCtcNe87O9J53G3jzdQBIfSFXtvLiY=;
        b=EQXLSMNVZs2ufo4dkRzpdEvjIPdew8v9AD7BdRIIUwKIrEJAHMDVGBTGiWL2GivbS1
         I+Dg2GqkuX6aFQ1FFivcOb3Jgy49/SIFzvSuiqMtU/lWjD1wTShNdwwOPEojUTfiAzpN
         XwnhpeE9ZIe+DVsYiZlmOPJuX67UZ0VhATR4j2VklKVNKNlrOeHaGHwSMvH6VH70w8Th
         wQp9ZDFYL+MApRUtTWWOy2A/xUA21zd2NfMOxDnwHLtxSmZ4SNXcjdc2loyoFgK1S8Xg
         XaYd/lUCsVXjR0vcjFvlI7hhebH7CesvfK7N/Z76qKSp3Y1fNGqX5+OLIpl0/OCMmlrU
         saVA==
X-Forwarded-Encrypted: i=1; AFNElJ+EmeLme55pZ5wsAowK/cB4yezbF+c5nj1h1MZdwCxZY1dFiCaHcEZ3RRyWd1xMEpRzA9QurqsdJOlZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyseuvISaplvGR0UsNWMhf1PU0QJ4SEZ/7PquJDodgDGaYHzOwc
	kkJ6GfkOFJ9XMCDhxIshFKXSxxKeV1GYEgLGmP8HdoJ/Vjb+hWpKJFMz
X-Gm-Gg: AfdE7cmxS8NvqCZ6vRSe6vUTZmMNW7/k0j8XJQmgvmXeNHTiasqCcVb8BGubnZArcS4
	B9XOPCzPQu1GlawroKLsMJbh6J8gbwbbCtYD67+0U7f/K7673Q+P45KcN+difDRCBHMBC0vnVMo
	jX+fEtnrbRmODEZPMAJFPkuOLuycqKoW0nyNLrFrajrT83AWixZcJbpjEF2Whle/XpDt6nM+HWR
	zC1gGH/xYVSw5CZJwdgHq0jy7rbLVVOOImtTbW20Tup5FAs/zGpWGhjAsFEaY3iOChpawweyTwh
	yxNIdhoxqfw17Ddrw44t6tRmLN9DYjArkomOsFiSvbfqo4TswR6zpXdEU+XWB5J/yc9xvky1gt/
	ghIrF0MSOnIzZvxXTw+l+2uA25sHa0RIHgd1GLqChslWod46s5oUsxhxjMwM3vl39tOK1naDWLu
	Qg7LKxbcHhQ8LyECvkHdBoOYdrjMC+GsjUEQ==
X-Received: by 2002:a05:600d:8444:10b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-493d159bae7mr37777895e9.18.1783238325038;
        Sun, 05 Jul 2026 00:58:45 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm305769765e9.15.2026.07.05.00.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:58:43 -0700 (PDT)
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
Subject: [PATCH v2 3/5] ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for CPCAP USB PHY
Date: Sun,  5 Jul 2026 10:58:07 +0300
Message-Id: <20260705075809.1793784-4-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
References: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39459-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D240170948B

Update the CPCAP USB PHY interrupt mapping to use the charger
detection interrupt and corresponding "chrg_det" interrupt name.

This matches the driver and binding updates for DCP detection.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 6b1195c2a768..51a858021541 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -125,11 +125,13 @@ cpcap_usb2_phy: phy {
 			interrupts-extended =
 				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
 				<&cpcap 19 0>, <&cpcap 18 0>, <&cpcap 17 0>,
-				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>;
+				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>,
+				<&cpcap 13 0>;
 			interrupt-names =
 				"id_ground", "id_float", "se0conn",
 				"vbusvld", "sessvld", "sessend",
-				"se1", "dm", "dp";
+				"se1", "dm", "dp",
+				"chrg_det";
 			mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,
 				     <&gpio1 0 GPIO_ACTIVE_HIGH>;
 			io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
-- 
2.39.5


