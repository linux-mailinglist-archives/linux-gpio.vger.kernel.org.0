Return-Path: <linux-gpio+bounces-39799-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bqu0IJayUGpn3gIAu9opvQ
	(envelope-from <linux-gpio+bounces-39799-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 10:51:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F783738AB8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 10:51:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="m3hEs/Zx";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39799-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39799-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D117F3039D9D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 08:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FFF38A299;
	Fri, 10 Jul 2026 08:46:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F1B341ADF;
	Fri, 10 Jul 2026 08:46:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673200; cv=fail; b=Jj+XzL+Z8tZr/ZvyHOsRXb2Jr1qn6wfReGcBEbQxmSnmbcPwuUdeInQ1fVstiq7gnFUiqKGesKArJ49lWWzXvrggRi57IrWah6Kg7gb1LUTvrfR1HkXCAkVcZqYBgKuuT01oioU8rXgwo70tICL0rfCfgdae+tEKzgEFbJf/BgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673200; c=relaxed/simple;
	bh=m54FfZOjcwuwhrud9UMtNUipQEk3vqHJRtNJJd68/as=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IFw5N6Asd9QYunmSWZ7lAAXoR+ewzlt6Z1INPlGICY81m3IDmuFD+PzlytR1MQWnN7YPWks/OOHpZ4btHPuTxnEKspXpqkFlBFIkzsPP37vec4VX8ojAi4Hp7xQEZup3f7v3yF8hUa803O4npqqhCiKgugwjGpuDSpnDOPQNmxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m3hEs/Zx; arc=fail smtp.client-ip=52.101.52.60
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fe7DDWXW1CwXIovzhZKtUcUa/Jufv/4nbFPmZ6GPjZznYNJG34lLADwU/Zri1s8LNTTZWBR+Ck7Arcn5yeaaffEp1/QlcEeXNbZYv8b3Vu3V7GB86NGzgI+h4g63msNark2NggGnu3Z4DtvP6UcmGNkuk1ylL+e1VZB2qkhTy9HfpDKlz2Escf1YWVmwpxd9ES3Dv6pTOM98P1V0xT4VUXoqfRjKvkW5+/9j/qRh56FNCDr/VnHl3dmP03zN3mS5qe+VfZrWZe96GIjmDZ7PZeJ1CY+6ZiU7ib6XCTIFwyGk9LhYeYLhLDndf8NDzJKvbgGaKLjPYZr4hX6lWNDStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fKu+X1fTrpgNOLO84FmZ4J2opQPJQjnoEzMkEITUNU=;
 b=CzJK3kQc8zEjKTo9qIv9xbqX0Tez/CHUcPfUqTB5bztPjM6cGBTPW1FBj+8wrXL10QrL6wvIO7c5t9g/YI/71jRPF43jlAZs1XLd6oDeZU3RXzYGbQ1K73vYSWWCldlIN1URfev8lqM+aVINeD7QiAmNrnYfv6Bm72dnioBH95dMq1r9TAR/2Sw2LfvrHFFLUfVicWmWYcyqROx6k1QZLJKkrIQCUTsLbCnhGO/ZE7iPnYaa6De+IG0u/G+oVZzzcH6QjVaA2w587KteBuizkZ2ocbkGX25Mk9gDRivItOdhfvJ+7lbtInHzdV+EWwjj9TEmPS4WCtyXkwIlFhtiOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fKu+X1fTrpgNOLO84FmZ4J2opQPJQjnoEzMkEITUNU=;
 b=m3hEs/ZxDD8QGogziD3rtlwV+iydNpR/zqjJ5Usq6Rmf6YVP4R4Hv1USbvdzpReesGeLc6i/Dk2dXait8IqbMI7AH6unXFfYOSvOPX38TZykJrBjfkmRi+HmBP6+XRDV03Fn1ifHR69AcJ/ccVp3Kuv+La/eKjG/Jpad/6weZos=
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 10 Jul
 2026 08:46:30 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 08:46:30 +0000
Message-ID: <6f823bad-014c-4ac3-9e75-9edcdf28f7b8@amd.com>
Date: Fri, 10 Jul 2026 10:46:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
 vincent.guittot@linaro.org, Souvik.Chakravarty@arm.com,
 Alex Shi <alexs@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Brian Masney <bmasney@redhat.com>,
 David Lechner <dlechner@baylibre.com>, Dongliang Mu <dzm91@hust.edu.cn>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Pavel Machek <pavel@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
 <skhan@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>,
 Ulf Hansson <ulfh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto> <77110e77-941d-4173-b2f5-6f3cf4858339@amd.com>
 <20260710-lemon-pogona-of-wind-b3a003@sudeepholla>
 <5f5e8341-dbcc-4467-976e-35d007ae148e@amd.com>
 <20260710-macho-pristine-tanuki-b0d3ce@sudeepholla>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260710-macho-pristine-tanuki-b0d3ce@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0133.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::18) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: c38c7d54-ac41-4636-e332-08dede5fbcc4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|56012099006|3023799007|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aMIwQ3tXhck8Rr8e17yu1C5kqkZMKApg7XLSCi76tzQfEuPc1FZhEhM94owWGu6uXgcn1d6HVh40bFxtyd26vHHllb9A+RfMNiD5NSybjnPkNMBUEZBSAeRStGD/i3KFhUPOCv5EnAwPwY14L5nmfU/63Tz3yFnL5HVNkRMBHlKfKqx8OIxipVzVOtYm51RvXYwDqCDblFDT8Z2+YkcD3KtQduxIE9ZOwqJR2xpKxvrHMK/rX6aybA5MKUT8xyQa7TrOnTdxygVwcLkSYD3brOxPPVLYUdruSoRjP2h9uHnam/0qO5BcYSL41gCLw5A3lX90sSBhXsXPNsg81HO92YmKqGD0TZtPGD5TwSL3+bTBQpVZSHjKd0xsqHMwitjhytM/GMBEmx7fjJK+wVsrmvfbbaLSDKVQ+a5EXh/hI2+5yfbtWuDGsn3AEQMlvGulrzbwDwhfjku7Do8JOwWR2WD4Uzlj3LjH4uFq6Kt7BpAIb7soXw7BJRqdnXmlOI19xbv4CiTyqv+rFsppsRmdnP+nAhnPDV7I+yzRcxGzurtfoJGwmzsdwDQG29zrwJpdKKugyLdL3X0+ALRuYcEzFFeEd8w+2ck65WUb5Oy4Fdihxz3mchBDKQi74RjcTUuS4V4VSMWzCLwzu4+LuRWpuLJ2i1ipxCoOV5vPpl6qhJY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(56012099006)(3023799007)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUkyUlNvcWNibDRDT1dyWHNDVC9jYkVGV283bXMzSVpzakRtSkk4T2ErWkww?=
 =?utf-8?B?K3p5bVZjcWtKeExvTnNVR05xamhPMFVjWnIvL3VTeEpPVXBPVCs0eTQyTWtG?=
 =?utf-8?B?RkhGcHJVenE4UTJqMVFHV1N2ZG53ZFFIRWRXSTUxSkxIc2R4d2trU0lGWTVS?=
 =?utf-8?B?WWtzWndLWGU0UmFsTEYrc1lXcmJCOGFQT1BjT1o4NWNBWDN2VXhraE1SZ21m?=
 =?utf-8?B?cHFDVGd6WldCRVRpcFdUdzVCVXc3Yk9ZM2ozaHhYRXRWZmdyU0Y2Y2phOW0z?=
 =?utf-8?B?Z0VrcHFmd2tnQS9ZTXJ1aXhtc3ZrZGJZZXhBTHVFYTNHVlZObzlVdFpUSE9Y?=
 =?utf-8?B?dmFibzllcWhva05RQmZVbHNhSW5JSlpwRXRwc3lIbzNUanJGWTlVK0NCMDNx?=
 =?utf-8?B?Zk5ZdCtoVElLNDRMM0cwdDk2c0FUQWFYRkhLa1NTTXozWUJXZExtNzRER29L?=
 =?utf-8?B?R21tdzhBdWtTVlQrb3Q0azhGZE5mN1FpTUt2cXlKY096VlphSkpRMnkyZzQ1?=
 =?utf-8?B?SHZhV1JHV1MwVDRNQjRHSk5hZlFWakdFNFRDS1NVWTkrRUZDOGtyQkF1M3I1?=
 =?utf-8?B?YXlsY2NVU2RIend0bk03ekd4Z1RzckZOckpCTjl6OEJJWVZSUjkyTnVWdE0y?=
 =?utf-8?B?NnFtSUI4L2xzR3hsaVd4em52VW5TUjhkYktDUWpvb2tOb3dGR2VLL1UrWTY1?=
 =?utf-8?B?TXNEdU9MMnNiUHpBTkdHZHpIVTdFVFdTSDJHK0FTbEdPeGhySC9qN0txRmFR?=
 =?utf-8?B?SXE3QlBXRklKQVg1bUR2alltSDJPdURSaGlodHlNc0R0ekxkQTZLejdyQS95?=
 =?utf-8?B?eVA2UGhRTjRxbkdkSFY5bWJ3SzFtSTZrZ0NTYUlEaVBWNGlsdUVRVlZEWWhm?=
 =?utf-8?B?MmtNUzc5UlQ2RVg1dHFwTnU3VEYxNmViMDB6RHFZSmNzV1M2Vmo4NmRNWk1R?=
 =?utf-8?B?SS95aE1VWnBjSzNaRWNEc3pVUURVUnhZQUppSEtmMVIxZyt4TmU4SFF5WWtZ?=
 =?utf-8?B?UVd4bGRMMThnUFozNXRReTJzRnVtNjYwR0tBVXhsamF4SmVrMEFkQlZIRXVx?=
 =?utf-8?B?Y0p4NFJPZzdJZHJhMElkNXRnKzdaNUEydHJLZDY1NzlmM0NQNDd5bDVOeENs?=
 =?utf-8?B?WUpyZjVRb3RyeDJaRWVQR0RxSVBTYTJYcE8ySTg2Rjk2V0p2N3ZtblBybzNa?=
 =?utf-8?B?a0ZIM3EwYkNGSmJaNDhGYVA2SVB0Y2JOU2pHM28vV1JEK0FtV1krVUVnR1Jt?=
 =?utf-8?B?d29WYWxRVzFyWUlmZmRRMHNZeHIxV0RTK2YzYVUyTDNwbEpTK1ErTkp4NjRZ?=
 =?utf-8?B?TlVSSnpNYmtuSHlUb2o0aHhpdzEyTXZSb2p3Nk9jc0lUOUprT1RzUlF6SGgw?=
 =?utf-8?B?T1c5RFVSS0gvZW5uZE0zWEh6NHZjTmNmUFNwYVJ6aUdvWU10R3BDVndNS04w?=
 =?utf-8?B?UkNaZzBHWm5sRUNhZGQ3K3BqSm96ZTQwdE5aam94VzdNakhUejA2VXdjdmlQ?=
 =?utf-8?B?M1Q3bUUrQllyVHZ4RU9ab2FLNHpFSEI3ZEtwQkIyOStuSFF1TlJZWmJpK3RC?=
 =?utf-8?B?amVqZlhSL1hQcnNUN0F4bkNMdk9VMzlReFZadVBSVGpEYzVZY1Z0ZG5tbU9T?=
 =?utf-8?B?Y2pJNDU0L2g1NDkvTTkxdTloejZab2dIb2hsTXhpY2hxcG9xTDVEMWdDTUVo?=
 =?utf-8?B?WDU3VHMxS3BzVmNSSkQxWGNiM0phNGpod1N4ejR4KzlJcEtBMlBtSXJjYXhr?=
 =?utf-8?B?M3pyRWhuTEgzREoxQ2xuZnhlOVFGdCtncGlwZ3ByY0VzdVkwK3NDNmU1Yngx?=
 =?utf-8?B?dmgwY3ZmTDB6aXY1VUJSZld1TjEvVDNBTlM1bkx2cDZsMllQN0d2SGJGcFFD?=
 =?utf-8?B?bjNJc1dIbGxicTVFS1pEenZjckFKZEZUUEVUT3grOWE3SUVJdUFOdkpyblVK?=
 =?utf-8?B?d3o1dENDeW9nWHZEUmNPZ1R1Y2gyK1NpRUFzazF5SlkxZHZnYXVQcWJtTlhD?=
 =?utf-8?B?V0d0L3VycmlIS3RlMXhoR3VHWXFwSzVONmNTZUNwZTR6bDE4L0syK01PY1Nx?=
 =?utf-8?B?YXkyY0ZmTjl2NUNkZkxLRmlvRzlWYzZDd2IrWjloMkgxdGp0MklEb1VXV0NM?=
 =?utf-8?B?S1RHcUFWMGZQOGUrbmFFVjhVMlE4eXc4R2JzOSsyV0dsNFowTk5PTmJlVFpo?=
 =?utf-8?B?WVdRSFh1MTNRMXVsU09MdG5yVHIzb0pIM2ZPWmFiRVZ1STlidnBZbE01U1pa?=
 =?utf-8?B?Y1BkcTl0aW1wNkw4MjJWdjlhbHltdW1VVy82UE4rUW1DU0FmQnVlclVnNFJk?=
 =?utf-8?B?OXo0bitjU1g2Rml5U1pVNk5WV0ZkRFdNK1lMUTJmRGdCUDA3ZW5qdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c38c7d54-ac41-4636-e332-08dede5fbcc4
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 08:46:30.6272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QL9CCApVlJ6c1SPG4rWbgPjWdItz4Kg+5BxBSonElNnuJ1MJV1JwHDM0ZkfzpwE0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6409
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39799-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[45];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:linux-kernel@vger.kernel.org,m:monstr@monstr.eu,m:git@amd.com,m:vincent.guittot@linaro.org,m:Souvik.Chakravarty@arm.com,m:alexs@kernel.org,m:andy@kernel.org,m:brgl@kernel.org,m:bmasney@redhat.com,m:dlechner@baylibre.com,m:dzm91@hust.edu.cn,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:linux@roeck-us.net,m:jic23@kernel.org,m:corbet@lwn.net,m:lenb@kernel.org,m:lgirdwood@gmail.com,m:linusw@kernel.org,m:lukasz.luba@arm.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:nuno.sa@analog.com,m:pavel@kernel.org,m:peng.fan@nxp.com,m:kernel@pengutronix.de,m:p.zabel@pengutronix.de,m:rafael@kernel.org,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:ulfh@kernel.org,m:viresh.kumar@linaro.org,m:si.yanteng@linux.dev,m:arm-scmi@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hwmo
 n@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,monstr.eu,amd.com,linaro.org,kernel.org,redhat.com,baylibre.com,hust.edu.cn,gmail.com,nxp.com,roeck-us.net,lwn.net,analog.com,pengutronix.de,linuxfoundation.org,linux.dev,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:dkim,amd.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F783738AB8



On 7/10/26 10:38, Sudeep Holla wrote:
> On Fri, Jul 10, 2026 at 09:42:09AM +0200, Michal Simek wrote:
>>
>>
>> On 7/10/26 09:35, Sudeep Holla wrote:
>>> On Fri, Jul 10, 2026 at 09:03:32AM +0200, Michal Simek wrote:
>>>>
>>>>
>>>> On 7/9/26 17:56, Cristian Marussi wrote:
>>>>> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
>>>>>> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
>>>>>> SCMI server from different architectures than ARM that's why remove
>>>>>> ARM/ARM64 Kconfig dependency with also remove ARM from description and
>>>>>> rename folder to reflect it.
>>>>>
>>>>> While I understand dropping the dependency on ARM (I always wanted to do
>>>>> that and test if it worked at all on some otehr archs with QEMU), I am
>>>>> not sure about the whole renaming party ? why is needed just for
>>>>> cosmetic reasons ? it is at the end an arm originated protocol so I dont
>>>>> see it as a being wrong to be named as such even though used by other
>>>>> archs...I have not really strong opinion on this...
>>>>
>>>> I have been in CC on U-Boot RPMI patches which got to my attention because
>>>> I don't want to have another interface for MB-V(riscv-) running in
>>>> programmable logic and have another server in the system doing the same
>>>> thing.
>>>>
>>>
>>> Ah that's interesting. I wasn't aware of that. I still agree with the move
>>> in principle, but how does that align with these:
>>>
>>> drivers/clk/clk-rpmi.c
>>> drivers/irqchip/irq-riscv-rpmi-sysmsi.c
>>> include/linux/mailbox/riscv-rpmi-message.h
>>> drivers/mailbox/riscv-sbi-mpxy-mbox.c(Should be fine as it is just transport)
>>
>> I am having separate discussion on u-boot mailing list about RPMI and it's
>> usage on non riscv architectures because one raised argument was that it is
>> community driver spec compare to SCMI which is owned by ARM. But IMHO only
>> for riscv.
>>
> 
> IIRC in LPC 2024, we did discuss opening up SCMI so that RISCV could use it as
> is instead of copying quite a lot from SCMI for RPMI in some closed groups.
> 
> Here is the summary we got from couple of RISC-V vendors at the time:
> "
> RPMI is comparable to Arm SCMI, but it includes RISC-V-specific services such
> as HART State Management, CPPC, Management Mode, and RAS Agent. The SBI MPXY
> extension enables secure and non-secure system partitions to exchange RPMI
> messages, allows an M-mode RPMI transport to be shared with S-mode, and lets
> hypervisors virtualize RPMI for guests or VMs.
> 
> RPMI development is already well advanced, with much of the client-driver work
> implemented in OpenSBI. Supervisor software can access selected RPMI services
> through SBI MPXY. A permissively licensed reference implementation, librpmi,
> is also available for platform vendors.
> 
> RPMI was created after evaluating Arm SCMI, mainly to support RISC-V-specific
> requirements.
> "
> 
> I didn't pursue it any further following some of these followup discussions
> post LPC 2024.

interesting. It looks like that they even didn't try to ARM about it.

> 
>>>
>>> Now I feel we need some alignment before making $subject move.
>>>
>>>> Based on that we had discussed about it with Vincent and Souvik (we missed
>>>> you there) about using SCMI on non ARM platform and both of them didn't see
>>>> the concern to be marked as ARM only protocol.
>>>> Truth is that some of protocols have ARM in description, file names, etc but
>>>> some of them not. That's why I think it is good time to sync it up and
>>>> enable
>>>> running this protocol on other SOCs.
>>>>
>>>>> ... my concern really is ... wont this full scale rename simply generate
>>>>> a lot of un-needed churn for future fixes and/or backporting ?
>>>> I don't think it is going to be a big problem because it is just git mv
>>>> which git is able to gracefully handle.
>>>>
>>>
>>> Otherwise it may end up being unnecessary churn though I completely agree
>>> with the git/backporting aspects. Just don't want to churn things up until
>>> we have some plan and further changes/users of this move.
>>
>> As I wrote above AMD/Xilinx platform with SCMI server where ARM RPU/APUs
>> (with multiple VMs) and Microblaze-V in programmable logic acting as
>> separate agents is going to be the first user. And for being able to run
>> SCMI on Linux running on Microblaze-V I need enable SCMI on non ARM
>> architecture.
>>
> 
> Ah OK, if the plan is to just use SCMI as is and having "ARM/arm" name is
> a blocker, then sure we can get that done. Hope you are aware of and already
> considered some of the RISC-V specifics listed above and ruled out any of
> those as concerns to use SCMI on RISC-V platforms.

I know that we can't maintain SCMI and RPMI servers running on the same chip 
doing the same things. We don't have space for it and make no sense to duplicate 
testing on it too.

Thanks,
Michal




