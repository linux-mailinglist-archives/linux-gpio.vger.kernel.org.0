Return-Path: <linux-gpio+bounces-19808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D91ECAB0952
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 06:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C22A4C58BC
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 04:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB40C2627E9;
	Fri,  9 May 2025 04:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YAfa6Q2a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234A243AA1;
	Fri,  9 May 2025 04:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766027; cv=fail; b=TnUiCuU8vNtTFgtyawN/w37U2O48Rw8L+vCL4JLyCg+MDNdVsXvzk35gpWVEpidP5oh/1/y7Z7IA9Wa05kymRaKaPK/RdbxBq7KeNQ5kNGp/bH410p7XxPf1Lx+ozyUmcp6cTiAPA3k8zI3jfkpvVmxlP1aL6OF8ZTAc/AXFa3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766027; c=relaxed/simple;
	bh=BDzsK/lCjVK3Nz6lVoD7YFhbnpbGz/3/K89WJGoa50I=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=EHs0AkLnEVdEvtBiG3cSrd85sv2EHS787gGVluMm4RiSCiia/hd4ti0zmL2RkiMB01XMFXYiin/uo81qYN2pJvxgyK7EMvW4DPXaI25kNp/l6fxaSfOrU3A+DgwBdpRqBTcEIUYqjUZyJOkLc2s+2bdTq+iswWACqsNi4Y5YVSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YAfa6Q2a; arc=fail smtp.client-ip=40.107.247.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ja3dOpeacYRcViatqax0f08rIMsickkSgFIEMGf/pmAIW9tI0+Slq3K2joW58CJEuJImQ15dfWFEradCSbYyphQeraHHNlnPxdwJgoBgRxZabCIBf/KS4JuXxlNklGoCHzBZyi8Ppim1m1BnksR1we6x0coaVkqW/NubLR4rRK8ulkh0bKg0ZuL3l2k2Rh1P/NnFCRjHC9RWivT3HnPOve4zufZDbXDFyoKNkX1eklDzpyJ3k+l+RW8BzHPCc725mJ6ZTh0NenDAQ19WuCRCJcFKxxBcadHdnRVnTIroo5YA4RzTuQGrDqb0Ftp1INbWDskb9kBmnrGEH6cwxEm2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV69HreAF+IbbtEQFyH9Gm5Lbi82FJGcSPox10U52WU=;
 b=B1MbvHuF3Yt/DK/zmxCnwCxxFoZDutM1NVQfWfCukAPvISEei7081WRXjkTgZjRLK092Oz2jVEN3qI28+3ptiBUnQ22TSrbIpfV5XqKqiSawlwFgpFh2QSlVzzDCMaWAa8I7nM0kMZUdAHHhz7bV5LbJCBD7eTPKwaBNgc5T1qjYKzyq3vrlsJtxpqMwJQNBasLXfX7AaYF3o2t8p032vLCsvJkhjGUHOyU5Ifc6QhpK/dRY6LN9oc/ncXXDB+0JMgenOisaucTo6IybCV/olFAq4Os9ZFrQOPNtx8t1H+G7TFDC9cLWjWymGJBtrWGLsVCYimJq16rnNR1xlh1NAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV69HreAF+IbbtEQFyH9Gm5Lbi82FJGcSPox10U52WU=;
 b=YAfa6Q2aVFtBznHpg2Duf6tRP6c99D4E8j7oTn0FeKte1j0ygJWVe3UGx6j7YN+WRYWXu+XQA/7s5/3j9vG1KdWC45kZ19N85ZnM1J6kXZEW6MOz8iovbSlcOJSuR7VHDTXbLxObns6LONlvmgGSQqp/xwPPQKl8AS9T/F35lbgCpHlDOSPxtLD90DXxw/95mohA2/Ufgg9CLwdMQ5o6fCkJqnMWGefGGScK2diHS5x6yh/zKIhaC4TZoaNSqXqCoa7j0f7LoluHksVh25HbuEH76uwF5Vig0TQoZ+nKzlnp5UFZv7OxSJAT8s8+yxwiFyuMtLH1EJHe8fWVPvyXdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 04:47:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 04:47:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH RFC 0/9] gpio: make irq_chip immutable
Date: Fri, 09 May 2025 12:45:31 +0800
Message-Id: <20250509-gpio-v1-0-639377c98288@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGuIHWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUwNL3fSCzHzdZAPLRBPLVEtzo6REJaDSgqLUtMwKsDHRSkFuzkqxtbU
 A5MsGA1sAAAA=
X-Change-ID: 20250509-gpio-c09a49e972ba
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Keerthy <j-keerthy@ti.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746765944; l=2264;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=BDzsK/lCjVK3Nz6lVoD7YFhbnpbGz/3/K89WJGoa50I=;
 b=i8rvj4HCuoCfYM18r6gsZdcurboF80HsfJcxhsTD3c4/dgjLYwvIB15L33Tl0CMLaWGGpJVXg
 Q/ziCC1MBgwACuyaYhLorlWgSKd1ZjXJ7WJVZmhdwPWfWo0+lugsMKk
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 9147e4c3-687f-4378-eb29-08dd8eb4898a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjNhd3RIOGdPZUxjU2o1cWdSUm9JNUt6WEp1TFV5VzF1S29hWmZOMlphdVdo?=
 =?utf-8?B?Rlh2MzFyOG0xLzk4ejVZWEJuM1g4UGhySGxGQkJLR1J5dEltQWZWSXVIZ2xV?=
 =?utf-8?B?cWVNUUFxSzBPbUg5czFoZHB3MFNIVnlJRjRjYVpHUnNFSXpFZk9WR0N4YlZT?=
 =?utf-8?B?MkdJVmNOVk1MdjlQL1FoSS9Ccm0zdEIwdWZFOFpRM2N4N0EycytFcmg5ckdK?=
 =?utf-8?B?M29MNGtiQ2hMczlxaTRjN1VMcCtPdWJ4SGlma1FHUGpCaTUzNlV5TlkwVmhL?=
 =?utf-8?B?ZmMxeWdMQ2R0QkFKQ3l6cGRPWEc5VDhubERGbTd5bkQySlNrR3puMVRMNnp2?=
 =?utf-8?B?UHNmWGs0b2xrZWF6TEtnbnJJYk9kTDN1VDh3T3MyNlp0aWc1TWYvSVY3SzRM?=
 =?utf-8?B?aTRTelk5SCtoTXJjTUtCZkFXZ3lNWkwwenhOR2dCRGhTZjZMajdrMHB6cGkr?=
 =?utf-8?B?RUMwVitUZ0F4R2V1UGpFZFVRTWRxOE1qUVRCMkFJZ21OMTFiKzVaZDQ1V2sz?=
 =?utf-8?B?RytKOWE2dVExMzkyTnZZaFMyNmhzZ2tudTFGaVdvODJ0YUhQaVBKRzVuaEdZ?=
 =?utf-8?B?b1hVSHErbXI3WHFvU0FuNFdHRnVkQmNGalFqYlhUMTNISDZaeUkvM1J4QjZS?=
 =?utf-8?B?THNBQXAyelFwR29RV0Vta0k0NjU3MVBHOUkxZmVtQ2pzanJhUUhwd1d3ZHlJ?=
 =?utf-8?B?UFNkNjlZeXIrMDlSWHByNURwWDRhci9zckw3OW1lYm1nMEN2cTdtOUhhWW1H?=
 =?utf-8?B?aWVIeVFJWUUrTEF5K0tXek56dm5QSFNqRSt2ZGl3VU1uakFLZll3TkFKVzlB?=
 =?utf-8?B?U0p1RWRKa1Jxc1g4RmJBTmJ0UjJ4Q2ErcUJZR043a09SVkRyeDFiaksybURT?=
 =?utf-8?B?U250L0Nib2RyWVNLbzA5Q1UvMitMMGgzR0VGWEY4K1VoMnE4NzNCUk5sL0pU?=
 =?utf-8?B?b1dlV0gyQ3c4d09CaXdNWUZwaGE4czhqRE1DNW8ySkFYTXZ4elZEMUxTSHh0?=
 =?utf-8?B?M1oyNEp6Q2RsZkVmM3d6MUh5OVNqMVhBRnQ3a3RRQ05ITThXd3Y2bGRpVnFj?=
 =?utf-8?B?NlA1V3pqRkNvU25oSmhpMFNNUkxXOXo3dzZITGZOOVk0elcyQTlhendkd0Jm?=
 =?utf-8?B?NC8ybW1RWWZtRnV2eVJtRHB6dlpxSmhobGxTakxqWGEzWUtaUTRwYWs2UWhi?=
 =?utf-8?B?RDR5NnBDSnJZSmVrSVBxUnNjdXpGbFZnMk9zV1V0SGc3NkU2Ti83ODZweXlG?=
 =?utf-8?B?dzFkd2NWYzV0MlZDZnoySllTVVovMTgrUXROaXlGWDAwY1V1ZjJDYjVOamFm?=
 =?utf-8?B?VGhsbm9Cb2tsT3RhajF0NHlMSkpDS2FueXFjR1hHM1dYSThEd1gzT3dLN242?=
 =?utf-8?B?OUxBK2VZdjVDTlFSU2l6ZExlMDI2Z0gvZlhqaVI4SGFLbFdlZ1BaTmp6TGpB?=
 =?utf-8?B?WkhXOWJWVm5aL2xmRFErQldwdGVhSDlsaDJERitwNklEWnFjMlJWUG5ER0li?=
 =?utf-8?B?eDVuQ3Jkb2RSWUN0WDFyYzRDMmhaS3JIMjN2YWlta3ZRU21VYmlKaGlrRDVq?=
 =?utf-8?B?bTVrUENON2xYQWh3bVhpV1lxVXYxSGVjV25hSVhpRlpsa1JSTjdYYXI4SUVz?=
 =?utf-8?B?dGxmSmptNTZrTkdxOFdjR0tyUU85dTZpQkU0eXoyWmgxemFiMk1Udjg0Undk?=
 =?utf-8?B?QWlFcHorbGlFc1pZbElQTUJCeVNuMmJsQWZLcHExekpSeEx1YzlrbjZyeUFs?=
 =?utf-8?B?d0NrbFhwNjhUb3FDdDBWalBteDRGQXRPdmdkYVFLdjQ2T0d6anZGWDl4ZFB1?=
 =?utf-8?B?aHN6TU5vdE8wMzJSNjRRN2YvbXBLS1RHZWZHbHY5SEoyNkNqMlFmUythQ25q?=
 =?utf-8?B?M09VaVNaTWlPRTdkWFJKN0N2cVZTRTJ3UEhJcGRkU1RUM2hRQm11aHFBQldO?=
 =?utf-8?B?WGJOMUp4VEtpZEpmckllR2oweU5QMjgwZVNSUmdXbHRldUVSSGZXZlRDeHkw?=
 =?utf-8?B?V3JMTmd3SDNmMnMyaHB4cWZwSWpSN3BSYzVoSnpSTUJUOUNrZk1zTmxtN0lV?=
 =?utf-8?Q?yqnvlF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjBZV3N1Ty9lVU9CVERtcy9mSzhQV3dpcnJKS2dyY1BrT0hmL1gwYlhwL015?=
 =?utf-8?B?OXF2b04vOUhJVXJiYS8yN3hCdmZaSVFYNy9sRTJNU1VIMGtTay9keDRobkll?=
 =?utf-8?B?RlA3S3pwNzRTNlg5RWpPMS9uRWVhUTBSbWlBTHFPNGlLN3gyLzZKZlJueVI1?=
 =?utf-8?B?WGJEdXNjaThoTFE5eDE1YllYUnhJbGI2MXh2a2hOR3NURFp3U0E1THN5ZXBj?=
 =?utf-8?B?M2Y0ZmRQdXRaYi8wTTFvWmp4ekRCTGVXQzIxZ3pNSUtnQUJYZjhsaGs5aExL?=
 =?utf-8?B?RGtxYkZmd2lCSHhhODZYcEpEK0lkbXFjRU8wS2czdFQ5aGIyQ0Q1MTl4OGFt?=
 =?utf-8?B?S0Q0V01qbDVQeC9hR29nY2tsTmJTNklpRVpZT0hQWU1SOXhGT1ZQenZxVmNi?=
 =?utf-8?B?eElZZ3l5d0pHMFpxWXB4TTFFNGpPSEI4L0lWN01XbjdmV29pa3Fmck4vdzhn?=
 =?utf-8?B?N29zb0dFTmFKYkhqSDQrenFGRm95aWpNT29yVWtmNlNta25NMnJaaWtWTEU3?=
 =?utf-8?B?dEgrQVFKQ1QzNkU0c1NqQ2VCTTZTWHZRNEZyWTZOTUh1RWVWOUpBcVZrWVBZ?=
 =?utf-8?B?UnVRbWI5c0w2dFg1VjRWRlBpWFVFWGI0ZExLSmhlWHJTTE02S2NlUGxmMTJj?=
 =?utf-8?B?U2JwTWc4aWlMRDB0aWN3RTRTOEZuSWw1bUxST2hFQjVlRi9HV0g4Vzk3SGxa?=
 =?utf-8?B?cUZlM2JvVFFVYzJCVFJCRlBiU2w1cnMrS2hidExDcHU4TDM5UHNzOUxGQUJh?=
 =?utf-8?B?UXRSaTlGanhXK2lyNUVlbHdKdUl6cER1NHpjMlNocnpwUUY4OTZqZVJISGJI?=
 =?utf-8?B?V2hqaGs2T21wOFArUGF3RzVRdmRLL3RaZjIwSmw2OWsralBhWVdLLzk4OEs1?=
 =?utf-8?B?czJiNG5BR1hYdjhBODlXeU9GTkpPTmttNEV5MFRFajMrMCthTndoMExQaFky?=
 =?utf-8?B?TmpPWi9PbzVGbXJnMkxZSjlqNHlPRitCbVpUNFJBMlB6M0QxZUhRckhibERi?=
 =?utf-8?B?cWJCaEtTbXRVL0xKZlpDTU90NkxnZ2tXMW9IQkY0UkdoZkhQK2tMc0JRUEps?=
 =?utf-8?B?M0RZMXd3Uk9GQW4wMGlJOGg1NFNqWXpaSTNUL25Xakg4SktNNlBlL1VnejJK?=
 =?utf-8?B?L3pYWnlYNUxhdVVDMnQyYVY2MVdMY0FaS1NhaTF4NTVPYVp3SWFlNVE3aVhT?=
 =?utf-8?B?cGtkQ0hnclQxTXl4djNWYnAzVjVTV0xuSkJlaFBtRmUwZDVaYVd1RlpOb2ww?=
 =?utf-8?B?dVpYYnZ2S0ZhVjZmVjhzWmplQi93Q0s2UGMrb0c5b0FQUzZNVE90ZVozeGMw?=
 =?utf-8?B?ZVM0aS9zY1g2aXVnTVcvd0YxMU0rdXBFQnkzcUhCSC9URHJDMmNhSmp6aUxs?=
 =?utf-8?B?R2dGSnRNdlpGVlRsM0lwR1VnaUg5UkYyQm5ENUllR0ZNMzF3ZVNNNEFoZHhO?=
 =?utf-8?B?V0pyYlRIOGp0MlMyUHoyOUVKQWkrRnlFZFlGVU1Nc2lmQXB0cWx6MVRBUENE?=
 =?utf-8?B?Q1VCb25RT3M5WmRlcVBnN2JlTU4rRjFYaUdLNmxOQXhiR1E3cHIybm84OENo?=
 =?utf-8?B?UHhObXU3aFVxUDMrSzQ0N1Evc2Z5ZmVMSFBOeWM3SyswejQwakhJY2NRa1Fn?=
 =?utf-8?B?UVFZRDBPRUpSWXFDdzBWZUlISDBaQ1BlQnpVbXdpbU9ub1JSeVYvQ2UwdmdX?=
 =?utf-8?B?dXJIL0NoeE1yUjNmVHFNV1NKa3VJbUgraUVqWjJvNHpxZC9aT2xZeURhVHE5?=
 =?utf-8?B?d2lXQ0Y5eFk4UFhTSUw3Nno2NXhZTHA2cXIwc1dlUC94SDI2QVdmMllwUnRu?=
 =?utf-8?B?a1FOb2NHOWREZG5UdHBNK0FhN3ZrZ2p5bTl2b3NIMEVyb3o4UGdhVWg2U3V1?=
 =?utf-8?B?cGdxM2RRVTl6RzVrYWVKZWM5UTR6Yk5PNUl4aGhMdmswQ0lHYlluRFNhSjRD?=
 =?utf-8?B?cm9mR1lxNExFT0RKa0xyUmhmMm9GUUVpL01hWVhkVXBtVjI1RE1lS1lWRWJL?=
 =?utf-8?B?V0ViQS9sNmRibTdocW5WYzNVREd5RkF2dVZlM0hmNUU2YnZ5SGJhWVpTRVRs?=
 =?utf-8?B?T2YyVXBjNkJ5MTFXd1drc2w3S0FORzRpS3grb0grcWdBR2I1cjZrY296c2sw?=
 =?utf-8?Q?igJATZxpiUQXVgWwvKZ8ggYKY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9147e4c3-687f-4378-eb29-08dd8eb4898a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:47:01.0933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GE4PUIABpQ9ulAtitJGwzcZBG+CtnsUZrqsneKI1eaNTGxzBVoOPNul/X6RjqdkAXlfTPA/+OvhbEmtpSPCV4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

This might be a bit late to post this patchset, since it is almost rc6,
but no rush here. Not expect this patchset be in 6.16.

This is an effort to make irq_chip immutable to elimnate the kernel
warning "not an immutable chip, please consider fixing!"

The major changes 
- add "gpiochip_disable_irq(gc, hwirq)" to end of mask hook
- add "gpiochip_enable_irq(gc, hwirq)" to start of unmask hook
- add IMMUTABLE flag
- add GPIOCHIP_IRQ_RESOURCE_HELPERS

For davinci, two patches are made, 1st is to update irq chip data, 2nd
make irq_chip immutable.
For xgene-sb, two functions are added, because previous driver directly
use irq_chip_unmask_parent and irq_chip_mask_parent.

In some patches, I use irqd_to_hwirq(d) to get hwirq; in others, I
direclty use d->hwirq to align with previous code.

Some Kconfig entries do not select GPILIB_IRQCHIP, but I tried
to build pxa_defconfig lpc18xx_defconfig and multi_v7_defconfig,
GPIOLIB_IRQCHIP is y.
Not sure we should select GPIOLIB_IRQCHIP for them, because if
deselect GPIOLIB_IRQCHIP, there will be build failure.

I not have platform to test the code, just best effort to do this
patchset.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (9):
      gpio: bcm-kona: make irq_chip immutable
      gpio: grgpio: Make irq_chip immutable
      gpio: lpc18xx: Make irq_chip immutable
      gpio: mpc8xxx: Make irq_chip immutable
      gpio: davinci: Update irq chip data
      gpio: davinci: Make irq_chip immutable
      gpio: xgene-sb: Make irq_chip immutable
      gpio: timberdale: Make irq_chip immutable
      gpio: pxa: Make irq_chip immutable

 drivers/gpio/gpio-bcm-kona.c   |  1 +
 drivers/gpio/gpio-davinci.c    | 29 ++++++++++++++---------------
 drivers/gpio/gpio-grgpio.c     |  7 ++++++-
 drivers/gpio/gpio-lpc18xx.c    | 13 +++++++++++--
 drivers/gpio/gpio-mpc8xxx.c    |  8 ++++++++
 drivers/gpio/gpio-pxa.c        |  8 +++++++-
 drivers/gpio/gpio-timberdale.c | 10 +++++++++-
 drivers/gpio/gpio-xgene-sb.c   | 26 +++++++++++++++++++++++---
 8 files changed, 79 insertions(+), 23 deletions(-)
---
base-commit: f48887a98b78880b7711aca311fbbbcaad6c4e3b
change-id: 20250509-gpio-c09a49e972ba

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


