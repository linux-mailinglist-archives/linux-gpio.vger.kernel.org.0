Return-Path: <linux-gpio+bounces-20459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C3AC055D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 09:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41B371BA7E58
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 07:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E972222D2;
	Thu, 22 May 2025 07:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eoWJa1bq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729FE223DE1;
	Thu, 22 May 2025 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898024; cv=fail; b=cZFNsQnsakCb+iNT/x1sS6Ny/Z2ed8bJ2Ibv7/Xotoeh68A0CyUq0p38mCzhpkol3/04ok2qynQjon+Ap1d+ixj7M3DgB21l7VTyaBlbGQ91HANdPypjC3osocYPupjPa2VqUf5XQ3PpsGfn8NndbiLHrkLgfEHOiJCcmT3dFWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898024; c=relaxed/simple;
	bh=gL/ciltmAsJKFsfz4fPIXajSNY2HOS1Cl7C9SIb/VLg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eOdm+CQmHJ92mdPTDlYrVgaVoZhvsUAkyMqSYqdYqmUb0VEiSmEksKBU6iYY6BIav4ImYoIe7HzU0njlHPRus0+FxpybtoMrajg0N8BNi93H6Rwk/UhUWfm1MOjVTcVZDG1j5jjL4UnWPB7jlrVuOwnDdJFMz7gUnzr6iKg7aBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eoWJa1bq; arc=fail smtp.client-ip=40.107.20.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iazpoifugvWGKMI6H24V897qa1iuiHAPSpNWiTtkZ4FzO4HWr6+Ho8jJOM2Yt0ypZv5Xkcp0LOZmlXbcbPda8Cuw2osA9JWkesa9THVBFwtgC5p+/sgXTB3Js+k5p/uJ2upVSZcIrY0djfVXSLfXoN8XEy53VHOOs4QJVDthkpFq0ovcYYudBWaaMkNbn3vFPJflNM7mnT8JiEn9RVer19TC97EU0KN1B6c3tYtVZFBQa7zbKsB0HPg2+3Xyz/xml1wXJw/KekPvhyAI+NTczAJ1cYaV09Apl2ItdViKVjnTNO7A8hKt/eqZ1Vb2gFMyxlREBoEVXpwYmUyK0YevPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezDyVAbA4gS2k8ZHME9B9cK7P1aJ0hGomco8OyrRxYQ=;
 b=W14RI0NMqq9EiTwizPNy5YmjYVfBS5VXOUcrXQCBWCLUChd1cGSt/lTw0JF3HehuflNK62HfLPHO3RYJ+ZPm4lC8UDDYZDLox0kcf73hspey/HHjPClnZzud++GsiCF9IKniRjRbPwMV1s38JwxDNlQC8BZKvomFCKiVlGB8ki5u8wsBpntFzgr7525L9MWeGB0gtQYOHH4HpNq/ucf2EaaynfpKS858EhKm4ReHmGBKTUEFdxJJbviYqpm/F+tjW+cZmXDg6F6bBthDhmtx122WHZ/P12V9nmIYV4biVsEoc9PRq2MLvkosu/GiRyPENbW8D/sHQ8PxAjB+JL9Z5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezDyVAbA4gS2k8ZHME9B9cK7P1aJ0hGomco8OyrRxYQ=;
 b=eoWJa1bqeAlQKphHsC/KnUN3a2FCyxkhOGfCNu5TZl4qqVzgDw1u75F66qbPsNkS99RInBKaYGNvBEBGuq45NSjnZ+ALj6abENAia3HVrxRem+r3Xj/TV29OT1rPcm/P98SaflhML3YC40HgVApicsQ0wdZWwYuW66OojMrtqsypZywbB1mqo9XgKEcbCnwk080kf40khoATvnwnj2PAADgt9oxKH5k+ut30OwF3ubQ8KefP1i5D01bocWrd/U15CTsi9NEN9Qp/zqRsi7vCiWZL3vOCYBB3VLr9iKayjblJhWwG49r14sm3XnE956ADkAMOPvPYmraVf0xsXnulPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7033.eurprd04.prod.outlook.com (2603:10a6:10:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 07:13:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 07:13:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 May 2025 15:11:53 +0800
Subject: [PATCH 4/4] gpio: timberdale: select GPIOLIB_IRQCHIP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-gpio-fix-v1-4-98ceae7c4c3c@nxp.com>
References: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
In-Reply-To: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747897924; l=782;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Lgqnobq5SPiV4tdrOBWkOHyaqQLWotzQcWFB6abxdlI=;
 b=ufPwD1ICANhcTCxzPmeOdXMeJES0Bpwnjprw8EFaiexBoC6faBeXhbNxWqSj5RwQo0hMQz4u3
 9ELUbCwue1yBWb3A03e0q1TtA+Aybyu0Iz8H1ACqVHdlMdFcQXR4dfp
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8bddb5-4586-4632-49e5-08dd99002bdc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2tuUGNkcWNwY2VuZzE1NTdid2lNdHc0TjRDSjNXTHJXWmZpSXJnVjNsNjVH?=
 =?utf-8?B?Y1pQWUZVNFkrNjczNXhzY1RUOFVVeE01VFZmY1FsL05YOGwwVnBRL2ExTnVD?=
 =?utf-8?B?Wmdxd3RxVTdhdmU5YnlpWVgrcUJkQlF0UDArelB0R1hhK21mRURRZ1lPVEQr?=
 =?utf-8?B?TjBpT3UrWm5Wa1pJUU1pekZicFdNNGtyU0RFNFdvcTZaSlFoYzFaLzNyUGhK?=
 =?utf-8?B?MFIzUjJ2ZXpSNm1JWjNsZTh4QnE3WmNSczF4K3hJbnBsL1FYaGhIdjBTdDJU?=
 =?utf-8?B?RWkxVjJDT0MzTXVlbnpwaDBpUUhlcWM0a1Y3N2ljRGlhdklkUlRMT3dSR0ll?=
 =?utf-8?B?VDNzYWpUWkR3YTkyMnkwOVM3czdST3k3ZWxlNjlFSWZhV09CUmZNeEZpVVhl?=
 =?utf-8?B?T05vRDNrdXFsRERDMnl3dnRvRHdjLzVZMzhYNHlxQVhsNkhydGRmaytQbFRz?=
 =?utf-8?B?QlROSXpyU1NxNVp0YTZEU1pIeUhRckU3ZnJlSVU0ZDczaGcxMEQ5aW1zcjJK?=
 =?utf-8?B?K28vcGNYM0RLbEdmYll4UHloeTJITnVDWWMySjBUUTRsNG5aT3dsd3dFSXJO?=
 =?utf-8?B?cDgrTENBRkpEbzFXdjZSVy83K0tFMFRlWm0wRDJwNmVFV2Z4Z3doZUlFU2hQ?=
 =?utf-8?B?b1FRcS9xM3BsamNzOVltVFBrU2xKTmQ2S0kzTjZ2d0lDRmN4RU9hdlIzSmRx?=
 =?utf-8?B?elBzajRKYkk0VGhZYnY0c2dIUUx4dGNiTXFiWSt5REczSzR5RldEa3JRaW1p?=
 =?utf-8?B?ZVhVTFEvbFMreVhtcURoUkpCNy9XemV0K3Q4S3FQcjhPeituelE3UzQ0MXY2?=
 =?utf-8?B?cS9kVTNIVlNQQWk2V1paNXVMUDY2aFRpK0EvcFNkWjhBRHU4dmowcDJURmpX?=
 =?utf-8?B?WjRJZEY4WEp1REkrbzB1Q2JaeVNXdmhGTTJ6ZWQyMnUvKzRId2N1aVNDakox?=
 =?utf-8?B?RVhVRkNmUUhqbFpDaXNUcllhKzdwNXBxMDF5UkU2Q2Z5bVVaL3NpZjZVZno2?=
 =?utf-8?B?R0RWclQrUTVZSlI0UmJGQ0FVMVBOUzIrVm4rVFU5SnVweGlQYkpmK1ZzN0ZE?=
 =?utf-8?B?b3Q2WXg4RVJOQ3JkbGxHVnZWR2ZmZjF4Z1BQUzQrb1FwdEtnWWd2elNwM2FP?=
 =?utf-8?B?aUkvbTcydWU4Y2NnVFBURC8zUHpzem54S0Q4T01jYXRjVW8xVUhMY2RWK3Nv?=
 =?utf-8?B?eGFJOWdGMlhJc3I1c2pnMTUwUVA4NXVIZGMyUUM5MWlibXl5V1R0cE9iRXN4?=
 =?utf-8?B?cUJHdjk0R3ZmdWxxdzVzUkxxRnI4V0ZiTjE1WXhjZlA2ZFJmUVFDSXYwTDZB?=
 =?utf-8?B?SmpDNG1HYWsyZnhKb1Fic2U3Uk8vejBZM2dGMXVkQ2NUVm1ZNEdFcXF4Y2Vt?=
 =?utf-8?B?ekw5TlBOMTdWNjAxOXh5blBMb1JHRVdDclJjcGdZdE1VcUc0VEpJQjk1SzZ2?=
 =?utf-8?B?Z1V4ZkxHZWdMNVoxUXBEVExGUVJKRFQ0d2FTZlpYbGFUcHBVcHZ6WG5rdzd3?=
 =?utf-8?B?TnlKSVhEa1pZTUVjOGx6ekNFQUcrVCtiK2lwc25WamNTVTNXSWxBRHpjbFhO?=
 =?utf-8?B?RXhoVXNJQ3ErRnNYN3YrSEUyVDNBdHN3eWJ2bjJ4NmJYZ1lnUkZSbnZZZnU1?=
 =?utf-8?B?MVFzNk9mUzdWbVZPait5c1JMSzNnVC9iYlN4TnBXZHEwTCtlVDZRNG9xTC9T?=
 =?utf-8?B?SzlZSjBEUTVxUnZPVExtTHRidFFUNzhuODN6eXJJTmlpWVlHWm1QTGh6ditx?=
 =?utf-8?B?VndtSVpldkhNcTlGS3RKcE1Cd05hbkZNSk8yZW5Od0kvMVVaMEdkZnQwTG1C?=
 =?utf-8?B?cnhHUjM3SThKYTRYcTBQei9wNHdlc1h2Z1VEVWRLQ1lTOHdpVlh4cFNPWHZV?=
 =?utf-8?B?T1grbjIzMDZJMG85YVdGb0twTTFiSkJnMGJ4czh0TW9LTGxXUDh1VEJCeXQw?=
 =?utf-8?B?SDZDQUQvM2kyR0p1clZqREZUSm4xd1owR1VtWk5mdVpkRVlqRGVoa1lYYmJz?=
 =?utf-8?B?ZlB4UGd1UTdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3h6LzdxOVpPVGhoRWdscGJjZjBEc1FFTG1FM0pzeWZIS3RqZWQvbzVtRWJn?=
 =?utf-8?B?WEZtMHQ5NzNzcDFlSDVPaVRSUmhRYzhQNUQ1emlFblpyYjJNbkdCdlhZRUFY?=
 =?utf-8?B?NXRnR3NrUnJwVDMrSVZFVGNOSGMxUFlqL1dqd3J4OEpWaHl6RU5CSnJ2YjR3?=
 =?utf-8?B?ZGZmd0hYNEpSTTFna3RMbm5ScGdDbXFEcCtlWTdxanFjRWcwcEhuRVBORnlN?=
 =?utf-8?B?U1hOSjlMT1U4eVlzdXhEcWxtU2FEbkQvdGMwT2poVUxSdWxhYWgzSzlXNll4?=
 =?utf-8?B?aTRySm8rYXRoOG9xbnRPU3BWMjNSbSsyb01EeTlQZEZWUmtpOERsMFlEeDdQ?=
 =?utf-8?B?QUM1MklWdDQvd2hoVTU0amVJS1cyZHovQW16QlBmeFgvNlgvTDkrbDlHaFVv?=
 =?utf-8?B?T2J3RTEyNHh5QkUwMFBzb2tobnlJbGtVR2xqWHBtYytXemM2WkFvZDBtRS8y?=
 =?utf-8?B?d05RSTZ6VGUvWlI4SUdOWHpjQjF0UmVmMEVVZk5EV2ZwWXltNFBFTVNDaGZY?=
 =?utf-8?B?OVJkbW1DaE1RbzBiOWlrWnRYMkJDaHQ3cDB4OFN6RUhkVXFObXhRaWZ6WEV0?=
 =?utf-8?B?T2w0VlQzdlprakZIU0lwcUNjay9hNmJDdG9HWVJUQkh6bHVORE5nQzdjMVJ2?=
 =?utf-8?B?N3V4eFNub1VsZ3NuT0lrZU0ySFFRWlk2Rm12S3M4cjR1ZmZiaWg0U212Znow?=
 =?utf-8?B?ZlZiNCt0K0hhUmZ4Z1M5eTU1WGF6K21lWG1CcEJ4NmFDN1dGb2NuWllsOUxx?=
 =?utf-8?B?bTBISXRraXJrempoczRCdDN0OHpkRHFjN1pEYjBiZjVKRW1JWk1qb1pteU15?=
 =?utf-8?B?OUlWYTlidlB1OStyMDJlazY3QnM2N005YXZjMkRCc2xGTDA4aXBEajhNaWxT?=
 =?utf-8?B?ekxzMjZGVWZFaHpOY0ZzMEdZbi94YjgzZlJDVE8rajRjWmJKaFJyNEJMT2RM?=
 =?utf-8?B?cnYzQXZYVVpmcklQNFdmc0EwUzR4V2JncXBwOGhpaWZYaFIvRkdDWmpHMkVa?=
 =?utf-8?B?a0NKL29FT3p3UFlhN3QvUzRzWWg4NDJhekMvbE85alQ2dWpNWUg4cTNqZy9X?=
 =?utf-8?B?K2U0cllsVHBjV1U2bDM2Wk5yUG9NSlY2TytHTUVyckhuZEJOcExvdXdVUHZJ?=
 =?utf-8?B?cDNDcFUzazdXQitFMGxhK3hkTUI5c251ZExqSUtlYmJBRE53MnRSc0p1NjVQ?=
 =?utf-8?B?b0pyaE00amg5bG5Jd3ZOYk53OHVZVlVwK3VGMmEvd3lJMEp4cTVhL1E1eCtG?=
 =?utf-8?B?djRqa3RJczdPVlNFSU9VY1pQNmk4WCtHcllVSlM1RmQ0UDl3cjNHcHczUWw4?=
 =?utf-8?B?SUFOUElIM3hjRTlkYnk4R2NqUmFEZmM4a25WRlpiNGhYZ0x5eTNwVW5jTXNm?=
 =?utf-8?B?dVhnZW1HZnRCSHRKb0tKNE1SSmZtajB1am1uTTFMNnRBbTFXZ01xdlIrdFZN?=
 =?utf-8?B?QzlYWFo2T1ZGbkpGUzFjZUV2Rk9ZSysyaGg0S3VCQjlaQnJYVkh2SlVYMWxJ?=
 =?utf-8?B?T1JObXV4U1EzWHYwSmNmR0tFNFlYTmcwK1N0VGlaVkMxMTdicVh4UGJDU0Ux?=
 =?utf-8?B?M0xEUFQ3QUI4KzlPVUVmSXc2ZjVJc1JJczh4emI2VXMxOU5HU3BLS0g0M210?=
 =?utf-8?B?bnd1Q1EyaHp6TWZWZGpGaHk0bnNpNWRTS3NhbzFZMEFqMjVnc0swYTFWcERH?=
 =?utf-8?B?eXMvY2lhcmNnMzVWMHVRUnphRDNkck91QkV5a3c0UnJHblBOMHVnK0tWdGFU?=
 =?utf-8?B?UUlKenBxeU1GTXduam5uWEI0Ry96TkdoUWRGbkE4SXI1eVBkaWFMSnMzSXBE?=
 =?utf-8?B?bU5jNUtWdkZTY3pySXBxMHM3bzhwS2VQV1V3ZE05Y1JmeEFwdXMwWEovOExD?=
 =?utf-8?B?WGlPQ0hPNW9pZVFzSWpnZ1V1Q1VwYlFjRVdZYzdaV2pRWGU5amdIMnNPVUl5?=
 =?utf-8?B?eVkwMExHNEZ1TXdJSmk1NGU3SUZldWphcHZJclVLc3JSWGtINzNZMklaY1FX?=
 =?utf-8?B?dTkrOGsxMGh5Rk1KdTI3R29Kd29WeHF1S1NJdHJ5VElydnNVNE9qMHRPRzh3?=
 =?utf-8?B?dTM4WVdhUnBFUTNnVkJ3dDhIcUJWN2Rnd1lFN2pXbTFvYUNtZFYvelRsTXBq?=
 =?utf-8?Q?GnOl//qiFPTsR97pwMU1qLoCh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8bddb5-4586-4632-49e5-08dd99002bdc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:13:37.4338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zow7R1BVSqQbML1Q7j0SGz6MkbaOdE4UEKWjERtlcgqXCkIN1SQ9ikSaNNpAaoV0t9Q42yq7lxQ+EzPCb4HWLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7033

From: Peng Fan <peng.fan@nxp.com>

This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.

Fixes: 2993d2dd8ff4 ("gpio: timberdale: Make irq_chip immutable")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c75fc8fc7bb23088a4f15d61d4b40172a41ae078..44f922e10db2f8dcbdacf79ccd27b0fd9cd93564 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1557,6 +1557,7 @@ config GPIO_TC3589X
 config GPIO_TIMBERDALE
 	bool "Support for timberdale GPIO IP"
 	depends on MFD_TIMBERDALE
+	select GPIOLIB_IRQCHIP
 	help
 	Add support for the GPIO IP in the timberdale FPGA.
 

-- 
2.37.1


