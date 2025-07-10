Return-Path: <linux-gpio+bounces-23089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C212FB00501
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9FA11899E40
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA077272E47;
	Thu, 10 Jul 2025 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DdL0O8mp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816E271456;
	Thu, 10 Jul 2025 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157326; cv=fail; b=ZqDVyeWcd2aQDWqeh6N7ox70p7mpzxhObcs6yhT+04l6gjnfMLeveCiFvUuYq+pLZs7Y/S9NJj1e5rvYSyiOGUT7BiCUaATX5Vnz6TtDssUAcrhNNZ/IefAkochL71YU8OSif3PYSosSQsDlAVhw3D4dmLw5XNDeTJv+ghiaz8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157326; c=relaxed/simple;
	bh=Vve7tPMStkT9JKIwF+dryuQZzkHW1DAMNACFdHpuONM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RiTdVxLnjSjCzsBVwJNrSWkzXf7F7Wj3EVqv7/TKOpLlUPYDDx76Tknh1oQ7ylRp9GIRjcdSXCw0mnbVr+3vwrqOZyKrH/BYelRLIZseJK423gpIG/yipeuJ1gMe3aDWwiQPNluoyQqQbPz4rgHRoOJB1ZduYlugHtfAGNq1Kbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DdL0O8mp; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scNs6zvyBIWsTWP0PGfVIVotsYe7inEM5y7vIQ4cdanGfUrGAoc6ijcXaI07Y5z7u5RQdkCOi8ukNzzGjlOZaNCCFVM4+vYPVXJrvVUd9O7vOWt9ieID6CNKUA20Qf1hakeUmhDD+YHESlV0F3b1xH7FGxMSZ7gNOvrHmTDkeIUMPe7ZH6OwrcdW2DsA2VuDCmMljcjA3LITig9cWTPw446AkYhTQxjYM9Bm00NSGqUA4FvrCkPY3Sk3OkhOHlHHse1pBbkagqwfiZ04ilFJqOVnm+DXQglBixrPFG32ofvVXRcOwk6VYhTNUjA3Z4vzSuWEgbmx3wevUD8dxao1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPy8bRWQyZIqKp+Xw7RjAMWPjbQuQ5IONzB5Hc40v90=;
 b=ikSczzQBFi2WYN3oun6dSfBDQa/hAO6T20jmySTd0DtnR8vM6QNVVXRK6+J6OnQiHpIgwp4JZ3lMmBgtgN2bYiCho4C0cN0lJnT+z7S8dvqfDPwcDRWrVpgJ7NSdKDChlT02NC/EFjS6HXrzyje829K/hwvTxjHNhLUg0+4/thAV4rOfRtpcAzuQgypjZ+twg7PIbIPg6vKBwIuCQB1+mUhpK/vZM9RNvfcsdRrEBfftBdZCw/26nsKKX2qvowrZo4x3qj6Nax/8/oSHHaRf3wy17N6AY1dx2nxk/0dud0yW2QjGkL+UEltMPfAAlkTL/7ph49IKN/f6mRF9aCeO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPy8bRWQyZIqKp+Xw7RjAMWPjbQuQ5IONzB5Hc40v90=;
 b=DdL0O8mphHA/9wSfhljUkuhMIl+IUdu9pfsANZ5jUBM7Z/KYIWF5tL9bji9Q8TcffZz9zn7S1orytEL1a2K8oShynxNHlNtP5qL3+dLqFij1dhnKHZLmvV6k8TroUtrNt0Yokp6eaxbuGpMFfu93X2yysVSkzQFqSbaXu3sQ80fq80nsucEPb9xG+Ze7kQPOUC7POw/HfiX9cjPMDocxcmvlzBhMvaaHD+0rXIzh0e50yawRm2EvIgr9vQ6LVaUykgYf5PM+9neQU512eNUy92eDNEbLIQjx2GWVwG5Lp1mSDETC2cQnyeJ2bO4k0mpbQs3vh27hRMJHmtssjblYAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by FRWPR04MB11282.eurprd04.prod.outlook.com (2603:10a6:d10:19e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 14:21:59 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:21:59 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	mbrugger@suse.com,
	Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com,
	lee@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	srini@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	vincent.guittot@linaro.org,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v7 00/12] gpio: siul2-s32g2: add initial GPIO driver
Date: Thu, 10 Jul 2025 17:20:23 +0300
Message-ID: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|FRWPR04MB11282:EE_
X-MS-Office365-Filtering-Correlation-Id: 694c01ee-8184-45e2-ec54-08ddbfbd21e5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDN0ZmtncjV1blhtK0RuZUp2SnUvUXk5dEVqL2pLM0kwTjJBWEtjSFZ6VXNP?=
 =?utf-8?B?ZVMxUTc1Q3ozMzZrN3FoQytBamJlL0gxaW5MWGNoRnRjeFpCT1RzNHJTRERH?=
 =?utf-8?B?bmx6eHdUeDB3bFZMWUhxSXdJcUhVOUhPRERMY21JTFJaWURucFJ4RkgySGlQ?=
 =?utf-8?B?SklBR1N2YkdkQzE0elZFR2JVRVJVd2J5REtTOWxBRFRPKytHcmVKUzhiOHFT?=
 =?utf-8?B?ZlI1dUtnN2NnYU1pMisxcWdOMkJ0V3BGQmlYVFRnbzdvaFFIMVE5RHJpNkho?=
 =?utf-8?B?aEMyMnkzeGI3VmRVY1JZbnppSytpbnFrKzYrM3VrMFFVTEtXd0NNVExPcnpy?=
 =?utf-8?B?dTYvSkZwS2tQQ1g5VUpqbHhaQi9XSFhMV285aDJXYXYyd2tCcndiVG5wRmFH?=
 =?utf-8?B?OXdWbytPTFFPWmZkRzM0WDhFNWJldFFPNXhTcE12azZGL2hmVTB5amFHVTZW?=
 =?utf-8?B?dHdLd25GeXFNL2VQRThKU3JvK3VUV0FDRjM2UEY4R002dzArbERaOFdYdEJM?=
 =?utf-8?B?bXBLNW9wQkhsNW1GR3p3L3IyZkpPdG9ScXBwU0o0d0RpSUk1dElaNnF6MVBa?=
 =?utf-8?B?aXlCVVB5cEk3OU45T2tXaVRrL2hrVnVSZkFDR3I4cmJ3dWJndFIycUtsVjdx?=
 =?utf-8?B?RkU3QkdWZzJ3eWozdXVwdTdWc29zWEJFOTZEKzYyc2p0MEw3T2wzemlzL3hT?=
 =?utf-8?B?cnVGRjVtSWJ5VGNCZnU1MTR4Z3doK00zbVBuVkxmWmJQWm0yVHpzbTZlV3RO?=
 =?utf-8?B?OVl4Umpwc1NGVHNJbFlNazNGZisyOS92OXlkMjJDaFBQVjYreCtXSXc4bU94?=
 =?utf-8?B?bzBUWVdUYXZwL3RaRVhLdUJJRENYRWg5QkNxcWdBSC9nazRpeGczcHFJT1VS?=
 =?utf-8?B?MjBIcEZINjlQdWlMaTBvMFFURHFaN3BVb1dwTExTQ1RBdmxEeGxTeU1KVXJ6?=
 =?utf-8?B?cUtBQWpTR3MxVENGcC9zYytWN0JUemR4bEdsZ3l3VGxxRSsrREVFWDB1cDE3?=
 =?utf-8?B?ODhjSHdXNlUxUVBHS0tXeXppb1FIMmhlYXpVclVwai9Iem00ZHIxMVBaS29p?=
 =?utf-8?B?cFFpRXdhZy9uTmNTWWYrbXJRY2xtY1RZSFVHL1V3TTluN1dyWkpVVU5RNkRF?=
 =?utf-8?B?b25aMTI3dmVYZ25tRHF5NG84OWcxKzc0SURCcVMva0dHdFYwc28zY0Jzb3FF?=
 =?utf-8?B?U2o4K2xQcHA2VnU4MytkOElYeEVsV2VacWtVYzhibVhlR0lDQWZtUG9ZcW42?=
 =?utf-8?B?U0EwdTNhL3liU3VQRWlSdklMVzZHNmhvUEZTTlQ0dDB3TTE4TS9lZTZnNUFi?=
 =?utf-8?B?WWJUVFppa2FkVEprTEFyL1YxT0c2dWVSR0dmcFl2Y1RIS21aVGVHNW1vaDVa?=
 =?utf-8?B?bWYyQng2NndoUE9XbStNK3MwbUQybzdwWHkrN1U3b0VNci9PVzRjOGRvVjUr?=
 =?utf-8?B?NklnVmZsUGNvTzBlb1N6ZUlhV1NGOGozZXpoWWsxeko2eCt5S3J2cGtNM0Jy?=
 =?utf-8?B?TVdPTlo0dXRqa0dadENFMlRQWit0VlVabnRMVVlrMFNwb3ZmRVVrNmdxOUVK?=
 =?utf-8?B?YVFlOXFqZnlVb2FJMS9xVEZXSGpycDQ0WGZXRDB3Y0dYZEZMQjQzY0FDV3ND?=
 =?utf-8?B?U1JjaDQ5Ujdhdm1sZnZ0dEk2RGQ0ZXNOWG5MTWRkUVpGQk1mUndLdWpYZUtX?=
 =?utf-8?B?bDNtUVZ1N3JyUVplRTRoeWxxQnRIbzFvTks4bllSMHVacmNWRHZxNmdHcHpF?=
 =?utf-8?B?YlptUEFZMk5tQ3M4Wlo2RDdscGhpTE1TN0JVeUVPRFUyckN1d1NhTEtXL3Vo?=
 =?utf-8?B?cFdhR1hpQStpYmxkZTlZd0FmOUhoZGRFcmNqRTJmd0VWem94by81NTdpU1pi?=
 =?utf-8?B?RUNKVFZBbk5Tb01NRm5VMldqVlVHdHdIWDNRc3psd2hIVDlIbDBnYzVtQW15?=
 =?utf-8?B?elkwRHJTSFIxNE5OY1hMNzkzTnhGbHhXQUFIVXRSdnByalNQcEtpVzZmNkFU?=
 =?utf-8?Q?iIir+Hg4BYP2U2PMoMRdWGhAy/5UQI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NERjWGVkMTd2UlNieDFjeXc1V0E0SHkwbU9WNlhtUGpYVDAzelVtNVQzQ3VB?=
 =?utf-8?B?aG1mSnR1V2RiaUVZeHg3QkhjSXhqMlczY1F1NTJJdTRRVWpQNFNJTnlyMCtv?=
 =?utf-8?B?ZnhEMHArS1o4a1l0TzNxRjJMd2J3VDVQVWthTnJnZlZ3bmhXZ2JiTGdDa0dO?=
 =?utf-8?B?Y2ZPVEREdFhTOXpUMXRpMjZpbnhkNWI4WmxtSWJmaXVWTm1SRStZUDVZREpi?=
 =?utf-8?B?MHpHOGNzMVUwUDNIanBYQTluZFQ4RkNKcmhIOERqVnR3RytkWDAwRStKelpQ?=
 =?utf-8?B?TllKS3VTaC9pUkJTaU1WenM0elhKdTFxaG4rV25KQ0wzaThub2ZzbDZqeENV?=
 =?utf-8?B?L1dJS3BCdUtxY1dTMk1mK3JhYWlpLytzNHJUS2pmSUhRNkdzdnRMS1Q4V3E2?=
 =?utf-8?B?NjZLOUtpZ1M4ZGZPM0gxTHdoU21hZUU3SzdoU20xa2NSRjBUZVZpS2NGczRQ?=
 =?utf-8?B?WFJZZTkrRStaeDROWFFNckNRMHJJQ3QrMVM3TWx5b0YzT3FsOXJIVkwvMEd4?=
 =?utf-8?B?T0gyWGVKclQyc2w5ams0WWRXUUZzQThQK2VwdkN1UkFuTFZ5bXNvUjFPejRZ?=
 =?utf-8?B?SGx4SnFHZ1p2Z2NCRGZnZ0svUkdoTjZvaXIrNFl3UGUxVzNBN2F6L2F6eklu?=
 =?utf-8?B?VXZhUDhCeURGSEdYUDlvKzhpaDMyeWNkNjNoV2pYY3l6MXJwUFVld09PT25u?=
 =?utf-8?B?WUVaOXJUYkZwUzFyS1E3aUZzWFhjMW1hRnA5UEdVK28yc1JnclhudjlIczJM?=
 =?utf-8?B?WGIwRytCQStVT1ovbDJVWHE5MVg1SnZtVXgwMVcyRTk2djFLb1BnWDJDcFZ4?=
 =?utf-8?B?bUJ5emM3VGZOU0ZkQWVmVEk4UUNvT0toOStjRzU1VlFzcVcvQThwUnhsY0tD?=
 =?utf-8?B?Z3FQZGhqcFJZNTQzN2ZrQ2VPSk5yMW5GZ1RBWnltZVdpMTJxWlNrR2doaTBP?=
 =?utf-8?B?a1NnQ3Z6cnVReVFoaEVSaTcrUVBSTDFmeU9OdFgrdk5GRmE1NzlIb216cnhz?=
 =?utf-8?B?ckVBbVVvU1pjNGpDcGwyVzVqNDJkRVBhU2s0L090dmNtd3plcmN6MWdVWUtt?=
 =?utf-8?B?cGRZQzNEK1JjS0xZb2FPS1BXanJlTnpXV2JVR01RK2MrcytYbG1Pa3FORFhl?=
 =?utf-8?B?MytKU0hYWFcydjhtZ0JoKzNIdVJQb3RyUERYc05ibTFLMk5IbjBwRDhpL1Fo?=
 =?utf-8?B?R3U3MlJXVHBOK0Fkalpodm5tNVA1OGlYODZZeGM0MzNvbmd6TlJyY1hLYlBD?=
 =?utf-8?B?YWluNzRKcnB2b2V2OXBGcW9wejAwY2ZSeExHUUJMZmxhdUN1b0xHMlg3MnZs?=
 =?utf-8?B?TGVQNDFkSjdBWVVWcjlUSzJPakNCc25OQkVaMERRWEUxRDBaUDhXanl6cm11?=
 =?utf-8?B?RytxZDVoN2w2UVRBRklFU0REVUJnNXJvQzIxLy9rOEFodW5JckZ1TE5PcFFE?=
 =?utf-8?B?cHJYQUFNeGNkejJFaWROTFQ0YVQ2YUx1RDdmbGN5eXpUVm81M3VScW9iSkVD?=
 =?utf-8?B?V1BOb3FQTlVWb3kxQmorclBDRndkNWJCU2pQM2NGbGNRU3psTGg3WmxQVWlh?=
 =?utf-8?B?SFFsalNRTDNDNmVkdDdxN3FJRzNlZjFXQXpuWk5ScjJncVA3b0xYN0s3dVda?=
 =?utf-8?B?bk9zRy9VSkdGTG9QbGlwTGdYa2pPN1ZKcG5ubDFqaGN0SnhseDJUYjd0Ukpt?=
 =?utf-8?B?LzE2VTJoTS9QTmwxRG1yRDY0SWt2RDBrZE9WQVByaXZNOXJMRUV2SmxMT2Uy?=
 =?utf-8?B?Q2lscHc4cTZzU3BWV1ZubVNGTW9HOVRJM2c3L0xUa2tDa2N1emxYd2pVN200?=
 =?utf-8?B?WUZZQWhxeFhVTDZPblJ3SDhiV0V4OWt2Q0o0enduYTIwVWM0SjRCbXNLeStm?=
 =?utf-8?B?eFBTU0IwWUZzd3dZMnQ5c0JwVlliWXBQaXhLbDFjd3VjVzdTeFBMc3M4Vy84?=
 =?utf-8?B?bWdkdGV2TXJobFptSE4zbDhPOWJ6NzRuUWRubjVYMG4zanI2VTYwd2p1ckY2?=
 =?utf-8?B?Q20xVFVmMFJZUTMwVjVPK3lxRVVoU0NQcEhTOGxJS1JyZ2QyYW5ZTlBLVVR0?=
 =?utf-8?B?bGM0VmNVY2hBckJoU0h4Z2FVWWxlaTNWR0FpblNDZG1DNkp1Ny9GampYTkY1?=
 =?utf-8?B?ODJOVTJ2d1FlRUlwYjQ3amVkRW5jRCtvdmV1dXdQL1A5dkVkQ0ppU3JUWXcx?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694c01ee-8184-45e2-ec54-08ddbfbd21e5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:21:59.7555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kaAtJMl12LCd3BH+nIYflHce9RoTVAssuBotBytPNPWUdsX2ZaOaucJxuIvjVD1oHnYXfQtzV2e9bPLO/HVte14wXc4AynLfRcYEQEkDuKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11282

This patch series adds support for basic GPIO
operations(set, get, direction_output/input, set_config).

There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
However, this driver exports both as a single GPIO driver.
This is because the interrupt registers are located only
in SIUL2_1, even for GPIOs that are part of SIUL2_0.

There are two gaps in the GPIO ranges:
- 102-111(inclusive) are invalid
- 123-143(inclusive) are invalid

These will be excluded via the `gpio-reserved-ranges`
property.

Writing and reading GPIO values is done via the PGPDO/PGPDI
registers(Parallel GPIO Pad Data Output/Input) which are
16 bit registers, each bit corresponding to a GPIO.

Note that the PGPDO order is similar to a big-endian grouping
of two registers:
PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.

I have other patches for this driver:
- interrupt support
- power management callbacks

which I plan to upstream after this series gets merged
in order to simplify the review process.

v7 -> v6
- fixed MAINTAINERS wrong file path
- add unevaluatedProperties, change siul2 node name, remove
  jtag_pins label in the device tree schema
- change compatible definition in schema
- change node name in dtsi
- mentioned binding deprecation in commit messages
- split mfd cell conversion commit in two: one for the
  previous refactoring, one for the mfd cell conversion
- removed Acked-by: Linus Walleij from commit:
  "pinctrl: s32: convert the driver into an mfd cell"
  because of changes to that commit
- deprecate the nxp,s32g2-siul2-pinctrl binding
- add NVMEM MFD cell for SIUL2
- made the GPIO driver not export invalid pins
  (there are some gaps 102-111, 123-143)
- removed the need for gpio-reserved-ranges
- force initialized pinctrl_desc->num_custom_params to 0

v6 -> v5
- removed description for reg in the dt-bindings and added
  maxItems
- dropped label for example in the dt-bindings
- simplified the example in the dt-bindings
- changed dt-bindings filename to nxp,s32g2-siul2.yaml
- changed title in the dt-bindings
- dropped minItmes from gpio-ranges/gpio-reserved-ranges
  and added maxItems to gpio-reserved-ranges
- added required block for -grp[0-9]$ nodes
- switch to using "" as quotes
- kernel test robot: fixed frame sizes, added description
  for reg_name, fixed typo in gpio_configs_lock, removed
  uninitialized ret variable usage
- ordered includes in nxp-siul2.c, switched to dev-err-probe
  added a mention that other commits will add nvmem functionality
  to the mfd driver
- switched spin_lock_irqsave to scoped_guard statement
- switched dev_err to dev_err_probe in pinctrl-s32cc in places
  reached during the probing part

v5 -> v4
- fixed di_div error
- fixed dt-bindings error
- added Co-developed-by tags
- added new MFD driver nxp-siul2.c
- made the old pinctrl driver an MFD cell
- added the GPIO driver in the existing SIUL2 pinctrl one
- Switch from "devm_pinctrl_register" to
  "devm_pinctrl_register_and_init"

v4 -> v3
- removed useless parentheses
- added S32G3 fallback compatible
- fixed comment alignment
- fixed dt-bindings license
- fixed modpost: "__udivdi3"
- moved MAINTAINERS entry to have the new GPIO driver
  together with other files related to S32G

v3 -> v2
- fix dt-bindings schema id
- add maxItems to gpio-ranges
- removed gpio label from dt-bindings example
- added changelog for the MAINTAINERS commit and
  added separate entry for the SIUL2 GPIO driver
- added guard(raw_spinlock_irqsave) in
  'siul2_gpio_set_direction'
- updated the description for
  'devm_platform_get_and_ioremap_resource_byname'

v2 -> v1
dt-bindings:
- changed filename to match compatible
- fixed commit messages
- removed dt-bindings unnecessary properties descriptions
- added minItems for the interrupts property
driver:
- added depends on ARCH_S32 || COMPILE_TEST to Kconfig
- added select REGMAP_MMIO to Kconfig
- remove unnecessary include
- add of_node_put after `siul2_get_gpio_pinspec`
- removed inline from function definitions
- removed match data and moved the previous platdata
  definition to the top of the file to be visible
- replace bitmap_set/clear with __clear_bit/set_bit
  and devm_bitmap_zalloc with devm_kzalloc
- switched to gpiochip_generic_request/free/config
- fixed dev_err format for size_t reported by
  kernel test robot
- add platform_get_and_ioremap_resource_byname wrapper

Andrei Stefanescu (12):
  dt-bindings: mfd: add support for the NXP SIUL2 module
  mfd: nxp-siul2: add support for NXP SIUL2
  arm64: dts: s32g: change pinctrl node into the new mfd node
  pinctrl: s32cc: small refactoring
  pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
  dt-bindings: pinctrl: deprecate SIUL2 pinctrl bindings
  pinctrl: s32g2: change the driver to also be probed as an MFD cell
  pinctrl: s32cc: implement GPIO functionality
  MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
  nvmem: s32g2_siul2: add NVMEM driver for SoC information
  MAINTAINERS: add MAINTAINER for NXP SIUL2 NVMEM cell
  pinctrl: s32cc: set num_custom_params to 0

 .../bindings/mfd/nxp,s32g2-siul2.yaml         | 163 +++++
 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |   2 +
 MAINTAINERS                                   |   3 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  48 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  48 +-
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/nxp-siul2.c                       | 414 +++++++++++
 drivers/nvmem/Kconfig                         |  10 +
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/s32g2_siul2_nvmem.c             | 232 +++++++
 drivers/pinctrl/nxp/pinctrl-s32.h             |   4 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c           | 652 ++++++++++++++----
 drivers/pinctrl/nxp/pinctrl-s32g2.c           |  32 +-
 include/linux/mfd/nxp-siul2.h                 |  55 ++
 15 files changed, 1502 insertions(+), 176 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
 create mode 100644 drivers/mfd/nxp-siul2.c
 create mode 100644 drivers/nvmem/s32g2_siul2_nvmem.c
 create mode 100644 include/linux/mfd/nxp-siul2.h

-- 
2.45.2


