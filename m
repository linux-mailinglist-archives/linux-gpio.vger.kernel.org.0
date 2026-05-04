Return-Path: <linux-gpio+bounces-36100-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OkPE2c0+WkG6gIAu9opvQ
	(envelope-from <linux-gpio+bounces-36100-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 02:05:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 702B84C5198
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 02:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6BB7303B736
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 23:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9D83F1649;
	Mon,  4 May 2026 23:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XpYPuk2R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013034.outbound.protection.outlook.com [52.101.83.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA63FD123;
	Mon,  4 May 2026 23:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938903; cv=fail; b=Yg1U6oHvDzN+IFAt/Ctsw3/Mw8ltzHZAs0HvgME9gr5m2zAeLV3yQXLQQ5k/NoDKvFbHcqUQA4VvtX1VLlJzuul6kt9ybxWNPH39XQQ7lA+YxPyVSQL5l/St3eT4EcR9LIF5nZN9tH2om+L/OVJvRzM5C1qjUanYSL1zfHse1Cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938903; c=relaxed/simple;
	bh=HmrRRsJQRCvvIO+17QOCbMsaqZzX0Yg6Tujx2XBbe6g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Et+iTY9I/QmCxFngBu95PHUpqqUbSkSruUdD63iOJ62a8ULk5vDmdYGE/eb7ZxMAD+SQ62brjpfrhDuZuNwEhf1OViSyxsGXiWggqWVtN2AqQy+gzDCzI9ggmICe5kT1vtAiMXZT8stvvXXVBNLGtpBJBMEUW2kRRYahhhrQg/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XpYPuk2R; arc=fail smtp.client-ip=52.101.83.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6s4yLRk51QDkj0A8hmB7oKmlMW9ZIP+uxUjIMQ2XTk8B+XOZUFzGw2/fORXvLrJpeK6fMf2iZYTq+M9dSIavOT6jn+cYCXIRSBLfekkkybrTn0m3zSGCzRJ2nK4rmi3fhK9RG9boyXcCV0E01JNtINx1DY+MlKCrGhpXHNU7xTFTYgfh7Doo5PJmvfkMAQA7GPDDfhUynn7nD1i6zPws6iMNr1JPFRuDPmedhX9iJs1NSPEnC84YtKsZXMUy6LnvYjNiyaJuWabTCPsBXRba5Yy/7NVtY8S6udr4IP/9wYeiBV1+gzlYomhFbD8cKRfqy80nOVRUQZfcrG0LumkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzhFKHWxco2YIgLmS7FO1GExkOEeWStMsCJwJmIL30s=;
 b=nPM2PLw1KL0FWonqLvtZ6sW8d0qw1uQXkVbe3QetqLQJgzcaUbsVXckhEdtoXuSnfDeqvGzzHL3X+69NzdSk0Dos7FDsy1SukcJJ2XD+3O1WQDK7j/rP/dQAyvawfXJJpsM/t3yJV881Agx4HrM7z5VhiJES6fgQkhTDfbQnq7hNwh4JWtQnzv4WnUmniKuElVedacZ6j3XvSjFTl7BhU9cNvMj4qTcobHLwe8bl1ZXHu3k55cfY96onwJecIJXtppgTJ9X/Ht5NuqEinlP3V0SP39wplKDfeCZxJwGGjjqa6OEev/SruQtbnwurVrFHkqcCB4M3a2vKUjEJlHSoYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzhFKHWxco2YIgLmS7FO1GExkOEeWStMsCJwJmIL30s=;
 b=XpYPuk2R99J6FepPtMnt2IV/ABAYjBAOdJ45dupoA3jYFu7HV3NQB78wc7thKhPZJ+ZTYpGpuCKZBpdSVlFHgkwOQ/Qz3/viwgRR32U+vDb5qZ5zLuY5vSK6ZOnVYm8YxWECGHwm6EiHCvB+DlhVvMxA8OzWYskn/nsmx4VmAbTQBvGuhTOrme1qL+SexLyv3b/5E3lQ5hXk1mCfyVpujx9pjrmiLmBgYAOeaJbeH+JPdRHe9DDxS66t3OT43BFYZEp3NlE0dhrmn9cNWmEiviuw3exZX7Xl/OFxOcA1mBEJlVKtIX520TYTtz4MTv4Q4hj6RyA9a9lmH0sCQNYhfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10511.eurprd04.prod.outlook.com (2603:10a6:800:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:54:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:54:59 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 04 May 2026 19:54:35 -0400
Subject: [PATCH v6 1/7] mux: add devm_mux_state_get_from_np() to get mux
 from child node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-pinctrl-mux-v6-1-8ea858ba3a5b@nxp.com>
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
In-Reply-To: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777938890; l=8213;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=HmrRRsJQRCvvIO+17QOCbMsaqZzX0Yg6Tujx2XBbe6g=;
 b=BLfMgTtdn16feYdwoNtLqc0SL5ncYRnqMuZvuH3YonxdGIjz15vYsftNKq+6yvKPf1OrRXFGR
 UIO8urPdhkiDR4MdGx81XwPMJeYyc2M58nBga1gpcVjeMX5N3TXRrFU
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10511:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da3b878-ae5e-4d1c-f0ff-08deaa388cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	K1Tds3Rj5cUD0mHURi0kXOUgGXZJKaVB0l0R3AFOnKGghLrG96CuzOM4d6ER5BD1wmLBSHdysWSps1IydyC9a+6dnD7EN2AqYThcV9SQrNv66Mf9k/nXL+PpyHPaMVqelvad/s+K4l4FLoB2V9+YDE1/Mn1JHEQ0uAgxckif/kcsLCTU0w7GZwDlhsjD8Gorthk67uD+kbla600GGLAe/Jis9G/4ZVa25oK6Y5R4AeOLD8ksnQMxV9eML6hu6kAmOTFUQm0B4d9AcMv0GevmQlov0GD5nDxPl/gyRZJ9o+vfZqXzC1+7flEK/gJi16ipCTsEZtDxpv5bjykQg3HEk4KDfYfLrmqpL9TXbD0SvqVaYvSi1qnM82OYE/wGP59Rbxtd5ef4xob0w4Ry0tQFBHDa5q+ImjeYcX0Ik0d3nvwBtQs5pzrAflkI8S8VHy4ZrV/qiM/qEVEs2pINLN/aiqr16I8tKBVClYJZ1h4P1mawqPgg2qnX9+og0j/+PkTCCBjiTRC9Dj6RJpvkv5L8gQHP/va5iEX3/hWe7tAfciO6W9voUKn9eFGmjPP/ekDbxCxjl7dAC3+6MmSYYx2wqAWM4aEHYYsETyc1lA9eEBNVpGkO4KmsqAP18qgtqhwxmXWuUNbHXg88LpQP9r7pgDMR13u5YfKaNqBrhtKdj8mEt9H11ySP3GIFAzCgbVkJWqGjMt1rLY8oifOmJTyd8NfW7Y0yEre0kPrajwovoiXGZsoUXs7ZCwu73HJBA7A/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGtSc3dnUmwyczdibkV2UkFHYy9IZzBhek4ybzUxUUpoSjN0ZWt0QStXN1Na?=
 =?utf-8?B?d3dWZmZSczBGbVJWM3N1cWRGd1pjOXRDa2tvSDU4eXNxdVRPV2x6QnBxTWN4?=
 =?utf-8?B?ZHhHQVRXWFh0RDJoNXZ0ZkhadmY4SFc3MHZCWVRoZG5oNTBaUGx5cjYxVVdP?=
 =?utf-8?B?WHVMNEZhaCt1dDJ3TjlMS28zaERzRDFjVExmMEN5NXAwcjNjQVdlcytQaVNy?=
 =?utf-8?B?UEtuQnBFNkNhYUpNQW5IWXk3YTBEb240dlV2cmVCU3lBclJVbDNoRVM2ZFlF?=
 =?utf-8?B?TDJGcVVqRzVwYk1QNFdLTmYwbmJUdk43QUFUOVFYYVV0VDhXYzF2TjNiRlVl?=
 =?utf-8?B?RDk4bitGYWgwMEUrUS85N2lxYTV3QmdBbTJZVEMrRkJScWR3dnNpbE9IUHNK?=
 =?utf-8?B?dlM5U0F2ZzR5ZEt1YjdpbkRWWVkwQ29ha2o5M0ZJbWZ0alRLaStOemF2ZThp?=
 =?utf-8?B?bW5FZmNHd1U5bjFjS1c3UkE4MzgyNHB2UWN4a09RdVZETnQwL0lqandCdTRO?=
 =?utf-8?B?OW5FNlMrS1U5dWpIdExVQmFGV2pxVnBuUnNmUy9kbENxdUZoNCszdTNMcmJk?=
 =?utf-8?B?blEzYmM1bTZVRVlrbGtQKzVURlhUNTBBVXdOK3FQLy9SZ1BETUk5VGE2Nkg4?=
 =?utf-8?B?TWVqaVBtaHF3OTFxYmw3Qk5jMUsrZjA1RDh4QnZnWXE1eVNSRzMwZE1kR3Zy?=
 =?utf-8?B?d3M0NThDK255VmpFK0NMdzJZMGI3Nzk5QWpFajd1bHZwZTFIM0h2M0RocFJw?=
 =?utf-8?B?aVB6RWtKVFdqeG1WeHd2MmxpRExJU21nOVRpS2lkd3lDcDZkeTMvWDdCUXRv?=
 =?utf-8?B?RTRxSHpDRm1OSmp4SHR2Y0FwdTN0RkJYdGZWMlhlcThHTGRHeTMwK25yNXBa?=
 =?utf-8?B?TGR1RjBzclNQN3VXNHZra0JOaXE1QTVVUFpZTVVxblF0ZWkwOUEvaXpQU3NO?=
 =?utf-8?B?K0hsN3RPZ3F1dEM5QXIraDdLUTJoeFg5aDhSSUc4UmliU0dWd1JPOU1SZDlB?=
 =?utf-8?B?aWJ5UlBLSFd5LzNISllnU0IxOGZhcUplSllZZDQ5YmlUVC8yWXlDdWRMaUwv?=
 =?utf-8?B?UE4wMEFaRGlGeFNYdkZlKytKdXdXeS9hZU9xZnFNQjd2K1RZb2dVWVhTVmd4?=
 =?utf-8?B?cDdZOEpSS0tUM3FROGxnT1BYbEcvaXA3UzRFYzJmTitIby9GaXR3bWtzaVpH?=
 =?utf-8?B?aks4a2NLMmFnTUdCTHhWREJjVFpJZm1aRzhNVm9haisva2FpNC9TTWdMZGg1?=
 =?utf-8?B?Smp0OGtJMXhvUFI1VTZGK2VPcDhZUms2VXhJWEhvUy9xR2JZOHp3OW00VjYx?=
 =?utf-8?B?T0NtWjdiQWdVVW9aeVJySjdqeUU3ajZSdEJ0OE1XVnYra0ZveDB0YTlyQVZB?=
 =?utf-8?B?Vk5sbVFKaFBUbmM3QStBbFZkZWhwcU1vbUFNR0RELzhEeG5CK2JOUk14SW45?=
 =?utf-8?B?VUJYbU11MmhDRlpiZzZlUXR2bzl4MURQelZVYlFWYlpSeFhqTm81dVJacHI0?=
 =?utf-8?B?aXM0ZCtSYXpMdXZibHUwNXk4VW5ZM0cwZGdGR0MrajFkbE80NkxGVDFRMkRC?=
 =?utf-8?B?OXhLeERYODEzQzB6Y1oxdmg3WnRCMkNOUk1KTGxTWjZxZmp1eGsyWlZIa0dv?=
 =?utf-8?B?RVJmaTMrQTJudjkzWnplakVBMExzaTBUT1NGR2lTYmNIL3FlUGRwQ25oNkZ3?=
 =?utf-8?B?ZndjQW11WXA0S3orNC95dUFEcGVUcGFhK3NKS0pxWnYrZ3dUc3ZMRVM4aXZm?=
 =?utf-8?B?N1lnTW15TW9IZmhrT0plS2J1blc4dlpCRDNodUxGb2xmWWFwN3FPajJ2ZndC?=
 =?utf-8?B?NVJrMlpjWitwOU5LOUxwSk1xaGp3S3hNYjlId3ZwWlN2Zm9UejFYeUZaMkJq?=
 =?utf-8?B?SWtYUm9nbjJrYjRQQkVJN1UyNnIrc2J2dlJJeDdhNEF6NmpMZHFNT0JvYktk?=
 =?utf-8?B?aXJuZnBTSDlQeWRSdFNaRCthNmJNNmo0U28rQTk0Yzk3Ulg2TlY3MDFzR1M0?=
 =?utf-8?B?NkZBMTE0V2lsOVRsUmQ0eEV3VjZHOVpSU2I0akJjcE5vVk00M0ZFNXpxZkxt?=
 =?utf-8?B?VHR4TjZxb1NPWWJFUGJTQnRreDlwNkJKaUF5YmlaUS8yNGZvOGlzb2xYS3hh?=
 =?utf-8?B?RysvUVV5OEV3TGF6MGJ4d1RQcVJhYlRyNUg1bEFYTEZhMEVyUUdrcE5WeWl2?=
 =?utf-8?B?aUpNL05rcXRZS2RxbmJiOGoxSlNMdjVSWElyT2hncjRYaVo2d0JBZytUVmFp?=
 =?utf-8?B?R1l4eU1KbXdtcVlRaEpkMnlWSVB4K3FtUmtFejUxK2dzdDB6ci9DTEVTY3Ft?=
 =?utf-8?Q?wx35Z8pQZ3h/10cFqR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da3b878-ae5e-4d1c-f0ff-08deaa388cc2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:54:59.0845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zrt6NY3M0HyHs9e1hs+d5oxLvxs8CheuRIGwXKb4DFgnAyhSsPzh+/uoZs/Y/20jp1RGoPMLu8tEMjNfSCjgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10511
X-Rspamd-Queue-Id: 702B84C5198
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[nxp.com:s=selector1];
	TAGGED_FROM(0.00)[bounces-36100-lists,linux-gpio=lfdr.de];
	GREYLIST(0.00)[pass,body];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.363];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid,0.0.0.0:email]

Add new API devm_mux_state_get_from_np() to retrieve a mux control from
a specified child device node.

Make devm_mux_state_get() call devm_mux_state_get_from_np() with a NULL
node parameter, which defaults to using the device's own of_node.

Support the following DT schema:

pinctrl@0 {
    uart-func {
            mux-state = <&mux_chip 0>;
    };

    spi-func {
            mux-state = <&mux_chip 1>;
    };
};

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v6
- rebase to v7.1
- change commit message to use 'devm_mux_state_get_from_np()", remove
devm_mux_control_get() change because it is not used yet.

change from v1 to v5
- none
---
 drivers/mux/core.c           | 42 ++++++++++++++++++++++++++----------------
 include/linux/mux/consumer.h |  8 +++++++-
 2 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 23538de2c91b41ad998471d5af429cf3c6211e4e..2f01acfccf47b1a55037a29101951f4b1760d890 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -533,14 +533,16 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
  * @state: Pointer to where the requested state is returned, or NULL when
  *         the required multiplexer states are handled by other means.
  * @optional: Whether to return NULL and silence errors when mux doesn't exist.
+ * @node: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: Pointer to the mux-control on success, an ERR_PTR with a negative
  * errno on error, or NULL if optional is true and mux doesn't exist.
  */
 static struct mux_control *mux_get(struct device *dev, const char *mux_name,
-				   unsigned int *state, bool optional)
+				   unsigned int *state, bool optional,
+				   struct device_node *node)
 {
-	struct device_node *np = dev->of_node;
+	struct device_node *np = node ? node : dev->of_node;
 	struct of_phandle_args args;
 	struct mux_chip *mux_chip;
 	unsigned int controller;
@@ -635,7 +637,7 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
  */
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 {
-	struct mux_control *mux = mux_get(dev, mux_name, NULL, false);
+	struct mux_control *mux = mux_get(dev, mux_name, NULL, false, NULL);
 
 	if (!mux)
 		return ERR_PTR(-ENOENT);
@@ -654,7 +656,7 @@ EXPORT_SYMBOL_GPL(mux_control_get);
  */
 struct mux_control *mux_control_get_optional(struct device *dev, const char *mux_name)
 {
-	return mux_get(dev, mux_name, NULL, true);
+	return mux_get(dev, mux_name, NULL, true, NULL);
 }
 EXPORT_SYMBOL_GPL(mux_control_get_optional);
 
@@ -712,11 +714,14 @@ EXPORT_SYMBOL_GPL(devm_mux_control_get);
  * @dev: The device that needs a mux-state.
  * @mux_name: The name identifying the mux-state.
  * @optional: Whether to return NULL and silence errors when mux doesn't exist.
+ * @np: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: Pointer to the mux-state on success, an ERR_PTR with a negative
  * errno on error, or NULL if optional is true and mux doesn't exist.
  */
-static struct mux_state *mux_state_get(struct device *dev, const char *mux_name, bool optional)
+static struct mux_state *
+mux_state_get(struct device *dev, const char *mux_name, bool optional,
+	      struct device_node *np)
 {
 	struct mux_state *mstate;
 
@@ -724,7 +729,7 @@ static struct mux_state *mux_state_get(struct device *dev, const char *mux_name,
 	if (!mstate)
 		return ERR_PTR(-ENOMEM);
 
-	mstate->mux = mux_get(dev, mux_name, &mstate->state, optional);
+	mstate->mux = mux_get(dev, mux_name, &mstate->state, optional, np);
 	if (IS_ERR(mstate->mux)) {
 		int err = PTR_ERR(mstate->mux);
 
@@ -773,7 +778,7 @@ static void devm_mux_state_release(struct device *dev, void *res)
  * errno on error, or NULL if optional is true and mux doesn't exist.
  */
 static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mux_name,
-					      bool optional,
+					      bool optional, struct device_node *np,
 					      int (*init)(struct mux_state *mstate),
 					      int (*exit)(struct mux_state *mstate))
 {
@@ -781,7 +786,7 @@ static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mu
 	struct mux_state *mstate;
 	int ret;
 
-	mstate = mux_state_get(dev, mux_name, optional);
+	mstate = mux_state_get(dev, mux_name, optional, np);
 	if (IS_ERR(mstate))
 		return ERR_CAST(mstate);
 	else if (optional && !mstate)
@@ -815,20 +820,23 @@ static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mu
 }
 
 /**
- * devm_mux_state_get() - Get the mux-state for a device, with resource
- *			  management.
+ * devm_mux_state_get_from_np() - Get the mux-state for a device, with resource
+ *				  management.
  * @dev: The device that needs a mux-control.
  * @mux_name: The name identifying the mux-control.
+ * @np: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
  *
  * The mux-state will automatically be freed on release.
  */
-struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name)
+struct mux_state *
+devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
+			   struct device_node *np)
 {
-	return __devm_mux_state_get(dev, mux_name, false, NULL, NULL);
+	return __devm_mux_state_get(dev, mux_name, false, np, NULL, NULL);
 }
-EXPORT_SYMBOL_GPL(devm_mux_state_get);
+EXPORT_SYMBOL_GPL(devm_mux_state_get_from_np);
 
 /**
  * devm_mux_state_get_optional() - Get the optional mux-state for a device,
@@ -843,7 +851,7 @@ EXPORT_SYMBOL_GPL(devm_mux_state_get);
  */
 struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name)
 {
-	return __devm_mux_state_get(dev, mux_name, true, NULL, NULL);
+	return __devm_mux_state_get(dev, mux_name, true, NULL, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(devm_mux_state_get_optional);
 
@@ -861,7 +869,8 @@ EXPORT_SYMBOL_GPL(devm_mux_state_get_optional);
  */
 struct mux_state *devm_mux_state_get_selected(struct device *dev, const char *mux_name)
 {
-	return __devm_mux_state_get(dev, mux_name, false, mux_state_select, mux_state_deselect);
+	return __devm_mux_state_get(dev, mux_name, false, NULL,
+				    mux_state_select, mux_state_deselect);
 }
 EXPORT_SYMBOL_GPL(devm_mux_state_get_selected);
 
@@ -881,7 +890,8 @@ EXPORT_SYMBOL_GPL(devm_mux_state_get_selected);
 struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
 						       const char *mux_name)
 {
-	return __devm_mux_state_get(dev, mux_name, true, mux_state_select, mux_state_deselect);
+	return __devm_mux_state_get(dev, mux_name, true, NULL,
+				    mux_state_select, mux_state_deselect);
 }
 EXPORT_SYMBOL_GPL(devm_mux_state_get_optional_selected);
 
diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
index a961861a503b33a3ea18aee6a2eb044866aa8801..449e38e6e2c515b3dd2b51a8b8cf0295a2520804 100644
--- a/include/linux/mux/consumer.h
+++ b/include/linux/mux/consumer.h
@@ -60,7 +60,10 @@ struct mux_control *mux_control_get_optional(struct device *dev, const char *mux
 void mux_control_put(struct mux_control *mux);
 
 struct mux_control *devm_mux_control_get(struct device *dev, const char *mux_name);
-struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name);
+
+struct mux_state *
+devm_mux_state_get_from_np(struct device *dev, const char *mux_name, struct device_node *np);
+
 struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name);
 struct mux_state *devm_mux_state_get_selected(struct device *dev, const char *mux_name);
 struct mux_state *devm_mux_state_get_optional_selected(struct device *dev, const char *mux_name);
@@ -161,4 +164,7 @@ static inline struct mux_state *devm_mux_state_get_optional_selected(struct devi
 
 #endif /* CONFIG_MULTIPLEXER */
 
+#define devm_mux_state_get(dev, mux_name)		\
+	devm_mux_state_get_from_np(dev, mux_name, NULL)
+
 #endif /* _LINUX_MUX_CONSUMER_H */

-- 
2.43.0


