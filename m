Return-Path: <linux-gpio+bounces-39910-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M53xMI6vUmpmSQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39910-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 23:03:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2094E742E55
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 23:03:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nabladev.com header.s=dkim header.b=LHmh6EZp;
	dmarc=pass (policy=reject) header.from=nabladev.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39910-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39910-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF0CA30221D2
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 21:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BA331813A;
	Sat, 11 Jul 2026 21:01:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA12BE7BA;
	Sat, 11 Jul 2026 21:01:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803717; cv=none; b=TKOaHZAj3wenbDhyYxu3ITZreiKUNpTHuW/FobbqT5E6ip3fDcGWjosyBqVfPwN1KIDbVZtQhylyD8HpAmUxGydPKUToLaPW8mnFRVPUGFM8VT29e4BpDmX4eEpGlE0ZZcNwNvTFHDYZuerSXCJ1MjSxbntqtMb+MRHGncgazKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803717; c=relaxed/simple;
	bh=MzqgoMuJIdGP189HE9PGMmOiYz8iwUT82y8AbS4CGZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQopnC4EJ9NjopUW+qdzLP0yFy8gtSnpasisgHcRrQfOz2De7QDQV7C2+rc36BvzMy1ckTmUOzsXxqd9FQoFLTp7/0yLRf6+obzzuZpjWeRx0Xm8VEMDnqTWtKmNEIDwRU/C658tNWUyD7e4o49pjfYfHoKJE4+8CFOxSGD2FKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=LHmh6EZp; arc=none smtp.client-ip=178.251.229.89
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5581A119823;
	Sat, 11 Jul 2026 23:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803707; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2eerO83FR9XLVJDLYJUhN9olbnCS8UH6ub1IdYOkeRY=;
	b=LHmh6EZpP36TorzqAJRec9nu4MuXA3Ib02qlFKHh/CKqDTtfKCvwv1lpmJ4Gf+pc0/ndjN
	sRLAkTQgtn0xPJCBpr+6GrTQwPqi0LWqUly8VpB0RQ831jGPwBOmGjFqB8/YTgA/Wxmna2
	HGYYA5tvT7YjeHaPfqn0Q2lbxcMjDU3GFy58uXcj88X7j4A0aRdKt+fNQIosw3hIPNKT5F
	4jpV+lYTd9uFrntsOMEp8+8Rbc4avOG1lRpdzumtxc7o19IUaxQ3JBekob0it8QbOvDzXg
	l03Oekbdw4dzgaKSKYAJ878xaIPJTn0A5fVWkLS4oFGqD+Plt0RlK+47d72Ccg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 01/10] dt-bindings: arm: stm32: Document STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
Date: Sat, 11 Jul 2026 22:59:30 +0200
Message-ID: <20260711210131.236025-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39910-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marex@nabladev.com,m:alexandre.torgue@foss.st.com,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[nabladev.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2094E742E55

This stm32mp25xx-dhcos-bb board is a stack of DHCOS SoM based on
STM32MP25xx SoC (1200MHz / crypto capabilities) populated on SoM
Breakout Board, the stm32mp255c-dhcos-dhsbc is the SoM populated
on DHSBC carrier board. The stm32mp23xx-dhcos-bb is a stack with
STM32MP23xx SoC.

The SoM contains the following peripherals:
- STPMIC (power delivery)
- 4GiB LPDDR4 memory
- eMMC and SDIO WiFi module

The Breakout Board carrier board contains the following peripherals:
- USB-C peripheral port, power supply plug

The DHSBC carrier board contains the following peripherals:
- Two RGMII Ethernet ports
- MicroSD slot
- LVDS connector
- MIPI CSI2 connector
- USB-A Host port, USB-C power supply plug
- USB-C / DP port
- Expansion connector

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../devicetree/bindings/arm/stm32/stm32.yaml   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364fc..2045dc2e54a60 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -196,6 +196,18 @@ properties:
           - const: ultratronik,stm32mp157c-ultra-fly-sbc
           - const: st,stm32mp157
 
+      - description: DH STM32MP251 DHCOS SoM based Boards
+        items:
+          - const: dh,stm32mp251a-dhcos-bb
+          - const: dh,stm32mp251a-dhcos-som
+          - const: st,stm32mp251
+
+      - description: DH STM32MP255 DHCOS SoM based Boards
+        items:
+          - const: dh,stm32mp255c-dhcos-dhsbc
+          - const: dh,stm32mp255c-dhcos-som
+          - const: st,stm32mp255
+
       - description: ST STM32MP257 based Boards
         items:
           - enum:
@@ -203,6 +215,12 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: DH STM32MP231 DHCOS SoM based Boards
+        items:
+          - const: dh,stm32mp231a-dhcos-bb
+          - const: dh,stm32mp231a-dhcos-som
+          - const: st,stm32mp231
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.53.0


