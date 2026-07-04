Return-Path: <linux-gpio+bounces-39449-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aL5aI9IjSWq4ygAAu9opvQ
	(envelope-from <linux-gpio+bounces-39449-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 17:16:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B9707D05
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 17:16:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="Ng5NxX/B";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DwjZMeli;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39449-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39449-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28A753019507
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jul 2026 15:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879A3357CFC;
	Sat,  4 Jul 2026 15:16:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817B9354AEB;
	Sat,  4 Jul 2026 15:15:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783178162; cv=none; b=i1v5JESW0yNiAaEBimDyi6ilLRoC8orN8kzt9Kb99eQmYEgqwd878XIR5ZNbkNQ8tsUGPIoyakYdHp3cM5u0RynFW3abX3edfjz1Bj3NgO1vyOu2J0Yx9CCKa57/sNiU9rdVVhCtB+LEGSzMi4XUM/h2HzESUuiLEQkuXUgmGsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783178162; c=relaxed/simple;
	bh=t2XSViw8g5I44hw5ZTRZV1GsnGHC+PyrbVWH/ARCbF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AjgYPdr4TD/76P+9R8HBuO/y6/qr21Gppy79Uae57b+KSMeUFGzcNyxU8IF74F4COj/oPeVAvXXQUrG11GlT0qcrXX6D17GYGj0jTuIu9fjrCN1FSCyCEG5KeFmQL20fTf6M+gRB0TK0I7UPtF5eK6jYNWixG4f22zGvcMg4Ork=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ng5NxX/B; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DwjZMeli; arc=none smtp.client-ip=80.241.56.151
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gsvM83ms4z8txS;
	Sat, 04 Jul 2026 17:15:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783178132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aVYDH2vqPaP3hCMKt4dvygtRtrkfJZDruGx3t8+yqIM=;
	b=Ng5NxX/BvIYtJluodO+sFdbdB2csvQRAscJ4WJIg2ESMmL5wYADHwRKcrmoirKfLI1PxSD
	Wtt/x9vNoVkKQsIfzNjAyBAbtLr2gehU2xoKdWJjSv1MKUSmKwEp1cEi1CckCKy0pA0J3y
	EpLtefXwhZ3ndQggk8KfDR+kTl9P+TzBqZMynMv2nKO3pgRaH6cr2cHllNdV5AuZCyNOlD
	aHEZ+qwZtgxhTxcSNX1YRtsZ6HHiACu5ZYI00tbtvd8df9yur4GidMdqduyyd4owwk4Kmr
	hyLe8zRgvsjFwsiZzwMgZGc+KxKToa4K/5USVkhHpPVdekewFOMwqljYSWH3tg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783178131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aVYDH2vqPaP3hCMKt4dvygtRtrkfJZDruGx3t8+yqIM=;
	b=DwjZMeliuo1H8LN0LWZza6vDO8cD/iBGhsOEUx/sggB6Qk6C7CUwjlwW28LD5KzvdAofgh
	JiFSJv48bJYExHjwqtmk/9MEi0FeQaBiQf4z0XfpXpV9SlG92wbw53lnCSHdlNcXMxrxfD
	zVzHLaOo360+72GmntVuMF1T2zL1HLk3+m8Cf5zrVRmK/NZ77Js2896wE5+ZjnATFAOMTF
	n3aQw78Xn3VhERrAUGE6WziYFka1cpjzsYXZ2hohSJYOryxbd1/uBlmpid4QCxktOTC0i+
	ZWHKF0i39yV+d7qWdAH3fPX+SPfFfjfhR9/eYsoVc2EL315fauCF/C4njp5mlA==
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
Date: Sat,  4 Jul 2026 17:13:46 +0200
Message-ID: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fku6tys71wipxjjc8waxta3i6nk5wqwj
X-MBO-RS-ID: 63f46f6472a1d86063a
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39449-lists,linux-gpio=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:brgl@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-gpio@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E48B9707D05

Document support for the GPIO controller blocks in the
Renesas R-Car X5H (R8A78000) SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/gpio/renesas,rcar-gpio.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index d32e103a64aac..95f5175c7a9da 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -56,6 +56,11 @@ properties:
               - renesas,gpio-r8a779h0     # R-Car V4M
           - const: renesas,rcar-gen4-gpio # R-Car Gen4
 
+      - items:
+          - enum:
+              - renesas,gpio-r8a78000     # R-Car X5H
+          - const: renesas,rcar-gen5-gpio # R-Car Gen5
+
   reg:
     maxItems: 1
 
-- 
2.53.0


