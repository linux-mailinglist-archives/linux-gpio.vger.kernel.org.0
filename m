Return-Path: <linux-gpio+bounces-35640-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCNMJhBR8GlNRgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35640-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:17:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F48147DFC4
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6239D300BE83
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 06:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821BD343D8A;
	Tue, 28 Apr 2026 06:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MrR+Z9IO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D31C5D5E;
	Tue, 28 Apr 2026 06:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357064; cv=fail; b=lindRhLqDW5Yzba7tiC5+AKnSmnJxp9WJoYQqHu53LUGEBF5r88Qi72q6ADiqRw2WphzUM8PChBwRagrBUzR63LCQA7SfNU3f8SMoymX9HJPOKCjiq6wLoFumBvN882oD/ZnTkd7uIQ7xkq2TQLKerlJGkNuWdoJit/OZlIpr2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357064; c=relaxed/simple;
	bh=HY5VvD2UR1gkcxhOIrNNO9MO9AFr2xKqkE9PHSV6sCQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V9QnzJVih60T2HoQgIEegW4u0dlo2s3uOEVcAJ+pt45EtQjam4tnzZjABtKfkXDLumv/fR5EdTyjNgt9gEmDgORKQyQ+NSIbBUJETT08lQJSoiU8rrF1FRXF8X86OdC76nfug8RpeCfC+wPkwihJOZSZ0HvU6OkbN9bC1uBBiVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MrR+Z9IO; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDV9TuZzmYRYlswIr1uM3rnGm58ulDzWpyQf0sCgk/D/tm/OBlo6as5PyfsOFIqYHS+Tu04/Vfeq/xlxNlfBmMZZ0myv4pnxg4pE+S7APwC+3aTSivQHVCAjp7+jXWWDzApcBHynZBAmQDGmUsliM3CiE4auyVqdyx6/4rnf3GgvXvCX1SWjLP0qcC7Mav98KXM0sGd48cPGjyRrCn3tg01HEgatUcTJNnzH0zrQqziOyyRGp7RDYPA4dg+EDqYe0a9Rof+oZQo2Qf5j2kWa6l4S2eW70qijK7YiBK0LMlk24kEKyKlX9sM8Bwd/JPKAnU6r/QJn9oFKSR7XR+2t0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY5VvD2UR1gkcxhOIrNNO9MO9AFr2xKqkE9PHSV6sCQ=;
 b=GsmHJzSHXoVUPZhmwr3CyP3GC5BAMtkc8GGmxyUza4pcVvH4stn1/SvU59P/yNSEPsEcofKy61XbPkUb8V0jKWPfQ6TND+mUXSraQs9qukpzLrSmQmr5WbyiXLMiJRanRKInx2edrz4RmKMWh0kYH4Epjjr/yMzJZxlJnJI/TLL7cldXcEu4xh6TcuRAhxfyLnJZJivtEl4XP/VFHe404AsYl+XqjTKaZxJ8TYwn2N1RRv917YGPsu7hEMPHLSUyvFs0HEPJxnt1OADOTF7jXqtAoG0qIkqaCdrTDtnYT6SBXX9sSu5qbaa8zXnn/PDpEBkVEfi4NLkpcS+63+v3/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY5VvD2UR1gkcxhOIrNNO9MO9AFr2xKqkE9PHSV6sCQ=;
 b=MrR+Z9IOOofEdxNGgh05kBcuvQ8MwkMzOycrPHpPLQDQkWi8iLA3w6ZBhSe0BpUPV7dg3k2RiKYRDo8t5RYyAg0Cz/+LGRG89+ajDwMkolmIBDx9mywo+hVWfCbkmsAUjtewmMOiY/VYNUEZtMPQY1g9O/syKBwKrwj8O/DiFC3jflSJf4zohnqGPixoyA6UQiCa5Vui9ONefUC4PxbNZnEAz+zbYFhm1vQHIH10oR0BDpYt481KFk5QkR4x3/hfa4ot2gtsyKHVcfNBk5c1JMUWFkhZ2NUAXCpuZgccXVyJrcO3Asj2FFxYN+rwWGVKy2KueOy/0dfkjSDSbtbpgg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 06:17:37 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 06:17:37 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Bartosz Golaszewski
	<brgl@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "G.N. Zhou"
	<guoniu.zhou@nxp.com>
Subject: RE: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
Thread-Topic: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
Thread-Index: AQHc1ta1jYPISxMUeEmcHiC8+mSeQQ==
Date: Tue, 28 Apr 2026 06:17:36 +0000
Message-ID:
 <AS8PR04MB908082A6E403407A88D3978DFA372@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
 <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com>
 <CAD++jLmi1Q4sGeY6vK7fxw8AdCmiiW-8kdEi4OFkV1xep=Od_A@mail.gmail.com>
 <AS8PR04MB9080113A71D87E952561FC53FA362@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <CAD++jLkuDWPd5KsKTpQ=htyupaXEwkPt_jV+RNngs+TTVkYSkw@mail.gmail.com>
In-Reply-To:
 <CAD++jLkuDWPd5KsKTpQ=htyupaXEwkPt_jV+RNngs+TTVkYSkw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DU2PR04MB8709:EE_
x-ms-office365-filtering-correlation-id: a8102d49-8f51-46e7-9026-08dea4edd7f0
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 ej3eY4reJAwD1kWfLOvwvIalEpkM651s9VigKhCFdywuHRw1g9Y4epBKYT4sM5E2rtmxyOn9AItE1/PNCF8XPW1J2zHBVyXbIj+2kpg9y2ACT3yIWiVMGeePVnWCEfpwrlwlGIEmrX3JDy7GweUUnLsLyV7yAZPdnWQYgUki3oi0Qzl9YtAQ9SXzA/Ae7wx1p20XdKAxB3K+jJFYCRYFSL9NG3WsKkJiFg3Y36aTK/9ebitbdVNMv7BS4+80Y2duOGUj+VxYuKgMr+1n7rHDBEmy8HvWr7BvgBq+Yhyi903mrwdqwySgTcVlR5lFR1T9pS0qC2+U96XpewFyQUO8yNknx+AzPTFP7egP+UN230Jirg5/BISGhNohohfo51HqqFAYAnmJ7JuUwKuQHVX3BcGa8YRT5z5LdTy6aggDF+q7jmIUdQJdLLY/pQv38hQEAYRS71m5WpgNZZgMqRVHZ9G6/STS0CPiBj47YLoSXcrEJQTAP4e9+0fm/ElJO8bSCXOx0HO9vZ1eoGY+0r056y311fjXL/TH/elh9FSLK+kIxbsMgzFON9vlkN3UZH6/jJzub5Avh8j/IzURYnAJBq5Y38mRPLKIO/EMujREOZXocmUiJ21qW5Zz4pPaP5HWjHaERrdvUt1DbdH++60lcmibzzBpDMGATfV152U/gLmA+ZnC0zhjotfdkvJ3Q342SlRu6kfBPJXkrSVqCwOuUpLQFMWrzrlWdLokeGx6qbTuUKrK4nVBBM6guRlWyGqLPa1ToB9Om8pUhNoIjEs9MBSj3BYqXGjaYj6JU/HnkJ0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SjJidzBZS1ZzSVR3blFWNEJ4TlQ0TWJhV0RDdHlCcUpqOU5vQ0NLbWNlM1Vm?=
 =?utf-8?B?RFdqUTBPUklvNFhPLzFadUVhK0tITjh3QTRoQTR5RlRhOWRmQVRlWkt5SlNL?=
 =?utf-8?B?QTUvWEdYdnJBU3JNWm44M0dVYUwwRFhnVEZ6Y051dWhOd2JhVGx0QS8zZWRh?=
 =?utf-8?B?cHRvaW5LVk9MTjI0VEMrZkFaWWRNQVRQQmZwUFN5VUpQR0ZxVWxpZGZwQTN1?=
 =?utf-8?B?cmVhcUFRbUVNNW9BV1lINy81cjh0Y1NPeDNFTStsVmVJRUtpU2FPaFF4L25L?=
 =?utf-8?B?V0p1eVNqdmZFR3VSQmN6UDJQbkJDK0grUTZha24vdEtzTTBHY0VHRklEbWVG?=
 =?utf-8?B?Ujg4c2FVUE11b3hPYTRxYUFwWTlDSGdWMTh6RXh1Q1UzTHdoREN4QlFJbnZO?=
 =?utf-8?B?MTIwcy9KZjlsL0ZxcE1pSzQ4MGZXNlFTVFNvL0J2QnRQaW12NTNuaFppMjNE?=
 =?utf-8?B?dUVuai9XVldKczJLUys5aSs4WEd0MzNHK0NsblNpMFlOODVqZHhMNmkvckc2?=
 =?utf-8?B?YUJuRDhPNUxhdzRGMlhya013Tkp6RjBseXJvbENhMEs4V09KN0QwK0FqbGJP?=
 =?utf-8?B?ejNOTjArb1Y4QXZuU0hQNjc0MW9uQkF2Y2VwK043QkVOVklLbmZ5ZWpWVVBi?=
 =?utf-8?B?a21kSmt1UXBKMGg5bmRKZmpZVzV1c3BELzdkSFpKLzRmQzY3cVJHTHAxYXRU?=
 =?utf-8?B?RndNY1dwN0dpWnYycVRyT0hZYzRYUWtYWXIya291UUd1MVdyUjRNclZLSWc2?=
 =?utf-8?B?dGUvS2JWNGFBZGdmUEh2Q2JEd0pHTzQ3ZTFKOE51QklsclB6MmlVZUYrRTFi?=
 =?utf-8?B?NXVpNWZITkE2R3JMRWFFK280NlJHcGdEZWpOVERTd09WZUlEK0pJbUdvNGY0?=
 =?utf-8?B?MllJOWZuaE9KQm1XYnd0bHgvbXZOaFhFWjhqTjBDb1YyamxJVTdXc3ppZWxz?=
 =?utf-8?B?aDF1S3ZNNnRNdmlER3FVVmxPS0MzT2ppMUdJek13YW9CZHRqTVRqNFYzU3p0?=
 =?utf-8?B?Ujl5WlFoaGhKWnNzTXRmREhNbkxHTmVseU51ZTdkSWhBQzdOdGl4SzhvVUlS?=
 =?utf-8?B?OXJWWnd6Nk5Vb1p1eE56a20xTk1lK05zYmFCL3RScDVsVW5GYnNsajFFRFYv?=
 =?utf-8?B?ekYrVWsyeFhTQUcxT1ZvSFVYcG83am9nYzdMQmErZGFpQmVETUl0QUt2NlBj?=
 =?utf-8?B?NXFiSWRWOSs0Q0IwQlJwMzJxbWZvdU42andhbkJnaWp2d0NTRG1kRE9PZmJq?=
 =?utf-8?B?bkhzL2dPOTN2N2ErNVgvVitSamN1eGk0eVUvRWU0eTAvYjRldk10Y0toM25l?=
 =?utf-8?B?U2t1dzBpeFk4ODM1ZkxRcFhTVFRvMitqemVLK1Ayd0ZxNUxjTUQyeUs3NE1s?=
 =?utf-8?B?RmdYd1RuYVRqU010WW9UVWdQZHJ1alhNcUc0RW03cCs1d2VVcjg1WVNJK2hP?=
 =?utf-8?B?VHE4RWp6WExVUEl3RGhlRExQRFdUTTgvcFFiaUFNNFZtbkVLdGtkUWs4K0px?=
 =?utf-8?B?RFdLaWVFZ0JRbUhwTS9WRGh2YUFMVVJ6RGhZdnpLanYzbHB1L29oN2JvYWV0?=
 =?utf-8?B?V0JIVGRsS0IwajYwTXVpNDk2ZmRuY1M4Nm5KZG5YUnRIMEpJcTdOS1I4UU9K?=
 =?utf-8?B?RElKT09Hd0Z0ZW1KeUllMEVUQzZzYnhHbjJYR1h3NUtPR1VydS9UdGY0QWhh?=
 =?utf-8?B?WTA5TjdvSVNFZHJtYnA2cGhMVjh3eWZORHAxZ0o3MGNXaDAyUFoybnhjM0pI?=
 =?utf-8?B?MmI4aVhZL1hlUWlRSVg0WTNoYkdXVFdKQXorbHc4SnBmSkpTRGhyOGEzTFJ3?=
 =?utf-8?B?QzR3T1FnT0RPVFBUT1lFVlhRZ3duYldwcUUxN2dKa2FiZGgyd21rckNPMFBn?=
 =?utf-8?B?ekhNY0swc1VVcTg2enlxU2RUNThzTExkQXorVUl3SVpHNk53UHB6U3AzblNz?=
 =?utf-8?B?bGVHNjBwRWlLWHY4NnRxcFlWcEJSQXdUT0ZKalBscm1iUEpoclVsWVBaQkt2?=
 =?utf-8?B?QzAzQnY1VW4rdVZGWUl6emRJSlFxNmI5dHlkdHJvaUZTT2tVTWhnU2lUYjZV?=
 =?utf-8?B?bTJHNG1YRkE0QXZuVHFMZlNUWXJtWlJxek5GODFmT05IcVFEeUFsb1FEUGNt?=
 =?utf-8?B?eEMydnNWS1JzdWFiTkQ2dkRFZ3p6N3RDYzVHUUFtNmZ6MHoybkpoQmozQm5I?=
 =?utf-8?B?UXBpeVNKcElpRDd2UG1FRElQblpJanlKalQvbjlzclNubFVCWUR3N0owSXhF?=
 =?utf-8?B?THVTR1RYTW04K3UzeTlZZlMzOWhlclNzVi8yano2eXF1Um1KYkNPWUtMcnFz?=
 =?utf-8?B?eXBkT2xyZnY0TUJidGN2eUJ6dFNXYU1uTGQzWHVCc0tVMmlxN2M4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8102d49-8f51-46e7-9026-08dea4edd7f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 06:17:37.0145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wNxkBXZSE60jG9GI6qeC+xCwWka+YQEfT98x0ccaV2HfeSHhkzHS6yW6zxigLwfyfIVXHmQcKUSoOzvpW2kvvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709
X-Rspamd-Queue-Id: 7F48147DFC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35640-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

SGkgTGludXMsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMg
V2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDI4LCAy
MDI2IDQ6NTAgQU0NCj4gVG86IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5j
b20+DQo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNv
bT47IE1hdXJvIENhcnZhbGhvDQo+IENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZg0KPiBLb3psb3dza2kgPGtyemsrZHRA
a2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEZyYW5rDQo+
IExpIDxmcmFuay5saUBueHAuY29tPjsgVmxhZGltaXIgWmFwb2xza2l5IDx2ekBtbGVpYS5jb20+
OyBCYXJ0b3N6DQo+IEdvbGFzemV3c2tpIDxicmdsQGtlcm5lbC5vcmc+OyBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1ncGlvQHZn
ZXIua2VybmVsLm9yZzsgRy5OLiBaaG91IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY2IDEvNF0gZHQtYmluZGluZ3M6IG1lZGlhOiB0aSxkczkwdWI5NTM6IEFk
ZCBzdXBwb3J0IGZvcg0KPiByZW1vdGUgR1BJTyBkYXRhIHNvdXJjZQ0KPiANCj4gT24gTW9uLCBB
cHIgMjcsIDIwMjYgYXQgMTE6MTPigK9BTSBHLk4uIFpob3UgKE9TUykNCj4gPGd1b25pdS56aG91
QG9zcy5ueHAuY29tPiB3cm90ZToNCj4gPiBbTWVdDQo+IA0KPiA+ID4gSSB1bmRlcnN0YW5kIHRo
YXQgdGhlIGRyaXZlciBuZWVkcyB0byBkZWFsIHdpdGggdGhpcyBpbiBhDQo+ID4gPiBwZXItZ3Bp
by1saW5lIGJhc2lzIHRob3VnaCwgaGF2ZSB5b3UgY29uc2lkZXJlZDoNCj4gPiA+DQo+ID4gPiAx
LiBKdXN0IGhhcmQtY29kaW5nIHRoaXMgaW50byB0aGUgZHJpdmVyIGJhc2VkIG9uIHRoZSAuY29t
cGF0aWJsZQ0KPiA+ID4gICBzdHJpbmcsIGlmIHRoZSByZW1vdGUgR1BJT3MgYXJlIGFsd2F5cyB0
aGUgc2FtZSBmb3IgdGhpcyBUSSB0aGluZz8NCj4gPiA+DQo+ID4gPiAyLiBJZiBpdCBpcyBqdXN0
IGZvciBvbmUgcGFydGljdWxhciBzeXN0ZW0sIHlvdSAqY291bGQqIGFjdHVhbGx5IGhhdmUNCj4g
PiA+ICAgYSB0YWJsZS9tYXNrIGluc2lkZSB0aGUgZHJpdmVyIGZvciB0aGlzOg0KPiA+ID4gICBp
ZiAob2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJteS1mdW5reS1zeXN0ZW0iKSkgd2hpY2ggd2ls
bA0KPiA+ID4gICBraWNrIGluIG9ubHkgb24gdGhhdCB2ZXJ5IG1hY2hpbmUsDQo+ID4gPg0KPiA+
ID4gMy4gSWYgeW91IHJlYWxseSB3YW50IHRvIHN0b3JlIHRoZSBpbmZvcm1hdGlvbiBpbiB0aGUg
bWVkaWEgaTJjDQo+ID4gPiAgIGRldmljZSBub2RlLCBhZGQgc29tZSBjdXN0b20gcHJvcGVydHkg
bGlrZSB0aGlzOg0KPiA+ID4gICB0aSxyZW1vdGUtc291cmNlcyA9IDwweDAwMDAwMDFmPjsNCj4g
PiA+ICAgd2hlcmUgYSBiaXQgaXMgc2V0IHRvIDEgZm9yIGVhY2ggR1BJTyB3aGljaCBpcyByZW1v
dGUuDQo+ID4gPg0KPiA+ID4gUHV0dGluZyBmbGFncyBvbiB0aGUgR1BJTyBsaW5lcyB0aGVtc2Vs
dmVzIHNlZW1zIHRvbyBjb21wbGV4IGFuZA0KPiA+ID4gc3lzdGVtLSBzcGVjaWZpYy4NCj4gPg0K
PiA+IFRoYW5rIHlvdSBmb3IgdGhlIGRldGFpbGVkIGZlZWRiYWNrLg0KPiA+DQo+ID4gQWZ0ZXIg
Y29uc2lkZXJpbmcgeW91ciBzdWdnZXN0aW9ucywgSSB0aGluayBvcHRpb24gMyAoY3VzdG9tIGRl
dmljZQ0KPiA+IHByb3BlcnR5KSBpcyB0aGUgbW9zdCBhcHByb3ByaWF0ZSBhcHByb2FjaCBmb3Ig
dGhpcyBjYXNlLg0KPiANCj4gV2h5IGlzIHRoYXQgdGhlIG1vc3QgYXBwcm9wcmlhdGU/DQo+IA0K
PiBJIHRoaW5rICgxKSBpcyBtb3N0IGFwcHJvcHJpYXRlLCBpZiB0aGUgaGFyZHdhcmUgd2l0aCB0
aGlzIGNvbXBhdGlibGUgYWx3YXlzDQo+IGxvb2tzIGxpa2UgdGhpcy4gWW91IG5lZWQgdG8gYW5z
d2VyIHRoZSBxdWVzdGlvbiBpZiB0aGlzIGlzIGEgcGVyLXN5c3RlbSBmbGFnIGZvcg0KPiB0aGUg
R1BJTyBsaW5lcyBvciBzb21ldGhpbmcgdGhhdCBpcyAqYWx3YXlzKiBhcHBsaWNhYmxlIGZvciBh
IGRldmljZSB3aXRoDQo+IGNvbXBhdGlibGUgdGksZHM5MHViOU5OLXExPw0KPiANCj4gSWYgaXQg
Zm9yIGV4YW1wbGUgYWx3YXlzIGFwcGxpZXMgdG8gdGksZHM5MHViOTcxLXExLCB0aGVuIG1ha2Ug
dGhhdCBjb21wYXRpYmxlDQo+IGRlY2lkZSBob3cgdG8gaGFuZGxlIGluZHZpZHVhbCBsaW5lLCBq
dXN0IHdyaXRlIGNvZGUgZm9yIGl0LiBUaGF0IGlzIGNhc2UgKDEpLg0KPiANCj4gSWYgdGhpcyBz
ZXR0aW5nIGRlcGVuZHMgb24gaG93IHRoZSBzZXJpYWxpemVyIGlzIGludGVncmF0ZWQgYW5kIHRo
ZSByZW1vdGUNCj4gc2V0dGluZyBtYXkgYXBwbHkgdG8gc29tZSBzeXN0ZW1zIHdpdGggdGhpcyBk
ZXZpY2UgYW5kIG5vdCBvdGhlcnMsIHlvdSBoYXZlDQo+IG9wdGlvbnMgKDIpIGFuZCAoMykuDQo+
IA0KPiA+IEhvd2V2ZXIsIEkgaW5pdGlhbGx5IGltcGxlbWVudGVkIHRoaXMgdXNpbmcgYSBjdXN0
b20gZGV2aWNlIHByb3BlcnR5DQo+ID4gKHRpLGdwaW8tZGF0YSkgaW4gdjEgWzFdLCBhbmQgVmxh
ZGltaXIgcmVqZWN0ZWQgdGhhdCBhcHByb2FjaC4NCj4gDQo+IFZsYWRpbWlyIGlzIHNheWluZyB0
aGF0IHRoZSBkcml2ZXIgY29kZSBzaG91bGQgaGFuZGxlIHRoaXMgd2l0aG91dCBhbnkgZXh0cmEg
RFQNCj4gcHJvcGVydGllcy4gVGhhdCBjYW4gYmUgZG9uZSB3aXRoIGFwcHJvYWNoDQo+ICgxKSBh
bmQgKDIpLiBCdXQgSSBkb24ndCBrbm93IGFib3V0IHRoYXQuDQo+IA0KPiBJIHRoaW5rIHRoZSBi
YXNpYyBwcm9ibGVtIHdpdGggdGhlIHBhdGNoIGlzIHRoYXQgbm8tb25lIChteXNlbGYgaW5jbHVk
ZWQpIGFwYXJ0DQo+IGZyb20geW91IHVuZGVyc3RhbmQgd2hhdCBhIHJlbW90ZSBzZXJpYWxpemVy
IGlzLCB3aHkgaXQgaXMgcmVtb3RlIGFuZCB3aGF0DQo+IHRoYXQgbWVhbnMsIGhvdyB0aGUgbWVj
aGFuaXNtIGJldHdlZW4gdGhlIGNvbXBvbmVudHMgbWFraW5nIHVwIHRoaXMNCj4gZXNzZW50aWFs
bHkgd29ya3MgZXRjLiBJLmUuIGEgbXVjaCBsb25nZXIgYW5kIG1vcmUgZGV0YWlsZWQgY29tbWl0
IG1lc3NhZ2UNCj4gYW5kIGJpbmRpbmcgZXhwbGFpbmluZyB2ZXJ5IGNsZWFyeSB3aGF0IHRoaXMg
aXMgYW5kIGhvdyBpdCB3b3JrcyBhbmQgd2h5IHRoZQ0KPiBzcGVjaWFsIHByb3BlcnR5IGlzIG5l
ZWRlZCBvbiBzb21lIGxpbmVzLCBhbmQgaG93IGl0IGlzIGEgcHJvcGVydHkgb2Ygc29tZQ0KPiBz
cGVjaWZpYyB3YXkgb2YgaW50ZWdyYXRpbmcgdGhpcyBHUElPIGNvbnRyb2xsZXIuDQo+IA0KPiBJ
ZiBhIGN1c3RvbSBwcm9wZXJ0eSBzaG91bGQgYmUgdXNlZCB0aSxncGlvLWRhdGEgaXMgdG9vIGdl
bmVyaWMsIGNvbWUgdXAgd2l0aCBhDQo+IHByb3BlcnR5IG5hbWUgdGhhdCBhY3R1YWxseSBzYXlz
IHdoYXQgaXQgaXMgYWxsIGFib3V0IGFuZCB3aGljaCBhbnlvbmUgd291bGQNCj4gdW5kZXJzdGFu
ZC4gImdwaW8tZGF0YSIgaXMgYSBiaXQgInRoZSB0aGluZyB0aGF0IGRvZXMgdGhlIHRoaW5nIiBh
bmQgb3Zlcmx5DQo+IGdlbmVyaWMgdGVybS4NCg0KVGhhbmsgeW91IGZvciB0aGlzIGZlZWRiYWNr
LiBMZXQgbWUgZXhwbGFpbiB0aGUgaGFyZHdhcmUgYXJjaGl0ZWN0dXJlIGFuZCB0aGUNCnJlYXNv
biBJIGNob3NlIG9wdGlvbiAoMykuDQoNCkhhcmR3YXJlIEFyY2hpdGVjdHVyZToNClNvQyAtLS0g
STJDIC0tLSBEUzkwVUI5NjAgKERlc2VyaWFsaXplcikgLS0tKy0tLSBGUEQtTGluayAtLS0gRFM5
MFVCOTUzIChTZXIpIC0tLSBPWDAzQzEwIENhbWVyYQ0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKy0tLSBG
UEQtTGluayAtLS0gRFM5MFVCOTUzIChTZXIpIC0tLSBPWDAzQzEwIENhbWVyYQ0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKy0tLSBGUEQtTGluayAtLS0gRFM5MFVCOTUzIChTZXIpIC0tLSBPWDAzQzEwIENh
bWVyYQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKy0tLSBGUEQtTGluayAtLS0gRFM5MFVCOTUzIChTZXIp
IC0tLSBPWDAzQzEwIENhbWVyYQ0KDQpFYWNoIERTOTBVQjk1MyBzZXJpYWxpemVyIGhhcyA0IEdQ
SU8gcGlucy4gT25lIG9mIHRoZXNlIEdQSU9zIGNvbm5lY3RzIHRvIHRoZQ0KT1gwM0MxMCBjYW1l
cmEncyBGU0lOIChmcmFtZSBzeW5jIGlucHV0KSBwaW4gZm9yIG11bHRpLWNhbWVyYSBzeW5jaHJv
bml6YXRpb24uDQoNClRoZSBQcm9ibGVtIC0gUmVtb3RlIHZzIExvY2FsIEdQSU8gRGF0YSBTb3Vy
Y2U6DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KVGhl
IERTOTBVQjk1MydzIEdQSU8gcGlucyBjYW4gb3BlcmF0ZSBpbiB0d28gbW9kZXM6DQoxLiBMT0NB
TCBtb2RlOiBHUElPIGRhdGEgY29tZXMgZnJvbSB0aGUgSTJDLWNvbnRyb2xsZWQgR1BJTyByZWdp
c3Rlcg0KICAgLSBTdGFuZGFyZCBHUElPIGV4cGFuZGVyIGJlaGF2aW9yDQogICAtIERhdGEgd3Jp
dHRlbiB2aWEgSTJDIGNvbnRyb2xzIHRoZSBwaW4gc3RhdGUNCg0KMi4gUkVNT1RFIG1vZGU6IEdQ
SU8gZGF0YSBjb21lcyBmcm9tIHRoZSBEUzkwVUI5NjAgZGVzZXJpYWxpemVyDQogICAtIFRoZSBE
UzkwVUI5NjAgZ2VuZXJhdGVzIGEgZnJhbWUgc3luYyBzaWduYWwgaW50ZXJuYWxseQ0KICAgLSBU
aGlzIHNpZ25hbCBpcyB0cmFuc21pdHRlZCB0byB0aGUgRFM5MFVCOTUzIHZpYSB0aGUgRlBELUxp
bmsgYmFjayBjaGFubmVsDQogICAtIFRoZSBEUzkwVUI5NTMgcm91dGVzIHRoaXMgcmVtb3RlIHNp
Z25hbCB0byB0aGUgc3BlY2lmaWVkIEdQSU8gcGluDQogICAtIFRoZSBHUElPIHBpbiBzdGF0ZSBp
cyBOT1QgY29udHJvbGxlZCBieSBJMkMgcmVnaXN0ZXIgd3JpdGVzDQoNCkZvciBjYW1lcmEgc3lu
Y2hyb25pemF0aW9uLCB3ZSBuZWVkIFJFTU9URSBtb2RlOiB0aGUgRlNJTiBHUElPIG11c3QgcmVj
ZWl2ZQ0KdGhlIGZyYW1lIHN5bmMgc2lnbmFsIGZyb20gdGhlIGRlc2VyaWFsaXplciwgbm90IGZy
b20gbG9jYWwgSTJDIHdyaXRlcy4NCg0KUmVnYXJkaW5nIG9wdGlvbjEsIHRoZSByZW1vdGUgR1BJ
TyBjb25maWd1cmF0aW9uIGNhbiB2YXJ5IGJldHdlZW4gZGlmZmVyZW50IGJvYXJkDQpkZXNpZ25z
IHVzaW5nIHRoZSBzYW1lIFRJIGRldmljZSwgc28gaGFyZC1jb2RpbmcgYmFzZWQgb24gLmNvbXBh
dGlibGUgd291bGRuJ3QgYmUNCmZsZXhpYmxlIGVub3VnaC4gDQoNClJlZ2FyZGluZyBvcHRpb24g
MiwgaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgZHJpdmVyIHdvdWxkIHJlcXVpcmUgYWRkaW5n
IGEgbmV3DQpjb21wYXRpYmxlIHN0cmluZyBvciBtYXNrIGVudHJ5IGZvciBldmVyeSBkaWZmZXJl
bnQgYm9hcmQgY29uZmlndXJhdGlvbiwgd2hpY2gNCmRvZXNuJ3Qgc2NhbGUgd2VsbC4NCg0KPiAN
Cj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg==

