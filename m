Return-Path: <linux-gpio+bounces-38978-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7TlRIZn5PWrG9ggAu9opvQ
	(envelope-from <linux-gpio+bounces-38978-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 06:01:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 543616C9FB6
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 06:01:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=TYjmYrTp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38978-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38978-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C20C303CE16
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 04:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7568539DBCC;
	Fri, 26 Jun 2026 04:01:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C8384CE4;
	Fri, 26 Jun 2026 04:01:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782446482; cv=none; b=GXMOGmiw6Rjzf31B7oLfr9459Vq3XFCbVlicKDKgx0TJB+j/U8CqeZseVHxaf1JWa2sUeEmu6ECkulbZzaqT52uxDW88V7f03g21JMHZlKVpi4bF6AS4WC8mtg2gAWRmXeHy+JLiZYa9ANod98oJ1b1vWx/JEycixbzcZTna4mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782446482; c=relaxed/simple;
	bh=QV+y4xjZsdeTbpBIJbQ3I8TqoFB8B2DWhhHMulN7YQI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YOUyJaMmHN6GNsdV7HEO3ahxv+rTnN6YNlDFt1EivYp9PUjbu+au1MjGC+LdRyhQIgGItagLaB1m4Qv95fvULbKt48l6lbxpY6JD7epSyrUnPh7IPRG7LUX4W6abn1m6g41ntuhiLJ/KSvw+G7ni8RCInJGD/OMlT9EV7EsVpgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TYjmYrTp; arc=none smtp.client-ip=210.61.82.184
X-UUID: ada0c632711311f18dc8c9802ae25ab1-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qoLhsaKF0XMnlzQT9UkysdX1D+uL4jIexeYAcszBsCk=;
	b=TYjmYrTpDs8Nh5H/Y5im7GNKjWngTfBry3mai29K7nO4+gWOR5OPNYRxHnN7uzK9VBaGQ4LwOUWVFPl7eCiMOg7L4AlPmm5zlcdbXye278000deY+QIPLpBiQ5y1YXMuF+XF6lBP4FeZcKu/2DRkjtkN/FRLcFYg/v/wpPw1NCk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:d75dd093-e5bd-46d6-926c-8059d773253e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:4bc2013e-d78a-4ead-a7dd-d931571248ad,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ada0c632711311f18dc8c9802ae25ab1-20260626
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 63416359; Fri, 26 Jun 2026 12:01:15 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 12:01:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 12:01:15 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v4 00/32] pinctrl: mediatek: Enable module build support for all drivers
Date: Fri, 26 Jun 2026 12:00:29 +0800
Message-ID: <20260626040112.2436185-1-justin.yeh@mediatek.com>
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
	TAGGED_FROM(0.00)[bounces-38978-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mediatek.com:dkim,mediatek.com:mid,mediatek.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 543616C9FB6

Sorry for the quick v4 - v3 was sent with an incomplete cover letter
(template placeholders) by mistake. This v4 also unifies MODULE_LICENSE
to consistently use "GPL v2" across all patches.

This series enables all MediaTek pinctrl drivers to be built as loadable
kernel modules. This is required for Android GKI (Generic Kernel Image) +
vendor_dlkm deployments where vendor-specific drivers must be kept separate
from the GKI vmlinux.

Each patch adds MODULE_LICENSE("GPL v2") and MODULE_DESCRIPTION() macros where
missing, and changes the Kconfig option from bool to tristate. This allows
these drivers to be properly packaged as vendor kernel modules while
maintaining the existing built-in option.

Changes in v4:
  * Fix cover letter content (v3 accidentally sent with template placeholders)
  * Unify MODULE_LICENSE to use "GPL v2" consistently across all drivers
  * Update all commit messages to reflect "GPL v2" instead of "GPL"

Changes in v3:
  * Add MODULE_DESCRIPTION() for all drivers (even those that already had MODULE_LICENSE)
  * Update commit messages to reflect that we're adding MODULE_DESCRIPTION too

Changes in v2:
  * Squash MODULE_LICENSE and tristate changes into single patch per driver
  * Extend fix to all MediaTek pinctrl drivers (32 total), not just MT8189
  * Add Android GKI + vendor_dlkm context to cover letter
  * Add MODULE_DESCRIPTION() where it was missing
  * Add Fixes: tags referencing the original commits that added each driver

Justin Yeh (32):
  pinctrl: mediatek: mt8189: Enable module build support
  pinctrl: mediatek: mt6878: Enable module build support
  pinctrl: mediatek: mt6893: Enable module build support
  pinctrl: mediatek: mt7622: Enable module build support
  pinctrl: mediatek: mt7981: Enable module build support
  pinctrl: mediatek: mt7986: Enable module build support
  pinctrl: mediatek: mt7988: Enable module build support
  pinctrl: mediatek: mt8167: Enable module build support
  pinctrl: mediatek: mt8173: Enable module build support
  pinctrl: mediatek: mt8183: Enable module build support
  pinctrl: mediatek: mt8186: Enable module build support
  pinctrl: mediatek: mt8188: Enable module build support
  pinctrl: mediatek: mt8192: Enable module build support
  pinctrl: mediatek: mt8195: Enable module build support
  pinctrl: mediatek: mt8196: Enable module build support
  pinctrl: mediatek: mt8365: Enable module build support
  pinctrl: mediatek: mt8516: Enable module build support
  pinctrl: mediatek: mt2701: Enable module build support
  pinctrl: mediatek: mt7623: Enable module build support
  pinctrl: mediatek: mt7629: Enable module build support
  pinctrl: mediatek: mt8135: Enable module build support
  pinctrl: mediatek: mt8127: Enable module build support
  pinctrl: mediatek: mt7620: Enable module build support
  pinctrl: mediatek: mt7621: Enable module build support
  pinctrl: mediatek: mt76x8: Enable module build support
  pinctrl: mediatek: rt2880: Enable module build support
  pinctrl: mediatek: rt305x: Enable module build support
  pinctrl: mediatek: rt3883: Enable module build support
  pinctrl: mediatek: mt6397: Enable module build support
  pinctrl: mediatek: mt2712: Enable module build support
  pinctrl: mediatek: mt6795: Enable module build support
  pinctrl: mediatek: mt6797: Enable module build support

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

-- 
2.45.2


