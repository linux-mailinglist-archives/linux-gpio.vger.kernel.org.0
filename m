Return-Path: <linux-gpio+bounces-11053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C26FD994F92
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B20E1F23D26
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946ED1E0B8A;
	Tue,  8 Oct 2024 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BeoJws87"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83DE1DE8BE;
	Tue,  8 Oct 2024 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393958; cv=fail; b=R5S+l4equgyMDl94r/JwYCXSk9ys4t6ewWM9YwK08PeRfiKJbJXgEu/SjiDG0SMQjxHL9f248L/zbtmQnmbVsbLd7H02IODKuECCVGwqUKdI6X1CBtstDfnp34GiFpK2xf0UvkUsJOly/VLYskOje4xgQTseZuYFL5a4LL4jWEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393958; c=relaxed/simple;
	bh=4Y2+PtEuCXvQlci+bQ0AVDpCN4uzJAUAbvktOJ7Iq9w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dt/DVQHesWll9LqJR2cpCRbre5EpPbf+PR6tm8yJVnJJRJC9P8BKN64ZMyfGTqTXtyqaku8T0QYLRRQOPRn1dPPDXqjR2WYzHUpgkknOnKQr/FjPSG5IFVXoAgVDl8xppRWuj12EvNTk68+stkWAlHRIg9MBIJY2IhM4gN4dYzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BeoJws87; arc=fail smtp.client-ip=52.101.70.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=es3WpnMfDctLhu//vp0V/TbXebBFKiFzV+OfwmR4SD9F0b4Q2plKcCm7yNIn2YgvAmq2hQpdy7wMVQ3XugCmg23o1NRMw+5hz8Aicc0TlhgPnpK+GpQcD4/Zyc6OhX0nCwLwh8B/NdX7GChYLXR2Qqyvzek8V6qzA1qzJBCP+BXvsuIhgDIwD/ZOe29IXwyRk0HEroz7tI4c/dystpvX9hxN8TA8KOoIVoOLYF97pd/jm1uJ0NdEvALRkHRwRS05WyfuC4aquGbaoTeiog0iKVanyyffgAv744p5EwcN3eLWCdr8Roqpx8BtWjcHWRCgEfzLRxpL+9FAYIBt29TeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lkly0St7Zsn0CpeyJHgIFKJzjzp04PsKaem6fJoGqU=;
 b=EkNOwTQ/oOx/A3XV+UMYQiw80lOfYE1vs787zXmUdyRY8I8fXDph4jIsO7W5VOerKL/V/qaYTOfiXyeW86eS8Z3Zb7QSGFFVRFCmUV6mC/Xs7CeaMMVCf5Tz/x8njCVoRP8j2xen4nzXZXP6VjdpVvyjV0ONO9oHW96F7Ba5JZ9oUb33yKbYGcMzKneCXPq277M75db9bseXgxw9kd1Tl/oPDjnApk3CshgOJVSjk68J0QUw//G3QO2em/+J8mgCE68bZ8xN/hr9uAHGt8GjaWnUh3KA/2LjBbYqPNdHTwoTboFXsLmMUE1KGhc/65lBOchAH8mPzBwluN2NyQNYIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lkly0St7Zsn0CpeyJHgIFKJzjzp04PsKaem6fJoGqU=;
 b=BeoJws87ESfY15FCqMab7kzy+TtRvPKmJYLuIjBEqSlvVZkJgZ7GIMql/wd2YSbcjdfY/p1DvvWA7J5zbBWWK/+r/m7cRJHhJqo/3pDItAMDmNDAldkBPwPDiPe9wMKfIelLcOeFnsC+ZCxXQAesU2QbzB1x8DuY+9uFjHmG2Ddl+jxzoCfiwEpoxziL/MWBRmxg22p4BwLIA1amGreBZd+aEBH3oBr+oA5afe4gwIqYdzldDfoBR1oJEgxuDaYM2isgHw6B8kDtavbWq7vgJphdHibZCgdhetFQyz5OfWTJIQlDdBgggvnJ2hINpadg33bFPMJaJIW3MZl70m40SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DB8PR04MB6971.eurprd04.prod.outlook.com (2603:10a6:10:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 13:25:50 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Tue, 8 Oct 2024
 13:25:49 +0000
Message-ID: <b80873cb-432c-45f3-8f65-41af607af4c2@oss.nxp.com>
Date: Tue, 8 Oct 2024 16:25:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] pinctrl: s32: add missing pins definitions
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ghennadi Procopciuc
 <Ghennadi.Procopciuc@oss.nxp.com>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20241002135920.3647322-1-andrei.stefanescu@oss.nxp.com>
 <20241002135920.3647322-2-andrei.stefanescu@oss.nxp.com>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241002135920.3647322-2-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0034.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::27) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DB8PR04MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c057fb4-67b1-4c6c-a518-08dce79cb8f7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dENFRXkrQ1dVNkZaV1V5ZjVNRFB3Mm5nb1pCWTc5eUZCb2FBekQxeEJySHoz?=
 =?utf-8?B?RzhjQlNLV0F0RzRHdytlb0tKVldPVlQ3cU54V1N1RUUrREppa1owTGc1S0NQ?=
 =?utf-8?B?bUFubTBRYzhxVXJ3NXg0WEoxZUtEY0hMeG53a014OGRjQmk1TDJ4WU5VWGFk?=
 =?utf-8?B?Z1FOVnFFeEk2aUxETXcrMGZrVUZFZ083VnJoZ3E3YU93bXJlMVV2czd0WGJR?=
 =?utf-8?B?MGRpQW8zb1dJWEdzYUhKME8yMXJlM2JLL0lRaVRIL3g5YlB2anhBM2h4WUlE?=
 =?utf-8?B?emVBVlc1eXQ3SUR4WHlqeVJiWXU0Y3NIbzlHNVlTcHp5Vm50WS9ldmpyblpD?=
 =?utf-8?B?Ukt6TWIwcDBZbElBNDYyYWI2OVl6WnNsVkhidWJmcm5EUWJBVW85MVNpcUI5?=
 =?utf-8?B?WTk0ekdaR2dzTENURnBGRGplbUlmT3dWenkyMzJkbWJQYnlQak9CL20raVdz?=
 =?utf-8?B?YVM0Zm96STBlT1I4YWtZOERsVUdxcE9HdnVBaEcyT3R5MEgrK09yZ0NnT0ph?=
 =?utf-8?B?Q1dldUsrN2s4UDRaQTRaTjErZ2JmaDZsbnF1UFNkcnFUZzNVKzRxaE1NK1Jx?=
 =?utf-8?B?VzFFYVcwK2Zhc0hRL25qNGErL3RNaVN1U3RySDIvMm54T3FOdmZIRDRWN3Zn?=
 =?utf-8?B?RGdGb01Ja1pLZnp2RVRkSnJVZHBhUDhFTE9RMWljS0NPT1B2ekFXdWZlYjd0?=
 =?utf-8?B?YnJCSnY2UER3dUpYSUNJbjh1Y2hwZXVzMytuZVVlWkZ1cWY3WWhFQ0g2MUpC?=
 =?utf-8?B?RE5kZHUxaGlnaDd5ZURHRFVVYmlmSlFPdkRvWFJNeG1YbDEzaEN3VUNXMUFY?=
 =?utf-8?B?ZXFXZjVTZ1YyalptVUhjZFRqbUZ4eTR4aVozbC9tckMvSE01MDV6M0R0ZVhs?=
 =?utf-8?B?cThmY2lYMzR1YWFHS1VpOTZVM3U2cmhYTkU5c2NGTkMxYzBiQ2dkQUJvNzd6?=
 =?utf-8?B?YUxMMjZXZU1YZUgybmg0MS8wQ0tpWk1hcEx5aUVLNHRXVXBoSStHOTJoa2hp?=
 =?utf-8?B?L2R0L1d6M3QrTHBJK21ZamM4dElGVnp3cFFJSExTb3VhVGViUUs1U2x4VWRs?=
 =?utf-8?B?NktwbzFKYzBLNmdLUE9UWXJNcU45UFdVWGVTZzg1MTl5OWNMbmVIeUxLRjgr?=
 =?utf-8?B?cmZTMlFIQ1QxL1VWUFErQ0U5TWJBUU1wY0VTYlFyNVA1cmVyVWRBbE5CSitT?=
 =?utf-8?B?RUxsVDNQMjZWTlQvbU90TVFmQUZOWHQvdURBNkRxV25QUy9hRTNqVWNhR1FV?=
 =?utf-8?B?d2YwbUl6emdHSjlhSmhaRFU1TERiSEhremxtSWlJMm8waUdkemhWR0Y2ekt6?=
 =?utf-8?B?VzV1RFVIUVFCU0lYZVk4TE5PTVdtKzVYQWpydXg5TUszeG9nNFMrTmtzNUhM?=
 =?utf-8?B?dnJVc1M3WFEzbjdURVZlcFY2eGYwc0hxUUFnRVNTUkpkMG0zSmFpRjI2K04y?=
 =?utf-8?B?YitPY3ordkVncjAwdkRVYjVvSTNkdnRuTDJjQnovWDU1eERTYTFpSUFYb2ZQ?=
 =?utf-8?B?TG1ZUTc3cHFTWDZpQjZtMnBQL25tZm9TUXp5R2NxMHhoQWF5U3dtS1FSbm9j?=
 =?utf-8?B?U3Q2cG9QdXQwcFJ2R25JcG93SnlGeHhMZC9tQTNEN2ZYN3l5TFJReXcrR0Y1?=
 =?utf-8?B?T2dOQ3d6b0VmdWhNMzhNM3pGQWE4V1oyOUd2bk9IVE9MblZ2b3RBK3BNbWpQ?=
 =?utf-8?B?bytybXNsdHVBQzJUdGE3Vy9mL1lsSk1RdFNpd3VzdEs2bjdzTWxwTDZIRHNr?=
 =?utf-8?Q?bKAWPzTRhJGLOG79qRNlCPZFUuc1LsHNnzKSpE6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUpWNURyUTNON0E5NFphSnppQzdiVDFNQ2xpbWx5TWEvYjRoQlVSWTBDY1J3?=
 =?utf-8?B?eGpjWUFJNkY0VEpqWEJmM2N1WVpuWXNYUTEzVDJ5clJPMmJaOWNTM2ZHa1ly?=
 =?utf-8?B?c0IyS3RoSXpxODRCQVQzeWlNTDJKdmgyZmhibE1WK0liazNKeWg4STh5eDBU?=
 =?utf-8?B?MHNzS0cvcDNZcy92bCtNZkJWR1JXeXJtNXd1d2swUEZlZTJnRGNVVTRDRTlF?=
 =?utf-8?B?THh1Vmo2YlBmRFVmZzBoM01GdkpjQmt6aFBRc3dVTUtEWUVyQjk3bGo2amM3?=
 =?utf-8?B?cUdwbk9lRTBVWUV4Z3N3K05VczU4dVR1RmpkQ1Z3V3oxckZRR2lkTlJIK1c5?=
 =?utf-8?B?cm5XeVRIQzB4UTE5UDZPWlE1M2dlL2dGVU1CRnFRWUxDN3VyV2FvbnZpeHhV?=
 =?utf-8?B?VWVHblNoZ1dlZFhFQ2ZUbU95c2RmbncvakNCMmZYL0o5Z3hiaEkxUUUxYzhF?=
 =?utf-8?B?TVZhb0FkMEp6Nlk0ZHpwdU4rYW11MXVpTktTRjlRMHBKbmp6Um5TTExIS2RR?=
 =?utf-8?B?bUF3VWJHbldXcVc4SnRpbUJTUEt0emFjRHVnTU00WXZzWFZxbXUweXZyYjk3?=
 =?utf-8?B?N0RXNC9aS2ZoMHRPd0p3WkpvQTRqTVhyNEFlbG80MlkvZUtNV3hjZUxOSDFq?=
 =?utf-8?B?SWcrbDdOQzhrcHRTak4xYy9zUG5QRVpYMHhralVqSnpOT0FrVDdSdWNwcjN6?=
 =?utf-8?B?ZStid2dyWWwvdEpSeEk3UFdtdTA4RHpFdVQ2S0tubng1T0VUVTdjSkQ2Y2xr?=
 =?utf-8?B?UUhQNTNBaGdUTlNiNTNlSnlRNmtoN1NjOVNuQnd1eVlWS1Y4U2tLREhFN0xC?=
 =?utf-8?B?b2RaOUUyMktEeUpJT0JyZUwweklrWlFmUzNvaTMxcVI4M1o4eWdJcHJNMHhI?=
 =?utf-8?B?Qm9YSkprYXk0UkxabG1IamM2WEVHME4ydkdiTFRKM3VtMk15ZUtpT3BCeSs1?=
 =?utf-8?B?L3JJZysrdFNOVHU3TkhyOVFSdHpsK1Z3MGhYaGpMWkJqVlFzTjFFSmJvK3dJ?=
 =?utf-8?B?cVE4eEdYNEp1Y3RwVlFmZytkcUFHL3gxUFpsTG5KbnZrSUJQWEpEUTRTZ2p5?=
 =?utf-8?B?OHR3QndXaVdDYkVpL3BVWmZtT1pnWXp3citNeUg3SUJXS0hhTjZJK0V5T1J4?=
 =?utf-8?B?Sy80a1ZxaklpMW5XbVZsM2szYUZhbVhCWlc1TllPbmRIdG1haHhBWCt4YzBi?=
 =?utf-8?B?TjlWOTRCTWduOTEyejkxOXovbnRZRE9QR1liTEZOelJOUWdkSEl3bGx6ZjRZ?=
 =?utf-8?B?NTBXeG1ZN2wvRkpoUnFoZnpBcWorVTZmLzl3bUlMbytQK0s1ZWVJdFJLaEJZ?=
 =?utf-8?B?YXNKYTFuaDl6N1IwOW51SFNvdDhzRGpIRXhmTlpCQmM3VkhTVm1IQ2hFYUNp?=
 =?utf-8?B?VnVEVXFlSzFDbERuWWFTQUZPNEpnanNnbE0yVkd6emFTbHJxZFI4aWZRRlJI?=
 =?utf-8?B?Snk1Ty9Nb0VjaWZkY0Nya0VWT08yL1YxaUtQcTNjandiUCthQzMzaXF3Mm91?=
 =?utf-8?B?ODhucHh2bHUyY0s0QmJvNlIxQ1F0OFhZZjhON0w3YWJJNWhmUVZ4T2YxRjZn?=
 =?utf-8?B?amZEaFdVZndLMlo3MDJyRGJZNVp1ZFhYaGxmQ2JjTmxUeEhFNEY4eEhWVllB?=
 =?utf-8?B?Ui9BelhpSS9iVll1VHI5TUF4aHFwM0NIbjYxTFQwNlZNY1ZDRjNTY1pDRHln?=
 =?utf-8?B?aXNhcm80ZmRzNVdkblpJT1FUZEFxcllBOHUxWUxQL1Q5ellhQmNkQ0cxYnk5?=
 =?utf-8?B?K2JmT05vTFQySENqR2FuRVVQMHdrRTB6eXVYcE1Db3FCRTV6QXRtajNOcHAr?=
 =?utf-8?B?bmM3OWtXaGFPc3EvcHpmWTNvMFlFcURqNmkzL3kxMm5WSXltTHA5cUhyb0lL?=
 =?utf-8?B?eFZjSkJpdDBmRGt4NXZtVDR3c3k1c1A1RFpvVCszdU9EZXA0UEFTMjJhYndz?=
 =?utf-8?B?MGhveDROWWhsa0RldEY3ZTE5NzM3Um1laVdaYndnMCt0K0hncWY0M3NDMHRm?=
 =?utf-8?B?dDF3TmtLSy8vRk5WblFTVk5ZbkdnVHhHOVNVWnhoQmRyL29FMlo4S3hVdWoy?=
 =?utf-8?B?NzhFeHc4Rm52bjBSb2h6cDFkS0s0aGJ0STdXWG5YaEV6ekluUXRYQU5KTkRQ?=
 =?utf-8?B?Q28wUlNEQ1hSZmRTM05WTGp2U1JmblM0YzZFYTdGbnJ1U29pZkJjb1B0YUdp?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c057fb4-67b1-4c6c-a518-08dce79cb8f7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 13:25:48.9981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQ1x/wFHTNo4nK94TX1FcBK7MiRS0SLPmfg1WBAGdByY4kQAxBX/wyW1p3Kc+9hwAAc8s4TdvSm8ceg8GQeBTwP/btXOh5nt42JID/f7NAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6971

Hi,

I would like to drop patches 2 and 3 from this patch series
and keep only this first one. Should I send a v3 that only
has this patch?

Best regards,
Andrei

On 02/10/2024 16:59, Andrei Stefanescu wrote:
> Added definitions for some pins which were missing from the
> S32G2 SIUL2 pinctrl driver. These pins are used by the JTAG,
> PFE and LLCE hardware modules.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32g2.c | 52 +++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> index 440ff1879424..c49d28793b69 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> @@ -216,6 +216,12 @@ enum s32_pins {
>  	S32G_IMCR_CAN1_RXD = 631,
>  	S32G_IMCR_CAN2_RXD = 632,
>  	S32G_IMCR_CAN3_RXD = 633,
> +
> +	/* JTAG IMCRs */
> +	S32G_IMCR_JTAG_TMS = 562,
> +	S32G_IMCR_JTAG_TCK = 572,
> +	S32G_IMCR_JTAG_TDI = 573,
> +
>  	/* GMAC0 */
>  	S32G_IMCR_Ethernet_MDIO = 527,
>  	S32G_IMCR_Ethernet_CRS = 526,
> @@ -229,7 +235,21 @@ enum s32_pins {
>  	S32G_IMCR_Ethernet_RX_DV = 530,
>  	S32G_IMCR_Ethernet_TX_CLK = 538,
>  	S32G_IMCR_Ethernet_REF_CLK = 535,
> +
>  	/* PFE EMAC 0 MII */
> +	S32G_IMCR_PFE_EMAC_0_MDIO = 837,
> +	S32G_IMCR_PFE_EMAC_0_CRS = 836,
> +	S32G_IMCR_PFE_EMAC_0_COL = 835,
> +	S32G_IMCR_PFE_EMAC_0_RX_D0 = 841,
> +	S32G_IMCR_PFE_EMAC_0_RX_D1 = 842,
> +	S32G_IMCR_PFE_EMAC_0_RX_D2 = 843,
> +	S32G_IMCR_PFE_EMAC_0_RX_D3 = 844,
> +	S32G_IMCR_PFE_EMAC_0_RX_ER = 840,
> +	S32G_IMCR_PFE_EMAC_0_RX_CLK = 839,
> +	S32G_IMCR_PFE_EMAC_0_RX_DV = 845,
> +	S32G_IMCR_PFE_EMAC_0_TX_CLK = 846,
> +	S32G_IMCR_PFE_EMAC_0_REF_CLK = 838,
> +
>  	/* PFE EMAC 1 MII */
>  	S32G_IMCR_PFE_EMAC_1_MDIO = 857,
>  	S32G_IMCR_PFE_EMAC_1_CRS = 856,
> @@ -317,6 +337,13 @@ enum s32_pins {
>  	S32G_IMCR_LLCE_CAN13_RXD = 758,
>  	S32G_IMCR_LLCE_CAN14_RXD = 759,
>  	S32G_IMCR_LLCE_CAN15_RXD = 760,
> +	S32G_IMCR_LLCE_UART0_RXD = 790,
> +	S32G_IMCR_LLCE_UART1_RXD = 791,
> +	S32G_IMCR_LLCE_UART2_RXD = 792,
> +	S32G_IMCR_LLCE_UART3_RXD = 793,
> +	S32G_IMCR_LLCE_LPSPI2_PCS0 = 811,
> +	S32G_IMCR_LLCE_LPSPI2_SCK = 816,
> +	S32G_IMCR_LLCE_LPSPI2_SIN = 817,
>  	S32G_IMCR_USB_CLK = 895,
>  	S32G_IMCR_USB_DATA0 = 896,
>  	S32G_IMCR_USB_DATA1 = 897,
> @@ -503,6 +530,12 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
>  	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DAT7),
>  	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DQS),
>  	S32_PINCTRL_PIN(S32G_IMCR_CAN0_RXD),
> +
> +	/* JTAG IMCRs */
> +	S32_PINCTRL_PIN(S32G_IMCR_JTAG_TMS),
> +	S32_PINCTRL_PIN(S32G_IMCR_JTAG_TCK),
> +	S32_PINCTRL_PIN(S32G_IMCR_JTAG_TDI),
> +
>  	/* GMAC0 */
>  	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_MDIO),
>  	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_CRS),
> @@ -638,6 +671,13 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
>  	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN13_RXD),
>  	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN14_RXD),
>  	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN15_RXD),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART0_RXD),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART1_RXD),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART2_RXD),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART3_RXD),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_LPSPI2_PCS0),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_LPSPI2_SCK),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_LPSPI2_SIN),
>  	S32_PINCTRL_PIN(S32G_IMCR_CAN1_RXD),
>  	S32_PINCTRL_PIN(S32G_IMCR_CAN2_RXD),
>  	S32_PINCTRL_PIN(S32G_IMCR_CAN3_RXD),
> @@ -652,6 +692,18 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
>  	S32_PINCTRL_PIN(S32G_IMCR_USB_DATA7),
>  	S32_PINCTRL_PIN(S32G_IMCR_USB_DIR),
>  	S32_PINCTRL_PIN(S32G_IMCR_USB_NXT),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_MDIO),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_CRS),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_COL),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D0),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D1),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D2),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D3),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_ER),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_CLK),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_DV),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_TX_CLK),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_REF_CLK),
>  	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_MDIO),
>  	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_CRS),
>  	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_COL),


