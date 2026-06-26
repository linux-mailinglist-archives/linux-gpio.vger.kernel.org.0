Return-Path: <linux-gpio+bounces-38962-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CryvB9zZPWqJ7AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38962-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 03:46:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9677B6C98CB
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 03:46:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=AEUfFQku;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38962-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38962-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C40643053087
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 01:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E607831DD96;
	Fri, 26 Jun 2026 01:44:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766102FFFB5;
	Fri, 26 Jun 2026 01:44:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782438299; cv=none; b=TasM1zJBG6pFuRMosPraAOZJp9451kvUP+DysWn80OIhLxfAekfO09Rq73nVLUJRahnNR0CpfevLRke1hnrM2r16hx7j0h64Yg3KenEJMer0wXJp1GckxUHMsI/rio6KzE3ccTbkx3I+jppNGi/Ij2ZInN6NW9xrE3rZTxaQtFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782438299; c=relaxed/simple;
	bh=Re3YvufRmMlGqMMBlCg9LicWRTpuaa3IWrv1SpN/aQA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DAP9bqzN55EMcaZaNuCSU7aVYVc8LCgkca5yxtS4KqZf9fWSWiK+MjuqgquZSysOBx23o7rXaqUn9I7LqWo1aPA8UldRBne54sd20ZO9yFs5nPBJNCrn43S/g19U+cdiGk2NXl7VmEfOVfhV/YZyf7IcJOWxJ2pj8muIbTuStmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AEUfFQku; arc=none smtp.client-ip=60.244.123.138
X-UUID: 9f9fb0a6710011f1b1788b6acf885367-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vhvh59lWTEUrnOgTHL1qORTkfQT1DLNol+ig84+PIA4=;
	b=AEUfFQkuMKeaiOm6zsXtWdNrCtopnpIO6oD1T/vaF+hw6wryZ4Ycup6+Y/h/QV5deltSScNMqTzR4Ne+wvlS210BYqxGJM1HgIZKYbscTn54mP6dzweQ3bda9nibPQm5Xhozl6q9hcoM8beDn4eKOHLEwRWO5yof3CX3cyhHD28=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:bb96a1e8-fd49-40d6-b3ff-77389cf5b18a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:e6e6a8a3-9384-4ef7-91b2-7b787d9b8841,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9f9fb0a6710011f1b1788b6acf885367-20260626
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 769174055; Fri, 26 Jun 2026 09:44:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:44:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:44:50 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v3 31/32] pinctrl: mediatek: mt6795: Enable module build support
Date: Fri, 26 Jun 2026 09:44:30 +0800
Message-ID: <20260626014442.2378513-32-justin.yeh@mediatek.com>
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
	TAGGED_FROM(0.00)[bounces-38962-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 9677B6C98CB

Add MODULE_LICENSE("GPL") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: 2e1ccc6a75cc ("pinctrl: mediatek: add mt6795 support")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt6795.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 358fd0889214..b06995d7b217 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -153,7 +153,7 @@ config PINCTRL_MT6779
 	  map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT6795
-	bool "MediaTek MT6795 pin control"
+	tristate "MediaTek MT6795 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
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
-- 
2.45.2


