Return-Path: <linux-gpio+bounces-20458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E91AC055C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 09:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 980979E2085
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 07:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AE3221FBD;
	Thu, 22 May 2025 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kDUa4HUy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B2A2236F3;
	Thu, 22 May 2025 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898022; cv=fail; b=K9N4C6oNrB/hi6FCx0uMM7I1wxwCT3+T6tOfUueYxxCPDVjDIKe4/Q5a0muy/vbdNeYJoS5KIWprhdKraZyO15mdEONx2uODB0QLNIlMOicv9mvpNwo6F5PVxQ3BaYf3Ym4Ks2rLgBB5UXVKvzUIJM9bOsqhNt5X+bOoIqEqDM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898022; c=relaxed/simple;
	bh=KyidAcdt5lkgZbjTFaioEShj9T2bPpidB4vJAVnJM/s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=akw24mgL95auEfvU/vmm6ORHewA97U2VRmWT9bI2DfZXB3g1heY1e6tomWt2Mq+gl517p8K0tDMsr6JjMa2YOlG6v0MeZI2Z0jNl4Y/StE08JpNdnXJSDiHxkB53UiK2blf4H67qnYllq6tr28HZvXGn+vot/KU99VyxymYqdk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kDUa4HUy; arc=fail smtp.client-ip=40.107.20.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vymA1yzd+pXRZOsE21r+ueovDSCA6koTsB7biMHkK5f8G1QWMqdljd16yMJ1PQT8xuve/AFj+Xee0q5eunMlMMC2Nf+m9HN7VFxyclBKtlGtuuU4z5Kr4WKeKnS/pAjii4O9XGk57WtpgNH6J9bgYOPf7LM0+L34f65geI2iJ2qw84VPjSnOPN6M89TDo+J58mTV5dsQ1S97jxqZ4eMBoBlMa6QfpxYk0WXRNyNDvPjzXZ+WYT9rzqRmnLVyZ3veM/RzlReL/PlOGNBAKsZ0WqnXrVMdpX7fMlRXLXQtR7w1fwuydY+LWr2R8PBqBtzmmvlht/PxbO7VsaNMiJE74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96nQbnZavon6lAv0HqqSslqZVZ86/Rux2gtzbGZIwtw=;
 b=tcEQgEufKN0S1oJaGoE0gfD961YwZFlQirHf2wTIC8QK24UiK8v6ZqZpnAyiD+3nJUY+qEsqGCAwkmXnzgoZ2HqppcBuIgrSwHt47BFPYWxl6iHEq2BoGDhmd3R1I3ObyJWUGrf7WCqToAqFMPO/tgZDCxsmHnWAFJdIx3zlVe+HPXBgrbVG7ZjgrOdJ7WOC+ZMlALaO9CQQkY4aNN2Z3fGU+uJNpeeJZJEDQjHGvlYcWQ+cOpO8D8HTLm4DiaNJODicwRqKbjvJ/veHxZloRBQRjnh8XCzwYxo+r+8azRIKk6XKdeAnYT7OsCnq/za9ZfrsGTzEoOiOZlAL1TkN2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96nQbnZavon6lAv0HqqSslqZVZ86/Rux2gtzbGZIwtw=;
 b=kDUa4HUy7oHOvnolsDEYlpJBVxO5gXie1ipNnbfDHB6m73UW7Kdr2qYG8q8eFKlFHvZBax23VWcCGflwWqfoxFoB6o99eteBlBt1qkZU3rCg4y0C11IQSgt2gNNKk6jmG4oquAFB/6n98tW16gLj/D37bZKRl3WHwlaQbAfbh9i4aCIGoDsvg1peL6XJVN09Q6UDvwndTDhweLdBuYpeEvaW5SkADziWe+3gVM136worj+38QradIWyhiWGmiM6UVjOZaq4isael72Tzwwr2sPiOSMUHXdVttrMwFmZ1KpCo57zJgTNt/fmxpnwdZ4U5+FfWkRuYXxmAXZVhelQT6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7033.eurprd04.prod.outlook.com (2603:10a6:10:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 07:13:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 07:13:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 May 2025 15:11:52 +0800
Subject: [PATCH 3/4] gpio: lpc18xx: select GPIOLIB_IRQCHIP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-gpio-fix-v1-3-98ceae7c4c3c@nxp.com>
References: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
In-Reply-To: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747897924; l=821;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=X7DK6ubLhCuMU6sc1mTWZC6wfNFpKQMsBlkG5RBvIn0=;
 b=QnwTF2NvoJOY3ZrD3sqtcMXcHo+KTXm9GBwq+1AD2fByGAEKfD6nFAsYOpoJH1+AltEZNpX/Q
 xPxBj2LBRUBAKz7VEw9ACuDgsNhzzAfilgec4oC6+lOp0F/YJE3rrl2
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
X-MS-Office365-Filtering-Correlation-Id: c5379fa8-cf76-44ea-2856-08dd99002a7d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVBobU9peW9FN09VNkJTMlJLL3Nrcm9pOWdtanNXSTN6ZUlGckxNUU5HNVRN?=
 =?utf-8?B?WEhIdU9PeEovNDBGK3BkTjRrM2MzbVlLMzMvbXZ3RFVHYWhmcGxjZUY2ZWZC?=
 =?utf-8?B?RDcrdmh4VjFESVU3NHI3b1VzK1Y2NmRzVDd3WTFqWXVRV1NxZUhHTGJiTHBK?=
 =?utf-8?B?OFVVU09iOWxCT1JZeTlYZUpucWtrS3ArUURSUG1ZVVlTOFZNMGxQTkpoMmxF?=
 =?utf-8?B?K28vbEFhZHBNN0JCWC9VUmxhYWJySllzNGNZS3BCdnRydlNYWGlMYUJJTzJp?=
 =?utf-8?B?U1hLRkpXaWJRb05KRGNhRzZ5NmVPTldXdVRkSVh3cVdpcTRYaDkrYTVkNE00?=
 =?utf-8?B?a1d3QituU0FhUkhoMzRvYUU3c1cxZXE0ZmF4cHpzQXp5UGZCa2hCWVFpeXBv?=
 =?utf-8?B?VHVsZmNMcmpFTHB6WGpna3greEF0NWY5YjJQZE9yR2hIVWsySldTalE0RkNG?=
 =?utf-8?B?ZXc2SWMwWjIzY1FnSFhRMVliOVB4dEhaSG1zV0RGam95WC9UVk4xNytIZVMy?=
 =?utf-8?B?ZVcyMDladkpwNVAvTW82aTc4ZG5HdzlqWERML3U2N1dJVFZvU0hJUUVEVitR?=
 =?utf-8?B?S1ZTaFB5TXVNc1B6T1paZXRJYy9za1BrS2g2YmRudjRINFhmaGVMTW50Qm9o?=
 =?utf-8?B?eHZYSHVnY1FHRzZBbmhoWVlUcTJhTldETGIzK0FLejlkUnhDYk9aREpOekU3?=
 =?utf-8?B?SUQxejVGSGM2WUQxSDYzSmdmUit2TEVjMVljZlFyRFJCSXlTSkNSRW96c2lJ?=
 =?utf-8?B?eGgwNlZ4OE52RWhZRWJnN2czVWRSTXk0TktBcG1ReWtrRVIxb1UvYVZ6cXgz?=
 =?utf-8?B?WTEvTkM2ellxMWpNT3BJK3BPZDMwdHpwSjl3QVlFdFVpd2VuWWZOLzNUSGxl?=
 =?utf-8?B?cHhFQS9XYkI3ckgzZWV2SWNJdEFMaXE2QTRxVkJaVkxuWFJTR3VUM0FYeXFs?=
 =?utf-8?B?VzFKZ21TcDZ1aWxUNk0vMGtQUytiOEpsVW9yR2xSVjlueFZlYlA3RHBkTldp?=
 =?utf-8?B?VkgwMHBQYjUzaDhDdzl5bTJ2SERSQk9rZGVFa2JKQSt3SGJRSXRHOHlXUHRX?=
 =?utf-8?B?UGxaZ2U1N0pqZExQSnk4WWxZUi9DOWNDcWhDOG9teUFrRDRJZHIvbWt4YTZu?=
 =?utf-8?B?Nzhnci9EeEp4N3FwMkJDVEVZTFlZcGNUNWgrSE5NdFdaeStkVlduKzFZUlE1?=
 =?utf-8?B?QW5iNXVyd0RDbU1PSTc2RkdFKzZRTWpmZHFiejdmSXEyZ1VuQzhTY1c5QjBS?=
 =?utf-8?B?RlBKckduRU1KaXFPNGdiMHoxUm9RWXIrK0dKRmtVMi9FTFFkbFNnTHR6enNK?=
 =?utf-8?B?RjFpYnNGS3dlRmhkTDNhUXBhc0IyWHRTMkI2NDFtZWIvTUtLdERLb0RlZTkz?=
 =?utf-8?B?WllUbVdydHNGL2o2MERXMWZCeXlsL2ExWkhQMzdnb0svK1NGTXZvdGZyQTZR?=
 =?utf-8?B?YXdOZ3JLVUhaOTRaQzhmL3c5OCtkWnRwYWpxcUN4Nlc0MkpxSVhuck9KZS9F?=
 =?utf-8?B?cTdPaWpiK2s2eWJRL1ZtelZTcWtiUDJJKyt0MWhTaXNPV3BWRXlySE5KTW9n?=
 =?utf-8?B?aC9jR3FGeXA3VmFmVytMZmhvZHNpVHdyYnN2OUhsV0l2Tk1RL1BGSDhzYlBt?=
 =?utf-8?B?b1RLUzhFc0x4empXMFdLYzM2RXBsS0JRQUVmZk9tM2w4b3B0OTBrWmhoZXo1?=
 =?utf-8?B?aHArS1Z5SVRLRGU1UnJGenFSekhUUEFvN3pYQ0xlOVJWSEQzNlAyRm1RWTRS?=
 =?utf-8?B?SWRPM201RWJnVG9jODBON2U3eCsyOGxxQ2R6Z2taMG4yeUtQMWdjbW9XRkg1?=
 =?utf-8?B?ZVREVmhnTGVoTTRNYnQrWlljd09GRFhubG5QNmlyUUNGWldVTldIUjNUQk5r?=
 =?utf-8?B?ZkM0aVpxTlhsTWNIZlZoaE5ETVZkeTRzQm9RTjFOcThwVEs1MVpmM2R0TG9l?=
 =?utf-8?B?ZmRWUUdSbm9xaFJSYWU0eUN6WDU2S0Qrb2J4UEN2MU5RcVlydUMvSEFmelVv?=
 =?utf-8?B?QjJWYUVWZzBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emIxU2xzQUJHck5VUTVxWWxyOEhScytsZU9JRk5LbExWVS9OYk9MeXZXVWZl?=
 =?utf-8?B?VWxhTnlQdm9DMTFIY1YzckVYSjMyWlFraEc1QzAyZmljQSt5WFc0bUgraFpY?=
 =?utf-8?B?SUtiTTVBaVJMSndEc0k1L21icmRtamVYSzRLc0Job09nVkhvUGx4d3Y1endB?=
 =?utf-8?B?cFo4eE5Sa1R6bUczRnExbGxOa2d6MjBKL2IraTlLQlpGREZHM0wxc2x0ZXA3?=
 =?utf-8?B?M0p1NTZzUlNFMVpPRmx1Sm9EaDF0M2dwSVhmcmtFREMwZ1dxSHhwTjdMZHpX?=
 =?utf-8?B?Q1JMMTh5ZWdWaVF5Nnp6RFlhTkdvQlpiQkJlcjkrVGY0dGdpY2E0N0xJeW1Z?=
 =?utf-8?B?SzlJOFgzRVVKeUNpZ29FMjg0cExsQ3lkNjBRSVhXSURZd1NCRFNjbUx1dXdY?=
 =?utf-8?B?T2NFNUhtWjV6bHhSakVaYVNyREErMEFHaitSSFlyVWQzWVZ3MFRwNGhSdlVN?=
 =?utf-8?B?VzhwRjZuZ0EyTGRjYlZQOEphT3FpaDNCTjVNRVNRNW05QjFDdTFMYzhqdHRz?=
 =?utf-8?B?OU1LV1ZZclM5ZGdBRFNEME0xMHZrdGVOVldETHY2c3FMYVpIL0dwV2o2QTN0?=
 =?utf-8?B?K3lSK1BlQ2l1Q2UxM2ZXenVhK0pXR3FXMFFLRzU5RjZnalFaNm1USTlYaW9y?=
 =?utf-8?B?Y2N6RzhoWjN4Zm5ZQkZHZ2RxM1N6NW11V0p5VVBmT2NUdjBMSlJVQnpLRHUz?=
 =?utf-8?B?amNPUUhtVTRUeTBjdEtpd2hMU2RCTXZYaVE5QS8vYWFvL1E0WDZrdUU5TVM2?=
 =?utf-8?B?elQ5R1ZZS1pBbGR2bEFhWEYyd0ZmTnBOWE9pVG92eWIyZkxIME5uUmlJS1gv?=
 =?utf-8?B?ejJackRIMzJKQ21BREVteEVPdjY4R2pwRHJtMGRTaGNGYUQ0Y3l3enZEUVJU?=
 =?utf-8?B?WDRsWUxtcUN4WCt3UlJwcDIzZ2NUTjJjdlBzNk5BdlZRYUZ0cHlOcENWL0Jx?=
 =?utf-8?B?NFdIY0VabVV1cGVCdWJONzNGUWY4c2ZYeWQ0OHFyWnpmRTluQzhOZXI0L0xs?=
 =?utf-8?B?eElsOGh6WnNwU2JaY0xKMkV6NzUvRjErWXhJNm1wQ1l4dktYMExEQXljbzh1?=
 =?utf-8?B?WUVhaDFaMW5jNm9peWZVRkN0TlY2NXJsTU9sNVg0RDdTSFI4VjZoTElLM3NU?=
 =?utf-8?B?UjB1aHRKclJFSGp0RHV1MTBhUW8zUXNrZm5OVWY1NVhUYktXS0pLZG1uOXFy?=
 =?utf-8?B?ZEhaa012Q1JBaUltaU02Z3Y5c21jUUs0b0x1NW4zQktUVHdSVWN0TnBjWVla?=
 =?utf-8?B?OWZEcEp5M3IwbGlKTDM0dUN0Y0Z0OTl2eW53MEZUSzFDc0d3eGxvV1BGNisw?=
 =?utf-8?B?aXEwUWk2QVVOeFBCdncycnBWRTZ2UzliTldhWGZrWkI4dnl1VjR2YXZpZ1Fu?=
 =?utf-8?B?TXFqQlFINm02SUJaYXNyVjM5b1pPVkZsZHhDU3FqQ3R1c2kvVXVidWVSeTgx?=
 =?utf-8?B?V1hidkxSem05cVlyNWF1cnNFTTJqdjU0VEN3ZTN1Z0dXQldJdFNMTUlCdlBC?=
 =?utf-8?B?SktZWWZHVStaTTBjUmllQ1AzYXkvK2dES3pzR3k4WFpnY01BMndhd2F4cVdy?=
 =?utf-8?B?VFRzUFpTZ1lIWjFEVlpaUFRBQU5ReldEL1ZHVWVNL0F1STBLMXZML0VtRDhU?=
 =?utf-8?B?SGZyMW5TZUxwZ2FIYzdaakV4dDI4R2dtUis4MkUxVnRwUHdib2JQc3JBQTRM?=
 =?utf-8?B?a2RuUUtrejFjRzNtbnZ6S3o2VGNxbHBrRjdJZkZGOTBuVDVzZnRLb1JXbEdW?=
 =?utf-8?B?WUdsNVQzRFNZbE5BRy9uTmdWdmtOZG56Z0Z6OGNXUlJvTW1QZ1lwZ3FBVHhH?=
 =?utf-8?B?aXhkZGtkMkhKbkNYdFprY1VZbXVkbVVwMmhia0k4OGVrWFZ0cUZTdTZYaHJ6?=
 =?utf-8?B?c2taZnBqcENxeE1mKzBGTmlqMGZSelptL0RweDJWb1ZVVVZ0NnMxT2tFR3ky?=
 =?utf-8?B?cEhxLzZYd083VElheDJzellCeTdhK0lReldRazN2dU91SVZSUkFIankyaTk1?=
 =?utf-8?B?MXdlL2lLWUtUVzFJaHR4VWk1dFRWby9CWHFCVFRYeXltTEpPZlMzL0h6TzJh?=
 =?utf-8?B?RlA3dU5XS3oyRXNGbmVHby96d2pzczZHNkhaK3J0R3luQ2xQbWpoNHhqdWNN?=
 =?utf-8?Q?WhT3Z+bWMYcYqq6aMSt6v1mW9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5379fa8-cf76-44ea-2856-08dd99002a7d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:13:35.1737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrQa+cspUeCFsYipskfMUwap/fxPMOJnW6F28EZm/d1u4ViM0FWlqQlVKn0JZ0HhcFMMWiDSlIy2lDXKg2K6lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7033

From: Peng Fan <peng.fan@nxp.com>

This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.

Fixes: 289e42df1358 ("gpio: lpc18xx: Make irq_chip immutable")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 2ff53b00cf7c956acc9d995e4cf07da1587a4035..c75fc8fc7bb23088a4f15d61d4b40172a41ae078 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -438,6 +438,7 @@ config GPIO_LPC18XX
 	default y if ARCH_LPC18XX
 	depends on OF_GPIO && (ARCH_LPC18XX || COMPILE_TEST)
 	select IRQ_DOMAIN_HIERARCHY
+	select GPIOLIB_IRQCHIP
 	help
 	  Select this option to enable GPIO driver for
 	  NXP LPC18XX/43XX devices.

-- 
2.37.1


