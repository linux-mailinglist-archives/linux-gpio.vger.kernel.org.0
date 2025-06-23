Return-Path: <linux-gpio+bounces-21975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1B8AE3652
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 08:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B1EE162A5A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 06:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EED41EEA5F;
	Mon, 23 Jun 2025 06:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="d5b7OIrR";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vbDdUyGn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD75A1D8A0A;
	Mon, 23 Jun 2025 06:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661588; cv=fail; b=cHLmvupRonKXJTeOpfTw2YgOWzLt6aWGSfDy1xS3hF4ilf2BfwRek8AI1o2iOEvI4pMQhJrCKwZI+KsRGrJE9ENFjVP4bIyojqij/UYpBOlmqsTipXaqXtznPVdDPk0dysLaPIMu3gtUOhIYYUnJMONeg1+c4d8pPki3SlWzySA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661588; c=relaxed/simple;
	bh=K/kOKZJp4mGJK5Z78NT0EyrTIkt8bwIzfDFlYKq9NSQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c17frbdaszfSyLKdkINW/8zuFuzropO2AxGzLW9bd+P0fJac3HczZ81aUWBfKTVgwQFSd/q9qIVzbmc6dQFbqWlCCSHLD4u1HhmOsYG+Vrx2rD67RrrqrdLNdozyoAnXuN7FIPnL1eLwORLxkHFocgopg0cDk3PAol+MBHTSvJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=d5b7OIrR; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=vbDdUyGn; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: afdd21de4ffe11f0b33aeb1e7f16c2b6-20250623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=K/kOKZJp4mGJK5Z78NT0EyrTIkt8bwIzfDFlYKq9NSQ=;
	b=d5b7OIrRCHp9mR+yLcFOGmtS5wWC5prfWqkj4KeaJotL6b4LxaB8wQoMGguL1m580VFz/VZddM2KvGoFihtCyhAHZzjuRsNCA1UUYgZCtMEr/csMYd9EwVLmU0HOw5ABpnexufaQl2WslzPF6Ndo7O+xVZ4zY/ESIB/gNOXGYxg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:ff3d4acc-4b1e-4887-a9d6-7a2e8d50793f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:e018e683-db76-4e00-9dd0-5c1455b2676b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: afdd21de4ffe11f0b33aeb1e7f16c2b6-20250623
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1942665531; Mon, 23 Jun 2025 14:52:53 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 23 Jun 2025 14:52:51 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 23 Jun 2025 14:52:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lsc/GiyK/RvKUwVa/AHDTCFo4TWRuhz6XHlDwvv6IUQ2ftQueCX/QsmYgVTG6wRMj1R6Pz0TE1rdxl7jhu8Atb1DepBl6D3dHcVDV/CAhgBmFBfLVeQsraT0uOxQYJ9jTsPjKhBOS78hB9lId9McNrf4yJDrL9oBzIqxjcOG4zxO/AOcEiuIW8oczCKM+iAYPnCG7f34NBcuC3fnSCcr0rhkzoYY8TdQtILI+pgLdBCCK95nGR8yAiskijFT0+V9YZoFUQMl7nyOUyv4wmlGeYoHrzMTTMLmm8jjRWVWh3yhRd2dBkz4jsf5+hiNuHug3qPWfbTmpx292SL+Watz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/kOKZJp4mGJK5Z78NT0EyrTIkt8bwIzfDFlYKq9NSQ=;
 b=o30nZFUMrbxOUaCZHkxN+VH3uFeAnf5545t+d3PtQutAc17hOi8Af+47QxcG+pHJeyaXiGJjtetxCmafv3Shu7GlTolHsTVIjJI9fhBvNOSsbdGWkrtGKuSXeUwOXX0FnLmhLVIP+UodOj1WvXqf2y4g6WsagVPlf2n7dbQWuYSjO098TkrmHRQ8U+UdBUtQRt0uifwEC5eGRtGO9JpvPLea8Mt3O+M155Wi76z+nGoTMm7qcX/HrGkixNcePLQBT/XDqvaoHRcbKSqJTFhEffEui40m7YrHzb+vsqqWzmOd7E6ObtGVI2vhwi/K4BZULdLDm0Tkfy6lV8v/2CYlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/kOKZJp4mGJK5Z78NT0EyrTIkt8bwIzfDFlYKq9NSQ=;
 b=vbDdUyGnesQ7mnFBQIONB8O4eQqha5jWihHcNyNU5a1BFc2uKFrv90Y7yJvo6M83pb7wXaTLh8HSjBmsMDxcU8lNBSkMsxR0IPOCaejPRSb4AA5nk0ruXX60ctMcE49XAYmuVovkvvL/BzYilPn8BYux0PEqcHp8mcwBQ2fOQuw=
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10)
 by TYZPR03MB6768.apcprd03.prod.outlook.com (2603:1096:400:200::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Mon, 23 Jun
 2025 06:52:50 +0000
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd]) by SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd%4]) with mapi id 15.20.8857.020; Mon, 23 Jun 2025
 06:52:49 +0000
From: =?utf-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"brgl@bgdev.pl" <brgl@bgdev.pl>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>, "robh@kernel.org" <robh@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 support for MT8196 audio AFE controller
Thread-Topic: [PATCH v5 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 support for MT8196 audio AFE controller
Thread-Index: AQHb4ce2vvrCAlzaKEugvZ42tbSVZ7QO8JKAgAFiuYA=
Date: Mon, 23 Jun 2025 06:52:49 +0000
Message-ID: <3562cdd32d6f723a35ed063b65560a8e25801255.camel@mediatek.com>
References: <20250620094140.11093-1-darren.ye@mediatek.com>
	 <20250620094140.11093-9-darren.ye@mediatek.com>
	 <011093f8-85a1-4c3c-b3fa-7be9e6df8a25@kernel.org>
In-Reply-To: <011093f8-85a1-4c3c-b3fa-7be9e6df8a25@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7588:EE_|TYZPR03MB6768:EE_
x-ms-office365-filtering-correlation-id: baf01b12-29f3-4b7b-8f6f-08ddb2229160
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K0xjbEJDQzZjTjg3R3I2ak1yNGFMZ2hUV3kwSy9zcmN3M05Sb2NUTVNvbFFP?=
 =?utf-8?B?T1NrQmZMZFpDNVVmdk4zRXg5WUo2QStCWEVwd20yYlJHNFJGL1NodWlXWUJG?=
 =?utf-8?B?aEEvUEEwWXBSTHFpK3pzWG5FNk5hVXBkZmg3VkFMU2l1Rkp6NkVsTzNpWE9k?=
 =?utf-8?B?MVV3QnlUcWNRejRHUThWcGVCWWNUWUZEYS9ZNUtia1NkTFFjQS9pOEUwRTB6?=
 =?utf-8?B?c09wRzFWcm1BeDBPK0UxZEwwYlFZRDNBa3pLNE52NzdxN0dTWE0wVmdva2JP?=
 =?utf-8?B?anVsMmFONm5nYVRlR3FEZ3VTbmxmU2ppaStKbzE4cXNXak0yNklWNDdHL1Zy?=
 =?utf-8?B?Zmg1ajRBdDBwZVFkMXVDbUNOQ3hucWJRWnlTMXNDYTgxbXRLdE1GRDFBZkhO?=
 =?utf-8?B?ekJYa1V3ZXZXNWFyVlhYVDZ2UHVTdFhvUWJwNXFTSVNoKzJGaUx4dmRDWGdo?=
 =?utf-8?B?em5abzBkRnFRbklFYmZNN1ZjY2w4bGpoNmtrbDJ6ZHJqS2MxT2JwOTkrUG92?=
 =?utf-8?B?SHNtamRiRGROOUs3SGpPcFRKRUIvSDZTYTE3bEVkdFZ2ZUFFd3kwUEdxbFdy?=
 =?utf-8?B?ZmFjYmpNZ3lUc0FhbjhDUFJ4UTU0cmJPNE5JOGhjNkw1TGFiYnJZVklocjNu?=
 =?utf-8?B?MnplRUd1Q3JpajBEN1RDR2VvZzcrWHlJT1E3UWdZWmF6YlZxRUFwM0lVMGhq?=
 =?utf-8?B?UGNjMVpZZytORjRMcjczSGpIbTF3eEppL1lTNEdqSDhLYkJRY1I4ZlVlM1R0?=
 =?utf-8?B?UjRreTdhOE5MWWJ6NnJ3VWh5U0o5YzVxVXZMWjhNb2ZIQXlOOHl0TXcyNnFZ?=
 =?utf-8?B?MmJkNHpSRy9kQ0VCcHl2Qjc3VHF2L0ZXOUdsNWZTYW5aUlJIRDJKMURuMU1t?=
 =?utf-8?B?bmZUTDAwSy8vTFpVODNFWkVuOEVRdUlmaTlrTjAzcjFwTFd4L2ZvQkY5bnpU?=
 =?utf-8?B?UG9WSmMwck43ZVJJd3NtWmZGYWMyanNHdmJ3c1RNc0hmTEpOVUQyRSt5dkZ0?=
 =?utf-8?B?Ty9lUDJvR1RtM2IrR3NYVU1WbTNlbXNGSndORloyeHBxRjlDYXJjOUdmWm1E?=
 =?utf-8?B?eWNsRXlGRGR0cEdnRVIyamR0UzVkZ2xaT1VCWTRBRDBhVktXeGNQVUZmVFZq?=
 =?utf-8?B?Rys3cGdIam9kOU90d1prTGZicFdLdG9aeGUwZjh3dE1QUVBqZmVWcHdqUkd0?=
 =?utf-8?B?NStoN1g1VElsZFVMbzRBenZtekJocDdXNzdTV2Q0emd4Y2FCZzRnL3JoOS84?=
 =?utf-8?B?dGE0cFRoRjF2b2dsUi9FZ1BIL0ZSSGhFRHNPM1M5TGtQbXBPajhVclJYUTAr?=
 =?utf-8?B?VXdKRnZkSVlyR2JZSGZuOXNRWHFtc2Jac2NtbGsycEY5ZDNLOGhES2p0RmpG?=
 =?utf-8?B?RWZxUTFzMGxhZm9TZGpMR1ZJMXhVYUd4UGtPR0RMWG9OYjJwdExvNmpjNXBy?=
 =?utf-8?B?RjZUaFlxT29XQXo5UVQxa3JydzBQYjczejJCYStCc3BQNVZRZHpaUVJIbG84?=
 =?utf-8?B?UjkxVkNGelZoT3p1MkQyM1NpUWcxV2ZjTXlnS0xWc2dVVGxYQWhscTNaenJP?=
 =?utf-8?B?QmR0SVNBaXJ1anc5dFFXbmcyK0U2SWZJcUVic0dIcHZnd0VDdjV5YWptWDRh?=
 =?utf-8?B?YUZKWWU4U0wvSmxTUjVoNjMyMCt6bkluUm5idis3SjlBWHlyZnB5aXoyZFJj?=
 =?utf-8?B?ekx1UWt0cjA5MEFsZTBKbWxibGUvK3ViNG5kcDQwNGdJTnRGRmp4REl2dHQy?=
 =?utf-8?B?YkdaRU1paDBuRHBEYjBrdElUTWRRMHlFRndXUGlDQmlMM1gxc2pULzdzczFT?=
 =?utf-8?B?d1dvTHFoTDdqRmpxQ3U2Zndvek1vMFVvKy9iNHd3QmtpeENaTFhVZFpDenpQ?=
 =?utf-8?B?QmJJK0xoVE4wRmJIbkM5a3Fwd1FTWmo5WENIbnJWaXYvS0dpMUdvWTlYbWJh?=
 =?utf-8?B?TzZLN05kbi9tWWozZWd6Q1ZhOXQ5NVJHalRWeDlpd3o4R0dYL3BYdjhCNWtI?=
 =?utf-8?Q?sgBE3Oid7C29YSPS3XuZB1WZvtHep4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7588.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2E3VTFES3J6TGkrU3VvQjJVSEdOYjhGeEJ5dm1EV3ZESXhPSGNuZGhRNmIz?=
 =?utf-8?B?WWdNUDBwd20reitabHpnMUQ1QWtZVjUrQXcvN2ZjWVRiRncwTklmbkRXMklN?=
 =?utf-8?B?R2FiaDhMc1hUU0Y2YXdHUEtCUXkySi9LQXVjVjFDVDNsMkgxN1owTDhZWm5F?=
 =?utf-8?B?SWpVUytIWm5xNmwxLy9UTFc1NXV4bHNuYnpIbzcxRzFhaW1KZ2s1OVFLbVc2?=
 =?utf-8?B?d2xDem83d0dRVHJ6Nmh6ci9nNWo1UzVIazlnQzFEY3Y2d3ZPTGsxU1JkRjNv?=
 =?utf-8?B?WjBCeFMwd1NubEc5YlM4WG54MEtjSUJTWDE1QWl6c0VzVEZOWVE3R3BDanJ4?=
 =?utf-8?B?aTlkaWUveEtSTmR3cWpOcE9sOTBtTmRod2d6eVBxK0JLblkrZlBiNTcvY2FR?=
 =?utf-8?B?L0UwWktmMzV4T0RzRlFmZGFaWUZtWXVMNkxJSWU1bjBhY0lreDJFU1VKcDlP?=
 =?utf-8?B?ZUswTEN4RzlYOW5OTENBK253RVhRaHY2a2wyQUNTbjgwM1d3VGo2RVB0KzFE?=
 =?utf-8?B?d3RjSlAvdGZpRFhIbnM5enVMei9wZGlzWjlraVpsQSs2cElSVldzN0dnajN5?=
 =?utf-8?B?Uy9GQXhYQkVyWkdhMkFDckZHT1VLTzJBaGZ6dndBWXl2R0c2OFYxWVNueEtN?=
 =?utf-8?B?bmFGKzVBb1JwWFBIYWQ2U293N2hRVXBUM3U3ZDhna1R1K1V3LzRXRDg4REJl?=
 =?utf-8?B?dmphNnM5MUJLTTRyTkpVNVc2MmRNZ1ZHcXh5YVlIMDRiUzV4TjBISW13N2Rj?=
 =?utf-8?B?WmJibXZRWU5qN0RFRUxmZjNGaU84MHFTSjNmcUN0U3NnZlVBQmQ2K09TZFdy?=
 =?utf-8?B?aGlLVUJHU3hXN1pMaExXVXVwSlI5WHpna0s5Skx2aGd1Nk1kTU9pMmxxZTdn?=
 =?utf-8?B?ZG96akM3NFEvdmt5WENReXAwbFdVc0xOc0U4cjVveHVQdHVIdVVvclhGbUpM?=
 =?utf-8?B?NUhnNmdCRGxkVkF1VTJjcWVTWXYvUCsvQXVxM2RySytJZmRuMWhpOTgydE9r?=
 =?utf-8?B?cjBKRUVKRG9YNXg0WGF2N1U3OEMyb0JQOWs1WmxxTXhOQW95VEtsa3IvWmRt?=
 =?utf-8?B?QzBMTEVWSUt6T3p4Wjc5cWdnTjhuZUdENXBRaUFFa1JKa21GOExJRXNSWE0w?=
 =?utf-8?B?Mk42RjlLNklHbjJhcW1lcW9HNmlSZVFWUUlaQWRHVFJCMllKcnBOSmNQRWM5?=
 =?utf-8?B?T0ZZM0RiVkt2K2twcXVqOGQyL0JKUVpsVWhzNXdIaGhRejNPdUN5QUcrZEQr?=
 =?utf-8?B?Q2t2emxiUnE5b1lETDRHZ1dFalMzcnhPd21qV1NoRFgyVzFIZU1tbm84OHhp?=
 =?utf-8?B?dGtWb1FPNi9hbWdSdHVYU2YxSkpyNkFyRElrYmtkdmRBYldxOUgzYk92VFkw?=
 =?utf-8?B?bi93bzhrTm1xREtuV3hqejFTMXVZTjFKcEFWVlNzWWg1NWtLTnRuOER1cnhW?=
 =?utf-8?B?eU5zYlNZUEUzdTBpcGRhaFdXSHlydWc4blgzL3ZhdVpSTHZjTjZ6QVM4c2tr?=
 =?utf-8?B?d2p4dUN0dlMvS3orRDVpNDNyTVZoemYwQ2hnYXM3VVJTN1F3UFIwTWczbHV3?=
 =?utf-8?B?aFZ1RFYxSFdRU0FDbFN6R1BxbXZ3bmRTUUhXUHM0WlpxWXRZQklBVzFxQTRl?=
 =?utf-8?B?cEZuRWdSUUY4dSszbFNFL2ZTTlFsa3Jjbm8wcXVKay84TDBwczdFdktTK1dJ?=
 =?utf-8?B?SmxzaEsxSlYxNFkvbThCTHdFVUNDZnI0ampsSHVSdGpiOWFENHEycXJndmc3?=
 =?utf-8?B?TkFaNXRyYjYxZUtuV29WY1NmQzVjdmZkei81WXpMMkN0WHpVSmladGNYTEpl?=
 =?utf-8?B?VnVBeHk4bndCL1lsTHpEbndGcjJtaGU5MC9KRldWWW9wZEVzTDJieUVUUExx?=
 =?utf-8?B?RjRYZnJtTWs3ZGhiOVBFUkNmMTlZdERnZGg2SSs2VVVyc2V3bXgwYVJCZGF3?=
 =?utf-8?B?c1lyUmd0ZnNweHdHYXAxNisxWXpIK1l1b3FaYjF2cE1HZStNdUxzZEtxUzJy?=
 =?utf-8?B?M2pHREVGS0hqcGcyNkxNSnhSeUpPMnN1RnViNWFLUDNqVkMydUxkWUdQMnNT?=
 =?utf-8?B?TXJBa1dmS2dXK2JPRldXUk5BWUdBODMrK1NqL0tnWWlSM3l5b2dOaFZ1M1Rl?=
 =?utf-8?Q?+YJXb1q2DPdx5rxNJR3zPXv4r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE8CFEE5C106F1408A59E90A73D5FEEC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7588.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf01b12-29f3-4b7b-8f6f-08ddb2229160
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 06:52:49.4089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zOQAmQzIOQO41VNgensNcvygGN/HCDgBVEJ/PP+tyRKdldtEWzKy8CtQ9p8Ok6+x61BWsZGznO7OuRJkJYI5pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6768

T24gU3VuLCAyMDI1LTA2LTIyIGF0IDExOjQzICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDIwLzA2LzIwMjUgMTE6NDAsIERhcnJlbi5ZZSB3cm90
ZToNCj4gPiBGcm9tOiBEYXJyZW4gWWUgPGRhcnJlbi55ZUBtZWRpYXRlay5jb20+DQo+ID4gDQo+
ID4gVGhpcyBwYXRjaCBhZGRzIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIGF1ZGlvIEFGRShBdWRp
byBGcm9udCBFbmQpDQo+ID4gY29udHJvbGxlcg0KPiANCj4gV2h5IHRoaXMgd2FzIGNoYW5nZWQg
dG8gdW5kZXNpcmVkICdUaGlzIHBhdGNoJyAoc2VlIHN1Ym1pdHRpbmcNCj4gcGF0Y2hlcyk/DQo+
IEkgdGhpbmsgeW91IGFyZSBjaXJjbGluZyBiYWNrIHRvIHByZXZpb3VzIHZlcnNpb25zLCByZWlu
dHJvZHVjaW5nDQo+IGlzc3Vlcw0KPiBmaXhlZCBpbiBiZXR3ZWVuLg0KDQpUaGFua3MgZm9yIHlv
dSBmZWVkYmFjay4gSnVzdCB0byBjb25maXJtLCBmb3IgdGhlIG5leHQgdmVyc2lvbiwgc2hvdWxk
DQpJIHJldmVydCB0aGUgc3ViamVjdC9kZXNjcmlwdGlvbiBiYWNrIHRvIHByZXZpb3VzIHZlcnNp
b24gYW5kIG9ubHkgZHJvcA0KdGhlIGRvY3VtZW50IHBhcnQsIHdoaXRvdXQgbWFraW5nIG90aGVy
IGNoYW5nZXM/DQoNCg0KUGxlYXNlIHNlZSB0aGUgZm9sbG93aW5nIGNoYW5nZToNCg0KQVNvQzog
ZHQtYmluZGluZ3M6IG1lZGlhdGVrLG10ODE5Ni1hZmU6IGFkZCBhdWRpbyBBRkUNCg0KQWRkIG10
ODE5NiBhdWRpbyBBRkUuDQoNCg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoaXMgaXMgY29ycmVj
dC4NCg0KQmVzdCByZWdhcmRzLA0KRGFycmVuDQoNCj4gDQo+ID4gb24gdGhlIG1lZGlhdGVrIE1U
ODE5NiBwbGF0Zm9ybS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJyZW4gWWUgPGRhcnJl
bi55ZUBtZWRpYXRlay5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gDQo+IA0KPiBTdWJqZWN0OiBJIGFz
a2VkIHRvIGRyb3AgZG9jdW1lbnQsIGJlY2F1c2UgdGhlIHJlc3Qgd2FzIGNvcnJlY3QgYW5kDQo+
IHlvdQ0KPiB0b3RhbGx5IHJld3JpdHRlbiBpdCB0byB1bm5lY2Vzc2FyeSB0b28gbG9uZyBzdWJq
ZWN0Lg0KPiANCj4gV2VsbCwgYXQgbGVhc3QgdGhlIHJlc3QgeW91IGltcGxlbWVudGVkLCBidXQg
SSBqdXN0IGRvbid0IGdldCB3aHksDQo+IHdoZW4NCj4gYXNrZWQgdG8gY2hhbmdlIHNvbWV0aGlu
ZyB5b3UgY2hhbmdlIHNldmVyYWwgdGhpbmdzIHRvIGxlc3MgZGVzaXJlZA0KPiBzdHlsZS4NCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=

