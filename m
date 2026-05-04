Return-Path: <linux-gpio+bounces-36066-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDPxCOOc+GmdxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36066-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:19:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AF84BDC0B
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8CBB3039A91
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A503DA5DE;
	Mon,  4 May 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="URKhG/XJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D193DA5DF;
	Mon,  4 May 2026 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900316; cv=fail; b=DmsPnJgMjJ6EgbBhg916bx4E5Lg+IT2dJJqK/OhBoWcUoL6nkWxQNc6vZyBnrxapVosBRldaAZHtA4V4Fey8Fkx3+KJtex+lfF8o56SRH6lBR4bWYeyXuMdauHoOCfkzEaEwi8yQwjXnIW4bkCQfqPRnkGQyNbyxWy5Lusq85H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900316; c=relaxed/simple;
	bh=w55AifaDGnvAr9XBiOaWdTvNxArdD4x2K315lIqD7ok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vDpMGdXSep/4q5J5G+xkW33NKLEOE3tOvDdkW+YHpaEUUTBZpSz7CABsNxj/pv0JW49YA8ZIN8RboO+0r5PnmVgP7WqBocuJNOP1R8b5T6wB4pkaquy1WQu+WCvBgymhU8u8FGLmHQRY71xKPKK5Bn0eRuTBXWMcZD30fzQrxuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=URKhG/XJ; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbhjGslQ7eSYyfYdwj8onREYknppSSS9ECNQJDKW/K2swvflCHQTnvkd7IRF0DfVbqN4XPTXNVsSESRhH8iKjn+X562x/uYK6nzt2Yx/6Dk5pfCXLC8UGSBfGP/bPkIPUtvYOXmzjfIO3fq4h3i9f6vJxeXtwx9WqRR7D8SkKdvCYHVyjhFmTSTL4YZI/MndhkQsZPVrgcB8CyJKZQzbBCq10BfTsCp7YLKHTUPuTPOjIHDa/9qm1FYx2w1g+7maAZ+1U7zfJVOAbJYLi4Wec/uuIqwxiGsdlualyUJYENVtnHuZqhurBYHBLS8nE8iHnz5VGkwe3FKdlNBy8BMr+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSjLXGvI/GHxOpKloVBWCB2a2vDnAPQgRXSqD6Y1jDI=;
 b=HLOzt8eD+dGrjbEy11FQ/tTaG+h5ctgPIO55S04jwEKtC0IgOswJ4lZKgAfD7G0q/pTmPNyfHPfXLrP77kMQvxAk63qVs4ljiYXRWOiueifm6wWB46nSMfVSYY6Q4BgURj8zHl1T8QysnIuy0Hv7GLT5oub8AneSjH+fN8R0pZ6DNUrFmEgMu3obSIA6Z80mptiHWWMi0RjjP3MFSFu19vlgInjQ69Qm5wKqrHSPCQiTasqxVY8tBcCtvG/KiNNhE8DGM4umwbxKGRrhlWXbcLShFNXomPwDEAUaoDS40b7uZS5jYBVIUxKhFrbUYPx0fSSrk3egxsyfefxt+9AzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSjLXGvI/GHxOpKloVBWCB2a2vDnAPQgRXSqD6Y1jDI=;
 b=URKhG/XJXQ/pAXOiF2xbDPefjEd32vN38DOZaveZWRfa3bvKZmfq4ZFjKwA3trnR8dRrdu5Zdv6J1DyO5HRZqrNaGKkYm1eNOcmTrhNj5zs7IYV6Twi5xSN9ZeX1x2QaXhW0+EH8Zvt+fdJtdUW9PEyMxKRvsT6aWcsHsBkp0Zn0xqwIYpmoAov+29ib66weDWP515A76qHZn+yE+EEhrpjnVNCqX4gef3eDp3QNswRrPAZL9CSQ9g6wYPRBJi5xSsRxY1PfLd1PUAz8nDBSvyVt2d+yOxxsZIfVEhGCE9qgXVqmjwhAeY8hX7OkghAuojuXKV2XkSZhhuzyfdqTQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DU2PR04MB8583.eurprd04.prod.outlook.com (2603:10a6:10:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 4 May
 2026 13:11:51 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:11:51 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v9 1/7] pinctrl: s32cc: use dev_err_probe() and improve error messages
Date: Mon,  4 May 2026 15:11:42 +0200
Message-Id: <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0003.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::8) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DU2PR04MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 6423c619-8dcc-4674-0681-08dea9deb47d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 +qCUJULmvfE+wil4YNYCgJF+Or2DGT6vL9b9hJeW5k2su2na6uvp+pxCIiPfOtPTAutMvkvnnuZwl1TDG1Q//yyHXixn8ACCDIFt2ZhlDnnxSEeFUc/HjPguPjEmjwYRGO6EeU4GaZQ0sJXrtdfbR0mE1bqTA0+WbRh3uRTK+/XnpbtXPkyii1+MTRCtXB1z8W0eAyspHZ2+Aj34L4drM5AQqUVO6DBqwS4krSrHcbwSkkWE7Okzn10vwmuBUnSDfx/aXnCAMkyVleCeAfdv8vbPcJU6hLmnIkkdt7BFUfEh+IQoXTt2jjq99+2qQ5Bs3THqwZvmE8TLXT2e94rUU34OdujhpiImfFsTl6EWStH2TJsBwF48Haf5JM4bxDRoq0T0dncxIEEL36AVQmY0Ofl4xKfDTdpRS4/9/11zf4A2VZ2eqhgxdRdNo5BnCLRWvnG6WppZx+ngmH8bmeH5S5KgeeMFVoAouphJrQGaCnsGHNs3Mu9qGugw0FpWX4s9DGXvKiD44dyO0ZvD8FcxXYUOTGB+TzfNNSIVbY8SaP3/SQWzFcqV3HQoPN1zEBJIS23HVpMuitLQn7xVPpNhK5GXOZ4Vwrmv1661AkyCbTtNMPCBF6LYv+jZnWzLbdSNpYeZr18KSdOzIvuxYD7V4/zkWjLsAJHXcGGtMmnbrxUleikYFP7ayg2FKYLmlX8TU1lrizH9PJvQt7ycx/EkWsmggnUk47ZFEyPnsNKAUpM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QzQyaE1rL1JUWDhtUkhjcE9jK25iQnIxSmJnaU9Cbkx3YUdab3Z2aWtZVDAz?=
 =?utf-8?B?anh3cVJVUlNoaENhV1pFQWtVVGNuMms0OUZRN3VGWHRLbzRjK2UzVEk0SEti?=
 =?utf-8?B?M3Y2SGhWUWJObDA2Zld6Mm5lbE9BZkFseHdJdFVhZVJ1bTF3MmZZdlg5bkdQ?=
 =?utf-8?B?NzFzVmtxTExtTzFSbUlvMGF3ZHN0azFuL1JSZ1BHRWJWall5QTNUZmc2Mlc5?=
 =?utf-8?B?WjliaTdmZ2pjUGdobUc4V2FraDFNbHIwNm1Hazd5QWlzZ28xYXRWcDRnMDJI?=
 =?utf-8?B?dG8rSm9FRUorNTh0SGU2VmtGakdIbkhoUSthTkd5dG1XRHJOOHJGS1ZBdzJk?=
 =?utf-8?B?Q2R5Y0thTERzSmtPY1JjSkpnL3J2YVhuZ3JzRENTQkNxbC9GWEN5Zm9XYmJq?=
 =?utf-8?B?dnY4ZmU0Nlo0NEp0ZmM1WmZYb0VhZ1dtWG10UHlFN2h1a3UyakVKTk5ybnZa?=
 =?utf-8?B?ODRnYk1tL1RVNi81eXpvSnJwMHM2U084N1MxYkQwMmpNWmFBZ2l5RDJBQTYr?=
 =?utf-8?B?R2FDOFdQeEo2Skx5RHlGWWROMEwyVlJxWjZZV2dIOThMdDhSa3lWYUhoNjc4?=
 =?utf-8?B?cW04K3ZIdFRZNXpyQUk3R0J3dnRBL0N0UjcyeVJUbXJlOG9ENFFjTG5aTTBC?=
 =?utf-8?B?bUNUMDdqTlpxN2ZnRHlNZGVmZHF3dHc4R25kWGxKYnhsenlJNE02OUZqeThZ?=
 =?utf-8?B?K1lxb1VmUmtMMS9GV05OVTZqTkJpRUE4bE9Va0N5M0RMcHpCZktNeEl3WWM5?=
 =?utf-8?B?U0ZJQWg4RkJ3TTNiNDJyR3ExOGorM2pHL2hzajdsVUdPbzhyR09id0ZDL3VW?=
 =?utf-8?B?NFBnVWg3NHpHQ3ZISkEvRkJjNHlPNHFGNGNGUFBtU3hEZFREZmZ1eWY5WUky?=
 =?utf-8?B?VTBLWWRmK05EL1NoMHMyOTljazlqUFFlYi9kcUhpeGxsYXF6S0tIbUZpQjBX?=
 =?utf-8?B?NVZjRkhXQ1laRUxURXkxYkV4R29PSStBQ3pralR1cFduc2p6UVQ4d1ZUS1Vw?=
 =?utf-8?B?bVlEWUtuOUg4QllHcXhzV2QydGpMNXdSeVZOTGhTRDVrTU1KZU1RanVaWVBW?=
 =?utf-8?B?UG05dlJMZDRXWENDd2lsOHNha1BlT0U0cjdscmR3T0hiTEozbXh6bkZhVHFI?=
 =?utf-8?B?dEd2L29SMkNKeVM0QS9pcDA4U1Z5aGFaTlFzZFF3ZDdBZXI5cVdKREN0V2dj?=
 =?utf-8?B?a2xvaExGeHJJRXI0aytCQWxTQVFxamlYN3ZiTFlJQkJzUGZybmRmNDNqeHVB?=
 =?utf-8?B?eXhISzZaUFRJR3RnVnpTRWZqaUxQNWtBeXlrYkFMUU9YQ2ttUGpoRytoK2Vm?=
 =?utf-8?B?a0dnZk1nM2VFY2dwNWpoVERJMWNYNWpFV0lWTmNNOS9iSWxhT3VMMjJuNDZh?=
 =?utf-8?B?UVd3bHpKeWlTVXlSYUpxWGo4MFNmaTd2M0tQakQ5TktVYUkzdnFGbnlIejRo?=
 =?utf-8?B?VlcvbFYzYWh3YVFnaGZhTFlNaTlOWFFwS2J2RVFrRGtxWndrelhBVm9NN3k0?=
 =?utf-8?B?ODhlOVV0aGtmV1hWUTJpbkhwR09KbHVhV1Z5RDlGWjhVMUl0KzBiYWI4WlJT?=
 =?utf-8?B?TzZVTjNsUDFpWDcrZU1hL2pxLytYQ2p3WFEwT0V1RzhFNkhiQldnUEtINUM1?=
 =?utf-8?B?VkVkTWpUQUQzQjlYelVCUHdDMURlMTdpS2hvMGtDZitkdWk2YVpKTUpWR3VN?=
 =?utf-8?B?bmg5QVpvVkVGNnRCWGNDMkZFQ25XeUlNNEhvMk51RTZ0em1kT2d4QmUzckJO?=
 =?utf-8?B?Sk1DQm1xdytmb1orVEw3NVlJMzdmeWRqMkR4TDBHd1NYcXNQZXA4TUtxejlN?=
 =?utf-8?B?ZDM1cmlNalJ5aXFIQm9CYzhaSFQzTEg0SkJVSnZ3c0k4UlArQmFlSWpEcGYv?=
 =?utf-8?B?MTgxazYyckluR0FhTHowcENvVWZ3VDZSbXRWV3pGZ2ZzbEpCTFg2ZzVKemlu?=
 =?utf-8?B?cXh5eGxYdy9temFhNm1pd3dFS2tkbHIvVmVncGdxRmtZMGF3TXlmdVBpL1Vi?=
 =?utf-8?B?OFdXK0QyK3ZUTjQvSU8rMXdTWUxYQWdmZzNTSTVpNDVNeHBLTUJsVkozcFY1?=
 =?utf-8?B?aHFySVlIV2gzWTdWY0x2YXpTK2QzWVgwS1lReXR2VEtWMnFDTDV3MWxQRjlT?=
 =?utf-8?B?NFAzTzQxdGdvYXZJam1Ia2YvUUY4MnEwbXFOMHpqSWxoazk1aHZ2azZpc3dW?=
 =?utf-8?B?Q09LeDlEdHNXS3lXRWhMM3JSLzhIUGNadTZBMjE5V0NocVdvcndPU3M3SFhP?=
 =?utf-8?B?NTNTYTNPVmNqRjM5NnYxQy9VUTZoQitPQ1M1VE9ua1hHbVNubGxaNEFBWjVG?=
 =?utf-8?B?RnNSTjQ0cU42ZXBCMFBJTFBPZnB6RVYwZHhDTVMrVmFwKzZqZWlyeTVadlZ0?=
 =?utf-8?Q?yIk6EoYtAGfyycIjWnAhSqv9tlOJUVH8unzYc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6423c619-8dcc-4674-0681-08dea9deb47d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:11:50.9977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEH4ZJ0hdLaS9hokBggnvZ/5yBiTI6rosC4DS3V59V5PV4jvTKN8/KVrJx2D3NnStELyqPgR5v1EH480pk+QeB5NT3dlY42RjqFPF243XVSLbjEgjkvok03UU00DI57i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8583
X-Rspamd-Queue-Id: B7AF84BDC0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36066-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Change dev_err&return statements into dev_err_probe throughout the driver
on the probing path.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 64 ++++++++++++++---------------
 1 file changed, 30 insertions(+), 34 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index fe7cd641fddd..56be6e8d624e 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -2,7 +2,7 @@
 /*
  * Core driver for the S32 CC (Common Chassis) pin controller
  *
- * Copyright 2017-2022,2024 NXP
+ * Copyright 2017-2022,2024-2025 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  */
@@ -236,10 +236,10 @@ static int s32_dt_group_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	ret = pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cfgs);
-	if (ret) {
-		dev_err(dev, "%pOF: could not parse node property\n", np);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "%pOF: could not parse node property\n",
+				     np);
 
 	if (n_cfgs)
 		reserve++;
@@ -763,15 +763,15 @@ static int s32_pinctrl_parse_groups(struct device_node *np,
 	grp->data.name = np->name;
 
 	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
-	if (npins < 0) {
-		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
-			grp->data.name);
-		return -EINVAL;
-	}
-	if (!npins) {
-		dev_err(dev, "The group %s has no pins.\n", grp->data.name);
-		return -EINVAL;
-	}
+	if (npins < 0)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to read 'pinmux' in node %s\n",
+				     grp->data.name);
+
+	if (!npins)
+		return dev_err_probe(dev, -EINVAL,
+				     "The group %s has no pins\n",
+				     grp->data.name);
 
 	grp->data.npins = npins;
 
@@ -812,10 +812,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 	/* Initialise function */
 	func->name = np->name;
 	func->ngroups = of_get_child_count(np);
-	if (func->ngroups == 0) {
-		dev_err(info->dev, "no groups defined in %pOF\n", np);
-		return -EINVAL;
-	}
+	if (func->ngroups == 0)
+		return dev_err_probe(info->dev, -EINVAL,
+				     "No groups defined in %pOF\n", np);
 
 	groups = devm_kcalloc(info->dev, func->ngroups,
 				    sizeof(*func->groups), GFP_KERNEL);
@@ -886,10 +885,9 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 	}
 
 	nfuncs = of_get_child_count(np);
-	if (nfuncs <= 0) {
-		dev_err(&pdev->dev, "no functions defined\n");
-		return -EINVAL;
-	}
+	if (nfuncs <= 0)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "No functions defined\n");
 
 	info->nfunctions = nfuncs;
 	info->functions = devm_kcalloc(&pdev->dev, nfuncs,
@@ -919,18 +917,17 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 int s32_pinctrl_probe(struct platform_device *pdev,
 		      const struct s32_pinctrl_soc_data *soc_data)
 {
-	struct s32_pinctrl *ipctl;
-	int ret;
-	struct pinctrl_desc *s32_pinctrl_desc;
-	struct s32_pinctrl_soc_info *info;
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context *saved_context;
 #endif
+	struct pinctrl_desc *s32_pinctrl_desc;
+	struct s32_pinctrl_soc_info *info;
+	struct s32_pinctrl *ipctl;
+	int ret;
 
-	if (!soc_data || !soc_data->pins || !soc_data->npins) {
-		dev_err(&pdev->dev, "wrong pinctrl info\n");
-		return -EINVAL;
-	}
+	if (!soc_data || !soc_data->pins || !soc_data->npins)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Wrong pinctrl info\n");
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -965,10 +962,9 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	s32_pinctrl_desc->owner = THIS_MODULE;
 
 	ret = s32_pinctrl_probe_dt(pdev, ipctl);
-	if (ret) {
-		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Fail to probe dt properties\n");
 
 	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
 					    ipctl);
-- 
2.34.1


