Return-Path: <linux-gpio+bounces-40005-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GoHDN8pzVWpmogAAu9opvQ
	(envelope-from <linux-gpio+bounces-40005-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 01:24:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD2274FB17
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 01:24:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nabladev.com header.s=dkim header.b=U5795kMQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40005-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40005-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nabladev.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE81B300E905
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 23:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63863B8111;
	Mon, 13 Jul 2026 23:24:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9386F2773E5;
	Mon, 13 Jul 2026 23:24:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985090; cv=none; b=Tg+vapfOh4qNCo0Bw+Utd5ZzTcU+s8uFSIMMi6GHTYGHSHQI/IueH5zzEuXUCZcv/HEbIJEY1j+3golBvtNpf2uXEs0KjULhAYKzU9uhvZmQVvBS2qNJaAGOLHA1Hu14z8l7EUCwU7lGbcBLxBav1JX0uNCcCR73fJu7dGN8AAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985090; c=relaxed/simple;
	bh=AR+ygJAN1X8s8PvIme5xSYlKh0EeUNREH4C2ayUe8WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C5gVsDg0X4ogmpzkSwY8WhTSNXxdAOvay2Nb+z3tSPT1dOHPFj19UxM0p+L7vC0MTGjH1SVP9MiGzdtPRscbkwCPtChnxn/ufV0pRNKlqeg8STwVN7Gzb2PTpIWe0c8c/22tiC8Cnxh0sAjE2xOadGg7egokl5o/Y5jMfZl4Avk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=U5795kMQ; arc=none smtp.client-ip=178.251.229.89
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 561171196C5;
	Tue, 14 Jul 2026 01:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783985085; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=D6FpAA0f5GvH9oji0ZuMNzR+AIzfJerxYl2OMl3rvs4=;
	b=U5795kMQb/YxqVlP+VrW8AAHX91phweIR9P+oF5Zi4J2ZNwbVFi/W9JQIiIa5M2T7pwcII
	2FmHPVyl7Ga4sGFUcqU6k0GvhOQJLj/OoBFJ7ayu/vtgkzMD5HYzwu0alcS72yuUebP45m
	dnDLHYNbeJunqcRatGdBHgTNKUpvQxDcf81SJXkh+BS2AFyXiB8nFSFPK/Sh2HMpYQycxd
	BGzx8rzweg+pilbP6CvVEy9baJHrv1AOL2AXOP/ddmiI4YLKifucKp9MwkKH2e7x+k62vH
	x77xyTVztxhxFSQILYN4IZy4lJCU/jm+uQBp3osJ4dVT9NSQBZQCkz+R/5vaQw==
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
Subject: [PATCH] dt-bindings: arm: stm32: Sort the document
Date: Tue, 14 Jul 2026 01:24:14 +0200
Message-ID: <20260713232440.120352-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40005-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marex@nabladev.com,m:alexandre.torgue@foss.st.com,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,dh-electronics.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,st.com:email,infradead.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDD2274FB17

Sort the document, place STM32MP21 before STM32MP23, and STM32MP23
before STM32MP25 . No functional change.

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
 .../devicetree/bindings/arm/stm32/stm32.yaml       | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364fc..af87661ccca41 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -193,28 +193,28 @@ properties:
 
       - description: Ultratronik STM32MP1 SBC based Boards
         items:
           - const: ultratronik,stm32mp157c-ultra-fly-sbc
           - const: st,stm32mp157
 
-      - description: ST STM32MP257 based Boards
+      - description: ST STM32MP215 based Boards
         items:
           - enum:
-              - st,stm32mp257f-dk
-              - st,stm32mp257f-ev1
-          - const: st,stm32mp257
+              - st,stm32mp215f-dk
+          - const: st,stm32mp215
 
       - description: ST STM32MP235 based Boards
         items:
           - enum:
               - st,stm32mp235f-dk
           - const: st,stm32mp235
 
-      - description: ST STM32MP215 based Boards
+      - description: ST STM32MP257 based Boards
         items:
           - enum:
-              - st,stm32mp215f-dk
-          - const: st,stm32mp215
+              - st,stm32mp257f-dk
+              - st,stm32mp257f-ev1
+          - const: st,stm32mp257
 
 additionalProperties: true
 
 ...
-- 
2.53.0


