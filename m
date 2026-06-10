Return-Path: <linux-gpio+bounces-38261-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cW+TDQZwKWqbWwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38261-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 16:09:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88866A1CF
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 16:09:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=IDZyt26o;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38261-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38261-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13900346835D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3534416CE7;
	Wed, 10 Jun 2026 13:58:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013025.outbound.protection.outlook.com [52.101.72.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A342825A359;
	Wed, 10 Jun 2026 13:58:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099906; cv=fail; b=mxau6F8HKiqcjPEK/pwwk2M9LtHzLqkb7Hk7YlkOG+uol9LJmD+ryBpg6plHJmPbqkS7C+W5k2Bp1iaseF5vBLbHycec0fnINFC3fhvG1NRuQPTGutd/BC7KB0wy0+okTpwX4RdQqM1m/R/UKNc0JfbbxNzXF5GxlGniNvs8y8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099906; c=relaxed/simple;
	bh=zpYcOeKPHA/eDdxgD4U58g1WMclfG+71u5sOMEirz3U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WYJu3cwyYKARuY3n4pr7ErYyVH31OgTZVyxViukoiRvsdgDK8zZtH+RQTHJ9aiiKK7F1kSqlaaW12kX8ZZiOe0krlLHlHl1HwmnOmJQH/rRfEsQ5IUSZcTIzZaj4r7vvy/PA1M30NqP6TfnxkZ2CZfuie+pqybUEpX7mQmBybTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IDZyt26o; arc=fail smtp.client-ip=52.101.72.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhRod2+ch7H4WWDzt+8EkRfKktj9kqmsU9L9h9sH97v1ZWcsxvVIfPToKCduj2QpQAzx4RRUVzJiYPuvfm86yHnemMdMnwkMeVboluj4lC1F2vG3lII3PjGswhYpATJ9r/3OnNmf9JPIykkqLAE9rb1GIwj5wIiHAUFFDBaklK4u7KfiLQQ6njqqPVODcdwJhc/9gGGdCzHGQ2OskvRsT+V9MQ93hW0uDqT1HBwETz4IDalcyC5mzDVLqS690UxZ0iMTeoSXRVyynM03z5sUwh6VKc7SiDSP5h5auAozRptoD2GkWnmEkwly5lbucdGsSCUHYH195m90EhPyldgAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBg+mM46BmAGAL77TF7OX+dNftZLdpM1MlHY7oNVNQ0=;
 b=tRCrNrlbMaOUE+xNZA1zLhfCQnds157bsprnjjcBGt4O3vnfRDJvrfiUsi+CslMUj6vgiu3D94zd1HZYZTehhSdieau1Q8AE9DvQ08dOFTsIedmrWZZeiEkwORsyq5XP0Xz8OiTK+yhRsPDUT31Vsqq73C9oIOhP0ZAHa7G27R4tIcnxSJ9Kx5nHLuY41XmB067fywF/CgG98bQ0O5TYNsVS/29V4BV5/2DxCscSG6+L1FW4aRkY+BxjnVXXiOKnD5CITsYghxMeWYvJbKuw2/0V8Jvjj9fPXyG8wHzzIkRPtMypcZM3ogrJn8EOIP0NY9Toj8KI0t7NdRzoVjIcaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBg+mM46BmAGAL77TF7OX+dNftZLdpM1MlHY7oNVNQ0=;
 b=IDZyt26om2a6wJre3QfIVsHCzlCGDZhTlN/miHMq3kb6PshKdboFyNXM/NdeY5Eh7SnpP4xpna4PEGFyTQlNELvIENov6s1go0xOodKvICozfXmtIHsPbS5MsVxSpre6nMpdB7L3HZSZ6xD2T1XxX2ewwsYusr6F02rLO055T0PT8ynVDrxYczhi887N6dGrnfwJ/CW5U54U/TAhcwo2For8Zz7Y4S/hUo+OTCuM1jitmcaSJU5kV5IFI/q+GIZRzOXxVhjExwqEwByct/Z6CdaD41t4HriF3z7r9bFMoBsURMpjopvY30wLoELIFkWqEtEpXoMML8ksHcy6b4MPuw==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DU4PR04MB10402.eurprd04.prod.outlook.com (2603:10a6:10:55b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 13:58:19 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 13:58:19 +0000
Message-ID: <72ab333a-7545-4e8c-8597-b2ddfbd94c0f@oss.nxp.com>
Date: Wed, 10 Jun 2026 16:58:14 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/6] pinctrl: s32cc: implement GPIO functionality
To: Enric Balletbo i Serra <eballetb@redhat.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>,
 Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260602080132.3256239-6-khristineandreea.barbulescu@oss.nxp.com>
 <CALE0LRu1aJAY_-7imYFFPbEwWPpodArXbxtjE-ur3UQnVt5fHw@mail.gmail.com>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <CALE0LRu1aJAY_-7imYFFPbEwWPpodArXbxtjE-ur3UQnVt5fHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::33) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DU4PR04MB10402:EE_
X-MS-Office365-Filtering-Correlation-Id: ea98f9e3-774f-4145-cbc9-08dec6f853a0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|366016|7416014|3023799007|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 puTZhPalg+RZcXJOF5S0fbxUuwvxkPCi7uB2F6pSEiDfS45w13AsVy6OXy500frFJD3pk13qo3SsUPyz3CfSkwUPNSv9XQJJFkqbsQyy2BnIEbqJP3BXkmEFPnimtLhFjLeRs0gUgguExNPd76GsnJ/cRMVRzBECtefoYV7q+rY2sHMV4HIZQ+5jJwVCNUwo2aC5ldCdffZCp4f7IYYz5r5Fa7eLgrEhqlK1en2X+JZkl4TH1qaQnybNh59kqB1gcGPMKm68MEs6cff7Vj7dUmPieXtnzTlvgQdTDOeK9JmpqohZAxtEM4GmTyZ9iWrrobh3MLVw1xP8amLASIgK7qTy8jomACOXgRcDWLHsldDJJsl9TenfFuZdwmvAtolyQqRfqw0VXyJEfiof5nf+9Ekd3xqmLLRAF6fcZo1/zYATGCqKYLXizGQiGtWg10N5Z8l6TlOMG+yCvg3idaH3cm08FbtO9zHea3sRnboL8ZdFHGgtPkywe0WEv36Usqcs+LA0xPseTpxn8P4OJUX/yaWlQKf7YRVEitsWODjGDVYno5HB5BUF0pgwBOzoDl8z4IpR0VcCstFUOqucwS4Q9UNP8y4kakbmcNGt9vCHSgdOMAOYGwxiIln7vBilvKjJkYRpRFpx1LhNSM1heRwt6pvKqoZkYm9pzP5JpBINobzbs81ZDpqQ5LvdswhJxk+XSaYYKVpRYA4q3PJmh6PM0w==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(366016)(7416014)(3023799007)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q2V3UjdISDl0WHRGNmFRSjJwWXVReENISE1UTHhFSytoQ1l5RWpobGdQWUh6?=
 =?utf-8?B?bDlQaEdLb2pyZWVXamo0by9Na0MvRTJ6Qlc3Uk1PNXVRaHQzeFYzN0lwRHRD?=
 =?utf-8?B?eENoZTNFaXZydEpsQk9hVWY5R0gwSzNHa1Jmb0dMeWt1bHdiRzRIOXFwVHBs?=
 =?utf-8?B?eDk5YlZPNndQR1JidmIya1ZiZld4SmUzdmdxVU1EMWN4aHRtVUdsSGtUTlBj?=
 =?utf-8?B?VE45bzdtQzZHbWZScWk1Z3h4YWM1YWoxUEZVR1hnR1IxWUN0RGdZYWFWeVcz?=
 =?utf-8?B?Q2hUY25BK0tWK3k0RFo4NWRXeGZOaU4ycmtpREY4QmxOd3BvT09PVEMrRGw3?=
 =?utf-8?B?Z3hGRzJlQlB6cWk3YUtsR1k4RS9VRXFMNlFMaVpvTzlGdGRGWDN3Mkt3TFpp?=
 =?utf-8?B?OHh6VVAxZTZNUTVTR2pQR2JUeStiTEc2aXptNXp3dHNsM2VmNEdrRVFPSldT?=
 =?utf-8?B?aGkzQ2NUYkZnQlRrSk0vdk9uaHBsS0t4czh0WGMzSnM4dkMwNThGa245cWZ1?=
 =?utf-8?B?cEZmQ1dNVEJwQWlkRlhGRVVCV0pYZDdDQXJoK1NGeWRibTBwNG4yWmJVenFY?=
 =?utf-8?B?WEdsRWszOFR4bzVHNFB2d1RwM0daOU1GemJXdGViQUl0MGlwczNKNnFqUExS?=
 =?utf-8?B?ZmZzYXBGQ09LSlA2T3BET25OcUptenBqUVBrcjNGdFpVcWVjSzFLT3JoVGFN?=
 =?utf-8?B?WmpHcUJuZ1lvNTZSL2RwQlpWTDBoZGMyeEY5QzBMWGkvdHlkeFBEOFdDN3dM?=
 =?utf-8?B?cWVOdHkwOXlIVE9WMWVrS1FjOFp0OWxTOHAyU1Q1dnMwQzQzY3laZnBDME55?=
 =?utf-8?B?eHpzS3U2RmVNQ2NjSDNpNGpjUUY3L051WGNkbGZOcmoxZkhJU1owSzdVK25S?=
 =?utf-8?B?WUJ3VG1QelkxTllnb3ZOZUxmV01RR0tPN3NQR05lR1RvNUJ5c3dIcVcwaXc4?=
 =?utf-8?B?Zk9YV0JZZTVIVEQxa2dHRkUxOWlYdXVhZThaY2MvdUYwYzUrYzQ1M2ptYXJa?=
 =?utf-8?B?T3cvZ2lJQ2NvVG1MOHR1cmxQdHBQQWRPV1d0bGJqZHZvc01lcmJmbmErb3RG?=
 =?utf-8?B?WU9CTmlBS24vWGFsakMzY05rZ3lZcXJsTFdvZkozUkhFa3doMUZKWDFjZ01Y?=
 =?utf-8?B?ZE9VY3BkYXhkVXg2MHUvdytQbVZYOGtXSHNPTFpFM1dQWXlTRmRwZzU3TFVY?=
 =?utf-8?B?MzFHQkFqT2JTKzBubVQ1WWt1ejRSSmpUclZSZHluMDYvWThiVzhJVzl6ZUVT?=
 =?utf-8?B?a0RQdXdJL2E2c3hIQTZyanZ1b2h1TVNUME8vcXNFbDdKbmcyVVdaZGJ2NWwz?=
 =?utf-8?B?dWpWeEIxTkk3NGt0aVQ4VHh6Y1YzaTI0N1ZjSWJiRkN1YXo5c3dQOHFDVXR3?=
 =?utf-8?B?K01aU2pXUGlGR2FOV3cvWStmd2JBUVVROERlSC9oRVg5R1FtNkh2WTlXUTYx?=
 =?utf-8?B?bzE2WEtiNVlrZGVaNEFkQlRkWG1ZNExiOXZBcTdNdjcyT2xqZ0hSZ2c2Tk9P?=
 =?utf-8?B?TDV5YzgwV0pBUGMwaEJXZmVqdGtoNXErY1Q2b3dlc0lFUk9zNWNiK1VkcEZk?=
 =?utf-8?B?RXhhK2JQUjgrVm5QY0NVNFlmMElnUldIdzkyZ2Q4K2duYkJHdTlaaXEyOVhp?=
 =?utf-8?B?RVhEQ3B4dWkzZUliR3hzSGNZcnkxRlVBWFNFeXM0NDVJNEd3bi9veTlFWmpP?=
 =?utf-8?B?dEIvZ3RHakVIRlZibU1wMGVYanpvVC80azUxVVI5NDlQbTM0eUUxeVBNRVpG?=
 =?utf-8?B?Mk9EeXpzVHE3cTBPMDJXQlZweXZHZFRWQjhkZEszVnJsQjFXL1hnK2dmUzY4?=
 =?utf-8?B?WWZnWFpqZzRJdmczUzJFOHJUYUtUTDhVeWUvRW9NTXcyQlFua0Fzdzh3NHJ0?=
 =?utf-8?B?STE0ODZkNkFrRkV3Y1IvdFZnazIzOXo3SysyU3JyWkVoeURPc2ZNODVCYzdY?=
 =?utf-8?B?aFNERDZhVXZFK3BCWFl0Zmk2ZU9vRVB0dFFZdmx3TDdOK1JJT3RuOURmVUQz?=
 =?utf-8?B?dEJmTEdLdGhhRmFqdGFNTXZzWlh3WDMxVURlNmR5UzJMMTFTYjk5QzRjYzg4?=
 =?utf-8?B?M1d1VjVsbERBK3djTEwxUllXbk1UZnUwckdYZlRTZ3M0Um4vOHFteTNIdkpE?=
 =?utf-8?B?U05MN3J5SGlhN1JWSzl2RkhJbTdJdFVHVXhUMlJ1UkVSeDA4TGRoVGFHYjQ3?=
 =?utf-8?B?S3JxekNGYlBNblhsNm9qK3dZK1MvL3QxRDFGZEJtNjd0aDhGemx0RURqQkZC?=
 =?utf-8?B?R0ZqTjJTUjYzY1ZwdmhtbGF6VS9lZHNWWVZPOStZc2JqUnBML3Q4YXRYSVBn?=
 =?utf-8?B?ZjU1ejMrdkxCNklyeHQ2aDZEUTVpVTB5VjA1TTBEamJNU1RsRlo0Q0ZvR1JZ?=
 =?utf-8?Q?yYrycCA4W+Gl1z1T4ojB01wbcDgNAvXE445Wx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea98f9e3-774f-4145-cbc9-08dec6f853a0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:58:19.2994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qe8sYECU1jdDk8ZFjPpQQOVYwCVC25S43PupZ+HmwVqawjTq39PGGxz8N6ZN8llZattFPAafaolYzdA8B9GeRM/G7IoW6dFBDsmOKMUIxWRr5y4Ue947bzBi3nlRL6RW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10402
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38261-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:eballetb@redhat.com,m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,linaro.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,cfg.name:url,oss.nxp.com:mid,oss.nxp.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C88866A1CF

On 6/2/2026 12:26 PM, Enric Balletbo i Serra wrote:
> Hi Khristine,
> 
> Thank you for the patch. I got some checkpatch warnings, could you
> take a look? And some minor comments below.
> 
> On Tue, Jun 2, 2026 at 10:02 AM Khristine Andreea Barbulescu
> <khristineandreea.barbulescu@oss.nxp.com> wrote:
>>
>> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>>
>> The updated SIUL2 block groups pinctrl, GPIO data access
>> and interrupt control within the same hardware unit.
>> The SIUL2 driver is therefore structured as a monolithic
>> pinctrl/GPIO driver.
>>
>> GPIO data access and direction handling are implemented using the
>> gpio-regmap library backed by a virtual regmap. The virtual regmap
>> translates the gpio-regmap register model to the underlying SIUL2
>> registers: MSCR for direction, PGPDI for input values and PGPDO for
>> output values.
>>
>> The existing pinctrl GPIO callbacks are used for the request/free path:
>> they switch the pad to GPIO mode on request and restore the previous
>> MSCR configuration when the GPIO is released.
>>
>> This change came as a result of upstream review in the
>> following series:
>> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandreea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
>> https://lore.kernel.org/all/20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com/
>>
>> Support both SIUL2 DT layouts:
>> - legacy pinctrl-only binding
>> - extended pinctrl/GPIO/irqchip binding
>>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
>> ---
>>  drivers/pinctrl/nxp/Kconfig         |   1 +
>>  drivers/pinctrl/nxp/pinctrl-s32.h   |  32 +-
>>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 685 +++++++++++++++++++++++++---
>>  drivers/pinctrl/nxp/pinctrl-s32g2.c |  46 +-
>>  4 files changed, 686 insertions(+), 78 deletions(-)
>>
>> diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
>> index abca7ef97003..59fc6adf5b0b 100644
>> --- a/drivers/pinctrl/nxp/Kconfig
>> +++ b/drivers/pinctrl/nxp/Kconfig
>> @@ -5,6 +5,7 @@ config PINCTRL_S32CC
>>         select GENERIC_PINCTRL_GROUPS
>>         select GENERIC_PINMUX_FUNCTIONS
>>         select GENERIC_PINCONF
>> +       select GPIO_REGMAP
>>         select REGMAP_MMIO
>>
>>  config PINCTRL_S32G2
>> diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinctrl-s32.h
>> index 8715befd5f05..c2fc5eda7eb4 100644
>> --- a/drivers/pinctrl/nxp/pinctrl-s32.h
>> +++ b/drivers/pinctrl/nxp/pinctrl-s32.h
>> @@ -2,7 +2,7 @@
>>   *
>>   * S32 pinmux core definitions
>>   *
>> - * Copyright 2016-2020, 2022 NXP
>> + * Copyright 2016-2020, 2022, 2026 NXP
>>   * Copyright (C) 2022 SUSE LLC
>>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>>   * Copyright (C) 2012 Linaro Ltd.
>> @@ -34,11 +34,39 @@ struct s32_pin_range {
>>         unsigned int end;
>>  };
>>
>> +/**
>> + * struct s32_gpio_range - contiguous GPIO pin range within a SIUL2 module
>> + * @gpio_base: first GPIO line offset in the GPIO range
>> + * @pin_base: first pinctrl pin number mapped by this GPIO range
>> + * @gpio_num: number of consecutive GPIO pins in the range
>> + */
>> +struct s32_gpio_range {
>> +       unsigned int gpio_base;
>> +       unsigned int pin_base;
>> +       unsigned int gpio_num;
>> +};
>> +
>> +/**
>> + * struct s32_gpio_pad_map - mapping between GPIO ranges and PGPD pads
>> + * @gpio_start: first GPIO line offset in the range
>> + * @gpio_end: last GPIO line offset in the range
>> + * @pad: PGPD pad number serving the range
>> + */
>> +struct s32_gpio_pad_map {
>> +       unsigned int gpio_start;
>> +       unsigned int gpio_end;
>> +       unsigned int pad;
>> +};
>> +
>>  struct s32_pinctrl_soc_data {
>>         const struct pinctrl_pin_desc *pins;
>>         unsigned int npins;
>>         const struct s32_pin_range *mem_pin_ranges;
>>         unsigned int mem_regions;
>> +       const struct s32_gpio_range *gpio_ranges;
>> +       unsigned int num_gpio_ranges;
>> +       const struct s32_gpio_pad_map *gpio_pad_maps;
>> +       unsigned int num_gpio_pad_maps;
>>  };
>>
>>  struct s32_pinctrl_soc_info {
>> @@ -53,6 +81,8 @@ struct s32_pinctrl_soc_info {
>>
>>  #define S32_PINCTRL_PIN(pin)   PINCTRL_PIN(pin, #pin)
>>  #define S32_PIN_RANGE(_start, _end) { .start = _start, .end = _end }
>> +#define S32_GPIO_RANGE(gpio, pin, num) \
>> +       { .gpio_base = gpio, .pin_base = pin, .gpio_num = num }
>>
>>  int s32_pinctrl_probe(struct platform_device *pdev,
>>                       const struct s32_pinctrl_soc_data *soc_data);
>> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
>> index 89a4eb2000ee..8843926345ec 100644
>> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
>> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
>> @@ -2,7 +2,7 @@
>>  /*
>>   * Core driver for the S32 CC (Common Chassis) pin controller
>>   *
>> - * Copyright 2017-2022,2024 NXP
>> + * Copyright 2017-2022,2024-2026 NXP
>>   * Copyright (C) 2022 SUSE LLC
>>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>>   */
>> @@ -10,6 +10,7 @@
>>  #include <linux/bitops.h>
>>  #include <linux/err.h>
>>  #include <linux/gpio/driver.h>
>> +#include <linux/gpio/regmap.h>
>>  #include <linux/init.h>
>>  #include <linux/io.h>
>>  #include <linux/module.h>
>> @@ -39,6 +40,40 @@
>>  #define S32_MSCR_ODE           BIT(20)
>>  #define S32_MSCR_OBE           BIT(21)
>>
>> +#define S32_GPIO_OP_SHIFT      16
>> +#define S32_GPIO_OP_MASK       GENMASK(19, 16)
>> +
>> +#define S32_GPIO_OP_DIR                0 /* MSCR direction */
>> +#define S32_GPIO_OP_DAT                BIT(S32_GPIO_OP_SHIFT) /* PGPDI read */
>> +#define S32_GPIO_OP_SET                BIT(S32_GPIO_OP_SHIFT + 1) /* PGPDO write */
>> +
>> +/*
>> + * [15:12] = GPIO bank / gpio range index
>> + * [11:0]  = real register offset or pin id
>> + */
>> +#define S32_GPIO_BANK_SHIFT    12
>> +#define S32_GPIO_BANK_MASK    GENMASK(15, 12)
>> +#define S32_GPIO_REG_MASK    GENMASK(11, 0)
>> +
>> +#define S32_GPIO_ENCODE(bank, off) \
>> +       ((((bank) << S32_GPIO_BANK_SHIFT) & S32_GPIO_BANK_MASK) | \
>> +               ((off) & S32_GPIO_REG_MASK))
>> +
>> +#define S32_GPIO_DECODE_BANK(reg) \
>> +       (((reg) & S32_GPIO_BANK_MASK) >> S32_GPIO_BANK_SHIFT)
>> +
>> +#define S32_GPIO_DECODE_OFF(reg) \
>> +       ((reg) & S32_GPIO_REG_MASK)
>> +
>> +/*
>> + * PGPDOs are 16bit registers that come in big endian
>> + * order if they are grouped in pairs of two.
>> + *
>> + * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
>> + */
>> +#define S32_PGPD(N)            (((N) ^ 1) * 2)
>> +#define S32_PGPD_SIZE          16
>> +
>>  enum s32_write_type {
>>         S32_PINCONF_UPDATE_ONLY,
>>         S32_PINCONF_OVERWRITE,
>> @@ -72,6 +107,18 @@ struct s32_pinctrl_mem_region {
>>         char name[8];
>>  };
>>
>> +/*
>> + * struct s32_gpio_regmaps - GPIO register maps for a SIUL2 instance
>> + * @pgpdo: regmap for Parallel GPIO Pad Data Out registers
>> + * @pgpdi: regmap for Parallel GPIO Pad Data In registers
>> + * @range: GPIO range info
>> + */
>> +struct s32_gpio_regmaps {
>> +       struct regmap *pgpdo;
>> +       struct regmap *pgpdi;
>> +       const struct s32_gpio_range *range;
>> +};
>> +
>>  /*
>>   * struct gpio_pin_config - holds pin configuration for GPIO's
>>   * @pin_id: Pin ID for this GPIO
>> @@ -98,6 +145,12 @@ struct s32_pinctrl_context {
>>   * @pctl: a pointer to the pinctrl device structure
>>   * @regions: reserved memory regions with start/end pin
>>   * @info: structure containing information about the pin
>> + * @gpio_regmaps: PGPDO/PGPDI regmaps for each SIUL2 module
>> + * @num_gpio_regmaps: number of GPIO regmap entries
>> + * @gpio_regmap: regmap bridging gpio-regmap to SIUL2 registers
>> + * @gpio_rgm: gpio-regmap instance registered for this controller
>> + * @ngpio: total number of GPIO line offsets
>> + * @gpio_names: GPIO line names array passed to gpio-regmap
>>   * @gpio_configs: saved configurations for GPIO pins
>>   * @gpio_configs_lock: lock for the `gpio_configs` list
>>   * @saved_context: configuration saved over system sleep
>> @@ -107,6 +160,12 @@ struct s32_pinctrl {
>>         struct pinctrl_dev *pctl;
>>         struct s32_pinctrl_mem_region *regions;
>>         struct s32_pinctrl_soc_info *info;
>> +       struct s32_gpio_regmaps *gpio_regmaps;
>> +       unsigned int num_gpio_regmaps;
>> +       struct regmap *gpio_regmap;
>> +       struct gpio_regmap *gpio_rgm;
>> +       unsigned int ngpio;
>> +       const char *const *gpio_names;
>>         struct list_head gpio_configs;
>>         spinlock_t gpio_configs_lock;
>>  #ifdef CONFIG_PM_SLEEP
>> @@ -356,88 +415,84 @@ static int s32_pmx_get_funcs_count(struct pinctrl_dev *pctldev)
>>         return info->nfunctions;
>>  }
>>
>> -static const char *s32_pmx_get_func_name(struct pinctrl_dev *pctldev,
>> -                                        unsigned int selector)
>> -{
>> -       struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
>> -       const struct s32_pinctrl_soc_info *info = ipctl->info;
>> -
>> -       return info->functions[selector].name;
>> -}
>> -
>> -static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
>> -                             unsigned int selector,
>> -                             const char * const **groups,
>> -                             unsigned int * const num_groups)
>> -{
>> -       struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
>> -       const struct s32_pinctrl_soc_info *info = ipctl->info;
>> -
>> -       *groups = info->functions[selector].groups;
>> -       *num_groups = info->functions[selector].ngroups;
>> -
>> -       return 0;
>> -}
>> -
>>  static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
>>                                        struct pinctrl_gpio_range *range,
>> -                                      unsigned int offset)
>> +                                      unsigned int pin)
>>  {
>>         struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
>> -       struct gpio_pin_config *gpio_pin;
>> +       struct gpio_pin_config *gpio_pin __free(kfree) = NULL;
>>         unsigned int config;
>> -       unsigned long flags;
>>         int ret;
>>
>> -       ret = s32_regmap_read(pctldev, offset, &config);
>> +       ret = s32_regmap_read(pctldev, pin, &config);
>>         if (ret)
>>                 return ret;
>>
>> -       /* Save current configuration */
>> -       gpio_pin = kmalloc_obj(*gpio_pin);
>> +       gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
> 
> Why? Isn't kmalloc_obj safer?
> 
>>         if (!gpio_pin)
>>                 return -ENOMEM;
>>
>> -       gpio_pin->pin_id = offset;
>> +       gpio_pin->pin_id = pin;
>>         gpio_pin->config = config;
>> -       INIT_LIST_HEAD(&gpio_pin->list);
>> -
>> -       spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
>> -       list_add(&gpio_pin->list, &ipctl->gpio_configs);
>> -       spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
>>
>>         /* GPIO pin means SSS = 0 */
>> -       config &= ~S32_MSCR_SSS_MASK;
>> +       ret = s32_regmap_update(pctldev, pin,
>> +                               S32_MSCR_SSS_MASK | S32_MSCR_IBE,
>> +                               S32_MSCR_IBE);
>> +       if (ret)
>> +               return ret;
>> +
>> +       scoped_guard(spinlock_irqsave, &ipctl->gpio_configs_lock)
>> +               list_add(&no_free_ptr(gpio_pin)->list, &ipctl->gpio_configs);
>>
>> -       return s32_regmap_write(pctldev, offset, config);
>> +       return 0;
>>  }
>>
>>  static void s32_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
>>                                       struct pinctrl_gpio_range *range,
>> -                                     unsigned int offset)
>> +                                     unsigned int pin)
>>  {
>>         struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
>> -       struct gpio_pin_config *gpio_pin, *tmp;
>> +       struct gpio_pin_config *gpio_pin, *found = NULL;
>>         unsigned long flags;
>> -       int ret;
>>
>>         spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
>> -
>> -       list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
>> -               if (gpio_pin->pin_id == offset) {
>> -                       ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
>> -                                                gpio_pin->config);
>> -                       if (ret != 0)
>> -                               goto unlock;
>> -
>> +       list_for_each_entry(gpio_pin, &ipctl->gpio_configs, list) {
>> +               if (gpio_pin->pin_id == pin) {
>>                         list_del(&gpio_pin->list);
>> -                       kfree(gpio_pin);
>> +                       found = gpio_pin;
>>                         break;
>>                 }
>>         }
>> -
>> -unlock:
>>         spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
>> +
>> +       if (found) {
>> +               s32_regmap_write(pctldev, found->pin_id, found->config);
>> +               kfree(found);
>> +       }
>> +}
>> +
>> +static const char *s32_pmx_get_func_name(struct pinctrl_dev *pctldev,
>> +                                        unsigned int selector)
>> +{
>> +       struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
>> +       const struct s32_pinctrl_soc_info *info = ipctl->info;
>> +
>> +       return info->functions[selector].name;
>> +}
>> +
>> +static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
>> +                             unsigned int selector,
>> +                             const char * const **groups,
>> +                             unsigned int * const num_groups)
>> +{
>> +       struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
>> +       const struct s32_pinctrl_soc_info *info = ipctl->info;
>> +
>> +       *groups = info->functions[selector].groups;
>> +       *num_groups = info->functions[selector].ngroups;
>> +
>> +       return 0;
>>  }
>>
>>  static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
>> @@ -649,9 +704,9 @@ static void s32_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>>
>>         ret = s32_regmap_read(pctldev, pin_id, &config);
>>         if (ret)
>> -               return;
>> -
>> -       seq_printf(s, "0x%x", config);
>> +               seq_printf(s, "error %d", ret);
>> +       else
>> +               seq_printf(s, "0x%x", config);
>>  }
>>
>>  static void s32_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
>> @@ -662,15 +717,13 @@ static void s32_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
>>         struct s32_pin_group *grp;
>>         unsigned int config;
>>         const char *name;
>> -       int i, ret;
>> +       int i;
>>
>>         seq_puts(s, "\n");
>>         grp = &info->groups[selector];
>>         for (i = 0; i < grp->data.npins; i++) {
>>                 name = pin_get_name(pctldev, grp->data.pins[i]);
>> -               ret = s32_regmap_read(pctldev, grp->data.pins[i], &config);
>> -               if (ret)
>> -                       return;
>> +               s32_regmap_read(pctldev, grp->data.pins[i], &config);
>>                 seq_printf(s, "%s: 0x%x\n", name, config);
>>         }
>>  }
>> @@ -683,6 +736,450 @@ static const struct pinconf_ops s32_pinconf_ops = {
>>         .pin_config_group_dbg_show = s32_pinconf_group_dbg_show,
>>  };
>>
>> +static void s32_gpio_free_saved_configs(void *data)
>> +{
>> +       struct s32_pinctrl *ipctl = data;
>> +       struct gpio_pin_config *gpio_pin, *tmp;
>> +       unsigned long flags;
>> +
>> +       spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
>> +       list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
>> +               list_del(&gpio_pin->list);
>> +               kfree(gpio_pin);
>> +       }
>> +       spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
>> +}
>> +
>> +static unsigned int s32_pin2pad(unsigned int pin)
>> +{
>> +       return pin / S32_PGPD_SIZE;
>> +}
>> +
>> +static u16 s32_pin2mask(unsigned int pin)
>> +{
>> +       /*
>> +        * From Reference manual :
>> +        * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
>> +        */
>> +       return BIT(S32_PGPD_SIZE - 1 - pin % S32_PGPD_SIZE);
>> +}
>> +
>> +static int s32_gpio_get_range(struct s32_pinctrl *ipctl,
>> +                             unsigned int gpio,
>> +                             unsigned int *pin,
>> +                             unsigned int *bank)
>> +{
>> +       const struct s32_pinctrl_soc_data *soc_data = ipctl->info->soc_data;
>> +       const struct s32_gpio_range *range;
>> +       int i;
>> +
>> +       for (i = 0; i < soc_data->num_gpio_ranges; i++) {
>> +               range = &soc_data->gpio_ranges[i];
>> +
>> +               if (gpio < range->gpio_base ||
>> +                   gpio >= range->gpio_base + range->gpio_num)
>> +                       continue;
>> +
>> +               if (pin)
>> +                       *pin = range->pin_base + gpio - range->gpio_base;
>> +
>> +               if (bank)
>> +                       *bank = i;
>> +
>> +               return 0;
>> +       }
>> +
>> +       return -EINVAL;
>> +}
>> +
>> +static int s32_gpio_pad_map_xlate(struct s32_pinctrl *ipctl,
>> +                                 unsigned int gpio,
>> +                                 unsigned int *reg_offset,
>> +                                 u16 *mask)
>> +{
>> +       const struct s32_pinctrl_soc_data *soc_data = ipctl->info->soc_data;
>> +       const struct s32_gpio_pad_map *map;
>> +       unsigned int bit;
>> +       int i;
>> +
>> +       if (!soc_data->gpio_pad_maps || !soc_data->num_gpio_pad_maps)
>> +               return -EINVAL;
>> +
>> +       for (i = 0; i < soc_data->num_gpio_pad_maps; i++) {
>> +               map = &soc_data->gpio_pad_maps[i];
>> +
>> +               if (gpio < map->gpio_start || gpio > map->gpio_end)
>> +                       continue;
>> +
>> +               bit = gpio - map->gpio_start;
>> +               *mask = BIT(S32_PGPD_SIZE - 1 - bit);
>> +               *reg_offset = S32_PGPD(map->pad);
>> +
>> +               return 0;
>> +       }
>> +
>> +       return -EINVAL;
>> +}
>> +
>> +static int s32_gpio_xlate_pgpd(struct s32_pinctrl *ipctl,
>> +                              unsigned int pin,
>> +                              unsigned int *reg_offset,
>> +                              u16 *mask)
>> +{
>> +       /*
>> +        * SIUL2_1 does not expose GPIO data registers as a linear pad sequence.
>> +        * Valid PGPD offsets there correspond to PGPD7, PGPD9, PGPD10, PGPD11.
>> +        */
>> +       if (pin >= 112)
> 
> The magic number 112 requires better documentation or a define
> 
> Or maybe, (NOT TESTED) instead of hardcoding, check if a pad map
> exists for this pin
> 
>     /* Try pad map first (needed for SIUL2_1's sparse layout) */
>     ret = s32_gpio_pad_map_xlate(ipctl, pin, reg_offset, mask);
>     if (ret != -EINVAL)
>         return ret;
> 
>     /* Fall back to linear layout (SIUL2_0) */
>     *mask = s32_pin2mask(pin);
>     *reg_offset = S32_PGPD(s32_pin2pad(pin));
>     return 0;
> 
> Does it make sense?
> 
>> +               return s32_gpio_pad_map_xlate(ipctl, pin, reg_offset, mask);
>> +
>> +       *mask = s32_pin2mask(pin);
>> +       *reg_offset = S32_PGPD(s32_pin2pad(pin));
>> +
>> +       return 0;
>> +}
>> +
>> +static int s32_gpio_reg_mask_xlate(struct gpio_regmap *gpio,
>> +                                  unsigned int base, unsigned int offset,
>> +                                  unsigned int *reg, unsigned int *mask)
>> +{
>> +       struct s32_pinctrl *ipctl = gpio_regmap_get_drvdata(gpio);
>> +       unsigned int pgpd_reg, pin, bank;
>> +       u16 pgpd_mask;
>> +       int ret;
>> +
>> +       ret = s32_gpio_get_range(ipctl, offset, &pin, &bank);
>> +       if (ret)
>> +               return ret;
>> +
>> +       switch (base) {
>> +       case S32_GPIO_OP_DIR:
>> +               /*
>> +                * Direction is controlled through MSCR OBE.
>> +                * Encode the real pin id in the virtual register.
>> +                */
>> +               *reg = S32_GPIO_OP_DIR | pin;
>> +               *mask = S32_MSCR_OBE;
>> +               return 0;
>> +
>> +       case S32_GPIO_OP_DAT:
>> +       case S32_GPIO_OP_SET:
>> +               ret = s32_gpio_xlate_pgpd(ipctl, pin, &pgpd_reg, &pgpd_mask);
>> +               if (ret)
>> +                       return ret;
>> +               /*
>> +                * Encode both the GPIO bank and the real PGPD register offset.
>> +                */
>> +               *reg = base | S32_GPIO_ENCODE(bank, pgpd_reg);
>> +               *mask = pgpd_mask;
>> +               return 0;
>> +       default:
>> +               return -EINVAL;
>> +       }
>> +}
>> +
>> +static int s32_gpio_reg_read(void *context, unsigned int reg,
>> +                            unsigned int *val)
>> +{
>> +       struct s32_pinctrl *ipctl = context;
>> +       unsigned int op = reg & S32_GPIO_OP_MASK;
>> +       unsigned int vreg = reg & ~S32_GPIO_OP_MASK;
>> +       unsigned int bank;
>> +       unsigned int offset;
>> +       struct regmap *map;
>> +
>> +       switch (op) {
>> +       case S32_GPIO_OP_DIR:
>> +               /*
>> +                * Lower bits contain the real MSCR pin id.
>> +                */
>> +               offset = S32_GPIO_DECODE_OFF(vreg);
>> +
>> +               return s32_regmap_read(ipctl->pctl, offset, val);
>> +
>> +       case S32_GPIO_OP_DAT:
>> +               bank = S32_GPIO_DECODE_BANK(vreg);
>> +               offset = S32_GPIO_DECODE_OFF(vreg);
>> +
>> +               if (bank >= ipctl->num_gpio_regmaps)
>> +                       return -EINVAL;
>> +
>> +               map = ipctl->gpio_regmaps[bank].pgpdi;
>> +               if (!map)
>> +                       return -ENODEV;
>> +
>> +               return regmap_read(map, offset, val);
>> +
>> +       case S32_GPIO_OP_SET:
>> +               /*
>> +                * gpio-regmap uses update_bits() for set, so it needs to read
>> +                * the output register before writing the updated value.
>> +                */
>> +               bank = S32_GPIO_DECODE_BANK(vreg);
>> +               offset = S32_GPIO_DECODE_OFF(vreg);
>> +
>> +               if (bank >= ipctl->num_gpio_regmaps)
>> +                       return -EINVAL;
>> +
>> +               map = ipctl->gpio_regmaps[bank].pgpdo;
>> +               if (!map)
>> +                       return -ENODEV;
>> +
>> +               return regmap_read(map, offset, val);
>> +
>> +       default:
>> +               return -EINVAL;
>> +       }
>> +}
>> +
>> +static int s32_gpio_reg_write(void *context, unsigned int reg,
>> +                             unsigned int val)
>> +{
>> +       struct s32_pinctrl *ipctl = context;
>> +       unsigned int op = reg & S32_GPIO_OP_MASK;
>> +       unsigned int vreg = reg & ~S32_GPIO_OP_MASK;
>> +       unsigned int bank, offset, config;
>> +       struct regmap *map;
>> +
>> +       switch (op) {
>> +       case S32_GPIO_OP_DIR:
>> +               /*
>> +                * gpio-regmap sets S32_MSCR_OBE for output and clears it for
>> +                * input. Keep IBE enabled for GPIOs in both cases.
>> +                */
>> +               offset = S32_GPIO_DECODE_OFF(vreg);
>> +
>> +               config = S32_MSCR_IBE;
>> +               if (val & S32_MSCR_OBE)
>> +                       config |= S32_MSCR_OBE;
>> +
>> +               return s32_regmap_update(ipctl->pctl, offset,
>> +                                        S32_MSCR_OBE | S32_MSCR_IBE,
>> +                                        config);
>> +
>> +       case S32_GPIO_OP_SET:
>> +               bank = S32_GPIO_DECODE_BANK(vreg);
>> +               offset = S32_GPIO_DECODE_OFF(vreg);
>> +
>> +               if (bank >= ipctl->num_gpio_regmaps)
>> +                       return -EINVAL;
>> +
>> +               map = ipctl->gpio_regmaps[bank].pgpdo;
>> +               if (!map)
>> +                       return -ENODEV;
>> +
>> +               return regmap_write(map, offset, val);
>> +
>> +       default:
>> +               return -EINVAL;
>> +       }
>> +}
>> +
>> +static const struct regmap_bus s32_gpio_regmap_bus = {
>> +       .reg_read = s32_gpio_reg_read,
>> +       .reg_write = s32_gpio_reg_write,
>> +};
>> +
>> +static const struct regmap_config s32_gpio_regmap_config = {
>> +       .name = "s32-gpio",
>> +       .reg_bits = 32,
>> +       .val_bits = 32,
>> +       .reg_stride = 1,
>> +       .max_register = S32_GPIO_OP_SET | S32_GPIO_BANK_MASK | S32_GPIO_REG_MASK,
>> +       .cache_type = REGCACHE_NONE,
>> +};
>> +
>> +static int s32_gpio_get_ngpio(const struct s32_pinctrl_soc_data *soc_data,
>> +                             unsigned int *ngpio)
>> +{
>> +       const struct s32_gpio_range *range;
>> +       unsigned int end, max = 0;
>> +       int i;
>> +
>> +       if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
>> +               return -EINVAL;
>> +
>> +       for (i = 0; i < soc_data->num_gpio_ranges; i++) {
>> +               range = &soc_data->gpio_ranges[i];
>> +
>> +               if (!range->gpio_num)
>> +                       return -EINVAL;
>> +
>> +               end = range->gpio_base + range->gpio_num;
>> +
>> +               /*
>> +                * gpio_ranges must be ordered by gpio_base and must not overlap.
>> +                * The GPIO line space size is derived from the highest range end.
>> +                */
>> +               if (i > 0 && range->gpio_base < max)
>> +                       return -EINVAL;
>> +
>> +               if (end > max)
>> +                       max = end;
>> +       }
>> +
>> +       *ngpio = max;
>> +
>> +       return 0;
>> +}
>> +
>> +static int s32_init_gpio_regmap(struct platform_device *pdev,
>> +                               struct s32_pinctrl *ipctl)
>> +{
>> +       ipctl->gpio_regmap =
>> +               devm_regmap_init(&pdev->dev, &s32_gpio_regmap_bus,
>> +                                ipctl, &s32_gpio_regmap_config);
>> +       if (IS_ERR(ipctl->gpio_regmap))
>> +               return dev_err_probe(&pdev->dev,
>> +                                    PTR_ERR(ipctl->gpio_regmap),
>> +                                    "Failed to init GPIO regmap\n");
>> +
>> +       return 0;
>> +}
>> +
>> +static int s32_init_valid_mask(struct gpio_chip *chip, unsigned long *mask,
>> +                              unsigned int ngpios)
>> +{
>> +       struct gpio_regmap *gpio = gpiochip_get_data(chip);
>> +       struct s32_pinctrl *ipctl = gpio_regmap_get_drvdata(gpio);
>> +       unsigned int gpio_num, pin, reg_offset;
>> +       u16 pgpd_mask;
>> +       int ret;
>> +
>> +       bitmap_zero(mask, ngpios);
>> +
>> +       for (gpio_num = 0; gpio_num < ngpios; gpio_num++) {
>> +               ret = s32_gpio_get_range(ipctl, gpio_num, &pin, NULL);
>> +               if (ret)
>> +                       continue;
>> +
>> +               ret = s32_gpio_xlate_pgpd(ipctl, pin, &reg_offset, &pgpd_mask);
>> +               if (ret)
>> +                       continue;
>> +
>> +               bitmap_set(mask, gpio_num, 1);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int s32_gpio_populate_names(struct s32_pinctrl *ipctl)
>> +{
>> +       char **names;
>> +       unsigned int gpio;
>> +       unsigned int pin;
>> +       char port;
>> +       int ret;
>> +
>> +       names = devm_kcalloc(ipctl->dev, ipctl->ngpio, sizeof(*names),
>> +                            GFP_KERNEL);
>> +       if (!names)
>> +               return -ENOMEM;
>> +
>> +       for (gpio = 0; gpio < ipctl->ngpio; gpio++) {
>> +               ret = s32_gpio_get_range(ipctl, gpio, &pin, NULL);
>> +               if (ret)
>> +                       continue;
>> +
>> +               port = 'A' + pin / 16;
>> +
>> +               names[gpio] = devm_kasprintf(ipctl->dev, GFP_KERNEL,
>> +                                            "P%c_%02u", port, pin & 0xf);
>> +               if (!names[gpio])
>> +                       return -ENOMEM;
>> +       }
>> +
>> +       ipctl->gpio_names = (const char *const *)names;
>> +
>> +       return 0;
>> +}
>> +
>> +static int s32_pinctrl_init_gpio_regmaps(struct platform_device *pdev,
>> +                                        struct s32_pinctrl *ipctl)
>> +{
>> +       const struct s32_pinctrl_soc_data *soc_data = ipctl->info->soc_data;
>> +       static const struct regmap_config pgpd_config = {
>> +               .reg_bits = 32,
>> +               .val_bits = 16,
>> +               .reg_stride = 2,
>> +       };
>> +       struct regmap_config cfg;
>> +       struct resource *res;
>> +       void __iomem *base;
>> +       unsigned int pgpdo_idx, pgpdi_idx;
>> +       unsigned int i;
>> +
>> +       if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
>> +               return 0;
>> +
>> +       ipctl->num_gpio_regmaps = soc_data->num_gpio_ranges;
>> +       ipctl->gpio_regmaps = devm_kcalloc(&pdev->dev, ipctl->num_gpio_regmaps,
>> +                                          sizeof(*ipctl->gpio_regmaps),
>> +                                          GFP_KERNEL);
>> +       if (!ipctl->gpio_regmaps)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < ipctl->num_gpio_regmaps; i++) {
>> +               ipctl->gpio_regmaps[i].range = &soc_data->gpio_ranges[i];
>> +
>> +               /*
>> +                * GPIO resources are placed after the pinctrl regions
>> +                */
>> +               pgpdo_idx = soc_data->mem_regions + i * 2;
>> +               pgpdi_idx = soc_data->mem_regions + i * 2 + 1;
>> +
>> +               /* PGPDO */
>> +               res = platform_get_resource(pdev, IORESOURCE_MEM, pgpdo_idx);
>> +               if (!res)
>> +                       return dev_err_probe(&pdev->dev, -ENOENT,
>> +                                                "Missing PGPDO resource %u\n", i);
>> +
>> +               base = devm_ioremap_resource(&pdev->dev, res);
>> +               if (IS_ERR(base))
>> +                       return PTR_ERR(base);
>> +
>> +               cfg = pgpd_config;
>> +               cfg.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "pgpdo%u", i);
>> +               if (!cfg.name)
>> +                       return -ENOMEM;
>> +
>> +               cfg.max_register = resource_size(res) - cfg.reg_stride;
>> +
>> +               ipctl->gpio_regmaps[i].pgpdo =
>> +                       devm_regmap_init_mmio(&pdev->dev, base, &cfg);
>> +               if (IS_ERR(ipctl->gpio_regmaps[i].pgpdo))
>> +                       return dev_err_probe(&pdev->dev,
>> +                                                PTR_ERR(ipctl->gpio_regmaps[i].pgpdo),
>> +                                                "Failed to init PGPDO regmap %u\n", i);
>> +
>> +               /* PGPDI */
>> +               res = platform_get_resource(pdev, IORESOURCE_MEM, pgpdi_idx);
>> +               if (!res)
>> +                       return dev_err_probe(&pdev->dev, -ENOENT,
>> +                                                "Missing PGPDI resource %u\n", i);
>> +
>> +               base = devm_ioremap_resource(&pdev->dev, res);
>> +               if (IS_ERR(base))
>> +                       return PTR_ERR(base);
>> +
>> +               cfg = pgpd_config;
>> +               cfg.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "pgpdi%u", i);
>> +               if (!cfg.name)
>> +                       return -ENOMEM;
>> +
>> +               cfg.max_register = resource_size(res) - cfg.reg_stride;
>> +
>> +               ipctl->gpio_regmaps[i].pgpdi =
>> +                       devm_regmap_init_mmio(&pdev->dev, base, &cfg);
>> +               if (IS_ERR(ipctl->gpio_regmaps[i].pgpdi))
>> +                       return dev_err_probe(&pdev->dev,
>> +                                                PTR_ERR(ipctl->gpio_regmaps[i].pgpdi),
>> +                                                "Failed to init PGPDI regmap %u\n", i);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>  #ifdef CONFIG_PM_SLEEP
>>  static bool s32_pinctrl_should_save(struct s32_pinctrl *ipctl,
>>                                     unsigned int pin)
>> @@ -710,7 +1207,6 @@ int s32_pinctrl_suspend(struct device *dev)
>>         const struct s32_pinctrl_soc_info *info = ipctl->info;
>>         struct s32_pinctrl_context *saved_context = &ipctl->saved_context;
>>         int i;
>> -       int ret;
>>         unsigned int config;
>>
>>         for (i = 0; i < info->soc_data->npins; i++) {
>> @@ -719,9 +1215,7 @@ int s32_pinctrl_suspend(struct device *dev)
>>                 if (!s32_pinctrl_should_save(ipctl, pin->number))
>>                         continue;
>>
>> -               ret = s32_regmap_read(ipctl->pctl, pin->number, &config);
>> -               if (ret)
>> -                       return -EINVAL;
>> +               s32_regmap_read(ipctl->pctl, pin->number, &config);
>>
>>                 saved_context->pads[i] = config;
>>         }
>> @@ -736,7 +1230,7 @@ int s32_pinctrl_resume(struct device *dev)
>>         const struct s32_pinctrl_soc_info *info = ipctl->info;
>>         const struct pinctrl_pin_desc *pin;
>>         struct s32_pinctrl_context *saved_context = &ipctl->saved_context;
>> -       int ret, i;
>> +       int i;
>>
>>         for (i = 0; i < info->soc_data->npins; i++) {
>>                 pin = &info->soc_data->pins[i];
>> @@ -744,10 +1238,8 @@ int s32_pinctrl_resume(struct device *dev)
>>                 if (!s32_pinctrl_should_save(ipctl, pin->number))
>>                         continue;
>>
>> -               ret = s32_regmap_write(ipctl->pctl, pin->number,
>> -                                        saved_context->pads[i]);
>> -               if (ret)
>> -                       return ret;
>> +               s32_regmap_write(ipctl->pctl, pin->number,
>> +                                saved_context->pads[i]);
>>         }
>>
>>         return 0;
>> @@ -927,13 +1419,15 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
>>  int s32_pinctrl_probe(struct platform_device *pdev,
>>                       const struct s32_pinctrl_soc_data *soc_data)
>>  {
>> -       struct s32_pinctrl *ipctl;
>> -       int ret;
>> -       struct pinctrl_desc *s32_pinctrl_desc;
>> -       struct s32_pinctrl_soc_info *info;
>>  #ifdef CONFIG_PM_SLEEP
>>         struct s32_pinctrl_context *saved_context;
>>  #endif
>> +       struct gpio_regmap_config gpio_cfg = {};
>> +       struct pinctrl_desc *s32_pinctrl_desc;
>> +       struct s32_pinctrl_soc_info *info;
>> +       struct s32_pinctrl *ipctl;
>> +       unsigned int ngpio;
>> +       int ret;
>>
>>         if (!soc_data || !soc_data->pins || !soc_data->npins) {
>>                 dev_err(&pdev->dev, "wrong pinctrl info\n");
>> @@ -959,6 +1453,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>>         INIT_LIST_HEAD(&ipctl->gpio_configs);
>>         spin_lock_init(&ipctl->gpio_configs_lock);
>>
>> +       ret = devm_add_action_or_reset(&pdev->dev,
>> +                                      s32_gpio_free_saved_configs, ipctl);
>> +       if (ret)
>> +               return ret;
>> +
>>         s32_pinctrl_desc =
>>                 devm_kzalloc(&pdev->dev, sizeof(*s32_pinctrl_desc), GFP_KERNEL);
>>         if (!s32_pinctrl_desc)
>> @@ -978,6 +1477,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>>                 return ret;
>>         }
>>
>> +       ret = s32_pinctrl_init_gpio_regmaps(pdev, ipctl);
>> +       if (ret)
>> +               return dev_err_probe(&pdev->dev, ret,
>> +                                    "Failed to init GPIO regmaps\n");
>> +
>>         ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
>>                                              ipctl, &ipctl->pctl);
>>         if (ret)
>> @@ -999,7 +1503,42 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>>                 return dev_err_probe(&pdev->dev, ret,
>>                                      "Failed to enable pinctrl\n");
>>
>> -       dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
>> +       /* Setup GPIO if GPIO ranges are defined */
>> +       if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
>> +               return 0;
>> +
>> +       ret = s32_gpio_get_ngpio(soc_data, &ngpio);
>> +       if (ret)
>> +               return dev_err_probe(&pdev->dev, ret, "Invalid GPIO ranges\n");
>> +
>> +       ipctl->ngpio = ngpio;
>> +
>> +       ret = s32_gpio_populate_names(ipctl);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = s32_init_gpio_regmap(pdev, ipctl);
>> +       if (ret)
>> +               return ret;
>> +
>> +       gpio_cfg.parent = &pdev->dev;
>> +       gpio_cfg.fwnode = dev_fwnode(&pdev->dev);
>> +       gpio_cfg.label = dev_name(&pdev->dev);
>> +       gpio_cfg.regmap = ipctl->gpio_regmap;
>> +       gpio_cfg.ngpio = ngpio;
>> +       gpio_cfg.names = ipctl->gpio_names;
>> +       gpio_cfg.reg_dir_out_base = GPIO_REGMAP_ADDR(S32_GPIO_OP_DIR);
>> +       gpio_cfg.reg_dat_base = GPIO_REGMAP_ADDR(S32_GPIO_OP_DAT);
>> +       gpio_cfg.reg_set_base = GPIO_REGMAP_ADDR(S32_GPIO_OP_SET);
>> +       gpio_cfg.reg_mask_xlate = s32_gpio_reg_mask_xlate;
>> +       gpio_cfg.init_valid_mask = s32_init_valid_mask;
>> +       gpio_cfg.drvdata = ipctl;
>> +
>> +       ipctl->gpio_rgm = devm_gpio_regmap_register(&pdev->dev, &gpio_cfg);
>> +       if (IS_ERR(ipctl->gpio_rgm))
>> +               return dev_err_probe(&pdev->dev,
>> +                                    PTR_ERR(ipctl->gpio_rgm),
>> +                                    "Unable to add gpio_regmap chip\n");
>>
>>         return 0;
>>  }
>> diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
>> index c49d28793b69..0bd6e6ab5ad1 100644
>> --- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
>> +++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
>> @@ -3,7 +3,7 @@
>>   * NXP S32G pinctrl driver
>>   *
>>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>> - * Copyright 2017-2018, 2020-2022 NXP
>> + * Copyright 2017-2018, 2020-2022, 2025-2026 NXP
>>   * Copyright (C) 2022 SUSE LLC
>>   */
>>
>> @@ -773,17 +773,47 @@ static const struct s32_pin_range s32_pin_ranges_siul2[] = {
>>         S32_PIN_RANGE(942, 1007),
>>  };
>>
>> -static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
>> +static const struct s32_gpio_range s32_gpio_ranges_siul2[] = {
>> +       S32_GPIO_RANGE(0, 0, 102),
>> +       S32_GPIO_RANGE(112, 112, 79),
>> +};
>> +
>> +/*
>> + * SIUL2_1 GPIO ranges mapped to sparse PGPD pads.
>> + *
>> + * SIUL2_1 does not expose GPIO data registers as a linear pad
>> + * sequence. Each entry describes a contiguous GPIO offset range
>> + * and the PGPD pad servicing that range.
>> + */
>> +static const struct s32_gpio_pad_map s32g_gpio_pad_maps[] = {
>> +       { 112, 122, 7  }, /* PH_00 .. PH_10 -> PGPD7  */
>> +       { 144, 159, 9  }, /* PJ_00 .. PJ_15 -> PGPD9  */
>> +       { 160, 175, 10 }, /* PK_00 .. PK_15 -> PGPD10 */
>> +       { 176, 190, 11 }, /* PL_00 .. PL_14 -> PGPD11 */
>> +};
>> +
>> +/* Legacy data for old DT bindings without GPIO support */
>> +static const struct s32_pinctrl_soc_data legacy_s32g_pinctrl_data = {
>> +       .pins = s32_pinctrl_pads_siul2,
>> +       .npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
>> +       .mem_pin_ranges = s32_pin_ranges_siul2,
>> +       .mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
>> +};
>> +
>> +static const struct s32_pinctrl_soc_data s32g_pinctrl_data = {
>>         .pins = s32_pinctrl_pads_siul2,
>>         .npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
>>         .mem_pin_ranges = s32_pin_ranges_siul2,
>>         .mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
>> +       .gpio_ranges = s32_gpio_ranges_siul2,
>> +       .num_gpio_ranges = ARRAY_SIZE(s32_gpio_ranges_siul2),
>> +       .gpio_pad_maps = s32g_gpio_pad_maps,
>> +       .num_gpio_pad_maps = ARRAY_SIZE(s32g_gpio_pad_maps),
>>  };
>>
>>  static const struct of_device_id s32_pinctrl_of_match[] = {
>>         {
>>                 .compatible = "nxp,s32g2-siul2-pinctrl",
>> -               .data = &s32_pinctrl_data,
>>         },
>>         { /* sentinel */ }
>>  };
>> @@ -792,8 +822,16 @@ MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);
>>  static int s32g_pinctrl_probe(struct platform_device *pdev)
>>  {
>>         const struct s32_pinctrl_soc_data *soc_data;
>> +       struct device_node *np = pdev->dev.of_node;
>>
>> -       soc_data = of_device_get_match_data(&pdev->dev);
>> +       /*
>> +        * Legacy DTs only describe the pinctrl resources.
>> +        * New DT changes extend the same node with GPIO resources.
>> +        */
>> +       if (of_property_present(np, "gpio-controller"))
>> +               soc_data = &s32g_pinctrl_data;
>> +       else
>> +               soc_data = &legacy_s32g_pinctrl_data;
>>
>>         return s32_pinctrl_probe(pdev, soc_data);
>>  }
>> --
>> 2.34.1
>>
> 

Hi Enric,

Thanks for your feedback!
 
I have addressed the two points from your review in
the new patch series (v11):
- `kmalloc_obj` usage is now correct in the GPIO request path
- The SIUL2_1 sparse PGPD layout is handled via a `sparse`
flag on `struct s32_gpio_range` and a pad-map-driven xlate,
removing the magic number 112 that was previously used
as a boundary check.
 
Regarding the remaining checkpatch warning:
I don t think `cfg` should be declared `const` because
it is a per-iteration copy of the `pgpd_config` template
that gets two fields written at runtime: `cfg.name` and
`cfg.max_register`(derived from the resource size).
Making the base template `pgpd_config` const (which it is)
I think is the right approach here.

Best regards,
Khristine


