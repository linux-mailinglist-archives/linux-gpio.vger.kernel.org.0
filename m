Return-Path: <linux-gpio+bounces-19813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF57AB095F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 06:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFA621C0069E
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 04:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90774264F83;
	Fri,  9 May 2025 04:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fZsfM5bF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2053.outbound.protection.outlook.com [40.107.241.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF7F26656C;
	Fri,  9 May 2025 04:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766048; cv=fail; b=l/lWIdEqnNW+8jc+WbxuKfZsdeXomDBcJbhVFi35IpmkBlJqgJfDZOFc/29GoVuQO0Q2tvFdsRXdq6KN+3TEp/UFDl+3XrsmGlNp4SECu7o4/eas5h6RvaXGwT7KYZPCcljoh9aMsGjiAEj8bIS5OJJqpNVE3tmHrSZQz4/mZLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766048; c=relaxed/simple;
	bh=zCjpmGpwsl5urpEsD4+NIon5SpzEHQ7Mwq4S2hRKctA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ng3+le8UB/747tfCKTF7+M5hfDgpFqMdYfzzxwaLjnklitlXbMhv8NySGPbXT02iME+EZ7zIOAdLFirzvp+DDACBrhydlvfqok72bFOzKK8ZbUISe9RbK5T0exkC+SphlbdsEDvqfwcz4KwyoNP5C7y216yKERAEEnYA71e242Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fZsfM5bF; arc=fail smtp.client-ip=40.107.241.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYIW7fX7nr65EXWHk7PFUoPTbCDsNdQUX8RFLEVG6aGBpAu25fOar3qfW0v2mQNGXakGol40OrRBhZ2KQv+whaTd59Pe8cUX9ZVJUu/5NapMdAL9V6y18IMmYi+FSGuMdayPuODrSbHcCB1wZZcVLYjkNBdTM/1B8Ib5pWkF6XNnE85wAG6D6Xd4n2Ngfj5iUtPZHMUQwYSbqHVvgOrKBaJHMkxiS6V2Z4/C0k5j1jOXf4qwD4KtZlnTcZrqka/JN0uEuUMP+mwAW6v3zMCpFWauFiR8VH6Yb3LyMPrIZhEIvyuncYpKhpV/IC+M2IMO0hJHSxlMSMMUXGWEHvzC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znsv2EWPYSYRTdG5abL+KjY1AUXxSBJV8UpqzARVx9A=;
 b=QtoJEuOlL0j20nYqN8x/KUCKZ5yvS9I79snY1rS01JH/X08AreY7/F3KRIrkuBmU5Y/r2kVnyk/kAT3WD7YK2Y4eJ7SP3yh3u86zH5v2A1StjuToI8o/a4cMWrzs6uoNUNs/Eson35f/z9tqTZ8Rr8q7TyU1lIu88qehJp5u7KukI4D79zdgQdnmXLmnKijHStoMcV8Khu6MhDJ5i5PjrBVvy5ECiuahhTqj/XuXjW5WCS9np/6drEA0zTUwLhV42ZrdaEAb23OBedrAiUo0mf515ILIwpzqaKFMhzSw8qGkf6fdk/TIq2S+/PJeB/l1UTeZqD+jh3U533Ip+DUaWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znsv2EWPYSYRTdG5abL+KjY1AUXxSBJV8UpqzARVx9A=;
 b=fZsfM5bFBCuigIM1nAAej6oWDi3SV5gs7wnM+0o3/Km44E6g2u0gFmEc67jtuvwqinijV7Ox7mbkxdfBkoNFt8MpncwfLv3A88xqVYHxKzXpg+BwoB5VUqS9gSdpjFRHHtXBHxkLatvRBGuE4zgFri6kfh/43+MFznzkRO6OBNZYSRZPY5b+4PNyvdwODa8ngjrvJiwlj0h1+Et+Ls170DMzVghKrPv7z1JgfA1d3lI20DUo6uvfxFe5GLOjXrJxUegQ2W+UvDe7BNTih0duQDvBix8ZPa1lHwDr9SvZWDKFgBDh54AldZlTUXNV25X18Zks0UC+KpVzmuJvKOR6Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 04:47:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 04:47:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 May 2025 12:45:36 +0800
Subject: [PATCH RFC 5/9] gpio: davinci: Update irq chip data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-gpio-v1-5-639377c98288@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746765944; l=2614;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=2oQPUFLyyrBRXdZ7hQ/Q64Wp/MYfqdQZm0Xlq6uIOPs=;
 b=f9wkoLQHOPG7XWNCsb76DyabPWz+1yJd6MToDWGkpb0R71ZCd+yKe4b4flEoimQ9jzhajfvaB
 LzopEQGR2fPAU7SCW6i8f9h/hEI31NWkjHIBj7kbhQN4VAbU+Qycr5Q
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
X-MS-Office365-Filtering-Correlation-Id: 6a804f10-adfb-4322-59dc-08dd8eb496b2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlpzSyt4ZTdWYVNoODVpWDhEaWhXNEh0dStZQURJZ2VDaThiRTVudUxGa1l5?=
 =?utf-8?B?MzV3RTE0NzlCbnU1VG9zcUpRajM2aHFlZFdOckpYREpzMnJmanpaSTFWUlJy?=
 =?utf-8?B?cGdDeC9YZ0hsalA5QXA3emVYbzkzWG5LTkRxLytCb0FYbWlYU1FHZXVzSnRv?=
 =?utf-8?B?S2ZCcEU1Vk1tRHVrSmxxUkZrK2wxb01VRWRtSDNmcjlFcTZqNHgzcTU0QXE5?=
 =?utf-8?B?VkxkZ0djczBLTWhUVXZBSk9UZEp1ZkJFaWhzOGwxK2tzMWR4dng2ZmlsWVhY?=
 =?utf-8?B?T2U5L2hTZVJDK01ubGhnVHRrbXRVRDl1QjlrNytLaVZBemQ0ZnFweTJjclYv?=
 =?utf-8?B?eXYrN0tpc09wYm5vK001L0xkOXAwS1kveFUyeWJBT1dGcWRESFY2dldBdWQ4?=
 =?utf-8?B?QTZTMnl6c1IrL3gxd3JCL2U4dFVmUDIycEJyZm1nUmRaRHZzVEhlbjh4Uzg5?=
 =?utf-8?B?VEtRSTE5Tzk5WXNDQ240UDgvU1k2aWRCZXF0MUd1amFCbU5wM0w3TE5aY1VN?=
 =?utf-8?B?U2p4NlhyTnBGWXNheDhPVHJGYyt0TE5sNWh2clJwUE9iam85MWRsLy83S1Fj?=
 =?utf-8?B?dWg0R29kdEk3MG80MGVHSHBrT2FQT3NCQmRIRkVyWTB3cHdmYXFWNWNDLzMw?=
 =?utf-8?B?T0tHTk9qdk1DbGE5ZGVTS0FBMXFGMFA0ZVdJZ3ZJN2FYTnM2aWdCTGFvSERX?=
 =?utf-8?B?cXEwQmFMRHVWRzBJVFFkUWt2dFd2b0NNUEtwVTRCMnYvZ1ExTFB3Qk9xTmZX?=
 =?utf-8?B?V2IxN3VPWHo3VmRPS3Zmbmd0cndXS1ptYUJVZWNPYlFTUVR3bGk0c0ZLNHJW?=
 =?utf-8?B?NEhNQkY2cFV0RTQxWjNlbTU4alhRK3BnWXRsdzJmbjc4SU56RGttcmxqaEtt?=
 =?utf-8?B?dWZ3aUFzS0pTQlZXcEZtKzN6WXNMMTFNbGJSSCttL01TSWtLNXZMWU5HQita?=
 =?utf-8?B?bnBEU0UrOHFwN2cySFV0SVl1MEZ3bUoxQkN0TDVUUGluYjFCSVNoUjhhcVgw?=
 =?utf-8?B?QzdmNWF2aGw3ZHVTYjJuekhhQlZSQVh1R0xVRTBHMkp3Rmc5bzd0OFpyTThu?=
 =?utf-8?B?QmdiODJjOGtuMFp5eGtIY1Fob0hlZUR2SkVEQmozZWJVeFB2aWhVMEFmS3FM?=
 =?utf-8?B?RlEyQzF2TTZXWmt0b01BQzUvQitiUVRvWHFsYkRZYXRRWFFYU1p5Mk52MHl6?=
 =?utf-8?B?c3VMdDhVS3dqQnhmbTV4M3FXUGlLZHFXdTlXL1pKbEMrRFVrMFNORWt2cFNt?=
 =?utf-8?B?Mk9CcnRhcUNyaUhzTXF3b2RXRzRpcnB5VGhRdUtERFVKRTlHSjJOdDRFeVVr?=
 =?utf-8?B?UXZDR2ZMRm5EaWMySGZjM0FBaGJCdno2WkZMV3YraTkyTTRVMGVaQkJyb3hu?=
 =?utf-8?B?NG45UEI1WEt2TDA3R0F1ZDRrZEQwQzhiZkd6SHN2NmJGMm9VcDgwbnJKc3hi?=
 =?utf-8?B?REFZWFVFck9kZ2xRMW1wdmwxbllBMnd5T0dmbHoyOWI1ZGd1bVhLaENSMWpK?=
 =?utf-8?B?Q3gxdTJjVjB6azZDelJTN3ZaN1dsL3ducnJDYW1yc2FCNnM2WncrREl0QWQ0?=
 =?utf-8?B?UDdoejZZYlgzcUh0WGZOWk42YlhudTJwRHQ5VDl4YUc2dVd4RXM4cjVERTZu?=
 =?utf-8?B?YXVlNHlMQUY5ZVlvWFVlcEE4NDhPRmpmUDdZakxUek5kYnIvYm96QWVZRU4x?=
 =?utf-8?B?NzdpK1hwVDdRTUdGbE5pWWh1NTRSaFBnQ1FmVzVWWmNWcDVtRWZnR1hwWXF2?=
 =?utf-8?B?MzAzU3NoK2xoaW1WVnIrZitTZG0vR3Z3a3UzSVdyaGI3NXNVNmljMElwbzlF?=
 =?utf-8?B?MlJZQ3hhanVjeHVrY0ZEWk10SGJmU3Q5Und5N2FhK1ZhRzd4ZU55b25HMlZL?=
 =?utf-8?B?Y2tlWDZkVGc4TXZyQ3RUMWg1VFdBaTdvTmp6bFdDNUtBWUJBSmRFNEsvNGty?=
 =?utf-8?B?Nmt6d3JQNzlPYlBDQnRkRkphcnp3TzJNelZXZGJoR1ZFU0tSOXhqVVpyZW9Z?=
 =?utf-8?B?Z0dHYWZjS0w4cGhVcXoybjB5cW53M0t5N1BDRmlONlB4bXlPTXl5U2VmYXJn?=
 =?utf-8?Q?IOSZUa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWUvcy81cWExQnk5Y0lQQWQzcjdKRWl1NTNaN0FOM3NJSUdmN3ZLZVQ3WXdV?=
 =?utf-8?B?bHV3L1hibm1oR2JWNm5Gdjd5QXphZll4NXFMSEJpSHpUZEJsaytqSEwybXpq?=
 =?utf-8?B?UzVLMXJwNzkrYmoyRnR1VUNwZFVtdC8xTSsramkweDdYZzY3d3FLeEVyNmFP?=
 =?utf-8?B?WjcxdVVUMVMwbFVDM01VSmlMTUxLWEY0QzJGMnFkWGJheWRzUXFRcEY3WjFh?=
 =?utf-8?B?SUUrSlA1NUd4cGU3WHZkZENzWUV3Y1dFeS9CSE9aZGh4R2lISVo5eXJDOXZC?=
 =?utf-8?B?Z25MemJTTDREMUdGWURKMkN4RVZIeTlzZXpWQVJabkpkZGVXVXZ0Z1FHczJO?=
 =?utf-8?B?QzkrYzljS2hpQWxwenZ0Vm1XemlZbVVma0p5bjE2ZThyYmlzc2lFV1hJVXdK?=
 =?utf-8?B?dzQyMExzTFFyVkxRSkwxNm5DNitnZW1qSjdPbG80bEU0MEN1ZG9vdXdqeWRx?=
 =?utf-8?B?dVptL2NlWmJhNnd4TkFYck9YQkg5TUxLT3FtS1BwZUJVcjZvQnZodG9hQTk3?=
 =?utf-8?B?NCtQVTIrckN4U1oxcGx6NFRwNmg5anFUTklFR0xZaEtiV0xXb3NtdzJETFdk?=
 =?utf-8?B?dkVLTDJQTElqdmJCSndBN3p5b0hOZ1l1dTlWUExCeXIwRis4TklwRUI0c2sv?=
 =?utf-8?B?NmhJTyt0NFkxRFZrZ0I2MUc0OEMrYi95VXlTRXA3eDZTRzVKVHFaTU5iSGo2?=
 =?utf-8?B?ODlOMlhtc3pVVCtvdWNtSGNCQTdZdXduUldoMmNCZWFyOGpmZ25ocEw0dmxI?=
 =?utf-8?B?T3lzYS8zUTUxTVV2YjgwUlpveEJ1Y0xUVDcvR1FOZUNUQ0I3QTBTTWRpTjJB?=
 =?utf-8?B?Ymp0UysyRWFrbVN2T0dRdWhkOVg3UjcvT1p0aW9tbXdmWFduUHZ3NENacmRU?=
 =?utf-8?B?ejk1bkhLbDgvcHZISlMyTW45bDJMQTZQUC9Rc1JwKythcWNJZExMeC9xeXE4?=
 =?utf-8?B?NERKbGVsOVBaQWFRam5tV1QyNnpyMk5icCtXQlViRXdRSEJ3MWZDdk1HQkwz?=
 =?utf-8?B?TitObHRiTm9TWEpYMEttQXVnQnU3bHB4ZW4yYmJVVmJXa3oySTJucGdyaEdm?=
 =?utf-8?B?TU9FZXdMak5hY3BSMXJuWHpwZlJOK1BJaGJlb0E4ZUlxWjFYcG45THk2cWF3?=
 =?utf-8?B?eFQwOG8vNS83YVIwZVFBUXd6MTdBd0R2aUJGTkllZ0VDUXFIL05NN21tQVRy?=
 =?utf-8?B?eDM3TXQ5VytGTENRK25GcTJSdlNlM1djNzBWREc2YkQxcks3dTgvTlNJSkU5?=
 =?utf-8?B?ZWFzd0dRYURnNThvOG81cFUzRGtkajc0QkZwRkdmMkw3RkNiaFNDd0p3T3JM?=
 =?utf-8?B?UVBvYjFuR1EyMVNvR05RRmRwTlYwWXVjQnZ6QWNtS2RBOEE2cjFVbVZJbkN2?=
 =?utf-8?B?ZUxVbnlQUmNmV3ZnVnQrbXNPOVNneFlvOXFSZzMwWWtqTFZWS0NpZzFwWUYx?=
 =?utf-8?B?YVIya29kQjUrRnlRSEFreUdCTk1VdXFvbk5oeG52elA3MVRpbFVYaE1iVG1M?=
 =?utf-8?B?VkRGZExEeU9mQlpUaUJjdUdKNnhKeVVZTmcvVnJuTmtVSmRTYk1MK1hxRzU1?=
 =?utf-8?B?T3ZjVkxvSm0xYWNxQjRNSDlkMWNNUm9qRmZsd1FEQjRVK1crU1Y5T29IVGxm?=
 =?utf-8?B?MTZlQXBQanN6UjM5YzRaSGxBTi81ajNBZDFCMy9XaHJtRzhESUJlc05UMHFT?=
 =?utf-8?B?UXZQUDMrRjNlTWVFNDUxYmwxRG1PcEJYckNVV1R5bXVxQ1crcWpqazJ1WEh1?=
 =?utf-8?B?REdPbTYvVGlMc1hLTTgvMzRFY1lMYmtQbUtlNUNpdi9JTVRmNUJmdDVKOUsv?=
 =?utf-8?B?Rzd2YkhCeUNBR29xWlJhNzNaTm4rNDhQWmV4cFVic2tDMVI2U3hKb09yWGNt?=
 =?utf-8?B?WVd0Wm9lcU1TQTk3Ukl2aDRzWFB1RTBTRGVQakZRNEZ3UEk2MzRPMm5CdEdI?=
 =?utf-8?B?ZFhlbUM2ZG5DTjBGNHA2K0Z6NWMyNlZrcnR4YjI5SERpVk40b0NOTEdrZFlw?=
 =?utf-8?B?N1YrZDQ3ZkpRUHZRWExmY2p3clErNkVWaCt0c21zOEROWFlkUk5sWklwQ3Y4?=
 =?utf-8?B?NGl0Y2I1QkZOYlVscHdrSzBVMkZHTkltbWpCOU9qQkZIc2d6bjNIMWN3cEo2?=
 =?utf-8?Q?P/z9gI9NBTAE2zw81uA6Tvi02?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a804f10-adfb-4322-59dc-08dd8eb496b2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:47:23.1216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qo4TluE5v6A0k/op4leDLZ1fNjaMjeknzWM0krVYBGSsfuVsEvUWaWIppfhjZLY2nrRBu0GcsZ/QDio6WPCceQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

From: Peng Fan <peng.fan@nxp.com>

Use "struct davinci_gpio_controller *chips" as irq chip data to prepare
for immutable irq chip, then it will be easy to get gpio_chip pointer in
irq mask/unmask.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-davinci.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 3c3b3ed46d9b480eb7916fa2402e5bbcc06cd563..4494acc14630bcc7cb75dc475b5ae7e0a595cc5c 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -68,15 +68,6 @@ static inline u32 __gpio_mask(unsigned gpio)
 	return 1 << (gpio % 32);
 }
 
-static inline struct davinci_gpio_regs __iomem *irq2regs(struct irq_data *d)
-{
-	struct davinci_gpio_regs __iomem *g;
-
-	g = (__force struct davinci_gpio_regs __iomem *)irq_data_get_irq_chip_data(d);
-
-	return g;
-}
-
 static int davinci_gpio_irq_setup(struct platform_device *pdev);
 
 /*--------------------------------------------------------------------------*/
@@ -255,7 +246,9 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 
 static void gpio_irq_mask(struct irq_data *d)
 {
-	struct davinci_gpio_regs __iomem *g = irq2regs(d);
+	struct davinci_gpio_controller *chips = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct davinci_gpio_regs __iomem *g = chips->regs[hwirq / 32];
 	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
 
 	writel_relaxed(mask, &g->clr_falling);
@@ -264,7 +257,9 @@ static void gpio_irq_mask(struct irq_data *d)
 
 static void gpio_irq_unmask(struct irq_data *d)
 {
-	struct davinci_gpio_regs __iomem *g = irq2regs(d);
+	struct davinci_gpio_controller *chips = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct davinci_gpio_regs __iomem *g = chips->regs[hwirq / 32];
 	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
 	unsigned status = irqd_get_trigger_type(d);
 
@@ -399,12 +394,11 @@ davinci_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 {
 	struct davinci_gpio_controller *chips =
 				(struct davinci_gpio_controller *)d->host_data;
-	struct davinci_gpio_regs __iomem *g = chips->regs[hw / 32];
 
 	irq_set_chip_and_handler_name(irq, &gpio_irqchip, handle_simple_irq,
 				"davinci_gpio");
 	irq_set_irq_type(irq, IRQ_TYPE_NONE);
-	irq_set_chip_data(irq, (__force void *)g);
+	irq_set_chip_data(irq, (__force void *)chips);
 	irq_set_handler_data(irq, (void *)(uintptr_t)__gpio_mask(hw));
 
 	return 0;

-- 
2.37.1


