Return-Path: <linux-gpio+bounces-32395-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FSKOe7CpWnEFgAAu9opvQ
	(envelope-from <linux-gpio+bounces-32395-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 18:03:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6C11DD772
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 18:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A81730733A9
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 16:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBDF436366;
	Mon,  2 Mar 2026 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sixee8q8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB6D42F57E;
	Mon,  2 Mar 2026 16:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469854; cv=fail; b=dMByyVpy8jbI8hZb0Qoz4fVJRRX77kwUQH9CwF+gvG6VRzWHEeuOb/cw61daR3BC0l8Gt3Aj9rtOdnDAyXK8hrCw32PhRS6mELOBpWxK/NFmHXgwhvoOaAjU6BSVxOMDYz2yjQ/QBDRJ9bM8EC8jCbFA/tLDPrsvzgntG+U4MEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469854; c=relaxed/simple;
	bh=eQxP45B/UiyXOo/TKWdudpDSlOcuOKRIMeRsBalfmGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=RFOuyAlQBitd+8P5+gSfCL3i3sqchY7u6kpYGzx6AUik5a7HU5D9cax/5JRZxomEtOmFuGMJTglQ30iwAZh9G9Bm7OUw3tZwMOKri1Jq9tgsnmEQXXdAqaOBXA/uxQxGOYyWbL1twjzKPPP28mmBrh1IOzeXvRjYq7RVnaD5T7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sixee8q8; arc=fail smtp.client-ip=52.101.65.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eI2tOJD2dt5OxPb2Tv+KepGcsvU6CSaHqkEILc/vQRCkbsTpY7tZW4zv0GlPHMJb7VRpMXubSgZLm0JDVAsJ7tdR9GK8hq6xYsylEWQv1McKPD6eQGUuESqLgG4m84vA/wBTAP3q/Oq4cSMCDqtMKL0oAE9gdFpgJh8t3EBYy/l5HUGrONHm1Yv4IKQBEVnFgmubgJnZeYeu+I/j02yrkoF4bMnW2zGgles1Y76qJd5onpMDoaHUAlTwC1/wL0e6LVQzeNVXX50g7QhYHmVVA7VGo8FrEFBfDASv0/TWpEqZm5RAAOd4jy/SMOrTNpELV67uuoz+6Ek3H3wZkkFQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMIOyFgXidXs8qD5JZ4H0TYO9kCQ5XKy6spDjOR8vqI=;
 b=GZnYIMyNblITPxJTcRSTY+NdKBgGAaWEVz9Hm2lfDP44v3482E5m0cTfva+Cl63Z2j4KLNGqibyQJcNPlefcQ0967JbzdZE/KLAQMaiwGdHnVsT+TpjPcQhT6wrP2Z4iwxB4CyumnN5Hev1lzqrqzHtXWnx9r2MXfDaJg+xeJTQAqtNcVJWfZZFuBuiZm19rOL1RO/1YjkdQxdnpHBegOHpBmdl+mvOmI4dIpxSzNOoSw0yujU4ptmt5Pie1d9Omhzem+5P3W81EENW6BqCQJw2a2Vk0kmhdd95XCDvrCUMJwUStMPcBNKJMKR+J+WVBCH/jdb2s0jsq2m6rMNMU2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMIOyFgXidXs8qD5JZ4H0TYO9kCQ5XKy6spDjOR8vqI=;
 b=Sixee8q8URERhosZRF4wLo4B8gOPLy26XoyBeMjv6O7Wtp3E6zNT7sq3xyEsMS40OWmnqYxhgwicIZUAYle+DsyAiNtbwW2vA2FUrKEdw6YLFm9FrzT+smtpN42ZQ3Sx7mnV8/pRX7o0Hc/v74Th6N4/hYEixR/BUe1QsSQNYmgMRntlOMmv4m8942WrbofHb2JJP/FHFlzZwAQEH7VinJTg0nENwQn7u/SexDuI2xDl6IyfYYPN//dhwLVKEnMgPE7lXzviefbhiHtUKAf3u6eJtuVs536oJ8nQooxyhKQS7y2uSZkBAkrsO1OZ+W7jjC45ZfKJcH3j4YnCLim6dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB12065.eurprd04.prod.outlook.com (2603:10a6:150:2ff::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Mon, 2 Mar
 2026 16:44:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:44:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
Subject: Re: (subset) [PATCH 0/4] ARM: dts: imx: cleanup iomux related
 CHECK_DTBS warnings for imx1, imx25 and imx27
Message-Id: <177246984325.2095257.1963136137676570240.b4-ty@nxp.com>
Date: Mon, 02 Mar 2026 11:44:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1P222CA0122.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB12065:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cdda9ab-24b7-4a5c-094b-08de787aeb34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	NEuUDbF/rPjw1iW+RzgtHYAo/dKnNV7YNuv+9TxCzVFHx7dWSadNykVybcE3mPY9RVJTQMBthucl/NAHbYhE0RqE/Yi+01ySwZ9nyXWSDHYHAAWiXNWrrsh3/A7dqxi7YoKtru19e4E1eyfvM+0pLX96bHtoGPJRutZ6Ac6TkXjl7vF863++676z3xNUjflpLqci1xcihh9Vf4EXtrcuwTdzK3lyyrdiVAc42QO3jr25yEDC6L2vTaLlhcpRuqYYbHCtYbObKUH6sLD+m6p6Y2H2w3yP+EekWQK0WZl+bNrMMw84jnqrukmSDdGZ3QF+xie1b58je/FbhD331tT+hYSSnQhJRaewpy/bbqzVQzdpIzYQAQ4Ma2yixCmzienFb3ledjemFIYUUX8wvxh6ZlZYasd5TPCyqEAtTSeCvncNpKPCDN/xBFPXhwYYbir6kODeNsD3WQYaOXTYbAq0171Bp5kWS1ZOruhNJy3HUQIwq8khsZms/zB2Q0PKoKkbXGfXesWa8/iZ3bfW/y/vo/qoYtGMvvfRB8vrEPbI3XVSTCqjnkJH/FK1+aXK5DXz17CTurA+Xs0nYkzr0pH9+rlcO79gqljsBzN4jSUYxhDt5ARAoeouCPMIJbSokl8BzhoeNnDO8SfgcRuxNG3x6IWlNLn9NmM6/BGRcM6BkdOFDQAFFIFMPYL0ehDN4zhlPO/TKYRcJwVD/VHIjc+iCSYDTEq1s9OFhpHA+6x79mL5yZjzRuZotAosVh08ht44G9OmDxPGEnUC5PT2djrrHyziYrTUw25PvSnshOPPn/uWPHuijWPPh3IpF2NMDpEt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzZncVptVlBhOUgzSll2MkVCbnd5U3RPLzlvTjlhNU5jZUNSNDFZZ1lDQ0RZ?=
 =?utf-8?B?THU1S3JhQllxR3FFSGlJR21iT0RMVWhVbEhicnVJYWovVktaeDI5dzBGeGFL?=
 =?utf-8?B?WUF1UjlmWTY2dHp5eTJLdHI4SVUrb1FOZ0hzZVFhNnhxWVNQbVFUcldzQ2xr?=
 =?utf-8?B?cURHZkpwYkhQM2tqRElwL3VxdVRxekt4U3MrYStiUGFBWXovU2dIa2h5TnJN?=
 =?utf-8?B?bXk2T3ZZQ1hzaEhTaDB0UVlhYVFuZEJEK3BmVVgrUW0zd3N2K2tmV3FMWjhD?=
 =?utf-8?B?dmQrbVQ1S1V5RERtaVJFL1hlcS9TUjdtSVdEdUtmbzBXZW1Kc0xXNGRLMGF1?=
 =?utf-8?B?cnozNldJOWJWS0U0cWFGWE5yRjdZOEtwTUdrcUd6T3VMWXF6aUZKWUpZalhI?=
 =?utf-8?B?K0kwdk9NZ2ZycFNIZGlJVW4zNTBqMFUxMm1GdG5Uc3JNWG8wQWlrQ1Fob1BM?=
 =?utf-8?B?YmRCMEswakVBZDVBb3hFT3F3SzFSWXNJWllRVGxQUUxQTkdTQ0pGOHZzWThZ?=
 =?utf-8?B?R0wrcERqU1FwdGJjeCtJb2RwdmN5dEhSMUw3NDBITUhQekdQVTZDL2VvQS9i?=
 =?utf-8?B?d0M0Q1psMmMrcGllWFpUTlJjTklhOXNtaW1xdXh6Z21kWlFYb3pHOGU5UGxl?=
 =?utf-8?B?azRiVWIwMSt0bVExK0hPSHkwdHAvT2VGSEExYlRrZGFQbm9FY01uWVVRMjFH?=
 =?utf-8?B?L3ZjUHlRODBUTXprU0tncHBUbU5UL0drUjY2ZkJDZlBUUFhNZmlEMzRlT1BZ?=
 =?utf-8?B?c0IzUkM2dit6ck9XSmtySTJoaWJ4ZE8wb2J4U0hqNmxKdVVteW1YcmJZaHdF?=
 =?utf-8?B?c0xBRFc0MTBhWmVYK05IMHNTUDZsZjZvSjFpeWhzWEFzVlpqYUZzYWd0Y01R?=
 =?utf-8?B?TVVPeFVPaU13clVlek03eWtiSkRyb3E0bi8vQkJtbFNUcFhkNVRkSXU0Z3F2?=
 =?utf-8?B?bkkrOVV4ZzRaMWZlUytKQ2l6U3lYbktYdWkzYzM1RFV2K3pEckpDaHJMMmpP?=
 =?utf-8?B?QWt1QlNXM015cnpkUEgxWElMTE4zc1F3cktIeU9MOEp2YUxJTmlUZWdnemdN?=
 =?utf-8?B?TDRsUzdKRG9TRlVRemFLWEcvUzkrWnRoczgxLzNFS1BCbU1QeDdNdjRVOVBl?=
 =?utf-8?B?NEpOQWtQV1NNMzQySVZBSEZ2aG9YazlhU2VSV3RYTTh2aU1Zc3Z4eVFneGNH?=
 =?utf-8?B?elhNNWxjd0Q1Q3dnbkhaT1ZGdUpXdXFGNXZ0cEdGOW5raDUvUW05SjRRa3Vp?=
 =?utf-8?B?aWpHNE1LN0ZUdnRncTJTbE56QloxbUVZZHAyYTloOWptbG9jQUFpSGJERVYz?=
 =?utf-8?B?OGNkR0lTUjNDS05SWDV3WU45YXdzbDhsMFRxL2JQZUZWRzU3UXZVQmNqSUxz?=
 =?utf-8?B?WVRtUjVUK2VFTTdzMkFOMGtyZGhtNEFDRmZCeWRZV0gzeFp2ejBFbEZDajJR?=
 =?utf-8?B?TTE5WHV6UE5xSzFoQ0JyMHNXTTBpNE9wWjYvaVlyOTRVR2ZueWdDdVBmTkpi?=
 =?utf-8?B?UGtveldldGs1MmU5Wlk5SmI1K002WldIR2JocHZiR3Jxd3hBOUJvVzdPN0s4?=
 =?utf-8?B?YzdtR0IxNjNHa0Q3RUJoZktCZXZWdWlicUEwWklKekhSV3Y4YVdaWlljbXNo?=
 =?utf-8?B?TVdDanNrQ0ZWY2tvUWRNeHovRzMrTzBKN1Q2VWpuaXE2aFRodlBPN1VyME5U?=
 =?utf-8?B?OHdJdThLRWYvNHZpSHJvK0UyUC9Ta25HSTArbE42N3ZsbitXOXpuNFBUM25z?=
 =?utf-8?B?SVc4ZTRXMCtvV3JMT2doQXZocjJRRUF1RUZZR2ovUlY4aCtXVlN1NVpwUFN2?=
 =?utf-8?B?V0YycWxmUWx6QlJWeHhEeDRZZmx5azRvWXdXOXVKUngwa2o3Q3l0WEc0ZDE5?=
 =?utf-8?B?MTVHdmErMXBXSVRtUWxZYitPZ09BektqZXpydFdXZWRVaEhJMkk2WHJqQWZq?=
 =?utf-8?B?aDQ5VGl3RVJmWUZnWmRCK1pGSUpyY2dDVXhKMFlEMUJVdm0vVXFKU3hLejF1?=
 =?utf-8?B?U2FWNndMb0MzUmgrenl6eWMwWmdkZVhjZ0pEV29GU2xKZGUzdVRGai9YMUZr?=
 =?utf-8?B?dmxEQWFpWGUrYXpKMVRsWDB2Qk1DZEl2djQvUGZ4a0NsMFpqL29hd3Z5Ymp1?=
 =?utf-8?B?UkFyVHJrMzhIelVSUVJ5UmhnSUN0WENWZVd6QjNBU016WE5WK0hudkozanVN?=
 =?utf-8?B?NXM5bk4zVmNPM2MrM1RPVnZlT09pdkxOVnNCK3JGVzViT1JwNURqYjl5aEFw?=
 =?utf-8?B?a21OTWQvTWtxZGQ5c3ZDcjNFRFdlMGY2QllkOW8vdC9yWU44MDlWZFlKUTg3?=
 =?utf-8?B?aDgxVGRoWUY4OFNQMHBYWjhxQ3Q0dG5iYmpVeFZmQThzZlh6c1h3Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cdda9ab-24b7-4a5c-094b-08de787aeb34
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:44:06.2359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6A9e8dY4kAKsEiKQY4o+2meTdkrgbDie04HHZX5Sg3aBbOQmTvwe3Z8W4QCOe/cjGNWyEYGBulWrIjlo6VCU0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12065
X-Rspamd-Queue-Id: 4D6C11DD772
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
	TAGGED_FROM(0.00)[bounces-32395-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action


On Wed, 11 Feb 2026 15:59:59 -0500, Frank Li wrote:
> Cleanup iomux related CHECK_DTBS warnings for imx1, imx25 and imx27.
> 1. convert txt to yaml format.
> 2. rename node name to pinmux.
> 3. remove redundant intermediate node in pinmux hierarchy at dts.
> 
> 

Applied, thanks!

[3/4] ARM: dts: imx: rename iomuxc to pinmux
      (no commit info)
[4/4] ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>


