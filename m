Return-Path: <linux-gpio+bounces-38521-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eUq8MF27MGrwWgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38521-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:56:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 260BA68B90B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:56:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amlogic.com header.s=selector1 header.b=VOzqcc4Z;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38521-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38521-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amlogic.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93381304C7FB
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 02:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01563C2795;
	Tue, 16 Jun 2026 02:56:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022083.outbound.protection.outlook.com [52.101.126.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413FA3A9D8C;
	Tue, 16 Jun 2026 02:56:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781578575; cv=fail; b=Td/PaYmyiAeCiinvPDvz7udImpZTVMHu4OCF6gGMkwYiEuD4HHKHXeItS/PsVO13RePU9BLMlvPn5ZvOdU7Y++FU5QWSokBQ8YJra8CEx0B8xTFo0Yf50LOiJjKVIg4zKyJKumH06aYR81E5UofADuF0um1lNAQEzXKtcgCeWzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781578575; c=relaxed/simple;
	bh=YjqLF7IYlxGGcFGymguyfPdFVraDHdfjqZwn4sqf1W4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KYZz7VmcSXlQDbXfz3JtFmmYss8oMPWmmYeuoBoAmjdSkkBPgNFXlPqAQJ1oOIon0dBRRaWHwEhGbn50IbBpYnaojP6kqqZFwG4ZZR6L96ZssOZOsP6O9M3bddKbyasqJXjNdFsKO8ZQlCNskjS6hYGbToT1WCSgK5umXAVBAGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=VOzqcc4Z; arc=fail smtp.client-ip=52.101.126.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFZLMwNkxZ1gfVOVT3Y8KGcYuyWZ53oiSO8QK+dakINRILMVCP4s9rJOnerBWSfUcZydWadVI/T1a+vJ8/vSjRq8X7AJj7dH+Lui6mJ5Mjvr+5zp32edB2fZ8p+tmonp+9ohMg0Y8V2r1DWAlT7F5TL/L+rA59HprlSRhXyAvwKMFX2CvMmW5YRuNHyF8DET4jVdrwv2RcoMO/X5AD6Haou9e6ztAl3+uoAorE2DvT5jauemVxuOV/R5gD61jE1ceBzymSoWneFGq9BRcBd5s95BsN1P+DvM1Ooq1BRvbVNfBqGrzSK2Gg2yy2KqWpZZUSgJcnaCyUrri5T/fgIo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mw6i6+wueYPutLnGeT3dZN865ZxV+5fUHLGPxcyBhYk=;
 b=N13ZpVeyGSpl5qerSC65kuYvo40ixAdUa5A/1ITrEQtf89ahJ29daOxYozbHDz7mUPjhU31dVboc9WVZh4xS+fsy7V18FJjz9VFE65Oj3qVkfd6Wayu1JeKFUYkvrOZYmKLZppG6ae8BQSlS8cfN6D3YHfR46ZVH8xZPnSUs6yfHYYUswCLc2pNEN25GDrQb4zZTk5r/dMjVq8VitUGGX3BTp4iQZxHrSsBeKZkJuQkzKwSd1bWxVw2TscNgfkOiLIhodDFQlx15mpsTkmFvjwP1EdK8go7S2n5w2puNFu44geh2t2w1mgIOPJrotPF0JQIpBP1IjTNZQzMzq6PyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mw6i6+wueYPutLnGeT3dZN865ZxV+5fUHLGPxcyBhYk=;
 b=VOzqcc4ZOYlGjkE7aOL8ag69wJ8vQxP8s7WtnE+rw6wUbimkdDLUl6qOYna4koJ9CMG2Xi97Cz9No6Cyq1+I1gJ+q3UA6E3UBzN2blpqjuDkdNhp85sCkdbBNWaMaacH8WvSBYIIKRJ0pF6iRvGJEHZkvS7VMTthIxe2aulwC7Ee5CjCjSOIfdv8vWoDwYOao/tFLTYqWvd8d2LubOyvSSn1H4D+IlytjhQDHOoUZ1B2RIDmN7WqwmOK04PD+E8VIwNJ6+7B7YH9fHut7Y678IgTiJtIFENIZ5ApBUr6n8YkWcKCsVdpXZtPhm0WafhsLGC6i3VpcMZjbHMTtAgXqg==
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SE3PR03MB10535.apcprd03.prod.outlook.com (2603:1096:101:324::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Tue, 16 Jun
 2026 02:56:11 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0139.009; Tue, 16 Jun 2026
 02:56:11 +0000
Message-ID: <e18a0461-557b-40a6-ae0b-74449a292e28@amlogic.com>
Date: Tue, 16 Jun 2026 10:56:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio
 irq property
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
 <20260615-ultra-pagan-84de490070e1@spud>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260615-ultra-pagan-84de490070e1@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0191.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::9) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SE3PR03MB10535:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a968637-d1c1-439f-7635-08decb52d2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	c6M8Fsss6U6+hdvJtLtTd3uarXy2Dam/hfvlHNaSFFJuMPXERHmmxXcMzCtOYagGq3YW6UqhpYDEEFc27j7RLsauaDWkCdlv4gJQ7NRjTNXauayMVEY0B5UdHTmKG1TtXMa3leUcfYBSto5/wQY6hNt7odeJClIwq8QLlfPBrnthlwpC+ZhC/J1yHE0oVq3ePjStPKATswoYufKZ6dCIC2U+hxns4yOSMyYI2JmCOKZS9MOKQFjXiEwsesGF2baw4qmTFRyLxtfCBWwWS4UqQzO7bLqcLI+vQ2lhTgZWZwARd6v6hVYxMjaYg8bkWZO59ki74Dra9qVQ0ZPb7lc+n47XOWp7PV7NWdB5A6dSkz/2pxvHEhbkh1EQ5M+aT9ueNTYGKaqKGueoiGY+veHZUJLeYkSpZTDxV8c6eoJp7YeL36iwdhhnoyESPlvktaJU0AM5UnN7zBReha5z+YlGoy3voIrqt6q1gp90kOZS3TAacnafPhweBh7xidpx/TROMKDAtDeR0cPZ+9LM1ICIoQnZYHBxRd604b1ICs3VVjcXt5xaXfNQTzj7x/0MoC2RednbHmxn83n9miyKqlw49uiGLScsQCKA3KGzFSQ+oXxcA0jqZZTOkaA5pzaY8AVaEWdfK2iXUstVvOy9YtG9O/f2pd9Z6V6Zc+MOzccous7JZXWq7Gj5HxD2+6zRKemo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmREUWdrcDFtc0dJTmJoZVo2aWh4eDVqM1JIQS9yQ2c2dzBESU1sMGpvL0Ew?=
 =?utf-8?B?YU04OGNoQkZXTUFiZEJvRWN6M1ZvbWxob3dydVY3OWZzcEVmSUFiVXl0enBo?=
 =?utf-8?B?alRzQ2ZTVXNGRGN6UTRVZmovaW43MUtLVXAydUtDQnMxK0pHU0JqSFJGb1V4?=
 =?utf-8?B?OTF2NXVNZ2wyTDlHeVBuNE5iNThLbGl4U29GejcyMUY0REFMSStHTmNmNXdG?=
 =?utf-8?B?QVQxUnQrRkEyOEdoUXpVUkNUbGlncnlsQXhvMDhSSEdpNHZFaWduUW1QT2cy?=
 =?utf-8?B?OGhxVFEySzhwVUZ4RVE3TkF4dkE3dHZ2VnB3VVllVHV1aGtrbmMzYUl5Y1I2?=
 =?utf-8?B?Q0hhRjEzS0RGZTlpQnN4cCswalVWMjBndkgxZE1zUDZkalQrRHpwZ2J5MEZv?=
 =?utf-8?B?VjZadkM1RGRiWC93OHNXdW9wQTd2T0pZNVJhTjA4MVl5M0g2M2R1WmE3Qmor?=
 =?utf-8?B?bTBLaC9GRm9IdnlnL09PTVlaUk5yY1dHS1NuM1J6Ym1UbWFHbzNwUXVYWjlD?=
 =?utf-8?B?RDlTdDdoY3BReWd3c1NqN0VZZkNtaUkrTW04NlVIelV4TlpRYUNXQXhnQ05v?=
 =?utf-8?B?RlYwRGZBdnhJWHlqZldId3hhTVZ0VUQrT0FldCtGZG9KcjBBNGZoZHpsUUl4?=
 =?utf-8?B?UFVNazN4eWM0UjB0R1VHb0NDQXdSMGMwQmowVkIzMkFNdmh4Wk9NZzUxbFkz?=
 =?utf-8?B?NWg4Rk9hb2dTL0J1K1FFZ1kwY0dneEluWHpTRVEraGh4NTVwUUpGVEY2WlVi?=
 =?utf-8?B?bzRaYlJPSzFlcFZBMlNITS9aYVkzb095UzBNMkpYRGVKSkZTM0RUNmVSbDc3?=
 =?utf-8?B?d1hlRE53aVhjVjR1NlhLK3RsRHVlWUFOdHdMN2pYc21SekNCcjZnRVFwZDky?=
 =?utf-8?B?M2Q2L0g5RG9PUGZvb2lhcTRzVWVDd0plVTlZbEl5NGNGVm5JUzlKWHdXRVhC?=
 =?utf-8?B?KzJUM1d5aHNPZjNJRDdyY1RJbzVOUXdUQmNnZlZYTnRPU08xam5hakJEeFpU?=
 =?utf-8?B?T1dtTTFoaWkzL1QwdzBPSjFEUmU5SFh0aW5Fa3JKb3JPT0dMNERXbnBXUytr?=
 =?utf-8?B?MkVIekcwdGJ2bUJiUEhHR1paMFB5UDBUcnpPVFo1OWVpbi9ZY3ZDdHIya2Ju?=
 =?utf-8?B?V3QyN1o5clJMTzFyNU1ZbzNxTkYxdXBXeDlnM1JFWjMrR2RRcHJwNUZlREwz?=
 =?utf-8?B?aG1VZ0cxZEV4Ujh5THp0NkxKUVUzYm1TRTBBYUtPeG83TWd5RXdOV0l0b3d3?=
 =?utf-8?B?Tk1tMTVNeEtXdmJBNVVwSHRJSFNxRjNyVGR2MkZGNG5LdGE2c1lJMkFYS3VL?=
 =?utf-8?B?bC9TY2dIZE9qNS9ndWZjM216TWRiT1kyRk90Zy9vYVl3bVFhb25xcWxwQ1Bx?=
 =?utf-8?B?UTVlTjZlUEZ2V0J3Q0UyblR2Tkd1enBodDBsL01vb2hxMFV1a2tJdGtZZDNG?=
 =?utf-8?B?R0ZZV1V0SkpaRi9aVjd6R3FFY3B4THl5Y3JsWkRmSktqZ1dpNHFBbVRnM2VY?=
 =?utf-8?B?cWdUWHFNUU9hQ21Ud29NRGsvTDhtTXUxZlU3czhtQkxrbGVqR3h2ZE9abHp5?=
 =?utf-8?B?V3YxbS9QWjl1SDJLOUxDMHBaTkNzTHR3NTdId3cyYnJWYUVwaUg3RWxOUGtl?=
 =?utf-8?B?WitnU3NvNm9OcmxmUS9hc1EyQUZ2VWl2LzFqT2wxT055ZkNZVCtHOUNBWE9u?=
 =?utf-8?B?citKZ2U1bmI5VUpWSE52NzhEUExPOHlJMDN2aDF0bjQ4WTN4Y3B6QUtHNDNW?=
 =?utf-8?B?cTNENkJBK0k2OE83VHJJVG4vam1ab0Jzb1NFTGt4dHBld1VYbUlaK2VvVHlL?=
 =?utf-8?B?MmJkV3dYYUdZUUZvaXVSR0M4UEw0RUVEQ2VyYUtLUDN4dmE4ZTJNUWM2OFNR?=
 =?utf-8?B?SWdtd0dKN2dBQUNTaVRPNTNScnNyeWZWSmczZ0lzL0pLOWYrdEFsbG1nN1dR?=
 =?utf-8?B?N3BPcU5wcjBRV0FhMmk0RStFRStqNlkxd0k1ZlBhUklaSnpBN2MzSzdaelVk?=
 =?utf-8?B?bnFtZVBnUlNqSG11MXovSHdGS2h4aDVPNzF6SkdNSkZ5S3FMbC90dEVOTk5D?=
 =?utf-8?B?dFdMWlpKTTMyV21MUWVKVlVRVWhwUmxzN0I1ZHB6aC9MNWwvaW85MEc5SXFW?=
 =?utf-8?B?ekpONno0VkZUcnYzdVVqc1MrWmVEbXZBRVRWMk5pQzNISEowUEZ6RmZyZ0ZX?=
 =?utf-8?B?d1dpdm5GZkhIQ0VIVXJQSUtqTTJEVmdBaFRodGNJckw1eWthbVV3Nk8wMVJN?=
 =?utf-8?B?OUxOSTFtV3VXclZBSHprY21MKzZzSitXcDRDN1dmbWFCODNmQkRGZWM1UlBm?=
 =?utf-8?B?WTVsOGhHVzJYT1dRRTUxQThKS3JNQXhJZVRRbXUvMktqdjl1QlJ3Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a968637-d1c1-439f-7635-08decb52d2c9
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 02:56:11.8463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ES3FRwDYv1srYrSLsYgMgNyXbun+ZmeMfcsgKoTQsmI+JsqTyJOC3Yz/F3UnePTzZ3eXqQgi9Us+5tb6PiKzWkBH4SF2QrfbtIy6j07M9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB10535
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38521-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[xianwei.zhao@amlogic.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xianwei.zhao@amlogic.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,amlogic.com:dkim,amlogic.com:email,amlogic.com:mid,amlogic.com:from_mime,infradead.org:email,baylibre.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 260BA68B90B

Hi Conor,
    Thanks for your detailed review. I will drop this patch.

On 2026/6/16 00:52, Conor Dooley wrote:
> Subject:
> Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio 
> irq property
> From:
> Conor Dooley <conor@kernel.org>
> Date:
> 2026/6/16 00:52
> 
> To:
> xianwei.zhao@amlogic.com
> CC:
> Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
> Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley 
> <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin 
> Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
> Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
> linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
> devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
> linux-arm-kernel@lists.infradead.org
> 
> 
> Given Linus' comments on the cover letter,
> pw-bot: changes-requested
> 
> Thanks,
> Conor.

