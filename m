Return-Path: <linux-gpio+bounces-20142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63622AB66A5
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 10:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F175B19E5D4F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC2B221F0A;
	Wed, 14 May 2025 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CkHWAYd9";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="n4xoUIdy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6B91F416B;
	Wed, 14 May 2025 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213135; cv=fail; b=AtpzWqWQgtcUNBTp2TclLFMTQULfIsnER+ehA026aHwKTRfZBGvFH5z+i+X8k0rhEYrk5FOo+XdkbwO467e768SuFCpzvvtC+XulC1w7J+/lPfrOHUUFmxPj+4h+yo0YnPFeWRCnDzi03Xfthg5Yq8LrPbxRweFURRx2bdFDTuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213135; c=relaxed/simple;
	bh=xUFE2b9LK3YMljVKKc4AO6Yx2t/KlhTfHa9BIoTNltE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fhoC6CWVTMWnZlKPTkcqQo+EiW6gOW7pNqn0bAxR54kg+sSqeMKNkPQPy3w8kuoPRuT23MK3hU/vMTNT7bVXnt/Q/jAR7IQoTByZijJ9LgBCIE/sJw7N2GUK2+QA9/5PlOPIWBZnh2bUl03+M/XGvlot0jT64Zxwq6y6cxUa9xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CkHWAYd9; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=n4xoUIdy; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a59e6fb030a111f0813e4fe1310efc19-20250514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=xUFE2b9LK3YMljVKKc4AO6Yx2t/KlhTfHa9BIoTNltE=;
	b=CkHWAYd9on224MFYFwReWmTxA6mXycike5NN+IWTnCqSyZcUElllXLm6lVTyGugpp8iqMFNdQqxCWcxzjmZBrTsn7qD7bgHLtAuol9A50tm2ypwvumU38XzjrZGn8gSpqOiFQTSAq0mBrZ3AZY/R4eWhkaqOoz/6PU1eNVzwby4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d2406336-10f2-495d-8cf1-b6ebdc1da50d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:0f47fe3d-da74-431d-a7be-5e6761de3b64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a59e6fb030a111f0813e4fe1310efc19-20250514
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2058078461; Wed, 14 May 2025 16:58:47 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 14 May 2025 16:58:44 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 14 May 2025 16:58:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toPtl3QCgQIomVLB+QJKNPpIELFxene7MmKp+dR5cKCPSZacZtF2jpegsNTwIxt5okSss66kSNfHHFNtz/qaiawBgERYyW9vKrayZKbd88/OpNHU4rU1KLI07PE4Opwdwg3oE/lYlnH6aYA5f2r1CP4ozObsuF8ElnTy6Uv3pJLVOKsa7kUPh3/4OaitvcZY+t50Gn0VtfApdw5Gne9kul+7Vu2NG8qIWmcTMSglDXyuT3k9NTRpZNmmz87pqQnCPEwGNV87ggS0cQYwHheaQ8lBpNJNuhN5S9ChSnUKYgT6+MY91J2eJzDnWQ4zAFgn68src/qQmTumzRg3aOMf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUFE2b9LK3YMljVKKc4AO6Yx2t/KlhTfHa9BIoTNltE=;
 b=EG4g+HWfT0+7ED/cKfgNzIZzQrIFWZR6jip68DJ1IwJLpp9wJyTpuafzS3rZ3fzIT3Gj+mQM9bLloK5Bl8MrofczSVRdppdZi7Qi5mpKQh4wJnu3S7LtqMkMrD0Kzl182Ni+tyfYeg/SRY14irbmVNAYmiJYJ/9FrBRqaLafhIddEiuxDV+n6wXRO+IDe9phaOjet4IOzJ7w9IciOF2kpyCVlCuLD2qH+C6xfkgvk9wZlfVz2z1BVkMUqOo9LyF8QCj2iwDjFTvfO+gFqHVFOd7G6qstpIQb8BbwTgLhqRpExaoMJmK6FelhgOZAcbPV49Q2JWmKrKNsTk/1AyNS1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUFE2b9LK3YMljVKKc4AO6Yx2t/KlhTfHa9BIoTNltE=;
 b=n4xoUIdyQu7M+WZ+lt0JDde3sHLJWNARCYRXtP9yJiMlDrTKYR9wf1YyElI55v5+lc5D66n28pWCqjdRx7XeNp6Js5YLEcN+Gl7jLJbA6NmIVuPRKCIlJ815IreVLatum16vksoj2LnFccAlw3Yp4sRk8efJOuFnkekXXtWbhJQ=
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10)
 by KL1PR03MB8374.apcprd03.prod.outlook.com (2603:1096:820:137::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 08:58:43 +0000
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd]) by SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 08:58:43 +0000
From: =?utf-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>, "robh@kernel.org" <robh@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 04/10] ASoC: mediatek: mt8196: support ADDA in platform
 driver
Thread-Topic: [PATCH v3 04/10] ASoC: mediatek: mt8196: support ADDA in
 platform driver
Thread-Index: AQHbxKgponD+HC+uekSKY+hnftL0GrPRx/QAgAALgoA=
Date: Wed, 14 May 2025 08:58:42 +0000
Message-ID: <9a6602b1e185403a0e21e6d6ce7887de0136bcb6.camel@mediatek.com>
References: <20250514081125.24475-1-darren.ye@mediatek.com>
	 <20250514081125.24475-5-darren.ye@mediatek.com>
	 <aCRRmk2Vqplbbusn@finisterre.sirena.org.uk>
In-Reply-To: <aCRRmk2Vqplbbusn@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7588:EE_|KL1PR03MB8374:EE_
x-ms-office365-filtering-correlation-id: 67c3b581-0683-4cc6-dafd-08dd92c58711
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T001TEdNa3phZVg5NGhLdG5iY1VvN0tMRWpHRHRramtZbVVhKzZZSzdPS2JM?=
 =?utf-8?B?dncrMmhmOG5tVGFnYUN3MkRIdExNMUlsQW53dmZhL0s2aVh5RnJWWHZmRE1u?=
 =?utf-8?B?UlpYTUZobjFybDdvS2tnVDRIb0tEOFY3Ynd5NVdNSUhSRmNNVTF0Y2h6UDBV?=
 =?utf-8?B?L00zMDE4VjNmMVpqb2hySHNucEZsNTBYb0tOTmRaL2tMZFNhUVJ1Z3hJTVZr?=
 =?utf-8?B?V0FZY0RRRmRDSjJCRGZGbUxCTlk2Y3MzclZoQVVxV3Q5TG5ML1ArVmVtNU5X?=
 =?utf-8?B?R3lQV1lDQTl1R2dET2MzWWtmcGlYNm13VEtjSTR6YUpmNkdlWllyd2kxT0NC?=
 =?utf-8?B?WUNKRWZLbVFXRUZrUUZsVWVpTCt3Z2xONWhyWHNaYmdwbzlpOXpKelRMS1Vo?=
 =?utf-8?B?VW1ZYXV2V3lTY1loMm1VTEFmV0VpcXhST1p6Z2xNM0dBcTVSeERPRVVUUnFQ?=
 =?utf-8?B?UHRXdDBRYTFXUE81NHgrMkNqUHc5L09iSFUxLzRmVkZjNVRtTVNCN3JUa0lJ?=
 =?utf-8?B?UTJ6RFVHRGpyeTYrNHcva0tjV003UEdDcGhjaEpJMC9kRGQ0bklycSsrN0tJ?=
 =?utf-8?B?emNwc1JnZXdTaUpWVVJZYVlKMjkxZ1FqT3VsVGwvWUhMSVdWMjlRZU54Mkhs?=
 =?utf-8?B?allFa2ZvUEUwaXQ5blZhWm1zTjAzczJCeVdiZHpxVExUbzdJMGN1VG9aUU5G?=
 =?utf-8?B?UUxsamdTc3VDRDNjUHp0V3lnUEdJZnE1UllKL2E0REFaMHdDeGNJc2dVcUZz?=
 =?utf-8?B?ZGNkN0MxWjFGRHZMUzF1VmFkYUxDK2RLb0kzYmMwcm1vOGU0ZWloSUUyMmxT?=
 =?utf-8?B?UmpGVW9VRGhYeFBOUlgyY3ZjaGpVRjZXTlBxRndWNE1OS3FzSEIvaDJCTkVZ?=
 =?utf-8?B?NmFyaHcrckhYVkkvUDZiMDVVL0tXZHVEMFdqSmFyVUtxZU1EUUlNZm9CMGsx?=
 =?utf-8?B?bzJQV1B3REl5bXM0NmlDbG1RSnBvSFRJK0tYMDI5WEpERXI4UXYrZzdSMFZO?=
 =?utf-8?B?bFFzYksveXl6WFZXZW1NZG5pWVlOb3VWY0gzR2p0SVo0ZWxjOWpZUG0zVHB5?=
 =?utf-8?B?TEE0NEJTbVpDZ2JjZzZLVWNuUzlZWXJhcVVLdTk5TkZWR2FPVVU3QTdnMnBD?=
 =?utf-8?B?dDA0Y1lJcXJCWDZoUUJVZXhabmZJL2sxYURldVMxb0FZZ3lqa05FdkMyeGtB?=
 =?utf-8?B?czRvemU4bVhoenFLcXhTRzF5aW9IQlFNU3NmTERES2h5VkJVN28yV25Cek9h?=
 =?utf-8?B?TTlubWttenBIUDZDWDVmVHQrc2Z0Z0hyeklPOFh6SG9zblYwL1I1eWRteGV2?=
 =?utf-8?B?ZWVOR0QrWkFGYlRaYmE3UTB6ZS9IdmlyQVhYN1NmQUxNQVE2WDNFdmpPSFFH?=
 =?utf-8?B?UFg2WldKdjFqbjRvZDlIdXFnclR4d3dPRTlsakxvQVdIUVJUbFZWeWNMMENJ?=
 =?utf-8?B?OE1NVjZEL1NSM013QWxvdlZEeFN6dVphUzQ3c1ByV0YwdjB0WEMvQTBuZTd1?=
 =?utf-8?B?VE5JUlcvVmpMYnppdEVpYkVFOVUrQVR0c2lCWFIyMHNtc1NxOFd2dUNaSlJE?=
 =?utf-8?B?Ty9Bbko1Q1RiUERQbnA5RWVmMkxMZUxyNWg5VkxYdUhGSHJCVDZFYzkweXZp?=
 =?utf-8?B?V1NyRGxjeFY5czdzSTVtQVlJSmI0TTVXN0tsSGFtYlRreWwzbWR2aEthUTIy?=
 =?utf-8?B?MVNiSmQxMjUzRVdnZUJqR29Wbk9iUHVKVWdCZ1VPTitGcFZabytFTm1aT2ZO?=
 =?utf-8?B?VHlIZ2c4UGtBa2RJNkRJcFZTcGVKSm1aWEd4R2E2b1BiZW4zaFQ0dHdTVDB3?=
 =?utf-8?B?cHBYc3VnZFJBVVlyckIxVkhFR3FJOUZiK1VqMFd5azJRNGlicGFqMUZWR1BG?=
 =?utf-8?B?LzVMU0k3eno0cVJqTVRGOFpsT0tYUFQ5azZnZHVIQmpyMlh0WlhQQ3Q4R2Fl?=
 =?utf-8?B?TFQ3cjJLKzB4NCsvZDRkSHBraXRiTS9TcExRMmVTZVhoTTdJdVlYNG54QWlJ?=
 =?utf-8?B?bGRqanFLeVBRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7588.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3ZrQ0o5V2xXbkw3TkU3NC9CR1RwSldCcXVkV3V1TnFsdG8vMFM0R0VJS0hD?=
 =?utf-8?B?Ti9HRmlIcFJrNHpQOExwTHB2dm5EYlhFL0ovZGhkRWFJSTl2NUhqeXpsMFFM?=
 =?utf-8?B?bG5NeWxxR1hWdVhpYk8xQXhheHhwY3l3eUFFSGllMldDZFFlS3RZYlFlWkdI?=
 =?utf-8?B?cDRNbzl5cExPSjRZOHJMMElzVldlQ0orVkVKZTlVT2pwRk5lUzh2dXY5Zjhr?=
 =?utf-8?B?UkpuZjY3ZHBWUWhGOXJPUitxOGQ0Z3JiWE5IYjQ2dEdLVEd3czlPOXRUM1dN?=
 =?utf-8?B?ZUZrenhVdGNyNFpjdTN1a1BqOGxFVGY1b0RxTGxVNmk3RDFWanhhRmQ4bk5i?=
 =?utf-8?B?UXJwdXJnOGxEekhRNWFiU21qb01QYXZLWG13N0RVUCtYRmx5NmMrUEpmVGd2?=
 =?utf-8?B?aDhXWE5LbHZGUnlISVNIM0VRYitjOG9XbnZmT0ZoTjMwN0cyL3RKZHNyaU5x?=
 =?utf-8?B?bUpVeXhKYnJzTWxkaHNBS2plZW5lYVlIeUFTQ3JsMXlqWUtmWG9SYUwxSlZl?=
 =?utf-8?B?NmhCOWtYT0Z5R3o4TGh5bTBnSTdDOGZ6K2QxcHhrcCtkMEtud3lrM0QyR1Zv?=
 =?utf-8?B?MmMwQ2k1Qm5YTTFqTkc0a09zQTh1WkpSRjFGSGNzUDJTQmdCUXRZNlYrbVIx?=
 =?utf-8?B?d3pCc3RPZjFtTEJrY2NxMWJueFM3bjZ6UkFFcEhtdEZ5S1VIK3JGUTBpZk5u?=
 =?utf-8?B?SG4yRk5JaTY4R2cwTWNTTVF5TXR1Sm1aU0hyUXZNRGFmM2hxVXFSUlpZQXht?=
 =?utf-8?B?eklmaUhJbDQ0TlN5QmV6d2cxS1hVZzlPdDdFUElUbFRRYU9tYXAyS1FUTHpj?=
 =?utf-8?B?THNNcG5GT2FlNmtxcDhYNmpvSk5DVHpUQmxYaVJrczlFb3NQeUdRd0xJNzFV?=
 =?utf-8?B?WlZwQ1V5T1RQK05QVjA5UnFWYXZYdnVPY09jc2ZMbGxHaXBCL1B6ZGxJYytE?=
 =?utf-8?B?UmJsVWlvdlUrbXRZdzBQZDk1TkxkRHNhQzBJczRWb3I1TXhoeDc2VnZzaFpx?=
 =?utf-8?B?enJRcStBUDRzUkNkVHMzZHdqbmJ0MDVPTGJDaGhlYlJDem1RWkRMN29KRzNJ?=
 =?utf-8?B?T1k0Y3BndGFoZzBNMTFzWWQ5VU90OFZ2ZWN3S2JXditPVDF5Vm8rYXdNL0RK?=
 =?utf-8?B?M1k3b01SRHNpUkZRS2pGYmJyWXpncC9TVEo3UXFXWktSZkJzN1NQOHorNCto?=
 =?utf-8?B?T2FyMC9oYUIrSFRVR0JYM09MMzExZVNsdGpEM1RNaHRhR3hyc1ZOcUF2SGgw?=
 =?utf-8?B?dlNkUDd1a2J3WWdTT1BEcFJ6TjhNYlBNeUNWWnNFeUxaVktVb0g0eVNDTWdy?=
 =?utf-8?B?eGs2T0xhYUNCWEd0bXN0azVmL2xPK3JaMkI1VFExemF0MnFudnRVYkN3Nkd5?=
 =?utf-8?B?anpweHpOeGJVMVNUNWFiZHNTSUxzc3htcmxRT2NWU2lZandKSHIxTW91SFhG?=
 =?utf-8?B?Ulc3OUVSUU1JMEtQeFo3T2JSL3hwNkpnYnY0d1ZWZkp4OGpJZGJodE0yZlhh?=
 =?utf-8?B?NWljaXJoQ1lMMjRBSlFDVTJGQkxTVnNVblpORVFhclJMVnYxdTk1eVBsbjZL?=
 =?utf-8?B?M0ozR1A0akZPOG5VS0RmRS90dFhKazU4T1p4ZkFQWFJ1b0UyUGZFTVZmWTZU?=
 =?utf-8?B?bmQwWUxWeVIzNjJVTHRoMThWb3dxSmRieFJqZ3BqUFI1R2dEN0h2R3kyWXBq?=
 =?utf-8?B?c0l0eGd6VE5tanJqSktBODRFalhwZmNEb2ZyNENZczh1Q1lESFo1QjJYckJW?=
 =?utf-8?B?eCt3cVE3Q3ZyWXo3dmRFVkJtQ0J0bTlhSXNJWEY5dkJSa2o2VS8rb3o5aWty?=
 =?utf-8?B?aHhKdnR3QkU3MW9iekxKYmo4ZXp3TWhoZ1NoZ2ZULzBOanIwTHRYeHk4QUYv?=
 =?utf-8?B?RHIxYU9EZlZESVRNRXJhdW9TdVFubmZsSzcyMG01QkxmNTFoeHpEbFNXK3Ix?=
 =?utf-8?B?NFIrcEg0VWV2aEpmUXZyVm5UMktMaUVRRDl2S09lZXR5NElyNlJHYkVxS2Fi?=
 =?utf-8?B?T3pvT0xDVzhVUzlRclpoSURoTytOalNHRmJ0eWprSVM5ZUEwMkNEdVBqOFR3?=
 =?utf-8?B?ZFVTc1dHdXd3Yk5BS0ZOQ3RFRXVlL2hLNFJseUhRa0VUTEp1aGlvUEk0SzRF?=
 =?utf-8?Q?NkB8635tIvwwDDmbbeLUjhSAE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FF4C5A89DB69A4EA9ABEA05C7F494BC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7588.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c3b581-0683-4cc6-dafd-08dd92c58711
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 08:58:42.8490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CT9OgQfgEow9ig6W32IeQa1eeDcaWAi+1IXKroOb80DD890PGItYjrpsTBhQ0trVel1LXE63aqZL9Yu2ec8mRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8374

T24gV2VkLCAyMDI1LTA1LTE0IGF0IDEwOjE3ICswMjAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBXZWQsIE1heSAxNCwgMjAyNSBhdCAwNDoxMTowNlBNICswODAwLCBEYXJyZW4uWWUgd3JvdGU6
DQo+IA0KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9kZWxheS5oPg0KPiA+ICsjaW5jbHVkZSAibXQ4MTk2LWFmZS1jbGsuaCINCj4gPiArI2luY2x1
ZGUgIm10ODE5Ni1hZmUtY29tbW9uLmgiDQo+ID4gKyNpbmNsdWRlICJtdDgxOTYtaW50ZXJjb25u
ZWN0aW9uLmgiDQo+ID4gKw0KPiA+ICsjZGVmaW5lIE1US0FJRjQNCj4gDQo+IFRoaXMgZGVmaW5l
IGlzIHRoZXJlIHVuY29uZGl0aW9uYWxseSwgd2hhdCdzIGl0IGZvcj8NCg0KPiBJbiBvcmRlciBm
b3IgdGhlIERNSUMgYW5kIE1US0FJRjQgaW50ZXJmYWNlIHRvIGNvZXhpc3QsIHRoaXMgZGVmaW5l
DQpjYW4gYmUgcmVtb3ZlZC4NCg==

