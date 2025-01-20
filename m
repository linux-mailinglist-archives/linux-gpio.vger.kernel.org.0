Return-Path: <linux-gpio+bounces-14941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FACA16910
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 10:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D953716908D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 09:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48221ACED2;
	Mon, 20 Jan 2025 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Pd5IxSmW";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="wZa6tXkC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E6719DFB4;
	Mon, 20 Jan 2025 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364676; cv=fail; b=DWiUDVzpHTipZ7PKFhNhb7OTcqRbvxugj98SEyF/zv//jIinGEWyKgGBOwGO99zQNqw6tVGHCiE2H4GtCsOz6hafeD2SdItDrGwP58n1Yic8K7YOqln8glsc/2DJwhaKXxgO1OlPRFKEli+qnMAKOGP9Db1N1sT2odIYWM+ws1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364676; c=relaxed/simple;
	bh=jkJjjzmbR89Y7niAduTS8xHG3z5Cd2mjv476bKDUaJk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ARUb6/Ju3AyM5bH62YPRoW1HqS752AWYbebdflW1MsyYtBnJUDqFszujQ8HQeS+1XxmF1bJD5+U2YEHu5jvppCDbJT1PP2VkMMYN8m5OUktec9v2kj8UV3b6wI3irUA0J/26reDbBaro2iADNPMOSZjwPMtbxKglT207vN0uej8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Pd5IxSmW; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=wZa6tXkC; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 69ab7c82d70f11ef99858b75a2457dd9-20250120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=jkJjjzmbR89Y7niAduTS8xHG3z5Cd2mjv476bKDUaJk=;
	b=Pd5IxSmWkZ5YMnpYw/bXdEl35DOTuLtMUy24jgfBfra1u+MXZSQC2Z5Uhfs5Moi/DdpBdQalvHwRd1Zd1bzj3sjDP61qagyxVfWM7NIp0ym5P1S1SC6flhtbsVgHBer68Fr1XwQNyR/fQkNUMg97DJElkXt4GYDX5+CZfmq7CXQ=;
X-CID-CACHE: Type:Local,Time:202501201712+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:d4064078-824d-462a-9c14-de9744410ecc,IP:0,U
	RL:0,TC:0,Content:6,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:6
X-CID-META: VersionHash:60aa074,CLOUDID:69fb2b0f-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 69ab7c82d70f11ef99858b75a2457dd9-20250120
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 637582667; Mon, 20 Jan 2025 17:17:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 20 Jan 2025 17:17:45 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 20 Jan 2025 17:17:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/yVz/DN1dUH9VmxMSY49BH8PPtKku+eawOJDtqbSdrFg6uqhP4S924fcDaikSzktBjIkOaqoXgbJxT13rc2XPEvBXUOjjpKb4hxDs3lfOZr3cufu8Ot/mVfGJNaS2ds3MvrbbnUsrTM/+EXowImIhCDvhloTnkGyJWCFwG1B7RQkix3WRQc+dka+O9Q+HwSO99itJPDYfj1fEoT9ZPF2NzbVIShzgIvVDI91iS762cAfZG4M8hJpKS9nmSG+Uo9UssHVT2kAE4Vmsk8oMmC95NWxCc9tobKd/BvflJbm2w7xyrB0yw/zgkL+mPLz6l9eP81VOxeefEXf0L1/Gfudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkJjjzmbR89Y7niAduTS8xHG3z5Cd2mjv476bKDUaJk=;
 b=NOmUR3axFb/lcOh9CRgthSY6Bm/HXjO/jdo3ftJoZswsa5ImbYbDyCswfPOs/6QG/Wfjw/Dr2DggTPBua7wdgFMKRVBiwhM8PITuJecrMM0s2G8jFxNZUzFSuSEVhZHhjR2BFjFUSPJ7yqA0Xog9gblkpq0h+bwVyvkl968mQ7u/Fv2JPHcV4K2ZwRksEpf0jNo2rxpcd2TjUCAfqYSy2Jl4vPU35T3DWF0gQxagwrz6950T5CItKAusWxzHql/kYW1S4rBwLVACXA03UDogy29h6FE15J6R6bEWSAknGjZjUjsBGLeJH5+3buoSL/AzCJZQv6U+Mf2dqfSXVBbESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkJjjzmbR89Y7niAduTS8xHG3z5Cd2mjv476bKDUaJk=;
 b=wZa6tXkCcOKAH8PlLX6YldecuVpwHTBeaIBoH3FMLbR3UH6H6AuOq2yORCWfc4vtKGZJE5+bxbx1XAsobWsp6mJGFAdk6EScAhXypp2CJsiJPO4GmxR0gGqprU146VQIzUKQG+UGPXfFvzWg+C+5Nd8Zi0Cl0Ey5Apd/oPoPPqc=
Received: from SI2PR03MB5691.apcprd03.prod.outlook.com (2603:1096:4:152::11)
 by SG2PR03MB6478.apcprd03.prod.outlook.com (2603:1096:4:1c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 09:17:43 +0000
Received: from SI2PR03MB5691.apcprd03.prod.outlook.com
 ([fe80::6e44:2111:39ae:cc82]) by SI2PR03MB5691.apcprd03.prod.outlook.com
 ([fe80::6e44:2111:39ae:cc82%6]) with mapi id 15.20.8356.010; Mon, 20 Jan 2025
 09:17:43 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
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
Thread-Index: AQHbZxfJWswQS8bGo0GLMRlAoA/hErMXl4qAgAEUwQCAAFYhAIAADccAgAAiDYCABjfigA==
Date: Mon, 20 Jan 2025 09:17:43 +0000
Message-ID: <bec17d1e215a11daa1fdede78c8070c8e1763c72.camel@mediatek.com>
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
	 <20250115063555.32492-2-ot_cathy.xu@mediatek.com>
	 <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
	 <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
	 <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org>
	 <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
	 <b212d05d-de3b-41b2-bc48-c6b79ae54a8b@kernel.org>
In-Reply-To: <b212d05d-de3b-41b2-bc48-c6b79ae54a8b@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5691:EE_|SG2PR03MB6478:EE_
x-ms-office365-filtering-correlation-id: 7ae0a0f4-cd8d-4a59-c25e-08dd39334bfa
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NHlHdGhkTlJXZHc1WWJyVkxCRFAvdHFqdzdyNXZ6Lzl6dzdDcEgxZnpUTFVU?=
 =?utf-8?B?Q1BRcWR0cjE4c0xhc2tKclhmWS9BZjRnMkZpZHQzbDhadlVQVFNVQXZSUllj?=
 =?utf-8?B?QjVMc3BFZjY3UXRJNkhmSk56Z0xsa1g3VTVKNm5mV0JHckVXUENtb0Y0VnRr?=
 =?utf-8?B?QVpjWXpSZThKbW1CL2dON21rWnk2YlVDcXluWjVRVHU0emZJNWtMeWF4YzIy?=
 =?utf-8?B?ZGFLeDEyOXhWSEdZZTY2ZVdtcXQwazJQL3o3eDlxamdINlVPdmtKU2lLVEZ4?=
 =?utf-8?B?VlZEQlYzM1FTUWVZNmRRdkE1YldjbXNxUTNkMWt5aDZ1Z1cvOEtpSWxSTCtv?=
 =?utf-8?B?akJabDBuOStBOFIxQnlIQkVsSXNpQmtvUDBuZTQvSUxIdWdpVmFWbWZ1ZndB?=
 =?utf-8?B?OENsYXROUFVsSG9RZkMxaDBDTlR4U1hPOTJCUE8yRFQzUk1aS1F2c3NIM25J?=
 =?utf-8?B?OXhnWi9SU1k3WkpxSmlmaXFNQ1g2SlhuR1lxWmh0LytSSTRyUm53bmE2ZGhN?=
 =?utf-8?B?WU9BUHJHRkE4UlFPdnQvUFkvNEx4cTIrQnBCQlhGdkxMNXJSeVgwNHNvaTYz?=
 =?utf-8?B?ZnRCWEkvcGdWZnIwT0k4SmxCZTBOQVpzd0RpWVQyUUQ3TFRSREtJL2FIMTc0?=
 =?utf-8?B?WFJPZkZiVUNQZnhPd2lsakpNRjVCRFdxb0F3ZTlTME4vZ1c4U0djK1AwUHhG?=
 =?utf-8?B?TGZLSSs2QWJNYmZOSlB5aWZXS0ZlbFpUTUc4ZmdZNmdMeVZxcVA1ZERLdWo0?=
 =?utf-8?B?UzhOSHJqUkV4UjVDbk1CQ1EwSzd1NjZiQzZlQlIwR2w1OEZwYk9VbDg5VkJN?=
 =?utf-8?B?TDBiSnQ1V0d1OTB4SU44eldrRkZCblRUOVZNQnc1dWhxaGVhUHRVU2QzM0NO?=
 =?utf-8?B?Z0ErZTkzODNVU2hxd2Z3MWtDWFMxUzVXWTRKUFZTVk1QNWh4ZTIyUzd3TDk5?=
 =?utf-8?B?N3RUUVFweHorb3NLT0IzU0dRSytpSjI3MzVENFZJVWE4cnZ3L2hadFBRTHBt?=
 =?utf-8?B?djZMemZqT1hzSzAzc1JteDVsZEZHWnpOMVhSR0lSdGQ3clk5cjZjRHNhKzFn?=
 =?utf-8?B?clIyNytTdUtDZmpQRFBlbE5KWGx5eVd5NGZjNEpFQ1ZDVXJma3FONHc4UmNC?=
 =?utf-8?B?di9ZN0hDT2VkaDBJbmQ0R1lqY2hmVXlQaHdZNmRjOGd3amFQblc4Zk1WN1Z4?=
 =?utf-8?B?dFFCZDFwcmVEdmlEdHZzT1hlMysvTEl6V0lCLzdJUWdoclc5VnZGdm5xZDFq?=
 =?utf-8?B?ZmYrbkoyQXRYd3hVK0pXM3VoV0d4anFoN2lJcDAzVVIrRnBXZ1ZFTWV1YlRj?=
 =?utf-8?B?NmxWSEVadFhodEk1R0llT0pVN2wzaDhWQzFxWkVYbk1OUTFWdUxZM2FvaXBm?=
 =?utf-8?B?ejE1a3dyYWZ6b0RYMVBPVVVCZWhGZk0vQzJLK3AzRnNDcDE1dHIyZW01d3VK?=
 =?utf-8?B?MGhNdmQrcTZ4ZXJwTS9WZDF3ZVEyaW1lbkxJOGE1NW01MFp6QlI5WXhZdEM3?=
 =?utf-8?B?aDFVMjk4dzd0bHRpME51ZnhxeGZkNG5mSkg1SVdMcmQ2NXJNZStxRW1DTllz?=
 =?utf-8?B?S0tqZ1MrOUxNT0ZMemJPREVRYitocWw5M1JKeHpqZnYrSUZHclpybGN5QnVY?=
 =?utf-8?B?R0YyK2RkNlVMZnNoRjJWMU5rN0NHeFlzTjlPMzJFUHFTYTk5YzVYaGVTbnZs?=
 =?utf-8?B?LzRpWWNkUTNlZXJibmU2V3paNlovR0QxbFIzZkZONDhNU3RSdnNiVGcrc1U2?=
 =?utf-8?B?R3ovaDYxODViUk40bWJIc1ErT0NwQk1xUDZiRmVnVjM3alplS1cxU0k1U216?=
 =?utf-8?B?c0tDZmNjUXZwOFFBa0FiRTAvMjhobm96TU45YWF4UmNXS1hUYVh5Wm1mZkxB?=
 =?utf-8?B?bDBiTmxpOHIxc0Z0QXB0ZmErcnZwajZ1eElncnZ1YUpEREwvVUd0dUM3UWtP?=
 =?utf-8?Q?L8kT73hJ/t17Cknlc0mSoYMkvYLisn3O?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5691.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWsvSDA1KzFaejdsSUNUalV3eXFEZ1pPZEhiQWpQOUJCRXdSTmRsUERyaGo5?=
 =?utf-8?B?ZkQxUzJpYm9kNU4wOWM2WUt5dTUyK3hDVm9yNnQ3ZnVYQUhIYXZUc29XRXU0?=
 =?utf-8?B?MlZqU2krRlhkSHlza0FGaWFsMGRHOTFoMCtpNEtrb0JFK2o3VC9Hby9pK3h2?=
 =?utf-8?B?QXFnZjBpaHc4VkxVK3k0Q0xlRUhTcjl6bWNqMjJKQ0N5L2MxbTRFRTI5OEJ5?=
 =?utf-8?B?MlJKZmQ3MGxYdmVpRG1FSDJmRUp4UExMdVIra0lxeDU1d0VxOGVkNGNUV052?=
 =?utf-8?B?WDQ1b0NwTEhVKzN4WlpsYnFVcWMxUlFwdldzRHhmRHpWYUtQQWNpeGRlZERN?=
 =?utf-8?B?bmpKVWEzTDZsdWE4WDdHTWdlV2E1SmlFeGtYWnJKckIrL2tRYWp0bXErM1JJ?=
 =?utf-8?B?WllDRlZvVE1lQy8zc1kvN2lJRGcyVW1aYmo0L3VjcGlYSlBCdWRmbzNIR0gw?=
 =?utf-8?B?dVlaOG9FYWNwZjhZMEVPWUR1c2NueE4zTllhaUJvVlBJKzZUcHhWRE5ZQ2FO?=
 =?utf-8?B?Rzd4YVJrTWNJY3g1SkJIK3MxdE1xVkY1S2F4TGk5amRJd2JLLytsRzNaY0Fz?=
 =?utf-8?B?Zm9Gbk4vSjBJcmk1clZqeTlpU1FCR1R5bkRBQnZiQ3JxaDc4UUlnRXFsUC8y?=
 =?utf-8?B?WFZKMjIweTVyRFBxTVM3am9zTHBYNllaNDNOdjg2bkJQcjBqQ3F5S2pOaUdw?=
 =?utf-8?B?RmEzVnlKSGZRU2FOTjU2dzgzTytjWXBuei9pb0VCU0dKMU1hL0ZyYXBKM09p?=
 =?utf-8?B?Y2pzRDdSczBDemE1aGk4RVFCYkdSUWpwaUNqMFNUSXdqV1JUeWpBd3Y4WWdV?=
 =?utf-8?B?d3VZQTBDdFVLQ1NqYkhScFRzbDdWZDhEdUV1d2YrRk9jRklsbTIzYmhWelpo?=
 =?utf-8?B?dUtvbS9zTDJOQU9Rd0x1enk2Z0dtSHpwY25VVFVteWRaYVRweDhZWXNJR1Nl?=
 =?utf-8?B?dzhhU0M0d2VxaWdjS0toZ0o5MXVYYWVIQ0psdEc0UGFFQzZaK3Fidi9lQU5U?=
 =?utf-8?B?aGZ5WHJkL1pDYlM2MStNR1I3emVqNUVFcnJSREllOG9MN0E5bm4zOSt5aTJU?=
 =?utf-8?B?RElPSE4yWWxUQ0k5MlIxTmtISHNzaEZmc0UwUm1ZSnRicks4b2JvWFBOWXVl?=
 =?utf-8?B?Z2c0ZGtSa0pqdFNKajBNdEhrTzhhMDIyTHhLT21sUERQMHpCM29RVWoxcXpC?=
 =?utf-8?B?QU5HTG42RVVIR1JTbVJ5Mm03U1ZGNHRBOEl3YTZpZjcraWNJLzBLU2FnV0pH?=
 =?utf-8?B?YWViRnd6dFFnczd4WjlreGdtMHh4MnlqUXlhNFJIWGh2cW82WnYrU2dTL205?=
 =?utf-8?B?MHJSWXkxejlpVUxXZXgyNzk3OVVVNFhOWi9zME1ISkQ0VzI5T2Nvb2R6eWhk?=
 =?utf-8?B?MnNiam4yU0xTbWVEZ2xlY1NMUitUTVErM0g3dHRoT1NWUHNXWTVNbXdnL1N4?=
 =?utf-8?B?SXpINE12V3g5Zzh6bzFvM00zQURqaTJybnJ5MDNOa0dXMEdzckJnMG1vVlRB?=
 =?utf-8?B?bitNS1Z1NjA3ZmUyVkdWOCtyKzZyMVhkbW1kbFBkdW1LN2NSbHcwaTlEVDRK?=
 =?utf-8?B?VzRxc2swOU9IWFhlNWdiSmhzejcramdsWHhmTE0xY25vQkFjSFBTK1lGWWxa?=
 =?utf-8?B?L1dJUWozbGJpM2lSaytPYmtoem14NGwyNlBqRkFDUUZRa2FZT2FqNW1uUVNC?=
 =?utf-8?B?dEtJYVNwNjlqcmZmeVdxcE55QWo3U3h5RTZMY1FjZEw2M0ZVb3hxMDkzUWph?=
 =?utf-8?B?eHhVQ1M3amczOVkrNXVjWHViUmRtdHBNTU80a013UEU1ZWJtUlpzRVRTeTQ1?=
 =?utf-8?B?TjdWd21GNHVwdWxuU01NaENiaS9Ob1NpdnFPY3hLRnppT0xWVFJvWGdZNmdU?=
 =?utf-8?B?cTRnbU9weDdlSjdWV0ZDUWV0ZlA2NndGVEYvT0ZXYnFMZnBBVThxbGgyZnRv?=
 =?utf-8?B?N3grYzF1ZnJBT3AzUVFQZ2djSGxGcnZGSWw2c0hxTDhGUURPL2FaWC9pb2Fq?=
 =?utf-8?B?SUh3dm9BZ28yOUVYbU1kb01mVU12Yk1OcUczZE1yNnJOZWtnSG1NdytVZVpQ?=
 =?utf-8?B?SERScVdiSDNFTVg3ZEVNVkRuMjJDTXdNWUo0RTJkbnpsYUxkb2xaY0RIQjJ5?=
 =?utf-8?B?T0dKM2dVbmZndGhLd1R6YlRwU0dPdjJyRFJWbjVscC9TWU5jdEhjMm5uSVEy?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E75571D80949D4EAEF18C6605EF537E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5691.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae0a0f4-cd8d-4a59-c25e-08dd39334bfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:17:43.6785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xjgFIp5ZZfxePFvrW4eMAaOyv41ANjvbEdUEYLzTpxEX2KxtNph3ylaOviT2c74ZblD8hG+IFR7dBTvGWvDziI7vx+YHQnUfANHJ9cxMZwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6478

T24gVGh1LCAyMDI1LTAxLTE2IGF0IDExOjIwICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDE2LzAxLzIwMjUgMDk6MTgsIENhdGh5IFh1ICjorrjl
jY7lqbcpIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyNS0wMS0xNiBhdCAwODoyOCArMDEwMCwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4g
eW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+
ID4gDQo+ID4gPiBPbiAxNi8wMS8yMDI1IDAzOjIwLCBDYXRoeSBYdSAo6K645Y2O5am3KSB3cm90
ZToNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgYmlhcy1wdWxsLWRvd246DQo+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgb25lT2Y6DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAtIHR5cGU6IGJv
b2xlYW4NCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgIC0gZW51bTogWzEwMCwgMTAxLCAxMDIs
IDEwM10NCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgZGVzY3JpcHRpb246IG10ODE5NiBw
dWxsIGRvd24gUFVQRC9SMC9SMQ0KPiA+ID4gPiA+ID4gdHlwZQ0KPiA+ID4gPiA+ID4gZGVmaW5l
IHZhbHVlLg0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgLSBlbnVtOiBbMjAwLCAyMDEsIDIw
MiwgMjAzLCAyMDQsIDIwNSwgMjA2LA0KPiA+ID4gPiA+ID4gMjA3XQ0KPiA+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogbXQ4MTk2IHB1bGwgZG93biBSU0VMIHR5cGUNCj4g
PiA+ID4gPiA+IGRlZmluZQ0KPiA+ID4gPiA+ID4gdmFsdWUuDQo+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gTm90IG11Y2ggaW1wcm92ZWQuDQo+ID4gPiA+IA0KPiA+ID4gPiAgIEkgaGF2ZSByZW1vdmVk
IHRoZSBjb250ZW50IHJlbGF0ZWQgdG8gJ3Jlc2lzdGFuY2UgdmFsdWUnLCB3ZQ0KPiA+ID4gPiB1
c2UNCj4gPiA+ID4gJ1JTRUwnIGluc3RlYWQgb2YgJ3Jlc2lzdGFuY2UgdmFsdWUnLg0KPiA+ID4g
DQo+ID4gPiBTbyB0aGUgdmFsdWUgaW4gT2htcyB3YXMgcmVtb3ZlZD8gSSBhc3N1bWUgYWJvdmUg
ZG8gbm90IGhhdmUNCj4gPiA+IGtub3duDQo+ID4gPiB2YWx1ZQ0KPiA+ID4gaW4gT2htcz8NCj4g
PiANCj4gPiAgIFllcywgdmFsdWUgaW4gT2hucyB3YXMgcmVtb3ZlZCwgbm8gY29kZSBoYXZlIGtu
b3dtIHZhbHVlLg0KPiANCj4gRG9lcyB0aGUgaGFyZHdhcmUgaGF2ZSBrbm93biB2YWx1ZSBpbiBP
aG1zPw0KDQogIFdoYXQgZG8geW91IG1lYW4gYnkgJ2hhcmR3YXJlJz8gV2hlbiB3cml0aW5nIHRv
IHRoZSByc2VsIHJlZ2lzdGVyLA0KdGhlIHZhbHVlIHdyaXR0ZW4gaXMgMC03Lg0KDQo+IA0KPiAN
Cj4gPiANCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgRm9yIHB1bGwgZG93biB0eXBlIGlzIG5vcm1hbCwgaXQgZG9lc24ndA0KPiA+ID4gPiA+ID4g
bmVlZA0KPiA+ID4gPiA+ID4gYWRkDQo+ID4gPiA+ID4gPiBSU0VMICYgUjFSMC4NCj4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgIEZvciBwdWxsIGRvd24gdHlwZSBpcyBQVVBEL1IwL1IxIHR5cGUs
IGl0DQo+ID4gPiA+ID4gPiBjYW4NCj4gPiA+ID4gPiA+IGFkZA0KPiA+ID4gPiA+ID4gUjFSMCBk
ZWZpbmUgdG8NCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgIHNldCBkaWZmZXJlbnQgcmVzaXN0
YW5jZS4gSXQgY2FuIHN1cHBvcnQNCj4gPiA+ID4gPiA+ICJNVEtfUFVQRF9TRVRfUjFSMF8wMCIg
Jg0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIk1US19QVVBEX1NFVF9SMVIwXzAxIiAmDQo+
ID4gPiA+ID4gPiAiTVRLX1BVUERfU0VUX1IxUjBfMTAiDQo+ID4gPiA+ID4gPiAmDQo+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAiTVRLX1BVUERfU0VUX1IxUjBfMTEiIGRlZmluZSBpbiBtdDgx
OTYuDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICBGb3IgcHVsbCBkb3duIHR5cGUgaXMgUEQv
UlNFTCwgaXQgY2FuIGFkZA0KPiA+ID4gPiA+ID4gUlNFTA0KPiA+ID4gPiA+ID4gZGVmaW5lIHRv
IHNldA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgZGlmZmVyZW50IHJlc2lzdGFuY2UuIEl0
IGNhbiBzdXBwb3J0DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAiTVRLX1BVTExfU0VUX1JT
RUxfMDAwIiAmDQo+ID4gPiA+ID4gPiAiTVRLX1BVTExfU0VUX1JTRUxfMDAxIiAmDQo+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAiTVRLX1BVTExfU0VUX1JTRUxfMDEwIiAmDQo+ID4gPiA+ID4g
PiAiTVRLX1BVTExfU0VUX1JTRUxfMDExIiAmDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAi
TVRLX1BVTExfU0VUX1JTRUxfMTAwIiAmDQo+ID4gPiA+ID4gPiAiTVRLX1BVTExfU0VUX1JTRUxf
MTAxIiAmDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAiTVRLX1BVTExfU0VUX1JTRUxfMTEw
IiAmDQo+ID4gPiA+ID4gPiAiTVRLX1BVTExfU0VUX1JTRUxfMTExIg0KPiA+ID4gPiA+ID4gZGVm
aW5lIGluDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICBtdDgxOTYuDQo+ID4gPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL210ODE5Ni1waW5mdW5jLmgN
Cj4gPiA+ID4gPiA+IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL210ODE5Ni1waW5mdW5j
LmgNCj4gPiA+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+ID4gPiBpbmRleCAw
MDAwMDAwMDAwMDAuLmJmMGM4Mzc0NDA3Yw0KPiA+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ID4gPiA+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL210ODE5Ni1waW5mdW5j
LmgNCj4gPiA+ID4gPiA+IEBAIC0wLDAgKzEsMTU3MiBAQA0KPiA+ID4gPiA+ID4gKy8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlDQo+ID4gPiA+
ID4gPiAqLw0KPiA+ID4gPiA+ID4gKy8qDQo+ID4gPiA+ID4gPiArICogQ29weXJpZ2h0IChDKSAy
MDI1IE1lZGlhdGVrIEluYy4NCj4gPiA+ID4gPiA+ICsgKiBBdXRob3I6IEd1b2RvbmcgTGl1IDxH
dW9kb25nLkxpdUBtZWRpYXRlay5jb20+DQo+ID4gPiA+ID4gPiArICovDQo+ID4gPiA+ID4gPiAr
DQo+ID4gPiA+ID4gPiArI2lmbmRlZiBfX01UODE5Nl9QSU5GVU5DX0gNCj4gPiA+ID4gPiA+ICsj
ZGVmaW5lIF9fTVQ4MTk2X1BJTkZVTkNfSA0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKyNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL210NjV4eC5oPg0KPiA+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5DX0dQSU8wIChNVEtfUElOX05PKDAp
IHwgMCkNCj4gPiA+ID4gPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9fRlVOQ19ETUlDMV9DTEsg
KE1US19QSU5fTk8oMCkgfCAxKQ0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19G
VU5DX1NQSTNfQV9NTyAoTVRLX1BJTl9OTygwKSB8IDMpDQo+ID4gPiA+ID4gPiArI2RlZmluZSBQ
SU5NVVhfR1BJTzBfX0ZVTkNfRk1JMlNfQl9MUkNLIChNVEtfUElOX05PKDApIHwNCj4gPiA+ID4g
PiA+IDQpDQo+ID4gPiA+ID4gPiArI2RlZmluZSBQSU5NVVhfR1BJTzBfX0ZVTkNfU0NQX0RNSUMx
X0NMSyAoTVRLX1BJTl9OTygwKSB8DQo+ID4gPiA+ID4gPiA1KQ0KPiA+ID4gPiA+ID4gKyNkZWZp
bmUgUElOTVVYX0dQSU8wX19GVU5DX1RQX0dQSU8xNF9BTyAoTVRLX1BJTl9OTygwKSB8DQo+ID4g
PiA+ID4gPiA2KQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEkgZG8gbm90IHNlZSBob3cgeW91IHJl
c29sdmVkIG15IGNvbW1lbnQgZnJvbSB2MS4gSW4gdjIgSQ0KPiA+ID4gPiA+IHJlbWluZGVkDQo+
ID4gPiA+ID4gYWJvdXQNCj4gPiA+ID4gPiBpdCwgc28geW91IHJlc3BvbmRlZCB0aGF0IHlvcHUg
d2lsbCBjaGFuZ2Ugc29tZXRoaW5nLCBidXQgSQ0KPiA+ID4gPiA+IGRvDQo+ID4gPiA+ID4gbm90
DQo+ID4gPiA+ID4gc2VlDQo+ID4gPiA+ID4gYW55IGNoYW5nZXMuDQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gU28gZXhwbGFpbjogaG93IGRpZCB5b3UgcmVzb2x2ZSBteSBjb21tZW50Pw0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IFRoZXNlIHR3byBleGFtcGxlcyB3aGVyZSB5b3UgY2xhaW0geW91IHdp
bGwgY2hhbmdlIHNvbWV0aGluZywNCj4gPiA+ID4gPiBidXQNCj4gPiA+ID4gPiBzZW5kDQo+ID4g
PiA+ID4gdGhlIHNhbWUuIEkgc2tpcHBlZCB0aGUgcmVzdCBvZiB0aGUgcGF0Y2guDQo+ID4gPiA+
IA0KPiA+ID4gPiAgIFRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW50IHJlc3BvbnNlLCBoZXJlIGlz
IG15IGV4cGxhbmF0aW9uDQo+ID4gPiA+IGZvcg0KPiA+ID4gPiB5b3UNCj4gPiA+ID4gcXVlc3Rp
b246DQo+ID4gPiA+IA0KPiA+ID4gPiAgIEluIHYxLCBJIHVuZGVydGFuZCB0aGF0IHlvdSBtZWFu
dCBJIGRpZG4ndCBzZW50IGEgcmVhbA0KPiA+ID4gPiBiaW5kaW5nLA0KPiA+ID4gPiBhbmQNCj4g
PiA+IA0KPiA+ID4gDQo+ID4gPiBUaGUgY29tbWVudCBpcyB1bmRlciBzcGVjaWZpYyBsaW5lcywg
c28gSSBzYWlkIHRoZXNlIGRlZmluZXMgYXJlDQo+ID4gPiBub3QNCj4gPiA+IGENCj4gPiA+IHJl
YWwgYmluZGluZy4gWW91IHNlbnQgdGhlbSBhZ2FpbiwgYnV0IHRoZXkgYXJlIHN0aWxsIG5vdA0K
PiA+ID4gYmluZGluZ3MsDQo+ID4gPiBiZWNhdXNlIHRoZXkgYXJlIG5vdCB1c2VkIGluIHRoZSBk
cml2ZXIuIE1heWJlIHRoZSB1c2FnZSBpcw0KPiA+ID4gY29udm9sdXRlZCwNCj4gPiA+IHNvIHdo
aWNoIHBhcnQgb2YgaW1wbGVtZW50YXRpb24gYXJlIHRoZXNlIGNvbm5lY3Rpbmcgd2l0aCBEVFM/
DQo+ID4gPiBJT1csDQo+ID4gPiB3aGljaCBwYXJ0IG9mIGRyaXZlciByZWxpZXMgb24gdGhlIGJp
bmRpbmc/DQo+ID4gDQo+ID4gICBJIGdvdCB5b3UuIFRoaXMgYmluZGluZyBkZWZpbmUgbWFueSBt
YWNyb3MsIHdoaWNoIHdpbGwgYmUgdXNlZA0KPiA+IGZvcg0KPiA+ICdwaW5tdXgnIHNldHRpbmcg
aW4gdGhlIERUUy4gVGhlIHVzYWdlIGxpa2UgdGhpczoNCj4gPiANCj4gPiAgIGFkc3BfdWFydF9w
aW5zOiBhZHNwLXVhcnQtcGlucyB7DQo+ID4gICAgICAgICAgICAgICAgIHBpbnMtdHgtcnggew0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9DQo+ID4gPFBJTk1VWF9HUElPMzVf
X0ZVTkNfT19BRFNQX1VUWEQwPiwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8UElOTVVYX0dQSU8zNl9fRlVOQ19JMV9BRFNQX1VSWEQwDQo+ID4gPjsNCj4gPiAgICAgICAg
ICAgICAgICAgfTsNCj4gPiAgICAgICAgIH07DQo+IA0KPiANCj4gVGhhdCdzIERUUywgbm90IGRy
aXZlciwgc28gbm90IGEgYmluZGluZy4gRHJvcCB0aGUgaGVhZGVyIGZyb20NCj4gYmluZGluZ3Mu
DQoNCiAgU29ycnksIEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB0aGUgcmVsYXRpb25zaGlwIGJl
dHdlZW4gYmluZGluZyBhbmQNCmRyaXZlci4gRHJpdmVyIHdpbGwgcGFyc2UgdGhpcyBtYWNybyB0
byBnZXQgZ3BpbyBudW1iZXIgYW5kIGZ1bmN0aW9uLg0KDQo+IA0KPiANCj4gQmVzdCByZWdhcmRz
LA0KPiBLcnp5c3p0b2YNCg==

