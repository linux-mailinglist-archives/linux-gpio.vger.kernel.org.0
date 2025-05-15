Return-Path: <linux-gpio+bounces-20223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E596AB82B3
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 11:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A64D28C5E15
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 09:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5A5297B80;
	Thu, 15 May 2025 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="d2F+E7ne";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="uPzzrhVH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED0A297B60;
	Thu, 15 May 2025 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301512; cv=fail; b=Hsp1sbI+HAkM0AGsfU592mUJeilP/6Xb5SyBrCHkWiFWCxJ63lFNkZf4Sg+pjaSvpg43Gl7HmBJzuF+32GVEHoBHJcRxQ8g7CUwe1KPk1Tzn5Xqj2/FQm4+gEpKhb7DHKDrQFlZvUFJEQR0KsEz7OdvQXP5AEL5nrrodvG/KbFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301512; c=relaxed/simple;
	bh=HqGT1v8A11E5dJ9wKgtkSjbEtCM4i7F54PqO8SXVlYk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Lg8LJPMwM5sCe9J+b2o0m5ImhEuJIa9SiQX1uRYBMQEBEwGBRJrnzFApPR54atVbsHJ/IjNdlURafMP251OEVUgFHzt4EWPrV8JB0lNA9Y+XrihZ0HwyyYx/mnTNXjwXFdmgMXMJGlctCQ5NH/VnmsaNQNl2+VtLLGd/Br85aDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=d2F+E7ne; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=uPzzrhVH; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 68cf7a06316f11f0813e4fe1310efc19-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=HqGT1v8A11E5dJ9wKgtkSjbEtCM4i7F54PqO8SXVlYk=;
	b=d2F+E7nesdHzZrzqqfvD4BUcHxergxS6+defizABzQ558vMQOZ8aLyklBF2TmygrfTkTTrtbU9lkbXopKacvEnthpEG07UImEeOHIedqqKiN33CXLWjc6IT2KBglJeQJqM4Itnug5cVS04X+Qi0vX5EXyuE0LuYX9evrbx9q8MA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a2413924-ae4f-4d5a-85b9-b3ee1fd665c7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:becc093e-da74-431d-a7be-5e6761de3b64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 68cf7a06316f11f0813e4fe1310efc19-20250515
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 802377617; Thu, 15 May 2025 17:31:41 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:31:40 +0800
Received: from outbound.mail.protection.outlook.com (172.21.101.237) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:31:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isLk8NLUkxu5ySk54AyJkIP8mT/L40XvT6ZGlW4QIv3TXcCmIR3er+5JdxJCRF9CHOUNJJ+djMQTFSpwRk/SFZggNrEwyzmcP12sFzNTlUApeJovwqPJ3oZSGUBdZrU03s6HNVl8P6/QLrZU73KZweBOKLKoDQJtHcuZC721yy98qWcjX3ZNhalZPxjKfnklrWZTGYCivr64X0yYiIypep+fPDT3tysG+Y3BKjX8+begtw1jZAQ61X57+gf+XeVkM1oiQ8U/ugqxAPkkhXbTpgfwiFlq7Jk/3WPf1vG1QH4XnZBeR20x11nd26ndVcUkt8Mx7woHpEfJHVHYdlHfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqGT1v8A11E5dJ9wKgtkSjbEtCM4i7F54PqO8SXVlYk=;
 b=dUX2HY5QGADzMG3IDLkzV6Y+Iwt87p/1TydIdG4OF/4W41EcrZfqZpjjeFpthrDzbBkSKbi7vxIzd3S4mRHdZUCoMSlF0xVpzc6JdAPn/MgL9CXx+TZoMPnp9KQuTadOc37opPdFMwzxB4pZeB58WeAvVRXrJB0PN/W1lWD4LMVx9DV5XOr/JogQ+mezd01brlMY7c6D1gLd4GUxwe0mtgYoB2/sBpfs02ZpB/Tx934buEuTJwUkA72JfTP5ClcZI8ugywAJhkCl+uZDREheDsglIDuSYASvT9my5Nyhgo+ECKwQNnaX2cwwsCywfpclSb6x8/TT6H+4lvAocF5ncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqGT1v8A11E5dJ9wKgtkSjbEtCM4i7F54PqO8SXVlYk=;
 b=uPzzrhVHzys1rbhdjDgF8RtnMxrJIqAlqr4DVchj52KzprKRhEBV2R89MYHWZ6zdraHRQbmjMASN4yHGBJ3JtK/3d+BqISPv3aCZ31rDGSl4M3vsbiZFOy04wt8Ds1NvTn9N8y8WPIcr4YFs5bBgjnbmgUrtc9ex4xBoUT/W/vE=
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10)
 by SEYPR03MB6484.apcprd03.prod.outlook.com (2603:1096:101:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 09:31:35 +0000
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd]) by SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 09:31:35 +0000
From: =?utf-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
	<tiwai@suse.com>, "robh@kernel.org" <robh@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: [PATCH v3 03/10] ASoC: mediatek: mt8196: support audio clock
 control
Thread-Topic: [PATCH v3 03/10] ASoC: mediatek: mt8196: support audio clock
 control
Thread-Index: AQHbxKgjNSZzdghwa0eXhzBTlPmqKLPTXeYAgAAFn4CAAAt2AA==
Date: Thu, 15 May 2025 09:31:35 +0000
Message-ID: <5556933f34858b50e5077dee62d430fc9a37f74b.camel@mediatek.com>
References: <20250514081125.24475-1-darren.ye@mediatek.com>
	 <20250514081125.24475-4-darren.ye@mediatek.com>
	 <be75ac83-5421-4bb0-a28a-57be639f427c@collabora.com>
	 <CAGXv+5Hj358gOBomY=KdwYojgpwxFP-tiM38Z18b63ie=922mg@mail.gmail.com>
In-Reply-To: <CAGXv+5Hj358gOBomY=KdwYojgpwxFP-tiM38Z18b63ie=922mg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7588:EE_|SEYPR03MB6484:EE_
x-ms-office365-filtering-correlation-id: 06f9e8f6-5914-4f48-3304-08dd9393493c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bDkzcytQK04weDcwTFI5cXVhdVp6Y0p4NmhpN3FxSDJCWEFhazJvOEFzSk92?=
 =?utf-8?B?U0hVQnozV2dKZ08yWFZJNG93eXZQN1JTUUJpVzVNa2RWdkpSTFhCQ1NpazM3?=
 =?utf-8?B?RnpLN1RTZUdkdnR5SkQ2cUdQdDM1V3pZTkxsN1gwWnhudU0rVW4rdXNPM0hh?=
 =?utf-8?B?U3dvb1RzVitmSmI1dENaS0VQbHhneTNjT1p4Y0tlb2dqbTB3U1d2WklBZ3pR?=
 =?utf-8?B?ZVVjemhnL0RtUWlKMk5Lem5mbGNGVWMzbE1hR2VyZ1FKYnRXdkM5aHVJOTVh?=
 =?utf-8?B?RTVkWCtJVTZOL1dnTERENmkvNXlZZnpySis4RkVCQjQrV2wyeUZVclg4RThR?=
 =?utf-8?B?bEN0Z1ZaR2hua0VpTkN5VTJEbXh3SC9nbFAvTk1kZEZML2hOUkhPTnVOL3Yz?=
 =?utf-8?B?MmJLZ0N0S2FPSjJxYUFsY3RTemVDSmdlL1hqRVUvNGsrWUFnUjVIMjV6MWJB?=
 =?utf-8?B?UzhTNzVGWGdJQmM3anVTbzhXVUJ6S05tLzJ2dkVWejZhY3ZBdEUvSU4wR2FX?=
 =?utf-8?B?Y05ncmtveG12bGsvV1pEd2R6WmtGdDFKMzdXZVpabDIwM0swN0RkK2N5akNL?=
 =?utf-8?B?Z0d1b29PK0Y1VmliaTFINlNLVmYwQURocDdSSGI3aUtpYUxxWkswbUFYUVBN?=
 =?utf-8?B?VTF3R0hxTlVoRFB3UFlobnZENElMc0NJdWZhanNLTUdHcE1PY3R0QUFhMkRl?=
 =?utf-8?B?QlVXdXVEaXFpWkVWTFlPQmZFZGs1UXRRdGEvcUtBV0MrWW5KVm1CSE4rQVFh?=
 =?utf-8?B?dkViTjB6bU55a3VVZ0JBbDJRTUs5OHRjdEhpWVMyYVZvM05TdmV4ZXhodEY0?=
 =?utf-8?B?cmlobUNYamZvY21oSFRSdXgyeFM3TzZ2dC9XWW9NS2F2SHVBYzhTcVRuYXJX?=
 =?utf-8?B?SmE0WDJVSlgza0RuR2hkU2NWbjVpblpPVkpwTENSbXZwa0UvRDVEdU0wdW9H?=
 =?utf-8?B?c0FiT2VEcmp0Y2tFVVV0bmZSd3pWZnNwM3U0YmhlY0t1WTg4bjhjSXdIOVRE?=
 =?utf-8?B?UHlwaDhTbFllamNrYVZKUmlZdEpzTk8wRkxqeGV0YW5aYmtBZUxjZnRqSW1q?=
 =?utf-8?B?UUNvWmxqQVZlMFY0NTVWbUovM3c3d1NPWFBlVllwbXZFOGgzMlhBc252NjlR?=
 =?utf-8?B?L0dXR0E0OWhzcitnazlJTHVJVktiVk8xelRqVFhwQ2JEM2xiSkpYbDhhcU5s?=
 =?utf-8?B?dkp0RmtwemRyV3dXdlAwd3NSdzdXOWdidm1ZQ2dJVjQ0ZTBIR2d1bGpyYjNt?=
 =?utf-8?B?U2VDZmNicmxJTXJGSmY3c0hiOURBNEtUQlU2R0EyVStzUytKU0NWTUhKMFQ2?=
 =?utf-8?B?SmNuWE5zaFVudnhIV0dCTmc4d3dRQnZYd2xIT1U5NFZqSi9RN0lVOVZlbWNN?=
 =?utf-8?B?MkpGaTZXNkdJVG5SMWFaZ29LclRtM2d0YTM1NHhKaU4wOU40SmRDT2F2MUJ5?=
 =?utf-8?B?UUh6VlYrYnJZcWJUUnFOMnRjdzhORUxzVG4xNm9lWGdQS3dSUGhnWFJITkli?=
 =?utf-8?B?TXBMaGlqbUNTSkQvSGlDWUtUQmZYM1dGZEdaUDRXOUpmbWYxUTFyc0JxV0Fu?=
 =?utf-8?B?V2JVdGRWekt4RUFvZjNhamRBN3JQdUpTa2FXSzUrUWdxT2ZWVGNnd1BrVUxC?=
 =?utf-8?B?ZmZvRVluMFpqdHJQZnJ6dVB6ZHAxT3JqcWxhdlY4M1Z4YzUyZW8yMmZQOE5z?=
 =?utf-8?B?b2JsSXpxaUZaYXI2R0tPalE4Z0g3RWlPM0ZSUm5NQlJ6MHRJV0dpcU5NZUpn?=
 =?utf-8?B?NVlpUE5saEJ1dFdyeUtsdVljUG1OYVpNUU5hQVMwU096UFYvSWF4dUtvMkxH?=
 =?utf-8?B?a0NEMEVTUEtYc2RIK3NLSmtzQWM0cjdQSjNyeGt3aDBjRnc5U2E5MkRCN1Y3?=
 =?utf-8?B?dHIyQTlOU1VqRDlNZTFweFB5WTVrWVVMTkIxMXQzRXYrTlNSSGxZMlJBUVo4?=
 =?utf-8?B?UmJNZ2RHd3NZWUM5cXRIUHc5MzFleDhSTDhUMDdFNVRjaXhGVXd2MG5mRWkr?=
 =?utf-8?Q?PPSJlx6AutG88PSdI6SdQWkZMxlADg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7588.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amZhd2xWWWFXQzFXaHFVVHNrS0RmQkNEUFNQcGFwUDVZM1ZacDFjVjdtTHNX?=
 =?utf-8?B?ZmR2a2JVQmo4blVBTGc2NWFTTGlpOVlGbkY2VVhhMHB3SWVMUVZERDdOMThY?=
 =?utf-8?B?T1Q5VVJuUTY5aVlMdFdaZVh4RUsxQ1FuVnFhUXdHcldHLzdpamhrNE5oY1or?=
 =?utf-8?B?b2hFMXIxcjBwVXRDL0Z3bEhEYnFBR1VhWVJGdFJXc3hXckdvLzRpOXZaWGxa?=
 =?utf-8?B?cHpMQ1dpNmV1YUJuanl2U3hhdUU5amF5YWlFeE50OTdFKzlEaExVSXVFQ3Zo?=
 =?utf-8?B?ak1qVXZEdkJKTkxxUXozYVgwTEN0eTM0TlhaNVVwUWZTazlQNUlSOEVGV2Vp?=
 =?utf-8?B?ck12WDZTQlFzdmVvNmk4QnF0SkdKcXhtamFNYkxtNnNyTGFxN2RSSkFLUno2?=
 =?utf-8?B?TzViWitSdVZOUG5KY3JMVUt6L2FXOG5aODJrTzdVdi9JQ0RKWG1rTWxjKzZz?=
 =?utf-8?B?Q0w4cnBobTNyV2xQa0RRd204U0pIb0I3cTUxUG9BdTdpc2hMZEtyZlp0VmpR?=
 =?utf-8?B?VTZDcHdycXUvUkFVc2lUTWRUSkJXMWYwckZsN0VjOWdxaGN2TDdldW9LWjlw?=
 =?utf-8?B?bHQ4bEFvN3YzZGRKUXhqcDh5TW5COXFvank4eGdXOUd3dkJQdy93V1pTQTlZ?=
 =?utf-8?B?dDU0THR5bm4zTTBNbW5tVlpBejR1UXRDbXVNT2V6eUd4V1lCSXhBMXFyRkxE?=
 =?utf-8?B?eU9GTFJESlp4MkVKNWU4WlFzOVhOYlJRRUM5TlBVNDJRVnA5dUdDcm5JNERY?=
 =?utf-8?B?TGh1SUd0YVoxeElsR3ZORjJHbENiMmhNUkhhbDFiL2I1YTdrTWZuRWM3RFlD?=
 =?utf-8?B?V3dIODlXR1U1ODVMMWNVYm5FSjVJZXJDaEZhUmFhdDVPTWJSNzhYZGNMV0NV?=
 =?utf-8?B?a1NPWlhvNzJvSU1BeWFiNXFkYzIvWU1xQ3N0eXpKcFBDQysxVE1mbGpJaFho?=
 =?utf-8?B?TnhEeU5vWWFwaWptUjVDV0tyVHNjNUpNM2R0M2g1NE1oT3JjWThsREw3ZkZa?=
 =?utf-8?B?VSsxTC82UVhCQitQb1NXdTdiWm5xWTQwSnZvUVZxV3VmUTJvdm0xSzExSy9i?=
 =?utf-8?B?Y0k1amhFNmN2UUV4QnhZcXA5ODNHZ2JjRGZ4SFh2aEt1eEVQQlFhb1d5UUNO?=
 =?utf-8?B?MDZ1cm9yT3loSGRub1R2bzFmUXZDNy9uOElndTJnUzFHMEozd2g1ZXB0V3h5?=
 =?utf-8?B?bHpvK0owTHVqa0d1akJMQURMVk9ZWUdCSVNIZFV1Wk45cUZuTWs3ek01Rnps?=
 =?utf-8?B?d3ZsZzlBcTNUN0J6aHNjSnc0S0hjbS82RVFKcDRIVUlYemNDbVNkdWNmNU9x?=
 =?utf-8?B?NU9pem56Rzk1VFZsWVI4WXl6SU5zOXhSVXVodUQzWFB0SjRlZUxBcDB0ditY?=
 =?utf-8?B?UDlXYksxL0REa0NwVlQ0b2toTDJwbGZnQmJCSkFPQitmc0d4ZXlxdm9id0hF?=
 =?utf-8?B?TWtXQnhSOGkwNnFyaUMrL1NYamY0N1c0Qkx1OHQ2V2wzakhWRVBsaDlWWndD?=
 =?utf-8?B?eUhyY1p5T0lTQ2dnUjU5T2p2RWNOWCtTUnAyeElSd3hPZEJXd0FTSXBUNWQy?=
 =?utf-8?B?NS9hNjRCUDJteFNwR2hYWkJsdmovczZWMDJRYmxBVXUxdVRGME45Z0pyUjJK?=
 =?utf-8?B?dDNQcmdUeVAxMkpvby90TjV3cUxRd3NkTDlhSUE1cmV5OFlYdzdTVUo2cVpq?=
 =?utf-8?B?VC9VQ0VUOW1Ldk1uR2pMVVFPelFTZmVKR21vNUtybnE2MDQ2TnJoakNsUXVz?=
 =?utf-8?B?UDR1ZlRGWEZHNmpBd0x6aDFqbGI3cEZZSzU5NjRaK2YyMGFCZ3NaYzNUYXVn?=
 =?utf-8?B?U3NZWktDdzJWNUZ6Nno3YzhDUFUxYTYvVGxhT0Z5WmdqVmtkWTRDd2RVU2VC?=
 =?utf-8?B?VnZiVlpLOGdqSzE2UTNwVXZVVFdubXRScW5iRUhkajdqK2toT1FIdkI3SkxI?=
 =?utf-8?B?RDJlMUY2NVhhSjVYSGR1cXZnMWxMclpac0VvM0cvV203dTMwaHBzTzM0cnN6?=
 =?utf-8?B?YXZQejhHME9pejBkOXc3VnV0RzRpWTlmSXdJZ2VGWkRVVjdQQjJvV1hZR3pG?=
 =?utf-8?B?YlAvZGM2cHNlNG9XRFFUSzRIczlQcTluOHo3WUZINDZDODhOOVlqOVR1MGlk?=
 =?utf-8?B?WWhoY1VXUVljSGcrcGl0WW5DcmlGMW40c1dwSDRJOUZhVlltOWZGc0RNYXRl?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BEA91E50672F648942284E1F7A3F93D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7588.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f9e8f6-5914-4f48-3304-08dd9393493c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 09:31:35.4600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Ll1Re1JnXCD79v1GT/WaowQVijOwN9rsJxmfMBJe68lnAQCK8trjCfUtHKLhV/KGs5maUM+SF79sNrY3NxAWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6484

T24gVGh1LCAyMDI1LTA1LTE1IGF0IDE2OjUwICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRl
bnQuDQo+IA0KPiANCj4gT24gVGh1LCBNYXkgMTUsIDIwMjUgYXQgNDo0MOKAr1BNIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vDQo+IDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9y
YS5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IElsIDE0LzA1LzI1IDEwOjExLCBEYXJyZW4uWWUgaGEg
c2NyaXR0bzoNCj4gPiA+IEZyb206IERhcnJlbiBZZSA8ZGFycmVuLnllQG1lZGlhdGVrLmNvbT4N
Cj4gPiA+IA0KPiA+ID4gQWRkIGF1ZGlvIGNsb2NrIHdyYXBwZXIgYW5kIGF1ZGlvIHR1bmVyIGNv
bnRyb2wuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IERhcnJlbiBZZSA8ZGFycmVuLnll
QG1lZGlhdGVrLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gICBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4
MTk2L210ODE5Ni1hZmUtY2xrLmMgICAgfCA3MjMNCj4gPiA+ICsrKysrKysrKysrKysrKysrKw0K
PiA+ID4gICBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk2L210ODE5Ni1hZmUtY2xrLmggICAgfCAx
NDIgKysrKw0KPiA+ID4gICBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk2L210ODE5Ni1hdWRzeXMt
Y2xrLmMgfCAyNTIgKysrKysrDQo+ID4gPiAgIHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTYvbXQ4
MTk2LWF1ZHN5cy1jbGsuaCB8ICAxNCArDQo+ID4gPiAgIC4uLi9zb2MvbWVkaWF0ZWsvbXQ4MTk2
L210ODE5Ni1hdWRzeXMtY2xraWQuaCB8ICA3OCArKw0KPiA+ID4gICA1IGZpbGVzIGNoYW5nZWQs
IDEyMDkgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29j
L21lZGlhdGVrL210ODE5Ni9tdDgxOTYtYWZlLWNsay5jDQo+ID4gPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk2L210ODE5Ni1hZmUtY2xrLmgNCj4gPiA+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTYvbXQ4MTk2LWF1ZHN5
cy0NCj4gPiA+IGNsay5jDQo+ID4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVk
aWF0ZWsvbXQ4MTk2L210ODE5Ni1hdWRzeXMtDQo+ID4gPiBjbGsuaA0KPiA+ID4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Ni9tdDgxOTYtYXVkc3lzLQ0KPiA+
ID4gY2xraWQuaA0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL21lZGlhdGVr
L210ODE5Ni9tdDgxOTYtYWZlLWNsay5jDQo+ID4gPiBiL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgx
OTYvbXQ4MTk2LWFmZS1jbGsuYw0KPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uODNiNWVlOWQzMGVmDQo+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
PiArKysgYi9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk2L210ODE5Ni1hZmUtY2xrLmMNCj4gPiA+
IEBAIC0wLDAgKzEsNzIzIEBADQo+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjANCj4gPiA+ICsvKg0KPiA+ID4gKyAqICBtdDgxOTYtYWZlLWNsay5jICAtLSAgTWVkaWF0
ZWsgODE5NiBhZmUgY2xvY2sgY3RybA0KPiA+IA0KPiA+IG10ODE5Ni1hZmUtY2xrLmMgLSBNZWRp
YVRlayBNVDgxOTYgQUZFIENsb2NrIENvbnRyb2wNCj4gPiANCj4gPiA+ICsgKg0KPiA+ID4gKyAq
ICBDb3B5cmlnaHQgKGMpIDIwMjQgTWVkaWFUZWsgSW5jLg0KPiA+ID4gKyAqICBBdXRob3I6IERh
cnJlbiBZZSA8ZGFycmVuLnllQG1lZGlhdGVrLmNvbT4NCj4gPiA+ICsgKi8NCj4gPiA+ICsNCj4g
PiA+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3JlZ21h
cC5oPg0KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+DQo+ID4gPiArI2luY2x1
ZGUgIm10ODE5Ni1hZmUtY29tbW9uLmgiDQo+ID4gPiArI2luY2x1ZGUgIm10ODE5Ni1hdWRzeXMt
Y2xrLmgiDQo+ID4gPiArI2luY2x1ZGUgIm10ODE5Ni1hZmUtY2xrLmgiDQo+ID4gPiArDQo+ID4g
DQo+ID4gPiAraW50IG10ODE5Nl9hdWRzeXNfY2xrX3JlZ2lzdGVyKHN0cnVjdCBtdGtfYmFzZV9h
ZmUgKmFmZSkNCj4gPiA+ICt7DQo+ID4gPiArICAgICBzdHJ1Y3QgbXQ4MTk2X2FmZV9wcml2YXRl
ICphZmVfcHJpdiA9IGFmZS0+cGxhdGZvcm1fcHJpdjsNCj4gPiA+ICsgICAgIHN0cnVjdCBjbGsg
KmNsazsNCj4gPiA+ICsgICAgIHN0cnVjdCBjbGtfbG9va3VwICpjbDsNCj4gPiA+ICsgICAgIGlu
dCBpOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgYWZlX3ByaXYtPmxvb2t1cCA9IGRldm1fa2NhbGxv
YyhhZmUtPmRldiwgQ0xLX0FGRV9OUl9DTEssDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNpemVvZigqYWZlX3ByaXYtPmxvb2t1cCksDQo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdGUF9LRVJORUwpOw0KPiA+ID4gKw0KPiA+
ID4gKyAgICAgaWYgKCFhZmVfcHJpdi0+bG9va3VwKQ0KPiA+ID4gKyAgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9T
SVpFKGF1ZF9jbGtzKTsgaSsrKSB7DQo+ID4gPiArICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBh
ZmVfZ2F0ZSAqZ2F0ZSA9ICZhdWRfY2xrc1tpXTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgICAg
ICAgY2xrID0gY2xrX3JlZ2lzdGVyX2dhdGUoYWZlLT5kZXYsIGdhdGUtPm5hbWUsIGdhdGUtDQo+
ID4gPiA+cGFyZW50X25hbWUsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGdhdGUtPmZsYWdzLCBhZmUtPmJhc2VfYWRkciANCj4gPiA+ICsgZ2F0ZS0+cmVnLA0K
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnYXRlLT5iaXQsIGdh
dGUtPmNnX2ZsYWdzLA0KPiA+ID4gTlVMTCk7DQo+ID4gPiArDQo+ID4gPiArICAgICAgICAgICAg
IGlmIChJU19FUlIoY2xrKSkgew0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIo
YWZlLT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgY2xrDQo+ID4gPiAlczogJWxkXG4iLA0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2F0ZS0+bmFtZSwgUFRSX0VSUihjbGsp
KTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4gPiA+ICsgICAgICAg
ICAgICAgfQ0KPiA+ID4gKw0KPiA+IA0KPiA+IEFsbCBvZiB0aGUgYWJvdmUsIHVudGlsLi4uDQo+
ID4gDQo+ID4gPiArICAgICAgICAgICAgIC8qIGFkZCBjbGtfbG9va3VwIGZvcg0KPiA+ID4gZGV2
bV9jbGtfZ2V0KFNORF9TT0NfREFQTV9DTE9DS19TVVBQTFkpICovDQo+ID4gPiArICAgICAgICAg
ICAgIGNsID0ga3phbGxvYyhzaXplb2YoKmNsKSwgR0ZQX0tFUk5FTCk7DQo+ID4gPiArICAgICAg
ICAgICAgIGlmICghY2wpDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07DQo+ID4gPiArDQo+ID4gPiArICAgICAgICAgICAgIGNsLT5jbGsgPSBjbGs7DQo+ID4gPiAr
ICAgICAgICAgICAgIGNsLT5jb25faWQgPSBnYXRlLT5uYW1lOw0KPiA+ID4gKyAgICAgICAgICAg
ICBjbC0+ZGV2X2lkID0gZGV2X25hbWUoYWZlLT5kZXYpOw0KPiA+ID4gKyAgICAgICAgICAgICBj
bC0+Y2xrX2h3ID0gTlVMTDsNCj4gPiA+ICsgICAgICAgICAgICAgY2xrZGV2X2FkZChjbCk7DQo+
ID4gDQo+ID4gDQo+ID4gLi4uaGVyZSwgY2FuIGJlIHNpbXBsaWZpZWQgd2l0aCBhIHNpbmdsZSBj
YWxsIHRvDQo+ID4gDQo+ID4gY2xrX3JlZ2lzdGVyX2Nsa2RldihjbGssIGdhdGUtPm5hbWUsIGRl
dl9uYW1lKGFmZS0+ZGV2KSkNCj4gPiANCj4gPiBvciBhbHRlcm5hdGl2ZWx5LCB5b3UgY291bGQg
c2ltcGxpZnkgaXQgZXZlbiBtb3JlOg0KPiA+IA0KPiA+IA0KPiA+IHN0YXRpYyB2b2lkIG10ODE5
Nl9hdWRzeXNfY2xrX3VucmVnaXN0ZXIodm9pZCAqZGF0YSkNCj4gPiB7DQo+ID4gICAgICAgICAv
KiBub3RoaW5nIHRvIGRvIGhlcmUsIHJlbW92ZSB0aGlzIGZ1bmN0aW9uICovDQo+ID4gfQ0KPiA+
IA0KPiA+IGludCBtdDgxOTZfYXVkc3lzX2Nsa19yZWdpc3RlcihzdHJ1Y3QgbXRrX2Jhc2VfYWZl
ICphZmUpDQo+ID4gew0KPiA+ICAgICAgICAgc3RydWN0IG10ODE5Nl9hZmVfcHJpdmF0ZSAqYWZl
X3ByaXYgPSBhZmUtPnBsYXRmb3JtX3ByaXY7DQo+ID4gICAgICAgICBpbnQgaSwgcmV0Ow0KPiA+
IA0KPiA+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoYXVkX2Nsa3MpOyBpKysp
IHsNCj4gPiAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGFmZV9nYXRlICpnYXRlID0gJmF1
ZF9jbGtzW2ldOw0KPiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgY2xrX2h3ICpodzsNCj4gPiAN
Cj4gPiAgICAgICAgICAgICAgICAgaHcgPSBkZXZtX2Nsa19od19yZWdpc3Rlcl9nYXRlKGFmZS0+
ZGV2LCBnYXRlLQ0KPiA+ID5uYW1lLCBnYXRlLT5wYXJlbnRfbmFtZSwNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdhdGUtPmZsYWdzLCBhZmUtDQo+
ID4gPmJhc2VfYWRkciArIGdhdGUtPnJlZywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGdhdGUtPmJpdCwgZ2F0ZS0NCj4gPiA+Y2dfZmxhZ3MsIE5V
TEwpOw0KPiA+ICAgICAgICAgICAgICAgICBpZiAoSVNfRVJSKGNsaykpIHsNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBkZXZfZXJyKGFmZS0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIGNs
aw0KPiA+ICVzOiAlbGRcbiIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBn
YXRlLT5uYW1lLCBQVFJfRVJSKGNsaykpOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOw0KPiA+ICAgICAgICAgICAgICAgICB9DQo+ID4gDQo+ID4gICAgICAgICAgICAgICAg
IHJldCA9IGRldm1fY2xrX2h3X3JlZ2lzdGVyX2Nsa2RldihhZmUtPmRldiwgaHcsDQo+ID4gZ2F0
ZS0+bmFtZSwgZGV2X25hbWUoYWZlLT5kZXYpKTsNCj4gPiAgICAgICAgICAgICAgICAgaWYgKHJl
dCkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICAgICAgICAg
fQ0KPiA+IA0KPiA+ICAgICAgICAgcmV0dXJuIDA7DQo+ID4gfQ0KPiANCj4gVGhlcmUgaXMgbm8g
bmVlZCB0byBpbnZvbHZlIHRoZSBjbGsgc3Vic3lzdGVtLiBUaGVzZSBhcmUgc2ltcGx5DQo+IHN1
cHBseQ0KPiBnYXRlcywgYmUgdGhlbSBmb3IgcG93ZXIgb3IgY2xrcywgb25lIHBlciBiaXQuIFNp
bXBseSBtb2RlbCB0aGVtIGFzDQo+IEFTb0MNCj4gc3VwcGx5IHdpZGdldHMsIGFkZCBhcHByb3By
aWF0ZSByb3V0ZXMgZm9yIGVhY2ggc28gdGhhdCB0aGUNCj4gZGVwZW5kZW5jaWVzDQo+IGFyZSBj
b3JyZWN0LCBhbmQgQVNvQyB3aWxsIGRlYWwgd2l0aCB0aGVtIGZvciB5b3UuIE5vIGNvZGUgaXMg
bmVlZGVkLA0KPiBqdXN0IGRlc2NyaXB0aW9ucy4NCj4gDQo+IF9UaGF0XyBpcyB3aHkgSSBhc2tl
ZCBmb3IgaGUgYXVkaW8gY2xvY2tzIHRvIGJlIGludGVncmF0ZWQgaW50byB0aGUNCj4gQUZFIGRy
aXZlci4NCj4gDQo+IENoZW5ZdQ0KPiANCg0KT0ssIEkgbWlzdW5kZXJzdG9vZC4gVGhlIG5leHQg
dmVyc2lvbiB3aWxsIHVzZSB3aWRnZXRzIGFuZCByb3V0ZSB0bw0KY29udHJvbCB0aGUgYWZlIGNs
ayBnYXRlLg0KDQpCZXN0IHJlZ2FyZHMsDQpEYXJyZW4NCg0KPiA+ID4gKw0KPiA+ID4gKyAgICAg
ICAgICAgICBhZmVfcHJpdi0+bG9va3VwW2ldID0gY2w7DQo+ID4gPiArICAgICB9DQo+ID4gPiAr
DQo+ID4gPiArICAgICByZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGFmZS0+ZGV2LA0K
PiA+ID4gbXQ4MTk2X2F1ZHN5c19jbGtfdW5yZWdpc3RlciwgYWZlKTsNCj4gPiA+ICt9DQo+ID4g
DQo+ID4gQ2hlZXJzLA0KPiA+IEFuZ2Vsbw0KPiA+IA0K

