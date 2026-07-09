Return-Path: <linux-gpio+bounces-39700-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M8nKKR1CT2oUdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39700-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:39:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA8F72D407
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:39:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=uemA1OlC;
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39700-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39700-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3418030E3726
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 06:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DB63D410A;
	Thu,  9 Jul 2026 06:35:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF103D34B6;
	Thu,  9 Jul 2026 06:35:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578912; cv=none; b=N50MEf+BrM1NbjZoJ267i8CbhJ/OsG9jFrqrXSF34B9FCPt4Ey/OO2jGHeJVR0tgDnahwjR925FnCBLQ4yMaBPH5hyjY26jvwOOYZ/QBXZdwZUqQHnsWeaTzeyq1MH4Tm4RGBPCag3dpzDj4BlRQXq6mKDG4cXaf0zVKIXOuLTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578912; c=relaxed/simple;
	bh=cQdVQxX7QpVZlAuVp6jdbDzIukhvNxwpiBhNAAXabLs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OucprWVH4G89vwYOgvUCxjU4BQsP2HmxezTNYR6iuk2sbRSCayNeKG1a3yLJOUG+G36kg8X6O3uVBoPYD5dSg22T83y83ckNqv4RmuIYDIBEReXJBksZLCpFNoMnfYHlCOlhYpTWkcxWPbz5RLT8rNpRR7Wy8Ynza54p7B4i1I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uemA1OlC; arc=none smtp.client-ip=60.244.123.138
X-UUID: 4eb86f387b6011f1b1788b6acf885367-20260709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5cOrE9Kq/yNbvphmTgMOa64TXmKalisj19jZJP/EO6A=;
	b=uemA1OlCsZxU/yyAU5pXFfxnBj4qA8yjV/K44s6EIVdqUKTnZOHWIGnjbBH7IhPndHdGh1uKXxNDm2adChKk+fK2y+Klli/+ZBCerzqBZnDolhgOdm/RjXu+9lQCPLgnAgAi6Fs0Bfbt14SqpSt5bdbOEdeHMB2ljs+WkkdXg0k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:ea6fb871-892b-4afd-9d39-57ee72b73dec,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:de22a303-430e-43d5-9a6c-19a994ddbd60,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4eb86f387b6011f1b1788b6acf885367-20260709
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1259481483; Thu, 09 Jul 2026 14:34:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 14:34:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 14:34:57 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v5 4/4] pinctrl: mediatek: enable module build support for all SoC drivers
Date: Thu, 9 Jul 2026 14:33:49 +0800
Message-ID: <20260709063450.1615041-5-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260709063450.1615041-1-justin.yeh@mediatek.com>
References: <20260709063450.1615041-1-justin.yeh@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39700-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:justin.yeh@mediatek.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[justin.yeh@mediatek.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:from_mime,mediatek.com:email,mediatek.com:mid,mediatek.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFA8F72D407

Convert the Kconfig option of every MediaTek pinctrl SoC driver from bool
to tristate and add MODULE_DESCRIPTION()/MODULE_LICENSE() so that they can
be built as loadable kernel modules.

This is required for Android GKI + vendor_dlkm deployments, where
vendor-specific drivers must be kept separate from the GKI vmlinux and
loaded as modules from the vendor partition.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 64 +++++++++++------------
 drivers/pinctrl/mediatek/pinctrl-mt2701.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt2712.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt6397.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt6795.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt6797.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt6878.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt6893.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt7620.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7621.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7622.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7623.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7629.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7981.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7986.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7988.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8127.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8135.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8167.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8173.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8183.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8186.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8188.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8192.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8196.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8365.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8516.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-rt2880.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-rt305x.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-rt3883.c |  3 ++
 33 files changed, 114 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 864e7ffc6044..611ca57ecefa 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -48,42 +48,42 @@ config PINCTRL_MTK_PARIS
 
 # For MIPS SoCs
 config PINCTRL_MT7620
-	bool "MediaTek MT7620 pin control"
+	tristate "MediaTek MT7620 pin control"
 	depends on SOC_MT7620 || COMPILE_TEST
 	depends on RALINK
 	default SOC_MT7620
 	select PINCTRL_MTK_MTMIPS
 
 config PINCTRL_MT7621
-	bool "MediaTek MT7621 pin control"
+	tristate "MediaTek MT7621 pin control"
 	depends on SOC_MT7621 || COMPILE_TEST
 	depends on RALINK
 	default SOC_MT7621
 	select PINCTRL_MTK_MTMIPS
 
 config PINCTRL_MT76X8
-	bool "MediaTek MT76X8 pin control"
+	tristate "MediaTek MT76X8 pin control"
 	depends on SOC_MT7620 || COMPILE_TEST
 	depends on RALINK
 	default SOC_MT7620
 	select PINCTRL_MTK_MTMIPS
 
 config PINCTRL_RT2880
-	bool "Ralink RT2880 pin control"
+	tristate "Ralink RT2880 pin control"
 	depends on SOC_RT288X || COMPILE_TEST
 	depends on RALINK
 	default SOC_RT288X
 	select PINCTRL_MTK_MTMIPS
 
 config PINCTRL_RT305X
-	bool "Ralink RT305X pin control"
+	tristate "Ralink RT305X pin control"
 	depends on SOC_RT305X || COMPILE_TEST
 	depends on RALINK
 	default SOC_RT305X
 	select PINCTRL_MTK_MTMIPS
 
 config PINCTRL_RT3883
-	bool "Ralink RT3883 pin control"
+	tristate "Ralink RT3883 pin control"
 	depends on SOC_RT3883 || COMPILE_TEST
 	depends on RALINK
 	default SOC_RT3883
@@ -91,35 +91,35 @@ config PINCTRL_RT3883
 
 # For ARMv7 SoCs
 config PINCTRL_MT2701
-	bool "MediaTek MT2701 pin control"
+	tristate "MediaTek MT2701 pin control"
 	depends on MACH_MT7623 || MACH_MT2701 || COMPILE_TEST
 	depends on OF
 	default MACH_MT2701
 	select PINCTRL_MTK
 
 config PINCTRL_MT7623
-	bool "MediaTek MT7623 pin control with generic binding"
+	tristate "MediaTek MT7623 pin control with generic binding"
 	depends on MACH_MT7623 || COMPILE_TEST
 	depends on OF
 	default MACH_MT7623
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7629
-	bool "MediaTek MT7629 pin control"
+	tristate "MediaTek MT7629 pin control"
 	depends on MACH_MT7629 || COMPILE_TEST
 	depends on OF
 	default MACH_MT7629
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT8135
-	bool "MediaTek MT8135 pin control"
+	tristate "MediaTek MT8135 pin control"
 	depends on MACH_MT8135 || COMPILE_TEST
 	depends on OF
 	default MACH_MT8135
 	select PINCTRL_MTK
 
 config PINCTRL_MT8127
-	bool "MediaTek MT8127 pin control"
+	tristate "MediaTek MT8127 pin control"
 	depends on MACH_MT8127 || COMPILE_TEST
 	depends on OF
 	default MACH_MT8127
@@ -127,7 +127,7 @@ config PINCTRL_MT8127
 
 # For ARMv8 SoCs
 config PINCTRL_MT2712
-	bool "MediaTek MT2712 pin control"
+	tristate "MediaTek MT2712 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
@@ -153,21 +153,21 @@ config PINCTRL_MT6779
 	  map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT6795
-	bool "MediaTek MT6795 pin control"
+	tristate "MediaTek MT6795 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT6797
-	bool "MediaTek MT6797 pin control"
+	tristate "MediaTek MT6797 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT6878
-	bool "MediaTek MT6878 pin control"
+	tristate "MediaTek MT6878 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
@@ -177,7 +177,7 @@ config PINCTRL_MT6878
 	  on the MediaTek MT6878 SoC.
 
 config PINCTRL_MT6893
-	bool "MediaTek Dimensity MT6893 pin control"
+	tristate "MediaTek Dimensity MT6893 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
@@ -187,63 +187,63 @@ config PINCTRL_MT6893
 	  on the MediaTek Dimensity 1200 MT6893 Smartphone SoC.
 
 config PINCTRL_MT7622
-	bool "MediaTek MT7622 pin control"
+	tristate "MediaTek MT7622 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7981
-	bool "MediaTek MT7981 pin control"
+	tristate "MediaTek MT7981 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7986
-	bool "MediaTek MT7986 pin control"
+	tristate "MediaTek MT7986 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7988
-	bool "Mediatek MT7988 pin control"
+	tristate "Mediatek MT7988 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT8167
-	bool "MediaTek MT8167 pin control"
+	tristate "MediaTek MT8167 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK
 
 config PINCTRL_MT8173
-	bool "MediaTek MT8173 pin control"
+	tristate "MediaTek MT8173 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK
 
 config PINCTRL_MT8183
-	bool "MediaTek MT8183 pin control"
+	tristate "MediaTek MT8183 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT8186
-	bool "MediaTek MT8186 pin control"
+	tristate "MediaTek MT8186 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT8188
-	bool "MediaTek MT8188 pin control"
+	tristate "MediaTek MT8188 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
@@ -255,7 +255,7 @@ config PINCTRL_MT8188
 	  map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT8189
-        bool "MediaTek MT8189 pin control"
+        tristate "MediaTek MT8189 pin control"
         depends on OF
         depends on ARM64 || COMPILE_TEST
         default ARM64 && ARCH_MEDIATEK
@@ -267,21 +267,21 @@ config PINCTRL_MT8189
           map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT8192
-	bool "MediaTek MT8192 pin control"
+	tristate "MediaTek MT8192 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT8195
-	bool "MediaTek MT8195 pin control"
+	tristate "MediaTek MT8195 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT8196
-	bool "MediaTek MT8196 pin control"
+	tristate "MediaTek MT8196 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
@@ -293,14 +293,14 @@ config PINCTRL_MT8196
 	  map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT8365
-	bool "MediaTek MT8365 pin control"
+	tristate "MediaTek MT8365 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK
 
 config PINCTRL_MT8516
-	bool "MediaTek MT8516 pin control"
+	tristate "MediaTek MT8516 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
@@ -308,7 +308,7 @@ config PINCTRL_MT8516
 
 # For PMIC
 config PINCTRL_MT6397
-	bool "MediaTek MT6397 pin control"
+	tristate "MediaTek MT6397 pin control"
 	depends on MFD_MT6397 || COMPILE_TEST
 	depends on OF
 	default MFD_MT6397
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2701.c b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
index 6b1c7122b0fb..a7d9b0b94713 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt2701.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
@@ -542,3 +542,6 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT2701 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2712.c b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
index bb7394ae252b..4b737c5ad147 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt2712.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
@@ -591,3 +591,6 @@ static int __init mtk_pinctrl_init(void)
 }
 
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT2712 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
index 03d0f65d7bcc..9ff479e7459a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
@@ -59,3 +59,6 @@ static struct platform_driver mtk_pinctrl_driver = {
 };
 
 builtin_platform_driver(mtk_pinctrl_driver);
+
+MODULE_DESCRIPTION("MediaTek MT6397 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6795.c b/drivers/pinctrl/mediatek/pinctrl-mt6795.c
index ee3ae3d2fa7e..78cd11c0381b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6795.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6795.c
@@ -622,3 +622,6 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mt6795_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT6795 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6797.c b/drivers/pinctrl/mediatek/pinctrl-mt6797.c
index 53f240491259..6f9b831f5334 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6797.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6797.c
@@ -75,3 +75,6 @@ static int __init mt6797_pinctrl_init(void)
 	return platform_driver_register(&mt6797_pinctrl_driver);
 }
 arch_initcall(mt6797_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT6797 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6878.c b/drivers/pinctrl/mediatek/pinctrl-mt6878.c
index b59ae089128a..9e832227391b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6878.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6878.c
@@ -1476,3 +1476,4 @@ static int __init mt6878_pinctrl_init(void)
 arch_initcall(mt6878_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT6878 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6893.c b/drivers/pinctrl/mediatek/pinctrl-mt6893.c
index 468ce0109b07..80fc4e933c5a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6893.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6893.c
@@ -877,3 +877,4 @@ static int __init mt6893_pinctrl_init(void)
 arch_initcall(mt6893_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT6893 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7620.c b/drivers/pinctrl/mediatek/pinctrl-mt7620.c
index d2624b9b5bc4..8d08a2e2dbb0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7620.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7620.c
@@ -135,3 +135,6 @@ static int __init mt7620_pinctrl_init(void)
 	return platform_driver_register(&mt7620_pinctrl_driver);
 }
 core_initcall_sync(mt7620_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7620 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7621.c b/drivers/pinctrl/mediatek/pinctrl-mt7621.c
index b18c1a47bbeb..3300d085a748 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7621.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7621.c
@@ -115,3 +115,6 @@ static int __init mt7621_pinctrl_init(void)
 	return platform_driver_register(&mt7621_pinctrl_driver);
 }
 core_initcall_sync(mt7621_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7621 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index d5777889448a..7fa7b163695d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -893,3 +893,6 @@ static int __init mt7622_pinctrl_init(void)
 	return platform_driver_register(&mt7622_pinctrl_driver);
 }
 arch_initcall(mt7622_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7622 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
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
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7629.c b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
index cc0694881ac9..d765e4382629 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7629.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
@@ -449,3 +449,6 @@ static int __init mt7629_pinctrl_init(void)
 	return platform_driver_register(&mt7629_pinctrl_driver);
 }
 arch_initcall(mt7629_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7629 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
index 2bc8d4409ca2..d4f8f9a200e4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
@@ -247,3 +247,6 @@ static int __init mt76x8_pinctrl_init(void)
 	return platform_driver_register(&mt76x8_pinctrl_driver);
 }
 core_initcall_sync(mt76x8_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT76X8 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 22c8f2480346..12f187061c60 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -1058,3 +1058,6 @@ static int __init mt7981_pinctrl_init(void)
 	return platform_driver_register(&mt7981_pinctrl_driver);
 }
 arch_initcall(mt7981_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7981 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 8dae91530d9b..e84b142d4d7f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -1008,3 +1008,6 @@ static int __init mt7986_pinctrl_init(void)
 					 ARRAY_SIZE(mt7986_pinctrl_drivers));
 }
 arch_initcall(mt7986_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7986 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index fd3a7ff0a04d..24484724b632 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1544,3 +1544,6 @@ static int __init mt7988_pinctrl_init(void)
 	return platform_driver_register(&mt7988_pinctrl_driver);
 }
 arch_initcall(mt7988_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7988 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8127.c b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
index f5030a9ea40b..35f4951e50d0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8127.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
@@ -307,3 +307,6 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8127 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
index 77c6ac464e86..83b53775f4e5 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
@@ -336,3 +336,6 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8135 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8167.c b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
index c812d614e9d4..ee294e1d408a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8167.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
@@ -343,3 +343,6 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8167 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8173.c b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
index b214deeafbf1..b1234ce2a52b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8173.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
@@ -356,3 +356,6 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8173 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8183.c b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
index 93e482c6b5fd..d15e8a9805c0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8183.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
@@ -586,3 +586,6 @@ static int __init mt8183_pinctrl_init(void)
 	return platform_driver_register(&mt8183_pinctrl_driver);
 }
 arch_initcall(mt8183_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8183 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8186.c b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
index dd19e74856a9..c0ab38d2ffad 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8186.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
@@ -1265,3 +1265,6 @@ static int __init mt8186_pinctrl_init(void)
 }
 
 arch_initcall(mt8186_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8186 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8188.c b/drivers/pinctrl/mediatek/pinctrl-mt8188.c
index 3975e99d9cf4..ff84bba7334c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8188.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8188.c
@@ -1671,3 +1671,4 @@ static int __init mt8188_pinctrl_init(void)
 arch_initcall(mt8188_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8188 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8189.c b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
index cd4cdff309a1..a9c128c514a4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8189.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
@@ -1696,3 +1696,4 @@ static int __init mt8189_pinctrl_init(void)
 arch_initcall(mt8189_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8189 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
index 3f8a9dbcb704..8a2f90f71bdc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
@@ -1431,3 +1431,4 @@ static int __init mt8192_pinctrl_init(void)
 arch_initcall(mt8192_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8192 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index 83345c52b2fa..8d893d57f14f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -978,3 +978,6 @@ static int __init mt8195_pinctrl_init(void)
 	return platform_driver_register(&mt8195_pinctrl_driver);
 }
 arch_initcall(mt8195_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8195 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8196.c b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
index dec957c1724b..29d17af788c0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8196.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
@@ -1856,3 +1856,4 @@ static int __init mt8196_pinctrl_init(void)
 arch_initcall(mt8196_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8196 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index c20b9e2e02dd..3777cbac4c1c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -494,4 +494,5 @@ static int __init mtk_pinctrl_init(void)
 arch_initcall(mtk_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8365 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Zhiyong Tao <zhiyong.tao@mediatek.com>");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8516.c b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
index 68d6638e7f4b..94de038026a3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8516.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
@@ -343,3 +343,6 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8516 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-rt2880.c b/drivers/pinctrl/mediatek/pinctrl-rt2880.c
index e0366721a515..587d782a9b67 100644
--- a/drivers/pinctrl/mediatek/pinctrl-rt2880.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt2880.c
@@ -59,3 +59,6 @@ static int __init rt2880_pinctrl_init(void)
 	return platform_driver_register(&rt2880_pinctrl_driver);
 }
 core_initcall_sync(rt2880_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek RT2880 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-rt305x.c b/drivers/pinctrl/mediatek/pinctrl-rt305x.c
index 77bd4d1f6122..6b108fecd9ae 100644
--- a/drivers/pinctrl/mediatek/pinctrl-rt305x.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt305x.c
@@ -138,3 +138,6 @@ static int __init rt305x_pinctrl_init(void)
 	return platform_driver_register(&rt305x_pinctrl_driver);
 }
 core_initcall_sync(rt305x_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek RT305X Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-rt3883.c b/drivers/pinctrl/mediatek/pinctrl-rt3883.c
index eeaf344c3647..87c37b178cfa 100644
--- a/drivers/pinctrl/mediatek/pinctrl-rt3883.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt3883.c
@@ -106,3 +106,6 @@ static int __init rt3883_pinctrl_init(void)
 	return platform_driver_register(&rt3883_pinctrl_driver);
 }
 core_initcall_sync(rt3883_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek RT3883 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


