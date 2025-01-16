Return-Path: <linux-gpio+bounces-14854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7604BA1314C
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 03:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D4C91657BD
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 02:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C80050285;
	Thu, 16 Jan 2025 02:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a5KgMHL3";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="LSI7+K7K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FAE7DA6C;
	Thu, 16 Jan 2025 02:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736994060; cv=fail; b=fpgVZkFyzEDOQCOYRWRxZKRT9VE8q5VizCNMRh/aIovyExo7dNCVN7F2xxVlmfMEt+nMGkOoHUqaFI6dEWRu/Nr0/CxKIFl+UOK4uOKTp0HR1GDaVzRswa4bnflj/d5XRTwmtVoclYeC/bQ36H5jAwxmsc5J/ZQ6Qnmr3O/898o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736994060; c=relaxed/simple;
	bh=M1dv0TnUI0yo885HnGDJoWtiJ/3OpkUBAcrFNUAUFu4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NW+g9MOBsTHBRjRXUErfEc/6I7DICiKOgacxbdiMOdMX+7iDCKu/QenY2l/YNWEluW/xfkoOlnFwYkMMY/LSBuFhWkeM4EZsNKJCIGH0f4ok/yp4IteswHUxO6ItG0OtZohhxKzlbMif6EdXI/WxYX6sviVJMB7mG91l56Sskf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=a5KgMHL3; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=LSI7+K7K; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7fe0c9ced3b011efbd192953cf12861f-20250116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=M1dv0TnUI0yo885HnGDJoWtiJ/3OpkUBAcrFNUAUFu4=;
	b=a5KgMHL3EYOgc5IponWn9dPMeo1JfkSU80uskqoRyOfYITjDffAeOtjjFMif0xi5Omh1L0F6grI9a0n3wdw28j8gKt+aIygjG8hFoKhywLOaUktvDVRp8XVpjxxi90fA/1CEFPEhCJ8IUU2iFIFp5MtmPu5DW56KQI1uk+Q2HdE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:973bece9-7c9b-4d7e-af5a-39436a73e456,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:289df437-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7fe0c9ced3b011efbd192953cf12861f-20250116
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1903289194; Thu, 16 Jan 2025 10:20:48 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 Jan 2025 10:20:47 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 16 Jan 2025 10:20:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1Z5oQ+v+Fp9bmr8rA8XBdwnQJMwOmg1cUrs9r0arewFg+WzoYaBvhIGetwDeWXMncRQSltty7ICQGdp8U/kSIq+9PG75dAu16zQzTxPea3dtEBAMAjP/pyWcSyORfwlgj8N+4J7BsP9XkDmowKkzadhI4VLPmuUk5U2guBjNIxbpU8DcxjHD2aKSraW3cyX+K05HaviLqcfgC0OyZtG+lfK1UvUIbRzRF/ObkKaHJ6Iwk0FViweoic9y4VO6bKEsilQIo7ak119I0mxV/SKIBC0DbFjIEx5OAAfwju7NsmpU2wqA2HqQum6OQbgFafqVcJXQ5JYXIwwQVKt1ImgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1dv0TnUI0yo885HnGDJoWtiJ/3OpkUBAcrFNUAUFu4=;
 b=cx6dLSazEnJfRkah3qg6FxLtiOBlcYVv/I6rpXFv967zBHDn3bv9/P2T9qlQ/vdWAwC+T1+mWtQ4Un3DBod10Txy3c9Regg1m9sy17E7mJwMy1xerd9ETImq/A1BdVhPMICzTsB7r9Qw0v+cK+6tO3V27tb5aQHvp1ipjPDWoduZtJkkyU96CcN10fVEpw3htktV/+7XoS+be1D/fjEvbFOsUz4juqfmCAEhIzP0lL4MWLJAi6xH/4BmphX1aooagwvRzqofUl1DZ51fkr8aBxE26YPYiPK8P+EP/MpPYYR+V2LVa6OXKfOXkT/4lmPiylW0sUQVYoi6WiA/G85cew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1dv0TnUI0yo885HnGDJoWtiJ/3OpkUBAcrFNUAUFu4=;
 b=LSI7+K7KqIGTBFEesURBREvJCx9U0mXWZ5tHG5/6d6HLsyMel9BDJ84juYUD3hAnEQGJ3Xnq127jeoWhdL8cwmQa+iAh8gmTCznKsVf3OfhJ3Weg38+YOAcm+l83NrkKzz5VtH4zRgUZjj+Lbxd9Tg3qNr/7oh4kDybj64VmwaY=
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com (2603:1096:301:88::14)
 by TYZPR03MB7956.apcprd03.prod.outlook.com (2603:1096:400:44d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 02:20:44 +0000
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc]) by PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc%6]) with mapi id 15.20.8335.012; Thu, 16 Jan 2025
 02:20:43 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "sean.wang@kernel.org" <sean.wang@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Topic: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Index: AQHbZxfJWswQS8bGo0GLMRlAoA/hErMXl4qAgAEUwQA=
Date: Thu, 16 Jan 2025 02:20:43 +0000
Message-ID: <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
	 <20250115063555.32492-2-ot_cathy.xu@mediatek.com>
	 <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
In-Reply-To: <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5688:EE_|TYZPR03MB7956:EE_
x-ms-office365-filtering-correlation-id: b8ba82ad-6a34-4a0e-6aac-08dd35d46135
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VlJPZU9mSjZMSEd0d1d1Qjg2VEY5ZEpIOUF0WDhXUjFnYjJBTU5Fc3ZGUy9v?=
 =?utf-8?B?OVNqUUNOUGpDdVFWY0RNNHI1UlIvU1dLOTBPNzBFM20vUzVxcHZBSnVxS3JW?=
 =?utf-8?B?TDRiWEI5bDdTYjVzZXg5M05wenRjSVpJeHBrSWFDUm9pUEhPWm5henduSFE3?=
 =?utf-8?B?LzV3WmxkYTZ5OTYvdkJrTXNUTDJENHk0QlJwTVBmdTdLVEludjNORkMwVDRr?=
 =?utf-8?B?dUVRYlR0YW5NT3lCVHJ3MEhyTURGZ1NDMDR2dWgzNGhQMXZTZjJzQmxac09M?=
 =?utf-8?B?dFYxeXpxa1MzM1NzSWhqcEpraHFNdnRxVDVTK2xuZE54c0dIMFFwTFZhZnYz?=
 =?utf-8?B?Mnk4eTM4SHZ1UW1idDhyWkNIdlhnd2d6M1FVUnJkY2FZSml5OXNOMDJrREVs?=
 =?utf-8?B?OHpHVTBWcVRLTVNidElNUUl5MXJ3SUFseXRTaWcyZUNUa01LWXRlcGxYNENn?=
 =?utf-8?B?WFdnZGdkZzFhZFVZZlFUMFBxcVZBTVd2bjRXb3FERjRKU0thQWg5VThZS2dj?=
 =?utf-8?B?QVBSY0g4NGhtbks4UkV3Y2U0K1VXT0pZcnIyVldmRU5teHpldHFmSklvS3lx?=
 =?utf-8?B?dHpLUW5jck1pNldPY0w1TXY3MFp6SWliQmZNeGFPWG93a2NES1VNZGN2Nkw5?=
 =?utf-8?B?MHlISkdUQ2l0REZnZ1pteFdoSGVXOUlmeE9OeGtrZHZ4SFVMVVMvZFltQWJw?=
 =?utf-8?B?eUZUY0hWakVoMXk2NWdqN3J0cFc0UkRScXo3ejlsOHNoNjJwaStTME1aajVY?=
 =?utf-8?B?ZlRkV202enlCRlUvdDI4V1FkYkZxTUhmZ09xMjN1RXMxbElwSVllVDBuNWow?=
 =?utf-8?B?MXozS0g5ZjJCVlJJSi9saGoyQjBOc2hpV3laeDFNZ1dqOU5lc29GQ0VNaFg1?=
 =?utf-8?B?eHJabGxUY294NG9ORnBwYmVDNjhWRi95YktwYXdDbWR2eGxWcFg2SlRGYStz?=
 =?utf-8?B?MFBBTys1QjZ2UkdyTDFqcUhDSlJwZnZsS2UvQWlERjRUdVFIdmxjTERML0ZZ?=
 =?utf-8?B?eXhyVG9BTm1EdUs0cENDOVZzSWI2bFNUUGZ5N3Z1UTFBM2dCb0tJLzdmeldi?=
 =?utf-8?B?b0luLzk2dC92UjBHaGNpWXlwbVZsU1BoUHRhRUlaNmZrUitqWllob1VYOE15?=
 =?utf-8?B?Wlh2cXl1UFNXZm1UaG5hNGVGdmtiRk9wQU9xVWMxZUxMeUorUGtaSVh3azRt?=
 =?utf-8?B?QzF5M3AvYXkrZDIwVkxiYkV5V3FpazJaWk9CejdRek9oYWVTVnp6K2E0U01j?=
 =?utf-8?B?bVMxNWF0UzdXcU00T3VEMUR1Z1pieTFRbnBLNjVKSWhUSGt0RWlYT1BCckUv?=
 =?utf-8?B?OEp3TXZTNEt3NEt2UW1pZk91WlQ1emlQVC9LVEVBcCtMaEpIRlRyU1RvbVpI?=
 =?utf-8?B?VkdBdGQ5T0lIQ0t3QUhMZUpGU3RTakJCeG5VT2VBZkdkc1doR2h1bVJ4RFBk?=
 =?utf-8?B?dk5PU3lhU3ZxeStWSWFDd2VsV2Y3R28zSjNmeEZvU3ZCcnh2VEZCcWhEaS85?=
 =?utf-8?B?eXNka1VPY1lZc1FDenZURWF6NWZvK1ZPVzc2THgybGpaNFEzNjhUdEFLMWRj?=
 =?utf-8?B?T0phb0t6c2V5NHIxOUlRUTdWYmxldHFjL0NnWjNyN3lBMWRPeGQ1VkZ6QzAz?=
 =?utf-8?B?WElKYTdPdWRSdG5aQVd0Yk5HeitBNWpVeUk0VUwvSTdVRWhMQWJFRk1KWm5T?=
 =?utf-8?B?YUpGMnhhQlNoQlBCdWQyTWVSbjJNMk1OY0QxS0JFb2FlZk9xQ2xqejJoRXc4?=
 =?utf-8?B?T0Z5YUdQUDVNNkdydHFncmppMGJjamJDZnlYZGhqaDBpL2hMQUZrakV2d3M1?=
 =?utf-8?B?aURxSXZIUHZkUjRybmN5U2RZOTNnS3hPVWw4OXJmb2RnTXhvbiswcE52R3JM?=
 =?utf-8?B?WnJ6OFJ2b3B4MXhHWXJkdDNGWk81SFlKem1Bd21xaFRvRWdPMWJsazBiZWph?=
 =?utf-8?Q?ekcofmnAXqIegDfq8tmV1CyUBhQ2186y?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDF4aXRpWFFKMWFlZkhrdkVTYzFmbmdOTVlEdG5OMHVHT3R6bnE3SjhsZERR?=
 =?utf-8?B?OERJR0lsUkp5S2RCSFF6TzhuVmZwMGN5UnlOZ0w4VVFRYWtkL1k5VWMzM1J2?=
 =?utf-8?B?WE5HeFA0OS85RVhmT1Uyb0xQUDJSbUFPSVo0SGVPcEh5ekxHakpsU3BxME1L?=
 =?utf-8?B?cTNwWTVEbU1oaVdWLzVTdmVycHVMWjZSYnZmbWUrbitTb21wNURBYW80d1pO?=
 =?utf-8?B?dW1yaWRPSnM1eFY4azFUYjBaYncwWnZ4YWVrRjNyYjFoQ1ZTNGZjVGJ1emtX?=
 =?utf-8?B?RzlrbEswOFc3MVBFc2pYOEc3MzJucVRkTEpqc2cyVCtwVGJ5b2QwR3Z3d2c0?=
 =?utf-8?B?dGI4OGE3WjlLMW50Q2tTb0daOTNFNjJYN2xJTmM4YnB2RUZZWmZ1UHZ1QWFF?=
 =?utf-8?B?SytWYmgzcjJvenF4RTBhQURSTFpkVkpmZnY2SU10WnNWWWNCQk9nQjNJdTVI?=
 =?utf-8?B?NDNwSlczM0lxZUNmVFNzSkF3WEFOblVKbmc0VmRZTjBPNGdqeHdOUzRHZlIy?=
 =?utf-8?B?TmtYRzdDVW5Hc1JTd1pVV1dOT2x2YkZBa0lhK3JZNDlRQjlhdXZVZ3ZGTUpr?=
 =?utf-8?B?YmlNd1FXWUNmaS9DUDZ1QzI1NFZKVGorNTJOLzU2eHRxTW5kUVVERlZPcEdy?=
 =?utf-8?B?QklPQUFTQ3loS1FxMmpwekpBS1pteEt3bjdUTjdXa0k5U01YUDkySzE2K1J2?=
 =?utf-8?B?eXZON2tXRkphSXlyZGtmNWJMa000ckRtRTZiNHQxQ1hjeTlDNzFubkZBak5w?=
 =?utf-8?B?dWdaZERIY0hUbmpYK2FTMklodW9KOU9Cd1V5dDVKYmN6K0VTVkFyVEVBSUVM?=
 =?utf-8?B?OXBrVmgvTHRkSlZVU0lBM3pPQ2JwMDR5MEwvbzIwUlErZnZsL3l1NWdoRlRq?=
 =?utf-8?B?a0Y3eWwxK0crd3hQSXNIVmZ2Zk5QT2Z2K25XbkwzMzJpZlFvd1RNdktoQmhz?=
 =?utf-8?B?M0ZOYWxYT1B5dURzZEtUTDRVRkg3M3I0TS96MEw4S2M5SXdVa2R4ZHkzeVJo?=
 =?utf-8?B?eXV6MzF3TkY5eGVsYlo1Skh3cnhIY25CWWRnSlAxVFZaWHM1M0lQampzclRX?=
 =?utf-8?B?cTV6UktaZ3oySHdMYkRDT3M1QzNqYzFoTzVzWFNNYTVaS1duNG5lVFVUUFZz?=
 =?utf-8?B?dXpkQUlZcHl3QVBNS1VQWndQUm8rZ2ZnSHdmZHh2MVZFTVBLY004RDU3eUNX?=
 =?utf-8?B?aGJXc1dSVTBkTzY3cEs5VWdJYlFWSE9ycC9sSUY3YU5oMjJGQ0lzK0VzN2Y5?=
 =?utf-8?B?Mmxoa3diNzBEeGZVZUdETWlYREdEM3dHVXlIZGFiVTE1U3hmNWtETTdscGNa?=
 =?utf-8?B?M0l1cWxLTG9SSDVQWG82eWFlemZEeWdWVmhzak05OHdBckh5bExZRFdWbUZr?=
 =?utf-8?B?ZHNTNDZVZHU2eGlJRXdPTEJNODk0UU9ITy82bDBwc2ZlZVF6Qzg3SFhrYW9X?=
 =?utf-8?B?YUE4WmRvYVZHNmpLV1JzemtMQXhnRXhFTGFYdXZnYVR6ditONUtVS1NOM3RM?=
 =?utf-8?B?ajFCdmV1V3VrTEtaNTR3Y2F3b0VEM2plMXRRWnI0WHBPQ3JxbzBQWkE0ajI3?=
 =?utf-8?B?ZmpDdE1KSTd3ZW9HM1ZJd3lFM20xS0xSSGpjMU5wRVRZMDlzQlMxRTJ5RHRK?=
 =?utf-8?B?U3llblF2MlpIY1ZwR0dZSlhpemh4bFFKMlorMnJWZzhwYS9oMjkvMnFtQ3Js?=
 =?utf-8?B?aVBNaEhCSmU0TmNKWlVJNkc5Q0F5YVo2dnZvQkN1Vi9zRXpzcW5IWlZxbU1o?=
 =?utf-8?B?WkVDK08yL2xqbUdPZG82cjh0clVKM3JTT24wRjF2U1hndVBKWG5VaUtvUDBl?=
 =?utf-8?B?NFhFOUp1L2JrdGJjWlI5WThrVEdZTDExd1FodXZaVEhsMVVMc2U1Z1JiR0ln?=
 =?utf-8?B?aGRaMGt6UUJvT0VjOHFZbEpUSEFySmJ6T1FibXNCY3hIZzBwTndKakd4enkz?=
 =?utf-8?B?M09tNTExTU9pWTcrejhITGh1enVBYUNMaHRUT0Y5eGdTclpVMVE5UEE1Qjd6?=
 =?utf-8?B?c3VyWi9aMGlWTFR5Zml4b2tMcTFYQ0ZjSTJxNDdrTElnKzFGSG1LOFZXVXJo?=
 =?utf-8?B?ZG01Mk9PMmM1ZnVScFNIVlVRTlYvUGVlNWxheUsyNnpjK1Q4VFI2cTdqcy9D?=
 =?utf-8?B?S1BEQklMVnpGbmJRVU01R25OZ1NXcnFqb3gwaWhmcWtMRVZHcHdueGdHV1dy?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D55110FE7A6F994B94E83F549B027024@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ba82ad-6a34-4a0e-6aac-08dd35d46135
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 02:20:43.6288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9QbYw6PEvdvpC47UA8jvm/tLKiOUUe8DWWbCP3X0kR0fv6Ox50jh1ZeCoPGuzO176hnpnyu8PmGkjPppG0S0A7tSHifoLHf+HHg47PK9bVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7956

T24gV2VkLCAyMDI1LTAxLTE1IGF0IDEwOjUwICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIFdlZCwgSmFuIDE1LCAyMDI1IGF0IDAyOjM1OjM4UE0g
KzA4MDAsIENhdGh5IFh1IHdyb3RlOg0KPiA+ICsNCj4gPiArICAgICAgICBwcm9wZXJ0aWVzOg0K
PiA+ICsgICAgICAgICAgcGlubXV4Og0KPiA+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjoNCj4g
PiArICAgICAgICAgICAgICBJbnRlZ2VyIGFycmF5LCByZXByZXNlbnRzIGdwaW8gcGluIG51bWJl
ciBhbmQgbXV4DQo+ID4gc2V0dGluZy4NCj4gPiArICAgICAgICAgICAgICBTdXBwb3J0ZWQgcGlu
IG51bWJlciBhbmQgbXV4IHZhcmllcyBmb3IgZGlmZmVyZW50DQo+ID4gU29DcywgYW5kIGFyZQ0K
PiA+ICsgICAgICAgICAgICAgIGRlZmluZWQgYXMgbWFjcm9zIGluIGR0LWJpbmRpbmdzL3BpbmN0
cmwvbXQ4MTk2LQ0KPiA+IHBpbmZ1bmMuaA0KPiA+ICsgICAgICAgICAgICAgIGRpcmVjdGx5LCBm
b3IgdGhpcyBTb0MuDQo+ID4gKw0KPiA+ICsgICAgICAgICAgZHJpdmUtc3RyZW5ndGg6DQo+ID4g
KyAgICAgICAgICAgIGVudW06IFsyLCA0LCA2LCA4LCAxMCwgMTIsIDE0LCAxNl0NCj4gPiArDQo+
ID4gKyAgICAgICAgICBiaWFzLXB1bGwtZG93bjoNCj4gPiArICAgICAgICAgICAgb25lT2Y6DQo+
ID4gKyAgICAgICAgICAgICAgLSB0eXBlOiBib29sZWFuDQo+ID4gKyAgICAgICAgICAgICAgLSBl
bnVtOiBbMTAwLCAxMDEsIDEwMiwgMTAzXQ0KPiA+ICsgICAgICAgICAgICAgICAgZGVzY3JpcHRp
b246IG10ODE5NiBwdWxsIGRvd24gUFVQRC9SMC9SMSB0eXBlDQo+ID4gZGVmaW5lIHZhbHVlLg0K
PiA+ICsgICAgICAgICAgICAgIC0gZW51bTogWzIwMCwgMjAxLCAyMDIsIDIwMywgMjA0LCAyMDUs
IDIwNiwgMjA3XQ0KPiA+ICsgICAgICAgICAgICAgICAgZGVzY3JpcHRpb246IG10ODE5NiBwdWxs
IGRvd24gUlNFTCB0eXBlIGRlZmluZQ0KPiA+IHZhbHVlLg0KPiANCj4gTm90IG11Y2ggaW1wcm92
ZWQuDQogIEkgaGF2ZSByZW1vdmVkIHRoZSBjb250ZW50IHJlbGF0ZWQgdG8gJ3Jlc2lzdGFuY2Ug
dmFsdWUnLCB3ZSB1c2UNCidSU0VMJyBpbnN0ZWFkIG9mICdyZXNpc3RhbmNlIHZhbHVlJy4NCg0K
PiANCj4gDQo+ID4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgICAgICAg
ICAgRm9yIHB1bGwgZG93biB0eXBlIGlzIG5vcm1hbCwgaXQgZG9lc24ndCBuZWVkIGFkZA0KPiA+
IFJTRUwgJiBSMVIwLg0KPiA+ICsgICAgICAgICAgICAgIEZvciBwdWxsIGRvd24gdHlwZSBpcyBQ
VVBEL1IwL1IxIHR5cGUsIGl0IGNhbiBhZGQNCj4gPiBSMVIwIGRlZmluZSB0bw0KPiA+ICsgICAg
ICAgICAgICAgIHNldCBkaWZmZXJlbnQgcmVzaXN0YW5jZS4gSXQgY2FuIHN1cHBvcnQNCj4gPiAi
TVRLX1BVUERfU0VUX1IxUjBfMDAiICYNCj4gPiArICAgICAgICAgICAgICAiTVRLX1BVUERfU0VU
X1IxUjBfMDEiICYgIk1US19QVVBEX1NFVF9SMVIwXzEwIiAmDQo+ID4gKyAgICAgICAgICAgICAg
Ik1US19QVVBEX1NFVF9SMVIwXzExIiBkZWZpbmUgaW4gbXQ4MTk2Lg0KPiA+ICsgICAgICAgICAg
ICAgIEZvciBwdWxsIGRvd24gdHlwZSBpcyBQRC9SU0VMLCBpdCBjYW4gYWRkIFJTRUwNCj4gPiBk
ZWZpbmUgdG8gc2V0DQo+ID4gKyAgICAgICAgICAgICAgZGlmZmVyZW50IHJlc2lzdGFuY2UuIEl0
IGNhbiBzdXBwb3J0DQo+ID4gKyAgICAgICAgICAgICAgIk1US19QVUxMX1NFVF9SU0VMXzAwMCIg
JiAiTVRLX1BVTExfU0VUX1JTRUxfMDAxIiAmDQo+ID4gKyAgICAgICAgICAgICAgIk1US19QVUxM
X1NFVF9SU0VMXzAxMCIgJiAiTVRLX1BVTExfU0VUX1JTRUxfMDExIiAmDQo+ID4gKyAgICAgICAg
ICAgICAgIk1US19QVUxMX1NFVF9SU0VMXzEwMCIgJiAiTVRLX1BVTExfU0VUX1JTRUxfMTAxIiAm
DQo+ID4gKyAgICAgICAgICAgICAgIk1US19QVUxMX1NFVF9SU0VMXzExMCIgJiAiTVRLX1BVTExf
U0VUX1JTRUxfMTExIg0KPiA+IGRlZmluZSBpbg0KPiA+ICsgICAgICAgICAgICAgIG10ODE5Ni4N
Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL210ODE5Ni1waW5m
dW5jLmgNCj4gPiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDgxOTYtcGluZnVuYy5o
DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmJmMGM4
Mzc0NDA3Yw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdz
L3BpbmN0cmwvbXQ4MTk2LXBpbmZ1bmMuaA0KPiA+IEBAIC0wLDAgKzEsMTU3MiBAQA0KPiA+ICsv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSAq
Lw0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUgTWVkaWF0ZWsgSW5jLg0KPiA+
ICsgKiBBdXRob3I6IEd1b2RvbmcgTGl1IDxHdW9kb25nLkxpdUBtZWRpYXRlay5jb20+DQo+ID4g
KyAqLw0KPiA+ICsNCj4gPiArI2lmbmRlZiBfX01UODE5Nl9QSU5GVU5DX0gNCj4gPiArI2RlZmlu
ZSBfX01UODE5Nl9QSU5GVU5DX0gNCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9w
aW5jdHJsL210NjV4eC5oPg0KPiA+ICsNCj4gPiArI2RlZmluZSBQSU5NVVhfR1BJTzBfX0ZVTkNf
R1BJTzAgKE1US19QSU5fTk8oMCkgfCAwKQ0KPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9fRlVO
Q19ETUlDMV9DTEsgKE1US19QSU5fTk8oMCkgfCAxKQ0KPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElP
MF9fRlVOQ19TUEkzX0FfTU8gKE1US19QSU5fTk8oMCkgfCAzKQ0KPiA+ICsjZGVmaW5lIFBJTk1V
WF9HUElPMF9fRlVOQ19GTUkyU19CX0xSQ0sgKE1US19QSU5fTk8oMCkgfCA0KQ0KPiA+ICsjZGVm
aW5lIFBJTk1VWF9HUElPMF9fRlVOQ19TQ1BfRE1JQzFfQ0xLIChNVEtfUElOX05PKDApIHwgNSkN
Cj4gPiArI2RlZmluZSBQSU5NVVhfR1BJTzBfX0ZVTkNfVFBfR1BJTzE0X0FPIChNVEtfUElOX05P
KDApIHwgNikNCj4gDQo+IEkgZG8gbm90IHNlZSBob3cgeW91IHJlc29sdmVkIG15IGNvbW1lbnQg
ZnJvbSB2MS4gSW4gdjIgSSByZW1pbmRlZA0KPiBhYm91dA0KPiBpdCwgc28geW91IHJlc3BvbmRl
ZCB0aGF0IHlvcHUgd2lsbCBjaGFuZ2Ugc29tZXRoaW5nLCBidXQgSSBkbyBub3QNCj4gc2VlDQo+
IGFueSBjaGFuZ2VzLg0KPiANCj4gU28gZXhwbGFpbjogaG93IGRpZCB5b3UgcmVzb2x2ZSBteSBj
b21tZW50Pw0KPiANCj4gVGhlc2UgdHdvIGV4YW1wbGVzIHdoZXJlIHlvdSBjbGFpbSB5b3Ugd2ls
bCBjaGFuZ2Ugc29tZXRoaW5nLCBidXQNCj4gc2VuZA0KPiB0aGUgc2FtZS4gSSBza2lwcGVkIHRo
ZSByZXN0IG9mIHRoZSBwYXRjaC4NCg0KICBUaGFuayB5b3UgZm9yIHlvdXIgcGF0aWVudCByZXNw
b25zZSwgaGVyZSBpcyBteSBleHBsYW5hdGlvbiBmb3IgeW91DQpxdWVzdGlvbjoNCg0KICBJbiB2
MSwgSSB1bmRlcnRhbmQgdGhhdCB5b3UgbWVhbnQgSSBkaWRuJ3Qgc2VudCBhIHJlYWwgYmluZGlu
ZywgYW5kDQp0aGUgYmluZGluZ3Mgc2hvdWxkIGJlIHNlcGFyYXRlZCBmcm9tIGRyaXZlci4gSW4g
YWRkaXRpb24sIEkgc2hvdWxkDQpydW4gc2NyaXB0cy9jaGVja3BhdGNoLnBsIGFuZCBzY3JpcHRz
L2dldF9tYWludGFpbmVycy5wbC4gU28gaW4gdjIsIEkNCnNlbnQgYSByZWFsIGJpbmRpbmcobWVk
aWF0ZWssbXQ4MTk2LXBpbmN0cmwueWFtbCksIGFuZCBzZW50IHR3bw0Kc2VwYXJhdGUgcGF0Y2hl
cywgb25lIGZvciBkcml2ZXIgYW5kIG9uZSBmb3IgYmluZGluZ3MsIGFsc28gcmFuDQpzY3JpcHRz
L2dldF9tYWludGFpbmVycy5wbCBnZXQgbmVjZXNzYXJ5IHBlb3BsZSBhbmQgc2VudCB0byB0aGVt
Lg0KDQogIEluIHYyLCBJIHVuZGVyc3RhbmQgdGhhdCBJIG5lZWQgcmVmZXIgdG8gZ2l0IGhpc3Rv
cnkgdG8gbW9kaWZ5IHRoZQ0KY29tbWl0IG1zZ3MsIHNvIEkgbWFkZSB0aGUgY2hhbmdlcyBpbiB2
My4gVGhlbiB5b3UgYXNrZWQgbWUgYWJvdXQgdGhlDQpkaWZmZXJlbmNlIGJldHdlZW4gJ1JTRUwn
IGFuZCAncmVzaXN0YW5jZSB2YWx1ZScuIEkgcmVwbGllZCB0aGF0IHRoZQ0KJ3Jlc2lzdGFuY2Ug
dmFsdWUnIG1ldGhvZCBpcyBubyBsb25nZXIgdXNlLCBzbyBpbiB2MywgSSByZW1vdmVkIGFsbA0K
Y29udGVudCBhYm91dCBpdChpbmNsdWRlIGVudGlyZSAncnNlbC1yZXNpc3RhbmNlLWluLXNpLXVu
aXQnIHByb3BlcnR5DQphbmQgdGhlIHBhcnRzIG1lbnRpb25lZCBpbiBiaWFzLXB1bGwtdXAvZG93
bikuDQoNCiAgSSBtYXkgbm90IGhhdmUgY29ycmVjdGx5IHVuZGVydGFuZCB5b3VyIG1lYW5pbmcs
IHNvIEkgZGlkbid0IG1ha2UgdGhlDQpjaGFuZ2VzIHlvdSB3YW50ZWQuIElmIHRoYXQgaXMgdGhl
IGNhc2UsIHBsZWFzZSBwb2ludCBpdCBvdXQuIFRoYW5rDQp5b3UuDQoNCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gS3J6eXN6dG9mDQo+IA0K

