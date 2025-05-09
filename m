Return-Path: <linux-gpio+bounces-19814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58621AB095D
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 06:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8F6B4C71D1
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 04:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4AE264F8A;
	Fri,  9 May 2025 04:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ftZ0pa+j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2053.outbound.protection.outlook.com [40.107.241.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38BF26658D;
	Fri,  9 May 2025 04:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766050; cv=fail; b=pqkgkTT1PVvbM6F4DZ1H6PgwKXTCiPfNl2g+qkGUNjA5B74xZfm6gkE0CIW4yOkZu5uhDOs9i4khriVyWUYziCumFuA4JJLn+E38CCbQtVIJIgBnjynvlgwzKn1BLe+Y+LRrVQK7+InJ4/fW6p1qPCuM+ElD7RwBSdKWLe93ilQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766050; c=relaxed/simple;
	bh=/Aln2p1g/BR223BAm9q+Kg6bpRzVKDzf17wLRK2quNk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sQpACsHKwZjHUz6i1iQqBZtBX1KzQLb2sxDRlkHLLYfqZXuVxru69HVHTkEp0grbaajgkYTSZ3OO1FnIvPx5hP3GO8suMJCrYQAbzTpQMH6sBoWe6duN+t88MYlxA68tpIeJjN2zvPLgM+yqP18Bds7Tjrg+5fHmj4Rw2VcPBKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ftZ0pa+j; arc=fail smtp.client-ip=40.107.241.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlEdUj9bKzgOoiq2XizJywDMgbiah1W9fQL0SY//PI9u9gJ/Ber+AFoz8lpoERvsS8nwm0CvsRm5/ZDmqzw5SNtZgd2ZMYL1o4RjBjvQPwXE5WodhQd7uI1lH3m0OY5EN/hmPvtrjhZYZoCkl0Zu7phoaXvziJMHN1yf6il16PCql6uZJ4NWSWhUzJ2WKK2FhZP76m1fvAu2zMM/IR0Qb9sUTFbTJIKKFag8em/IWdcfTC5tSmT7sNxvQ3tOFtLAlnPNI9hO2OqtmbWzmH2ZUjx/7FPynzAD4hWNsSQi2PQpD6KzKRDQjHOVTJGfwJeMIXl5TEclDJErQvhuZ1Ummg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHjNOkLt5bA7AYkTbh6Pxylo/1E55nPeqDHDURClZUk=;
 b=j5d1o9EnDzdhESP2vvuVLLljoA6+h8IKQBGh18WNQzltZgCh6XaNeiQZqemzY1jFuO7b3HVHDXMUkm54q8VpaDQUYicmDgPLhu0zBxSg3vBurTZCCR6bqejM9x/huS6CyxcsP2Sa7BFQ55GMmaHjuiKElcRgK+csSFl2ndb8bHwJvRihvxgObAp03khWHnkno/HxUzPnmuk8DG+3e/S0AYEZXO4rrUN5GCKXUCX4PJQEAZH9MQoB6aMlvOPgMi6zqVHEf0t65HYNIvPJJmvURGMTjtGjdqM/n+r/0sGt4i3lvBNI/OYhWW8nnK6i2NAmHsqcm3RHDsBEmwPqRs2EIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHjNOkLt5bA7AYkTbh6Pxylo/1E55nPeqDHDURClZUk=;
 b=ftZ0pa+j7sfJJDSx235AmZn/yeSWVECWXQY6OgiBPWEwDaULqKJYcit9oLj0Um2GVFBviDfnH+VxJ+/2jSf8HVzYzAa1e1KpNdGeCYlnkY2Ou555rus2+nyHUBeaQEyuvLaCd9phzUgcUt1O9kL/0dX2PuH/Z6/6wfXVzBjJ/R/uLirQ13fp3yb1rbq/Yf0rlmTs+2zAJqA8vsLVHL4UzIP9wHjK3MGktS5eM2VSiQ4Y3V9lhcSN7UX8m306Vf0BfZVFLV5dShiPX4THwk56QUD3WrPXO2Whevc8jWAg6CadSa4t/dEHoWJY1Mkmue6b40qaUY5vvSgIWYLJsHlAiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 04:47:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 04:47:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 May 2025 12:45:37 +0800
Subject: [PATCH RFC 6/9] gpio: davinci: Make irq_chip immutable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-gpio-v1-6-639377c98288@nxp.com>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Keerthy <j-keerthy@ti.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746765944; l=1810;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=r4hphFfPr6fMQpFirWBB3MbwJG5e66SPg/WKr7hhI/g=;
 b=DM72xFA/AZmjheuh5J1wxbp+s2vVmAXbFST4nvwYpNZXzKwvcUJah/W2FZVN2y+ZdeVcQImIR
 u8jqle2l9R+AKH7nGd4b/YFFYQ8Worn5XeJAXS5XDjuz0ZJfGLgVY/2
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c1f3b7-cab1-4af7-9e5e-08dd8eb498ee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OURmR01ubzh6b1RBZHphbE5qMFVjU2N5K1RuVUIveWhhb1QwZGlhcWpNRzlr?=
 =?utf-8?B?SW1pb0ozdDJIQUZ3YTZ4WWhrdmtJdnRaQXBKRkg4YWlBKzlPU0FwVFluWmNH?=
 =?utf-8?B?cWVHeisrdDd3cFp0MGQ5YUViMFFFZ0RDZC9MOFZDd3NWcXFqTTd0S3FZdXZy?=
 =?utf-8?B?akFveHRlWnlTb3BOREZEVDVLbUQ3cUFLdWRTd1BYTzNnQU9VeW14ZWhERjhq?=
 =?utf-8?B?NW1UT1pJTnRabVpFMXZnTnhVZXRqY21nQWVxMTFyYnRIMEFhNGVDVlRvbDdG?=
 =?utf-8?B?TUNNeWtEOU50ZXBYaU1qZWorOUdxQm5wUHZJaldsakNhaU4yanNMaWFvd2VG?=
 =?utf-8?B?Q2xvcTRZY0M5emp2bGdwRE1tVERQRzRUbHU1emp5L09oK0VTRnprbzZheVJh?=
 =?utf-8?B?MVJpNHB0SVl1QzdOeFExV2E3S1g3eURnY0NDOGozeHVzc0w2ZTF4dytiZjJ0?=
 =?utf-8?B?UTV4MlMwbkVHbnVjUXFBMmppTjNDaldOZ01GY2YycGlRTjZUclBGdUpoM212?=
 =?utf-8?B?ZFVZU0tpWlhybzdvTDV6YVJncE1LN3ZiZkZ0ZmJHdkR0ZDFqQVFCT1lxR2Na?=
 =?utf-8?B?aDhVcVJDZTYzQ1I3SWNWbUtHNlFUOVRPbFhKcFYyM0duM3lPSWc0b0FaanA5?=
 =?utf-8?B?Tkk2NFVNaFg2NWFPT3FhZXNhMjRzdXBGNzhXYWI0MjZGV2lyMEwrWHZJbTRW?=
 =?utf-8?B?MkVTVnRYVmtCdFY1NzIrQU4xeVQveEY0SklhRnZrMVBpMWZYMDNJb3FmN1hh?=
 =?utf-8?B?c3M1bjN5dHpLQnljNTEyb0ZyYStTeWJNRmRNV2NLOUZEbDRQVlMreGlQalEx?=
 =?utf-8?B?Y0V3NlNCYUh0YWJNM1BXdW9ZYVVkaVpGRDVxMFkxeldFTjAvRnJxNjE2b2Fw?=
 =?utf-8?B?NnpOKytUS3BLZ2xGMFNaMGRnbHQydFV2MUF1NTBRTmhyYzdTcGhFRDdjTFNQ?=
 =?utf-8?B?VlViSjYzeDNEcG5YTmw0a1RQSDh0S2xxdHg4d215TWJLR1dGRXIzNDJ6Y09x?=
 =?utf-8?B?M2UvZzErZ29nSk9TWjlJYmNGQ0dabno4aVdxZVZZSFlvUEJ0dHRsbUYxTVdL?=
 =?utf-8?B?T215SVc5RTBKWnhLQ0NZdkZ1NjNqTnNsQ3NLTGl4c3dtdWlUSTJRWjFwTmwv?=
 =?utf-8?B?S2tsTW52SkhoZVhxdWpXajVFSUhTNnBpZDRUa0xtWmFGMWkyMEh5QTBxcU44?=
 =?utf-8?B?MlQycXBydjBRMGg5bUQvVnN6RTNNajdLN1dzZTdURzZYUGZUU0FIYWpMMVdV?=
 =?utf-8?B?bmRWRXpmTWg2MnYvM0xtbmYwdmxndmdEcEt6NGhzcVhMek15VWE4cDJhNHZS?=
 =?utf-8?B?N0xvQ003ZUJvSkVDajFHOEozeGFlRldjSTNodndLQXBQc2x1Q3lwQXd6VDF4?=
 =?utf-8?B?cS9xS1JzdmNJV09vT0U3ekN4MG9nRDV4bWx2ZVNPclRlSlhHTmE5ZHowVEt1?=
 =?utf-8?B?OWcybnNGNEVDdm5laXJVWEdMb3pYSWhmU1E0eHNFd04yRFQ4Nnh1Q3dhVGFQ?=
 =?utf-8?B?S0FvemowUXpQOGtTcTVCek1Sci9xT05mUkQ2bnQ3SktRM05NdXlWVUVQT1Mx?=
 =?utf-8?B?TFlqVUw4eXk2cHV5LzlRUHc5QldQMk5HMUZNZ2FkVzJ2ZGF0c2FqZ0pJNWw4?=
 =?utf-8?B?V2J1RGUwR3dpcGVuUXNTMVVEKzRQeHg2Nzh4SzJBNWxxZ3E1N2x4YysydGo0?=
 =?utf-8?B?TkJwenZGTCtUYjZqbzhLN1Z2MkRrVFJ0U2xZbnpzZUc5SXVhejJ5WFRHS2JO?=
 =?utf-8?B?VDd1bXdNeGFidGYvQ2ZsdmhtcUIwZzhsVVUydzFkRkh2eG9Bb0RMQkNQSDZ3?=
 =?utf-8?B?eStJeFJlNG9jK1RSM1Nqd0RnOE9vZlZuVDB3U1IydFAyK0x6UzVjQ1NQajlO?=
 =?utf-8?B?M0Q4b2JvQy9PQWxMbk42emtQckVteDlJdXBVK1g4N1cvNlI0MTdiRktMa21J?=
 =?utf-8?B?ZUl2S3ZoS0hOdXlKV1dqaXZXcTRLOE1PWHBmMjRhMSsrQityMjgyWWhYYWJp?=
 =?utf-8?B?L3ZQUkt1UVdKRi94VE1reEt2Q21KQ1A2WlN1NGpmZ0JpV1pmckYvek9HSEc2?=
 =?utf-8?Q?Fj9KeM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rzd1R1FOZnBIcU5lY2VlZXVUUWF4eDBMWTl5WThXd0NneitSclc3YnZuNUth?=
 =?utf-8?B?bFROM29vclZPSldONDhOSWxSUTQ2YUhiYXgzVXE3dGl5bWNaVnJoN1QzdXNE?=
 =?utf-8?B?bzdoMTRXQUs1bDB4WXp6cHRpMHV0dVhqUHFxWFhCZG5CWlI4UnVhYW5pcm1X?=
 =?utf-8?B?VmF4N2ZoMS94SFBRWGJicDBaUFBGNlgyUVF3N3JGMEZETkZKTFZ0WTNFVmFJ?=
 =?utf-8?B?K1lBQ29RcmdxTzdlQis4WmNJMWVVOUdzTG0wMkNhQzYvcERmSlBIMWZIMUcv?=
 =?utf-8?B?QTBtQ1BmSUdUWnBnQlNTbGFzMys5ejJNYTVCVFVsNjd4TjR2bFhCSkR2YTBO?=
 =?utf-8?B?NkVzUC9jMGNXTG1XNDhDT0dtekhQblV0OUJ1TWhOOHBvNXZXbGptNFBwdkhW?=
 =?utf-8?B?Yk1OK05DYWZ1aWVXSWhweEltUnNIdWlBSzM0S0ZEd1N2TDJCZC8rdjRjZnNx?=
 =?utf-8?B?YXFHUm9RQkU4QzNnU0JJZ3d3QTJTbUE1VTV1a3JRMTE4cytlbU5SSmV1RXNY?=
 =?utf-8?B?eEJMbEFEZUZIdVVtZ1docWRLalJqK3JPcHNxN1ozUDNjQTZ2VFd1OVY0Y1Vi?=
 =?utf-8?B?cER3MVFQZ2JXaFYxa05kQVBSRC9uNDFXcGhTK05BU0RqcUM0TXNSUnJyMHVN?=
 =?utf-8?B?M0NzcUV2L2VURHdJNzVxTGlEa0ZLajVNZTAzdDNxMXNOK1QrRnU3R0NzeXVJ?=
 =?utf-8?B?aXl3R1NxT2ttc1hsKzlXWDF1MXRkMXZhMy9QS0JSYUM1djRySzhtYzVrZm4w?=
 =?utf-8?B?alMxQ3VBS0k2T1dDR0IvWWN6RGl2TW9iOHFEai9YSTRaTThER2xuVEVCZHFu?=
 =?utf-8?B?cXVQanZma1JjMDl3alVvTys1OXlPOUlSUWE2VTVseUpINjMxTmVKUHhTZUtn?=
 =?utf-8?B?OHhHUXEwOW1TbEM1UldFUUNNcC9kamJPZ0JDelhMN3NxRFNIVjhNSm5uVkQr?=
 =?utf-8?B?THlJek5jRTA1ejFsOGlmWlFEenM1QnE1ZGhZSnNHRzkzZ2RycEJ6STVTY0hk?=
 =?utf-8?B?bmRLN1RjQVQyNFFMc0RrY0tCaHlGK2JlSzNSMFFoZUpNcWpicStNTGMweDFt?=
 =?utf-8?B?bHo1V29BVS9UN3RNM09ZcEF5VHFkL1JXOU1mcDFyejJybkYxczNDOEtreURs?=
 =?utf-8?B?bWNMRDFTdXl6U3p3bnAwZWdGeG9LdzE2aWFKZEZMYnFlN2xPVEg0MExBVXFp?=
 =?utf-8?B?REZJcllJNGlVbXd3ZGpha2ZVT1hveUhKRXRVdk5NaUVWcEhpUTVycTJiNXZk?=
 =?utf-8?B?emh0bHUvMWE5cnZzcHo2OVdXNEJBRFJOa2FwVWpEOXpsc2FIV1gxSGpqR3Vp?=
 =?utf-8?B?M1RaV3FDS3BvZFl0VVY2UTVmRHE1UVppdXFUMU5vV3VKclJyaTNhQUdHblVY?=
 =?utf-8?B?a1J2WEtiUFd3TjgyWVkrWjIvSTdkR054ejUvNktlVjY4Y1ZXOTRYYjBTQzVq?=
 =?utf-8?B?MWZ2SXR3eGN4S2l6aml6UXg2Y2hhazlFVzU0YmVrU3hXeVcwNWxsNVlNUXJ4?=
 =?utf-8?B?WTBCM3IxNmJmRE41OWRrSzVhakE0V09YZW9zSm5TbTJkQ1NlWlpDSFcwWDlW?=
 =?utf-8?B?dnYvZzdGL2QrdHRaOXBIUDBiQ01EWThGNVIvSjVnb29jMGgwS2lCVE1jbWZp?=
 =?utf-8?B?T2xaRWc0N09IU1BBZHVnR29ZblJuSkU2RGVBQU1vU3h2MzdvVTMwWUlRRlBw?=
 =?utf-8?B?OTRFNlAxWHlic1VEckdNOFA0VXhIenplMWVEUEFUd0Y4V3BqeTdWQXN2Zld0?=
 =?utf-8?B?TWFLalh0aTJzWjB3TjBHNE5aMi84TUpubUlFVFRFWnVPc25VWXoxZnRndWw2?=
 =?utf-8?B?V2VoRG1WWWIyT3dJbVJYQnNMWUxLWExZNFpXYUpUdTdlNnJrbXVwYWxMTFRu?=
 =?utf-8?B?akJTbDY3NklpWXFhZm1ObnZBa3pTcnpVT0ZYczQxY01CTkNmaE9nRkVDNWdD?=
 =?utf-8?B?UURnMnM2SFNZQWd6anFqRWFoTUE1TnZMbmZNSEJHMjNjWkZMS21Ecm03aDcw?=
 =?utf-8?B?enhkYkw5SDBmdXdmRTdJOTdTeG01WHM0ZEx4NU05a2c0RUZpVjE1TENCbzlM?=
 =?utf-8?B?VDdFc2pFbER0WmJ2WEVITVMrK1NMc0hQSGNOUFZidEh1QWJhVmY2WWNDNmw0?=
 =?utf-8?Q?voGEc9Rdup1yLRlt5GgCkUJVz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c1f3b7-cab1-4af7-9e5e-08dd8eb498ee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:47:26.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BDTNkro3c3wEpdwNcpRMpDwEVbLTeahJt+OjtYQNshI6MNBUKxCucRF3BZG7kd9qWzuuXa1+AcX90wFPIKI1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

From: Peng Fan <peng.fan@nxp.com>

Kernel warns about mutable irq_chips:
"not an immutable chip, please consider fixing!"

Constify gpio_irqchip, flag the irq_chip as IRQCHIP_IMMUTABLE, add the
new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-davinci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 4494acc14630bcc7cb75dc475b5ae7e0a595cc5c..80a82492171e43876e617e86ba024aef095229e1 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -253,6 +253,8 @@ static void gpio_irq_mask(struct irq_data *d)
 
 	writel_relaxed(mask, &g->clr_falling);
 	writel_relaxed(mask, &g->clr_rising);
+
+	gpiochip_disable_irq(&chips->chip, hwirq);
 }
 
 static void gpio_irq_unmask(struct irq_data *d)
@@ -263,6 +265,8 @@ static void gpio_irq_unmask(struct irq_data *d)
 	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
 	unsigned status = irqd_get_trigger_type(d);
 
+	gpiochip_enable_irq(&chips->chip, hwirq);
+
 	status &= IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING;
 	if (!status)
 		status = IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING;
@@ -281,12 +285,13 @@ static int gpio_irq_type(struct irq_data *d, unsigned trigger)
 	return 0;
 }
 
-static struct irq_chip gpio_irqchip = {
+static const struct irq_chip gpio_irqchip = {
 	.name		= "GPIO",
 	.irq_unmask	= gpio_irq_unmask,
 	.irq_mask	= gpio_irq_mask,
 	.irq_set_type	= gpio_irq_type,
-	.flags		= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_SKIP_SET_WAKE,
+	.flags		= IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED | IRQCHIP_SKIP_SET_WAKE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static void gpio_irq_handler(struct irq_desc *desc)

-- 
2.37.1


