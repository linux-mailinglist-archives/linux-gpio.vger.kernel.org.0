Return-Path: <linux-gpio+bounces-39532-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PhriJZ7vS2oodQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39532-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 20:10:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C6471451F
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 20:10:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=T45CDG2O;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39532-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39532-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0101C318D3B2
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 16:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA673FE644;
	Mon,  6 Jul 2026 16:03:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CF9378828;
	Mon,  6 Jul 2026 16:03:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353783; cv=fail; b=qOsbdiqC7SBKuvwdLMRrKd79SdU03FW7KjEopTEV7crcPX+ECD3vLzpt0V0MoKjSP/7Slq1xCPqhkntoGhrIRcPS6lRxNR0hn7rDi0c3THsExjVxQ8ocyjZm3r83fFaCEAkUAx8+bfHB1olSNWOZmi26re5U8lJZTEABpKrKkow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353783; c=relaxed/simple;
	bh=YuWi21sTKDpUyLaH5OWVuHGNpSvgirXmEHPkWTrmNDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dIZskUvTphNAW8+kd26jcxulEepr0Ym3Wu0NO+QwMTB7eXAZX0jDAhdyLT+EOVozzjRqVY7AGCzy2wlebG5bdYADNHkFRuU/pViJNx46Xjnc/KJanKUhbkQBGnP5+mQ88aSiv4GgKITQ7nqkw2V0AZPR8Cnjwymh4v3pAJ81FFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T45CDG2O; arc=fail smtp.client-ip=52.101.66.62
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIllTXcPFX/ccQt776M6bRaSnGnsd1yTg8XT6btYmNlH50QghCShCUaugYT1TlXnrhjWo+BFD56hIe/7Wk0ObAM8aeDHS7PZ2FHDudZoO7sKk8PHHvVz0f1DTrUMg2QLtYAKOj8UBXbLTEtxUh3k6lJfGqFOqabKwXUwuRmOKWi82O31BLvpWE3CjhnV8sQDTPtOUs/2y/7pHFgl6yWI8LdZRuglXMe8eeQzeDVKLhgux/xYmx8XQ0IgyAotTo7byQu8i9YvIt7LWuZu7HEdW127a4tvc0q9VB9LRnotSF5RfpLVV0ZV3afTLUFBWWSJU96Rd3Qr2VjDwlF3gfUWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZ0mEzOD2mXgFU+AtZV63450tePvHjwEooqg73zOlcg=;
 b=jgNL9qz40Gjc6UyJl7Dpab6LtBz0xeJlVNsDAGefiKfKyWAgoVTkXh5+yMfGUqHegG+lMPTmwopmzyZ/e6C9Zke3x8kZKN/IjtzoO5cZmE3x+1+cl7ErK2dMoWrg4OeZaS/G+fNKofLdTq/M2gGrBIGUsb+SSTOC6sOAIlVxv3kJW9TkTsC70YEhhGWQxqqDWnd/hu3wWyse0IpQPUbe+RVu/VkVBpRI6uFJr/th3zuX0R4M6NfsR0fge1IBWfl5PuvrBYQVQ80ZFNeor5SMccEdT/Qn6JWx5Lq3gQIusKariT7EibZS2yqLsRiS2ZbY3JxP/LB6m4wthZ2H5mTSUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZ0mEzOD2mXgFU+AtZV63450tePvHjwEooqg73zOlcg=;
 b=T45CDG2OeRdu9/XTmBXPGLr/CPOxFeNpkII8LEiw95+inspPOti5dy6nIJlID3f8FJuo+GoDERvbEeqBedJ1Tb67bpUEzrOdPhEwryeOZhh6W0Bi36fH/QGfGJlnORGanuhATiYxffWDQudvR/ccLrfdNc8IxyI/R97hHZwB3gIfnEacx9gcIE1W9p/8qSlgj1Rcd85ycau4gk8ecbTL4ISwlKDJs55WDBjRZO90FfSAidUHu0PdSjS4CZx/daVDk+SbfrZ/SoocV8gX+YXF+9sZrxP3SD37hBlx8raWrlS1x+gUUnO5L1Bw8JGTAjDhb5HayzV5UD8+ybXnxxZVjw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI3PR04MB12634.eurprd04.prod.outlook.com (2603:10a6:290:81::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 16:02:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 16:02:56 +0000
From: Frank.Li@oss.nxp.com
To: Linus Walleij <linusw@kernel.org>,
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
	Srinivas Kandagatla <srini@kernel.org>,
	Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
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
Subject: Re: (subset) [PATCH v12 0/6] gpio: siul2-s32g2: add initial GPIO driver
Date: Mon,  6 Jul 2026 12:02:49 -0400
Message-ID: <178335371557.1392931.14354994026196868913.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI3PR04MB12634:EE_
X-MS-Office365-Filtering-Correlation-Id: 31fd6bbb-3596-4ffb-0d4e-08dedb780af3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|11063799006|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
 bjaWjv8IOUcXrk0Su9izWm3JN3wDz/Ye8ceL7A5BFyZkTIKmmw62/6UTufn+189JWewLj8xTBmbpRDGiBSyJgt2JDf2K8JwotWKeB7h6RVtMbf3rO9sk1rIUw8RP4h+WbcL1YAc9VuxPosRNBr8Mj6txAB9ZUTAGX5uIRC9BkhGw7vWDONrNtZCSVupc1yTqXH0B487R6UZSWq+4Im1eQeAEjrdsR4YHfVI8LckfuwGLmErHJtyCbE0w8mSi4b65tRTpfmJ55vjGSVZl+qvqIstWOuelY4BWlOhGZExc5nzaFaKp3SSCz7JpK2+Q/Q4FWVAs8j94BgtBinFW9xz4LyrF20xwPZPR6rp6aVvBcwxyTL7Q0W8u1HXk8fiQNOV/99KETyF/8RSg/PjlV84cpddTIF/HgaTzoMLnNjpMKCSp2cUD6lE4tNF+eA48LSpgS8GFGnho0xg/XO92om1BfaUR4vMnkeViBb1UTHt6laBQ+tzaWeaRZod5xyoeKgS7pRnie7Lh8uCuzcbmFZOzZc6oeXU5CSWgwFEYXyswBHKVIytljcI2olpq7tMnlFo2WYlgezlZSE2U5NwCRR9MDN+WvT8N1Km2qK7CWBQCnpay488RO4NGyQV5hp2oaPuQDfApS1orsX6KKdwbYjXpGXCCiT03FY2NPpVKHogMqbgacRZXPxSsoUBpncb3M/JxR18eLJzKGgw1vUZGqZXdeg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NTN6b2tIY2JVMVJrYkxIL2U2WVpLWVJhMlZRcXZCRDB5cEpmM2F0c1lVTGIw?=
 =?utf-8?B?NTM5TytBd3FNL0JwbmZ5VUNJNnAxaWZyZDdsM0ZtY3BxdkpNU09iKytNQlRX?=
 =?utf-8?B?ZWs5QWpRRkxvZXZIa241QUduNEVDcThWUlJWeVNJaDZpZ296MUtZaHpUc2FP?=
 =?utf-8?B?RDlNblBIcms3cm5UMTE2UFhJWUY3czd4SVhqRk5qYzJQemtvbDJoeGdZNm9G?=
 =?utf-8?B?ZmNNM1FiK2xkamVXOFJ0VmdqTHlrRXAwNEwzVnBVSDZ6d2dPN3BnRFdISEZt?=
 =?utf-8?B?Y0N1YjZ6WlFhUHlRamFFNXMwRm8vZyt0S1B4NStqcG83YVpqZzR3N3piNUNV?=
 =?utf-8?B?MTJwLzA5ZVNha1dXWnpsazNEQThvcjV3WjJBU0YwK1R4cC9RT1c5LzdPWTJj?=
 =?utf-8?B?UndWYVM4dzR2VUVDR2FvMFp2V3YyYmdiZ2ZyTFVmd1k1SXErWUNUa2RKQXNw?=
 =?utf-8?B?M1RKMVFkUUlqeUY2bktjWnBuTlk3K0pBWVJFSkwzMm92cWtEdkoveXNKYzZI?=
 =?utf-8?B?ZGExVytBRzVnQ1Q3S0FJWUZ5emd0aTlWbEpGempRUG5YYjNVRDNVYU9URW5Z?=
 =?utf-8?B?aGs1VGVXUUtzZ3ZPTXorazVmblp3TWx0MlNWamt3QlNNd2l1aytjdmdEZ0ZY?=
 =?utf-8?B?TmkvaHJGR2F1WlRXZ3dzVWxSYzFNYkh3bjUrWE41Y1pJd2M5QTdZbFFldVhU?=
 =?utf-8?B?MU13R1liUFpoa0NCY1FvYUZpZjFjOE0zZ2FTWWswcVpoSXhUU054ZWx5cmIr?=
 =?utf-8?B?dXRsaFp3dE5VcVA1VEF2T09ieHFpYTR6UjZ2WnZnUzJjZjQ3anNBUElGb1g2?=
 =?utf-8?B?eVJMWWNudFp4RE5STHZCdXJtUGFBOWw5YXNDVCtVVS9EVXkvclNwVDNRUW0w?=
 =?utf-8?B?THI3cmp0RU5kOUMrTTdTTVJKbys0endLTFQxY3BMeHFUdWhXZVI3d3BETkpy?=
 =?utf-8?B?NHJLaWw5K1krNjNmU001VUkrWUZhRXEvRktiMTV1MkFFYmtBUDJRd3NSVE9a?=
 =?utf-8?B?a2V3TnkrVjJWUEJZOTQ0WmlLdlBTaXNId2xPR3FxajgvV3N1Lzc1ZkkxNEUr?=
 =?utf-8?B?Q3NZL1c2dlJQZjN3RGtMM1pONWJzeSt2aWFxZHFxaE1mY2pMQnlyYytGRWov?=
 =?utf-8?B?MVBaeE1CT2FlR21HV1JrK1VpOTBzQjVuekNURkZkejQrUEdJazFIWUM0WTJH?=
 =?utf-8?B?NHRkQ1UwT0dvTTIxNlN3WDdsM1N2WVlieFc2L1FFS2VJdVFMdjhvbFRkQzZT?=
 =?utf-8?B?bGowV09CN0tCZXIxYzRmczBSMjhqaE5FK05CNFluWVpDVkZJd0RmUFVjTkhM?=
 =?utf-8?B?TWtnYUxTdlBhR09lSlMyQjJIbHdlSkdCWENQVnR6ejlKQ1hhYUV3WVRrREVj?=
 =?utf-8?B?azU2OW14eXpBd2NZOG9PYURpcURLcnNacXJ5MDNtSEdBNFhGSlFkQkZ0VGxv?=
 =?utf-8?B?QTRHTkU4OXlBSXkyZWsrbzlId3lBTUxZVjg3U2kwZTdnYUxPVmVvZmRMbWM2?=
 =?utf-8?B?UUZySVRqTmhuSlZyN2phWmpPcDZ5SmhFdTlBSFQwVjduR1VINko3bVFVUWV5?=
 =?utf-8?B?ZkpVK1JDdmFBbHFGekNsUk8wdFd1SmtRRExtTENVUXQwdWtoWm1jSXpOV2Z4?=
 =?utf-8?B?VE9mWnp0cjlXY3F4SWhJZ0k4cXZtN1ZKTmN0eE9HbWxoU2gxMThRWEk0emJp?=
 =?utf-8?B?WTM3UVBoRzd5ZWJhRS9JRHhXM3BlVGZ2Mk9wUm9mcy8zcCsxaW4zeUpVanQx?=
 =?utf-8?B?NnltZ3dlSVk2YW5BL0wwMHNrQjZXNjV6NjNLMFJSN2c2K00xay9Dd2xiMExP?=
 =?utf-8?B?Q1hsRkRId1p3SHY2Wk1zWjdqYTlubS9JWnZVK1krbkV3Wk0vT2JXVDZiaWVt?=
 =?utf-8?B?emY1SmxSR2R0UEJyM2MrR0dZMi9aaUdJa3Y5aXdLeEpqSmFlUkFNSHZ5QU5v?=
 =?utf-8?B?OUhqYThCQU1Fd2VrUFlZL3k1YlREU3daWmxXbDE5RFdJK2dCcXl6UCtIRGFT?=
 =?utf-8?B?VFJzenVyYlBXK0RpYnpPb0FqSFNaaWt1MmF5cEpuSHlJeDZ4NzdPWmRaRnR1?=
 =?utf-8?B?UFhORlFTanpTNjkyalhORHVnOTdJZitpMGlMbktKSUpDN3Vzb1hPcUZSK0pp?=
 =?utf-8?B?a3JsZ0xORDNwQ2FKSzVFQkhOQ2s4Ly9ZaVlwY2xPOFliKzNWUkFCa29BNWtP?=
 =?utf-8?B?d29WN2VYZW5kSDVmb1o2Zk40amZRcUErbzIyR3BvZCtoZGxxY1FvakREY3VU?=
 =?utf-8?B?aDNTdkhZaWlzek8yZHpLMk9aeVRwTjZhNUZhMUw4UldUb2szV3RVOUNRK002?=
 =?utf-8?B?ekpXVEQydyt5SlJ4OVNwUkFvZzhZNGZmZUtCOG95OWNIQzdkYXN0VU03TWRs?=
 =?utf-8?Q?P0VSmb0YEAgmSV2CKVD74SoEWKhN39E7WPGfQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fd6bbb-3596-4ffb-0d4e-08dedb780af3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:02:56.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBFdFppkrECkmnFDZfJEOSe3bM86w5wUtEeju7qX5R4IvzO+AKDchmbwkIDuTPf03KRA9gF3HQih02nPZ5z9ww3rrzTloDJi3ZlDUva6gN2hF1DakjE8Trn56Z2alKv4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12634
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:khristineandreea.barbulescu@oss.nxp.com,m:Frank.Li@nxp.com,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,oss.nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39532-lists,linux-gpio=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.nxp.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2C6471451F

From: Frank Li <Frank.Li@nxp.com>


On Tue, 30 Jun 2026 14:53:57 +0200, Khristine Andreea Barbulescu wrote:
> This patch series adds support for basic GPIO
> operations using gpio-regmap.
> 
> There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
> However, this driver exports both as a single GPIO driver.
> This is because the interrupt registers are located only
> in SIUL2_1, even for GPIOs that are part of SIUL2_0.
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl node
      commit: 5e7e00f811fb1808352a22d18e20aa8026c6d73c

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

