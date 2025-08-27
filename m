Return-Path: <linux-gpio+bounces-25006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54BB3777D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 04:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 826BE3BB978
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 02:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804E31DE4C2;
	Wed, 27 Aug 2025 02:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KkNyozVq";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WUPQf04Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09E130CD91;
	Wed, 27 Aug 2025 02:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756260198; cv=fail; b=P/HnmtaVFkYmtzl3OHW/qDIvepDKBtxB9atqje1wn+sHsMzsSp0+eHGhfvK+jWkOMy00DUABli80Nihkb/B9BLzUuVewCbi5OY25UwX8p+SDfl3l+Y/cndgDtOTUDorQz6NfIMq6PS+M9Jzb4iQB12l0wtpS9z6cFfzdRxmQIu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756260198; c=relaxed/simple;
	bh=lFfh4Ue+nOLvPgQiMmlNYhuNnrShms2577Snw5Lnb/U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=majhFuX7KgD1hdNf+gBCB6Xyo1apO+2pQ08/i4wAldkltWLOGPPfcmJaUnA/qQDpiZtuVCptEGQ3hIdApHHQqU92qVmwck5eKumG85BdaXbkP6U4vVU3rJx3WWb+T0qGXQDSiLaAUIeVzH+LobZN4RvUP1O8hQwVJERcmEyhfVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=KkNyozVq; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=WUPQf04Y; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f9ee426c82e911f0b33aeb1e7f16c2b6-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=lFfh4Ue+nOLvPgQiMmlNYhuNnrShms2577Snw5Lnb/U=;
	b=KkNyozVqY5/aLbjSvE+KuMrrQi5UnP+r5U9TD4tBd9qFvBQWHhwAMjM2lYbJ9Uc1iLa4PlrYDpkhDkA3Wb1ag66EKOhahG2xgN3IGVgeOZ2KVWPiNMQpBzqk25gjTbmyjOUFtooyModKRYurAmgoWm4eZ3Yof1loVYJRhpaNE8I=;
X-CID-CACHE: Type:Local,Time:202508271000+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:8bb74844-aa78-4e47-ba38-57b73a5dc1ac,IP:0,UR
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
X-UUID: f9ee426c82e911f0b33aeb1e7f16c2b6-20250827
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2115192586; Wed, 27 Aug 2025 10:03:08 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 10:03:07 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 10:03:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNSyD8RUijfAYJFwxipS+xyOlsGpjUf77lQL6wGKWnqMfKh4+m1xedzhxv1TgRVZZ8iJbgnuxq4gwpKoxU4gFCeoEo9ELgkTtP/U5MNKuIwVfkrWcC2812zubFiiCnp+GrvTJJpGkANKgSGMpsORNSo7MlhGqk8UCeqESRirewcb/XIiq0ycvDbPvppDDfrbTX55mCiw6E44XOW+TSmI6KacATyDzRdSIkdaWWlEPYFECBc6ARddNYwTEt1Vbi6fCZnfkXPj3SI1jdT9w8YtwX/uO8Cy/DuhceKGsW4iZNDOJ2J6OkXyyAAiRVBBMloPrJ9wfDELzRc5+b2kouFnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFfh4Ue+nOLvPgQiMmlNYhuNnrShms2577Snw5Lnb/U=;
 b=fw5LMg81BqoyF9GT9zU+Z/HoSORj4CyQHSAShPVhQ5LYF4B7GcIz7B/9jGs6GTqUxtEHASIfmwTihxUME+W2FbFtBRpgfV0MUxoKVurh0mDvDyh0CUpNC6ax1JiV3FaH4bSVAGIyP/hTklmdLVFCfQvDuj0qgnUsOJfYxOGxd9jtgQSq9wzg3mMHdzDDrJe8FPyzYx2Di3DI4fDTsRQagww9vRPAJ5ydV8RQnI4BStbowNTZUIZ8R0x1qkeNPrchlT0q0OPgZ4cnorF/mTHGEwNrkfrvNSQTDBCv9pt7YXyB8sxcxlfmpzDPS6cwyKYJK/nZSp1xORdIYrp6bH1Tfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFfh4Ue+nOLvPgQiMmlNYhuNnrShms2577Snw5Lnb/U=;
 b=WUPQf04Y7SyVW05oRbtJjLQ5P6YmF/tAAr5YJSSZ4JfBG3A7KFqPzzl8eKJlKtLgiPGkopxDrRl71WKXV6822Ll5MbfkRM+Sq819dGtm0o7P5gN5a8cfuBOg+yUHbZ/BaP2LcIqhOByU5mY5TIwEynIj+yjVBuG3MriU9Y4JnVs=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by OS8PR03MB8827.apcprd03.prod.outlook.com (2603:1096:604:28c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 02:03:00 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%7]) with mapi id 15.20.9052.013; Wed, 27 Aug 2025
 02:03:00 +0000
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
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Thread-Topic: [PATCH v2 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Thread-Index: AQHb8kiG5A62Ih3Za0arg8T2ss1YBLQ/p5+AgDZhPIA=
Date: Wed, 27 Aug 2025 02:03:00 +0000
Message-ID: <c8e0f0cd3bb2d04e57eb74850b95ccb8bc2c00d1.camel@mediatek.com>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
	 <CACRpkdbe-0fQY7rF7u14bn4j_f3Qn7+thRzJQZRZBTadG9pjGQ@mail.gmail.com>
In-Reply-To: <CACRpkdbe-0fQY7rF7u14bn4j_f3Qn7+thRzJQZRZBTadG9pjGQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|OS8PR03MB8827:EE_
x-ms-office365-filtering-correlation-id: ace2a86a-f098-4dfa-46f8-08dde50dd974
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eHl5MjViNzM5VEUrTmtxS29zL2lLTkNZWC9PZnprdStOU2Y0RGJCVXlBemJB?=
 =?utf-8?B?bVVkNlltQVFwemN1Kzl5TE5lZ1hTTi9uRGVPZ1l0UkNZVWplS3djNjlBb3hq?=
 =?utf-8?B?T1gzWWZjcWNWbjR3ZXRVS3JWTGhRSGp0NlFrMjY2U3J1VVdXOUN3ekNHZmZx?=
 =?utf-8?B?dmhoblV1QkpFWi8wbHVDN2dBRmE4TGQ3eDVDNXoxbXFSdEI2M2IycUdlWm02?=
 =?utf-8?B?c0Zxc21DVE1pNlZya2xNdCtXK25xcVNkcC9UVWpqa2pkSlBiVnFUY0oyNWxI?=
 =?utf-8?B?OEhoVFFYSXgzUUdNY0orYXgvc3dyZ09ISHZiazBIcWlkNXpDUlpuUGNrSlg1?=
 =?utf-8?B?VkpVaEtvdmp1cVU4dEkzWlk4OExFRDZzNzlhMnhaK1lhQWh1YTNvcVpOYzJx?=
 =?utf-8?B?aEcxci90MTIvc3JhdlFRVWx5Y3NiWTVFaW5PTVlVQ0kxNUNjRVNOSVlQbTJ2?=
 =?utf-8?B?RUdrQVZNVHVWNXdxRXRaWHVYM2hGbitYOWpnT0NqQ0ZzR1RtcjBkd1VaLzFn?=
 =?utf-8?B?MVpFbHlJTmhPMVZYeVB5SkJ0YkJubzc2aGZoVHRtV2NTOGk2bU9MOVpTNGpz?=
 =?utf-8?B?MTRlbFJLQnVjS2xCaTFYYVVkZ0R1S0tWQVlMRFRoZzNJTEZNZDVRMEJ1aDhX?=
 =?utf-8?B?VFFVT1JLWWZsTVU5QkVpdjZtaVFPTFhYVnlheTNDUUZUZVVONkNuWXlRQVk0?=
 =?utf-8?B?eEFaZjNSOXhpaXFWUmpFdWhJdys5bDFpYWdNR2t4dTZwN2U3bjdpVlhLdW1W?=
 =?utf-8?B?cnVPZGt6T2Z6SmQ1ZFkxbEpZcTFxaTIvbncxc3djQnphT2dPbU13cVVseUZm?=
 =?utf-8?B?YndzQ1pwS1M3OUtxL2lDNHBERWJRVy96TjcxMFg5c2RaQUlMYTZqclZuQWxs?=
 =?utf-8?B?c0tEcFlpMkRLd3U3WjFoQVoySzFhcXJYNGVlYTIzWlA5Yk83QjNURjlFUkoz?=
 =?utf-8?B?VkRsM1F3eFZhdkh6MlRKYkt5ZTMxbHFrckFHM2dHL2NJSy81eGZvejRVaVpr?=
 =?utf-8?B?RkhsT1V3YU9jUkxTckxDekc4VythbEdtOTNUUU5GaUQ3V3RkZHhHMFgwdDhY?=
 =?utf-8?B?K3JhVmY5dWx6eEFhY2dxQTlQTFdXNy94YUlpNXcya0tLYW81ZHNjY0VqMUQy?=
 =?utf-8?B?MGtmemQyMEkyNUFEbFlxSjVZMjVyM1RFWGEyUGFiNk9ETFhhQjBUWEZyblR5?=
 =?utf-8?B?ZGZ2UGs4Nkw0ZElKa2poZlhDQUVpeDdNamtzNkg5OVhiSEtKck92b0JrQmhC?=
 =?utf-8?B?SjNQQnYvYTJYenpHOWhpc2ZjVGVhWndKcE5wTzlBRkNDOFdXU3VlbUdodFVu?=
 =?utf-8?B?WGN6UVFrQzFTQ0FMQ1IrMUErZks4dXZONkVTVDVTdEpVL3NITDBpS1RXZkx3?=
 =?utf-8?B?RmNhVWdTWndSbHlQYjBIOGIyQmpuREtCWlVsNzExYWI4RXZtcHJnZWw3WnNR?=
 =?utf-8?B?YzFsMllQSi9Ka3loV1ZEZ25vcE5WcmhWTVhDeG05ditjVlZTb2hoMU5kdXJq?=
 =?utf-8?B?WTNySXMyVk9LTkVRVWN4Z2NUNkxTTTVpNlJvVjQwMzVCRTRJODRlbWZXQVlo?=
 =?utf-8?B?NTFmd0RObmxBYldUc3V6dCt4TE5IL1F1aGRzYWIwQkQycUtpYU9kR3FqU2ox?=
 =?utf-8?B?aUFaUnRUNDdXT0huTW5WaitaUGZwc0U0WkV6cXNsTENXcXdIMnNhNWc5akQy?=
 =?utf-8?B?Q2FtUUNBTjE2emkxNUU2T2NCdlQ3R3d1MEFRSUlSOElYYzg0UjI1aUdPZkRE?=
 =?utf-8?B?WklENkJieHdKcnNRWEUrZEU4azloS1QrSlFzbUN3TzZoUVNSSlF4VVpPcmto?=
 =?utf-8?B?bHo1WDhvWkJwMjdCallYM2pxc1dLb05OQUZrUDVHd2xlZUM2eHFOdzMyQnlG?=
 =?utf-8?B?TWQ5a0ZsUWNTcU5QUkg1YmlLbDJXbUZIcTQxQ1I3V1gyS240UHFIMXpTZHJa?=
 =?utf-8?B?ODV0V3JkNGVOZWhSZnJncUk2dVpxYnd1bjdua3VSMHY1RTAwTEw1L0V6aUR4?=
 =?utf-8?B?VWt1Z3hSWlhBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHE0TEYvRHlON0Q2c25uNzhDcVdJWEVlYjJwQzhEY3BSRkp5NFB6Q3ZGU0FI?=
 =?utf-8?B?bW1Fd0N5MUtWaG5zNklRbmUxMmsvcFBrM2RBYjgxRGYyS1hMVU5vRE1nOHJz?=
 =?utf-8?B?TW1nbk9DMWpKb21QQUJpTDhxcHgrQ2pudjZ1R01naSs1KzFvVnd5V2FPbVlu?=
 =?utf-8?B?QWZONnR0dEZnZGhWWStyYjJpeDFjZ1JuZDdDdHZVUmdDVHVBK0JYZkVQZlBU?=
 =?utf-8?B?VE93UENrcm9YcVJNSVNEbXFmeXQ4SDRHZlZYZmlWZHhTUHlLUEl5K1ljVDdp?=
 =?utf-8?B?UHJqTytVeSszelpDL3MxaVhSMk5sMEtMb1BJZFd3VHE5NDNXZnpYK1FMR2oz?=
 =?utf-8?B?NFM3S0ttM3lkM08zbWxLYzFPbFVuRWNmNzRVbzh3d3pRSEE2SWJ1SjBNRmRq?=
 =?utf-8?B?WHdOYTBXTkdoam1Gc1JRTlREKzJxRjB0VmxOMHBRKzI2TzF4bGIvNTNyUlpB?=
 =?utf-8?B?eWtaVTU2cnVlU1VkOWlwZ3NqR3BkTHhlQXJuUVZUVzJKQ3ViUFk5ZWE3SVcw?=
 =?utf-8?B?Wkp3TXBmRmJyNmJtKzV1b1ZScGw0WkVEK0lDMndTaHJuNVJ2dlNpWkZBSE9y?=
 =?utf-8?B?OW1EWmpRdWNTYlk3enRmbkZtZXZZbnp2NnZqMUt4dnU2cW5LQjBKdjRKRXF3?=
 =?utf-8?B?SERuR0VhbnBGa0ZlNCtqRmhxbUxWRlBYdG8zcVBoSS9peStkcmZOREJ6RGpl?=
 =?utf-8?B?KzNuUVUySmJPRmpocHRKVGx5ZGdTTmxZN0c1dUpvUG83RVViSEZYVTJXblFQ?=
 =?utf-8?B?QzhVZUlkdEdSQmNjL1BrZ1A2dzUvQ3dScWNMNG5sdDVNT2k0S3NsRnRMcU15?=
 =?utf-8?B?eFlFN1ZPQWFjdHIxUHBIREJndmlpVjBtMVNmVUg0VmQzbHZzV3NsQjR5YXlG?=
 =?utf-8?B?c0dFdnN1ZVZ4ODVlVXBFdkYwS01CY2lFWHdQSXc3MG9RYytnUHZCZkV4Nmlx?=
 =?utf-8?B?dCtFcEtET3FjT0xCTXhIRUVaNHJDZlFzRE12a3FIRURaMDhjUFAvTzY1ZFov?=
 =?utf-8?B?a3VIU1c5UXQwOThhQmhGenhrT2tZSmRRYkJ0bHVpazBuakVTM2tDZjY4d0Fj?=
 =?utf-8?B?NEx2UE5ndytidktxcE9RbTJoUVV4cFpjVkQ3SHZ1ekt4TG1UTEdVWG1JYlBy?=
 =?utf-8?B?VXJiUEdyMnoydDdrUVZXOGVLSjZvYWM4eEoydHloT0VJUVJQcDY3U3BnQmZK?=
 =?utf-8?B?SGtHUzNLamJXejU0NnROakt4eXh1aHBhM2ZlZ0xRcVNLQUc5V2YzS21EaHFt?=
 =?utf-8?B?azc0ak1Ubktkb0dXSWFFWnVaS2JUakVNS3FUelpUck5wV2JGOGNCS216dHRr?=
 =?utf-8?B?Z3pkTU9vRU45NEhkZ0ZDNkt6T1J3cXRPL3pMUm95VHJpQ2xuMHhLbUxGV1Bw?=
 =?utf-8?B?bk9jWjNRWnVBWU4rVFgwUVFuL2hkSnZnSEl2R3RUTlB1L3ZGWUxnNk9ycysx?=
 =?utf-8?B?NTVLL3luMkFwdFN4a0pVQmpMZ2o0N0ZiWFpzVHM5UGI3MHRtdUwxakhUS004?=
 =?utf-8?B?SmhnZWZkL0I0Y1FDYmpNZjVrczdtaGtINjNqbUtidWpCUUt4bkpla0E0VzRI?=
 =?utf-8?B?N21rYXFqeit3WkZQSkN3dGw4Z1R6ZGV5azJyVnF1dmg5ZXZ4R3k2b1ErVVRI?=
 =?utf-8?B?L0tyRDJscmpvU0gxck4zRjQzQ2p5bXQzcHpsTDBZUnAyQXg0NWZNblE4ZER2?=
 =?utf-8?B?WE9LVldvTWRlMlA5UWdoQjVSek9hbDR2dnhRMVdpc2JvNlMrejJBYVdUS0pl?=
 =?utf-8?B?eXNlSEhTbEExUVpMWEExa0JNQ3dva1BWK2pocGRCaEYweC9XVERhOFRBR3JM?=
 =?utf-8?B?Sk9FSFJ6MDhVY0N3cWJsRU01T3ZGK1h2V1Zob1ZtSlpmMVlFdHNXQ3dyd2VH?=
 =?utf-8?B?RVFjMTVVSEhINWxZNE9yUGY1dUFmZysxYndmUFgxUWN3T0pzYnlkQnJvZEhq?=
 =?utf-8?B?M0ZnNjliUkVZZXFRSHBJM2k1N1RoUzBLMG5ybVNwYTE0b1Z3d0VVcGJ2eC9G?=
 =?utf-8?B?cmdwd3ZBWlh2cFRuRGk3am9oSHVlUVluK3RWS3RFdlgvdXRaR2lkMG5PRmhX?=
 =?utf-8?B?TEp3SjNibjJMcG9OZjdSdEVQbWxOZkw1eUQyc2cwcm81cnZBVXJOYmNjblZF?=
 =?utf-8?B?c0VTek5WT1B3ZUcva3lHemxGQzdZeDYwdzdzMEVXU3VXYVRaU2tMRXRvMXBr?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A239B06127A28F40A38B9CD9CD569500@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace2a86a-f098-4dfa-46f8-08dde50dd974
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 02:03:00.2007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lrcQGZ6E35i7qbsF9xqTQlFg4/zlmJsncmA6CaSlrrqQSDXoguEoP6C7vT+eO3OKMcQNKdp7YMnVavh0ze+sGHR/N894nu0pP8wdA2jqrGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR03MB8827

T24gV2VkLCAyMDI1LTA3LTIzIGF0IDEzOjM2ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgSnVsIDExLCAyMDI1IGF0IDExOjQ14oCvQU0gQ2F0aHkg
WHUgPG90X2NhdGh5Lnh1QG1lZGlhdGVrLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+IFRoaXMgcGF0
Y2ggc2VyaWVzIGludHJvZHVjZXMgc3VwcG9ydCBmb3IgdGhlIE1UODE4OSBwaW5jdHJsIGRyaXZl
ciwNCj4gPiBpbmNsdWRlIHRoZSBkcml2ZXIgaW1wbGVtZW50YXRpb24sIG5ldyBiaW5kaW5nIGRv
Y3VtZW50IGFuZCBwaW5jdHJsDQo+ID4gaGVhZGVyIGZpbGUuDQo+ID4gQ2F0aHkgWHUgKDMpOg0K
PiA+ICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IG1lZGlhdGVrOiBBZGQgc3VwcG9ydCBmb3IgbXQ4
MTg5DQo+IA0KPiAoLi4uKQ0KPiA+ICAgcGluY3RybDogbWVkaWF0ZWs6IEFkZCBwaW5jdHJsIGRy
aXZlciBvbiBtdDgxODkNCj4gDQo+IEFwcGxpZWQgdGhlc2UgcGF0Y2hlcywgdGhhbmtzIGZvciBh
bGwgeW91ciBoYXJkIHdvcmsgYW5kDQo+IHBhdGllbmNlIQ0KPiANCj4gPiAgIGFybTY0OiBkdHM6
IG1lZGlhdGVrOiBtdDgxODk6IEFkZCBwaW5tdXggbWFjcm8gaGVhZGVyIGZpbGUNCj4gDQo+IFBs
ZWFzZSBmdW5uZWwgdGhpcyB0aHJvdWdoIHRoZSBtZWRpYXRlayBTb0MgdHJlZS4NCg0KICBPSywg
SSB3aWxsIGZ1bm5lbCB0aGlzIHRocm91Z2ggdGhlIG1lZGlhdGVrIFNvQyB0cmVlLiBUaGFua3Mu
DQoNCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQo=

