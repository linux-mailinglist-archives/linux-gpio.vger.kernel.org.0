Return-Path: <linux-gpio+bounces-20327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15223ABCDEF
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 05:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A3591899990
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 03:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62839258CFF;
	Tue, 20 May 2025 03:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CkGfkzZT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2088.outbound.protection.outlook.com [40.107.249.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C891258CD4;
	Tue, 20 May 2025 03:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747712698; cv=fail; b=Ak/UsNpF2IheARONBk32yLTnxyNlzTeMbBD5SLfhuaOlNG3RZmwVudT7KIjjh/t1uIo/DuxuGae/X/DXvkrZAHIE14raRm/Wa7PAq8yRNJ4uzvkFSstNy8n8zAfCadeAFfKcXvb5ATOh7D3z7Ih0Gs7THNJ8NQn4EFsfb6jatfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747712698; c=relaxed/simple;
	bh=wDObWEolMgpepxif3IK/krIEJZZoIv+vVxASJF1qZ1Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Se43SZNXIXXs06OnuSCC00qs8zRNhQYSho/Mc6xx+Tnwi1aAv5BbDYsfgVmqbQvcNmtYEymwlgafYSZ7RNNF7GINNGUYUsFrNz5Epyvf5SRshMopDaYMQmCYsd1HcBs3Gor1f52UpSs7mf/ZoGPLx77/ASHazNdLq6gzAsxxpcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CkGfkzZT; arc=fail smtp.client-ip=40.107.249.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBgUnBVhv2TE6o8n2AIwse74MsOMAjOBzgNKToiVDKToOHGeSBlPy6QaCpEIb5XdbgBKMhPgnqT/yTwaua/QbxOpQjCM+0rLxt2yuyfUzpw+Tjs/hgpSg1Cc3PdaAK4N1azep4Joo11h9quJl1sZPoab2h/t2C5Cxtht6m9PjTpyPIm+M8J8HHco05XOoATzpCv3M7WLVeYGqeeyC0e1EtxRw52yjiAnS+j1muAsLPKtA9PiTR1zLRcd00nsoBV/A+EPjy2H4Wwj+Hmflz4FmJzIDbzw9R9vAIX+8ZG+tx6B3dRilMJpe2VwQTuXCF/K3NyyR65z0e47CdB6xjcG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8U/bfi6cqDc6Iofg76pJCx5Bq6Fsz3xgPP+sCbyPLI=;
 b=ahfao/2kCKUGZzWKfqmKmczd83WjIlSuDWGuDCm5TgICOlscMFKWQGfiuPwI2GJQc810QjvNYCGYKdaBXcWi/bH+lHjTnRazl5UgpTdEqpreMiJhCJFE0W7GliPWMK0VpKEcAY7V0SY7pfg3lm/YyDo2CAU8x3rDJlbVmynu+cXnyKvqgLmTcQvHPF6OILNVK/gmRz9+jm/x1M80jIdHsW9miXdSBnAUHIE8zr/wzTYu6P7nhL/E8Ch0Y6F7BpC0l7WAA01c40vWVziAtGbx6VVY8jH7AIauMzzCAIfSwmsaH2PT2BbqSaYTHE8ZToGD7FtK0ae+FJ5duDaM3pULXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8U/bfi6cqDc6Iofg76pJCx5Bq6Fsz3xgPP+sCbyPLI=;
 b=CkGfkzZTB+SCfDsSRmNzihKJ/20bXSVeFY1jZC1fRJWY859wWaKMELZ0GvTzm8li+yMJSltip6k49BxRvO/iaO+meoVIZ0fxPmcH/dU2h57bO8npcB5IetV+AM8UUEHbCVd+SIU/PyHa7d4j5XGlGC96xYFS0A5YDU7yperEG9LumbuXaIK+fXm61sgG8PtWp0An1manA2An4eu2/2Rcv90IxA62OpqxcRQ1QQ2MVeKpbNApMRbSHMZOZvoiyd4W428ShPhTXw5soULOICDvUwJk+3ldgTXe//HBebuc4VhRuy5cbx3vHUl4VnKfqIyfxUMu6PkxxTimznZ3ytMoFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 03:44:53 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 03:44:53 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Tue, 20 May 2025 11:46:12 +0800
Subject: [PATCH v3 1/3] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-gpio-dts-v3-1-04771c6cf325@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747712825; l=859;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=wDObWEolMgpepxif3IK/krIEJZZoIv+vVxASJF1qZ1Q=;
 b=601r/AOfwEvtxW6JaCy6M9oPq3pmXO7gMDOXyhcT+qnB46mieovSFVfwk+RaX64ErXx6tzwH2
 YzSt7lbPCSBDIi5+r2zPbY4xFGNcIq8iyn634ZaIIgrvGTLqMOSof4D
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
X-MS-Office365-Filtering-Correlation-Id: acdeeda4-9578-4d18-5344-08dd9750ae75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|1800799024|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eElibkdSOVFidGxFeGkzdEJsYm83UDFkT3FlZC9Ba29hbU9kNHkrMGtSZi9Q?=
 =?utf-8?B?MjZmQnJpQUdCRjV6eVllZ1J5UFh1TVZSc1J4MVFYMmtxbzQ2bUJXNkkvRE0r?=
 =?utf-8?B?ZVNObjgyY0hGZktBOGN2TEV4VHJXTnMySHdXTzY5cnNRU2Y1ZzRZOEpTa3FE?=
 =?utf-8?B?S1RmK2xrQ3hZS3N4Zm1ubG9KK2Jlam02OE9udFRXRnBiQ01RYi81WU1RUFNN?=
 =?utf-8?B?Nzd6Zmk2UzNMUGdhTnVxYTYySUVWL01VTWZnNVU4WERRbW5ObXNmcUZrRVpW?=
 =?utf-8?B?azE1MEZLc2RRdC9aSnZ1VUYzWVQzM0gwYURjbFFQQXpxLzh6dk1FZml4Mk9D?=
 =?utf-8?B?VlJmZGdJbWloaTZqaHB0V3kvNG1jSnVOWTJKT0VGZTJxci9kNzhQSVdPUHFZ?=
 =?utf-8?B?VHVGZnVITjZaUzdRWjV1YW9rem0rZko5bXQwUm8xVEVLSjNpRE1hQ0VTcmor?=
 =?utf-8?B?YUNDLzdNeHRodVFGTFNTODlNRmV2UEE4TFI5NTUyMjNLQmZVa0UyQ2R2Z3NI?=
 =?utf-8?B?alJlWHZDL3FWNCtqRkZlMi85VDZtemxCcWhTUWlWUERSVFhjSU1rTWpCcUZt?=
 =?utf-8?B?VzBqTlExNU5nYzJ0VHhMWUFYamk1MHhDeFhwSTVoQ1NXTmtQemNQZTRIUnVE?=
 =?utf-8?B?dndlQkdCTktFa2dudFQ1ZVl1VUx4MWN5WFE2QWo4VkV4RVJ1TjB1bVpKUEM0?=
 =?utf-8?B?Q0hzRkl0emlPUEt3WGgrYVlJbG9EdXZEUlM5UW5GaWluMGY2czV1bG8vQlNN?=
 =?utf-8?B?TlZSdFZlTDRoeDU0RTllTlVmSnJyK3k4WlJ0RVpUb2tobzdNWE1Ic01iSHZR?=
 =?utf-8?B?VWZRM1I4SCs2RlJwK3Q2cVdFd0l4a0NUbnA3SktuandkbFQ5Z1gyNHFCMkZy?=
 =?utf-8?B?Zld0NVM3WXh6K1crd3RZT1htV2hrMHp5MFNEL3JHZkdrMVZ6Zno0VWRVamlZ?=
 =?utf-8?B?OXVZbGZaOW92cnI2ZGViSCtoeGhySFczRjFzdjRpWjFIUkRQYmo0bVVXZlpM?=
 =?utf-8?B?KzlzRDBHRkJzOWNDVGhpMS9uN2xVRWJYbC9ON1NnM0cwNEozZDUxa1hKckhk?=
 =?utf-8?B?WkljelFNZlQ5dnI2cThBWDRrNzRrbFJMalJ0bS9mQXErRHB4azdOaXRULzEv?=
 =?utf-8?B?RzNUdGtSNzNPZ0JlZy9sSUZMZ2grcll1Q1Z2QTE3Y3hHdDlVYmpKczZQakkv?=
 =?utf-8?B?TjBmbUcyNTdlaFRXMDVJSjAxaW1KTE92cjMxZXhDZGozVFdNK0dnZE1GNThK?=
 =?utf-8?B?UEFhRUJnQzlNRXFHV0ppbmVVWG82c0pOWUdyZHI3Smo3cnFjM1RXa2xxNHU4?=
 =?utf-8?B?L1dSa241NVJTWEtGamtLaFBrOGcxM3ZkVnBLUVF2SGgwMkFCRVJEZWdNRFUw?=
 =?utf-8?B?amdXR014ZTBQSXZLU2NFZmxwQWRpb0kvQkVuUmtvQmoveVdnRXBDd0k3SENm?=
 =?utf-8?B?K090SkdVdkZQZDNOS2lZMFJvaGhOM0M0VGVBTkdEM3c2Y3BhNkNyenVweWtB?=
 =?utf-8?B?eUVsRDFPWXNRMjhQcnlqOUkwNEJCcFpvSWdIbWE5NDg0TDZ2VlpaeUpoV1Bs?=
 =?utf-8?B?K2JWWnVPamFOMXNLRzlXOHlPTHFEd3hHLzhqVmg0eHY2ZWFHcHFybGhsYm5j?=
 =?utf-8?B?UlBOTG9POERhOHZqOFRWRWtMMGtCTG16Y2R2TG51WEx4RmQvVm9UVVVCUUww?=
 =?utf-8?B?V3Nyd2xrSU5kRlppTXVkYW82NXp2Z3NDRzZpaUxZQVVFNTlDTnlGcTg3L3h2?=
 =?utf-8?B?eWVORGtJS3NKZFJmMGttZnNoR1RwbksvYXBWc3cwQ0w5MnpZYk1majBTY3lI?=
 =?utf-8?B?bDc2MFlySmx2Nm9mM3dWZ0x3QjlwSkdJSVVwMEhXdXJ4MjNGN3ZocHJXdFZM?=
 =?utf-8?B?MnVKUGJxODA2WFdLUFdsZ1FTSmFXY3UzOSsxeEdOSzJjb1dZaFlTMmlGZGIy?=
 =?utf-8?B?SWNmR3k0L05Xdm4zblNKajRJbjhCK0JQTDhOODQ1UDJUQ3hJd096aVRJaGR6?=
 =?utf-8?Q?/ybZoHrtzinA6YRWmF0ooarpAjdoKw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(1800799024)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHZaYi9GVWxTOUNDWmNQaXAxOVJ4OFNMb3RrazllTXR2TXJJRVdvek0vZ3Nr?=
 =?utf-8?B?U0c1Q292TEd6OWNPeERoTHJHakVGNllmRnhEcEsvVTAvZXRnOUxPVnQ5aVBC?=
 =?utf-8?B?WGtQQXNBN2kwK0hTeWFWenQ2dHU1WUdEVjNiT1h0OXNUWUVRV3VSNEVJVlJ4?=
 =?utf-8?B?c1lsTVVjTkJOTlFXME41dURMazBlcERpNDdueXRhSlh2cG1sVjRGZ3d1TEls?=
 =?utf-8?B?cHRGdVdJVEVtMk1qdWhlZ0luTWFBZkZ1Zjd6SEFQZzZVUWFMNnRLQ1cxQXlq?=
 =?utf-8?B?R3V2bVhUeWtPQjU2Nk1ueWNySEFqUGNVaEZGT2x6Mk8rQ3NTY29FeitpWXBG?=
 =?utf-8?B?RzllejBlUTh5Mms2N01QZnJCNWpOcm54REpBNTg1QlJoK2JNNG05MmxZMzlh?=
 =?utf-8?B?dityRkYvbE96cm45RE5TMmttbXJLTUQ1c0w1SGtOR3czVzhOQmlXRVpmQWVN?=
 =?utf-8?B?cWJCbkNuVDVkS28rM2d0VkE3WGJDaWtRcHRscTBkYjFrNnBrNXlsUDB0YU9G?=
 =?utf-8?B?Z1B1Y3VGY2N2WSsyMGd0Zi9TVzFZNFNjRFlZTzZhRjJCaXV6YVpsTUNlc0M1?=
 =?utf-8?B?VDFUMFJmQlg2UHBjdzVjcnhmVDNSNUhtMmZTRlJFc212aC9zU2VkV05aTEhz?=
 =?utf-8?B?R0UrSkhibE9tbzF2ZHpCcWJHQWZ6azJGaUFSM3IrUmVvblIwRGE1L0VKbCtq?=
 =?utf-8?B?cXZOMkU0b2IrZW1oN0lpRFFXUWFWbWdYS0dyTzFnU1NZdkE4OU1admJRRnRZ?=
 =?utf-8?B?K2xlcEZYcFVnUjJDRVlpcmdNci9WN0lhbWJHMXVBMm1QSE8xdnhuTUhYWGZW?=
 =?utf-8?B?bS9DbmVvOXk5RGpndTFJQ1FKeFBSbGR2WXg2SERjVlhhYi92TU10ejB2TlZa?=
 =?utf-8?B?YXdxa2hyVGF4Mnc1WWxLRi9zZXY3NDYxdjA2VCtFMlpFRWV2QVBGL2ZxL1ZY?=
 =?utf-8?B?dEFTMUJ6ZVhwbW5VTU5ZODV0c1c4d0tWZFVBamFyVmZlWGZoRWE3cW5CdDZo?=
 =?utf-8?B?VU9COHdVVGxodGVYQmtSdWNNUitjaVVGdmFOMTFrTFVGeG9SNFloeExWVHgw?=
 =?utf-8?B?WEsvcTZWUHprVDJCZG4wYlZNYlhtMXJnK21TQUNOdDZOTVVJb3ZaeU15aUli?=
 =?utf-8?B?NFQrci9Ya0Nwc0U5WXZVckR2UDdIdXk1UFZjS3lJMHZUVUpCZWJqZkI1MXBC?=
 =?utf-8?B?dzBLSE9rNDNNQXFRRUZLN1BxN3ZWSFBCbUxYSGJhLzlURTNwTjRUSkE3TEdG?=
 =?utf-8?B?M0ZuWjNMYklUcUNmV1JINDhidkxIOW4wak1LSTBYdE52L01qMWlYU3FRYndU?=
 =?utf-8?B?aDZxbG8rV3ZUNFNjVVJJaFdIMzBxMGp2dkxjRUJpN29oeThUQjE3NnI1blVj?=
 =?utf-8?B?SHZ0b1VnaDgyZzlmZUpCcWphZlEwZ1BJL1BPajJGZ3J0OTZtem1ZVlVMVC9q?=
 =?utf-8?B?QVFwSHlNZ0kvNEw1SEg4Y1pyYk81dUgyT0QyNDc0Z3lIelRvYUFFWk51NHhJ?=
 =?utf-8?B?MnI1ZStEVEsrOFlyM0hmUzlUV25mQmxtQ3B4cDVjNS9pbFY0MDYrR05SSStl?=
 =?utf-8?B?MzltaU9HZlFWZHB6cVRxNkFqdHpnV3lFZ09TK3o2NXZFNG9lS1JuL0Z5dUVq?=
 =?utf-8?B?WFJvR0g2N09Ub1Vib3FKaXJrYXhEemhaSUJNWGE1SHgrSFFIQUNSZm9ZTStD?=
 =?utf-8?B?WVhLcjVsRXJIdUpldmR2bmtYSHpxSm9hWjdpQmdtcDA2TjlQVWNCTHVsMjAr?=
 =?utf-8?B?UnNvWkVsemdHcFhwUXlzU3hZZjg1R1YrTjlUMlZxbDVDekNxV0IxZDl2Vytw?=
 =?utf-8?B?RUtadUp5d0kxUS9OdzgvVmxUbXBpRWZKUVN2Z1JzRXJUOXlOSEZaU0hmV1o3?=
 =?utf-8?B?ZGF1TWZhRi9DNGQ3eUNTazc1NWVqL2hUYkI3Tmo1cFJQUUxGVlBCekhHMzhG?=
 =?utf-8?B?NEZ3bWcxSmY4QnVFcU9RRnluYjFiYWc5WDduRGxrMFJ3c3hWV1hacUNQcTlG?=
 =?utf-8?B?aCs1NWJFVFUwdURERnpydnBER2p5ZWltTXgrSUNZVnJLN2RtRTk0SENIdFVB?=
 =?utf-8?B?Q0dXc0JXM0J2dm5mNEo1SlQzKzd6anNhd3BEdGdjSlZKZnc4V2xCVHBvZlBn?=
 =?utf-8?Q?6aTLyyQzlxDn+2c6pECHzd5KI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acdeeda4-9578-4d18-5344-08dd9750ae75
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 03:44:53.8507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9jNB4X/o8f4mISUKK0c/MQhu46qXf4kV3E+pHOwuf0fjaaFHKl6xMTtoz19cg6mDVFKqp0X77Jyo58mEMQZEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

Add optional ngpios and gpio-reserved-ranges property.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index 4fb32e9aec0a341a50088f3e4352ed4d36f649d3..a31f64b6d40b4bca79672d4eb54a405aa546e243 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -70,6 +70,13 @@ properties:
     minItems: 1
     maxItems: 4
 
+  gpio-reserved-ranges: true
+
+  ngpios:
+    minimum: 1
+    maximum: 32
+    default: 32
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object

-- 
2.34.1


