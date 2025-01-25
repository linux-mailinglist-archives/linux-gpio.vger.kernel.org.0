Return-Path: <linux-gpio+bounces-15052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E70B0A1C082
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jan 2025 03:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0356D16BA52
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jan 2025 02:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A77B204F65;
	Sat, 25 Jan 2025 02:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oEni+9xB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EC6204C37;
	Sat, 25 Jan 2025 02:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737773520; cv=none; b=o1yHFvoJhur1vBaEMQecj0kixJ9JQuR9+xoKGrk9XeY1Wv9q2hHS6E4rpyCgn4mewW4GZY53MKwo3vqopyxSgdwwq1KDLwLNS0HXkq8oAh+P8Ttmcs/dUIELqnRQVXHPLG6ijOs8irjTeJvbcMGYlOdmw9YQdrmRyrEooN9LQKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737773520; c=relaxed/simple;
	bh=lmWdoIal9peCIg2XWZDlckh4uwkTsKOL4QjhFW7lh/Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YVCS5TpOHlxjBlOIYx439LmkarTVk1o87jVXjJXAXDqz6R+79TWOSaxKRjiW1o/6JO1Yp0GF9DSAFfw+3FWSEd2wlK8fNt5164eYHqDEKWedA4XZzHkyq+nsD0oK9ozLZuLuD3nv/N811RimdwqA3H0xiJVYYrSbkuK9LX4I9hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=oEni+9xB; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 538a0eeedac711efbd192953cf12861f-20250125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bbT7/cMJ6b0IwK66Kd6AS83TnC0ha8OJJhp7htsNqC4=;
	b=oEni+9xBi+xt0RmznEpKGz3mSIeh1IMCEfS2p7I60n1fN8Nt+NHIV4rRtCdVvCcKsocyTNTrGJjOz7F3ahIaxNh5YRbRMMCpOdQtFNL7DWSqQ1MWuDYP4Lzd6X1AOEQVCVLtxNMjbAFg+a5pFFBCO9Ewwk+L1oKhWWyt57L9J2M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:646577fc-cffb-4555-aba7-2c1aa3e91f4c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:0172b07e-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 538a0eeedac711efbd192953cf12861f-20250125
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 849263274; Sat, 25 Jan 2025 10:51:50 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 25 Jan 2025 10:51:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 25 Jan 2025 10:51:48 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <seann.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Hao
 Chang" <ot_chhao.chang@mediatek.com>
Subject: [RESEND v3 0/2]
Date: Sat, 25 Jan 2025 10:51:21 +0800
Message-ID: <20250125025145.14405-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Change in v3:
1)Add error handling to prevent memory leaks 2)Move the eint pin assignment action to eint for processing
---
This patch depends on
[v3,2/2] pinctrl: mediatek: add mt8196 driver [v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196

Please also accept this patch together with [1] to avoid build and dt binding check error.
[1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=&submitter=215008&state=&q=v3&archive=&delegate=
---

Hao Chang (2):
  pinctrl: mediatek: update EINT base retrieval method
  pinctrl: mediatek: adapt to multi-base design

 drivers/pinctrl/mediatek/mtk-eint.c           | 38 +++++++++-----
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 50 +++++++++++++------
 2 files changed, 60 insertions(+), 28 deletions(-)

-- 
2.46.0


