Return-Path: <linux-gpio+bounces-27309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4FBF19E5
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 15:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 053ED423AF6
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 13:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8563F2DCF4D;
	Mon, 20 Oct 2025 13:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b="Ojx4lXoz";
	dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b="NH/021jd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-002c1b01.pphosted.com (mx0a-002c1b01.pphosted.com [148.163.151.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FAF31D750;
	Mon, 20 Oct 2025 13:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.151.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760968070; cv=fail; b=rzGcSGZSEUXYU/pjcZ47CV6JVaTbK0DB4KOTrxIWIXZ8Jpw3ruN3EoK0UOJoZVREXDNpttuwLCOa0WeyUVff94JadHgbydxRqreWo6OjIVxUldkvDYoRIZHlpOMWNoQWF+gVQPoA8bxK53KNpGd6us3wBus83qh7uyyKleImwSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760968070; c=relaxed/simple;
	bh=R/KtTjkZPKAA3SAUEFHHluugzXBY02UtCgBHYe2lsoE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=btJijFRKiR9yZsma5INrXZx7duT7MFKhnnpeAyuDd+t7WSHYX4igCjQn/ATFXOpO0VnFyF8f9K1uNoEWsohra2t/o1IoC9ieiueqG+zft22iBKntvu9FBrZSlhf04cXpxV9B3wGBMQOGBJoCdDfavnZM39DZRdFZgROIehsbdz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nutanix.com; spf=pass smtp.mailfrom=nutanix.com; dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b=Ojx4lXoz; dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b=NH/021jd; arc=fail smtp.client-ip=148.163.151.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nutanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nutanix.com
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
	by mx0a-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59K30HAf1556036;
	Mon, 20 Oct 2025 06:47:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint20171006; bh=Tf9Dlu+aWhs8xtK1N0bfsBxrpTHYZlZxLQCJg69mn
	/o=; b=Ojx4lXozxmbz2X7pA4tYdSxLwLOH5gBVkfUKAuzMGsh6tIUf0tDL92WUY
	18fBTiF31EJ/4beGRVxOkLl4XsuHjAhUvfQmBzv4QMV9hJOxBPxmWLyMMT/rPTRi
	FaRnAV6e6+ydKUFAQvxRjC1kB79ucm3Qz0BsDh0jlMK+Kh1j3S8cmCYOt4mrgkRI
	18n5R9KMnGe2duKVETkD/vcLRkY/5xRV92k9g7Wg3KBo++k7oOcIGUJpyTY/SFwI
	ECzaJtWiVOWyJJlC72hKZ+cgqz55PLxzgzMW6d5RM3EfbtiawWReHaLqsT+qVePb
	9LI2lu617vDrfBuVqngKW414dIH/w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022111.outbound.protection.outlook.com [40.93.195.111])
	by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 49v6t7uc0d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 06:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vw2HHVSoZqfmBY64pKjwUrS6csFH3Nh4+p38Wk2CIfBKCjAeMUQGGWp6XL2EXikl6kLWD+/rLE6TRbLTD3vTc4Z22bBvN6ieELdG/Onqph0DWM8LaH/z4km8VyOje6jkyzl5QqUUtRu+h9Oksvjvs1amZH1WLjL2mYfrLmsPxZqb5WBrudgS0eqPrH+H6nkaQ0X6vdoUV3qHmvlmO7i9KgO2FL75LVMOB37ivN2/BonABBKMkzokMFoeWCKF6CW84NE2SYg2OPMnnBY1i8HlTB0d77F6dBxKserQv3B0r55uBFx2tYcmkyBUqeNZs7cXdet8yFyUnkqoUfJP7LDUtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf9Dlu+aWhs8xtK1N0bfsBxrpTHYZlZxLQCJg69mn/o=;
 b=aWXdnFWIU7WFJ+FThS+J8ndfFZOVRqvRXaaMc/RbI9rk5K0jefFrJ3eGrFPLIpsMNc0rLna3YE7wjjy1wECPi0MgOlMzwOz4zJBvECz27ocT6kNCgMId3MDlpSzYsIlcdyhT893xoJhEUqe43sffwBRR7HgxxQsSj9iz7qh4Y6RfLyonDQVm9syee648J8bupnsLsaoYgXOKLmQGkkhq8XzH8ANY3yqwAMGvVYR2s3vaT2my634sBOkXlZKRSBq29cBA3v6fIrC/tCcj/mcj8y3vPQy6whvZ9xiGPcgVHzBwB44G4sJzxKnpBOw9NJNvIvDiXdHrV34pkDc+ChzgVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf9Dlu+aWhs8xtK1N0bfsBxrpTHYZlZxLQCJg69mn/o=;
 b=NH/021jdwD0hAxM4P0bsLh8GNWrHNRpmkt97EEaP0W6QMGvxrf7RP3OQ8ludNggxFMyr1xPYULXZh7vvivGywW8O+sXx37aOdWTuE9MW0FYiXHP+8mgCvIpW3DG0tLMOckPKZ89jsHrzsVPrXi93CaYtSyNJItDOcvwBDAUyQOZXBS7QAsHYljw7bJkisQB7Ne7X4IiAPzuTkm5xe10j1G0PaxjdG1HYVUja2ZNpxcA+qaCI0Cw2WYcLLwHQpo3TBz0WeP+hI9I/rniOMqgloR99lGhJ0TWdlc4sovc4ull1Kigyxta/0uImhHD5i/tzA35wx4qwfh1/I2LdHW9d8Q==
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by CY8PR02MB9426.namprd02.prod.outlook.com (2603:10b6:930:70::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 13:47:22 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::6cf9:b35c:b143:bb88]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::6cf9:b35c:b143:bb88%3]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 13:47:22 +0000
Message-ID: <a53cb33a-6b3d-4ff3-91fd-0270b96679f5@nutanix.com>
Date: Mon, 20 Oct 2025 14:47:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] gpio: idio-16: Fix regmap initialization errors
To: William Breathitt Gray <wbg@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
Content-Language: en-US
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
In-Reply-To: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0056.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::8) To PH0PR02MB7159.namprd02.prod.outlook.com
 (2603:10b6:510:16::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|CY8PR02MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7e24a5-3b3c-4aae-13d4-08de0fdf3069
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmxoZlY4NGF4VE1XOGwvRUJYTkxQRm9rNXRRNlV3cHl6V2VwS3hMVHZncTJr?=
 =?utf-8?B?bXRyQThsTjkwblBGNWx0ZkIxdjl6L3Y2eFM0RHdlMGNNS3ZVK0tzQktzRUhT?=
 =?utf-8?B?cHdnUCtrak5CZ25XeHVUaUdhV1Vzb2x6UHFLaEZHT2J2N3hEYm5CUFViblBO?=
 =?utf-8?B?SnhKR1cxb3RtUDBwVzBScGtjYlB6QnFSVmtjMzE5NDkyV1dGVG5SZGpjdjlK?=
 =?utf-8?B?TEFTL2xuRjhIVldUdVlJc1lrQ05XNmg1YnFhU1k4ZXpuZk9KYkh4T2FvZGFV?=
 =?utf-8?B?M1YzbGFkTWp0Y1pxbWNxb0NlUHhJSG5zL3lvb2RINE94NjZHbjdEdVg2NkNh?=
 =?utf-8?B?MVE4VU1Sd1BxbDVsT2ZRVkVyMHVZVnNHYW1FZXpCVDI4Mm1jV0pQV1U0MmhG?=
 =?utf-8?B?Sk1RMlB1QndkN2swVnJkRUl0YitxSmozVWgyYTI0cUVxN1JpVUJhQnRSTmkz?=
 =?utf-8?B?Yi9EZzBzUUJGLzdPeG45S1JBUDR0L051RDFTemJjOGUxUVBDcisrdnJReWMx?=
 =?utf-8?B?c2c3aEpBdFZNZGV4UDkxN3NRRVFmS1JrOE9WZXd4V3diby9mUnVkRzFhSWww?=
 =?utf-8?B?UEdMY0VKWWt1Sm81cDl4bXJmbjVERFFWc283Q05BUmRlUXdBRVJGNVdiYXRY?=
 =?utf-8?B?MFljQ2JDSGxYMDlDWW02eURjMEd0TGFMN1pBN3VJSmorcjRVY1ZqN2FwdDEr?=
 =?utf-8?B?ZnlSbTY0dzlCeU5FRmFQLzQvTXcxL0FhRXhDS2xwWnovcjlWT1NWZXVqTkti?=
 =?utf-8?B?bzhqdFpXVTJuRm82bmJXdGdaUUxyVkdINk0vOGYwaHh1ZGNhYnVSUk9XVXdO?=
 =?utf-8?B?ZzB0THkrc3ZTOGc4UTV4RUkvUGU5b1ZKSVhYODJlYTY0SlRRdlFhYTgzZGtM?=
 =?utf-8?B?SnJHcWMramZDQTBIY29QVVR6dTJGSUhQK3ozY1dWa2lGdVRZa1Z1K0c3V2Z4?=
 =?utf-8?B?a2VqZ3E5SHFwNWYrYlphYVN1T1N1NDNsTGIzaTRvOWtET0RWM0o0TXpvQVA5?=
 =?utf-8?B?dXBmSlBhTDE1Q0svdVJYOEpzTXo1bzFWN1dpYXZGM2tvVy9OR2UzV3FOOGt0?=
 =?utf-8?B?YVlSMG1pTUhLeGczelVONURzVjNCSjJZSm4zRTRsQzhKbUtJYVk2MWRYVnlE?=
 =?utf-8?B?eHRWRFg3cVUwRHMrdlMybHNad2RndlpuYS9FS1F0M05lTDNVUG52NXVZWFVF?=
 =?utf-8?B?TEdQYUhUYTlpajdOUXNRMGtRYTMyOWNFeE1uQi9TVnBPUm00amU3Y0xMRnRI?=
 =?utf-8?B?U01wMUpiOVNPa2ZiVUZqSytuRk52M25hVlBVSDBGa2RWN01Ock42MGVXOWNn?=
 =?utf-8?B?OW0ra0ZtOGJ6enVoUEY5cWQ5dUVxcXVxSGliZitsZHVwbGxlN1B4Q2toQ1ls?=
 =?utf-8?B?WFRaQUJCdUxpYlp0RTNjSGNkdHhWaHdPZzVUTm5YWVFENkhZQk5wU21DYXVB?=
 =?utf-8?B?TVdRaHZwV1NrRFNRVGxQYmROY1MrOFBBRm8zM2c4NzYxSDRKOGNOK1hhWmF0?=
 =?utf-8?B?NUQ5OFRPeG1HK280a1RDNDN2VzBQR1owNWEwQVhxSFVXU1pGU0VYWlZEVmhQ?=
 =?utf-8?B?K0dCc0JTNitUMWtidTQ0WWNLZDI5LzBpV0NKTHhBamFac3JpcTRPWkNJYXdr?=
 =?utf-8?B?KzFOSWQySkdZNytOVk90REJhYitpK1pTN0lXZ2YwOVFzSThqMXllOWR1Nmov?=
 =?utf-8?B?eXFnU0pYY2VVUEtZU2IvcVBCc1owaG5KVHdHd2QyUEZ0TmVML1lvMTZBcjAv?=
 =?utf-8?B?WUNhQ2VtMmMwb3g5bklXZkowSUtmUlVzSldDb0ZzVkcxU3NrWERjcmdmNy9B?=
 =?utf-8?B?b2UxQm9HZm9PWXorYUVoQWtRZ1NuZFlyN2FqMHBUOTdKam9yTWc0eXlOTnRB?=
 =?utf-8?B?WW1heDUrSWxwWVNHRkpzTVBWUEFCcjFRVkN0UktKTmpQRWRjNHJYTUFMUFI1?=
 =?utf-8?B?MGpUTm1tZzYxVWtCNDFaZVlGRFJhWE05M2xuQ3VVbDd1RnJPV0R0bWJFTmFk?=
 =?utf-8?B?N3Y3cExOQkxBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUYwL2pPY2VSQzRYY2h5R3Z3b1NNcG92Ykt5RXNxWTRXY0VjQ2tpc0NnaFB0?=
 =?utf-8?B?UmZLZ0xwdXF5am13OG0xL3VLaXJ6dittclNuMVpPSWl0cU1yM21Sb3AxM2Fk?=
 =?utf-8?B?M2F3V0RsdlhTRklzUkl3TkU5K1dDSWUrcGF5MkJybnhyYW5iNndzWFduMlhm?=
 =?utf-8?B?RUFDNVdjTUlTcDNocjlrN3c0NHlBOU9SbUxVSjV2cVc5QlpGenBkanpzcWVp?=
 =?utf-8?B?M3VuUmsvMGxZaFNiN2liN3h4c0Q5cnU1VjVoTTVTVmxuMk5CVU4zSUZnM05i?=
 =?utf-8?B?SnpjQjNnSlJyS1dIS2tyRTIxOHlXY2RCTWRWVzAxaTFoWWJ5cnM4eHc4anlL?=
 =?utf-8?B?ZmhENkFpeGNkZFpRUTJsV3B0eHpBNVAzVmVML1VyME9NOGVURVFOWk5uUVlD?=
 =?utf-8?B?L21Sbi9NLzZ4MWFlR213Q0JQYjRUZlk5MHR5UjlVdWs0U2RvTHFGK29HL3gv?=
 =?utf-8?B?bzBtOS9yWitySUdYeTZtZjZ6TlJuemVwUlFIRmV6WkkrTldkWTRMRGFsY2Vp?=
 =?utf-8?B?Q3JhbGhBTnRCZ1N2VGtSbmpBSnErUDhQeHBDY2w5YjR1cnJhY1c4Ri92Kzh6?=
 =?utf-8?B?aGpab3A1cTAzREJqdFliVHptdEZTYUptVjFDcnFDbWwxQy9IWmtldUFNMU92?=
 =?utf-8?B?UmU5UHk3MWtSUC92aWg3VmhqTHFmbmxYVlJNdmovZnR3TjdqY2FwNVN1TUdz?=
 =?utf-8?B?NG5OMVFqK1ZYRkExdlBVWmliZUdFUGJSR3pDNlFNaDkvU2ExN2ViVWo0WWZH?=
 =?utf-8?B?Y3lsMDd4dzc1S0kwNUp5VVNKU05OREVQakRYYUN6MmpLY1lGN1A3MDNNMmph?=
 =?utf-8?B?MFJTeVhocnpHVGNNdTBveXpCSlRWamVaU1p3VDRNOVpzREdNd0JmQ3gxcENN?=
 =?utf-8?B?L0ltZFpXT0NRVWIvOUcyUGllaXUzblo2b1RBTkYzNW9hZnJDM2JCNUNKaDZJ?=
 =?utf-8?B?b1duc3VsZkV0UlZESHYvMVhOMklMVXB1aFU3ZDRZcFZ2TnpqcllVcGRsTEpN?=
 =?utf-8?B?TkdhK09TdmMrMi9PWnhZUk03V003OEJhOXcwbWtGSjBEWk5wbXBUSU8zd2Fw?=
 =?utf-8?B?SGE2U1hhR2F5NE1Cbi84d1dGTERLRFp2L0g3Z3g0NHYraGE3VFJaOE5IcnZ6?=
 =?utf-8?B?Vjd5cW5WSmpOWXV0dzFxYWhBNjg5NjhTMjd3OFo4NllPNnRDWEFWSmxaZklo?=
 =?utf-8?B?US82dmxKUEFZdVpmZVFIN2lTUktsRXBTWGFObUlWa1RnNDVUenYvZ3lCVEQ3?=
 =?utf-8?B?SysvVkwxR0xtZ3lkOTVZcjRoRkVLV2lZZHNZNHhpMEtSTzlERnE5OCsxZi9a?=
 =?utf-8?B?cFkydFBoV3hwaUVGYWx4eWthUHVSQzkrQ2d3ZHMxVFUvaWhXNGlySG1BNlZZ?=
 =?utf-8?B?WDUxSFZPTUlTVERqenk2SWFMQ0x3K2ROZ2pNQ0RJdEc5V1FPU3lVbVNIVVB2?=
 =?utf-8?B?K05aVEZ3dHVoS01hZUFhOGpTQXVSa2VaMEhLb21qN0JTQWhBa2FKeTBrZU1n?=
 =?utf-8?B?T0RXNUhsWi9sOGVJczJUTzBydUF6VGVPM0V5eGtlZ0JIdFpQbjNzdkUxVDho?=
 =?utf-8?B?aWlLWnYrb1FMWEpoZ2ZLOC8zSVUxbHhvVUdMNzFUZXhSZm5DOGZZSnhmSkZ0?=
 =?utf-8?B?TnR0bjFPL3VRVkNoY1NsMnFEaWdzR1RnN2h5SUppRi91MnJhcGNsQk1memYx?=
 =?utf-8?B?VjBLK2tES3dvU1pLY3ExQ3QrMXNhQXkza1JDRWxYYzhHYU5jc1MybkhJYTdy?=
 =?utf-8?B?QTBHSUt1eTAwdjdFbVBQRmRUU2xOdTFNUVdKUGYxTU5SUEpEQTA0azFhTEdH?=
 =?utf-8?B?VDJ6ZmRSL1kvVVRWWUVncU5ocDQ5RkVrWWNHb1ZmQk1hc3RUV3Z1NDBZVmpJ?=
 =?utf-8?B?cUdpVjhqdjFVSEFZTk5FZ0U3NEhCZExoV3VzelVlYkFoWU8xeml4TkgvN0Jk?=
 =?utf-8?B?b1FySEJhR1Z5Y0IvSzNlUkFpb2oyTWZiaEtGMk9aaVI1RVAyOG5tR3JMVUZh?=
 =?utf-8?B?NVE1Q3MvemZhcldLclRMaXcybmQ5aitJbnRmdndFUXFyYzdjQm1hdUhaK0Z6?=
 =?utf-8?B?THJkWXpGeHhFazlNbktNNExMWFZCUjBWWGVBWFdwMk9na3FnSGFBNGJ0L3Uw?=
 =?utf-8?B?U3ZSSFRoZzU2dnF2WkFWV0dCWVg3R3NzVEZQQW0zT2kycER3ZGpOUmIySVVB?=
 =?utf-8?B?bnJMR0llVDA5NnpLcElRRFdrRjVqcEZTdzFSbVFrMXlhVW81dHFCT1pnQVVa?=
 =?utf-8?B?UTVvYVZiY1BGMHBEV2xnRy8wZUZBPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7e24a5-3b3c-4aae-13d4-08de0fdf3069
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 13:47:22.2364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kcw8Dsk2pOiJiHRErPznNuYh4iMhq4uU7odB9ediWpw3kqmtqFg8DjcHYEc+JxzMtAEE0GzbcNpeD+Gna2MJISIW2MnZsY04XJ6MrbE3tRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR02MB9426
X-Proofpoint-GUID: E5o8TOlqft1NTOQfvqE7_vBsSfMLQ_fg
X-Authority-Analysis: v=2.4 cv=Kb7fcAYD c=1 sm=1 tr=0 ts=68f63d6d cx=c_pps
 a=50WmdcGmutFPi3Fug3z0cA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=0kUYKlekyDsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=64Cc0HZtAAAA:8
 a=nyzDjkV2O-WlWLUd8KkA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: E5o8TOlqft1NTOQfvqE7_vBsSfMLQ_fg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDExNCBTYWx0ZWRfX8jxugizKjsgL
 SwhqdNYpIzsaN9Bnurw4kycfaalkt7goW5Pd4ZREDY86r7E94DqwNe+NxLAeH6sonUaQR1eg99y
 CcAy5gy+FJtq1GWOFOXvpyNCw5u0kxDGYzdD7RbYIMmNdMoBKaqSsvP5gyPDoBruNz8klfzl7wN
 s1abf9laZRJSkkiN03g2xskJjVadSeRlK33C8YnwIUGWbhYSunBncAo0wo7YMKQgPE3soxapKT9
 rILjuHKX7L3frH+S9oy/JOZKtUWoDcTMdm71Es4Mv67PfQqIzp3Rs30Uwkc0+qq3cxFnhbjRLq0
 CwqxiiIBfdYPRFipM2gz4wYCOTua89aXRHuB4W6EqJ+YprfVw72oXWvYIZSe/kQyTsuZQALMnFL
 5dHpv9zBugVAJeHGjA5MQoNMPvI9kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Reason: safe

On 17/10/2025 01:58, William Breathitt Gray wrote:

> The migration of IDIO-16 GPIO drivers to the regmap API resulted in some
> regressions to the gpio-104-idio-16, gpio-pci-idio-16, and gpio-idio-16
> modules. Specifically, the 104-idio-16 and pci-idio-16 GPIO drivers
> utilize regmap caching and thus must set max_register for their
> regmap_config, while gpio-idio-16 requires fixed_direction_output to
> represent the fixed direction of the IDIO-16 GPIO lines. Fixes for these
> regressions are provided by this series.
> 
> Link: https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_r_cover.1680618405.git.william.gray-40linaro.org&d=DwICaQ&c=s883GpUCOChKOHiocYtGcg&r=c23RpsaH4D2MKyD3EPJTDa0BAxz6tV8aUJqVSoytEiY&m=jPr0Xfn4RnLqz8K-AnYL3uVFBDeN1vNtIrFMqrmT_BE2JM3DrvRhmVaaWZ_FAMEI&s=gNMoDpPUYhiozXkA1xYUBX5tmpjg0fiDQC90QRkvRXA&e=
> Link: https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_r_9b0375fd-2D235f-2D4ee1-2Da7fa-2Ddaca296ef6bf-40nutanix.com&d=DwICaQ&c=s883GpUCOChKOHiocYtGcg&r=c23RpsaH4D2MKyD3EPJTDa0BAxz6tV8aUJqVSoytEiY&m=jPr0Xfn4RnLqz8K-AnYL3uVFBDeN1vNtIrFMqrmT_BE2JM3DrvRhmVaaWZ_FAMEI&s=HEyyhsUTLo9USpHvPuhCvAdAykzqkrkRNay7bNDtPaY&e=
> Signed-off-by: William Breathitt Gray <wbg@kernel.org>
> ---
> William Breathitt Gray (3):
>        gpio: 104-idio-16: Define maximum valid register address offset
>        gpio: pci-idio-16: Define maximum valid register address offset
>        gpio: idio-16: Define fixed direction of the GPIO lines
> 
>   drivers/gpio/gpio-104-idio-16.c | 1 +
>   drivers/gpio/gpio-idio-16.c     | 5 +++++
>   drivers/gpio/gpio-pci-idio-16.c | 1 +
>   3 files changed, 7 insertions(+)
> ---
> base-commit: eba11116f39533d2e38cc5898014f2c95f32d23a
> change-id: 20251017-fix-gpio-idio-16-regmap-1282cdc56a19
> 
> Best regards,

Hi William,

Thanks for the patches! I've given them a test here, and everything now 
appears to be working as it should in our test environment:

root@debian12:~# gpioinfo
gpiochip0 - 32 lines:
	line   0:       "OUT0"       unused  output  active-high
	line   1:       "OUT1"       unused  output  active-high
	line   2:       "OUT2"       unused  output  active-high
	line   3:       "OUT3"       unused  output  active-high
	line   4:       "OUT4"       unused  output  active-high
	line   5:       "OUT5"       unused  output  active-high
	line   6:       "OUT6"       unused  output  active-high
	line   7:       "OUT7"       unused  output  active-high
	line   8:       "OUT8"       unused  output  active-high
	line   9:       "OUT9"       unused  output  active-high
	line  10:      "OUT10"       unused  output  active-high
	line  11:      "OUT11"       unused  output  active-high
	line  12:      "OUT12"       unused  output  active-high
	line  13:      "OUT13"       unused  output  active-high
	line  14:      "OUT14"       unused  output  active-high
	line  15:      "OUT15"       unused  output  active-high
	line  16:       "IIN0"       unused   input  active-high
	line  17:       "IIN1"       unused   input  active-high
	line  18:       "IIN2"       unused   input  active-high
	line  19:       "IIN3"       unused   input  active-high
	line  20:       "IIN4"       unused   input  active-high
	line  21:       "IIN5"       unused   input  active-high
	line  22:       "IIN6"       unused   input  active-high
	line  23:       "IIN7"       unused   input  active-high
	line  24:       "IIN8"       unused   input  active-high
	line  25:       "IIN9"       unused   input  active-high
	line  26:      "IIN10"       unused   input  active-high
	line  27:      "IIN11"       unused   input  active-high
	line  28:      "IIN12"       unused   input  active-high
	line  29:      "IIN13"       unused   input  active-high
	line  30:      "IIN14"       unused   input  active-high
	line  31:      "IIN15"       unused   input  active-high

The line directions are correct and I've confirmed that I can set and 
clear outputs and read the corresponding inputs, so from my viewpoint:

Tested-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>


ATB,

Mark.


