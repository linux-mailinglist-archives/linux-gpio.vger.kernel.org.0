Return-Path: <linux-gpio+bounces-15856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD86AA327E4
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79AAF18822D1
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 13:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC8D20F066;
	Wed, 12 Feb 2025 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="eYARN+3k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEEA20E6E4;
	Wed, 12 Feb 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739368717; cv=fail; b=Y0vIRsZxKUXk2w8UulojtxL0/yukYRY5nvkTqEmm1vxWOSoHm2ri9Spez337Jyg3cYZ6LDudUCFGJuwtgTEDGJ9CijDKkupKdnGLlcB0lyjHWX4Ld9cc+Zw20NyqXXhU4J5sDQl7QFPJjU6p4W+bVsf0ESRCmaUhGgIRZh3/xp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739368717; c=relaxed/simple;
	bh=e3G2Y2Kb1BAtE3u1ZIA3bm11WtK0hi802KVXsfPjdPM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hy5ALqLP5zC9gS8fCuLtxcub7uGiIk119ZRfiovsvWGdc5Ae4rjzTPaeBzatatJf21iPQJ/39fyYxj2Vl0u+9r7tKVgox2AJ6CuQr7CDPGyxP/gmGe/DRfXi/pcCWKx59GnHqUs7yBzWslA7OPfIdkeLmDqgzWTaXOqwqD2fntU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=eYARN+3k; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CDLEpX031943;
	Wed, 12 Feb 2025 13:47:02 GMT
Received: from ma0pr01cu009.outbound.protection.outlook.com (mail-southindiaazlp17010006.outbound.protection.outlook.com [40.93.131.6])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 44qwtd8sy3-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 13:47:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8CpNZKNAuaBie0QBOjyD6Qx9k+SugSYpOk8xjErb6PUxClEK7ZgWjgPhFkpmy/zjVxhPszjOSCu2NZWkuk4Ie7lNSK4aX6d0mHUKqVbkaGvZyys7SgpG25mfQ41yw7EXc4leTqYzZdlk440fThkZrMuhV9xhBLwzzsJG5FczD3xTyTflXTM3wYGRytAZBcou9No/Z22qZydsO2/27JSlxwrcg0ZECHmkAfOmJA8dlQS/XyCN9WX6Yy6E5xlALU7sXRq8Czo3qirecamV+z3yo1uXnIeeW59zBLbmQN5x6D0lOaFBqD8bVmGdsS6C/IEIoiXCz1heaqMbYzUlhwOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3G2Y2Kb1BAtE3u1ZIA3bm11WtK0hi802KVXsfPjdPM=;
 b=mOZQ1Zui+LiX2sqKL3Wqa/58JwRKbL31EQeXS1r5o5HFOA2l+pWv3Df6jeJn96MZMSNCAc/5HqD19kfeu/8xXv8b35z/RHTLWvgpqqsQmzJvNCfqG26rlH/dHSTVP6rWX51X6yufSMvTEoqK69stilhKcD8wLNpuJkQWy7ct06re8pGVh3Cn6eHOJ1FGDEgeHXcbhBL9PSN4Ng10NPP3kavhNZpInjAkg6kJ/AsEIUXjkhatm5SdUyii2uhPD9H2uN4hH+ybwVpO6Se8EtUjVDSSddHKiQLjsd+7Y1kPqb7+ci+davgW/u5hnELXmJ2NmmV+KC3oWU+dx66KBs6Rtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3G2Y2Kb1BAtE3u1ZIA3bm11WtK0hi802KVXsfPjdPM=;
 b=eYARN+3kPk/OrpHDGc5z7JbvgaDLEh352zi9Sa65UaY2q+LFHTco7QUwzTIvCjZij+mGaI7NROV7mn0F6edUg64VPKNUNdam9C1QqjaY1s/TbkD52nuSAPI9H3MAYrN0h4C/a8OL11+ASGe9t6kjXZx42YCw/y5/aRfYzki9stI=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MA0PR01MB10196.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 13:46:53 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 13:46:53 +0000
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones
	<neil.jones@blaize.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Nikolaos Pasaloukos
	<nikolaos.pasaloukos@blaize.com>
Subject: [PATCH 3/5] gpio: vsiapb: Add VeriSilicon APB support
Thread-Topic: [PATCH 3/5] gpio: vsiapb: Add VeriSilicon APB support
Thread-Index: AQHbfVSSkc1RihSzTkyb8usZH4eeWg==
Date: Wed, 12 Feb 2025 13:46:53 +0000
Message-ID:
 <20250212-kernel-upstreaming-add_gpio_support-v1-3-080e724a21f3@blaize.com>
References:
 <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
In-Reply-To:
 <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|MA0PR01MB10196:EE_
x-ms-office365-filtering-correlation-id: db5f955c-2268-47e1-aa1b-08dd4b6bb53b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MWl5QzU2Tmd3eTNxaE5zWkJZZ1h2d2pFY0V6VjAzMldCWTlxQXlKSVVvMCtj?=
 =?utf-8?B?MmNYVEhEOHQ1R1RxelN1R2tObUE0TStOclUxcDJEOVdRZElTcU1IUU9QU094?=
 =?utf-8?B?Y2YxV0hsWTVMTDIzem1WemlhVkoyQWlpZnJKclNTbXVna0ZpZy9CdjBab3d3?=
 =?utf-8?B?elliVVQxZkFLbDNjQldqNmdwbFMvSVQzdUFLNlFoc05EdEI1VDZMaUR4aHNS?=
 =?utf-8?B?RzRDU041NGJRUVlJT01zRE5wY2pNdUdubjlnU3Zod3hrTXl0NWw0UmVvQ1V3?=
 =?utf-8?B?RFJ0VG4zbkQyaUZTVUpldkFlSDRlL016L3h0c2lKY2NzdlhvUWlLTjFVNjJW?=
 =?utf-8?B?czMvUUdoeXMrSzlocDJ5WVUwNllPT0g0Z2R1dUdTc3ZCbHZZbCs4ZUpWWXRr?=
 =?utf-8?B?RWVZN2cvUElIbWozMEF6eUc0MGtuVHVneDZSSDZoN0l1YXJZWVZhM3QxWmNZ?=
 =?utf-8?B?b2ZrczZGdkNUV3NHdHdlNHYzbmRRWWRCb3FtTDJzekVzMmlUb1lpTDdrNjdl?=
 =?utf-8?B?QzFIa2k5YmgxYzdDUHdEcXAxSE5BUnhuL1p3UVpGaWUrK0p1SkxzYVRvWVZh?=
 =?utf-8?B?VkxpVFBudkhyYVB6dDdldGdEUC9zK2ZOamFqMXdnU3F3Q1g5ZzNoR0xFdzJE?=
 =?utf-8?B?K3BmVU1wTXdja2J4SXVxdEdmR2ZCOHpwenBrSkp6SHo0eFZ4RFJkbCtuU3JE?=
 =?utf-8?B?cTlka0M5bDFyOExkbzl5djZid0FEejZvSEpKN05qUkF3a244a0FFakhOREdN?=
 =?utf-8?B?Y2pnYmFLQXBiY3NqTFIzMEVVdmNzQUpMelhUSnVORlkySlhvQkhpclMzSUYy?=
 =?utf-8?B?VHdadGlKZmIzQTU0a0x5ekZBZkNhYjE5Y0FveUNpWE1oelF1MFN2eGxyWU1l?=
 =?utf-8?B?WFFsOFNMTUxSTDdreXJ0c3BaaXcyc0t1ZlpmWTcxUnA5SDFpK24xbitvMTJi?=
 =?utf-8?B?a2lFT1FhakxTejBUNEp4TitFWFc1czRuSHN6VWhidkdVS0E1bUVIdUk3elJD?=
 =?utf-8?B?NFVDRkRHSm9UcW1pOHRhaGpCR2k4blEvczNnZjk3Nk1tb3FwT3VQaXU5WGpX?=
 =?utf-8?B?MVJjanRCT2ttZnQ4QkthSjJLNHJpU3RtYTVSVXJrSFY2L2dNOUFHVEtiSEhO?=
 =?utf-8?B?blFiaHh4WkNqdmNFTElnTUdSQkFEdklWaGFTbFBCdzlieU5MNHQ2cEpEcGxB?=
 =?utf-8?B?aytFS2N2S0c1aVdGalROMVhwUWk4TnBvbWZFdk9abWVkNStQSnVSZkxoSTB3?=
 =?utf-8?B?SUt6RzlxVm5qajM1T3R5YnRLenU2RlpQalJBOS9ncHVpR3RVUlJZVDlwZVVP?=
 =?utf-8?B?R0ZpTy95WWNrdlBIbit2blY0VjJjeTA2ZkNWcmZyRUFwOS8weVlXM05vMjF2?=
 =?utf-8?B?Q085NUNRck9uWU5XTnNRaTQ3a2xIc0Flb2grakdiN3YreVQ3cVB2UEtzdHFi?=
 =?utf-8?B?YXgyLy9udXYrWWJuUkNrSXRsaWNSazlGVkovQXJuV0ZqbXlCdzljNWtQRVM2?=
 =?utf-8?B?M0RkdFFidUpzMVNuanhsMXdON2lTcXVNZ0IzV1hxTk0zM2d5aWh3emJpYUJq?=
 =?utf-8?B?dXZETDBMeXZkekdBbDNvYXcxRnozS1UraTgydEVNT2FrenYyYXpQUW9mWGdr?=
 =?utf-8?B?M1BKUUpRT3pidFpsQi9xR1pkdFRvRG9qUThMN0xxMzlJbDkrdE1KU3ZLRWFn?=
 =?utf-8?B?dEV0QjUyQWRGZjlXY0RndytKQ0lTT1BTamNoS1czbGFnZ1RNTUlrWHVEQVc5?=
 =?utf-8?B?eGVWbkZhSjd4NFNvaDdmVS9JZ1RRMGpNUWtvTEdKcHVGd05UZUFKSmY3VGl1?=
 =?utf-8?B?c1piY05CM1dFcVNCWDMwZzVETmppdlNQYnFrV0ZuWjlVYUU5ZStMOEZIMzVW?=
 =?utf-8?B?V0x0OTllSFBDdk11WFBLcUJQa0ZCV2gwYXArbHMvVExCSS8ydVNpb1dTaTVG?=
 =?utf-8?B?eDBMdS82RzhEZlV3bXBFa29HbCtHZmZ3ZlVOTHlveDNPc3htMG1qUDgzWitK?=
 =?utf-8?B?MU5QdjE4eWFRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WlUwOVAyRkZ1cXJkZWxuVmxUWk5nZFFGdXpFMmI0a3E3WDZOZElMSXVKNmpt?=
 =?utf-8?B?T2UzelU3T2hBODhFRU9DRE9XOTIzYXNobjRUSHJFeWZNaGJMTkJBaWVITmpw?=
 =?utf-8?B?SVdaZXo4N0JZbVB6ZnpBZGdwUnljdkN1NG5PcUVhWU9JTDBkRE54MWJlTG0y?=
 =?utf-8?B?ZGoxbVVqbmVpZGp6UkxQV1UyOHdaVVNkWjF1aUFBNTA2dzU4bmlFaGhWY25Y?=
 =?utf-8?B?d3hhL0ljdWZyOFZWZ0FKdHJsMzY5NExXSUNtYVdlWEdVZWcvRTBQbzhKUHF2?=
 =?utf-8?B?VFRGQ0VKZ0V4K1NsVFhZMjZ1RUhvK3drNzVaTTZoZDMrR0R0S2xMSkN6dTUr?=
 =?utf-8?B?ZThCSytlUDFpZ05kSGVUT2NlcHFLVTF5Nmw0Q05XYUFHZEE5dHFQSndNQmxO?=
 =?utf-8?B?UDhwK3VXVUs5aTFhWmJRdzFIZEcyN1RjTzVvUmtYc2dmRlJxSHF4bVFzS0xt?=
 =?utf-8?B?a2EzZXE5bVcyNmxnaXdvQmxZK0hqMjYvb3VpR2RoRHNtOUdYK2JwYUZVRk11?=
 =?utf-8?B?bGpNVU1kMzhQRGtGaThrNWZ0eEpJODZtdUtXYnRJMlRKVjByVjJZRTFmKzcw?=
 =?utf-8?B?NVY3a1BneENwVEVYM1lYeGJXMmc3SXBBUnUrR0JUdDdsWjEwRy9hREpaMnZx?=
 =?utf-8?B?MEdCdU8zSWNKQVVmWS9PSnpXWTFsOGFpNkVJdFAxalFlQVVMZXlOeTFUNWh4?=
 =?utf-8?B?bUFTY0dWUnBrdjlnbEQyaitEYktVa2pLRGIzbXpJclZvSGFBQ0x6RHJvU3dF?=
 =?utf-8?B?bTdzZ2NDbFF5YzZlZDhQS0xoRmtvcFVVdnV1dTI5eEROVS8vTDJqWExXSS9h?=
 =?utf-8?B?UnpIenV2ZlYvRk13US8xWGpCZ042eWk2UVNXVFhoNW5kZFJZWGJkMEVQbEIx?=
 =?utf-8?B?OGFTdVZvcU10OXFJRmpadFEwMTRxM09uNlBURVdObzBlTlRVZUdTejZkMVp1?=
 =?utf-8?B?SXBQQlc3bWFWcWJHUlVnd3E3cGl4UmpYZkp4Y0ZFM0phTFdMY3BkSElvYktt?=
 =?utf-8?B?WXJOTDRTODhZalZOMXg1QUNnK1BsOTduYUZ6b0lzQlRGbmRnaDAvdFFwV0Vk?=
 =?utf-8?B?dzB5RmtiVmc4R0lpNnRKdVJDTVB6OTMvR0Nab3owdVBCZVNDVGlVYTJNT2kw?=
 =?utf-8?B?TDJ1R0tLTWFvMGU2K2djTDQvc3BUYnI5SFcwM0pBcS9KNTNwUnkrSVdhV0po?=
 =?utf-8?B?eEgyMXRia2FsYVRET1JVWDJqeFlXWUhTVjkzNnI4TlZ5UDJldXo4VUpqWlJN?=
 =?utf-8?B?NmJXQ2xnYnE3eDlzWk9hbHQrZG5ubHZ2b2Y4dEhrd0NWclJtempLc3VKaDJw?=
 =?utf-8?B?bkkvMU1JVDI5V3M2RzQwUlRwVlBoNUMyRmJUVnQzMVgwRGsvWmFYU0Z0MHQx?=
 =?utf-8?B?WFNuZktydFpCWVgzdzJHWHcwUm1ZZWdLZVh0SnpJcXN0WGlCY0NHM29vdlkv?=
 =?utf-8?B?VWpVamgxZFZKSnE3OFFwZmxXM25Qb1FLejhVL1Q0SThGZkhIZ2JzL2ZDeEdx?=
 =?utf-8?B?dE51OXNwanpHcFJVZFJnNUxLMzVBU1plVVFlNW52emlaWHZibWI0dXdpQWcz?=
 =?utf-8?B?SE5ub0Z4Q1VBbEN0L0hYem9Cb291cjJhZm5Rd2Y3c3BCMjcvWng1TlJnN0xW?=
 =?utf-8?B?ZUJtU25NWGpBOE9YM3J6bG4zcGtIMU5neTdOaTNDWFNuOFVOQ213V2VMRVc5?=
 =?utf-8?B?Y0xqM2xkZHEveDkxNGNnclVKeUtZRFBZQU5FemwvT0NiMmhYTmltdTYyd2pt?=
 =?utf-8?B?SWltK2hDaTZueEt2cUxzMTY3Wnl5Q1Z5OUNmNmloeG5sTENBdkVVUW5xQllT?=
 =?utf-8?B?amZCaXhrWHJORTluYkpZSUV0UC9wOFZFaEZOTUtjUVR2eVJVSVE0L3BPOHdz?=
 =?utf-8?B?TUUyWWJzNGYwQ2NSanp2Qk04Nms3Ky9McXRpUXhRUmR1SWI5cmRITTc3QTVE?=
 =?utf-8?B?dFB3WVhMaTVlMWxnTk5rZXV5WmpzOFNlaG11SitGRDBtWHpadXFlMy9sUUV6?=
 =?utf-8?B?WUd2dUUyVFNSaDlCL1YzTkdPQWROWGt5QUNPT1crMzc0UTdmSUJOVnVSaEZC?=
 =?utf-8?B?VWRWSHd1R1ZMYTRORlVlNmlEM2ZVbFdTWDh0TWVaeGJEbFArVWdXcVNUL2Mx?=
 =?utf-8?B?TjVNVWNWKzdGVm9IdVpZZVpYQjFhU2hCb2xzbXJmUkFJUXpGUElvaGRZeWZq?=
 =?utf-8?B?NHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9AC32A668321648B98ACEA5F607B405@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: db5f955c-2268-47e1-aa1b-08dd4b6bb53b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 13:46:53.0529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 33sM3bsb1ql1snFLqsKxAF+HKP51A88X0y5PAI7hfJKgcHdOZ3srojgHxg0bdhgMrRjYfE+gx5vbMFi2/FxNAb3QB54OO6k10oPFfmHVTJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10196
X-Authority-Analysis: v=2.4 cv=ALxkcdDx c=1 sm=1 tr=0 ts=67aca656 cx=c_pps a=TXs1g+7sIME2BPo3OSn30g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=4MthsM0t3ikA:10
 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=meVymXHHAAAA:8 a=7zgBIyeOD-avykqYQu4A:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=2JgSa4NbpEOStq-L5dxp:22
X-Proofpoint-GUID: rlwsKnRcCmB9K-VPI1FaO2e52uOavU-L
X-Proofpoint-ORIG-GUID: rlwsKnRcCmB9K-VPI1FaO2e52uOavU-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

VmVyaVNpbGljb24gQVBCIHYwLjIgaXMgYSBjdXN0b20gR1BJTyBkZXNpZ24gcHJvdmlkZWQgZnJv
bSBWZXJpU2lsaWNvbg0KTWljcm9lbGVjdHJvbmljcy4gSXQgaGFzIDMyIGlucHV0L291dHB1dCBw
b3J0cyB3aGljaCBjYW4gYmUNCmNvbmZpZ3VyZWQgYXMgZWRnZSBvciBsZXZlbCB0cmlnZ2VyZWQg
aW50ZXJydXB0cy4gSXQgYWxzbyBwcm92aWRlcw0KYSBkZS1ib3VuY2UgZmVhdHVyZS4NCg0KU2ln
bmVkLW9mZi1ieTogTmlrb2xhb3MgUGFzYWxvdWtvcyA8bmlrb2xhb3MucGFzYWxvdWtvc0BibGFp
emUuY29tPg0KLS0tDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgfCAgMTAgKysNCiBkcml2
ZXJzL2dwaW8vS2NvbmZpZyAgICAgICB8ICAgOSArKw0KIGRyaXZlcnMvZ3Bpby9NYWtlZmlsZSAg
ICAgIHwgICAxICsNCiBkcml2ZXJzL2dwaW8vZ3Bpby12c2lhcGIuYyB8IDI4NCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiA0IGZpbGVzIGNoYW5nZWQsIDMw
NCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJT
DQppbmRleCBlYjc1Yzk1ZjZjNDU1NTE2ZjdiMWM4YjNhMzlkZGRlZDViMzhlMGE5Li5hZDc1Zjdk
ZjM3ZDhkNjNlMTQ4NDZlNjU5NjY2MjMwYjEzN2E3ZWExIDEwMDY0NA0KLS0tIGEvTUFJTlRBSU5F
UlMNCisrKyBiL01BSU5UQUlORVJTDQpAQCAtMjUzNDMsNiArMjUzNDMsMTYgQEAgUzoJTWFpbnRh
aW5lZA0KIEY6CURvY3VtZW50YXRpb24vbmV0d29ya2luZy92cmYucnN0DQogRjoJZHJpdmVycy9u
ZXQvdnJmLmMNCiANCitWU0kgQVBCIEdQSU8gRFJJVkVSDQorTToJSmFtZXMgQ293Z2lsbCA8amFt
ZXMuY293Z2lsbEBibGFpemUuY29tPg0KK006CU1hdHQgUmVkZmVhcm4gPG1hdHQucmVkZmVhcm5A
YmxhaXplLmNvbT4NCitNOglOZWlsIEpvbmVzIDxuZWlsLmpvbmVzQGJsYWl6ZS5jb20+DQorTToJ
Tmlrb2xhb3MgUGFzYWxvdWtvcyA8bmlrb2xhb3MucGFzYWxvdWtvc0BibGFpemUuY29tPg0KK0w6
CWxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnDQorUzoJTWFpbnRhaW5lZA0KK0Y6CURvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3ZzaSxhcGItZ3Bpby55YW1sDQorRjoJZHJp
dmVycy9ncGlvL2dwaW8tdnNpYXBiLmMNCisNCiBWU1BSSU5URg0KIE06CVBldHIgTWxhZGVrIDxw
bWxhZGVrQHN1c2UuY29tPg0KIE06CVN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0QGdvb2RtaXMub3Jn
Pg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9LY29uZmlnIGIvZHJpdmVycy9ncGlvL0tjb25m
aWcNCmluZGV4IGFkZDVhZDI5YTY3M2MwOTA4MmE5MTNjYjI0MDQwNzNiMjAzNGFmNDguLjY1NDYw
M2Y3OTBjN2RiMjQ4MTI2NWMyYWI3ZDkwZWVjNGJlNzk4NTYgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dwaW8vS2NvbmZpZw0KKysrIGIvZHJpdmVycy9ncGlvL0tjb25maWcNCkBAIC03NjksNiArNzY5
LDE1IEBAIGNvbmZpZyBHUElPX1ZJU0NPTlRJDQogCWhlbHANCiAJICBTYXkgeWVzIGhlcmUgdG8g
c3VwcG9ydCBHUElPIG9uIFRvaGlzYmEgVmlzY29udGkuDQogDQorY29uZmlnIEdQSU9fVlNJQVBC
DQorCXRyaXN0YXRlICJWZXJpc2lsaWNvbiBBUEIgR1BJTyBzdXBwb3J0Ig0KKwlkZXBlbmRzIG9u
IE9GX0dQSU8NCisJc2VsZWN0IEdQSU9fR0VORVJJQw0KKwlzZWxlY3QgR1BJT0xJQl9JUlFDSElQ
DQorCXNlbGVjdCBJUlFfRE9NQUlOX0hJRVJBUkNIWQ0KKwloZWxwDQorCSAgU2F5IFkgb3IgTSBo
ZXJlIHRvIGFkZCBzdXBwb3J0IGZvciB0aGUgVmVyaXNpbGljb24gQVBCIEdQSU8gZGV2aWNlLg0K
Kw0KIGNvbmZpZyBHUElPX1dDRDkzNFgNCiAJdHJpc3RhdGUgIlF1YWxjb21tIFRlY2hub2xvZ2ll
cyBJbmMgV0NEOTM0MC9XQ0Q5MzQxIEdQSU8gY29udHJvbGxlciBkcml2ZXIiDQogCWRlcGVuZHMg
b24gTUZEX1dDRDkzNFggJiYgT0ZfR1BJTw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9NYWtl
ZmlsZSBiL2RyaXZlcnMvZ3Bpby9NYWtlZmlsZQ0KaW5kZXggYWYzYmE0ZDgxYjU4Mzg0Mjg5M2Vh
NjllNjc3ZmJlMmFiZjMxYmM3Yi4uZjBmMmRkNzExYzg0YjkxNTk0MTgxNTQ0MTk2NjRjN2MxZjI4
MzQwZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3Bpby9NYWtlZmlsZQ0KKysrIGIvZHJpdmVycy9n
cGlvL01ha2VmaWxlDQpAQCAtMTg5LDYgKzE4OSw3IEBAIG9iai0kKENPTkZJR19HUElPX1ZJUEVS
Qk9BUkQpCQkrPSBncGlvLXZpcGVyYm9hcmQubw0KIG9iai0kKENPTkZJR19HUElPX1ZJUlRVU0VS
KQkJKz0gZ3Bpby12aXJ0dXNlci5vDQogb2JqLSQoQ09ORklHX0dQSU9fVklSVElPKQkJKz0gZ3Bp
by12aXJ0aW8ubw0KIG9iai0kKENPTkZJR19HUElPX1ZJU0NPTlRJKQkJKz0gZ3Bpby12aXNjb250
aS5vDQorb2JqLSQoQ09ORklHX0dQSU9fVlNJQVBCKQkJKz0gZ3Bpby12c2lhcGIubw0KIG9iai0k
KENPTkZJR19HUElPX1ZYODU1KQkJKz0gZ3Bpby12eDg1NS5vDQogb2JqLSQoQ09ORklHX0dQSU9f
V0NEOTM0WCkJCSs9IGdwaW8td2NkOTM0eC5vDQogb2JqLSQoQ09ORklHX0dQSU9fV0hJU0tFWV9D
T1ZFKQkJKz0gZ3Bpby13Y292ZS5vDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tdnNp
YXBiLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby12c2lhcGIuYw0KbmV3IGZpbGUgbW9kZSAxMDA2NDQN
CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmRhYjdjNTc5
MjM1MDU4NzI0YTliM2YwN2NlMzAyZWVkNWU0ZjVmY2UNCi0tLSAvZGV2L251bGwNCisrKyBiL2Ry
aXZlcnMvZ3Bpby9ncGlvLXZzaWFwYi5jDQpAQCAtMCwwICsxLDI4NCBAQA0KKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCisvKg0KKyAqIENvcHlyaWdodCAoQykgMjAx
OSBWZXJpU2lsaWNvbiBMaW1pdGVkLg0KKyAqIENvcHlyaWdodCAoQykgMjAyNSBCbGFpemUsIElu
Yy4NCisgKi8NCisNCisjaW5jbHVkZSA8bGludXgvZXJybm8uaD4NCisjaW5jbHVkZSA8bGludXgv
Z3Bpby9kcml2ZXIuaD4NCisjaW5jbHVkZSA8bGludXgvaW5pdC5oPg0KKyNpbmNsdWRlIDxsaW51
eC9pbnRlcnJ1cHQuaD4NCisjaW5jbHVkZSA8bGludXgvaW8uaD4NCisjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+DQorI2luY2x1ZGUgPGxpbnV4L29mLmg+DQorI2luY2x1ZGUgPGxpbnV4L29mX2ly
cS5oPg0KKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCisjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPg0KKyNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5oPg0KKw0KKyNkZWZpbmUgR1BJ
T19ESVJfUkVHCTB4MDANCisjZGVmaW5lIEdQSU9fQ1RSTF9SRUcJMHgwNA0KKyNkZWZpbmUgR1BJ
T19TRVRfUkVHCTB4MDgNCisjZGVmaW5lIEdQSU9fQ0xSX1JFRwkweDBDDQorI2RlZmluZSBHUElP
X09EQVRBX1JFRwkweDEwDQorI2RlZmluZSBHUElPX0lEQVRBX1JFRwkweDE0DQorI2RlZmluZSBH
UElPX0lFTl9SRUcJMHgxOA0KKyNkZWZpbmUgR1BJT19JU19SRUcJMHgxQw0KKyNkZWZpbmUgR1BJ
T19JQkVfUkVHCTB4MjANCisjZGVmaW5lIEdQSU9fSUVWX1JFRwkweDI0DQorI2RlZmluZSBHUElP
X1JJU19SRUcJMHgyOA0KKyNkZWZpbmUgR1BJT19JTV9SRUcJMHgyQw0KKyNkZWZpbmUgR1BJT19N
SVNfUkVHCTB4MzANCisjZGVmaW5lIEdQSU9fSUNfUkVHCTB4MzQNCisjZGVmaW5lIEdQSU9fREJf
UkVHCTB4MzgNCisjZGVmaW5lIEdQSU9fREZHX1JFRwkweDNDDQorDQorI2RlZmluZSBEUklWRVJf
TkFNRSAidnNpYXBiLWdwaW8iDQorDQorc3RydWN0IHZzaWFwYl9ncGlvIHsNCisJdm9pZCBfX2lv
bWVtICpiYXNlOw0KKwlzdHJ1Y3QgZ3Bpb19jaGlwIGdjOw0KKwlpbnQgaXJxOw0KK307DQorDQor
c3RhdGljIGlubGluZSBzdHJ1Y3QgdnNpYXBiX2dwaW8gKmdldF92c2lhcGJfZnJvbV9pcnFfZGF0
YShzdHJ1Y3QgaXJxX2RhdGEgKmQpDQorew0KKwlyZXR1cm4gZ3Bpb2NoaXBfZ2V0X2RhdGEoaXJx
X2RhdGFfZ2V0X2lycV9jaGlwX2RhdGEoZCkpOw0KK30NCisNCitzdGF0aWMgaW5saW5lIHN0cnVj
dCB2c2lhcGJfZ3BpbyAqZ2V0X3ZzaWFwYl9mcm9tX2lycV9kZXNjKHN0cnVjdCBpcnFfZGVzYyAq
ZCkNCit7DQorCXJldHVybiBncGlvY2hpcF9nZXRfZGF0YShpcnFfZGVzY19nZXRfaGFuZGxlcl9k
YXRhKGQpKTsNCit9DQorDQorc3RhdGljIGlubGluZSB1MzIgdnNpYXBiX2dwaW9fcmVhZChzdHJ1
Y3QgdnNpYXBiX2dwaW8gKmNoaXAsIHVuc2lnbmVkIGludCBvZmZzZXQpDQorew0KKwlyZXR1cm4g
cmVhZGxfcmVsYXhlZChjaGlwLT5iYXNlICsgb2Zmc2V0KTsNCit9DQorDQorc3RhdGljIGlubGlu
ZSB2b2lkIHZzaWFwYl9ncGlvX3dyaXRlKHN0cnVjdCB2c2lhcGJfZ3BpbyAqY2hpcCwgdW5zaWdu
ZWQgaW50IG9mZnNldCwgdTMyIHZhbCkNCit7DQorCXdyaXRlbF9yZWxheGVkKHZhbCwgY2hpcC0+
YmFzZSArIG9mZnNldCk7DQorfQ0KKw0KK3N0YXRpYyBpbmxpbmUgdm9pZCB2c2lhcGJfZ3Bpb19y
bXcodm9pZCBfX2lvbWVtICpyZWcsIHUzMiBtYXNrLCBib29sIHNldCkNCit7DQorCXUzMiB2YWwg
PSByZWFkbF9yZWxheGVkKHJlZyk7DQorDQorCWlmIChzZXQpDQorCQl2YWwgfD0gbWFzazsNCisJ
ZWxzZQ0KKwkJdmFsICY9IH5tYXNrOw0KKw0KKwl3cml0ZWxfcmVsYXhlZCh2YWwsIHJlZyk7DQor
fQ0KKw0KK3N0YXRpYyB2b2lkIHZzaWFwYl9ncGlvX2lycV9tYXNrKHN0cnVjdCBpcnFfZGF0YSAq
ZCkNCit7DQorCXN0cnVjdCB2c2lhcGJfZ3BpbyAqY2hpcCA9IGdldF92c2lhcGJfZnJvbV9pcnFf
ZGF0YShkKTsNCisNCisJZ3VhcmQocmF3X3NwaW5sb2NrX2lycXNhdmUpKCZjaGlwLT5nYy5iZ3Bp
b19sb2NrKTsNCisJdnNpYXBiX2dwaW9fcm13KGNoaXAtPmJhc2UgKyBHUElPX0lNX1JFRywgQklU
KGQtPmh3aXJxKSwgMSk7DQorfQ0KKw0KK3N0YXRpYyB2b2lkIHZzaWFwYl9ncGlvX2lycV91bm1h
c2soc3RydWN0IGlycV9kYXRhICpkKQ0KK3sNCisJc3RydWN0IHZzaWFwYl9ncGlvICpjaGlwID0g
Z2V0X3ZzaWFwYl9mcm9tX2lycV9kYXRhKGQpOw0KKw0KKwlndWFyZChyYXdfc3BpbmxvY2tfaXJx
c2F2ZSkoJmNoaXAtPmdjLmJncGlvX2xvY2spOw0KKwl2c2lhcGJfZ3Bpb19ybXcoY2hpcC0+YmFz
ZSArIEdQSU9fSU1fUkVHLCBCSVQoZC0+aHdpcnEpLCAwKTsNCit9DQorDQorc3RhdGljIHZvaWQg
dnNpYXBiX2dwaW9faXJxX2FjayhzdHJ1Y3QgaXJxX2RhdGEgKmQpDQorew0KKwlzdHJ1Y3QgdnNp
YXBiX2dwaW8gKmNoaXAgPSBnZXRfdnNpYXBiX2Zyb21faXJxX2RhdGEoZCk7DQorDQorCXZzaWFw
Yl9ncGlvX3dyaXRlKGNoaXAsIEdQSU9fSUNfUkVHLCBCSVQoZC0+aHdpcnEpKTsNCit9DQorDQor
c3RhdGljIHZvaWQgdnNpYXBiX2dwaW9faXJxX2VuYWJsZShzdHJ1Y3QgaXJxX2RhdGEgKmQpDQor
ew0KKwlzdHJ1Y3QgdnNpYXBiX2dwaW8gKmNoaXAgPSBnZXRfdnNpYXBiX2Zyb21faXJxX2RhdGEo
ZCk7DQorDQorCWdwaW9jaGlwX2VuYWJsZV9pcnEoJmNoaXAtPmdjLCBpcnFkX3RvX2h3aXJxKGQp
KTsNCisNCisJZ3VhcmQocmF3X3NwaW5sb2NrX2lycXNhdmUpKCZjaGlwLT5nYy5iZ3Bpb19sb2Nr
KTsNCisJdnNpYXBiX2dwaW9fcm13KGNoaXAtPmJhc2UgKyBHUElPX0RJUl9SRUcsIEJJVChkLT5o
d2lycSksIDApOw0KKwl2c2lhcGJfZ3Bpb19ybXcoY2hpcC0+YmFzZSArIEdQSU9fSUVOX1JFRywg
QklUKGQtPmh3aXJxKSwgMSk7DQorfQ0KKw0KK3N0YXRpYyB2b2lkIHZzaWFwYl9ncGlvX2lycV9k
aXNhYmxlKHN0cnVjdCBpcnFfZGF0YSAqZCkNCit7DQorCXN0cnVjdCB2c2lhcGJfZ3BpbyAqY2hp
cCA9IGdldF92c2lhcGJfZnJvbV9pcnFfZGF0YShkKTsNCisNCisJZ3VhcmQocmF3X3NwaW5sb2Nr
X2lycXNhdmUpKCZjaGlwLT5nYy5iZ3Bpb19sb2NrKTsNCisJdnNpYXBiX2dwaW9fcm13KGNoaXAt
PmJhc2UgKyBHUElPX0lFTl9SRUcsIEJJVChkLT5od2lycSksIDApOw0KKwlncGlvY2hpcF9kaXNh
YmxlX2lycSgmY2hpcC0+Z2MsIGlycWRfdG9faHdpcnEoZCkpOw0KK30NCisNCitzdGF0aWMgaW50
IHZzaWFwYl9ncGlvX2lycV9zZXRfdHlwZShzdHJ1Y3QgaXJxX2RhdGEgKmQsIHUzMiB0eXBlKQ0K
K3sNCisJc3RydWN0IHZzaWFwYl9ncGlvICpjaGlwID0gZ2V0X3ZzaWFwYl9mcm9tX2lycV9kYXRh
KGQpOw0KKwl1MzIgZWRnZV9sZXZlbCwgc2luZ2xlX2JvdGgsIGZhbGxfcmlzZTsNCisJaW50IG1h
c2sgPSBCSVQoZC0+aHdpcnEpOw0KKw0KKwlndWFyZChyYXdfc3BpbmxvY2tfaXJxc2F2ZSkoJmNo
aXAtPmdjLmJncGlvX2xvY2spOw0KKwllZGdlX2xldmVsID0gdnNpYXBiX2dwaW9fcmVhZChjaGlw
LCBHUElPX0lTX1JFRyk7DQorCXNpbmdsZV9ib3RoID0gdnNpYXBiX2dwaW9fcmVhZChjaGlwLCBH
UElPX0lCRV9SRUcpOw0KKwlmYWxsX3Jpc2UgPSB2c2lhcGJfZ3Bpb19yZWFkKGNoaXAsIEdQSU9f
SUVWX1JFRyk7DQorDQorCXN3aXRjaCAodHlwZSkgew0KKwljYXNlIElSUV9UWVBFX0VER0VfQk9U
SDoNCisJCWVkZ2VfbGV2ZWwgJj0gfm1hc2s7DQorCQlzaW5nbGVfYm90aCB8PSBtYXNrOw0KKwkJ
YnJlYWs7DQorCWNhc2UgSVJRX1RZUEVfRURHRV9SSVNJTkc6DQorCQllZGdlX2xldmVsICY9IH5t
YXNrOw0KKwkJc2luZ2xlX2JvdGggJj0gfm1hc2s7DQorCQlmYWxsX3Jpc2UgfD0gbWFzazsNCisJ
CWJyZWFrOw0KKwljYXNlIElSUV9UWVBFX0VER0VfRkFMTElORzoNCisJCWVkZ2VfbGV2ZWwgJj0g
fm1hc2s7DQorCQlzaW5nbGVfYm90aCAmPSB+bWFzazsNCisJCWZhbGxfcmlzZSAmPSB+bWFzazsN
CisJCWJyZWFrOw0KKwljYXNlIElSUV9UWVBFX0xFVkVMX0hJR0g6DQorCQllZGdlX2xldmVsIHw9
IG1hc2s7DQorCQlmYWxsX3Jpc2UgfD0gbWFzazsNCisJCWJyZWFrOw0KKwljYXNlIElSUV9UWVBF
X0xFVkVMX0xPVzoNCisJCWVkZ2VfbGV2ZWwgfD0gbWFzazsNCisJCWZhbGxfcmlzZSAmPSB+bWFz
azsNCisJCWJyZWFrOw0KKwlkZWZhdWx0Og0KKwkJcmV0dXJuIC1FSU5WQUw7DQorCX0NCisNCisJ
dnNpYXBiX2dwaW9fd3JpdGUoY2hpcCwgR1BJT19JU19SRUcsIGVkZ2VfbGV2ZWwpOw0KKwl2c2lh
cGJfZ3Bpb193cml0ZShjaGlwLCBHUElPX0lCRV9SRUcsIHNpbmdsZV9ib3RoKTsNCisJdnNpYXBi
X2dwaW9fd3JpdGUoY2hpcCwgR1BJT19JRVZfUkVHLCBmYWxsX3Jpc2UpOw0KKw0KKwlpZiAodHlw
ZSAmIElSUV9UWVBFX0xFVkVMX01BU0spDQorCQlpcnFfc2V0X2hhbmRsZXJfbG9ja2VkKGQsIGhh
bmRsZV9sZXZlbF9pcnEpOw0KKwllbHNlDQorCQlpcnFfc2V0X2hhbmRsZXJfbG9ja2VkKGQsIGhh
bmRsZV9lZGdlX2lycSk7DQorDQorCXJldHVybiAwOw0KK30NCisNCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IGlycV9jaGlwIHZzaWFwYl9ncGlvX2lycWNoaXAgPSB7DQorCS5uYW1lID0gRFJJVkVSX05B
TUUsDQorCS5pcnFfYWNrID0gdnNpYXBiX2dwaW9faXJxX2FjaywNCisJLmlycV9tYXNrID0gdnNp
YXBiX2dwaW9faXJxX21hc2ssDQorCS5pcnFfdW5tYXNrID0gdnNpYXBiX2dwaW9faXJxX3VubWFz
aywNCisJLmlycV9zZXRfdHlwZSA9IHZzaWFwYl9ncGlvX2lycV9zZXRfdHlwZSwNCisJLmlycV9l
bmFibGUgPSB2c2lhcGJfZ3Bpb19pcnFfZW5hYmxlLA0KKwkuaXJxX2Rpc2FibGUgPSB2c2lhcGJf
Z3Bpb19pcnFfZGlzYWJsZSwNCisJLmZsYWdzID0gSVJRQ0hJUF9JTU1VVEFCTEUgfCBJUlFDSElQ
X01BU0tfT05fU1VTUEVORCwNCisJR1BJT0NISVBfSVJRX1JFU09VUkNFX0hFTFBFUlMsDQorfTsN
CisNCitzdGF0aWMgdm9pZCB2c2lhcGJfZ3Bpb19pcnFoYW5kbGVyKHN0cnVjdCBpcnFfZGVzYyAq
ZGVzYykNCit7DQorCXN0cnVjdCB2c2lhcGJfZ3BpbyAqZ3BpbyA9IGdldF92c2lhcGJfZnJvbV9p
cnFfZGVzYyhkZXNjKTsNCisJc3RydWN0IGlycV9jaGlwICppcnFjaGlwID0gaXJxX2Rlc2NfZ2V0
X2NoaXAoZGVzYyk7DQorCXVuc2lnbmVkIGxvbmcgaXJxX3N0YXR1czsNCisJaW50IGh3aXJxID0g
MDsNCisNCisJY2hhaW5lZF9pcnFfZW50ZXIoaXJxY2hpcCwgZGVzYyk7DQorCWlycV9zdGF0dXMg
PSB2c2lhcGJfZ3Bpb19yZWFkKGdwaW8sIEdQSU9fUklTX1JFRyk7DQorCWZvcl9lYWNoX3NldF9i
aXQoaHdpcnEsICZpcnFfc3RhdHVzLCBncGlvLT5nYy5uZ3BpbykNCisJCWdlbmVyaWNfaGFuZGxl
X2RvbWFpbl9pcnEoZ3Bpby0+Z2MuaXJxLmRvbWFpbiwgaHdpcnEpOw0KKw0KKwljaGFpbmVkX2ly
cV9leGl0KGlycWNoaXAsIGRlc2MpOw0KK30NCisNCitzdGF0aWMgaW50IHZzaWFwYl9ncGlvX3Nl
dF9kZWJvdW5jZShzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IG9mZnNldCwNCisJ
CQkJICAgIHVuc2lnbmVkIGludCBkZWJvdW5jZSkNCit7DQorCXN0cnVjdCB2c2lhcGJfZ3BpbyAq
Y2hpcCA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsNCisNCisJZ3VhcmQocmF3X3NwaW5sb2NrX2ly
cXNhdmUpKCZjaGlwLT5nYy5iZ3Bpb19sb2NrKTsNCisJdnNpYXBiX2dwaW9fcm13KGNoaXAtPmJh
c2UgKyBHUElPX0RCX1JFRywgQklUKG9mZnNldCksIGRlYm91bmNlKTsNCisNCisJcmV0dXJuIDA7
DQorfQ0KKw0KK3N0YXRpYyBpbnQgdnNpYXBiX2dwaW9fc2V0X2NvbmZpZyhzdHJ1Y3QgZ3Bpb19j
aGlwICpnYywgdW5zaWduZWQgaW50IG9mZnNldCwgdW5zaWduZWQgbG9uZyBjb25maWcpDQorew0K
Kwl1MzIgZGVib3VuY2U7DQorDQorCWlmIChwaW5jb25mX3RvX2NvbmZpZ19wYXJhbShjb25maWcp
ICE9IFBJTl9DT05GSUdfSU5QVVRfREVCT1VOQ0UpDQorCQlyZXR1cm4gLUVOT1RTVVBQOw0KKw0K
KwlkZWJvdW5jZSA9IHBpbmNvbmZfdG9fY29uZmlnX2FyZ3VtZW50KGNvbmZpZyk7DQorCXJldHVy
biB2c2lhcGJfZ3Bpb19zZXRfZGVib3VuY2UoZ2MsIG9mZnNldCwgZGVib3VuY2UpOw0KK30NCisN
CitzdGF0aWMgaW50IHZzaWFwYl9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQorew0KKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsN
CisJc3RydWN0IHZzaWFwYl9ncGlvICpjaGlwOw0KKwlzdHJ1Y3QgZ3Bpb19jaGlwICpnYzsNCisJ
aW50IHJldDsNCisNCisJY2hpcCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmNo
aXApLCBHRlBfS0VSTkVMKTsNCisJaWYgKCFjaGlwKQ0KKwkJcmV0dXJuIC1FTk9NRU07DQorDQor
CWNoaXAtPmJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7DQor
CWlmIChJU19FUlIoY2hpcC0+YmFzZSkpDQorCQlyZXR1cm4gUFRSX0VSUihjaGlwLT5iYXNlKTsN
CisNCisJcmV0ID0gYmdwaW9faW5pdCgmY2hpcC0+Z2MsICZwZGV2LT5kZXYsIDQsIGNoaXAtPmJh
c2UgKyBHUElPX0lEQVRBX1JFRywNCisJCQkgY2hpcC0+YmFzZSArIEdQSU9fU0VUX1JFRywgY2hp
cC0+YmFzZSArIEdQSU9fQ0xSX1JFRywNCisJCQkgY2hpcC0+YmFzZSArIEdQSU9fRElSX1JFRywg
TlVMTCwgMCk7DQorCWlmIChyZXQpDQorCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2
LCByZXQsICJGYWlsZWQgdG8gcmVnaXN0ZXIgZ2VuZXJpYyBncGlvXG4iKTsNCisNCisJLyogY29u
ZmlndXJlIHRoZSBncGlvIGNoaXAgKi8NCisJZ2MgPSAmY2hpcC0+Z2M7DQorCWdjLT5vd25lciA9
IFRISVNfTU9EVUxFOw0KKwlnYy0+c2V0X2NvbmZpZyA9IHZzaWFwYl9ncGlvX3NldF9jb25maWc7
DQorDQorCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwgImludGVycnVwdC1jb250cm9s
bGVyIikpIHsNCisJCXN0cnVjdCBncGlvX2lycV9jaGlwICpnaXJxOw0KKw0KKwkJY2hpcC0+aXJx
ID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCisJCWlmIChjaGlwLT5pcnEgPCAwKQ0KKwkJ
CXJldHVybiBjaGlwLT5pcnE7DQorDQorCQlnaXJxID0gJmdjLT5pcnE7DQorCQlncGlvX2lycV9j
aGlwX3NldF9jaGlwKGdpcnEsICZ2c2lhcGJfZ3Bpb19pcnFjaGlwKTsNCisJCWdpcnEtPnBhcmVu
dF9oYW5kbGVyID0gdnNpYXBiX2dwaW9faXJxaGFuZGxlcjsNCisJCWdpcnEtPm51bV9wYXJlbnRz
ID0gMTsNCisJCWdpcnEtPnBhcmVudHMgPSBkZXZtX2tjYWxsb2MoJnBkZXYtPmRldiwgMSwgc2l6
ZW9mKCpnaXJxLT5wYXJlbnRzKSwgR0ZQX0tFUk5FTCk7DQorCQlpZiAoIWdpcnEtPnBhcmVudHMp
DQorCQkJcmV0dXJuIC1FTk9NRU07DQorDQorCQlnaXJxLT5wYXJlbnRzWzBdID0gY2hpcC0+aXJx
Ow0KKwkJZ2lycS0+ZGVmYXVsdF90eXBlID0gSVJRX1RZUEVfTk9ORTsNCisJfQ0KKw0KKwlyZXR1
cm4gZGV2bV9ncGlvY2hpcF9hZGRfZGF0YSgmcGRldi0+ZGV2LCBnYywgY2hpcCk7DQorfQ0KKw0K
K3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHZzaWFwYl9vZl9tYXRjaFtdID0gew0K
Kwl7IC5jb21wYXRpYmxlID0gInZzaSxhcGItZ3Bpby0wLjIiLCB9LA0KKwl7IC8qIFNlbnRpbmVs
ICovIH0sDQorfTsNCitNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCB2c2lhcGJfb2ZfbWF0Y2gpOw0K
Kw0KK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHZzaWFwYl9ncGlvX2RyaXZlciA9IHsN
CisJLmRyaXZlcgkJPSB7DQorCQkubmFtZQk9IERSSVZFUl9OQU1FLA0KKwkJLm9mX21hdGNoX3Rh
YmxlID0gb2ZfbWF0Y2hfcHRyKHZzaWFwYl9vZl9tYXRjaCksDQorCX0sDQorCS5wcm9iZQkJPSB2
c2lhcGJfZ3Bpb19wcm9iZSwNCit9Ow0KKw0KK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIodnNpYXBi
X2dwaW9fZHJpdmVyKTsNCisNCitNT0RVTEVfQVVUSE9SKCJOaWtvbGFvcyBQYXNhbG91a29zIDxu
aWtvbGFvcy5wYXNhbG91a29zQGJsYWl6ZS5jb20+Iik7DQorTU9EVUxFX0RFU0NSSVBUSU9OKCJW
ZXJpc2lsaWNvbiBBUEIgR1BJTyBkcml2ZXIiKTsNCitNT0RVTEVfTElDRU5TRSgiR1BMIik7DQoN
Ci0tIA0KMi40My4wDQoNCg==

