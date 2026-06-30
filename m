Return-Path: <linux-gpio+bounces-39216-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7AVBAWTBQ2rmggoAu9opvQ
	(envelope-from <linux-gpio+bounces-39216-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:15:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6727D6E4B3E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:15:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="l/hghUxI";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39216-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39216-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95558325A930
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA4A411670;
	Tue, 30 Jun 2026 12:58:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F3C410D30;
	Tue, 30 Jun 2026 12:58:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824290; cv=fail; b=Z3ljwNzAZaVpbuK224qUfM9pRD5TDrK6ZWqcUnxMlmzMnHNKuLvngegnbY/kC1jL+Jyq+X6EPPIa3Y2UE/5M+URLCNag2UKQoOyaWzdxAsK7c1p6FosxzOOBEcg2dupU7s14hc7Q8tU7J8lVMXBQlP9swMjh0w7HC/qoL814OKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824290; c=relaxed/simple;
	bh=ab/bYS6KQP5NYCysarAAg9AETcRTREylATQamBQotSk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rakohrya6xvT+e/C20l3AJKyWZwx4eJdDJfZeo5QxJP5nA0x9HPSdwpvbq8cD9wc7s5HWHHUOUPPYgCPmmixmNsAm+z2HvuyaN3BZjUlHrEivsDrw+GIQfN0K2iX3zQ8EF9QYzqWw525MA3fIyN/Itiz8suL0DApha27Ywv7IDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=l/hghUxI; arc=fail smtp.client-ip=52.101.83.57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWKKQIsoADvh8C0m/lRX+nX7cK8RcewbbgI9Vlzl5wttmtnEDH9MHG08q4/Wfokqanl/6E3hleorIybAXyoez6feJLOXELyaYbaKpSReWKr6vh+T1YUSnhxph87tsVY1wNDMmtGkT/DQm9G0emRWFjp4DY2A9o+Ydpp4YIDVktjHo0OHfcx0LnvTXOYK8oljdt3+IgV8HRq8GQlGao8RS4JcwjLrE0lYXhy0IW1Nv6f31bVI9GYlb/WfUMDr2RvVuBFT0pU9M3PN/qMMKymlZGevkT7RoNz3aT5vtEX+Obq017mZRvQFhcRcnU8BneHBTglF5eicmB15OM1GlhQVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPz/2mt3qzcTgvz8sM18gC7qSIFQ4kNlpfMHOupJu8Y=;
 b=UqNQBSZUB/38K9ZGDT5GVNUovBI5w6VVhqxE9ZLgEWBBcTmg+1LHuJxVmfkQJBl241ylx3n5mGgKga2jndnnp2tdwLMmWUNydV4fZ2Y5TMLsvC3h+130MjrAAttuqxmzKNtdVtgvss6j8ux3d1wft9c97rPQjbf/V2jT6/JicC0XB7VAjrHJhC0Wp8kcHF1nE8EG9HNHsRA/SWOcvdemMnlkzR+X3PeSEct2u8PWyYAvnu11VRxPh4e5cAzbDIffXPNOznRf0nU43dzO7guQ8PojNNCSq45dEREElG9N4HahUINrE+c+p01Xoo+vqAy0ktpu90MxVSLheVJ7N3M30A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPz/2mt3qzcTgvz8sM18gC7qSIFQ4kNlpfMHOupJu8Y=;
 b=l/hghUxIRolXZDXhlYS6kMPNnwtOMhzFZ7gxXc9fvzSJalsi6b2K+QRwUC7Ql8R5rvGRhyzYnojYTA0LJnrKjCBt4VV1OcOxlDHZfBUlmlAyQ+LbEHVsoqI16GRpW3uvOM1GLPiCzVeTA0F8JleHNSSmLnSoZAwr7RoH3MTkbFZoeOBNloLEQfvgLCESxZmOvzZ+46rnrGuLR6t44wDZsRegO73IgrdrW+A00YOKebCj9zQPGIHP6lEJT1y2NisU7177Pd++bQFd3JkLnrpLls3B9WM+21qOr5P6YQXESOuurdY0t5zxALt/PxTcd2EDRoKsKDQ7Cgkm3Y4gW9RKlQ==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by AM8PR04MB7457.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:58:04 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:58:04 +0000
Message-ID: <a2067020-6970-40b3-8960-6b518d7f6d0c@oss.nxp.com>
Date: Tue, 30 Jun 2026 15:58:00 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/6] gpio: siul2-s32g2: add initial GPIO driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>,
 Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
 <CAD++jL=S6vEgSW=V4gu4z=RtuvASNFUiofJb0X+fGYMqNQT7vQ@mail.gmail.com>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <CAD++jL=S6vEgSW=V4gu4z=RtuvASNFUiofJb0X+fGYMqNQT7vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::16) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|AM8PR04MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdfe89e-f5c7-4dd8-718d-08ded6a73964
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
 zWE4/kkONoTL3cK3tdFL52g4xNqGWnMPJ+cbZdsj05TC610CmKP7qyng8nPGtTPZ11WMciAok85wldsIrxh+wtt8y/v+WHYnm3eBqEMPNcME+Oi4zS7zz9m3Z2lKIOGawWHmk08esj/e+UQ8Qe8xLfUpERGHu88yiyARbSdAy7iHJKS1OWGO7hnelfwrfb+INZeqLBW60d0hvCaLyokmNfmA1H/URIVe7rKl1Z7c8OEvmOFuY1XcKvhwz9QtSbGGIWqq9cI4oDvd16+l+a/B9xZ5YTSXI5gU1yT2sFN/s+30k9MCUDgBnWOJDZcluy3qpa4INYJFJFxd8vHOQLVdfZYs3s7SEsOapprbNMeOUp5RxhS7dR+eNQDYx16Fk36Ofz1kfqU6+n2aHiz8Mg4/taEe8OwgHpHeuYHGlSNoKOvLb6KTZ1wU7UhHxTvE1Hgw+R/clSM0EhMomrY9S4eg+l4Tz//LegNyOEN5tSEtHP7xRsdeJ8mfxKdn1fZ9f/OW6nN5JaxL5pcBkOC83kPuhViVaaYXOeVXmAgb5BHZ3NxtfzQ7QdA8/oDLiyYdi8xYqHA9BcvJ1VFOERYTwo9hcCEahm+p3GZajXBIAEmImZk8V48en2lrkLhSe3EeZuiHktL+Ur6a6sKRqqWO/MDfCGfInJG9Hosd59P6D62PJ7k=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bjFVVmVYblduT002WHRsV1gvNGxZeUcyelEzUVYwRFh0VWd5bTNRRGNoeWgx?=
 =?utf-8?B?VlNRLzZLamhTdWlZOXhuTUlFem1UYmhzazFxVG1XU0ErZGZVb3hlY3NrbllW?=
 =?utf-8?B?NkxZaHhtazJoY2ZqOXdDWnVJWlpyR29UcnQ5SzgxTjcvS2tnWlI2Z05MbWh0?=
 =?utf-8?B?T01tV2sxS2pjazhDQkFDYWVxNnlYWDQxTGRxZXEzSTFLSko2SDRnblIwN2Iy?=
 =?utf-8?B?dDlrR1hBbmFQakFnaXZBL0hzajVLZndNZ3dNWGU4SVMzZVh0SkNyeWFWUnBI?=
 =?utf-8?B?M2tEcWk5cmR6MHBHVStHcGZpY0lsMU9Cdys5U0hNUXBnOE9ja0UvckxaaExk?=
 =?utf-8?B?RElRVDFwVVl4QVlUTmtYRkJTTko1d0pkR1YxSGxISGpzOHQzU1Z2NEhPZFdu?=
 =?utf-8?B?bHZheXFXejZXTGZlZjhhTE8zejlBMjR0UVBzZmExUlRGUkJhSS9yYmxLTlM0?=
 =?utf-8?B?N2tGWHhDRXFvcVpHYnFWc0xoeU5ESXRUbFpxazlDZS9GME5hYzRRbXU3REpC?=
 =?utf-8?B?eFJsa0loVkx6b0J3WkJtWTV1QTZkenpmekxUYVlWN0QzN1pxdTJIMHd5RldM?=
 =?utf-8?B?NzhZL285amhBVTRUVzNyaERjSGJuNTFBYS93V1l3Mm1qd29QTCsrdHU4aVZW?=
 =?utf-8?B?TUNZNkNPQldhQ3ZrT2doY0lvZ1hTaURBUitqVDMvcEVqSS9NWFgwVDZCQSti?=
 =?utf-8?B?TzhUSDgzcGlNNUYyS0hDWEFPTW9xeTA0UjUvT0dqYklnWXlLMmxZLzRZbm1n?=
 =?utf-8?B?cmJhVzQ3T2Rxc0oxeVJxS1FSUk4xQnFhb2dWRXlHUVFENHE1b09CemZZZDI4?=
 =?utf-8?B?RGN1UjNTN3MxTGswZGJhTVlQT3dtTVVualRXRTFITFlweUFTZG9KSHVIYi9G?=
 =?utf-8?B?ZVR6YmRDVTdKdncwcjVPY2FUSWV5OVQwY2RFRnN0QktCV0tQQ2x6YzVSakxK?=
 =?utf-8?B?WTA4eG1nUVQwZ2NPZTdGT01YaGs2NEt5TmdwUmhVT0FyTFRWenI4bGg1STVa?=
 =?utf-8?B?ci94VnZWQ2hhWkNoODQ3L05uKzdhTUVkaERLajk4Y2NzZlp4S0R5WnpIWnVh?=
 =?utf-8?B?TWtnaTdpdEtvUUxqRDdFQnBRVmpGMXZmZ0ZtVktRYWk5UmM4amZMWmJYTEJq?=
 =?utf-8?B?ZkdxbGRCcEU0NHBZMlo5TEUrb3Q4aGN4Kytsb0FzakZ1NllEYnZzK21MMVJW?=
 =?utf-8?B?N1hPRTdpb0k3WHpHWnNqdjJDWVEvTHBDSlRzOGJmUGNmRkp0eEdWOWpsbm45?=
 =?utf-8?B?WnYydkhsT0hQcVpaQjhNQ29HRHdaR1NmUEQ1dU1naCtuNEI1U3lsT3hjZ3ZB?=
 =?utf-8?B?aVpjcG1GSmIvMWVTWDEzclRlOXYycW1kUW9DRjJxTTdwd3VKZnloaGZLTkRD?=
 =?utf-8?B?SWd6WjVGazBEWnNaL3JQK2dPRjR3d3N3NGFmOE5wK0crNExYWkJJZFh6Z2s4?=
 =?utf-8?B?d2JPZGJWRVBSWUU4MDgvL01GSHpiSWsrTHhXR1Q4QWJQZ1l2Ym5nRTd4NzhC?=
 =?utf-8?B?OWFnc2ZIclMwVXg4c2pxbXpuK29uYlFWQmwxTno1dlNpMDRUNEp6SjQ0QitV?=
 =?utf-8?B?VTF6REtBN0ZWR0lIWHB6aGY5N1JxMzMzU2lydW92UUtSN2doZzc3N0xQbDJr?=
 =?utf-8?B?WTNETTdzdXFnSFY0Q0pOdk4xRTVCbkxyS0hzNFcwdFZXaTNnNTNWM0FIT0xY?=
 =?utf-8?B?bDJTY1Y2RGdiRGFOR2pCQXhMNitNdmFTays2azNud2h2Y1FyRXVGTUpVTFZB?=
 =?utf-8?B?QUJQajg2eHJ1eG5GUEpMRVV5UWt0WDliTVJvOXhpeXFQeGlJNXJQVWZqeEtS?=
 =?utf-8?B?QTJIclZvRHUxN3poeVZtUXJURWFRVTE2Z3lvbHJpZDdDT3hBcllsQjYwTkNP?=
 =?utf-8?B?bGE3eVFlWUUwWWNZWXA4TzFBakxoWXVxZVQvTHBTWXFseWVlL2drZC81NWNF?=
 =?utf-8?B?WUgrQ2FrQ2phTkFsVXRjSnZ4UHFDTHhMdEdiYitIYjVpb1BRTW04MnRFb1BB?=
 =?utf-8?B?U3lpaWdtUjFWcERqOG9wcGxnTExTSnI4UDdBLzBlVzVtdGkvVVNkMk4vcElk?=
 =?utf-8?B?MFptR2FPZ1ZuVURpcjF6YUgvd0EyWkFrQnNNK2tWMFpRUUNHQXBpdkVieEt5?=
 =?utf-8?B?SE01OFFTTzluOVZCTnBicWU2Wkh0TXJRWkZ3UlZwdG9CSGdIVy9pMmFWbnZx?=
 =?utf-8?B?K3BhL1BxREdaSjZjdFRveTJMaXVBM2x1NkxUT2E4SmIrRkEvcWxZdFNRbVIv?=
 =?utf-8?B?TlJ3T0JvOG9ndHJDNjlMTXNyM3FsOExCdGcwNmZuWktYRkRaTjM5emluSlds?=
 =?utf-8?B?bXl3bEJITWlKWSt4STV2a0JqODUrS2RPa2kzN2RQejBaRTRBK0Z6RlBuSHFB?=
 =?utf-8?Q?XmyPse0Bz2Su9IIEI1sJbGCTKHZ91rILKY3dL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdfe89e-f5c7-4dd8-718d-08ded6a73964
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:58:04.5727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFOTv7NnTKgukTmujQJWGeVYOWwlQGiTtOTPs0TeW7Dh9aS/uhx0VehDw9eIxvDWe3Am/yR2/OvlgmXPaIDFByOMIY3rcqW59xqvOg2i6z6H66bV/X6dCgr2tWZyVXfi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7457
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39216-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,linaro.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6727D6E4B3E

On 6/30/2026 2:50 PM, Linus Walleij wrote:
> On Wed, Jun 10, 2026 at 2:21 PM Khristine Andreea Barbulescu
> <khristineandreea.barbulescu@oss.nxp.com> wrote:
> 
>> This patch series adds support for basic GPIO
>> operations using gpio-regmap.
> 
> Sorry for my confused comment on jun 10, these patches all go to the
> pinctrl subsystem so I should merge them.
> 
> Can you make a v12 based on v7.2-rc1 and I will apply them.
> Pick up ACKs!
> 
> I will not apply the device tree patch, this will need to be queued
> in the SoC tree.
> 
> Yours,
> Linus Walleij

Hi Linus,

v12 is now available. I've rebased the series on top of
v7.2-rc1 and collected the ACKs tags received in v11.

Best regards,
Khristine

