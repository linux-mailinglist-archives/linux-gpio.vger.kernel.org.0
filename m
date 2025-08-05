Return-Path: <linux-gpio+bounces-24016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7106B1B3D6
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Aug 2025 14:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A011C167DDC
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Aug 2025 12:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929ED27144B;
	Tue,  5 Aug 2025 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="soGJiSMe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EBE2264DB;
	Tue,  5 Aug 2025 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754398439; cv=fail; b=f4QYTI6EOK2CaBNGJ5/Gebg3F3OJ1Hpj98+d+ecs1a0SNkVw1O555uMrR3yOSUU1Eem6koYKjgy8ER6hlhdjxYcRNVVvmtKy1GOxvIn23bW8quwsh9D/1XkOGL8MML/DJ8DSQelQLmwZGafPk/g7pisBJygFYJv2jvcFByRq26E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754398439; c=relaxed/simple;
	bh=JZYCJ1GU8aaV7N8FD+aXkaKsIOdkatyauGrn6cdkvEw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oUhjeY1pyEYOn90s2qsC6lQA/D7zMq9TmboZmhsnfsYhPit1IoGvdIyhE2SY1XABGluuXxfUs1PcBzpM2YQKxbVOEUuJy9Tvn0MfMorHVWz+5gM0cAmwHubr+IGY6oE6N1VsxQyOWm5DBr9kcWObq4IfsQ5m72MNKwoRdK0MsuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=soGJiSMe; arc=fail smtp.client-ip=52.101.65.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSLH5YO95WKoehbmkkV8MF4qPe7E5IfBkZfY5FddHhOglnSCh2nTpPn2SNgK2+0ZTmEIs/7CLXGD7Cr1tkkdZx88AWRhDBhVLoJ2XwjSH8PdM1EdIllsyT/lJVYKVwO/0wzaDnssw27CgSZhi8TLIiJXF5Ji+f/Z9GM7LEymxdozVCM69faZ8YSRb4vHu9Glk5t3XqoQuPaiCw8ts7nm0Xg/aB3SHwvCYZILNJEAd2UcvLre+HliQR5xq9qeEMX1jfeV1PAHVRw8u/Y5w557IXXCiSs2zF1v7Y0SAs62C20GGiwV3zk5mr9lpyY/n3RDDwlmWlu031BDa0Rp2RuQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kkwUnTQmC54HrarRL9i1D/CvQIFRZ+H4OS5l+WW7mg=;
 b=ADe85X32wg2sxmAxM9Vf817IKLxHNzbmyPiw5ZvDjx3r41emzLJHSZ0MBzgWNUbdl6dqhoN4CucKb8Hhbxvw+/CET25FzVXC7aCDr2xb7eIFKmOd60yH6cKscoXlA5GcOxxA5zqIZj8snDdp5g+EOYK2U8D55u5Hs5lbobqoFLUPOYa9o60vxe7vp82KESNQitaPeOJuLggSQgP4LDHeRrPJ+Dz4GK5gIf/OfPEJWCIza+uk1sXJvfwDk4J6M4A8nxVV7bcLKHXjVwL/4mn4NMcKvuydO8+50ILX3LgnDU8cuWpOCQK3hH3T1CVi+jEVaz4eoO2KVEnhuc4As3KmqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kkwUnTQmC54HrarRL9i1D/CvQIFRZ+H4OS5l+WW7mg=;
 b=soGJiSMeZuTzLqDVlPjh5kNVmt9xl/aHbtohajcpI9bKlFfaQb4cdYerrgpYlyTCQleRyLSogXLg8sL4/wIlAUToyVOf8RCzTm22ZGGPdC8kWQJheoTj2X1Si2Gp6efqBDUW1CHVG26O8STkcMUQrPkH01afi1dHLb7HaYiXyCxlU09ikjZnW8SjCsTwONBMeVMwgHaqK3Yap0hXeDA3wR68DGzvihdmt48yOgeR71D8MYEM1mfwUjTdkMXhAiTB9fjA+n2fwDtuaxfPsZu3xPiBPMSBOfHvm2ARah7+/JOiIfvUAYrUWqoqlSvdeAstxz6teEHqjwjDLhLuMk9cLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DB9PR04MB11474.eurprd04.prod.outlook.com (2603:10a6:10:5de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 12:53:53 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 12:53:53 +0000
Message-ID: <23f2af9b-753f-4213-ba5e-b439e33be239@oss.nxp.com>
Date: Tue, 5 Aug 2025 15:53:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/12] nvmem: s32g2_siul2: add NVMEM driver for SoC
 information
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, aisheng.dong@nxp.com,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, echanude@redhat.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-11-andrei.stefanescu@oss.nxp.com>
 <9d004ea4-0bb2-4a21-8501-82ecf3482c3e@app.fastmail.com>
 <fa24772b-0038-4f51-87c6-15b810d8d454@oss.nxp.com>
 <53bc13b9-365e-4212-84f9-85e67c23e067@oss.nxp.com>
 <ed072356-6881-4466-a0c2-0f55b72f92c8@kernel.org>
 <7902bac4-9f52-443c-995f-a15189102478@kernel.org>
 <0973e6d1-2823-4bfb-be73-b532c6f86784@oss.nxp.com>
 <b5775270-5306-4eb7-9fe5-44b087b20c40@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <b5775270-5306-4eb7-9fe5-44b087b20c40@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0007.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::11) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DB9PR04MB11474:EE_
X-MS-Office365-Filtering-Correlation-Id: fae4d8fa-062a-4580-b968-08ddd41f21bf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2RLTEZ2QldqZTRUbWt0aHlpM1I5aFROWURBLzF3RDQ5WWRtbDgxckE0VnBD?=
 =?utf-8?B?enNqSTdwU1cyV0o2cnIvcHYwS3FKejQySDZlM2RReG5JbkdITlNKTHQ5V0Ex?=
 =?utf-8?B?Qlo3Vkh2NldtQlMzcktvTVZIN0dNR2s0c21QTUZqWFBoWEg1dWpRcXh3UVdT?=
 =?utf-8?B?S2d0dEJIQW1aQS94TmxyUTQvK28rVW0zcWhkM3RrYzhHVU56aE14cVMyVjJ1?=
 =?utf-8?B?SThTcU50QVlnL0ZIbnRZNHVkaEJDTWExSGVORWhXU3RJZGtnUUdsajRoS1pL?=
 =?utf-8?B?dmVZMUYwR0JCcFZmRjc4RnlaWUczd1JUd3RkbGZ4SXRBNi9IZ21CbmdIajI5?=
 =?utf-8?B?ampUN0tIQWMxOGdTVjl5Y3NnQkRuQm9uZTRSakVza2xlbWx5elcxcURsRmRj?=
 =?utf-8?B?N3dDK1llQXJzdW8vQXlFazU4NTlOeXZWTmtSaWFjbWhFck5qTmNmZmVERGxF?=
 =?utf-8?B?RjI5Qmo3NjhUZ0pnSlk2Q0xjY1JnUWRJak83Y3B0dUVWZnl2NndhRk0xVkZS?=
 =?utf-8?B?azNDd3UvZ0xhcHd6Z3hmQ0pDY3lsWStBMzY5SnV3OWRTWDJ3V0VGdkZHVGt1?=
 =?utf-8?B?ZEEzaGFKRWFvMXZ6THFLLy9OME9pVjNJSXFRUitjc3V1TEVPQXRDUmlFMGlz?=
 =?utf-8?B?RkNZY0hCalo5eTRhMXdRYWNyeW9kZkVDejE3S084aG1xYUltVnhhWllIRmJU?=
 =?utf-8?B?ZGZmbHJIWG1GSVE5NGtjUlZobUdqU2dxcUw1c1BZaWVLalNYSmFMUkt4U1c5?=
 =?utf-8?B?dUp6STZHaTZNeEFPcjNERGwzZ0QvblN0UHdXUHFyUXhHcDUyaGJWSTFEY2ZK?=
 =?utf-8?B?YkNqcHFzYWhCMk9sdW9mMk9kRzVaclhReVpvQkFHY2J5NGx5NnlzNzRMc09P?=
 =?utf-8?B?YnQzQzZyeFRGNE96dUM1bmRHTUY4amthb1BsdGkyb2cvNzB0bjAxWXJoY0FC?=
 =?utf-8?B?Nk1xRFVVWWpnNy9CZHRpcDBaajJ4dEx1STlEZnlrcXUrNnJvZDJwb3Y0OWRI?=
 =?utf-8?B?MW8ycVhyS045Smh1S2tFSU1SQ0s3ZllEdUtRVFRIUllsUU1jR1FCaWxzMUky?=
 =?utf-8?B?cUtHRXNtMEIwSzBSU3R3K2RpZlB6aVhMdFF1RHFyREtIc2lrVnI2SVpkMnht?=
 =?utf-8?B?eWxRWVhMcmVKOHNHMDVBeGtjM3hwMDN4SGZ0YlJ3aDNGZU05SmI3bDEzNHl6?=
 =?utf-8?B?bTQ4ZFdsTS9WbEIwc2ZXeEFyVXpEZnRhc0wyNVNDSkFlL3Z5OWJZUmVQOWF2?=
 =?utf-8?B?MGMrMytCMlR4NzFkNlhyMkV2RWdlVkR3VXUzTnFYemZtZzNnZXlPSnRSeFhq?=
 =?utf-8?B?UmZ2WlNVa0RSRldiNUhSRG5ETUlScjlNWk0xY3VnYlcvZ21OTXMzc1JWV21G?=
 =?utf-8?B?cnovRVR5MTJJZ1pXRU1EcE1JY2pGcWY4VXZod2lDOThkYWo5MFNVOEp4eVdr?=
 =?utf-8?B?VEJ3UFROMkIySFNMN3J0UUMreUFOcnNPdTR0WlRKcE13eW9IVFI4K09wa1Zk?=
 =?utf-8?B?VjRoQ3pWWjhQdEY1UFJRNWlSUDVxN0YzZU95dzJ4a3MrWkM2Y1U5YWxqU2lK?=
 =?utf-8?B?NGtZZ21rR1kzcUlNbHZKSjdBWW9QeVRFWHlIZEVHemlGNDZJYWF5bU9raGs2?=
 =?utf-8?B?bzFzQ0EwZFB0N2xxNlFLMStjYWM0djRScFFsRmJCTkhuTE1KZk9Rc3NxQjJt?=
 =?utf-8?B?V1Q3Z0syLzRTbjlnYjRySUtsZXdoN2Y1NklpV3p2WTB4S2lweUNLeURaeWRO?=
 =?utf-8?B?VWlWODRRNVNHRERsU25YMW13QlN2b0FuZXVmZHVjcnM0Y3NqSGZ6ZUhkZmJQ?=
 =?utf-8?B?d3h3T2QybGVoa0Nzc0MxdnZ3cmRRYXFWdk5weGtRcmRjbUk3Q2o1cTdjTjNn?=
 =?utf-8?B?MWJDZDBDd1RVUytEYkZEQW9EMmdMcjZ2Y2R0Nm5Zc2VnYUY0cVloRzJOYWRT?=
 =?utf-8?B?WE5WeGw5STAzV0Z6elJPNjFoWVFjR0U4RjUyZ2N0OFRKNlhXZTRlZHFpeGtK?=
 =?utf-8?B?K0kyRVlqQ2d3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTcycGFrNWdLTk4xVndGS0VlekxjMHNLa1BQVWpsdlZZcHRqSlcyYU9zNE9a?=
 =?utf-8?B?SlFPUEpyQWt4VkUyakdEV0QvU1ovSkNsUWdZNVYzb3ZnZmp5L2tIYk00eXp1?=
 =?utf-8?B?WjZhOG54cVloNFVXRzIwQ2JNNVVJR3h5T09sam1YSUtWK3NsM21SbjVCcE5t?=
 =?utf-8?B?aGFBQkdlOGFYYVNNNW4xOXRNc2xzK1RnalhmbXZOZmcwd0pvUGNFdTR4dUpH?=
 =?utf-8?B?UVppc2NBNHdFWkc3cmFKS1BiNWN5akgzZTdSTzdvRWlkYWsrQk55cnJGa2Qz?=
 =?utf-8?B?VjdEUWNQc0kxQ3FTL2tSdzJXYngrNUQ0anpGY3RKaW9lMHhQRTVhWUNWRU55?=
 =?utf-8?B?cXoySVJmQlNld21lRkxJT0ZCQVc2Z3FTa2ozREFveFBKdS81Y0tEUlBCdzZL?=
 =?utf-8?B?S3RZKzJVRWhjNHN4VzZocm9Wbmc3dytpbmtZYmZzSG83R01nQUlsTmJSdnZs?=
 =?utf-8?B?UFV6QzdNNmtUOTBEbFNiVTFtaXNJRUh6N0s2MjVtS1RaRzFXWTRrMFhacE50?=
 =?utf-8?B?d2ZKMEFyZHNSdS83czdZeFZIMHg3NmphWUpxVVRQak9kWkNmZUxyMzM5WHNH?=
 =?utf-8?B?akRUdk9EQzR1MmIvaHBZbDl5N2hnUWErenZySXQ4dmpoNDVpRGJHc3lJb0lZ?=
 =?utf-8?B?NXFUYTI2eTFLWEk1RFp3ZmdIeW1COC8vcnFLTHp6Q2NIUW5pNm1XcWtwMko4?=
 =?utf-8?B?YTVvSkNaSmlKeUlYeEFNMk9KUlYxcDVKYkdiMi91YU9ZV0VnclZLeEJiN1VQ?=
 =?utf-8?B?OE5iaCttenpFc0pqdEZTK0xoem5kdlFLY1FMVitTQnROUnFDUUZxdXBJWjc5?=
 =?utf-8?B?TkM4R1M2NkVpRmRDeHRWRGZHWjZkUmxnQk9RNGhZZzV2OEtjWTlMS2hmK1pY?=
 =?utf-8?B?V0I5a0VnWTQ3Tnp6ODVmNjYxNFVqRy9nU0E4K0xLcWU1Mk5rMmd6Wkc0WUJi?=
 =?utf-8?B?SXh4SUUycnExdjBGTjNGaTFmUFhBRE9iM0pjWm9IN0NxRVM2NHRhK3Fxd0Fm?=
 =?utf-8?B?Sm95K0o4Qy9ocnJvT0hwcEdhZjdKVXJVOHRjeGxEQmE2eW90VnIyU2NVY2xt?=
 =?utf-8?B?NkdsMGFDY0xlZnpjQUNYUTVaeDRiTVdhcVlBa1czL1Y2T1IvVE82T1c0QUN3?=
 =?utf-8?B?aXlhZVk4bk1lTS9IUEg1eGswcjVEMlAxS2xCK1RhUHRzWE1FM1BXZ2txUjRB?=
 =?utf-8?B?WGk1SDAyVWw0YVpGTVRxTWUyNlVGamp5RFpLam5YTGNvUFRsWDhqcDhyajRy?=
 =?utf-8?B?a1hJb3dpbEQwc09GeUxQSS91UDRRNlNPaU9WbVpqQUhXVm9LVlYwQnVGUzVE?=
 =?utf-8?B?QTcyNVdFaUozait2dkpiNlVWUjhRSVBReVluMFNINkVBZUUxSGJab3E5Q1lY?=
 =?utf-8?B?dC9FamMxd0YxUmVrT2NlY2dKSzg4Z2l6Z1FOckQrai85RzRxc3JVODZjalh6?=
 =?utf-8?B?Zm95UERGV2owWXpFQW05bGloR0FZNmdqMmgvUE5YQzg5Uy8vL3pOSlRVSDBF?=
 =?utf-8?B?OWh0dGg2UFNhSGo5Qm1yYkxPWElaVDZxOUdoWU9udks4bVlyWkN1NDJIRWhl?=
 =?utf-8?B?bnRkek5SUHVsMXdjUnUxVVpYU1p1M3BjSUYzS0lLT05Jd0N1QVkveGwyNHlJ?=
 =?utf-8?B?akJPV0RybFdiT1g4KytuL3pyUHJDMzFXSE9GcWYwTHJvU3VzYlFrTm4zb0hV?=
 =?utf-8?B?QWNoNFQ4UThTeDMreVUyM3JXUUk0TjRSaWJvQXdsRFcxNmhoSlNNZWo3V3Zr?=
 =?utf-8?B?TDdhVFQ0U0xxUEVOOGFKRDRqNW1lTDNPMjB1Mk1rS0pCckZ1YUZ0MUpnZUl1?=
 =?utf-8?B?c05MdkJUVmR6UGl3RnRiSDBhb2JBVkRITW9DN3Ird2F3NGZvKzc1QmV1U1FG?=
 =?utf-8?B?RVpKOWM1MzNQNnhUdWVta1pBbUc3TExBR2VKNUlyK1dIWVZkRko0SzdTSmx6?=
 =?utf-8?B?bWxBUGFaWkNyU0lsNjRXdkQvV1V1VWhzSFpQZ1VDV2RtOE9zZktDRGYwSVJk?=
 =?utf-8?B?MTlZQk94Ung5aHFIYmNLa2R6cGc2OWxubzF0UnJGYXNSemRmSERyS2YvN0Ju?=
 =?utf-8?B?SkgrNjF6SUYrbitjZVNNMGJpMGdmTGFzZU9USGtlRFdZRGtlRkx1cjBwYlpV?=
 =?utf-8?B?RTNQUnFPVjF4cTFRZ3hiNWhDQW5vRmhXdm1vQ2pQZzFOY2M4b1B4WDNYL2FT?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae4d8fa-062a-4580-b968-08ddd41f21bf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 12:53:53.4472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rSDn7QGkZENejosuaA3NCboTYrIi5VnsHpYkeZA0X//AZe/qkMBB3Up53C9LtR1Oa7AN7zz14TV3B0niYzC9/1ATkhLfuPNXl4A1/lXBao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11474

Hi Krzysztof,

On 04/08/2025 10:26, Krzysztof Kozlowski wrote:
> On 04/08/2025 09:12, Andrei Stefanescu wrote:
>> Hi Krzysztof,
>>
>> Thank you for the quick response!
>> On 02/08/2025 11:32, Krzysztof Kozlowski wrote:
>>> On 02/08/2025 10:28, Krzysztof Kozlowski wrote:
>>>> On 01/08/2025 16:36, Andrei Stefanescu wrote:
>>>>> Apart from the proposed NVMEM driver, there is also an option of exporting
>>>>> a syscon regmap for the registers which provide information about the SoC.
>>>>>
>>>>> I have seen that typically NVMEM drivers export information read from fuses
>>>>> but I think having a NVMEM driver is nicer way to access the information
>>>>> instead of using a syscon regmap and manually extracting the needed bits. 
>>>>
>>>>
>>>> nvmem is not a syscon. Mixing these two means device is something
>>>> completely else.
>>
>> Yes, I don't want to mix them. The driver will either be a NVMEM driver or
>> a syscon. These registers are read-only. I suggested NVMEM because it's a
> 
> We do not talk about drivers here, but hardware.
> 
>> an abstraction layer which makes it easier for drivers which want to use
>> that information without knowing where to actually read it i.e. reg address,
>> bit mask.
> 
> Sorry, but no. You design it for drivers, that's not the way. Describe
> properly the hardware.

I don't think there's a clear way. These are read-only registers, I am not sure
if exporting them as a syscon regmap properly describes the hardware. Moreover,
I saw the following phrase in the NVMEM documentation [1]:

"NVMEM is the abbreviation for Non Volatile Memory layer. It is used to retrieve
configuration of SOC or Device specific data from non volatile memories like eeprom,
efuses and so on."

This suggests that NVMEM might be a fit. I incline more towards the NVVMEM driver
because it will also reduce code duplication (if multiple drivers need to read the
part number for example).

What do you think? Would you consider NVMEM the way to go in this case?

Best regards,
Andrei

[1] - https://www.kernel.org/doc/html/latest/driver-api/nvmem.html


