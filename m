Return-Path: <linux-gpio+bounces-10386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5966E97ED8F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 17:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FA14281D7B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 15:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0EF199FA9;
	Mon, 23 Sep 2024 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S7CITdNF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013018.outbound.protection.outlook.com [52.101.67.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4426BFC7;
	Mon, 23 Sep 2024 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727103922; cv=fail; b=UCC6HncaI6H6boD22iCNLDdBmH7zINUqG+AZib0NRXijGVC2SldfFgyKCLBtN3VITVHkre4EfX4tK4sV0oqhs3incz08M0bpRrv6IzA1pKcVYOGSRe6XqNcKdp65sbG4N5iRt5Pe3ULwJlgAnCVl8JvCIPT6pTQi8UVpB4xxgWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727103922; c=relaxed/simple;
	bh=c5b6KyHIq1V44DkYYJaRqp64wmV6xumrwMNgAGllQjY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VkGOdw1vjbWrhDpW32diDBzbvTbdsf/tJ/POx0x6hB01p6DwLHzDIqwPr+V+f5G15A4+dpMTvcv1CGmuAReGnh5wzOW9fMLcMJ8mlcv/4cFNOywc2fzUK1Y9pfYp69XD/g9z4sjyK03OC6qde5hd1P1EeRI9Bl1ZVH92RizesXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S7CITdNF; arc=fail smtp.client-ip=52.101.67.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJiybklBRjOCxFhlTMk97F5xr9Vw6aXix4/DNxohp3pw5d9ipK57qWrdO3CY62fV39Hd61q9PxmWOQNfZJV9sra7OCTBdmT88M5QtD8UBYnZ5cv8O6d5+BzeEnStSF0ly2P2ctoBJspQ9A7clid6qOFQigcKEp5E0nXbKsM5cmOh1i37lIBX7OS17ree5NT2Hfcx8l1wq9yOUVUlAybo0QNrk/MeJ+h8gxgptqo/tPxNN2bF4CSrMV2tjIoJ1dPOV4kd17QH3WRhAuqhee5DdP1Naj6LyFH45SF/rKwqsTUb6JuzWtwNVaFcdXGfE/1N806Kxd91PH5IWtamTt4ekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mapwL9Pg2h16CT6/OAPTlCzup+AlGEcAyVDJBwWorfs=;
 b=DjLL5bG/Yn6SH9tFYjTlCYDnk4mTBji2jhEFZxC/leWnnOfynMSHSKDDWV6ZSu84gbGhArjqrLU2pXDXSdfF+Pqo2IT4x4oUfdk7bkSjfNF8qpJ2xZH8pQQIUuQhlEvHnz2cs+mxL3hQg0NjNuVyB+hAL69M20gz8Mn5ko0h8R3Mx5cowYIwQrvb7vPE5f3oY7QPyPzU0p6JMMsnWKQ5ZcPOdvfbcuRIQz0oXuZF2wR5EAvWNlbBLuO2UmWNnR4rhz+otVGnGEJ9ON9SBGPPuydG5yFAIqhNhcLSMLYQojcvuZ8AGWMZHSgDhWDhWZNN4BctBsuXaMSFx2G+QhvKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mapwL9Pg2h16CT6/OAPTlCzup+AlGEcAyVDJBwWorfs=;
 b=S7CITdNFUeXmxPq0R05fQML7kJkNC5TKom5qeZYFntzCdSBaXBgELIN9W77npBqM8t0xCNQtILOWDZ0SNlywrB2Fpwbbb0z1KzWBhy++UiVwamgKNGvxEdUNLTLF5Tfh71vTnQzMCQVA/dDNoEW1uEOXtI45tlq1F9OI/VliR0Uf3i5GIo33z9RLGaTpsm0cpJWjpTY/tVWatRK2l/A6FjKeC46H7j1w381/F7NOZ2tZLgU4uK2X224rkFbt8dJVZzfPwzBCw3SejdxNHGyb19t+SMBulxoR4NFk5WwHcKPocXb0wpmIGi/uOEXlY12XV7TzzuWREoWyvoQXej1+ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DU4PR04MB10983.eurprd04.prod.outlook.com (2603:10a6:10:58c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 15:05:13 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Mon, 23 Sep 2024
 15:05:13 +0000
Message-ID: <9cc9ba40-fbfc-4144-a41f-0de2307e692e@oss.nxp.com>
Date: Mon, 23 Sep 2024 18:05:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
 <3c73mvygog72vjs4qkg7cvk5ayncy6izeysgyfxj33ua5vuft5@dxbzlnxvb653>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <3c73mvygog72vjs4qkg7cvk5ayncy6izeysgyfxj33ua5vuft5@dxbzlnxvb653>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0032.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::21) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DU4PR04MB10983:EE_
X-MS-Office365-Filtering-Correlation-Id: a020de65-93df-4723-897b-08dcdbe11fcf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0N4MlNhdG5KWFlNNG5XeUcxOHdybkdnS0Y0V2RZb3JBdHNkTVRob2ZGK21x?=
 =?utf-8?B?d2s4MUllOGZXbXNuRDFHNVlwUEFnOWNDcUt1aGFGWGJKa1VMVlRDSldYMW9H?=
 =?utf-8?B?RTZUVythT296U3lnRjBiSVZORVV1WXhzc0xSYVRWbzQ4bFFsNTNsNjZSQkIy?=
 =?utf-8?B?TVoxRGpCRTE2aHFHcThoYXV5QzIwNmd4UGhvS1A4Yml6V1FjbnF0N05mdXpw?=
 =?utf-8?B?SytDbm9JM1BabElwRUJLeUZZV3RmMEZpK1RsL29SSlJ5UnIxbExhbTNuMEw4?=
 =?utf-8?B?c3dQWmVwc0hVTisrOFJYUm1EdmNQN2h3bWY3VURRMnZkWjZOazlyd1NyQVJT?=
 =?utf-8?B?K0NZcHlBaFJENmc2VUhPYjFXb05GS256OTgzbUgzVGtjMmxMUlZBaTlRbjVq?=
 =?utf-8?B?R3NvcWVKc3Z0bzloVDJGcUx0ZXdPSmNqSEY3M25PTVA3SXQzak1nQ0pvUFJM?=
 =?utf-8?B?b1UvNDZhUUdIYzFWWWc0eFl6NVhtUHZuZmp6M3duQnAyOGtOekZSVlFpSjBM?=
 =?utf-8?B?aVFmeXV6blhuUkl6T0E2YVJ4VkErM1d2M04zZlVvRndqNDhYNGZmajRiUGZG?=
 =?utf-8?B?Zi9oYWxZOEJNWW9qZHdzM1p1cnhVQ01MK1FST1pVSzdBV3ltUnZGZDcrd1lK?=
 =?utf-8?B?Rkc2Q2lLTmk1a2NIMTh1OFU2UWk2Z0NnWWpQUlY1OWpUYTBic2lUWXNSSldX?=
 =?utf-8?B?VTI3SitEUkJRQVZnV1JIZnFIc2Nsb0Z5MnJTRTNYRmovZTg0dVBabVB2eC9I?=
 =?utf-8?B?djdKNDBUMkVPTHBVVHVkU29SbVpnT2RtYkt4dFRHUWZKbU90Q1F0Tm4wOUVn?=
 =?utf-8?B?aUpKYXlSZS9ZM21jdG1tTzQ3NGJVSll4eUwrMGgzK3VuUlNHR2ZzZnRqREFJ?=
 =?utf-8?B?Ukc4VzVLZEwyL2x1YzNmSmZUNmkzTWF6Sk8wSlVpOVE5Z3JVTGpuZFNVbWI2?=
 =?utf-8?B?aDZKeUpWeHg0N1pVaVZ3SVhvWk9SQUlQOW9wcjhhYkkyVXloSVN6NGMrOTk5?=
 =?utf-8?B?Tm5UV1NjaUxhdnRsdHh0d1hmM0hlTGlkYUNIRlk4NFRGVlpkSHhzRldrc3N1?=
 =?utf-8?B?ZkV6NHZ5cUcwRnhYVzljdVBzb2dVYi9xTVBQT1Zya05GbENSQkxWdmxQQ1cv?=
 =?utf-8?B?YitxeTZRNlhnOWdMdTJTeHoxR1ZVckZncW8xWEtRZEh4MUpvZW5NRzlsNXdi?=
 =?utf-8?B?cXNoVTZ6cnk3N1FFYmVJY3g0MHZRS09OVHExNnVpdzh2bjlBQ1ZBTGJOa3pL?=
 =?utf-8?B?VDM4YlFEQmdjcmx3Zlc2SW1UbEdqNzRZTDZWU2pZVUhrSmRLV1RrNitIK0RS?=
 =?utf-8?B?S0NwVmplTGxBczlqR013V2ZsOGFiT2JwMnZxeE13bkFTS2J2alZ4Tmp3YnND?=
 =?utf-8?B?RHFlazRyZmFKVVRBWDZtbDVUTjBXQWZvSmtpUXg4aE5QdzdlMUpKR05aUURr?=
 =?utf-8?B?Z2JFZjlTTCsrNU92MHErR1pXR2VFcm5kdXFyTmZ0cmRzWmVMWUpwVFBKWUs1?=
 =?utf-8?B?S25Gcmx3YzF2NVNGQlhTdW5Sam4vTjFhRElJSWFLM09aQjJjZ09kYVdvcnVo?=
 =?utf-8?B?dTlqeTlCczk5eTlpMmVIMktOS1BrRjFwNXdYSWF0QmhCdUlrbDZvb2dFTnd0?=
 =?utf-8?B?TWFrRTYxY2VCeURKbzNWNGoyaytwSGZTZTZJQzRVZ0hRYkt6eEF6RUJ1MEhJ?=
 =?utf-8?B?MExuWTNnRnREOVg3ZmJFMnlVWk40VTkwYjhqMTA3OHltWjc3cG5hK2JBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlhPTWdUS0M5RTRZWnQvUGlPK2ZRbDdsUkpyZzM1TVdhSU5mODhlUEd5cDFy?=
 =?utf-8?B?TWpNSm5hY1hqeFNNcTNtUUVGaEd5V3hhNU5ldXlhMWVGYXdrdk9NYnI3M2Fy?=
 =?utf-8?B?Y0ticDRmNnFkTERIRUlKQVhOR0dienZrUkRUeGhMV05WcG9yemdBRjdpY1Fn?=
 =?utf-8?B?a3FjNVVYVGgwY3RWUkEwd3lsL29Qa2V5bWs0RDRUNkRBeWJESU15SmdhWDZZ?=
 =?utf-8?B?bEw5ZU8wS1d3K1BqMU1ZMGthNGpWMkVrWUdIYk9PQ1NLRGVPMEMzVHlmK015?=
 =?utf-8?B?UW93ZGdqWENRZTlIZzdKdjNlSVZZZE0zMTJOSXhvRURjWlN5d1Y5V0JxMjVI?=
 =?utf-8?B?Z2hSUVBPU1NPa1ZmWFU3YUdKTVJ0SWtaNFJtcC9aK1g2dzNwZU5tL0ZaOFFY?=
 =?utf-8?B?TGhXenhGNHZ6ODNSVVp6c2FHd0V0MGFSTDgwRGdVSWFwcE9CcFljcGVwaGIy?=
 =?utf-8?B?bGM0Q2RZTFNzS0N0YjM1ZWxkb05Fcmh5QXJNNVdRaHNINjE4eUtRU0tmRUg1?=
 =?utf-8?B?cGpsNjFDbFlPY1dGdFlvcE90YVZkS1JvRUI1YWJQRFRFTVp6QzJMYUI1WWw3?=
 =?utf-8?B?V0laNzhMQjVaUDdrZE5LcUxwU2pZUm9hOUd6cEtQeCt6eXpiWjZFQTdyTzJI?=
 =?utf-8?B?NWl0SVM1ZURDenZmdjVyWXUxeG1lV2FxR0F1Qis0RkZ5UlkrT2RZSDRVNXFr?=
 =?utf-8?B?T2pyQUNRdE92ZXRBS1VTMTU0anVtdmJQWkRvdzdqNENjZTc0NUZJdmVyazdY?=
 =?utf-8?B?SGFkeEt0SWl2L3BHWWYxbmFmQ2ZDYUFsTDhWTVlhb1lKTmJZZWI4N3NWZWNh?=
 =?utf-8?B?UXRTdnJ3Zm9LVlI0dFNVckhJbVM5dDN0OUVBQWlZdmJ4OWRkUEdZUlg2THQ2?=
 =?utf-8?B?a1VlQjF5ajJ1bXBFSWZhWEh2RXlVZ1VEei83cnhBaWxTdjZUb01uMW1CK2d3?=
 =?utf-8?B?LzlBeGdEcSt2WHRNSWRaYWgrcjNSQURsRkZrMXIvQVUyYXZtTTRzcTlGUTho?=
 =?utf-8?B?VDNYVmJkUGkyeXhia3AzbGJQQUpOdDdYRUt2R2xGOHJzMGZiMXJwcjY1ZXo3?=
 =?utf-8?B?eHB5VFhwSTQyTlpleTFwb2NPQWViUitTcktVdnI3SHJxa0t5bWk3OVY5OXZJ?=
 =?utf-8?B?aExuZ2hNa204YTZhY2FFbnZFVTNseTZPY28rVHpoTGdJNXhidkJxZThqaU1P?=
 =?utf-8?B?TWxsTGxEYWhiVFM5S083TDVOdHJ1bUNDMGZSbkNYMkRsSUtyWFY5WmVzY1Ji?=
 =?utf-8?B?ZzRlMUMvS3h3Y0JpSVRGLzJEUzlrZzJpbUZKVlVZbEVwVkJPaUZHRDZ6WVY1?=
 =?utf-8?B?TUtlZGRUTThrMkgwczZEUUFFMVhCTE93S3RpSExyUlJzOTZWeUxkaVNoY1FF?=
 =?utf-8?B?cjhVMWNJaDhoZWtvd3Q5b3Fua1JneU5zN0FWNEQySW45bVBaNDhieXJUL1NR?=
 =?utf-8?B?MGdWbnY2MWNsa2ZudzRMUHhSNG5TeHlRM2dXVzVxdU1HYjFvTXo5YklhWkI4?=
 =?utf-8?B?NEhVZGM4cExxeFVJUXpqUkliVWdCNFRqbWM4SXVlN1p4ZndYam9ZUDkyMk1n?=
 =?utf-8?B?WGMyNEpPTlpVZEJFeW1SR2xWbjlDT3NjVDF1YTB2d3BjSzBVaTlhR1BWb3Q5?=
 =?utf-8?B?TmlIaGhPeVMxWW5uWlk5UDFsV3pSVVlVVW1YV1pnYnlqVm5TSzhvSWFrWVBY?=
 =?utf-8?B?RVk5eWdXRXRnaE1CUEVGczZkRllPUTYzam9UT09mLzZQcCsxeWptK3lWTkpp?=
 =?utf-8?B?eUlJQlJkbHg5aHZtUDFHV1RQSzB6TUlJTDVBVzlKd0hvc05CMFFMTERDS1Za?=
 =?utf-8?B?SzBLek1Bbmc2WUYyNkVHaFFFZWRHL3RjbVZBVE9TTWY1MWZNWlN3cjl2bVB3?=
 =?utf-8?B?ZzV3QzR4WWNONUMvN3dXM2tMd2pHcmRVc2J3WGlZWFhkVjFtWFZ5cmJwY1Uz?=
 =?utf-8?B?OUVHNThEMm9IaEFVSDViTTYzYlNxTkZyOUR2a2t2WGlTdlNQWHlEdW1EWE1L?=
 =?utf-8?B?ektnWXJBdlIzdElrdCtwclZETW5LNk9Tb1hFOWI0djEwY0h6TjB2MFVTUEly?=
 =?utf-8?B?U3hSSk93WUNLVFQ1SFBkUWRUeUlZWGprRE9PV2hFdktVcTMybFp1S2FDOFRD?=
 =?utf-8?B?dUNyQXc2aGEvUHpWWHNtZ1dUR2dLMlM4M2ZFVXN3OFVYdjlDd0w4bkl3aER2?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a020de65-93df-4723-897b-08dcdbe11fcf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 15:05:13.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MMlKO5kYdFyskTkkzL14qFkl1jr5QWYPeU08Z2XhE3iDyTRe9zWQZylNwdAGSB24lWTHEYMo2DZQtqq/raZ2EMgMLil8PM8Td81DOJJM7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10983

Hi Krzysztof,

On 23/09/2024 00:04, Krzysztof Kozlowski wrote:
> On Thu, Sep 19, 2024 at 04:47:22PM +0300, Andrei Stefanescu wrote:
>> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
>>
>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> ---
>>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 107 ++++++++++++++++++
>>  1 file changed, 107 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>> new file mode 100644
>> index 000000000000..0548028e6745
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>> @@ -0,0 +1,107 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
> 
> Different license - see checkpatch.
> 

Thank you for pointing it out! I will fix it in v4.

> Best regards,
> Krzysztof


Best regards,
Andrei

