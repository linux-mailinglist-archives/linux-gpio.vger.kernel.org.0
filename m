Return-Path: <linux-gpio+bounces-27627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC39C0C318
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 08:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8AE7F4F0BD7
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 07:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC772E426B;
	Mon, 27 Oct 2025 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="jbhO9Dyj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020126.outbound.protection.outlook.com [52.101.84.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD1E2E3B07;
	Mon, 27 Oct 2025 07:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761551494; cv=fail; b=YC+PGjBaw6mSGyybDDp/FYbFoBnXNHToTb2aEZKoKp71jw4SHZQgFKn5vtRlpT+y8JB4Op9eRkYZ1DfDcxy5HKk6Snb/nGZKJzOq7JN89qTAQGgHDxZhijogwRfkbKUq7tN/WmO8xeU5PvWs5hua2I3+s1hmsethyCtibXFdnYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761551494; c=relaxed/simple;
	bh=4Yen1ZXhdjXROeOzId5imV+pTjNm2k0KMLQO+QeGu0k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lg0oOHC3s4ySxgO5ZvuWKDinY6kUFGHkKcluHskZ3YYMEBgkIP6zUL1100M0aN9NWeuDO2f9IBdLaSxLq+43l72TezboJ7IfxCCSibcuDF3WK4gSxP3DdkNSXOfqhEeXmvxKtHRGbxgqwFbtwQ8BJTVWm4AMFITuUWpTACp9C00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=jbhO9Dyj; arc=fail smtp.client-ip=52.101.84.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bim83luZ047WN6T5TezfbTD8MtndWz6QnM0zQH/TzOsKUOAm8J2OlPPxWMekgIw5rS1/HVrfaXGYMvZ+yb4roiZpZapeY0TMSucoJQZSgpxnCr8DJxvPJZVH1sf3azRc9iJ5OaEr5CsTDpDbEYodt4toGRn7maMdl1SIFYtgLcz49dTqKID7lMHxIk922eKuMg9xDMihy1FVhD1Kz4YI8KDMhFFqyUdlk70m3Rk+oM+Cf/NHHHhFzupT8G6QITOKGCKo+0Bys0XRH0yAH+wvB8Qfdlh8aVA6HhWusrslyAbN1Epx250OU9HKWdp5aVnxqemgJyQLiRPZgoglt1yDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhCiY/E6PZdcNuXVge3rG4+wXMo2PY9ChaF0IfvdRJg=;
 b=OZ/d4BAmq3my/FIJd9eIKxFCTXkpabM0gIp028Idk4scrByT4AEkPy4aHzq/vLfw2MDTOfBTsPVAjStytc1re2BuB47JpovLO/q2lW5suNdrmxT7nUuyxjVrjnsI55FlI7aUWPqw8AUhSDz2CyBu/Y1haaDwou26Hq5KfHmfVBtWvR34llAr5reAb7YKahz/5ob/Ysa1VL3tOc6+obKFMkFiIbcUn9Nc6lYeJNuoHQF1aI1ncUeyDlokUzCAoszJYM8QNK0B20FwlO46V7VngJJsxAnaBAVV3Cmn/xdAtJKsnswLrNooU+gh76LbgDVKMrzd0mNUUuqfTQ5wHhqUFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhCiY/E6PZdcNuXVge3rG4+wXMo2PY9ChaF0IfvdRJg=;
 b=jbhO9DyjJlU6a1QP5dZrbAQ14P9ztAtrQfvMv/OKRjd3zKXETpo+7WjR2/oqjNpuAYzdFKmfhWEYkbECORGXCNhHHHlKldqNPKCrQS51sHQQ1Q1uXR1l8s+5ffY/0m9cr9carTxSukGiTB6NQfZbbiPVYs8WRrJEwl8oWGUjkSI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com (2603:10a6:20b:5c1::5)
 by PAXPR02MB7183.eurprd02.prod.outlook.com (2603:10a6:102:1c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 07:51:23 +0000
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714]) by AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 07:51:22 +0000
Message-ID: <bad968a4-37e6-655e-711f-c647becbba5a@axentia.se>
Date: Mon, 27 Oct 2025 08:51:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] gpio: add gpio-line-mux driver
Content-Language: en-US
To: Jonas Jelonek <jelonek.jonas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251026231754.2368904-1-jelonek.jonas@gmail.com>
 <20251026231754.2368904-3-jelonek.jonas@gmail.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20251026231754.2368904-3-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF00003828.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:7) To AS8PR02MB9235.eurprd02.prod.outlook.com
 (2603:10a6:20b:5c1::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9235:EE_|PAXPR02MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 118a6ff6-f20c-4970-c37e-08de152d9f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmU1U1g5UElCaXJWejRHclZ0UzNDOE9hd3dNbDhqTEhVcHE5Z1RWZ3EwOFBh?=
 =?utf-8?B?TzY4SnA3N2ZyM0NaVFdhRGNLc0tsQVdiZVUxNWdOd1grZ0FpRVZyemNOUXFz?=
 =?utf-8?B?Ulc3c2IrWDFVaVVwNEZBdVZ6eWxDKzhHQnc2RkJwNEdQWFk1UUVxWVcwREl5?=
 =?utf-8?B?MVpqRm1QRTI4K2NxNzUzRWlLdU9TTW9hYkt3WGppUjkvNHIzdUNUZnQ1ZUVn?=
 =?utf-8?B?REQzdHNCUHFzTklkWUNaaDd2Q1l6TEc1WVU4K1VJQUExcFhpb3NzK3czQzRG?=
 =?utf-8?B?V2hoeVU1TS95L254V1JYTTJRcFlla3RWQ3Bjd1JYUElldFNqUzlvOE92M1Uw?=
 =?utf-8?B?MjJFSlNsRWJITUl6MUJVcFNubFdYR0w4cWJGUHpXNlltdGcyNUEzWlZDWUFS?=
 =?utf-8?B?OTBsUjR5c1ErUFZDNEVRUzRhdkFCeSt5TzQ5bFJZam5FRUVxSHVMNUpVMkU1?=
 =?utf-8?B?bUZuZ25jZFp0ajZFU2pMcDhWM3E2akQyOVJrOWpKakVMQVMvMkNsdVNhL3NI?=
 =?utf-8?B?RlkrTFZjVExPTitUUUxOWW12OWhqZ3JMcGJtclVtS3NyRWNmVU5iVjhHMGdy?=
 =?utf-8?B?dGlNYkVyaTdWbGo5ajRXTzIxN1doNmdyM0wrenltYi9UZVVLSFFMNDJwWjEr?=
 =?utf-8?B?RGhEQWQxd3ZUcmJadnF5aGp6QnVxZWh2aXBJSWVuYVlnSE03dXBpcWNkTmJY?=
 =?utf-8?B?dCtoZHJoYkRFUSs2SFo4UnFRcUpKMTB6c2QxaDZjNFVqa3cyck5yL1hsV3Zh?=
 =?utf-8?B?ZVFyeXZHS3pDOVZvVHM3NmV6Uk9mMUhmWDdwREhPNlo2ZVdMbE9sWjF3eXZH?=
 =?utf-8?B?RjhhOHEwL0dvN1ZVSWxnamR0dXF6aDQvMU55ZFRVV1hUVGh5MVdsZ3I1Y3NY?=
 =?utf-8?B?MSsxanZ5R2VkZ1ZETDFSVjkrWkx2eWl4NWQyU2ZhcjNoWmYyZ29YREZ4djNx?=
 =?utf-8?B?UjdHZXZFY2lCM0gwVU0xNlZ3Wkd2YUEyV2lobWZ6YmxBWTNxZmRkUmtUbmRM?=
 =?utf-8?B?UlVRNHhyNWEzREZkNWdrQnN6Y1NmYnRCSlpPb1cvT21YZE1PQU5uZFQyVStL?=
 =?utf-8?B?UlU0WVNHL1NOYjc5TUtCV2pKNEhKOVNIeFBOUmlyeDNFazlNbmJuV3VIY2VF?=
 =?utf-8?B?T0VmSGZvWUNkNCtOb3JIekpBWWorMy85eUJ6eVBvaUVKTTNMWW5DSVp2RE8r?=
 =?utf-8?B?aFNCT2hLakc2NStUeEQ2d0FCcVhZT0V5L3JzeVBsdFQ2OXBGUVZybDViMkZo?=
 =?utf-8?B?K28yb0x0amQ4aVljSWtwTVMwY2lVTGJ6Nm5Ea1kyTjlmUHIxc0c3U2lwZ0Rs?=
 =?utf-8?B?eEN6bU80VkNpaWdVcFM5NVdKZjFIM2h5V3ZQTDNFR1hZUkVDTE9CdUhMM1Rs?=
 =?utf-8?B?KzlnUVJSYzg0RGRxTE5hMXhYSXczNlJyallqU2htVHdUUWd0dDZZaTdJTmxX?=
 =?utf-8?B?TjRYZVdNQTljZFdvYjZsVmVSdnZQUVdXbWRKZnR0ek4vbGFwYktqbGF2REc4?=
 =?utf-8?B?MDQvaElOMlN1YXJkejB6dmZHenJLY1lOY0MwSjdFK2ZkdXdFalJzeUpneFF0?=
 =?utf-8?B?Zk5JVjJzNXprdjluYWI5OG4vNEF0YlZFazFJTDdKMmFYZEJQMTZrLzUzN1Nz?=
 =?utf-8?B?Q1BsZWtOSlozeGVBc2NkaDRYU1hlYWdTM3E3TVhpSVRwVUVEeXBXQm5ZSjVp?=
 =?utf-8?B?U3Y3U3ZXcTNxazNzRHFVbkFUYVQxSFBSM25rS2ZZTjhKRm9ZWGFUT1lYR3hL?=
 =?utf-8?B?TERsL0lRY2thV3FjU1hBUWV5YWJ2OHBCSGhTOTlhZHlPcit1QVdNSGl6ck9x?=
 =?utf-8?B?UFlzTlhFYnZEMnRhMXZDODcrSFNzSXkxaUk4bzdGVTNwMWJkbDQ2Z1Q5L056?=
 =?utf-8?B?eC9QclpNUC9UM3ZiUk1iajNXdDBNSGRtaFVQaGZFWlZYZTloYTY1dnpTN3Ju?=
 =?utf-8?Q?ldliX5jUIopdSD578QWdHBNwNXca7lM1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9235.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVB3czNSU3R2NU11VFowMDBZUTZrOVFhU3pUNjBHWjN5dEM2dTlyWk0xVFdv?=
 =?utf-8?B?bURUazZvNFptejBjSm41TmZQc05zRkN4dDI1QmU1bENrU3VlYVZmQWpvcW1B?=
 =?utf-8?B?bUp3cWgrWVk0WmJhVlRwSThoeFViZi9NOXFrTGF6SHg3aVpyYnhjTlVYbmFt?=
 =?utf-8?B?T0FxVktCSE4yTVV5cHRRVVQxVEsrWlNIZ1VIaFA5Q3pjSzBXUXc0ZzRham9W?=
 =?utf-8?B?a0wzeEQzenJZbkhoR1lJeWl2RS9qL3lsRFh0cll6UFdJNS94SEhIUy9KMGxZ?=
 =?utf-8?B?dlZZODkxV0l3c2ZQajIzaFpwUDNNcFdDQkxsekYwZ3MwaW42NjIxam1OelZD?=
 =?utf-8?B?SjJOUFZVT2NEN0lQbEdpVEtBSG5NVXBYMmdDdG9Sdk5jcWtsc25wWE4wSTN0?=
 =?utf-8?B?cXcyV2JBSXM0R3pZWkFFblRJSC83c2lwUE9aTlBjNi9kdmEveFR4M292NWpB?=
 =?utf-8?B?RzJzYTBEYzFZUm1OajFJcmtBdUNPTmt2dVNrYnM3USswdEFPVWQvNkNWZnBj?=
 =?utf-8?B?NStpa3B5WWFDaFNkUFpnTlNwV3pSbXhLOWdVNk9DcU5RTjZOWEN6N1NJalgy?=
 =?utf-8?B?MG5TYUF6ZDEvVDRJRlp5RlJZNTQrL2pnamt1Z3pIb0RzOWoySmUyM1RBeHBv?=
 =?utf-8?B?R0RaS082cVpQTVQxSXc1eHJ1MzB1VTZBc3REUEVXMFNSaXMwLzdWTWN3WTdp?=
 =?utf-8?B?UWc0Nko4RCtFOGFRRTltWDJTeXVwdkpLTUlvV040Q0xqcFNnWnJCakZ5SDIw?=
 =?utf-8?B?NUZYT1ZKNW9WNWVVSlJGNXRkNGt4UkNNVEVvRmpCU05NNCtLdDZNV3RqWjZQ?=
 =?utf-8?B?QTBaY3hGa1RQeGFoaWJpS1Z4d0RGbmJnY2NEU3hpUmxHdVpBcFRtSFBpZGVB?=
 =?utf-8?B?QnRoWjdldzUzZlVseVVxcVlHa1c3YWxSQ3BkQzkzWktoaHhWTHY2Qm0wUlhG?=
 =?utf-8?B?WGl2anRqcTJqUzJaUzV2clNvVURtOW5mYVRvR2x1VHBrMzF3eDhLTjlaWTVa?=
 =?utf-8?B?RzByM1ZKdml3QkpFOWlMVVpyTzRFdHdvdm5ESlZIeEJKRFpkSE82dHQ1ZGVt?=
 =?utf-8?B?ZFdxTTVEQkJDcVJRY0dkZXFhSDBiYkJrVm5OS0gxQTlKckFmRmIyKy9qTlF1?=
 =?utf-8?B?YkNHdEVHZXJXVCt3NmVSY3o5emNyN2phczVFZUp5VGhTZHVXSTZVRk10ZTJX?=
 =?utf-8?B?eE1PWDM5K2V2alpIM0tvamxBeEd4ZUN0TGJHK0N1TkMray9DLyt6OHBNU2NT?=
 =?utf-8?B?RFhqSG5FaEQya0wvUENoSTB5TE5lc1NvV2xSYjMwK01JZFZ1KzR4OUtxcGND?=
 =?utf-8?B?bWdNT3U4RVVtWUNPa1ROOThsVmQ1MFUzUlpKbndMaWY1eDUrbzJQdW81V01D?=
 =?utf-8?B?eTRhNWEwcG1HNVlORVJxRU4rTzF0bFhzNlVMajJ3YU5VNjkxcVNUd2w1UzRT?=
 =?utf-8?B?TkNHdWlLdE5lUW9Ub3JqTTBZMFlONUdYZk9wd3h6S0RpYVJkSCs2Z3FJNXJ5?=
 =?utf-8?B?MEtkZU8ybUdDSHR4Wjl1REptaGVDYy9VcGxSVlQrQ1J3a2dCd1k0YlA4TThZ?=
 =?utf-8?B?QXFPemUwVDZsZ29BRGl2aVQzNmNNOGFHSklNN1dZcDUrMnpzZ1ZuOE1BNUMy?=
 =?utf-8?B?dUs5T1RZaXQrT0txNGc4bkgrNEFrV2o3UVpUeGlJWjlxcHdJdXdQN1R1cVZZ?=
 =?utf-8?B?cVk3angxVnEremNiT3FZbzJTQ09kUnJtRmIvOW5qVVp6WEp3MEY0MzFRNGY3?=
 =?utf-8?B?UGNvVGF2VjFEalBWdUREUHk4dklMVmo1MkJOdnNaR013OU9wREpHMGtBY1h5?=
 =?utf-8?B?Z2ZWMnRZaS9wMjhFN2NsS2U3b08vVkNiOFcyS0RDTWk2S2FqdEF5NnNneU1z?=
 =?utf-8?B?Y242THc2R2w5UEVpM2tDSnE5RFdQZXlmMkFkMjZNSEk4Y0Z0eTEzZ2VMWUxy?=
 =?utf-8?B?ckdQUytKNjNMUGRUdnFNVllEazVMSE15d3hXQ21XWDdtcC9EOUhZeGdEVkd1?=
 =?utf-8?B?NmR4ajUwN29PU3Q0SGtleFYrYXV0WmVUWTZmWEowNWNGUzBTZGJDWjNyakN6?=
 =?utf-8?B?VWNzdkZwWEkvMG00QlAwdklKVWlDa2FFemVCYS9iUlFhSWxVZzlYUk42Yk1j?=
 =?utf-8?Q?gVA4qAlrqu2ssapov9+FyC89D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 118a6ff6-f20c-4970-c37e-08de152d9f75
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 07:51:22.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndW2twlH9xl5mieXtgS/hwYOLL6LkKqUzDITABT6mdueQ+bpOmsY1LV5Rbn6ERKa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7183

Hi!

2025-10-27 at 00:17, Jonas Jelonek wrote:
> Add a new driver which provides a 1-to-many mapping for a single real
> GPIO using a multiplexer. Each virtual GPIO corresponds to a multiplexer
> state which, if set for the multiplexer, connects the real GPIO to the
> corresponding virtual GPIO.
> 
> For now, this doesn't support advanced features like IRQs, just normal
> IN and OUT functionality of GPIOs.
> 
> This can help in various usecases. One practical case is the special
> hardware design of the Realtek-based XS1930-10 switch from Zyxel. It
> features two SFP+ ports/cages whose signals are wired to directly to the
> switch SoC. Although Realtek SoCs are short on GPIOs, there are usually
> enough the fit the SFP signals without any hacks.
> 
> However, Zyxel did some weird design and connected RX_LOS, MOD_ABS and
> TX_FAULT of one SFP cage onto a single GPIO line controlled by a
> multiplexer (the same for the other SFP cage). The single multiplexer
> controls the lines for both SFP and depending on the state, the
> designated 'signal GPIO lines' are connected to one of the three SFP
> signals.
> 
> Because the SFP core/driver doesn't support multiplexer but needs single
> GPIOs for each of the signals, this driver fills the gap between both.
> It registers a gpio_chip, provides multiple virtual GPIOs and sets the
> backing multiplexer accordingly.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>

*snip*

> +static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct gpio_lmux *glm = (struct gpio_lmux *)gpiochip_get_data(gc);
> +	int ret;
> +
> +	if (offset > gc->ngpio)
> +		return -EINVAL;
> +
> +	guard(gpio_lmux)(glm);
> +
> +	ret = mux_control_select(glm->mux, glm->gpio_mux_states[offset]);

Consider using mux_control_select_delay() here, with some suitable
delay, to allow the mux to settle before reading the gpio line.

> +	if (ret < 0)
> +		return ret;
> +
> +	ret = gpiod_get_raw_value_cansleep(glm->shared_gpio);
> +	mux_control_deselect(glm->mux);
> +	return ret;
> +}
> +
> +static int gpio_lmux_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +			      int value)
> +{
> +	struct gpio_lmux *glm = (struct gpio_lmux *)gpiochip_get_data(gc);
> +	int ret;
> +
> +	if (offset > gc->ngpio)
> +		return -EINVAL;
> +
> +	guard(gpio_lmux)(glm);
> +
> +	ret = mux_control_select(glm->mux, glm->gpio_mux_states[offset]);
> +	if (ret < 0)
> +		return ret;
> +
> +	gpiod_set_raw_value_cansleep(glm->shared_gpio, value);
> +	mux_control_deselect(glm->mux);

This .set implementation is completely broken. It you want to
set a gpio to outout high/low, you presumably want the gpio to
stay that way for at least some period of time, while whatever
else happens that relies on the gpio to be in that state. But in
this case only the mux select/deselect is protecting that gpio
state, which is bound to be inadequate for anything real.

Sure, you can probably build something trivial and see that the
gpio can be manipulated, but the second something else touches
the mux, the intended state of an output gpio line is
(potentially) clobbered.

I notice that in your target application, the sfp driver, all
uses of gpios via the mux are inputs. Input is a much easier
problem. At least as long as you do not require IRQ, if you
need IRQs you face similar problems where the mux needs to be
locked in its position for whatever period of time you can
expect IRQs.

TL;DR, this .set implementation needs to be removed, there is
simply no reasonable way to implement a muxed gpio .set in a
pure software driver. You need some hardware to preserve the
state if/when the mux is manipulated.

Cheers,
Peter

> +	return 0;
> +}


