Return-Path: <linux-gpio+bounces-18839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582EFA899E4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 12:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 554BA7A3662
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A69528DF0F;
	Tue, 15 Apr 2025 10:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="mdaiMj47"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2128.outbound.protection.outlook.com [40.107.255.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB1827FD68;
	Tue, 15 Apr 2025 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712627; cv=fail; b=TYTEgzCp62dlOH3nrSQs81TWwsctU090jcZX6egt5vrmYX8RQKfQhFLnug68AcQLNU7ngpngtnYAHb5X1b6vJJI5iWkdcis4i0+5CSV7o4XrS8WR18kRr5T5+RJLwT64Pmg2LePBpxQNX8IqhdGe149wuTXn1D2yxC/vNbf9tOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712627; c=relaxed/simple;
	bh=D4AOTUIbSqN6YXvvQCLcm91hakbTY5dO3+ptfyGSuA0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YZLLbCI3OpDTVIqW+SFNcb94wTJZoJUnH4Ku9G+2Xvle3gSPsEP3rGWyB7/EG+HOcO2spyF8Xg0aOV5tgEmVpGLC61onB5diLF7gMiqrzttVUoGuc9+1eeooxkFvbk5QRvCqC/K8phWT+HpRxRLty07sZLmyns/YxSy+MFH7GNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=mdaiMj47; arc=fail smtp.client-ip=40.107.255.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMRWso0OUBaYFXWGdQ6uCP8NTWUjyQNXrBFWtnMPj4ImDALwMAUIJDx4AdBncfStjcwtIceHCBZSFBButoyZLRMi6I9lfIft1a4sjW9F8ua/Iz0/HirrSHESVzAitPbAGNtiI/bVasr8ivTgbQ5T75gf4BqarjhFF5f/JC8kyf660If+pQ6zwMJ0Nks6YjIjuV4OoyMVH0q5kcutFVppRjcWyO6+BBhbIgf/m/EO8g/NrvJ0G02EEM9EupMX5/SoeAo3ulgb+dj3M7kZ/CKaylFN2iPuH7YGE7OKKK04ptmJvzJslkp0k5deLGpY7DVH1UF8MMIodfbIBUHo6X04NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UP5UpMTBO//Zk19oEG1+bx8VpIDCQOJuq+cv51oGSDg=;
 b=AuEWDI9Zv8exo/7jtJ61MEAX7FTs3Lsnjofgbx9GIgmPhxcMgeIW0yehNRBsy3PEyx5CrgOzFO+1IlHGXajtjk51BWu0A6PDyMCqJM5uQWujrn1weUDndVMQnT3OPvjfDMxe8qR/6H/GUeT4993SbVpD3MrzTRH+u3/I/E4N40gF6j4EU9xkpLsi8gi9IiG1b2+qNA7u3EImaPu5ZwUU2yXlDa/ACdXmgx1rVEObpDj6wwAyc8Ij01WlGKRDBmIGRVlpFDI8ChRr5DerQEyAFzhXdLpdwyB34xcRNg1CUNKvXZjmaWaYtar6PtPaMkBhVdafKBnVkrmRY/lZh3yxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UP5UpMTBO//Zk19oEG1+bx8VpIDCQOJuq+cv51oGSDg=;
 b=mdaiMj47lsiMQoLlxVJ8yYYWzVbVXx8uOfO2lcmySqT88Oi4rmsOvytMAHIZmvYhGjZQjbIvAOgXLb+DCEXtzIP6nc5cSwKspA0d8dVuHgOZS5fdnrnOXpSe7ID2H7+i1ilPpe+sknKhreVwtuU1s8o8VOLmp20i2Uq0gtvQMHfVckvJSbyqmXSDwd2tXEILAWJfKyxWImlXe2QEmT5PneDPhjhM03yf2e+yd35FntVNiorlEK4V009N00TEODIoqb9J+sKKnb+v4GJ3aWKuDeHC7lKIBusUgiqA0FywHrsBgVlvwaYQGaBWTbEq9QCbWcQ+Qpw6KkRHbLx1Ou/k1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by OSQPR06MB7109.apcprd06.prod.outlook.com (2603:1096:604:2a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 15 Apr
 2025 10:23:37 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 10:23:35 +0000
Message-ID: <38b1900f-0027-4342-a5a7-a78b179a6a51@portwell.com.tw>
Date: Tue, 15 Apr 2025 18:23:30 +0800
User-Agent: Mozilla Thunderbird
From: jesse huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH v3] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, wim@linux-watchdog.org, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, jay.chen@canonical.com
References: <d6b14c26-e70b-4edb-8661-b213e3fed9d4@portwell.com.tw>
 <475693ed-d11c-024a-c9f3-a270ab5b68a3@linux.intel.com>
 <a24155a3-281b-433d-9964-eedc40ae2bf8@roeck-us.net>
Content-Language: en-US
In-Reply-To: <a24155a3-281b-433d-9964-eedc40ae2bf8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PS2PR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:300:5b::19) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|OSQPR06MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 735c672b-33fe-4d69-e482-08dd7c0793fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0gzS0Jla0Q5MmFCZDY4MUg3MVZZbjVTVUZTWUtYbXp4NFkxR3NndDJjTmZB?=
 =?utf-8?B?dlptSGZrQko3NkQxczFwclVPWExZMEp1YWd4MUxDblZvNDlDcW5nTXNhRW84?=
 =?utf-8?B?RnFoeFNXYmkrY3kxNmlJTXYyR2dQY2svZHRjOUozQzdjb21QWmVla1Y1QVdz?=
 =?utf-8?B?b1d1ODRiQlJ5YzViUGg5ZDczS29oK3lzaWllcGY0QlZ3V2RmWFJSdFBvdTNS?=
 =?utf-8?B?VytoeHlHaHYrbyt4QjZXSUJuMW92Q2gwOW1naEF5WDRpWVh6ODhmbGhFUE0w?=
 =?utf-8?B?UUloTmNERHhrcWkzTTZUdkY2N0w3TTdZNjViL2hlMGE1RFZRejlCTk1aSkpK?=
 =?utf-8?B?b09LdnBjY2hxbmFGZWRTTWVHT3pmckZnbEhmL3EreFlCVGdvbU41ekY5aWFs?=
 =?utf-8?B?SS9mR0tTV2RMMmZ6VUUzNktHQS9YeGRtOWRGa0NsQy9RbEk3QzZzUDUwc0lj?=
 =?utf-8?B?YTZFRVdodHN6UGRvZUZ4TzkxL05OMkcwRG8zMTZqUlJmL0ZXSDBIeFBtTWxJ?=
 =?utf-8?B?T2twVnNjNm5lZkdmVlR5ZSs0NnhKMi8zYnJrZmR1aXV0ZmhoS0FNWElBVmJE?=
 =?utf-8?B?YnBFVm1xTk4xWXFpS1cxTWZrcCtubTNkOHFudE1HUG11UXIydGhWSVFydGd5?=
 =?utf-8?B?ODBoQThuYVU1dFlaSndnVk9QVzhaQWhYbkc3Yi8zc1ZkaEdZL3NTUDFOd0Ja?=
 =?utf-8?B?MlpuVThhVjh5VlhUVFgySEtiV1hvZ00vNFFXaytuWVJjOFJpelIrTWRldUE0?=
 =?utf-8?B?UlgyTnp2bkZNVU5oWGtqUDRkQU9XMm1URTcwWHlkRi84QWFlRmxRRTJJTFVO?=
 =?utf-8?B?MEIvYTZGa3hveTJtQkRYZTNLTUdqS0lhQWE5OXl6aEZIdlFvVmtoeUpEUWE0?=
 =?utf-8?B?TVlkUlN0NjcwMUYyUFFZT1dzQUlpa3dTSEJkdzFiUVczQnA1RkpiN0ZmSUtr?=
 =?utf-8?B?K1dYbStTQ1laRWRiL1F0alFpT3hUQWJScFhQUmpjbGVJaU1yWHRWUWY5UVI3?=
 =?utf-8?B?T0hrU1U2anBvZHlOREhLR2xJbE5CT2tMbkNreXVqYTBnUjRJMElycUFBZS9U?=
 =?utf-8?B?czhxTktqVjBzQWJYdEYwMXlrZkxORFk1c2RyL1JJWUlUQ0tmT1oyQzFyS3g0?=
 =?utf-8?B?Z3NUUkMydkR3b2YxV0owTERmOGo4VERYcDk0MkNURHV4MnpERkl3VmwyOWN0?=
 =?utf-8?B?VU5obHYrZUZIQy9MWlJlckt4aklsVFZTLzRJYnprbll2NmxrQlRPU09PUitW?=
 =?utf-8?B?bU5zOG9aSjl2S0txcVI2YXFRczBnR1Qyd0p0NnUwVjBRY2hMYUMrSHhpSVha?=
 =?utf-8?B?WGYrOHNNVURwdjRVckROMnlxaE5aMzh2cnBlaXlqVEVxcDF2c1B0K3JFcmZ4?=
 =?utf-8?B?bDE0dlBoSGNSNmFuelN1eG83VWVod2I1WDZNY3FPTWJQNXMxcTBMODlyLzRK?=
 =?utf-8?B?aE96ZXdjcmpHdWZXbWs0bzJBb3IzYnFGYnlhVkpSQ3lnZHNLNlRhNS9ZZG91?=
 =?utf-8?B?UXZIbHNITW9LTC9LZjNzbEd6ZmRaNlI3WnVyM3FlMGpnMjdMWmhIalFYZGxy?=
 =?utf-8?B?d1hhSzNQRkxhejJPSkpFd2prMXk4dmw2c3dGcEE4KzRWR0gxNVZtR256djBp?=
 =?utf-8?B?OGErcTYwZC9RWi9heUNVOW9icEdrQzJHVUtSV2g3T1hsckZUYjlpTE0vc1hu?=
 =?utf-8?B?UDA0TllwTUpqdkVETFo5RldzRTE0dnk4SW5GVGlpMW5NY2tkY1QybTc2Wjl2?=
 =?utf-8?B?bCtRdTY1UEhHd0EyK09YeSt6SHFlNlN4YkIrV0tObWVqM0RXcnhZMXRCVTNZ?=
 =?utf-8?B?MDdhaXpFVk54MEVpRmZkOEQ1YThNSitVQ2x3Qm5hdnhKbkQ2ZUNCVTNYcFU3?=
 =?utf-8?B?eGxja2luNVVxN0R6NklTWEwvejJwVWcya3NwUVd6N0tKRTVocFlxSUxEdjF4?=
 =?utf-8?Q?f3S0caIZ2Oo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGg2YWk1dTYzL2tJMU01ZTFaenlOcldNOG9SRFk5Qjg4SHIvR0Y5dDRNQkZ3?=
 =?utf-8?B?a0pZRnNuYVVXRzI4c2NuUnNkSmNEdW0zdXpicEhBeDVzcGgzUityL2M0anBK?=
 =?utf-8?B?eW1aRnEyWTNwTzQ5VVR2YjZFMjV1allRdWJYVmtEWWs2N0lNMWZtekhLVmVi?=
 =?utf-8?B?MUlkdU5acTZrTUdGN09wdVlDMUQ0dG9QVFdwSFowdW1ZY013Q0dtS1o0dytj?=
 =?utf-8?B?ZUtSZ2h4MXpGM25TNGFyZVBWNzVacHd0MjdRcW5qRDlMd0NVYVZkTWk2c3No?=
 =?utf-8?B?Z3hpOUdpbjYxd1IvdUtDRSsrRVpGdEZZYk1BbnFCUkRsTDZ0VVk5QWxsRXZE?=
 =?utf-8?B?clZ2cDJ0M3owbnV6cEljQTJWRC8xdy9nUXgwTmZ0Vm55QldTbFhKeW1NcTJR?=
 =?utf-8?B?M25VcGJoOTdhNVpERWlUVFdXOTlPbnV6a1hpR0w5OFlQWCtmaUc3UjZDQ1VN?=
 =?utf-8?B?UU5yT2VPa2lvMFJjcTVyOTNYR2JrQVpjd2pjbC9tYjRheGlVUkpUbG5hRUlJ?=
 =?utf-8?B?TnQycHRRL29MeSt4THRKaHpSUjhXWDlHamUrQ1JGMzNxbFFoTFM0UUwzclJR?=
 =?utf-8?B?N1hFUk50ZkdTalBvSkRRRWdJeG5nWVFwZ1ZjWlRVazhVcXJUSktKL2hTTkVo?=
 =?utf-8?B?WklSZ0thYTFMYXM1U1QvM2taRkdsVW5qN0NGV1F5blpXeTVEdDc3TjB5TnlW?=
 =?utf-8?B?ZFZJbWtFV1hFODR3cWJpSUZQNnVETHZnamhHUEFnVnpFcW1rdkFYNENoWW16?=
 =?utf-8?B?YnkvWjVwZDNnMFhqOUp0QlpkZHRBd21adXM3alBnRS9Xc3R0WDdQK0V4b0NC?=
 =?utf-8?B?WjVGaVdsZHRYKzBCbEhUS3lrZ09HV0dRREJ2eU1tSlhNQ0FRdmVvVGozVnV2?=
 =?utf-8?B?MDllY1hJS1poWE9NVHpCY1dEQzljT3NhUWV0NXFMbXpPb1hmUVB4Z0kvU2dx?=
 =?utf-8?B?ME5CV3BBTExMdGR1TWN6QkM0aVJ4Y2t5RFA1WlRjd1d3VUVsNHZPUEx1WVZu?=
 =?utf-8?B?Ulk4WXFBeUwxTVpxakprc0ptRDd5OHhJdmVCNjZDOUI3bnM3aWUrbjU5VEJi?=
 =?utf-8?B?eDhpUzFFN29yYjlWVzBXUEZvVlhRYi96YXlpSm9Bc2pWWHU3czB2NXBDa0Zr?=
 =?utf-8?B?REk5dXZuZzIweE0wUllWcjlBVGtaZGpxeDJlN0lJU0QvbjhtSXIwYW16VDg3?=
 =?utf-8?B?aENRTXQvU0MvNkY0U3BNaml5NFNCcWgwcGpnV2ZNMHJyZGN2SytmUkp4VWxL?=
 =?utf-8?B?Njg1U2ZqSzZBaHBONmZMV0h3V1FEWjlKVmlURTdrMlczdDF1ZGpoOWo0Mzhl?=
 =?utf-8?B?U2Nid2RpZ0krOUtDRTB2REM5aitxQ2VzN25KQnZUak0rK2txSzlGQ3pobCs4?=
 =?utf-8?B?MXFqejQ5WGxKbUVKeXNuZ3FLY29JOGpINzBFR0I5V3B5ZktWbFIyU0pIdGtl?=
 =?utf-8?B?My9iazBKemJWVTJrK3EveTIvWDFNaFRnVkQvRVZXRklHVnBsSmN2TkxSUnF5?=
 =?utf-8?B?YkZaeHNUbmRmT2NpZjg5WEhrN1pIcmoya0V6RkZ3MGNuRzd3d001UGNLbGlr?=
 =?utf-8?B?akFFWDNXT0NWZnZ6Y2NrODF0R2R3cDVyNHdRK3FCQlFlQXVXOEYrNVc4dDlY?=
 =?utf-8?B?S01DdmRsaU1sODVKeHB6RXdOdUJnQ01EcGt4VUhHMCs3dU12K1k4bE5xT0RI?=
 =?utf-8?B?NExHYUpLZGpGTk1xUFFOVkRtL1BvNGU2UFdmYzdzelBReGduZVA1dVlWYjhM?=
 =?utf-8?B?SWtBZkNrV0FqWTFWcVNubVNDSkJvcEZzZGFuMEpCNU5nK0xyYkdQTFlwYkRw?=
 =?utf-8?B?cGVXc1BYSDZLd29uUUpoNG1EZE44b3RVY1dGby8xQlE1WWZ1UU5NMjVFbVRZ?=
 =?utf-8?B?WTNkbEthcGErUUVvUjZxSS9vQnYxQnhFcE5SaUtkMElSTjdmRnFPT1kyRkFi?=
 =?utf-8?B?cUsrTFN2c2ZXT3ZrUVc1b1ZOZFB2YjhGTlJGZUF1a3VGaGhUVjVLdXJWdEk2?=
 =?utf-8?B?cGd4dmVXdHNQNklRUytjWW5IRTdnZ1RHRkVnNU1vN0lrdm43SUw3eHV6K1dt?=
 =?utf-8?B?cC9kQjY0OU82WHdZUit6c1lwMmJjb2dUNVIrRDJMSXJadlB3bW9JQlQwdkor?=
 =?utf-8?B?S1ZmWEk0UXJ5Zks1NGJJb3JrY3NpSERLSGRFdndMMFhMcno1Z1F5OFM5YTlZ?=
 =?utf-8?B?Q2c9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 735c672b-33fe-4d69-e482-08dd7c0793fc
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 10:23:35.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jk6cOcG2T4BG0EVFNZLGM+7i3RN/GDOwjkBKHFpPdiaO7ig1aA3YGPRUXygI472LUNuHZHje3JA8pBzRxN9ggAJkxPMDuIpH6XXgF/yKUQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7109

Hi Ilpo, Guenter,

Thanks for your reviews and detailed comments. Please see my replies inline below.


On 10/04/2025 8:25 pm, Guenter Roeck wrote:
> On 4/10/25 05:07, Ilpo Jarvinen wrote:
>> On Thu, 10 Apr 2025, Yen-Chi Huang wrote:
>>
>> +#define PORTWELL_EC_IOSPACE 0xe300
>> +#define PORTWELL_EC_IOSPACE_LEN 0x100
> 
> SZ_256 + add #include for it.

Will fix in v4 and include <linux/sizes.h>.

>> +#define PORTWELL_WDT_EC_CONFIG_ADDR 0x06
>> +#define PORTWELL_WDT_CONFIG_ENABLE 0x1
>> +#define PORTWELL_WDT_CONFIG_DISABLE 0x0
> 
> Align values.

Will align all definitions in v4

>> +#define PORTWELL_WDT_EC_MAX_COUNT_SECOND 15300 //255*60secs
> 
> Move the formula from the comment to the define itself. While doing so, 
> you need to add () around it and add spaces around *.

Will use `(255 * 60)` in v4.

>> +MODULE_PARM_DESC(force, "Force loading ec driver without checking DMI boardname");
> 
> EC
> 

Will capitalize "EC" in v4.

>> +/* GPIO functions*/
> 
> Missing space. Please check all your comments as the one above seems to 
> have the same lack of space at the end.

Will review all comments and ensure consistent spacing.

>> +	pwec_write(PORTWELL_GPIO_VAL_REG, tmp);
> 
> Add empty line here.

Will add the missing empty line in v4.

>> +static int pwec_wdt_trigger(struct watchdog_device *wdd)
[...]
> Is this write until timeout matches the one written typical thing for 
> watchdog drivers, or is there something specific to this HW you should 
> comment + note in the changelog so it is recorded for future readers of 
> this code?

> No, this is absolutely not typical, and it has nothing to do with watchdog
> drivers in the first place. If the code was in drivers/watchdog/ I'd
> request a detailed comment explaining why it is needed.
> 
> Guenter

I will remove the retry loop. It was originally a workaround for an old EC firmware bug and is no longer needed.

> I'd add empty line here.
> Unnecessary else.

Will remove in v4 along with the retry logic.

>> +static int pwec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
> Add empty line here.
> Add empty line hre

Will add the missing empty lines.

>> +static unsigned int pwec_wdt_get_timeleft(struct watchdog_device *wdd)
>> +{
>> +	u8 min, sec;
>> +
>> +	min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
>> +	sec = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
> 
> Does the HW "lock" sec value in place after min is read or do you need to 
> consider the possibility of these values getting updated while you're 
> reading them and the driver reading sec after it has wrapped?

Will fix by double-read and comparison in v4. The EC firmware team confirmed that the registers are not latched.

> Add an empty line here.

Will fix in v4.

>> +static struct watchdog_device ec_wdt_dev = {
>> +	.info = &(struct watchdog_info){
>> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
>> +	.identity = "Portwell EC Watchdog",
> 
> Please indent the inner struct correctly.

Will fix indentation in v4.

>> +	return (strcmp(PORTWELL_EC_FW_VENDOR_NAME, buf) == 0) ? 0 : -ENODEV;
> 
> return !strcmp() ? 0 : -ENODEV;

Will simplify the return expression.

>> +static int pwec_probe(struct platform_device *pdev)
>> +{
>> +	int ret;
>> +
>> +	if (!devm_request_region(&pdev->dev, PORTWELL_EC_IOSPACE,
>> +				PORTWELL_EC_IOSPACE_LEN, dev_name(&pdev->dev))) {
>> +		pr_err("I/O region 0xE300-0xE3FF busy\n");
> 
> Use dev_err() instead of pr_err().
> 
> I'd use the defines while printing the region's address.
> 

>> +		pr_err("failed to register Portwell EC Watchdog\n");
> 
> Watchdog -> watchdog ?

Will lowercase "Watchdog" in v4

>> +static struct platform_driver pwec_driver = {
>> +	.driver = {
>> +		.name = "portwell-ec",
>> +	},
>> +	.probe = pwec_probe
> 
> Add comma. In general, the comma is to be left out only from a 
> terminator entry that is used by some types of arrays.

Will add the missing comma in v4.

>> +	if (!force) {
>> +		if (!dmi_check_system(pwec_dmi_table)) {
>> +			pr_info("unsupported platform\n");
> 
> This will be unnecessary noise for most systems.
> 
>> +			return -ENODEV;
>> +		}
>> +	}
> 
> I think logically you should do it in a slightly different order:
> 
> 	if (!dmi_check_system(...)) {
> 		if (!force)
> 			return -ENODEV;
> 		pr_warn("...\n");
> 	}

Will rework the logic and remove the dummy message.

>> +	pwec_dev = platform_device_register_simple("portwell-ec", -1, NULL, 0);
> 
> If this fails, you need to unroll the other register.

Will add `platform_driver_unregister()` on failure in v4.

Thanks again for your feedback. I will address all comments in v4.

Best regards,  
Yen-Chi Huang

