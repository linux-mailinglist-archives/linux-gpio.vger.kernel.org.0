Return-Path: <linux-gpio+bounces-39959-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2tePFTCmVGoxowMAu9opvQ
	(envelope-from <linux-gpio+bounces-39959-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:47:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 708D9748E62
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:47:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=CWnHJa57;
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39959-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39959-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C5A3301CD1D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 08:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1473B8407;
	Mon, 13 Jul 2026 08:38:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE813B71C4;
	Mon, 13 Jul 2026 08:38:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931908; cv=none; b=Aldm4nyEcvxDq4auNwDsBP0d7QetDq0Ss75nyg/OEFAZdwng/zbSf1OY5MfRQOEg+RhPLUZdQKEt5twTeRj4+Qpzuan5wiVmYWWdLHdCdAQlckQYBez7Ht+qv1nP3MoiBnpK9bLJC1+gDPO8ej+/9GkVU6pQGn9auLsx34VCPVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931908; c=relaxed/simple;
	bh=51rIbr3C5gbwywnETF+Wsf+uapYRIxdDcZSNjIjvka0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fdrOrDnxb6xFRys0VRADO2W9WJYeYOPeCgJHTLwJJ8bZIoZd0lI/2oPJRXFLcuZ39RDWucFMnz1QTTvMEpr5IKPc2MeqDlWrOZMtZZRdBPT7DdddaaOnuBLypS/LuVr3sF6JZxj5spmLyWvEAguTPK+qf65kGO04Z3Hxe86a4TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CWnHJa57; arc=none smtp.client-ip=60.244.123.138
X-UUID: 30683c287e9611f1b1788b6acf885367-20260713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=p1PZnOGeUu2VInYWfVlPBxJM1TfFS1WSojIp0dBKp9s=;
	b=CWnHJa576gT9BLukZ+5nQFd6xR44k1ayGH60NavTgsEByyotPXLC7te9qEBQhEjm9L8YNmxAv+U5V8mWQPJoggXmSmgF95l3VObAXq2UaP1ZtT+mWdODb6sQKBoOQRTtpEkSfrZmRSSDTh43P3Q7uxgkA4mnTtvHJaYqVrpb+hA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:6b6a44a1-3491-4e92-9d68-f31f902fe687,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:9e2046f9-4b72-4a52-91ca-f4585405c3b0,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 30683c287e9611f1b1788b6acf885367-20260713
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 187457483; Mon, 13 Jul 2026 16:38:14 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Jul 2026 16:38:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Jul 2026 16:38:13 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v6 0/5] pinctrl: mediatek: Enable module build support
Date: Mon, 13 Jul 2026 16:37:52 +0800
Message-ID: <20260713083808.168957-1-justin.yeh@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39959-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:justin.yeh@mediatek.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[justin.yeh@mediatek.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,chromium.org:email,mediatek.com:from_mime,mediatek.com:dkim,mediatek.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 708D9748E62

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

  2. Fix a pre-existing EINT resource leak on unbind. mtk_eint_do_init()
     creates an IRQ domain, an interrupt mapping per EINT line and a
     chained handler on the parent interrupt, none of which were ever
     released. Once the drivers can be unbound/rmmod'd this leaves a
     dangling IRQ domain, mappings whose chip data points at freed
     memory, and a chained handler still firing into that freed data.
     Tear them down with a device-managed action, matching the devm
     lifecycle used for the gpio_chip.

  3. Make the shared common code modular. The SoC drivers link against
     pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c,
     whose Kconfig symbols were bool and which exported nothing. Without
     this, selecting a SoC driver as =m forces the common symbol to =y
     and the module fails to link against the unexported entry points.
     Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
     tristate, export the entry points, and add MODULE_LICENSE()/
     MODULE_DESCRIPTION(). The already-modular v2 common code
     additionally needs mtk_rmw() exported, since it is called directly
     by SoC drivers such as mt7623. The shared symbols are exported in
     the "MTK_PINCTRL" symbol namespace (EXPORT_SYMBOL_NS_GPL()), and
     each SoC driver that uses them declares MODULE_IMPORT_NS().

  4. Convert the MT7986 driver to a single initcall. It registers two
     platform drivers (mt7986a/mt7986b) and used to call arch_initcall()
     twice. A module has only one module_init(), so two arch_initcall()s
     break the module build with a redefinition of
     init_module()/__inittest(). Fold both drivers into one
     platform_register_drivers() call from a single initcall. No
     functional change when built-in.

  5. Flip every SoC driver's Kconfig from bool to tristate and add the
     module metadata.

The series builds cleanly under allmodconfig on arm64 (all SoC drivers
as =m).

Changes in v6:
 - Export the shared common symbols in the "MTK_PINCTRL" namespace using
   EXPORT_SYMBOL_NS_GPL() instead of the global EXPORT_SYMBOL_GPL(), and
   add MODULE_IMPORT_NS("MTK_PINCTRL") to every SoC driver that consumes
   them, as suggested by Chen-Yu Tsai while reviewing the common-driver
   patch (patch 3/5).
 - Added a new patch, "pinctrl: mediatek: free EINT resources on unbind"
   (patch 2/5). Chen-Yu Tsai pointed out that the manual cleanup removed
   in patch 1/5 also used to cover mtk_eint_init(), and that converting
   to devm without an EINT counterpart would leave a dangling IRQ domain
   and an active-but-stale chained handler on rmmod/unbind. As suggested,
   this is a separate patch rather than folded into patch 1/5.
 - Added Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> to patch 1/5
   (devm_gpiochip_add_data) and patch 4/5 (mt7986 single initcall).

Review status: patches 1/5 and 4/5 carry Chen-Yu Tsai's Reviewed-by;
patch 5/5 carries AngeloGioacchino Del Regno's Reviewed-by (from the
per-driver patches reviewed in v4, preserved across the squash). Patches
2/5 and 3/5 have not been reviewed yet.

Justin Yeh (5):
  pinctrl: mediatek: use devm_gpiochip_add_data() for GPIO chip
  pinctrl: mediatek: free EINT resources on unbind
  pinctrl: mediatek: allow common drivers to be built as modules
  pinctrl: mediatek: mt7986: register both platform drivers from a
    single initcall
  pinctrl: mediatek: enable module build support for all SoC drivers

 drivers/pinctrl/mediatek/Kconfig              | 70 +++++++++----------
 drivers/pinctrl/mediatek/mtk-eint.c           | 21 +++++-
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 11 +--
 drivers/pinctrl/mediatek/pinctrl-mt2701.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt2712.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt6795.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6797.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6878.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt6893.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt7620.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7621.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7622.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7623.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7629.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7981.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     | 19 ++---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt8127.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt8135.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt8173.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt8183.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8186.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8188.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8192.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8365.c     |  2 +
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     |  4 ++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 22 +++---
 drivers/pinctrl/mediatek/pinctrl-mtmips.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  2 +-
 drivers/pinctrl/mediatek/pinctrl-rt2880.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-rt305x.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-rt3883.c     |  4 ++
 39 files changed, 190 insertions(+), 59 deletions(-)


base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
-- 
2.45.2


