Return-Path: <linux-gpio+bounces-14769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9700FA104FF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 12:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7986D1885AA2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 11:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BE922963F;
	Tue, 14 Jan 2025 11:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PyCxBsJd";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fF5hZACw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995301ADC9B;
	Tue, 14 Jan 2025 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852898; cv=fail; b=iQDYU/kOomxitaZha1F4hs99+8OtNdA/MXftRz6rWHyQzgbhztDB3CTFw8+HbXZLvyT2OfAar8ic7yrxVeXtENJREm0zxEqhgAEHlr9huCARUi8W38yikH5ZkAQ+zSppFuMSCezfWjAWM4GRoHJVxO4Elt7+ByTlC9rI5rEpwTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852898; c=relaxed/simple;
	bh=TXFkEkv/TA7fiCSMUz7D9wQqTOoyaIT8uVyWamccfCc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p2+cJV5bpCuepFz+qNQ+dZCB8NNsAHh2jpxLY5GpXcnuEp2of6YabrR6TMBYLNI6Pa0VUEH4MLZN3YX/dypEEDfnbsdPwRat+wQRZ+C8yaBXP/cq/12ldz5dmFlVHqP0hAvWQ6yD2Fz6dU6Dy88b12S3iRv95XTh4sFfDC6pJcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PyCxBsJd; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=fF5hZACw; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d5d7a95ad26711ef99858b75a2457dd9-20250114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=TXFkEkv/TA7fiCSMUz7D9wQqTOoyaIT8uVyWamccfCc=;
	b=PyCxBsJd9TN1ypiw4t6ssqyYqNVzZbjTq69rlIWIFiuKo+N5XTuV/2qvK0uOqT4/ie7YurISbPfyQwiFD0fGHyQC4wMIzdZQnvGbh6JsukuHrWdVPs4OOizlkgBzcv3J9nUubvv1f1UEfoapLiboB7OkJuR/PAuhaLjI4PxAbIg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b35b7156-110e-4872-b0d1-81cb520c8667,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:6162dd37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: d5d7a95ad26711ef99858b75a2457dd9-20250114
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 876717721; Tue, 14 Jan 2025 19:08:08 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 Jan 2025 19:08:07 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 14 Jan 2025 19:08:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBdLf1oSuEP6nLdES5piP2Z7G6KjPMxnUqRFLCaZt4w5sNzO6zSBs3bB/nhuEuW7r4+NubwyXI2r3imOZcVT6aZIhuSDOsqC1dM2CDV7U6QqW+XJ4x0S3R5+lBFQpsK5aicfTGJwyT/8oXQ82G1dOm+GSXSsDOD63MpB/rYI7o8GMIuUrSlYPaRwMzYN/uICn2sFSryCVm6GQfpcIvc+q0ktMoWY+KKFPRob1BNLL7G5pfuRGu4cR3y1eIC4gByBH2HZMyzRcaL0VueI7RHnud2HXaZKApj3SlX7I52NYlo8N9brBXuVO9MWu+ofJx5C11n62ixTwGuBE4XvAYRHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXFkEkv/TA7fiCSMUz7D9wQqTOoyaIT8uVyWamccfCc=;
 b=wZF55kxdpU3RikXBjiPmlpi+1V71DayznZSqPh4+JkLiwwKrFkWd9+8nQao/cDZrW+tQHFmiqFUbVDJPSNPUqO8oace6mlZVQYq/DyQbt+HB/3cB0/Yvh8EW/48hs4hVC6Wyg3BT3wME0f0enwu+u4IogcAB4ARzZ0Uv9cpSl9BEog8T5/v2e/UMBIGAaRXnjPTT+Mnj1KZDlsRVc0ywL7rtw9SZCm6Xc9BC8t++P4IKqxOj9RRrmvRiMggV7bYNjJcV9ZkvpLt7+vviMcSfcNMx8FwPTpozs6/9BPpBMh47bcZVCS/a1RysyKpakwo6ftbeASeXku1igJg5mMPZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXFkEkv/TA7fiCSMUz7D9wQqTOoyaIT8uVyWamccfCc=;
 b=fF5hZACwzCW6KVNDhr7JolumrbbwNJd8duryfsI/VbvCnEN3slZCeIrD+OjsLk/nIzFUh1jqXaKaMUCILJeElhjF3OMiSe8gE7NQ2b/B7BfjtzgGUi36A/bWfKZFhdyQoLe9jfVE25RPpHhZ2H1r36fyybPQTpu5yq8agkbi+vI=
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com (2603:1096:301:88::14)
 by JH0PR03MB7788.apcprd03.prod.outlook.com (2603:1096:990:c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 11:07:29 +0000
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc]) by PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc%6]) with mapi id 15.20.8335.012; Tue, 14 Jan 2025
 11:07:29 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"krzk@kernel.org" <krzk@kernel.org>
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
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Topic: [PATCH v2 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Index: AQHbY00KSHnfr3G4ikSgeIFDulfqxbMRU1EAgANiBwCAAW0LgA==
Date: Tue, 14 Jan 2025 11:07:29 +0000
Message-ID: <2d5e4d4e9ce0089a565783f0c31a43e33e4c122d.camel@mediatek.com>
References: <20250110104703.13625-1-ot_cathy.xu@mediatek.com>
	 <20250110104703.13625-2-ot_cathy.xu@mediatek.com>
	 <dnjtaapqbn6zy55k5ky7zltswkbg7cjh2xwlnrmqdiz7tfm6rc@wbepc5koem6e>
	 <66218a3c-04c5-42ea-ba9c-e0fbc72ed16f@collabora.com>
In-Reply-To: <66218a3c-04c5-42ea-ba9c-e0fbc72ed16f@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5688:EE_|JH0PR03MB7788:EE_
x-ms-office365-filtering-correlation-id: 5ecc72ba-c0b6-4ba4-6a9b-08dd348ba2fe
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WXN5dDVQODRNMGF5clpITGlSbngzR2I5TTRNNitKZ0R3V1BoSGc3SzJRanZ1?=
 =?utf-8?B?ZzdkMmFtbDQrU2doYlo4S0pGTEEvY1N3S3dXc2xoVVl0cnF0THRtQmFpNHRy?=
 =?utf-8?B?bzR4Q3dXNFdCbkdSMFp1K2UyOExGQi9VcWcxcFU4S0VUWVQxQU11WHB2a04v?=
 =?utf-8?B?NkJFanZwUndmM1lWUGhpTVlVR0tqVlVQTVJzTkVjemdUZWkvNHZSWVdpRTNw?=
 =?utf-8?B?bHVNYnZPRHc3MStVTlJ6bmt0YUlhSFlkampCTW9pNEVCR0NIbWN3bFNKcFRP?=
 =?utf-8?B?UXYwWVFVT0VQVDhOMmR5RVo2Sjd1bGgxRDExUGhGbGlmT0h0YmR5cXZlU1ph?=
 =?utf-8?B?cC81N1AwUTVzZlRtSm1TaVNSbmdlVFBCaTdxU2hvQ3VXaEk0NHByTENDdE4x?=
 =?utf-8?B?aGhOQXZIdXJFaTl1S1pZSUZBaEZxaDFZMjBlZ3B0VzhjeUY3aCtWdmVZbmhE?=
 =?utf-8?B?Zmx3Q3MwWFJESTI3Q2dScFI0WWtBbURiaTY5VXUrV0k4WWsxOUZUd29qdUJ6?=
 =?utf-8?B?Y0dSZ1lhL2JIcUR4Tks1ZFE1eDhtMkFXZGNVRlV2b1VWYlo0dGl1MWFqenZx?=
 =?utf-8?B?bHFiQkNsRU5KRHdwTnU2NDArZkUyNFh0SGR4SERYNUJNYTJZa3hqaXJwRmNX?=
 =?utf-8?B?V1MrUncvVDJadThHZHV5UXlJWU1BNUlnK3lGdWcrNjY2OTduQTFkY2RtLzho?=
 =?utf-8?B?c2MzZUtUOHdnaW9ORVc5ZktyVFg5TnZBNFV1WW5Ua1RSR0dSdC9LNlVIWU5V?=
 =?utf-8?B?bU5HamljSFAwR0xmbXY5a0x3TTJHWVhBaFBha1VHZC9BTG8zRktHa1QxSk9B?=
 =?utf-8?B?OG55U3hEYUUvbjY0b0pKSXRWUlVFNUZ6UVBMTkNKd3ZqdlhaK2l6RXpobjZK?=
 =?utf-8?B?SFN3TVFHekhZaGFzN0dPWlB5VmhtbEtEZGJybHQwd1huU1Mvc2RIQlE2Tmd1?=
 =?utf-8?B?c3BnWUJGSXRUY1pNMVhUSnE4ZmVFcnVCY3B0UDhCSFh4cjlVcnF6Q3JyWnk0?=
 =?utf-8?B?VXJQcUhwV2VmTEZUWGlMQWdrcVJmbU5oalhHRnlySjk5aDlJeHE0OG54OHNP?=
 =?utf-8?B?YzgrcUhMajFaa1A1ZmkrTklkTVE5aWM0ejkvWm0rMnNCZi9pY2xXdEtJSUdt?=
 =?utf-8?B?clhWU09QZkZ3a3FCVU4yb0tsKzVvcjJNZ0s1SU9hMUJRU3A5QjR1QkNPckFo?=
 =?utf-8?B?NnVtZnp3MmVoenc2VjFEVzcwVEtmWDZBNFM2WEloOFc5Ukh0SGUwY2hQZDNQ?=
 =?utf-8?B?TmVjaytDMElISWdKbVRybkhQbjlhSkVYdVFoa05CQWd6M2JkYjE5cS9XMVZO?=
 =?utf-8?B?bzBwaEl6aHU1emxncDczak1QRmM0MDZaK3JyZ01ZQ3NCTUFjMmRQZjlGT2Nx?=
 =?utf-8?B?T2VRazFmZU44aUFzL3ZjWGJtNFd2SlBwYmhHS2JoZjZpSkE4WkJoeHJIZHlB?=
 =?utf-8?B?Z2w5N1ZHL0ZLR3ZGQ3duSlJMRDNYSzVXdWtHc0p1UXhZaS9jK1B4c1U3bnBG?=
 =?utf-8?B?UUV3RjZvakdEM0ZFSGFERUhmWFgvNktQS1hIYTBRbnpnenc3S2twRXVTMVhq?=
 =?utf-8?B?SGFacC9PWXE3dlZaZDZ4U1BOTXAwekQ3YzlXR0tmdTQ5TlFMZ0s1NkFWdHpo?=
 =?utf-8?B?ZmJsSlNoaDVGbmRBZ2o3c1hCMTR1M2RpMEgzY3llQS94TkRCZjhWODZwVXRo?=
 =?utf-8?B?QU5FTHNMMXRlK0xacm1wVlRsRzBTblNUc0RzZjVOT2lUR0hRNDRrVFZHWXlV?=
 =?utf-8?B?WlJJVk9QTWR5cE9JaVVnOWlYTktiWWdLaGZBL3F3QzVLYzJiaDlZUTZRaU9p?=
 =?utf-8?B?Zm1hUDFLeVIrRHRmV3VRMTM2UnRQTUJZVnJqUUtCSnhzSW95N0NSSkZ2WU05?=
 =?utf-8?B?UTFBR3dFbWJTOGo1RUo3bGRjbXUrNFoxMkdHQm5XUFdNY3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUdEY3NSUlN3M1BZcWhjQkZrUElab3lPU0FreGM2RVdtRzZWU0VKR0ZhVGpz?=
 =?utf-8?B?SFBrNXlrNE1jM3ZLcTZLWG1uaFVyN0E2ZDh3TE9KSGtSbDRPaDJ5ZkpSM2pK?=
 =?utf-8?B?NHFnTVd4QWVGYndqc0JNdmNDUW1TYWpjZ1NDODU5UkRML0NEMW1SY1dHaGJq?=
 =?utf-8?B?NXIvUnhIajFXcXJrcTQ0cXhMU3lhRDhBR1oxaDBaVE9vN2YxVHVFS09qKytN?=
 =?utf-8?B?ZE9FUVJxTWdUSWJERnZQVVlqRW9QbjRwMDhJUkE3UFJUVUtTL0xqdkVXSUto?=
 =?utf-8?B?M3BUYWRHZnJaaHEzU3FPQ1hEMTJPQkRWUFFFVFNpVzhCN2xmdmp0dUxZcWdv?=
 =?utf-8?B?YVRLcG5va1hzeVRUMUVTbWNGTE1rQncxbGNaQmoyNXZYelNqc0kwd3RZRUIv?=
 =?utf-8?B?ZGlaM0V3YndLQmx1OGJUenVoc2IrZzc1MVpjL21QWEFSTW9BUldQemRFRkts?=
 =?utf-8?B?NFJzSlhIOUZ3ajRGc3E0MEY5Si9GT1JoMngxSCtHMHhpRU84MTgvbUNnN1lS?=
 =?utf-8?B?d1FUM0M3MjVyWHVway9uaGFlMTg0L3plWXdiWXJucU91UDlaN3hHM3RkR1Fy?=
 =?utf-8?B?OGpGc1o5QnN2ZEVLSjdySmFpYTBqYVcwZlBlUHN1SEF6QThsbW9pN1U2M1JL?=
 =?utf-8?B?bVlFOTE4UWYvdTYrOVFtN0xBOGVtQTJac05KWjMrQlZjT2hNV3FIMC9hZkE5?=
 =?utf-8?B?TUpWcjFBY0xSWUlKdFJuR2svZlFkN2RpN1BoclJydXhHbFdYNUpabDlRc0FS?=
 =?utf-8?B?OFAxVFFXSkZVTk9vL2NIdUliTTFteTJod1VwcGc1VVFrdHhQYnpnRDlzd0VM?=
 =?utf-8?B?NWVzQkZnOUNHVGtHcEhnMHJuSnAwVzBiRlZGSTNvUVdWcThLOHRNa1B2MEZl?=
 =?utf-8?B?dmNTY3JyUmxGdTFubnNqNE9CVk45VnlwN3dTNWJMblBYVWRrQ3E0dlB4MEph?=
 =?utf-8?B?eUZLU3haWThLK2hiUXhsM2VESERBWTA0UnprSjhHWXBDTHRVMkpTdmtYWUNH?=
 =?utf-8?B?dVAwSERCSGZ3dUNoa2RFNWZOR1pIQUQ0SElmWWVjV0lDZEhDZnpFcjdrbnlK?=
 =?utf-8?B?NS9hRlArR2FVMmh1SnRWNGNvbUNCNDFneTZxTld4Q1V5NS9HMmhGRGVqRDdT?=
 =?utf-8?B?TXNGWlF5T1ZzaG5HRm8zRHhhY28vUWJtMFhGbWxnOTZaTW1qUDl0bFRDdGdw?=
 =?utf-8?B?K1M0VndXZ3R0NDQzb1B1eHYwYUpNZWhlaDlaQm5JWWpSUnpHdUtWd1FQc1dE?=
 =?utf-8?B?UFZzaGhkZSszcjZyOW9oOEJEYnRhZzBNL1RzOWFuekQ0NktkanptZHFMR1lN?=
 =?utf-8?B?ejc2eVhJM290b3NJcGRvWVp1K0c0YUlmM0VtUFFSWWF0K3dRaXUrdEJNQUFO?=
 =?utf-8?B?ejlEZm5BQ2hYWktpWFVIazA2RGc0WWFNYjJuRFFvdHp0NktrV1NXVGVlWFU3?=
 =?utf-8?B?ejFxS0FMWVF5Z1FlK1NITzVoZjQ1dnlHeWU3a1dBNERpbEl6Y0JWTkR0MytM?=
 =?utf-8?B?SWVlSWh6amhtcmdhTUVCV1BRUEI3SFR4ajlnbm9UeS9jRUcxczFGUTViajlV?=
 =?utf-8?B?L29pQ0x0VFNtbk9KWHFwUS84eFR4ZnJhWGFWaUh5Q0UzTHFoMGxlSzJNRTNl?=
 =?utf-8?B?YkhwYXI2VDdyMEhDdU5KOXlNOUhRbUJYbkxZM2xrRkJJaXV1OHhQUllTV2ZZ?=
 =?utf-8?B?ZmViWWx4NmdJZ1BPTFVGWWtOTGNUQldjcUhaNlBMTDRYbjg4Nm9pZENJNlpp?=
 =?utf-8?B?Y0lQMS9laElSV2l4dzZudVFUNFl4Zmg2bFhKaUN4S3JKcG4vSVZzZmdJOTZK?=
 =?utf-8?B?QUdwNk52MEppRTV0VnhvU2QyeVlTR3l2Rnp3bk84eEZnQkd4dzlaeHM5NGFk?=
 =?utf-8?B?SlcyeDBjZUYwZCtyK0pCM3R2MFQvbjFDWG1zUTdpR25rMzN0cnY1U0RSVU85?=
 =?utf-8?B?REdVcjZFUy9pRC9RSlJzbWhzcHdldUpXSjdTM1VoSS9kSGVuWG85dDN2MUls?=
 =?utf-8?B?WmY0TTlnZTFBbjRMTHN5cEJuT3RmaXk3U3AwNmZEOGZLM3Y3N1E5SDg2WWFI?=
 =?utf-8?B?VFdNeTQ2WmlPc2ZvcHJqb3RCK2hOdmxjL1VIOXJnZHMwVXNDcTkzOS9yelZ0?=
 =?utf-8?B?SWZVSFZSU25xNUpBc1hORG5mS0t1VHdLVmJyaTZZbDJqaHpFN0kzL1Nxcmda?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <615F2293596E0C4E97FA5F66FE89EC94@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ecc72ba-c0b6-4ba4-6a9b-08dd348ba2fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 11:07:29.5783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9V5Dhpa++8yT3MRKU1EneNVH/vEwMRXrmxvejMpH1Lv0PrNZz+azBFBoyP9+nZIy8CnQhy2MUG0ZsRzNDtf+oQhkMslXjiNA45jmENe2cNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7788

T24gTW9uLCAyMDI1LTAxLTEzIGF0IDE0OjIwICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAxMS8wMS8yNSAxMDo0MSwgS3J6eXN6dG9m
IEtvemxvd3NraSBoYSBzY3JpdHRvOg0KPiA+IE9uIEZyaSwgSmFuIDEwLCAyMDI1IGF0IDA2OjQy
OjI4UE0gKzA4MDAsIENhdGh5IFh1IHdyb3RlOg0KPiA+ID4gMS5BZGQgcGluY3RybCBmaWxlIG9u
IE1lZGlhVGVrIG10ODE5Ni4NCj4gPiANCj4gPiBXaGVyZT8gV2hhdCBpcyBwaW5jdHJsIGZpbGU/
DQo+ID4gDQo+ID4gPiAyLkFkZCB0aGUgbmV3IGJpbmRpbmcgZG9jdW1lbnQgZm9yIHBpbmN0cmwg
b24gTWVkaWFUZWsgbXQ4MTk2Lg0KPiA+IA0KPiA+IExvb2sgYXQgZ2l0IGhpc3RvcnkgaG93IGNv
bW1pdCBtc2dzIGFyZSB3cml0dGVuIGZvciBzdWNoIGNoYW5nZXMuDQo+ID4gDQo+ID4gPiANCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgTGl1IDxndW9kb25nLmxpdUBtZWRpYXRlay5jb20+
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDYXRoeSBYdSA8b3RfY2F0aHkueHVAbWVkaWF0ZWsuY29t
Pg0KPiA+ID4gLS0tDQo+ID4gPiAgIC4uLi9waW5jdHJsL21lZGlhdGVrLG10ODE5Ni1waW5jdHJs
LnlhbWwgICAgICB8ICAyNjYgKysrDQo+ID4gPiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvcGluY3Ry
bC9tdDgxOTYtcGluZnVuYy5oICB8IDE1NzINCj4gPiA+ICsrKysrKysrKysrKysrKysrDQo+ID4g
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTgzOCBpbnNlcnRpb25zKCspDQo+ID4gPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NA0KPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0
cmwvbWVkaWF0ZWssbXQ4MTk2LQ0KPiA+ID4gcGluY3RybC55YW1sDQo+ID4gPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvbXQ4MTk2LXBpbmZ1bmMuaA0K
PiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10ODE5Ni0NCj4gPiA+IHBpbmN0cmwueWFtbA0K
PiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRl
ayxtdDgxOTYtDQo+ID4gPiBwaW5jdHJsLnlhbWwNCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmFiZWIwZDk0MmNjNA0KPiA+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0
cmwvbWVkaWF0ZWssbXQ4MTk2LQ0KPiA+ID4gcGluY3RybC55YW1sDQo+ID4gPiBAQCAtMCwwICsx
LDI2NiBAQA0KPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlKQ0KPiA+ID4gKyVZQU1MIDEuMg0KPiA+ID4gKy0tLQ0KPiA+ID4gKyRp
ZDogDQo+ID4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvcGluY3RybC9tZWRpYXRlayxtdDgxOTYtcGluY3RybC55YW1sKl9fO0l3ISFD
VFJOS0E5d01nMEFSYnchbGFOaUIxZU95Y2lsWWNBcDVpQloxZk9HUXJYRWcybHI4Umt0NzI3VEU1
NGVfOURsUG9BTmt3c3NER0QxNlExSmlmMEVkUTh2YUFWSE5HMU1NTWk5VTVyQjlvWUJneU1EWkEk
DQo+ID4gPiArJHNjaGVtYTogDQo+ID4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3
TWcwQVJidyFsYU5pQjFlT3ljaWxZY0FwNWlCWjFmT0dRclhFZzJscjhSa3Q3MjdURTU0ZV85RGxQ
b0FOa3dzc0RHRDE2UTFKaWYwRWRROHZhQVZITkcxTU1NaTlVNXJCOW9ab1VpdzA5dyQNCj4gPiA+
ICsNCj4gPiA+ICt0aXRsZTogTWVkaWFUZWsgTVQ4MTk2IFBpbiBDb250cm9sbGVyDQo+ID4gPiAr
DQo+ID4gPiArbWFpbnRhaW5lcnM6DQo+ID4gPiArICAtIExlaSBYdWUgPGxlaS54dWVAbWVkaWF0
ZWsuY29tPg0KPiA+ID4gKyAgLSBDYXRoeSBYdSA8b3RfY2F0aHkueHVAbWVkaWF0ZWsuY29tPg0K
PiA+ID4gKw0KPiA+ID4gK2Rlc2NyaXB0aW9uOg0KPiA+ID4gKyAgVGhlIE1lZGlhVGVrJ3MgTVQ4
MTk2IFBpbiBjb250cm9sbGVyIGlzIHVzZWQgdG8gY29udHJvbCBTb0MNCj4gPiA+IHBpbnMuDQo+
ID4gPiArDQo+ID4gPiArcHJvcGVydGllczoNCj4gPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gPiAr
ICAgIGNvbnN0OiBtZWRpYXRlayxtdDgxOTYtcGluY3RybA0KPiA+ID4gKw0KPiA+ID4gKyAgZ3Bp
by1jb250cm9sbGVyOiB0cnVlDQo+ID4gPiArDQo+ID4gPiArICAnI2dwaW8tY2VsbHMnOg0KPiA+
ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ICsgICAgICBOdW1iZXIgb2YgY2VsbHMgaW4gR1BJ
TyBzcGVjaWZpZXIsIHNob3VsZCBiZSB0d28uIFRoZQ0KPiA+ID4gZmlyc3QgY2VsbCBpcyB0aGUN
Cj4gPiA+ICsgICAgICBwaW4gbnVtYmVyLCB0aGUgc2Vjb25kIGNlbGwgaXMgdXNlZCB0byBzcGVj
aWZ5IG9wdGlvbmFsDQo+ID4gPiBwYXJhbWV0ZXJzIHdoaWNoDQo+ID4gPiArICAgICAgYXJlIGRl
ZmluZWQgaW4gPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPi4NCj4gPiA+ICsgICAgY29uc3Q6IDIN
Cj4gPiA+ICsNCj4gPiA+ICsgIGdwaW8tcmFuZ2VzOg0KPiA+ID4gKyAgICBtYXhJdGVtczogMQ0K
PiA+ID4gKw0KPiA+ID4gKyAgZ3Bpby1saW5lLW5hbWVzOiB0cnVlDQo+ID4gPiArDQo+ID4gPiAr
ICByZWc6DQo+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGdw
aW8gcmVnaXN0ZXJzIGJhc2UgYWRkcmVzcw0KPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHJ0
IGdyb3VwIGlvIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIGJhc2UNCj4gPiA+IGFkZHJlc3MNCj4g
PiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBybTEgZ3JvdXAgaW8gY29uZmlndXJhdGlvbiByZWdp
c3RlcnMgYmFzZQ0KPiA+ID4gYWRkcmVzcw0KPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHJt
MiBncm91cCBpbyBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyBiYXNlDQo+ID4gPiBhZGRyZXNzDQo+
ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogcmIgZ3JvdXAgaW8gY29uZmlndXJhdGlvbiByZWdp
c3RlcnMgYmFzZQ0KPiA+ID4gYWRkcmVzcw0KPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGJt
MSBncm91cCBpbyBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyBiYXNlDQo+ID4gPiBhZGRyZXNzDQo+
ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogYm0yIGdyb3VwIGlvIGNvbmZpZ3VyYXRpb24gcmVn
aXN0ZXJzIGJhc2UNCj4gPiA+IGFkZHJlc3MNCj4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBi
bTMgZ3JvdXAgaW8gY29uZmlndXJhdGlvbiByZWdpc3RlcnMgYmFzZQ0KPiA+ID4gYWRkcmVzcw0K
PiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGx0IGdyb3VwIGlvIGNvbmZpZ3VyYXRpb24gcmVn
aXN0ZXJzIGJhc2UNCj4gPiA+IGFkZHJlc3MNCj4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBs
bTEgZ3JvdXAgaW8gY29uZmlndXJhdGlvbiByZWdpc3RlcnMgYmFzZQ0KPiA+ID4gYWRkcmVzcw0K
PiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGxtMiBncm91cCBpbyBjb25maWd1cmF0aW9uIHJl
Z2lzdGVycyBiYXNlDQo+ID4gPiBhZGRyZXNzDQo+ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjog
bGIxIGdyb3VwIGlvIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIGJhc2UNCj4gPiA+IGFkZHJlc3MN
Cj4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBsYjIgZ3JvdXAgaW8gY29uZmlndXJhdGlvbiBy
ZWdpc3RlcnMgYmFzZQ0KPiA+ID4gYWRkcmVzcw0KPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246
IHRtMSBncm91cCBpbyBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyBiYXNlDQo+ID4gPiBhZGRyZXNz
DQo+ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogdG0yIGdyb3VwIGlvIGNvbmZpZ3VyYXRpb24g
cmVnaXN0ZXJzIGJhc2UNCj4gPiA+IGFkZHJlc3MNCj4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiB0bTMgZ3JvdXAgaW8gY29uZmlndXJhdGlvbiByZWdpc3RlcnMgYmFzZQ0KPiA+ID4gYWRkcmVz
cw0KPiA+ID4gKw0KPiA+ID4gKyAgcmVnLW5hbWVzOg0KPiA+ID4gKyAgICBpdGVtczoNCj4gPiA+
ICsgICAgICAtIGNvbnN0OiBpb2NmZzANCj4gPiA+ICsgICAgICAtIGNvbnN0OiBpb2NmZ19ydA0K
PiA+ID4gKyAgICAgIC0gY29uc3Q6IGlvY2ZnX3JtMQ0KPiA+ID4gKyAgICAgIC0gY29uc3Q6IGlv
Y2ZnX3JtMg0KPiA+ID4gKyAgICAgIC0gY29uc3Q6IGlvY2ZnX3JiDQo+ID4gPiArICAgICAgLSBj
b25zdDogaW9jZmdfYm0xDQo+ID4gPiArICAgICAgLSBjb25zdDogaW9jZmdfYm0yDQo+ID4gPiAr
ICAgICAgLSBjb25zdDogaW9jZmdfYm0zDQo+ID4gPiArICAgICAgLSBjb25zdDogaW9jZmdfbHQN
Cj4gPiA+ICsgICAgICAtIGNvbnN0OiBpb2NmZ19sbTENCj4gPiA+ICsgICAgICAtIGNvbnN0OiBp
b2NmZ19sbTINCj4gPiA+ICsgICAgICAtIGNvbnN0OiBpb2NmZ19sYjENCj4gPiA+ICsgICAgICAt
IGNvbnN0OiBpb2NmZ19sYjINCj4gPiA+ICsgICAgICAtIGNvbnN0OiBpb2NmZ190bTENCj4gPiA+
ICsgICAgICAtIGNvbnN0OiBpb2NmZ190bTINCj4gPiA+ICsgICAgICAtIGNvbnN0OiBpb2NmZ190
bTMNCj4gPiANCj4gPiBBcmUgeW91IHN1cmUgdGhlc2UgYXJlIHNlcGFyYXRlIGFkZHJlc3Mgc3Bh
Y2VzPw0KPiA+IA0KPiANCj4gVGhvc2UgYXJlIGRpZmZlcmVudCBwYXJ0aXRpb25zIG9mIHRoZSBH
UElPIGNvbnRyb2xsZXIsIG9mIHdoaWNoLCBlYWNoDQo+IG9uZSBkb2VzDQo+IHByb3ZpZGUgZnVs
bCBjb250cm9sIGFuZCBkaWZmZXJlbnQgZnVuY3Rpb25zIHRoYXQgYXJlIHBhcnRpdGlvbi0NCj4g
Z2xvYmFsIGFuZCBub3QNCj4gY29udHJvbGxlci1nbG9iYWwuDQo+IA0KPiBTbywgSSBjYW4gY29u
ZmlybSB0aGF0IHRoZXNlIGFyZSBpbmRlZWQgc2VwYXJhdGUgYWRkcmVzcyBzcGFjZXMgLQ0KPiB0
aGlzIGlzIHJpZ2h0Lg0KICBUaGFuayB5b3UgZm9yIGhlbHBpbmcgbWUgcmVzcG9uZCENCg0KPiAN
Cj4gPiA+ICsNCj4gPiA+ICsgIGludGVycnVwdC1jb250cm9sbGVyOiB0cnVlDQo+ID4gPiArDQo+
ID4gPiArICAnI2ludGVycnVwdC1jZWxscyc6DQo+ID4gPiArICAgIGNvbnN0OiAyDQo+ID4gPiAr
DQo+ID4gPiArICBpbnRlcnJ1cHRzOg0KPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIGludGVy
cnVwdCBvdXRwdXRzIHRvIHN5c2lycS4NCj4gPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+ICsN
Cj4gPiA+ICsgIG1lZGlhdGVrLHJzZWwtcmVzaXN0YW5jZS1pbi1zaS11bml0Og0KPiA+ID4gKyAg
ICB0eXBlOiBib29sZWFuDQo+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4gKyAgICAgIFdl
IHByb3ZpZGUgdHdvIG1ldGhvZHMgdG8gc2VsZWN0IHRoZSByZXNpc3RhbmNlIGZvciBJMkMNCj4g
PiA+IHdoZW4gcHVsbCB1cCBvcg0KPiA+ID4gKyAgICAgIHB1bGwgZG93bi4gVGhlIGZpcnN0IGlz
IGJ5IFJTRUwgZGVmaW5pdGlvbiB2YWx1ZSwgYW5vdGhlcg0KPiA+ID4gb25lIGlzIGJ5DQo+ID4g
PiArICAgICAgcmVzaXN0YW5jZSB2YWx1ZShvaG0pLiBUaGlzIGZsYWcgaXMgdXNlZCB0byBpZGVu
dGlmeSBpZg0KPiA+ID4gdGhlIG1ldGhvZCBpcw0KPiA+ID4gKyAgICAgIHJlc2lzdGFuY2Uoc2kg
dW5pdCkgdmFsdWUuDQo+ID4gDQo+ID4gV2hhdCBpcyB0aGUgcG9pbnQgb2YgY2hvb3NpbmcgaXQ/
IFRoaXMgaXMgb25lIGhhcmR3YXJlLCBvbmUgU29DLCBzbw0KPiA+IGhvdw0KPiA+IGRpZmZlcmVu
dCBib2FyZHMgY2FuIGhhdmUgZGlmZmVyZW50IHVuaXRzPyBObywganVzdCB1c2UgT2htcw0KPiA+
IA0KPiANCj4gVGhhdCdzIGxlZ2FjeSBmcm9tIHdoZW4gdGhlIHBhcmlzIGRyaXZlciBkaWRuJ3Qg
c3BlY2lmeSB0aGUgUlNFTCBpbg0KPiBvaG1zLCBhbmQgSQ0KPiBhZ3JlZSBhYm91dCBkZXByZWNh
dGluZyB0aGF0IHByb3BlcnR5IGFuZCBtYWtpbmcgaXQgYSBkZWZhdWx0Lg0KPiANCj4gQ2F0aHks
IHBsZWFzZSBhZGQgYSBgaGFzX2xlZ2FjeV9yc2VsYCBib29sZWFuIGluIHRoZSBwbGF0Zm9ybSBk
YXRhDQo+IGFuZCBhc3NpZ24gdGhhdA0KPiB0byB0cnVlIGluICphbGwqIE1lZGlhVGVrIHBpbmN0
cmwgZHJpdmVycyB0aGF0IGFyZSBub3QgTVQ4MTk2LCB0aGVuDQo+IGluDQo+IHBpbmN0cmwtcGFy
aXM6DQo+IA0KPiBpZiAoaHctPnNvYy0+aGFzX2xlZ2FjeV9yc2VsKQ0KPiAgICAgICAgIGh3LT5y
c2VsX3NpX3VuaXQgPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woLi4uLikNCj4gZWxzZQ0KPiAgICAg
ICAgIGh3LT5yc2VsX3NpX3VuaXQgPSB0cnVlOw0KPiANCj4gVGhhdCB3YXkgd2UgY2FuIGZpbmFs
bHkgZHJvcCB0aGlzIHByb3BlcnR5IGZyb20gZHJpdmVycyBmb3IgbmV3IFNvQ3MsDQo+IGluY2x1
ZGluZw0KPiB0aGUgb25lIGZvciBNVDgxOTYuDQogICdtZWRpYXRlayxyc2VsLXJlc2lzdGFuY2Ut
aW4tc2ktdW5pdCcgd29uJ3QgYmUgdXNlZCBub3csIGFuZCB3aWxsDQpyZW1vdmUgaXQgaW4gbmV4
dCB2ZXJzaW9uLg0KDQo+IA0KPiA+ID4gKw0KPiA+ID4gKyMgUElOIENPTkZJR1VSQVRJT04gTk9E
RVMNCj4gPiA+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gPiA+ICsgICctcGlucyQnOg0KPiA+ID4g
KyAgICB0eXBlOiBvYmplY3QNCj4gPiA+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
DQo+ID4gPiArDQo+ID4gPiArICAgIHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiA+ID4gKyAgICAgICde
cGlucyc6DQo+ID4gPiArICAgICAgICB0eXBlOiBvYmplY3QNCj4gPiA+ICsgICAgICAgICRyZWY6
IC9zY2hlbWFzL3BpbmN0cmwvcGluY2ZnLW5vZGUueWFtbA0KPiA+ID4gKyAgICAgICAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gPiArICAgICAgICBkZXNjcmlwdGlvbjoNCj4gPiA+
ICsgICAgICAgICAgQSBwaW5jdHJsIG5vZGUgc2hvdWxkIGNvbnRhaW4gYXQgbGVhc3Qgb25lIHN1
Ym5vZGUNCj4gPiA+IHJlcHJlc2VudGluZyB0aGUNCj4gPiA+ICsgICAgICAgICAgcGluY3RybCBn
cm91cHMgYXZhaWxhYmxlIG9uIHRoZSBtYWNoaW5lLiBFYWNoIHN1Ym5vZGUNCj4gPiA+IHdpbGwg
bGlzdCB0aGUNCj4gPiA+ICsgICAgICAgICAgcGlucyBpdCBuZWVkcywgYW5kIGhvdyB0aGV5IHNo
b3VsZCBiZSBjb25maWd1cmVkLCB3aXRoDQo+ID4gPiByZWdhcmQgdG8gbXV4ZXINCj4gPiA+ICsg
ICAgICAgICAgY29uZmlndXJhdGlvbiwgcHVsbHVwcywgZHJpdmUgc3RyZW5ndGgsIGlucHV0DQo+
ID4gPiBlbmFibGUvZGlzYWJsZSBhbmQgaW5wdXQNCj4gPiA+ICsgICAgICAgICAgc2NobWl0dC4N
Cj4gPiA+ICsNCj4gPiA+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+ID4gPiArICAgICAgICAgIHBp
bm11eDoNCj4gPiA+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ICsgICAgICAgICAg
ICAgIEludGVnZXIgYXJyYXksIHJlcHJlc2VudHMgZ3BpbyBwaW4gbnVtYmVyIGFuZCBtdXgNCj4g
PiA+IHNldHRpbmcuDQo+ID4gPiArICAgICAgICAgICAgICBTdXBwb3J0ZWQgcGluIG51bWJlciBh
bmQgbXV4IHZhcmllcyBmb3IgZGlmZmVyZW50DQo+ID4gPiBTb0NzLCBhbmQgYXJlDQo+ID4gPiAr
ICAgICAgICAgICAgICBkZWZpbmVkIGFzIG1hY3JvcyBpbiBkdC1iaW5kaW5ncy9waW5jdHJsL210
ODE5Ni0NCj4gPiA+IHBpbmZ1bmMuaA0KPiA+ID4gKyAgICAgICAgICAgICAgZGlyZWN0bHksIGZv
ciB0aGlzIFNvQy4NCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgICAgZHJpdmUtc3RyZW5ndGg6DQo+
ID4gPiArICAgICAgICAgICAgZW51bTogWzIsIDQsIDYsIDgsIDEwLCAxMiwgMTQsIDE2XQ0KPiA+
ID4gKw0KPiA+ID4gKyAgICAgICAgICBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcDoNCj4gPiA+ICsg
ICAgICAgICAgICBlbnVtOiBbMTI1LCAyNTAsIDUwMCwgMTAwMF0NCj4gPiANCj4gPiBXaHkgZHVw
bGljYXRpbmcgcHJvcGVydGllcz8gTm8sIHVzZSBvbmx5IG9uZS4NCj4gPiANCj4gDQo+IFRoZSBw
cm9ibGVtIGhlcmUgaXMgbm90IGVudGlyZWx5IGFib3V0IGR1cGxpY2F0aW5nIHByb3BlcnRpZXMs
IGFuZA0KPiBJJ20gbm90DQo+IHN1cmUgdGhhdCB0aGUgcmVhc29uIGlzIGFjdHVhbGx5IGFjY2Vw
dGFibGUgKGJ1dCBiZWluZyB0aGlzIGEgc3BlY2lhbA0KPiBjYXNlDQo+IHRoZSBgZGVzY3JpcHRp
b25gIGZpZWxkIHdvdWxkIGJlIG1hbmRhdG9yeSB0byBoYXZlIElNTyEhKS4NCj4gDQo+IFNvLCB0
aGUgcmVhc29uIGZvciB0aGlzIHNlcGFyYXRpb24gaXMgdGhhdCB0aGUgZHJpdmUtc3RyZW5ndGgt
DQo+IG1pY3JvYW1wIGRvZXMNCj4gYWN0aXZhdGUgYSBzcGVjaWFsIGZlYXR1cmUgaW4gdGhlIGNv
bnRyb2xsZXIgY2FsbGVkICJhZHZhbmNlZCBkcml2ZQ0KPiBzdHJlbmd0aA0KPiBtb2RlIiwgd2hp
Y2ggaXMgc3dpdGNoaW5nIHRvIGRpZmZlcmVudCBzaHVudHMgdGhhdCB3aWxsIGRlY3JlYXNlIHRo
ZQ0KPiBwb3dlcg0KPiBlZmZpY2llbmN5IG9mIHRoZSBjaGlwIChieSBhbiBpZ25vcmFibGUgYW1v
dW50LCBpZiB0aGF0J3Mgb25lIHBpbiAtDQo+IGJ1dCBpZg0KPiB0aGF0IGdvZXMgdG8gc29tZXRo
aW5nIGxpa2UgMTAwIHBpbnMsIGl0J3Mgbm90IGlnbm9yYWJsZSBhbnltb3JlKS4NCj4gDQo+IEkn
ZCBiZSBoYXBweSBpZiB3ZSBjb3VsZCBsZXQgdGhlbSByZXRhaW4gYm90aCBwcm9wZXJ0aWVzIGFm
dGVyDQo+IHB1dHRpbmcgYQ0KPiBjbGVhciBkZXNjcmlwdGlvbiBvZiB3aGF0J3MgaGFwcGVuaW5n
IGFuZCB3aHkgdGhlcmUgYXJlIHR3byBvZiB0aGVtLg0KICBkcml2ZS1zdHJlbmd0aC1taWNyb2Ft
cCBpcyBmb3IgaTJjIHNwZWNpYWwgY3VycmVudCwgYW5kIGRyaXZlLQ0Kc3RyZW5ndGggaXMgZm9y
IG90aGVyIHBpbnMgY3VycmVudC4NCg0KPiANCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgICAgYmlh
cy1wdWxsLWRvd246DQo+ID4gPiArICAgICAgICAgICAgb25lT2Y6DQo+ID4gPiArICAgICAgICAg
ICAgICAtIHR5cGU6IGJvb2xlYW4NCj4gPiA+ICsgICAgICAgICAgICAgIC0gZW51bTogWzEwMCwg
MTAxLCAxMDIsIDEwM10NCj4gPiA+ICsgICAgICAgICAgICAgICAgZGVzY3JpcHRpb246IG10ODE5
NiBwdWxsIGRvd24gUFVQRC9SMC9SMSB0eXBlDQo+ID4gPiBkZWZpbmUgdmFsdWUuDQo+ID4gPiAr
ICAgICAgICAgICAgICAtIGVudW06IFsyMDAsIDIwMSwgMjAyLCAyMDMsIDIwNCwgMjA1LCAyMDYs
IDIwN10NCj4gPiA+ICsgICAgICAgICAgICAgICAgZGVzY3JpcHRpb246IG10ODE5NiBwdWxsIGRv
d24gUlNFTCB0eXBlIGRlZmluZQ0KPiA+ID4gdmFsdWUuDQo+IA0KPiBUaGVzZSB0d28gbXVzdCBn
byBhd2F5LCBSU0VMIHNoYWxsIGJlIGRlZmluZWQgaW4gT2htcyB1bml0IGluDQo+IERUcy9iaW5k
aW5ncy4NCiAgSXQgd2lsbCBiZSByZW1vdmVkIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gPiA+
ICsgICAgICAgICAgICAgIC0gZW51bTogWzc1MDAwLCA1MDAwXQ0KPiA+ID4gKyAgICAgICAgICAg
ICAgICBkZXNjcmlwdGlvbjogbXQ4MTk2IHB1bGwgZG93biBSU0VMIHR5cGUgc2kgdW5pdA0KPiA+
ID4gdmFsdWUob2htKS4NCj4gPiA+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ID4g
KyAgICAgICAgICAgICAgRm9yIHB1bGwgZG93biB0eXBlIGlzIG5vcm1hbCwgaXQgZG9lc24ndCBu
ZWVkIGFkZA0KPiA+ID4gUlNFTCAmIFIxUjANCj4gPiA+ICsgICAgICAgICAgICAgIGRlZmluZSBh
bmQgcmVzaXN0YW5jZSB2YWx1ZS4NCj4gPiA+ICsgICAgICAgICAgICAgIEZvciBwdWxsIGRvd24g
dHlwZSBpcyBQVVBEL1IwL1IxIHR5cGUsIGl0IGNhbiBhZGQNCj4gPiA+IFIxUjAgZGVmaW5lIHRv
DQo+ID4gPiArICAgICAgICAgICAgICBzZXQgZGlmZmVyZW50IHJlc2lzdGFuY2UuIEl0IGNhbiBz
dXBwb3J0DQo+ID4gPiAiTVRLX1BVUERfU0VUX1IxUjBfMDAiICYNCj4gPiA+ICsgICAgICAgICAg
ICAgICJNVEtfUFVQRF9TRVRfUjFSMF8wMSIgJiAiTVRLX1BVUERfU0VUX1IxUjBfMTAiICYNCj4g
PiA+ICsgICAgICAgICAgICAgICJNVEtfUFVQRF9TRVRfUjFSMF8xMSIgZGVmaW5lIGluIG10ODE5
Ni4NCj4gPiA+ICsgICAgICAgICAgICAgIEZvciBwdWxsIGRvd24gdHlwZSBpcyBSU0VMLCBpdCBj
YW4gYWRkIFJTRUwgZGVmaW5lDQo+ID4gPiAmIHJlc2lzdGFuY2UNCj4gPiA+ICsgICAgICAgICAg
ICAgIHZhbHVlKG9obSkgdG8gc2V0IGRpZmZlcmVudCByZXNpc3RhbmNlIGJ5DQo+ID4gPiBpZGVu
dGlmeWluZyBwcm9wZXJ0eQ0KPiA+ID4gKyAgICAgICAgICAgICAgIm1lZGlhdGVrLHJzZWwtcmVz
aXN0YW5jZS1pbi1zaS11bml0Ii4gSXQgY2FuDQo+ID4gPiBzdXBwb3J0DQo+ID4gPiArICAgICAg
ICAgICAgICAiTVRLX1BVTExfU0VUX1JTRUxfMDAwIiAmICJNVEtfUFVMTF9TRVRfUlNFTF8wMDEi
DQo+ID4gPiAmDQo+ID4gPiArICAgICAgICAgICAgICAiTVRLX1BVTExfU0VUX1JTRUxfMDEwIiAm
ICJNVEtfUFVMTF9TRVRfUlNFTF8wMTEiDQo+ID4gPiAmDQo+ID4gPiArICAgICAgICAgICAgICAi
TVRLX1BVTExfU0VUX1JTRUxfMTAwIiAmICJNVEtfUFVMTF9TRVRfUlNFTF8xMDEiDQo+ID4gPiAm
DQo+ID4gPiArICAgICAgICAgICAgICAiTVRLX1BVTExfU0VUX1JTRUxfMTEwIiAmICJNVEtfUFVM
TF9TRVRfUlNFTF8xMTEiDQo+ID4gPiBkZWZpbmUgaW4NCj4gPiA+ICsgICAgICAgICAgICAgIG10
ODE5Ni4gSXQgY2FuIGFsc28gc3VwcG9ydCByZXNpc3RhbmNlIHZhbHVlKG9obSkNCj4gPiA+ICI3
NTAwMCIgJiAiNTAwMCINCj4gPiA+ICsgICAgICAgICAgICAgIGluIG10ODE5Ni4NCj4gPiA+ICsN
Cj4gPiA+ICsgICAgICAgICAgYmlhcy1wdWxsLXVwOg0KPiA+ID4gKyAgICAgICAgICAgIG9uZU9m
Og0KPiA+ID4gKyAgICAgICAgICAgICAgLSB0eXBlOiBib29sZWFuDQo+ID4gPiArICAgICAgICAg
ICAgICAtIGVudW06IFsxMDAsIDEwMSwgMTAyLCAxMDNdDQo+ID4gPiArICAgICAgICAgICAgICAg
IGRlc2NyaXB0aW9uOiBtdDgxOTYgcHVsbCB1cCBQVVBEL1IwL1IxIHR5cGUNCj4gPiA+IGRlZmlu
ZSB2YWx1ZS4NCj4gPiA+ICsgICAgICAgICAgICAgIC0gZW51bTogWzIwMCwgMjAxLCAyMDIsIDIw
MywgMjA0LCAyMDUsIDIwNiwgMjA3XQ0KPiA+ID4gKyAgICAgICAgICAgICAgICBkZXNjcmlwdGlv
bjogbXQ4MTk2IHB1bGwgdXAgUlNFTCB0eXBlIGRlZmluZQ0KPiA+ID4gdmFsdWUuDQo+ID4gPiAr
ICAgICAgICAgICAgICAtIGVudW06IFsxMDAwLCAxNTAwLCAyMDAwLCAzMDAwLCA0MDAwLCA1MDAw
LA0KPiA+ID4gMTAwMDAsIDc1MDAwXQ0KPiA+ID4gKyAgICAgICAgICAgICAgICBkZXNjcmlwdGlv
bjogbXQ4MTk2IHB1bGwgdXAgUlNFTCB0eXBlIHNpIHVuaXQNCj4gPiA+IHZhbHVlKG9obSkuDQo+
ID4gDQo+ID4gU2FtZSBwcm9ibGVtcy4NCj4gPiANCj4gPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmlu
ZGluZ3MvcGluY3RybC9tdDgxOTYtcGluZnVuYy5oDQo+ID4gPiBAQCAtMCwwICsxLDE1NzIgQEAN
Cj4gPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSAqLw0KPiA+ID4gKy8qDQo+ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDI1IE1lZGlh
dGVrIEluYy4NCj4gPiA+ICsgKiBBdXRob3I6IEd1b2RvbmcgTGl1IDxHdW9kb25nLkxpdUBtZWRp
YXRlay5jb20+DQo+ID4gPiArICovDQo+ID4gPiArDQo+ID4gPiArI2lmbmRlZiBfX01UODE5Nl9Q
SU5GVU5DX0gNCj4gPiA+ICsjZGVmaW5lIF9fTVQ4MTk2X1BJTkZVTkNfSA0KPiA+ID4gKw0KPiA+
ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL210NjV4eC5oPg0KPiA+ID4gKw0KPiA+
ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5DX0dQSU8wIChNVEtfUElOX05PKDApIHwgMCkN
Cj4gPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9fRlVOQ19ETUlDMV9DTEsgKE1US19QSU5fTk8o
MCkgfCAxKQ0KPiA+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5DX1NQSTNfQV9NTyAoTVRL
X1BJTl9OTygwKSB8IDMpDQo+ID4gPiArI2RlZmluZSBQSU5NVVhfR1BJTzBfX0ZVTkNfRk1JMlNf
Ql9MUkNLIChNVEtfUElOX05PKDApIHwgNCkNCj4gPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9f
RlVOQ19TQ1BfRE1JQzFfQ0xLIChNVEtfUElOX05PKDApIHwgNSkNCj4gPiA+ICsjZGVmaW5lIFBJ
Tk1VWF9HUElPMF9fRlVOQ19UUF9HUElPMTRfQU8gKE1US19QSU5fTk8oMCkgfCA2KQ0KPiA+IA0K
PiA+IFlvdSBnb3QgY29tbWVudCwgc28gcmVzcG9uZCB0byBpdC4gU2VuZGluZyB0aGUgc2FtZSBh
bmQgZXhwZWN0aW5nDQo+ID4gZGlmZmVyZW50IHJlc3VsdHMgaXMgZmFzdCB3YXkgdG8gZ2V0IGEg
Z3J1bXB5IHJlc3BvbnNlLg0KPiA+IA0KPiANCj4gLi4uYW5kIEkgYWdyZWUgYWJvdXQgZXZlcnkg
b3RoZXIgY29tbWVudCBmcm9tIEtyenlzenRvZi4NCiAgT2ssIHRoYW5rIHlvdSBmb3IgeW91ciBy
ZXZpZXcuDQoNCj4gDQo+IENoZWVycywNCj4gQW5nZWxvDQo=

