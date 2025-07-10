Return-Path: <linux-gpio+bounces-23093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A54B0050C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDCEA1C2122B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53232741C6;
	Thu, 10 Jul 2025 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="npbxJIgI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44419273D96;
	Thu, 10 Jul 2025 14:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157336; cv=fail; b=E0CFR9qKQvgPWRJkGURAX5HfBlp72sgrjuwNCV1o2MMj4gXi6S7Ewc55AJ/injlqjBcUTMrvAf0YzOa6HPcfRyxFlff1nXxZXwbk5APbdLH1rd5BHeK1ZY0wT+5WwnzCH5Bc4KzbT0epicPRwq+m58MYw7h4/Q8g5qXUCp4EhaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157336; c=relaxed/simple;
	bh=6tHM9zA9CRpJVE0wyf8pm6IxmUFlm2helJF6YLgIl+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sosVukKfj6PtBEMHuGi6hzjxVjR1D8vtxKhlaE4SWr94Y6hNDom0mc4/sPvp6fp4jI+GMdf+wsspJK+06QJBGowgsbUYIALPIOazwDcdCFOoUD39Urhb64iX3v/PEUxZjom4JWDm/OTF267bLXW62PKPI6XJ8tM3X/oYT/LAJzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=npbxJIgI; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkywiq+O0Nr244L7TmSNqdFfP9EWF0KNV6+8LiA40X5oRFqy9PMkZCjhr9ftZZ62tXNNRi+Q+GHp3d+KLZxfwzEbIqMi/A84WXviN0ROSPlf825ZgHAQldebXW+K4LrWvTl+LQiL4XLd6oe3EWdt92Md+RE6/tROFrp4SFSuIy+RFs9QN+QlceevWEQEiI72TTxPNbyimnx8UWJPr6di1k0AwNm8x98IbCJQWY01Q29Wez8iAXiJ73eXvSMrZZARfyYvAmHlon0J78zXUtW2XTLQmitE/kAYDq1KJ+MiSXXM3GEw+IxfRSJwEHyXjX/RuaU6u3S4VkdvomWFeYh6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tS09lVgIf1DoeBxZcMMkTGr79yeGn+S8tk7tLr9p/U=;
 b=nqH05JgkbNI8soKZsDGZnIziMFJXhOJp44zfknku/+sc6kMgUv05bWTSprR529DThzoPuTI5WawGXr0waRX911RsGZ6ziX2S+bFLjLGfBDRAX4Awu6KCRaz1vpy8Gactptp4+QWK2uJted86VcQy1Jq/bVmabA/avmv2pQzMUX4KbkjqpO1cMziMAcB1ViK5Xec7Vgg0XFh+YTP4IluYmikuHguSX6yx8mNjgSuJ6qgY74yrGWEcGK2q8ylzHSLNAPWtSmb8gXrSbVwMNha2N+WDuYAA5Y5EfgHUPptpQLvvIqPx2auQ74SAjWggC8RgK1x/iuxSvsApdJeZ36Cw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tS09lVgIf1DoeBxZcMMkTGr79yeGn+S8tk7tLr9p/U=;
 b=npbxJIgILo2g8ouLN1GXJ5IC1vZ17HBVqbimp5IjrlmqDm08ULO07tTHo7FBI8gpRql28pGgmzNa/jjwz/IvbDwDktxvwwuX6SaZqF1nz5Hn6mA+WpTst7LMrL5zOq/gRUVgVqrOzRdc/6KSfhkl+wuQ/rS4fFYiC3g8t8g61RidjE2hHyuLfdOVyhQjdtsx9o9h9d08k7dtYaTdL2PZibcECWS9zFq1sAVX5iwgFH+k8CAFL4Bp1K06oB+EbICTQYbqkS0eyaob+aTUZDA/VyRRf3PmeAXb5ZO6N4VT+KqZciXe7t8MlCDMe47G2bx7qWPGY+vYzVM+tqdDucZ0rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by FRWPR04MB11282.eurprd04.prod.outlook.com (2603:10a6:d10:19e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 14:22:10 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:09 +0000
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
Subject: [PATCH v7 04/12] pinctrl: s32cc: small refactoring
Date: Thu, 10 Jul 2025 17:20:27 +0300
Message-ID: <20250710142038.1986052-5-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4efa5239-0782-4e04-3de2-08ddbfbd27f4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWRIMDBraG9zdWRXbEk0N1JsbEgyYTFNL1hBOWR4TWtEVFY1a0I5bVduaGxC?=
 =?utf-8?B?L0YxTktRQ01tNXVuemRTTzU3b0tTaVIvbjBraWtqSFowTDVqTE1ONlBkYkxH?=
 =?utf-8?B?SXRwWnNodU5MNjl5QmhvNUJTb0p6SDJaV2d5UzdSZDhDWWJmK0RYNUUvc2xY?=
 =?utf-8?B?U2dIUHUycDFPeTFsa2t3Rm0vbXdPSGVPUlptY2d5bFMwSTQ5M3ZmOGdyNE1o?=
 =?utf-8?B?MmtTUlJzL0pHcjdYQ1VKZThPdjVyZWh0YnJ3L21XNFY4WEtpOWZmUm52VHNB?=
 =?utf-8?B?TDlwN2tiMHVRam9CYmVzNzMvWFE2YXFSck5wSDlhZEpCT3hBbisrU0I4S0Jz?=
 =?utf-8?B?WDczNjBzTHdsdGxXR3prejRYcTcyTS9NRnNCcEhCQ2FVNDVDT2pnYlRhVGxx?=
 =?utf-8?B?MzNiK1J4QS9OQ2orU0kwVXNpTXYvR01ocTdndzU1ZE0wUjlHR0lBSldIYWpC?=
 =?utf-8?B?dGJkdDZTb1Z2U0FIdkFrQVhLMWE3QnhFRWFUVVFZK0dIOWpWSU53WUVjZ1ln?=
 =?utf-8?B?VDUrNkJFUEZNczd0SFJZOXN0T0xGK0xoN3VIaHphV0RFTUY1Q0lqWjdLZWJv?=
 =?utf-8?B?NmxNQVFKQ2JOMlI0YVpxYXkrMUNJeDFHZnRjTEVUdTgyOHNqMTVzanoyT1lN?=
 =?utf-8?B?RjNEc294QnRTTTlRZFhPWEdkZUdNTFZYZkdDRCtEQ3ZFSmJhczQwWWFxL2NN?=
 =?utf-8?B?YUFZbW9jOVpCT3pIZ21Ud1ZyVjEzWjhDdzVEOG9UdW5kRlBZbHdvMDlBSGgr?=
 =?utf-8?B?eEVkV09MQlc3UG9qZkczcWkxVCtGV0Qxa2tXTXVzd0dYRG1YOXB6YnYwRzZQ?=
 =?utf-8?B?UkduZzFxU2tGa3RNa0dqNytYdm0vbjRYcVd4b05MMnNRWnZEZVp4OTJudG5p?=
 =?utf-8?B?ZC9pRlJlcnRKcS8zSGNwazYwVFhZelJkVEQvZEhVR0Z3dFQrc1RheEx4Z0d1?=
 =?utf-8?B?N0o5OFN2ZmgvdmVsbHFKZ2pxc0JUMy9RZTBtOWU3K3Jsc3k2c092ZGdtZlZS?=
 =?utf-8?B?eDJ3eVlDejFxV2Q0UThPQjhieHpRUzlBR2dOVlNYWE9BbmtqQktwenBTVjht?=
 =?utf-8?B?ZXp2WmFVQ3ZoOWxSY0c2WW1ZakZoVlRRK292cG9tWHg3ZGFQSHN6SXpzR0h3?=
 =?utf-8?B?dGNaQlNEWW55NHZqVUFFblFZWVpEWmxEdEJTNHkwTWZBTGFPT3VkMkVwYzBX?=
 =?utf-8?B?c2V3WGJTR3VZK09NU2hXbldYMzRZbTdWUmpJVlB6WUx3dmpCZHdhRGh4Y1Nu?=
 =?utf-8?B?QXdFclJ4WmRNN2RBdUI5eld0Z0MwOW91MVorR09tU2ViT3BxMXNHTUh5aEZS?=
 =?utf-8?B?RG85SzVyWm5UWVlJVU9VYldIREprSENCSVNvZ0huc2pXb3d3QUgzYnNtdlpN?=
 =?utf-8?B?MXE3UTFrWUdycmd3ZXVXSUk0eUIwQjRpTUhSeEVhZStLWFdSbm1FQTFFQWdD?=
 =?utf-8?B?UWM3bitVY2YwT0hJU1lISG1VdTVMZTZ2ZHJqd0liU25MVGRMQkd2U0czdnY1?=
 =?utf-8?B?N242WHFVZFZVVGU2c2xrTXVoSnFWV3c4aUpWZmlwS1ArUGJRUGRhYmVCU3FR?=
 =?utf-8?B?S0ZOa0tMMHk2UEpsSkppVWNNL3B3dXpNQWp1ai9GMER3cUt3bm9MLzVwRHlw?=
 =?utf-8?B?cWdPTTdIV2JRVGh6dXFYaFdKa0Q0UjJ4Nmlld1VtTlIrL1NSMFg4YVZ2RmpC?=
 =?utf-8?B?NGRtbFV5VTl3OWlPSk9HUWg1Y3lqTzF0UU1DcmduTVZCUDFCRlg4Z2hpRy9s?=
 =?utf-8?B?eFBFU1VDU0dVbkExS3FmOVY3K2tnYVdQbmFxdTlBSy9kb3BXazVMQko1Y2FT?=
 =?utf-8?B?dFhOZjNPa0lSc1hDZTUrYU5GRGRxckF1elNLVVFWZjJzVXBVd2QzTVFHRDV2?=
 =?utf-8?B?REMyZEd1ZHoxZ1RvRERrazVhSWwrT1AzNFI5U1FBR2FSYS9rWGlQRUdCdXdF?=
 =?utf-8?B?Q3g5STIzM1VVVkY5WjZubU1vSzhlck11MTVaaFlGSk83cHJkYURPRmg0TUUv?=
 =?utf-8?Q?jcNWUZiUxAzaiqVNbq2VD45x/7OWq0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlBZdkVUd0ZQV05FZldGL2hjYlJibTZ2YzVVRG94cjVoM0lkMEdIS0Z3V2Zi?=
 =?utf-8?B?eUdZb1I5UEIzVllVYUdnY1oyU2FINnR6a1Bqa3o0UEw1WERZRnYwVnRBU2F3?=
 =?utf-8?B?Snd5QzZrQVV4TDFhdFRhZHVnQTZWSzZrOEFUaGQyeTZ1aWpKU2lqV1pXVldL?=
 =?utf-8?B?SkdyNm9CNElQOFNrMjlKL0NWaWIrRVlOdmlhb1o3Z28rMld0blkveGRGclcx?=
 =?utf-8?B?Wkovd01kekQvclJBeUpUL0hBL1Q3VkV3aVBzYUJySkUxNDZwQmlNNUNxUzJB?=
 =?utf-8?B?bk1wZ2xPdWhaU2NTNzNHOVF2MW9tUWtySUVkVjRwN1dxS1BYSk9jYVgxdUNp?=
 =?utf-8?B?QUpuNU1HbEM5Q2EwSGZLYlJLZ1c2TTVqRkhTODlvRTRlbTRnMXYrSUk3Q2cr?=
 =?utf-8?B?dkcvZnpwd2hrbmhUMThjRXhHM3R3eHRVQTQwVGdMUURhdkgzMjJiQVZzbjVZ?=
 =?utf-8?B?dmxIWllpN091bjJ1OTFOc1k5Mnd5MHoxL2FabGFDNlQvVWFuM0VQeUpxcnYy?=
 =?utf-8?B?T2l4eEFSNEYrZXFtdDM3bWtVQUNmQnRtY1VnMm5KMUxDU3JwaU9McnBKOXho?=
 =?utf-8?B?aSsyWGp3YTV2VnBZSzBTTzhmT3NtemxKYlhnQzA4dkJrYnZCOWU3a3dpZnRC?=
 =?utf-8?B?ZFBBNXB3NHRNYmc2SHdFV0toMGVpOGRDcDRrcmVzbzMxWSswUXRHZ1h1dXEz?=
 =?utf-8?B?V3A0M2tZWURjVklmZzRSZHhHelg4cXU0YTlLbTZWZ3JEUThYZitqSXF2QjIr?=
 =?utf-8?B?QVZtMnEwUlh0Snc5ell1emh4N2ZBL2xtQ0VTQnNLZnhqNkpYSGFKenp3c3dK?=
 =?utf-8?B?ZVpaTHBsWkpBaVlyWVlzKzhrYjFrOXVlQ0Y2SFJ4ZDJiUU1GU3RqaktYUTJL?=
 =?utf-8?B?UzFCMXptTFkvQU5vZ0g1Yk5mRW85UllUdFQ1bUFNbHdHR1FRRWtuS2xqaDZx?=
 =?utf-8?B?bmd0K0VFRi90dlczWTFHU081Q1MwRE9DSXlhdFNGREdwQUR5ZzNyVTVBT3hm?=
 =?utf-8?B?aU5SNnA4QTVIbkRjQnYzYVhuOUdHSGNuQVVpQ2lmZ0hDZEM3YzRpVHBvVTlH?=
 =?utf-8?B?S2srN0VOcGc3VzRtQ3VGemdsNWdoV05tOUFmYk5kQ2JjSGMwS09sOFkwZzhh?=
 =?utf-8?B?OHd2c2VFZW5vaC95M2tmVWpjakNUWkVPbGFjVFBkRzBmSEhGV1NsQSt3UUtB?=
 =?utf-8?B?bFZnMXZmaHJyT3pNaVBsbVVNTzB5MVBHVWJrZ09Cck1mQlgzQ21iOWFaNGtF?=
 =?utf-8?B?V0xtUGVzS1IvcDJyOS91a0tsblhINHEyY0xXK1VqL3hDN28yWXpWV3RFdDVE?=
 =?utf-8?B?UHI5bllqaCtlMEFVckZJQjJ2WTd5bDU0cmcwMkZ2UlRWTFJ1aEY2M2VWMUI1?=
 =?utf-8?B?OFEvVTYrNHNrTGV0NXNhVkdZZlpXL1ZpSGhXWlRWV2tlZHIrcUx6RVVOUnZJ?=
 =?utf-8?B?Tm4zVjlWbmovN09nN1p3ZThUV29Fd2w0Z0NXQTQya09ldTJLM2s4dFRDbExS?=
 =?utf-8?B?Sklvd0dNb3ZDZDNEYjcrWWtIcWVlckF0Yk5WaThFb1N6a09taGNQMXBxUERT?=
 =?utf-8?B?TGlWTzRWTjBNTWJ1Ly80L3NzZ3JyZ003ektDUldpZ3ZuanRtclhkVzFIZk9L?=
 =?utf-8?B?WlBOZUxYd1ltOFFoVEVVcGFZU0FFL09DRmdKVmx3Z1NyRWtEbnlvUnVvOEox?=
 =?utf-8?B?NTdEdjV0aGxnMzdnaXlYbXVXWTVnc0I1aWVBNHNnRkQzeWxpVU5GZUtmRk9p?=
 =?utf-8?B?YUtxS05RV0xDZWRNbmxnNHBXcEdvMStaL3RlbVJPdmJVNytHMWRHYlQ0cmVU?=
 =?utf-8?B?MXVyN1dEWUtMdm02djF0TVM5YlVJcUNCM25wZzVIbjFwVnlzdzdxYUFhM0l1?=
 =?utf-8?B?bEs2dC9TOC8yMU9UTEU2RDdxVnlwTVMyZTRMSldNRWZnMElJbGlVUHZRSXpQ?=
 =?utf-8?B?TkhXNEVHY3NUdEx1VFFsNGlUbkJJdGQ4Z0VnQ0pzamJRd1VQZW5hVWtkZTF6?=
 =?utf-8?B?WXRMTmZ6YkdqUGprN0tjY0lhYzVHNUVFT2FkRnVOajZibC9pZ0xDdFZkR2Vy?=
 =?utf-8?B?SnBuOGk0RDV5U3ZUcnEveXVENTBrdG80UzJEamFZU1Y1T2Q3ZHJHZmxaWCtO?=
 =?utf-8?B?RTUzZFBKQkNQUjY5YWlkeDhKcXowWjVwZHVvd0RCOGFJL0ZvdXpPbHl1aG8w?=
 =?utf-8?B?bVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efa5239-0782-4e04-3de2-08ddbfbd27f4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:09.8550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4oc+NPdoYXAWJ6qA0Q81LHlgnQJFPB06TwC9GmYGTSs/n7cV2XdBvsKmyCgjMTrFQBnz+BZl3dOLICA/WaAwZ7ZqHYGJKrTosZR59jhl+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11282

Change dev_err&return statements into dev_err_probe throughout the driver
on the probing path. Moreover, add/fix some comments and print
statements.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 106 +++++++++++++++-------------
 1 file changed, 55 insertions(+), 51 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 501eb296c760..c90cd96a9dc4 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -2,7 +2,7 @@
 /*
  * Core driver for the S32 CC (Common Chassis) pin controller
  *
- * Copyright 2017-2022,2024 NXP
+ * Copyright 2017-2022,2024-2025 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  */
@@ -60,14 +60,20 @@ static u32 get_pin_func(u32 pinmux)
 	return pinmux & GENMASK(3, 0);
 }
 
+/**
+ * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 registers
+ * @map: regmap used for this range
+ * @pin_range: the pins controlled by these registers
+ * @name: name of the current range
+ */
 struct s32_pinctrl_mem_region {
 	struct regmap *map;
 	const struct s32_pin_range *pin_range;
 	char name[8];
 };
 
-/*
- * Holds pin configuration for GPIO's.
+/**
+ * struct gpio_pin_config - holds pin configuration for GPIO's
  * @pin_id: Pin ID for this GPIO
  * @config: Pin settings
  * @list: Linked list entry for each gpio pin
@@ -78,21 +84,23 @@ struct gpio_pin_config {
 	struct list_head list;
 };
 
-/*
- * Pad config save/restore for power suspend/resume.
+/**
+ * struct s32_pinctrl_context - pad config save/restore for suspend/resume
+ * @pads: saved values for the pards
  */
 struct s32_pinctrl_context {
 	unsigned int *pads;
 };
 
-/*
+/**
+ * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
- * @gpio_configs: Saved configurations for GPIO pins
- * @gpiop_configs_lock: lock for the `gpio_configs` list
- * @s32_pinctrl_context: Configuration saved over system sleep
+ * @gpio_configs: saved configurations for GPIO pins
+ * @gpio_configs_lock: lock for the `gpio_configs` list
+ * @saved_context: configuration saved over system sleep
  */
 struct s32_pinctrl {
 	struct device *dev;
@@ -123,13 +131,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
 	return NULL;
 }
 
-static inline int s32_check_pin(struct pinctrl_dev *pctldev,
-				unsigned int pin)
+static int s32_check_pin(struct pinctrl_dev *pctldev,
+			 unsigned int pin)
 {
 	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
 }
 
-static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
+static int s32_regmap_read(struct pinctrl_dev *pctldev,
 			   unsigned int pin, unsigned int *val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -145,7 +153,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
 	return regmap_read(region->map, offset, val);
 }
 
-static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
+static int s32_regmap_write(struct pinctrl_dev *pctldev,
 			    unsigned int pin,
 			    unsigned int val)
 {
@@ -163,7 +171,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
 
 }
 
-static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
+static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
 			     unsigned int mask, unsigned int val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -236,10 +244,10 @@ static int s32_dt_group_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	ret = pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cfgs);
-	if (ret) {
-		dev_err(dev, "%pOF: could not parse node property\n", np);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "%pOF: could not parse node property\n",
+				     np);
 
 	if (n_cfgs)
 		reserve++;
@@ -321,7 +329,7 @@ static int s32_pmx_set(struct pinctrl_dev *pctldev, unsigned int selector,
 	/* Check beforehand so we don't have a partial config. */
 	for (i = 0; i < grp->data.npins; i++) {
 		if (s32_check_pin(pctldev, grp->data.pins[i]) != 0) {
-			dev_err(info->dev, "invalid pin: %u in group: %u\n",
+			dev_err(info->dev, "Invalid pin: %u in group: %u\n",
 				grp->data.pins[i], group);
 			return -EINVAL;
 		}
@@ -475,8 +483,8 @@ static int s32_get_slew_regval(int arg)
 	return -EINVAL;
 }
 
-static inline void s32_pin_set_pull(enum pin_config_param param,
-				   unsigned int *mask, unsigned int *config)
+static void s32_pin_set_pull(enum pin_config_param param,
+			     unsigned int *mask, unsigned int *config)
 {
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
@@ -762,15 +770,15 @@ static int s32_pinctrl_parse_groups(struct device_node *np,
 	grp->data.name = np->name;
 
 	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
-	if (npins < 0) {
-		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
-			grp->data.name);
-		return -EINVAL;
-	}
-	if (!npins) {
-		dev_err(dev, "The group %s has no pins.\n", grp->data.name);
-		return -EINVAL;
-	}
+	if (npins < 0)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to read 'pinmux' in node %s\n",
+				     grp->data.name);
+
+	if (!npins)
+		return dev_err_probe(dev, -EINVAL,
+				     "The group %s has no pins\n",
+				     grp->data.name);
 
 	grp->data.npins = npins;
 
@@ -811,10 +819,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 	/* Initialise function */
 	func->name = np->name;
 	func->ngroups = of_get_child_count(np);
-	if (func->ngroups == 0) {
-		dev_err(info->dev, "no groups defined in %pOF\n", np);
-		return -EINVAL;
-	}
+	if (func->ngroups == 0)
+		return dev_err_probe(info->dev, -EINVAL,
+				     "No groups defined in %pOF\n", np);
 
 	groups = devm_kcalloc(info->dev, func->ngroups,
 				    sizeof(*func->groups), GFP_KERNEL);
@@ -885,10 +892,9 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 	}
 
 	nfuncs = of_get_child_count(np);
-	if (nfuncs <= 0) {
-		dev_err(&pdev->dev, "no functions defined\n");
-		return -EINVAL;
-	}
+	if (nfuncs <= 0)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "No functions defined\n");
 
 	info->nfunctions = nfuncs;
 	info->functions = devm_kcalloc(&pdev->dev, nfuncs,
@@ -918,18 +924,17 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 int s32_pinctrl_probe(struct platform_device *pdev,
 		      const struct s32_pinctrl_soc_data *soc_data)
 {
-	struct s32_pinctrl *ipctl;
-	int ret;
-	struct pinctrl_desc *s32_pinctrl_desc;
-	struct s32_pinctrl_soc_info *info;
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context *saved_context;
 #endif
+	struct pinctrl_desc *s32_pinctrl_desc;
+	struct s32_pinctrl_soc_info *info;
+	struct s32_pinctrl *ipctl;
+	int ret;
 
-	if (!soc_data || !soc_data->pins || !soc_data->npins) {
-		dev_err(&pdev->dev, "wrong pinctrl info\n");
-		return -EINVAL;
-	}
+	if (!soc_data || !soc_data->pins || !soc_data->npins)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Wrong pinctrl info\n");
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -964,16 +969,15 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	s32_pinctrl_desc->owner = THIS_MODULE;
 
 	ret = s32_pinctrl_probe_dt(pdev, ipctl);
-	if (ret) {
-		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Fail to probe dt properties\n");
 
 	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
 					    ipctl);
 	if (IS_ERR(ipctl->pctl))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
-				     "could not register s32 pinctrl driver\n");
+				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
 	saved_context = &ipctl->saved_context;
-- 
2.45.2


