Return-Path: <linux-gpio+bounces-31853-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLtsE/3VlmmVowIAu9opvQ
	(envelope-from <linux-gpio+bounces-31853-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:21:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA3C15D508
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D27E430091FE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 09:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23343382F1;
	Thu, 19 Feb 2026 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bhZqI1zw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BCE2FB965;
	Thu, 19 Feb 2026 09:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492851; cv=fail; b=n3GqjeMdsSfR/ahBQit9nHvEf+ZhCyC/tp2dS/N7k7pxpBa/5OcuwFV7NZ1Em/DPelYhMHTVbwYjh5j6ILNAuxhGt+2ULeXvXTWzKdaaN0uBzFmqwFwjdkKyiB9uGHuribJmHDMctHECOweCQI7QP7UgQq3pSXwh5t94rWokBo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492851; c=relaxed/simple;
	bh=D9PQ8wh23xMrrpDSPOVQE17065QXcx3l25q48J69aDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AnzyKgqlQKiQ/E4xA5DnS3YP88EzNm+dPVvSZs6cPOfDKmIdo9Fq6zq9dUvxDpvwcYLFNvPQYZdL79t/+bgsl65BUyItCY1pbpA4YV06iYuLU0sL9CtGLsmgb1vpIFPEeh3bNjLPZoJ3wAdg9WU659m0Vo+jCBegO5hjuJ2w+0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bhZqI1zw; arc=fail smtp.client-ip=52.101.69.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwOHwz6x+Z8Zxea+9hsYSkh+1V/alHdOGwOXtCv6kbfVcgPXZws+HVxrfvGcE3BYWz8n3BuuPF0oWB/bS9/XIwH+Wb02EPonVl2ZszlpfR3Oq0/Zh2pvRpYXY05gZA4ifUvaJ8SQ348T4hlhAOW0E0ZXOTZ/eWlyqohAxwvkuG11zPqf8g72+0ZrOu2Pb5GCMqK6tx6y+2pCIz4oBQrmPNbj/Pky1cv6EM0dgXLy3+ofNIMdrwvFb28pGhRmSKRHm9E0RXiTlknzzGfh7E4pj3aURM/jq7FdFBzlUMJARwBm/PvztchEzmF2TPy9phoCmfgR7nODWNGpGpmBa9PXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiBLJCl/fxtoEEDDljm8j4Za2GcQOwv61MxhQA+7cw8=;
 b=UpsHeN6Macg5x4n4A1beGMGIVBs37ZHvXQDTtYZwVQZoydTY3XvcDiERICdRFo6eyab5vGEktRkYJq8hu0nNbPmuosTJXtdlTNocQZeeccjEpBpfp76pXtPzEwaua8qefcI4kyFFMgLTA0evrCDXYzLOJ7Uc27rKDsryD3D37ui9LySDAilLvZtcpqAoHSr4fz+vn+Q6fBUVvM4n/OSaLSTOVeDkf3CbUhqjn0xR5s1IDl/idFQxfxl/RMrb5M8THKC4sSQgpw99P8MeY3ccr5BHcJtKkCymraSXyAC27N3+dBHl8Na1gsagR4CKeiuZc0WcVhB/EKzMxD00FQgBCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiBLJCl/fxtoEEDDljm8j4Za2GcQOwv61MxhQA+7cw8=;
 b=bhZqI1zwGHtoykjOmQyGWP17oDVtjz8QM2S9xpwYpfefArhhDwdjrTZ3LMOuZ8ziwLTybwwKCXiP7APlcq+I2m8Skm1mquMM59kHAKDk7bPlHwXHIDRYnEGF3k6YG1ems1h/B02y879P4hdy79qd+5ZXJmNWqGutCnmpP9RtgQIAL24Lm7JvYIlQ/Z28rqNN0VhW2WvYSpsom5tIWQOI23I+UV4ulo7FkPfUkYoldaj6fXhQrwX2NHdKRpHuNnu4sI93RO11z9+6ciOi9SLIrcPQFgVn6cbBhIYtU7Vrm0+EhTSAU286V5ZTnWlTE1ZLClD00IdC2wexbyUOHVTDaQ==
Received: from AM9P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::8)
 by VI1PR10MB3135.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:130::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 09:20:39 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::78) by AM9P250CA0003.outlook.office365.com
 (2603:10a6:20b:21c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 09:20:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 09:20:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 19 Feb
 2026 10:22:34 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 19 Feb
 2026 10:20:37 +0100
Message-ID: <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
Date: Thu, 19 Feb 2026 10:20:35 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	"Sascha Hauer" <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Peng Fan" <peng.fan@nxp.com>, <devicetree@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-imx@nxp.com>, "Bartosz
 Golaszewski" <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260212213656.662437-4-shenwei.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9D:EE_|VI1PR10MB3135:EE_
X-MS-Office365-Filtering-Correlation-Id: 481455e9-cbb5-4c88-2041-08de6f98256e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVZiS0pSQm9WKzB5YitaNzlFaFFVVFhNUWlkaUZTRWZHNWZsWjZQWGRxOHN2?=
 =?utf-8?B?cGdudVFEZDN0V1M1UkVnTVY3K0RPVFYyajdzUlc4aWtYV1o1b3J0cFhxeDAr?=
 =?utf-8?B?a0twaTRFZWphcnVYSmV0bStoeXpGT0xqbmoreVRySW0wRDZWN3ZLRFk2MEQy?=
 =?utf-8?B?ZkNXOURic1ZaK2hLeWxQZzlXaFNKcWlHTUt1bURGZXplT1Z1Y05aTFZ5YkNa?=
 =?utf-8?B?amNUWThUNk5pRXd4WXJWbFpzTWlxbldpVjVraGdYREZ5b1VwUkl3Z1hoQVN5?=
 =?utf-8?B?cGduUk1NTFhNa0hqdnIwaG8rWVpTVzl0cUZ0cFNtNTVTeFp5MG1IRlpTenRP?=
 =?utf-8?B?eHlnMmVTSXd2UDljbU45UUhrSjdBV3hHaHh6Q1ArbGhZeEFsV3JnZ0I3andv?=
 =?utf-8?B?bWIxci9PMTZUTlNTQnhDY1ZTSE1RK0V3eDQ2UDJDa2FORzRYaVpBY0pKV1Fm?=
 =?utf-8?B?S1VzcStrVVRZTjdmbWRlUnppUk9leFRoMHdzZUpaQ0cwbmZsOHJMa2tyTVBw?=
 =?utf-8?B?QU9xYlRGTVQ2WVhjbnhzVGhCRnFpQ1JRTldYT1JqSVVXNHJUREtuaGw3WHVT?=
 =?utf-8?B?R1M1cXBCby9aN1YycE40RkVNSHZYM0RDL2liSS8xUGcxMlV1VUNQcUJyOEo2?=
 =?utf-8?B?U2dEcmRaVFN1Tkc4ZlhGWFpSYlh6RUswSkFHN0g5QW5iV1FjdEJGZU5JNlFk?=
 =?utf-8?B?Ym9aUDhoL1J2NjBQcEFlZWVUaFBIaGZTWmsrNEhleGhjYWlIbUdNMDQvTC91?=
 =?utf-8?B?WS9jMWhOeVdNUTA0WXRxNGJDZ2xmWkVNb2JFZnBGTDc1V096QTl4dnBQcXhJ?=
 =?utf-8?B?VUU5WlZ2TGs5M3BRZ2FxclY0NUVNSm1zaVUxaHZYRXFkNm5ua3lkLzRnK296?=
 =?utf-8?B?ejJjQzdJNGpsNnV4ZWJEMEYvMFM1R0YvUzJDWWJOYXd1VjkvS0t3OHROdjRM?=
 =?utf-8?B?N2ZwL0VVWGFseE8vTzU0MmdqQSt5SFYrTDY2cHk1R2Q1czQ4TE5uWXhudXl1?=
 =?utf-8?B?VktTZndjaCtDeFlIUU1iWExrZTB0TjFpSVhBVHZ1cTZXYzRwSGhnWnhkMytM?=
 =?utf-8?B?bVBKeWRydnB3djAreStFNWVUc2l0SVZhUTROdmd6U0RmVkNyTHYvZThFaFdS?=
 =?utf-8?B?TFJyYVBpSHFyMFJiamZMRU9QMEZJbEd2Z0xVZm91R1QzUW5JOWdrdEUrcnE3?=
 =?utf-8?B?RkZFdTVNaGNpN0ZOaU81WHNwWHZ0a1pta0dleU9RbGExZncwRWJCTUpEekZT?=
 =?utf-8?B?ZVgxOUdoc1h4RytscEsreUNkVDJGYXFoN2duRU5tTnVCTUdsUThJR0MraTVR?=
 =?utf-8?B?ckREQ2pqNGIvUEJkZWgzS0liNzNYcmxFMGpZRHl3MFJ6dC9oajZqUWpEZ1pL?=
 =?utf-8?B?WlhyTGdRcWMrQ2xucUU3SkNKOWZXUzdicEdCRW80aVEzWHh5NG95VXlMZ0Mw?=
 =?utf-8?B?Y1ZiZS91UkJBT2JrcmhtaElraFdOQUo4dlBUSVdXY3RoRzM5dnpjUVZwRTA2?=
 =?utf-8?B?dzFoVTJKcTNaaHJLZE9kVGRnam1WM0FzbklieWgvaUlzMmZtNWlJS1hSNkRl?=
 =?utf-8?B?TUpaanJpclc2R3k0U2lDakE0ejVud1duRjJhL0tObU5sMlJMZUh2d1lqWnVG?=
 =?utf-8?B?WjZpUzE1c0xOeExXdFZRUk5YVHdwKzBJUzFDVW0xZnhhaGd3YVhsTHdFQnMy?=
 =?utf-8?B?bjk3QnRUcXB4K2hldWtIMVpoMmNaVjdSTVUyM0Zuc25QTnd6NjA5Sk8xc2hw?=
 =?utf-8?B?M1FnaksvbHpQdGV6dHRWSW9sM3J6aXExNFdGNW5mWXkvVDljM05YdWdtTXhr?=
 =?utf-8?B?dUhuekY0OGVqbWJza2JGVkxRS0JZMkc3d1lWOTZid05TRXBCeFVxWkUrTkU0?=
 =?utf-8?B?TDZwYVVEZUdhcDIyQjUycUxxUm84RDB3aXNVVkJZTmErTHEzOEo4ekQ1WVo5?=
 =?utf-8?B?REY5QytVNjFsWlBjeW13NkY2dU8zRFZZYkN1UUliUzZKcUp4UXJ4SVJMY1l6?=
 =?utf-8?B?WWRDVWYzc0s5ZFRJRGtENjUxcHYyMUZTQnMyVmFxM2YwOUtyVzBWUE5nNS84?=
 =?utf-8?B?UFhnaDUvNFlsMk90WlNrbWwzc0tWeGVFMExuV053NzJGaGdKM1ZIMjcyYW9E?=
 =?utf-8?B?c01xVS80OSsvOWFwc0k2RmRCQUJnRU1TTmxFaS9xZlc1VmZmOUpWQmNZNHRV?=
 =?utf-8?B?cWpNTHdwSHFnOXdRdTdORTYwYVlNcUQwbmI4NjBQUERHd3ZsbnlKVDJ1ZHV4?=
 =?utf-8?Q?i3l+GQ0+Uyhi99VnTOpiPVJgcgv7YPx2xVcBjs68Uw=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BfQ741BLDzt1j11h9MdNyDlk9A/g27aXE3FAgWZ5FXkvfXnuo5TLPBusYepi/umhdziC3jKS7cdbNVtJR9mffFqoMXgxOpWOQZAnyPKknH6V04olFdHxrEdqjGXKLwkZuvJir0ReiRGfT1HlxzCNDav01EzB4uQnEZxjjSvF9YFLHiFhc1xSJeuyx0cUThsnsOntjpEd0iiP2Uwec1pbGBqQ7sfTajOSyYZvbUVcDfxYJq3oYnofgnuWnyDi93e/PBhB02HjeLviNhIi9EB06dFj9h0WzPB/he+KWnFYrOLLgz7jgRrqQLgLgpy6bFXLnzHj1jYQ35BqzgeBfPgRUBPFQCic75SWx9TlGV12pTc0sLXOLasQ64ROYV2b7J9N29Kh3GzwRWPr9jXu3w6xQ5ys6h7X8Q2xwOpE+2X2f3GV0q5XwfVse29tM/6IAQGN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 09:20:38.6069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 481455e9-cbb5-4c88-2041-08de6f98256e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31853-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6DA3C15D508
X-Rspamd-Action: no action

Hello Shenwei,

This versiob seems much more generic, thanks!

On 2/12/26 22:36, Shenwei Wang wrote:
> On an AMP platform, the system may include two processors:
> 	- An MCU running an RTOS
> 	- An MPU running Linux
> 
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   drivers/gpio/Kconfig      |  17 ++
>   drivers/gpio/Makefile     |   1 +
>   drivers/gpio/gpio-rpmsg.c | 588 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 606 insertions(+)
>   create mode 100644 drivers/gpio/gpio-rpmsg.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b45fb799e36c..3179a54f0634 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1892,6 +1892,23 @@ config GPIO_SODAVILLE
>   
>   endmenu
>   
> +menu "RPMSG GPIO drivers"
> +	depends on RPMSG
> +
> +config GPIO_RPMSG
> +	tristate "Generic RPMSG GPIO support"
> +	depends on REMOTEPROC
> +	select GPIOLIB_IRQCHIP
> +	default REMOTEPROC
> +	help
> +	  Say yes here to support the generic GPIO functions over the RPMSG
> +	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
> +	  i.MX9x.
> +
> +	  If unsure, say N.
> +
> +endmenu
> +
>   menu "SPI GPIO expanders"
>   	depends on SPI_MASTER
>   
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index c05f7d795c43..501aba56ad68 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -158,6 +158,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
>   obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
>   obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
>   obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
> +obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
>   obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
>   obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
>   obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
> diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
> new file mode 100644
> index 000000000000..163f51fd45b5
> --- /dev/null
> +++ b/drivers/gpio/gpio-rpmsg.c
> @@ -0,0 +1,588 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2026 NXP
> + *
> + * The driver exports a standard gpiochip interface to control
> + * the GPIO controllers via RPMSG on a remote processor.
> + */
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +#include <linux/rpmsg.h>
> +
> +#define RPMSG_GPIO_ID		5
> +#define RPMSG_VENDOR		1
> +#define RPMSG_VERSION		0
> +
> +#define GPIOS_PER_PORT_DEFAULT	32
> +#define RPMSG_TIMEOUT		1000
> +
> +/* GPIO RPMSG header type */
> +#define GPIO_RPMSG_SETUP	0
> +#define GPIO_RPMSG_REPLY	1
> +#define GPIO_RPMSG_NOTIFY	2
> +
> +/* GPIO Interrupt trigger type */
> +#define GPIO_RPMSG_TRI_IGNORE		0
> +#define GPIO_RPMSG_TRI_RISING		1
> +#define GPIO_RPMSG_TRI_FALLING		2
> +#define GPIO_RPMSG_TRI_BOTH_EDGE	3
> +#define GPIO_RPMSG_TRI_LOW_LEVEL	4
> +#define GPIO_RPMSG_TRI_HIGH_LEVEL	5
> +
> +/* GPIO RPMSG commands */
> +#define GPIO_RPMSG_INPUT_INIT		0
> +#define GPIO_RPMSG_OUTPUT_INIT		1
> +#define GPIO_RPMSG_INPUT_GET		2
> +#define GPIO_RPMSG_DIRECTION_GET	3
> +
> +#define MAX_PORT_PER_CHANNEL    10
> +
> +/*
> + * @rproc_name: the name of the remote proc.
> + * @channel_devices: an array of the devices related to the rpdev.
> + */
> +struct rpdev_drvdata {
> +	const char *rproc_name;
> +	void *channel_devices[MAX_PORT_PER_CHANNEL];
> +};
> +
> +struct gpio_rpmsg_head {

Sometime the prefix is gpio_rpmsg, sometime rpmsg_gpio or just gpio,
could you use "rpmsg_gpio" prefix in the whole driver?

> +	u8 id;		/* Message ID Code */
> +	u8 vendor;	/* Vendor ID number */

Does this fields above are mandatory, seems that it is just some 
constant values that are useless.

> +	u8 version;	/* Vendor-specific version number */

Why it is vendor specific? the version should represent the rpmsg-tty 
protocol version.

> +	u8 type;	/* Message type */
> +	u8 cmd;		/* Command code */
> +	u8 reserved[5];

What is the purpose of this reserved field?

> +} __packed;
> +
> +struct gpio_rpmsg_packet {
> +	struct gpio_rpmsg_head header;
> +	u8 pin_idx;
> +	u8 port_idx;
> +	union {
> +		u8 event;
> +		u8 retcode;
> +		u8 value;
> +	} out;
> +	union {
> +		u8 wakeup;
> +		u8 value;
> +	} in;
> +} __packed __aligned(8);

Any reason to use __packed and alignement here?
This structure will be copied in a vring buffer right?

> +
> +struct gpio_rpmsg_pin {
> +	u8 irq_shutdown;
> +	u8 irq_unmask;
> +	u8 irq_mask;
> +	u32 irq_wake_enable;
> +	u32 irq_type;
> +	struct gpio_rpmsg_packet msg;
> +};
> +
> +struct gpio_rpmsg_info {
> +	struct rpmsg_device *rpdev;
> +	struct gpio_rpmsg_packet *reply_msg;
> +	struct completion cmd_complete;
> +	struct mutex lock;
> +	void **port_store;
> +};
> +
> +struct rpmsg_gpio_port {
> +	struct gpio_chip gc;
> +	struct gpio_rpmsg_pin gpio_pins[GPIOS_PER_PORT_DEFAULT];
> +	struct gpio_rpmsg_info info;
> +	u32 ngpios;
> +	u32 idx;
> +};
> +
> +static int gpio_send_message(struct rpmsg_gpio_port *port,

s/gpio_send_message/rpmsg_gpio_send_message

> +			     struct gpio_rpmsg_packet *msg,
> +			     bool sync)
> +{
> +	struct gpio_rpmsg_info *info = &port->info;
> +	int err;
> +
> +	reinit_completion(&info->cmd_complete);
> +	err = rpmsg_send(info->rpdev->ept, msg, sizeof(struct gpio_rpmsg_packet));
> +	if (err) {
> +		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
> +		return err;
> +	}
> +
> +	if (sync) {
> +		err = wait_for_completion_timeout(&info->cmd_complete,
> +						  msecs_to_jiffies(RPMSG_TIMEOUT));
> +		if (err == 0) {
> +			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> +			return -ETIMEDOUT;

strange condition you return an error if err == 0, for redability use 
'ret' variable or simply:

		if(!wait_for_completion_timeout(&info->cmd_complete,
				  msecs_to_jiffies(RPMSG_TIMEOUT)) {
			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
			return -ETIMEDOUT;
		}

> +
> +		if (info->reply_msg->out.retcode != 0) {
> +			dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
> +				info->reply_msg->out.retcode);
> +			return -EINVAL;
> +		}
> +
> +		/* copy the reply message */
> +		memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
> +		       info->reply_msg, sizeof(*info->reply_msg));
> +	}
> +
> +	return 0;
> +}
> +
> +static struct gpio_rpmsg_packet *gpio_setup_msg_common(struct rpmsg_gpio_port *port,
> +						       unsigned int offset,
> +						       u8 cmd)
> +{
> +	struct gpio_rpmsg_packet *msg = &port->gpio_pins[offset].msg;
> +
> +	memset(msg, 0, sizeof(struct gpio_rpmsg_packet));
> +	msg->header.id = RPMSG_GPIO_ID;
> +	msg->header.vendor = RPMSG_VENDOR;
> +	msg->header.version = RPMSG_VERSION;
> +	msg->header.type = GPIO_RPMSG_SETUP;
> +	msg->header.cmd = cmd;
> +	msg->pin_idx = offset;
> +	msg->port_idx = port->idx;
> +
> +	return msg;
> +}
> +
> +static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_packet *msg;
> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_common(port, gpio, GPIO_RPMSG_INPUT_GET);
> +
> +	ret = gpio_send_message(port, msg, true);
> +	if (!ret)
> +		ret = !!port->gpio_pins[gpio].msg.in.value;
> +
> +	return ret;
> +}
> +
> +static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_packet *msg;
> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_common(port, gpio, GPIO_RPMSG_DIRECTION_GET);
> +
> +	ret = gpio_send_message(port, msg, true);
> +	if (!ret)
> +		ret = !!port->gpio_pins[gpio].msg.in.value;
> +
> +	return ret;
> +}
> +
> +static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_packet *msg;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_common(port, gpio, GPIO_RPMSG_INPUT_INIT);
> +
> +	return gpio_send_message(port, msg, true);
> +}
> +
> +static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_packet *msg;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_common(port, gpio, GPIO_RPMSG_OUTPUT_INIT);
> +	msg->out.value = val;
> +
> +	return gpio_send_message(port, msg, true);
> +}
> +
> +static int rpmsg_gpio_direction_output(struct gpio_chip *gc,
> +				       unsigned int gpio,
> +				       int val)
> +{
> +	return rpmsg_gpio_set(gc, gpio, val);
> +}
> +
> +static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +	int edge = 0;
> +	int ret = 0;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		edge = GPIO_RPMSG_TRI_RISING;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		edge = GPIO_RPMSG_TRI_FALLING;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		edge = GPIO_RPMSG_TRI_BOTH_EDGE;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		edge = GPIO_RPMSG_TRI_LOW_LEVEL;
> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		irq_set_handler_locked(d, handle_bad_irq);
> +		break;
> +	}
> +
> +	port->gpio_pins[gpio_idx].irq_type = edge;
> +
> +	return ret;
> +}
> +
> +static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_wake_enable = enable;
> +
> +	return 0;
> +}
> +
> +/*
> + * This unmask/mask function is invoked in two situations:
> + *   - when an interrupt is being set up, and
> + *   - after an interrupt has occurred.
> + *
> + * The GPIO driver does not access hardware registers directly.
> + * Instead, it caches all relevant information locally, and then sends
> + * the accumulated state to the remote system at this stage.
> + */
> +static void gpio_rpmsg_unmask_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_unmask = 1;
> +}
> +
> +static void gpio_rpmsg_mask_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	/*
> +	 * When an interrupt occurs, the remote system masks the interrupt
> +	 * and then sends a notification to Linux. After Linux processes
> +	 * that notification, it sends an RPMsg command back to the remote
> +	 * system to unmask the interrupt again.
> +	 */
> +	port->gpio_pins[gpio_idx].irq_mask = 1;
> +}
> +
> +static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_shutdown = 1;
> +}
> +
> +static void gpio_rpmsg_irq_bus_lock(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +
> +	mutex_lock(&port->info.lock);
> +}
> +
> +static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	struct gpio_rpmsg_packet *msg = NULL;
> +	u32 gpio_idx = d->hwirq;
> +
> +	/*
> +	 * For mask irq, do nothing here.
> +	 * The remote system will mask interrupt after an interrupt occurs,
> +	 * and then send a notify to Linux system.
> +	 * After Linux system dealt with the notify, it will send an rpmsg to
> +	 * the remote system to unmask this interrupt again.
> +	 */
> +	if (port->gpio_pins[gpio_idx].irq_mask && !port->gpio_pins[gpio_idx].irq_unmask) {
> +		port->gpio_pins[gpio_idx].irq_mask = 0;
> +		mutex_unlock(&port->info.lock);
> +		return;
> +	}
> +
> +	msg = gpio_setup_msg_common(port, gpio_idx, GPIO_RPMSG_INPUT_INIT);
> +
> +	if (port->gpio_pins[gpio_idx].irq_shutdown) {
> +		msg->out.event = GPIO_RPMSG_TRI_IGNORE;
> +		msg->in.wakeup = 0;
> +		port->gpio_pins[gpio_idx].irq_shutdown = 0;
> +	} else {
> +		/* if not set irq type, then use low level as trigger type */
> +		msg->out.event = port->gpio_pins[gpio_idx].irq_type;
> +		if (!msg->out.event)
> +			msg->out.event = GPIO_RPMSG_TRI_LOW_LEVEL;
> +		if (port->gpio_pins[gpio_idx].irq_unmask) {
> +			msg->in.wakeup = 0;
> +			port->gpio_pins[gpio_idx].irq_unmask = 0;
> +		} else /* irq set wake */
> +			msg->in.wakeup = port->gpio_pins[gpio_idx].irq_wake_enable;
> +	}
> +
> +	gpio_send_message(port, msg, false);
> +	mutex_unlock(&port->info.lock);
> +}
> +
> +static const struct irq_chip gpio_rpmsg_irq_chip = {
> +	.irq_mask = gpio_rpmsg_mask_irq,
> +	.irq_unmask = gpio_rpmsg_unmask_irq,
> +	.irq_set_wake = gpio_rpmsg_irq_set_wake,
> +	.irq_set_type = gpio_rpmsg_irq_set_type,
> +	.irq_shutdown = gpio_rpmsg_irq_shutdown,
> +	.irq_bus_lock = gpio_rpmsg_irq_bus_lock,
> +	.irq_bus_sync_unlock = gpio_rpmsg_irq_bus_sync_unlock,
> +	.flags = IRQCHIP_IMMUTABLE,
> +};
> +
> +static void rpmsg_gpio_remove_action(void *data)
> +{
> +	struct rpmsg_gpio_port *port = data;
> +
> +	port->info.port_store[port->idx] = NULL;
> +}
> +
> +static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev, struct device_node *np)
> +{
> +	struct rpdev_drvdata *drvdata = dev_get_drvdata(&rpdev->dev);
> +	struct rpmsg_gpio_port *port;
> +	struct gpio_irq_chip *girq;
> +	struct gpio_chip *gc;
> +	int ret;
> +
> +	port = devm_kzalloc(&rpdev->dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32(np, "reg", &port->idx);
> +	if (ret)
> +		return ret;
> +
> +	if (port->idx >= MAX_PORT_PER_CHANNEL)
> +		return -EINVAL;
> +
> +	ret = devm_mutex_init(&rpdev->dev, &port->info.lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_u32(np, "ngpios", &port->ngpios);
> +	if (ret)
> +		port->ngpios = GPIOS_PER_PORT_DEFAULT;
> +
> +	init_completion(&port->info.cmd_complete);
> +	port->info.reply_msg = devm_kzalloc(&rpdev->dev,
> +					    sizeof(struct gpio_rpmsg_packet),
> +					    GFP_KERNEL);
> +	port->info.port_store = drvdata->channel_devices;
> +	port->info.port_store[port->idx] = port;
> +	port->info.rpdev = rpdev;
> +
> +	gc = &port->gc;
> +	gc->owner = THIS_MODULE;
> +	gc->parent = &rpdev->dev;
> +	gc->fwnode = of_fwnode_handle(np);
> +	gc->ngpio = port->ngpios;
> +	gc->base = -1;
> +	gc->label = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
> +				   drvdata->rproc_name, port->idx);
> +
> +	gc->direction_input = rpmsg_gpio_direction_input;
> +	gc->direction_output = rpmsg_gpio_direction_output;
> +	gc->get_direction = rpmsg_gpio_get_direction;
> +	gc->get = rpmsg_gpio_get;
> +	gc->set = rpmsg_gpio_set;
> +
> +	girq = &gc->irq;
> +	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->chip->name = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
> +					  drvdata->rproc_name, port->idx);
> +
> +	ret = devm_add_action_or_reset(&rpdev->dev, rpmsg_gpio_remove_action, port);
> +	if (ret)
> +		return ret;
> +
> +	return devm_gpiochip_add_data(&rpdev->dev, gc, port);
> +}
> +
> +static const char *rpmsg_get_rproc_node_name(struct rpmsg_device *rpdev)
> +{
> +	const char *name = NULL;
> +	struct device_node *np;
> +	struct rproc *rproc;
> +
> +	rproc = rproc_get_by_child(&rpdev->dev);
> +
> +	if (!rproc)
> +		return NULL;
> +
> +	np = of_node_get(rproc->dev.of_node);
> +	if (!np && rproc->dev.parent)
> +		np = of_node_get(rproc->dev.parent->of_node);
> +
> +	if (np) {
> +		name = devm_kstrdup(&rpdev->dev, np->name, GFP_KERNEL);
> +		of_node_put(np);
> +	}

What about simply returning rproc->name?

> +
> +	return name;
> +}
> +
> +static struct device_node *
> +rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, char *chan_name)
> +{
> +	struct device_node *np_chan = NULL, *np;
> +	struct rproc *rproc;
> +
> +	rproc = rproc_get_by_child(&rpdev->dev);
> +	if (!rproc)
> +		return NULL;
> +
> +	np = of_node_get(rproc->dev.of_node);
> +	if (!np && rproc->dev.parent)
> +		np = of_node_get(rproc->dev.parent->of_node);

Is a topology where they is no rproc->dev node but a parent node exist?

> +
> +	if (np) {
> +		/* Balance the of_node_put() performed by of_find_node_by_name(). */
> +		of_node_get(np);
> +		np_chan = of_find_node_by_name(np, chan_name);
> +		of_node_put(np);
> +	}
> +
> +	return np_chan;
> +}
> +
> +static int
> +rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
> +			    int len, void *priv, u32 src)
> +{
> +	struct gpio_rpmsg_packet *msg = data;
> +	struct rpmsg_gpio_port *port = NULL;
> +	struct rpdev_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(&rpdev->dev);
> +	if (drvdata && msg && msg->port_idx < MAX_PORT_PER_CHANNEL)
> +		port = drvdata->channel_devices[msg->port_idx];
> +
> +	if (!port)
> +		return -ENODEV;
> +
> +	if (msg->header.type == GPIO_RPMSG_REPLY) {
> +		*port->info.reply_msg = *msg;
> +		complete(&port->info.cmd_complete);

What happen if the remoteprocessor answer after the completion timeout?
Could it result in desynchronization between the request and the answer?

Having a cmd_counter in gpio_rpmsg_head could help to identify current 
request and answer

the use of reinit_completion could be also needed

> +	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
> +		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->pin_idx);
> +	} else
> +		dev_err(&rpdev->dev, "wrong command type!\n");

Could you print the msg->header.type value to help for debug?

> +
> +	return 0;
> +}
> +
> +static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev)
> +{
> +	struct device *dev = &rpdev->dev;
> +	struct rpdev_drvdata *drvdata;
> +	struct device_node *np;
> +	int ret;
> +
> +	if (!dev->of_node) {
> +		np = rpmsg_get_channel_ofnode(rpdev, rpdev->id.name);
> +		if (np) {
> +			dev->of_node = np;
> +			set_primary_fwnode(dev, of_fwnode_handle(np));
> +		}
> +		return -EPROBE_DEFER;
> +	}
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->rproc_name = rpmsg_get_rproc_node_name(rpdev);
> +	dev_set_drvdata(dev, drvdata);
> +
> +	for_each_child_of_node_scoped(dev->of_node, child) {
> +		if (!of_device_is_available(child))
> +			continue;
> +
> +		if (!of_match_node(dev->driver->of_match_table, child))
> +			continue;
> +
> +		ret = rpmsg_gpiochip_register(rpdev, child);
> +		if (ret < 0)
> +			dev_err(dev, "Failed to register: %pOF\n", child);
> +	}
> +
> +	return 0;

return ret
or indicate why the return of rpmsg_gpiochip_register is not taken into 
account


> +}
> +
> +static void rpmsg_gpio_channel_remove(struct rpmsg_device *rpdev)
> +{
> +	dev_info(&rpdev->dev, "rpmsg gpio channel driver is removed\n");
> +}
> +
> +static const struct of_device_id rpmsg_gpio_dt_ids[] = {
> +	{ .compatible = "rpmsg-gpio" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> +	{ .name	= "rpmsg-io-channel" },

I would remove the "-channel" suffix to have similar naming than 
"rpmsg-tty" and "rpmsg-raw"

Regards,
Arnaud

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
> +
> +static struct rpmsg_driver rpmsg_gpio_channel_client = {
> +	.drv.name	= KBUILD_MODNAME,
> +	.drv.of_match_table = rpmsg_gpio_dt_ids,
> +	.id_table	= rpmsg_gpio_channel_id_table,
> +	.probe		= rpmsg_gpio_channel_probe,
> +	.callback	= rpmsg_gpio_channel_callback,
> +	.remove		= rpmsg_gpio_channel_remove,
> +};
> +module_rpmsg_driver(rpmsg_gpio_channel_client);
> +
> +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
> +MODULE_DESCRIPTION("generic rpmsg gpio driver");
> +MODULE_LICENSE("GPL");


