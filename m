Return-Path: <linux-gpio+bounces-25005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A3B3777B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 04:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFF0A1B63E49
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 02:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503CE1DB356;
	Wed, 27 Aug 2025 02:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="N6PWaAGM";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="iC5VrAZI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA17C76025;
	Wed, 27 Aug 2025 02:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756260060; cv=fail; b=M+mY4qweasQe0dze0jlIva8n1eoZB/L7lnG00guxEMJV2NDQLypbyhGLJCl/Jz5VV1II4O6E/6YfE03hNvyC1S1s5vXTHm8CRKsGip7T1516CQdci+9RbzSLWX+j1GlR3a8sMl0LACEotQ7iXWPH8vC3ElSOnraQo1kndcOogvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756260060; c=relaxed/simple;
	bh=K5dAO6ONAzdus+w9fanyLYZ9VeeCm9mtY8YvWDgot/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ifZCT6rFeJnEZ1zS36EouXPKg+CkvlFDpHBE/1FvO+dUGYyeRwmcDRHXztRxhswX0wmzf0IzOMr68P/CHSDKPlyxui/+ltA5zB4PZT1pyqPywUc4mQ6vVnjiKaWsIyFf7i8UCN/IVNBDSSQ9Szqko5+Lq6S8eyc1i4LefDu38dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=N6PWaAGM; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=iC5VrAZI; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a4210f7282e911f0b33aeb1e7f16c2b6-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=K5dAO6ONAzdus+w9fanyLYZ9VeeCm9mtY8YvWDgot/k=;
	b=N6PWaAGMx+Faafm7jwqsFeUSINaIdHxdGiVnPioGXMNEew604EZCMrf/2pK4ymkYjmvvKYipVG9HbhQEc9oLLFeHbEirOuQrjAQfae2JBUCml/uK35lff1xoHv3dFPUTuchryksXAZ/qUM9Lkz8fGkwFIZ0aAxYs771vqeDoKr4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:1ed43731-8fba-4357-95bb-f22f78f13f8a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:6e88a56d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a4210f7282e911f0b33aeb1e7f16c2b6-20250827
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2028349026; Wed, 27 Aug 2025 10:00:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 10:00:42 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 10:00:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIlqHP0uaCeTnMtRmHRU39kXgDnxCGg+dUsEtYiisMzkj8TeV1gyrDlBXyZe2cnUm5BG9vzxG4y8laTauSDaWTlODkz9zRfyNhUpEl73+WkNGqitjVecQt13kf7fItg0oYwLrF3e+Qdhlbnf6v1Bh2V1gGboFTGnoumjmaOn6y9jP5y4bJqqg2XWcZKcEzh0TeZkorVCijVbNMJW9s8uECdTEGD4csYej1bXIMVQahvEkkHGmcIO598tHPPY0QCfNY/mfgZpK8kS4iVkCBF+QnS/5sN1eLEEmNVnC4fe7AAiFcAGjSq0yeCdkiek+xQF5lMFK29Nq9t2WxV/UO7D8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5dAO6ONAzdus+w9fanyLYZ9VeeCm9mtY8YvWDgot/k=;
 b=XgUk9o9LOlgUDO3EOa2Xw1rjSZDGiJqxwhkqKzyGXPRWd0rp8PK9U8/uDiSA4exlQ0aWdV69xdxy7USB4buFrVBnuw/usAfTtATGoPAX1NCLcdyBHIcjgFXDF5htVvvyw9uxS2slP26JMYdutodJy5PFwEQVWG5uU5Qvg117N3PzpSpWMKg9BSA5i6hX49vlkNV3wTK97Lp8pj5rLW865WNraOltTFcKzpmTw3T6i6msPNPSHi25i2ByRMS9rpm/cYDDrTywV7CbN5AQKYYZGd5znjxKr44ntUAZVMHzPkSKHabL6aFw1b3KA1Onoun1Ea+GuGFLQrzfTKS4xXtmCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5dAO6ONAzdus+w9fanyLYZ9VeeCm9mtY8YvWDgot/k=;
 b=iC5VrAZIq8fQ4mray/2l2HpfcOkO/0eanpoO4h/J76fq5SVggo1MjKo5G47D+YRN2+Szjd3zgBvR5u40mUr9tQZFSJ9/7ruT4rmVfny1K0Q3pF1JyOw3z4o2xSW3JcpCTxKMwNWpuQDL2kMOSl88TprSnup7dAjJdx2KRM5tukg=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by OS8PR03MB8827.apcprd03.prod.outlook.com (2603:1096:604:28c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 02:00:33 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%7]) with mapi id 15.20.9052.013; Wed, 27 Aug 2025
 02:00:33 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "sean.wang@kernel.org" <sean.wang@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Thread-Topic: [PATCH v2 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Thread-Index: AQHb8kiG5A62Ih3Za0arg8T2ss1YBLQxRB4AgETEDgA=
Date: Wed, 27 Aug 2025 02:00:33 +0000
Message-ID: <d6f23cba8979ac37f3835c33a46edf03593124fe.camel@mediatek.com>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
	 <20250714-subtle-ambitious-penguin-c4a8c6@krzk-bin>
In-Reply-To: <20250714-subtle-ambitious-penguin-c4a8c6@krzk-bin>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|OS8PR03MB8827:EE_
x-ms-office365-filtering-correlation-id: 10d7d5da-0b22-46d0-cfe8-08dde50d8218
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cW5NRGduVWh2N1I1NDQ5cmhvMVM3YXdQcDNPT1BKRDJOTnFkd2wvTHpQZCtz?=
 =?utf-8?B?cUJ1dm94OWR5WSs1K3JoZ3gwYzBFdndjQnFCZVo4TVJHSFNhZ2s5OGJVeHpW?=
 =?utf-8?B?TVlocC9IaFdOMXFLdVlKN2FZSGJLVWhncGNuWis3R3h3UE9yZXN2Nlk1OEhz?=
 =?utf-8?B?RzM5cHVtTUJVZEZCTDZpb2dHYTh6Z2MrOUxhQ0ZoYXdtdVlJVmJvVnVQYXJj?=
 =?utf-8?B?a3FiWXdOa0ZHKzdmaCtTalZTUjJ4eVVrL3dVdVk2RVRwOFRuRVc1RHAxWWQ4?=
 =?utf-8?B?WmNmVjY3OEljcGdrb2VOVU1IdDY5YUwyWXRqbW1CWS9uRk1xOExCU2d1MjIw?=
 =?utf-8?B?ekdqOGhzZzd3aUhoamJLNFhNVURQQXArTVZ1eEQ1YUUyZ1U1SGxIMG1sSUFP?=
 =?utf-8?B?TDcxb21PeEF4MVVwYzVBWEZZbSt5TzE4OHpZZkQwc3NxeFQydmdGU0FxZzRO?=
 =?utf-8?B?M29xV2w2V0g2Umk2ZGpKYmVqUTFhZG1VeER3cS9jRjI2UGltR1NBcGJ3S21n?=
 =?utf-8?B?cXVVb0pOcjRxdHJBM0ptMXdCdlJrRmZLYXlrWStOQk5QZkxpMXJ2b2txN05D?=
 =?utf-8?B?LzRxRkJLOCtrNyszRlVyZlgzRFcxN1NaTFFyVUJlR2s2RjlpNkFGaGlFMksz?=
 =?utf-8?B?TFkzc1V2RnpiUWlGMTVMMlpRUUc3eWxERGNycy9qZDdwbGtsTVdZSlMxdEFV?=
 =?utf-8?B?aWZRcEN2c2NEUERSTkxRWGJ1WlBaVjg0amprenhDTmxQclJzRzBUSXQ2QVcy?=
 =?utf-8?B?RS9XVGhSV3dKZnhrekhOL1ByYThLLzVpcktqK1ZrelFHSGl0OVZqTGNIV2Jj?=
 =?utf-8?B?cXBzUVlPc0lrNHZkYS9kWjhxVk9uNEFHcyt6bURZNjhGMFBqaVNCYmxkUUk2?=
 =?utf-8?B?Q01QTmtSWHpnVzNZWnlFa3VJV25lU2gyemcwQmpJeVlRTkhLZVk2OFBpUUtK?=
 =?utf-8?B?ZVJyZWN1cjlmSU53NE9KMjBiMU1GRjQvbHM1YnZTVC9zTVN5OHpGQXN2M0lr?=
 =?utf-8?B?R3ZDYjlQOFhjZ2NENHpyN0JnV3F6OUtZS2wzWDNvOG9qK09lcGd0bWFFM0Jl?=
 =?utf-8?B?MmhTdEJydE9JWWcya3I3ZStLRERvdCtCRXNwVEtObUdScHVNajZtTktqOE5h?=
 =?utf-8?B?aHVQYkkwMWZ6b0h0ZERVNDh3QVhGQTd3ZTZ2aWZIMjZwRTZYR3hiWEswVTFD?=
 =?utf-8?B?ckpFU3RkSnV1eHlEZ3JkS21XMHFYck55S0xsZlZJSm5oUk5kb0Z4VyszT3Mv?=
 =?utf-8?B?cE9WU2JFZTJVZy9YcCt1cEwxN1d5eFo5ZDkvUjROZ3lpR29ZSWk4YlI1NWhn?=
 =?utf-8?B?UFRNUmM5WHJXMU1XMm5UY1dFRnRyRVFiL0k1ajZwcjEybTg1cGw0K3czUUx1?=
 =?utf-8?B?MmN2SkVMVmd5ZlpjMGFERnQ1Zjk3SDNIbXllMCtPdUFJcEEvbyt0TFJtYUcy?=
 =?utf-8?B?blVjeVVybFpBK0poNXhYNVA0N1hubnQva1R2OHREc1ZrV2hWZmR2dkJTbEVJ?=
 =?utf-8?B?UnhaeWRtUzNUOXlsWGtJSUxjKzMyOHYrN2dzV1hoK2dXMHVFTUZIaE84ajF1?=
 =?utf-8?B?VVd3TTdadjVzeWRsT2I0a0lIb1p5S1pRTGNndXUzZWdzS1cxM0gyMFY3SGwx?=
 =?utf-8?B?Q0lpUXVTVzExRGh2bG5TV3VuWWQwUENYSHkyS0ZPS1VZTUpCemszZ3RtZTcx?=
 =?utf-8?B?a0ZabTllYmRoNkYwYTBPYy9iVHVVRUxBY0l2Z3A3bWJwYU1ZVUQvckt5NjhW?=
 =?utf-8?B?VW5sSW1tZmhKZkhPYVlJbEpCWEFGUndGNnRqYUxqMGRmNDdyb0UrQWNYaGZZ?=
 =?utf-8?B?Y1dZRU1kd1loNzErblZYa3BvMFlaVCtkdjZKNW5kRllNK2svekh1MXB6OFNl?=
 =?utf-8?B?Vlhoall0QnNSMUVqL0xrdzZOeElFSlpvR1VLdytqUWExamhOSTZadWJaVmxj?=
 =?utf-8?B?d1YyTXNoODVPamFBZ2ZHT1pvZHAwdlMwY3p1RGV0SHJuQlBPWnNlNGduYis0?=
 =?utf-8?B?cGloN2taMlRnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blJXL21nWlptcEE5a004RmhLYzlwcjU2VWR6dXFOVjJRQ292NitWMFBSek1G?=
 =?utf-8?B?OXU0eHcwUmxLTXUyazM2U0ZoSTUvdXNab1JvMmJNNlpWSVVFRTh0alRvUmth?=
 =?utf-8?B?QmlLaVNBUlBGOUZENmdFS05UQTNUUVBCdWt6WjE5WTVwMThjdThIQ1BiME00?=
 =?utf-8?B?Vml3K04rZVJ3dHdldEpVcnVMSUNjcXB2d0hXOWR5Q0tnQS94Q3ZMVk95bC9j?=
 =?utf-8?B?OU1tdkltZk5VVnZza0lBMFVlKzZTeHk5b204bzBpQ1RDR2U0cjcxbHIwcUhH?=
 =?utf-8?B?RlQ4azVMTlVpRGU5cDdGcHBIQjVZYVo4VXl6MUF4VGZGaVF3ZWlVS0N4T2FD?=
 =?utf-8?B?Qnk1ZEZHdjVSekh0dDhRWXJoUWh6b2M4Q3NzNXNyZE82VjNJYzFnMzFRTUEx?=
 =?utf-8?B?RUhNTnVHTjFPVUxucVdmOVNxaFRuUVJ5djVnaENVV0o1NnZ6bXZkRlVyNy9p?=
 =?utf-8?B?eDNGYjdzMlppZHhoRVZsdnl5QURxam5EWG9WK1dwK1kzdmhnWHI4NjluREFL?=
 =?utf-8?B?emtiQ2VpQWZFQ2hVWjJnMFF0ZE5lSlgxWU96TXVzelJDQ015R3IxYW9IWGZB?=
 =?utf-8?B?bnBWREZQeDdkUXRsMHRWY085T2hzckIvN09EVVJaQVNlS2JRSmFUbXZmM3VC?=
 =?utf-8?B?SC81NHROMlF5N1lVOGR0WkpxcDVTWVFZV0NoOFhRdmZWMkFwZGlUUTN4VjZ6?=
 =?utf-8?B?V2RGM2dyRTZ1eTF5TzI5MzNkd2RtRUs3dFl0NGNVVHZ1b0J2bkRsVEtEenFG?=
 =?utf-8?B?TlF3NGQvUU10QUo0REtGMmVNWmlmWDY3RklBRnFUT3Q0TU5XcjBHeGc5QmxI?=
 =?utf-8?B?M2NXbUF6WUdMZE1YN0FiRnB3cEhrZTVVMEFUSnVpcXNMZ0FLMm1JbVJBdHg3?=
 =?utf-8?B?R0x4T3llTHc4Q3FjZ2VDQ2NMWVdJQlZkdmk2R3ZsU1RjZHJxcC9XY05tck5l?=
 =?utf-8?B?M0l0N29KN0lJKyt0NVJycEpsUzkvamhmSGNNU0paMk9BRWd5UHF1MVVKNHlL?=
 =?utf-8?B?TE5WbzhIOW1pOGpBSUlDVHJkUmpLcTBmdGNJUzlVQ2cyZEN1dHRCNldlQnlC?=
 =?utf-8?B?N0JYejdxNjNJVW8wY3lEWmtMdlN0M3JVSlloSkRPbDBoc2JYN0NXRmJVZ0tY?=
 =?utf-8?B?dVJLRkduSXJmRFpKOVhpL0txREdrVk05cXhFYmFibFhZdW5GLzZLYVhpbnlz?=
 =?utf-8?B?ekpKOFdMeFFEVzZPb3NnaVk0bjZsYVVRa3VoU3Q1Nkh2eVVKL000ckVtMG9I?=
 =?utf-8?B?T3Z2aDJCdHpBeENMREJybVJseXdndzBpbG45TW5UQkp4Q2t2SHpRcGg0MjZ1?=
 =?utf-8?B?WEhGcUsvSWQwdmtjUGZjdlRzNE91dFp1clhUTk5naDA1ZHZhU0YwU2FMclg4?=
 =?utf-8?B?M2pVZm9hYzdoTk9jQk00SnpLYTJVM1FzY0Z6akRtcElaZWVaUXBqVi9zT1ha?=
 =?utf-8?B?bitUazBLdU9sMEVPYzNya2FtMGVWUEpUb1NYYmVYeVZOK0NWQmxNSXhNVW5u?=
 =?utf-8?B?QU1tMUx3RklvMlZ2cnVYVXNRNGhhTHdDWXl1U3ZqMUxYR2VPZUFZWXhOUEk1?=
 =?utf-8?B?L2F1aUJ3dG1tN1hnSFY2QXRuVllIdENFdGswVHNiaFMwNmZZbnhodEtBVE9S?=
 =?utf-8?B?M294T0IvQ0tPZUZ2MWJmU2FTYitTcHJlV3oyNThnbkVUWTFHd0trOWVEbU13?=
 =?utf-8?B?dEIvd1RhbnMyZ096ZjF3MHpkeTNLV1Y0bDBpMll5Qi9QbnpnQUxLbDFCMk5E?=
 =?utf-8?B?WGpmMHhNN2ZwR3kvL0ZaYmtiZVRkbzhiQ0JIZTJCbENaQ3c5Z2lHaWIrdlFl?=
 =?utf-8?B?V2V5RXE2WXlTb25YY2JWclNxdDBGSTA3MktDM3ZhSlZBckx3NHFsS1NXK0dr?=
 =?utf-8?B?NHB4R1VEd2RJcmQ1Zlk2N2xqWGV3Y2UyeGdMMVp0Y2Z4MkdheXl1anhtbTRO?=
 =?utf-8?B?cHowNjZ3ZEFnVFdiUXFBdDJqeFlxNmpTY2JSV1ZYR3BwbmN1cEt5KzVhb3la?=
 =?utf-8?B?cERXWjd5S0ZzSksrQkRrU1E3ZlJsNm9pVFppVGlMNjl5ekx6SDlkRDBnM294?=
 =?utf-8?B?K0xJVm93RnBzY3NNMTJVdkEzNURqeGg1eVhBYmMzUkc4RUwvcGpLOFhIRnl5?=
 =?utf-8?B?Tlcrc0lMTEM0VG41MDgxcTFWMlZZYXRDT2NCT2pHMDh0dFB0Y2NuQVgvZWxD?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F848EEC2A54A4D4987F5D594AF315851@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d7d5da-0b22-46d0-cfe8-08dde50d8218
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 02:00:33.5821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fsDWulrnoslMuKLCkj0TwhyZElO1MCOevpSGiJHLV55lUUhQJPnSLF8ii6nMBuWadab/B6oEbkMj9fziP6rl+yYyy4y5jp4fBU6fj+YgVzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR03MB8827

T24gTW9uLCAyMDI1LTA3LTE0IGF0IDA5OjUzICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgSnVsIDExLCAyMDI1IGF0IDA1OjQ0OjU2UE0g
KzA4MDAsIENhdGh5IFh1IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMg
c3VwcG9ydCBmb3IgdGhlIE1UODE4OSBwaW5jdHJsIGRyaXZlciwNCj4gPiBpbmNsdWRlIHRoZSBk
cml2ZXIgaW1wbGVtZW50YXRpb24sIG5ldyBiaW5kaW5nIGRvY3VtZW50IGFuZCBwaW5jdHJsDQo+
ID4gaGVhZGVyIGZpbGUuDQo+ID4gDQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAtIE1vZGlmeSB0
aGUgY29kaW5nIHN0eWxlIG9mIGR0LWJpbmRpbmcuDQo+IA0KPiBUaGlzIGlzIHRvbyB2YWd1ZS4g
QW55dGhpbmcgY2FuIGJlICJtb2RpZnkiIGFuZCBhbnl0aGluZyBjYW4gYmUNCj4gImNvZGluZw0K
PiBzdHlsZSIuDQo+IA0KPiBXaGF0IGV4YWN0bHkgaGFwcGVuZWQgaGVyZT8gVGhlcmUgaXMgYWxz
byBubyB2MSBsaW5rIHRvIGFjdHVhbGx5DQo+IGNoZWNrDQo+IHByZXZpb3VzIGRpc2N1c3Npb25z
Lg0KDQogIFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuIFRoZSBuZXh0IHZlcnNpb24gd2lsbCBi
ZSBpbXByb3ZlZC4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo=

