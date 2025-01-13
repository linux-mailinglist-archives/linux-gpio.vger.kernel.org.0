Return-Path: <linux-gpio+bounces-14701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A32FFA0B3F0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 11:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94E081639EF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 10:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E66A1FDA9D;
	Mon, 13 Jan 2025 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hfxUC2mf";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="cMIz1wlL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B7B1FDA78;
	Mon, 13 Jan 2025 10:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762606; cv=fail; b=S1fb08gJ5jpUPoUhN+gFh7vvgwgnGGh9LHB385SaFdhZi5ivsBLQ9WZV6rih702SO/lynDDgn+UPciDWIfO8R2CrIvohlsprIVDmdf9XxsSKjMBzQpVnfJlyThOcYAJj3Ws1tayp+fUSNQ1P7JOHLqJ+awmYNZ8yxAFEDeqnZLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762606; c=relaxed/simple;
	bh=xoCZUIYYbW8K0AMlW9teXWC5tcMQ+WdigoAEAdUeYjU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JdEDnBF9JJ29SCfdfLQSodg2PX5K5Ug9sSdEzGYv3QI5P2h108y4UT8zscNCXuOzWxjmpnj62Jx2dUhRa7v2IWKe+I4dQQP+WqkqMsPHAo0RKbw3mFmkqDZYQTAOYlm70hNzOthBEsipaDl4p02Hu0YE4dTDews6cP3vXPjGIt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hfxUC2mf; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=cMIz1wlL; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9bcec914d19511ef99858b75a2457dd9-20250113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=xoCZUIYYbW8K0AMlW9teXWC5tcMQ+WdigoAEAdUeYjU=;
	b=hfxUC2mfh3xnXgjtwc63GtWezWD1gzIEMOHAMP1SvBD9cJ8psNU/xUwR24YgkvweH9sghP+KUCzRLtlpTB2nJP+mcAmJvu3FUhKnJGB3/k2YF8oK0eMV7yn+cdg9ClhkFLBSuI3BgBTgRjdHzJAtsXvYJxGOrmhBKUIecTwUMKE=;
X-CID-CACHE: Type:Local,Time:202501131735+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:28dd27b3-7844-4eed-857f-2c20f2b2c536,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:2b006b13-8831-4185-8e40-f83b1917e828,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9bcec914d19511ef99858b75a2457dd9-20250113
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 201954596; Mon, 13 Jan 2025 18:03:16 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 Jan 2025 18:03:15 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 13 Jan 2025 18:03:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqTypCd+6CuXSD7qvMNhDnAgIw8/MR1IN8FAaGVfDDBNAgeWOidY4KdSZfcrn0xQxaSApdh5fgnQJFeCnd/wYsalCg/JXktIYeLzLGVRIWfTcCXt/BYQSjNbFPHt32RwCS/A85vOhbsWz+QWiQQ/PYcVvQyHfAU1WijyzVYLmZibujzZtb/JoYw2M2z5daGoNv4980/xg8WeUN3E+KsiHOW8iU9KXQs3TU2baBJlXsTq9FvZEcC9UuJNTOVlPpOri0FIKSn/5PimFOt6Hmt5QAChBAJxCxIMAA07MKmqhR6B5YqHWiMCBKnSQG8Ek1YR6jLXNLTF5dd7QiR641Mr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoCZUIYYbW8K0AMlW9teXWC5tcMQ+WdigoAEAdUeYjU=;
 b=NnugO/f1mhsOQa/y8XMoJnlx92fRF7D9eBvSZQhWt1B6rIAx3Kuca+B2uRH/FXFJAjpaUY8Q6GTgNPhANH6p9gluvtDDz4184RNFb4iqGPNciNjVW0f6PcyH8/d0lq0XgW4QoQg+8G8lMVELU8jnPOF6QYhi5gmDMZvphEU8ae8yvUa0Qx5zIpTK6YeEibrEExpktV80SCdUHHe5DH6GxVgP5oNj0CtGh/6rhJTgcLp4NBs613GN2QQBwBidG8/lfLej7F8qpbbginBhm/CxxiB5HlJyv0O+hSnNuWv/OPMe/As5F385p1kyu9zgXp9A0args9sTd9Oa0CmmEJP1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoCZUIYYbW8K0AMlW9teXWC5tcMQ+WdigoAEAdUeYjU=;
 b=cMIz1wlLpB2gW4d/CbJ64db5Zm69AHzJ//7c4uMntrdjKndjkPJ+14z3wGGhVMIaUp9HeS+nPHIqPXKMlaKtsLWT2jwdbpSGrWu6ELV24x/p2y00hfGjciiAQTEdudv5taxYiguToD/RmLZ57rA6AKz3ImyGJZ9z1CCsIEa3sPA=
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com (2603:1096:301:88::14)
 by JH0PR03MB8842.apcprd03.prod.outlook.com (2603:1096:990:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 10:03:12 +0000
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc]) by PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc%6]) with mapi id 15.20.8335.012; Mon, 13 Jan 2025
 10:03:12 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "sean.wang@kernel.org" <sean.wang@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
Thread-Topic: [PATCH] pinctrl: mediatek: Add support for MT8196
Thread-Index: AQHbNBnv+/+av556eE+xAie8jxoTBbMU3ICA
Date: Mon, 13 Jan 2025 10:03:12 +0000
Message-ID: <f2c9274bc3078024f378a263c703f1a65ae7a74d.camel@mediatek.com>
References: <20241111085354.26576-1-ot_cathy.xu@mediatek.com>
	 <0fd22798-8aa1-4d86-bdaa-c03938972319@wanadoo.fr>
In-Reply-To: <0fd22798-8aa1-4d86-bdaa-c03938972319@wanadoo.fr>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5688:EE_|JH0PR03MB8842:EE_
x-ms-office365-filtering-correlation-id: 0ae9f331-68ca-4efb-b1c5-08dd33b97d6b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cFQ3dzl0Yjk2M0ROZ3RwdjZiWE5GOWFpcng3a0VyNHQ0K3RPeTF2TEIxQ3M4?=
 =?utf-8?B?by9DMzRFYm9XZEZ3Z0xCenNZcGNXdncxVko0R0ZoNkhVOEtPNkg4V0dJVC81?=
 =?utf-8?B?ZHM5UlloWmVrSEl0Q1ZQRmhpbityNUwzME5DcjlXSkluMXYxcnFNd01wbXBS?=
 =?utf-8?B?ZWZHUXlDbmd0NXk4cmowUVo2Y2dIZkhIMU5KZktPT1oyUWtkWHhJZUJjcFpI?=
 =?utf-8?B?UmJxODgzSE9sRDM1NmhabngrbDUydzRyMXh6TEpxU0p6M0lkUzFhMTZoTS9D?=
 =?utf-8?B?NzF0eVhxQ0xsOGZ6OFhFWjNjU0orWlJZcy9LQmFReW5MQlZTbkJFby9wOTRt?=
 =?utf-8?B?MjlDUEhEdmlBWXdDc3crQThqNVB4R1M4L2RkOTNkUVRjR2RrY0dmSUdHYWtO?=
 =?utf-8?B?TVhpU3ZBSjh6MGE2ZVUrN21JWm5RZHh2Q0s2Ykx0cHJPZHZnZjdoeVhwTGdK?=
 =?utf-8?B?Ny8wQXZIMzZOVXV1dStVYzJkUXBQU1ZiZEovcjhFS0twSmNnRkVBSHBEUjdx?=
 =?utf-8?B?V1lOZ0tLNDB3QndKUnR5cHhzczdVenI2M2lKbHpWOHV5YkRmR1k4ZlFVeC9Q?=
 =?utf-8?B?ZjFPWHpKSXNmYlNPOHJmLzduZDMzN3RHakI0SVR2eFQ3OEF2T1pSZ1VwZERU?=
 =?utf-8?B?VHBUaEFMNmR5VnBUdnZyNERKd0xQRWMvY2crSlVuSkpBbTJaZFl6b05hUEZR?=
 =?utf-8?B?d3BWUnp3endDQjNhRFp3ZnVhSmlZQVkrQm1TYVJaeWlCdlpzdUx4WWs4WWFU?=
 =?utf-8?B?VE9nN1V4S05DVUd3ODlUZElTSmJDRVV0UnZhUDF6TDNVeUtkZG1CNENhUzJu?=
 =?utf-8?B?d2MrL0RjY1Rna0srZjRycDdsUkF2OC9OdWo3VUkwaytkcUxZY1FhRjQrZS83?=
 =?utf-8?B?Zm1yZnJBNjhNWEtlYm9mZ0tNTm5jYjhTRTBITDEwYnErS2JacDd4R0JGaTJM?=
 =?utf-8?B?RGluRklZWGtJSnI4RklLdzhhaGJXdkgrRnNBTzArbVNEbjlnR1psQ3lvYUc0?=
 =?utf-8?B?V1BKazJ1REcyR0sxby9BeTNxaHE2Zzg5QlJlS1JoaG1vdVluOEw2cGgzNFJB?=
 =?utf-8?B?R0RWZnc1RDBqWTVkV0VWMllqWFJWZ0ZZclR4TGd1QWNILzFKSHlXY2RrOGhW?=
 =?utf-8?B?TkNUd2NiV1d3bTA4TFlZVlJWOXlhTVJwY0pmOGhtZE04Wll1NW5NQU1nY3dk?=
 =?utf-8?B?NHcweDg3byt6UHZCWHNQYkRuekU1TGVNV1NqdGQzcUJaRE5ObVFmUkZjLzd4?=
 =?utf-8?B?SCtWUTBMZXQ0NGxaRlZhNllxRmkwN05SMFNFNkgyK1JHbTZGR01sZEFPb1oz?=
 =?utf-8?B?ZTlJV0IxeFVWSFc0YUpMWml0ZVFZY3hOLzdTZC9aMWVxQUhGN0pKOWhUb0VE?=
 =?utf-8?B?M2hUclhXWGFiTDA3RnZZNFpXQjdCNVphRGhFRnkzUXovdUwvK2V5Z0x0OXQw?=
 =?utf-8?B?SHZEOEJZemlYdUJWNlhOZnNvaW5iV3hPdit0S3J3NzlGWW9XYXRSV3ZCL2x1?=
 =?utf-8?B?dFNxSTRVSnpUM01oNDFMdmNrQzR2NWxYZUh3L1RNTFRlMXBsWFBnYTlTS1Qz?=
 =?utf-8?B?Zi9tY29zR3FDUWU4VU9jdXcxSWVmSk1wamFxcWRHWHI2WWZxWlNkRlZsc2Ft?=
 =?utf-8?B?aXNkbndyTHlqNnlud0huVkEzZ2RQMWxLN25QNUNZcUsvZCs2QnZuU1VDZ2Nm?=
 =?utf-8?B?R2c2QjlVandqcjBadjF0UWp0OE1IMERqQ0pFRXlrQmthbVZhOVM5MlVkL2FX?=
 =?utf-8?B?STJzSHZoYU0yVmQ1TjlvOGFudzFVK2hSQktCQ1VjOU1Fei9sRG54bjNRZjcw?=
 =?utf-8?B?cllOUXdqSXRNQ3Y0dFFLZ1NmTXdsN05ESlF2QVVCNy9HQUluZVNFRWlZTkVa?=
 =?utf-8?B?RC9WWjhiOWtaVHlaaUUvRDlWWXFwSm02UlFYQ0M3M2hJaFFOd00wcUJ3WVpp?=
 =?utf-8?Q?tuWtUxOneOhDMgH9AAtFYHNNELeCo/Uv?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnNpcEF4dTlmOHZPK1BhNzhtTDhWMzc5NVRWczNTMWlzMVRBVmQydE5zbUFu?=
 =?utf-8?B?Tm1CWitnbVRUTGZqWkFIekltUGFJVHFPb3k4ZnNUT0pZNXQ1ZnU0bkdDTEZo?=
 =?utf-8?B?KzEyZXRLemI0bGNzeldZbjdIc0o1aE03eXhlQmVTRVNGTHJqQTNoRjlDYXhH?=
 =?utf-8?B?VnVoY3h1NFJPbFo4OXRVYzlmYm11WlFOMjl4R3gzWUQ2eXhKZ3p0enBUVHBp?=
 =?utf-8?B?K0VWZ0hORVhMSGRjM0s4eUNmOW93aUMrQWh5Wkt4UFBmM3E5OUhOcGhLa1ZS?=
 =?utf-8?B?czFYaXdnci9MWDNiekp1OXlsRjdDTGlBajRVeUQyWHh6MEZWOFphSDlra1Zz?=
 =?utf-8?B?TEN5THpkWHIxak8zaHprODdob1ZpK0dsNEhwalNEUlVORWowdXJnZE9ONTNQ?=
 =?utf-8?B?R3I4WHA0Tm9nZE9CVEwrSHdud1ROM1pYS1ppUXRTTFpMeCtVME9lempzRVZC?=
 =?utf-8?B?aldCOENYZmlzM0JiUllORjlnOWpJSkxubmpSZnFHTzNyMWYwT2ZyNU5yL2xP?=
 =?utf-8?B?ekVEdmNPWU04Z2pXdVhzcVVFRlBudzBPbm4yOXdXeTdmL0ZISUJ6bU43UEJ2?=
 =?utf-8?B?RE8rUnVlUTdYMk54aGpaUmppY0NPYTZWSU5CYU9DbytsN2hmUTFTNmFtQTFv?=
 =?utf-8?B?RiszUzdhMXEyUlNObXRCMTNLWHN1dFV0anlqSWZ3SkRjSCsxcCsrektQMXd2?=
 =?utf-8?B?alI2MExiS1h4WE1YMWFBUkswc010ZkNvank2TDlrUlBiZUdxQjFVTHZSSjVw?=
 =?utf-8?B?S3BCaGJqM3VFK1BBMFlQL2NsZzdiZVFiMUx2TmFBZFdCcEtkbGZWSlpiNzdH?=
 =?utf-8?B?a3pjWDZObnJWTG1JZlI1Ni9iUXhMVXBEY1JGejJSR1NWTWdrNC9pZ3ZXTTlO?=
 =?utf-8?B?QzdKOHlBQU1rSXVBT2wySGtkc1ZtUmkrYWFMVUxSUExRcnVmUXJGU3QrWFVz?=
 =?utf-8?B?RWU4dkNrL0VPOUdFMUdOYlN6d2UxUStCeWlZV1J6WVhxZVN2WmlucXdFZVFl?=
 =?utf-8?B?ZTMwTVBnbi9BY09Pck1ML05aRS9QQnZCaEVuYXJSOUxTakx4eW9KaGdhcFYv?=
 =?utf-8?B?VHRUSktEeDl6S1hxeGhFRDdvTjNQYktqUEJzTUZnMnl4QVVvdUpibldwQkhj?=
 =?utf-8?B?RzJoajlsaXJIVFFVaEtSOUdCb3JIQXVoQTlMT3JMNjJzenBqWmw3d2VVZ3J1?=
 =?utf-8?B?ZHZCUzJpMllSeXRqaXpUUjNoNEcwV05pcVFWV3VGYzhPMVZrZFQvcHlPUXlt?=
 =?utf-8?B?UVh6VmhOZFpZYkErTzhZZmNSdldDbXFXN294K0ovUmxFU3piWXhaNDFtaWpx?=
 =?utf-8?B?Wldua3FSZHBPZEpFeEx2aW1JWWt0NUtHZFl5SEFMMWNJZ3NBaEYxZGZRQlUv?=
 =?utf-8?B?L3JTeERJQ1ZWOUV6ZFF5T3E0N1ZCSGRSUzRHUVRkc2lDVzNZUkVjUnV5S0or?=
 =?utf-8?B?Z2c5UFF6RHdBeWFRVFZwUFdHeWtqVU5hV216TVRlc285TmppYVhQNlJLdDhY?=
 =?utf-8?B?Z0RaOWp6QmRyTG5EVFg0bHh1MU5KNFhyajdqQWZoc3JPeUlDSmcvb3lYSC9l?=
 =?utf-8?B?SXlIOXdkdGptSmFFaUZtclFPLytFbmlkSTFhMU1ZbW5yYUpFeWsyZU9zMFgw?=
 =?utf-8?B?SHZRR3M2SXMrOGYvdnZEMzh2MmZXYWNPUHljZGhrTnVRVy8ybEk5Ukszcjdt?=
 =?utf-8?B?ekxiZlpvS2VvbUNoTG8vM1JxNSt4ZDAzcXN1ZjFpdHdRTnBNMWN1ODNXWSt1?=
 =?utf-8?B?ZWlRUXFZRThNVzFTMnlBamRtWVRFNlRUc1gvYXBIdGZtcXlYcHBRQlJrcFo0?=
 =?utf-8?B?RmI4RXRjRGlNcVFvYU1mYVZjbG1CaTRYTlJkSVJlejVJQUN1ZU1CMEpvZTlG?=
 =?utf-8?B?dmt2TDA4a1ZDOGdjRStkNHpJekFRVlNkSVhwOFdYVGJqUzl0dnYxUW01enZm?=
 =?utf-8?B?bTBkWGpqTk9qL0R4bG5Qbk5WWUxhUHFEYXlFUmVGamh2WExxUlFkOEpDVk5i?=
 =?utf-8?B?QmE1TmVBaWlDbUF1NXI4NzdoenBhbU9aVGE3YmpSdktHSlJzbDdMeWtjUmls?=
 =?utf-8?B?dm5QVnQxcjZNMDJlTzBtcXg5OXQzSndOejMxWHBGY2V6RndoZGh1dmpDSTFV?=
 =?utf-8?B?OEhkRVYwbmRSR1FNM0tISTg1UHpGVTJaNmxyUUlqY2NWeTNIa0xTaS9uNDZO?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C69BE0B7C5341F488536CC5312EA499A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae9f331-68ca-4efb-b1c5-08dd33b97d6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 10:03:12.2375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 58vwghIxZ4lCQACqbMxYYuipGntm+WZCkjBaJQmfMFYO/CmjlADh2kXBvnccr6EdyUg4LkkDEMLWwk52LoVD+0ajqhiyEo7x08nSH3AYFtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8842

T24gTW9uLCAyMDI0LTExLTExIGF0IDEwOjEyICswMTAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gTGUgMTEvMTEvMjAyNCDDoCAwOTo1Mywgb3Q5MDcyODAgYSDD
qWNyaXQgOg0KPiA+IEZyb206IEd1b2RvbmcgTGl1IDxndW9kb25nLmxpdUBtZWRpYXRlay5jb3Jw
LXBhcnRuZXIuZ29vZ2xlLmNvbT4NCj4gPiANCj4gPiBBZGQgcmVnaXN0ZXIgYWRkcmVzcyBmb3Ig
ZWFjaCBwaW4gY29uZmlnLg0KPiA+IEFkZCB0aGUgZnVuY3Rpb24gZm9yIGVhY2ggcGluLg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgTGl1IDxndW9kb25nLmxpdUBtZWRpYXRlay5j
b20+DQo+ID4gQ2F0aHkgWHUgPG90X2NhdGh5Lnh1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4g
DQo+IEhpLA0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3Bp
bmN0cmwtbXRrLW10ODE5Ni5oDQo+ID4gYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1tdGstbXQ4MTk2LmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAw
MDAwMDAwMC4uOTczMmVkZTc0ZDliDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZl
cnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1tdDgxOTYuaA0KPiA+IEBAIC0wLDAgKzEs
Mjc5MSBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KPiA+
ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgTWVkaWF0ZWsgSW5jLg0KPiA+ICsgKiBB
dXRob3I6IEd1b2RvbmcgTGl1IDxHdW9kb25nLkxpdUBtZWRpYXRlay5jb20+DQo+ID4gKyAqDQo+
ID4gKyAqLw0KPiA+ICsNCj4gPiArI2lmbmRlZiBfX1BJTkNUUkxfTVRLX01UODE5Nl9IDQo+ID4g
KyNkZWZpbmUgX19QSU5DVFJMX01US19NVDgxOTZfSA0KPiA+ICsNCj4gDQo+IC4uLg0KPiANCj4g
PiArICAgICBNVEtfUElOKA0KPiA+ICsgICAgICAgICAgICAgMjkyLCAidmVpbnQyOTIiLA0KPiA+
ICsgICAgICAgICAgICAgTVRLX0VJTlRfRlVOQ1RJT04oMCwgMjkyKSwNCj4gPiArICAgICAgICAg
ICAgIERSVl9HUlA0LA0KPiA+ICsgICAgICAgICAgICAgTVRLX0ZVTkNUSU9OKDAsIE5VTEwpDQo+
ID4gKyAgICAgKQ0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArI2VuZGlmIC8qIF9fUElOQ1RSTF9fTVRL
X01UODE5Nl9IICovDQo+IA0KPiBOaXRwaWNrOiB0aGVyZSBpcyBhbiBleHRyYSBfIGJlZm9yZSBN
VEsgaGVyZS4NCiAgVGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4gaXQgd2lsbCBiZSBmaXhlZCBp
biBuZXh0IHZlcnNpb24uDQoNCj4gDQo=

