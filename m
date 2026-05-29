Return-Path: <linux-gpio+bounces-37667-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJTJORhmGWoBwAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37667-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:10:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C65BC6007E4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB63E30ABCE6
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 10:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0292433711D;
	Fri, 29 May 2026 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A+2GhhGl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD53314B9D;
	Fri, 29 May 2026 10:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049041; cv=none; b=XyGssipGmi10eBIBtwaDuAc6Wsg2A1LAQnAipZYjzq7/j04t7KE3uDDlrXJXYkr2/piXJzKoN6xQ6iJah7L0CN4RtVqeFMJ9wfEHKlnGRWHd9qsx8tvjzVRx5M0hZNJ36bNWt4pc3vwJE1khjWVwfi/2yzYFw61pwNOnSKqbVX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049041; c=relaxed/simple;
	bh=t2HTPmTz/LIK6/SiTXkTK3385sQwTuxIgIl8+Lh3rFY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lyiVHbcMdphzQgW+azkgf3hmxjLD2kkn23PfnmXUXjCIfDTXvi15BJU1rfKyMZygNhdTzaSbRpDjjlMireztIRF1IYlol6noOuShRts2RzkKnckllt4T+Y/KcbyN7iOwciPUZ7WNqK3/xRh3NGQ/qepe8inWvWHT59l5OnGyX/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=A+2GhhGl; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b2a950245b4511f18dc8c9802ae25ab1-20260529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jxNKVfOIP5QBmB5Hp5S5jqq/Wjfw2+y9WckaJ2xilqE=;
	b=A+2GhhGlG4Ue+HM1hex/gu1ro+ywT11mQscu/JNxDqVY5rfe3lLqrKufpUJNhwN3BHj3iTalRMctcjhXWzZE9APEAcF+BKASgh2Sjd8ilvLFQv1mcVvIOQoFnGMhd8VUUfXHnctrXohJdmficrfO3C6AXFGAaK+9fEOKh9alZJw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:ec8eeabe-8388-410d-80b9-855468db287f,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:0a91d0f6-ddd5-40e6-821c-e08002aeddf5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b2a950245b4511f18dc8c9802ae25ab1-20260529
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1498118248; Fri, 29 May 2026 18:03:53 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 29 May 2026 18:03:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 29 May 2026 18:03:49 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 0/2] pinctrl: mediatek: Enable MT8189 as loadable module
Date: Fri, 29 May 2026 18:02:40 +0800
Message-ID: <20260529100308.51271-1-justin.yeh@mediatek.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37667-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[justin.yeh@mediatek.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[mediatek.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:mid,mediatek.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C65BC6007E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enables PINCTRL_MT8189 to be built as a loadable kernel
module, which is required for GKI (Generic Kernel Image) + vendor_dlkm
deployments where vendor-specific drivers must be kept separate from
the GKI vmlinux.

Patch 1 restores the tristate option that was recently changed to bool,
preventing module builds. Patch 2 adds the missing MODULE_LICENSE macro
that's required when building as a module.

Together these changes allow MT8189 pinctrl to be properly packaged as
a vendor kernel module while maintaining the existing built-in option.

Justin Yeh (2):
  pinctrl: mediatek: Restore PINCTRL_MT8189 to tristate
  pinctrl: mediatek: mt8189: Add MODULE_LICENSE declaration

 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8189.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.45.2


