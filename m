Return-Path: <linux-gpio+bounces-17906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A42FA6D6F0
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 10:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AD3B16CF2D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 09:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9604725D8FB;
	Mon, 24 Mar 2025 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="vHH3pvfe";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XjdSg1E7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5999D1EB5D7;
	Mon, 24 Mar 2025 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742807360; cv=fail; b=dNbtD1XUvMNNVYqex0BGpnEjKlaJEW1Dehs06LnlYPF6rKsAdHExl4FYa0+LPpVwqk+kXM+H691j1Z0eg6UOixPs8kk+2b+i7eqsdG4OGa/q+sI1qYyJfd5VzzsvThV9rUDcgpllMPuSG/OuDdfsiafUXmTNz1VhX82EQlGXIx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742807360; c=relaxed/simple;
	bh=aYAyty6+709050vsOCXProo+ynAv1FTmG9eC6LPcfuE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PXsJsNLTT8GHD8H0aOT5gG2bNcfgaLWdz4omCIPpkVejydxEjbsUitSEs3SbnETuQwR/V3+B8C9Tkn1zufgOpYJycmPumHZMyeUkjD29rnafs8GgNjoursCKkzzul6hExy/t0QoAahqHa/anJu1cOJsivNSHJf/wjAZTAeQRrac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=vHH3pvfe; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=XjdSg1E7; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a86ebaf4088f11f0aae1fd9735fae912-20250324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=aYAyty6+709050vsOCXProo+ynAv1FTmG9eC6LPcfuE=;
	b=vHH3pvfe2q2/d95Z3qgfs+RV0NBRWLOycKP5dPvnTGZdKa697dONirH72nYJSnPBBI2BtAvcnEBK83OW4HyuahmbZ+AD46DaNZp/8GxNDSycdz7MnlJ+vHWzq+kGiJG9lgpj0FlTAv/pSfmmcAkHodDVHIwi671p2UHZ02obSQc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c87edd30-0856-4b63-b4fb-3da42738f16b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:4526b9c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a86ebaf4088f11f0aae1fd9735fae912-20250324
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1202842142; Mon, 24 Mar 2025 17:09:14 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 24 Mar 2025 17:09:13 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 24 Mar 2025 17:09:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQ1Q3OJnRTW4cdw2XXyyORHMhnxnRf0w388t2CayPFv9MpD9S/UdgWQpAo4yE2jGdIqtUsLO/K5cuk1r5dTCQndqYONrSGtbIlN/U/NeH9JR0qFWZN45o6pQ+J7PAx4v5SDBl83LbkCvthW/LSvQ1rGM2dWueG6qbmlZTcE4PybscHXG2CA+U0fhhTRZm5yYNrMOltnZBSapikXc14kAPMbHTIsSTl4MPP4KcJRZXy+PAkDR4PGJoMjihz+C+hMVTul+vO89k3f5vMgFdnmORHlt3rAHYERH/PjqO8YfXodkI0Ijo2vqJAZCIVTkkxdt4ReHW6VZ+MPFyr+JHPbgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYAyty6+709050vsOCXProo+ynAv1FTmG9eC6LPcfuE=;
 b=lADxx/G2j+P3vXujY0NAF7Ss4bE77BtGqumjIjUSlpdfpUGYEC/bH2+m8UxwRyCZ+7A1x9srEUKZqn4jDOHCa6jW/0PSboy/B1tKZxPp7SRaWTgwQYcSLJj+zl18x28MRd1PWSkOkmLGwwOBG2X+jUPZBpk6bmSxBUVxs/g80GC+e2tJGomBbiY5149HU7Ze2ZESn/svT7UBgWoxPOaYsuNw7yy8a/j3dFeYWS+XsHb8EJDCNpo4lKFj63F0o8/jRwXSOKXZR0J6jMKSUVnTb50Soqt3bgWT3cQB+Bwfk9IgK4PQweIAIxEPoxmgAS+KWRBPT7ETpnAUEqJoXswWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYAyty6+709050vsOCXProo+ynAv1FTmG9eC6LPcfuE=;
 b=XjdSg1E72uVafIeYh7FJcAj3xB1PFyP+NilXquN+E/1Js0aMX95LsEaMpngVzZVRU81yRa8K0F2Z5g4kaJLZ0kcxiZpBiaYXecnYNX0SCut55y9zE321Cvho2P31cNmQmYzPp1Y0XVXLCEfp3rKlyNkPVbDIC/cCSHVaQLcyanA=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by TY0PR03MB8278.apcprd03.prod.outlook.com (2603:1096:405:15::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 09:09:10 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%2]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 09:09:10 +0000
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
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SmltaW4gV2FuZyAo5rGq5rWO5rCRKQ==?= <Jimin.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "sean.wang@kernel.org"
	<sean.wang@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Thread-Topic: [PATCH v5 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Thread-Index: AQHbmj+hTeyieX3Zk0yKpe01ymblBrOB8dkAgAASdYA=
Date: Mon, 24 Mar 2025 09:09:10 +0000
Message-ID: <08d775ee699ed258c6a7c0ae3ad3ba5f30037310.camel@mediatek.com>
References: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
	 <20250321084142.18563-2-ot_cathy.xu@mediatek.com>
	 <20250324-sly-smart-impala-9fb09e@krzk-bin>
In-Reply-To: <20250324-sly-smart-impala-9fb09e@krzk-bin>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|TY0PR03MB8278:EE_
x-ms-office365-filtering-correlation-id: 30070214-88eb-4dd3-cc3b-08dd6ab389d8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NXFjb1BFdFFCTDEzOHVYU2xCNS9UTTcvQjN4a0pkdDBQdWJOM2JhU0hQaXFa?=
 =?utf-8?B?KzFRWFZtRXBpQmh2L2I5M3h0c29PQ2RNZVZRcjFIRkhDbmgxSHY0YnQzR29Z?=
 =?utf-8?B?THl5MHlZbnBBTjRWSTloR3JCdTBXRERWVy8rOHc0bldtVkR1Y2tDcGRFay85?=
 =?utf-8?B?S3I0cU4weVBaTUE5UmhtV3k3SElSenhxdGh0T3RuU0ZSQjNSdHVOYWlBcnpu?=
 =?utf-8?B?WUl1ODN6cnJpUC9CMjY4djEwbjVwMW05REduSGh6dlJpWGpkdzhTdWE1K0xo?=
 =?utf-8?B?eGwvRHNNOE5UZWIwSmI0Tmx5YWJ0TmxVV1d0Qm5LQU4xVldGSHFWRU0vd1Ba?=
 =?utf-8?B?Rk1NdnhVSkd5cE50Z2Y1bTdrQWhJa3RUc3NYMXVIZmVNUmdLTXROU3FvdStF?=
 =?utf-8?B?NW5iWEpGWmJQT2JGM1IyTVFQTUYwZHp5NkF3YmUrcHJraUlFOGo5V1YyUTJN?=
 =?utf-8?B?eGZhKzZ2WWYrOWVzbEZIeUx6UzJUcGRuUWhoTnowRkl3dzFXUUpld3hiZFBk?=
 =?utf-8?B?M2lXbVhod256UnozRVUyMjdLK3h1UXhFUmJRU0lSYW5vMEROK3RQZ1NZbnFh?=
 =?utf-8?B?R3R4SHdNOFViTVI5MjNjQmxLNUNac2FRdGdKR2RxM1JwKzc1dGtOczZDMnpi?=
 =?utf-8?B?dXN4anFESUNISWhmTldNNFhFak1sYTdxNkVHdmIwNVFnYjdvNHlHR2N3NGhQ?=
 =?utf-8?B?dDFadG4zRDBqaUVlZXdXQk1HVlZMWU91c1J4d3ZHMUZUNnRaSkNWNjVtTnEw?=
 =?utf-8?B?dTlsMEZtVVRBbllscm9vRVRTU0U2aVU4cFNnQ1BnK3J0VDc0d2k4VEUrMS9m?=
 =?utf-8?B?NGxmN0ptOUZWT1pmQWkxcFdvOVUrVFNQcWgwUEhGbTlUeUsrMTVoSUZJb0Zk?=
 =?utf-8?B?QTEycEVLZDdZeXJrWHdUQk5Gc0lZTncyOVpZTkhldDMvbmE0OGZFQWlDQ2cx?=
 =?utf-8?B?WTExQWwxRVFZNTZZU2tad1BHVUNqajd2alpIUkhPbndVMGR0NmJzVU9hN1Ar?=
 =?utf-8?B?VER2alErWFFpaXlKR201VzRzUjJ1djBnNVpqWGxWZktkNFA5Wm1makR3NlhV?=
 =?utf-8?B?ZEo4S2tMbnRzWCtLMUk3ZFFFckhSMXBBMm16N2h0ajFrcnpXdHBnMjdudkhC?=
 =?utf-8?B?a0IyMFpTdW04S0JKT09FaHBWOHMvQ2JOaVluK24wd242b2tkTW5EWU95SHVu?=
 =?utf-8?B?MURQVXEzU2J5Uk11UXBTU2VBUElWT0xnaDcrQXRxaHFLTzV6ZUFJdlNLSkhQ?=
 =?utf-8?B?N04rbGNrbWNTK2hOWVBLb1N0N3lvamx1TDZjcDJ4VWVhZzlRZzFmcHFGNGp3?=
 =?utf-8?B?SzI3NXlkb2FLblFRUHZoMkNJU2ZveTJsMkdWSFlRbC9pa0t0dUsvT1pHQ0lM?=
 =?utf-8?B?Z2pXQUM2SklNZXhpMmlLcTVHUE9OeWdWQ1pid25oQk9udzU1OUpFK3dTTXBZ?=
 =?utf-8?B?WGxoSEp0WHVSVXpzNnZHUkVHdk44dnczNEt6UjhrRXFNR3BiMzRVMWRqNVd4?=
 =?utf-8?B?M0taYnlySUl5QkIxTDBjNXZxOGFnMkQ4citGVm1SeVkwdVk1amhuR1dOblRX?=
 =?utf-8?B?V3JDanExOUU1My9qVm1FT1RyQ1g5UHJSS3k2Z3pPN1M1STJjSnFSY1NCdE5i?=
 =?utf-8?B?VWFob25OUTZpMDBSNHRUaDJXTDc3dERBbEl3RHpGYTVhdzUvY3pPL0ZTWWNu?=
 =?utf-8?B?MWhpdDhqRTlYck1LSGVuSnFocFExdVpmQk1CcFJMWWxzOS8ybHRFZDlDYjR0?=
 =?utf-8?B?dFlacVBIWDYwMzM5cW9ZZzJqdDBlYyt4NUp2b0tVZmpBbzZFVVpsZVM4VUpl?=
 =?utf-8?B?NFZoM0RORXJISk1naVVTK2ZOQU4wZFZ5c3p0ak1HMUtIeXVEUXZqREo2MDBD?=
 =?utf-8?B?RmVIQ1JKTERsbkVVVmFxOVJLcXpXMGZxdDJjeUlVR3VNTXhHUDRRY2h4ajZH?=
 =?utf-8?B?ckFtdm9VbUdpTVc1Zm1qempQSlp2N3FCZGZudXB0N25JRzlSc0RTZ0JsM2Zv?=
 =?utf-8?B?NTJKR0FRSFRBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3V3M1NOb3V3NTI3MVZScTd1eTJEVkxtbXJ2WmhzVnBTOUlnQnVNSXJyVFNH?=
 =?utf-8?B?QlZwa1owRDMxd0ZtMk5MRkFYYm1peDZlUVRzUmYwOXhLNWl2WmI5WGszUElu?=
 =?utf-8?B?UzkxVWRKNWlpUCs4SEZHbGM5L0FuU0hKWVpqZ1NEckFDaEt0YitHekI3VWxR?=
 =?utf-8?B?ZEtsTXlmWWt3dXdlSlpYQzRreTV4RzYwcnliTEI0azhVRVloMHlFejI2cE1M?=
 =?utf-8?B?VXlqWFAvRUpHV0pmRmZKL2dRRWl2Y1BkMW5nYjRRVjRmUHBiaGtaNlM5RUNB?=
 =?utf-8?B?bXduN0QvaHBFelFvTVdhSTN0Z2FVWk1wVEloRy9DUzlUdUJqWDZzM1ZQTlZy?=
 =?utf-8?B?L0w4VzlvMUtqSlA2V1FWcGQvVWEwMC9NSmN6b0VFQmdKdGpRYy9CZWhnb3JZ?=
 =?utf-8?B?MDF5T0dZSmd0cUZqdTIrUkQ5NVp1WnNoeXA0c1RnUVlBMlA4OXdQNjZJTzB5?=
 =?utf-8?B?UVRvK2ZzK1U1L2lBOVBuZDJMZ29od3JTZytjckl1cjZvY2wxRkhOQi93TURw?=
 =?utf-8?B?UnpsSVlKbE5zdGJ0aDRaaUZUZ2k2Y1kxek5TZHNHZjhNSHY0MXpyVlhoejlB?=
 =?utf-8?B?KzgwVTNxd1k3anltSjhUQUh1eGQ0Vk1NS01wMm9FUks3M3BGaE00T1pSMlM5?=
 =?utf-8?B?OHdGQ0E5aGE5czZCeWNxVGh5WmFLYVgycElHemFOUkU5SVJlYjd1R3d1eGJx?=
 =?utf-8?B?SXN0UkFOK1lGR2JsekRXRFd1R3h1VC9qNGNUSmR3SkN5eEpwbDErVE03bmwz?=
 =?utf-8?B?TkNtTHV2ZFJTVTZqeHJOQjR1MFB2TndSVzlNQ2VMNmE5OUVDcDU5VmhRVEFE?=
 =?utf-8?B?UGNWRzl2alNPOG5heHBjdTgyaVRCSDNkOEZzMkN3d0ovNTR4K3dBNDRFdzdk?=
 =?utf-8?B?UjA1Y2dpWUdVZ0hrWmxyVFMxTWxEdHRwL2hLVXRacVFiNjhuVjBLUkh6Wi9B?=
 =?utf-8?B?ZXZlMlVIWkVFZ0ZYckQ4T083Q3FyQld6eXZlUlBOT0w0eFFTT0pBMEhNTC9R?=
 =?utf-8?B?TnlVcGMzUkJuWVc2YUpxOGkrVWpxQUo0SUcvNGJFYnJaUmxXekwyMGJqMEFZ?=
 =?utf-8?B?cC9NYlpOemVKNHNVK0ZudnJTSHBvbG1GdHBvMXVxSFFNL2hULytYbFM2RTJj?=
 =?utf-8?B?WkNrYlh6Tkx5WFB0aHVRNG1CTitSMDZ6NEpyZDl5Ui85YjZTRCtMUEZzSHJq?=
 =?utf-8?B?Q21nWk5JMk9Vdzd2dXduS25NZEhBNXBkSWVETCtBaktqcmp5TDloR1dpdEhK?=
 =?utf-8?B?aUxwUDIvLzJyZUdOTFppb01BcUM0dDZDSUEvT3pEQ01rdlZVVjZlbDBpS1JK?=
 =?utf-8?B?WVpxSDIrRUpBTFAvbFZNYnRMRTF0ZlY0OG5UYitYSWdhTGFmWUlCVEcyNVVz?=
 =?utf-8?B?c1lmSC9mTXN1WkhvT05TYmRCdmNOeVFsM3dBRGxNL3c0Y1ZHZWM1UDBFaW9y?=
 =?utf-8?B?aGZTeVZ1N1ZGdE1oREJEOWJtajBrK1pENitvR3RqOTdWUUNDd0pPY2kwM2k1?=
 =?utf-8?B?NktRVHdyL1R3ZkRvejN1bEQyNktDZlNqZVdkYUZGMmlUcVdYREl2b2RmSkZY?=
 =?utf-8?B?MEMxc1hndXE1bzNzcDZEbjNpUDJYdGpWL3NidTJKMXU1dFBtb2prVHUvdGF2?=
 =?utf-8?B?ZlVJYkpXLytKWnZzZVQ0UCtrclJHMGJ5OFg4MEV0enFDZTZKU3U0VnNtYi9i?=
 =?utf-8?B?bEova3A2UFozeHpPY1gwSlNnSndBQ2RwNUwvdTJWTXFzeW0zL0dCenV1WUdR?=
 =?utf-8?B?R2hRdWg5bW9WbU90dGxpbEk3Y0VQakI1YkQ4cU9VSEF5ODR3bHRPeHdRS04x?=
 =?utf-8?B?R1BTSm1Rb0tpTGZXU1daTEMrSXZ4d2lsVjBwSnUwSzZqaVZ0czR5N2djcUFV?=
 =?utf-8?B?YjRQUW01Qk5UemNURTVrTEMxZ1hJL3JsOTRqMTdqMU45VUkzeFovNGkzaVh2?=
 =?utf-8?B?WHp6Vkp6eVN0NWw1bDZqZ0szczQxQ0g0QlFwQ2t0TFNyT3RXNllYZDRkelJC?=
 =?utf-8?B?Y0tpVkdvOU1QU25YVkRwRmI1Z2owckRUUG91TEc4Z3pDeUg1a29MRjNxYnBF?=
 =?utf-8?B?YnZNUXNBV3B1S3dIUGpMNEgyTE5KUWtVUUdKc1oxc0dZVGVseUgyRFNBdE5T?=
 =?utf-8?B?MXc1RzVCY24wS01ESFNxWTAvQlVtRDZDbldNUzN4bHcyQitNMkwzQzNSSlVv?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36334623A398634D9A688A821A65B3E1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30070214-88eb-4dd3-cc3b-08dd6ab389d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 09:09:10.0738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BPagiVhSLthHHw6sI/TykeuSZx03tDeyVJKLJU7RVrMrE/oSK43GZjCfjgeY8zYq0yoBVEIE8Gn8MDHzibG3oNvyhNM1RWmgrh4N1dCKiys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8278

T24gTW9uLCAyMDI1LTAzLTI0IGF0IDA5OjAzICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgTWFyIDIxLCAyMDI1IGF0IDA0OjM5OjEyUE0g
KzA4MDAsIENhdGh5IFh1IHdyb3RlOg0KPiA+ICsgIHJlZzoNCj4gPiArICAgIGl0ZW1zOg0KPiA+
ICsgICAgICAtIGRlc2NyaXB0aW9uOiBncGlvIHJlZ2lzdGVycyBiYXNlIGFkZHJlc3MNCj4gPiAr
ICAgICAgLSBkZXNjcmlwdGlvbjogcnQgZ3JvdXAgaW8gY29uZmlndXJhdGlvbiByZWdpc3RlcnMg
YmFzZQ0KPiA+IGFkZHJlc3MNCj4gDQo+IHMvaW8gY29uZmlndXJhdGlvbiByZWdpc3RlcnMgYmFz
ZSBhZGRyZXNzL0lPLw0KPiA/DQo+IA0KPiBXaHkgcmVwZWF0aW5nIHNvIG11Y2ggb2YgcmVkdW5k
YW50IGluZm9ybWF0aW9uPw0KDQogIFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuDQogIEFsbCB0
aGVzZSByZWdpc3RlcnMgcmVsYXRlZCB0byBkaWZmZXJlbnQgZ3BpbyBjb25maWd1dGF0aW9ucy4g
U2hvdWxkDQpJIGRlbGV0ZSB0aGVtPw0KDQo+IA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBy
bTEgZ3JvdXAgaW8gY29uZmlndXJhdGlvbiByZWdpc3RlcnMgYmFzZQ0KPiA+IGFkZHJlc3MNCj4g
PiArICAgICAgLSBkZXNjcmlwdGlvbjogcm0yIGdyb3VwIGlvIGNvbmZpZ3VyYXRpb24gcmVnaXN0
ZXJzIGJhc2UNCj4gPiBhZGRyZXNzDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHJiIGdyb3Vw
IGlvIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIGJhc2UNCj4gPiBhZGRyZXNzDQo+ID4gKyAgICAg
IC0gZGVzY3JpcHRpb246IGJtMSBncm91cCBpbyBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyBiYXNl
DQo+ID4gYWRkcmVzcw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBibTIgZ3JvdXAgaW8gY29u
ZmlndXJhdGlvbiByZWdpc3RlcnMgYmFzZQ0KPiA+IGFkZHJlc3MNCj4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogYm0zIGdyb3VwIGlvIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIGJhc2UNCj4gPiBh
ZGRyZXNzDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGx0IGdyb3VwIGlvIGNvbmZpZ3VyYXRp
b24gcmVnaXN0ZXJzIGJhc2UNCj4gPiBhZGRyZXNzDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246
IGxtMSBncm91cCBpbyBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyBiYXNlDQo+ID4gYWRkcmVzcw0K
PiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBsbTIgZ3JvdXAgaW8gY29uZmlndXJhdGlvbiByZWdp
c3RlcnMgYmFzZQ0KPiA+IGFkZHJlc3MNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogbGIxIGdy
b3VwIGlvIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIGJhc2UNCj4gPiBhZGRyZXNzDQo+ID4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IGxiMiBncm91cCBpbyBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyBi
YXNlDQo+ID4gYWRkcmVzcw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiB0bTEgZ3JvdXAgaW8g
Y29uZmlndXJhdGlvbiByZWdpc3RlcnMgYmFzZQ0KPiA+IGFkZHJlc3MNCj4gPiArICAgICAgLSBk
ZXNjcmlwdGlvbjogdG0yIGdyb3VwIGlvIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIGJhc2UNCj4g
PiBhZGRyZXNzDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHRtMyBncm91cCBpbyBjb25maWd1
cmF0aW9uIHJlZ2lzdGVycyBiYXNlDQo+ID4gYWRkcmVzcw0KPiA+ICsNCj4gPiArICByZWctbmFt
ZXM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25zdDogaW9jZmcwDQo+ID4gKyAg
ICAgIC0gY29uc3Q6IGlvY2ZnX3J0DQo+ID4gKyAgICAgIC0gY29uc3Q6IGlvY2ZnX3JtMQ0KPiA+
ICsgICAgICAtIGNvbnN0OiBpb2NmZ19ybTINCj4gPiArICAgICAgLSBjb25zdDogaW9jZmdfcmIN
Cj4gPiArICAgICAgLSBjb25zdDogaW9jZmdfYm0xDQo+ID4gKyAgICAgIC0gY29uc3Q6IGlvY2Zn
X2JtMg0KPiA+ICsgICAgICAtIGNvbnN0OiBpb2NmZ19ibTMNCj4gPiArICAgICAgLSBjb25zdDog
aW9jZmdfbHQNCj4gPiArICAgICAgLSBjb25zdDogaW9jZmdfbG0xDQo+ID4gKyAgICAgIC0gY29u
c3Q6IGlvY2ZnX2xtMg0KPiA+ICsgICAgICAtIGNvbnN0OiBpb2NmZ19sYjENCj4gPiArICAgICAg
LSBjb25zdDogaW9jZmdfbGIyDQo+ID4gKyAgICAgIC0gY29uc3Q6IGlvY2ZnX3RtMQ0KPiA+ICsg
ICAgICAtIGNvbnN0OiBpb2NmZ190bTINCj4gPiArICAgICAgLSBjb25zdDogaW9jZmdfdG0zDQo+
IA0KPiBTYW1lIGhlcmUsIGRyb3AgaW9jZmdfIHByZWZpeCBldmVyeXdoZXJlLiBUaGUgZmlyc3Qg
ZW50cnkgYmVjYW1lcw0KPiB0aGVuDQo+ICJiYXNlIiBvciB3aGF0ZXZlciBlbHNlIG1lYW5pbmdm
dWwgKCIwIiBpcyBub3QgbWVhbmluZ2Z1bCkuDQoNCiAgT2ssIGl0IHdpbGwgYmUgZml4ZWQgaW4g
bmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiANCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0LWNvbnRyb2xs
ZXI6IHRydWUNCj4gPiArDQo+ID4gKyAgJyNpbnRlcnJ1cHQtY2VsbHMnOg0KPiA+ICsgICAgY29u
c3Q6IDINCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBU
aGUgaW50ZXJydXB0IG91dHB1dHMgdG8gc3lzaXJxLg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4g
PiArDQo+ID4gKyMgUElOIENPTkZJR1VSQVRJT04gTk9ERVMNCj4gPiArcGF0dGVyblByb3BlcnRp
ZXM6DQo+ID4gKyAgJy1waW5zJCc6DQo+ID4gKyAgICB0eXBlOiBvYmplY3QNCj4gPiArICAgIGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArICAgIHBhdHRlcm5Qcm9wZXJ0
aWVzOg0KPiA+ICsgICAgICAnXnBpbnMnOg0KPiA+ICsgICAgICAgIHR5cGU6IG9iamVjdA0KPiA+
ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3BpbmN0cmwvcGluY2ZnLW5vZGUueWFtbA0KPiA+ICsg
ICAgICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsgICAgICAgIGRlc2NyaXB0
aW9uOg0KPiA+ICsgICAgICAgICAgQSBwaW5jdHJsIG5vZGUgc2hvdWxkIGNvbnRhaW4gYXQgbGVh
c3Qgb25lIHN1Ym5vZGUNCj4gPiByZXByZXNlbnRpbmcgdGhlDQo+ID4gKyAgICAgICAgICBwaW5j
dHJsIGdyb3VwcyBhdmFpbGFibGUgb24gdGhlIG1hY2hpbmUuIEVhY2ggc3Vibm9kZQ0KPiA+IHdp
bGwgbGlzdCB0aGUNCj4gPiArICAgICAgICAgIHBpbnMgaXQgbmVlZHMsIGFuZCBob3cgdGhleSBz
aG91bGQgYmUgY29uZmlndXJlZCwgd2l0aA0KPiA+IHJlZ2FyZCB0byBtdXhlcg0KPiA+ICsgICAg
ICAgICAgY29uZmlndXJhdGlvbiwgcHVsbHVwcywgZHJpdmUgc3RyZW5ndGgsIGlucHV0DQo+ID4g
ZW5hYmxlL2Rpc2FibGUgYW5kIGlucHV0DQo+ID4gKyAgICAgICAgICBzY2htaXR0Lg0KPiA+ICsN
Cj4gPiArICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgICAgcGlubXV4Og0KPiA+ICsg
ICAgICAgICAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgICAgICAgICBJbnRlZ2VyIGFycmF5
LCByZXByZXNlbnRzIGdwaW8gcGluIG51bWJlciBhbmQgbXV4DQo+ID4gc2V0dGluZy4NCj4gPiAr
ICAgICAgICAgICAgICBTdXBwb3J0ZWQgcGluIG51bWJlciBhbmQgbXV4IHZhcmllcyBmb3IgZGlm
ZmVyZW50DQo+ID4gU29DcywgYW5kIGFyZQ0KPiA+ICsgICAgICAgICAgICAgIGRlZmluZWQgYXMg
bWFjcm9zIGluDQo+ID4gYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTYtcGluZnVu
Yy5oDQo+ID4gKyAgICAgICAgICAgICAgZGlyZWN0bHksIGZvciB0aGlzIFNvQy4NCj4gPiArDQo+
ID4gKyAgICAgICAgICBkcml2ZS1zdHJlbmd0aDoNCj4gPiArICAgICAgICAgICAgZW51bTogWzIs
IDQsIDYsIDgsIDEwLCAxMiwgMTQsIDE2XQ0KPiA+ICsNCj4gPiArICAgICAgICAgIGJpYXMtcHVs
bC1kb3duOg0KPiA+ICsgICAgICAgICAgICBvbmVPZjoNCj4gPiArICAgICAgICAgICAgICAtIHR5
cGU6IGJvb2xlYW4NCj4gPiArICAgICAgICAgICAgICAtIGVudW06IFsxMDAsIDEwMSwgMTAyLCAx
MDNdDQo+ID4gKyAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogbXQ4MTk2IHB1bGwgZG93biBQ
VVBEL1IwL1IxIHR5cGUNCj4gPiBkZWZpbmUgdmFsdWUuDQo+ID4gKyAgICAgICAgICAgICAgLSBl
bnVtOiBbNzUwMDAsIDUwMDBdDQo+ID4gKyAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogbXQ4
MTk2IHB1bGwgZG93biBSU0VMIHR5cGUgc2kgdW5pdA0KPiA+IHZhbHVlKG9obSkuDQo+ID4gKyAg
ICAgICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgICAgICAgICAgRm9yIHB1bGwgZG93
biB0eXBlIGlzIG5vcm1hbCwgaXQgZG9lc24ndCBuZWVkIGFkZA0KPiA+IFIxUjAgZGVmaW5lDQo+
ID4gKyAgICAgICAgICAgICAgYW5kIHJlc2lzdGFuY2UgdmFsdWUuDQo+ID4gKyAgICAgICAgICAg
ICAgRm9yIHB1bGwgZG93biB0eXBlIGlzIFBVUEQvUjAvUjEgdHlwZSwgaXQgY2FuIGFkZA0KPiA+
IFIxUjAgZGVmaW5lIHRvDQo+ID4gKyAgICAgICAgICAgICAgc2V0IGRpZmZlcmVudCByZXNpc3Rh
bmNlLiBJdCBjYW4gc3VwcG9ydA0KPiA+ICJNVEtfUFVQRF9TRVRfUjFSMF8wMCIgJg0KPiA+ICsg
ICAgICAgICAgICAgICJNVEtfUFVQRF9TRVRfUjFSMF8wMSIgJiAiTVRLX1BVUERfU0VUX1IxUjBf
MTAiICYNCj4gPiArICAgICAgICAgICAgICAiTVRLX1BVUERfU0VUX1IxUjBfMTEiIGRlZmluZSBp
biBtdDgxOTYuDQo+ID4gKyAgICAgICAgICAgICAgRm9yIHB1bGwgZG93biB0eXBlIGlzIFBEL1JT
RUwsIGl0IGNhbiBhZGQgcmVzaXN0YW5jZQ0KPiA+IHZhbHVlKG9obSkNCj4gPiArICAgICAgICAg
ICAgICB0byBzZXQgZGlmZmVyZW50IHJlc2lzdGFuY2UgYnkgaWRlbnRpZnlpbmcgcHJvcGVydHkN
Cj4gPiArICAgICAgICAgICAgICAibWVkaWF0ZWsscnNlbC1yZXNpc3RhbmNlLWluLXNpLXVuaXQi
LiBJdCBjYW4NCj4gPiBzdXBwb3J0IHJlc2lzdGFuY2UNCj4gPiArICAgICAgICAgICAgICB2YWx1
ZShvaG0pICI3NTAwMCIgJiAiNTAwMCIgaW4gbXQ4MTk2Lg0KPiA+ICsNCj4gPiArICAgICAgICAg
IGJpYXMtcHVsbC11cDoNCj4gPiArICAgICAgICAgICAgb25lT2Y6DQo+ID4gKyAgICAgICAgICAg
ICAgLSB0eXBlOiBib29sZWFuDQo+ID4gKyAgICAgICAgICAgICAgLSBlbnVtOiBbMTAwLCAxMDEs
IDEwMiwgMTAzXQ0KPiA+ICsgICAgICAgICAgICAgICAgZGVzY3JpcHRpb246IG10ODE5NiBwdWxs
IHVwIFBVUEQvUjAvUjEgdHlwZSBkZWZpbmUNCj4gPiB2YWx1ZS4NCj4gPiArICAgICAgICAgICAg
ICAtIGVudW06IFsxMDAwLCAxNTAwLCAyMDAwLCAzMDAwLCA0MDAwLCA1MDAwLCA3NTAwMF0NCj4g
PiArICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBtdDgxOTYgcHVsbCB1cCBSU0VMIHR5cGUg
c2kgdW5pdA0KPiA+IHZhbHVlKG9obSkuDQo+ID4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8
DQo+ID4gKyAgICAgICAgICAgICAgRm9yIHB1bGwgdXAgdHlwZSBpcyBub3JtYWwsIGl0IGRvbid0
IG5lZWQgYWRkIFIxUjANCj4gPiBkZWZpbmUNCj4gPiArICAgICAgICAgICAgICBhbmQgcmVzaXN0
YW5jZSB2YWx1ZS4NCj4gPiArICAgICAgICAgICAgICBGb3IgcHVsbCB1cCB0eXBlIGlzIFBVUEQv
UjAvUjEgdHlwZSwgaXQgY2FuIGFkZCBSMVIwDQo+ID4gZGVmaW5lIHRvDQo+ID4gKyAgICAgICAg
ICAgICAgc2V0IGRpZmZlcmVudCByZXNpc3RhbmNlLiBJdCBjYW4gc3VwcG9ydA0KPiA+ICJNVEtf
UFVQRF9TRVRfUjFSMF8wMCIgJg0KPiA+ICsgICAgICAgICAgICAgICJNVEtfUFVQRF9TRVRfUjFS
MF8wMSIgJiAiTVRLX1BVUERfU0VUX1IxUjBfMTAiICYNCj4gPiArICAgICAgICAgICAgICAiTVRL
X1BVUERfU0VUX1IxUjBfMTEiIGRlZmluZSBpbiBtdDgxOTYuDQo+ID4gKyAgICAgICAgICAgICAg
Rm9yIHB1bGwgdXAgdHlwZSBpcyBQVS9SU0VMLCBpdCBjYW4gYWRkIHJlc2lzdGFuY2UNCj4gPiB2
YWx1ZShvaG0pDQo+ID4gKyAgICAgICAgICAgICAgdG8gc2V0IGRpZmZlcmVudCByZXNpc3RhbmNl
IGJ5IGlkZW50aWZ5aW5nIHByb3BlcnR5DQo+ID4gKyAgICAgICAgICAgICAgIm1lZGlhdGVrLHJz
ZWwtcmVzaXN0YW5jZS1pbi1zaS11bml0Ii4gSXQgY2FuDQo+ID4gc3VwcG9ydCByZXNpc3RhbmNl
DQo+ID4gKyAgICAgICAgICAgICAgdmFsdWUob2htKSAiMTAwMCIgJiAiMTUwMCIgJiAiMjAwMCIg
JiAiMzAwMCIgJg0KPiA+ICI0MDAwIiAmICI1MDAwIiAmDQo+ID4gKyAgICAgICAgICAgICAgIjc1
MDAwIiBpbiBtdDgxOTYuDQo+ID4gKw0KPiA+ICsgICAgICAgICAgYmlhcy1kaXNhYmxlOiB0cnVl
DQo+ID4gKw0KPiA+ICsgICAgICAgICAgb3V0cHV0LWhpZ2g6IHRydWUNCj4gPiArDQo+ID4gKyAg
ICAgICAgICBvdXRwdXQtbG93OiB0cnVlDQo+ID4gKw0KPiA+ICsgICAgICAgICAgaW5wdXQtZW5h
YmxlOiB0cnVlDQo+ID4gKw0KPiA+ICsgICAgICAgICAgaW5wdXQtZGlzYWJsZTogdHJ1ZQ0KPiA+
ICsNCj4gPiArICAgICAgICAgIGlucHV0LXNjaG1pdHQtZW5hYmxlOiB0cnVlDQo+ID4gKw0KPiA+
ICsgICAgICAgICAgaW5wdXQtc2NobWl0dC1kaXNhYmxlOiB0cnVlDQo+ID4gKw0KPiA+ICsgICAg
ICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAgICAgLSBwaW5tdXgNCj4gPiArDQo+ID4gK3JlcXVp
cmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSBpbnRlcnJ1
cHRzDQo+ID4gKyAgLSBpbnRlcnJ1cHQtY29udHJvbGxlcg0KPiA+ICsgIC0gJyNpbnRlcnJ1cHQt
Y2VsbHMnDQo+ID4gKyAgLSBncGlvLWNvbnRyb2xsZXINCj4gPiArICAtICcjZ3Bpby1jZWxscycN
Cj4gPiArICAtIGdwaW8tcmFuZ2VzDQo+IA0KPiBTYW1lIG9yZGVyIGFzIGluIHByb3BlcnRpZXMg
bGlzdC4gVGhlIG9yZGVyIGhlcmUgbG9va3MgY29ycmVjdCwgc28NCj4gdGhlDQo+IHByb3BlcnRp
ZXMgbmVlZHMgdG8gYmUgZml4ZWQuDQoNCiAgT2ssIGl0IHdpbGwgYmUgZml4ZWQgaW4gbmV4dCB2
ZXJzaW9uLg0KDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo=

