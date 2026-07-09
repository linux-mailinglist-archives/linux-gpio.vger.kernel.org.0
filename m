Return-Path: <linux-gpio+bounces-39699-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5NfVG8hBT2oFdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39699-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:38:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB95772D3E0
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:37:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=uIUMQUWW;
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39699-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39699-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DD9B303FA80
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 06:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72C63D524D;
	Thu,  9 Jul 2026 06:35:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7393AA182;
	Thu,  9 Jul 2026 06:35:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578907; cv=none; b=BDaEPeLXLUsBzn0thGdZsIYiavVwzoxr7vbCpaikg1KJzanJ2Kp5MHoDxRDb0hh9Pjn+ufBjNwtmuHfQDuMhnYWxjUjwumeTw0UbwhxqaM+4rSdfWOChOaKGdAUGOfQOAD27z6crtTsclgZ+SaaFAiFlhGyTT+KG1BgxAsa5buo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578907; c=relaxed/simple;
	bh=Rb1x7GD3b7550Csh99Kya/8ycDPL/p9EJ7HniL2XVw0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ry5rFvjJIuKcrknjcoDgdPKXKO0PnOHygrwHBWz/fFYTb7fTv4DVD8sW/TZ7ZjJVN2zkFarouB/brhokHdVcf2wvvKZ80UZhbInSNv4A/T69TM8QWkk8HDCG8T5dcJiXTihlaLQoDXswcDISM0n94zVQimd7mlrovmX1PCcfOzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uIUMQUWW; arc=none smtp.client-ip=60.244.123.138
X-UUID: 4e5075ea7b6011f1b1788b6acf885367-20260709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kx92eSz8R01PdV73y/bFunJL9N4KLtytD6payHfgzoQ=;
	b=uIUMQUWWN52ke61wtrOofHqgMy2oDaJP+wSBG/itsxvh3O+1tXH/A6IXWwMcynC/cyMA9pEvwM/7dfCPUOgp+sN2ed9kSQxJIAiD0tAKjE7luvVsk/vVkF54srJEFm7MBpPqER2j+qnzZLkqtVNeAnCq47K68NfTosfTeBD+pSY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:bfcf0893-2ccd-433b-9aea-bc9f4e8cfdaa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:cd8fe818-ab14-4403-9336-76696324c5a8,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4e5075ea7b6011f1b1788b6acf885367-20260709
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1911652399; Thu, 09 Jul 2026 14:34:58 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
Subject: [PATCH v5 0/4] pinctrl: mediatek: Enable module build support
Date: Thu, 9 Jul 2026 14:33:45 +0800
Message-ID: <20260709063450.1615041-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
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
	TAGGED_FROM(0.00)[bounces-39699-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:from_mime,mediatek.com:dkim,mediatek.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB95772D3E0

This series lets the MediaTek pinctrl drivers be built as loadable
kernel modules. This is required for Android GKI + vendor_dlkm
deployments, where vendor-specific drivers must be kept separate from
the GKI vmlinux and loaded as modules from the vendor partition.

Enabling the individual SoC drivers as modules is a single logical step,
but it has a few prerequisites, so the series is:

  1. Fix a pre-existing GPIO chip lifecycle bug. The gpio_chip lives in
     device-managed memory but is registered with the non-managed
     gpiochip_add_data(). While the drivers were built-in only this was
     harmless, but once they can be unbound/rmmod'd, devm frees the
     backing memory while the chip is still registered (use-after-free).
     Switch to devm_gpiochip_add_data() in the shared probe/init paths.
     This affects the v1 common code (pinctrl-mtk-common.c) as well as
     the moore and paris common code, which is where the v2 SoCs
     register their gpio_chip (pinctrl-mtk-common-v2.c itself does not
     register one, so it is untouched).

  2. Make the shared common code modular. The SoC drivers link against
     pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c,
     whose Kconfig symbols were bool and which exported nothing. Without
     this, selecting a SoC driver as =m forces the common symbol to =y
     and the module fails to link against the unexported entry points
     (e.g. allmodconfig would break). Convert PINCTRL_MTK,
     PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to tristate, export the
     entry points, and add MODULE_LICENSE()/MODULE_DESCRIPTION(). The
     already-modular v2 common code additionally needs mtk_rmw()
     exported, since it is called directly by SoC drivers such as
     mt7623 and would otherwise be undefined once those are modular.

  3. Convert the MT7986 driver to a single initcall. It registers two
     platform drivers (mt7986a/mt7986b) and used to call arch_initcall()
     twice. That is fine when built-in, but a module has only one
     module_init(), so two arch_initcall()s break the module build with
     a redefinition of init_module()/__inittest(). Fold both drivers
     into one platform_register_drivers() call from a single initcall.
     No functional change when built-in.

  4. Flip every SoC driver's Kconfig from bool to tristate and add the
     module metadata.

The series builds cleanly under allmodconfig on arm64 (all SoC drivers
as =m).

Changes since v4:
 - Squashed the 32 per-driver "Enable module build support" patches into
   a single patch (4/4), as requested by Linus Walleij.
 - Added patch 1/4 fixing the gpio_chip lifecycle (devm) bug, as a
   prerequisite for making the drivers unloadable, per Linus Walleij's
   review.
 - Added patch 2/4 converting the shared common drivers to modules, so
   that the v1/moore/mtmips SoC drivers can actually link as modules
   (without it 21 of the SoC drivers would fail to build as =m). Also
   export mtk_rmw() from the v2 common code (fixes a modpost
   "mtk_rmw undefined" error on the mt7623 module).
 - Added patch 3/4 folding MT7986's two arch_initcall()s into a single
   initcall (fixes an init_module()/__inittest() redefinition when the
   driver is built as a module).
 - Dropped the (inappropriate) per-driver Fixes: tags from the module
   enablement patch; it is a feature change, not a fix.

The Reviewed-by on patch 4/4 is carried over from the per-driver patches
reviewed in v4; the reviewer agreed to preserve it across the squash.
Note that the MT7986 single-initcall change that was part of that patch
has been split out into patch 3/4, so patch 4/4 now only flips Kconfig
and adds module metadata. Patches 1/4, 2/4 and 3/4 have not been
reviewed yet.

Justin Yeh (4):
  pinctrl: mediatek: use devm_gpiochip_add_data() for GPIO chip
  pinctrl: mediatek: allow common drivers to be built as modules
  pinctrl: mediatek: mt7986: register both platform drivers from a
    single initcall
  pinctrl: mediatek: enable module build support for all SoC drivers

 drivers/pinctrl/mediatek/Kconfig              | 70 +++++++++----------
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 11 +--
 drivers/pinctrl/mediatek/pinctrl-mt2701.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt2712.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6795.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6797.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6878.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt6893.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt7620.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7621.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7622.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7623.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7629.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7981.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     | 18 ++---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8127.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8135.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8173.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8183.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8186.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8188.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8192.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8365.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     |  3 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 22 +++---
 drivers/pinctrl/mediatek/pinctrl-mtmips.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  2 +-
 drivers/pinctrl/mediatek/pinctrl-rt2880.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-rt305x.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-rt3883.c     |  3 +
 38 files changed, 149 insertions(+), 58 deletions(-)


base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
-- 
2.45.2


