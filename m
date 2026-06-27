Return-Path: <linux-gpio+bounces-39054-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U8nuJ1UAQGqBbAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39054-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 18:54:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF80E6D258B
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 18:54:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b="h/P7HL6u";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39054-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39054-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E947A3008607
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 16:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7788432C923;
	Sat, 27 Jun 2026 16:54:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26892701DC
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 16:54:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579271; cv=none; b=g5z3PR8Qbly5oZNk6tVWp3NPzKw5vVsMK47DtDEUwbRgFL3yMT50awsk9DaURYHXDOnfGJkeUbI4UuIYKPMIPFivFhpLsoz44oOSfYY8+ltvCqPoXV//d6HgZh9Q+bX/dMGRhOUnsjgDykNeGKP6UudlvFI//Aa18kukW3h1UxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579271; c=relaxed/simple;
	bh=DhWrWAH6pSp+Smwnq22EI/Ld7m8pY4Pykfe9SUrvhD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=B8Qm1GPvmlEGz0MhhSSIK4X/84hsmEidWYcWJskoK/vBY6phY3DzldtlWJNRG1QI/xEY84Km3gf/fmwuJGa/hJ4YhBNnw021Vyr1ZvbQzGVC4LXH6x13sxek5kdOyEJrwSySnp/RKkulrtG1CNXH+y+wB07dhCRSAlfcSIJfSe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=h/P7HL6u; arc=none smtp.client-ip=203.254.224.24
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260627165428epoutp0172055f0965cd166b7b1518d3d553def0~8-mZpdoKI1632516325epoutp01S
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 16:54:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260627165428epoutp0172055f0965cd166b7b1518d3d553def0~8-mZpdoKI1632516325epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782579268;
	bh=yxQV2OmQ8FmlGKRUAsciidZmHjuFiJO8smjOiFHVv7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h/P7HL6uOnzJL6aSZln3lWZYnbcV7y84ZgFiHoIHOiL0RzvtOT4c0JLKruuJHon1t
	 KtrQCLbQLU/AYawunPnpTQnlFA+YAdfSfSxycOPtqNauiBEfe+q+CgouLiveCSC2nv
	 VDNFJRIZ76Ri+WUY2aHTuNA1sWEISjx0OXM3K5gI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260627165427epcas5p26b4df715d2277bc220bcff20b25a6bfd~8-mZPe9dR1145511455epcas5p2R;
	Sat, 27 Jun 2026 16:54:27 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gndtV6zHJz6B9m4; Sat, 27 Jun
	2026 16:54:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260627165426epcas5p205bd4b60c6f1dba68f4f1125ad29745d~8-mXrDabu1145411454epcas5p2i;
	Sat, 27 Jun 2026 16:54:26 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260627165424epsmtip1623a04ef7aeb2592566c2d2d559a6a1a~8-mWNJ6462007020070epsmtip1Q;
	Sat, 27 Jun 2026 16:54:24 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v3 6/6] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
Date: Sat, 27 Jun 2026 22:42:28 +0530
Message-Id: <20260627171228.2687857-7-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260627171228.2687857-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260627165426epcas5p205bd4b60c6f1dba68f4f1125ad29745d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260627165426epcas5p205bd4b60c6f1dba68f4f1125ad29745d
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
	<CGME20260627165426epcas5p205bd4b60c6f1dba68f4f1125ad29745d@epcas5p2.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39054-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime,vger.kernel.org:from_smtp,infradead.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:alim.akhtar@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: AF80E6D258B

Add maintainers entry for the Samsung Exynos8855 SoC based platforms

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1705eb823dd0..f6d9e03d3370 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23996,6 +23996,13 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
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


