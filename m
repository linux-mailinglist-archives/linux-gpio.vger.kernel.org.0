Return-Path: <linux-gpio+bounces-20452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB99CAC01FA
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 04:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E5A64A6510
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 02:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9D078F4A;
	Thu, 22 May 2025 02:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Unsp9qSo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021099.outbound.protection.outlook.com [52.101.129.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59E836B;
	Thu, 22 May 2025 02:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747879202; cv=fail; b=NBcsUCsVlG2JVyFPB0iTeUNxTRUkjMtITMXCBNcffnSJPt7NKDHvpe4v1ilHhUsZ5hPMsguiLrzo6sif/iMnMePa6rK/A8XCnbZkPnkQbvwOVFebbCDwFHtnlzh4z0x6Rde2loPt9O6Dpe/bhgRAm00g3VBzGki7YEws9GfnmuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747879202; c=relaxed/simple;
	bh=VIQhjqkGdSwZcZR9AcFQ3uIgbQNqJ/jqCGA0kvT8jrE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fe1fQwRkqS5IftvbCiKCLTkiB+pv6k4ZV3plr8Uu84SwFXmAF8OkTpn8NPYCU92QqIzVVOe7CMTWC9EIoZ1XN3DIPPM2gtyfmRxk+hOkUWFvlErHCuJf+bK8Cw/pU1LQQq5H3XP0mPBRs4h1qbi93IzfK6AoP0ydko9/b3Dvqk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Unsp9qSo; arc=fail smtp.client-ip=52.101.129.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiTu0vapBu87vocDu2My9YeXE0erRpqT3/xMribz1E46MuheCy7Fm4QuFGkpZXjbYgu38DjjFvFHaQl37w6tE8SBpgLL+e5vdsJUOqw8mqoIV8h+fHisE+F5MEX/WyOABdxKo/hPL08kU5DAMEtQgkZ+MaLHu3kicmNe556cvwEnOrUv2HxNU+2ET9Ru/HSl+b1kw36UJCcujgLMlZSoPbKr5CYg5BH3Sxx2uJxNSvMLRUEBOn24jWSoL3Jv26fPC0YrzMIHcY93gxOlw6d/uPwO6sRH49kECwCqKy1ErYibxMC0LzgQ67BUNcjGCUyJKUyzI6hdlYavpcHVt0Fd0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1g7koyQtq4WRI81MpNb2WhBgwgznLKc429XaNEhephQ=;
 b=JMxh5WI3hQHtKv7NfF3KCV0c2hbR4pfDikBakf6H9hkOOD8zROyycA6XLv+wOan2L0UEfmX8eUUfBQEL1XL7h0GQ+WrqplohnFEKt+Gf7636uojztO6Cg4p7jfbsuUZN5Ua761zrL4LOeURHc79pKEMRizADdKv8fK3WfMJgCIJAq0XCFfrsCfWc4mJF+/7hZQh+vw+deC7+si00hGbY/ZUq95pCvhL0eS2XjQ3nMKGtqe6pRWfIk3idujWnCB+uhQl+QgUESV229Wyt3pAHRIAdP/b/xTGbsOgkMP788JvasTNT3qeF/An8JFuY25sscI9DiNhj0Yod1C/Pvdsc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g7koyQtq4WRI81MpNb2WhBgwgznLKc429XaNEhephQ=;
 b=Unsp9qSoXXIJFn+Q/t6jM3FYC6Rt+0kIOsnvId2tMs1ewCARfwnjNkEwg3baqmKDZYCllAwv/BaqbXhvAhzpnXwADdtP7xwnS5kgwSKgiRvwnKQyUr9D//Sc0LeyIj5YDNvyhuRAEUDQ/2FsCoaCEjMALqAMa1uicuD/nSkuv6sbC0VxqWjI0jgqpDJoxAhmhV6uMvYmBQB8uHQIhpdGSf0Rh1GvcLNjtAze6RZRRJ0eSXy16S768IHz96vW/U6fhXaWzr46lIZ7/on6kxw8SsOa5H6oI9hEwvNDSE2koAK3tnEsUYQoCWSf+9d/yBEAPZPVbzpV7dA7jz4hpS+sGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SI2PR03MB6663.apcprd03.prod.outlook.com (2603:1096:4:1ea::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 01:59:54 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 01:59:53 +0000
Message-ID: <ddd0dd9e-1f20-4e9f-be69-fceb30d9ee35@amlogic.com>
Date: Thu, 22 May 2025 09:59:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S6
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
 <20250521-s6-s7-pinctrl-v2-3-0ce5e3728404@amlogic.com>
 <20250521-foamy-strict-tuna-3ffad7@kuoka>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250521-foamy-strict-tuna-3ffad7@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SI2PR03MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 6642dcae-79ca-49bb-fa44-08dd98d457d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vjd0SkZtMFRsMGZqK1k0TU54RFRmYSswdUwwQlEwNFBJMXZ6dU9nbVZMdmYw?=
 =?utf-8?B?TGpRK2w4YTFVZE5YaE5RUHF5dTJvVkx3b3cySDBva3dHdkdEQkZnRmpvSUNN?=
 =?utf-8?B?NTlyU0JUOXBRb2ZtMTJSOW42SHltTmd1Z2Y4T3hqWkpKRmEyYnU3RVAzemxM?=
 =?utf-8?B?bUlORE83SGh3VVhQV1Y4VklqNTJDUUZITTNET3JGOGxKYzlvL3BwOVlYOVYx?=
 =?utf-8?B?VEdrVk1jZDNEZ1ZZaFp3OG1DM3VhbWFiQk1WajV5ZnNGRk4ybFN0d0lzcTk4?=
 =?utf-8?B?OEx0bStoYXE2Nmx6cWJWUDJwU0dkRWFUNWF2UGMwU1YvbFd6ek5GK21LekJB?=
 =?utf-8?B?Zk5QY3I1bnVvd08yb2ZLemhTVW1kQldCTTBWL0gvRnc5azRMWjc5c2ZRMGNt?=
 =?utf-8?B?L3BlVksrK3Y0V05LMERtc01jVnNBODJGR1NDS0o2TEl4MWdnTGpwV0o0NGp1?=
 =?utf-8?B?VUM3di9OVDZSaG1hYlpOcjI1S2pKYlRIVVdIU0tneTJIc0lJVVlrUE9KanhR?=
 =?utf-8?B?ZG1CUHRNTStMc0ZEWVF0NVg1eG5qenpWOSsvWG5YdlZObmNSTzZVMHVMMlZh?=
 =?utf-8?B?elgrUlQ3NXgwNGMzdkZtY0M5dDViQUNOcFlZNUY3cmo2T0FDN2Y5WGFKcUtY?=
 =?utf-8?B?a1BYRTBJYlk3WGVKNmdpZjU5ZzdGYU5vUzlybENEa3IvUVVJTjI2bUdiaDdN?=
 =?utf-8?B?N1NZWlFKZUJFQUkwL1ZFNkR5ang1S2NudUVUMDIxWnl6Zk1tNUNlVWRoZFZO?=
 =?utf-8?B?QmthWW5SamJxNEdYaHFkMjRGcFhRZStlRXJQME9EWmxVZEpHbGZqUkdOUHhQ?=
 =?utf-8?B?ME5kdDJ2aHFZVzFuTGlER0doZlZKejZTNVVnRWpUQjdoOVlXWW91VmZySXFm?=
 =?utf-8?B?N0NEQUFuK3N4MkdOWTl3VGN0V3JLd1BuUnF6UXBjTDF2QWx0c05MZFRZS3NL?=
 =?utf-8?B?V0Z3aW9DRFhiazFSVW5zM3BycThPcFo4ejh2R0tmdk41N05EdGVJUFVnaXV1?=
 =?utf-8?B?WFZKRnVUZnpZVEVsN0ZNS3FOcFpJVVI0ZURTdTVkRk0xd01UMzl1a1I3YXp3?=
 =?utf-8?B?eWowYkxPbWxSMHA3aGdoOUFaUHl2d0hOQVpLTFgvdU1jNUVzOEI3aDFqNzkv?=
 =?utf-8?B?MjNQbzlZVUIrZ1QzY1VhQXFwbDFXU3J0cVRYMzBUMUVMYUdLd0wxRThGWjdp?=
 =?utf-8?B?SWt5S1R2TGtjYWtxY2JnOGF6Q1JkUTNrcVFVYk1VUUtZVGJ6TU9SRXorYnhQ?=
 =?utf-8?B?OTRTNVF4VFNla1pVV3ZwQklwc1VZMWg5WmErakVmZVhlYjFyYW9INkNUdEky?=
 =?utf-8?B?bVBJbUNzbGRXUEVjNmlKVnhucmZRQ1kxS2RxZEdZdGFnMmRKUEJOTiszWVFl?=
 =?utf-8?B?MVlSVWVVQkpPcGlTdmJtci9Tdm5QallDYXFpTjJ3c3BzM1FVNVgrZHM2ZlNw?=
 =?utf-8?B?TTQ5SGdYZWlaR3I0RzZkMTM4ejFIM25qTzJ6T04xd21KTWFNdVJSQldwRGpP?=
 =?utf-8?B?dHRVRnprT2ZzQkVYZmNBOW1WbFlrNWw3YXdMbWlJZTNqb2EzU21NcC9EejZy?=
 =?utf-8?B?UWtJYmdVQ0FNdTl5ZW1OcFp0Y0YyQm9hWWtBdWNUTzRYQzBWQlFYZWRJaWJu?=
 =?utf-8?B?VWZ6L1ZxdG02VEdXRE5SYWRrUk14ZVBGajFPdTE5WEpPTGRhRDBNakhWVzlp?=
 =?utf-8?B?UVFXWXBRYUptcm5KWUN2RkxQU3RKV0I2dk42eFdhZjBQQlVSSFlHK1F2UmE0?=
 =?utf-8?B?R0w1cUorbldNVVJYSDcwaGx0UlNwcmJoRFhuSHg4TFp3UmY3QVk5L3F4aEEz?=
 =?utf-8?B?SVl0SjdSRWwyZHo4R3FhQ2NBcE55dndSR2dwcCtTK253SFhQei9yQ01kZDRn?=
 =?utf-8?B?Vzc0aFREWGt3SUQ1RUE0NGNzZStOU3VES01WRXhHZllNYURqUlRvbG9KT2xQ?=
 =?utf-8?Q?epUNqS/ELn0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OS9YRlJkUDBTN3Z0MGN3cjc1SkYzbkFyRmZ4WjhxWmpyT3BYVWlFcURKeUZy?=
 =?utf-8?B?UmdBTE9oT1ZnR2FSc29aM1FhZjVUeWUzVlFwTFErbktaWEMvSjJldnNQUllQ?=
 =?utf-8?B?dE9PV2RyR1VaNWxrTlBHV2p1TGw3QUlOSEg0UkxhU0dzcFJaZ0RLLzhUTE13?=
 =?utf-8?B?WGkyaVVOZWgxWXJURjlaNVJQL2RFMUJNOFpMdFQzeVJaQzRGcDJPeTJHRExP?=
 =?utf-8?B?OG5zOXlBdHRlMEF6MmdmMDdkTEFGTzUyZmdNTnRjN3Qvd3N4SWxMVXZGVlB2?=
 =?utf-8?B?M3RXMndFVzNoK2lGMDd1Tm0vZktxci8zd05YWXhKaWlCN2FGR1pnWHZyQjRs?=
 =?utf-8?B?eXRFYi9TQnBIVEk1dGhxcjVXTTFJM09waFNpdWl5dmFnRUQ5NkJNLzRWbVBQ?=
 =?utf-8?B?S2FnR213Vk4wNlgrZk5uZTIyU3pMbnNLSndReEhseUFJL0cyWXNSUG5xZUJQ?=
 =?utf-8?B?MzFzdEdPRTh3cmxnMFg1RnJIUVFJajRZSGR4cnhHTTJqcHlkcml5QTRzOGk1?=
 =?utf-8?B?MW8xZDB0WWdYMXBES2NwNGh4ZnVWdkEzVkwvS09MdEN4eDVsQ05qR1lUVito?=
 =?utf-8?B?Qnk5RU9YVzlFdWt6SEpoamZTdk13aWpKUTA5VHNkb1o4YndNSktOUklzRHRq?=
 =?utf-8?B?NGJxQzlyRkZ5enNad01DWTFCaWdjTC9STFRycGEzdFJGREcrazVnbisrVXlr?=
 =?utf-8?B?SUYwdGhnelJYYVRqL1pOcmFiKzJoYXA3T3VPSnl6c3FtQ2Y1NFIvTG9ZQ3U5?=
 =?utf-8?B?MVZQaE1WaUNSQm4wNHVrMUFuNzJqcnVWSHhLbDdQeGpGVjVGOThicjJNUXJR?=
 =?utf-8?B?UnV5TWhEbi9OYUlPTjRON2xRVjExcXBZT1l4TmU5YWhxU2QrUGFYd0VxZmRN?=
 =?utf-8?B?aDVZWG5rbStFRE1zMi9JT2xZRHVzQkQyQzc4dlk1MlVKRXFpek1GZElyYllq?=
 =?utf-8?B?a3NFcUVSQ2dOWDJtQVdJN0VYdDRaVzZ1V0VETGlRYURybjNHdW56aUZmRWtp?=
 =?utf-8?B?YTU2ZktyVUU2b1N1S3hONjBEOGlhVDVoRWJTcG5mMW1CTndVOXJlS2dqUHh1?=
 =?utf-8?B?bG9kaXE3dWpTNmZrKzB2Zm9QUSs5L3B3WTZYYWRvenFBYmJENmRuTWxuTGt6?=
 =?utf-8?B?ZXNxZjB5eFRFSzdmWEF2Y0VlMXAyZk5MVTRvZGViQVZsL2NhOGFSeGhlTlZR?=
 =?utf-8?B?K2o2bDBlYW1rZXhDa29Fd0lQTmV3MERnYnVnTUdUMmIrL3pzbndrZFRhS2ZC?=
 =?utf-8?B?eThkM0d2R3VDVGR1WWdWMkFPZm5zUU13Z0txQ291YTkzdXVQK3VKakVic2Zn?=
 =?utf-8?B?b2JMbU55TnAybFhNeUlXcTk0QnlyNXhyVk5oMGI1ei95VnoyT2tZa2RMUDMw?=
 =?utf-8?B?RWtqMVFuY1EwUk42SlVEWldNWUQxaXZBRGtCMEs2VnFoTGwzZ0xlclp2SmV1?=
 =?utf-8?B?cGlEN1R5VEZwUkZKb2VvbmFlaUlXQjQ4WUJCWGVSYVRBQlNnYTBqalhjOVRm?=
 =?utf-8?B?b2ZNblB5S09NLzVsNDhMcERwZ1YyVUVNNVZVUTVWTkVvbytEYmhqOGQwdTVF?=
 =?utf-8?B?enRRQkRzVU9IYXloKzhwSUx4NDB1TW5vaXo4VUh0Z2toaENWZlFnSWozeU5N?=
 =?utf-8?B?QXNmMVlYVDcxd2kwWU15VzdNbld1aDRwaWplQmJoUU40Qm1YUExaWnJUMm0y?=
 =?utf-8?B?WkRCRkZ2aDloRzRMOFlQaitlVzhPVHpGM2pJeGdWbEw1aHNqaGtnNFpXMHNL?=
 =?utf-8?B?cDdqRmZYNFFNaVc2Qjk1L1hkSEc0aTJYSHFORTN6NUo3UkJralI2Z3djTDhx?=
 =?utf-8?B?UHRPZTJrU21oLzQ4V3B6WldaRUdJakpLT3B5ZkZ0anFmOVJNeXhSS2V5dWls?=
 =?utf-8?B?L3hGd0dtZG5KZndpNE0xSzhpTHJYTFVrZ3JPbVhmREVmV3Fzc2x0Tmk1RURj?=
 =?utf-8?B?WmNKdHBsYnBtMlMxd0c2WGRSa3pHaW5KR3RuaUY4MHhzVGM3cmx6VHpKL05W?=
 =?utf-8?B?N1lLeXBIREJscjZiYmt3WGttRVRSYTd4bzBaSGloSmNWR2JGNnk4OVoxVFNy?=
 =?utf-8?B?dWtiR0krYktETTE5TFRtMjZVZE5xNkQyRXI0VktTdFdtaUxPWWt0cmZ2TnVm?=
 =?utf-8?B?ZEZESGV1ZWlKVTBUQXRkNE1pR0lsdlYvakZnLy9EYWN2TEV1TWpIdHFIR2tO?=
 =?utf-8?B?Q2c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6642dcae-79ca-49bb-fa44-08dd98d457d3
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 01:59:53.2292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLDmQ/3kkAGVrQaijnUqkmV1l/BOszq0d/vAFLueuAbZMTRyYkIga8CdWKR2n/5QV9GMelzphZVX14gQUggYc37sCyQQfNrDmrBHWZUBLD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6663

Hi Krzysztof,
    Thanks for your reply.

On 2025/5/21 17:16, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On Wed, May 21, 2025 at 11:19:57AM GMT, Xianwei Zhao wrote:
>> Update dt-binding document for pinctrl of Amlogic S6 SoC.
> 
> 
> Just squash it. Three one-liners is pretty close to a churn.
> 

Will compress the previous three submissions into one.

> Best regards,
> Krzysztof
> 

