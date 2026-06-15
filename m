Return-Path: <linux-gpio+bounces-38467-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lYadNlq5L2qZFAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38467-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:35:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3081A684966
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:35:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=lyY7TH7A;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38467-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38467-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 068BF302AE02
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 08:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0013CE080;
	Mon, 15 Jun 2026 08:34:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24013CEBB6
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:34:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512469; cv=none; b=EcXrlQW+Xp1zOtsMXw3eItE4bBXARmyYUg/4NeBmdl3Fm5fMgcg948pIiM6oikOZzV9oW1ayyM3yj8zxv1gq1RTJ+NIZctkO53nzP2qc65lGOOGXPCVVhMKOzum+PDe15tdH1hiGn/1Gi091m/niHmmfJPjPM3bTWwLMXphm/NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512469; c=relaxed/simple;
	bh=Coc6+axgNyuKZ/w9tZNcDBOAp4QRsPLZuDPcvvKDRkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=cHaz3uivghrgEUj17zvaQwylofjti1We5za6DAp26O8v9kGi+jgnBfv2lLLjiY6XwUx8AwpZk0afgmw3igtUBB/otAjJCmutXZK4xy8CFmqU9c5lH2uS0lhPU7oBvpbDW6xCMLx1vaAuQGgOogkov4N0uALO9tzUnn2jSdwbJoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lyY7TH7A; arc=none smtp.client-ip=203.254.224.24
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260615083420epoutp016c6ee7dc3fd350d965d2329536316995~5NCTtp00q2412324123epoutp01T
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:34:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260615083420epoutp016c6ee7dc3fd350d965d2329536316995~5NCTtp00q2412324123epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781512460;
	bh=Cz8/kWNTiABNBQS/iHlFdfUP/vEMQXqsBrLkZrtPWyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lyY7TH7Ar87nItfdex/Hke4TwXQfqv26BAeQG4/CmYg9EBJirtx3Hh4D//O9fUFc7
	 HrI/khjJ4TyGcf1fIaIhQhlBB2/rLm0TFpPHuePA9B+9p8iMeQV7QTaVWG94HUDIv3
	 n+nB7pHE00URYRnyCWPpyXmnnnCM38TYIjrgVBeI=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260615083420epcas5p3c6d8f488fffa7add3b943b7e82f2cce9~5NCTiTU1o2361823618epcas5p3o;
	Mon, 15 Jun 2026 08:34:20 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gf3Lz4v8Xz6B9m5; Mon, 15 Jun
	2026 08:34:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237~5NCSTNBha0786007860epcas5p4Y;
	Mon, 15 Jun 2026 08:34:19 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083417epsmtip10db0ab1e9dba5e80ec21a960585f06f4~5NCQVQDJS0113401134epsmtip1o;
	Mon, 15 Jun 2026 08:34:17 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 2/5] dt-binding: pinctrl: samsung: Add exynos8855-pinctrl
 compatible
Date: Mon, 15 Jun 2026 14:22:49 +0530
Message-Id: <20260615085252.1964423-3-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615085252.1964423-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237
References: <20260615085252.1964423-1-alim.akhtar@samsung.com>
	<CGME20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237@epcas5p4.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38467-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:alim.akhtar@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 3081A684966

Document pin controller support on Exynos8855 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 7b006009ca0e..c4773701c92e 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -53,6 +53,7 @@ properties:
       - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
+      - samsung,exynos8855-pinctrl
       - samsung,exynos8890-pinctrl
       - samsung,exynos8895-pinctrl
       - samsung,exynos9610-pinctrl
-- 
2.34.1


