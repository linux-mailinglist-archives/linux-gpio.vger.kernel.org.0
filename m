Return-Path: <linux-gpio+bounces-23081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F2B0022E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEB581AA55D7
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 12:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B5B2566F2;
	Thu, 10 Jul 2025 12:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xtv+lBgF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B1317A2F8;
	Thu, 10 Jul 2025 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151321; cv=fail; b=b8E7xv/N3hUjnJnjM7Y0j1TVe7YsxBbqbNFkNHcy1pmXUiA3MCMxSNfRjG8znHxDPxuBW7eWj8T8OyF0LfS4iJKZ5UDABsz8HF7fVWqGWvyia4t6M915SMLSy3DgDEkhrvuccrxBi9oy7qtXRKo88DA6XMNVWcW9tbxkIIsE52E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151321; c=relaxed/simple;
	bh=qsITRXCu70JL0zUrA5wwPJL8SUVi1J6238OVEyAAoCI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=cHHLoaLP6Z0B8GXDLgMnRHapC600VawIU1uIFprboB+bt37hub4hLt0/ewbpM9U1D8KVuVMd2FCbqvl75tvpVvjnBdHTmq36WmFHRyxSDXeKEvYEvX6MgRN8+A/vghcxDYLCeb6KEZBPHhaisKkzj83VApAUhBID0xdptk6Bxyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xtv+lBgF; arc=fail smtp.client-ip=52.101.70.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEnF0CoZTE2iWoYB0g2xxJY/B9kOvNn3lrS7dbgD8pKsbxceuCktaPA+n0TKRI9hBSVoV1P6MmaUuxS9OB7xgk+MUQ+2oYCjfGqQ0ubD6RAkGGJbsIjqhirFwe0v09vnwOFT+GdJ4rLbpTmv8gEKPVumJE2U0QEquB9jM9rD4bhljKpmIgenRtCAM1psGoPW/B/+/vr2a/ZpD/ITLA47Z01VciZZLmcVWOsDs6HRULcqEOz60uR5o0Glv1+MjONhqM97bjYr4AbfPNFkJp/3fKOKirdPcu+aRGnVomy3lnbJYCzfZal9fYtQfCzds0CZ5L8ANM/V2ZZiQNKwL697Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLhvGJ/HjQ0luBGV3Pl3EAN2roq+0VGRlo55khlZCOg=;
 b=tHZ4xePFgS2/+7Y0QVsDS6sKFjb34iPlJrCRqr/kcfPCTBWyjPiEMs6iasPTCABh2mSVFt5nnfpkNb9gDTcW9gP/qt4uWZ/1tNZbh3Uf5qMCjbZNn9ac7YGCbiLdthFTTEgQ67OXEnKnIcUL6W6mWAmZ7bW8gMGJMciJPZ6VIlRWlmK9duJronwUqPw+7REekf908dKvLlfsaVwCCqRbAsQ1ni7LcOSOcqoiDuyK75o1Jd894V3OsSnHQbx2PBqjN66U27NNXAbv1Op9in7ElQ3bgaYT4GfrSFantnDFOCQhdJiNn8ncFr6hdg3Xfl+5MHD9778W+20RYaeBpyU1BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLhvGJ/HjQ0luBGV3Pl3EAN2roq+0VGRlo55khlZCOg=;
 b=Xtv+lBgFkZqeiLmzf+ETJzVUQcvaPgmCygYPBSCVLO8D1Iufp8ue2BB9zB/saBs1TYqWs1/yHInd+IVI/p1LRwvtJbQRlW8Z5xw85+jCT0Yg057mh6CsKzKlZOGqRGMcqTJBe+zyzA+Vqor+XX6mmnYgbvq08EynBOmG1xQAmgN/ggpr1LCyFFUhEjgG11UARXVKPEaenmu3qlZui3zWiKjm51XVhR4/2IFISwQIhzggVKhYUw3CRypkUhIL7uldmXaL/LaKQK+yCRvv5wdl3wf9btxVyvC8vFNO/gbtNnQKXVjMdNXSmbuZkehTctBbd4Yd9rRhW1y2dCaPNMsVAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9222.eurprd04.prod.outlook.com (2603:10a6:102:2a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 12:41:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 12:41:56 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 0/3] ASoC: codec: Convert to GPIO descriptors for
 tlv320aic32x4
Date: Thu, 10 Jul 2025 20:40:00 +0800
Message-Id: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKG0b2gC/23MMQ6DMAyF4asgz3XlGAWUTr1HxUDBgIeSKKkQF
 crdmzJ3/J/0vgOSRJUEt+qAKJsm9WsJvlQwLP06C+pYGpjYUksN9skPOAf1aPA5UtvwyK62Bso
 jRJl0P7VHV3rR9Pbxc+Kb+a3/nc0g4UTOMDkrjuv7uofr4F/Q5Zy/n0sJEqQAAAA=
X-Change-ID: 20250706-asoc-gpio-1-bd0762d29351
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Markus Niebel <Markus.Niebel@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752151210; l=1484;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=qsITRXCu70JL0zUrA5wwPJL8SUVi1J6238OVEyAAoCI=;
 b=+lL20sXKHfZdIltjcNOCgbTfRZaxORe0RoIb26P9YX7R4ijgelUZH0cQB4EArcLZDAolfFsgT
 sgmwhEqRpO7BWHPQeOPLNClEDBijPqgoqOHHSDjguWEeWaof0kS9JLh
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: b6993a5b-407e-4cd6-ce0e-08ddbfaf2788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c29PMEhtVVlSaDFKOU41WWJQSnpSTjR0R3hpYlFpeStRQWc4Y1VJUS9UMzdI?=
 =?utf-8?B?Y0pHNWoyL0gyNDNnWjRIdWVqemZyNTJNTllSMEEzeVIwbUNqWmptRTNaVTZJ?=
 =?utf-8?B?RDRYbXVXaHZmUTZZQjNCWHEvMGRpRUFvR3J5MWZiZFpndVdpZnBxRmhmYUV4?=
 =?utf-8?B?TVVpUTNJbGQ2NTZsU1UwbUI0ak1JZHNqbG84TCtxM0Z4RzVMUFNIdCtCbUYw?=
 =?utf-8?B?TzNhM3B4SDJiT3dzam1hWFUvM01oZWZYTklGTEc0MC9YV1dVS1J4c0haTG9s?=
 =?utf-8?B?aUZLNldQTUNYN2NaU1hwRDVSaVdoS09kdDJZckVzUDFWUUwvZW1zcHZxem9X?=
 =?utf-8?B?dkpwdnozNFdjdUVRalExaTlxZk1VVjBoelJqc1paUUdaV0ZvaTBacXlWOWJa?=
 =?utf-8?B?VEJlcHd5Z1JWTVpHd2FhaXR4dmEvSHJ4KzM5YWpTQmZJTG5qSGU2YnFybzhK?=
 =?utf-8?B?d2J3emdsQjNmTEdmTXBPNnNOdEJESWxzRUJNNnJJM3JURWVVN2RMSXBzN2lJ?=
 =?utf-8?B?NExqZ1hxbmJTdDlhWEtKcnNQU2pyOEdxUU1GS3hSNG9ObzlpR0JTVm5RYXE4?=
 =?utf-8?B?NnhPM0NpT2Nwc3dnQ29kN2ttemhmVXlKZTNhQytxaitzdy94aTV2QnAvYTZ2?=
 =?utf-8?B?S0lQaEhkMDhrOTV1VXZNQ0luMDVVaXBmTFV0THl1VzA0WW9PVlRqN2wxSUE3?=
 =?utf-8?B?RkloeExjQnJwQlFlKzJzQWpxQ2dDMkpTbDZyZVZTZ0VYK3lSc0lwdEJCbGNS?=
 =?utf-8?B?VVp1Y2VMU1RuOHhqQzl3Zld4ckQ5Rk1icUZ6OUg3Y0V4d1hpS2llQTRCandx?=
 =?utf-8?B?VThrcFlKWW5haXgyanBZQTFVYTg0MXp6T0RpL2w1cDRZUU9vSzhSbmxqS2Ux?=
 =?utf-8?B?clR3NVpIQVBrVTVFWlVZUUxIS1d1UGduQkZYT2FZVEFxYWFVaXZNOHZkQnJy?=
 =?utf-8?B?Y2xTVVpxVlhSQWdzbUFjb0pPdEIxU3JEMlExYXA0ay9HeU9HZUs2dXU2UGpo?=
 =?utf-8?B?MGtqUWYyS1dUdDRwY2c4R3ZhbUxYMFdiQXlYb2I0VFV2OUJpTnhwZU16bGtJ?=
 =?utf-8?B?TEVqdWNWWEQwS3k5WjlIZ2NWQUhHTTA4QnBEUm9rVU9vSE1iNXhYVCs5S3lh?=
 =?utf-8?B?OVltZW5lTGowRkQ2V041Zmt6Umdqclp1dC9qMjdvMHd2aDdJVVVKdlJxeEYw?=
 =?utf-8?B?VUZpN1drb01tcVNTc1I5WXlIc1BKOTVGMnZwRERxT0VFWXJraDB2Q0RXVlV1?=
 =?utf-8?B?SFMxQUdqRXVsSlRyMldPMXNZY2RncG1iZHpLUnRBcjBOQWFyZCtDZUZMVko2?=
 =?utf-8?B?VHoyd1cxRkViRFR6cHZmZFY5ZDNkclJydVBUN1p0RSs0Q2VmRjFxeXovc1Fa?=
 =?utf-8?B?NlJkbmlCWU54Q0dINVdrNnd6TnZYa1FKajU0eW5IZVo0TEExVHB4MThSSlhO?=
 =?utf-8?B?bUJ3N055Q0dSOU1MV3BIUHc3TjhjcHI2L0tVL3oxQUxEWkNtckdsaTRXMW10?=
 =?utf-8?B?STAzdDJyQXBwWlFJYkhXRi9wZ1VJTEhWakZrMSs2YXNBNDlnNjlZbmlPUm1O?=
 =?utf-8?B?KzE3cUV4RDRHK0x3ZVBaVFJNV3dtQytQdWkyZjAwc0YxVjk0eUlxRFVIZWpn?=
 =?utf-8?B?NGhkVVJQN2FNMnhLUFZEVkxCNE00cGZhYXhyRG1rbFExdGVnVitzckkrNVFW?=
 =?utf-8?B?U1I0VUVSTzltNHJORVRyTGhvUnMvZjZOUmJpVDJodGNmc0xpbFZSQk5kMERw?=
 =?utf-8?B?U1hCRTlBK1VzcXIwSFdYNExVbGRzWmc2cHF2WC8wNjR6MmZYaVMxL3hhOU5k?=
 =?utf-8?B?Sm5qbmtvMmNJY241U0xTSmJYYVB4djZqZHdFYXNlWGxrTDNFWG4zN01XdHZ5?=
 =?utf-8?B?MEVsVnlzMkxUc2dvdWpzQVFwSktLM0FqTTMweWNkMnBSamxMZHdRYWQ0UkVn?=
 =?utf-8?B?WnpQOStoaVhDYkZQUXQ1ZkZxMmtVV0huOGV6UUNRcGgycDN6VFdKWDZPTGhT?=
 =?utf-8?B?eisramxXdzlQUHQzSUJWNDFSVVhtbENoc0h1Y3MzMW1TNFB1OUNZdU44Ri80?=
 =?utf-8?Q?yqjJou?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azdMeVRsSzM5ME8yMFhqb2NCTGpHM0FYRkhJMkRwRmUwak1hSHdESUJVYzRU?=
 =?utf-8?B?QWZmbW1Fc3gxS2tTd0J2eG1sUThQQ0RKOEZ1OTNFVEZINUNFb0IxOXdpMFNE?=
 =?utf-8?B?OUxCRzc1R3RBeS9pbE1CbmQ1Qm4wMnRxU2dSVzZmeWZWaEJ6QjViV2F3M0Js?=
 =?utf-8?B?M1JDNHFNZzdXMGlMeGNLOUNhcDBhVWhEQjRzRzlycThyUmNuNVlpc2RGOGhF?=
 =?utf-8?B?NE1ETjlxK1ZCaDBCQVFJd296N1NHYllSRURTa3pHZVZoMGxoMnJjcGFCZ1hF?=
 =?utf-8?B?bEkvZ01RS2l6OStqTmowNTFxekU0c1lOTGEvVEw1L0cxT2xFVGYySnVoMGl6?=
 =?utf-8?B?TEhmbG9TYlptbTl5ejZqczQxMUhsY1RyL2VLalMwcFN1YjVrcDgzTW9wNzVo?=
 =?utf-8?B?Y0lzbXRVUGkzakN0cjhKUEhmUXFzSW92RmkyeUV3ekpXU1IzcmpaaTcxM0dv?=
 =?utf-8?B?V2F4SytZanl1ZFUwRS9teWdzaEh2clRQUDB2RXYrQmwrL25nQVp2NzRaTUtm?=
 =?utf-8?B?ODg4WVMzUVh2cmNIZkdMbkNjNlhwV0xZNTJxTTR1MW5nN2RndUdSUmgvUjBN?=
 =?utf-8?B?ZktyZUdjT0VLK0pPWXpmamh4d1R2b1hxckhLeG93ZTV5TDR5cmlzQzRIVC80?=
 =?utf-8?B?RWhwS2tPNkdxOVRBVWhzNDUyS2NVOXBScTlKN24wSUFaTWk5WnhwTTY2WVpo?=
 =?utf-8?B?WmMvR0laWWZxWnZyV0ZKdzNkelBBVVZsRVhBLzNKeW9jL0QxRnpCeWVCSXhn?=
 =?utf-8?B?VnVIY0czT2RrdHk1cUl0TVFoU2tlSFpkS0Q5eHdSYVNQNGo0aFgwczNGRXZM?=
 =?utf-8?B?WXVRR2g4VnR5bzV2UGV0WVRYVzRYZnM0eUNpYXJmL3Rpd3RzcHRwdGxrVXV1?=
 =?utf-8?B?bEQzRHF3M3RPOWljZExlNFpjZllRSEVSaDZWbnFabFFnSmYvdURzYnVsM0xT?=
 =?utf-8?B?TlUyaTRVSHVmU0J4dnhUdmR4WE5qQXlWR2Y1bWc5TnpGM1lKMWVwRUd6QWl1?=
 =?utf-8?B?V2NKYlhGaDU3elZPNmtjbDA1WEhySnpzeEF3dGZ3YlVycDlrblF1cmRxZjZZ?=
 =?utf-8?B?S2c3ZGtVVUlkcUNsT0NTZnlzS01mSWZlZ1BnT0loS0hkUVhFY003NzVBb1Vm?=
 =?utf-8?B?c0hsamQ3UjBGbnRzaFpxb0paR1RtaVFydzBheCtDUDVZek1yRkRKTXZRVXI2?=
 =?utf-8?B?OExZemt3NkdoVzd5OVlWMHQ3RjkxQzdkY0RJU1p4MmJUN2FBR3FwMjJ3YWJw?=
 =?utf-8?B?aEFrTUhvLzAycjVVRU5RbWVBTmVPekF2dWFnUnhBTjNvQ1pwclc2dHRKOHpW?=
 =?utf-8?B?elRzQ1dUTXgwa1FOT1lpK3ExK3gxMW9mMkRKTlNuUEVMTGg1NVhXNkJqS2l4?=
 =?utf-8?B?SzU1VFZjQ000REV3aElLaExtLzZMbnNYL0RWZ29xeEFWQkdLdGh3TENoZWdP?=
 =?utf-8?B?dmJIelJSM1I4ak9nZGZ0RVp3bHNqTGpiZzFEYkdFSkhnZnFyN2ZYMEZxQVdj?=
 =?utf-8?B?cGpMamxNbUFUQ3FJMzVCckZHR0RNMXc4OGwyZlIxOEp2MktFdXJmS2ZEbkxj?=
 =?utf-8?B?N0tLUHp0d0MzK2xWOERCazJNMCttVmFNaU5ZTGlrTjhtOGorSXVHenpaVnZi?=
 =?utf-8?B?MFVaeGpLS3E2cVQ1WXQzYnlSc2p5RUZZMzFuTkJ1TjZnNXFUQ09DelJLRGd0?=
 =?utf-8?B?WVJKZTFKY3E4THZpd3NMbXpRaUErVGtGa3JNWTJsYlVjUTZ5VFRObHEzd3lO?=
 =?utf-8?B?VzlmRldHL2VHMDU5RlpwcmJsL0t0cFBrS0Q5OFlRd2lzdzQ3WHBYanNMcC9Z?=
 =?utf-8?B?enlGWEdyQytDamdheFJyRnliUmh1dGgyMW0xa3d6WmxXRVIrQzZEWFdJOWc0?=
 =?utf-8?B?VytockNqNWZFQmQ2VFQ2LytPTmY1ZUxaUjFyUTluMTdaWFhDYVpIQVFDTjVS?=
 =?utf-8?B?ckozVnpTK25qL0hZcXlnWldNem9tcStSdkhCNGk1Lyt3b0toUmpQN1UwcWtN?=
 =?utf-8?B?QXpRa0VLL0lrUXVKQmFrMGovaUk4NUd6aGRMaVRrVWYyeEFvSkdvWkg2L0NV?=
 =?utf-8?B?dkNLUmxGYkVmaHFPalZsRUQwa2dOTjFTV0s3enRhVHRKUnZOV0F0T2JYUWdu?=
 =?utf-8?Q?Sjw/p6EhEeF59tXn2KinaxdSy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6993a5b-407e-4cd6-ce0e-08ddbfaf2788
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:41:56.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdeYEYIkM7owW9q4uwPK1wHzVPnE4k7oR/jl4FidisoNWgaLEoapBVR+GSS/TSfRDB0YSRy1Obm9MLhMh5okUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9222

This patchset is a pick up of patch 1,2 from [1]. And I also collect
Linus's R-b for patch 2. After this patchset, there is only one user of
of_gpio.h left in sound driver(pxa2xx-ac97).

of_gpio.h is deprecated, update the driver to use GPIO descriptors.

Patch 1 is to drop legacy platform data which in-tree no users are using it
Patch 2 is to convert to GPIO descriptors

Checking the DTS that use the device, all are using GPIOD_ACTIVE_LOW
polarity for reset-gpios, so all should work as expected with this patch.

[1] https://lore.kernel.org/all/20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Add T-b from Alexander Stein
- Add patch 2 to sort header files per Alexander Stein
- Set rstn_gpio to NULL to align with devm_get_gpio_optional per Alexander Stein
- Link to v1: https://lore.kernel.org/r/20250706-asoc-gpio-1-v1-0-f0912095e923@nxp.com

---
Peng Fan (3):
      ASoC: codec: tlv320aic32x4: Drop aic32x4_pdata usage
      ASoC: codec: tlv320aic32x4: Sort headers alphabetically
      ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors

 include/sound/tlv320aic32x4.h    |  9 -------
 sound/soc/codecs/tlv320aic32x4.c | 53 +++++++++++++++++-----------------------
 2 files changed, 23 insertions(+), 39 deletions(-)
---
base-commit: a4c01042cd9f2ad96f3289b5b28c4b64da9e0000
change-id: 20250706-asoc-gpio-1-bd0762d29351

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


