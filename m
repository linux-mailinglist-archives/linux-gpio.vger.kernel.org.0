Return-Path: <linux-gpio+bounces-21355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACF4AD4F6B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 11:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC4E33A430B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7442925C6EF;
	Wed, 11 Jun 2025 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PBlkMG7c";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="acBODIy8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DC913A3F2;
	Wed, 11 Jun 2025 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633002; cv=fail; b=cnQRLC9T1biCDBna274T0V9wq0+g4VACqV0z6Wr0w1Axszl30rEYn8i+WW2W5Dfj6wwVwVIbm364xN15l09M3gEFCkKGNOXyxqJjCSYX9QYK9FzaMLeGnZT7OKBY0tzueoGT+hxyAtE0X2sTDfzsJGUrxHfLWRrKVMVYUBF6OOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633002; c=relaxed/simple;
	bh=qIgG2qtQ024FBBmEv4hiH/jcjPVBlbm4LRcyzlebQwU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FnIstdYItZ9cvQJ0wxAP9QFpg0yfRfTr60pmGbCSCz2EKzVOKt2f8RS7BkDGiR0+/sHlddFKzcjK0fLDZ3CnaJRB1bFj67dQzkNRswhzpsadfyNhgbaxZCS2S5QCQ3qoRF5mlxNgRY6qGyXDntjgFtIPYaipSnjChtXNsww8+0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PBlkMG7c; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=acBODIy8; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d6e2af9c46a311f0b910cdf5d4d8066a-20250611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qIgG2qtQ024FBBmEv4hiH/jcjPVBlbm4LRcyzlebQwU=;
	b=PBlkMG7ccer58RAD464125Sq0s0GPSbut0I9hKL+noFAfFdYPS4X+D+UTOFIrPpb9YkmVayXZd/QcQAdEvBQpZu+cPYplZ+TJIU1mG/no5DgI4d/PbcopJYHS2YktSNGagL27NvG96wpww1Q7hVAp5AzNy87cwQ1/cCcGO5RR8Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:161b3750-16db-4e36-97f7-205e7ab8fc1c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:48f91cf2-fe3f-487e-8db5-d099c876a5c3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d6e2af9c46a311f0b910cdf5d4d8066a-20250611
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1061921879; Wed, 11 Jun 2025 17:09:54 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 11 Jun 2025 17:09:52 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 11 Jun 2025 17:09:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBflZymHq46cIy0ESOSOQGjI+320Sc/jIRnquMJL2lOYuvfhfk54WssxzwKGKWKfO7hmDZ5fGbqKB/Ksnp30HkvvOWc+IuhkYiQu08zEJKA51XP2wmGJNpTnXtYFQws2M76vaKLg4/yCu/8RvVFHOJbXLhjPfBkEP5fVIYuT5j46rCDBAbg6VXbQneY17FuaM0fqwiN+aGvYerWCdX/kctXVd7D1oCMGYm/SXjmHE7rZCuV5XxfHcm+Nlx0/aKNkf5BZlCE6Oz+VfxZoicg85KcCo52uICyOMycauOBDt6tF7WVr9DcabT+HMdJwSoYYtGOHhidMvsatyjX/YGRR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIgG2qtQ024FBBmEv4hiH/jcjPVBlbm4LRcyzlebQwU=;
 b=i+B0oneIuz6QJar9v2dM2BGfSfnBWAnIICGpp6ly9Gta9nS59SVuP9QdqLwJknqUEs263BmqHIngodF5COpIyA3nBb9Sj9T//glItxmA8F0UppvXcMdYez8VVTJVE0eDxu2M68iw8UP1qglrK0Y2OD4UBLAECuWJg3d+p4zR/QmJ7B7aphzFfF30KKd1VKGXILbBPrfCvai/R38jCckeIvB6TXMCfXA0N3ZTcSDXLGl31yLqFoiSBaStRbCFQxD0C5AvY6l0A3MigWr5OGvxUgljxwhNrqQVBi3pk92B8Zso3yZ9zEX8asbf49bdQhS1Dfpqphi+bYFpf3VBANGgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIgG2qtQ024FBBmEv4hiH/jcjPVBlbm4LRcyzlebQwU=;
 b=acBODIy8TGDgtiNDcCUj+S5uGMFnQKdbIx7gVY2oGGLakPGmM8CLDFaRqw1mf8fKwrBzFxOsVeDuomTRKYFFU4etoX2mKdqsH3eCxUs3YKJf+4TmnVJnUypIdE24P5pzp43czVaRUyYmrRnB/uYd/6WfVSzD7G7rVqzOsyOxRdA=
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10)
 by KL1PR03MB8257.apcprd03.prod.outlook.com (2603:1096:820:10d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Wed, 11 Jun
 2025 09:09:50 +0000
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd]) by SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd%4]) with mapi id 15.20.8792.034; Wed, 11 Jun 2025
 09:09:50 +0000
From: =?utf-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
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
	"perex@perex.cz" <perex@perex.cz>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE document
Thread-Topic: [PATCH v4 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE document
Thread-Index: AQHb2epO11AgQpzCSk2rT5vAOXkmbbP9oZyAgAALuYA=
Date: Wed, 11 Jun 2025 09:09:50 +0000
Message-ID: <bed13d4bba5923e0d71a5e32e61163c2e7958d68.camel@mediatek.com>
References: <20250610092852.21986-1-darren.ye@mediatek.com>
	 <20250610092852.21986-9-darren.ye@mediatek.com>
	 <20250611-private-magnificent-asp-63ef5d@kuoka>
In-Reply-To: <20250611-private-magnificent-asp-63ef5d@kuoka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7588:EE_|KL1PR03MB8257:EE_
x-ms-office365-filtering-correlation-id: 59cfbfd7-8432-4b56-41c8-08dda8c7b87c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bVJWdFNsV1pUZFQ3RGdUcks0dFJoQjFoV0U3Ky82U3dWODB1MDJOQUpWZ3Rj?=
 =?utf-8?B?TlZOOUFieDFsbVlRZVhzdDcrU3N1eUJMZFdyYTA1ZE5pU09pWTZPaGZlV1BS?=
 =?utf-8?B?VXBIMXVrb0ZzWlEra3hIL1hmaG85d2NpdGFZeEpoSXUzNFNIZEl0dzBXcVJR?=
 =?utf-8?B?ZkV6TnFDV0U5TXBvS2xVWERpWDZNNElsVlQvbEkzTm1EZHo1YzMrK3lUZ0Jq?=
 =?utf-8?B?YXVTZXhRM0lsN3hvWDgxS2t5TnMyM3ZPNmdIRkhrYmQ3Z042Q0hRZU1JWEdu?=
 =?utf-8?B?QnhmZ3JmcEtrMnIwcDNoWlRLQ2hGWTlpK3hIcS9teTFwYUNVV2FycktSS2s1?=
 =?utf-8?B?WGFSeXlmdEtLcnJHVHJRV2w1NFFVcWI5UVowdS95ZHJxYUhsTUJiaTltMlEw?=
 =?utf-8?B?dmhGSnU4V3J4dExsa3UvdXp5c2F1TW5qdkU0T201dWJZTlZDS0NXWDM3V0t2?=
 =?utf-8?B?V0lLdEpKRUYyZlFzdkJadXpBbms5QlhhSTE0NVRPaUZHOFpOYjA0ME1mR1RH?=
 =?utf-8?B?RWR1NVB1enN4Mzk3eVZZM25wa3BZUnNxMWRuZnZ1N2NIYVpmZ3dCUUpHdG9x?=
 =?utf-8?B?dlJHTFFtZzByaVJYeE41VFJpWFpuVXQvbzZ2UXNRdjhyNysyUnNnck9GdjBF?=
 =?utf-8?B?SERJTmFROWo3anhoc1FvaFhZUWJQNk5DQ1lBT1g5TkJDNmhyWTEyeHh6MXlm?=
 =?utf-8?B?WTZZaVgvdkV3TFBKTlIzOXhFajI0c0I5K2I0TDBPRkVobWw1dTVwOXkvQ2U1?=
 =?utf-8?B?aENXL25XOEU0VFVlVUl6d3prQmxmMjJHWEt3ZDdrQk5wSGpmZDd6Z0ozYjY5?=
 =?utf-8?B?SHBoRjdRNjliWmRVTkRJWU9DaWQ4eWkzdDVZcGdFVE5aWWg5ZFJaVU1DYTNX?=
 =?utf-8?B?b2d2Vnh1TUdaSTFaTjBMc242WWIvVCtwZDF6UVZPeng1Q3lQTXNsVXBkM2xQ?=
 =?utf-8?B?d0xQb3I4aTVHK1NpVjlHNGNYRjg3UVBla0JjdlpFSHBOdEFEVTRkZnp4VjBY?=
 =?utf-8?B?K0tFY1gvU3hrbUJZQ2RtclB0MUNBYzZmVnBHbUk0b2s1K1NreEZ5VTdTZEc0?=
 =?utf-8?B?NVFlWDU4SlRBODVEZnRmMm9rcXpNU0xlaTJkSjdQWmZjYUc5cFlmWHpQcTVt?=
 =?utf-8?B?Y2RuejIxSUZlSHRvcU9kZ2F5VWlGUWdMMnhLbjhCK2tLc2J1SHhuNGRSakRW?=
 =?utf-8?B?ZFg4cHZSUVBoY2RnRVdUaWkzTkZ0bkFNYjhoVyt2MGt3UXVZZG00VjBlQ0lK?=
 =?utf-8?B?NHlqSElDSFp3RVFrVWhwYlluMXBwTGEzZ2dKalZubG9qOFhNNXljZEtGSXBU?=
 =?utf-8?B?dW8ybFl5VUNnOXg0SXEzczJmL0dYbDRxUzRLZ0ZtY1IrdlRtbVZFcEtKRFNi?=
 =?utf-8?B?SGU4bzlDTmhXNkVmbXRqWUkwbEpGOTV1YzlxSXhsMzd6TnRWZUFlNXFCT2cy?=
 =?utf-8?B?K0ZvRlZET2o5a3luV01WUnFWakN4UElJSnhqc2RtYkRzS0ZNd3VBTlVaeWdv?=
 =?utf-8?B?VlJHQllzY0ZBbitxMkVwb2U2eVhuYkkxd0RoTnlDVnJ6Zzh0ZndCakdzMlNa?=
 =?utf-8?B?Q2VFdmtuMWNEVmZMb2JrUWxMWG5xVWxDc202c2NUd2JZTzNSVVB0UUhnT3ND?=
 =?utf-8?B?RysxMGFtbmsxQUZSZzU4OU04YktCZm42c2NaemJlc3VNZ3NBQkNUa0ZreWpL?=
 =?utf-8?B?U1pobDE4WEN3OEdXbld1aDBmVEZkQ29SaFIxY09STzdxdnFnK3ZCQXVUSVhy?=
 =?utf-8?B?M0xtSHJpd05lVVhxVEJua2lvVUdlK2p1dU5ucVZDdUxQY3R6eSt1NHVjRjho?=
 =?utf-8?B?b1MzU2g4dGNMQzY1c1h1SDBicG9GRGlibEx3d1BtM2FUaGlGUDl4R05UNVl0?=
 =?utf-8?B?OHpkK2R6dkJKa3NyamtvVDUwbEtUdXNuZGJkY3JXSjdvTFRidGNsSXozK2Fu?=
 =?utf-8?B?R0dWV3ZGMUpVdDg4Tm9BRUFxNXRUS0Q0VFVkQ2NoTkIvY2tDaWxrSWkvZUJv?=
 =?utf-8?B?SHY0YUFMcGpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7588.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2JTQVk4T2xqVmJQZFg4ckJGOGVGUG54WWVSZlg4MjZvUnZxdnZxaXpQK1ov?=
 =?utf-8?B?a09INUwyRytJUklvd1dsOE91bnlXb2JmVDFSWktUTDFWaFhiS1RmZldzS2dy?=
 =?utf-8?B?K0RiWFk0emFNSU9DdllQMkpwNWhnbElMNHkwOFJReFhaZks4VGtxREMrOFlE?=
 =?utf-8?B?d1l3K2VkNlk2VjAzbWwwY0p2NXcrNUg2Z3FJUndiN0tJejJhQU85UXhJYm8w?=
 =?utf-8?B?elpEYmh0bVNxRURjWVZ6YlQ3V1JGNHdYNC9GREkycCsvWnJzemRuNzBFRXEx?=
 =?utf-8?B?UUdxY0lxL3VEckQvelFDMzZ3NUw3Tlp4UjI0NndlVEhxTDFvSnlCblpSamEr?=
 =?utf-8?B?NEt2dmNleXo4VnF5S0N3NDE3ZE5wSW9udE1wbHBrTWxvcXRVMVMzZ2F0alhB?=
 =?utf-8?B?NllpeWtnTnFiYnB6M0YxTWVYUkk0SXRhaUIvUXpBSUhDWFN3NFQwSUVGeXRo?=
 =?utf-8?B?OGI5akxTTjFjOFVRcWhvZWptV1QwT2IvY3Bmb01KYkdkODJYYkVYYitsZjE2?=
 =?utf-8?B?T0hTUWxDWGtEMm1WOEQyVWtDMGU3NCtlcmtKWTRQVkZMSXF4TTJzUUdIRkE1?=
 =?utf-8?B?Um9CT3NHb0JOekVMZ1JpZzdVUHNwejBwQmRKL3NUNTF3TEdvRnhaNWcyeXIz?=
 =?utf-8?B?YzQvRHVNbUQrRW9WL2dBSUI0NXY5ZzhqMVhyOEd5a1lnS29wTzkyQmVQV2lJ?=
 =?utf-8?B?S3FlUmNPZmN5YWVvVGo3b1QrVTVpKzNURHRpd2lQeUFjYThaWnNhRzBodHZj?=
 =?utf-8?B?MVJDdXRJQTkvL0cvQzMxRjVVQVl6U1FKRlYveEJzK1F1VWxUbU8yNFEyejFN?=
 =?utf-8?B?UEFUb0V0NmtRaGJHdlRJajZtc1BBY0pxUFdIUFU0ZU5vUjlFUHFGWmpUcUJX?=
 =?utf-8?B?WjRrV3pPb3hQUUhoTGUwQ3NSUnZNcGJVMURwQUFFdDFIL1d4RkpWNmMvemhO?=
 =?utf-8?B?UWdxWkdGb21iWnpyMGJGazFsRVhIa3hqeWdLUy9wMU84NWs1N3p2bXgyektG?=
 =?utf-8?B?ME0xS3drK0xhZi9GQzlKUHJ1NUU4WXVEcXFYTC9iaU53R2hpS3R2SE12aXJy?=
 =?utf-8?B?Nm1ZVHVNVzRhY2paZFFxNnUxS3RCaWR3S1VWbkxFZ0dibThIZVlFY2ZZNWVJ?=
 =?utf-8?B?Ukg3TjZ0Rk5jaE5iNHBKVjFKa3d4MENHTXNuQjlMYnMvdHlCanVqMHdCOG1S?=
 =?utf-8?B?MXFqcXNhbStaWjRuVHlZNGVXeTNIcGQyNVU3Q1pQN21MQnU2eTFxVU90RFRx?=
 =?utf-8?B?b3BvVUN6b0c5SU5YeFc5MUxUa1MvM1F1VDNNZUJlalJzMk5BRFg5bHQ5NEZI?=
 =?utf-8?B?YXJPS1MxajJvTHJGODhpQUwzM1o3TEF4NXRrSHZQd0RwSHJMZ0VOK0g1RHd2?=
 =?utf-8?B?UkJPN1NsaGxXSVNOTmpGajE2UkxyTERaRWhHanBpVHdUeUZGVnY4SCtnUVNZ?=
 =?utf-8?B?b05wT1ZtUkVva3RsbGVxR1dvcU9aM045THBzbmR0b0VIZlk3djFEK2JGcURs?=
 =?utf-8?B?REozdHFRZU0rOUdIU3lWcVEzMHpaOGhRZ2N5OWZZVHMwVVdYRWpOWURnSzh6?=
 =?utf-8?B?bHUwajVuaWlIZDNRU3duekJ5bjIyS0NCQW1vS2V4UXd5SHlEZjk2Rkl4UDVG?=
 =?utf-8?B?L1dsMUNiQTV3MG9KalZRSmtNWU9oOGlwaXZwcmtQOVRjeDAvRmdCKzZzWHJB?=
 =?utf-8?B?dEJDMFpUcVh6WXNHM3NYamcwWjVPa1NmY0JhcmRBTWpPT0NtZFhqdTA4Y2Ni?=
 =?utf-8?B?aU1FUlhJTHBKSm91UFJQYU96TlFYQ3JpYk52V05hcGpVc3NOOCtXK3lpM2s3?=
 =?utf-8?B?djJNSHNtKzF4MVh3VE9yeVdteHZocUxYTCtuQll3bElTalArc0RlclRqSjhU?=
 =?utf-8?B?UXE5NjRodHlVZ0tRRWRRVUFIckx4T3VHaVhFc3E4RmhTY0IzZTZMNXpSelEw?=
 =?utf-8?B?TncrL0NRM2ZQYTFiQ1NYUEJQNEtIQzdzOUo4djA1UE9UeGJ1QTBqTEh0WHIz?=
 =?utf-8?B?N0ZzNWZEU2pvYmJWSVlqaTF3RnJJVHZOWUZqRWZoZ0ZDVnJHcmVwbWJTWEps?=
 =?utf-8?B?Q3dQSmtOWEZVbC9lbk84bXdCczJPTjNHS2M4bmFzT0lxa0RmWjVrdnZFQWJi?=
 =?utf-8?Q?JNXJAU+nrCFzu9t9O54xHJnAt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <174582FED84BEE47BF943D572274842F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7588.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cfbfd7-8432-4b56-41c8-08dda8c7b87c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 09:09:50.3239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1UcKl2JB2M0ohlGlpyfmwYX9wxrlZDrEsYaC/gz1LgWDrhkdQoBKW6YCGB8JnuoRBcQIeouOsdY9ce9X/TOlRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8257

T24gV2VkLCAyMDI1LTA2LTExIGF0IDEwOjI3ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIFR1ZSwgSnVuIDEwLCAyMDI1IGF0IDA1OjI3OjI1UE0g
R01ULCBEYXJyZW4uWWUgd3JvdGU6DQo+ID4gRnJvbTogRGFycmVuIFllIDxkYXJyZW4ueWVAbWVk
aWF0ZWsuY29tPg0KPiA+IA0KPiA+IEFkZCBtdDgxOTYgYXVkaW8gQUZFIGRvY3VtZW50Lg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERhcnJlbiBZZSA8ZGFycmVuLnllQG1lZGlhdGVrLmNvbT4N
Cj4gPiAtLS0NCj4gDQo+IA0KPiBJIGdhdmUgeW91IGRldGFpbGVkIGluc3RydWN0aW9uIGxhc3Qg
dGltZS4gRGlkIHlvdSByZWFkIGl0IG9yIHlvdQ0KPiBkZWNpZGVkIHRvIGp1c3QgaWdub3JlIG15
IHJldmlldz8NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQpIaSBLcnp5
c3p0b2YsDQoNCkkgd291bGQgbmV2ZXIgaWdub3JlIHlvdXIgc3VnZ2VzdGlvbnMsIG9uIHRoZSBj
b250cmFyeSwgSSByZWFsbHkNCmFwcHJlY2lhdGUgdGhlbS4gSSBtYXkgaGF2ZSBtaXNzZWQgeW91
ciBhZHZpY2UsIGFuZCBJJ20gdmVyeSBzb3JyeSBmb3INCmNhdXNpbmcgYW55IGNvbmZ1c2lvbi4g
SG93ZXZlciwgSSBoYXZlbid0IG5vdGljZWQgaXQgc28gZmFyLiBDb3VsZCB5b3UNCnBsZWFzZSBw
b2ludCBpdCBvdXQgb3IgZGlyZWN0bHkgcGFzdGUgd2hhdCBuZWVkcyB0byBiZSByZXZpc2VkPyBU
aGFuaw0KeW91Lg0KDQpCZXN0IHJlZ2FyZHMsDQpEYXJyZW4NCg0K

