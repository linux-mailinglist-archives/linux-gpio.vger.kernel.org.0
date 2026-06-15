Return-Path: <linux-gpio+bounces-38471-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bPiWOUK6L2rYFAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38471-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:39:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF0684A04
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:39:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=FT3xaMYp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38471-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38471-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 899C730465D9
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 08:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58B83D6478;
	Mon, 15 Jun 2026 08:34:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBA83D45E9
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:34:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512496; cv=none; b=rfov6t+p1cUj9nDm1zveJYZwZaLbAI8drpV3SKNkNGnXZavNYXXtgDwnjx9nVrnFlILhgJXIff9PZnNnHUyfErFjqYe/V/Y4eOGDBNLc8Awp+YzOgj//hpAjJ1RK3tJ1411IIXVVBlKtofRRmt06ocsZwwDf6bYGKfuPO8T85wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512496; c=relaxed/simple;
	bh=hqIZNEJ+ngwlZ761oj7BZgDyKDMxvbazfKsfFaHaPBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=O9yDbg1+gvKZrawu3Jjuxk77tkE10ydCf/b9CObcIWqM1y9fxDh4WqBU/B1BCKXuU/SQ1X51Ddw+jtkfQ7ERA50teTthWDbUHljyS+jCUshU32O1uDiShPg3NalZ/n0XXnTpxIVkFewfTaeznTjUZ4mHinhPTpXZWyGFGl9r0LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FT3xaMYp; arc=none smtp.client-ip=203.254.224.33
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260615083447epoutp0386770b317481a75bab04f61c3bf829df~5NCsUbVCw0979409794epoutp03T
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:34:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260615083447epoutp0386770b317481a75bab04f61c3bf829df~5NCsUbVCw0979409794epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781512487;
	bh=yaYCowk7JVZ5hc+4haO2BGnTeTwQ73DyggnqwLDb2as=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FT3xaMYpyHOYOK41NqHaW7zTgTnoRRAtJ9+K54AgskJ7eAqlz6h3q2IIzzQbJX134
	 4IH2jm1+79Zq5K2Cuxvg/HvZGczXbq7VSnGa0JXgY3FpfDAZ8DguMBAflbFDy5gJra
	 B+R7ekmfwO7lUazaEpVMmOvOVvFFQxszXSFdzANg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260615083446epcas5p3b6461a5cc0bb909b7e5c9cc81aa5376a~5NCr5rqgb0986209862epcas5p3g;
	Mon, 15 Jun 2026 08:34:46 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gf3MG12sYz6B9mD; Mon, 15 Jun
	2026 08:34:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260615083433epcas5p24e9fda698154eccaf43d044d140fdb21~5NCfg_9pC1271812718epcas5p2J;
	Mon, 15 Jun 2026 08:34:33 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083431epsmtip1a608860123cab7350a47dc125efa3565~5NCdSlZ5m0236002360epsmtip1h;
	Mon, 15 Jun 2026 08:34:30 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 5/5] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
Date: Mon, 15 Jun 2026 14:22:52 +0530
Message-Id: <20260615085252.1964423-6-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615085252.1964423-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260615083433epcas5p24e9fda698154eccaf43d044d140fdb21
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083433epcas5p24e9fda698154eccaf43d044d140fdb21
References: <20260615085252.1964423-1-alim.akhtar@samsung.com>
	<CGME20260615083433epcas5p24e9fda698154eccaf43d044d140fdb21@epcas5p2.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38471-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime,infradead.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:alim.akhtar@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5ECF0684A04

Add maintainers entry for the Samsung Exynos8855 SoC based platforms

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 49a10f0ceb07..fb9b24220258 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23914,6 +23914,13 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS8855 SoC SUPPORT
+M:	Alim Akhtar <alim.akhtar@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/exynos/exynos8855*
+
 SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.34.1


