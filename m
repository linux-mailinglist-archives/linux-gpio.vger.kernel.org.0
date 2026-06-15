Return-Path: <linux-gpio+bounces-38427-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sPBuJ+RuL2qIAQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38427-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 05:17:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6619B683009
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 05:17:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amlogic.com header.s=selector1 header.b=n6S+PqXa;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38427-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38427-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amlogic.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4A6E3003638
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 03:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE48D279DC3;
	Mon, 15 Jun 2026 03:17:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022072.outbound.protection.outlook.com [52.101.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0515626738B;
	Mon, 15 Jun 2026 03:17:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781493471; cv=fail; b=cIV0r83NfuAF8RmQ1q4lZNBCzgQ4LyO3HuaJLw2jOhQ180TwvfwKNhAcwWdT4pHK5l1yn4KXOjsNVtI2NhItYnByFcN1fxjynKa0T+MQaS5Hl+emwWDol0d42ocoKd8mEzfZjtUaClwLhDWXOGbsLlDAT+9pFwV9YWiWMnldvuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781493471; c=relaxed/simple;
	bh=ACK0LV8H2vIEus+XYefsuLuxa8PjbZGodABaVpLO4P4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EV0oVlm/7KtjCvCA4fh5qdnv1Ju9rqiTuixIryVxJCoJ9yHb9DlwO72fZW+rxHChcaBya2p7WmaFKqog1kz3qyIQue6m4P4+JIrRUweS7y8mItG2X25tm6mbrcBSjysA1JzLdxyqEiefUlr9xCqi8WDDwaI7/CM+cnOde35WfuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=n6S+PqXa; arc=fail smtp.client-ip=52.101.126.72
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=An59WCojwcl4K9Ve4upKQDakRtaUUPUKVlB+ApfSX5ByBJFdAq6t1V8RVd/5V4alV6FnCM9N+jI3RGeTn0gGsjrT5C7YXpgLM5y9NTqQkEkuvxzd9dLwFvEYx+6Ll/G0ROP0zw84L2f1QN77shlDd5PnEhiSC0vrJet13a5r0oFLy2fGxHIbfqSUkKkLyH++Y0ZWrGDONY7pq86HkPglMpzg6mC3pGn4lZwru/RELAdZAFCg2DrK10ii1SFzw/hnZSQiKt5reICN+ifO9A12PBsMPUH4zNGZ85LDG2yxhxsDD6HorghmTVu+QKqoFM+KYrCcscOYoii8uNO3tb0s6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7w6QSWK/VRf0meUYrWL8P3vpu8zRty70t/tG2UjlXs=;
 b=os4KOCFL9Zl43b3vWYWX3QOiHrhlQZsPHTGSm8El8rBCRchMmWnrqQaS2AFFHaPcgVSsI5iHrumsUljYgPXthZ6F/xD8FGiUikMlbhwSHhAaxLAbWMmtdXFeQmPrBbo7YYZ9huDxJ/8L0THLak1eImtPKUo20YMtMQFDIH3TKVqDXyy5yav+/S8/KD09Vu5jEapyK27vvVUAP5+j0knFwajqYLZ0nEzeKQSg+KllTg5XPj+iG/4/PF1tiAU4lCS1P/ELr4/2aeNFd9CaRIRcS0ghUX5qqxUM+kuqvt0enQAjwd+Gk0yobJyxEKRnZwmJKck8OYVjxbwUlzq+98NYJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7w6QSWK/VRf0meUYrWL8P3vpu8zRty70t/tG2UjlXs=;
 b=n6S+PqXavwyPaKhijTuND+cAsXbR9JuVWzfnm5q9mSDdW5rNzfdxcTVBTAvF0rjYj4H3zCHwxqYpv9ZjjiwlPfeW3eGh/PDdlpHqono+BWpniLYY9j3+/34C/7pSeM3xCffCc/pvxy+psoJZR3Jb5SSDzyBH0gzWsz4fzQN0dACavjUT0M+TGR8CxH+n2CMv3PhRcBw5QSF7ynF1qKCEuDQedk3LwH1UFD5gM7Hw5eDAKslNokqAtx0IVbU5hqSc760vI5RhnhKplVgveXz7q4TBr86srDxv8qOJT9NAZNZjLsvqb7XS37LqFHo+VUedyKSSLqfg97VZHn4bdJ+j6g==
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by JH0PR03MB7446.apcprd03.prod.outlook.com (2603:1096:990:1b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 15 Jun
 2026 03:17:46 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0139.009; Mon, 15 Jun 2026
 03:17:45 +0000
Message-ID: <2bb2c0e8-29e1-444b-851b-a9932f547c6a@amlogic.com>
Date: Mon, 15 Jun 2026 11:17:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
Content-Language: en-US
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:295::14) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|JH0PR03MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: bd72f85d-855e-4765-40e9-08deca8cabad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|56012099006|11063799006|5023799004|22082099003|18002099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Elj3K5aTngzJDy9m13G4huts862AmcqunZFcIxwyO7L/dhnyxr+2VI+6cr0dfLZRQ5Mdm3t17STP43hqNri1BE1+AL6t4dz1++ByoM/iyRZYF3vfwEM36VawQL81qt1imW7suu1bYJYsF2OFrXNzUCIJYJXh4uHZ3gFKm9TF5WoF17F2EqYjRsYAR7lQ5Mv9VDHkqEil+TE9B1wheLdxFVojbEblHp6NjwCprHlpL9mqbZCo7DjaXK1PyuXqg/+xBX9/6bt01KoR7bGqQq21sdQ2PjSG4ExFyFt2fQ0jZzGCiSLYztoRLrWB7v5PjtDfn77TAHE+IgXUSYrOmlWFyWvgvXAx7VpJLL7b81RpNxd2adz7OWUpWzf8dZSFnvrJIDxn6n85l70NtkYETEAbHAoK7YE9lWtuuAvqB1mH64BbT/hSvvr+R1LYTUbc0JNynSGlf5BNpOVCZNpOUnDxzuzzu1wHWV4qPFNJtjk8AI8cpbry7qDeczNZRMn2L85g5D52j4WXvwM2vtdiJhr/+vTBD09HRL8WvY2cc11FEGCjFDJvwtC3D8Nf64CStM3yiqpDQvZs4p0wVde/auOv0hqHvnQFZYxkCuK26iuwD45uHzZwERHEDr8/1MB0OXF/48pqwj5dSrYUSX3mTEdU0QiOqOorTToIL0XWfkz84v2ToRlg0L/2/a5Cb9jDPr6/nshHlqmR4nH7LlPSCLsNtw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1VvbWFiZHM0cURQNUpZdUo4dHNVQmlqY1RSQkFXbSt4SHN2RmR1L1pWUGlx?=
 =?utf-8?B?UStFNzNHTlVCQ3UwbzRkbTZ1M3lTUDVUQXo1T1RTSHdzNXp0T1YxeEw3T1pn?=
 =?utf-8?B?Zmp2cS9KSExPUFlUZTRtTHduQW9xUllrK1hKeXZRVzZTZ2lnR09uNzVraGx5?=
 =?utf-8?B?dklCalRkQlVmZ0dNQitWaEExTEt0ZjBUbnNtQktsSFY3Mm5qNldwTHpwME5Q?=
 =?utf-8?B?TzFrSEY3WDVWWnBYWkNtMDk4VCtjdHJEemJWNkZmMXBvRTc3N1crT2xta0xn?=
 =?utf-8?B?NTIrQjhMUGF3R1ZseXRyRW1hSmMrb0tiV0sya3k5eTZuUkNPNGVENG9pZTJw?=
 =?utf-8?B?UzFMR3A0QWN3alZEcnBxSGVxOEd1cXhSczVJTFpXQWFJT01JRitvU3VIZDA1?=
 =?utf-8?B?eHdRRy9OOHBYT3doaWZZSGNnWndnSGF6anBITEkvdGhnV0VqeC83M0xVWFVY?=
 =?utf-8?B?ZmwrMVdZei9WRHBxQU44VFVOUGNsVUQrczNvdE9CT1V4TWxZSFNmRzdyRDRv?=
 =?utf-8?B?UVo3cXZ5M0o5clZBemJMM3ppTkJPQndyTU9DWW52TFNxYi80WFB0RkNseFRh?=
 =?utf-8?B?Wnl2SkJmRmRtT3lMdmxhaWtRODhoMDVYeVZJMmdKSE9Yb2lkMnJZSGNYc01r?=
 =?utf-8?B?VkkwZnhuZjFQYi95OWZvZHRQL1EvNGYvSEkzQmxpWFhHajZVQ09hQWN4YnE4?=
 =?utf-8?B?djNjWkY4R1RMQzNYcG55VGs5Q0psV1ZpU05OQ01GVktBbEtZT1BkWmQ5MkNQ?=
 =?utf-8?B?TGtYRUZOa3hNd2RETzA0TTk2dW53UEhDYmR2NHg3RFk5cmhkaEh3c0F4T1V3?=
 =?utf-8?B?U2ZKQStwaEVTRmRlYjQ2UHhET2Nod1Jhd3pQREZ4N0dseWtnOWRNbGlHZjNv?=
 =?utf-8?B?Z2dXdHlZbWpnYTcwL3B2eVlia1BuT3BCNjY3ZVA4cUFWTFdTWkZxWmxNNDZy?=
 =?utf-8?B?R3dNQkowN2pLdU1xdXhLUUxsa1d2WjVRUVU1bm43L0JQUFNKa013OXRhZkEv?=
 =?utf-8?B?Ym9ZWW9xb3J0WTg2cE9rWnAwRDdreGxKWFVTVHQxVElVbTh5WmcraDBLYXho?=
 =?utf-8?B?NlNRTWlNbGRhU3JvakVBekp4VUVmd2xZc2tya1RLQjVoQmk3bWJ5Q29LKzlB?=
 =?utf-8?B?eHB2R3RSQkNIUWZKbENTcXpWN1BBbVQxQ2pwdEdja0x6R0xUVlE2K0tFQ01Q?=
 =?utf-8?B?S08ydnI2T3diS2hVU3F3VjFsK2N5Z0RIOFFyZUVJNjBqbnNkbGtlQ3VlVUd1?=
 =?utf-8?B?SzEvcGd3VU14YlFPUGxEMVVaV1RkSnRGTUM0Q2tTTXVhQ3JGOVQ3U2o4eTcx?=
 =?utf-8?B?Rk1KUFJ3cDJlQ1FhbzV1OFlablV4OXNmcUZLNGc0UnlwNzl0eGpULzlpSTRI?=
 =?utf-8?B?dkdtR2ZMZVB0Q2g5QU9EQzg3R1FwckFrc3BoYTZZcFNBb1piSVVNNFpaNWVL?=
 =?utf-8?B?Sng2Yi9oN2c3WW9nVUdkVS9Hd1J3dm0zbFYyODZ1STArRkFCUFkwQ3FwVzdi?=
 =?utf-8?B?QzIyNGxlMEQ5bTltZmRYWTVsSUpYMVZ5Sk1TdVVWYis1S0lJbmtkdzNIQm1k?=
 =?utf-8?B?VTR3QmJyNDJCOGFha2U3QjEwWEJHYVNHWkszNkpPMTI0endReXdoZk9Hcnkw?=
 =?utf-8?B?anBWZkdLK3NNUUdudUFGQnA0VVFRYmh0dTVUT0I5UStvOGltQTRoalFwUzRM?=
 =?utf-8?B?Uk9BUTRPNWVXNlpMVUsxU3REU2pneDIxeE5XR0UrTklkZ3BBSTZVVUJBc0JG?=
 =?utf-8?B?SC9xY1pCVndWdGlSZk1uWkxQSWhhUEVDV0ZiRmZLMldXdmtYUGJTWHlJMXZs?=
 =?utf-8?B?aENkUHRmb01tc0FEeGFsR0w4bkpBZ3pVVE5vSU1hcHBhcmxqcXJnY3hnSWlS?=
 =?utf-8?B?TVFXZHVTZGh2bUtQQ2pxZjhjb3puUGQyaHc5d1NUMXVHajB6RU9QOVNyMFZ6?=
 =?utf-8?B?azFhc1lSZXJ2RVFHMThQWEJWenJoZWwzZnZ3ZTdyOU5iQURtRVI5Ukw3VTdl?=
 =?utf-8?B?b0JGWmNLM0lrM1M5MDVuRWlSK2RlTWlrNmU1ZmJoazhzaTg1MSs3cE55N2NN?=
 =?utf-8?B?MG44a05WdWlPZnZ2WEhqaHBEdGsrNnprU1U5SnJaVmtVMzdra09weGNFZm5y?=
 =?utf-8?B?U1EwR3JSRTdIR0JpanRIUzVsWkxZMGVGYllaYnR6K3FxbTMwUFhXQkQ1WExo?=
 =?utf-8?B?RzdhK0hTZGswWm1IaDYweS9lZ04waHZQOGVQMVRHaURQN25LUVdsaVNmRUJk?=
 =?utf-8?B?UHA0NkNGaGplQUpYYXdhaHdKNnNtVmNlUDJNbTJ3SEYzd2ZQTjFnSFpFTitz?=
 =?utf-8?B?M2pvL3JzSmk2TWtrbnp5Q01SZS9NbUwrbE9MdmJPd1lZYTVuWG5uZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd72f85d-855e-4765-40e9-08deca8cabad
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:17:45.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gFzGy9CMHoAABIPiQzoQ3AE+dHnv+92YO9kWEiBKiHv4TZv17jSb/fYD9YUzBacTBC+oWgefZCu0pntoCOGOSubuS1igvc+TnXJ0fy70fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7446
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38427-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[xianwei.zhao@amlogic.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xianwei.zhao@amlogic.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amlogic.com:dkim,amlogic.com:mid,amlogic.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6619B683009

Hi Linus,
    Thank you for your advice and review.

On 2026/6/11 20:51, Linus Walleij wrote:
> Hi Xianwei,
> 
> thanks for your patches!
> 
> On Thu, Jun 11, 2026 at 9:54 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
> 
>> Some users need to obtain an IRQ directly from a GPIO descriptor through gpiod_to_irq().
>> Add the required DT binding and implementation to support this use case.
>> Since this introduces a new DT property, the property is kept optional to
>> maintain compatibility with existing SoCs and DTS files.
> To me it looks like you have just re-implemented hierarchical
> irqs.
> 
> Look into the section "Infrastructure helpers for GPIO irqchips"
> in Documentation/driver-api/gpio/driver.rst, especially towards
> the end.
> 
> Solve this by using GPIOLIB_IRQCHIP and a custom
> child_to_parent_hwirq() callback to translate the GPIO into
> an IRQ.
> 
> To just implement gpiod_to_irq() without any irqchip abstraction
> is also broken: you can't force all users to just use this way
> to get an IRQ it's excessively restricting.
> 
> Add
> 
>    interrupt-controller: true
> 
>    "#interrupt-cells":
>      const: 2
> 
> to the pinctrl node as well so that DT users can simply request
> the IRQ from the irqchip inside of the pin controller. It will
> be hierarchical and lightweight but an irqchip nevertheless.
> 
> The GPIOLIB_IRQCHIP approach will help you to get this
> right.
> 

I read the document (Documentation/driver-api/gpio/driver.rst) you 
pointed me to and found that the corresponding implementation has 
already been added in this file:

https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-meson-gpio.c

However, it is implemented as a standalone irqchip and is not integrated 
with the GPIO controller.

In this patch, I implemented the GPIO-to-IRQ conversion through 
gpiod_to_irq(). Users can still obtain the interrupt directly through 
the interrupt property, for example:

interrupts-extended = <&gpio_intc 16 1>;

The purpose of this change is to make GPIO-to-IRQ conversion easier for 
users who do not want to know the actual interrupt number. The interrupt 
mapping is not fixed and varies between different SoCs, so users should 
not need to handle the hardware interrupt allocation details.


> Yours,
> Linus Walleij

