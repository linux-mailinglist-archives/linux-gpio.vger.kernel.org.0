Return-Path: <linux-gpio+bounces-38912-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ixBlCcTWPWrr6wgAu9opvQ
	(envelope-from <linux-gpio+bounces-38912-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 03:32:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82D6C970D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 03:32:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=PIk+zKAv;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38912-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38912-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63019304AF9E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 01:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E07D231A21;
	Fri, 26 Jun 2026 01:32:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70601A95E;
	Fri, 26 Jun 2026 01:32:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782437564; cv=none; b=Z+gSEjyvNk8Lx9jtl/dTvp9Tx9Q9iKZzugaefOmzylRg+HGc8RREGDXSS7LRXoVGq0NJW36TgAqw8Fy5THRxM3ewkZ+S9s7RBUoCSEds2+0XLi+5VmwD50obl4ocDZnzq71uc8syl3gG6y5y5YIo5BLc1lDPdBUKA0YD+JXTEBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782437564; c=relaxed/simple;
	bh=q+f8jRnhMWj2OiIaRA+f1d+dvjPUS8fIBm/zxwkHb8I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hnKUvQbY+VtDc+YYQumKJ7Xb0yyvNQC5NxaHMqob3JioELQdpngpQ+Ixhs5mkyivAsMP7jq85Z6rT8p8SXVaoVWAjGHhec1xu+rP7yxlWcdDxowy1OhNboWrZOzW/RgyQZNv42mtsyJ22fF+0fiCc8HPz9K81zWab7RBoMP29rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PIk+zKAv; arc=none smtp.client-ip=60.244.123.138
X-UUID: e4e270ec70fe11f1b1788b6acf885367-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EfICKHTjhqIjX6+sgXjXVPSSuSx8S4+s/vgscnmXaAs=;
	b=PIk+zKAvnSLi/dvqLEY9o0dAlaGLXrkOXMlXnXLuoTMPs4dXGzzzbt6sklu+quXg1ptB2f9HVl6nEKnXt1WHF1neTMMzxrbcadG1lHz31vmJWcIDJbZbO55fV3tLjPTkqhT4nLfTDcB3uZZBp/rSTegoY9Wo9JEK9/u8arXHoDs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:c7cab090-f8af-4e67-8112-773de04f4967,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:1b09baf7-0b89-48e7-aff3-7b92a9556644,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e4e270ec70fe11f1b1788b6acf885367-20260626
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1149426772; Fri, 26 Jun 2026 09:32:28 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:32:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:32:27 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v2 00/32] pinctrl: mediatek: Enable module build support for all drivers
Date: Fri, 26 Jun 2026 09:31:26 +0800
Message-ID: <20260626013217.2373808-1-justin.yeh@mediatek.com>
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
	TAGGED_FROM(0.00)[bounces-38912-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC82D6C970D

This series enables all MediaTek pinctrl drivers to be built as loadable
kernel modules. This is required for Android GKI (Generic Kernel Image) +
vendor_dlkm deployments where vendor-specific drivers must be kept separate
from the GKI vmlinux.

Each patch adds MODULE_LICENSE("GPL") and MODULE_DESCRIPTION() macros where
missing, and changes the Kconfig option from bool to tristate. This allows
these drivers to be properly packaged as vendor kernel modules while
maintaining the existing built-in option.

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


