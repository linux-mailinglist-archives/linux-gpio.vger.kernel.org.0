Return-Path: <linux-gpio+bounces-22390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E69AED425
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 07:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D0F416E788
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 05:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E581C861B;
	Mon, 30 Jun 2025 05:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DCPr8wvR";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XuBYR8YH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E701A0B0E;
	Mon, 30 Jun 2025 05:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751263068; cv=fail; b=pgV3VmegqxCYIK/n3uEHRyFlsEdot4OLrAa1o5aWh/4vpBrnErKC/HAdeOzzwFWmdsDadNdAa7WVCJ6cKRZBQ1HPFZ4YLHajJV1zbyEWVCV7EOX0Gyq2PjHaDgg9eua8xqL/RFo5xnB8f4LaYDBxbzwn2zh0K5nwJJG0H7qg3A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751263068; c=relaxed/simple;
	bh=wAp4lzGImVNIbY2Pve6PHaG8l9Qa+HvSq2pqVBtzFe4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qo90Bj8TXqHuhpwna0/KdbEn5VUUmOnNTC+eUac92eswLRX6+wXnOceSkLDd0jrAKoSu8tS3vFLr/vjeqETq0OjFlKciL/53/CscrWqUIFkuB94OQfF/5bkDOi3g4wMxC1XBpRmw4fpg9Hvn5aUp/0o6gE7284Ez0VtjQJpRZxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=DCPr8wvR; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=XuBYR8YH; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1d346af8557711f0b33aeb1e7f16c2b6-20250630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wAp4lzGImVNIbY2Pve6PHaG8l9Qa+HvSq2pqVBtzFe4=;
	b=DCPr8wvRb368gWRbZL9ExiCb++ik8K6o2/gKC0Uu3yB+w66gNxdjq2tWilh3CmtK2qxTTgD8UkXJRMwYM0uZOY24JhU3T575YDUFBIKENclWm5dX2j8Z1h7jSAAaE19Ze3uz7KMO6p5EIThaKJcKxYCtOoa/dtFIy5kEurTYj8Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:d7b6fe9b-1df9-4796-a3d6-8ddba7b63fd6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:7fc55682-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1d346af8557711f0b33aeb1e7f16c2b6-20250630
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 483784409; Mon, 30 Jun 2025 13:57:32 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 30 Jun 2025 13:57:31 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 30 Jun 2025 13:57:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C96hRTp1++YZJpaExMeG63sb52myGrJ9npBsfzCg3M3b6IGFF2lDVM7NSfXlxnfsQ522t3huM2x3nAhRX6gPFaLzJ2ie1i8ab7uqAqZDAiY7gNSiO1oNq6/gXXEr1JHUH1SiwZD5gEVP67wCYUPum9bn8m3R6nECBvftR2KwQc6FjlZtwzW9pcIhtuMG1uF/wMsJri9H85O6y5sE7gDx2yxI5KlNaIAqQ3bI+T9URRykNBdf+z8M3UVgs1dyF4PWedtZLdPt33Z/kHH3notUX46eYdAELHbY1ILwyCvIWEa9sxOuBN/3pS+9sRCMiizb0H/kMB4V9N8kMEHgkg9brA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAp4lzGImVNIbY2Pve6PHaG8l9Qa+HvSq2pqVBtzFe4=;
 b=NkeXyhcoNBqwid24NtBClr+TCFKXaS+zv+nalCQOyuwl+ieNGOcaGja+8v5eaFOyncJDy3InYFSPy3BgeLt3yUq0VwKf2C2MaLBXkqtuah+SDnUSAnnEH2NzaCsmRTuH+sFJujnaTkkuh8KNyq9EhNmukBMsE02nVQFMuHWj7wwAZImHjaxj8gjynELjxHEA/8VQRycJCzzpR0RVgSEPO3nBLh7OJQM4ufUYCSYoTK1iPV3diiJ8JOGiluLzi4HP3Zp0QnIGjdSUX9wiyBAyUMvzmv1Pt0IBbpWllyolnk34kHkhTc5eatAYbemtesK33bEMOqWRAcHETVqt3YMQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAp4lzGImVNIbY2Pve6PHaG8l9Qa+HvSq2pqVBtzFe4=;
 b=XuBYR8YHLlE32K/MBTCtkyNO+eoEP2Ceuon8lbIvjDQxt7eBNOHMzckdlqM+qPCpdBiejiZ71ss0lSTtz/9Le7xlfkxy3Jkj0FSsPwdzC+FKHBb0bNlq8JAcgI5qIkAl3/oRqqByziZRyQ5QPZgTHjgxaPm61Snr+8dglHZhPlU=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by JH0PR03MB7421.apcprd03.prod.outlook.com (2603:1096:990:1b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 05:57:26 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%4]) with mapi id 15.20.8857.022; Mon, 30 Jun 2025
 05:57:26 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "sean.wang@kernel.org" <sean.wang@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>
Subject: Re: [PATCH 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Thread-Topic: [PATCH 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Thread-Index: AQHby8ckvSDB25TMQEGSiMP1B2tM5LP8aLwAgB8HZYA=
Date: Mon, 30 Jun 2025 05:57:25 +0000
Message-ID: <cc6d95094abf6f3911f93dacca0d6af0a8cb57d2.camel@mediatek.com>
References: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
	 <CACRpkdaGMiNwBAa60hFzsboV3JCj=sWVz-NKah=eNk+vVnUHVw@mail.gmail.com>
In-Reply-To: <CACRpkdaGMiNwBAa60hFzsboV3JCj=sWVz-NKah=eNk+vVnUHVw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|JH0PR03MB7421:EE_
x-ms-office365-filtering-correlation-id: e7080d5b-a7d0-4493-a640-08ddb79afd66
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V0QreG14OFBlWldEZTBGNUQzalhMem1uM1BUVU84YUQ0R0xFd3NjczhlMEE2?=
 =?utf-8?B?QzF1U05TaER0Vjlqa1lmZDFaczVkK2pncTBrZjZmVTVMNGlKZVl0cW9rNm0v?=
 =?utf-8?B?eWNxbmN6Ukl3dDZjeDB2Z3VpdUJPTmZyejMxQVdZY3RXNTZsS2M2RUxEekJw?=
 =?utf-8?B?bGlDblZuS3o2V3FOK0ZkcTgvaVpKRVhEWFVrUEtIRXdEaFZnY2drcmxLY05i?=
 =?utf-8?B?YlgvV2paLzJCUTMzSGZGOGVTNVNCbnR2MTk5Q0hIUGtVajlkRHU3d054SE5a?=
 =?utf-8?B?Szk5QjlxY1N1cElXV0h3TE1MaGxvNVNXdStYMGRjWld6SGZGSk9jNGZ0N25C?=
 =?utf-8?B?N3hlZ24vc2x1eVdrMS9YQWlMVXI3SGZRZ1dMaWlYSlRkMWx0aEJCTmtubjM3?=
 =?utf-8?B?bGNpS1VyZE1RYktRcUtLZmY1ZDhiMXBvcTN5YnUvRW9YOWRJMnhFY0htMG13?=
 =?utf-8?B?ek94NDlvcHpUVVNSYktrK3BJbjdTekpITkFYc1N0bnUzNFBZRks5VytZMlBP?=
 =?utf-8?B?TmpkVC9wMTVSZFJJeFpvU0ZJMDRvU21Da3BFZjFBbmplN2U5aFRFSk5UNVlL?=
 =?utf-8?B?SzNpa0JHMmlFVHprRWdHYU43dys3V1NpMDJtbGJtdXFsV3l0d09VMEQvTWhB?=
 =?utf-8?B?K3hES0V0c0Y5cmVqQWhBbGM5R2hHWmROcWxwYzVHUkVFRnNvL0VBY2R3Rklw?=
 =?utf-8?B?Vlh0eWZNMlhBTVkvaENVT1c4RlRobWJacHA5amgwa1lqaXAwd1MvR2MzbXhw?=
 =?utf-8?B?bU91cTZWQksrbStsRTkyTGIwRU9GRGJDcWMvbnJNQXVZVHJMRDZEVVdIdHh5?=
 =?utf-8?B?SFk2QXF1cm5Xb2FDaDk4TENHWGtmMWFSU3VjcWJmam5rUmZuMkc5aTZadVBK?=
 =?utf-8?B?Z3RGNmxDYytyZ1VjVWdHMklyRXk1NjdlRTlYSmlndlFrS0R1TzZENnE4YVBB?=
 =?utf-8?B?UTBNbE1Zck53Uy94NWFMcE5uaTNUaGh4V0lER2VHNk9LR040Z1l4SDhoYU5j?=
 =?utf-8?B?OElBSmd4bUtMcXJYR1NQMXlPWU92N052NXlwNmJoblZBRzFuNTR4b2FqZTNx?=
 =?utf-8?B?amZ5SkppZlUwcElPUVpObXg4a0JIOFVKQk5CUExncjUxdGJ5WStHOFdBRCtt?=
 =?utf-8?B?cjFRRitBd1Q0clpDUXMxd081aDJWRnA4TmpXVUx6SDdIZU00dWZxTTEyd08x?=
 =?utf-8?B?dWFjOGxhc0dxSUlrOU1tQ1JlY250U0UvT2U3cHVUYWZWaXY3K3p1ckszNDdo?=
 =?utf-8?B?RkJsdFo1cWR5L0xNbnpNSFVCZHZHaHBDT3M2Vy8xU0ZoaUV2dGQ1Mnp4T3Y1?=
 =?utf-8?B?WXBMdlZNeU1YeGdFdGRGamRnVWMzcElxSVVSZ3pPWkZwSnZrY3hKVVZaL3Yr?=
 =?utf-8?B?TjRGZjVDTDIxL202NTMxL3hGbjcxTWhHYU9pdWZocngrOEFmREZwV1pyNWY3?=
 =?utf-8?B?UjBLV2tBWWptdVRXeURRaTRnYmIwNkRmV2NFZjEzREhMWW5qbENYeTNZWmYv?=
 =?utf-8?B?QUI0bkhOaW1Ga1JsbnVrdVlNeUUyRDJnL1JZbmo2amRqL3gvMDZENis0ZVZq?=
 =?utf-8?B?dHRXcWtjSzFQK0xlaVg3bzlTdnRRU0FmTzMxUjh4Mi9hL0FDWWQybUtPaGRv?=
 =?utf-8?B?Umo0bGdZK1RnYXgxd3E1VllqTGtuKytjR0xLSFR5dFI5eXBFQnJzWFRjZ016?=
 =?utf-8?B?SXVnbHNtYWR3cGwxV1ZXdWo4RUQ4NkNLeE5Wc05IVmp6TzliZ0JCUFpVaXJ1?=
 =?utf-8?B?QjgyMmVvWlpDcXBicFZuS2VQR0VzT2lDK29jTkJ0UUJRMlNaMFVvVTZVaTEz?=
 =?utf-8?B?MGE5dzh6d0o4ZkZSN1h2ck5aQW9kQXdyZjJzb2VWbmczWkg2ejZ3WHRXVU53?=
 =?utf-8?B?WmMwWEZjWE9KWXRtUkRKanVkdlNXR3hNcENwZVVialgwZEdLQkhuZkZuWWZv?=
 =?utf-8?B?WXByQkdmQitIVzFqZkFPYkZ1ZlFWNWRzZ2tERU1QR1ErWTBYbDBMaDgvVGFP?=
 =?utf-8?B?V3h1blN5VW1BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SElmU05ZckZOTS9aTE13a0NBMTN2K0p3VmxFSUNEMjFEV1hRSWtKZnlLTk9r?=
 =?utf-8?B?SHByS3RXb0lpQXpxYnZiOGF4b0tFZE14VUZxNjlGL2xHbG9HaGVHQ2c1MTZS?=
 =?utf-8?B?MmRqRkNHWDNBRmJWVmY5TkN1UitvYjNHZDZoSHhmU3FwZDBMRXJmWHpVT2lv?=
 =?utf-8?B?bUN4QWhCOHBXN0RjQ3pQUHFLa3J2UXRNOW5Fazh5ZU1iOWxmcUpmajJ2Zndh?=
 =?utf-8?B?ejdhWk81SGV5RTBoTmZCc0ZHWGRHUVl5QUxmUURHYlovQll4Y2t3RnM2bW9Q?=
 =?utf-8?B?a2Y4bEpuYVROdHNSbVFPQURTRExVQ2MwKy9ESEJmQmE5ZjBTRHpvZ2VWYzkv?=
 =?utf-8?B?bC9uL2VjMUJCSHYxVGR2Q2lpRGZ2MEovQUNUVXJwWGp4eDZXRXdXaXphNS9D?=
 =?utf-8?B?T0F6d2FxdG9XZ2pzMmRid1N5dDZDdDFKM2tBYkh4S2pGR2IrLythd0huVTN6?=
 =?utf-8?B?VjJoK0gwa3cyWXFuNmpZb0FzenEyN2FVL2xsSUpEeFRLUzY2TGpvWmVPUXl1?=
 =?utf-8?B?SXhManRyM0ZlUDNlTUFOb0FBem5HZ3RpWkdsQ0JjL0dKcXViVFlGTnA4QUJt?=
 =?utf-8?B?UnhFVHhtVi92ZGxVMzBneTh2bWZoaDVuSW5XaEUzSTBEMGlKNXNlb0hnMFRo?=
 =?utf-8?B?NVRkd29sZkJ5c1l2UGltUFFwREN3cHRDRG1XU1pGVHVtRzlCZk95eE1EeVQx?=
 =?utf-8?B?aHNHVE44UFVZTm1ydGlPb1JhQ3h1WWhIaU9nZGhNQnZOQUhhWVVYVCtRQ0ZX?=
 =?utf-8?B?R0V1aWlnRUlEalZyOTJUck4vSFphUFFJcjh4WW41U0pZMU90MFRReHhQcGJY?=
 =?utf-8?B?NFY5eVZiWXVZZ3k2T0RYNXdRRXoyYUdIRzdDcjRGNjg1RkFJTzBZUWtpZFY3?=
 =?utf-8?B?WFM4Y2I3NGM3Q1JJTjFuNC9ORDMvUnl5N3ROVUpJL1NlUEI0c0VuZGpDc2RX?=
 =?utf-8?B?WmZzV05BZnhqNysvT3lxbWZMNEhNR1RZbkVDWmxxMjZSR2tQTW1BWGgzTHhL?=
 =?utf-8?B?ZWRjdlN3QUd1K0Y4OFBrSS9WckdQWVVnV1N4b2ZvV3NEaUZTSkVrS3RUUHJs?=
 =?utf-8?B?UU5CZEVnZ2RLZlFOdHhYcUdGM0ZOVmhjV2JLRWF4Ni9rVmN4SHRIWndEbEZu?=
 =?utf-8?B?WW10bjIwU1d0bk43ZkRocTFaSEwrRTUrcnFrd0orOStIdmgvN01sWlZ4WENo?=
 =?utf-8?B?NG9Ra0pSTWU3WW9vRXkxWWdBOHhGeVpmOGt2bTVXa0lXVXpqanJvMGZqL2pB?=
 =?utf-8?B?WSt4MUxWWlhZRStzY0JYNlhpNzNPbkhkcW5rSVEyZnZvTDZoazNvcUVxVHNy?=
 =?utf-8?B?bStuNmtiWU9Mb0NlWENkZm9IME9rUWVuQ2YrS1F1eThvM2ZtU1VORmpoR3I5?=
 =?utf-8?B?YjYxZEpEeW1pRmdub0krQ05RditDTDNxRlY0S2VxTy9kMlk4RU16MFdmdWtk?=
 =?utf-8?B?ZG16VVpoUERXQzJLSzdWZDRLeGZyVUtyNUNkYzlSaDMxQWZRQzBKbStMcnpF?=
 =?utf-8?B?Q2hqOFNBNGFQOXRqOTFqdlNTVXpLZllVUUdNQllob21pQnlMZG0zMFZqc0RX?=
 =?utf-8?B?ejJwelZkQkJSVENzR1g5YWdqOTBFdUhTQ2RRekViOGlIbzV3VXFCUnRYaUJY?=
 =?utf-8?B?MEJ6cHBIb2l6bGw4NTJUVXBZaVgrRlhwYjd2K21sYWFpRk1KUHJKOUYwaDhT?=
 =?utf-8?B?ajZXMlZqbHQzOWFzZms5YUFSN0dzRG8zZEwyN1p5YTR0SVJLRDd2dFRFTXBC?=
 =?utf-8?B?TWxXTjdYOWh1dzlodUZRMC83U2dPdVFaM2ZpaUozSzJDY2IvRTdJbURYRWRy?=
 =?utf-8?B?RkliYXd2TlBlUTlGSUVXNEdkOER2OWorczMwSGVudWVKQ3dlemN6TWQ0NGhr?=
 =?utf-8?B?Q0p5RDRqZFZFNnpTcE5KSXlnTVp2SXZQMVRxZm01UHc1TnYvR2lNVE5xaXRQ?=
 =?utf-8?B?KzFINS9VU0hrUTVnaS9xUlZ6QXpXRU1pOC9oTVZ4Ny9rUk1UMm90eGdHKy94?=
 =?utf-8?B?aHdRc2liOW1naUVHU3d2RGhTY0lNeDdoOWRseHRHb3ZUQyswS0tFN3RGVm9F?=
 =?utf-8?B?Q2oyMWNKbFBaTGpWZFNhVU15M3RDVjJQekNkN0FESEVzTHU2L0tRck1xZGV2?=
 =?utf-8?B?SnU4NWtXaEVKUU5VMzUrbTFONlZPc0dIZVp5SFpseHA0U0Z1eStOMEMwM1dw?=
 =?utf-8?B?ZVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <643E2622AB63C1418C14771D7D336702@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7080d5b-a7d0-4493-a640-08ddb79afd66
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 05:57:26.0159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uEjX6xKslrvyUH4oTbT6CjoDok1PTb91kV8fOGQjUFLYMmcgNhnWoSXQk14zTkBulbm8MQxFr3gYd7n40CW2awcu1Km+dV1vwo/ZfYmtuFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7421

T24gVHVlLCAyMDI1LTA2LTEwIGF0IDE0OjA2ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgTWF5IDIzLCAyMDI1IGF0IDExOjQz4oCvQU0gQ2F0aHkg
WHUgPG90X2NhdGh5Lnh1QG1lZGlhdGVrLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+IFRoaXMgcGF0
Y2ggc2VyaWVzIGludHJvZHVjZXMgc3VwcG9ydCBmb3IgdGhlIE1UODE4OSBwaW5jdHJsIGRyaXZl
ciwNCj4gPiBpbmNsdWRlDQo+ID4gdGhlIGRyaXZlciBpbXBsZW1lbnRhdGlvbiwgbmV3IGJpbmRp
bmcgZG9jdW1lbnQgYW5kIHBpbmN0cmwgaGVhZGVyDQo+ID4gZmlsZS4NCj4gDQo+IENhdGh5IHdp
bGwgeW91IHJlYmFzZSAmIHJlc2VuZCB0aGlzIHBhdGNoIHNldCBiYXNlZCBvbiB2Ni4xNi1yYzE/
DQo+IA0KPiBJIHRoaW5rIHRoZSBjb2RlIGlzIHJlYWR5IGFzIGxvbmcgYXMgdGhlIGRldmljZSB0
cmVlIGJpbmRpbmdzIGdldCANCj4gZmluYWxpemVkLg0KPiANCj4gWW91cnMsDQo+IExpbnVzIFdh
bGxlaWoNCg0KICBPa2F5LCB0aGFuayB5b3UuIEkgd2lsbCBzZW5kIHRoZSBuZXh0IHZlcnNpb24g
YmFzZWQgb24gdGhlIGxhc3RlZA0KdmVyc2lvbi4NCg==

