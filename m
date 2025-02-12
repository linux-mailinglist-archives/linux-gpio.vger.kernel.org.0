Return-Path: <linux-gpio+bounces-15791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBD0A31DCD
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71EA816599A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 05:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725FF1E376E;
	Wed, 12 Feb 2025 05:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BkYv6FRq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2067.outbound.protection.outlook.com [40.107.247.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E579E1C5F39;
	Wed, 12 Feb 2025 05:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739337540; cv=fail; b=iutjkoazY3dB9fwx5o8mllE6SKSCoeytwoOV4AxT0GyrBlqt9SqUz8JAfoJE3VcjVVw9fvSGsgGzsEmMtEb1nNWe/hbOkMCFXGm7XUMvRmx7bf1h2vaNx1klZtaD95ckwzB/gxuaC5hWLWEbJYyEAxplWWYRaVCKv+5I4hxelbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739337540; c=relaxed/simple;
	bh=NhjJHp1xV0dNYMvd/JSdIefKGP49/bTCO6D53j3exiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GisKyBDPAR6//ISJAAf+0z5vfIbLDmMcIQwScA4sB34iFI17VnMFrLPbOUmYQCG1ZKZ8jd6Ukqe+nHLJtftgbit+atI4VQLp3amaNS7BCJUXUWCTKQKNHh8raEy8j6Vh+O6DvdfUBvLTIz6dNHMPpq85YyKaLE94NWVQOpHV2I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BkYv6FRq; arc=fail smtp.client-ip=40.107.247.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKU2ha67aIvcLap8bq5ssMbR8p3hTr5wrYgR3jJWxwgVbBXDJE80DI/ybDilCYiJ9FLMxgFbEvjSP74pr2W1lvEUVGYB0n+bJMQLEQ+u0q/yW39FTLEj92aCa1i9IQtWnHOjVl6UJdFT5RKOwRPKxwbYz6r1CdUGLRl6wev7rtfS8ROeVWXNUbnDgIEobK4ByN2vmOnV2ZgVZNIsCS3iAgacYArxGZDI4yVCxjJu9fmCe7nkFcltgzf48xMu/bEjHvJEcHasCr2uqcCMsGWjvvy2XoeZwKM5/9qTeqSMf+cRbgelO5IDB4UN2QGcKuJAuFHhcoyM5No3X3C7aqGRJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdjS/on2bIDeiZ+3UlHAe7g/9mw2F7VQZCXFM/xs54o=;
 b=DpOnJNxeJJPvb/V6AuMiKbJjyzaeDwgXGS5D9N+E9kDs7ToqMSNdaTAeuN/gxFCrREHVyYrr63zmA4gEwzkbAV2xp7P1aiRiBJo3iWGlMWbNvKTeDThzKz+aB6c9Ys+byG75kbiB0VZRvG6NB3TFJYamMXxRMo34mD5s46lwgpYG9SHNDdIgre+npOi17Vs7/LkIjXAi+lkQT/FkEJMQHr1OOg3N8SNyHzMxwaFP8QSfnMyZhM8DMEClKiIRJeyR5YsC2GRfFkcmnLOro1n/R2P6D5uVACQglQ/98eIL2nrwKJkxjEP2qc72DoDu+mC9TTcXDFAV9GL/ihx13oTHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdjS/on2bIDeiZ+3UlHAe7g/9mw2F7VQZCXFM/xs54o=;
 b=BkYv6FRq5+n3VAvHtZXeY7T4lik5WOum4yYHImD4y8U6M0J5Ad7CSr+WaGUmmBLzTDI4/yHERI3TeOEDhrya5++d0/4VU2wMZcIMN2Oqg979vTSa+ojvvnQlPOBSnUmjPZkYB5Wb5rjiNLA/6KorRILcGpdg2oPmsn5G9TNXIhGG7jf4PHDdM4Dfh695kiwngCyyZ8LZlWtsxAdGNauw8kUzvOBvk9FlVU8mdJb6E84ZVlJV9i5Qxhyi63cfqEFGIpBn/rLL/A81UmU8rf/YlB6ruFcqeZ9OWF4vM3Io4StqMWRxEkP6dJCI2PVMw9Ae6kMXdVc7HEr1QIN+oykroQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9657.eurprd04.prod.outlook.com (2603:10a6:10:31c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Wed, 12 Feb
 2025 05:18:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 05:18:53 +0000
Date: Wed, 12 Feb 2025 14:25:42 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <20250212062542.GA15796@localhost.localdomain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <Z6Slq4KjS_RJ3ItB@pluto>
 <PAXPR04MB8459A3750512708D2972687388F22@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6tw3HjhI8to4c-E@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6tw3HjhI8to4c-E@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1fe781-468d-4758-62c2-08dd4b24bde5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vx4djztCf5Fbl4TqXrBF88BazkhhUi90XfmXkz+u+bjgNbY/dyco0F76cRVz?=
 =?us-ascii?Q?mvC0jLq1kzM/CsMGX4BtCA+cRQahwQL8cIlB392zRroVSKaYotW8EXS1uJ18?=
 =?us-ascii?Q?44vVJ5mq02LW9fN7fgb2oWwGr2JiyepkcJ0c+2fhL4W1YVFmPPXcrv2x47S5?=
 =?us-ascii?Q?90dERbORVUGOIg3EwNMSS5QbA/GVxyswcccNIR1UnOQD54fA6NbR66xXHAWB?=
 =?us-ascii?Q?at/cXVQzV4OZ5qgN4zGIqUDOAloO9NdRrzOWeoMYaLLYKKvl5ADWxVWdXLuo?=
 =?us-ascii?Q?uiyjn6TGMdtv41RSzxW+D0OoyeD8P9iupSOA9mn1CyoEYm09Bx6P5lKcGIbB?=
 =?us-ascii?Q?zVwG5r/WJbCH+p6WBuS9gZUHwtmgNj1pRBjBzqKlcYc4JSo5eSjC/A8a/sIj?=
 =?us-ascii?Q?V3/QJT6f3WZ0bn6WfgELmggjxa/P1qKBrC5iz3VBCCW2Kf4FIGbO7+NqW1LQ?=
 =?us-ascii?Q?McHLEzyClTZcosEHN9IxS9xwNeaJCypBd1j8vxn5uLDRGtDdQUw8NQE+3Z9k?=
 =?us-ascii?Q?XO+VS8N77khhvcQuTxBGzj6+4DqNzLjoRnxYHAuqb6RXCmRW5BzMbNWRtqvC?=
 =?us-ascii?Q?sPYOD80ucVG0u/FW0p2t7qrbJmxwy/UBxMqPJubSAsdbqb3wlIWFxPWvO99E?=
 =?us-ascii?Q?fT8dysYMnpn9wM+4sfz+O2miTymi0JEhnIgGN4IOROrQw/Bc3pZoF61kU6op?=
 =?us-ascii?Q?izjqPde37afyLzgJ9mjdopwKk0nkz6mhHf1Vb7zp8PyF2MiShBf8qrNwVKFv?=
 =?us-ascii?Q?tT44aH14ed+dyEzIrayZNPJq9Ik+zH9+O8KmneyiRovlBwj5P9NnZtiyEmdA?=
 =?us-ascii?Q?qttzcrw1RKpf7b5vxR8vhbPvnWAKnr0hFOx5yXUpRJxU3DNxQ+dRqXzDfFZL?=
 =?us-ascii?Q?eKdEq5O0eDOZmulwOpHXDSDBufQMAdO5JExbw5/QxIKvGiEp4dcq7gpfTB9M?=
 =?us-ascii?Q?aiX+omGjO1rIF9quXEKxfJe2A+tjO1+8Ga/LkwQO/XFT15r738e/8uUd/6hD?=
 =?us-ascii?Q?JCrz0YKTGUmg6tHVx2JTGeCZcAkZ1EjVTAmQb8jbOwzIjmjGMqsNVXePPBzc?=
 =?us-ascii?Q?0CdsSjGXMgaVUcKP2MLu+zmywIOo+ubvl57p00IviiJbpD3tUC0cCYiHng0M?=
 =?us-ascii?Q?l2eIw2A1U8Bxc/FX5AVDtGjd5kKkX8p54WJXzpHI3jq8Qf5NdVxK6sw/v/DG?=
 =?us-ascii?Q?2HONYlJRuoPzjobh7Ru65ShC3PXBzOcou9J7RZPgoSOu4YldqsRtZQ93l/DA?=
 =?us-ascii?Q?6ayh5qg/JhFI3hCTT8fzml/ujsXYlt2LPtOqTU7Ur4KTePcwPyLGMyCC8m+Y?=
 =?us-ascii?Q?AzDdGjyrLW78ziz4yTpxyDzMJUiekYbWJm42icbM3KGwK/lsTWkFLbyqHtaU?=
 =?us-ascii?Q?ry6HeHhAwhF6GhjBLd4zzkI/Z1WBdKVZI3UgGKJAVB8me++18w4aoCxyThWK?=
 =?us-ascii?Q?7PgEY6xvk8OuqAxGTHqO8Oc6oAgruYfs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JJP8D5KV5EOGITWKRhIJOiBdJh7HL6nangT1A7Ru/g7ATLfzTNya1FRIYmF5?=
 =?us-ascii?Q?50HR4fzNXEQmcMeMwMPkS7O4g8Dem+aznv5xI20Pik+r6/QFNMDcNhTHmg+b?=
 =?us-ascii?Q?Hy0LWckt/325eh03MbypuxQXHxwrL2TzXBKBl95o/BPNPQeS8WgTjVosslFb?=
 =?us-ascii?Q?7uzNgi141KT2orZpGhaQvXXrMY6kDAd6eb/xJiseAjuWL4BLI+3cGllAuxho?=
 =?us-ascii?Q?3z7O62fnJQHOylFMf9c3tWjMjsO5ysBirwG9LY+IhVYaH7eIe8t6XRzpCSvt?=
 =?us-ascii?Q?VTrMVRPF6TSPiy+BbRi9GzOabdBRhkXnxbg3G1ushjQxMw2Z8H3iQTwGHirR?=
 =?us-ascii?Q?p3bJGfta6ndI6VJ0GnsbRwpKq2pu4Qap5r5MDdDDBpU++DOsYkoU58VKLN6x?=
 =?us-ascii?Q?/J2bKXz03e9J9zdmU+iBbVTX23N/0QrzX8AH+tQFik8akJ+TldEILZA2nNOz?=
 =?us-ascii?Q?XBEoUkybo87y5sNSWVL6V8C6AjOITIifqBbzUX35XklK9kkxbN4JEZnM7jsr?=
 =?us-ascii?Q?/yVS4ntBqJuswcFiS+Aulna2McRxd/6/1MWbXlh+M0tr2mKN1weMdoVJY9up?=
 =?us-ascii?Q?rSvWwtWvI/clpjaQyUpqsrMqtJeXVvM2Pl0COJBqPfQBcsgYjtg8gnVxs65y?=
 =?us-ascii?Q?idkzgFWLREnQj8JG449EvLa0QpMMUgVAS+QRQ85Y0qDGZ8VxMfgH6MFN0yH7?=
 =?us-ascii?Q?GvmrlwLQBiD4fnBIfaPWfUnMJndJgMKG1qFB3sFuftjSetkUq+3vdT97S4XU?=
 =?us-ascii?Q?A4H4qMHXreJP7BvYz7to3qI9Ae6JZst53FAeun+n92DxWk4kkToMViseEx5i?=
 =?us-ascii?Q?F3ITkDCWdsfjwJ6EfWaG2UoG/DQKQGN1PYh4bZQ8cU/h+gop4T980nn7Mw5k?=
 =?us-ascii?Q?jcqcH7wDfUQf2S3R/N/gc6iYb3trRmdE6s52qSiTqBbcdaXxnIh8gjcxlNgY?=
 =?us-ascii?Q?RI6hrl5JfTn7sgLJfGD1UsXsRvJFiaxl1GBOGFO3ECf8c2X8qYXVmBQ1tdMK?=
 =?us-ascii?Q?BWOpWid1XGoI4Z9zQNLjiCAI0NuZqa2TFaDKJagl3kHowJhFK+S0VUdWpDC/?=
 =?us-ascii?Q?FXyM22uGGsgsOl+ItTvXayikt80Ted4w1HD++OYXzL13mtuiIAlxXvwa5Lih?=
 =?us-ascii?Q?x7lIIKx1H1OT2ipaBkUsmhTRzjyjkEd18WmwthVRx4zMTf7pWGbdFBOQ8CxP?=
 =?us-ascii?Q?lhBY+5UjaOZ/3pLiZv6TpLDuLZKnx3yS71Hf4VhyJYzas3PDJsbAmSD1imMs?=
 =?us-ascii?Q?KXexpDCPHxRUooIPl1J8ViyP+9Y7arUduiRl9UgCeB4wzspARvCZ3kJC3gyc?=
 =?us-ascii?Q?HJrnCs1JoJN5ZR3JzkJ7uk5/wgdgtGe3KBEeaJZWuYY9mik8uBPWGGD273++?=
 =?us-ascii?Q?fkdw0mrwN36Yzhb6sKv1+SI854nVTcO9sw2vB6D7mJ483fGsfoy8B6dYwDio?=
 =?us-ascii?Q?rd6tVkqBhZBquc62PGxFrJ96Y8v4FuimCARoufmFxqrYkm2qi/lnRc8SHhvS?=
 =?us-ascii?Q?Y7fIxG/iMstDckkweIshRi+iWlw+3he9Lgc4phm97cSCku51zlYzyzxQmWxu?=
 =?us-ascii?Q?t2zT6fnTWcRZl1iUpuDh7RGoMRbh3z1NDjsiaLLp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1fe781-468d-4758-62c2-08dd4b24bde5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 05:18:53.5572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzL25TdSuv5vyW6KDDQfGtdP+ZOZukzBiX+/wA5IQv5nY3K8+kedX/qNBsi6XJpfQSCFxwGXT88RsEVTo0Qcog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9657

On Tue, Feb 11, 2025 at 03:46:36PM +0000, Sudeep Holla wrote:
>On Mon, Feb 10, 2025 at 01:19:14PM +0000, Peng Fan wrote:
>> 
>> I just have a prototype and tested on i.MX95.
>
>You didn't answer me @[1]. How can we disable it for perf/cpufreq if there
>are users already. I will look at the code once I am convince we can do that.
>For now, I am not. I am worried we may break some platform.

The only user in upstream kernel with using the dummy clock is juno-scmi.dtsi.

SCMI_PROTOCOL_PERF is used by two drivers cpufreq-scmi.c, scmi_perf_domain.c.

In cpufreq-scmi.c a dummy clock proviver is created, the gpu node in juno-scmi.dtsi
takes "<&scmi_dvfs 2>" into clocks property. I think this is wrong.

Why not use scmi_clk node? cpufreq created clk provider should only be limited
for cpu device which will not be impacted by fwdevlink.

If wanna to tune gpu performance, the power-domains property should be used,
not clocks property.

It is the juno-scmi.dtsi should be fixed.

If juno-scmi.dtsi will keep as it is, please suggest possible solution
on fixing the issue.

Regards,
Peng

>
>-- 
>Regards,
>Sudeep
>
>[1] https://lore.kernel.org/all/20241227151306.jh2oabc64xd54dms@bogus

