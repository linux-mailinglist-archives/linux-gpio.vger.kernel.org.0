Return-Path: <linux-gpio+bounces-16783-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F66A49418
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7366D3B203E
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F45A254863;
	Fri, 28 Feb 2025 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JQOkd/Y4";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="V53b0F/p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58905253F13;
	Fri, 28 Feb 2025 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732879; cv=fail; b=WbACCDmQBSI18U7YjI/aoemWzY2HarEu0CgIBYEd+dRvU9w3vdVEM7BZSzFY8HwUjLIRbF2DW41n8HgNZR7D6Q+8raRCw0KtEbv7ziYSnOD815zgErGJEH4JWm+uk7l/d6ZUrriLM2V/M5vOa9a/MprKVd1q4YL39uqHLoxV3t0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732879; c=relaxed/simple;
	bh=H0N332cUAwyMj4PmHbdrz0tjWE0qS1PM4OWbDjV/nys=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HfG3/2lWjJxytSsXRaBSY0w8qOl1igFoW1MMRw1hqc47i1N77oWtXBISZjYtE5JDDCArn86FRILeKtD4I0oUO8oP3b6p9P0fs1PvR4lxjqw+TAz4P1l7PJC0EjbemSpVJ4+DtW/AHEDuCLMTrOjXhEz7CmqVr9Q52oIgwpFfhfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JQOkd/Y4; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=V53b0F/p; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9f692c82f5b111efaae1fd9735fae912-20250228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=H0N332cUAwyMj4PmHbdrz0tjWE0qS1PM4OWbDjV/nys=;
	b=JQOkd/Y43lDgsroZNv/E9KbD3bSXsa3ChNzUiICnAdLc+0j0Vs9VbOnetcwSjwkw5F5qgvNMw7UrM0i9dwMb9dtxgMl3SvzfxU4p7bOf6ihMgqnGdkJA4TfF3MhHdqiC598iRBVcaOeM9Uh2FNucq4maQBREpLoJkzGavNave9A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:7f114ce1-4682-435d-85c8-1959166e7e01,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:80e8a9a4-5c06-4e72-8298-91cabc9efadf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 9f692c82f5b111efaae1fd9735fae912-20250228
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1134552668; Fri, 28 Feb 2025 16:54:30 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 28 Feb 2025 16:54:29 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 28 Feb 2025 16:54:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpUwYCPL8Iz5VEPl0dSfgaTwsA2Ka2mXsielqvek96A9P5MWFcOJeAlx3BcmG4Fu928i2XHljCLybODLuO1L1ST1NGNDDp/cqx5I/HL68Wno2zho4cAPC3pn+IFlIt6wARwbQRNBPn9rRB5thwrPVRgGMu3bo2a343exo5GG/zZgfvrEC7/dm5ak5zswGkR48DI/M3+IlzAnduFYpjqll4zAWK7EsnZ0oUrxTgW5YZZrdVMWJpuG8bfk8zJ8QAxTGXbMXVlmY5o4dji1IKVxvghpIJcnJXrS6TSCHC0g5puyCpw46X9xx+wahReiOhaS7ICORGYVtfPN6njxYRFnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0N332cUAwyMj4PmHbdrz0tjWE0qS1PM4OWbDjV/nys=;
 b=HSIu/mqY0WEjmnetWObos43nUvKToXa5/fN7EpMafl09/CihUo/lrHR3pyX3aO2psSdbEjbTKYtwKfdncDDf/HBL657/eBBGuOS7Cor97jmaNiXSt6D/ZLI4BL8i7QVt0oTChewD7SRfZqDYcNXvzjTGMP7Vr0d77DFIlpjl1je9o5KgAfxa2cwT5wpztJ7aiHQpYPzUIG8ZxHkRsWpJau+LgpyCV0yJuua7xQSigArhLBAC7FyGytI23QLkY53f4GJeedufRZheOYBWt1hArK0YzQWSs5jDGaXM2DGpx7lrWfUu4jWbCy5DqMbZlB6DpcZLtzQT9FcfY3G8O5lX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0N332cUAwyMj4PmHbdrz0tjWE0qS1PM4OWbDjV/nys=;
 b=V53b0F/pIBiuA2dQsm1XpOIVpKzhf/n+5At4K3y0kFNuXm8yTXEmLG7bx6FzwBdsA30ThjWbbo8ZsvESqkbJAM+Hg+XrLhwKhaY0PJUHbTWtQFQjto0nfLw11M68NKEXHUj/LEr9x5rwo8mMT+O2cyvOgiXGacb3NOiczDhsPpo=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by SEZPR03MB6891.apcprd03.prod.outlook.com (2603:1096:101:a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 08:54:26 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%2]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 08:54:25 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "sean.wang@kernel.org" <sean.wang@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Thread-Topic: [PATCH v4 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Thread-Index: AQHbiX7EGXUdi4vVl0yAUIn/baARnLNb/UqAgAAMsACAAERZgIAAG2oA
Date: Fri, 28 Feb 2025 08:54:25 +0000
Message-ID: <065b0a342d251e1af6b90d4d3e3988971726b8cd.camel@mediatek.com>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
	 <20250228011702.16493-2-ot_cathy.xu@mediatek.com>
	 <174070957527.867625.13463640154036333781.robh@kernel.org>
	 <d5bf6e1b6c277e6431cffeef66a4766f59f94fe5.camel@mediatek.com>
	 <20250228-encouraging-trout-of-action-cfcd5a@krzk-bin>
In-Reply-To: <20250228-encouraging-trout-of-action-cfcd5a@krzk-bin>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|SEZPR03MB6891:EE_
x-ms-office365-filtering-correlation-id: 92baa052-01bd-417c-f2fa-08dd57d580d7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UGtXRjQ3ZzdkYlNNbVg1NVNkdVB2eGhsalRYWUtHMjRNYVJWRUt5T2Faekgr?=
 =?utf-8?B?Q3o2a2c0cnJrVFllVHBlNU1LWjQvVUlnTGhQNnBIcFFJWG1ScjNjcFlvM09C?=
 =?utf-8?B?QWlQNzF2TmNSQ1l3cm9OYUhaVjNyZzFYdGZ3UENucTg2VE1lcUZsbTh3aDlS?=
 =?utf-8?B?KzR0QmsvUW9QTU9xVmlJSklwZVEwTWloL0pXeE9xYVA5dGY2eWpVblZSZXhJ?=
 =?utf-8?B?YlM5cDF4RXhoQnU4QzFCTnA2UkhnQjBXWStmTE9HNUpnSHBBZ0lqMkNQWlND?=
 =?utf-8?B?TnFTYU5Jc3V0eUdyajJwanBwNk4wSUxCTlRZZ3krNG1XRHU1c2pmMnFOdWR1?=
 =?utf-8?B?SnVJeWdnMXdwYXl5ZytWbmRvbFFDaVk5TnNMZXVwNFFCblh0Nkk5MTAxMllG?=
 =?utf-8?B?dTlWd0k2cnFCVU1XanRnZnhsVkhEZEF1SjRKRXpSZllUSVJZc3NaTDY5Z1JM?=
 =?utf-8?B?a1UwQkNNUEFGd3hDNmV5Q25TamtNYjd1RWVnVWxCU1JSRUpRSE53bG9BbERx?=
 =?utf-8?B?dzRaNG5McW9zczRXV3MyaHBPUkZxUVkvVzg0V2VDYkdtd0Q2MUNpSW9YMThE?=
 =?utf-8?B?elg2am9iV3NQc3JRYWs4RDJzWWZ4WEZSam5XYjNtZEczYWhMNElxa3FubUJN?=
 =?utf-8?B?dzd0SEx1b0pQYm8vMWNjaFJxMkg5dFFGam1LN0J4NmgrcEM5VWkyWGY2OU45?=
 =?utf-8?B?WU03bDEvbGMvUGFQdVFFZFdCQnV6blV6aU1nbXFPZ0RtNkNhWDdkME1rTjZw?=
 =?utf-8?B?dnpvekRIOGlMakwvS29tMldNZENucVI1cEZWV1AySXlPdTZEMVRXTXNlckZm?=
 =?utf-8?B?MHJIZ2FEZC90UGtnR1lrcmltektCSmFnOTBVRGNYbkxhalpJY1VRRlJUcUhR?=
 =?utf-8?B?d3VZb2lXSW5KL0JLL0lsRWNPMFRaS2pHZVBtWjB4K0NxeDdMdzhqZm1oeDh4?=
 =?utf-8?B?Nk9EQ3dGMXAvNjhMaXJacTcvVUF5dXFqYk9xbkkvcVhxbzNaRWRNMXFJWHhx?=
 =?utf-8?B?aEdJc2srYm4xNjZEYS9QVmpId3liOEl2VHg4Q0FHbkdveDh3TGJFaDErWUEz?=
 =?utf-8?B?K1dZYmNiV3VSQU9NeE96OTh0ZVNDTHg0ajN3ZVY3MFZJM3MxaVhoVXZ1VEp1?=
 =?utf-8?B?T3V3S0hVU01Ya0lNeWk3YWhYSVVZV2UyS1NQcS9qTklxRG1sdXNnZzFFL0xQ?=
 =?utf-8?B?Skw3cm8yaitnOWZ6cW5KblFpaVphODdWR3VIOVJ5ZGhhU2szZS9NcXpuaGR1?=
 =?utf-8?B?M0pNRGRDNkQ4UTdoUFFUV3JoRHNHVytVMVIzU0N0VjBoTzhnSlVpdXlJYklh?=
 =?utf-8?B?Z0Q3elV3OW5qUWplM2c0c3hBTTZ1NlhuV3cxSHUrSmFRWkJvTGE4S1JMNVRr?=
 =?utf-8?B?NmsxRjVYUW9EemVidjFuUGpvT1V2K2pZaURTM3RNMWRzbi8wMUVHbTJGUm5J?=
 =?utf-8?B?US9zNkdNVXdGRjhJcFViWVVzNGU1d3RnWGZuMnNYb3pEa01BWGJseEFOeHlC?=
 =?utf-8?B?bVdBSlZpVnhoMjZmcWVQc1ZhKzZ1cGppL2Fhc29ZUHdORStqZmI1K2lrbEhj?=
 =?utf-8?B?bEE0N2ZSZEZCdURsMXhZL1NSa0JSejRrNTI0RTRidTR5aDFVMTFGNmpPSG1X?=
 =?utf-8?B?bWRIV3NEZitnanJGWFFqL0VzbWc1OWw2N1NoTFVuNlAwY01UUnliam52TnQv?=
 =?utf-8?B?TmFtTjdwbVlic251cDRaYVB3UHZWVEYwdS9lVnJOUXJVQjBBY0hSbmlWcWdr?=
 =?utf-8?B?bUQzc25qWVVYbnBrOHNJZHQxakxiNENVd2dzWEhPQlB2YStWemxqZ2l4NzBj?=
 =?utf-8?B?dG83RWZqUVZpOFVveENOMjBTWWt6UlNhZUttTERQaWVUL0tQWklERjhadGR5?=
 =?utf-8?B?bTdUUlE2T3ZCWXFQZ29nOFdibWUrNHgwNEJkeXQwcVpFRDQ0ZDl2RHhRZlFt?=
 =?utf-8?Q?7tFoLCuuVBneZKkiuZnbdU+67uY7jEeu?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnUvbVBhYjJ3WnRNbEMvMm1CenE0YyszLzVpNjZrbUd2cXVzOW90YU1SMzV0?=
 =?utf-8?B?VWxUaXlSdTg0dEp5UXJlQ0JxZnpycTRGUy9HSHdpV1FHaXVKMTcyR1BHM3ZV?=
 =?utf-8?B?WUx1WXpTYit2akU2MVNSWnA2V3FNbEtaT0hyWTZZdTcvZkVncnBRNEhGc3Ni?=
 =?utf-8?B?b3dyV3JJbkhJM2xHbEdWQ0gzMG5KelhjeWlyMWJwQVFpYkU1dU1xR1lTeS9t?=
 =?utf-8?B?Tjl2MSsvaGpNZmxxb2VrSTNHaWo0T3U3SXpvUlcyaEwzMFhka1BSdFJYdGlK?=
 =?utf-8?B?NUxDWDF0QzJjODJ4QTlNOUo1L0FaSzY5TnkzYjdvWk1UMFllRmRKNDljNnd3?=
 =?utf-8?B?MDhhaWdkMmZ2K2pXc3p3L3hkdlQzanZlMlZMb3ErbVI5TFY0bjV0MHMyRUxa?=
 =?utf-8?B?MVcyNUp0cFBhT0xJY2pGc3pvSzZtQjUzMXlnUnFxRmkrMlQ1c2VUWVh3dG1k?=
 =?utf-8?B?eVBNOTFJVnkzMGhNZ05hUTBqZTh3UUVLRC8rb04wVTZack5qZ2txaWZDZFNv?=
 =?utf-8?B?NVI1blNOeG1Iek9maUFsR0VFUnhTUjJzVmxSU2hiTDRwTDlETWpvOEFUYTV3?=
 =?utf-8?B?MlhSQVdnUVNPWWQwN3lwVHVEdC8xSzVGa2NGZ0F5Q2gzUGkzeS9VYWVjbEtN?=
 =?utf-8?B?SmF0MDZ4clhmZXloSFlQeTdsQjNGYXJ3dlYrQ0REQWpsUERDT0xjNWJDL29r?=
 =?utf-8?B?WU1zT1NmYXFWNStZNEgxKyswMi9QcmhyTld0QSt4bmdpR2Z1U0ZDcGwrZmRa?=
 =?utf-8?B?am45RnFWbWJkdEY1bEdoa2tYSTdqQkFiYWJWUVRUeEsxN3l0WmFPZWRsVSta?=
 =?utf-8?B?aE44ZjhHc0E1dHYzTkRmT1RXWTBqbCtoQlNsOTM3RkVZSzA0OEVWSCtmT0RH?=
 =?utf-8?B?bXRvdDVhK2duaCtuSzVWb2FOaENQcG53Ym80TVBtZ1VzYXhPL3FhYXZ3cU05?=
 =?utf-8?B?ZGVrbW40QnREamt1TlZDamJDaGFZaElneGlMK0wrSGw5eXpxMjJXNUZZVFdr?=
 =?utf-8?B?cFV5djZ2Q0kwTmhKM0JFeVYzMGxQMlN3bnJvT0RNN0VDbWgrNTdRN1pFRGcr?=
 =?utf-8?B?dlhPa09IYlpDM0xEVDNMRnN0NzIwdEdVMDJHOXJWWEJJMHUwVHBLN2J2L3Np?=
 =?utf-8?B?bGowTzY1N0lTWDVYOHdKTkE0VWlxL2lJWll1RTU3M2JRQTJTdlJyR0JERk8y?=
 =?utf-8?B?eGN1emREaktGMk5FUHRBYTQ5aWYxT3VTRURnelFOSGRTMVJMOTRmTFNPdHNQ?=
 =?utf-8?B?c2h5cFkzSk5CRlVkMUdkbEpjZkI3bFVDOFVSRGpIYkkyUEJyNy9kU1ByRlVo?=
 =?utf-8?B?Wk1qcVlhWWo0ek5Ma3VQeThjZVdHR1JDQWord0hTckdScHFVNG5INGh5TXhp?=
 =?utf-8?B?TTlXQTRNei85bEhBVTg3VXdXNlRzdmNMTWM1UmhHbERwcnBmNXoyTlhhZUpw?=
 =?utf-8?B?dDU3ejUvblJqUDdQK3ptNW0xUEQvTnJlM3JRYXdnUjFTYURFZmNEcFJTQUdJ?=
 =?utf-8?B?eUVtMFdQMTM0Skswb1NpWG1zMlRzMmZMb1YrYzlOQlNIaDZvZ0hDeTRnU1NC?=
 =?utf-8?B?RXR6dkNKMUVxbFlBeTZCRVF0cFpScFlERnlUdFcxNXhMN3hxMnBCNFNEWnBF?=
 =?utf-8?B?ejdmemN5cThZc2xieWJTbmFzV24yUnBlbS80YzM1QnF6VWtxeEtsejBvTW9l?=
 =?utf-8?B?bStTdGsrSkNjeldjUnFaeDlmSkpwYy94b09BNnpDaHVaYmgvQWswNnhNdzVa?=
 =?utf-8?B?MmpBdjBuT1VqTkZUVlJhZGxEZVNybmZjK1dzbThIc2RBV3poL0hmZG9VS0Va?=
 =?utf-8?B?MU5SRHVNNVNWdmNTMjA1cWtnNldLVlRSRGNMcTNxaEV2eUE2MUh5TTh4M0JC?=
 =?utf-8?B?SDU3Q0NJQTZWUjNtcGNqa3NRRmFSQUhrRXRtYmVqT0dHVDkwemZTYW1Cd3hv?=
 =?utf-8?B?a2FQQ01YZUg4WHdzVXhDdytsRTNhc2NuQXM2OU1XdVhuUXhvS09XSWZ6Z0ZP?=
 =?utf-8?B?S01hQ0s2WU5hdGlFNXFpZjlPa25GSkVaYmY2TUVZQjNwbnh1UXQ4bWhnUVRy?=
 =?utf-8?B?dE8rc2lNdkdlcG5QaWVxT1c1Z1hqSlkyajFoYzNJMkFRY3g0aXZML1E2cHZa?=
 =?utf-8?B?Z2ZIT21mczBwc3lkdEN6VEZSaUlvalpPWkVJSHRLam1IREN6UHNVRkcyYjNO?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F9DE13D4175524D8E02B8EE57600C18@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92baa052-01bd-417c-f2fa-08dd57d580d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 08:54:25.7479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 204AHd32GFhIAx9s/X3GoY7hYwHQEGLlKj8wEZE37medPN7U/gFnVo/dEmR+XaBJNnZN7OcQHo6xXsrzM7CJ3VPH9bSPlQWFaBueHwN85kA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6891

T24gRnJpLCAyMDI1LTAyLTI4IGF0IDA4OjE2ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgRmViIDI4LCAyMDI1IGF0IDAzOjExOjQxQU0g
KzAwMDAsIENhdGh5IFh1ICjorrjljY7lqbcpIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyNS0wMi0y
NyBhdCAyMDoyNiAtMDYwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3JvdGU6DQo+ID4gPiBFeHRlcm5h
bCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cw0K
PiA+ID4gdW50aWwNCj4gPiA+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNv
bnRlbnQuDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gT24gRnJpLCAyOCBGZWIgMjAyNSAwOToxNjoy
NSArMDgwMCwgQ2F0aHkgWHUgd3JvdGU6DQo+ID4gPiA+IEFkZCB0aGUgbmV3IGJpbmRpbmcgZG9j
dW1lbnQgZm9yIHBpbmN0cmwgb24gTWVkaWFUZWsgbXQ4MTk2Lg0KPiA+ID4gPiANCj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogR3VvZG9uZyBMaXUgPGd1b2RvbmcubGl1QG1lZGlhdGVrLmNvbT4NCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogQ2F0aHkgWHUgPG90X2NhdGh5Lnh1QG1lZGlhdGVrLmNvbT4N
Cj4gPiA+ID4gLS0tDQo+ID4gPiA+ICAuLi4vcGluY3RybC9tZWRpYXRlayxtdDgxOTYtcGluY3Ry
bC55YW1sICAgICAgfCAyNDENCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMjQxIGluc2VydGlvbnMoKykNCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiA+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9t
ZWRpYXRlayxtdDgxOTYtDQo+ID4gPiA+IHBpbmN0cmwueWFtbA0KPiA+ID4gPiANCj4gPiA+IA0K
PiA+ID4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2sn
IG9uIHlvdXINCj4gPiA+IHBhdGNoOg0KPiA+IA0KPiA+ICAgU29ycnksIHRoaXMgcGF0Y2ggZGVw
b25kIG9uIGFub3RoZXIgcGF0Y2g6DQo+ID4gDQo+ID4gDQpodHRwczovL3VybGRlZmVuc2UuY29t
L3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVr
L3BhdGNoLzIwMjUwMjI4MDExNzAyLjE2NDkzLTMtb3RfY2F0aHkueHVAbWVkaWF0ZWsuY29tL19f
OyEhQ1RSTktBOXdNZzBBUmJ3IWo4OFJuY3pQeG43S3NXc0dnckpGeDk0VFdqN0FBa20xRjhNTEMx
aGlvUVViLXpJVE5fUDNZRkgzYkJnbWRvNi0yQ055cU5xdERQSGxMZFFrUHckDQo+ID4gICBJbiB0
aGlzIGNhc2UsIGRvZXMgdGhlIGR0LWJpbmRpbmcgc3RpbGwgbmVlZCBnbyBmaXJzdD8gSWYgc28s
IEkNCj4gDQo+IFRoaXMgbWVhbnMgeW91ciBzZXJpZXMgYXJlIG5vbi1iaXNlY3RhYmxlIGJ1dCBl
dmVuIHJlLW9yZGVyaW5nIHdpbGwNCj4gbnRvDQo+IGZpeCBpdC4gWW91IHVuZGVyc3RhbmQgeW91
IHRhcmdldCBkaWZmZXJlbnQgdHJlZXM/DQoNCiAgVW5kZXJzdGFuZC4NCg0KPiANCj4gPiB3aWxs
IGluY2x1ZGUgdGhlIGRlcGVuZGVuY3kgaW5mb3JtYXRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdl
IG9mDQo+ID4gdGhlIG5leHQgdmVyc2lvbi4gVGhhbmsgeW91fg0KPiANCj4gTm8sIGRlY291cGxl
IGZyb20gZGVwZW5kZW5jaWVzLg0KDQogIE9rLCBpdCB3aWxsIGJlIGZpeGVkIGluIG5leHQgdmVy
c2lvbi4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo=

