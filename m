Return-Path: <linux-gpio+bounces-33174-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLXvLAq+sWkwFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33174-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:10:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57100269151
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9BF43063772
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D57D3358CF;
	Wed, 11 Mar 2026 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kDm0rvC9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F130234753A;
	Wed, 11 Mar 2026 19:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256122; cv=fail; b=e288acAQV58rxnl7cBfvc8pJzlQW1iKD9HqgtMtJw6233RFa9ie11p3DsK87fVQGpprqBY7zQDXVzhoBcgkkVjggjwod9Lgq0euABEf8CmeqKI75V6Yv2jm2XMSN3OiaKytn72H6rr+YXDJsqHFE07vTkRStUMHt6z1I8Tqifx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256122; c=relaxed/simple;
	bh=qlMnhjY8Uj2TvLNzw2qFpuTn1QKKlo+N2K1W3WzCOq4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=k0/Xqig1jDHgC5L4tK5N3+0jVr83YMbLhOGqxYM2PWpN0c8ujPc6hJTsXksM+mh6mzgMGW8qzm3YKjynoPbAOEygzXzTS+AHUf8BIqzsF6GBoqjXVjzQAQyQUZfE7oOIftYpxvJ8Wae2BAgqEI6PzWAk6bygxReDOKtI5xgnc1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kDm0rvC9; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lB+BUm4KnosLI9WiEuHamwTwWu1Cj0o8vADDC+ZOWATWd5979Vm/h043awPRP7RrXjKBsQ4PnKEr40eClPf98q+Roc7caHFlUWohGqz03r6MQtPUtSZqTxItblgpCrLT8IkSoy+fWd1qiK7EDGjcUcPqqyItHSrGlW/PIts0fsZffBqQ+GPZv6s7V1sgyLBmN1nGiaFai03oxKnmTYT95ktDmX7TKT0QNMfxxfUhK0gexA8wHpjYWj0hZgUG81bSpq4cxa6P0KldU+m6ih1CbNCRIdWHTE6MHe2w6/A6HTMnieQPvRBHad2Jl3mAsHkdyXG+PFjRUwEuGbM8NIOUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxZbJ6Ko6KaHtAsMrblvNBqHeMBTVRsWRw82ZpjjAcc=;
 b=hToPnQc7Ouxkwu2No6Yce5iRagTLc1Doy1B3IrsjiyJnzvaOPtSu4QOorMoZNM3Tu77Gl4syUimxybZsi0OyADooExDdedLISqZPU/ClOwQB+xRrfwMa0FShmGszDkNJrQ9l7y/R6TqmSuxZuLTr6pn2xQMFp8NW9LTL/xIlGM/IfR2Mob8iD3OMALnzQfKnHkYr0BfcRUqeQDOYwxcOOdC0P4W6jltVJTwEkEQ/CrBHW1aovxueGj/P3cAJFymY6QW7F8IEXGpzcQ+a2vODLhUPOWKoS0q05sodRPdLXGFFgGzwH4lX1yDli64Rl+PDyjcbE+U0YlQ3pmwDgpjtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxZbJ6Ko6KaHtAsMrblvNBqHeMBTVRsWRw82ZpjjAcc=;
 b=kDm0rvC9a7nfJhXvjnlxftK+lnYi0Wq+hXJpcb7YtldncXaD5c7lGlKD/UtmvJ8APNVGwWZ7vGPE8WIqUT7F4h99Gm2WjtfWinAVhNpU5BCxcVgw8sCs5hGY/6Y6uRQ2+k4DlmG7sHKqGAVhbYIsHy3tJc/8lo2iAhbUV+44k7PzqK3gxvyYWKD1ugOgevBmdCqsQohzSjWR5h9kmXbaRXLYOj/fVEbnalHFLb7c8VVLJwZJpaBjED0ZxZ2qzQUQ/ulyk4oeZUWP3+y4xkPaXNOUfdhvwthASaCYU0XVYudEcLsiU24Q7uw4PhrPz1vnOyO+yo80IZYVdJ19PBX8rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 19:08:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 19:08:35 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Mar 2026 15:08:13 -0400
Subject: [PATCH v3 4/7] pinctrl: add optional .release_mux() callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-pinctrl-mux-v3-4-236b1c17bf9b@nxp.com>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773256101; l=3385;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=qlMnhjY8Uj2TvLNzw2qFpuTn1QKKlo+N2K1W3WzCOq4=;
 b=qUjf0qP32u8ZinAezKz83XKiDDfIERtY5y4hZons2hG7ET/QXeUokIA69F3fZxei4c5ixM8eB
 llgSqBSQ0y7DCAcfAibUMUcHfpyOsqxuUdEsEeefWXw54IFVUTRpe7V
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 4334de26-5fb4-457c-1cae-08de7fa19852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zSbFVS255HL0OF4B43i21qur009OUwPu6BFonubOXIg3atZw5fOJ/wCwOtOSbkXYsaTAoB6J4gBaYV+Ft8EC72nd6bGVfCiGOVwgvF7NuCLHdbiqSxyrLQ33YotXs+sgPsHchG7zHiYy/4DKVDJsoLuxuXp8whS7YKOPmkLfsF83F3uJwhcjt4pVsrMvwS9Rcp135yLoZ2ZlMXr28n4P0fO4pcfrKmAGv/F/GwOPjeHnd84H+2lsPl3E6mQPEJcwS3RX5aGc2pXMiniVRpM1uTSFmmGJ+laKLHgIPd7NzgK09xVGMx336u9BFt3DY1e7B2HPMKYWyQjVe7JtitkkoTXevYhYDsSMxTNKWwbztzy95Xtb0qqCjji47ywL+lry/c7noJu2ygm7hzfJwEit6lmYItc/u8B51awQbQeXcLcIp3Qbp+O4z17WpK2TZc5YVrylLL8pxpJ/6k4bbhy+jjd+YbpqShKCbrft6qHwENZrfKAuSkoWfLaEyXv9czSoA9OAuXuC8AkJTIMU3uzWtap7zXdMXNwFzo5FfnlG0TQurD+I77WfkNwD6iaLGdSQVYGLIx4OAjZ4xl21DVsNEAOOrRFtIfhi09VzSsdUszF8OpUc6I0p8/KPTIKDm9aRcsSfx+Djgm9ZXcteap5AfOEuJNCElGdXQFK3bMWuqdwcASfwG6mjFqUuuBSbcfFOgLX+i1nIiz+RfnBZflbdb1bjJItKSWxtn9YjiRI4Ejkj7+QIdrPSCAls/4FtimWFK/r7+tiCVgV2k2NnIbNnqHMnEYdF3lIvb5ttYVjlPSU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SThDOFdNSktzQytNRnF1QzNETjBiNmtvTVpmbnhpOU5wdWd1Y3dITTlOWTQ4?=
 =?utf-8?B?cU5SOENBbVRvRk9rQms2OFpRcjk0MWwwbmN2cWU3MHJIWWpFbFpDd3JBbEhn?=
 =?utf-8?B?Y09iQmp2UWlvbFhqRWxpRDRjUmhOVW05QTdjSWpvY3VSL3pjUnlGVFNDWVUz?=
 =?utf-8?B?UTM1ZmN6NCs1S2RsbE15Uy9vVjZySEpqcFlNcVBvZno1TTlTZkpIbDIzdzMv?=
 =?utf-8?B?bW5tdmdvQzQ3dmZTVXhEUFlrSzJqTXJ2enhCdnFwdmQrUmxkOG5jUEtDR0pD?=
 =?utf-8?B?RVIrZzlJNU9lU08vcGJMUUJpUnltZ0wyZ0NDQXZ6UHRzOWhOTUxCKzI1OWFI?=
 =?utf-8?B?NjVXelNYaEhxQ2YzbG5EYjE4RXh2R2J1SDJrWFhWT05ERkxrcytLOWtEajJV?=
 =?utf-8?B?OHV6NTl0ZXNVK0xIRWFiTTgxVUEzQ3BveStsT2lSZFdGTXp6Z3RXMVBvTkJp?=
 =?utf-8?B?TWtsdlB6NUxLbjNMNXlnbnF1V1ZaOUkwV2sxREdvM1VWV2xZTWE2TDVqTVYz?=
 =?utf-8?B?YWNaRUtIOUt1REd0QU5zZDVPditrK09BdFhpcnpadlorbUluaU83K2dMaytN?=
 =?utf-8?B?WW1lbW5HN1RNMFY0VkRpcGJ4Q3FjVUZFZU53T2ducGtZVU03VDRRM2cxd1d1?=
 =?utf-8?B?WGxJcjF5NmdxKzZncHBqSHVBV2p0UWVtT1ZTakgrbzlWdmlKNUJlbUt4QmVX?=
 =?utf-8?B?OTNvUU9IcGoxeFBIcTVZd1Rla0dLcVN6ZU4ybVFseGllNXpjMlBmcThMUzlG?=
 =?utf-8?B?RFZKb3BMM2dRaWJZS3VKV09uRkJFRk02bzlQRXROUTdkM3haNTVSWHEvNC9M?=
 =?utf-8?B?cGZjWk9sTjBuNzduZmlnQ1kxSGtFTWY5SzF6VTQvbkZLWDJjVnV3SVdzbWN5?=
 =?utf-8?B?QU9lNlZRR21mS0wvdnlhZC8xT25WU21QN3VidWQ0ejN4ZVR2UFhIdEx5TTd3?=
 =?utf-8?B?bS9oY3pQdTUrTHFNcSswVFhTRExySjlvcFVRUXNRcWlEeW52eEFNTjMxM1Bv?=
 =?utf-8?B?V05MUldmd0tTbW03VVp0YkkrT1J1ak90T25DNkd2OUEwV2U0NXZVS0wzMjJC?=
 =?utf-8?B?UFN1ZmwrVlFHSXVuOGtkQ3daQkhNdk5MYUxrNFoybHpuRmhVNjFsYURKL2JW?=
 =?utf-8?B?NTJqSEpva2RNSUY3WFY3VmhTRmZ0MkRVa3NIK0w4b09TdlBzdkFCa1RiV2RM?=
 =?utf-8?B?VW5FMkdTNkZkdDNLNVF5UXk2NWRCZm0yNEdiRHNFZWQ4UG12bmUzNWdqdGZ5?=
 =?utf-8?B?RjdzZ1lDaUdGa0RvaDBYWklLWDFPTXcyNkRjcHRPWnhjQ0lCRGU0Z0Z6clIv?=
 =?utf-8?B?SjZTSDFWOFZwZ0lzemhCVkVjSS91Tkg5eGgwMzR5SGI2dzVDV3cwMXJPNkRF?=
 =?utf-8?B?cWt2VXNBVWhxTGwwN0pIVEZuKzJhcWE2Z2MzdEFCdjMrMjNHZ2VsQ1JXUGFr?=
 =?utf-8?B?TU50VkRGOHZ5U0xEVnNJTXZncUJUQjNaRFdwUEh6SEpxMGZFbUxlTTlZcE1C?=
 =?utf-8?B?TXBVdlpEOStyT0NMaGNhbTZDSmhHaG55dncvbXNBY2JmMjlvTjNNSVFMR1hZ?=
 =?utf-8?B?eGNpanE5QXhDeW9SOTRUNFplbUFQS0NwY3dxU1V6M0ttZUxiVDl0WEVoSEl4?=
 =?utf-8?B?MUpWVWpXeWlPL1dxY2djUHY0M2Z2VnJMQmhTNjMrZ1FPQUt2NXJlTTRiZ1NM?=
 =?utf-8?B?SzZEcktHOXRFK3BacTFIODZBTlR3bklhZnpwUGphbyt5dERuMEovT3VyTWtK?=
 =?utf-8?B?UjcvVVhiMS9MTkxRQmYweXVaSUlIbkozdzBoRzA4dm5HMWZWUHpmY0pzK1Vv?=
 =?utf-8?B?MjNyWnNBL1ErSUxmWHNnME85YzcyUlgraW16dDhEcnh4emI5dzBNVGRQS2Jr?=
 =?utf-8?B?eXJ5TXdWVFF1VWl0WityM3k0VU5TRzZycHJwalpLajcramVXVUQ3OEhlbGNY?=
 =?utf-8?B?ZTVGaVZDMXJSSUI3RTU4VGZuLzFndHJTUnZGZi9Lb0xIa3VYMFNyRVdQbmQ0?=
 =?utf-8?B?SEdQOTNmaGxHQW5kOTJSSk9pZDN0QzhGY04vWUwyQU1uWWVzUHlDSmxwMUZC?=
 =?utf-8?B?YVFVQWdXNDdXU0RDMkpWYUVNbExrT2JOSkdTdlZtTC9DU09XY1dEaWcxZUtK?=
 =?utf-8?B?QnYybEllTHdaOGYwQUNsenRIUS90bXovN1pzN3lSTmVVemRkNjk3b3M4eTdy?=
 =?utf-8?B?MFVqcVV5KzRnVVhwSXQvS2VNRnlpcHdRR1NRcVNZdDhiZFZyeDNjQXVwSm03?=
 =?utf-8?B?anVzVDJ6WmVxcWR6VEQyd1daMnQ4NXNnZnNUNUw1akJYdkZWMUtqaDc2Q1Jt?=
 =?utf-8?B?L0FhaTJxZzV6QkNJaUQ0Qlh0UjJyRVFtcVQzVXgvcXBLSmE5VFdWdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4334de26-5fb4-457c-1cae-08de7fa19852
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:08:35.6146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKjjwNFqDiB0wUBxTnbv0wJAGEACqlikG8hcy7OR+A+3L2FpUS92lSEcIp8NJW41ML/9Q8AwUylI0CtVkzLIqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33174-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57100269151
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an optional .release_mux() callback to struct pinmux_ops.

Some drivers acquire additional resources in .set_mux(), such as software
locks. These resources may need to be released when the mux function is no
longer active. Introducing a dedicated .release_mux() callback allows
drivers to clean up such resources.

The callback is optional and does not affect existing drivers.

Commit 2243a87d90b42 ("pinctrl: avoid duplicated calling
enable_pinmux_setting for a pin") removed the .disable() callback
to resolve two issues:

  1. desc->mux_usecount increasing monotonically
  2. Hardware glitches caused by repeated .disable()/.enable() calls

Adding .release_mux() does not reintroduce those problems. The callback is
intended only for releasing driver-side resources (e.g. locks) and must not
modify hardware registers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- Add judgement about 2243a87d90b42 ("pinctrl: avoid duplicated calling
enable_pinmux_setting for a pin") in commit message.
---
 drivers/pinctrl/pinmux.c       | 5 +++++
 include/linux/pinctrl/pinmux.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 3a8dd184ba3d670e01a890427e19af59b65eb813..c705bc182266c596c4e6c820f5e3ffcadbbb2838 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -517,6 +517,7 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
+	const struct pinmux_ops *ops = pctldev->desc->pmxops;
 	int ret = 0;
 	const unsigned int *pins = NULL;
 	unsigned int num_pins = 0;
@@ -563,6 +564,10 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 				 pins[i], desc->name, gname);
 		}
 	}
+
+	if (ops->release_mux)
+		ops->release_mux(pctldev, setting->data.mux.func,
+				 setting->data.mux.group);
 }
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index 094bbe2fd6fd5ea3c5fdf5b6d6d9a7639700b50b..77664937eeb273eef440988c4cf833dbc6f10758 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -51,6 +51,8 @@ struct pinctrl_gpio_range;
  *	are handled by the pinmux subsystem. The @func_selector selects a
  *	certain function whereas @group_selector selects a certain set of pins
  *	to be used. On simple controllers the latter argument may be ignored
+ * @release_mux: Release software resources acquired by @set_mux. This callback
+ *	must not change hardware state to avoid glitches when switching mux.
  * @gpio_request_enable: requests and enables GPIO on a certain pin.
  *	Implement this only if you can mux every pin individually as GPIO. The
  *	affected GPIO range is passed along with an offset(pin number) into that
@@ -80,6 +82,9 @@ struct pinmux_ops {
 				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
+	void (*release_mux) (struct pinctrl_dev *pctldev,
+			     unsigned int func_selector,
+			     unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,
 				    struct pinctrl_gpio_range *range,
 				    unsigned int offset);

-- 
2.43.0


