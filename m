Return-Path: <linux-gpio+bounces-16811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F6A499B9
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B1E37AABDC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 12:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEB42620C8;
	Fri, 28 Feb 2025 12:46:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2090.outbound.protection.outlook.com [40.107.21.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829C31A3BD7
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746780; cv=fail; b=CP8u9Dn+/NDjEnLOo0R/hvzzbXOqyyYozyvKDst2r54zypSEPUNmZs//PJDDvbIa+yIxYWUacjNH9DLY/AoHSL2MgN05yTS99R5RwK8QisM9dNvNnqCV5BbZnKfci8dRzqM8OQYY5RCSLT4P9RcXXsi/NvoFlMq3/OddGw81LUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746780; c=relaxed/simple;
	bh=GXcGg1ck/WZO1mmM2VsLadoB9ST4eFcAv+0U2PxMhRY=;
	h=Message-ID:Date:Cc:From:Subject:Content-Type:MIME-Version; b=kHInPaN6FRDcRxm8Rmbw6VNo0FrcSWCaPSFydwsyH+cusZOH/bOsC9HRBQ9n5agPsbX7NALpYa+XlkZhO7PNZeDHUP9sbGefbttqhCfI7DMk+HI9EdU0Dguql7hpCnvryGBK6uu9bN5OX6H8N4lVzfaU5oSSUnwfAIibwRJiUD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberdanube.com; spf=pass smtp.mailfrom=cyberdanube.com; arc=fail smtp.client-ip=40.107.21.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberdanube.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberdanube.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L09vj/tGKA4+vsVMtsfhypKt4K3X7lL/I5psLMwpKPN7I/4bhjv14rf7T3WyKYx+5/8T46985dYEFSF9BzLjETHZhKJslqev/W9ShV1WZXAg0/KlGbNyGdY1hc32dzOFJvHkpdXgVPXc7L+zoLYZOR1DIZXfnXOtpk6wkLEk515AGfI/oRBaydFjfNBhIYn6837rAuGfDWKPPIIRve1Ss79sMoJv2bFXXRMOxhqFg9mcZsSGke39cLqhrhBl8v/6OYeeXKzvNvghdTzK62aoazhc4umHRsnIK8MSiWFqUYRZnmfcdaYqgbAqurgdViHirezSSwHHt9PhWcp4P8JUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne7GwxC9sb/YvUD6FNa01hiszVyEMoykZdkN31EuC20=;
 b=IqOzNR9h+PL/NwPfsbzjUoJn7OGmqdR8uRDj2VuRsCz01/14zlip396CSCIRqjSHlGJc9z6P2rY3IWttbWA3G7eo0VNqiZIfdx0FQjaZ6CgEaMFxa5v1t9foDJs9LlDfI2GG6n0MnP0hOLSJD4cOW9mVtlVEN7Kg9581Mxqjvhr6QmydeKPozNOvsNLAV/+CuGYjYDrcsYuGRXLj+na2EF+3aYapSZgnTZbHkrGeuObKUi7pqFp8KKiVoxuBWgBvL/pIEX4oUCYjHtx/o3kRA/i/Yh+ggDc4HBeIQwbzh2amQ+VlXQPspb6smDbX9AoBi1sKKFFu0KZTz5CDA2G0hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cyberdanube.com; dmarc=pass action=none
 header.from=cyberdanube.com; dkim=pass header.d=cyberdanube.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cyberdanube.com;
Received: from DU0P190MB1708.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:344::19)
 by GVXP190MB2096.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Fri, 28 Feb
 2025 12:46:09 +0000
Received: from DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
 ([fe80::bfb7:7fc0:d495:3413]) by DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
 ([fe80::bfb7:7fc0:d495:3413%6]) with mapi id 15.20.8466.027; Fri, 28 Feb 2025
 12:46:09 +0000
Message-ID: <4af4f6c5-d7da-4735-9ef5-ee3c34f7eae6@cyberdanube.com>
Date: Fri, 28 Feb 2025 13:46:08 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: brgl@bgdev.pl, linux-gpio@vger.kernel.org, s.dietz@cyberdanube.com,
 linus.walleij@linaro.org
From: Sebastian Dietz <s.dietz@cyberdanube.com>
Subject: [PATCH] gpio: sim: added configfs option for static base
Autocrypt: addr=s.dietz@cyberdanube.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0046.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::35) To DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:344::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P190MB1708:EE_|GVXP190MB2096:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a02388a-dd32-454f-dda5-08dd57f5e022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEpFajZYSmdGMStzbzNEVm9RKzc4NUlVR0JWb0U4NWhXMlV2Q0Mxb29Xd0FD?=
 =?utf-8?B?Um5WSDhPRkZiWkM4YjA3M2NTQTQwR1ZLOTIzc280eVh1dzVjMFc1bjdhckZ2?=
 =?utf-8?B?aHcvQ3ZBS05jcE9RUnJOS3BhRXFjSEFnbkJicERLWVQ1bG1Rb21HYnlrNGl3?=
 =?utf-8?B?QjRESVdXZFhoa2I5Z1NFV0d5MStWVEdLb2ZRMXkrOTFEL0RRWW9uV2RiVXoz?=
 =?utf-8?B?aHJzam5UWlAzWVV6a3RuVncxVTd2aGdwWUZNeDIxMkpGcTJ4MWl2a0V4c1p6?=
 =?utf-8?B?NWtjUmFJbFFPQ1pkbm1jSGpWY0RIT0hTczNpSDcxN1pURTUxNmt3MnNEeWNO?=
 =?utf-8?B?eWpCN1RpSWcwQXJWdktKNy92S0VTOXFZTlplbm5mWUNnR3lCcE93SVdKOFNR?=
 =?utf-8?B?b3RpNHBGRzhaSU9oTWtZQmtMQ2E5dlkvTEg4VkhtTzc3UzF4RHI3emc5UGRv?=
 =?utf-8?B?aU1aS2JtMHE3VjV3Ynk2MWpqTUoxTklRQmlmL2FuM2Q4a2Z3cW9YMmtpblpU?=
 =?utf-8?B?dG9Jbk55WTRzQ2NWSmEvZlVadURWV1NIYnBMaysxbk94RHBUTHppYWdzNkR5?=
 =?utf-8?B?WHl5VkxtNDhMcGJPK3FmVGorcFpFMnNRKzJ1V24wLzNKQjBTTVdoUDgyMzRD?=
 =?utf-8?B?ZVJ3SFZmK1JMU2E2ZmxKUmFYbzQ5QUZ6d09Hckk0UFp2UjZQK1dTTUVkSUI0?=
 =?utf-8?B?ajlsQVZZalZHV1QxWGd3K2p6TFRSekRzalh1RkxrYTdMUWVxbUFvdWJXZWky?=
 =?utf-8?B?OUFLMmhlOVllZzkyTkdKUUhHWVNMcXNVMXNieW1wSTNpaDBSRXUxdEVESEE1?=
 =?utf-8?B?T1NOSVd0WDVvRG1QbVRmUFA4VU1aQU5zN0Z4a1J3ODhTb3RaMFl3MWxwT3Rs?=
 =?utf-8?B?cUszZ0dQVjB1aGFUaitBZ3hsZVUxKytuczR3NU4rNGwrQnEzMXE1NnQwM1Jv?=
 =?utf-8?B?MHdjQ1VGT2lHdnNzUTUvOW03TWQyREJmOXRvL0JsVGg3Mk5pTE5ITUZPUlJz?=
 =?utf-8?B?cFVvcmhyc2poQzJ6TnVTZS82MjhEcXdoWkFmM1RIdWFMSWw2M3lxS3RIdSsz?=
 =?utf-8?B?REg1U3FJeHFobnVuL1V2Q1BmNW5OOUhHcFc1K2EvK1hEYlZVUUxuUXlJU2NH?=
 =?utf-8?B?Y2xsMTEzMTdXOUlOUmhmTjNWaksvcWZ6L2tNczBDS3dnbGRyWEl0czNVdytW?=
 =?utf-8?B?OUhhQS9NYlhPNXltcGc2VUozSEtEOUt3QU9yS2Jid01Qd0NkTWc0T25tVDBQ?=
 =?utf-8?B?RmxLU0xFblUrK1lMYmh6SllTZnhhd3N2SE5mUCt5WnkvcFNyNWxYT2ZrZk5K?=
 =?utf-8?B?ZldxVzhhU0VobzdPUVFMQVhwOVBscFFzWEd2YUV6aHI2ODYrUkkvN29mdXZF?=
 =?utf-8?B?SFRMaTdBN3Z3ZVJ0b3BCN09CeFVMMzc1cit6dEhPTHk5U3JGRGhlODRYdTRU?=
 =?utf-8?B?dm1tR0EzdjJCeElLWGVlRVpuUVF0LzNEeEhPaE9xK3VkZldNRWxXbEpKcSsz?=
 =?utf-8?B?WGNYZFhYSUdlYzR5L3lhRDRheUVOako2S051QzN2V1lvbytCWkRaRjdyUG5L?=
 =?utf-8?B?bUZ5am5wbUZDZEVwTksvNmhudXpjKzZ6L3p0andlWFJmMEYraGdrYUlnRHVY?=
 =?utf-8?B?WDhPd3kxeGxzMHZmVEZnL2tDUUhJdXBRSXR6R1NzK2s2ZXJNelFSWDFVOWVs?=
 =?utf-8?B?am9xcjdUV1AyNjM2OU05YU8xUmZGeWozSUZ1SDdtcCtBdXlnUUIvejlYdnlJ?=
 =?utf-8?B?MVBJanY1bHdvTU5Ec0pyMEI0YzRZWmVRbVhxazNkWFRzQnJUOUhNQXMyWHYr?=
 =?utf-8?B?U0h2QXhRQU9DSm1Yenl1TE85STByK25DbDRRMThLTnVQWGFybWlHTml1WE8w?=
 =?utf-8?Q?NO0Vsjt/3vxj7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P190MB1708.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGlvQ0U0MlExK25qb01MZmlabjFLa2pxL2E3dE5DT20yQXROQWlaSHdMUVlL?=
 =?utf-8?B?OGJwV0prRFM0M0RsNTRJMEpCaGU0QU5BbHZkZS9SMzFEVkxSQkVrNWlDMFBZ?=
 =?utf-8?B?MzFpaS9ySXhzMkJzSUprbmplZmloMjRJMGVUaTl0ajZPSU11VkFQTFlBSmVP?=
 =?utf-8?B?NzNSQ2M4SDhtSVhzNFAwRlVEa0Q4NUJNbWNic3FQNmdEUTBVMUt1NUVWYXo3?=
 =?utf-8?B?QXJ1b0lNL0pzMm13L01wQnJLeHRnSzNwa2tPS3kwcGlvZjRDanpkOGdqWlJC?=
 =?utf-8?B?cGVmMU84MFJ1Y1JyaEFPaU9QTk1iZzladjVNVGJrS04zZDVSZjBLYS9YSVM1?=
 =?utf-8?B?bHkwNGpNNFg0T0pDYk81aC9kbkdyUjJyVkxwcTlYODh0bW9TV09ydk1jc0d0?=
 =?utf-8?B?N2Zydm5wM3lBU0RyLzlPMHFGUVFuUTlLcmh4WUVkdndFM25aV0QwUVlzS1VH?=
 =?utf-8?B?emEwRHVyUUh4ZE05eFU3VGJ0SVQ2UEFMTHlJSy9qc3B1Q2RjaDQrQ3E0MGsy?=
 =?utf-8?B?eFNZTDRUWVFQalhkUFZGZDJBcUx0WHVJMXBPS0xyalJpVEhzTVp6dmQrRFo1?=
 =?utf-8?B?MWJ6R253eTlEL0FrOFk5NC91UU5SNnhUUDh4akxPQVNoK1ZUSklReHNYbElL?=
 =?utf-8?B?djM1amFxelIwK250NG8ySFE4Q0hXKzF1RWtZTDBGRmZab2pmRVJ1Vk1tUGpi?=
 =?utf-8?B?NnBDNGNpL0tLT2RjMkZJMDZRNDlnWnFvVlF0OFFJQlFiaG9mcHVlYW9aOFM3?=
 =?utf-8?B?NlhmQzhjbXJuQUxFYWo2TUdKLzZlN0lMQUEzMFd2SG9WNHE5YUsrKzBhdkFl?=
 =?utf-8?B?RldsRFJSN2VkSE5odmZ6bWVqaTQxWElnZHlRaGlKaVltNTV5VXRBMGJwdEpN?=
 =?utf-8?B?VU0zTXZnaHBIZTRIU282V0Vla1hjcU5XdzdzdWJpRVJ5TjV4SDdvSy9hcVZX?=
 =?utf-8?B?eDZQbDFNOEZhRURnZHNRM1FIcFg5V3RMOUtvTmFDcm1nOXd4QTdoY21HR1l5?=
 =?utf-8?B?YWhNZHIxaTFNaVNrSExBT2w0VDdsSXN3elEyaW1CKzA3dXJYbEZIbmtsa2cz?=
 =?utf-8?B?aHlOVlQvWUdiYkFVZ0FCRnpSNG1LaWd0c25rT0VIMTF0ZEx2WGNVWkJZYVZV?=
 =?utf-8?B?dEtjTFZLVUhhNnV6d0hWVnJQY1FTQUFIN3dtdVFPc1RlbmtsbGNueXhvR1hD?=
 =?utf-8?B?ekp4QVdLYU9qYW94bkV5UUZoeUhoSkhzRm5nRUxFTHpWNnVXaHdoVHh0Y0JJ?=
 =?utf-8?B?ZnRxeFFWaXlsTXZLdDQxKy9OWWp3R3h4RmdCdk54bS8rUnpxQUFpVmR5OXhK?=
 =?utf-8?B?QjUzZHhZTVEwOTBTZm8xbmlaOUU0ZEhFS2FQa0xZdnB0M1dFWkd5NWJBcmpk?=
 =?utf-8?B?ZzRYY0prZng4UCtCelF0Sm5YT0FWMGNtdHNVNHo0aDhlZGswbVNoeTRIYXBo?=
 =?utf-8?B?ZDUxYi9JSUltai9sTGpZbDYwUjB1Wmx1dWVubUo4a3RUUFpKV2I0enpHdEd1?=
 =?utf-8?B?eTBYMzhlNEVSOG9pK0hPdGcxSzhTYzNkVExaemZZRWhvbFMyM2FYeGlBc1A3?=
 =?utf-8?B?YnRqL0JtWU1lVUt2NFcxS1VsNENVcGZqa3ByU2pnRldabTE1dkJHK0NjTFpT?=
 =?utf-8?B?TGR6TlEvV3BzejJXbjBPVm01WTZzT0h0SkhJbDNaMitab0F1Uk05d0R6Zk9o?=
 =?utf-8?B?VTBvQThtRlpsd2xnaFJKalh6VUVJelM5K2QwNk1jMkdZRFRpWEFHQjdDU3dF?=
 =?utf-8?B?TlZ2WlpvM2I0ckJiWk1ST0dTQVM3SkRYdTlXUW9EdlRiNVJVaUZZelB1cjNU?=
 =?utf-8?B?VEd5Um5lMVhWQjdMY2ZZWWhBTG9EcDdWY0NYSFI4aGxWc1E0blZvaGpPNVJC?=
 =?utf-8?B?b3NMZzY2YzVTbWFXSXhJQWpvWW05M0FaNmZlOVdiYmhLQ0FPWjY4ZEJ5QXhQ?=
 =?utf-8?B?RWVkbFdXWGZleFBGcVpaTkdtNmZhQkRhbnhxMlEzb1VjaXhjUmNwc2R0ckFU?=
 =?utf-8?B?cHc5N2RBMUpoSjdYMkUxQnZsYlkvb3JuZVNTby9EVCs5c09PQ0RNbFlhMUg3?=
 =?utf-8?B?TjZLQmpYWk1DRStnRFNSOVBRVHlENVNabHJJMUxhRS95b3ByeDBwWE5GUFp4?=
 =?utf-8?B?c1hKTk54WGNnenlZMEc5OFRQQW55M3VJYkovTVAzNE5vZHJLanhMaVNqR2lr?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: cyberdanube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a02388a-dd32-454f-dda5-08dd57f5e022
X-MS-Exchange-CrossTenant-AuthSource: DU0P190MB1708.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 12:46:09.6320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f36f8ec4-80a4-4765-99af-e8d63d22f744
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FZEXtm4D5Qgl1kcvSVApB7MYHYoUOm4P6qhMm6pybDzrcBhPVC3UgIxH9INUAIQZiaAsxvSaHsLUydSIhTrlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP190MB2096

To replicate gpio mappings of systems it is sometimes needed to have
the base at static values.

base is treated as unsigned as there doesn't happen to be a
fwnode_property_read_s32().

Signed-off-by: Sebastian Dietz <s.dietz@cyberdanube.com>
---
 drivers/gpio/gpio-sim.c | 53 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index b6c230fab840..9a57e1d46503 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -38,7 +38,7 @@
 #include <linux/types.h>
 
 #define GPIO_SIM_NGPIO_MAX	1024
-#define GPIO_SIM_PROP_MAX	4 /* Max 3 properties + sentinel. */
+#define GPIO_SIM_PROP_MAX	5 /* Max 4 properties + sentinel. */
 #define GPIO_SIM_NUM_ATTRS	3 /* value, pull and sentinel */
 
 static DEFINE_IDA(gpio_sim_ida);
@@ -419,15 +419,21 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	struct gpio_chip *gc;
 	const char *label;
 	u32 num_lines;
+	u32 base;
 	int ret;
 
 	ret = fwnode_property_read_u32(swnode, "ngpios", &num_lines);
 	if (ret)
 		return ret;
 
+
 	if (num_lines > GPIO_SIM_NGPIO_MAX)
 		return -ERANGE;
 
+	ret = fwnode_property_read_u32(swnode, "base", &base);
+	if (ret)
+		return ret;
+
 	ret = fwnode_property_read_string(swnode, "gpio-sim,label", &label);
 	if (ret) {
 		label = devm_kasprintf(dev, GFP_KERNEL, "%s:%pfwP",
@@ -474,7 +480,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 		return ret;
 
 	gc = &chip->gc;
-	gc->base = -1;
+	gc->base = base;
 	gc->ngpio = num_lines;
 	gc->label = label;
 	gc->owner = THIS_MODULE;
@@ -629,6 +635,9 @@ struct gpio_sim_bank {
 	struct list_head siblings;
 
 	char *label;
+
+	//base is treated as unsigned as there is no read_prop_s32
+	unsigned int base;
 	unsigned int num_lines;
 
 	struct list_head line_list;
@@ -885,6 +894,7 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 
 	memset(properties, 0, sizeof(properties));
 
+	properties[prop_idx++] = PROPERTY_ENTRY_U32("base", bank->base);
 	properties[prop_idx++] = PROPERTY_ENTRY_U32("ngpios", bank->num_lines);
 
 	if (gpio_sim_bank_has_label(bank))
@@ -1202,10 +1212,48 @@ gpio_sim_bank_config_num_lines_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_bank_config_, num_lines);
 
+static ssize_t
+gpio_sim_bank_config_base_show(struct config_item *item, char *page)
+{
+	struct gpio_sim_bank *bank = to_gpio_sim_bank(item);
+	struct gpio_sim_device *dev = gpio_sim_bank_get_device(bank);
+
+	guard(mutex)(&dev->lock);
+
+	return sprintf(page, "%i\n", bank->base);
+}
+
+static ssize_t
+gpio_sim_bank_config_base_store(struct config_item *item,
+				     const char *page, size_t count)
+{
+	struct gpio_sim_bank *bank = to_gpio_sim_bank(item);
+	struct gpio_sim_device *dev = gpio_sim_bank_get_device(bank);
+	unsigned int base;
+	int ret;
+
+	ret = kstrtoint(page, 0, &base);
+	if (ret)
+		return ret;
+
+
+	guard(mutex)(&dev->lock);
+
+	if (gpio_sim_device_is_live(dev))
+		return -EBUSY;
+
+	bank->base = base;
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_sim_bank_config_, base);
+
 static struct configfs_attribute *gpio_sim_bank_config_attrs[] = {
 	&gpio_sim_bank_config_attr_chip_name,
 	&gpio_sim_bank_config_attr_label,
 	&gpio_sim_bank_config_attr_num_lines,
+	&gpio_sim_bank_config_attr_base,
 	NULL
 };
 
@@ -1505,6 +1553,7 @@ gpio_sim_device_config_make_bank_group(struct config_group *group,
 	config_group_init_type_name(&bank->group, name,
 				    &gpio_sim_bank_config_group_type);
 	bank->num_lines = 1;
+	bank->base = -1;
 	bank->parent = dev;
 	INIT_LIST_HEAD(&bank->line_list);
 	list_add_tail(&bank->siblings, &dev->bank_list);
-- 
2.43.0



