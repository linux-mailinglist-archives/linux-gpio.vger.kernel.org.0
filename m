Return-Path: <linux-gpio+bounces-14338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D0C9FE18B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 02:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3DEA7A1015
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 01:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F3B17588;
	Mon, 30 Dec 2024 01:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TUXjMUZi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D02C2F44;
	Mon, 30 Dec 2024 01:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735520583; cv=fail; b=XbNZnfrOpeP8r1nYrlx8LT5N9GvPg4DhXbvIo3GjBtocZlyRNIJgpeMMGBgdiY3EO1eYzHHTiRHsojG1KS8OdgF668o/Y+SUAHooNjOwEYLKPU6Oo6rlXtTmzRxJzDKcRmbr2dkupKbG9vTVBNZ6539FgOUZJvYtSCKnYG1D63o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735520583; c=relaxed/simple;
	bh=44M+eSikR226/w46xtnlJ8tyUiCe2bPjDdXczN8ExZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Lmcrnoj+VJiNRTUMbjxi2O1Glz/WrbAM7RQQ1Qska82Jk9shye6l2Ygldtvl37DSdd1S9xYDmFfBxsNXId+TBf06/kiO7eYA6Qcn4Rx2Qw4QqB/fKwdhOvwut1SaK1X34wzobvGQS/LETu8D0po1mOfurQruqRAmG9cK0rhy17M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TUXjMUZi; arc=fail smtp.client-ip=40.107.20.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqzgTY4klD/4Qz/8qzsk5fXI55QdGWjdETg5s94637zSb8kxY6ZbliiBzi+vYzUht+9TZsZpH2wwuabH4xXjc5bIX2fNAJsYuzth7/3yQ/ldUXaYVQzm4miUmbaAxhucTjQ6S10V3JJnGNTfsiAVcvZfrBdF9myK9bCvLxv9JYRWC9KcIXcwT7/OLBAl+i3yQ5LB0p0IKhTQwKQLMwHGbrQ3rDvRA8Nam1yvEPUxrVMogcahTyzLKOqoWgwV5Yy8RFdwKMY64lNZXMYct4Hjv+Vmf/m4lzZOEUN2zqWf7AXrwRcT1VDUyL7zPCRkZiaZJcg8AkwhQqFcLlaSx/aqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44M+eSikR226/w46xtnlJ8tyUiCe2bPjDdXczN8ExZw=;
 b=W+g1C391b4A282xxTmKNw4Kq6a4o+wYmb1CzXbeXCbSMnu5n5XZIgIwTn1zsIAo41PaiDTt15hJ6mll3PFEhBCpKy7LyT7n96riVthmfg+pM4KEL/hIppK7RADJq22M2FIIGF531wP9CyHIZ7YYf9a3mTv4W/EF9Ox71vQB2pWJ+M01pqkN65t+pPFiz3CfDb1bvETicUKoiterUsYNif5356gBhWYIO20WYnPxU8Q97ZE/ESQDYJZqy2Se4/Bv3vL8XY17FPsJg3CI9HEqD1qGuqLOGvhXUlQNKX2n9rqwJbYtFmEiOHqMYC5RMZMBgwLHaHUNqRABcVyZgPLMUOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44M+eSikR226/w46xtnlJ8tyUiCe2bPjDdXczN8ExZw=;
 b=TUXjMUZi65Man/1W+48bq5BlmffO6tWK8mV0HK9fN2Ng3dMjmoHl4rQRVwlJs6Pyxi1d9KniHAqRkMvC8Rdlk1fk7tuMA5WDriVcWcEP7SfeVU2FvTwZ3/NITWVcX3lKRmyrSrWT6Q82BdztrbuFkPlOUU/teQs5yKaDHmXIJrF1NkVhgNReu+FUyjXOHgWWw/U9t1zGcKj3UkAom/V/FfGU4OK/VnYgBShbqpipp4F1ex0GXXNHC+5P1qtey5ftGQLiV1UocsYkrtY8ulyjsMP+cWJwNn/oWMjWJ24QQ9MTKHJhLlsM+3P5w3j1s4dNSMwzeU5uZwm+VPVaSCP2OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9086.eurprd04.prod.outlook.com (2603:10a6:150:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Mon, 30 Dec
 2024 01:02:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 01:02:54 +0000
Date: Mon, 30 Dec 2024 10:08:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Message-ID: <20241230020841.GF28662@localhost.localdomain>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
 <20241227152807.xoc7gaatejdrxglg@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227152807.xoc7gaatejdrxglg@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: 324b2af3-6f72-44f9-a04d-08dd286db126
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yLRJZlAQmJ0hGQj3mde03jZkiTmchOiBp5EGLOHUvQ21AUHoy/9HdrLabJce?=
 =?us-ascii?Q?ZTD4ThEL9PdE3SXKgdKjt8tcK3lko+kJgeW4dFiaLegcQWde9PlCWQH0BsI2?=
 =?us-ascii?Q?NHgq2Xn1HIt/DmJ6lPtM4vAsPL8PdZP28BCj4ADH9VFcwcN7Kgm/3O7IeFEt?=
 =?us-ascii?Q?k4bmPM3q2f54obCLmyGT7k5u8n5rDYOgNfZFKeTULlVFRzgEn8zqPGW1oyMS?=
 =?us-ascii?Q?yYJiD6D5pbuuS6XjpAVSWFw2TEXH+D7SnnRSQUsNGZgGb9I6J4kqdHzIFUMn?=
 =?us-ascii?Q?eL1v0036kyPnacoj32gDAC1xMh3FTrAS6R678J/1nNldzO5LlfexMaeh12Vm?=
 =?us-ascii?Q?4zlUoTMj1H5K9+Pxjz5osIXVC4as67hufc3MObDlWza1yD8NvsHcww/Cux9R?=
 =?us-ascii?Q?p/NdbSQZN4OF1eCb7Kxe2WOchgj97mch/HkRwGOXGb/jWTyzNrgNfllXSS0o?=
 =?us-ascii?Q?4wP4zMRIW9iji7MLi0S8ukFKFQHJk9yySCTliqLKvIEAMjnQR02ADGhnFtXJ?=
 =?us-ascii?Q?pGZkAQcT/kQWGfhkBQhHQ54lU27ktjsauyE0ZBHpT/QH+K3i0P5BGxEJPNHW?=
 =?us-ascii?Q?6fwqBX5CgwxCWTdRmlN0FvEjuvsgTwvyejqoQLBVTgNJ8HY/vhmFDHpoJVzv?=
 =?us-ascii?Q?sxL8649qEjg/iNfVSWGv62wEQtu11eqE/qG4+9IXqqOmI+WYcqtKkXPznhxO?=
 =?us-ascii?Q?zoM0mYQyXfIkdCT4lElVVNM/PS0glvRgTgy5wTsKqIJbZXsirT7szZqs4Fb4?=
 =?us-ascii?Q?gnTqeC7mj2+PsdpBcSplU37XoogBKPvJQaqy6PX7bd5ycQq5s0tlz16JNIbe?=
 =?us-ascii?Q?CAAjkPupalTSXK5V0TrG6mAlE2AE30P0vmATY9xNE2e5WbgUYBasbjtphW2h?=
 =?us-ascii?Q?e5liQqa+ylY5kMCYVO2vmMbv9ztM+ICJhr9Z6WHS+a1eq6SeO85RAZftqXrK?=
 =?us-ascii?Q?8qoq+671bN3y1rNXPsj3aIawkfTCi3ZFqvYboXvMoQpVtIWNvxLT0s3Ze3EK?=
 =?us-ascii?Q?wPAuFNaqyAu3lNoGnlRzQ9qKizApsWw95g9rn1cqfC4qXt5oQHjGfSWLCb9K?=
 =?us-ascii?Q?c0y1W6fphV/44QeMAFb26t1EEfkmGzFpcSJ9Surfeet9jyw0NbUlrZeTl4R+?=
 =?us-ascii?Q?NP8ya3ifqQMBdvg9C84AIQZjJ+D5H9B9qcsMvtqBviOqxdtztzX3z66HDSxX?=
 =?us-ascii?Q?ggJTXS6eQto33EDIhE8VeXbtoZmWy7ur6Y7LzeqcFW+ZdORGhYta5HpbAdZE?=
 =?us-ascii?Q?N+O4HM1Iem2rGeYBaN88lpxyJLPoPJDqKOJzmzO+OzKrHBGLupiRyWnxgoJ8?=
 =?us-ascii?Q?2CMosy3CcquoQYipben9x4x72Lzz44L7W8rqvux2Y9IzJJuZCAIEfV2J63j6?=
 =?us-ascii?Q?n4vPFyJFZAZfMjw49Oq5DaMZwWdHyjJzi99HLuv69U5/QM6oCyqTGDzF9wKI?=
 =?us-ascii?Q?prbw0JaOwPke8Zc7GX0L3y9XerW3bHrX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L59x+lb4us2qUxoB0Lgfr2+enhFGKGDZTA8svIyedejBK4TlNpuT2in1zb/j?=
 =?us-ascii?Q?Ikfj34UIpFm2oh8XpQsRyhErBUNCgyoEDX9okXLy+RLPtJSxqYcoePR1c0iY?=
 =?us-ascii?Q?TdrkNCe+6f6lQxxL5AxFkjdaBtu/8zkXLUS7POBrOHy9NLf9rLKrYNbTSxxw?=
 =?us-ascii?Q?0gYH2Y0NbfkoI68yFrkcIGDJ6wI2b5pWsU3PQQCf1bEZbiHhzeJAsKZ4F3Wp?=
 =?us-ascii?Q?9FVh7FDO+SwWpD5e+nzGXC/NshoMPa4/StcX0qNw466dy+cZf+ghN5PcogD0?=
 =?us-ascii?Q?mYVxVbXPZS3mGDIa1vvmY/jp/rOWaioJSqX0fGM/tBJ78wnO4Nicwp5KJmEO?=
 =?us-ascii?Q?KCM0jo409xKfl5zyTG5x5sfqHHfh+rx1xPJHVzqqd8DElknpG6Bb3EzfQ2Zk?=
 =?us-ascii?Q?XsM8LaXXanbP2771pTvmRKICQONH19Y1fUL3zRFg2HIvVotM0xEv8ItTMW/b?=
 =?us-ascii?Q?fTJz2FMX6ql1OuIfIgGsQ0kD18xOBkdoCYu2WvLP90lfCLDtyj05+TXjaItj?=
 =?us-ascii?Q?nNVA0Q/KVzbh/kxM8nzNCZmOxAKocBtKLUgNx11714X7E21OHoyHEMj++KD9?=
 =?us-ascii?Q?AoxhJjnCoqdScKPCI88njoMaUeARCqYINmp0XlP7QQvRTtty+9W1CsRpqhRW?=
 =?us-ascii?Q?GxARAwkTOAGJ8wQQqxdQXIkXA23hIsyBvGL9wY9C2OCz7aqfTqtk6zywbuyU?=
 =?us-ascii?Q?C3srNL/Rd+pbKlbZNIwZM9ef1Uvahkc2RZabLLwX4PMRVfCLjj9i1dhAcCwk?=
 =?us-ascii?Q?B67OKfjeysfD3cHtw/thhv2YRNC4TzhGSfvaemq+3cQUCk4xdUxlt3K+IcTw?=
 =?us-ascii?Q?jPC0XxiEnuH7kuM9u+UV2URM2dgeI2XYFs/Nfj67w9sYb5Ue9YVoBVeM9Vc6?=
 =?us-ascii?Q?iuGzz6dmAzbvrjhT2D08lq+mdnfIdT6GBmouzWQyxKtCvsj2oq6Zq1SVJ0Ff?=
 =?us-ascii?Q?0K5VYXHv6z1uV5l+v/RbR2/sp84yarApY1XEmxxuBDpkJtfesdQKgxYSek/V?=
 =?us-ascii?Q?jI0c/SVJ0oyvvJOKLhTHXlu8Ozoia71QQ8iJdvx3hC25QHB0CfRpyq2gFsB9?=
 =?us-ascii?Q?Tvh+QuKMWNd7PRgBOH9dPWD7CDMaH9TbGy0Bvk3Wk26Lrz2swrSodm4OGKOj?=
 =?us-ascii?Q?hzk5FLkithdihgBDvwHYgpuiZ8IwC7Ku58OVrs/A/DgzqGdw0C6LTXNVqgnV?=
 =?us-ascii?Q?ny7OGdtCdWLTnK4FLjfLTWorKBdM08hzl4T95weAI6noLKQvYREQSdhgNdfo?=
 =?us-ascii?Q?zFAYbtqRENDkg0Hsz9BPbrPM7YebuSUMqDS/g5bm5bqCnok82SAEvEs41sSx?=
 =?us-ascii?Q?KmX7cSHn+nFtLojcv6qi7DcPomFk7QJJO6iVCKxcGPQ6ttu1MuYhoIF5g8a6?=
 =?us-ascii?Q?GKlakRde7gKGbiezTN+1/R0TW/NddRfpNUl+2jFN6uR5i23MEn0rxmFFddIw?=
 =?us-ascii?Q?ir1V/KuQiZVS5Anwp7gymN/hfMz3VXHaxzOgOsz+1XJwIvKoSH2Y6zQ43Dig?=
 =?us-ascii?Q?xAA34B2vPnpj3yK65P95mcEPzwiXJP2eISfdbiQk8ONmW5nDoqUk3413p2s3?=
 =?us-ascii?Q?QfWOS7AWj0B3evTI6+HoI3sM2i5JpjhqYcgJp47l?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324b2af3-6f72-44f9-a04d-08dd286db126
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 01:02:54.6308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPxMZvjd5VeisAslCaw4e7T3sh8bNs12g9IF5kKMms1gbX/p15gtZXXiRiKJL0oPbqNUSe4HM27lkb4EpAyC0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9086

On Fri, Dec 27, 2024 at 03:28:07PM +0000, Sudeep Holla wrote:
>On Wed, Dec 25, 2024 at 04:20:45PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
>> If both drivers are built in, and the scmi device with name "pinctrl-imx"
>> is created earlier, and the fwnode device points to the scmi device,
>> non-i.MX platforms will never have the pinctrl supplier ready.
>>
>
>I wonder if we can prevent creation of "pinctrl-imx" scmi device on non
>i.MX platforms instead of this hack which IMO is little less hackier
>(and little more cleaner as we don't create problem and then fix here)
>than this change.

I thought two ways that introduce new entries in scmi_device_id,
1. compatible string.
2. allowed machine string and blcoked machine string.

Thanks,
Peng
>
>--
>Regards,
>Sudeep

