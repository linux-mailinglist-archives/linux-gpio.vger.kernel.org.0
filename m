Return-Path: <linux-gpio+bounces-30788-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHAIKTBacGlvXQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30788-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 05:46:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 13135512B9
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 05:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1943484A4F6
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E72428836;
	Tue, 20 Jan 2026 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IM0AiF5n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E0428829;
	Tue, 20 Jan 2026 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910393; cv=fail; b=RhSMt+dWHAgOu7IQQb5baYuPVYU5VL4N7fgm6h9tsBxlCjOfeO3qiJDwRt4pvw59XBTOM/yVNZ/4mLc/1+kh+u893FfNGA4ytJmZrpY5APri/H3dLbXhjVSAp98ErKhl0GbME6I6DsonVdudB7cBoG67hERd/J4xL4krrER64n4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910393; c=relaxed/simple;
	bh=2mM6Fc/Hsi887yj4xpSIgU5oeqgNdEwJmaALTkai1Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mg5Q3iDmRpOv8YQ7hPdXKtVXjZVYmEaqYgWWTF+pg4ji5byCTBqpXNJXPYW0xknQi9L4Rv6HHJXD/TM5PUJmeqXHhUr1DqDsp4eO3/fwER9HRwjFCiKMFmYH2+PxbEOXc83hfOn04l/M2/0QDrrzPIk6jXvEnQbF5kAzBXxKM6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IM0AiF5n; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qvnin8VLDXmD3p19mIr9uhSpbzuhyUX2cw60+doC9TEW4iQMSVIo65fIqxWX2XU0XMPIeI6EAn+ETF99PPKlr/IlwT7TCvdrXAmwGGPWl3Vehc9MLgh/wZEb6JCM5J6m/mbCxm2bedl/FPvE8GJRQix7736ga7EDExVBiEBPgkWbwU1Hb0PEYQh6I1L4aBfZ6I9N+S7Jo4xp3vH9sRfRgHV1UEZ/XGUHes87+9s/D5Wmeg0Jg9XWKHyWlk/LMVPD7zF1VYA1lF60A6hsHP+3QoqXY0CrtrWVs9aM+zg6lVBWwaQCfrLoWQL5UJ4Q7wSou8O6Hr8bzEj5Wc1bOUmweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RurEiCE0tuQxYHZNGrVLWSEbKMMd88cSzOXX6V3NHDQ=;
 b=jHuoM+n5u3jVffAXZpApD5W9AhTRnlkAybSL0q9ivT5NL6e+gyP5yEFwkkZNYEWuYBjarLyTRE1cSzwMj5H9E5UXz2XFjHVaeLZ+Fmqma5pHSaUoUrW+CuvNBE28ytpF815Qc83Tw5cr6cPxRfevVxIFumNCW82QFTcGeGAxNFCkVYd6Ge5PEzeeHOhoFtd1JqKbZirsY3Wzle+HvPxkSHMoFaAYulFuKg7GMAfo81Dx/lQ0tdJVjM0ZT/VHYk8rYZCRcLOu36f7/r5QzRhh9NdVE6Mu11RkQgqHQdjOAxmaWqf0vLQDDhdj609voh6Kvt7Q4G30uAfJtZugpWZkyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RurEiCE0tuQxYHZNGrVLWSEbKMMd88cSzOXX6V3NHDQ=;
 b=IM0AiF5nbfSm/0rSeHeB5GBN646MmPm0HR5f8gcLCGk3Aksin/wWg/A7VDE8a2iGN2+JIPKLVOxit9oQZMdaTPY16JGltKVHRaBKzkdEs//G/fwT+qNUuyDKCJCYueZuZ6dAhC5FKeXTpqwzS1p95IUKWirO0vF9l6dlMfj6ai9xVsg1G6lGVqAVrC6GiIqa2ZvN6vulVxabfV1PE7deWA4e6hkWm+GiS43KvVaqMNrb8B5RRPWfcIxijR34Hy29I6M4w4LiqLKU2a2JO8BphMKB/MHkG/i1UDD10xE2FX/I8g79kyubRGViag0BtaETKDETR9nAdWhm0a8C5vtdhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:59:45 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:59:45 +0000
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
	"Rafael J. Wysocki" <rafael@kernel.org>
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
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Subject: [PATCH v8 08/10] pinctrl: s32cc: implement GPIO functionality
Date: Tue, 20 Jan 2026 13:59:20 +0200
Message-ID: <20260120115923.3463866-9-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P250CA0025.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::30) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|PAWPR04MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5bdaa4-4edb-4d60-5023-08de581b6750
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGhFQktQOXRBMmxpUzVNVC9wQzdtUFVpNFBDUkdpNW1zajUwY3htaWZreWlu?=
 =?utf-8?B?b21lR0s4d0NOcnlhWFRTVGJoTGJ4QTROWGNsc0QwNHVKK3pYV1hMYUlMNjlO?=
 =?utf-8?B?N2RyT0tudHhNNFpaWEJiSVVHZnBuWTRNTlpldkhzMUVnL2pHMGpSUzF0Kzls?=
 =?utf-8?B?S2l5Q1dNYkdXeGFLUTNWZk9uSTdnYzFwMXl3T3FXRWd4S0Fjc0REU3hjRWMz?=
 =?utf-8?B?ZjdUeU1TU0RIVUdZTEV0YU5MUmFtQUdaN1R4d3NZZFJxZ2xBc0lDVGRnY1BT?=
 =?utf-8?B?cEZPcHhuOTd3QjRYdWluKzl0dWlQdHArRnR2Nks3ekVSaDN1cCt5V1dVUFJt?=
 =?utf-8?B?ZlZnb1BjcEgrYzF3cm9RNmlzYTdtQVdIQkovTzRzSkVCYXVRMUg5b2FOSmVn?=
 =?utf-8?B?cDBGZ2t2RW1YTDlLalpvUnkyVzB5WXRrWHR5Q0tLRnVnRFB6RW1pQ25EVkZs?=
 =?utf-8?B?a3IwdzZkYnRXT3dUSzNrdm5FalNVTVZ4Yjh5bnRCNkJ6T21LckRld2o0UGRl?=
 =?utf-8?B?dDFlTXJicitJZkRSTGVMWjl3T1E0Unl4WWZZdHRaNW9zM3EzYVFYc1FzdGtI?=
 =?utf-8?B?Nm1xYWVqZEV3STh3RWtOU3ArVVBFcXp1ZVk1aEJ4VlNOeFloYm4vNW84L1dH?=
 =?utf-8?B?N0l5NzJINDZWZEx6d2F5ZytMWkkwWklwVm5xWHRmSjNabWdxZzJjeTV5aTNN?=
 =?utf-8?B?ZTZ2WFJEa3ZLOWVHS3JJa1RuU1EvM2h5QmpUUmxWS2NMT1B4VldVekorTzhs?=
 =?utf-8?B?NGFlaDJPRXM3Q0l4SmJJREFlMTZ5bmNCR1c4azdsdVJrbms2MTUwV2RnSUJp?=
 =?utf-8?B?VGdjblZNbnlWdkE4YkFJMHVXR1BEOEtSc2w2elZTejNxTUl4MzYzWmhzMlhX?=
 =?utf-8?B?WTV2QnptcFgwNVM5VThxclg5MmRFNWtaeWN4VGdubVVHRWpNUXZrblBGM2RJ?=
 =?utf-8?B?L0o2V1FrV25kalMraGhSSUZhRVJxKzVOWkJ3c2xCUEJuNk54RTFQUDllYUNk?=
 =?utf-8?B?eVdRdG1WMWsxZzB3bm5qY1pUVVYwaFlkUFpHYUNySVJzbkRzY2JTVk9YQ1RW?=
 =?utf-8?B?THlNYTV5b24rcVRNWnpsdXB0bk15MDFNMThrcElSWEdQcmNOenBVclJnYUdL?=
 =?utf-8?B?QjZlWTAxSE03ZElkUC9VWTVFUEgvVGJoUEQzZmFUS1N0TVhBVURXbVNDcys5?=
 =?utf-8?B?b2VmS1d2c3paOVl3ZmNKYzhlYnBRMm04RTFFSGZTVWdUV3lnUzdVQmc0RTdC?=
 =?utf-8?B?Q2E4ZzVRSGZVM1VURVREYzEzT095OEVORjhKUDNmem1lNWMxVFVOR3pmd3lW?=
 =?utf-8?B?YjZNZXp4VDQyenhjQ05CR1R6d3FKV2xCb3krMnZHK3pLaEZlSVNGdFNjT1FW?=
 =?utf-8?B?cVNONTRLQ2txS01vem9VZ1N0WUlXek5iRmpGYlh0S3A2bmg3ejJOUG5DNW5F?=
 =?utf-8?B?Y1N1MkRDUmJwMXhPUHA5S091OHEyYm43ZFZUcjJ1ZTdMRGhMOGtNVzhwWnFP?=
 =?utf-8?B?NGxpZVRPZHYyUTd5QytFbUZzbGtOZDNmT0YzQno0RE9YQXdRZmN1Smw5Rlc0?=
 =?utf-8?B?cWR2bHpPUDdQODZ2WW4yNXRLeUpucW1WZDhVYjByRGhOc1RRQ2grTGZNRGpK?=
 =?utf-8?B?M3RTc3lRbk92TUtXZ3dqc2p4U0g2NktScEJFdW9ZMFFtR01vbGg0Q2JDaTBB?=
 =?utf-8?B?WWlBZ1FkbFJCVm81cWNnTFh1allsZ1FJVmhEbUcvT3d3SDVwK0Zyb0JhcUI2?=
 =?utf-8?B?OTFwcVg2elBtVDhUQkxNbUZldXNnbTQwQ05ZYlp1WGlYUkhwYW5GVnRNclNY?=
 =?utf-8?B?Rm5pV0JhdnhXNWlhbWdidkIwK1dEU0diU0ZZQnVuTTZ2QmJrZWI2VE1DT2ly?=
 =?utf-8?B?Y0R5YzFJNG5WWGdNL3c0cW10Z0E3WHZmNUV6SVVaTzl1OGpCYXFodFNIK09i?=
 =?utf-8?B?K2Z1VFhYQzNDc2M1WklPQk5tOFVBWG1Oc2NNeFcvQ1hGNlBuUEk3T3NFN215?=
 =?utf-8?B?OGV1b1hWOFZFVk9FOHdTK0c1MmxNWlI1N2t0clp6QlhlbzQ1akFPT3UrMjNB?=
 =?utf-8?B?TmdlY09QRkdpTmtJTTJuYW5KSVhtMXVheEtDQVZkZlZxaWRRbXBSbGRvRXZS?=
 =?utf-8?B?VW0yc0NKb25LdmdiSlVjK2k4bXJ5aUFUVU12ZWFORjNQcWhXNzFOK2o5ZFNV?=
 =?utf-8?B?Smc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0JUR1hiQ21PdWh6T1NsbUlXV2FVb3JXTkdmZHJnM1JmaVFIN0JhUGlaZzFT?=
 =?utf-8?B?bHV6SDdzWFltMWlKUG5PUEZpT0NIalpTbGNVa2kxQm81Zi9sNTFsa0prczZU?=
 =?utf-8?B?S3FLK2NEYldkODJhaUUzTnlrR05jNmQ5aDBwYldJaW1FQlk4VkZBM3hXWjBU?=
 =?utf-8?B?ZFhmTGhRYW9WbGxTR2NVWHdiQTFOOEVHeTVjTi94ZzVtNXJzT0JrcEF0QmVC?=
 =?utf-8?B?UVJZZm1pZ3ZIckFRNVFEUDFkNFdBODVKOGVWbkVBczJnNGdTeDFmOGRNbEpJ?=
 =?utf-8?B?T3lqODBRYTkwVEt2UkZDVDRselJDQ3hpc0lIWGNZUmdTVmdyZjZSb20rV0ds?=
 =?utf-8?B?TzZMVVFWZ3VCV09OMDVvTCtqV3oxTkk1UjNnck12Qm8wMXlSbHk5ajBGRGJC?=
 =?utf-8?B?UkFTcXRubzFicmVTWk8za2ozSUxKcXYxRU9vSXJWcEEzbytxekhWenVUclBM?=
 =?utf-8?B?c0dUcnVaeHpoN1FBKzZTKzNQUHNUVlQ3bEVmTlVGQUVLYjhzb3RweS93MjBi?=
 =?utf-8?B?eFBySmV5cGVhaGMxcWYwcEFxK1ZoTXFVb2V6eEd1M3RsclEyekpzcGtvV25n?=
 =?utf-8?B?bE0xRHpZY0ZGemJsU3c5MGRTaUJZT0duZ0N0a0prbWRRSm9KV3BiZldVSHdo?=
 =?utf-8?B?ZmJrd0pHckNJNVVOeFRONExDRENZRmpWNmxxVWk3Q0xoS0dtMTE2QTJYajFE?=
 =?utf-8?B?Qm9YcXgzZFdKZTlUV3FXV3hHVmYrRTFaakR2RWd5QVZNVnZta1RyQ2FtRFBC?=
 =?utf-8?B?cFJmUEhiZk9FMTFDaVlhT25jaXYzUmloakZLQmZaNXRoVDkxVE1TaTJiRk9u?=
 =?utf-8?B?RFlMNlVONnFTaGN5eG5uclNzS0lpWE9EYVVnWC8rckdzMGdNUjFWUCtzZi82?=
 =?utf-8?B?dml3RTJNUnh6UkphenM4bVlVQ2FoQmN4MklyZVo5anNhZUdSTkZLMnRReTNu?=
 =?utf-8?B?MkJOTlYrUVA5UkZVWUVJV1Z6cGErRzltVnBXNXNiL0t6NVI0L3BYQnhxNnRh?=
 =?utf-8?B?dzA3cytjQ2lHcVNCU0dWWldGU2o5UGlmMTZoU2hRLy9UQzRIQ1FlVjc2U3o0?=
 =?utf-8?B?cDB6NWdSSnZZcUtIMEh0VjVoalMyMnFDMjZBeVlNZ0hyNlVqQ1lDTURMbHpM?=
 =?utf-8?B?aVU3OWJGVWVFVmNHNkZjTTFJUDdqbzVheXFxcjJjM0JOS1hRU0FjZEtlN0Mx?=
 =?utf-8?B?aFFDS2VUTW9sQXhMdFRQKzZVNVdvMGJndnhGc3J2dlVLVENTQXg4WkV4TnNx?=
 =?utf-8?B?RGk4djEzQjdldTQ4NjhITVpySk1QZ3R0dFp5L3BJSVpVbUNQY1QweFpwTkNF?=
 =?utf-8?B?MjF2SUhoYTc0NEYxemY3SGhiajhoYnNnb0IxNHhvVzV1SDJVc0lVYWZqY2Js?=
 =?utf-8?B?cVV6Z01OaW51ei9GUG5vUENxK0I1YzhJU0ViQ3YzMlNNYXd1QTI4RWFsMkcx?=
 =?utf-8?B?czJxQ2NNM2o4dUdmY0ZRa1pLUk5HcHp6RzdvR2ZBaFdScy83aGlydHhSMFpx?=
 =?utf-8?B?bHRDMGRsYURwVVRRT01lMVpYUzdxaU9nWnZNa0ZLZDA1KzVsZ0FFWUs4U1pZ?=
 =?utf-8?B?UVZMRGgrQnYvSlNIVDNBdEhTY01QRmNNS3dZbGJyYm5uMFByWXFXSFp6V0N2?=
 =?utf-8?B?anhJaEJ3NnRYVnp5TS80TlR1bXhKOEZHZjh4VGVOR1hrQnZKTDBKZWVVRFZ2?=
 =?utf-8?B?MkcwZ3pLQU5mRmgyaGMzcmpiVTJKSlhpdzJnV0Q1SktSSE1qVzk2OWY0Q3dH?=
 =?utf-8?B?TmxtZCtLcVQwdlpXZXY2ck5DSHIxUmFVdldjSTdqcWs2OHo5MjBFVWhzU3M1?=
 =?utf-8?B?c1E5bDRtLzZaS0dNa1dZcVJkcnF0QXI0RHR2cWFmemtXT1NuSlVQMnEwTFVz?=
 =?utf-8?B?N3BtdEhhSWpEb0lWaDZWa3JwaEQxOUpwc3A5dmIxaVZuMldZdThCc1JDZS9Z?=
 =?utf-8?B?WUhDMXVGU3VYa3NGNTJKd0pmenZoWE9OcEZEdCtvTi9ydnkyMFlOUVdSUmhl?=
 =?utf-8?B?MDdxMlZhdkpsTVM5OTZHbmRzSnpUQmlTamZPWGxSaXhtS3JJRnlrZ3NaSFJR?=
 =?utf-8?B?bXE0SU0wZ3QvSDBiVS9kdDd2d0RuZmxWd1Fka3FtOUI3b3lYaUxxUys4a3Jn?=
 =?utf-8?B?REN5eWRVNUNXUkZERFp3VkhXRlQxcEpaUGR4eHNWMnJmb2hkUHM0MHMxNTc4?=
 =?utf-8?B?R1d0YlR6RDlWT0tqeXR2cTViYVVXL0ZnUk5wK0hHdEowaWRxM1lLMXQ2bzdt?=
 =?utf-8?B?a3IyNTBWM01mOVNyZE44bnp3THdXTEVrNkNBU2gvazEzcytMQnorZlErQVdR?=
 =?utf-8?B?R04rMXNMMWx3Rk9Kc1VPNnk2enBuSVRPc1E3NlN3QkJCenUzcHl6am1ibkVn?=
 =?utf-8?Q?kO9RlBLMakpQPraH73Je+CArMI/100okmDE8x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5bdaa4-4edb-4d60-5023-08de581b6750
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:59:45.5636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4t2H3oyBjbcolBLZ7Ha1BN5JQmfNtLwBY0ckWO3Up+YPlVlMqaZq9rODCg7JSXXs3SXy7ACUMb+4/3FlxS3fPepFlrMPbS+NCsqb6vWGfIcu98bjWJquNMv5gQ3U/mM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-Spamd-Result: default: False [3.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30788-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 13135512B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Add basic GPIO functionality (request, free, get, set) for the existing
pinctrl SIUL2 driver since the hardware for pinctrl&GPIO is tightly
coupled.

Also, remove pinmux_ops which are no longer needed.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 413 +++++++++++++++++++++++-----
 1 file changed, 350 insertions(+), 63 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 50d5a01107eb..3e0c48068f08 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -40,6 +40,14 @@
 #define S32_MSCR_ODE		BIT(20)
 #define S32_MSCR_OBE		BIT(21)
 
+/* PGPDOs are 16bit registers that come in big endian
+ * order if they are grouped in pairs of two.
+ *
+ * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
+ */
+#define S32_PGPD(N)		(((N) ^ 1) * 2)
+#define S32_PGPD_SIZE		16
+
 enum s32_write_type {
 	S32_PINCONF_UPDATE_ONLY,
 	S32_PINCONF_OVERWRITE,
@@ -97,6 +105,7 @@ struct s32_pinctrl_context {
  * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
+ * @gc: a pointer to the gpio_chip
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
  * @gpio_configs: saved configurations for GPIO pins
@@ -108,6 +117,7 @@ struct s32_pinctrl_context {
 struct s32_pinctrl {
 	struct device *dev;
 	struct pinctrl_dev *pctl;
+	struct gpio_chip gc;
 	struct s32_pinctrl_mem_region *regions;
 	struct s32_pinctrl_soc_info *info;
 	struct list_head gpio_configs;
@@ -396,67 +406,6 @@ static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
-				       struct pinctrl_gpio_range *range,
-				       unsigned int offset)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin;
-	unsigned int config;
-	unsigned long flags;
-	int ret;
-
-	ret = s32_regmap_read(pctldev, offset, &config);
-	if (ret)
-		return ret;
-
-	/* Save current configuration */
-	gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
-	if (!gpio_pin)
-		return -ENOMEM;
-
-	gpio_pin->pin_id = offset;
-	gpio_pin->config = config;
-	INIT_LIST_HEAD(&gpio_pin->list);
-
-	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-	list_add(&gpio_pin->list, &ipctl->gpio_configs);
-	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
-
-	/* GPIO pin means SSS = 0 */
-	config &= ~S32_MSCR_SSS_MASK;
-
-	return s32_regmap_write(pctldev, offset, config);
-}
-
-static void s32_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
-				      struct pinctrl_gpio_range *range,
-				      unsigned int offset)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin, *tmp;
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-
-	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
-		if (gpio_pin->pin_id == offset) {
-			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
-						 gpio_pin->config);
-			if (ret != 0)
-				goto unlock;
-
-			list_del(&gpio_pin->list);
-			kfree(gpio_pin);
-			break;
-		}
-	}
-
-unlock:
-	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
-}
-
 static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 				      struct pinctrl_gpio_range *range,
 				      unsigned int offset,
@@ -480,8 +429,6 @@ static const struct pinmux_ops s32_pmx_ops = {
 	.get_function_name = s32_pmx_get_func_name,
 	.get_function_groups = s32_pmx_get_groups,
 	.set_mux = s32_pmx_set,
-	.gpio_request_enable = s32_pmx_gpio_request_enable,
-	.gpio_disable_free = s32_pmx_gpio_disable_free,
 	.gpio_set_direction = s32_pmx_gpio_set_direction,
 };
 
@@ -700,6 +647,307 @@ static const struct pinconf_ops s32_pinconf_ops = {
 	.pin_config_group_dbg_show = s32_pinconf_group_dbg_show,
 };
 
+static struct s32_pinctrl *to_s32_pinctrl(struct gpio_chip *chip)
+{
+	return container_of(chip, struct s32_pinctrl, gc);
+}
+
+static struct regmap *s32_gpio_get_pgpd_regmap(struct gpio_chip *chip,
+					       unsigned int pin,
+					       bool output)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	struct nxp_siul2_mfd *mfd;
+	u32 base, num;
+	int i;
+
+	mfd = dev_get_drvdata(ipctl->dev->parent);
+
+	for (i = 0; i < mfd->num_siul2; i++) {
+		base = mfd->siul2[i].gpio_base;
+		num = mfd->siul2[i].gpio_num;
+
+		if (pin >= base && pin < base + num)
+			return output ? mfd->siul2[i].regmaps[SIUL2_PGPDO] :
+					mfd->siul2[i].regmaps[SIUL2_PGPDI];
+	}
+
+	return NULL;
+}
+
+static int s32_gpio_request(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(gc);
+	struct pinctrl_dev *pctldev = ipctl->pctl;
+	struct gpio_pin_config *gpio_pin;
+	unsigned int config;
+	int ret;
+
+	ret = s32_regmap_read(pctldev, gpio, &config);
+	if (ret)
+		return ret;
+
+	/* Save current configuration */
+	gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
+	if (!gpio_pin)
+		return -ENOMEM;
+
+	gpio_pin->pin_id = gpio;
+	gpio_pin->config = config;
+
+	scoped_guard(spinlock_irqsave, &ipctl->gpio_configs_lock)
+		list_add(&gpio_pin->list, &ipctl->gpio_configs);
+
+	/* GPIO pin means SSS = 0 */
+	config &= ~S32_MSCR_SSS_MASK;
+
+	return s32_regmap_write(pctldev, gpio, config);
+}
+
+static void s32_gpio_free(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(gc);
+	struct pinctrl_dev *pctldev = ipctl->pctl;
+	struct gpio_pin_config *gpio_pin, *tmp;
+	int ret;
+
+	guard(spinlock_irqsave)(&ipctl->gpio_configs_lock);
+
+	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
+		if (gpio_pin->pin_id == gpio) {
+			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
+					       gpio_pin->config);
+			if (ret != 0)
+				return;
+
+			list_del(&gpio_pin->list);
+			kfree(gpio_pin);
+			return;
+		}
+	}
+}
+
+static int s32_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	unsigned int reg_value;
+	int ret;
+
+	ret = s32_regmap_read(ipctl->pctl, gpio, &reg_value);
+	if (ret)
+		return ret;
+
+	if (!(reg_value & S32_MSCR_IBE))
+		return -EINVAL;
+
+	return reg_value & S32_MSCR_OBE ? GPIO_LINE_DIRECTION_OUT :
+					  GPIO_LINE_DIRECTION_IN;
+}
+
+static unsigned int s32_pin2pad(unsigned int pin)
+{
+	return pin / S32_PGPD_SIZE;
+}
+
+static u16 s32_pin2mask(unsigned int pin)
+{
+	/**
+	 * From Reference manual :
+	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
+	 */
+	return BIT(S32_PGPD_SIZE - 1 - pin % S32_PGPD_SIZE);
+}
+
+static struct regmap *s32_gpio_get_regmap_offset_mask(struct gpio_chip *chip,
+						      unsigned int gpio,
+						      unsigned int *reg_offset,
+						      u16 *mask,
+						      bool output)
+{
+	struct regmap *regmap;
+	unsigned int pad;
+
+	regmap = s32_gpio_get_pgpd_regmap(chip, gpio, output);
+	if (!regmap)
+		return NULL;
+
+	*mask = s32_pin2mask(gpio);
+	pad = s32_pin2pad(gpio);
+
+	*reg_offset = S32_PGPD(pad);
+
+	return regmap;
+}
+
+static int s32_gpio_set_val(struct gpio_chip *chip, unsigned int gpio,
+			     int value)
+{
+	unsigned int reg_offset;
+	struct regmap *regmap;
+	u16 mask;
+	int ret;
+
+	regmap = s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
+						 &mask, true);
+	if (!regmap)
+		return -ENODEV;
+
+	value = value ? mask : 0;
+
+	ret = regmap_update_bits(regmap, reg_offset, mask, value);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int s32_gpio_set(struct gpio_chip *chip, unsigned int gpio,
+			 int value)
+{
+	if (s32_gpio_get_dir(chip, gpio) != GPIO_LINE_DIRECTION_OUT)
+		return -EPERM;
+
+	return s32_gpio_set_val(chip, gpio, value);
+}
+
+static int s32_gpio_get(struct gpio_chip *chip, unsigned int gpio)
+{
+	unsigned int reg_offset, value;
+	struct regmap *regmap;
+	u16 mask;
+	int ret;
+
+	if (s32_gpio_get_dir(chip, gpio) != GPIO_LINE_DIRECTION_IN)
+		return -EINVAL;
+
+	regmap = s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
+						 &mask, false);
+	if (!regmap)
+		return -EINVAL;
+
+	ret = regmap_read(regmap, reg_offset, &value);
+	if (ret)
+		return ret;
+
+	return !!(value & mask);
+}
+
+static int s32_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
+			    int val)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+
+	s32_gpio_set_val(chip, gpio, val);
+
+	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, false);
+}
+
+static int s32_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+
+	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, true);
+}
+
+static bool s32_gpio_is_valid(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	const struct s32_pinctrl_soc_data *soc_data;
+	const struct pinctrl_pin_desc *pins;
+	int i;
+
+	soc_data = ipctl->info->soc_data;
+	pins = ipctl->info->soc_data->pins;
+	for (i = 0; i < soc_data->npins && pins[i].number <= gpio; i++)
+		if (pins[i].number == gpio)
+			return true;
+
+	return false;
+}
+
+static int s32_init_valid_mask(struct gpio_chip *chip, unsigned long *mask,
+			       unsigned int ngpios)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	const struct s32_pinctrl_soc_data *soc_data;
+	const struct pinctrl_pin_desc *pins;
+	int i;
+
+	bitmap_zero(mask, ngpios);
+
+	soc_data = ipctl->info->soc_data;
+	pins = soc_data->pins;
+	for (i = 0; i < soc_data->npins && pins[i].number < ngpios; i++)
+		bitmap_set(mask, pins[i].number, 1);
+
+	return 0;
+}
+
+static int s32_gpio_gen_names(struct device *dev, struct gpio_chip *gc,
+			      unsigned int cnt, char **names, char *ch_index,
+			      unsigned int *num_index)
+{
+	unsigned int i;
+
+	for (i = 0; i < cnt; i++) {
+		if (i != 0 && !(*num_index % 16))
+			(*ch_index)++;
+
+		if (!s32_gpio_is_valid(gc, *num_index))
+			continue;
+
+		names[i] = devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
+					  *ch_index, 0xFU & (*num_index)++);
+		if (!names[i])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int s32_gpio_populate_names(struct device *dev,
+				   struct s32_pinctrl *ipctl)
+{
+	struct nxp_siul2_mfd *mfd = dev_get_drvdata(ipctl->dev->parent);
+	unsigned int num_index = 0;
+	char ch_index = 'A';
+	char **names;
+	int i, ret;
+
+	names = devm_kcalloc(dev, ipctl->gc.ngpio, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < mfd->num_siul2; i++) {
+		/*
+		 * Pin names' have the following naming: P${letter}_${index},
+		 * where:
+		 * - letters are from: {A, B, C, ...}
+		 * - indexes from {0, 1, 2, ... 15}
+		 *
+		 * If the pin is a multiple of 16, its index needs to be 0.
+		 */
+		if (mfd->siul2[i].gpio_base % 16 == 0)
+			num_index = 0;
+
+		ret = s32_gpio_gen_names(dev, &ipctl->gc,
+					 mfd->siul2[i].gpio_num,
+					 names + mfd->siul2[i].gpio_base,
+					 &ch_index, &num_index);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Error setting SIUL2_%d names\n",
+					     i);
+
+		ch_index++;
+	}
+
+	ipctl->gc.names = (const char *const *)names;
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static bool s32_pinctrl_should_save(struct s32_pinctrl *ipctl,
 				    unsigned int pin)
@@ -986,6 +1234,8 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	struct pinctrl_desc *s32_pinctrl_desc;
 	struct s32_pinctrl_soc_info *info;
 	struct s32_pinctrl *ipctl;
+	struct nxp_siul2_mfd *mfd;
+	struct gpio_chip *gc;
 	int ret;
 
 	if (!soc_data || !soc_data->pins || !soc_data->npins)
@@ -1068,5 +1318,42 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 
 	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
 
+
+	/* Legacy bindings only cover pinctrl functionality. */
+	if (soc_data->legacy)
+		return 0;
+
+	mfd = dev_get_drvdata(pdev->dev.parent);
+	if (!mfd)
+		return dev_err_probe(&pdev->dev, -EINVAL, "Invalid parent!\n");
+
+	gc = &ipctl->gc;
+	gc->parent = &pdev->dev;
+	gc->label = dev_name(&pdev->dev);
+	gc->base = -1;
+	/* In some cases, there is a gap between the SIUL GPIOs. */
+	gc->ngpio = mfd->siul2[mfd->num_siul2 - 1].gpio_base +
+		    mfd->siul2[mfd->num_siul2 - 1].gpio_num;
+	ret = s32_gpio_populate_names(&pdev->dev, ipctl);
+	if (ret)
+		return ret;
+
+	gc->set = s32_gpio_set;
+	gc->get = s32_gpio_get;
+	gc->set_config = gpiochip_generic_config;
+	gc->request = s32_gpio_request;
+	gc->free = s32_gpio_free;
+	gc->direction_output = s32_gpio_dir_out;
+	gc->direction_input = s32_gpio_dir_in;
+	gc->get_direction = s32_gpio_get_dir;
+	gc->init_valid_mask = s32_init_valid_mask;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, ipctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Unable to add gpiochip\n");
+
+	dev_info(&pdev->dev, "Initialized s32 GPIO functionality\n");
+
 	return 0;
 }
-- 
2.50.1


