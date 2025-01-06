Return-Path: <linux-gpio+bounces-14520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C54DDA01E25
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 04:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E2AA163A0C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 03:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D532B1C6B4;
	Mon,  6 Jan 2025 03:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ENEDSTcV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED86A3224;
	Mon,  6 Jan 2025 03:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736133544; cv=fail; b=LmmLOw33a3gMympkrtTp9m3cES1+j+ZrrctDVe1y+DN5Ez7OjG9WFqyKVdV+c4JPHc792FYiaWoOaAOh+//vOyTmJJosYXvC1NyOTN3TZU6ZXmb7ro3wqcCjtj4iwNm3a40v+iVixVoL6a1zYPgCqBkmV+Mp315M7EWZHOpjO6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736133544; c=relaxed/simple;
	bh=IekmA/ziYw45zSoHdUjBQyAafwVJi6CQYTzSB3tjQOE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ssQZNDaEL31ErFSFwlYif7MEF2E53Z/EqxWdBhAghwBsCzzkr7ef8wJrCkDu502fnQp2xh2bvOm/Slg5l1iJ8vAwNsVU8mNE8PcJV3cF4Sqhb9xetKc5FBy2zm1px0mvJ1dT941AMkMnTXTwUTF6R/aJMxUjTFidH/9lt8t+Bn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ENEDSTcV; arc=fail smtp.client-ip=40.107.220.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHUr6JzZ/IBrU3ZOzH0d7jLtJ465IgDlLQFoualYZA7/aHrS1N8TYWU2jIb25quJ89QdUOer8rIQENKON7NZfD+BxCh+ACn/ph4dZjML+togeBFMuzlkvVvYxoAFcvT53j4cqF8GZva2Th6xvI43ZWuLcFDvrYxwJMlZ0Awy/zTZnAvIL4UV6Gy9SssHofVe4F1BdixFdNafY6Porfxukr0ZaHnla0kTlxgUiHI93njmkE+1L2dKC57m3nb10ER7LiY224fQNOIAoGoNLktFWvdh/XkiKhciPnF+v1dBLZI7uYrtFi4HZsegi62PFPxlFNRLvhZ/9TgW8zB0Aq1NIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60ItYsd9RdFbDdes8M55oJlxkc8alkMj4BIy317XEu8=;
 b=Gyp8jTUn35UHHK5z2HZW8ldsvUDlAuZ2+xTqYpAQlbQNQxgOKrA96z3LDmKHy4tY8zey5/SiT6+GxlV1bGIx6NJgX9lJ5B45cQIt/rv9q2oG+bIuQhfdqz9CbLZel1UVfFuFajwmeyM82iAd0u1NhCriCo49b9lSf0uTl/KosPpbAc8T1FJYDIoNfzYwm3kHEBjKFHxyx8pc6hf6S/7GdG4mh3GtJJPIBuJ/vr4RO6cuzqXO6ndFcZXlPBLcC0dowzleDKlfrEtQVH23rHK1YzB31ttZH0FFiyqZwhLUYlLHzZoreLUWr+WJWwId/lyNx6ZLRGs2C3qJfWriFABNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60ItYsd9RdFbDdes8M55oJlxkc8alkMj4BIy317XEu8=;
 b=ENEDSTcVTKlX2QZzrDOaSsnqbtlyJAJc+RgMLlBSqN7JcZnHPQKVVTf2+55Gk/2q1kPVrSep+VbYd09oGMXh5/dqMz6Q9i7tspnqvii9rgvr6aMQF6VUxb3FyeoRXburv8pgai2QIdeEOkuGIGwVYS90zMx4OKKG/mWgBsk0Bto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 PH8PR12MB6913.namprd12.prod.outlook.com (2603:10b6:510:1ca::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 03:18:55 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8293.000; Mon, 6 Jan 2025
 03:18:55 +0000
Message-ID: <73486a76-d24d-40f0-ac32-792b80aca6d9@amd.com>
Date: Sun, 5 Jan 2025 21:18:53 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: amd: Take suspend type into consideration which
 pins are non-wake
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <e61858fe70face71226727618dfaa9d5e54da0bd.1735490511.git.mail@maciej.szmigiero.name>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <e61858fe70face71226727618dfaa9d5e54da0bd.1735490511.git.mail@maciej.szmigiero.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:806:23::9) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|PH8PR12MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: f623ca1f-a14d-4286-8319-08dd2e00d9f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dURWMThjU3Qwc3U5SjQ4RWJFQ2FUZjA4RUYyR0NJTEF2Z05KNjlwQVVUcy9G?=
 =?utf-8?B?dWtVY3k5cmVZTE1zY0RyUllERXZPaVQyYi9NaEtjN2ppTExtaUNTdFF2eGhj?=
 =?utf-8?B?Nmc2aUw2ZDNaZHM0VkJnNGtDbVlZbDdhY3ZlRjNpendwaGJqblRzNnBIckk3?=
 =?utf-8?B?Tk84ODc2dDBaWjkwT05oazZhdzRnRXZhdTE5RlFJQXV6eEZOZTJZeFYwU0Zr?=
 =?utf-8?B?OGk4bXh0OE80eHJWOGU3S21EVDJJbldxa3FnckdjZE0vWndTbWt0NUNWeHFq?=
 =?utf-8?B?bHZ0WFB1d1ppN1UrdVpTTkx5WEtWazI4KzZhUEkxUVc0cFNVTEJBWDczMm9x?=
 =?utf-8?B?T3VBMmdNWGU1WlZmU21mcWVERGJoNW9kTkFRTFpzdXVrREpMT0JGaFByS2VT?=
 =?utf-8?B?M3BSU1JIYjNlZ2Rla3hOQ2xNY0V5dGlZZVlEK0dYTlc1M0NYSUtZSGNoaUto?=
 =?utf-8?B?aXBEamNudzNPbXhwMWxFL3JPd0k1bDhWaFBmeklMaTkrWjB5YXQ5QWlsbFAv?=
 =?utf-8?B?KzExeWdvOFpEcEFsVEF0eE5vSU01M0ZVR2hhZ0ZZNDZSV3FIYlNTaDZJcjI4?=
 =?utf-8?B?d2hWMXBQSWhaK2oyNzc3VXBRNVE4QmhydVJ6Zk84Mmo3UldsMk1rb2prVFdq?=
 =?utf-8?B?aVErdjZTR1RmNXVYODVTS3lKNmZaQWhoVUQzUWp3TkgyTUt3UDZvcUozSnVk?=
 =?utf-8?B?QStWMFF5TEJEaXBqSVJJNkNrc2pPSHg4S3F2TWxrWFJWZmhLYlBRL0szU05V?=
 =?utf-8?B?TTlPQlAzcHdTYzY0UDc0blZVaS95U1V2MmJsWkh0Uk42eDd5OWN1cGtRMjNC?=
 =?utf-8?B?NC84V25rREpXekFXZ3FRL0VNODR5RzV0aFRRN0oxRkZIb3VtWGFQVUZKcGZO?=
 =?utf-8?B?OGNwbHJMZmMzL2o4UU5vRW12dzc4R24rWkRQbEFRUjVIUUhLZjErVmh0ZmVo?=
 =?utf-8?B?U2Z4UGNUZy9tV2JldTJDRjdXMis0MUpCMU8raTR2VURjS1lYbjZmVTBpYlBk?=
 =?utf-8?B?bDl6ZDlRUzU2ODV1Tkh4R2hGd0t2d1RPMFZ4b1pRWktYTUVJUlpmOUlXRFhk?=
 =?utf-8?B?Wk1HTUdsSEZRcDlMT1Z5azVWWHNqdVIwdllwMklPMlhTUGRUc2tES3NXQUpm?=
 =?utf-8?B?T0NHUzRsclJRUTVwTlNTa0tOaTF2Rnl2ZEdlMzNQazU0Ujg4UGJZSXVoNlN1?=
 =?utf-8?B?OUk3QnJCb3VoRVlScmhLT0djU3ZjL2VPT1BKeDdoekFoMzRvYVFURXNXcWtk?=
 =?utf-8?B?emU5cjRLeWhSVjR0azZMWHp0TFRoU3RZb1YxZllMWm5wODlQVUlaWTF6UTVZ?=
 =?utf-8?B?SHlwc2s3RWtpQnlSd1JpZEtadHFHL0FQQjNrcGxYRXhTeGZsOUt6NWNzR2xy?=
 =?utf-8?B?ODlsaHl4Z1lkTERoSmNHNHM2Y04rK0k0RmY0akNzM2xZdnBvUFFrNnFLMEdt?=
 =?utf-8?B?YXVVRVN1N2tnS3ZHMUl6M25hQklkUS8xU3VEZDZmZGx6YzBSMWxvTkNMQkNO?=
 =?utf-8?B?ODlZdkFvTm50VEFLdG1TY2wxVWZjVkx3U3lUNWN3N2w1RTlqVkZoOE5NSmVj?=
 =?utf-8?B?TEVBTERTMkhEYkVqc1E3S29SMWlobmFabGpsWmZ1anAyVEtTVmplVDFZWnVR?=
 =?utf-8?B?ZHVTOWZGSFBBdGhDckdNSmxHdVhrSjBlc2YrTmE5K2lBU0N4bFEzTGIvQU1Y?=
 =?utf-8?B?clM1YWxXUTg2VHRsM01LY2Rla0VJSElnVElSQ2RiNGNFZ0FNNmpsYlRnekRQ?=
 =?utf-8?B?di9pQ010S1cyL2dFSHJNQ1puYnRZR0NXVUkzUHdRWHJMZFFQU01WeUZYUm14?=
 =?utf-8?B?QkphK2s4Q0RtcTZMRUdlQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEZBYWhaRm1kNjUxVHVGdUFwQ2hCYjA2MDlQSlYxSGZzL3o4TWZaM3MyVWpE?=
 =?utf-8?B?MzhGakc0VW9JRkdVaWozL2l1K01Tc2tKQkd6cUxNV0hHZ2hBU0lhTWJORFlR?=
 =?utf-8?B?Z28wN2N6NlIwWmV3N2d3ZWVqODEvRnlyZWl5Z040Z3RSbXcyLy91MW84L0hD?=
 =?utf-8?B?SDJJYjU0TXkxaGpZNndwWitlR3JvMHZEaGlad2ZRRkhsQnl1WHpKam1xeC9j?=
 =?utf-8?B?RHRydkM1TmpMRFRpRVFqUHIvSm1HaWRkYnRtQ0Z3UjMydWFTeGt2eDNRYUNm?=
 =?utf-8?B?bG9MZzRTOHgxWHM4QW5SdmI3a3YyVlBqUFY0VkVSeVBXdXB4akYrNkMrSk44?=
 =?utf-8?B?MzhoODJScGU4czUxVVJ3cjMwOHMrUDRybWkzV2VHdWlBTWE2dm0yTWtTS0l1?=
 =?utf-8?B?QndCaytyMElhT1gzc1hoSlZjeENMRGFCV3JQak5ZcjJYRUNPU3FNaEl0V2FV?=
 =?utf-8?B?aDRmVDNORzJULytDd1FtdTloeHFVQ0tWOWlKSU52aEZaSUczdkJqLzMwV2do?=
 =?utf-8?B?U3JFUERZUHVhU2NqOEsxT0oyczhmdGM2bm1XSDZXMlVWQ2NBeW9jdnhhaDA1?=
 =?utf-8?B?elJQYXJqenpqRWxEMEkvaXR4YVJDVHVwc3laUU5UOFBiMTRUUkt6V1FvOEtI?=
 =?utf-8?B?aEkxVGRSdUlHV3Z6alIyWHNSVTZ0VnBwTTRKWEFxeU9NTlRpSjFUZlpHbi9q?=
 =?utf-8?B?SlZpWUUvelZuOFlBMDdBbHFyZXNaS0lQemNrWjRMNHZPZ3A0Qjk1U01GWnhh?=
 =?utf-8?B?TThobnhvdG5lNG5Gc0E3YkdiUVpEVkhpQmRzYmgvaUxPTitJL0NuQjR6YWJG?=
 =?utf-8?B?OFYyeDNsS2Jzcm9LTHdHUVhLbElkd3pSUUc4T2ZxMnJtT0h2SWVzWHl4Y3FH?=
 =?utf-8?B?NHNvRndlTUlYUVJSc2szNFhmZVlQd243RWJ2T0xsSGlmTzI5NHBWcnBiajdX?=
 =?utf-8?B?WFJkL1ZidWlKNFBpWTdSdCtxcFNlQUxaNm0wK2RYbTd2bC9GQmpyQWpFSjZD?=
 =?utf-8?B?YyszMFZZQUlkVjZ6MFZuNUt3ZFp2U0EycmU0amg0NzFab1FKSWNnQzgwU0Na?=
 =?utf-8?B?emxXTHlzY2hUV2lBNXJCcXU3RHJKVktBYkg1enA5YWNYYURsNXZUZCtXL3U0?=
 =?utf-8?B?M3hSbUR0ZmIwNDVWMW5YQ1Y0RDlWeTZhK1NFWWIvcVk1UHlWbWZTZUVkL25C?=
 =?utf-8?B?TE9oRzQ1STVubkN2cStWNzY0V3R6OVhOZzUyRXpDVFlyUUw1SUJDdUJqUjhq?=
 =?utf-8?B?c1JzNHVJcmE2aUtINU8rc3VPNEhaYWdLcTlnMS9GbHBsUWJTdnRmb3l3ZnVU?=
 =?utf-8?B?VGtxcXJ4bUN6VDdXcUJ4bDM4UStFSmd0VXZ5NHFLWmJqYmFIMkY3bDhlckhP?=
 =?utf-8?B?aVVUcFVoMFlGNWNQRFJQZlNGT0xCdjBKbkRlNmRxOEswQ0RUOXRCemhKNncz?=
 =?utf-8?B?UjRpdHBDZlNneUZtWjdNTkNrMUhKVE83Mkd4T2tpdmQ0T2Z4TXFHSXRudWUx?=
 =?utf-8?B?OEducCtaNmNYdkMrNkZBT2tWQ1RLUWs5YS9SM2krVXVyQ3BRbGZYYUV2OEVP?=
 =?utf-8?B?anE4L3M2TmEwQzBIcGJuWnRsZ0huL0VzZ092blM0SEdhVGpNeGVtdnJRWGtp?=
 =?utf-8?B?bmk4U24rVExOWUJqL1A2aXI0aHE0M01jcmtIa1M2SWdwYXhudGZ2eC91U0NW?=
 =?utf-8?B?R0piaGJwSjNZcmU2dzNrYUwvMjNPS3hvRWlDcTRKZUVWWlRhNjVlOVFEd3Rl?=
 =?utf-8?B?Y3ZLNUNGSS9rNXNMOHVhN1N4UTRyeTV5MWZlTlAyTXBxVzRHWU1OekxiaEVR?=
 =?utf-8?B?YW1mdTZMZmg2SmRtSHpoeW10NktjeEVSUkVVb3VIdjBTajRLMTVBSlpoMTdN?=
 =?utf-8?B?MXY0bGZkTXVIUW1wYzR1a0pRNk5ob2tDZFF6K3JQOEtEQjJleHMzV0Zvd0dZ?=
 =?utf-8?B?cWNaRnNrSEswc0M2ZWFqVkZTdkluMkJFcHBDV2s2bmwrMkRUTGZSdHFsaWpp?=
 =?utf-8?B?ZlJkUWhodWdrQ04wWFZTZ0FDZHdGS2tXRDgvaWZTTXZWL1gycDZiSEYwT2l6?=
 =?utf-8?B?MXMwQzRyZUVNM1k5RWhDSnVTdGprVG9ZRjIwRlkzdHVEM3dSelNFNTNhQ3Y4?=
 =?utf-8?Q?HHcro47CG1Z+l4Bnp80PzYjNL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f623ca1f-a14d-4286-8319-08dd2e00d9f3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 03:18:54.9154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6xQaocxiEoDsYmbrhidh/KNUPQZgQ2MIrGkmB3Bu9U2d9eWN6wzYygWzw+gDio6TFdeSWVEwaFXiX1B4wi3Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6913

On 12/29/2024 10:42, Maciej S. Szmigiero wrote:
> Some laptops have pins which are a wake source for S0i3/S3 but which
> aren't a wake source for S4/S5 and which cause issues when left unmasked
> during hibernation (S4).
> 
> For example HP EliteBook 855 G7 has pin #24 that causes instant wakeup
> (hibernation failure) if left unmasked (it is a wake source only for
> S0i3/S3).

On your machine do you know what pin 24 is connected to?

If not, can you run 
https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py 
and share the text report it generates to me?

I'll see if I can make sense in that report what it's most likely 
connected to.

Just want to make sure we're not papering over an issue in another 
component by making this change.

> 
> Fix this by considering a pin a wake source only if it is marked as one
> for the current suspend type (S0i3/S3 vs S4/S5).
> 
> Since I'm not sure if Z-wake pins should be included in either suspend
> category I excluded them from both, so pins with only the Z-wake flag set
> are treated as non-wake pins.

Z only makes sense at runtime.  As long as it's restored to previous 
value after exiting suspend or hibernate that should be totally fine.

> 
> Fixes: 2fff0b5e1a6b ("pinctrl: amd: Mask non-wake source pins with interrupt enabled at suspend")
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> ---
>   drivers/pinctrl/pinctrl-amd.c | 27 +++++++++++++++++++++------
>   drivers/pinctrl/pinctrl-amd.h |  7 +++----
>   2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index fff6d4209ad5..072d44b0fc8c 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -908,12 +908,13 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
>   	return false;
>   }
>   
> -static int amd_gpio_suspend(struct device *dev)
> +static int amd_gpio_suspend_common(struct device *dev, bool is_s03)
>   {
>   	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
>   	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
>   	unsigned long flags;
>   	int i;
> +	u32 wake_mask = is_s03 ? WAKE_SOURCE_S03 : WAKE_SOURCE_S4;
>   
>   	for (i = 0; i < desc->npins; i++) {
>   		int pin = desc->pins[i].number;
> @@ -925,11 +926,11 @@ static int amd_gpio_suspend(struct device *dev)
>   		gpio_dev->saved_regs[i] = readl(gpio_dev->base + pin * 4) & ~PIN_IRQ_PENDING;
>   
>   		/* mask any interrupts not intended to be a wake source */
> -		if (!(gpio_dev->saved_regs[i] & WAKE_SOURCE)) {
> +		if (!(gpio_dev->saved_regs[i] & wake_mask)) {
>   			writel(gpio_dev->saved_regs[i] & ~BIT(INTERRUPT_MASK_OFF),
>   			       gpio_dev->base + pin * 4);
> -			pm_pr_dbg("Disabling GPIO #%d interrupt for suspend.\n",
> -				  pin);
> +			pm_pr_dbg("Disabling GPIO #%d interrupt for %s suspend.\n",
> +				  pin, is_s03 ? "S0idle3/S3" : "S4/S5");
>   		}
>   
>   		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
> @@ -938,6 +939,16 @@ static int amd_gpio_suspend(struct device *dev)
>   	return 0;
>   }
>   
> +static int amd_gpio_suspend_s03(struct device *dev)
> +{
> +	return amd_gpio_suspend_common(dev, true);
> +}
> +
> +static int amd_gpio_suspend_s45(struct device *dev)
> +{
> +	return amd_gpio_suspend_common(dev, false);
> +}
> +
>   static int amd_gpio_resume(struct device *dev)
>   {
>   	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
> @@ -961,8 +972,12 @@ static int amd_gpio_resume(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops amd_gpio_pm_ops = {
> -	SET_LATE_SYSTEM_SLEEP_PM_OPS(amd_gpio_suspend,
> -				     amd_gpio_resume)
> +	.suspend_late = amd_gpio_suspend_s03,
> +	.resume_early = amd_gpio_resume,
> +	.freeze_late = amd_gpio_suspend_s45,
> +	.thaw_early = amd_gpio_resume,
> +	.poweroff_late = amd_gpio_suspend_s45,
> +	.restore_early = amd_gpio_resume,
>   };
>   #endif
>   
> diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
> index 667be49c3f48..8bf9f410d7fb 100644
> --- a/drivers/pinctrl/pinctrl-amd.h
> +++ b/drivers/pinctrl/pinctrl-amd.h
> @@ -80,10 +80,9 @@
>   #define FUNCTION_MASK		GENMASK(1, 0)
>   #define FUNCTION_INVALID	GENMASK(7, 0)
>   
> -#define WAKE_SOURCE	(BIT(WAKE_CNTRL_OFF_S0I3) | \
> -			 BIT(WAKE_CNTRL_OFF_S3)   | \
> -			 BIT(WAKE_CNTRL_OFF_S4)   | \
> -			 BIT(WAKECNTRL_Z_OFF))
> +#define WAKE_SOURCE_S03 (BIT(WAKE_CNTRL_OFF_S0I3) | \
> +			 BIT(WAKE_CNTRL_OFF_S3))
> +#define WAKE_SOURCE_S4  BIT(WAKE_CNTRL_OFF_S4)

Since s03 doesn't make sense and s0i3 is wrong for s3 and s3 is wrong 
for s0i3 as a personal preference I would just call it

WAKE_SOURCE_SUSPEND
WAKE_SOURCE_HIBERNATE


>   
>   struct amd_function {
>   	const char *name;


