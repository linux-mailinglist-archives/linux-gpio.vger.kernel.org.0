Return-Path: <linux-gpio+bounces-18152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE76A77BB0
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 15:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FCA73A88AE
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 13:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7EB2036E1;
	Tue,  1 Apr 2025 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="fNg7+tQp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022073.outbound.protection.outlook.com [52.101.71.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F19202F70;
	Tue,  1 Apr 2025 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512828; cv=fail; b=KvxTjhlXb5EKbBWQ4LaGE6R33M44Lk3HGqg+BJjW7aw6v45Y3uhhp3wtOEOHA2TmsUC4JAhIlQnXPLp3cvCzRbWqEVrWi4es0yIG1OLy0JO0XrbIKbGZyxFQD/2VSzf/jvvoiTxY4l6kHjZwWY5n1yVrHPQvJ+7ArFOYPxBpQTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512828; c=relaxed/simple;
	bh=ztMxMwqDf8HSDVYXHZjK6r6HVkbQik/TUbBWQtXREP8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JRRNeBvv3eF1K5V+uWAHzirEWifSYZmBZrNZpJLcuPWYSmhJsSai1kv4kK6/g/uDYo84JAqn6b8BDTkP4C58UcP93aIQdBP94GlUAsUtfjJ32OIEihfUFPDWA2nZE53Kz4HwttPvLEm3kf+fjvzaNMMZiA/qSRaiihH0PoJGamk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=fNg7+tQp; arc=fail smtp.client-ip=52.101.71.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUZvkZXuODPKWLrNq66YWKZngIpPwdvasN6SjkOZoRVYLbbcBJY2BswRF0bXf/iPSHa5CLJH0W1y3cYoXGnqcMqEjlWJGdZRfUXQAvIaKLWTvGBfBxzKemSXLvPBCRSkjmWJaPur1i+JHKQxJo/s8XbyKyPRUpILxXmS6eJijjZfXMpu9OcZag/ot0A17/A9cB9lOr6ANOzV79iMlkSHaWemkOSrynwdvPzp/icKYoUw30Mx2asKKYQnmdOcsTO7NY4yT6SfjbKff39jimQpUBmliosbnRoGmPEZajGItbwGE1j5NSnNad1sEBKNV2sRDa0MFW6nk+yq2Ibe005aEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztMxMwqDf8HSDVYXHZjK6r6HVkbQik/TUbBWQtXREP8=;
 b=LjAf/ZdfZVo6Ckqv4loWJiTCEBueG4wX5I5E0jrMPBYD5gZFlmCyt17HwVcKopMzkmLLk/mkwo8xc83FB9MCNHT8TcH6LWSoMFc+HBDZEpgyoxXG7h/fnY3uhwRvJnU/X8+SQM/4bYAV7/88owyams14Hk3Rd1gomBNoIByXwmukooNIU+VSosQ/TyGuwk6zkHDxDLLoyzZx6Keugr2JiHCJKYgmPybryqpYTnLwKDMUssijbSDTvjRpA/cnMWSuq7BJiDRi0s/WhvL8AO7blExt90uCTab9NGmzo4lTMT3vOiUZCH8RU0mEdqdx9ggsFydb8rsPiOHjCVyqVCDSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztMxMwqDf8HSDVYXHZjK6r6HVkbQik/TUbBWQtXREP8=;
 b=fNg7+tQpWtM/e6+FDnoYwsnGNc+Niw0/k5shUQQt0eezlIyEtw4pQuUjdQoOtQrJFcL43uOwkyf6tlTrHhyzXnI7bRp4ZMA8rvcz++NR8pavVZ7RatLyrpQ3gg3JEeZaVP5oGEJYfAVp0yZ7TVUxohyyQ0V4SS7ih49oRXTNjik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM6PR08MB4215.eurprd08.prod.outlook.com (2603:10a6:20b:90::16)
 by GV2PR08MB8270.eurprd08.prod.outlook.com (2603:10a6:150:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Tue, 1 Apr
 2025 13:07:00 +0000
Received: from AM6PR08MB4215.eurprd08.prod.outlook.com
 ([fe80::f8bd:a866:322f:7b42]) by AM6PR08MB4215.eurprd08.prod.outlook.com
 ([fe80::f8bd:a866:322f:7b42%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 13:06:59 +0000
Message-ID: <62515681-2b70-4ea4-97c9-5abdf264e663@genexis.eu>
Date: Tue, 1 Apr 2025 15:06:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: airoha: fix wrong PHY LED mapping and PHY2 LED
 defines
To: Christian Marangi <ansuelsmth@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
References: <20250326122359.27504-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20250326122359.27504-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF0000382A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:10) To AM6PR08MB4215.eurprd08.prod.outlook.com
 (2603:10a6:20b:90::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR08MB4215:EE_|GV2PR08MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4e4440-befc-49be-e727-08dd711e1671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzR6dEZjYVJxRmxNZ2xsajdJRWtMV2tDRy91RzN4RndkVXBYcEFCQVU2dmth?=
 =?utf-8?B?NUFKVWtXRjJXZm5uYjk1YTJOeHFXT0RLQkd3OEN3eThHSnQyR2hLMm80Tzdl?=
 =?utf-8?B?aUhzVmdJRHZuUEt5Nkx4RFE5ay9ya1lPUFp5Qjk4Q3dDaXh1aXgzSFlKUjJk?=
 =?utf-8?B?djhRVk1ZdTFxQ0ZPa21QZ1JwN0hDRlgxWjlLczhFd0ZWaWY3djIwaGh2TjVN?=
 =?utf-8?B?UC93b2l4bEdXamg5SHRZSkRyUWJpU2ZleEliUmplbnlzaU5XeU1nSnFYanQx?=
 =?utf-8?B?REV1cU05L25HNFNFQ3JwenYwZHIveDV2bmdQYWFyb3FPV0tUUEppdjd0b3VH?=
 =?utf-8?B?YkhHc0ZhV3ZNNldJaU9XMFZXRnZyaHVRNHlVOVRjOE16eXhhNXluNW9FRTBV?=
 =?utf-8?B?NFpiUkJQSW5rSXdEQzZWbmdQNW16QUJjYWk3WDl4Z2g3TG0zeVB1VFZFOWls?=
 =?utf-8?B?RHlMUHNUYSs5Q3ZJKzVXV041VitDeHY1eDI1Vmg3Vnp3K1VUaUVSSE9BM2dP?=
 =?utf-8?B?R3UwTHExRkRjMithR3JZdHJBbFR0Z1JQWUxiaGprOUgwWmZWRndrUDJyNUs3?=
 =?utf-8?B?d3FrWEpoNFptVm1kdGFsSGwwRVJhWXB1aTdaTlRQdnRrVnB2V0trYlc4cXM5?=
 =?utf-8?B?aVBXN3FvUEVOVXFxZ042TXc0VWxISHhYUmkzQzdpMnNRTUtPNjdhakNHR01T?=
 =?utf-8?B?S2xlZll4eVl2a2JhbWF0UDE1V05qWVdTR2ZOZW0xbnAzcmIySlJyMDJRQ0lo?=
 =?utf-8?B?cXpkOVNXRFdUR2hKR2dvSTA2b3lzb09MUENLaXZJTkNQMVNtZWJHVzRObERN?=
 =?utf-8?B?dkliTGdqaVNTdS9ITWxEMFZjT1QwNW1QeHdUeHF1QWt5MzRtNnZBZUV0TFha?=
 =?utf-8?B?TWNFdzFDenhYWTc2UStweHRla3h1VWl4UXNwdmNMbEk2ZVh2RzJUNUdndXVT?=
 =?utf-8?B?TGN0NXVodDJBSERKSVdWRjkvL0VmRFBXek50dzhCSmlpYUJEQnh0eEpXMUht?=
 =?utf-8?B?a1hmTjNPK2ZSbDFMUDF5UEExK3FDbCtGR1c3a2MvRmwva2Rub0dhdDYxR2Rj?=
 =?utf-8?B?TlM1NEZPMWRTdnUrQXhsWFNBa3V6RDcyNy83SEhkYlFmMFdrZkNROHZsQ0w4?=
 =?utf-8?B?eWJCRHBvZWtQWG1hWUtMUlNXRmhobmtveUlmd1R6UnZNajRqSWN4VU0rUmw4?=
 =?utf-8?B?Wi9xd3RvVjlQMDhYbWpTdjhpckVzZWl3VkRMcnpxN0ZJdFAvMGp5ZS82VE94?=
 =?utf-8?B?QS82R21MYk1YWEM2bmgvZ09yZ09QK00xTWM1YjZrNzhrQlBuVHlXSXFGdDc0?=
 =?utf-8?B?RmM0b0pwRWRXMzFWblljbG9rZURoclhsKy9Xa3NHWVVhaUhjZjFlYW5TUHR6?=
 =?utf-8?B?eWd0cVBUbmh2RXg0OUl5aTVob3Z5MVRLYnV2b01xTStQeG5Nam44ajFGTHFC?=
 =?utf-8?B?cDJxbUxqYlZ6YWd0U3M0cjBEQU5ZUjNML3k3RmowdytocXRtV2xpdXIxMlZs?=
 =?utf-8?B?MVJpZmdUcmIyVWpxRERDL3dud1ZOTEpIeUJxai9QNEROUlJZSHBPRW1FZ1hM?=
 =?utf-8?B?Q0Z4UDAzYWNqTlp2UjJ2dmlGYnFJRlU3ZjZMbVFVanY0TlduN2JUWVZxTXZw?=
 =?utf-8?B?U1JmOC92Z1pzS2FtWU1lUENGcVV6NUgyWHUyQU1SSkZIdDVyZnpuZkNYdzJR?=
 =?utf-8?B?UldTb2lHaVphSzlMTTNuazlMeEMrNVdPUWluY0JQVitmcjk1S0llMWIyQnd6?=
 =?utf-8?B?RS9YSU5vaVNpOWg0c1F4cVFJOUk3WHpyOUdOTEpZMUkvNHVSNnI4am51c1hp?=
 =?utf-8?B?ZEhuMmFvRDhlcm9EYTc5bzl4aUo2SFpTZi9Ua2UzcVRRTENKNStNZHF3dmx0?=
 =?utf-8?B?aU5DVW9hRXBTUVpTeS9YNVdnMm1vaE1ZcTRuZG9DSWdvVjJwTkxzTllIRWgr?=
 =?utf-8?Q?aIHlJmhjOMw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(7416014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWNqTUtYQUhURkUyQ0xBZmVwb2ZEZXdiM0FlNE9JWGJUMlFVRGNybnlVTzhh?=
 =?utf-8?B?ZkROcmhERll4NkNlZWlNZzExeWRneDFTUDVCc0tzZkZJMmNVU1VJSEJ0NGNZ?=
 =?utf-8?B?MG9DQTg5VW9zVUZtWXZYWk1lcEUxYk5oNThjRndCeDJJZ1FaKzJqendWckVk?=
 =?utf-8?B?dTlQNGEwbEQxQ0htblFieGU1QlZ2dktjbnNybll4Mko0SGs4dERUMklrMlNL?=
 =?utf-8?B?RURPODhlV1RoWkZ2aXdJc2U2TXFERUVWWVdDTE5ndGdiS3pKcTlOL0MybEx6?=
 =?utf-8?B?OVo4eE9YL1U0YmorLzRhTDNvNDBYN215bmxaNjdIT0Z1ZHVyV2Z4b1RFMnpP?=
 =?utf-8?B?Q3VkbksvbjNVdkZ4UzhYQURKMlRvbVJ4cUlKMXkxVmtiekFBZ21HQWNJWHQ3?=
 =?utf-8?B?RFhTTmVzMmg2VzlzODBUMXNaMkdpWVNJeGdhWkM1RlhueWFQSEpBbzRwKzlO?=
 =?utf-8?B?a0NmQW4wcVRMVWtsRzNPYVM1bndRYkFQWEp6NkNjT2FQVFRoUmpzWFBCVkcw?=
 =?utf-8?B?UVkza2ZkdUxnQ0M1ZkozZVpDVW9rM1BXZW50VS8waTdRdWZWMkhaa2U1ZUlD?=
 =?utf-8?B?cjlPazY0dW9tNm5yTHR0Q0lrSGppbnB5N0p1QjR3d2x1TUY0WHVZYWF6ZW1k?=
 =?utf-8?B?T25DYlhZam5SYXBUUmRZd0xKdnUvSHpNU0JiR09ObVQxbm1ZdzdlVk8vUHR5?=
 =?utf-8?B?NUExZzU5K2x2RDV5R2I4ajR0a3ROdGxDamtJK0FCWElEYnI1VVh1c1FCOUF4?=
 =?utf-8?B?a213UjY4YzkvLzA0NFlyUm1FeXF5NWxYaEx4ZllHcU5UZk93UE9jTnR1NlVM?=
 =?utf-8?B?bVZQMnVaZ0RIZEx0KzVwR1JHYmFEL2ZGMjExVkQ1OGpiQUJJZnFra2U2ZS9E?=
 =?utf-8?B?VUNmOTRaUDI2MVV3bzVHQ1ZCVlkxWGpIcGRETG1nZzlITS9ESVYza00wOEJG?=
 =?utf-8?B?aVp1c2RsQnE3YytSTWU2VG1qQnZ3Q2JzRkJTQ3FDVFBDaVBKSzlkQ0pLdHBn?=
 =?utf-8?B?N3J2Mlladit5dnVJMG9XajJBdkxrZWVTRFp2aHArTWM0SUxDS25XZXJMazda?=
 =?utf-8?B?bW5nS21MRGRHT3FVcXkwbG1zalF0VXNld3MwTEJBMGZsYUxZeUhVMk9zeEhr?=
 =?utf-8?B?NkFKVlNyRmFHbXNhaXJwekJmUTJXekowYWdsUkhPODFEUlY1MHRkaVFTMHo4?=
 =?utf-8?B?VE51Qm9wWnJaaTB4dWhDM0lrNEZoK1pJOGFsZnZTeEJpZlBtbG5Mb3NCRVVT?=
 =?utf-8?B?cDJSVGNXU3JrUXRyRFNpWmVzOWI4MTh2dHpuc2RkOXQ1MkEzeVNDeElyTmVC?=
 =?utf-8?B?TDBoUGxWcEVXb3pkUkZjVXhwR0RUbjlOdEZJTTM5NE1JUjlGbkIxdzNkN1Ri?=
 =?utf-8?B?bmxjeS9JWXZ1c1hIQmkvc1BXS0dTdndMR1BpZkIxdHFNTTV6ME94RXJkejJM?=
 =?utf-8?B?cm5BNDg4RHphWGkrVlMwOTVhTW04eWxZcmZIc2MycXFsK3pNVkVBSk50VHhO?=
 =?utf-8?B?V0RSS1FyNTJCS3dVWUVWUlB4RXlYTmo2VmNPSWRETEg0UkxlTUYwcG5pL2lF?=
 =?utf-8?B?bXNra3FMenZUMEVHaTdkWitGWE96WFBEenM4UmFsREFMcFU1S2V1NVBVdHVM?=
 =?utf-8?B?Zml4TE8zWGxBa3hjb2dVOHpXckNkKzJFcWNVc2l3VWZLYnpQVlpGV2NnR0Fx?=
 =?utf-8?B?ZFhuMWFFOXBwb1lERzRQOXNvbExIc0NOWDRGNDduVlpreXg4ZjdmOGVpeXJO?=
 =?utf-8?B?bzduenIrTFVGOWowRFJFWkZzTDUvYzlXclQ4NkVheVZuTUlla0pNb2ZURjIr?=
 =?utf-8?B?MmpRdWc4N3pKWUJNT2FESXdscWlkSW1vbjJtV3llM1JtOFNmb1hXa0hRbGVp?=
 =?utf-8?B?bW9pT0FoYWtqa29vYnpMQ1NSSXBTbnZCY0Z0MjNkSkN4THNuY1E2N3JXUlRS?=
 =?utf-8?B?Y2ZHYzdSamNFNjJqSEllWk9YTitXZllSTmFEMEx5OUdvd0xvcHM2K2liajF0?=
 =?utf-8?B?OVRHTlFMNmNLOFJVc255NEhobnkyUnlnME5YYW1vaFpnUk5kUXkwM1JaME93?=
 =?utf-8?B?UG1ueEZqQUUrdWpQQmtiQVRDTUladnA3WTc2eWRGZFdYRUhsa3J3Y2FRODhE?=
 =?utf-8?B?OHJ5cGFGbEtBcU83VWczcHE2dFdRbkRSd094MDdQdHFUd3VTa0h1NVdGWjRW?=
 =?utf-8?B?bWYrcUZ4MmxpVXVJQ21VNm0vL3JRZ2NuM1RPVjlhTmJnd2VwaUxlZ2NieEFX?=
 =?utf-8?B?T0NLcWZPTUQ2SENtdGd3T00xZThRPT0=?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4e4440-befc-49be-e727-08dd711e1671
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4215.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 13:06:59.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueIZl+OMQOpEjgnYVcK+Acwhn09xh7km93Ew5fvVnAZtOjA0a2JSX+Kk86L2wzzxfbZOuSORwQQ3Y3/8plD2AEm8cyP/SPv3EtDtG9ZKzIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8270

On 2025-03-26 13:23, Christian Marangi wrote:
> The current PHY2 LED define are wrong and actually set BITs outside the
> related mask. Fix it and set the correct value. While at it, also use
> FIELD_PREP_CONST macro to make it simple to understand what values are
> actually applied for the mask.
>
> Also fix wrong PHY LED mapping. The SoC Switch supports up to 4 port but
> the register define mapping for 5 PHY port, starting from 0. The mapping
> was wrongly defined starting from PHY1. Reorder the function group to
> start from PHY0. PHY4 is actually never supported as we don't have a
> GPIO pin to assign.

Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>



