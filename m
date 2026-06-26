Return-Path: <linux-gpio+bounces-38968-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zlhpO8TaPWq97AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38968-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 03:49:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2706C996E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 03:49:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=dXceoYAA;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38968-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38968-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC18730DBDDB
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 01:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238063546CC;
	Fri, 26 Jun 2026 01:45:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70152314A8D;
	Fri, 26 Jun 2026 01:44:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782438301; cv=none; b=tBGfx4mFWE3E2r/wUqrwjE58Vh1f7CBH9TdsebFh3SKg7Q8elmkVKF35cvjZuNjQH/zFU0l0Nf2A8UqDEve3p4kdE4c+t0DRr9HLc/mxHKk6mFH1Df77H76q2jKhHofB+xMY7Hi76JhjHZSEPHluK4MSGMds2ORTd2kQ94Q/5dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782438301; c=relaxed/simple;
	bh=lqh3POWzJ/saYw/pVYIqSPnUuCkVbNkT4EA5Vyv+M/I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OZUmrPL0agOEPLfu7IFhADTnAS4NS/rxz/DEMmAV5PMqYu3IkYkSRM+n/zmvLPJ/NzOmtrbFOyL+xKMu8SNVYg76CZd5/LzAui5IYYgPBrH3DVHwXVQXj1AP65ADFvpdwD0pQhZ+9IokwT6h9d55SnfiptahJO4XXnp4OieJlwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dXceoYAA; arc=none smtp.client-ip=210.61.82.184
X-UUID: 9e92cdec710011f18dc8c9802ae25ab1-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IZZhfRnKb7sALnSbtGAx1Pgd6HK4coKjRJT/yXiPfSk=;
	b=dXceoYAAAjzSxgH3F21QIWtD1Z+3mi6QA4mZcZHpOxTjw21TS0lExZHAQFzwxKdOVRvX3k0gRh6euNMN5PuqJZKJEvFgGFPuKO5meyPik3W9wewgZbWGGgIJ2cwgiSPgab2ZAwpC7XjRPD+wlflsBvpgkr8IzlOIEXx1DQl1Rd8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:dc6b62ff-5f85-4241-8923-0e20f11d5d06,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:c71220ee-45e6-4692-a476-3f71842ee83b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9e92cdec710011f18dc8c9802ae25ab1-20260626
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1611196252; Fri, 26 Jun 2026 09:44:49 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:44:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:44:48 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v3 19/32] pinctrl: mediatek: mt7623: Enable module build support
Date: Fri, 26 Jun 2026 09:44:18 +0800
Message-ID: <20260626014442.2378513-20-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626014442.2378513-1-justin.yeh@mediatek.com>
References: <20260626014442.2378513-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38968-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:justin.yeh@mediatek.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[justin.yeh@mediatek.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justin.yeh@mediatek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:dkim,mediatek.com:email,mediatek.com:mid,mediatek.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D2706C996E

Add MODULE_LICENSE("GPL") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: e7507f57a93a ("pinctrl: mediatek: add MT7623 pinctrl driver based on generic pinctrl binding")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 0d2f1872902d..a733ba63b9a7 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -98,7 +98,7 @@ config PINCTRL_MT2701
 	select PINCTRL_MTK
 
 config PINCTRL_MT7623
-	bool "MediaTek MT7623 pin control with generic binding"
+	tristate "MediaTek MT7623 pin control with generic binding"
 	depends on MACH_MT7623 || COMPILE_TEST
 	depends on OF
 	default MACH_MT7623
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7623.c b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
index 69c06c2c0e21..4db7a0ba466d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7623.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
@@ -1440,3 +1440,6 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7623 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


