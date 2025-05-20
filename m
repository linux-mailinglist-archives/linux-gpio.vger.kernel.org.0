Return-Path: <linux-gpio+bounces-20329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE6ABCDF5
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 05:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92A3A8A07EF
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 03:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCD6258CD6;
	Tue, 20 May 2025 03:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kaymnCPx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1AA25A33D;
	Tue, 20 May 2025 03:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747712710; cv=fail; b=BAaihMk6qlhx+lyaADQN2tFAPisISOoVTxHiQZlW/aAJOqNVyKSClRT1DqaoL3P1Os3H9gf7S6W8LpnLao+CAD0BuUnoYoJOKFozYJ5O9lo8Uo5jakUqCUkcrH/bkUfa8DbhXi2tehQ9tIRfLHXZtzcdBDgWCOsidrB88V6ZIHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747712710; c=relaxed/simple;
	bh=mmseM98u2Zh0Mtw4SZtf+/oWMXNeHvJFgq3uWVLCsTA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JdZ28+nRlaBTZXKjwHQAzhnKS7UcQjCJ5g5NrSyg4hVPy8euRfyWfCG5lvWt58Ytj6tr1Xi9mJyPvcXchg0g/DD0NP5Cg4o6VrGQG2lv26Jnnc4la8xuK9sDsZSlYZdFsnl52w5rMT7EB5JMprmJnvbO/1r8Qrs3WVVssLvG3nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kaymnCPx; arc=fail smtp.client-ip=40.107.247.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsMC19I75hq6MFeIOtrc/BAg/vh+KGcd6MwG8Fn/wlQGfOjhXpNGmqxMWcO+vBgwMMXPXq9O7jEWe7hRYobwBIuuZZbau6rWCXBMDKi07haJx7PoeZViSxx6lSStq1kRGc7BpAloi+e/hvFCCtZdbdP2B4IqM5zh4sMT33RpZaqsh/HggaNCQXq/X9FOprwS1vufPghNSSBd6rRqFlYgCTRpsznNXoq4aI4MZ3A5Od54SFKqs5zN3lND2crgT3TRrl90iuwBdv02PnIZxJ/+fHkLYL+ihXETnqDxoJ6J4Xz83/hjFCSDSEKgC1NpU6yONWoHb3f4c60bvWax248vig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIurRIbiNow/6tHaQueIjcl2p3tNRcAt0s+JmtsT9C0=;
 b=RmqaVK0VQWwmoh0imtFVqvI6jUe52PVuJPxbJ+QuQvvvNp1EgfXCT7yz+ODJRge+cxF0BtSQMjlK35dF1VyYCa+p9tfw2m7NxSnHO1KlVTPcsUizUH19+wTI+Uf4Tm9WR9c0z3HBTRlmBiyQo89bVFYGN3MTY5q1N1jCDVpJ28c8iO7Sc98FOP5/Mo2Xmb+u9nh5ZGS8WhePpBtHmktOaY9v+ggNGTBhWlb4J8I+Gijq9omvOZl+yvAQwkLDlxQx/HcxAAJEi2c0lGO0zQk+9bePGv849b0+WLUr7oSXN/jVWBcgRnV4ak16koYzMT1AUP+ss6vFTJA2XWaELQ+LMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIurRIbiNow/6tHaQueIjcl2p3tNRcAt0s+JmtsT9C0=;
 b=kaymnCPx2leHbSXDyRhXlB4hBo/STfqT0VrllTkdLQx6sgK0X3z9nj9bGO0K98CU2hQbpCSwlMegdF0fOf9G/Efm9TozjnWQigZxVeBV4O08Gr+wZVX+Zlsc4Lg2WKezphPQy5AzJbFm2CPo3AeSOY512S+35aCoLG0TJbB62B6r8Rb1/u/HwGGi3pdkQRhWGm2TMoUWZIQPdCiQvcXfaBX4W0Wh6YN7zxweiBHBAOVc0SvfP2Ew+qfDckvzlJwaFH/e1dAHqy7e+0vVjPkF8JYX1e1D6hIyuKUB6+8oex/mJj92BvnrQJ9VmogzEJMVQ4DDS3SJltkexLN0goERMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 03:45:05 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 03:45:05 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Tue, 20 May 2025 11:46:14 +0800
Subject: [PATCH v3 3/3] ARM64: dts: add ngpios for vf610 compatible gpio
 controllers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-gpio-dts-v3-3-04771c6cf325@nxp.com>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
In-Reply-To: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>, 
 peng.fan@nxp.com, wahrenst@gmx.net, conor@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747712825; l=6056;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=mmseM98u2Zh0Mtw4SZtf+/oWMXNeHvJFgq3uWVLCsTA=;
 b=MMV5FwMbGvm/o1Bgf2zOS/rquUVhwrdGoiEpfU2h+tw77be188FuMmoXC5wtPKCm6zwGH2Y27
 HFf8Po9LDWABEwp4M58K5u6+Jvn3nf6H3Z278z37xWR0uJZHMruKemS
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|PAXPR04MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: c76c84a9-86e2-4258-863e-08dd9750b54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|1800799024|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTRLTlRST0RBb01BOUZSRDNaYkU5V0hYUjJqWEh6N2NBRERHbGRLcm9RMnNw?=
 =?utf-8?B?TFJGM01kOVZGRUJydHNJQzhkSmYwTWp1VWVDODFGMlhzYTI5Rkh5Z2NINUhI?=
 =?utf-8?B?WXkvbUhic2FiQ3g2V3BER2tnL094SEREeFFzOUZTVjJ1ZHpIY0RNN2dpK3hm?=
 =?utf-8?B?M2FRN2dMVXljRGhyRWpHSC9tQ3czSjFkWEZnWTNRRTlOL201RzlDT3IveWRv?=
 =?utf-8?B?S1A5V3Yyd0RyZ1BTa0lnblplQ01rZzdDMUdKOVdtUFZrWTZZSDBwKzZOaUcr?=
 =?utf-8?B?SWxvc0VHTldwUjllREp5czhKQ1JmSXMzejdaM2pBNjB4dnI4b2twSWMwbUxv?=
 =?utf-8?B?TUZaRko3OHNGMTlPeklwdHVaT2lDN1FpNFo1UjdSQnoyL1p4U1hhRnRPQW95?=
 =?utf-8?B?ZWdMcjJOK1BSY3NLNVFXSWNmTFMyRk56L1NxejVKaWJWV1AyME00NzZXN0NJ?=
 =?utf-8?B?R01zUndQeWp5T2FVMVNPU3RMM2xtVnZoMXdYUFJBamRwMlhSZktTMjFDWkNl?=
 =?utf-8?B?enRWTkpLQlNDOVlybVdwZVFsNllmZHZoN1l6ZWl2YzFyTmc5NnVTeVdYeldH?=
 =?utf-8?B?RllJOVMwVEExdDB5ZTZNanlsVlJ1NlkycmVuUTFuVG01d0pMcVNvSnBxY1hR?=
 =?utf-8?B?NEsxTXl4OWljNGFJbjhQbUdOdWtTVVdGZEQ4ajYvME14OHdPaWN0M2szNnVU?=
 =?utf-8?B?dHhFVWhZWTRlSmpHRE13N1hKc3VHYlA5Z3JJbzU0YmRJUm41ejFmMjVyUlMw?=
 =?utf-8?B?N1p6Qkg4anFJajJKMkVQRkJtck1sSUg5QmlCcnhRNHAzZVN2U0FDTUlLalRy?=
 =?utf-8?B?ZlBoWnJkN0tnYmFaYm5xWUc0OFJ5ZWRFY3JPQ2FENnppbGFRRHNyZlV6Yys4?=
 =?utf-8?B?cUlUT1l6eTArc09vVUVJVDBsc09xdVVmNHQyZVl2Q3MrV0dkdk1HdVoxRytJ?=
 =?utf-8?B?LzU3VnVUeFN6cGpqRUxxMVBaM0RRZERod1MzbkkwS3k3UW9JdnR0NU9WOStm?=
 =?utf-8?B?YzRyczBSUTZwUi9BTjNWeWppVmlyWEtzOU5LcGF5NWJkUmF2cjhzQld1VHNa?=
 =?utf-8?B?ZEI3WmZ3N3Q1YjUzaVJXUjczZFRtSy82clBFT1FISnpaL2EvY2JUaGlIdkNx?=
 =?utf-8?B?VjF5UUxqV2h4UzQ3cERmcFVSaWNjQ0lYeUswaElnK0VCdDgzYlB1Z0hMWnZ1?=
 =?utf-8?B?ZnRMMnB1UGl5RlNrSm1UQktVdWVmRWtkOEpKNUFYSHJub29kRXRqaEV4eDM3?=
 =?utf-8?B?YmNvejVZanA5YWs4djhLNE03S1lvWk1KcFJNV01vWGpmQ0E4dmo0bUc1YnBB?=
 =?utf-8?B?MlY4ZDJJSmdXa0pMNzdKcFVJU0l4RDdBdmtNNFRTMFNyc3dzQ05HOXRMSzVI?=
 =?utf-8?B?RWh6WjBIcWJQbXVkbmYxdVk2bXl0MUg5TWViMFNhRnZEc0tqbHJXOWEySmhM?=
 =?utf-8?B?ZnpDbnRuVktqOUNuUVpnSjVlbWVwOFNWTmJwN240b1BrR2E4a1czRTg1OGpF?=
 =?utf-8?B?MC9xcXNSdTNlbWlNYXR2U0E1TEJkV3RzMTBjdUhORmVRL2h1Y2o0UDZMQ1V5?=
 =?utf-8?B?cjBUMERJSVF4RDVoRDIxOElhSmpvZWdmUkRRcXNPbXF2VEx0Sm4rVEpSU3lL?=
 =?utf-8?B?YjQwYzM3U2R3MWUrajFkM21vZDNxQ0hUakxrQnNNT2pXSldVTWVwM2xzeUJB?=
 =?utf-8?B?Uk9xbjAyTDJ3ZDhlOGlyZjkremw1bkVRN0pWSytqaVNLdHVsaEgyWThRdndF?=
 =?utf-8?B?U2M0c0lKUnk2dW9McmkvbjNXeFl4aGpsTkZOenRtTDlxak5YQ1kzT200ZmZN?=
 =?utf-8?B?UldoeUx0eG8vT05lcllkbWlESVlsTjNkUUEzaGZBVnBkSTNyb0NNbjlnQVUr?=
 =?utf-8?B?b1JjWE9vYWRLTlhjTHhMWTUxR3pqcFFPbk5MYm5zSk4zYzVqYnRnWncweVN3?=
 =?utf-8?B?b0xhSEI1RDk5K1FFSFN3UTc0clVlQ3ViZXlXeVdVRytYR1UvMC9LQUEvWVhJ?=
 =?utf-8?Q?V6XZHvNmo5gclV5FHJe2MUPGTxr/f0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(1800799024)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnNIYTVUMkJPY1RwUEtnUEN4L21BeitXeDhmZ05WS1pzcWhHemh5aDBGdmRj?=
 =?utf-8?B?dUJlSHlYOTlsbGJPYlBLdDN0YjRjbmk2UDVEZFd0TThsRzh1YWZRUGx6V29m?=
 =?utf-8?B?Vkh5bFAvOXorWWprSzJDUzFuaC9teEdTc2ZhZDFtU2ttSUh1NmFXS2ZGQVR1?=
 =?utf-8?B?K3RDQUF2MFRmeWNBeGVoQ0xSSFh1d2Z2VWRIOFpvRDRVWnZVdzJyaC9PRkRT?=
 =?utf-8?B?NXVjY1A1RTY4Y3Exa3ZFRkUrL2JRNVgzT2lRcXY4MjhRTUN5dlhTbVhvZHo0?=
 =?utf-8?B?cXhYcG1VTEJubnhyV2I0QWFaa3dQQzhyaHNlbktRb3hsQktJd0FaM0h2TUhK?=
 =?utf-8?B?bjU3OHF5NU9yUitUNDdES2RzdTc0ZStxV3ZJTFBkS3F4cUVNbFdoM05IR0lu?=
 =?utf-8?B?SmNwSE95QUsvcXNWNVlJREtMM3ZSdDZrM0JrWExNbFhleUs3amxiMFVrQlhG?=
 =?utf-8?B?WFVpbE85aGZCOFFiNnk1VkMzQm80UCt6bHVvKzV4a21KQjJoTEtGSUJzOEEz?=
 =?utf-8?B?OUJoc3dIeHNSRVVZQ1JXUlJpVEtCOTJoNVl4S3g3WnlpeC9CdVorR0IxUWJV?=
 =?utf-8?B?TTZlRlVWNUp5NlgyUDJYUS9mNENuQmdHakNXdURFU1FuRGhuYmIycGo0cUtX?=
 =?utf-8?B?emllWjRHODZWMlhUK0N1U3hZUnRWZkE3dEJlYStkdVVjQmhjeVNoR2E2WFJh?=
 =?utf-8?B?QlM2bzZ2bDVrZTh3c0kxWFZQTkNOYjF4bDdiM29GSDdZQndCYUhYQnE4azF6?=
 =?utf-8?B?ekVVMXhYR0I4bFJoZFNQODR0b2FRZDR6WmgyblpmSXFOY3UyMGNuMlBHVlEy?=
 =?utf-8?B?RHhBcWtzTnluY3JLN1RNUHRtMjN0S1JpN2FkVCtyekJEQzA0VEp5bElFSmwz?=
 =?utf-8?B?UnpsMDNlZ0hxT01IUjc2b3pEdzZwWHNKOWFXc3BvNmZXOTNvSUtpVGMySklI?=
 =?utf-8?B?TDArTmpTaU9YUWhHOHIybUwzR2NJcnpEL3l1V1k5UDh0L2ZJSjhkakJFTHZE?=
 =?utf-8?B?WHZDbVU0MmdRY3l6RlFwVTh1N0gzdFVVNWU5ZVMwaElUUDVCM3Z1bFhVbjRC?=
 =?utf-8?B?STdnU2VaZTladFpUWVQweEVIVHpJNjlic05hZlN2ZkRzckM1S3FKRWRNZERL?=
 =?utf-8?B?ZmcxNXgyRU80RDlnSFUzMHlrS2ZlNUFPbFhrTHYyQ1ZvQzJGSUhPVGdzbGJL?=
 =?utf-8?B?TkY4V2xCRURxS3JJbHc0OTkrSTZPRm9LaUlpQmd2RUJ6OUN1R1ZWMGw1WDE3?=
 =?utf-8?B?Z3Q4OW10VEFHT01lMFdteWJkeVRwYnJ0TW1kNTUrenU3MzEyTmZuUXpXSzh5?=
 =?utf-8?B?bExjdDYxNUFScEp0cHNiN2xCVVdvSXFNS2hSUWlqNWlPWFJJY2V5emxwTWNU?=
 =?utf-8?B?SjhzZ05vMW9kcXpici9OUjJ1dWtnV0ZSdmdRWGt3alJkMlA0dWt5RWlCYTdW?=
 =?utf-8?B?dDZ0bTYzWW5YTndiMFlqV3Y2eDZEeExzVURXVW90T0ZwaVJab3ZuMVFZSnhM?=
 =?utf-8?B?MjhHdEdpY0J4bk05VlBBWU01TU5kTkxQQWRFQ2hWamU0c1FDVy9Qd0ZpYmNV?=
 =?utf-8?B?bTdvcCtnL3VOOGlNeEp6WVBsVGxMWm1TaTJKNHB4VytwaS95VjRFNDNGK1Fs?=
 =?utf-8?B?RDZnbWxvRVA5bWRmWjlxWExHZXJka2lpamtjUTBleU1DYkxWbU9LSTNSVkw0?=
 =?utf-8?B?UVVKdXRPRStUby91UzFxWXNoMXJkUUFhbXFvRG5VNXFoRWdncGpGamFnTzBZ?=
 =?utf-8?B?QS9US0oyWjIyYjVrNVF2T0RLd1F1dFRQNjFPdHYwWVVMQkdXanhSeWNSaHgy?=
 =?utf-8?B?a1pLN3Jpa3Zheldod3d4WG1iamtrWlpweXNqbS90WitSMzB1MjV0S1NIWi93?=
 =?utf-8?B?SWU3a0RoSmI1d2VSUGMweFltbkJ0ZDB2V0lmNWg4dUhwNkdOZXp6N1V3VkdQ?=
 =?utf-8?B?alRFTTMxQ3FIQjlGb3I4d1I3bHJ5SVR1d0hhSTgwcG41Tk50cXhORE9OU2ZD?=
 =?utf-8?B?WS91YXlDbmdjS1IvUW5VaXBQS0RrSnRUd3VPNjdJNFFxd1VnaStpTk5uUEdo?=
 =?utf-8?B?SHZXbmtOTmFTSlQxMExrRlN1UWpoeUZRU3JvbERuN0JZbmk0UlBSSGNCUVJB?=
 =?utf-8?Q?6BDtNJdlZij+u7+NnXlRz+Eo9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76c84a9-86e2-4258-863e-08dd9750b54b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 03:45:05.2931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZJ9MXlV1ThK7ElFhX1BaKv1qeVynd2Klhf6kxIQ2XLcPLibzSgMnvo1OPHhsQbxqfQ8UuYQc2KmtIfkrvWgDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"),
the vf610 GPIO driver no longer uses the static number 32 for
gc->ngpio. This allows users to configure the number of GPIOs
per port.

And some gpio controllers did have less pads. So add 'ngpios' here,
this can save some memory when request bitmap, and also show user
more accurate information when use gpio tools.

Besides, some gpio controllers have hole in the gpio ranges, so use
'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
correct result.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 3 +++
 arch/arm64/boot/dts/freescale/imx93.dtsi   | 4 ++++
 arch/arm64/boot/dts/freescale/imx94.dtsi   | 7 +++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi   | 5 +++++
 4 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 2562a35286c208869d11d7fb970ac84638f45088..13b01f3aa2a4950c37e72e04f6bfb5995dc19178 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -686,6 +686,7 @@ gpioe: gpio@2d000000 {
 					 <&pcc4 IMX8ULP_CLK_PCTLE>;
 				clock-names = "gpio", "port";
 				gpio-ranges = <&iomuxc1 0 32 24>;
+				ngpios = <24>;
 		};
 
 		gpiof: gpio@2d010000 {
@@ -701,6 +702,7 @@ gpiof: gpio@2d010000 {
 					 <&pcc4 IMX8ULP_CLK_PCTLF>;
 				clock-names = "gpio", "port";
 				gpio-ranges = <&iomuxc1 0 64 32>;
+				ngpios = <32>;
 		};
 
 		per_bridge5: bus@2d800000 {
@@ -855,6 +857,7 @@ gpiod: gpio@2e200000 {
 				 <&pcc5 IMX8ULP_CLK_RGPIOD>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 0 24>;
+			ngpios = <24>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 64cd0776b43d38219fee312baadd4665674a141e..52be83a168d9ee6452a63039c89169d49b63eb60 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -1197,6 +1197,7 @@ gpio2: gpio@43810000 {
 				 <&clk IMX93_CLK_GPIO2_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 4 30>;
+			ngpios = <30>;
 		};
 
 		gpio3: gpio@43820000 {
@@ -1213,6 +1214,7 @@ gpio3: gpio@43820000 {
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66 18>,
 				      <&iomuxc 26 34 2>, <&iomuxc 28 0 4>;
+			ngpios = <32>;
 		};
 
 		gpio4: gpio@43830000 {
@@ -1228,6 +1230,7 @@ gpio4: gpio@43830000 {
 				 <&clk IMX93_CLK_GPIO4_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36 2>;
+			ngpios = <30>;
 		};
 
 		gpio1: gpio@47400000 {
@@ -1243,6 +1246,7 @@ gpio1: gpio@47400000 {
 				 <&clk IMX93_CLK_GPIO1_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 92 16>;
+			ngpios = <16>;
 		};
 
 		ocotp: efuse@47510000 {
diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 3661ea48d7d2994df7b02084e9681beb303aa133..b8ffc428e95be1938bf5e73316b4163acaa04701 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -785,6 +785,7 @@ gpio2: gpio@43810000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
+			ngpios = <32>;
 		};
 
 		gpio3: gpio@43820000 {
@@ -797,6 +798,7 @@ gpio3: gpio@43820000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 36 26>;
+			ngpios = <26>;
 		};
 
 		gpio4: gpio@43840000 {
@@ -810,6 +812,7 @@ gpio4: gpio@43840000 {
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
 				      <&scmi_iomuxc 8 140 12>, <&scmi_iomuxc 20 164 12>;
+			ngpios = <32>;
 		};
 
 		gpio5: gpio@43850000 {
@@ -822,6 +825,7 @@ gpio5: gpio@43850000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 108 32>;
+			ngpios = <32>;
 		};
 
 		gpio6: gpio@43860000 {
@@ -834,6 +838,7 @@ gpio6: gpio@43860000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 66 32>;
+			ngpios = <32>;
 		};
 
 		gpio7: gpio@43870000 {
@@ -846,6 +851,8 @@ gpio7: gpio@43870000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152 12>;
+			gpio-reserved-ranges = <10 6>;
+			ngpios = <28>;
 		};
 
 		aips1: bus@44000000 {
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 632631a2911224cadc16a943cdb467e091e43384..a2f4fcffcde59849bafcedced3ff317ca6c7cf78 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1152,6 +1152,7 @@ gpio2: gpio@43810000 {
 				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
+			ngpios = <32>;
 		};
 
 		gpio3: gpio@43820000 {
@@ -1168,6 +1169,7 @@ gpio3: gpio@43820000 {
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 104 8>, <&scmi_iomuxc 8 74 18>,
 				      <&scmi_iomuxc 26 42 2>, <&scmi_iomuxc 28 0 4>;
+			ngpios = <32>;
 		};
 
 		gpio4: gpio@43840000 {
@@ -1183,6 +1185,7 @@ gpio4: gpio@43840000 {
 				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 46 28>, <&scmi_iomuxc 28 44 2>;
+			ngpios = <30>;
 		};
 
 		gpio5: gpio@43850000 {
@@ -1198,6 +1201,7 @@ gpio5: gpio@43850000 {
 				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 92 12>, <&scmi_iomuxc 12 36 6>;
+			ngpios = <18>;
 		};
 
 		aips1: bus@44000000 {
@@ -1508,6 +1512,7 @@ gpio1: gpio@47400000 {
 				 <&scmi_clk IMX95_CLK_M33>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 112 16>;
+			ngpios = <16>;
 			status = "disabled";
 		};
 

-- 
2.34.1


