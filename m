Return-Path: <linux-gpio+bounces-18766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B53A87A82
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 10:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74A9B3AD79D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 08:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDC325D526;
	Mon, 14 Apr 2025 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hIn87sSk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1D25D20E;
	Mon, 14 Apr 2025 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619754; cv=fail; b=B0PsJJfyGF80QvS6TH14rULqIxKOoV5zBpqmChxsiqRS/ANdoot81HM0yW/E5DHsSWpLnMbieA56LiuXzRI7tCwyNTQCfC2nauAdTc+mMW2dgWhx8AVWDaN8OjV47L8R1ynW7SykU1XrBB9mE1kfEHFM9V2oBW8Nu44QjVxUyF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619754; c=relaxed/simple;
	bh=a2n/RId5adCyd51zMvZPDfXZl/gi2FMG06NdYVVy1uI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z+SlTQHr/jf5n56cB3uucCjKVRX68ekFOZ2e9PLGOokmKzQjMwvp/6ypmyejxv6/Y+lOb33b7JSzb0vGDK2AwFNScjQPRN/EHXxp/I8y0ydNmzgpvokhV0bktafL0lQ8ejwbXqQVrGZf1wh13eN81++yMH+/H+ysAtFk8YVuW5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hIn87sSk; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhhFHbAs1+U+MpQelpapyvnvd8WOf4pGiLG9MzQwVeBxlNvuzJBS7XMmhzGNTGWhaQ54w1zBaumdskr0Lu0k/n7/D7BeU1wVcerFguoWsRT8GpPpvZ6iR3sRba/PZqSTvSFJyX+XmyNtNCPTvl0HPtEDQEHM+fIQKQzdZmtQaP+Ry/bKwVBhmPH+TOVnPTunFEq38oskiJB62hqP8lmwzqDbSTgL5PaV+ibSmACa9Q75eEgkk9zyMJQiCBw9MbGciMI6o/Sl4K3KGAu3dQXJ7q2Rwq5PUotppiYS8gvmuG07F6pFWtruZ/DS/3DtAtDrrWfOOMYLd3pnBRrt71RIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3oOVYhwhl1TeAVC3+v2SLMWdjBBMQRIdiEmCtQ6bHQ=;
 b=cnXA3sKhExiavTT82ui+PlWxyVPyzPwSwPTFfFdgz3gVjfg/lVVtu2UCIXsXSz3oD8Vo+aDpiSbW3rlaD4jc54nwYl2DNTJgH20s4DbQw1eO9sPeEtDRFeUynn1AELf4Eq0BT3Fk70UZCgSxCpL3l9Hc3GdRJ5wPlgT8j7uJXxMcAJZfWAXRnoyQcGciwjrxLr+4xnWThmnrVVP67YCaIEFglAH6s5vAaq7po5z37btZCAcfEI0LYCjl5UpzR+/AXzyegXtwlyKoaE3rak94shpn+DQ1/A9HabQIG7OfmNNF4y+6cIELPkYzwPfnQjvsICpnB+/fs3iOe4TWdBeMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3oOVYhwhl1TeAVC3+v2SLMWdjBBMQRIdiEmCtQ6bHQ=;
 b=hIn87sSkcf6MJDRRnzQctUvTedVGHoM2Zk0IPrEQN9yiZnwLRwM8/OEyadfkWyAe5wg4KJLlqezSkNCgmQSmgQQIifJyAG6HQuwRd0ypBdWWvW2iUd5BiaBfDWtT//pawV1aDbBrZq1Aoe2euj/ySry3bY1jzDZy2UUwRjKu9e6/l6B6QIs4gitJmzDu4sFGyow4D+pvsNynYJqq2hOt74YVIPuN0kcsglkz7smzcITrUwasMFxUCkC23iaKG/NQ4g8tOWOOyZcsHMFxrsL0aU8Yh8xq7A6NtwEvKA420GMOY2WuJKGj7hg7QTEgrcCIPMCszKXcVvUziQdUwzfWVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8408.eurprd04.prod.outlook.com (2603:10a6:102:1c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 08:35:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 08:35:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 14 Apr 2025 16:34:24 +0800
Subject: [PATCH 2/3] ASoC: codec: tpa6130a2: Remove tpa6130a2_platform_data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-asoc-tpa6130a2-v1-2-5f4052e656a0@nxp.com>
References: <20250414-asoc-tpa6130a2-v1-0-5f4052e656a0@nxp.com>
In-Reply-To: <20250414-asoc-tpa6130a2-v1-0-5f4052e656a0@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744619674; l=3088;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=bAMqG+weJ9mChFevWr4ewAyYJecZo36yu+wZS0YSaCw=;
 b=ViYm1HwFTJOpwavSxkqnKcfB7wv4yyGwBA3QbLtJye5rGQvN98Atp283nnOTY552ZzFE69TV3
 sO6zXGUtHY1AX+xDP4PhdlfWUTjIHRZMtPwyYA2KTEvLlx54l2VeHsc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8d368e-7c39-4638-9e6d-08dd7b2f5b53
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmYrRE9iaEhzTVBrb29ENUp6bHBBQUg4WEl2SDJjeWI1N21IZm9nb0RHQWNi?=
 =?utf-8?B?aW9vR0VtQytpZDJYaGNicHNjaW9BaS9STjNob2hPcmgzN2tMZ0lmUkJtNGtM?=
 =?utf-8?B?QnpXa04wQldSMEc3QkRndUZCMU9PQjhqVW0rb2x5RGExR05MRUpzUmU1QXZh?=
 =?utf-8?B?ZTl0ODB2b0hlNEhqVW9HSElLMU5qeVpVNmJuc0NOcUNLSGx3SFRtZzVjbUpH?=
 =?utf-8?B?aHQxRGxBMVFjOStSajAvYjdkV0l0WFdiRDI1ZHVXa3Q2RUxuN28rZGdGVndK?=
 =?utf-8?B?N3IxekxicG9Va3JrYVVibU5ncThnM0xldE1HaFNhcTIzdWF6YTM2T0ZITU1Q?=
 =?utf-8?B?NlV5T0F1eEJWZnQ5ZGhac2ZIdDY5Q3RUamJDUlc2aHdSZ1JHUFJJT0h3Ylh2?=
 =?utf-8?B?cUVCZTMxVWk5WHdRcUlLVTY3clBGdWxjai9NRUcwa05xOUs4d1dxdFlPaHdt?=
 =?utf-8?B?RWtuQmEyN0hldWs2TFhZa1RvMUpaSDZlck5pNjUzZnBkd0pqS0g5NVJjV09C?=
 =?utf-8?B?bzZibXM1clR0aHgzbm9yaVRSRmVaSnp4bytxSEY2R2xyV2NnUmlFcWxiR3du?=
 =?utf-8?B?dHNpSzBqZ0lwc0FTWXJkOHh4bGRMOWhmWmw2OGxOR0VXai9UZ1NhTWhGdUYx?=
 =?utf-8?B?Z3lpcHByemt4OVJzeFNoemlUUU5Hcms0RnBSU3BuTnhtWmhQdTdTSzJSbG1E?=
 =?utf-8?B?aFNtbm1JeUdEQ2RmMS9GQm01RktyaW94N0JNU3Q0OCt5NjFvMThlR0lwdnEy?=
 =?utf-8?B?b25TTTlRY1BwRkJPWjVZZm1qNFhSY2VYa290cEtzZG1STWd1dWVKM2JxVlBL?=
 =?utf-8?B?NllwcFY0RnhKc1hXM3EydUQ2aCtPNy9NRzVSbTB5VXJ4U0lUSXNtWUp1RHU0?=
 =?utf-8?B?NWZwNkRpcjhmNi9saVRyUHByTWJXakl2ODhrQWZLTTF5MHBEd09Zc0N3Y2xS?=
 =?utf-8?B?SEMyOE5BMGNGZmZPSVpIb1NpY2ZzVUlOK1pGM3AxSnBXMEJNN3BnUk1tUXc4?=
 =?utf-8?B?RjdoaWY2b0tiUTIxK2hFdUxoY1daNlRKYlhkU1A0MzNkL1Z6MVFIS1kxWFlx?=
 =?utf-8?B?aCtZNG11QXNSOEdDMU9UT1FGYnpaTVQyWUE2ZW9CZUo1c0NoU0JBUEhkTWlU?=
 =?utf-8?B?NFpFNlAxLzU5VkxkNy91UW5jaWZzUUtGK1U5UE0zNkNLOExhK0oxbXRHbWRt?=
 =?utf-8?B?WkdxQnYvR2lnVnNKM056WlRpb3RzY3REZ1F5b1Y5OEdjRHk3NEZISzhEZFZr?=
 =?utf-8?B?bEFCYmlvOFQxeGtQb1Y0bDZXdk9LZ0hJQWZEZEowTUh0MGo2ZTZZcHNRa3d6?=
 =?utf-8?B?QkFMb2l4YmJBTzBuaFV4czZQUWJ5Q09IaXFBTXZjVGhWMGhMWXdSTFpCaTE0?=
 =?utf-8?B?MURrQkM5L2tnMEw3VW0zUDZnYUdEbEFwSjI0VVVMSFI2ZEtrUTFDby9JZlpa?=
 =?utf-8?B?SWNKMnJGVzB2MUxlQmF6TDlvWHc4QjBoOXlubG9EeVBhazBEdjNzM0RjdTdP?=
 =?utf-8?B?VEREVlFZc3I0enk0SkRxc2N0cG9TYklzU0NKYXFzc0phYzhhcStncE1aOXND?=
 =?utf-8?B?VnVUYXZNUTVsV3dyQjRpbFZtdE8rSk4xdUV2K2lHK09FZjU3YjhNb3BVbDcv?=
 =?utf-8?B?SmdEaWtMNmZUUmQ3MDFnYTZpeElKZ0owUW4yVlJoWU5ZMC9aVkx4S0JFdjA5?=
 =?utf-8?B?dFpRL1FLTGN4TjZQZmJKM0JkdUVXdWRLQ2ZBcFhEaCs0UWdYbThTZ1FxWHBU?=
 =?utf-8?B?TEVMVnhNTlloaEY4SHZyZ05ReXZsa2poYWh1QU5PVHVha0NCSzZBVDZWM2JT?=
 =?utf-8?B?RVgvYnFobVFvckp3Q2NpWVpnTDZmUnpBSC9NM0JQcUt6ejhCTnNkTzBEUUND?=
 =?utf-8?B?YUxyWFNaVWlGdnpHVnZYd0F1RnV0cXRCdzF0YlBQakZXdUgrMFdGT3ZQdjVG?=
 =?utf-8?B?R05EZkxHbm1URVZibDZmUXhsWHB3Z3hRMkNHZ1laS0xGR0xvdzFrSjZDLzNr?=
 =?utf-8?B?SkV4SWhrak1RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWJDaEhjQ0wwSVFkQWM4U09Ea3FlZTE1YzNpS3ZKc0NmbkszMUpRWHVJMWV5?=
 =?utf-8?B?Vm1LNWJ0VGZQblFYekRHU1NIZ0prQkYyMy9kZGRUWHBEcVFBbHh4VFJYQ1ZM?=
 =?utf-8?B?YWlsZjJmT0RFNDlGbGdZa2pLcmNNRVVEN0Y4d21sZ3ErMVRLUHRCblBKYk9K?=
 =?utf-8?B?TWVtUTZBOCtJZTV6YzZDRlhsbjRRSTAzaGg4c2tHaVdta2NZODYyRVV2L0Fk?=
 =?utf-8?B?RkppOFNjMXFNU1BCdUM5c21mRlBNblc3WEpyekRSK2dabXQyOFUvMVQrc0xQ?=
 =?utf-8?B?alp2T09YZE5oMXh3Wnk2a3h4WEs5cWdUWTV2c0dYN1VFYWcvdjIxd09IaFJ5?=
 =?utf-8?B?Mkh1MHU0NjR3YTc5SHg4aS8vMVRqNGdSQzhiUWZCQUZDdWwzZjFpdTVxbmJZ?=
 =?utf-8?B?Snc4ZDFCTWc5WlVCaG1HelR4RFdNZzJFaFRwSWgvWjRrYStCUTdORC81cUxF?=
 =?utf-8?B?SHg3UmN3WW8ydGtNQVErVG0yMjl1aW1hQSs5UGJLa3l4WklCajJ0aVJHZUtJ?=
 =?utf-8?B?QklvT1d4OFdBRFNpdnRyNUJGb1B4TzFiZnBwQXd1MWlTcVI0bHRMUWxvWlI3?=
 =?utf-8?B?REZFMjIzSXdUT2dyVTN3ck9nR3BOaThlTW9XeXNzeTh4VFNEZWgxODZsdXho?=
 =?utf-8?B?dmpNZGtybGlvSGZBeXRrQU16d3MxektSUks0OUVrUlhVSXNwd1Y3eWsrUVJF?=
 =?utf-8?B?cG16d1N1ZGJxb2Q0S1NrSVpHaGpQNlkyaTZWaC9GSzJqV055aFlmUDFYb29j?=
 =?utf-8?B?ZGMzOExWd0ZldjlYSytkOUdZOXdHblcvNDhRa2t0ME1RUmVPR0E2bVRIWnJx?=
 =?utf-8?B?VldnbTNML1V6aXNzcW1DTXAvaVR2enZrNytlY2ZHd0dxN1l2SUduc1U3MzV1?=
 =?utf-8?B?WGJIUXFZRlVVRDBQcmhjSTlUem5zb0ZoeVpBclJpMDF5MzExQmlLVFVrQ3Yx?=
 =?utf-8?B?aGhBYmxmNy93M2FBc0VyRnlhdUhJMUFHeWlFeDJNTU9DK0NJUVg2aXI2Tnda?=
 =?utf-8?B?WnJkYnVUUEM2TmQvNDhoVHRRTFRhQ2RwdjJ5VmxIZzFRM2VIaThKeTRua1V0?=
 =?utf-8?B?dGhQQUFKaHFGbUhoWVhpUzVrS0hRWGFMWGFwUHBuRGtUR0dCQlprZ2dsZ3A0?=
 =?utf-8?B?ZEl4b0hyRVBoSHpWUU9GUU82OEVmUUlzZU9YbldGYTBVL3p0VS95MXU1c0dj?=
 =?utf-8?B?bW43RTJKS2JSVWxFenFqdy80UWZpcC9pcDRWV282VXV2b28rL0JuMGM3Smlr?=
 =?utf-8?B?d3VGWjMzdkpwaXYzTXp0aWpLMlNHQmZ3QU44Tm9wVkNxU3JrMzlBSXl3Yklp?=
 =?utf-8?B?c2dCMVAxai8vYjNtazhYajVicThRRFFnTE9wTUg0b21TbS9xTFo0RjliQ2pU?=
 =?utf-8?B?WVpYRVVEL2hnalAraU5HYUc1SXNtd2ZPRzFzay9uZGVnSHhhWDgvRHVZSEJp?=
 =?utf-8?B?VjVlT0pKTnNJdlpEVkdJVXJZd1czckVFZVhOdDY1SkQyQ0VOd1VPTG5BZFdU?=
 =?utf-8?B?MVdJcVpLd3Bady9nSGtKY2lQZ0dKMUdvYXR5MUhrMzFLVnpuck5HcFVNV1VS?=
 =?utf-8?B?bG1pMXNvTFZMblQ2OW8xenRIbkdoN2V5ZkFrMEpJT0VtN011UDNZWS9WRzdx?=
 =?utf-8?B?MWhuR3BhaTBwa1VxY1ZvL2hScVJGQmNYTFhCUmpvK0wxYldoV2I1QmpQOHYr?=
 =?utf-8?B?VHhLSTJqZFFJd0V2Y1B6a2R5RzZQSVN5Y2J6cEpNcUtYZGJsZWdPVFpMNWJi?=
 =?utf-8?B?b1Y4TEdaQ3hXdzViVmQ1RnY4QWlwUTB5cUZEcDU5NVJyanNvU0JYRnlObkhm?=
 =?utf-8?B?UXNtbGlDMmJtNkZlbzFNR1QxV2JhVW5VSXRjc2dRQkx2UmQwWlZTVjBBbnIy?=
 =?utf-8?B?eUx2aDdBamN6WXZ1ckRtL2NoTW51Y21YaXcyUnRsa2ZmYlp6RmxQa2kxYVBT?=
 =?utf-8?B?VHFnbVRLVllkaWh6aDh3RWRFV1FqbjhvaUFJdldLcVVLWXRCMEFKV0JlWDNl?=
 =?utf-8?B?dnpFaGhlZXhRRFNEY3JOT0hEZFFpa0h3K090YXMrU1lvVVNBOHUzNmRMU0Ev?=
 =?utf-8?B?RXJkc2RUaDBJV2hXYTFBUnZ5aTIvNkRLaTRlN0FKMzFXMCtwMFYxRDFIRUda?=
 =?utf-8?Q?dzCwtmpxnGT7M2V5ucuM2qohs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8d368e-7c39-4638-9e6d-08dd7b2f5b53
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 08:35:48.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 600mz7wkY0qwr0WxrxaHjwUThDHMYFhGWlpEa8Uig+QCCEehUFRuDF3MJ7LhkZkDjfYrfJmWl6hrYLNSm4JMYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8408

From: Peng Fan <peng.fan@nxp.com>

There is no in-tree user to create the device using platform data
'struct tpa6130a2_platform_data', so drop the dead code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS                    |  1 -
 include/sound/tpa6130a2-plat.h | 17 -----------------
 sound/soc/codecs/tpa6130a2.c   | 14 +-------------
 3 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index af3537005de35dfd0ded11bdc2b9c63e10c70e93..13f75a16e17d75ba7b60111434d13f5929f162ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23953,7 +23953,6 @@ F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
-F:	include/sound/tpa6130a2-plat.h
 F:	sound/pci/hda/tas2781_hda_i2c.c
 F:	sound/soc/codecs/pcm1681.c
 F:	sound/soc/codecs/pcm1789*.*
diff --git a/include/sound/tpa6130a2-plat.h b/include/sound/tpa6130a2-plat.h
deleted file mode 100644
index a60930e36e93958c674e8e1f3ff0b39cd0be7677..0000000000000000000000000000000000000000
--- a/include/sound/tpa6130a2-plat.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * TPA6130A2 driver platform header
- *
- * Copyright (C) Nokia Corporation
- *
- * Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
- */
-
-#ifndef TPA6130A2_PLAT_H
-#define TPA6130A2_PLAT_H
-
-struct tpa6130a2_platform_data {
-	int power_gpio;
-};
-
-#endif
diff --git a/sound/soc/codecs/tpa6130a2.c b/sound/soc/codecs/tpa6130a2.c
index 7ee4f58c2abe19134534e7b8517a4cca20cf0ad7..43cd957eaf321e8cff784e5d781e8e99d2c3ae89 100644
--- a/sound/soc/codecs/tpa6130a2.c
+++ b/sound/soc/codecs/tpa6130a2.c
@@ -19,7 +19,6 @@
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
-#include <sound/tpa6130a2-plat.h>
 
 #include "tpa6130a2.h"
 
@@ -209,18 +208,10 @@ static const struct regmap_config tpa6130a2_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-static const struct i2c_device_id tpa6130a2_id[] = {
-	{ "tpa6130a2", TPA6130A2 },
-	{ "tpa6140a2", TPA6140A2 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, tpa6130a2_id);
-
 static int tpa6130a2_probe(struct i2c_client *client)
 {
 	struct device *dev;
 	struct tpa6130a2_data *data;
-	struct tpa6130a2_platform_data *pdata = client->dev.platform_data;
 	struct device_node *np = client->dev.of_node;
 	const char *regulator;
 	unsigned int version;
@@ -238,9 +229,7 @@ static int tpa6130a2_probe(struct i2c_client *client)
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
-	if (pdata) {
-		data->power_gpio = pdata->power_gpio;
-	} else if (np) {
+	if (np) {
 		data->power_gpio = of_get_named_gpio(np, "power-gpio", 0);
 	} else {
 		dev_err(dev, "Platform data not set\n");
@@ -318,7 +307,6 @@ static struct i2c_driver tpa6130a2_i2c_driver = {
 		.of_match_table = of_match_ptr(tpa6130a2_of_match),
 	},
 	.probe = tpa6130a2_probe,
-	.id_table = tpa6130a2_id,
 };
 
 module_i2c_driver(tpa6130a2_i2c_driver);

-- 
2.37.1


