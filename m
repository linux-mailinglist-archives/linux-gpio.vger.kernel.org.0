Return-Path: <linux-gpio+bounces-31515-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKFJOijBiGnHvgQAu9opvQ
	(envelope-from <linux-gpio+bounces-31515-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Feb 2026 18:00:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58934109817
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Feb 2026 18:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 479C030048D8
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Feb 2026 17:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76B92BEC57;
	Sun,  8 Feb 2026 17:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="nOtLvGI+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1B1224B15;
	Sun,  8 Feb 2026 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770570018; cv=fail; b=jlpNEITlgSHolzrJ0KxQ/kKPYbRGkoKj/llHwJb3T5Wn6ZGRhCUg2zGhYvwtkZUNtyAQw49M2wslh89Zk96mPOdk59PMSstGvd9YayNl1I1LL49BcvhFalZU/lUucVtzDE5dwhUG5zDxh5FpR4qyd+7BvkM04Bx5QJKaVZ49Rd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770570018; c=relaxed/simple;
	bh=ZEUdxJZHXwED6XcI4MvS469dl57fSp9nVgOFz/79vPM=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N4aNI63/Sdxun+I8no6zLLwirapejzbbt8iR0sqXauQXe7Obdch6hol5eMALxjcBljU1/js5AGrYU3y9u2duhEeL8WEuFTEwebXQpAvVd3HhJAJWn49LjDLp6VQMYGlZhzBpXNOGwkpS1Ztc4vobpySAeic4hgsY46HS1A6r5Vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=nOtLvGI+; arc=fail smtp.client-ip=52.101.83.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdVZ17SeIWrmXYaS3AfKK43ws1FeQNmisBno5+NAlz3a7JU8IxLZ8O1C6I0vRe/dS3k8v4pUleZ4bvHxxkp8zpRxRS68+bIKG9Mu3xEtXCsELdb6T+6bXaAZDAmJZy9TPy74tx4ScmoWAiYlUfSU23Yo9RX3CGfi7v6CUwpo61m1LlktBQZyvL9P2XDjrgbrtkb9Vlxt5P/05Dr604G2XvASExCKQQs+Fr6uWwbD/M+fdrY/foBvh/iYUktm8vhMdQU3JGaBCMNj4NJ6g8m3IbCpQ97muMHmTSvEa4f5GOHnwK3ivVkjG7UD83ilJyXX/KeLZ7dqFr2zKjvpD5cHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEUdxJZHXwED6XcI4MvS469dl57fSp9nVgOFz/79vPM=;
 b=Zk1sURcqUCYeaM6QiMxONkAl9RHJzCM9RUktEzgyU6N4YMzTb7fFju2KBM1KgoSIYcBmOaWw0YvSvpXmcb/wRxA60DTbpdvqlmK5unc4hl156rqOibh5fcXvYmL9bNHCZxVwjfQF80I/Pj0Kcr5XY4TgBf0lSiYVFbrnuzNJgJccop49ontT1yig98zqag6aObbEYHRpXIkHFP5KNBjMZzAYmZE/3M9WojPKUx9ltmbvbaj8aOkKLV8do+KAPh5U3eM388VLAhWoLC0RLaIt87YGwj1Dt73CW67fniiJg1AKZSEMkG+KSipWTZn5LNpEMP99a5PqQF1oALdRoXzbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEUdxJZHXwED6XcI4MvS469dl57fSp9nVgOFz/79vPM=;
 b=nOtLvGI+ddbNv7gToTb7yIgDOj5gM21hxkukMv2uN8+o9hgetulDA9lH5B9/pzqyizS7ecS2GGfu9Jma1oLfDzNU5m5uK7knT37WudAWYy6+z7vIKgngXKS3vrpzMGyh1nml5vjOhzjx/ND7jxnrGrtxpjZI25B7utHEITrF2pI=
Received: from DB7PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:10:36::18)
 by MRWPR02MB12086.eurprd02.prod.outlook.com (2603:10a6:501:83::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Sun, 8 Feb
 2026 17:00:12 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::e8) by DB7PR05CA0005.outlook.office365.com
 (2603:10a6:10:36::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Sun,
 8 Feb 2026 17:00:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Sun, 8 Feb 2026 17:00:12 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Sun, 8 Feb
 2026 18:00:11 +0100
From: Waqar Hameed <waqar.hameed@axis.com>
To: <434779359@qq.com>
CC: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, liufulin <frank.liu@faiot.com>,
	<linux-kernel@vger.kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] tof: Add VL53L4CX TOF drivers
In-Reply-To: <tencent_326708D02875274DF25B10B91402B3828606@qq.com>
	(434779359@qq.com's message of "Sat, 7 Feb 2026 17:42:35 +0800")
References: <tencent_326708D02875274DF25B10B91402B3828606@qq.com>
User-Agent: a.out
Date: Sun, 8 Feb 2026 18:00:11 +0100
Message-ID: <pnda4xj1884.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|MRWPR02MB12086:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8bba7c-baaf-4633-8af4-08de6733864d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UUDwUzBVK/2L5dgXLjvEXj8V+subOl+7w9BflfGV6keuADnKB5ROQRF6ObxW?=
 =?us-ascii?Q?BP7gwI4Xg54tkIfAPPY9E3EpQPAEyVFKHkKdmWHIUrNXbhJM1/jq+RidjGIS?=
 =?us-ascii?Q?9geLIohKlmLo46sD4XcDjmCIBgScDMoIxXDpmyHGzTUtxXX6i0+6f2aFtK03?=
 =?us-ascii?Q?CXMc8G13C42zW50i7eceMataKYxWNEqMgrmLNqiCzxdnR9nyaPFyhBw55pb4?=
 =?us-ascii?Q?4fX656T4H25O6uwu1OV6ROL6PyXJuXA/vbToqUHNZs3weNrX1qA/K8vofUip?=
 =?us-ascii?Q?txX/oqT0C/EBDkN9yC5idmiJCb+7jYJRTyX4ap+HzkqXhQ+ZMR/Fc8eFIfxs?=
 =?us-ascii?Q?VCQRKhBhoCnPOaFtlYoUW9jI9/iJyaq9axEDNhtvISTVTL0QvZLqyJGtyoQs?=
 =?us-ascii?Q?8nebwG+Ae9+B4bDOZY7C/AKklvsX5YwPuKTlUKQyKOFCoOxZY1sqApdIPVPX?=
 =?us-ascii?Q?J2u7p0i48iaHVbajld3tUVkOhk3MXky3OI5B+8Bx7Le7vqxjmIxnsteQgZHn?=
 =?us-ascii?Q?w5GmBVf8PuQ8pAF41YclYjCFeZAOOmTvx04Hr2uCr5ixE4AZUsy3YSalKw8u?=
 =?us-ascii?Q?BwVzk0Ff0cgvJrwYpuDQudr6Dy/eMFL3jX+I81jqo00V8mO6D3wN0sqscpr8?=
 =?us-ascii?Q?SNtLHqtuCACmZnM5neJRRIJgh8UdNrKboZZJLjU7pEU6oO4Pc51WpW/mtu4A?=
 =?us-ascii?Q?hp923vp/SOvpYlQk5YQQ7dQ28UsFdKuIdaZwbEyhnDAuz/bR2LsiM3XZHMPB?=
 =?us-ascii?Q?R+wU2qOX1YQ23tADnQZYKyimGQuid2/dlDu8F1C3oRL2GpjtNYvZdI59rwaN?=
 =?us-ascii?Q?o8CiJ9eHmmk02nN0eN5x6D+qS+uJFgD8t4X7KtlAuGRsayxizwuUNuykXiK5?=
 =?us-ascii?Q?axSKFRxmqbnay8oE17p0FY6uWiWXZOYmqcTyTy3EDI3HO/Tl4NE3RDxwzzTt?=
 =?us-ascii?Q?GfB/XbopR3kpzV7Fr4YPakHW9uBhF5F9rxoOPYVuOV1kVkOce/dxemTHeL5r?=
 =?us-ascii?Q?SV/jV8B1Aq+Ests2ZQbIj66sVqVH0mpDfiH+PUQ4OAxEplisu+hIgynLB44t?=
 =?us-ascii?Q?AdNDxkFsoxmZaFtRMJfk/MfjJec2hHxpfuBEESkQ7zi2zwPdtPNP3h2ewc7E?=
 =?us-ascii?Q?ztIetC0X2HaQypJq0BkoAsJqt7KArFc2CUxurNbAmdRhZa/K8crBmP5alD5C?=
 =?us-ascii?Q?bJLWKgKs58vRl8Vy+KzFC4AmTs0TRX7mPCJxVZgvyL8fp/QB2JfmMGBhHvuH?=
 =?us-ascii?Q?LvxRVA9uqbEq9HvqNvEMSdxAFP3UWlxSqGv++Xjwr8dnUFcSkaUVPuCPqiE8?=
 =?us-ascii?Q?iXH/MdwE3Io7T8LBQ/INGp9LzPZuZ5hY/IhhZePufbU2/Q8Psko7vUi0x07r?=
 =?us-ascii?Q?Snsm2AcvUwL9cm9Pew4Ohs3X/YJZuc6YPiUMM+mbRUsu+gmC0BThGWHTn014?=
 =?us-ascii?Q?xt1z7mojiofe4S+xYlbkQuf64B8QAuseu07VSmP8Ie3/wCRNZqtfR1bVpULg?=
 =?us-ascii?Q?2QQk90edFGb/nMZpmH8EJWoAzyHE/E3btl7WbmiSI4YoB620jNBvDRzeJTcS?=
 =?us-ascii?Q?y09qrbUfDvWV6AqIhYk7Cy50XE6aS2w26zWM0RFTyn3MHaBDEz30nuAfuqE/?=
 =?us-ascii?Q?8sHdOS12bju8gUxS+BdPOdMOAxkcXvdMntFnuhGL5OYo9SUi3ahblTBwbNFi?=
 =?us-ascii?Q?pgYWdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YQPDZM9+fLajjhFLUgonhMT5zKoYlPJV9gpNFWYhEuMOA1gS3UjRnLcoRbkkYVh7onfqD5iUAaLC5UwfRnNP3RJ6BximaCBXY4C9GXZJ8oZC0dr9XXP2ImZKk3phJa2GuhgP1Brhjfg9JAN74FzRR25K0WFOZ+F9TFeZ/5kbrORvojoR9IAhIYBzNqeU0AH7sR3X4loJZFYc4oMKQR/m/zMspSUlY0LTcP9m681Cf/+bDxpeEIrMi2rxUYp1GBlnxY7GOplbVg33evZx7VSb1uFuDFkmKx63Ndv93i00JfVLQ8ziubWIKSkMIp8JLoXmrWYYr8yB4qico7U5loeMC8mWoAbZRhuyknNce4At9HbnOSLY1NNrZAe76zEkPtuMmvAOh1Mo/oj+HmrbX8CmrmFRIxvJpT9GjWDFlyWA/N2ScyXt6Wh+N/BfKp8yQNdx
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2026 17:00:12.6921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8bba7c-baaf-4633-8af4-08de6733864d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR02MB12086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.35 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[axis.com,none];
	R_DKIM_ALLOW(-0.20)[axis.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-31515-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,faiot.com,vger.kernel.org];
	DKIM_TRACE(0.00)[axis.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[waqar.hameed@axis.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58934109817
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 17:42 +0800 434779359@qq.com wrote:

> From: liufulin <frank.liu@faiot.com>
>
> This patch adds support for the vl53l4cx tof ic
> ICs used in Qualcomm reference designs
>
> Signed-off-by: liufulin <frank.liu@faiot.com>

[...]

Many of my initial comments have already been stated by Jonathan and
Andy. I still want to emphasize to run `scripts/checkpatch.pl` on your
patches (this one has 6761 errors and 11804 warnings...) before sending
them. (Shouldn't we have CI jobs for this?).

Some other general comments: please include a description of the device
and the chosen driver design. The linked datasheet doesn't explain all
the functionality used in this driver ([1] mentions some "host API"?).
Moreover, it seems like this driver is not originally written by you (by
looking at the copyright headers) and thus has some history that might
need some explanation?

[1] ch 3, p. 6, https://www.st.com/resource/en/datasheet/vl53l0x.pdf

