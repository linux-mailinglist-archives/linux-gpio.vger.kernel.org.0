Return-Path: <linux-gpio+bounces-39698-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pmvkOrJBT2r6cwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39698-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:37:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF572D3BF
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:37:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=B2u8TOzm;
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39698-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39698-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20B07302260C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 06:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4913A3D3CEA;
	Thu,  9 Jul 2026 06:35:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CBA3AFD0D;
	Thu,  9 Jul 2026 06:35:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578907; cv=none; b=Jq7PgoUj8TG2d2twmi1Os79+TRHJYm7Xbc5kCX4SrqtCTDHOiyNHlZbzdisKG8uV03YsfJiVzrW3Dw/qL6DFCPUSLgAqLZSwDHyjYRy7pBfk8M5bTHY5Pfo2fvDakafoJGqXLi/kvdsP1ztDWoyRg1YCNMUsZuBndD7puRuVekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578907; c=relaxed/simple;
	bh=K7UxhHp8jm44MMVDHP/vsmFkfgt3ZUTg0iTSkJ8zPqE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EA383bRahv705zQEZIpWgb8nJjxFu73P7G/WixTwrbAtTXKku9qQdia2FOHA4x6Kd7U2sWFTKBH+iTJFP+6p5yAykuzaCe+43+1m4+XBbdi7JB8qRfgEQt/7mQRX5tBjy4lxLbnPr0OS24lX/ohyp6x8hQw5maRVIr8mE47J+2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=B2u8TOzm; arc=none smtp.client-ip=210.61.82.184
X-UUID: 4e7b8af07b6011f18dc8c9802ae25ab1-20260709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=t8304IMO2r4pj+TUymf5H7uwDWcMKI91by7KxmjIwyA=;
	b=B2u8TOzmY9LXjuHEuhy7BJR1eI115+uoE17JmILhsKzNBGFahCbPmdDLeNXBREwCl3W/Ho/Uzf8LjgBVfzsMoeVO+SMwyLNB+kpy5e86MMn3iVNzAODH1b1OqSEuKDEdjrXteBDcRiKQRz/M6X07WZfgN84mrLvSj3citK+QmwM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:ddfe055f-c7c9-4033-8b7f-49f66cf17543,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:2e272f82-6310-4e6b-a6b1-aca20d98ed8b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4e7b8af07b6011f18dc8c9802ae25ab1-20260709
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1663356743; Thu, 09 Jul 2026 14:34:58 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
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
Subject: [PATCH v5 2/4] pinctrl: mediatek: allow common drivers to be built as modules
Date: Thu, 9 Jul 2026 14:33:47 +0800
Message-ID: <20260709063450.1615041-3-justin.yeh@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39698-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:justin.yeh@mediatek.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[justin.yeh@mediatek.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:from_mime,mediatek.com:email,mediatek.com:mid,mediatek.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85CF572D3BF

The MediaTek SoC pinctrl drivers link against the shared implementations
in pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c. These
were built-in only: their Kconfig symbols were bool, they did not export
their entry points and they carried no MODULE_LICENSE().

To let the individual SoC drivers be built as loadable modules (required
for Android GKI + vendor_dlkm, where vendor drivers must live outside the
GKI vmlinux), the shared code they depend on has to be modular too.
Otherwise selecting a SoC driver as =m forces the common symbol to =y and
the resulting module fails to link against the unexported common entry
points.

Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
tristate, export the entry points used by the SoC drivers, and add
MODULE_DESCRIPTION()/MODULE_LICENSE() to the three common files.

The v2 common code (PINCTRL_MTK_V2) is already modular, but mtk_rmw() was
never exported. It is called directly by SoC drivers such as mt7623, so
export it as well to keep those drivers linking once they are modular.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig                 | 6 +++---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 5 +++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c    | 8 ++++++++
 drivers/pinctrl/mediatek/pinctrl-mtmips.c        | 4 ++++
 5 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 97980cc28b9c..864e7ffc6044 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -11,7 +11,7 @@ config EINT_MTK
 	default PINCTRL_MTK_PARIS
 
 config PINCTRL_MTK
-	bool
+	tristate
 	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
@@ -22,13 +22,13 @@ config PINCTRL_MTK_V2
 	tristate
 
 config PINCTRL_MTK_MTMIPS
-	bool
+	tristate
 	depends on RALINK
 	select PINMUX
 	select GENERIC_PINCONF
 
 config PINCTRL_MTK_MOORE
-	bool
+	tristate
 	depends on OF
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 38f15dbe9a28..3247622911cd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/pinctrl/mt65xx.h>
 #include <linux/gpio/driver.h>
+#include <linux/module.h>
 
 #include <linux/pinctrl/consumer.h>
 
@@ -743,3 +744,7 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_moore_pinctrl_probe);
+
+MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Moore");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4918d38abfc2..3813dfb0fa7d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -69,6 +69,7 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
 
 	spin_unlock_irqrestore(&pctl->lock, flags);
 }
+EXPORT_SYMBOL_GPL(mtk_rmw);
 
 static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 				   const struct mtk_pin_desc *desc,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 791eddd7a2c6..a58015b508af 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -7,6 +7,7 @@
 
 #include <linux/io.h>
 #include <linux/gpio/driver.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
@@ -190,6 +191,7 @@ int mtk_pconf_spec_set_ies_smt_range(struct regmap *regmap,
 	regmap_write(regmap, reg_addr, bit);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pconf_spec_set_ies_smt_range);
 
 static const struct mtk_pin_drv_grp *mtk_find_pin_drv_grp_by_pin(
 		struct mtk_pinctrl *pctl,  unsigned long pin) {
@@ -297,6 +299,7 @@ int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pctrl_spec_pull_set_samereg);
 
 static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
 		unsigned int pin, bool enable, bool isup, unsigned int arg)
@@ -1149,6 +1152,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pctrl_init);
 
 int mtk_pctrl_common_probe(struct platform_device *pdev)
 {
@@ -1160,3 +1164,7 @@ int mtk_pctrl_common_probe(struct platform_device *pdev)
 
 	return mtk_pctrl_init(pdev, data, NULL);
 }
+EXPORT_SYMBOL_GPL(mtk_pctrl_common_probe);
+
+MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
index efd77b6c56a1..c9d9de68e282 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
@@ -349,3 +349,7 @@ int mtmips_pinctrl_init(struct platform_device *pdev,
 
 	return PTR_ERR_OR_ZERO(dev);
 }
+EXPORT_SYMBOL_GPL(mtmips_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MIPS Pinctrl Common Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


