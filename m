Return-Path: <linux-gpio+bounces-17873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1615A6C785
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 04:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EB24189B677
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 03:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F389139D1B;
	Sat, 22 Mar 2025 03:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Iys8Wmco"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8563829405;
	Sat, 22 Mar 2025 03:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742615610; cv=none; b=sV4ig9cg/fAKzb2+1UKtrNCX1Na44Cnj/Lwb9ajCxjOwZXEcO7xh9Tra+ml2dxtNXS/qT3N9NIhy7uEkRUSg8wUx7giNxebrcSYf5vypvTe7aqqqC3V/zIk9n8qomiGWlP6x3pOE6FNKJ3Jw59cAGCXI8dI8mExerBkgJ1SLqTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742615610; c=relaxed/simple;
	bh=4X+m4XC7CTtjiN51uzgpnEwwbkxAFEXHXJFNn54uUPg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PPShi+xrmHGvfS8fcixThxnJNNpiwDiNwYY3nN52XedfpUrl6ajGwqpl7Kpfqyo9efjobXkkHlqXISOUNnOOjfS/SMnBFOxVXXacG1yCDPij72ThpdF5GJsrE//vkWh92PCNjCzEvu/T6Fur3puoBT/gr3mgXHkJ4mOu5BAPK3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Iys8Wmco; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3263673e06d111f0aae1fd9735fae912-20250322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AfrfhfiDwEWjqU6NksjAAip06PQ6+L5UfJG10TSad50=;
	b=Iys8WmcorP1MYkyCmD07ErnI/UWsfL8Aw03G5g97TlxMb0FEPF843yqIJIIL+/twmIxg3GaY96rhPwVTHPj+Cv61R1c9EVl7NZEHtFT399f+ToL3fQhQEBdKv8UfClJXuG0F0RHKCdby8jqgoB+wdAYOZHAwl6OiPjXLoWYLLKM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:73451093-d524-46de-a022-a15eb59fe2a6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:19b8eefd-c03c-4d2b-a585-04cfa9287728,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3263673e06d111f0aae1fd9735fae912-20250322
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1355442811; Sat, 22 Mar 2025 11:53:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 22 Mar 2025 11:53:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 22 Mar 2025 11:53:19 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Hao
 Chang <ot_chhao.chang@mediatek.com>
Subject: [PATCH v5 0/1] Add EINT support for multiple addresses
Date: Sat, 22 Mar 2025 11:52:27 +0800
Message-ID: <20250322035307.4811-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

v5 changes:
1)Upload common code and remove irrelevant ones
2)Add pin list to find eint number

v4 changes:
1)Add err statement for exception handling
2)Add check for invalid pins
3)Use defined eint pins

v3 changes:
1)Add error judgment

v2 changes:
1)Remove instance structure
2)Modify the way to obtain eint address

Hao Chang (1):
  pinctrl: mediatek: Add EINT support for multiple addresses

 drivers/pinctrl/mediatek/mtk-eint.c           | 313 +++++++++++-------
 drivers/pinctrl/mediatek/mtk-eint.h           |  23 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  37 ++-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   1 +
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   7 +
 5 files changed, 254 insertions(+), 127 deletions(-)

-- 
2.46.0


