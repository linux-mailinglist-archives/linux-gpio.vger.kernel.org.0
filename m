Return-Path: <linux-gpio+bounces-19810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43621AB0956
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 06:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EA091BC2692
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 04:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAF12641C8;
	Fri,  9 May 2025 04:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ojea9Mji"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2041.outbound.protection.outlook.com [40.107.249.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21256264A88;
	Fri,  9 May 2025 04:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766035; cv=fail; b=Leq5QRG0U/98WurfnCqrRxzyFUJehh3qrMY9UuM3yKyNDqFykaB1L4If4yxZuCmB6G9KUtt4yIXFLTzZv8xAzI6vcH/w3Q+JKmbgsGpCixjv76OdSzKhzUHzIaNW2Pa6g5HPoyf03CRJ3+3J8/VyjSPJ8txWIIzFiKmkurGskaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766035; c=relaxed/simple;
	bh=e2Rjlz3WZlRUpcPd5T81f1A652kFjdLPKaU94OLX84U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bjDzOvi0EA56586f3ngIfUbJcrRWjp+b2O2tMXNTgRVuUgna0lUcuPnTgKsQPjiUliYbppRghUUgW9jsocVtsS/1+FPfs7Rlso1jCqK1Ib4yxodWRThyC1IRIqH1fVlCix2IOtkXPSrg/XRYZkLQz6y8LYyjvJs5rZzzuVcZGCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ojea9Mji; arc=fail smtp.client-ip=40.107.249.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzGwrtKKH47tnOCV6HFGacYhNnTcmPxv6U8UarqDl9JSPkHyLmjPIsiJgp6h12A0fP3M8ROkNWAwNqG9U+J/V5wPnFoxhr2P6YVkECUC9kf4yn8Gtf7GPghy1IYMmVl6DlE6Sxvdc5fcBOFvh3QRi4YDEXHERr71S4DlZAkZXK8RCYjqdaVcq8Bctbj//vA9SQ6WweQPaKs+5CVrFmLKYWM43+JdNDZMVTvW3CCjICwpRSyP8Mz+ywJc7SjczAglAUbMM15H2msmOeUsgo/ffBs+WXIhJ09BkVme8V2aay98TOhkfNsMVKQUeclAEcC7m1Sqt1hOgf/p683dZtPQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmGIXy4wa+haW56OLX5lijzERyYduTaWxM2jShlbGR4=;
 b=g7Rr5Lu09oo0aCC6Dp03ISBFD/hokYmPjILIRfiobIwSsbrsY/drC7pmRa5xPofEwCIhDnAIvw+eVtFrEOAepAYzfRYTiHYQxJl88Vowe2UlVk7iMnv8bFiiarU2sfxnmwlsIzwcApC7elMMZTw8QLJz1eohWTV5PUg7Gon5F/ZCJPE2L185ZT5deJkjM13qM++DcdesfOYdL/g8Ex0qlQcluZF2FTC+8aCSSk4iy9o1lyJ+4bssbMInTiJdVZOvVw5entppwOXv5ifIsUaSeW0Ueww80mwnKTFPtMzwqrIWF5791Cq9Yvb2XAfKcZTmc9CMLQWZjaUGfGBu7VGmuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmGIXy4wa+haW56OLX5lijzERyYduTaWxM2jShlbGR4=;
 b=ojea9MjiAcyfLymsJw/MdhbnnXz/g/EuL233ls7NUPBSwYVSTs/Oi17bc3bIqDypIgvGh+YxatvKiJQK3vfSayP3VjuY04rs9XvlQf3GfxueRz7zjb/nj8PeUGMMUD1gNz8GeqptScBor1krVdkiI0OiX04kLZ1Rxs5QkFxb+XUDjc2okKWI6L4CjBTxl35TMXoPRN6J7Bx86pGQP7N2aeA03FhAVsFBgf/iA8akVkha3wDeCxi5N/r999qx86xuOVSwwHX0A948PwswVH+SVpU+m51kdHGRlmBSoNHcli3bePiw44dSyr+x2z58exAoHJ+SP6Xu8Pf4sMtKRuu9Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 04:47:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 04:47:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 May 2025 12:45:33 +0800
Subject: [PATCH RFC 2/9] gpio: grgpio: Make irq_chip immutable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-gpio-v1-2-639377c98288@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746765944; l=1672;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=nFs4uDnpLxGpM7ZOKqn5Fr+4jJZ7KNpbOkHyyWppLsU=;
 b=/XnCT8Ljtl+DI4WyZwiRvvJKFal+NHy8LczWFDZU5kIhfQ+EtPtegyRszqM7z9KH9164Fivmc
 3ZjDm5WsVL+B83y7q4TgoOAcSytoDLIidGWkBYYVsBU83PL8pDKbgFR
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
X-MS-Office365-Filtering-Correlation-Id: 9bec19eb-a7b3-4a80-6bd0-08dd8eb48fef
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUVvWHhLRmlkdVhjbEhZNVZkVTBobm9PSHc2V1dIUDJKT3FHTjEzK0t5UjBw?=
 =?utf-8?B?SHQxZFUxZXM5ZVZ0dVFwZ1BHYnVrSDhFTXNCM2V1a2dydmVRN3prdnNQeUtj?=
 =?utf-8?B?VHFEaklDUThjKy9UekhsSVJqUC8yWUxlNzY3eDVjd1NlWU5YelJma3pGM2Z3?=
 =?utf-8?B?dXIvUjVnTkRYR2xkUnVpY2Z3MVlEZ0Yya29GNTlvV0NQOTNoMGFieWhNcXQv?=
 =?utf-8?B?bTZVdUU4S0pYczFLVWEvU2h5bHJ4TnhhamlhcERtUFRHSVBMUHNTMWh2Z0Z1?=
 =?utf-8?B?T1hnSXFwaXkzYitmci8vaWpTSEV0eEtqdE9keXlGMDRDQm9ZOGdVaHZXM3BD?=
 =?utf-8?B?QXhydWRub2ppZTFBSWZkZXk4Y3ZWRlBzUWNsd1hGUGF2UWJldnQ2RXFoakZK?=
 =?utf-8?B?Y2R3Y1dJODc0ZVRacDBnYkxlYTF0bjdXTnlTbDVSNkhOK0kzNDNrKzI5QkM1?=
 =?utf-8?B?R2lGVkZGYXpFNk9qUFo5aFVXV1VKQitnVDQ1a1BJUmpLZm1pL1FMaENmdHhM?=
 =?utf-8?B?WlFPaUFIa0JIVU1udTZYWmw0UU4rL21GekZDWnhCdjY4MmRzclk1VHphZVE2?=
 =?utf-8?B?UXo5dDRXazFldWZGeGp1ZWpIUWZpcDJ5U2dZOEwwTUJGWTZIYThPQUFHdndj?=
 =?utf-8?B?enVuODVhK2dGakp5NFhyeWVRN1MrS3IzczcwbkovYzRQSVJ5bXc4d1RtaGN3?=
 =?utf-8?B?dmdCMEFVWE44VWFqRGxqSDdoNUEwajEyRUJISy9vNDA2VXRSVW9yN1Q5L0Ez?=
 =?utf-8?B?VkVmTnN4bjRHZXhPZjk4QnlMRW9QangwNDVBNEE1Z3krTjgyZ3FmeHUyQnAr?=
 =?utf-8?B?eGtHcDlTSlEvNnpyMmNRdFpvS2J2djdCdEF1SnRnd2RRMm1NM0wrbkFnWStx?=
 =?utf-8?B?MzNvYVkxcWd1OHViaXVNQ3Jwa0JDTndVaVlZeEM5VjdQUUtXUGtZaDB0LzN4?=
 =?utf-8?B?eTZqcnRscm0rVkl1cDVIVTd3WHhaSGoxc0lLcnNDY29kN01xLzJoYlRTRUI4?=
 =?utf-8?B?MkNrS0wvWnBLeWx2dmV5MkxLcG45NG1iRTlZQjNLOTFlM05RekUvUHMzaGVV?=
 =?utf-8?B?RjBhYnpnQU1aNFQ1cXZ1RmxEdXRyY0IrQUF1aVpNNGwrZmlrbmZFcFFwZG53?=
 =?utf-8?B?aENkUndaWnJlTnU5UDc2MldLTFpDVDF4S2hPQnFvRHNCdlA2czhLdkNBWFNG?=
 =?utf-8?B?MkZtTmpreGdBazVBT0hZaVFRUVJOKytBK3dZNVZ2RnB3ZW04YS93Vzd1eU5L?=
 =?utf-8?B?TGJuRnZ2ZGFsQUxiSFYwUzBtMlVId2xXcUdvNnIwczBMZS9ZRTlaQkZaTkFj?=
 =?utf-8?B?Z0xyYmZ5M3Q3My93OGxKeUNVSStvZGgzOTBkZ0JmY1NvYWVjYzBUZE1PMElm?=
 =?utf-8?B?VEc3L2s0SnM5RnBrWTJqQWtsWWZHdkM4TWwxd0Z3NmtpZWdVMWdkMVhlNUF3?=
 =?utf-8?B?WHZ1SmhxN3ErNS9MbEdoL09XVE1GdWZESWpJSFJ6TWlnajJ2M3NDWjVOSFNK?=
 =?utf-8?B?eFFhRnhlZzB3YWpaY0FZVVIwTHlSa0hTckxRVm5IRTFWZU0zNzIvSFhHZUts?=
 =?utf-8?B?dEkrNWVIZkNHL3JsSktNYzUzQk5rQ3B2ZnhIZ2lOMWU0T0cxMkFGUEM2TXJX?=
 =?utf-8?B?Qlo2cDN5M1pwZFZDVGNPWEZvNGxaVENMU3pheE5UYVRUbWN6ZFkxZi9JRldm?=
 =?utf-8?B?TzdMN1JEUzlHeHRpeUdmUFo0T1Z3RlQxR3NiZTFic3ZLU28yVTM3Vi8rWFdR?=
 =?utf-8?B?emR6VHN4M1dQRldzemJoWSs2MnFmK2lFeGlIUXFIVnFaUDhPUDdoaG5HYzV2?=
 =?utf-8?B?YlpVQWJ6RFpSUy92cjJqTFpkWGtWc1l4OVVpSHJibTBmeFZONndCVGhUQmdG?=
 =?utf-8?B?MFVyV093QWNjZnRVbmw4bFc0TXlZSGRodlR6VXhJbDZkY2pkWVNKZDVBOTNU?=
 =?utf-8?B?c2VKaFgrcWQ0SGdKNDErTG9uQ2xyc2dxVTdCd1FqcHRBb2pveHhkeWJKSFVz?=
 =?utf-8?B?QzVMUWVxa0xMWHI2MUg2eEpnRWIzSWZyenh2MktPZUlXYjdCT0p0TVROSTlQ?=
 =?utf-8?Q?QyN7Ja?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmQ1NnFrc2Vab0lad3ppSjNLenVlQ0NvK0lodmlNbVozK21jelYzbTVQQ2NO?=
 =?utf-8?B?SGZrdStjQ25VN1NZTzZCZ2ZpaGJCSXlCUUZrNVVJNWZPQkJ0T29PS2hRODQ4?=
 =?utf-8?B?R1d2Q01tTFozbnUxVWxrQUo5bUswOFdvUDBCbUM5ejFhcDdJNWN5Nk1QZ0Rl?=
 =?utf-8?B?RGNBa1dZa3BIZlNrZEs2cFpVOHVwK1FiWS80aUdaRVJMSGFIOW1WVXV2SC9M?=
 =?utf-8?B?VWp3TGpGQzJBdzE5YUNURGgrN1VWT2ZiU1EwMmFtdUtYdlVLa3hNUGwvMVVK?=
 =?utf-8?B?WmE5citkb2UwMVhUSUlVVG9hZVlpcU52K1ZpVGxrR0FUWVpHREU0Z1VHNWIr?=
 =?utf-8?B?Z3RtZHRObWhNbFNPZ1Z2bFBFVUJkd0Y3NDdkSnJlTmR6dC81V1VJTDNuOUxI?=
 =?utf-8?B?a3R5S21nU2dEQ29WSHQ5YTBWS1VKNmpjMzlOU21vUm02RUczVVFMNTVKN1Fh?=
 =?utf-8?B?WFBhS01LalVSbzJqQmVTVjRZdTZHQ052elJaVVVMYUNUbWlTMlgwSEJwVXBs?=
 =?utf-8?B?NG96U0cvQjJlVFdUTlByczFCRGVoU3c4b2NlV0N6dGVVVStYUHpRdnNzU254?=
 =?utf-8?B?MVFKWEZ5ZUdxSFFsb1lkVGp2YVZmc2ZDNEU5eGwySG03Z09keEVPODJvN1hm?=
 =?utf-8?B?N2RDb3A5Q1NMTDVvK2swWXREcG5oc0hZcU9FVkN0RXpPTldMU0ZnOFBqZjVP?=
 =?utf-8?B?K0VHdm5IOU1LWmV0TkltKzFIRGpFRFB4Yld2U0xSVWVoMnRVTTVVaFlPa2cy?=
 =?utf-8?B?SkxRUDU2d05EWUdaS2xWUmxLODNqb0V6QllBZzdWeWh0SjJSMFlhaVljSUd4?=
 =?utf-8?B?VXJHY3VjcHZsQ2l2ZmJXblRmTDdYQWJjanJMK09DeTBGdXd4RitxZFBqVktN?=
 =?utf-8?B?MVpPc3VveHNTdzRtVzlHV2NYR0pMM2RwdkZ4cWt0ZC80bzVFSXl0dk9FdUt4?=
 =?utf-8?B?Mm1PWUpsZFp4bHg0UEE0UjFiL1crMTRtMnNRcGtsR3NRRHlEQUYzUGlCTmhO?=
 =?utf-8?B?WlorTWNOTno3aGd0dDJxaTh1cnJ3bS9nWlNialdKdmZCdWp5QmpVODdGTXZT?=
 =?utf-8?B?aUNJSHVLTmtRQTBFTVRZRUpQM3ZTcmd6UGVZT0pBbVZSMTlZb3gwbTQ3ZkNu?=
 =?utf-8?B?TGhyS1ZHSno1ZVRZK1lVbkQ3amwxWUl2bkh0ZTJqajdhSDhFc3FyVmRpTHZN?=
 =?utf-8?B?Q3o4c2o2TE1xTHRNSXZRM3RkVjRJT05kcnRPVUdiL1FvUEVCQVlBQ2JjaTdN?=
 =?utf-8?B?Qm5rWkU4REIrcCtRUGQ1R1NrdVFQZVB1RVFpV1J6amcyR29mQVQ1VlJTbVJL?=
 =?utf-8?B?b0k4eS9tQmNJektHNWwwTVNiamhKRnhuUXQyTWhFT3lmdjcyNHU2MlVjRHdh?=
 =?utf-8?B?eWRvajJRMzNzYUo5bXFmZGVUeWh6YmRVT01ubUxkZk9ZY1Q2ZEQvUFJoT1Y1?=
 =?utf-8?B?SitKYWJRK1U4Q3RhcVdPTHVIRmJVRGlFQUNjekVrVktBbjFXK2VRQldudlAz?=
 =?utf-8?B?bjVhdGxJeEx6bWhSODdOZGhZK1ZvRHlYRHBkekdxSEdFK2lrUGdLYTdNYlox?=
 =?utf-8?B?YzV5R0tiUVYzTGZVbGFqYmFqbUxqaUtnWW0vMjJmaGd0M01oQmVobEZ1S2ln?=
 =?utf-8?B?Wk9TdG9rWHpzVDc2aEEzVXlUU1V6MzByTzd1ZWFuK1hzMi82WENMdG5Rcmdj?=
 =?utf-8?B?aGdIZStLd2tmcVBzSkVnZjl6eGkvY3J2RjJmZUk0c0RXb0Q5Z2g5MWpEYWNo?=
 =?utf-8?B?ZjJ4b0QwSUNVUFBuYURDVERDS3k0OXl2aTRoV1JNOXpnY0hNcXlnOVZKTm5R?=
 =?utf-8?B?dklpT3VQWmdCbDc1czdiZ2hEWERHOTdGMEV4QXAzK2hkTFVKQ04zbFVUTitN?=
 =?utf-8?B?cWY2K2FoZTRIMmhDSUZjSGhpbTc2NVFoWUU2blRibzFiYnVOWWtOU3N3Vmpu?=
 =?utf-8?B?ZUdsSWpFdlVoRGpTOXlFczZPSWVLRU9FdXl3YWp0c1lrNEErcE9xQWZhbXZ5?=
 =?utf-8?B?KzhSeG1xQi8waE94d2FBM3lGbnh2R2VsUElVZnZEQTlTZW82ampYYWI5Mmxh?=
 =?utf-8?B?WmtXWDlDMWlITUs0YytjVjJmY0lGSDZIUVBjaDBLYW9pZzlxbG9QUGFlZUFn?=
 =?utf-8?Q?d9u1Oj/31PUtUX6PSIIyM9yaY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bec19eb-a7b3-4a80-6bd0-08dd8eb48fef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:47:11.7620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YR8RBv58UcQkSBuoiQw98ASHWSfqbyRAM849yskpZoaVgaRBAeS4Qgc3KffxHGp+ne4jpPb1YzsXBoK8crzCDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

From: Peng Fan <peng.fan@nxp.com>

Kernel warns about mutable irq_chips:
"not an immutable chip, please consider fixing!"

Constify grgpio_irq_chip, flag the irq_chip as IRQCHIP_IMMUTABLE, add the
new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-grgpio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 641df8f2fd3d3fc523acd5103cc77d50113599e5..d38a2d9854ca524f05164180601b1a936cc70983 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -170,6 +170,8 @@ static void grgpio_irq_mask(struct irq_data *d)
 	grgpio_set_imask(priv, offset, 0);
 
 	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+
+	gpiochip_disable_irq(&priv->gc, d->hwirq);
 }
 
 static void grgpio_irq_unmask(struct irq_data *d)
@@ -178,6 +180,7 @@ static void grgpio_irq_unmask(struct irq_data *d)
 	int offset = d->hwirq;
 	unsigned long flags;
 
+	gpiochip_enable_irq(&priv->gc, d->hwirq);
 	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
 
 	grgpio_set_imask(priv, offset, 1);
@@ -185,11 +188,13 @@ static void grgpio_irq_unmask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
 }
 
-static struct irq_chip grgpio_irq_chip = {
+static const struct irq_chip grgpio_irq_chip = {
 	.name			= "grgpio",
 	.irq_mask		= grgpio_irq_mask,
 	.irq_unmask		= grgpio_irq_unmask,
 	.irq_set_type		= grgpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static irqreturn_t grgpio_irq_handler(int irq, void *dev)

-- 
2.37.1


