Return-Path: <linux-gpio+bounces-38958-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I/YFItXZPWqG7AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38958-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 03:45:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 516A46C98C0
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 03:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=P3Xck4st;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38958-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38958-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91CA3305213B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 01:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E2331714C;
	Fri, 26 Jun 2026 01:44:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF22FBDE0;
	Fri, 26 Jun 2026 01:44:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782438299; cv=none; b=YwhJbVnsGpqYO6hUYPqXfy7f9WD9orRydLpB+3QvYzmmW2Vbz2sZmHe5bAA+FbmcVZj394gockcDF0EXltrBI+OVG3eJvHKKHgk59g8SsBtzZc0+oQmrUta0ji4fmsKKAbOrT+jhT9m1sZtRGu0vwYiy4xanzdY7h7BaJl84XSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782438299; c=relaxed/simple;
	bh=QQ4IFPN76WYKUeJ8iPjQUcnbCT6avWRU1Z7nYizdAJY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FKWdaQptkf2DxRpjH/zvG8USymfox2zfdySsxbkqaeZaj8oORAn53AYZrJRdWgEU8tJspz7wJOo8HFx91EoqWg5v0E7fc8S4SRMq4VQ1oLVWaqA1Cbl+rxEo+lET2jhO/mWdyALRfm0ZIy2/vn+j60rOyAeb6LgIaCgAMMzaef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=P3Xck4st; arc=none smtp.client-ip=60.244.123.138
X-UUID: 9e556baa710011f1b1788b6acf885367-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2JvbxehTNXphxdkZkbi39sn4vVu3QAtBBU3A0rabFqI=;
	b=P3Xck4stKKEr0rD6QtKUV/mPjqoOu5oO2yo3HJMQ4cQsPvGn2UCJPMk1W9cj2mN0ldDRcYI2JnhvWkTrQk0Fqy7EBfs9bZo/N7TzqKX+IUNoWDtnaCRGmddZjiH5SxwnQ64MqaBv4bW/prthsxGzMSQeXuGmj9fExnHTWcBjRW0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:5e947bd9-a731-494a-bc53-7a71c3ddf1bc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:b51220ee-45e6-4692-a476-3f71842ee83b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9e556baa710011f1b1788b6acf885367-20260626
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2083667251; Fri, 26 Jun 2026 09:44:49 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH v3 16/32] pinctrl: mediatek: mt8365: Enable module build support
Date: Fri, 26 Jun 2026 09:44:15 +0800
Message-ID: <20260626014442.2378513-17-justin.yeh@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38958-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:justin.yeh@mediatek.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[justin.yeh@mediatek.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mediatek.com:dkim,mediatek.com:email,mediatek.com:mid,mediatek.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 516A46C98C0

Add MODULE_LICENSE("GPL") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: e94d8b6fb83a ("pinctrl: mediatek: add support for mt8365 SoC")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8365.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 73916437080e..5cbdb7d8597d 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -293,7 +293,7 @@ config PINCTRL_MT8196
 	  map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT8365
-	bool "MediaTek MT8365 pin control"
+	tristate "MediaTek MT8365 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index c20b9e2e02dd..3777cbac4c1c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -494,4 +494,5 @@ static int __init mtk_pinctrl_init(void)
 arch_initcall(mtk_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8365 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Zhiyong Tao <zhiyong.tao@mediatek.com>");
-- 
2.45.2


