Return-Path: <linux-gpio+bounces-32193-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFstIwSMn2nYcgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32193-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:55:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DADF019F2C3
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE43A304565B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 23:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3422387364;
	Wed, 25 Feb 2026 23:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n5Vjs3ay"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F173859E9;
	Wed, 25 Feb 2026 23:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063722; cv=fail; b=GMvNICo/+nmMvHPCySpZHTCDaDXFpcwk7ezXgdUml8nUlMEV0Me5sWJUQV+rT9/zC18qmZaG2bznRGsdP4xxHjkBT5hgTUbHQdepinSqgquLnwu2No0WtSv5/7uoLvcZke8SsGjfbJH9k6IBi8pcK4RhQelVboZ+vjpSdIXer+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063722; c=relaxed/simple;
	bh=VR87HbuZL75C8pD3gZf5avwhDW6o9pp8eG1fppmoNmE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JudnWrWH84Kf0wcloOePYJph2gcb3APst92apvK+6UFik3BLCii6oLY8CFAVd0nE2l3t/DIamlciPdxhLoJs+2etccpjA7UinW8lPebkKDjSmuMjAklTzX97Cy+jYD/E1g4sgD6KRUZEo20KT0e1vfiU9wsktNmSx31zihTTR8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n5Vjs3ay; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/Stx3+lzdtUgZ3SsWvInxxl8tTlN2Ux60oYcIqOJhBhw12xLBm7zE3Kr/lrN6PwXBvk8bNk+C8EHFTjcqkw1ZtEaNHhny57ZLdjDol3SnPX51xudk8DZTSzGJRLY/eQOlmjsOeitzLM/9WjxkueLoo3YdInqM5NN/qbpHQUIGoLPRgE4xCwXmtH6utwY2aFgFNvltmr5EKOuU4mFhCE0XbJGvHl/WygNUWeDjn8taAobLwF41UFwTCotEI3TqWKsOK74jrjEwiNtc8dJvIrKQEfjLmbkkAL1okk0iUswTl88aiGPTK/U/cLd3++NcNCKUsjPVsFQOeEJI9grnELPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0sdwGUTTKKqpinwFep+q0F9vtbeo/zP8nEEcCYnVhE=;
 b=A6tE1PWfD7MvKi04VmF2e8szLTr4tBSNMlIXk0CbQSS27BHHAR+/yIrq2jjtpD39ZvhQ2S0xX6q4yb5Z71fbalqOG1Ew/2nyMXdpnQ53urH0TVFThSuoBu7F85ClIv88UGZHAv4UP83Z1h4Ezwmv3weJeNyIKZtEg4iVjQeIurKw+CqVFiKbCzKGpmgGkuktBUhH2baXyE4T8hQ/lpKScgM53bM0+Af7IYWKSUJPZeqioQXD9R2chaWDiqQs2Yo48eY78AmzZ99WGRmFGtRW/7AW+EZQdhCmkCzPmbDtHs+ln30Dwu+3Zfy7/Al53AkJX3BmRimoDjPpfCHRVng3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0sdwGUTTKKqpinwFep+q0F9vtbeo/zP8nEEcCYnVhE=;
 b=n5Vjs3ay9aOeHWc/dWiDNHxFIVBAXktV17P13aa2w7P1X7KjaZ2HpazLJMdYKWzWCyjaYl0s3qwHl0fpzLLRttQSepyOacVJcs79L8S06ASj2Hix+Uy5a0yUQBeV5mzZAhLhuDg5dM1BrDbbXrYXtqgIQi+EZAxWLUuOHv+YMnSA0ztAWWMid2Z3zf/ZvimWbu2Z6SZq8iAA2axOgkKnY8al1wbN5FJfAypZGyXB61jbbb59eHfGAE+x9PZOOOZTOKizZWhBjLGDJZ/1yvhogVoTTZUAQV97gsAe5ipTV68cvAp4qTdOnVVxht0ES8YRrd76jQev6Mlru8jRXmInPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 23:55:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 23:55:16 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/6] pinctrl: Add generic pinctrl for board-level mux
 chips
Date: Wed, 25 Feb 2026 18:55:04 -0500
Message-Id: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANiLn2kC/1XMQQ7CIBRF0a00fywGqAXqyH2YDpRS+xMLBCrBN
 OxdbOLA4X3JOxtEE9BEODcbBJMworM1+KEBPd/swxAcawOnXFDOWuLR6jU8yfLKZJx63d2FYN2
 JQn34YCbMu3Ydas8YVxfeO57Yd/05/Z+TGKFESDVyJloplbrY7I/aLTCUUj5fz9tIpAAAAA==
X-Change-ID: 20260213-pinctrl-mux-df9c5b661540
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063713; l=3512;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=VR87HbuZL75C8pD3gZf5avwhDW6o9pp8eG1fppmoNmE=;
 b=74GRmhWVwGZ7KCpa5VtCibFbNvTK6uQVBM6CSGTK0ANEwkzMmDmeWPTKT72fcZT+0EdjbHs4K
 W92rAqSI8YFCzrBcztT++BbKq8C6JYYKTZnJLUKXaukkU4TUG3TJ7wT
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bba6405-98c7-48d6-6359-08de74c9532c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	lED/tRYRbXFFSWJ3s4B01/iWZyrV9btgM7S1K+nreY95+lSHQDzsztW2cvk+H0pQxpOFE05TgAVFinyKAc19NltfvByqiwD1G/yOeX8HTTtDkrgCT/GdwznpvHpyYr2extxSHQURpHQ623Xnpj66YBIxQv4bmrOVFLM/BVLPL4fmFBceI5ABefIKit3hYU7Ymw11JAeH1lZPUS/5+I6sWKpFB52gCvxd6s/pGRwmuLgG1LZniOF6JiOd/SctOOy9OWmj2NHXFm19Wh/jvLptpkUsBgm24eVcIEhCNOJzr1zoCxxsg71IfoXXDsu0qaj1hn/9B/Z9r3a2rSB7I+qC4junftkZMoGqbVv+ImxX84tloBsJDzwoO2dRsmhK3VrrOIc8+lYxpnIHNrUTosQKRFl6uMzrOz208hMr6xTM5pfhLhm3HqGR05Z881OqjEvPpbH7Bh8AfOPCynD4jdqpaf9PQOp8oI83evS3egtgl9CZQeCEBiYV9lUsQRWExC/jS8VWhfuqvMNzCZdoY2isIMH0t/WDsjAVQ4fHq9uczwI+5Uix6HfVjk1IGpfj7cwKaTDJHsYcf35qGOESPSRyvSR+uA7daQgkXo33Ita74KEKAo5l8QB2FspIwLxGXVJjeQr1MV9xcICGjyvwojzl2Nmw0PS68xRTxqTjUK786eG3trdROAJEEyHsg5+6uzIEuFyM8Rmd1rSmtHgjjwetP2vC+aGzMK0fk2o3NqSA57QXfjsoQ6R1SfqORR4ch3Tl+mU+oZedDHG367is3mfwvAFYeq9puOhKCKGWNRsIcZ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXhoRVpRcTZ2LzdEVzZxZFdJV0lXR3RIL2JzS2ZUV3BKMHIwV1V5WWxETEho?=
 =?utf-8?B?N0t4UmZmZm5xMWJGM0QwSEhTTjZ0SlduYjZmMldoMTdmT3VXdTFCYkZPVHNs?=
 =?utf-8?B?bmVFR3pwNlkyUlh0bWl1cjZLYVV6ZDN1anlOTEw3RW81UExnbHFDS3EzSGVM?=
 =?utf-8?B?Nk1BSEZxbVM1M25jSHVqZndzRlhtUjVZbmU2SnJaNHJaMlVEWVZxZmkzdlJp?=
 =?utf-8?B?NW5iSUt1SnRkMXdaY3lGVnRWdnEwTHdTUmJRSFYzaERINEVvcklJTXhqWWNu?=
 =?utf-8?B?OWRaeCtTamMwTmZjdFh5UFNPWENEQjkyeXJZbFg3OGFyZjArSDhyYzJySy9Z?=
 =?utf-8?B?eVRwQ0VoejdiTENKN082MW4wLytpTXVVU0orK2RjQzNyM1Z5M3VyRUZQcW1j?=
 =?utf-8?B?S3RTUUlMdmpYQy94cVVseGRKNFNRTmJpbW1xWXVZMHV2eFdESkFKRVNwL2hG?=
 =?utf-8?B?YjFSbjRaakRvVE1SNVhQZ3dCSy85SGRmN1U0TUR6RDJyeHRZdmhoTGpnd0ww?=
 =?utf-8?B?YlEwTGt3OEU1WU11NmQ0YmJadFM0SlRST1NvUTVNVkorNXJNRDh0NW05M0hQ?=
 =?utf-8?B?ZWRURkVVcktNc2ZsN2pkdmRqdG1NaFN0OExjNm40d000dGQyMS84YmNBM2NW?=
 =?utf-8?B?Q0xiOENQQW90bjI3WS9wclV5WkdCNlN4UGtWQlhhdll0WUFYMTdPZlRBRlc5?=
 =?utf-8?B?YlV0NWNoL0hUdmFhY204Zk1TV29IUUljc05FWHAvYmFZS2pkb09FOUtNZ1dr?=
 =?utf-8?B?eHptL3JaR0FqY0xsaXd6L1ZEUms5cHFEQnhwSmdnRHZpd2RFWE1LNHYyK09I?=
 =?utf-8?B?T3Y4U0RQSUF1T3M2S1V1QTFQaFI1a3B3M2xqVW41MTJhWmdKWjFST0JLOHZh?=
 =?utf-8?B?RWdQQ3lOYTlZN2hBeXhveGRZRE1Nb2FEeEJMdCs2K1dtMHM4LzkvK3pRTzNl?=
 =?utf-8?B?VGZIY1NsL2YxU1Jjc0p2Mk5sSXBxVGlkS09OaE1RS0FzZ0VqQVhIRXl4OXVi?=
 =?utf-8?B?SHdkeUFNNm9CUXFRQW9tVzhzRkZ2ZWhCK3NZd3dpNU5aQ0FMYVRzT2J0RDNB?=
 =?utf-8?B?c0pTZGFqTzNmckh3SjdEa3pNOXJTTXhYeDgvUjZLVHd2VFFaOFlDTXE3VjN1?=
 =?utf-8?B?N2QyK014MEFSekUyZzdOTVcxQkxtb2JyaWJMY3d6eUNpTGJkTTZrbE9ZQVNJ?=
 =?utf-8?B?OUthbGJMMVRRckJwdUI1UHFaOWJ2SnNuMTVKVnZJQkZLM3k4aThUV3BIOSsy?=
 =?utf-8?B?b1EweERzcmg1RFR6b3pBN0VyRVhjMGpMTWQ1Nm95V1FaVDk5TUhFMDNZcUgw?=
 =?utf-8?B?Mzd0YXdLZGpBMkFEWVRKM1NVMGJ2SE5MRTVob3d6MzgxY254WjhRZFpkdEhF?=
 =?utf-8?B?MWhGQXFNSHQ1WEFLWllJaHpjalpjVWdCRmZYenFXMUd1bGtoWERpbUZOYXha?=
 =?utf-8?B?b0xGNTJkSi94eXRGUEo5TU84N0ZOK0plcEErWjNPZ3dDcXZXRjRMSzRRVlg0?=
 =?utf-8?B?MTN1Q0l6Mll4TFdKc25ETGUwVjFScWJLSGZxMmp0dVBIcE5waVJNSXpDcm1B?=
 =?utf-8?B?cy82MU0yWlJNeUhjcElaVkFEeG5abnRKbUJsWCtEWlB5ZWJxeGx4ZjBlZElM?=
 =?utf-8?B?amhZRGppUk1sR2VkYVlsbG9oZW5TR1hkcVFUN2VQbThTT05BYzBOdlRiNTlU?=
 =?utf-8?B?eDRBVTJ3K1N4bktaL0s5QllUK2tqbDVTTEFLQ01Ka3I0d1NzSWY2TCtCdTNO?=
 =?utf-8?B?QzNBUDZxb1RVSmVielMyS3ppcVRNS0hEQjJ5UjJiUUsySDNITkxBazVIOVpM?=
 =?utf-8?B?Qk1NaXl0c0hmSkNGbTFKK1BZQ2NlbUtickZCVjhnNFl6c3krMzRGcURqSkl2?=
 =?utf-8?B?VUFiZnB3YUhYMm5tSXZaOHdZYkZnZnFFOTl0YnZIVVowMjNxWG0rMm5iYk9a?=
 =?utf-8?B?Q2hNUU9GSCtxNnpVaDVML1NJU0ZLc3B6OWg0MThKbVo2bHhNTFZYS2dNYlh6?=
 =?utf-8?B?T0EzbnBvNjFlUlNKWmtMalNsekRyVE43Mklib2o5aDBZcVplUCt5RG5oTWNP?=
 =?utf-8?B?NXhnSEU0MG1tSkxCQWxwWk5MTnhlK1lnNDhHa1lpYkZUS3M5dEtFd3oveU5H?=
 =?utf-8?B?MStuMzdpOGtXZkQ3OTFaNm9ZbURsNU5tN2k1RjFZWnRWWjJIa2F1N080eXBZ?=
 =?utf-8?B?ZVlyd25kSDhBLy8va0N6SEl4cUJyVmQ1ZTkrNmdQNGIwa05iRU1mZ0ZKRFZj?=
 =?utf-8?B?M09yanVITUNqWjdqa3Z0R1NERVR5emdBamd0QzVXaTBEb2wrcWpENldqYUND?=
 =?utf-8?Q?bi2hX4G77uWcEi2pex?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bba6405-98c7-48d6-6359-08de74c9532c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 23:55:16.7442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XKHAiJ3kdnh3Lm8ZbFV3PGfiHbDHRwDEPnglDBI/EbG5kiwLBI1Rxw49m8pezWEKxUOyhI8XiCT6MZpuqRL6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32193-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DADF019F2C3
X-Rspamd-Action: no action

Add a generic pinctrl binding for board-level pinmux chips that are
controlled through the multiplexer subsystem.

On some boards, especially development boards, external mux chips are used
to switch SoC signals between different peripherals (e.g. MMC and UART).
The mux select lines are often driven by a GPIO expander over I2C,
as illustrated below:

        ┌──────┐      ┌─────┐
        │ SOC  │      │     │    ┌───────┐
        │      │      │     │───►│ MMC   │
        │      │      │ MUX │    └───────┘
        │      ├─────►│     │    ┌───────┐
        │      │      │     │───►│ UART  │
        │      │      └─────┘    └───────┘
        │      │         ▲
        │      │    ┌────┴──────────────┐
        │ I2C  ├───►│ GPIO Expander     │
        └──────┘    └───────────────────┘

Traditionally, gpio-hog is used to configure the onboard mux at boot.
However, the GPIO expander may probe later than consumer devices such as
MMC. As a result, the MUX might not be configured when the peripheral
driver probes, leading to initialization failures or data transfer errors.

Introduce a generic pinctrl binding that models the board-level MUX as a
pin control provider and builds proper device links between the MUX, its
GPIO controller, and peripheral devices. This ensures correct probe
ordering and reliable mux configuration.

The implementation leverages the standard multiplexer subsystem, which
provides broad support for onboard mux controllers and avoids the need for
per-driver custom MUX handling

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- Add release_mux callback,
  test insmod/rmmod, mux_state_(de)select() called.
- Link to v1: https://lore.kernel.org/r/20260219-pinctrl-mux-v1-0-678d21637788@nxp.com

---
Frank Li (6):
      mux: add devm_mux_control_get_from_np() to get mux from child node
      dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
      pinctrl: add optional .release_mux() callback
      pinctrl: add generic board-level pinctrl driver using mux framework
      arm64: dts: imx8mp-evk: add board-level mux for CAN2 and MICFIL
      arm64: dts: imx8mp-evk: add flexcan2 overlay file

 .../bindings/pinctrl/pinctrl-multiplexer.yaml      |  57 +++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |   2 +-
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../boot/dts/freescale/imx8mp-evk-flexcan2.dtso    |  15 ++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  23 +-
 drivers/mux/core.c                                 |  40 ++--
 drivers/pinctrl/Kconfig                            |   9 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-generic-mux.c              | 241 +++++++++++++++++++++
 drivers/pinctrl/pinmux.c                           |   5 +
 include/linux/mux/consumer.h                       |  16 +-
 include/linux/pinctrl/pinmux.h                     |   5 +
 12 files changed, 395 insertions(+), 23 deletions(-)
---
base-commit: ff76d257e86235eb07ef33db8644a517c48d1c3f
change-id: 20260213-pinctrl-mux-df9c5b661540

Best regards,
--
Frank Li <Frank.Li@nxp.com>


