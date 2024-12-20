Return-Path: <linux-gpio+bounces-14076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1059F92EC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 14:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DFAD16ADCC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558D621518E;
	Fri, 20 Dec 2024 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OYyjWBKh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4095F86349;
	Fri, 20 Dec 2024 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734700578; cv=fail; b=W3gY39PFYxl/YH4/5EjBetGMxOx1vtZ9yHHr/6ifB//1HOjcv3Xf4Cc3zrvfKEc+D7oaBvRlZehiETgcB41Y5PAtNgUVL3ZypSVwiyzDfB1ccGnKCjDqm5CRA1cyXX0vFi+YcBPHYN89NOI2zTmw69bzm2Kajkr2qfqM8ZTo7Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734700578; c=relaxed/simple;
	bh=yRA44N6E9uphGy3zihY3/yGfMxMf3Y+Nz5kuuzDTwRk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bfY6vF8yyYy/BPCf6eJR9xLPbqWo91TsDu+krpLdYFRkOs4SI/17Br//lsY8Tpuejtp+c0mKbd1dOFxtFRWy0z40A3MPf8Elz0L1oVkp1LoTxe/zyczTZ6nbkIDGCOkDvxUN7Pn4aVDrOE/u8VrupAWCLiyBOqrpucRyd2Gi7Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OYyjWBKh; arc=fail smtp.client-ip=40.107.21.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjE87ySh4lfSyAHENptNRNYqOZXUB6F18KGmm6Fwy8QE9Vqc0ZA5eXUZuDLgXcKf8lakekgdkNAKmwr9IWSJPNV0dd+gc3XaK5AqtyirIdxVmRig25Kh60lwaYqp6ZA3FJdkdCNRxmNV9rN7lw4Q35KLyMac+K/JZrbpUnwY9/RUiX99iTSsxi11SO6OlJtJJaTzk0X5nGqvq+TCDv07cTABffNFXL+keggE5DUeAGI9UpvLOclHdwzGSI5ha/T7hyyvlle6k6wtPPV3JLc3IRXOJRwoj8BzEjuZ4y1aNBH3o4F3r1gGjvWNI5BfklE0I2OGxlfu7RTEQHJCHXcoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv6Ftid/NJ4YxElD1NzzLTfZ7utPHJ4UthZCYpv8eVw=;
 b=q8uiTFTB0VOC38sqQXkz9zXNh58qIQlhBDPNwebTwVSG1kQ1g2llohedHij1q5q5QzXWDgO8EKiqfvUj5AYBIpDSwunLCExlcK2YczKq+1xB8kdWhXKdccAGD5hKldzyX1wv0RLWGZias8/1Qyad5HZxUN7iYH1vfjw6VBCBz50ZvFRndDG71n/F54x0FYc7oCagkCLB3qG5Gq0Y+0WFdKVb+eYGjqc7mmnrRfHGPSivMortR/nF6fKqZR3m4MJO0pkCZ+8ctU+Kk3ny3mKKMHVVTPIwUhVfOZ6l2erNc2gSZyacOat26N8YowoNt1S5LMRCk0jAHOoHX66wlD2QaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kv6Ftid/NJ4YxElD1NzzLTfZ7utPHJ4UthZCYpv8eVw=;
 b=OYyjWBKh75JXdyPDGkE9JIfpBWlIC7cUlnn6nOVmJf9s3MtyySy3VCk17JKQ6nKluCA2Iw+WAred7IDZVySO6x/7MXs3Re0rUBimLqkHWcboXfisqtQeOYl0m8yM5S5462xPl6Nx5uLN1JuWvxk4S5dDy1CSpMs1bTH0nO3JD6dGINlQoaq1/r2j1eCH8KDl1JUxzLMhMhHjDm6/357VPwxlrAW31ZAUivQmu3/7DglYQmylxQq6Shq2Fa0m3WIL0tbvWXC9PqXbCSHE2sb9cc96wLruKxU5yuWdYRBXecdrrBOi5faDuR0O5vHUpLH/kp7G3ZIPz+KniOwhCYs4NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI2PR04MB10167.eurprd04.prod.outlook.com (2603:10a6:800:22c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 13:16:12 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 13:16:12 +0000
Message-ID: <5970e8a0-8c28-4201-ac87-b1152a236c5b@oss.nxp.com>
Date: Fri, 20 Dec 2024 15:16:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] mfd: nxp-siul2: add support for NXP SIUL2
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-3-andrei.stefanescu@oss.nxp.com>
 <20241211124454.GE7139@google.com>
 <3b090335-20b4-4d73-aabc-ddac98311e33@sirena.org.uk>
 <20241213171529.GF2418536@google.com>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241213171529.GF2418536@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::15) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI2PR04MB10167:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f2bde8-0436-47e2-a2a5-08dd20f8796d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWdmc1FPVW9JT1dwa3NZcURzajRBb290aTc5VkhpNk84TzRZT1ZUTVpVV2hW?=
 =?utf-8?B?Qmg2R0NTS0NBczBjbjJiZm9ub0l1Q3EzN1lWTG16aHIvRitTamJSdFJLTWVm?=
 =?utf-8?B?VWhQMkRJRzUvd25uSC9odlN2ZE9hZXd3MnpSbUJlVWpKdXM0MVVoSUpDK1lv?=
 =?utf-8?B?M2FsQWJDY2JpSFI1b2IwQVl6MUFQZ2xvSTdzMFlqS2hHOTArcldCY1dIMzhM?=
 =?utf-8?B?U21DSXBhYU5MdUFuNWt2SHFVR3BBWnMwdng1QmRnMFhNM3Q1RUp0dHNGS2lq?=
 =?utf-8?B?cm0yWVZ5cDBDdUJjOVFIaFRIMS9XcElNa0NVYUZqZFNCWkJxV3A5QlBMMmtj?=
 =?utf-8?B?U1l0cE1yQlN5aEtncFRRYThJZEpRa2hPbVhxc1F1M2ZGNzYyQUxQbFhFMEp6?=
 =?utf-8?B?cFU1S0VTbEdWdnY2YUIrMWYvZnN2UXR3VitNdEZGSGtGUHJRU0I1ay8wVDVw?=
 =?utf-8?B?WUV0ZjZwOU5KQVdSWlZsNWNiU21rVEFFWUhUdDJOMFhkUUhvZW9uZStVRys4?=
 =?utf-8?B?TTVTYnAwZnRhS2R6cHJQeHo2VlVHSHRDVEhrWGpNSk8xSG52VXhNTkdKTlhT?=
 =?utf-8?B?aDNsSmNoSlIvU0NTd2ZKNUJnTTRuU1IwbDFtT21zRDJSamJYVlorU2p4dm0w?=
 =?utf-8?B?OUpyYXZJSFY1MDdOblV6NWdEV0tadmZWS0ljdVBDRmFIWWM1b2RlNUZENTh0?=
 =?utf-8?B?OHNFNHRYaHJkcGpBMzdxZk5rSlFwZzBDNFprZWNDcDhiVTlNZUxuVHpHVW9K?=
 =?utf-8?B?ZUZLaElQMFZsZ2NIbWN6VzVncXZwYlhsYjJJZnljb2R5bTVlN3l5eDFYR2V6?=
 =?utf-8?B?R0RIZlRaK1JHcmFHcVR6SHFPdlRORTlKQ2pFNDZmVkh4WmhRMVlpNEx1N29p?=
 =?utf-8?B?QWJEUkxjSW1BQ2hodTlpa2xNbFhkSXdPaW1iT3FXQ1NnSG5SZHBFb09CMVl6?=
 =?utf-8?B?NWx4SmJKK2NzVnVGV285SnBnNUdzU3A3Tm9Gb29LU2tVdEFPVWk2V242Znh1?=
 =?utf-8?B?eGVNVW14eCswVHJIZnlFVmhscElLRGxaRWxaNDVHTEpUdHI1MkJXMHo0aUNa?=
 =?utf-8?B?aHJYa3NMTnFJeVJldDIyUVNLTTFDT05qcWFEcjBPNDRiY2RuNlVuUW9wWWZR?=
 =?utf-8?B?Z2J3T3duZlU3Z2JRcng2SDUvQWFmSXF4Q1lNM1p1TE1LSTlHSFU5dkVvVTQw?=
 =?utf-8?B?bTdUQU9zdk5XNlMvSFplcmU3NDIwNHUrdW5MZFVMTkhJazhlNlNZazRWTUpS?=
 =?utf-8?B?QWQrdFJHYTRCT2R3ZEcxWjlTeGU2L3FCUDhtb1dKeWpOUDhrUFU4eXo4dzls?=
 =?utf-8?B?WlBvSXpLNHFlbU94ZmJMdUtGOVpGdnA5K3VCTkxFYUc2Y0E0QXJVb2FucFR2?=
 =?utf-8?B?YVVNSkhMUWdRVjdTT1RBdm1oOGp0UVJ4ZmFybUhFeDBwaVduSVorMXdrb09r?=
 =?utf-8?B?V2dIZlJxQkt2ZG44WU40TUxhYW1wSFYzbVRZdTA4RU5maFVoMkszcVdaWEFw?=
 =?utf-8?B?TmZ2aEs3REZ5dGNEbDkvUEFDeW5ZZENiK1p4YjN6NDg2blJlOWJlZzN1V1k5?=
 =?utf-8?B?U2dsZXN2RmhkM1lKc3h4V1JRYVZYT0hpNE5DZC80eDRQK252UVRBVzRzcGhL?=
 =?utf-8?B?eTU0S2JtQVpGYm9wLzRZQnZMOFE0YlR3R01BTjlSUDZhT3RmVFd4M1VqMERw?=
 =?utf-8?B?dGwzU25saVFVS1hXVTVieTR5SS93SjFJbU5nVjNvU0FGcnIzWGUyZlNoMENh?=
 =?utf-8?B?WEJacFZQc2tsK0dTSFRUK2hGQjVzbnRIMlU3ZWdPZS9aUXpYZVlzRnk2Qm1L?=
 =?utf-8?B?OGROYzhrS0s5cEdZOWsyaG9qd0ZDWmFCdVlFcmNtYTlBdUZaeXNaL2VhWmE3?=
 =?utf-8?Q?5Ygz9XBXOi83r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0xUU2VNZ1I4blBWaUkrTDFKdVVSL1N5bjNBSHFVdmJCNjVaQjB3a0FkVHh1?=
 =?utf-8?B?VGdlQmVRK2FvUnFHSlVydkNLT3F1WXVNSURPMWNaTGJMQmJMQ2NaVUMxc25N?=
 =?utf-8?B?R3BHL05vRnFpbk5iVW10YWt2dmtSTUViOGJoek9JWEpVa2huQ3BKQ3FEL052?=
 =?utf-8?B?NjJiMFdUUlJxbzNud1VYcHJEMEdxbXhMRHBQbFJ1MTNLKzdzNis5d0dEU3pa?=
 =?utf-8?B?TjlMRGFIK3lXRjBCOEFLR2k1VFNQMFd0RUtRTTRxTEhQMnBZcHd3TFV3Mlpp?=
 =?utf-8?B?OWxhZGpsYUZVeTZxbERNRW9GSlo2dG5ZbmRlREp5YkdmclIrbjJaUVJuU1No?=
 =?utf-8?B?K1RUaTdybkx4WjFxWHpnYWNmaUlkRWhCMDM5aElxSTY2R1pjRmN6WkhIR2du?=
 =?utf-8?B?eGhFZVE2VWpGNm5lU1pOa0dvd08zZ1l0cFMwaEZYY01WUWQ0dnBDbkEvK3Ur?=
 =?utf-8?B?QmpXRUFoQWhLYWNiL0M1anlvRjNLaU1BTWtTemtTakljcWtVZ0FJdDBvalpv?=
 =?utf-8?B?U2xZL0FFNkE0NzVBQ0IyRjg3MDBWVW9xRnZUQjV4emw1d1lMTmlyUW9ramc5?=
 =?utf-8?B?Mnl2dk9ab3RtWEV5OHNMZllpaG5KcVNNK2J6cDg2MUNPa0ozQ1F0UUx6b1Ri?=
 =?utf-8?B?M0hTUldoTHgydUlBUGQrOVNtK29WcU5WSGI5ejBxUDlXRFhuSWZrd2FkQ0ZS?=
 =?utf-8?B?eTZHdzhXOGNUVnh6dnBUVm51b2FMMzF0TzN1ci9mOGN3cWdyT29pWEt4ZXpH?=
 =?utf-8?B?N2hGSFpjemNBYXdEbVA2eXF4Ni94KzA0andORjN1QkdPSXR2ZXNZMCtaVEgr?=
 =?utf-8?B?VEpkNzBSQk1zL2JYVDc1ZDZDMmxJa3c1Y0pHOFZaV3kyTFRqS3F3Q1dBWExz?=
 =?utf-8?B?OGhWUWhqRGIwL25hL3lqRFJvRGE3TkkvYkNCaEd5Wnl5blJEYk45UkJnWGRq?=
 =?utf-8?B?RDJVZ1lMRzRoSmIrdEM4WmxvV0ppZEFGUG9YR2ErZHh2Vk5ldlRXdklTcWNq?=
 =?utf-8?B?cHhaM1ZzMnlWNXBNSDk4dm1yd2FvWndKcXNpUUNHT0NzTGg4N29Wd1BPN05o?=
 =?utf-8?B?OVZvd3Q2MEpCandqc3NEcjlQMUIrbGs0QkcrWUk5WVNleXlGRVZ3OFhnUGhx?=
 =?utf-8?B?dkt5b3NxZlN4cGdoOGRnZXpFVXczZUpRdUR5RkNXaFFWSHRmYzdLYlFRSXkw?=
 =?utf-8?B?SjlFOTBUYmxJYjZJMkxyMkZWeWtuRU1JSTJ4N0NCVFpKQzAzNWdXZHhmTjBZ?=
 =?utf-8?B?VC9VR1pwcktqMkhGRFg2NGc1RExhT0t6cWpCbXlLNzlGdXh5UjdQVm84MUNQ?=
 =?utf-8?B?M3Z3S0dOTXVqVkMzK2ExUWJFb3U1WENrcEtRazNuZXVNam1WTmtac25vRnhB?=
 =?utf-8?B?ZEFscytBb1JPa1czR2ZvU1Y0R3djdkpXSitjbHBtRG9JZ2NMMm9Od2Y0MThQ?=
 =?utf-8?B?b3lXK2lPS2FhZDFxVGNTS0dUeGFKQ3RFb29JUE4wd20vVEJsSU5yWWY2Y05K?=
 =?utf-8?B?L1psN0NQOUMxNUMxeTRWOXJMMDlpUlZpelNBTW5hU2RWQ0RsQVFoWWV2Y29o?=
 =?utf-8?B?dDc1TU5NUWdwQkpZZHBiTVhRVU0zRy9rWi90S1lVRUtnaE1sa0NKTDBVY2xL?=
 =?utf-8?B?QlFBclRXRENYU1NmejJqOVJxYTN5RFlrMWJiblArb0hRcExVNFhDQk9xRkZx?=
 =?utf-8?B?aWkrV2hVcGdJaEJiem9SRVY5RURVc2RpMjl4ZkU5eGlyRjRVUEdNSHdCQTNi?=
 =?utf-8?B?dlRtNFltTGxzaytxODdMN3ZQR09CR2pLbEp1YlRLcEhWdG00ckRQU3VDNVB5?=
 =?utf-8?B?QVpNR2l5L0RWQTNxU2sxOG43NCsxUFJzYWJnb0Qwb3MwZ2Z0amRCOGkxb3BK?=
 =?utf-8?B?dzhYQWRNZ0tVdktyNjVTNzczNG5qNnhlSHN0OE5tazVVWlgzZnR3c3JTNUNS?=
 =?utf-8?B?ckkxbkhGRkVTQXhQSGNvaFI2eU9jb1kvdkUvdENIckZpbGk5V3RoV204dVlN?=
 =?utf-8?B?TlNNOEFySDhDS3JWWVZzSmF5dTlpZ0Zsbld4UzZVOFlqSnZlendxQzVvUVJT?=
 =?utf-8?B?KzRXcXBkaGpXb3dKVTZvaUpGUXdpZ3M5bGZDRFRlK3hoQUxPMEpIMVdwcGtr?=
 =?utf-8?B?M1YvemsxZzNMUE4zVGk1bHdUNW9sZ3VxQWpBSG9vZEhjOUk3aVY5WW1qSHpa?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f2bde8-0436-47e2-a2a5-08dd20f8796d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 13:16:12.1057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0J5qUu4C+K/R949wkNLb41mYvW0JhW9zgkVt6foUi3mjcHIbZ06RdCS8IJy1cTd0Bgs2UwPcpSheKn7sGWD8F6YjBkBYw50LEXBcrpVsppY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10167

Hi Mark, Lee,

Thank you for your review!

On 13/12/2024 19:15, Lee Jones wrote:
> On Wed, 11 Dec 2024, Mark Brown wrote:
> 
>> On Wed, Dec 11, 2024 at 12:45:56PM +0000, Lee Jones wrote:
>>
>>> Seeing as the vast majority of this 400 line driver pertains to Regmap
>>> handling (!), would you be kind enough to cast your expert eye over it
>>> please?
>>
>> Is there something specific you're concerned about there?  It looks like
>> it's just data which should be fine.
> 
> Just the mass of complex hoop-jumping to get all of these Regmaps
> registered.  But if nothing stands out to you, then it's probably okay.
> 
> Still, I can't review / take this until it's a proper MFD.
> 

I will add the SIUL2 NVMEM driver to this series in v7 then.

Best regards,
Andrei

