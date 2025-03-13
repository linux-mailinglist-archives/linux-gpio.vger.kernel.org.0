Return-Path: <linux-gpio+bounces-17516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2A4A5EA77
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 05:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEA05176022
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 04:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A3E249EB;
	Thu, 13 Mar 2025 04:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y+bRH7li"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2048.outbound.protection.outlook.com [40.107.241.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A2B645;
	Thu, 13 Mar 2025 04:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741839356; cv=fail; b=plDvWSSr4Q/N3FJbygX/aplDj00w8C/C4L7hUSYKbCakJUDlUydc13Z+05k6GmSm2FGZ8qf4BdjVgMRdpRvL7w3va80lpVVmss9e56epeO7TOjsseMpEMBQMQUPcV/1+e6vGyNwy+Mp+bS6l2u1rBRQCuaQLA4mTyHcXtvYdKEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741839356; c=relaxed/simple;
	bh=VEQs1gdv+LSK7lLLK0ORMyIQanVxtqttIMJh1kzSOW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AxbSd0av9buex4qZQuxSdJe6EkcetxzjA994WnC2hBBgfm9VVdrvQyn1zd3z98gkw1ccUNeTfciGmfgupnyW3MqYqnnZCqTzuGU6ksj1IXSjT9rVy8+Gug+etijHBbdPJq8ZV6ubVt5TcNCAnsbcI7U3NwWwCVFarEWjrUFV6OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y+bRH7li; arc=fail smtp.client-ip=40.107.241.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szbk8E5LLYE3XcfyHh70Ex6IzxLB40cfMxEP3kighhoIWI8fPXEXruXSKvRZLiNtmscRLWKlCaTI8MBuPyjCbXhH8WltlXez4M6gn/QaZjDgMc5ah4RPGWcY7FQYgZkdVbuYgs0EUOMCUe8heqsa0B+wJ+0biPDTCNnycqndwugPUvTS73d8piHfoVhvJyJxy0Ty5hr5uN5zmizkhn3cx9w732eNNv+HIb9zeiUL/MXVPxXwctmmctcTQB/Yjn2QE+1fBQ0poK/EabEaeVaXINsDdKUMOmn9S+R6at0n8OLkBwnKMU8zM/fhgXGJiZGGeJcZN2i1BydDRsxck+ugdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwD/vRiqpn6F/5wc68FmvAW7w33Bxoo6zqtELP4wqqY=;
 b=tOL7KbhsTKNHne4g/8jM2FQrO40D3tmPQgfQJImSW7Dizh2xW+lXhWBiv7qTYucRle2Z6/oK6z0zDaewCXTI+txzb7f4RgFKptpKBQnKpoKDQu1dxK+0bbdBym13PvfklNP4TkUhqgFOfdCaTGEhnWgf5EI8tuoN6Q5kZ9/J0fYerJp8sgLekrh0rj7BEx4vi6/QWnKRQne6okhWKQMMIncOeGD9OBHArYVV3DGXGnUP/3sDdLQtI3OQMU9L0uMurqOs3q3ruHz9FKIuRMwyjjvYH7G4ksLUbF/kBeeL1XO7uGilSv3xuhVfvHBVOCbKQYFSo7KegtNrcTkrwo1p5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwD/vRiqpn6F/5wc68FmvAW7w33Bxoo6zqtELP4wqqY=;
 b=Y+bRH7lidk01FtR0Hekk/rKWsktJs/g6k0hZYzG69fUXoqKuapeEucuIBfB7w6Vqyzmp5ZPcIeXUZHDgEEBp/SMJDC6sUUlr1NkS536e3d3ET31h58OWiHtA/KxbeNhiUtSpnJVERMt6Eea19r16TlfQ22CjTBCgFrPoCvHXB3nOWtAw3REhmZ1psbc9g7OTrMBHLJbZZHNykgvbIsadDBev8YbAH3PCRVI8nbmginEbm5L8lafQqBhMTwhX+KYB6rsiS58zbcp5ii1h/70GFrkXbRmOgav+8eM3itxAd1t1bu4CJfm857qqkXu+ksU52rUFUNJm6o579E8cRmseTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8337.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 04:15:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8534.025; Thu, 13 Mar 2025
 04:15:49 +0000
Date: Thu, 13 Mar 2025 13:23:27 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <20250313052309.GA11131@nxa18884-linux>
References: <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
 <Z86w3ZRS6T2MvV3X@bogus>
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus>
 <Z87sGF_jHKau_FMe@bogus>
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9AdICiyaCmzKh-N@bogus>
 <Z9FnZzBQuZ1j5k3I@bogus>
 <Z9Fv9JPdF5OWUHfk@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9Fv9JPdF5OWUHfk@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a81921-4972-41d8-7c7b-08dd61e5bc7d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YWpxT+UoFb/J1tUJ3JqorZhmA26jjBgPgiTYXGECDr6a0/la+JtrJc7dvn0r?=
 =?us-ascii?Q?XbuExtgif5UgbRcdR86uWApLbb0SMtLmBbilw7D3JHv+AZWmUvEunQj5Pg2l?=
 =?us-ascii?Q?SfsyW4rUMJZ6v2eiOJDYq/ZNRe05NcFU2y4FyHwRweQ4JZMjglTjznehH0lG?=
 =?us-ascii?Q?Y8KBQ7dJXn6xEhqgcloxrCDaXZlHAIsrdgOiNm2TljtP8sfqpBQU+9bFKYG3?=
 =?us-ascii?Q?wvab4Z5f/KIbEUq6lucubPelby647Mg+DrfIDc9hWVPdP0/0qD+rrE56p9p9?=
 =?us-ascii?Q?iHAyxlftr0mYQHzUFRe6KcyYv3sfbefMRuqZt/BkZDsWBpMUh/bJjMW05H6r?=
 =?us-ascii?Q?gGbVyMACBRpEBmYhZcGbtVdS6u/UMpyXyUVtt1c+kXUd6VF4oYnoy/lqgmC8?=
 =?us-ascii?Q?3VjNm1Lvlfso4gfHnQffcoqGdQPsbvgsj7JigfeAKQIh+hIZ4eYHRJjkU30O?=
 =?us-ascii?Q?5jEKsFN1yPEJHhjeHXPhZfyi8tVUAlU70FUFzr9PQ/9uRM36cPSSWmvhCIch?=
 =?us-ascii?Q?VozOOhr0Y+8stUsx7Lo/Y7VCme+TP0mv09ZkBu94//bBm04kKuzeObNRX1gr?=
 =?us-ascii?Q?6uX0plih04uyQmUsW+cj6bsbewmpUyAS22Qx9r8lJ9VkTbZ9nVlORoeb+wfx?=
 =?us-ascii?Q?hF//qJmxjSJAb+hCW4BrDf8GOzTvlM4AZuYvOJM2XVPdohI4D2qsrBEqB/Tv?=
 =?us-ascii?Q?NJWLmTlkXUiOgZN6QPXo/63DPFvVem7wDH9tEMTBVZ3iFlph2+ubr6Cm9Gmy?=
 =?us-ascii?Q?+BJLbOV3M9axLv7wrpqHEcTWojk61/DJF1Pq3dtb2r67O1AokBs/Cn4tUs05?=
 =?us-ascii?Q?9Z06RFOiB4PKJogSYdY2BtHfFY2dzuV4XbQiGrPhU+7LxU0MT6787hAuMB93?=
 =?us-ascii?Q?r7t6Vyn/10Hg/ke5aGQgqENqz8TYXDZsQWjHGLJxpL4R6YPtMnYJy3ZAH26t?=
 =?us-ascii?Q?xx9xlZWFfKyBygRPbcHPkMEf+Lkmd8r0P4yjja9YzT+BN9U774kqWTNnehjM?=
 =?us-ascii?Q?T8wvtucwW9EGGcxWZBBVx9wXKBH0PgZ3eof8Mm3AD7qaBO0LVEhMqtSwezcS?=
 =?us-ascii?Q?rKFUC9hiZ4v0TJlmaYt3uHA5Fb456+D925DjcsuAOvAb4oGnCtJz5P3m/b+7?=
 =?us-ascii?Q?YjcqekoTjqknbQUEd7eNguriM5Nq7cUWGY/0VHZfBGiNffLS9j5SFQv4Yr8b?=
 =?us-ascii?Q?MT1ZulPLKPVnjr8oP1hLf1Dj1LKBRgnIidVFTuicWNuStT23vnEdB5ku2BJq?=
 =?us-ascii?Q?ln0P0zUuwj7bfag/ko5KZ15Xyjv0Nlnm2KB9JVJM0KxLi0HZkpyq21vpYEHX?=
 =?us-ascii?Q?uKf1/5PfCBMwwEO8LIgponidKKFCD1ZjjraoJ1tQioFZwfOYZjCbUV7NDS+P?=
 =?us-ascii?Q?vs2KJQcPZNtZYFcZGth48S28tkQ8JaM40o/THDTR+InkbT2ktQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OGpPOS68oc3hTmq81QfyhZNFrzNq/QO+CVQAwq9E4PD17Aa37RKSMYH8uprb?=
 =?us-ascii?Q?Y1MtoTmW5J+/E1AEmZX00spaJijiuZvxBCRegFGlPhywYhvH9qEZxY0gVGPS?=
 =?us-ascii?Q?qvo7gk2QuyCGC8tyaf1NAtyU4t17lW6es8+IIgrOy3i+ajXwBAda8DgkJjUA?=
 =?us-ascii?Q?+2uZt2pxAhnDryMLWwT0erERwqgSnuOp3iWnajZ1iDQoI3K8HtDInlObkeW0?=
 =?us-ascii?Q?p7nZQZVfZ8SLLF5eWSh6JPlFP76sCIRiOApjOqmgLjeBsTuVvUmyqtRyFtNd?=
 =?us-ascii?Q?JjSvryIHxL4wdtJ+Ptk/tziK1Dy09eOr67EpfbRANl1PWcMNZ/Sf4EEmvtDd?=
 =?us-ascii?Q?ehnk41vJy7BEMiEuSk19WipA1T/1dsggY988HOyzyGYuVPNe/mFs991Juhdc?=
 =?us-ascii?Q?WF8FhDOgxjhssetnZPiI8fd/rVtSP+wiDeMMWS6TeEdNIFATx1RcqpxaWp+8?=
 =?us-ascii?Q?Wej6c8PjSrsSmxXKR3C95BBEAevR64NBT7xHLPKluwQW1ttUU61LkQOjGM7R?=
 =?us-ascii?Q?+zATv3dVOlOVhVkD+asT0uMPuvbuBYyCGz5oauP+26sa5KI5bSX7Gshp8+XO?=
 =?us-ascii?Q?rWmGNRZoKOYhEXCUjMAPD+VMwRT9gWwkZ3m94puk7YWIDK8IK+SfvSMWWvYs?=
 =?us-ascii?Q?DLel/MUUj+aVUUpP0rDNeFUptuKd0lDSdUajnLThb0ddARxqugbiPHF8fG8v?=
 =?us-ascii?Q?0C2VmXkPKo3Q68/8sUNGmbYB7SkbCrcXfCbtTFkHCpfG2AvgVrLQOUSSqXor?=
 =?us-ascii?Q?pV/Z15v3oG9flTq8jBxhhIfmHdRNXAXhJ9019V7xZr5NoG6KbmboZoutoRB8?=
 =?us-ascii?Q?HTMFB/GQ00OxCG1/fC0JTIoQUfaHM9EigR4BXLJ+bFN2CyChxXnbq0EhsDj/?=
 =?us-ascii?Q?rhYRQHOsdkvtd6PLQtWVg49ZFsMiifYDjQszvb5ux1emnbG2PUU5O37mdcSz?=
 =?us-ascii?Q?ClxVwNLCSjOX0lJv8IL/gHtwYDWmrFFzVso/eMVSmstv8skQQ2yQwDpZK/JU?=
 =?us-ascii?Q?F3yTdQonn7g7gDpfW4r5CpeNefjoBU8MN4BwQydut1dbCvcZGHUO3z9oEPRa?=
 =?us-ascii?Q?9dhmgnqHex4z5AMJ8YEjrfujxHFo1Dpx2PbRCVDFFqKhIvVom+EeOqKtanm2?=
 =?us-ascii?Q?zuq7F9UXUSfpp2dbBEx6T6JNLmoCbKut32Ol3PPQdRPI6zHt8WhudZDjrDmo?=
 =?us-ascii?Q?W1U2E4mjXc21/EWI+A6pZKiPqmOlFUt/B7n9Ith56OVIQb1SuVKI7Baxyfua?=
 =?us-ascii?Q?YtEpxhwVrstsnWeK4N7tdj3YROw4Ajbo/4p7rsQDwUStDPUXpGUnT50EGQrD?=
 =?us-ascii?Q?GpwwbtEzHPiAuBHsgfaDva6Gg7kENCJYJH4LKDH6bLQsZ2KfFKzY55T9Hx1r?=
 =?us-ascii?Q?iBQPq7GSHBKQ60D9gdImY6s8L2lIXai+BgNFeD8l8Q3M+J/QbJpjtLpcUfM2?=
 =?us-ascii?Q?vkuC07/Qo7ilQ7p+iwW9EhALsnzeKyBHjnSEkr/l4PeQJi/wKiVJ3ECPqySO?=
 =?us-ascii?Q?n99Ws2icy1NsmjpdC/BG8seaFXb96SzdkXIyip0EHgPmR/6a2dJUIwN4l9Ij?=
 =?us-ascii?Q?LT3vMSYS3diR8eZnXLRWkJ1SCLQY78e7dMBPn9QX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a81921-4972-41d8-7c7b-08dd61e5bc7d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 04:15:49.8585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+ld87Lg6Zyh5nDOMMXZXchsDO3PsaPq2igjMcyPY8VqrU388/vMTJzW7RiNeMW9lwtCUUa98fW69d3KYXaRvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8337

On Wed, Mar 12, 2025 at 11:28:52AM +0000, Sudeep Holla wrote:
>On Wed, Mar 12, 2025 at 10:52:23AM +0000, Sudeep Holla wrote:
>> On Tue, Mar 11, 2025 at 11:23:12AM +0000, Sudeep Holla wrote:
>> > On Tue, Mar 11, 2025 at 11:12:45AM +0000, Peng Fan wrote:
>> > >
>> > > So it is clear that wrong fw_devlink is created, it is because scmi cpufreq device is
>> > > created earlier and when device_add, the below logic makes the fwnode pointer points
>> > > to scmi cpufreq device.
>> > >         if (dev->fwnode && !dev->fwnode->dev) {
>> > >                 dev->fwnode->dev = dev;
>> > >                 fw_devlink_link_device(dev);
>> > >         }
>> > >
>> >
>> > Thanks, looks like simple way to reproduce the issue. I will give it a try.
>> >
>> 
>> I could reproduce but none of my solution solved the problem completely
>> or properly. And I don't like the DT proposal you came up with. I am
>> not inclined to just drop this fwnode setting in the scmi devices and
>> just use of_node.
>>
>
>Sorry for the typo that changes the meaning: s/not/now
>
>I meant "I am now inclined ..", until we figure out a way to make this
>work with devlinks properly.

when you have time, please give a look at
https://github.com/MrVan/linux/commit/b500c29cb7f6f32a38b1ed462e333db5a3e301e4

The upper patch was to follow Cristian's and Dan's suggestion in V2[1] to use
a flag SCMI_DEVICE_NO_FWNODE for scmi device.

I could post out the upper patch as V3 if it basically looks no design flaw.
I will drop the pinctrl patch in v3, considering we are first going
to resolve the fw_devlink issue for cpufreq/devfreq.

[1] https://lore.kernel.org/all/Z6SgFGb4Z88v783c@pluto/

Thanks,
Peng.

>
>-- 
>Regards,
>Sudeep

