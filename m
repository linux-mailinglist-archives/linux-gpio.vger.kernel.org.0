Return-Path: <linux-gpio+bounces-39696-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +KCvBOJBT2oIdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39696-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:38:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B36272D3EE
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:38:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=kSkOMtZA;
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39696-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39696-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFA47303E108
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 06:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D673D3D15;
	Thu,  9 Jul 2026 06:35:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BC43D3CE2;
	Thu,  9 Jul 2026 06:35:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578906; cv=none; b=PHu+W5GSC5xtShfzi22XpmKiHylFHt1inOrZu5gHSBm+kcfjAnJaMaL1LFu5bJGxzAcfpVycHrvwbnrtTQazz9PZSpw9NAXkxCvu/z96pNdvLeOYacxjCp9rXCawg334HXodWdyWYfFQDaGkwfDdLvaS0qFE/nT8nma4eS8CXAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578906; c=relaxed/simple;
	bh=VaF73BRK8yFmbIt4r0OavjxZHo9bBA/JIIKKOWfjL0c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jxdEuCvxrZw2JXhzJRZxLtu9UkUkwcSrxNuw1vgFgE4I6JPb5hy8ORDnDoUsTOQObqvTYcDqZ0dDIuSa69bddNF9vHV8erGZAA3JyrQIDkqO6cRW1iVtEDnxm+TxIS08uLuSocylgpZuUv1PtXELGK/2a9H1lZJp1TSoiL6xf+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kSkOMtZA; arc=none smtp.client-ip=60.244.123.138
X-UUID: 4e9672167b6011f1b1788b6acf885367-20260709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lDykNvXLA1BKy9kn6LHhkusEVdd4zEA8zctKSoB6T54=;
	b=kSkOMtZAzGPAbUdYixpvmKMlq0IRQl+YoZFBGYTWBLA21b45rGxcgfVuH/NIT9E1WHY7g6ai8af5wuZDkm5UE8OAtB5QBmuPEXUmULllZChzozqtgOn8+00SvaCyED/XIcSJLy8xk6J2tsFa52DEWT8rbYMLECvUJSe3ChS/Uew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:96bee9e9-90e9-4aee-90e1-c44395933950,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:cc8fe818-ab14-4403-9336-76696324c5a8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4e9672167b6011f1b1788b6acf885367-20260709
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1719929460; Thu, 09 Jul 2026 14:34:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
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
Subject: [PATCH v5 3/4] pinctrl: mediatek: mt7986: register both platform drivers from a single initcall
Date: Thu, 9 Jul 2026 14:33:48 +0800
Message-ID: <20260709063450.1615041-4-justin.yeh@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39696-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mediatek.com:from_mime,mediatek.com:email,mediatek.com:mid,mediatek.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B36272D3EE

The MT7986 driver registers two separate platform drivers (mt7986a and
mt7986b) and used to call arch_initcall() twice, once for each.

This is fine while the driver is built-in, but a single translation unit
can only provide one module_init(). Since arch_initcall() expands to
module_init() when built as a module, having two of them would break the
module build with a redefinition of init_module()/__inittest().

Fold both platform drivers into a single driver array and register them
from one initcall using platform_register_drivers(), matching the shape of
the other MediaTek pinctrl SoC drivers. platform_register_drivers() also
rolls back the first registration if the second one fails.

No functional change for built-in builds; this is a preparatory cleanup
for enabling module builds.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt7986.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 5dda4b7467fd..8dae91530d9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -997,15 +997,14 @@ static struct platform_driver mt7986b_pinctrl_driver = {
 	.probe = mt7986b_pinctrl_probe,
 };
 
-static int __init mt7986a_pinctrl_init(void)
-{
-	return platform_driver_register(&mt7986a_pinctrl_driver);
-}
+static struct platform_driver * const mt7986_pinctrl_drivers[] = {
+	&mt7986a_pinctrl_driver,
+	&mt7986b_pinctrl_driver,
+};
 
-static int __init mt7986b_pinctrl_init(void)
+static int __init mt7986_pinctrl_init(void)
 {
-	return platform_driver_register(&mt7986b_pinctrl_driver);
+	return platform_register_drivers(mt7986_pinctrl_drivers,
+					 ARRAY_SIZE(mt7986_pinctrl_drivers));
 }
-
-arch_initcall(mt7986a_pinctrl_init);
-arch_initcall(mt7986b_pinctrl_init);
+arch_initcall(mt7986_pinctrl_init);
-- 
2.45.2


