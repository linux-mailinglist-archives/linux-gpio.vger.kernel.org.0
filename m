Return-Path: <linux-gpio+bounces-32166-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2I7WCHfGnmkuXQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32166-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 10:52:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 114A219558A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 10:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BBCB8308D4D0
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 09:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3F738E5E2;
	Wed, 25 Feb 2026 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YN/RkaKy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D252FF14D;
	Wed, 25 Feb 2026 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772012419; cv=fail; b=QHklrjCdI9joM5EUXqNhxZ+/NlTaJV//FJ71qRUS+4gNq7YjucWxCeUdUiwECKsEawMdHQtc98iihDKy4wcs4E/Qz65xUC2fdCpurNis8OpAgSwofhzu2853ASCSej2p3RqgRDI4EV/cIh/cTry/nn4UwEJwWxABvOa/yDOgB9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772012419; c=relaxed/simple;
	bh=yF1JgcE36niRDGYD9qFE2Mql8fxJgldacT6AR4NDE3s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XGVoy4LircYyBdyW4nCHN4Dc+G1/T3M/z9j8pDFBJ1vHHIxtiai3T5iTBSYPl40ysiQ+tJyu10k4Zx22HsPjlCVmRNb89LW6Nl+P/6vDvpaOb8+Hqx29+yxdqY0cmi9XteXjDtRUCxYgL2ZAtwobwcCeWJjCPLQXwcxqGK4ZrJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YN/RkaKy; arc=fail smtp.client-ip=40.107.159.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8xVrbAO73w21HWY+sWLCT783B6gEC9b8oOO3grDr0lrmKkyvHhVa5i1/kbR6GMRhTuGWlc8p1Aomsdf2x4TMZA+DJPTSdEaw8LDvz1/4uU9xLdSuDKYpIY6bEZWgqRPtHCGBDZpfST9H6GF5WqjFEGbxY/hKXPsfZhMiumFl2jpvXsBv8ctQkOqQsfVyCCW3LZafQfUb7I8uc4HnkRJZAHKN1dgaipRc5RLzf2R+AjN0j89CNqzc4qWwT5pEThLjGUy7c1xKKCzzHEfXUm8mu6Kw41QmJRiTJE3n2oLMrKqwvgHeO6gxUDHZ+XCyGPoiQ/LpPjkeN+meKZIuakDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2rk2l7t14KvPKdFRhFYHzwXaLpMw7sCbKYq1webyLg=;
 b=hmPJDHBlmEEkepgbRZ9XehEHtklb3rJylk7BFzyZcwKaPA4aTBV8O+3T2LXGTB+f4Z4C8pfnAPcQokdQ59+I2VJp0BrusBsO90ljzYrZS2FtBZWRMj9SPY8g1/bQKrqUDf7VnOVJvXIdGXZM17ZTo0ZBifZa7XTBm5DG5d4Dyqa/UYK3d9NTkLCLU2+d66Nw/KMt7XkUsqQIvk0LL6jZ/JND45stkYHN0aOg3+E+A9JzJjRHRv36xDjSTHxAL/rfamURFNBfiqlVzBoHi9W9AIz83bmb3SiQx46IN6rlF8axTnzzP8vZScdvw+QBN0HisyvOWkrFR2ixjKquBBUBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2rk2l7t14KvPKdFRhFYHzwXaLpMw7sCbKYq1webyLg=;
 b=YN/RkaKy/VmVOtB/hvLjkph02N5Eqlc6lk9jGRgJTbabX+t/o4TocSlosrNi9PTIC+BhRvAyxppOpZavOvjw3rZWLd95W9CiBrw6gUt2oTuLAmwnFbvJRrigVJcL4rLl8BENwZiKr8Euo8FzQ3IRCE4/f9jKyOlkL8ycijRg0P+8qdhgRcO63FH+mzmgV0AumWqVgkg2FeoL0BzCgDMvrU1J9NXUQV6tQuK2dQatqL2VUC3RQVLr9FqkTqcQ0ChpbRc2sjCoUYZlM7lclh4Ps119Sp217YBZdziMb6jbyK40rrdd3ik10qqjNLZ/9CE1h10OByG8deJvS+U4XndFPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV4PR04MB11308.eurprd04.prod.outlook.com
 (2603:10a6:150:297::19) by DB9PR04MB10066.eurprd04.prod.outlook.com
 (2603:10a6:10:4c1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 09:40:13 +0000
Received: from GV4PR04MB11308.eurprd04.prod.outlook.com
 ([fe80::b043:b2d1:9a94:1891]) by GV4PR04MB11308.eurprd04.prod.outlook.com
 ([fe80::b043:b2d1:9a94:1891%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 09:40:12 +0000
Message-ID: <ba6140bf-237e-4099-af0c-ee404c1719cd@oss.nxp.com>
Date: Wed, 25 Feb 2026 11:40:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "Vincent Guittot devicetree @ vger . kernel . org"
 <vincent.guittot@linaro.org>, Rob Herring <robh@kernel.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
 <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
 <7d200097-51bc-4404-be8b-f536d0ecfc25@oss.nxp.com>
 <21531cdd-5ab9-493e-a722-61b98117e2c4@kernel.org>
 <22a5a072-847e-4cfd-8abd-e37163f73265@oss.nxp.com>
 <fe755e85-1558-4272-bdd4-af7a2038ab1f@kernel.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <fe755e85-1558-4272-bdd4-af7a2038ab1f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::9) To GV4PR04MB11308.eurprd04.prod.outlook.com
 (2603:10a6:150:297::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV4PR04MB11308:EE_|DB9PR04MB10066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1caefe0f-db76-4b01-f75b-08de7451df6d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
	4r4VgIO2roHTRnb4Q5jYA+tdKTrHeLeknblaJDj+XQfthDCw8DJYDDnbTuHwZfA2p9T+9ov33EmEeyybpjKUqvuj29HGDdrTwS7uQowsJCwk90Pyl+1lwnuLvmabkyogDCa2/Bk87yiHKGwdPO+o+6hh6+5Q5yW/N7ptlTQFnZkVExUNoHtl2Vhq0YNg321YObXEvzb1hLx2G6FfrpMWTPlqTPD24p/LIEzTKN/nLB/juY6IIBDhSYUkfGmYlsga7wtlQkZ+K0fbcFOfiJBoWdvVxpm8LrLVXCCdF959ZTeGzqbQFWlC7P+dseAYTgIeu/H83rIOAx6y7Y3Pb4ti79j51J6fMd6teqO14hTnIitfaF94Bcbldsvoy1ZqgluF49aqPxaQ0POWmTar9o4HTyXss9W3Wk9NlfHrNNaYrEOeulAd+ntwX9BIKSgreud/J+SpV5p5qZ7EF7+tWSmQ/YuXB5e8ZLcxe6BK/l2A7R+Q4U0YFAeJjI0JT6aAufvUhXqmU6oL+0FjslEvvN/QiAwWjiUqcmv58meR4G/ETM1RTZrxr1juEjQCjbjqgcETdF5+I9wKJQ7iSmaWWrVm7A6Hhtr08yP0vIT+IEuJm969evkuYBnkowlrXW4NdeeZ2FyfuRcFL4dacv40GKOTWjU4g6rKIO6DH0rayypbWX2o4uejbeBz7nVNPUkxekjU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV4PR04MB11308.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDZuUERGMkpheTFNRXB6TTNweGo1dXdrT1VSMTRhZ3BBNXQ4SUpHdDdlMVNJ?=
 =?utf-8?B?K3FxVUZudTRWUlgxNEUzSHdsSUpVY0VKMlptakNrKzhnR1Vadk02VGkwVVVy?=
 =?utf-8?B?MDNxWStrN05kdHJpcExJWFljMTNHakpkbFBIdXBpUUZQeFhmRmJvY2RlSmFi?=
 =?utf-8?B?VzI2Tlo5eCs3MkpjRlFySU0vVmJzdGhaUjk2Q0FtVzVTUU5pbnBZTy9ka0VT?=
 =?utf-8?B?d3F2N1Y0WFV1L3pQVjVMUTNQaGhSSlBoYWZnZmtVNXJlcGRkOUhQUWIyRW1W?=
 =?utf-8?B?c1QzZEMvRllsemhRSkR1L2g1azFFWHZZSlcrbDRhKzk1RThjbjluTmdnTVpt?=
 =?utf-8?B?TTI0MnJrU1hsSURDVjkyNmEvK21LdHR4UlpZYldidWttR2xqZ2Z4SVdjTm5Y?=
 =?utf-8?B?dkpOcG8zc1p0Vy9nTzJ2YklENGlxc2VEd2lkS0VsME1rWWZ6bzR2S0R6T0JJ?=
 =?utf-8?B?dEVMMHgwdVNwS0lQb3RTaWl2Ymt2ODdSeGROSGtxei91VXV3dG1WV05Ody9Y?=
 =?utf-8?B?WVdMMmNlUS9hdzVNR2JNYytuOHFRVXVsSWRwRDFoaXlkaWNtMmNjNE11cGkv?=
 =?utf-8?B?dmpCdytvS1FtbWx2aVZqTDI4ZDV5TXN6elZ4blMrOG9rd1h0cnFhUE95STVj?=
 =?utf-8?B?bncvS1ErWjc1cHRmRVlWdzQwakxscXdGZldaaGRPQm5Ud212S1UwMVN4SGFy?=
 =?utf-8?B?UUtyUGRJUG9XYkpuVkgrd1JHRy9IVnpoakNZbWtHOFNzQXEzRUtlNEluNjUy?=
 =?utf-8?B?MXU4VVZOdDR2RXlseGRGUTYyRGNiZW1GRkYvZFhHNTJ6bkJxZGVUQnFUVGxE?=
 =?utf-8?B?bjkwSWZoSVE5b2ZhSzh4V2hOV2U1WUpXc1BCUWorUWswWkh6K1YvaVV5TEw1?=
 =?utf-8?B?TUxzNEhkY240MTR5TVhsd3k2TGtSVVA3L3R1cVlpcE8wRndrbjNuSzdmd1BM?=
 =?utf-8?B?UVg4RC9majhKNmNvTzZxYW9PS1RESFgrUy9TTzVnNWROUDhhbFVCL2lXQXdo?=
 =?utf-8?B?dC94dlJKTzRMRGljbHJxYWJZZUthTGE3R09uZmlYQmpWOW1sWk02VkIwUVow?=
 =?utf-8?B?UUJqbHZ1aWhpS25PbEh4Yis5bU1nTVV6NmM5VGJXR2cxVmEyL0dMdnBRQVVY?=
 =?utf-8?B?T0VGWW1xdTZ5dGRJbE1XSVd5WURKMjVoQjBCamh3ZTQySnpwdU9UTys5U2li?=
 =?utf-8?B?L1VsUHlFSHZ1N2lFYlpPMEdCQU1vcjBieUM5bEZuTDJQamFLMzdaMGlNd29S?=
 =?utf-8?B?VlFaU2ZlZHBYa2ZDM3orelUvZjdZTnBaRXRRNzdCZ09kSWVUamxYODhmSENH?=
 =?utf-8?B?WDk5dkRjTnFycjJFdFpPOTBwSmViZ0NDd0hmaXhmVnBIWjlsdjczbHdkeVg2?=
 =?utf-8?B?bEtFRSthY0RzZ1J4SmZNUVdyMmJzRDV3bWpVWlpLZytta2hTR2tKVXZ3Y1Vj?=
 =?utf-8?B?TzdwL2V5eSs0SzVpbjI5bkJadUhKN2xBSjZpNlFtUTl1Rk4zY3Bqa3J4bzVp?=
 =?utf-8?B?ejM4d3gvZnRsWEl6VWlPODBOSDFZZXM3Y3UxT0p6TWQ1Tld3UWQrdmhQazhE?=
 =?utf-8?B?b21NTExpU09mQXJId25WL2R1czFZRTF6dnBVK3NSZUZHM29XWVkrSEVtbWVO?=
 =?utf-8?B?YU53dFY4VUtpekFQL2dpaGZ4NTZtTkE0bmRZbUZqSjJjNmMxclZRL0lqUWZ3?=
 =?utf-8?B?VVVQay9kWUp2aGhXVW4wMkcxSkg5OXVERk9zSysrUGlLRkNVUXZaUVBWcVlV?=
 =?utf-8?B?Y2ZJUmcvdW5wSVY2MU41c2tDempGa1IvNjFIMFVDOG9ZWU0xUTlzeWoxSmRr?=
 =?utf-8?B?NEpUeGV0U29iRXV1ZkxCQ3c1YzZJOEg3RHJ5Z0ZJc1Y5WjZUTXpkbFBkZSt4?=
 =?utf-8?B?OExQSW1FTzk2dU5RdTIrcUZuR2tQbjJFUnJ5bDMwYkN0Qk9KOWpYTFB4VDIv?=
 =?utf-8?B?a3VmQ2JmMFpPMnpnd1FncmhRclI3TDNDdnBNQnpvemRoeEFuVnFrNUdSMXNC?=
 =?utf-8?B?Mk5EZ1ZldjVuZDdkaFc0RXhIUFpOZ20vdFMvenh1U2JvUjlnUnY4VVo1a2o3?=
 =?utf-8?B?QWgyRUxINjFhelgxS202d3pGSDZkWDFpSktJUS9pMDA3emNsTGVON3BaUzBh?=
 =?utf-8?B?aXdKdmZ3N3JhSnRZbjZncCtxcVNGNW9VSVBmQmpzMm04dXRFMHJZOHY2aXpV?=
 =?utf-8?B?WTQxcmlBYUZxMGxvMUJ2WTN3L2hsbU9RZUJJendhNzVId3ovcVlObDQ1NXhP?=
 =?utf-8?B?Y256azFTRzhpVjJlcmpRR0w3eEdzTUZkOGZVV0xyWmZGekRvaXlxU0QzVXFy?=
 =?utf-8?B?YWlVZFZYUG9uVjZmMXBQakc0akpzV2xsZ3UvKzZOckpvRFJBRkhBS0x2YXFk?=
 =?utf-8?Q?XcSIn/9zYWks2/AM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1caefe0f-db76-4b01-f75b-08de7451df6d
X-MS-Exchange-CrossTenant-AuthSource: GV4PR04MB11308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:40:12.5193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pm/EOAS2idXkhsIPEfLzGxUWrl1eADmNqZF28iC4m0t1WONUAdMWAh9L6FnHWNM/eUtTSum9wfKxX9vl/VDGYr4qpwXoFsc1lodoTUxRfUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32166-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ghennadi.procopciuc@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.920];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 114A219558A
X-Rspamd-Action: no action

On 2/23/2026 3:14 PM, Krzysztof Kozlowski wrote:
> On 23/02/2026 12:51, Khristine Andreea Barbulescu wrote:
>> On 2/20/2026 4:41 PM, Krzysztof Kozlowski wrote:
>>> On 20/02/2026 15:36, Khristine Andreea Barbulescu wrote:
>>>> Hello Krzysztof,
>>>>
>>>> On 2/20/2026 12:16 PM, Krzysztof Kozlowski wrote:
>>>>> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>
>>>>> On 19/02/2026 12:36, Khristine Andreea Barbulescu wrote:
>>>>>>>
>>>>>>>> +      reg:
>>>>>>>> +        maxItems: 1
>>>>>>>
>>>>>>> You have 'reg' so the node name should have unit-address.
>>>>>>>
>>>>>>> However, there's not any real DT resources in this child node, so you
>>>>>>> should just drop it.
>>>>>>>
>>>>>>
>>>>>> For context, SIUL2 exposes a set of platform‑capability and SoC identification registers that are split across the two discontiguous ranges: SIUL2-0 and SIUL2-1. These registers are the source of SoC information (e.g. identification and capability flags) that other subsystems are expected to consume (e.g. PCI Express). Because those fields are physically divided between the two SIUL2 ranges, consumers need reliable access to both ranges to correctly discover and configure the platform.
>>>>>>
>>>>>> Hence, my proposal is to keep the two 'syscon' child nodes.
>>>>>
>>>>> Please wrap your replies correctly, so this will be easily parseable.
>>>>>
>>>>> I do not understand the reasoning. If you have two register ranges, you
>>>>> have two <reg> entries and having a child node has nothing to do with it.
>>>>>
>>>>
>>>> I’ve reorganized the SIUL2 node with two syscon subnodes for the two
>>>> register regions used to read system info, and a separate
>>>> pinctrl/GPIO child (as discussed in the v8 06/10 thread [0]). The parent
>>>> SIUL2 node now carries the bus addressing and ranges:
>>>
>>> That's not the answer to the comment. Read again:
>>>
>>> 1. Reviewer: No resources, so no separate node.
>>> 2. Your answer: some soc capability and two address spaces
>>> 3. Reviewer: Does not matter, address spaces can go again to original place
>>> 4. Irrelevant reply.
>>>
>>> So again, read the first comment - do you have dedicated resources in
>>> children?
>>>
>>>>  
>>>>     siul2: siul2@4009c000 {
>>>>         compatible = "nxp,s32g3-siul2", "nxp,s32g2-siul2";
>>>>         #address-cells = <1>;
>>>>         #size-cells = <1>;
>>>>         ranges = <0x4009c000 0x4009c000 0x179c>,
>>>> 		 <0x44010000 0x44010000 0x17b0>;
>>>>  
>>>>         siul20: siul20@4009c000 {
>>>>             compatible = "nxp,s32g-siul2-syscfg", "syscon";
>>>>             reg = <0x4009c000 0x179c>;
>>>
>>> 0x179c is odd size. Looks fake.
>>>
>>>
>>>>         };
>>>>  
>>>>         siul21: siul21@44010000 {
>>>>             compatible = "nxp,s32g-siul2-syscfg", "syscon";
>>>
>>> And two same devices with same compatible proof it.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> We don’t have dedicated resources for children. In particular,
> 
> Then previous comments/review stay.
> 
>> there are no resources allocated specifically for nodes like
>> "nxp,s32g-siul2-syscfg". Their consumers are the pinctrl/gpio
>> driver and other drivers that read SoC‑specific information from
>> those shared registers.
>>  
>> My alternative is to keep two separate syscon providers for the
> 
> You got review already.
> 
> Best regards,
> Krzysztof

Hi Krzysztof & Arnd,

I still believe that nvmem is a suitable and accurate mechanism for
describing SoC‑specific identification information, as originally
proposed in [0], assuming the necessary adjustments are made.

More specifically, instead of modeling software-defined cells, the nvmem
layout would describe the actual hardware registers backing this
information. One advantage of this approach is that consumer nodes (for
example PCIe, Ethernet, or other IPs that need SoC identification data)
can reference these registers using the standard nvmem-cells /
nvmem-cell-names mechanism, without introducing custom, per-subsystem
bindings.

Looking at the nvmem binding documentation [1], it appears that
individual fields of identification registers (similar to MIDR) could,
in principle, be exposed using a bits property, for example:

family_letter@4009c004 {
  reg = <0x4009c004 0x4>;
  bits = <31 26>;
};

That said, an alternative (and arguably more common) approach is to
expose entire registers as fixed-layout cells, and let consumers decode
bitfields in software. Below is an example of how this would look when
embedded in the existing SIUL2 node, without relying on per-field bits
properties:

siul2: pinctrl@4009c000 {
  compatible = "nxp,s32g2-siul2";
  reg = <0x4009c000 0x2000>,
	<0x44010000 0x2000>;
  #address-cells = <1>;
  #size-cells = <1>;
  ranges = <0x4009c000 0x4009c000 0xc>,
	   <0x44010000 0x44010000 0xc>;
  reg-names = "siul20", "siul21";
  gpio-controller;
  #gpio-cells = <2>;
  gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
  interrupt-controller;
  #interrupt-cells = <2>;
  interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;

  jtag-pins {
	jtag-grp0 {
	  pinmux = <0x0>;
	  input-enable;
	  bias-pull-up;
	  slew-rate = <166>;
	};
  };

  nvmem-layout {
	compatible = "fixed-layout";
	#address-cells = <1>;
	#size-cells = <1>;

	siul20_midr0@4009c004 {
	  reg = <0x4009c004 0x4>;
	};

	siul20_midr1@4009c008 {
	  reg = <0x4009c008 0x4>;
	};

	siul21_midr0@44010004 {
	  reg = <0x44010004 0x4>;
	};

	siul21_midr1@44010008 {
	  reg = <0x44010008 0x4>;
	};
  };
};


[0]
https://lore.kernel.org/all/20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com/
[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/nvmem/nvmem.yaml#n82

-- 
Regards,
Ghennadi

