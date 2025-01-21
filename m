Return-Path: <linux-gpio+bounces-14962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C7A17AA6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 10:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31CDD1884A31
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 09:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3A11DF962;
	Tue, 21 Jan 2025 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fwqACP3M";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="iSd0Puxd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A6E1DED4F;
	Tue, 21 Jan 2025 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737453400; cv=fail; b=smTK4eYdSmnmsA8bgqgSw22XplJkCw+bORzbNizOfxl02pnIsOrla37MvO8hwy1ilBtC6d5wxdBBw+CJ/G99tEU6hlAM3E2DT+VmOfDOP+uFu1yOJ2GMKZ50shjpwe6tFyEv9wPTtUnCk8yeG3/g3eozWwdCd5qJYNTSuan6+BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737453400; c=relaxed/simple;
	bh=vqyReSgMghvTL33J9A0djIhnBUhD0ZD8kvGcEL3GITY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GQ+qcWLPx48AcnYZ22hF+1utDyemPaVVW3e4zvy2Ez14SDgOXp4M6AKUYdnda2N0pAg46yGEjiaAQA/HXxE6Mx5SfAs3Y3s0R1uRYu9hewYVF8YT7ABJWquE3XNh+G+DGHg+NaaLpZDpxF7dWFx6GuIt73t9/ICx+pq+uxQNIr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=fwqACP3M; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=iSd0Puxd; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fdf66ea0d7dd11ef99858b75a2457dd9-20250121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=vqyReSgMghvTL33J9A0djIhnBUhD0ZD8kvGcEL3GITY=;
	b=fwqACP3MWVxB1G+7+AypKGZtDfmheHS6VoyL4gZtuU4Q+DDKth3Fhp6QYmxonoXvnAfTBQtpXklaiN8KDiktqK+kRpGiK7bpYT7RyYHwOy6Oem0mankef5nUH8gUK6hGooX3ERJF5kEZW7Msp0ZyQ/enRap6ccfDbVQ0BVJ7oXs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ae4320ab-f9b6-4226-9433-23fc581f84cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:40c23938-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fdf66ea0d7dd11ef99858b75a2457dd9-20250121
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 432076736; Tue, 21 Jan 2025 17:56:32 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 21 Jan 2025 17:56:30 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 21 Jan 2025 17:56:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywwxC8l1bCScGackXgu2ySsaQYC+yxFPegPmhW6eLxdzP0yV7KjJlGeBEXv2uDNMnrk9akiG3vrvra0SVo417GhHJ9zuvNRjHNM+9j56H2kaG+SBwCslhwnDIV1Bj2bMPPuGkbxunCheSCZjQpU4pOyXdlJdq6+ryECjgkfZaIBqxQdciktMBFi3B9U/SGFVOqG4AeSYIiIdzmg3KMcls+8VpnU/Hapb/piZOPZB7Ta6n3squxmqTWOXC5Eb5LZ31tjyeABKbpXQfCMH3umJPKV+Q04ZbQldlU5B+imZ9ULWwsNJbucCXjglRRyYb+/Gz+92lVmJI+3Z7HOuyg8Afw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqyReSgMghvTL33J9A0djIhnBUhD0ZD8kvGcEL3GITY=;
 b=Rh8/HfjhfiHK9FMERJ0FoUO60GEziWN4+rNGmPvBLfwjkdZdAgCyCCLYhR7Tv6/EEIIOsSVTJ8Jk5uYkiFzHskHcAwaa6mwRGmSDSLZfFzvYpLg+udg0QcyOuY0E0e/G3j4XicDKvFEzhjKqMuUQE2gTjKjlm5sgSJc6amcJNHUfePG9HaSl3bwUDDnWgwiklAKOPDuxQfN5RGSGvkWpERHR0aGsudBLe+7TXFd3O55iIKu/hfSuGV5JB0hObjeAqPd0OJmB+R73sgT/VaZQ2PB18wvqXHVzzT2gK1P/o4H+0dZBPjPqFPpBHTxVBrmMRwRSdUzhfmVvEjReHQuCfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqyReSgMghvTL33J9A0djIhnBUhD0ZD8kvGcEL3GITY=;
 b=iSd0PuxdyVnvVtT5bdUD+YtZgYy+yM9eNxbqh1z5B+XKOf5YcdSvoL31oSECtu78gwkJehloNCN9KK0Pofq9rbwBWNVBwfaXXp18vFtbQnVs1UMFdBS6cV0BfA4/J7Du+dPXsQTfmOsd5tn6DEbl2+dFIxegjj+XTjRfPPzuPyM=
Received: from SI2PR03MB5691.apcprd03.prod.outlook.com (2603:1096:4:152::11)
 by SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 09:56:27 +0000
Received: from SI2PR03MB5691.apcprd03.prod.outlook.com
 ([fe80::6e44:2111:39ae:cc82]) by SI2PR03MB5691.apcprd03.prod.outlook.com
 ([fe80::6e44:2111:39ae:cc82%6]) with mapi id 15.20.8356.010; Tue, 21 Jan 2025
 09:56:27 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"krzk@kernel.org" <krzk@kernel.org>
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
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Topic: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Index: AQHbZxfJWswQS8bGo0GLMRlAoA/hErMXl4qAgAEUwQCAAFYhAIAADccAgAAiDYCABjfigIAAORsAgAFkCoA=
Date: Tue, 21 Jan 2025 09:56:27 +0000
Message-ID: <8ca2e369be804697ef71491dfd366cf6afcca9bd.camel@mediatek.com>
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
	 <20250115063555.32492-2-ot_cathy.xu@mediatek.com>
	 <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
	 <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
	 <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org>
	 <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
	 <b212d05d-de3b-41b2-bc48-c6b79ae54a8b@kernel.org>
	 <bec17d1e215a11daa1fdede78c8070c8e1763c72.camel@mediatek.com>
	 <e7d49bda-8aaa-4897-8117-ab889fb27be0@collabora.com>
In-Reply-To: <e7d49bda-8aaa-4897-8117-ab889fb27be0@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5691:EE_|SEYPR03MB7682:EE_
x-ms-office365-filtering-correlation-id: 2bf939f4-5a22-46d4-b170-08dd3a01df3d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZTBkMTJyZmNOR3NWSVZQMkN1a1dhTTBXWjRZQWRQRXh4dHNXS1h3c2VpYllV?=
 =?utf-8?B?d0hiOGUvcnk0S1hkZGV6OHN2bWZjWW5HR1ZoeVBEWXp6dXUwZnZDdGR4VEZu?=
 =?utf-8?B?cTg3VGtVcExLT0VaRGE4SXRsbFlMbGZxVllKWDZkZy82c2VuQnBla1ZVRXhR?=
 =?utf-8?B?L0cwa09kak9WMXg0WXFLMTFDRWpnVWV1SlVSTUlaV3dhOFRDMlArZzBPclJj?=
 =?utf-8?B?UjhiUFZQL0Q1Yld0d3QrUU9WaWIxTjZaeDljakk5NmpkR1I5dU1PY2hGN3NP?=
 =?utf-8?B?MW1RdmQ0SDAwdk1DSVM2dzkrSjVFS2czS3hWRTgxUy85SmRDeVY1NmVVNVF2?=
 =?utf-8?B?R2xJSkNJZTdCZFZBUlFxZCtUUE5VNnNZU1hHOVlQaElFalpOMVhpbkRGbWFq?=
 =?utf-8?B?K1FRWldQYVlSV3QwUDV4d2hveGtCSnBzbzhOQ2d0WDd1L0laUWdDMnVsbUJw?=
 =?utf-8?B?RTU2YkVsTDR1UjV1MUdCaEN3TmU2dWN4TldzWHNVVnNJa2RlNmJGZ1FKbGNm?=
 =?utf-8?B?WkN5Z3JUeHFQSjZyYzY0UmdFa0tUNFFjcjlzQTlSeWswOWpNTGorRnUrd05D?=
 =?utf-8?B?a1M0SUc4R1pkOWxBVFlqY00weXhXRHBsT3lTam4wYmE4VmNmRVpuVGpVUDVj?=
 =?utf-8?B?SlFwMzBWQkQzeUJwL2FncmhGeXZLSjU3bXN2bWhHVGhENnlBN0l5d3hFUDZz?=
 =?utf-8?B?amdTNTVYOXdMMjFybVgrbVN3ZnE5ZTBqYnFoanpWbTR6YTRLWHhJNG8vWnlM?=
 =?utf-8?B?S3FZMlNXNmU3NXlwN1J4bVdCSllpazhtQTdPWXprUWxobDJwM0t5T2VITDZD?=
 =?utf-8?B?UjV0OHIycWRvbDBMam1qR2tmMjlReFgzdmQ3SlMrdFJVUU55Tjg4SmcxYXlj?=
 =?utf-8?B?L1VobTFqQkI0YWRMc0ROcUQwWkcxbGZwTktBY0pYOTl2MXg3OTgwcXZYYjJm?=
 =?utf-8?B?ZmRTZCtTZW9TZ0JSZkFDVmZLTnhWK09rS0RLVkRNNXM4WTJoK09ybzBXV3Jm?=
 =?utf-8?B?UXdPN2toTFRWZElOY21DU2w0Z0ZmUm9UTHJsbk1oNEFGUFJSelVRelJ4NWZk?=
 =?utf-8?B?VlJteUpSQ3VHd0xjMTRBSmNwMWk5bGJDN1Y0Mk9sTyt5WUlUd3Q5dE0xVEVY?=
 =?utf-8?B?MmlRaGlJYkxXQzg0amZtblp6UDZOZmxFdkh6aU1yRDQ0dU8yRHBGTGRlNkUr?=
 =?utf-8?B?YmxMYzA1ZWtHWmhhalR5TnBsYVZSNW5SSWFJMk5jbEsvL2NiK0t4c2hkWVAz?=
 =?utf-8?B?b3VuNys1MS8wYWpvc2hWRk9pNnh0RWxJb2xhUmFIS3BXNUZ5NUdTRXY5cXpF?=
 =?utf-8?B?all6bTJ5Wnk0TFBzclBQZlcvZDdPaFFWZEIzV1hSYmh4VXJOazEyb0s1aC90?=
 =?utf-8?B?bEpZQWtMSmJuMFdmbGhOZ3dMaXpVNTBTMnkzUE9VdGxHQkIzMW8rYzJZVFpE?=
 =?utf-8?B?c3pGUm4wenZ6ZlFHOVQ2Nk9xYUpTZUpEQkZJUzFlMDRPWlVBZzZtUUN1TUpM?=
 =?utf-8?B?V0krZk9KYVF2UXJyaTNaTm9CTzV4RlRaQnQ2eFFoU0pWcUdKYmhnRzlhOFpM?=
 =?utf-8?B?NjBCL3RMbFhvU3dSTkZ3dDh3V1dDT0pONGw5bTB5eHFzcjdST29CUEZWSmV4?=
 =?utf-8?B?S0VJWEd3TnpwSjZVTTluNElUUnhwSURGNEc2Y08zUmJSdWd6ajhVdEVaYWVI?=
 =?utf-8?B?NUlKVHEyWWVzdk5CcUt6N1FYdmZtSGpMUzlyZFI0dTRuWm9vU3FRei82UDkz?=
 =?utf-8?B?cUFNLzVadm40eFJrU3J4Tlp2TFNLa3hneFpYTTFlaFRlT1EwZmx1aDVaNVpr?=
 =?utf-8?B?ZTZoaGJyZSs3ajdMMHF0TDhJb3dUdUk3OVIzbzk3eGhtM1IrcUZFc2paRkJN?=
 =?utf-8?B?UDVDZUhnc0FYdlV4SE5LZ0tqUllhdlA0dkFJWittVitQTjVReDJYMW03QTk4?=
 =?utf-8?Q?fMArVQ6v9cRPfInGBt+eLWsdKLajCQ5v?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5691.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjFwYVpYdzd4L0pjZURQWnp0ckV4RDBnWWhnbTllbkpyTFB3WEpEeERmV094?=
 =?utf-8?B?dFlVaFFQQm5nTlg4VlFSOVhzemQ4cGM1dlpjK2d2LzA2a3k0OGFZN3A3dWRY?=
 =?utf-8?B?MllMbWJZUDhWd2pUSjd0RjhtYXJIUlRDQWlzRWw1WHVCbzJQK2tHS1MzVnBB?=
 =?utf-8?B?anZXM2VkU0h0TkYvcFR3UFhkL3VpendlREVTempiSUV6L0VCcU5xdnFrUFR3?=
 =?utf-8?B?U0xQaUpVYzNleXhKelBKN0hSTUtpM0tFNDVvZEsyb04xLzhITkJGZ3RoOFFx?=
 =?utf-8?B?L2dKUEgvN0xnOHh0dk44TnhjR3JJaUp4Y2xlYzdYclBtK2xEUHJVcHNwaFZx?=
 =?utf-8?B?R092ZzM1ZnFTYnVmMEc2WGlQRGw2NTNiOFdMUkVjNEVSVDd2NFJKbDdsZ3VC?=
 =?utf-8?B?RnJjTWtha2lpUWw3ZTR0YyttTWlXa2dwL0tmWU1vcFQvS1FoOWdCeVRVSjN4?=
 =?utf-8?B?ZVFTUkVQaDB2QVRDTTRxQmlJdXlNZ3p0R2hpZ3FhMExYSFZtRXVIZ0VuOWdK?=
 =?utf-8?B?WVNQMUtlN0YxT3VaYjFtMXV4K0wyLytaMzVuNlNrc0hON3haL3VuU29VYTd6?=
 =?utf-8?B?R2JQNUZWSnQ0amlmK0RZMXlJa083ZkNxLzcycXhsQ3JtQW1SYXBTdEE3ZzB0?=
 =?utf-8?B?RllmYkhTWkhOOWxickpPeHhxbGRsTUJXb3RWb0k0OG0wRTUvYzdIV1NzUE1z?=
 =?utf-8?B?eVZXQi9WTGh6SW9nbUtXdlRNWFVsSW5lYmo5am1MdDZwK3M0T2dOeE53MjU5?=
 =?utf-8?B?Zkx2TWVOUjVtVmxSN29LZkM2b1Q5di9XRGI0d293c2JabjIyS3dYTW1tdVpi?=
 =?utf-8?B?NEhRbGNUckZmRlIzY3NDWmYwRjgveDg5M0V2SW5aRzE3N1NWZWhEdkVuMSth?=
 =?utf-8?B?c0FGZmQ0MlR0WkZlWEpUUmU4Mm9nbVhQTDZYb1IvT3ZnRWg3ajBNazZ1alJ2?=
 =?utf-8?B?T0t2d2VYb0Rrbkpqb1FZZXJwV0RXYktQSTNNcE4xcjNGR1RKQ2xibGUrVUdh?=
 =?utf-8?B?UUdpekdWd1czUkdXTzhGMzdQL2daWmk5Q1dYWHlIUlhnaUcwZEtWZlQvcFdU?=
 =?utf-8?B?UFl4aHNZd2RmZFk4L3VCOHMrcExDRUwyUVdUU3hkbmJaZE9uR1krZEJyUkQ2?=
 =?utf-8?B?bmtFR3ltSWtObVBFQmQzaCtzQUZnWGdmTmF2MzVLY0VzemVCODhVcjBMeVIr?=
 =?utf-8?B?eHNudytrOEVoZE9YSkd6Z3hmTm9iRGluTmZWU3dObUREeEVka0xGcDgreTNN?=
 =?utf-8?B?Q3lycmpCZW5TaWdoQVVEOEh6aUNDYURXd1dCKzkwQmVkWnNsZTdWYjQ1d25k?=
 =?utf-8?B?cElxRHVRb09wT1JjSkp6eCt3ajVwcW14L2xwQzMvQW5PUm5ZSWw1aGR4QTZO?=
 =?utf-8?B?K2FhSmIvN01JR0FGbUpwdjVJQUVJYzkwVEk1d1VtRGE2RE9jWnVUK2wxNHlP?=
 =?utf-8?B?ZjI1SnRKN0pVOWFsS0taZ1c0N3Y4b0tsOGtseDN1bFcxSXRTMjdKQ1V3Y1p0?=
 =?utf-8?B?Mzl1MVpUYkwwZFFDS3pLL29uOXFlcEtjZUhBRFNKeGI4Y1FuazhQMFkzR2NT?=
 =?utf-8?B?bHlPb2tLTkZyaWgzcFdIaG4yK3E0Uk5Ycm9QdkVLUXlTT003bUQzVEhONmxO?=
 =?utf-8?B?c1BSYldDNlJuQXduLzVjUFZmZ0ZvZUR0TzN1THMvL1NlMEhWOG83YndYNFF1?=
 =?utf-8?B?akJaMU0yUzM4SE80K25MTmZ6UU1OYjNBc3kwOTRVS0k1RC9UbDQrNUtaYUJY?=
 =?utf-8?B?VFUwYlUzUzh4blpVOGpNQUk0bHl2clc2L05uL3RCdnVjUksybUd4dXc1Vmxi?=
 =?utf-8?B?N1N5ckpXT2xqby9SR01MRmJkQnY2alk1cTIvenhQRlkwR0VKbnNwTHd0MjRs?=
 =?utf-8?B?SE5wTDZ0OVFTYXdWWFo4WkFNQ0VyNVFraGJQREVmUXpRa0JNMXpOK1c0YUx0?=
 =?utf-8?B?Rk9iWkQzcFpDMFhqNWFFNkVTYmlWNFZ1dmF2VFJvOXc4Ky9xR0pCdzBmbXZl?=
 =?utf-8?B?YXM5S1FwUzBlcFNScUdnNTNYUXZLdGlkakRaMm11aFpiT2podEwwOSszUWFs?=
 =?utf-8?B?RjYzOWRNeENSd1hDR2hPMXZUNHBoaXozV2xEdEtlM0crN3JxdmZTMVhDL3kw?=
 =?utf-8?B?TVpEcFNhQ1pOa094SC9PL2ZjcDViVytQTHlVV25CZmJ5Z01uZlR6ME9GcThn?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0610BC2D79BBB459CE2F392BBF631D1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5691.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf939f4-5a22-46d4-b170-08dd3a01df3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 09:56:27.0990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4jSL6orBOrRm4qzejJUhYDxznSEsYKQuZxqerbqhCTZTVuh5T1mmGksVDE1OKLnKkwHVgIj5ojn9L8QdwKiWIrnXlcfK8podMKT2vCgea7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7682

T24gTW9uLCAyMDI1LTAxLTIwIGF0IDEzOjQyICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyMC8wMS8yNSAxMDoxNywgQ2F0aHkgWHUg
KOiuuOWNjuWptykgaGEgc2NyaXR0bzoNCj4gPiBPbiBUaHUsIDIwMjUtMDEtMTYgYXQgMTE6MjAg
KzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6
IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+ID4gdW50
aWwNCj4gPiA+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+
ID4gPiANCj4gPiA+IA0KPiA+ID4gT24gMTYvMDEvMjAyNSAwOToxOCwgQ2F0aHkgWHUgKOiuuOWN
juWptykgd3JvdGU6DQo+ID4gPiA+IE9uIFRodSwgMjAyNS0wMS0xNiBhdCAwODoyOCArMDEwMCwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBs
ZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiA+ID4gPiA+IGF0dGFjaG1lbnRzDQo+
ID4gPiA+ID4gdW50aWwNCj4gPiA+ID4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9y
IHRoZSBjb250ZW50Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IE9uIDE2LzAx
LzIwMjUgMDM6MjAsIENhdGh5IFh1ICjorrjljY7lqbcpIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+
ICsgICAgICAgICAgYmlhcy1wdWxsLWRvd246DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
IG9uZU9mOg0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgIC0gdHlwZTogYm9vbGVhbg0K
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgIC0gZW51bTogWzEwMCwgMTAxLCAxMDIsIDEw
M10NCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBtdDgxOTYg
cHVsbCBkb3duDQo+ID4gPiA+ID4gPiA+ID4gUFVQRC9SMC9SMQ0KPiA+ID4gPiA+ID4gPiA+IHR5
cGUNCj4gPiA+ID4gPiA+ID4gPiBkZWZpbmUgdmFsdWUuDQo+ID4gPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgLSBlbnVtOiBbMjAwLCAyMDEsIDIwMiwgMjAzLCAyMDQsIDIwNSwNCj4gPiA+ID4g
PiA+ID4gPiAyMDYsDQo+ID4gPiA+ID4gPiA+ID4gMjA3XQ0KPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgZGVzY3JpcHRpb246IG10ODE5NiBwdWxsIGRvd24gUlNFTA0KPiA+ID4gPiA+
ID4gPiA+IHR5cGUNCj4gPiA+ID4gPiA+ID4gPiBkZWZpbmUNCj4gPiA+ID4gPiA+ID4gPiB2YWx1
ZS4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IE5vdCBtdWNoIGltcHJvdmVkLg0KPiA+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiAgICBJIGhhdmUgcmVtb3ZlZCB0aGUgY29udGVudCByZWxh
dGVkIHRvICdyZXNpc3RhbmNlDQo+ID4gPiA+ID4gPiB2YWx1ZScsIHdlDQo+ID4gPiA+ID4gPiB1
c2UNCj4gPiA+ID4gPiA+ICdSU0VMJyBpbnN0ZWFkIG9mICdyZXNpc3RhbmNlIHZhbHVlJy4NCj4g
DQo+IFRoaXMgaXMgd3JvbmcuDQoNCiAgU29ycnksIEkgdGhpbmsgSSBtYXkgbm90IGhhdmUgZXhw
cmVzc2VkIG15c2VsZiBjbGVhcmx5LiBXaGF0IEkgbWVhbnQNCmlzIHRoYXQgdGhlIGF0dHJpYnV0
ZSAnbWVkaWF0ZWsscnNlbC1yZXNpc3RhbmNlLWluLXNpLXVuaXQnIGlzIG5vdA0Kc3VwcG9ydGVk
LiBJbiB0aGUgZHRzLCBjYW4gd3JpdGUgdGhlIHJlc2lzdGFuY2UgdmFsdWUsIGZvciBleGFtcGxl
Og0KYmlhcy1wdWxsLXVwPTwxMDAwPiwgYnV0IGNhbid0IHVzZSAnbWVkaWF0ZWsscnNlbC1yZXNp
c3RhbmNlLWluLXNpLXVuaXQgDQo9IDx4eHg+Jy4NCg0KPiANCj4gPiA+ID4gPiANCj4gPiA+ID4g
PiBTbyB0aGUgdmFsdWUgaW4gT2htcyB3YXMgcmVtb3ZlZD8gSSBhc3N1bWUgYWJvdmUgZG8gbm90
IGhhdmUNCj4gPiA+ID4gPiBrbm93bg0KPiA+ID4gPiA+IHZhbHVlDQo+ID4gPiA+ID4gaW4gT2ht
cz8NCj4gPiA+ID4gDQo+ID4gPiA+ICAgIFllcywgdmFsdWUgaW4gT2hucyB3YXMgcmVtb3ZlZCwg
bm8gY29kZSBoYXZlIGtub3dtIHZhbHVlLg0KPiA+ID4gDQo+ID4gPiBEb2VzIHRoZSBoYXJkd2Fy
ZSBoYXZlIGtub3duIHZhbHVlIGluIE9obXM/DQo+IA0KPiBJdCBkb2VzLg0KPiANCj4gPiANCj4g
PiAgICBXaGF0IGRvIHlvdSBtZWFuIGJ5ICdoYXJkd2FyZSc/IFdoZW4gd3JpdGluZyB0byB0aGUg
cnNlbA0KPiA+IHJlZ2lzdGVyLA0KPiA+IHRoZSB2YWx1ZSB3cml0dGVuIGlzIDAtNy4NCj4gPiAN
Cj4gDQo+IEhhcmR3YXJlIG1lYW5zICJ0aGUgcGluIGNvbnRyb2xsZXIgb2YgdGhlIG10ODE5NiBT
b0MiIDotKQ0KPiANCj4gQW55d2F5Lg0KPiANCj4gVGhlIFJTRUwgcmVnaXN0ZXJzJyBmdW5jdGlv
biBpcyB0byBzZWxlY3QgYSBzcGVjaWZpYyByZXNpc3RhbmNlIHZhbHVlDQo+IHRvDQo+IHB1bGx1
cC9kb3duIGEgcGluLCBvciBhIGdyb3VwIG9mIHBpbnMuDQo+IA0KPiBEZXZpY2V0cmVlIGJpbmRp
bmdzIHJlcXVpcmUgdG8gc3BlY2lmeSB2YWx1ZXMgaW4ga25vd24gdW5pdHMsIHNvIGluDQo+IGRl
dmljZSB0cmVlDQo+IHlvdSAqbmVlZCogdG8gc3BlY2lmeSB0aGUgUlNFTCByZXNpc3RhbmNlIGlu
IE9obXMuDQo+IA0KPiBZb3UgY2Fubm90IHNwZWNpZnkgUlNFTCByZWdpc3RlciB2YWx1ZSBpbiBk
ZXZpY2UtdHJlZS4gVGhhdCdzDQo+IHVuYWNjZXB0YWJsZS4NCj4gDQo+IFJlZ2FyZHMsDQo+IEFu
Z2Vsbw0KDQogWWVzLCBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbi4gSG93ZXZlciwgSSB3YXMg
cmVmZXJyaW5nIHRvIHdyaXRpbmcNCnRoZSByc2VsIHJlZ2lzdGVyIGluIHRoZSBkcml2ZXIsIG5v
dCBpbiBkdHMuDQoNCj4gDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgRm9yIHB1bGwgZG93biB0eXBlIGlzIG5vcm1hbCwgaXQgZG9lc24ndA0KPiA+ID4gPiA+
ID4gPiA+IG5lZWQNCj4gPiA+ID4gPiA+ID4gPiBhZGQNCj4gPiA+ID4gPiA+ID4gPiBSU0VMICYg
UjFSMC4NCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICBGb3IgcHVsbCBkb3duIHR5cGUg
aXMgUFVQRC9SMC9SMSB0eXBlLA0KPiA+ID4gPiA+ID4gPiA+IGl0DQo+ID4gPiA+ID4gPiA+ID4g
Y2FuDQo+ID4gPiA+ID4gPiA+ID4gYWRkDQo+ID4gPiA+ID4gPiA+ID4gUjFSMCBkZWZpbmUgdG8N
Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICBzZXQgZGlmZmVyZW50IHJlc2lzdGFuY2Uu
IEl0IGNhbiBzdXBwb3J0DQo+ID4gPiA+ID4gPiA+ID4gIk1US19QVVBEX1NFVF9SMVIwXzAwIiAm
DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIk1US19QVVBEX1NFVF9SMVIwXzAxIiAm
DQo+ID4gPiA+ID4gPiA+ID4gIk1US19QVVBEX1NFVF9SMVIwXzEwIg0KPiA+ID4gPiA+ID4gPiA+
ICYNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAiTVRLX1BVUERfU0VUX1IxUjBfMTEi
IGRlZmluZSBpbiBtdDgxOTYuDQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgRm9yIHB1
bGwgZG93biB0eXBlIGlzIFBEL1JTRUwsIGl0IGNhbg0KPiA+ID4gPiA+ID4gPiA+IGFkZA0KPiA+
ID4gPiA+ID4gPiA+IFJTRUwNCj4gPiA+ID4gPiA+ID4gPiBkZWZpbmUgdG8gc2V0DQo+ID4gPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgZGlmZmVyZW50IHJlc2lzdGFuY2UuIEl0IGNhbiBzdXBw
b3J0DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIk1US19QVUxMX1NFVF9SU0VMXzAw
MCIgJg0KPiA+ID4gPiA+ID4gPiA+ICJNVEtfUFVMTF9TRVRfUlNFTF8wMDEiICYNCj4gPiA+ID4g
PiA+ID4gPiArICAgICAgICAgICAgICAiTVRLX1BVTExfU0VUX1JTRUxfMDEwIiAmDQo+ID4gPiA+
ID4gPiA+ID4gIk1US19QVUxMX1NFVF9SU0VMXzAxMSIgJg0KPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICJNVEtfUFVMTF9TRVRfUlNFTF8xMDAiICYNCj4gPiA+ID4gPiA+ID4gPiAiTVRL
X1BVTExfU0VUX1JTRUxfMTAxIiAmDQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIk1U
S19QVUxMX1NFVF9SU0VMXzExMCIgJg0KPiA+ID4gPiA+ID4gPiA+ICJNVEtfUFVMTF9TRVRfUlNF
TF8xMTEiDQo+ID4gPiA+ID4gPiA+ID4gZGVmaW5lIGluDQo+ID4gPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgbXQ4MTk2Lg0KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0
LWJpbmRpbmdzL3BpbmN0cmwvbXQ4MTk2LQ0KPiA+ID4gPiA+ID4gPiA+IHBpbmZ1bmMuaA0KPiA+
ID4gPiA+ID4gPiA+IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL210ODE5Ni1waW5mdW5j
LmgNCj4gPiA+ID4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uYmYwYzgzNzQ0MDdjDQo+ID4gPiA+ID4gPiA+ID4gLS0tIC9k
ZXYvbnVsbA0KPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3Ry
bC9tdDgxOTYtcGluZnVuYy5oDQo+ID4gPiA+ID4gPiA+ID4gQEAgLTAsMCArMSwxNTcyIEBADQo+
ID4gPiA+ID4gPiA+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkg
T1IgQlNELTItDQo+ID4gPiA+ID4gPiA+ID4gQ2xhdXNlDQo+ID4gPiA+ID4gPiA+ID4gKi8NCj4g
PiA+ID4gPiA+ID4gPiArLyoNCj4gPiA+ID4gPiA+ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDI1
IE1lZGlhdGVrIEluYy4NCj4gPiA+ID4gPiA+ID4gPiArICogQXV0aG9yOiBHdW9kb25nIExpdSA8
R3VvZG9uZy5MaXVAbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiA+ID4gPiA+ICsgKi8NCj4gPiA+ID4g
PiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gKyNpZm5kZWYgX19NVDgxOTZfUElORlVOQ19IDQo+
ID4gPiA+ID4gPiA+ID4gKyNkZWZpbmUgX19NVDgxOTZfUElORlVOQ19IDQo+ID4gPiA+ID4gPiA+
ID4gKw0KPiA+ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9tdDY1
eHguaD4NCj4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gKyNkZWZpbmUgUElOTVVY
X0dQSU8wX19GVU5DX0dQSU8wIChNVEtfUElOX05PKDApIHwgMCkNCj4gPiA+ID4gPiA+ID4gPiAr
I2RlZmluZSBQSU5NVVhfR1BJTzBfX0ZVTkNfRE1JQzFfQ0xLIChNVEtfUElOX05PKDApIHwNCj4g
PiA+ID4gPiA+ID4gPiAxKQ0KPiA+ID4gPiA+ID4gPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9f
RlVOQ19TUEkzX0FfTU8gKE1US19QSU5fTk8oMCkgfA0KPiA+ID4gPiA+ID4gPiA+IDMpDQo+ID4g
PiA+ID4gPiA+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5DX0ZNSTJTX0JfTFJDSyAoTVRL
X1BJTl9OTygwKQ0KPiA+ID4gPiA+ID4gPiA+IHwNCj4gPiA+ID4gPiA+ID4gPiA0KQ0KPiA+ID4g
PiA+ID4gPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9fRlVOQ19TQ1BfRE1JQzFfQ0xLDQo+ID4g
PiA+ID4gPiA+ID4gKE1US19QSU5fTk8oMCkgfA0KPiA+ID4gPiA+ID4gPiA+IDUpDQo+ID4gPiA+
ID4gPiA+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5DX1RQX0dQSU8xNF9BTyAoTVRLX1BJ
Tl9OTygwKQ0KPiA+ID4gPiA+ID4gPiA+IHwNCj4gPiA+ID4gPiA+ID4gPiA2KQ0KPiA+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gSSBkbyBub3Qgc2VlIGhvdyB5b3UgcmVzb2x2ZWQgbXkgY29t
bWVudCBmcm9tIHYxLiBJbiB2MiBJDQo+ID4gPiA+ID4gPiA+IHJlbWluZGVkDQo+ID4gPiA+ID4g
PiA+IGFib3V0DQo+ID4gPiA+ID4gPiA+IGl0LCBzbyB5b3UgcmVzcG9uZGVkIHRoYXQgeW9wdSB3
aWxsIGNoYW5nZSBzb21ldGhpbmcsIGJ1dA0KPiA+ID4gPiA+ID4gPiBJDQo+ID4gPiA+ID4gPiA+
IGRvDQo+ID4gPiA+ID4gPiA+IG5vdA0KPiA+ID4gPiA+ID4gPiBzZWUNCj4gPiA+ID4gPiA+ID4g
YW55IGNoYW5nZXMuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBTbyBleHBsYWluOiBo
b3cgZGlkIHlvdSByZXNvbHZlIG15IGNvbW1lbnQ/DQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+
ID4gPiBUaGVzZSB0d28gZXhhbXBsZXMgd2hlcmUgeW91IGNsYWltIHlvdSB3aWxsIGNoYW5nZQ0K
PiA+ID4gPiA+ID4gPiBzb21ldGhpbmcsDQo+ID4gPiA+ID4gPiA+IGJ1dA0KPiA+ID4gPiA+ID4g
PiBzZW5kDQo+ID4gPiA+ID4gPiA+IHRoZSBzYW1lLiBJIHNraXBwZWQgdGhlIHJlc3Qgb2YgdGhl
IHBhdGNoLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiAgICBUaGFuayB5b3UgZm9yIHlvdXIg
cGF0aWVudCByZXNwb25zZSwgaGVyZSBpcyBteQ0KPiA+ID4gPiA+ID4gZXhwbGFuYXRpb24NCj4g
PiA+ID4gPiA+IGZvcg0KPiA+ID4gPiA+ID4geW91DQo+ID4gPiA+ID4gPiBxdWVzdGlvbjoNCj4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gICAgSW4gdjEsIEkgdW5kZXJ0YW5kIHRoYXQgeW91IG1l
YW50IEkgZGlkbid0IHNlbnQgYSByZWFsDQo+ID4gPiA+ID4gPiBiaW5kaW5nLA0KPiA+ID4gPiA+
ID4gYW5kDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhlIGNvbW1lbnQgaXMg
dW5kZXIgc3BlY2lmaWMgbGluZXMsIHNvIEkgc2FpZCB0aGVzZSBkZWZpbmVzDQo+ID4gPiA+ID4g
YXJlDQo+ID4gPiA+ID4gbm90DQo+ID4gPiA+ID4gYQ0KPiA+ID4gPiA+IHJlYWwgYmluZGluZy4g
WW91IHNlbnQgdGhlbSBhZ2FpbiwgYnV0IHRoZXkgYXJlIHN0aWxsIG5vdA0KPiA+ID4gPiA+IGJp
bmRpbmdzLA0KPiA+ID4gPiA+IGJlY2F1c2UgdGhleSBhcmUgbm90IHVzZWQgaW4gdGhlIGRyaXZl
ci4gTWF5YmUgdGhlIHVzYWdlIGlzDQo+ID4gPiA+ID4gY29udm9sdXRlZCwNCj4gPiA+ID4gPiBz
byB3aGljaCBwYXJ0IG9mIGltcGxlbWVudGF0aW9uIGFyZSB0aGVzZSBjb25uZWN0aW5nIHdpdGgN
Cj4gPiA+ID4gPiBEVFM/DQo+ID4gPiA+ID4gSU9XLA0KPiA+ID4gPiA+IHdoaWNoIHBhcnQgb2Yg
ZHJpdmVyIHJlbGllcyBvbiB0aGUgYmluZGluZz8NCj4gPiA+ID4gDQo+ID4gPiA+ICAgIEkgZ290
IHlvdS4gVGhpcyBiaW5kaW5nIGRlZmluZSBtYW55IG1hY3Jvcywgd2hpY2ggd2lsbCBiZQ0KPiA+
ID4gPiB1c2VkDQo+ID4gPiA+IGZvcg0KPiA+ID4gPiAncGlubXV4JyBzZXR0aW5nIGluIHRoZSBE
VFMuIFRoZSB1c2FnZSBsaWtlIHRoaXM6DQo+ID4gPiA+IA0KPiA+ID4gPiAgICBhZHNwX3VhcnRf
cGluczogYWRzcC11YXJ0LXBpbnMgew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgIHBpbnMtdHgt
cnggew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0NCj4gPiA+ID4g
PFBJTk1VWF9HUElPMzVfX0ZVTkNfT19BRFNQX1VUWEQwPiwNCj4gPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDxQSU5NVVhfR1BJTzM2X19GVU5DX0kxX0FEU1BfDQo+ID4g
PiA+IFVSWEQwDQo+ID4gPiA+ID4gOw0KPiA+ID4gPiANCj4gPiA+ID4gICAgICAgICAgICAgICAg
ICB9Ow0KPiA+ID4gPiAgICAgICAgICB9Ow0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IFRoYXQncyBE
VFMsIG5vdCBkcml2ZXIsIHNvIG5vdCBhIGJpbmRpbmcuIERyb3AgdGhlIGhlYWRlciBmcm9tDQo+
ID4gPiBiaW5kaW5ncy4NCj4gPiANCj4gPiAgICBTb3JyeSwgSSBkb24ndCBxdWl0ZSB1bmRlcnN0
YW5kIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiBiaW5kaW5nDQo+ID4gYW5kDQo+ID4gZHJpdmVy
LiBEcml2ZXIgd2lsbCBwYXJzZSB0aGlzIG1hY3JvIHRvIGdldCBncGlvIG51bWJlciBhbmQNCj4g
PiBmdW5jdGlvbi4NCj4gPiANCg==

