Return-Path: <linux-gpio+bounces-16787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A37A49482
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91B107A229D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EA9255E39;
	Fri, 28 Feb 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j2Fiw1fd";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="N5ELCxGs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D6B276D3B;
	Fri, 28 Feb 2025 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734009; cv=fail; b=L47L9R0BNV8+jfjD4bdO3tiWOj8q4rOv+b7aWwd4pMbfnt4ZwtIh88pP8NOsNWMmJxDtq8zSDRpmHJ8j7a9xIh9sSYchGtYIhbbZbG1jqC2Zf3vw07t/X18MHG5KirU/nj415ZaYL5yMzIBQVic4k19fKpx2uIFd9GcaHy5C4xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734009; c=relaxed/simple;
	bh=SKJWT2nT1xHXJihInzgyeqhCjEcmaXbp697QOTLTDZU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uDbaSKbvt2EXziI9eI6w7o3TWLwI2DsIWPVcZonVwf+4Ox5xLT/XEyU+90/vFDKy0vexxx/9Vu13hpGq97MzROZPkBn46TtdYFH5AnJKK3uUEVVFfBOLfpM0RQc6D4OBwJvnRRffy85BD1XWxC4B/PaeCexDM5TfIUw3xeq7n10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=j2Fiw1fd; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=N5ELCxGs; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 220d611af5b411ef8eb9c36241bbb6fb-20250228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SKJWT2nT1xHXJihInzgyeqhCjEcmaXbp697QOTLTDZU=;
	b=j2Fiw1fdcZMwzQ3cW74P8JmrtFNvBUszhC9CgNOk3EAZ8D33iGEmeXJE6p6FWtb4h6gKZJ0Q38JhIgdEqIlVBdvFioyGrTjmbW6Owbc7LLZ44tnZ9DakGYWhEaWWJR/77QIaZ7J8hklqkCYII+Z8lJJgyxPVAxXt0ynmcK9UuYU=;
X-CID-CACHE: Type:Local,Time:202502281659+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:a2275025-1322-4bea-a7e1-8079450cc22c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:cb4407da-654e-41f2-8a8e-a96c1e834c64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 220d611af5b411ef8eb9c36241bbb6fb-20250228
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 69536303; Fri, 28 Feb 2025 17:12:28 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 28 Feb 2025 17:12:26 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 28 Feb 2025 17:12:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYAlsSzxszH4esUL9xmr97ZYSn+j5j4jTyHHZLtODo+TZbK1mc9asGUi4FYPq5Uq1XnS5kOKdojQUtUQzrp1n5FnjSdUUHwd84AsMSEgY2Mm3dxMQ+QkU0NdZNUcEhQkcWbN5dv+qTfjei6cUpqcG3e0zLVQLuEVS5JnbyOLdVdSXc8uQ0p9JD37U9WpagsIKXZClMwMK6E37uLeReqAl/L8ljUR6oR1tD0TLkQA7RS4+hlpQY9alzgm9cskU8cCVCeQkowmg4XjbEMp7fGDKr42AOXaRhLpG1wQD4ge1vsUYlXtZt+IhsU+KHTBm4OGDDRBw6OgF8H9bqclBtVOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKJWT2nT1xHXJihInzgyeqhCjEcmaXbp697QOTLTDZU=;
 b=IEY6SPeSFuAghOmVHgJ3Z3pBE4dH8J8/7G6WejjdMVQMCI2ZYmvlJ070vxkK6e5JtweEsVW3FMuhS8SCyq7mDpUqPNOk7XO3TS9dNXy/fdgwxZ8dmoU2I0KKQAXykpEJRlbPJi9p6HKxF+QqRy7oScXiMOiZwtrRHljMN4jPFPT02ALvTIfiVRxjmMDxhJcKOVZ38AKjrl3EdzuPyv/FNESuTSHPRqrW4HAdbMzMBPvbxCdTTtfz3hL5XCCO9hfqtAGw08aKQYnGhJ2NsIuy7q9Gd6PJ1U03VVmECMPMwA6DRmoE+T0UhxJ3m/yG9r0f3XGAadpyHfPhwolbEcKOSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKJWT2nT1xHXJihInzgyeqhCjEcmaXbp697QOTLTDZU=;
 b=N5ELCxGsBUGpsOZtOfidHFhXO+syvjcTkLF+YoXKJ6nldk8O7skWGscHkm0Q8baNYQG0wZM1HRoXrouwNbu6p2PyqMPy0o2nxc2BL8nvaqcZoGKIZx10Sdhx3F8TG+JiQgEO6natIn2MI6Q9LWU0ntJbPOueyI927RlLqWhqJ/k=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by JH0PR03MB7653.apcprd03.prod.outlook.com (2603:1096:990:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Fri, 28 Feb
 2025 09:12:24 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%2]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 09:12:23 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?=
	<Axe.Yang@mediatek.com>
Subject: Re: [PATCH v4 3/3] pinctrl: mediatek: Add pinctrl driver on mt8196
Thread-Topic: [PATCH v4 3/3] pinctrl: mediatek: Add pinctrl driver on mt8196
Thread-Index: AQHbiX7bCOjjxDUCzkqeQTrFO1RX7bNcaG2AgAAGVoA=
Date: Fri, 28 Feb 2025 09:12:23 +0000
Message-ID: <359b395daa7e42e1d5d73c4b4f64f8ac51e06e3c.camel@mediatek.com>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
	 <20250228011702.16493-4-ot_cathy.xu@mediatek.com>
	 <4ae2ef45-93c8-4cac-8331-0962085cea10@collabora.com>
In-Reply-To: <4ae2ef45-93c8-4cac-8331-0962085cea10@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|JH0PR03MB7653:EE_
x-ms-office365-filtering-correlation-id: 000d9bf5-6c94-4edc-238e-08dd57d80379
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QngxRVk4OG40a2FnNGw3V0phamJpVjRLa1ROSUpVeWhZMlhSMEkxNTBIckg2?=
 =?utf-8?B?bG9ydUorUEtPNy8zYXo0VXY0WUFNb1RPVmxEcS9sVm9XYTFSMnlOWmIvakQ3?=
 =?utf-8?B?MlBzK0U1K0NGOHpiZjB3UFZMMmh3cGNPeUNnTUpzdVpuWWhrRlh5S0VDTXQ0?=
 =?utf-8?B?M0lONU0rcjlPZ1NBbXhLS0FpSkJFemxwM0FreTVaWVFiRUh6ZndJU0R2TE1v?=
 =?utf-8?B?NElJODFkVFRWT1JEZkt5U3NXWlV4S1B3ZTlVblZnN29WcW0vZXJpR0FGLzRj?=
 =?utf-8?B?OFEzQ0NXZlIzaUo2TlZYdlpoMGdtd2NiZXEzbkJaM2J1ekhTc0lDdjlrd1p5?=
 =?utf-8?B?QVBGc3Y0cVowN1RvRjNrRnZnVnF2QURKRHFGc2ZmK1kzUm0vSjVVMmh0cFBp?=
 =?utf-8?B?T1Z5c0ViSW5uVmFQTlZ1REFZK1BpNytYdVJ4WVYrMTZCOFNTbjJFc0tZR1Q3?=
 =?utf-8?B?dVBvVlFmL21BMUowMW5sUGpDK2s0K3hmNjBCYjJsY21OeWNoTmpTM3QvOW5w?=
 =?utf-8?B?dE13dktXSFNaZzhtNXhkM0ovZlpEa0V1NEdNSFJuN253cTRPcTZDVHRlNE5z?=
 =?utf-8?B?eDlNSWtsTU9DVXRQZU81TnpIYzByMHRYcUREWC9SNUxNL3JQQ0ZWb3k5dkpD?=
 =?utf-8?B?Mjdpb0RBN2h0ZDRyVWs1WGRJRlAxK0VFM2VJMGRuVElTWWdmQUdieVZlV01l?=
 =?utf-8?B?QVExQ1drVzVHZnN2eU9zL3U1N3pMSm0zaDRSMVpEWlI5ckdoMGk0dGV6Q3Rk?=
 =?utf-8?B?SmpZbVdZajBwbURlMlZvaXRTY3ErTVRXbnlvRjRpNDFjTks1U1QxanovS2wx?=
 =?utf-8?B?T3pYcEt4b1A1NkRMVDU3dytOc0J1VWlDUjNLLzFRTmJ2N0FoKzgyT05VWm13?=
 =?utf-8?B?VWZVNnJhK1hLR2Z3TiswKzFxcVMxcEQ2cHEzL0dIV3NUTWIzSjY2RTdlUWtO?=
 =?utf-8?B?ZUlKZ055QmlZTnMyN2JORmNVcld5bjNxbUtQWUFXZEFGVjl6WTk1eHJURHhU?=
 =?utf-8?B?M3FUcU9PM0lDaFBtOU5RM3NsU0ExTmpZaVpzQ2ZCUnp5YXl1ZUpRdndoVkZn?=
 =?utf-8?B?QTdxQVZpS2VVakVTamFoS0RRaTZFdFFWWUtnYUZ5eGF2bzNxd2VMdzhpK1Z0?=
 =?utf-8?B?R2JYa1RqVU5vcmxBSmpvSzZ1M2hRMTZjd0JJQk1YcDFURDFRWkEvOVQ0ZHBK?=
 =?utf-8?B?TVF0blZocThkUkNad1lCMVdZV3Fkc1hTaUpNWXZXWkVRWnpYZStrNTNCYU5J?=
 =?utf-8?B?WDZ3UDVoNGd3SUNtY0g0ZzJGbXNtTWFIcFN2UFB5QldXRWhROUgwZUl6cnV4?=
 =?utf-8?B?MjViRDIvVVlyQUh4WXRlbyt2RStXZXBQanhYYjdOaFFVR3B5bG1rWGpsTHdN?=
 =?utf-8?B?WURGTHIwa3ZPVmdkTHptSHJacTc4ajBGeUE5L3VtdXhpTFBTdVRxQlQ3V2VS?=
 =?utf-8?B?bjJMeEh0Szh5UUh6WmJ2SnM5K3REV3o4NkFDWktwMUdJZVJEZGs2aHk2N2s0?=
 =?utf-8?B?TU5QZUR0TFJZdEQrb0FKT1RtbEJhNW5mTWUrYWlydDl3Z3R5bG5uWGpOQWln?=
 =?utf-8?B?RUdINkZhWisxMklzZFYyRVpJbnN2ZnZjVDJGajVxYTMxcjNvaFpJZ0hvYnJ0?=
 =?utf-8?B?QjdKUmtiZjFVUDZNL1Nmbm5OL2RSZEp3VHZYVi9iWXpBY3FHRllkQWt1bytP?=
 =?utf-8?B?WnBPdXhtS1MzSWNrQmN0UUFvaVZ3ZjBhQll2ekhmcUtYWU5WK0p6b0dzQ1RT?=
 =?utf-8?B?dXkvQVJoRWdPa0xhbWlNcWVBYTg2ZTdpNzhCdTRObE5UTTlmQk5yZ05PMVpX?=
 =?utf-8?B?UCtBVkJjNEw0ODRoaWgvSG5aOGlpV3gyL210KzZSVUlLSStiVmluVXAyUUl6?=
 =?utf-8?B?bFh6N0VadE01djZsWjd6RUR1cmtlTWlGSEpDK016VjhpZE1oakJjd0k5ZTFp?=
 =?utf-8?Q?Nwajzg/boeiBtEAm3dySxSZGof8A/VFz?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnRsd3Z3b01Ta0Rxd3ZDY3JHdTZwTVlYdUpUN2JKaytReU45RXMvcVZVSmhE?=
 =?utf-8?B?b3N4TkVqV0FkVDVGZmh5MTk1M3pwMWJhUlMrMDdKdVBRVUhlTzBUcFhUWE1k?=
 =?utf-8?B?ZGEvQ0tEQzNuayt1Qi83eFpOWTMxenc4Nm1RNmVveTdRQzNtdGcwOXF2RVR3?=
 =?utf-8?B?YmNLZUhxQlBLWW80TTlzSC8reGxxSHFZZUFQTjVhWkp0WlJyS1gzckZWYnVK?=
 =?utf-8?B?Q1czZmlwNVAxVDlBQmZPdXV6MWFFQ1RueUZXK3h3c2x6TUI4eVljb2dtZUY0?=
 =?utf-8?B?dmlDeVRHeUxoSnhnU1Y5VVZtWXJ6alNLUml5KzQ1V1RsZmoyUU50L3pkbmZV?=
 =?utf-8?B?ZWU2MHlYeURsYVJRUkhEc3hLa3NZaW5mM0FFNFN1dThCRDB6UWFMNHhmYWdF?=
 =?utf-8?B?N2lTWEl5RndQdkRYVitlcmlmeXQrTFFmQjdQUFpHU3NzMndsRWppRi9YVE9x?=
 =?utf-8?B?bS9jU21oTzlJTnpWcGp5cENJbVNnRG5IOVhjZjBicXpWQmNMZnFneXhjaXM2?=
 =?utf-8?B?YXNQQXRHczZ2N0NiL2NGdXFibkRRZWlrL1R5cjNrZWQvL0ZvR3ViU1hCQVJT?=
 =?utf-8?B?ZnZDcWpLWXlvaDFob1k4OWpleW1xSG5FeUhWTUppWFg1ekgxdFF5UG1kajZB?=
 =?utf-8?B?RElNWEY4eVZCbHhML2VMWHFEaExqemlidk53eUhWMXlKTGhhRzFvZzhZOWxw?=
 =?utf-8?B?NXlaTmdKYXR2UXJKOHZZQWdOZWtKNURYTXhoNXhjeFAvUmpmUGZWSFlBVTE0?=
 =?utf-8?B?ZnArOWk1S2VmM1pJUzFNY29HZy9zK1RsMXhiUWU1NDBrTitYOHUyNHB5bHJU?=
 =?utf-8?B?c1lrSndwQzk3MmJhZSsxakkzQXk1cVJYOE9GREtXaGFTT0U4U0ZZVWRrVlpK?=
 =?utf-8?B?RWJ0UEZuK0tPVjhvR3hRYUV5VS9NMTFGazQ0ajAzd1NHZEQ5TXhFS0dpOXIx?=
 =?utf-8?B?R0wvYmJjdStmVytkbnpqWTdwNENRa0hQUERWNXNwb3NQcVBHTS9haGNoNURu?=
 =?utf-8?B?bFFpMTNMKy9RUm95OEdMenhHdk5sMmtvWWJZeHRzd0puc2p3T1NQTkUwNFYw?=
 =?utf-8?B?SnhUMklYTFc4VW9WT3ZxZnEzb2tISzFoT1FubHhSbXVRRTdhcWJiMzkrNjN4?=
 =?utf-8?B?WEhvaGUyZk1ZWG0zS0lrR3pUbHFZSENPdjRYRlhNZFNIMytGdWp0NG1HSkhu?=
 =?utf-8?B?bzhvZ3RVN2NvT0RyK1VrYzVEMThTZnQyQWFlWUtXK1BlUHVUSVcyZ1AyNTdE?=
 =?utf-8?B?bFJBRTVBaUU1amltcmkvbmtFa3FMTVFUZXNqU0N1OGM1aHFFb2VVRzZHOE5o?=
 =?utf-8?B?UVpZMXNUVW9iUWtQclBrVHdTYkthdmY5TDkvUElpMWpMbGZTY0Y3K0hsMEJy?=
 =?utf-8?B?d204NTM0SUNFWktpMnhwc3htRXlneVAxbzc3Vlk3QUhlUnZQaHRCbnZHQXVh?=
 =?utf-8?B?b1RlWjZMRXJyM2lHckovMm9hV1lBWlhZcFJEWm1sOGNzWGJGUWZDam5ySFEy?=
 =?utf-8?B?aDRBN081RFBVNlQzaDdkbTNWUm9teURTTnp2WkFvQTZwSzRlTUlIbEpOeG9D?=
 =?utf-8?B?Rm0wWmdYazQ1NXY5R293L00wLytWV2VmdHRxSGFnY0ZNUk13ZHNoQ3NRTSt0?=
 =?utf-8?B?M3NTN0RzSDRJcFVIY3QrZDZuNGVqaEVvN3FVRGl5SFhOYlduS2ZDa0IvYXZW?=
 =?utf-8?B?Q1VJbWpER1VVMFFQY1gxL1JPOHhFNzc5TnRzaFR2L3M4dTdBa1VKM0daS000?=
 =?utf-8?B?QzBtTUUwTjQvZlBPcnl1K2VDL2h5dk5XYnA2N1ZsWHpHcEd2bzFzQXVCV1lw?=
 =?utf-8?B?ZWlFVSt2L1h3aWVjS0pTMHd0d3k0d3JVMDBZbDVQS0lwSXp1NVBrbFh3WlBa?=
 =?utf-8?B?MTdhSUdjV1BaSEZUOE9pazdndmR2Mnhxa1VEYWhyWE1EMFF1U0U2c05mSjEz?=
 =?utf-8?B?ZW1Wb2tTWW1wSUlnTjY1dlZaWEw1YzdJbHg2dDRVTURUVjZGby9BVHlLaUJK?=
 =?utf-8?B?cUFLYVRqUUJwVTJlY2Z1ZXlER2I2b2VmSTB0Wk91VGxjVTZvc0JHa2RJbldX?=
 =?utf-8?B?bFlmVTdOb0ZMWk43eUFrakErYThpQm9JRHduUFF3OHFSb3BOaUJZRnRQVFNB?=
 =?utf-8?B?anZFNXNRRi9DMnNrYUJGS1dNLzBZdWFTSDR5SGpxZ2ZqaDhueVBiU0RXc2w4?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F052E169C037BF4092DFB29F19C1DB4E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000d9bf5-6c94-4edc-238e-08dd57d80379
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 09:12:23.8749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YRqe5lkUN+HoTeKyxmsCEq4Q7/1pPgInNUqfbmjvcmawP52H+cVz1gXW0QZqrY1fdjtm5oipdLqrDSwqzw3/cW9iLM0dEGMc9xHcFqdwytU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7653

T24gRnJpLCAyMDI1LTAyLTI4IGF0IDA5OjQ5ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyOC8wMi8yNSAwMjoxNiwgQ2F0aHkgWHUg
aGEgc2NyaXR0bzoNCj4gPiBGcm9tOiBHdW9kb25nIExpdSA8Z3VvZG9uZy5saXVAbWVkaWF0ZWsu
Y29tPg0KPiA+IA0KPiA+IEFkZCBwaW5jdHJsIGRyaXZlciBzdXBwb3J0IGZvciBNZWRpYVRlayBT
b2MgbXQ4MTk2Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgTGl1IDxndW9kb25n
LmxpdUBtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2F0aHkgWHUgPG90X2NhdGh5
Lnh1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9LY29uZmlnICAgICAgICAgICAgICB8ICAgMTIgKw0KPiA+ICAgZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgIHwgICAgMSArDQo+ID4gICBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgxOTYuYyAgICAgfCAxODU3ICsrKysrKysrKysrDQo+ID4g
ICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ4MTk2LmggfCAyNzg5DQo+
ID4gKysrKysrKysrKysrKysrKysNCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgNDY1OSBpbnNlcnRp
b25zKCspDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L3BpbmN0cmwtbXQ4MTk2LmMNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ4MTk2LmgNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcNCj4gPiBiL2RyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9LY29uZmlnDQo+ID4gaW5kZXggNThmMzI4MThhMGU2Li5iNTlkOTRhMGZlM2IgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcNCj4gPiArKysg
Yi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KPiA+IEBAIC0yNjMsNiArMjYzLDE4
IEBAIGNvbmZpZyBQSU5DVFJMX01UODE5NQ0KPiA+ICAgICAgIGRlZmF1bHQgQVJNNjQgJiYgQVJD
SF9NRURJQVRFSw0KPiA+ICAgICAgIHNlbGVjdCBQSU5DVFJMX01US19QQVJJUw0KPiA+IA0KPiA+
ICtjb25maWcgUElOQ1RSTF9NVDgxOTYNCj4gPiArICAgICBib29sICJNZWRpYVRlayBNVDgxOTYg
cGluIGNvbnRyb2wiDQo+ID4gKyAgICAgZGVwZW5kcyBvbiBPRg0KPiA+ICsgICAgIGRlcGVuZHMg
b24gQVJNNjQgfHwgQ09NUElMRV9URVNUDQo+ID4gKyAgICAgZGVmYXVsdCBBUk02NCAmJiBBUkNI
X01FRElBVEVLDQo+ID4gKyAgICAgc2VsZWN0IFBJTkNUUkxfTVRLX1BBUklTDQo+ID4gKyAgICAg
aGVscA0KPiA+ICsgICAgICAgU2F5IHllcyBoZXJlIHRvIHN1cHBvcnQgcGluIGNvbnRyb2xsZXIg
YW5kIGdwaW8gZHJpdmVyDQo+ID4gKyAgICAgICBvbiBNZWRpYVRlayBNVDgxOTYgU29DLg0KPiA+
ICsgICAgICAgSW4gTVRLIHBsYXRmb3JtLCB3ZSBzdXBwb3J0IHZpcnR1YWwgZ3BpbyBhbmQgdXNl
IGl0IHRvDQo+ID4gKyAgICAgICBtYXAgc3BlY2lmaWMgZWludCB3aGljaCBkb2Vzbid0IGhhdmUg
cmVhbCBncGlvIHBpbi4NCj4gPiArDQo+ID4gICBjb25maWcgUElOQ1RSTF9NVDgzNjUNCj4gPiAg
ICAgICBib29sICJNZWRpYVRlayBNVDgzNjUgcGluIGNvbnRyb2wiDQo+ID4gICAgICAgZGVwZW5k
cyBvbiBPRg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvTWFrZWZp
bGUNCj4gPiBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+IGluZGV4IDcy
MWFlODM0NzZkMC4uMDhlNzIzOWZjZDhiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9N
YWtlZmlsZQ0KPiA+IEBAIC0zNiw2ICszNiw3IEBAIG9iai0kKENPTkZJR19QSU5DVFJMX01UODE4
NikgICAgICAgICAgICAgICAgKz0NCj4gPiBwaW5jdHJsLW10ODE4Ni5vDQo+ID4gICBvYmotJChD
T05GSUdfUElOQ1RSTF9NVDgxODgpICAgICAgICAgICAgICAgICs9IHBpbmN0cmwtbXQ4MTg4Lm8N
Cj4gPiAgIG9iai0kKENPTkZJR19QSU5DVFJMX01UODE5MikgICAgICAgICAgICAgICAgKz0gcGlu
Y3RybC1tdDgxOTIubw0KPiA+ICAgb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ4MTk1KSAgICAgICAg
ICAgICAgICArPSBwaW5jdHJsLW10ODE5NS5vDQo+ID4gK29iai0kKENPTkZJR19QSU5DVFJMX01U
ODE5NikgICAgICAgICArPSBwaW5jdHJsLW10ODE5Ni5vDQo+ID4gICBvYmotJChDT05GSUdfUElO
Q1RSTF9NVDgzNjUpICAgICAgICAgICAgICAgICs9IHBpbmN0cmwtbXQ4MzY1Lm8NCj4gPiAgIG9i
ai0kKENPTkZJR19QSU5DVFJMX01UODUxNikgICAgICAgICAgICAgICAgKz0gcGluY3RybC1tdDg1
MTYubw0KPiA+ICAgb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ2Mzk3KSAgICAgICAgICAgICAgICAr
PSBwaW5jdHJsLW10NjM5Ny5vDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLW10ODE5Ni5jDQo+ID4gYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1tdDgxOTYuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAw
MDAwMDAwLi4xYmFlZmRjN2UzNmQNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ4MTk2LmMNCj4gPiBAQCAtMCwwICsxLDE4NTcg
QEANCj4gDQo+IC4uc25pcC4uDQo+IA0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfcGluX3NvYyBtdDgxOTZfZGF0YSA9IHsNCj4gPiArICAgICAucmVnX2NhbCA9IG10ODE5Nl9y
ZWdfY2FscywNCj4gPiArICAgICAucGlucyA9IG10a19waW5zX210ODE5NiwNCj4gPiArICAgICAu
bnBpbnMgPSBBUlJBWV9TSVpFKG10a19waW5zX210ODE5NiksDQo+ID4gKyAgICAgLm5ncnBzID0g
QVJSQVlfU0laRShtdGtfcGluc19tdDgxOTYpLA0KPiA+ICsgICAgIC5laW50X2h3ID0gJm10ODE5
Nl9laW50X2h3LA0KPiA+ICsgICAgIC5uZnVuY3MgPSA4LA0KPiA+ICsgICAgIC5ncGlvX20gPSAw
LA0KPiA+ICsgICAgIC5iYXNlX25hbWVzID0gbXQ4MTk2X3BpbmN0cmxfcmVnaXN0ZXJfYmFzZV9u
YW1lcywNCj4gPiArICAgICAubmJhc2VfbmFtZXMgPQ0KPiA+IEFSUkFZX1NJWkUobXQ4MTk2X3Bp
bmN0cmxfcmVnaXN0ZXJfYmFzZV9uYW1lcyksDQo+ID4gKyAgICAgLnB1bGxfdHlwZSA9IG10ODE5
Nl9wdWxsX3R5cGUsDQo+ID4gKyAgICAgLnBpbl9yc2VsID0gbXQ4MTk2X3Bpbl9yc2VsX3ZhbF9y
YW5nZSwNCj4gPiArICAgICAubnBpbl9yc2VsID0gQVJSQVlfU0laRShtdDgxOTZfcGluX3JzZWxf
dmFsX3JhbmdlKSwNCj4gPiArICAgICAuYmlhc19zZXRfY29tYm8gPSBtdGtfcGluY29uZl9iaWFz
X3NldF9jb21ibywNCj4gPiArICAgICAuYmlhc19nZXRfY29tYm8gPSBtdGtfcGluY29uZl9iaWFz
X2dldF9jb21ibywNCj4gPiArICAgICAuZHJpdmVfc2V0ID0gbXRrX3BpbmNvbmZfZHJpdmVfc2V0
X3JldjEsDQo+ID4gKyAgICAgLmRyaXZlX2dldCA9IG10a19waW5jb25mX2RyaXZlX2dldF9yZXYx
LA0KPiA+ICsgICAgIC5hZHZfZHJpdmVfZ2V0ID0gbXRrX3BpbmNvbmZfYWR2X2RyaXZlX2dldF9y
YXcsDQo+ID4gKyAgICAgLmFkdl9kcml2ZV9zZXQgPSBtdGtfcGluY29uZl9hZHZfZHJpdmVfc2V0
X3JhdywNCj4gDQo+IEluIHRoZSBjb3ZlciBsZXR0ZXIsIHlvdSBzYWlkOg0KPiANCj4gIkFkZCB2
YWx1ZXMgaW4gU0kgdW5pdHMgb3B0aW9uIHRvIHxzdHJ1Y3QgbXRrX3Bpbl9zb2N8IGluIHBpbmN0
cmwtDQo+IG10ODE5Ni5jIg0KPiANCj4gLi4uLkkgZG9uJ3Qgc2VlIHRoYXQgaGVyZSB0aG91Z2g/
DQo+IA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgbXQ4MTk2X3BpbmN0cmxfb2ZfbWF0Y2hbXSA9IHsNCj4gPiArICAgICB7IC5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE5Ni1waW5jdHJsIiwgLmRhdGEgPQ0KPiA+ICZtdDgxOTZfZGF0YSB9
LA0KPiA+ICsgICAgIHsgfQ0KPiANCj4geyAvKiBzZW50aW5lbCAqLyB9DQo+IA0KPiA+ICt9Ow0K
PiA+ICsNCj4gPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXQ4MTk2X3BpbmN0cmxf
ZHJpdmVyID0gew0KPiA+ICsgICAgIC5kcml2ZXIgPSB7DQo+ID4gKyAgICAgICAgICAgICAubmFt
ZSA9ICJtdDgxOTYtcGluY3RybCIsDQo+ID4gKyAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUg
PSBtdDgxOTZfcGluY3RybF9vZl9tYXRjaCwNCj4gPiArICAgICAgICAgICAgIC5wbSA9IHBtX3Ns
ZWVwX3B0cigmbXRrX3BhcmlzX3BpbmN0cmxfcG1fb3BzKSwNCj4gPiArICAgICB9LA0KPiA+ICsg
ICAgIC5wcm9iZSA9IG10a19wYXJpc19waW5jdHJsX3Byb2JlLA0KPiA+ICt9Ow0KPiA+ICsNCj4g
PiArc3RhdGljIGludCBfX2luaXQgbXQ4MTk2X3BpbmN0cmxfaW5pdCh2b2lkKQ0KPiA+ICt7DQo+
ID4gKyAgICAgcmV0dXJuIHBsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcigmbXQ4MTk2X3BpbmN0cmxf
ZHJpdmVyKTsNCj4gPiArfQ0KPiA+ICthcmNoX2luaXRjYWxsKG10ODE5Nl9waW5jdHJsX2luaXQp
Ow0KPiA+ICsNCj4gPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJNZWRpYVRlayBNVDgxOTYgUGluY3Ry
bCBEcml2ZXIiKTsNCj4gDQo+IE1PRFVMRV9MSUNFTlNFIGlzIG1pc3NpbmchDQoNCiAgU29ycnks
IEkgbWlzc2VkIHJlcGx5aW5nIGVhcmxpZXIuDQogIFRoZSBNT0RVTEVfTElDRU5TRSB3YXMgcHJl
dmlvdXNseSByZW1vdmVkIHVuaWZvcm1seSwgc28gSSBkaWRuJ3QgYWRkDQppdC4NCg0KaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjMw
MjI4MTMwMjE1LjI4OTA4MS00LW5pY2suYWxjb2NrQG9yYWNsZS5jb20vDQoNCj4gDQo+IENoZWVy
cywNCj4gQW5nZWxvDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0
ZWsvcGluY3RybC1tdGstbXQ4MTk2LmgNCj4gPiBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLW10ay1tdDgxOTYuaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5kMzQyZDA5MTY3MmMNCg==

