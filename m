Return-Path: <linux-gpio+bounces-39051-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hSw/D3kAQGqHbAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39051-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 18:55:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C77AB6D25A4
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 18:55:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=RsmgPtSs;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39051-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39051-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 514903037E7A
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 16:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FE5331ECF;
	Sat, 27 Jun 2026 16:54:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B829331EBA
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 16:54:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579258; cv=none; b=BI5NbSiZDHdmToZyvoAVJwAkkxI+WolQFWOfDkMqkEgYm7427jf9PAzTP+r1ceoq29CRSUGp3k+56wwjt0N78Myp081jBPd/J6qQ8KyVykSCTKrsEeEH5TNi+CeRKCBWFZXVi4EbNX+veD6O/9IBy/tEvsn1ldDJHxG9Q4IDxpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579258; c=relaxed/simple;
	bh=eYfoVTTY5NEjUxbcKceaFp2ZtOa8bfuibisKfUP+gSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=bLsDZDnsa63YiND//qpJaIE1FQqM4xZCe9p2iBzx3SHnVFHaU7CGS57DG0dvmPkyqmcGnqc4bkkBLZIGD9ihn4Uidclb+R0VCfTkFlRLCuwuW6zoICeO5/1AsMSDaFH5Mz4nG797LH9CZym5n5MhNcNoDfwIRvyQUmb8FkRWiNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RsmgPtSs; arc=none smtp.client-ip=203.254.224.25
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260627165410epoutp0275da49a8c6aa1de37040434c0217974b~8-mI3EFDb3192731927epoutp02N
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 16:54:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260627165410epoutp0275da49a8c6aa1de37040434c0217974b~8-mI3EFDb3192731927epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782579250;
	bh=wl26fAR/gW6o8YIBNsSnb/apIo7BbF6qv1tG/czd9Dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RsmgPtSsul37h4IWYuWsxmyQPZi0lx7xI5cGcOpqBa6x1Pk4prrMVDAqByqnj0Lmb
	 nkEFR1YixJEueQNLx+yH3lSR59vstGfDXSD8XJjLGhdd9l6ZoJenqFvK6f/JOh3zJD
	 CCeREfDSX+29GlZmRyUxpUSiJildXu6MfM+in9Jk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260627165409epcas5p2333c4465ee0e3b4e651c3aaf8d059434~8-mHqztFU1805818058epcas5p2w;
	Sat, 27 Jun 2026 16:54:09 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gndt80glKz6B9m5; Sat, 27 Jun
	2026 16:54:08 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d~8-mFjmWLs0125001250epcas5p1f;
	Sat, 27 Jun 2026 16:54:06 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260627165405epsmtip149243629021345579a1ea30fa0eb7c8a~8-mEDM4mQ2438924389epsmtip1F;
	Sat, 27 Jun 2026 16:54:04 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
Date: Sat, 27 Jun 2026 22:42:23 +0530
Message-Id: <20260627171228.2687857-2-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260627171228.2687857-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
	<CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
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
	TAGGED_FROM(0.00)[bounces-39051-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime];
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
X-Rspamd-Queue-Id: C77AB6D25A4

Add Samsung Exynos8855 smdk board to documentation

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 753b3ba1b607..273464400477 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -235,6 +235,12 @@ properties:
               - winlink,e850-96                 # WinLink E850-96
           - const: samsung,exynos850
 
+      - description: Exynos8855 based boards
+        items:
+          - enum:
+              - samsung,exynos8855-smdk         # Samsung SMDK
+          - const: samsung,exynos8855
+
       - description: Exynos8895 based boards
         items:
           - enum:
-- 
2.34.1


