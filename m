Return-Path: <linux-gpio+bounces-18562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 014D5A82664
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 15:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EF90900199
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 13:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B35228CA5;
	Wed,  9 Apr 2025 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="LjOAf1Pr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAFB245024;
	Wed,  9 Apr 2025 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744205925; cv=fail; b=TxCpb1G01PY199OjV4Jozu2YllQ/JJYhfr5kDjU4/umMdOuo4oLgEz2zNVsCJTUUsVe+chcdLw9zAlkZntU0gqp22NDUzOmyK14X5Ev29lQydsNux8UZN0L1Q67971nwF7AFURm0CMmaC2lM8eVPdHAlRvPdK5eBh+564fzATDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744205925; c=relaxed/simple;
	bh=1HZgF43SBI1f+2j7t1F5+F9dJSC2dh1I6ITswn3mtO8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tYv6Z0MpvhIVbdeUmt8VYtN2vf0FTlDGfaMisM5mGbu75Jg+X+UqQ2qNsQFhNOw1yDMT3PnOG9wEJgCdfhlSpRTtBIMLRy2eLdhUBIlKkzKsGLXNBGEIYmUDpKzbegOUBxYVxiUdwlyA9mQmvVSaPI/uaxEFFZmEhmjBeAyA8jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=LjOAf1Pr; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539CxCBv008599;
	Wed, 9 Apr 2025 14:31:29 +0100
Received: from ma0pr01cu012.outbound.protection.outlook.com (mail-southindiaazlp17011031.outbound.protection.outlook.com [40.93.131.31])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 45tsrxj7bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 14:31:29 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4TwpDwiUh5+jSMM73PwaO3xB3lCTd3Qlaw6TSCvU/+gJ3sP0Dif+xviJz6o0HFztGF/xHDGi2+RlGVipAH1A3GUg53Gw/OUmrbvLCKT+xvhEZCZAqSG0dAe+BjGNqVwqzLLErG9TyH3+OJQEKfJXKFJvzVoNBbXhUr8JVC5/LhIQHqsvLJkdXmL2K+sZE11RiTWhWfNu7UGPcFndJaFT2KCVWxbUezEKBACe0gr1rdojAWW6+JBZF8Oh3U+jcI16EZJU6pxEm+e0hesiLd5pjyPLtNb5q561qwhO2bv7oinhwhHPXeA364EWVGB36TkdNdZvfQSplU1Un6HxB2XRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJixWL7rRzHcaIIsAsGwydtv3IpIg0941Sl8ONk1COk=;
 b=H8MljARU4jrBjD5S4jMdPOxI5n0Stb51RqY8YAWVX9DZ3FY+AZQgwFTjrUBc7+kFupCw6F/Bc5L+xAvaGUNzJ5l6bBsGQAODncfJOC6zid6ouSNLs797rrM2/TG//5l834u+Ky1F04xT0aoJHktP3zm6iQ49oNUZR0/YHpMbauH2ieHnMQeWBEi7kFZRzOgC9ZnMILCygpKuh0kM831evITg9Qe7xGvJ0TKzXrdYwd/pyKePRFnTg0TGr12gmqo+FDPGq0xmTRzGi5Ei06bESCItLxCij23DSgsLX89w3gUCKcgONVHZBKwvklFbVcxI8JB4v0raPHCUgf2xaUCMBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJixWL7rRzHcaIIsAsGwydtv3IpIg0941Sl8ONk1COk=;
 b=LjOAf1PrF/CRfSDkK4MrhkLm9CmbKwUb0/5aLY2JIIiURcN9bwaugEeWCDUprIlNbkPUGzi2/HoRI6B+JM+U+U64YEM50DyIltgwa+i7sJFUk6lPYm4OEz9IVrsh1ZKkVXTUArkp0b5S2vOQAD49Dh/NzYNgBKMKtboN72q8QP4=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MA1PR01MB4258.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:15::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 13:31:24 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%3]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 13:31:23 +0000
Message-ID: <b371a702-e70b-454f-b3e2-3fc63c10190d@blaize.com>
Date: Wed, 9 Apr 2025 14:31:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: GPIO_BLZP1600 should depend on ARCH_BLAIZE
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <a75af4b623579a193b4a59350c063969aabb5b71.1744190524.git.geert+renesas@glider.be>
Content-Language: en-US
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
In-Reply-To: <a75af4b623579a193b4a59350c063969aabb5b71.1744190524.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::8) To MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:12a::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0PR01MB10184:EE_|MA1PR01MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: d82b421d-58e1-4092-c984-08dd776ad1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEN5Wjd5QTFtY29jMXpYT2h6bHUwZlByT1hFdW1ueTB1cWNlVlJzeWFFT0ov?=
 =?utf-8?B?SzRZL1JpNktCZlJQYlpDcDFiMW9RZTBZNWl1cjh5eHhOTWlUOXJMWXAwL3BQ?=
 =?utf-8?B?a1B2TUQxS3dVQWx1bUM3VktZSVd0SnVIcGFsSnlUdS93Mmt3ZjdnUEp5TTBG?=
 =?utf-8?B?c2Nha0l0WmYvN3p1OElUMVQ2UU5EbnY1OGQ5YmNpT0ZOMUhyWGZjandZZGFl?=
 =?utf-8?B?S0h4ZnB1VVUxV2tnaG8wbC9JZVlCNDQ2Zy9tc3N1UFZjeW5wSENibUNPSUw0?=
 =?utf-8?B?MjRFamVDQWU0cDMwcjJNeFQvUTRoancvemtpNDN3WXNhR2xYYmY5RDhSSlpN?=
 =?utf-8?B?bzZEaTltdXNVSXlIb2xYMzdkclZtT1ZkWk55amc0OWF3ZGlvc0JHUUR5eGtN?=
 =?utf-8?B?THQ0Mk03RHAzYXRUSFdJUTRxbk5GQVJCVmR1Z2Y0MVlMZjhYYWJZaXhXV1RF?=
 =?utf-8?B?Vnlod1lHblp1cEJTMnZwN0o5QzYycjd0QzFuWWEyeDhZRUN3RjBGTVJJamFq?=
 =?utf-8?B?bkxQT2tRejF6R3orTDRoMmRpaG0rMkdJb29MM2kvUzV6OUIrcXNpa2Q1OVVH?=
 =?utf-8?B?TVIya0k2WnZhL3NXa2ozUWFpeHVrbUpJYzVvdUl5T1V0dWg4VEcyS0JpRVlC?=
 =?utf-8?B?N2tNbkJ4a2xSQU1aZG8yRXR2M0M3dStpMmtDbHc1VElVdW1PR3lhTkJGSHp5?=
 =?utf-8?B?a1NVbzFBeFQ5RWFWMThnSnAyd0NOWDRRNjIxaGtYWkRCVnJlRkJYSE5IeHBw?=
 =?utf-8?B?YjBxRGt0Y2ZPWmdxR3l2NkZzeVpWSUNkQzEyZDMvbFJvV0kvTS9TWEZERWRi?=
 =?utf-8?B?cnE3OHo1aE5oRm5IQnE4azFzQ0dTUGtkY2g4LzREQitiSXpXeTZlb3NwYUg4?=
 =?utf-8?B?OHl6RTFyMU9LQTRLQmtjTjZINkx2NE9RMm90UHNMOTU0QzhVSUcxRW85U2cy?=
 =?utf-8?B?YVlZRmIzM00vMG5xdFNZYkEwVnhBdkYxbGprWFFDclFxSWYzYU9YZ1BXOGxW?=
 =?utf-8?B?dkpWVXlEcm1jVitLOHZqK2RjWDhrUTNodHNhTGpKd1dNZExwMjJ2ZEJ0YzlG?=
 =?utf-8?B?Ym8wc2VXbmtCQjdxUXVUcVRpaThNaGZHVmtTY1NnZTdWc001VXdpc2hGTUxK?=
 =?utf-8?B?NjBsd1EvLzNjdTBkOEx3eWwzMnc0SnRrZTlZNVArMEVnbmoxU0tpN1V6VGxQ?=
 =?utf-8?B?alYvOTBzeHRiS2NIb2xDVnZ5ekpsdXh0a0w3bm90cmcya2hsYnhnUTh1TnVz?=
 =?utf-8?B?bGhmWVlGMFdLWXRmREJyLzVGcUFob2V6K1o3ZWU5MDJlaFpBWG1Fa0Y1ZkdP?=
 =?utf-8?B?cEduenZCcEhxYi9nVkZUV0d1NGQyd2I1RmEwNXdSQ1VKZWx0V3p0eDh0ZmxB?=
 =?utf-8?B?aU5rK254UXp2M0hzMzlMVU13L0ZwUGJIMWVSZWRkdS83R081a0NXME5TaC80?=
 =?utf-8?B?V2M3TituOXlab1hTdVJMeU5qYTNaM2F3SnJmRU1yMnRmaHduNHVRSzY5elhD?=
 =?utf-8?B?K1RIOTVUWUtBNk93SVNQRHlrbHErbFl4aUREZTRFZzZWaGUzVnRDclZ6QmhU?=
 =?utf-8?B?dmVBL05PWUdhMzkwRGVTUUZEb3hSYmZzQkNpREpKNkZsYzdDSE02OGtvME0x?=
 =?utf-8?B?MHByM252N3FBSEJOZEYybDhPR0dsMTdYcTIvaHhrM0Nya3hvN1NTOFJNSTRs?=
 =?utf-8?B?VzNpYitrNzcweUNib1V6TVNyQ3FEQ1M3RTVZK2phSmJOWlBqKzVNVzd2S0Nl?=
 =?utf-8?B?dzBNeUJnd1J2RXVUa3pYU2xkYm9XWWMzUGUrMzkrLzQ3Ukc4U2l6U1FzMkp2?=
 =?utf-8?B?UTFLR01RUW5MTlg1ZHowd0I5RytTOUdBd3ZlS1NZbTN1Z3I0TldzSm14eEtN?=
 =?utf-8?Q?IeRWhQFInxA55?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzU5VVVWSmhid0J1OXpiNzZxOVFhTGZMeU41SC9vcFQ1WDN5SXp5dy82Sm41?=
 =?utf-8?B?Z2htckRTVUZFbjl3OVF5d0tKUnhjYncvdUI2cnY0a2ZaczcxSEo3RXZrc2dE?=
 =?utf-8?B?WGFFTEk0Sjk1ME9Nc0FycDlxTUU4TlFvTWRLWnBycE5wN3prK2V2eG1IZWhq?=
 =?utf-8?B?VjlXdnFSWW80aUlSR3FpNnNFYXB3bVVZamd0UHRWWi9hSTF6MXpmZ1ZyVkN4?=
 =?utf-8?B?YWVsY2Jtb2Z5RndUYUhickg5SjZQTVRmamc0d0xNSHR2aVJxSE9MVDdEZTFI?=
 =?utf-8?B?UzVsQ3VKaU8xd0xhWnF6eHVuSmU3aktjMUVjUUdsSG1ZbzdRK2Ixa3d0VkdK?=
 =?utf-8?B?YjkvV3IzeU9abzMweWYxbmlZQ3FLc3RjZE5GbXl1K015TEp4UmYzMnVhVFYx?=
 =?utf-8?B?Qlcxc2Q3QWJSTy92STl1SnNTdGFnbWM4TFU0ZE1VaTViUlFXQ3pDQXJqK2xI?=
 =?utf-8?B?L2kxcm5RL3lWTzJSNHlyTUJ4MHV5ZGNJQnZPSzlPT0V4OVlPbWZvWmVKaFZT?=
 =?utf-8?B?Z1h5SXVNdkZZTkhwWmR0eit3enc2MDF6eGdzTzFmQ05SR2k0bVg2eFAwcVMv?=
 =?utf-8?B?OVhYR0hTd296SENyV0FQc2dSV3lKR3p3Q2YvbnAwTjZqVGxOT0o3Y3REc0Vz?=
 =?utf-8?B?czFSemN3anFGdWZ3SWlETjU4SWZzS3Vad3l4d3BiMjZDKzVzeW40andub3B1?=
 =?utf-8?B?ZGozVHpXRXQvSWVJSE1aaS9UUklPSUl0UUkwVVJFSzlLMHF2ckxNYTZMcmJB?=
 =?utf-8?B?ajhLdzg5M0E3OWduWWJJc0J3VnM0NXZRaHk5M2liMW1Ya1JOS3M0bnpGWEtX?=
 =?utf-8?B?cGY5bUJkRXFXZVkxNnJtYzUxZTNzdVgxbUlnb0xMYXBoZHNoRTZ5RVV0UDls?=
 =?utf-8?B?MXFkVXFLL2E5NS8zaTIxNDFoOUs5ZnFXMlF6b0Y5V0YvOVo4em5yNGwrMHVC?=
 =?utf-8?B?dUdhWEJ2bi9hTmRvaUtENiszemdwSHBpZU9PWFVqYlN4aU1uNGRENUFuTXFG?=
 =?utf-8?B?NXFVR0dyTHBubEZGSEpCNzZyWld3QjJMVFQwQjdXWURhZjNNYTV3UHEyNU9S?=
 =?utf-8?B?V3RTdStkMEpYZ0hiUXE5dUh1aFQ2VHdrZjVGemFHVlIxQ3d5Sy83YVJ6MDF1?=
 =?utf-8?B?cVlTeWhWWEhkUzBaeDgzODFSNW9RZmxRL3JXNkdZdFhDYUxNaXhxMlFBODJ2?=
 =?utf-8?B?YTluYjZ6ZVFKTEoxRzNWTWRmc0NlRmc4UjRzbGI1d052a0dHd2I3VmRzWFRC?=
 =?utf-8?B?U1dZSTVKY1pqaG5BM1EzUUtrWjYxQzN6SzRYTWdIRWxocU5yM1g4UkRaZGhI?=
 =?utf-8?B?dHJBVFBiaTEzTUdCMzVQdVNBNmc4YzZwVVZjZ1BxWHdBZE1ZaWJBbS95MVJ6?=
 =?utf-8?B?VjZLY1M4V1lBK0lEV2l5U3Fad3pDODBXdFAzU0MrWkpodmw4N25tZ0hETGt4?=
 =?utf-8?B?ZGNmcUhFaDJ2S3hnd0IyNndXRjQzanR0dWpEbzZMVXJtY1Q1TFBhVUJUZGR3?=
 =?utf-8?B?WW5LK1pONXRmRCs3dU52M2t0eFRiUVNBMHo1K0RPTDVHRHNBN1dLTnQ0UWRp?=
 =?utf-8?B?Z1JFQVVwbGptVUR1aXJXS2N1djUrdVdFS25EcTM3aFhwY3grQ3JuZFIxOC9I?=
 =?utf-8?B?aXBmSEoySExnbFlHNURpZmNleEcvMmZJY0czcGV3UWdZcGZCUFRkeGlEdnZn?=
 =?utf-8?B?S1hMbENwbkJyN0Z4RTZ0L0NkbkkvMjQ4T2NybVBDazBPbE1oYTdTWUM4cy9G?=
 =?utf-8?B?NFRJckpuTVNFdFNVanMyTnNDcUkveGxXM08xdWNlSnRJaEp1M2NHRHg4QmVD?=
 =?utf-8?B?R2JrYmVFU2FDT1IvcUZDaW5XVUZEWnNxcVpsa3hJKzUyNkdSZEI1UnNTMlUz?=
 =?utf-8?B?ZGRCV1Q2RzJtc0NmR3VEVmhQOEF0Z29IbWtGc2lwSEloUjN1SS9QS1ZXZ09k?=
 =?utf-8?B?OXZsNlFUeHV3aFhjbVhIOWxLa1RoTjBITFk0MU9ZYkI1aGI2VGs3RGYxaEZL?=
 =?utf-8?B?dFVhSXBJdVhBbG5ETWxFWHJYdGQ0MjM4amhRUDI2TTFLYVl0ZXptdEZMb2hT?=
 =?utf-8?B?dGRKS0o5RUxSNUx6UDYxc2UxRGdsUzJYUlQxZWRBMU5tK1BaMmIzVjJQeTla?=
 =?utf-8?B?aUZFRm90L3VYTGYwN1lXNVhYa3hsUlJEbUMvM043MUxGQWVzaEVRVG9BdkRU?=
 =?utf-8?Q?4JP6FxbqT8WidbZRFX9fS/s=3D?=
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82b421d-58e1-4092-c984-08dd776ad1c8
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 13:31:23.0626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhGu1X8JQbOglbZ3+JoqL9r7FKiVYSp1UHMk13TImPn2e+47hWhIAill5Jp415mKyj/JYuHKDGs5roZtp5bBd6SXW911V1dypJn64vQ8/20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB4258
X-Authority-Analysis: v=2.4 cv=fYOty1QF c=1 sm=1 tr=0 ts=67f676b1 cx=c_pps a=eu+VrafKqrkYN/YfGA+BZQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=bM-Xzlm-_H78J5Xh7iYA:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-GUID: JrSiXWpc439i0uKzslgeFyy-5a7dlSTA
X-Proofpoint-ORIG-GUID: JrSiXWpc439i0uKzslgeFyy-5a7dlSTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

On 09/04/2025 10:22, Geert Uytterhoeven wrote:
> The Blaize BLZP1600 GPIO controller is only present on BLaize BLZP1600
> SoCs.  Hence add a dependency on ARCH_BLAIZE, to prevent asking the user
> about this driver when configuring a kernel without Blaize platform
> support.
>
> Fixes: 602ae04f56542d8e ("gpio: Enable Blaize BLZP1600 GPIO support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/gpio/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index ae458fdb9da7dd8a..5f8cd5445c7121ae 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -216,6 +216,7 @@ config GPIO_BCM_XGS_IPROC
>   config GPIO_BLZP1600
>   	tristate "Blaize BLZP1600 GPIO support"
>   	default y if ARCH_BLAIZE
> +	depends on ARCH_BLAIZE || COMPILE_TEST
>   	depends on OF_GPIO
>   	select GPIO_GENERIC
>   	select GPIOLIB_IRQCHIP

Reviewed-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>


