Return-Path: <linux-gpio+bounces-38952-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CQXREfDZPWqS7AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38952-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 03:46:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9E26C98DC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 03:46:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b="X+B1u/gu";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38952-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38952-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4877E30953F9
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 01:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F41308F38;
	Fri, 26 Jun 2026 01:44:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DEB2E738E;
	Fri, 26 Jun 2026 01:44:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782438297; cv=none; b=pKuhGGkdSg/oOHPO5gB1CkyX6r2UMxsjZPBN/HhKklszqzeeZ+8q1bLZskDUosCFtJI9Jd/Sd/GUP4yZy88nh8jefSYzTCYNqKBghyRpavolXo5HpwkAC4DJs6KCk1T75ZvATxf989Y3jMrJQ9xVKv4amYaA6ZS6uVthoJG/dCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782438297; c=relaxed/simple;
	bh=gSau6lnvxvv3pDAqVlUHKzX9wPKwHuOws11Eis5vszk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nCQ76YznU7vkDnRnpFo0bRFgJyidJGHP/9yHwLZxQ4m2di8q1kOJxGBgwVBvccp69/gstT/AJDNGe+uBi2j3IphTVaVEPs/OndELvKvrcundxYT5f6cTaXviyKCSmkIbYnyXSj9aCiPMcpLAW8dkTcHPzA/y4tMrFLHDlzcFXLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=X+B1u/gu; arc=none smtp.client-ip=60.244.123.138
X-UUID: 9cfa6b0c710011f1b1788b6acf885367-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7iQ85Poy2esGF4ob3nU160IenLBiFWw3qdWbIfhBEeI=;
	b=X+B1u/guZ5QHYgykqeSWYwNBFyRlbBZtuTiIK/C+z5JC3OJurdZJUQwhw/nhWiNrRwDlL+wubasqbwmj8KA4jvn/2uhc1kJ/7RJp2t5TrEMHPmx8D8Qb4F0I+i/UWUU1c+eJfEsOJ0nYMCL5xMGms8d4ZSmDyPgvMg96/zWHDHQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:edf81844-e53b-4f76-9c47-01a762ecfcec,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:e725baf7-0b89-48e7-aff3-7b92a9556644,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9cfa6b0c710011f1b1788b6acf885367-20260626
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1711144914; Fri, 26 Jun 2026 09:44:47 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:44:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:44:46 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v3 00/32] pinctrl: mediatek: Enable module build support for all drivers
Date: Fri, 26 Jun 2026 09:43:59 +0800
Message-ID: <20260626014442.2378513-1-justin.yeh@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38952-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:justin.yeh@mediatek.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[justin.yeh@mediatek.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:dkim,mediatek.com:mid,mediatek.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE9E26C98DC

This series enables all MediaTek pinctrl drivers to be built as loadable
kernel modules. This is required for Android GKI (Generic Kernel Image) +
vendor_dlkm deployments where vendor-specific drivers must be kept separate
from the GKI vmlinux.

Each patch adds MODULE_LICENSE("GPL v2") and MODULE_DESCRIPTION() macros where
missing, and changes the Kconfig option from bool to tristate. This allows
these drivers to be properly packaged as vendor kernel modules while
maintaining the existing built-in option.

Changes in v3:
  * Use MODULE_LICENSE("GPL v2") instead of "GPL" for consistency with
    existing MediaTek pinctrl drivers (mt6765, mt6779)

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


