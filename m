Return-Path: <linux-gpio+bounces-28125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A314C36040
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 15:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C33CF1A21649
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 14:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EE2314B9E;
	Wed,  5 Nov 2025 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="cjKbj2Jf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021110.outbound.protection.outlook.com [52.101.65.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23292139C9;
	Wed,  5 Nov 2025 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762352370; cv=fail; b=tKmEjtnL09uiN97EIGM5SCfFmKw0pmhObNcbIxeuwItDUagDKGsql7fqPYM06gJitYxTWseoDy2Y2VhHN6wC2GJ1PzxlxXT+M6FdgnrxV7od0Srbp5G2snSDZXwS6LqvKkeSwUo6aev5cRehHXdPeKxUkmugQVHBajOTgMO738M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762352370; c=relaxed/simple;
	bh=mQRVm33PtQGtPcH21bvw/Fv1X2F0ACZRJewDbpTf384=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nLjS4WHYzc4TuAunqc6kKXJrFocWpZ6kWo+Xgg806x4uIZOUuu8khEXi9PVw3QBwH3KmpKb2whmdxbnRcHoOQHgr51lrP0LtBEQnMh+d51Tk5lLze5LtDLyJbR7LxWDd1A7/oT7X4BgIbtaCgIydjs8LxivVlhmhi9icM5JjX8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=cjKbj2Jf; arc=fail smtp.client-ip=52.101.65.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NidmipD2/qCOuHApJetXtZ5r9w0xs36qYrUC9Doqr81oKSCFM4wyiVRcFxGNL28CRJG+f7+AdpZ+YMWz1FLGgkxUtj55jEmVFH7vX1pZWfn4yRPxhPlIj3MllxJEm7wsDH1CxDV0KiBmhUoOJKRCEJ47HrigCS67umPV3OMs2LH+vWMrBKdWs6ujlFht1HmbBeS06FrQ+rMNmVuQEOPeFQqnC1PMnvVLNCipCGQFTBCnTYeVli8vZ6SMvwsJlWPLzwSyVpRrtzWt3YDhjTXphMQSdExIE1+ZMruyKEF8hvy71KeKcuchYc7I3qeInBdGnSeHlrsYlHGHJpezGzIsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fjGy+2ZHkarK24OaeGye/bCHpWLWiSt/tQbstf8Hvw=;
 b=v4QI8KRJSx/kEhRbkfbiF/hdkCI6tjidhDGFr1x8CtWNy4mKqX6T4MYmvqX2xcTkjwsb+MZLCvZOEmf8zfY1+A+udMUztkPjHQ3BLz9qAmtKFyLWgaeMBiH7u1TVH4XOrsyOnMdJugZO01btyy3HvNV+oBbD/isO/zscDNzTL3xCayipwqGZibni0+Kofb/SZuKVo5EVVkX3Y4tYnykVF0M9X7f2vQ8WLGVysNBNZG6ufuARH5Ew6ERCutw7YV5u2O0AYxN4g7EwcaKRetuKwMMak6QqqcPD0ulQPndQ85PsFB3IxsPC7Fy8QVnOv1uJulz29Up/lXjAvN5fenC2rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fjGy+2ZHkarK24OaeGye/bCHpWLWiSt/tQbstf8Hvw=;
 b=cjKbj2JfeQUNQuvxsLc8aecz1Po0TvbrVXH8aF9CbRHlnJDyb5fGzWdXSQDnDqSqje0IbwivLkPzl4HQcpoPLGrZ+TiSd1kmtkDCUseEN41RnP8MHQE0G1jptvb86xbntrxJS0GQOZRNXcoheXTTNXniLnMG57lgM2z4/gY2xjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com (2603:10a6:20b:5c1::5)
 by AS2PR02MB10376.eurprd02.prod.outlook.com (2603:10a6:20b:547::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 14:19:20 +0000
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714]) by AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714%5]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 14:19:20 +0000
Message-ID: <74603667-c77a-e791-d692-34d0201e5968@axentia.se>
Date: Wed, 5 Nov 2025 15:19:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 2/2] gpio: add gpio-line-mux driver
Content-Language: sv-SE
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Richard <thomas.richard@bootlin.com>
References: <20251105103607.393353-1-jelonek.jonas@gmail.com>
 <20251105103607.393353-3-jelonek.jonas@gmail.com>
 <CAMRc=MdQLN5s+MpkLUF2Ggc4vYo30zOXrA=8qkGmXvu7N3JjeA@mail.gmail.com>
 <12efb5b2-058e-4a9c-a45d-4b1b0ee350e7@gmail.com>
 <CAMRc=MehBmd+-z5PRQ04UTWVFYzn7U4=32kyvDCf4ZQ4iTqXhw@mail.gmail.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <CAMRc=MehBmd+-z5PRQ04UTWVFYzn7U4=32kyvDCf4ZQ4iTqXhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::21) To AS8PR02MB9235.eurprd02.prod.outlook.com
 (2603:10a6:20b:5c1::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9235:EE_|AS2PR02MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f79ef6-cb66-4357-af42-08de1c764fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXBMR28vcDZPbWF5dWd3QUNkbkVUaHY1Z3lkcDdwcmVoalBhcTkwRGNYd0RP?=
 =?utf-8?B?c0F0bWxTbmlYM0xudDM2clFWUXQ1c0tMU0pybDQwenJ0VERQNHVBU1hIUUR2?=
 =?utf-8?B?TlBTQWl0ZXVMN3NtajlYcExSMmtZTWV4bURRWTZtWFF4RnhHcC90TCtVZmxF?=
 =?utf-8?B?TUtna0xXMmhOYllpazB5VzQyYVV5bDFJbkdyNy9pS0IxczNBTW1JNWpRUXdu?=
 =?utf-8?B?cjBsVWRRTGs4WGQvMVFmV0ZvS3B3VmpzeTBuNUVBZVhaWVNtZ216TzlHc0xm?=
 =?utf-8?B?NnMyYlJNalA0OS83OThueGgrVjZqdzRzQ0RUWkhxakhPRmZIR3JyWTRwZnBO?=
 =?utf-8?B?Wlp5ckJEZ3F6NVdDc0NSWVhCNE5ZUEEwajdTelNsK2FTZUJYd3o4MUVpaWVq?=
 =?utf-8?B?ZkF6V0s4ZlRQdFVIZi9mZ1Z4bmtZTEhtKy9uNnVYKzYyQy9ubVh0dXJqbEJO?=
 =?utf-8?B?bUhIclh2OEMvY1dXU1NONFZqV21YUzVvRjZkOE8wOEZxNHhtME1OL0JhTFJQ?=
 =?utf-8?B?RmdyS1k4WHpkSkc4eDBQNE1uWnQvQjQwMnZXaklUV3NjM3VTUlN5SlQwczFk?=
 =?utf-8?B?ZXBHcXVyREFYMVZmMGhRV04xR1Bqb09ib2tncTUxci9DbWVxY3JUTkl0dFpJ?=
 =?utf-8?B?YTMvU2RsckNlcC90KzhsRHFsZ1dvOWl0cVNnSHFBRUNweGZZQ2pLbS81WG5l?=
 =?utf-8?B?WUM5Rm1SSmJ5TnFNSGwvdzViTm9UdjNKaFA0MTZvTFVSZHRRdjdXeStVemtD?=
 =?utf-8?B?RXM4K2FpVkI3b1cxZ2R3QWFaQ1RMLzFOZ0Nmc0lTOXdHeU1RVkwvZ1JmVUhO?=
 =?utf-8?B?a2NyRERzNXNZeVRrazV1TG56cmRpdlNyRWpNNkFQWUFGOTFRckFRMXptNWFD?=
 =?utf-8?B?aEdDcE1IRUZUdExFZDByTXMrUUFycmFNcklDdEdkWWdxbUhBYXdvSTJqMmRa?=
 =?utf-8?B?OFA5ZWxlMC83bUJmVmxhTHY5SmQ4UzMxM2g4ajRPMkgxdXdlQWM4azVpNWhB?=
 =?utf-8?B?Y1VuNEtxSGJNcnRDV2lrc3g3ekVQWGhZd2tDR2xXRG1mTlFReXJJS1VTK0xW?=
 =?utf-8?B?UlJIV0ZTaDQwK0EzYUI4cVpkNVluRytNaGJPRklPOXNjb0p6MEtGc3l5cWxL?=
 =?utf-8?B?VFVzVzArL2NqK0QxUlExR0o5OTUzZFRCQllpMld0OG5BTHNxMHdqeElFVHlZ?=
 =?utf-8?B?UWZ2TDdKWjdXeXNiaE1XcmtBZDNVQmsralRpMDdPcEpqZjlTNXFQZHZQRHZT?=
 =?utf-8?B?NHo2QUtrVkhWL1QrNk9EVWRRU05oWDBlSHZSKzlnTyt1eUFoMTBLeFBkZjFo?=
 =?utf-8?B?YTh2SHJZaUlYRlo5MTd4OGdFV2wvc1VQL1JWUTVPb3pXcFIvbmM0OUYvcWNm?=
 =?utf-8?B?MmRaSjVzay9HanFFVEowK0J3NVNHLzFwWlpOTXkwRm02ZkpRNGNHd21Cbkxl?=
 =?utf-8?B?VDZqNmxFK0tqa3FDMld0ODgvVmxHcDV0RkhmbDBWanMwYmhxakVqRVN4aWk1?=
 =?utf-8?B?NE90QkJBYnZkZy9WamtUY29YTENZL3h1WGxOL2RQWTF4RTF0RndxRktwWC9q?=
 =?utf-8?B?QXJiRlZ0WHpRVVlwZnFnSkh6bnNpR0dUdmwyQkVKRWRQc3QraHlKQ0dpNDJa?=
 =?utf-8?B?aStWT25LQVBxQ2lvZjJqaFIvbzRFd3R4TkN5dVdzTGRNbzVjemJXMDFRbWRJ?=
 =?utf-8?B?V0lvODQ2S3htN29CWEM5aHZ6bnBaWStpWjFmTktaei91TFo2QWVDaldEVWtp?=
 =?utf-8?B?R001YnUzclhPNktUM0JPZUwrNDFYSU04WXFiQWFjOXZycmlRL0V1YTQ3RUFP?=
 =?utf-8?B?OEUrSFZjMjRUTTA0K3lybXhOL1hmblVpUm5BSEROYlJqOTdyOEUvQlErUDAw?=
 =?utf-8?B?N01FVUpNMlh1emJoS3QwMVh5akVrWEpsR1luMnI5VjU3ZDNURjBpWHkxWTU3?=
 =?utf-8?Q?l+GzDF4uhcqk2iuYJwIBI+Bl9fhACnVv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9235.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2R2V0Q1V3k3NzZpWXZ0bmY5QzE3ZWU1NzJ5RlMwN204SW9mRHNmTzBMMFho?=
 =?utf-8?B?cEhVcjVpRHV1UDRZbks2dmxUZGYvTVFDWU1ORWRaVzQvNUVrbGVHV1UyWjNz?=
 =?utf-8?B?c09qOGhJcXhOQTJzRUpNZ1ZBM2swR0hmdE54akRBdUxkaldBWFpPa25lOWRQ?=
 =?utf-8?B?Sm81WHoyaVIwRGxWUFZ4bzlKMGpOWDByeUxXd2h6UVl3OUlscTh5YTExdHUv?=
 =?utf-8?B?UHp0TmxOUDh1Q3JDRjNBd0lWbGZLcmkvTDJGdVJpYVh4ckMvM1N4SU1iQ0JV?=
 =?utf-8?B?T1VkalJwbE1HZlNTVHAyODFnUGFzNEFkYXpjN2pYRDFxQkdzdHI4RVZrbEtW?=
 =?utf-8?B?T3FXQWtmTDc4WGl2OTdLVmhRbS9lYzBBWlBWTHY1akQybG10eFIzclJnZ1lK?=
 =?utf-8?B?MzZjamV2NU90ZXRFc0cxbnA3K1VkQ0UyekRRRy9IeXR4S2NuRWhDSmVtbnZX?=
 =?utf-8?B?bDdQeWhXRXRGY0NOS1lBZCtwVWl0anpTREk3SlA4bnhmcVVNZjBHNUhRSFdq?=
 =?utf-8?B?c3ZGYUVYN21ZVWxKdVUvV09TcnVHZ0ZOZWxQdzc1RCtIUjlOV3dRWVFhZWo1?=
 =?utf-8?B?NDBoRXZ1UXZLQ0NyWXJtUlNSYnp1aW9oaWdnOGY2ZXgzazAyUmtxVDBsdmo5?=
 =?utf-8?B?QUlKSFVpaDV2N3dMQ0VqVElmcUNYbFZYejhEU01jNzJNdUZuSmNZNXpZdlly?=
 =?utf-8?B?cmNuU3A4UG5BZFptajhTeGVOVGxPMVJCRStzc2RGN3NDeGhDd0RDKzR6dFdk?=
 =?utf-8?B?ZUV2enAxWHhWd0NWcGhEZEErUzdjK3pNYlJsRGV3MFpvNGtvalZzY0NYcURJ?=
 =?utf-8?B?cDRXcG12ZFcyUExwRXpmUlBKRWdQUUJxbVBrMVRyd28xcG4yZG4yaGV4T3RB?=
 =?utf-8?B?YUZER1BCTERTWDMrWk9IQ3ZaUktBNHY1Unkxb2ZrU3BqOEJKRjViM1B6dVUy?=
 =?utf-8?B?WlBIWTEyYTJtLzNyandqQ1R3RFVIQ0pFa0hMamtRL2JtOFFjV1FqaXN2VVlk?=
 =?utf-8?B?SzNYMFA2NkJoc3dlN01RR3FsaEVDb21jQW9mWktHYXI3UkRQNWFJN3hISTEv?=
 =?utf-8?B?OVllR2dYc29vV1c4NTE0UnRoV25jbGM4eDIwSE43eWU3NTkyMS90NWNGSVpZ?=
 =?utf-8?B?SHgvZVB4U1FUekl6VjM3YmZURm0vQjgzdEt0ZEtsS1lDYm9KRGkrdklMM1VC?=
 =?utf-8?B?TmFKWmdrWEQwdFE0Q244ME9HUUV3RW1nRDR4Y3ZrdHFnUldRaGtxNTh1M2py?=
 =?utf-8?B?RjZwRmtqU0pEd0psTWxSODlZMlA3bWFGOVprS0JGTnFzQ005cTFjWWF2ay9X?=
 =?utf-8?B?OU9ma3ZKTDhsNFI5K0YyWFZnb1c1aGcyajB6VGNZYTJRejlRTjFxZVIveVQv?=
 =?utf-8?B?ZDhwK3ZweWswK0REZ3RXVFhteTA0eTJidzI2V3FzWGNZeS9BMS9UZjFlS1M3?=
 =?utf-8?B?b1ZMb2RmS1pVZGhQOHdMcXFXUm5DUHhTV2YyVjJvWWtCa2pQb09yNXhwcWIr?=
 =?utf-8?B?eEg2NnZldDVqWkQ3RFUwcXhqWmdsTHhNazVFRENiTDBVR29YTzB1aGFXRVls?=
 =?utf-8?B?VzRkSEZ3Q1FiMGdjQlN2OHkwNFV1RWp5NVpIdUIveTlLQzBKeGhLUU1iQXZQ?=
 =?utf-8?B?clRZVzRiZVJuTzV4RXFBK3ZzOUhFbGpNRllOYVhqc3BUOGlLMEpnRURHOTdl?=
 =?utf-8?B?ZEZPWEFpTXRWcmQ1bHlkZTVVMWF2VU9kVWJKdFZZYUd1aWwzYnhPNUgzR29W?=
 =?utf-8?B?bDlwT1NrS2VWcVZpbUU4bEhuT3dod3kxeWdTMWIwU2RGZG1mSkc1U2xSeVF4?=
 =?utf-8?B?N2NnS05aR2ljNGtQcnByUDBGbE8xRE5aYXpYNXl0SUtpTWlSTWF6clVIUmF5?=
 =?utf-8?B?UUpZNktEald0bXJiZE52cnBPa1g4RXIrWWg2S0llQW9PbGc0NmhYZnlybDZk?=
 =?utf-8?B?QWc3ckN2MENmMlZsSkdrbmxjYnhSYUY4SXhhbFBDTHlkeVA1dC9NNkt5blJ4?=
 =?utf-8?B?ZCtCZXJmVkw1Tm54cURDaHZFaTBFSnRZSmtSUnRBZTZFeGJ4Tlg5eC9OVVNj?=
 =?utf-8?B?b1FlOHVENExpRTN3Y0ZtdGh4ejRETlJIdWcram1FaXdpbHlKaUpOSk5HZjNs?=
 =?utf-8?Q?1DR9gjk3ZeikaHSQkQYr9jttJ?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f79ef6-cb66-4357-af42-08de1c764fa8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 14:19:20.4200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/MkNyuOCaIiqX3ELq8wPXP694lrM+xOs3gprP/uCCjMZfFhqZYqRDSLN6Aaa/3Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10376

Hi!

2025-11-05 at 14:24, Bartosz Golaszewski wrote:
> On Wed, Nov 5, 2025 at 2:23 PM Jonas Jelonek <jelonek.jonas@gmail.com> wrote:
>>
>> Hi Bartosz,
>>
>> On 05.11.25 14:15, Bartosz Golaszewski wrote:
>>> Hi Jonas!
>>>
>>> This looks good, I'm ready to queue it but I'm afraid the consumer
>>> label "shared" will logically conflict with the work I'm doing on the
>>> shared GPIO support[1] as the shared GPIOs will appear as proxy
>>> devices containing the name "shared". Do you see any problem with
>>> changing the label to "gpio-mux"? I can even change it myself when
>>> applying.
>>
>> Another name is fine for me if it conflicts with your work, as long as the name is obvious
>> enough. Not sure about "gpio-mux" though. Maybe "muxed-gpio"?. Just let me know
>> what you think and if I should adjust it or you do.
> 
> Yes, "muxed-gpio" is good. I can change it myself when applying.
> 
> Bartosz

Isn't that the name in the device tree?

Is

	muxed-gpio-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;

really satisfactory? Can you really make that change as you apply
w/o a re-review of the binding?

Or, are we talking about

	glm->shared_gpio = devm_gpiod_get(dev, "muxed", GPIOD_ASIS);

and

	muxed-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;

?

Cheers,
Peter

