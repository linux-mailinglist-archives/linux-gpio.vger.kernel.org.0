Return-Path: <linux-gpio+bounces-20456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0202AAC0556
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 09:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690D14E3CCA
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 07:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B6622259E;
	Thu, 22 May 2025 07:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VURyqocV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A6122257D;
	Thu, 22 May 2025 07:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898015; cv=fail; b=VQpv2+P9BmR2m3wmcWG/ex5l9LTXlL26XcTDj9Gdy7e4ubkgwWLPat8QGo757hT+swY/0bc16bPx/FPVnu6h2oJL2djoRqNuR041gZhI7bAfQhp4SJ6TddJdVEkxtyZlB9TwRaW1CGwHfRPNAomzPUlRzXwtrsTvxWWmtqs/lEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898015; c=relaxed/simple;
	bh=LlJ6CXNguryK6W48l05nyXC2d8IeyFFeWO/+KswcyMA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OS05chquA1NJjYlVfZlEhonrzw9afo03uuXxFoF3Kxr/fD4QyAIuKyeBUIUGkQPZ3yjtntpUdCfR7jF68rwpWaT4bvdTe1u8L2h1I4rvvHnE15EFoPdycxC5HuhW5XTQqxMplxVpTJTO1eFm/ZcfcIHQFGCSU/3j/8gL/Ky5dG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VURyqocV; arc=fail smtp.client-ip=40.107.21.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAm4LxgTgKK7bkcrQbdtWEM3ZpSBkE50L1tDdsWMB+GuPrs/sUok8VXdxMGl85D6dY+lGdq7oBQcNj/51GYsPemfaBdgK9/pueBmBWK7e0b3xqaGSs9n53BQ050NS48x2l6OUE8Zl1hIF45vOVOI7QGMHCTd3UQy69U8UvxEu9ZHhkqWy4AQT0jkf5cz+SBSbe+d8KEj/POJJXDOBgRCxHSSdcaCaD8F14YONDlacEC7qMILAodENoz4Wbw0DH7e+oI0YaMpCwb0rKlWaHWgNdzYtoNZR0zxf7REFl+Zb3IPiHUl4KM2pPuAYygn9ztJRfi6VUO7cJzRRgTxXGuZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7spijobfkbUvjilBR8W1demSqYymEXb7z/EuT8eScgY=;
 b=gxMMxCHR79TgwC11IV72mYuljExXYV3+Z3DaTIsgtsVEd2k/ACRGEDmAXrRvn97+4+GpOWCjf5idElUEvrfSc0SCtdCaFAfKqVvMcYOtTeWm3vMGu/sp+ZhUpFiy3hk8OuC0PFR+DtaXOinoxFjtlgE1MB1WG/6Zrnf9/mdRvgE6eMZMG+HhGT5+O+G2Fj/YgnmLWkEd2LSzvOVW3cRmeZoeA1vIXoB4Fc8Sn789kG/ml98m26AHnZ48zE83TfUGFe/aP6HO4bTCuiXQv2ipYRxo9p0/h8hdgM8tvia2TGlRjTsrRpY4Lo9C2lZVQ5N50Aj0WWfkR9SXKVEUGbbT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7spijobfkbUvjilBR8W1demSqYymEXb7z/EuT8eScgY=;
 b=VURyqocVfwdM8IBXSRpaVQA0tAgm2g6lXgawiQCbKKocvlJ++AtAOkjgjGkP24wIUsuJ7M0xxr07zgEAmTaT4nR92zNOFNHJ+OkGUi7NriraQD7c3oqqBcbdsyTGH4sbIycTFbzkgwOUsV3nDweP7xtqzsb4uk8JsKY36W46sQjrrl6hRjXeAOPdS034+1ubl2Y+zJ5GpJLYCH+IkBZ8TnJQyLPjjux+8FenTx8G9q9VgBxV81IbXtKYSvOoRx1Uq1G/093iF3kZuMRs6u/54FlN92krAVIUwdO+gPt1m3bHLu+x1cvt6oxPQh+mVeEICYzmb3BbfmJ7stPGSeCM7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7033.eurprd04.prod.outlook.com (2603:10a6:10:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 07:13:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 07:13:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 May 2025 15:11:50 +0800
Subject: [PATCH 1/4] gpio: bcm-kona: select GPIOLIB_IRQCHIP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-gpio-fix-v1-1-98ceae7c4c3c@nxp.com>
References: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
In-Reply-To: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747897923; l=787;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=/LbVcrOSavRgcyD0UuofzMNxIo3a0crI6rsA0J14tg0=;
 b=utidebhDyRtH4ddeO7ByakGUUXUzLS7bjVOZsaL2qGRMjfRLT4tDsYiujSBiLK1COybK2BupT
 /8jZ7wU9ZmFDRAYivSHliUowc2XQ9t+4LLlhkrnMETWzX5ZQsDYZN/r
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: a3340f9a-3775-4723-2c23-08dd99002765
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVpGdDQ3SHpHSWNsOC9RUzJJTjJDalhqdUJ5VnV5ei9ScTJLVnBuaWlqQWMw?=
 =?utf-8?B?VW4zNitoU3JWZHgwUFowS2x1ZWVYMGZpck95QTZETXErNGE4TFl5NTkzQWJP?=
 =?utf-8?B?WnJUSEFEdFlqRHRTZ0hmSHdwQmtjKzJYc3ZvYzh5Z0hqdlYreXY0QzBlaElk?=
 =?utf-8?B?dlV6VzM4aHg0RUdwZ0lIS1BTa1FRWm5TUUtuMGYrVFVpbkxDUDZnR3RLendn?=
 =?utf-8?B?K0wybkNYU3IzTXJXQ0dWZklpQ1hUK1laSDBoN0ZNaWxES21NdkdFZ0RINmov?=
 =?utf-8?B?RGpJait1Mk1QeUZwUTdhRWFDSmsrRElkTW02RWJlcDFYM1U1ZDA0b0JFTXlH?=
 =?utf-8?B?VWFDTUROcFRSenZrTkFsV0ZOZGx6TTlMNzhtTExYVUo4ZFhKQzlPcW5HVGRk?=
 =?utf-8?B?VWFsZ21VdmNDSUVJQk9WMzdrVElDZTJicnNzbHFjcWltZGhtT3hVZkVnT3Fv?=
 =?utf-8?B?d2JYa0ZzSjBIYTlkNnBQUktUTnRIVDVMa1huSXZCV3lPeUF4T0JjWHJydjhN?=
 =?utf-8?B?WlBvZ0dXRG5IVmlWVEZ3djFlWDZwWU5kdkJ1SlJ4UVo1bExsREFQWjAxOHJT?=
 =?utf-8?B?TFBTcnRONmo0cDl1M2s3ZHVLOVVrTW1MUVpJNUJBOWl4Ym10eG1wWWdnSnhS?=
 =?utf-8?B?aFJkOWNuMTY3KzJ5dHlwOHhFQXhVV2t5RjlrQkIzODBpTC9MN3JwSFNYOFRa?=
 =?utf-8?B?Y1VVK3lHcTUxQVBUcG9LRW54SDQ2R0xwL1RTdDQ2S2FPUUZ3cTl4TjhUTlZW?=
 =?utf-8?B?ZUR4VmpTR2ZmeVd4UTZtZThvOUd2dHhrcDFOMDJmUHFjK010L1dQUSsyWDF3?=
 =?utf-8?B?NTZWYldoK2FBTkxJeVlyaWNMSHZuNzRlZnZiMUJLeno1eS9MZVgzNXdEK3R3?=
 =?utf-8?B?WlFEYkt1RkhBcjM0WTkwSXVjR2U2bHNyWHhmZmpvUklibk01WE85WU4rSHB3?=
 =?utf-8?B?b0F5SE03MUhMQUwwck9WVkxrSWRlS3JqdFVHZFJzcThQQ0UrNmpaQ01ka00z?=
 =?utf-8?B?UENFN3orTzFyMlRCNG1laVBMdVBreEF4UCtXOGZaUnFZSjVwRFY0L0VMYTVV?=
 =?utf-8?B?Wmlqa2JkRXJ2R3hwdlg1SUFvRyttUHIrekJqbzFtbzJwQVhwdjlUNGdEeXpT?=
 =?utf-8?B?ekV4dVlxUnFsdWIwMTVkMkZzbVlqUm4zZy9LVE8xMjVjZndNOHE5Sk12UHVx?=
 =?utf-8?B?YzVFVDNXTktldnlmTjA2c2Q2TDNGNC94ZTAxcWlPY0UySlgrdEpSMmtpWEIw?=
 =?utf-8?B?SDRQYXJMQjdTZGtnZnZmUmxrUWVTbW93a3R5ZEZqYzhicmJsMHRzWmtUUkRE?=
 =?utf-8?B?c29KVzlwSEI5N0xkOW9ZbmpxdzdpZjdTaUFDMHIzMkJLQ1FRNXVSVEhtUXUz?=
 =?utf-8?B?KzRaR0t6S0RuRjI3TjFBSEZZalFNUFc1bmZDZE1UcStJVFIwamtxaktnYmtt?=
 =?utf-8?B?YmFzTlpZRXl2SFdlNHhOSFQyQVVVZ1Y5a2wzVG5QSnYxTE9BWk9FZ3dZSnRl?=
 =?utf-8?B?anRmRHlWUEtXSGFiSm1Ga3FaRXJTRjk4clAyOENXallVRys5cFY5QmwwSTVr?=
 =?utf-8?B?RENrcUpycGh3RGFQNjFBMnRKNEtBZnNRU0pEcStVMk1hcVRqTDIvOGo2cEpL?=
 =?utf-8?B?TzFYY242eHErbVRGSkxEeThPNzBPcDIxMHlTUzhCaVVDZXJhN3hXVlVmUnRP?=
 =?utf-8?B?aUU1OUNrUmhldVBDb3JLMjBBRDVIeCt5VGFGTHBucDI3WVhEc04zYjdwZXA2?=
 =?utf-8?B?N3hyNTlBbm9VMVhNSERTL1JUL28vbEloRVB0bUR5ZXlVRnB2RmlSU3AyZkVU?=
 =?utf-8?B?MjBIZUtvVTNvYlVwbWVYcXczTjBqanlRR010cTQ1dGJmMFpwSFQvbTQ1Rk9q?=
 =?utf-8?B?am5hdEEyaGxIaXVvWU5zcE1ua1MzV3RJTHAvRTN2ZmFjWkczaTdIUnNJU1Fm?=
 =?utf-8?B?TDN4am1idVNyUWlwbmVIWS9wOE1nM2g2dWNFVlFWUEFqQzByQUZoWXJkQ0di?=
 =?utf-8?B?VUZDSHpDNnJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVZEZjNaaTNwV3VCekkvdkJQcDQyKzk1Q0NFSC9VUGZ1M1RkWDVsTjJaVDVa?=
 =?utf-8?B?ejI1UzBTL3NZY244Z3RXekZsUENmdEFwdEprWmJ1ai9pQ2pBZlN3emZXZjZT?=
 =?utf-8?B?N3Zibk5HcFEzL2lyL3RVVDYyL3BtbXFHVmgyK3k3NHlidzE4NGcrRnpNZHFC?=
 =?utf-8?B?MUJucDhHcWJ1UjBoRmorelN6eGpCejNWUUlXalpoTkdraHBQcjBVQ084cEJl?=
 =?utf-8?B?UStYbzhIN2k0SG1FcUVvTUFKV0tLSStyRWZEOENDeHFhQTdDSTAySkVLN1Yw?=
 =?utf-8?B?QzUxOWRMWE1MOFFMSkl6d2pacnBWb21nOGpFcC9ZcmdaVVFCNWhoeml2MlZS?=
 =?utf-8?B?NWZwSm9oazRPTWhrMjQvN0cxL3FBaVZJS2I1YUJGNG1idzFvc2k4UDFkZ29J?=
 =?utf-8?B?ZlBrTlhXY29NSjBUV2VTbm8wbVZEanJnSW55b0ZkTU1BaUtPMk1MczNNMXE4?=
 =?utf-8?B?M1gxTTJWa2ZOMitrVjMwMExrQVk2MGs0LytjQjNWQms4ZTRGQmhDcy9aeHFK?=
 =?utf-8?B?SG1RbDBMVjd4SEZrdTVHN01nQVBEVUFsN2xmd2wxZFI4R1NjNHN1TndqN1Yy?=
 =?utf-8?B?b2laaFdlUENXaWpkdUVXY0JmYnJSUUNUUk5rQU9nTm8rblZRN1VVdENsUzBN?=
 =?utf-8?B?Qkw0MnVVbUFPQmR6Q2pIc0JTcVQvN0VjTmkxT08wVWNDeFV2cENyTTMwQnNY?=
 =?utf-8?B?OXFiQ1VTVWttbVlUSmtlU0U3SERNRkl3ZitMOTlsUlVScWIrUkhmWjMyN1d0?=
 =?utf-8?B?WVJlVnQ3QXRlL1c0WXVOc3I4RDljUE9GRkdvSW9JVUptL25LNXl0MUVtdG1t?=
 =?utf-8?B?bjNhTHBWcWJhV1YwNDFpUXdxM3h4WU9Ub0tkSjBLRXU0bndYYXpDYVBjUC80?=
 =?utf-8?B?RDd3MzJYMGgvTGV4MWdiUFU5WmxqUFJ3L01jOHBmQXF2a3dZa2VLakhQUW1s?=
 =?utf-8?B?VXZ1M05hU1RXNkxOWExDamJMbDhiWFJUU3FRL3NweGVkVE04cWNIV2xCZUxl?=
 =?utf-8?B?MXFVZlY5MDBwNWVaYXdwcnRueHRRQ240YmdMajR6UFBpYVROTllDdTdHTmhw?=
 =?utf-8?B?RitIMW1vYmQ4MEpqV0hRc0lTS2FGMmdyTkNGYXZSejF3T1lZWGNRNExoRzds?=
 =?utf-8?B?a1hVR3g0R1prUElRNUt3SjZMNTIrR3R3MmwvcW1WRzZOMUZQWTdXVS9nZjVp?=
 =?utf-8?B?eDArOXhyR3Jxa0lPN1YrRnRRTzlWN2tvWWNwaGM2YjhocGFEalJxRkoxL0wv?=
 =?utf-8?B?QTJlNVlNR0RwYzRCZUpGRTZNUUtYWU4yT3UwZVJCa1BRTDNXK1E5cnIzQ25O?=
 =?utf-8?B?OHRncGxKU0dNZUtLMkJZYldSUFprREtWOTVucW5KOFpUQ1A3SVZISXRtVGNy?=
 =?utf-8?B?TW5TVS9kLzZ6d1pLd2xQRk5CdHA2M290K2NnQUpzZVFhaTd2VDNOU2EybUx1?=
 =?utf-8?B?REJiVVBRZmdMWFVTbUFLWFEyOWdSR1BDRmgxVStxODFHMEx6bUxQTGtCalM4?=
 =?utf-8?B?VlQyK2tsVmFwWTJrWHZ5R2UrdkZmNlM4bG5YaHpQOHlNTFloRklWSjY1Rysw?=
 =?utf-8?B?UkZ3UnJwNkZwdjFQU1NnN3ZtOUQ2TlVEeFgyRy9laTJYb2xiZDlzeHMvL25i?=
 =?utf-8?B?VUh1S01oZndZL1lkdUUrR0pEcmd6dEFhNnNsZnFVY2Y1T0ZYUXFaeHlhcWZK?=
 =?utf-8?B?WGtqd3hwUml3OW1SM1RORTFaczBuTDlQSXNBOVRKVjJnYUoxY281MTZqaER5?=
 =?utf-8?B?Ly9hVHExeWVHYXp1NlJsaGNmNUkwV3BuNkl5K3A4dTNZQzZ0dThIL0g5OWNK?=
 =?utf-8?B?Q0l4cDVhdW9nUTVGWC9RRDZnWEZUakkxU2liUVVlL2JUVHFwWkpBUTNvRS9m?=
 =?utf-8?B?SkM3WUZBNTZYMEE4aDcxNWVySXoxcWh4MFV1c1p5MURPSTJ1Y2I4ZGxWVSsw?=
 =?utf-8?B?eko0NzlqbGcyZE9pSTZHRnF4TU1iVENQT1Fia2JRSmlCUUNEMFhxbXNqMGZ4?=
 =?utf-8?B?QXFpL0ZPUlBLTVlJSWxSWngzRXhPQktPVlNMRXlDRUhGa3JrbHRUMnZPSTBR?=
 =?utf-8?B?cVAycDFqQWNPQlMxVVdqQlhkSHlaQVZlMW9IcHI0UENrRGpiWVJmL3VsVHhC?=
 =?utf-8?Q?5tDUAQZiwaSzr0jscIosNOsi5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3340f9a-3775-4723-2c23-08dd99002765
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:13:30.1729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4/J00m2QxKmXeV4fG9Bqq7UzHA3/m3OnUOdpOXUl49/lANaVX7titUQdLduXqQ6ZsfDvEe4vtP1pzmmPAnJHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7033

From: Peng Fan <peng.fan@nxp.com>

This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.

Fixes: 7b04f98027af ("gpio: bcm-kona: make irq_chip immutable")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c3465fd82b08f83a07b0afbca7d42e7e5bdccf70..ac0c646451a549f6db4d58c2fa4aa8270c9513e9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -201,6 +201,7 @@ config GPIO_RASPBERRYPI_EXP
 config GPIO_BCM_KONA
 	bool "Broadcom Kona GPIO"
 	depends on ARCH_BCM_MOBILE || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
 	help
 	  Turn on GPIO support for Broadcom "Kona" chips.
 

-- 
2.37.1


