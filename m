Return-Path: <linux-gpio+bounces-38722-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BXCiJSNlNWpKvAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38722-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:49:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3B56A6D58
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:49:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=T7tgsrF7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38722-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38722-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F4F330785CB
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 15:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65AC3B993A;
	Fri, 19 Jun 2026 15:42:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE43B95FF;
	Fri, 19 Jun 2026 15:42:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883747; cv=fail; b=Y98/5WKTVRj77JPjICOIVmqSUn9Detij2R+kXrg49oShtoC8QhgJaKpwzGwC0BwTtoLjx1NH8jn5IWOO4bhyZK0n2XbSnYPuGW+NPRMKgPpRtefZ+0WPiqU4xZXPHRNLnlMG8jaIy6H7MNwVkWHsdKUH08LGB0Cs8CUrvHyPTsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883747; c=relaxed/simple;
	bh=7iRO/0OFKj3pK2P0AHWoJ6cBClMRx657Vc/Z0dhQQUQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l94D9BupWgxtxhkW/jdjp5mW2QajZaC9Z23U5P1uX9MTQiWKQmiyJSnGSmhh0/f+lcGmKYj8X+nzct6kqFhpI9BTeJ/8DMP8AqPni7BGLQV9edXeivYMeJFM/QUwzwp8v4aRAHdeaC9Jx/og0RMwjQunK23V5O3vvzW524dQBWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T7tgsrF7; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TA8/hmqe4DYNgxivrAs47XT0++6Inef13n8NxS+TTDcULDRvvHWVHSw35cc16/ifDQo/K+FW7KMhyToe41ooj8ESViMTQeDEAnf2kgOVDhwUnilE6hOUydDr06ua/0SXbDsiWg35KUqR+pqYqmBQM4v5vdDSwq0VFODG0U5MO4cKC8hgYtq/3EQtU+cScHHWSj78gUJziAoksdPImKO8NNIwdWGox1g1Dw83F1fF77hjTG4+yavCh1Ug/84dpJFUHIehmMIzrFYjcSLkGosKoeN2Nf9rEuv0NZ6zQ6vRUrX5Apj/uSz61Dt1le3LbZWtzrbPgAdbJ/988swTvkWgqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62gaRsocs8I4yuT/iF57uhqsF1rdgbKbbMsgUqG5+fk=;
 b=GHHAi+1RDnbgDvHJ5754NvszzdhwJQc3mNQFbWZF8yhrzwmCdz+15DSkNotA3fo0r+8Z4l1LSsgtGt2TZwyNxKi++P6K/wZURewEuXXYRQWpBtJv3odGe8f9LjEK47yRjD4l+98u4Y7h0vzLcQRKyGuoiOTm61MN967dMiaL84N0VbzE/0LMm+iP1niu1cgzLzl78Dky1b4jkZrEwZZSXlnBJnw2iwqEg2cTyR9+Ctu4nSzgqj9CGdiVgmQcnQ4VXrOddyWTwddzNnl9FcDDrWc4y3tFi+AL/ekbKd19LxesUC61H61PRjQYhZW8Ydbuw2HRBpRP8tdaERMDj6r9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62gaRsocs8I4yuT/iF57uhqsF1rdgbKbbMsgUqG5+fk=;
 b=T7tgsrF7N2C4lM75PVpkz7PensfFv5NYaLiUUPmUHiEH7luLA47h26Yp2b9ICEgfYNm5NI59Kwdkb7UWUu2Gc1j1gETP9Lm4BzvaWqhfHzY3VwqYrSVBMxt3OZU8ls84CXf+i0PhegJluWf5djBDBUE6m+fiDKdisRUzdzL0X+5B0UKO80oLiYg2uPwdVaCnTs4GxcEKdFbDsvM6PjjYlvRf0UuwzMbYu8+9cfn18vl7FXDg+LFKHV0WWgEggfAbWaqWtMQYDYI7/+rXt+IPyL6kN3uqMVZGPoXk2ONZDsazAzqfoR5itSCnmPR3uoyxoHJfW4iO9EcFCqFchzLflQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8430.eurprd04.prod.outlook.com (2603:10a6:10:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 15:42:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 15:42:01 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 19 Jun 2026 11:41:06 -0400
Subject: [PATCH 09/11] ARM: configs: lpc*: Remove NOMMU platform support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-dts_cleanup_arm_mcore-v1-9-0101795a2662@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781883675; l=10422;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=8QQdzB0Kpi2yoxZ2AcEyZZPocd/aO6l9/XYi47iKzw0=;
 b=Bmun7nmvaVTTEY2xSTYkz3Xm6WP6MqRIMh0p3eRZ8P99+tHQDcFMjXqJKRSPgbRSp3C7JMzDy
 LFqcrqDmXgICXdaHjG38QLbSd9yQnyLuuoO/qy8L9eRu8xVncTlnmn7
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:806:d3::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc50e5e-454e-47e0-b05e-08dece194e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|7416014|19092799006|11063799006|921020|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	a3ltJjUFAE+iLcgrQZQHw/t8aHG8AUnF9FI0w9AuDpcwXzQwOYxA+RJhHP70iDSHwGqOgd73HaiN7YXE7BTybKCeXmsBVel0/XTS30PGu6LaM1HLxy3p2idDLLoXnL0CLJ/3k+YUEJU3btMtTMGyDIRYLzXBKnLNmTmOGEBU6nIdxEVGQpGG/18K1AqE9cYww4AW22ZPcEGzlQwwq8To6b52V/RyUKv4DVDqUkJm1ipQviCX+FqWodjO2ozEppom6SpGKATlelgI5LLy4m2rTl3qKXV0te2RuZoOVmZTMv+OuouNqkVkfsDcW17b3XKLu9w2lRPOGeT8FuAWcbCOUK5wPM/bK8XhEOWjpI8wRMIgi8wyfugbaAM5sMsY+bQEKdQq8Mly/iiE9I2tpoXK1jvXpNRxMTAovEeOasyxcc4H15nrhX44e/kcmshAipOr9lZlFf3j4MZ/HBOkAin+ZgsEFhsB0Jdg4XzKG34qORYRuclSHKpQHJ1Efac35MQ+6lqycWcLW827FD6MBjqkvnAxXP6OiXxxCmQWpR8VebVkVu2XCcaptds1pi2nuLHiFsI8kVU4tpcWPReEStbVQleL1ALmyZmFN2orivuEeqe0XOr4SBR7QxPvyV+bsbBJ3KVWFu2JgmQXb62YOwTBdCwvPNwQJa64oMU1Czyo9ZnxiVCgaw154XRjheELjzZt4V87iVcSdoNcmyuApwiAdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(7416014)(19092799006)(11063799006)(921020)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3l5c29nY3M4MzRVMFBMWUl0TlBnaERwVExOaVNLMHJQTWdFd3NIaVJnVE82?=
 =?utf-8?B?VlYrNG1MZ25DZmJmVHduMTRZUU0wdFJidGM4UUtQTGlqYWVwb1p4T1FVeENy?=
 =?utf-8?B?NWNwNmRSMFZibG1oaitaYlUxNFRWQmtHQTlqSXhWME9WVHlVVDVpaWRuenlK?=
 =?utf-8?B?Nkd3Umt3Z0dVY3JRYnZCbVVmOWxzS2k1a3RiU3BtMW0zVGNGUGlhOTlsTjVH?=
 =?utf-8?B?K0swTVBUNU5Cd2hQMW4zUWhwQ2dqZ1dEUTJ5RVBIN0VqUEE2eW9iMVNUbnNu?=
 =?utf-8?B?cXhQQk9UMFd4T25TcDFSUDk3TVRwVVpLOEVHeGkrdThkTllrREZpdm1wcnpw?=
 =?utf-8?B?WXdxT2dIbjBEeG5MbEhNdk5uRFRrcDNJUXVlUEZGaVkvVCtOc0V6UXd6Qmlp?=
 =?utf-8?B?TStrMlVySlAwN2lTR2FQYUFHeWs5a2M5bFYxaHRmcmpWNU1tTGt0K1lBVmJm?=
 =?utf-8?B?SitXU2NUZlJIaGg5VTM1RkY1UUcrTGVVYjc0N093WXpNWTR0Q0VWSE5ZMUFW?=
 =?utf-8?B?N1dYQWdrSUFVMmsyMktxZm0wTlZqTVdnK2FrajFIK1YyZlNLZ3R0eU92N0JT?=
 =?utf-8?B?ajhlMEpCTlpTRDJzVGdIamljYUxnTDNvWWxJZk1mTzFPdEQ3RUt2SDBKQnZ6?=
 =?utf-8?B?WFlVaVFpOHg4VGsySE1Qc3hLNEdFSUlGK3BQdjlhbHBJTlB6dGcwZ0tPNUdQ?=
 =?utf-8?B?elRTdU4rdzlUYW00SHJLSm9jUFRmU3dTdVJ6Q0habGhTSVRoR0ExVVZ1Ykl1?=
 =?utf-8?B?YmwvUkJRNGk4RktVMmltcmdXMG81V1RlckFLQTAyK0JTa1ZUNVNCRmdsRXEw?=
 =?utf-8?B?aHhHQ0dta0I4K2x0cENxb2FuZ2ZOZjZjZUtDZFphZitESms3K0VSS05xUVZo?=
 =?utf-8?B?LzZHZlQ4Y3JabW1rT1BPaTZHS2wyU0JSSU53MklmbiszSTNmbnNvSHlRS2Fo?=
 =?utf-8?B?UFdqWktnRWdwQ2RHenloQ3dkYWFYNSs1RkpMUmdIYUxZSm8rMW5UL2JNTVZj?=
 =?utf-8?B?dlpRQzhaeTEvS2ZyVStFeHFlQVVuSzhnbE1IQnNvUjR6S0Vab3Rza3ZBOFln?=
 =?utf-8?B?cGZVdENPU0RweENEOXE2TG9lcGtnamV3ZHJrNWhqWUhtb01VblhiWktVSVE1?=
 =?utf-8?B?L1grQlpUYVNTQTE0MUpZNWFsQmZCT0RGTnpINEd0WmFxbGR3VmF3S2dXL2xW?=
 =?utf-8?B?bVNXNktBRWwzU09Hb0JrblhpNktzNTJBV1A4TCsxOEtSQ2xYbzJIMWM4M0wy?=
 =?utf-8?B?STJLYTVBakZlNVBsbFY0WlJNVUwwTHpkNm0xREp4WTFkbEJrUi9TVXY5WHZy?=
 =?utf-8?B?M2d1Q2NkVDJkQ09DMFIzQk0xbkR2Y1NIMEdtcWxYNEs0UnVrbU5iVitzYjdZ?=
 =?utf-8?B?dlJBcHUxMXdIOHZkMXUvVzhnT2VoM0ZNaTZwM3BmZnRnS296UHZrQlNTTmNG?=
 =?utf-8?B?dWNFMGkycHRDckNHM0I2Uzdkdm1tSDJnemplSkpNelFueXFMVTJidXhWRW9T?=
 =?utf-8?B?WFNpTm94UmM0aGJWaVdsQVJpenZUTkVFU0pWcVF3WXF0bFdiR0VjMnprOFQr?=
 =?utf-8?B?VHVvbHZwUEdXUHUwVzd6OUVUWGV0dXQ0LzVmcEJoQ3UzL1RsdTBraER4NHFm?=
 =?utf-8?B?alRiSTg1UWNLRkRjSjJCL0dPczBScGFvSzQ2Y056WGJidTNaek1GTi8rbUVa?=
 =?utf-8?B?Z053Snd3cW0yNVMyOEFNRDhLWUtrd0YxUWhucWJGbTM2dTlBYjlpVURSajlP?=
 =?utf-8?B?U3F5aSt2MVB0cGVPTnpBSjRpdE1sdWE4bEM4TGRsNnZYMXpLMU9VY1IzeDhX?=
 =?utf-8?B?QnFkOW45Z1ZSNHdlM2FwZ0MraUEweW5VbktELzB4RG9DdUNqV1Y4Qncyc3pW?=
 =?utf-8?B?SUd6UEM2SGNuZS82UUpqU3NhbUpSdHhGMmI2S25Ld2VxMTlDWkNia1JRbDU3?=
 =?utf-8?B?UjlPOWlKdS9uSnFrcTJldEZaQXFWM3pYUjlSZVZLL1VadFIxZWhoaXZrVGps?=
 =?utf-8?B?c0xNbWdKQU1IUUZYOE5PVE5icnJaekMrZDFBRWxmQTByMllGTnVEeUswaVFE?=
 =?utf-8?B?cWhqVm9MencrM2RSUStnWDJWWEtJemo0bkxXQ0FCc2FxZDZ6TGp2SHNjRHdp?=
 =?utf-8?B?Y3BrT3l3WS9ybHRJZmFGNU1pU3dQN0x5bW9DSENUT3hIYnlNbmVtczF6VDBl?=
 =?utf-8?B?L25RNXZVajZyYnlUWDN5ZVI4dkZpdmlZK1ZBTEJKRExKeU1GNDBybzBqajBL?=
 =?utf-8?B?QThGMmQ3L240ZnV6THplY3g0ZEpNMk1xMFdCQzVZcDhPd0l6Yk5aSU9JQUJP?=
 =?utf-8?B?cnRNdVF4Z0pDcXhkR2E1THE5R2RwcUsrSGNrWlBMOWJ5S2lBZEFueUt1NzJD?=
 =?utf-8?Q?SEF6Fy9IzzSPyPy8t+kZ8FadwHC/m1xqSgmUJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc50e5e-454e-47e0-b05e-08dece194e13
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:42:01.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAcvvE0YsAwKBnCNmi6oN/+tVPkZLU67aeD+nMdLjc9+s1tWl6KnYV+CrW6Ms5Xzwm8PTdcIdfEPATGNlMpwYdJA5GId7wKRzExF61SQO/88NF7TkaMz34nVQ2HVbiB8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8430
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:stefan@agner.ch,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:s32@nxp.com,m:linusw@kernel.org,m:vz@mleia.com,m:piotr.wojtaszczyk@timesys.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38722-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_TO(0.00)[arndb.de,pengutronix.de,agner.ch,gmail.com,kernel.org,armlinux.org.uk,nxp.com,baylibre.com,redhat.com,mleia.com,timesys.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,oss.nxp.com:from_mime,nxp.com:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F3B56A6D58

From: Frank Li <Frank.Li@nxp.com>

Commercial users and hardware vendors migrated to Zephyr or other RTOS
solutions years ago, leaving the NOMMU platform support effectively
unused and unmaintained.

Remove the obsolete support to reduce maintenance burden and simplify the
NXP/Freescale platform code.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/configs/lpc18xx_defconfig | 158 ------------------------------
 arch/arm/configs/lpc32xx_defconfig | 192 -------------------------------------
 2 files changed, 350 deletions(-)

diff --git a/arch/arm/configs/lpc18xx_defconfig b/arch/arm/configs/lpc18xx_defconfig
deleted file mode 100644
index f142a6637edee..0000000000000
--- a/arch/arm/configs/lpc18xx_defconfig
+++ /dev/null
@@ -1,158 +0,0 @@
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_PREEMPT=y
-CONFIG_BLK_DEV_INITRD=y
-# CONFIG_RD_BZIP2 is not set
-# CONFIG_RD_LZMA is not set
-# CONFIG_RD_XZ is not set
-# CONFIG_RD_LZO is not set
-# CONFIG_RD_LZ4 is not set
-CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-# CONFIG_UID16 is not set
-CONFIG_BASE_SMALL=y
-# CONFIG_FUTEX is not set
-# CONFIG_EPOLL is not set
-# CONFIG_SIGNALFD is not set
-# CONFIG_EVENTFD is not set
-# CONFIG_AIO is not set
-CONFIG_EXPERT=y
-# CONFIG_MMU is not set
-CONFIG_ARCH_LPC18XX=y
-CONFIG_SET_MEM_PARAM=y
-CONFIG_DRAM_BASE=0x28000000
-CONFIG_DRAM_SIZE=0x02000000
-CONFIG_FLASH_MEM_BASE=0x1b000000
-CONFIG_FLASH_SIZE=0x00080000
-CONFIG_ARM_APPENDED_DTB=y
-CONFIG_BINFMT_FLAT=y
-CONFIG_BINFMT_ZFLAT=y
-# CONFIG_COREDUMP is not set
-# CONFIG_VM_EVENT_COUNTERS is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_FW_LOADER is not set
-CONFIG_MTD=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_CFI_STAA=y
-CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_SPI_NOR=y
-# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
-CONFIG_SPI_NXP_SPIFI=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_SRAM=y
-CONFIG_EEPROM_AT24=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-# CONFIG_BLK_DEV_BSG is not set
-# CONFIG_SCSI_LOWLEVEL is not set
-CONFIG_NETDEVICES=y
-# CONFIG_NET_VENDOR_ARC is not set
-# CONFIG_NET_VENDOR_BROADCOM is not set
-# CONFIG_NET_VENDOR_CIRRUS is not set
-# CONFIG_NET_VENDOR_FARADAY is not set
-# CONFIG_NET_VENDOR_HISILICON is not set
-# CONFIG_NET_VENDOR_INTEL is not set
-# CONFIG_NET_VENDOR_MARVELL is not set
-# CONFIG_NET_VENDOR_MICREL is not set
-# CONFIG_NET_VENDOR_MICROCHIP is not set
-# CONFIG_NET_VENDOR_NATSEMI is not set
-# CONFIG_NET_VENDOR_QUALCOMM is not set
-# CONFIG_NET_VENDOR_ROCKER is not set
-# CONFIG_NET_VENDOR_SAMSUNG is not set
-# CONFIG_NET_VENDOR_SEEQ is not set
-# CONFIG_NET_VENDOR_SMSC is not set
-CONFIG_STMMAC_ETH=y
-# CONFIG_NET_VENDOR_VIA is not set
-# CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_SMSC_PHY=y
-# CONFIG_USB_NET_DRIVERS is not set
-# CONFIG_WLAN is not set
-CONFIG_INPUT_EVDEV=y
-# CONFIG_KEYBOARD_ATKBD is not set
-CONFIG_KEYBOARD_GPIO=y
-CONFIG_KEYBOARD_GPIO_POLLED=y
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-# CONFIG_UNIX98_PTYS is not set
-# CONFIG_LEGACY_PTYS is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_NONSTANDARD=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_I2C_LPC2K=y
-CONFIG_SPI=y
-CONFIG_SPI_PL022=y
-CONFIG_GPIOLIB=y
-CONFIG_GPIO_SYSFS=y
-CONFIG_GPIO_74XX_MMIO=y
-CONFIG_GPIO_PCF857X=y
-CONFIG_SENSORS_JC42=y
-CONFIG_SENSORS_LM75=y
-CONFIG_WATCHDOG=y
-CONFIG_LPC18XX_WATCHDOG=y
-CONFIG_REGULATOR=y
-CONFIG_REGULATOR_FIXED_VOLTAGE=y
-CONFIG_DRM=y
-CONFIG_DRM_PL111=y
-CONFIG_FB_MODE_HELPERS=y
-CONFIG_USB=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_ROOT_HUB_TT=y
-CONFIG_USB_EHCI_HCD_PLATFORM=y
-CONFIG_USB_STORAGE=y
-CONFIG_MMC=y
-CONFIG_MMC_DW=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_PCA9532=y
-CONFIG_LEDS_PCA9532_GPIO=y
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_LPC24XX=y
-CONFIG_DMADEVICES=y
-CONFIG_AMBA_PL08X=y
-CONFIG_LPC18XX_DMAMUX=y
-CONFIG_MEMORY=y
-CONFIG_ARM_PL172_MPMC=y
-CONFIG_IIO=y
-CONFIG_MMA7455_I2C=y
-CONFIG_LPC18XX_ADC=y
-CONFIG_LPC18XX_DAC=y
-CONFIG_IIO_SYSFS_TRIGGER=y
-CONFIG_PWM=y
-CONFIG_PWM_LPC18XX_SCT=y
-CONFIG_PHY_LPC18XX_USB_OTG=y
-CONFIG_NVMEM_LPC18XX_EEPROM=y
-CONFIG_EXT2_FS=y
-# CONFIG_FILE_LOCKING is not set
-# CONFIG_DNOTIFY is not set
-# CONFIG_INOTIFY_USER is not set
-CONFIG_JFFS2_FS=y
-# CONFIG_NETWORK_FILESYSTEMS is not set
-CONFIG_PRINTK_TIME=y
-# CONFIG_ENABLE_MUST_CHECK is not set
-# CONFIG_DEBUG_BUGVERBOSE is not set
-CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_FS=y
-# CONFIG_SLUB_DEBUG is not set
-# CONFIG_SCHED_DEBUG is not set
-CONFIG_DEBUG_LL=y
-CONFIG_EARLY_PRINTK=y
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
deleted file mode 100644
index b9e2e603cd95e..0000000000000
--- a/arch/arm/configs/lpc32xx_defconfig
+++ /dev/null
@@ -1,192 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ_IDLE=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_PREEMPT=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_EXPERT=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_LPC32XX=y
-CONFIG_AEABI=y
-CONFIG_ARM_APPENDED_DTB=y
-CONFIG_ARM_ATAG_DTB_COMPAT=y
-CONFIG_CMDLINE="console=ttyS0,115200n81 root=/dev/ram0"
-CONFIG_CPU_IDLE=y
-CONFIG_VFP=y
-CONFIG_JUMP_LABEL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_FW_LOADER is not set
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_NAND_SLC_LPC32XX=y
-CONFIG_MTD_NAND_MLC_LPC32XX=y
-CONFIG_MTD_UBI=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_CRYPTOLOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_COUNT=1
-CONFIG_BLK_DEV_RAM_SIZE=16384
-CONFIG_SRAM=y
-CONFIG_EEPROM_AT24=y
-CONFIG_EEPROM_AT25=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_NETDEVICES=y
-# CONFIG_NET_VENDOR_BROADCOM is not set
-# CONFIG_NET_VENDOR_CIRRUS is not set
-# CONFIG_NET_VENDOR_FARADAY is not set
-# CONFIG_NET_VENDOR_INTEL is not set
-# CONFIG_NET_VENDOR_MARVELL is not set
-# CONFIG_NET_VENDOR_MICREL is not set
-# CONFIG_NET_VENDOR_MICROCHIP is not set
-# CONFIG_NET_VENDOR_NATSEMI is not set
-CONFIG_LPC_ENET=y
-# CONFIG_NET_VENDOR_SEEQ is not set
-# CONFIG_NET_VENDOR_SMSC is not set
-# CONFIG_NET_VENDOR_STMICRO is not set
-CONFIG_SMSC_PHY=y
-# CONFIG_WLAN is not set
-CONFIG_INPUT_EVDEV=y
-# CONFIG_KEYBOARD_ATKBD is not set
-CONFIG_KEYBOARD_GPIO=y
-CONFIG_KEYBOARD_GPIO_POLLED=y
-CONFIG_KEYBOARD_LPC32XX=y
-# CONFIG_INPUT_MOUSE is not set
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_LPC32XX=y
-CONFIG_SERIO_LIBPS2=y
-# CONFIG_LEGACY_PTYS is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_HS_LPC32XX=y
-CONFIG_SERIAL_HS_LPC32XX_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_PNX=y
-CONFIG_SPI=y
-CONFIG_SPI_PL022=y
-CONFIG_GPIO_SYSFS=y
-CONFIG_GPIO_GENERIC_PLATFORM=y
-CONFIG_GPIO_LPC32XX=y
-CONFIG_GPIO_PCA953X=y
-CONFIG_GPIO_PCF857X=y
-CONFIG_SENSORS_DS620=y
-CONFIG_SENSORS_MAX6639=y
-CONFIG_WATCHDOG=y
-CONFIG_PNX4008_WATCHDOG=y
-CONFIG_REGULATOR=y
-CONFIG_REGULATOR_FIXED_VOLTAGE=y
-CONFIG_DRM=y
-CONFIG_DRM_PANEL_SIMPLE=y
-CONFIG_DRM_PANEL_EDP=y
-CONFIG_DRM_PL111=y
-CONFIG_FB_MODE_HELPERS=y
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
-CONFIG_SOUND=y
-CONFIG_SND=y
-# CONFIG_SND_VERBOSE_PROCFS is not set
-CONFIG_SND_DEBUG=y
-CONFIG_SND_DEBUG_VERBOSE=y
-CONFIG_SND_SEQUENCER=y
-# CONFIG_SND_DRIVERS is not set
-# CONFIG_SND_ARM is not set
-# CONFIG_SND_SPI is not set
-CONFIG_SND_SOC=y
-CONFIG_USB=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_STORAGE=y
-CONFIG_USB_GADGET=y
-CONFIG_USB_LPC32XX=y
-CONFIG_USB_MASS_STORAGE=m
-CONFIG_USB_G_SERIAL=m
-CONFIG_MMC=y
-CONFIG_MMC_ARMMMCI=y
-CONFIG_MMC_SPI=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_PCA9532=y
-CONFIG_LEDS_PCA9532_GPIO=y
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_PWM=y
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_LEDS_TRIGGER_TIMER=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-CONFIG_LEDS_TRIGGER_BACKLIGHT=y
-CONFIG_LEDS_TRIGGER_GPIO=y
-CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_INTF_DEV_UIE_EMUL=y
-CONFIG_RTC_DRV_DS1374=y
-CONFIG_RTC_DRV_PCF8563=y
-CONFIG_RTC_DRV_LPC32XX=y
-CONFIG_DMADEVICES=y
-CONFIG_AMBA_PL08X=y
-CONFIG_STAGING=y
-CONFIG_MEMORY=y
-CONFIG_ARM_PL172_MPMC=y
-CONFIG_IIO=y
-CONFIG_LPC32XX_ADC=y
-CONFIG_MAX517=y
-CONFIG_PWM=y
-CONFIG_PWM_LPC32XX=y
-CONFIG_EXT2_FS=y
-CONFIG_AUTOFS_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_FS_WBUF_VERIFY=y
-CONFIG_UBIFS_FS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
-CONFIG_NFS_V4_2=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ASCII=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_UTF8=y
-# CONFIG_CRYPTO_HW is not set
-CONFIG_PRINTK_TIME=y
-CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
-CONFIG_GDB_SCRIPTS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_FS=y
-CONFIG_PANIC_ON_OOPS=y
-CONFIG_PANIC_TIMEOUT=5
-# CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
-# CONFIG_FTRACE is not set
-CONFIG_DEBUG_LL=y
-CONFIG_EARLY_PRINTK=y

-- 
2.43.0


