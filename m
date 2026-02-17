Return-Path: <linux-gpio+bounces-31736-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLs1A4U1lGlAAgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31736-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 10:31:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8ED14A6BE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 10:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5DA43015C9D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 09:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D801430CD92;
	Tue, 17 Feb 2026 09:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EeFkv5KA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE6430C621;
	Tue, 17 Feb 2026 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320701; cv=fail; b=FjQY9wffJ+NkwpoNdW+ljaslKiSaS/ecBiynyheiIhCqW8SFarCIuL4y4rHrbB58pWpxBJTn/dZsyw+djWXt/p0pR1krhTWYV4UJo5fnqYTS+eph0gkCutsptO3DeoTfwlLoP4C/bZzA1xpzzeyU4+LLAOnkpBJ+cg9qOAdYWo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320701; c=relaxed/simple;
	bh=6+3ILusCWEdPzU1iDgNXpJ8UW2Y+FRpwfIVzQnxX6gU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HvnWZhszo37rkOOtkl/x1EMfWFe0CPpDPrqQpzTvdkQARHtuv5EQD4ryeBWqZky2U07wLgtSgWQUXy7365bGSo3LAY3XO7yAfet0GC+apwOSrVcszhit1Y8Cw9rnkqKCrrKU4OywqZcmZsqm/k4lUVbWoAsGVpOeO7I6riixpcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EeFkv5KA; arc=fail smtp.client-ip=52.101.48.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcfXI6J/l9s0hk0Qor0XyZXEGf2VAaeHfqyALqnqVunXnHpw+9nMVg7sN2UQa9llS4T8iFqbvuPF5QiAhPk6Su8FzmImLsTSF2tGJNjOLO058gn3xDU9s2ICRMCkppz4fHCEThyJdFThPs9n2uU+aDedyNMFu/3PjQCsLU6BAJp5Bp9SJAtV/Afau6rT7UTWBCNl4lOnEFSwvGI4BoURxeKJ1uqu838sTABW7RKEeSKdRCvBlp2WmasBlqDOmQuuDZDBXHv2zXoyJ4L0ViWAQx8BUeTrVUgG0EB4hh/QIt/veqWXO3q/FlQSpCxjmVTToPtNtla3fBW7o0c/mvHM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9sc8oRKeMQinFfqftragE4AvjYnGqq6y2onvZTXaYE=;
 b=mVCYgoAQ8vSokknaPb4wGF3IJ++j2AKL+j4GvT/JteWslP/F8h1gRJ2aLU6PGvNJMXFYkGBglx9uaf29sWGPW0agil2EfBoyHtKP8BUP303SMc8OkKH5qWj4eaVXiEhEWnu4lY9POfJf3kCxcEiBCkTQxBrmCR+xp248sEGjXYqv7Yb9I6+vw+dV/YHggzKibDYhMaTuGjX2ONo7FM8webS88/RnwbY2kIca2bHBzIslPuxXZTehXNvlCw5lOQk2Iflg5tmUceLDVmFIfL8CNAwdNQpAr7wTScTWP7oOA9ia9XhxJHEPUqiy7/R5Q+1EUMScpxz0scG43cafoqV+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9sc8oRKeMQinFfqftragE4AvjYnGqq6y2onvZTXaYE=;
 b=EeFkv5KAfxwQX5Wkd/g1dEbW0yt9VbvyXdPQix6oIbimP1XDbbswghlPkVwgv85E7D5HOTPrE2q84RguaY31sY/bsZ1DAV0x0DP+JUI+kqvUCvLpl0Yw5l2GKoZJLlSnttD0TuEEkSHU1uFE3xCj4aVOOCPke+auE05jgCRvSmaHGK5iTc6kA2Y17LH3xnRUVwZcZTb/NSvVU5WOaKkYYmB4dE3fSTNTbZlEX79w198reUeFBx3f1A3iRFH3MDOt8CeS8oRsw2jnkja8W744ckX+uZ5S5RwDcjcBY3Ji9WgBTsqczqKA02Kgqoxs50QrygV9M8Z/8zC7ZDr0E8TFxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 09:31:35 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 09:31:35 +0000
Message-ID: <751fdb29-d66d-4245-9abb-714d5dd27c81@nvidia.com>
Date: Tue, 17 Feb 2026 09:31:31 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: tegra186: Support multi-socket devices
To: Bartosz Golaszewski <brgl@kernel.org>,
 Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, thierry.reding@gmail.com, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260216045842.1206350-1-pshete@nvidia.com>
 <CAMRc=MdRL=_nRF5g4MukNjgeYGh=Bz3zN7bXEp7RPsLHHyq8xA@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAMRc=MdRL=_nRF5g4MukNjgeYGh=Bz3zN7bXEp7RPsLHHyq8xA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0172.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::15) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: e37a8b8a-4a37-4acf-3653-08de6e0757d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QktSZFVTbXgwSEF4cE94UUN2bElNQU42Y0ZEMWZHUXp4OGVKUFVyMDdBNXUy?=
 =?utf-8?B?VGQzVVg3d3phdmZNWmRlWFp3NEh4M1VySHYxOTlwRmVidkxHNCtVVnFKT3dz?=
 =?utf-8?B?WjFqZHNlSVpzZ0dobmNvRHpXV0Q4RzF1ZXdsWUlHTXFwZEk2M3h3QTczVVJY?=
 =?utf-8?B?bTljR3ozTWovWEVEQU5DZXlMbHloU0l4VFFXSldYNzFGTFNsYlQwQXpzUWps?=
 =?utf-8?B?VHdOUC9rMFI4aDJjRTF2WHhXbVFIUDlZQXo0NmR2WEVUZ0VxblBhSlNDdkpk?=
 =?utf-8?B?V29lV0sxaGRoMVlNUzRlWFJlZmwvWVF1bXBWQ2ZiM2ZGYktmRksvU2x3WFB4?=
 =?utf-8?B?RkxCNlRiSXY2Zkh1bFFDMURYenZwZmt1cS8xZC8wUGsyZ01BWllMa3o3S2JZ?=
 =?utf-8?B?UmxkalFCaFJUaE9hWERhYW9JRUZ4eUF0ZUdqN21uUG5DNnJnbXJnTHd6ZWxv?=
 =?utf-8?B?TklVL2hxazZYemw4cEM3UXNVdEhHNUxTeDhQWmMrMXcwU2pWQ3hDL29kdG9U?=
 =?utf-8?B?S0x0dDI3aU1NRGJZVDlGSVh0eFlibkpleFZrR3B4WnhBbk1ESVVmRVZpTitJ?=
 =?utf-8?B?RFEwMWNOVDh4a0VQak9QVzA5MVNETXBFSUk1QTJXK0V0alI0elZRWTBVNFp2?=
 =?utf-8?B?TU5vV3ZYMEljM0VRbjdMSDJ2RTBRWFllN21DVC9SNXB0MEk3bFg4Vk5wYzdB?=
 =?utf-8?B?U0xsb25WbFpBWEhuWUtzVzhtN05Ra1c4WkhDdGRhRzhvVlplWkZZV0VFdHFQ?=
 =?utf-8?B?WjZ4aHN0WmV3ckhaWGZjMzdVYi9HZEF0MElDWWJiMUx2Qml6SUVsSUV4VkZ3?=
 =?utf-8?B?SUpFU081bm90MXFpNE83TmVmVnl4WUZ1L1B4WDhuK1EyVDFXTnBMSDduZ0R0?=
 =?utf-8?B?VklpbjZqS0wzbytNbVU5VldRYnlNNnk3RDduc0lFdis0S3dFVmpTK2lFS1Bq?=
 =?utf-8?B?bG1OVUdCdkh6K2kwOG10SXJJTjlOczh6Qi9pTjUrTTl3c1ZFOFVHWjRVcXRK?=
 =?utf-8?B?QW9xV1JldHplS040aVVBY1JOYmJJbTlTUVVFNS9KbnNjTmVlRXVzZUpaYWFi?=
 =?utf-8?B?a3dMczhYYTN6RTM3ZDk1QzNON1ZWaUt6alBSWHg0aWhTU1djNTd3MFhrN1Bl?=
 =?utf-8?B?Z2YraXFWd0N5LzJ3K1pkRHUxb0poOTVEQmluamNsaUNQZGJlcDVqdEZlT1NR?=
 =?utf-8?B?Wk1raTZzc3Y0YmZ0U0pIYUVUeEU0UlVaSE92bUNiSlVCQ0gybmNBbitrOVBH?=
 =?utf-8?B?Q3dtWGlQdldoRmpJRWpTZUM0bk03a2dLNkc0VVY2UjAwVGpwNFhCd1gyK0U2?=
 =?utf-8?B?bW9jQ0RXYXRNMEFIRWJvQ2ViUDZnUFB2L1hvU3BpQ2lSM2VabG9iK0lZUFNP?=
 =?utf-8?B?YWVRZkZYV1p0b0JMUVQxY3VTbDFpTUoxb0J4N3ozb2V2RUN6SHdrWGtOakww?=
 =?utf-8?B?VTBsZG5sRGtTQng2RWlJL090emQ3TjdWSjhNbmRjallGWU5vbWR0MW1kemRo?=
 =?utf-8?B?NStwd2NIYmd4THpSalI5Mm9aenRTK2ptNWl3aHdiMDRXVG5NVE1lUEJ0YTB6?=
 =?utf-8?B?UmlaY0I5NjJDUnpXd2dBdEJLc0ZRZ0lVbnBwSVVZL3V6VlVvU242VkJVcjkx?=
 =?utf-8?B?bGxXWDIrOFJxQjJaZ2NnL211YjIxSGFMRTlXSUNENVhXWXY4ZDdNdlNHdkx3?=
 =?utf-8?B?WGdxU0dYUUdwMDVNTzZ2V3FFMkFQaUpnUXRvd3FaM1ZJVE1teUZISG9Jc05T?=
 =?utf-8?B?OXZEYTRjTUIxQmlhdXNwYUw1VDlFTDFOMDdQL3phZWFoMnRUQ2lsbEMrZXJQ?=
 =?utf-8?B?dWI2TElWZE02ZlQvSU5ZTmV1SWMvdWpLK0laNlVlUUhJNVRmVUU1S2hGT0cw?=
 =?utf-8?B?UzRZL1VSdDNlN2VNaktIdDZIenV1c1hoR0MyamxwcUhGMlhkUU9rWUhKRHJr?=
 =?utf-8?B?NWN6YzhIMHJrRGQ5TW51MEtkdkVNRHhwdWJ6S2J4d3JNZElpeDNORWM2TzJn?=
 =?utf-8?B?QlJJK3dIbm4wcGNZdjQ3ZXF6SzNtQmJQWGFaQWd6aFhqeUxDNVR1L1dVWnJB?=
 =?utf-8?B?azZnU1hLTkhacVNFUEo1NDYrdFlPOW5WM0FTYU5XMG5EYlhJTXRPeDdjeXhm?=
 =?utf-8?Q?V/gg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUVWNG5sdVRkaXlFM3NJNU12NHBEZC84ekgycURZaUNGcXJnSXZMWnRGd1cz?=
 =?utf-8?B?SW5QSE9DRDQrdjJmbWVwU2plM25Va3dwaUxYNXNzTWp4UW9VNmVUaU43bU9B?=
 =?utf-8?B?cEh1SUdpNFZLQm5JcXhxT0l2aGgrdE5JdzVQcDNVS2d0K2Q1TFRsT0hrS2RS?=
 =?utf-8?B?OG5kcndxNW5TcCt4QlBUNnlXWEhwSU1ucmxIMG9wZ05qK0lQNG9KWHhVVFJ2?=
 =?utf-8?B?alM1ZmRWOWc4ZTkwbHkxWFZsUnFPdnN3eW1rUEp5N2Fka1h1RHRGM2c4L3l1?=
 =?utf-8?B?SnN3WExhMzl6NjE3YjBFZmZLNHRxY1Q2cytGejFDRHlGc2VsKzlOemtlbGZn?=
 =?utf-8?B?V2FHZVJMU1c2TzJZRHQyMFpIeEVtSjNUZGlqeXMvSS9mRFZrODZyc1dqZUs4?=
 =?utf-8?B?am1GTlVKUVJRMjRHQmxDR1NVZUxnNmF2WTF0aDlmUnJ5WjBWOVhhVWhYVkVj?=
 =?utf-8?B?TFdCZ1V0Y214cXpRNG44RWtpcVhXVXdzZ3R5UUR0MVVYKzEwbXQreGQ4dFFz?=
 =?utf-8?B?aWluNDhvNm1sMzZqR2wrRk1WdnVvRHkxekdXaTdnOXhiVXFwSERYWnJOM3Zn?=
 =?utf-8?B?M0pIMjBBOXJBemZsb1BaSnluT3UvKy9TcnZnQmROUnpnd1poZHY0eGgyTmVJ?=
 =?utf-8?B?d2c0d21qZTZ4QnVMMklsUjRIT2J3YW1nVDNiUWNsd1hkT2V2Z2VPSmpOb041?=
 =?utf-8?B?ZUtzZzZPUzIrVmZkZ2xLRmFWSlltNTU2ZUdXYjRVeFp4Tm14blpPVzgwU1ZS?=
 =?utf-8?B?YmcxYWVBVy9XWDdCU0hNWVpiM3ZNNzlqRk12djN0cFpHZmM1RFBlNy85NmNo?=
 =?utf-8?B?MXpHMFFBSysrbzUzdDhWa3NFUGpRa1dPK0h0MTJzY1R6Y0RpUXZ2b3krSGlo?=
 =?utf-8?B?SGludS9GQUZaMkFkSHBhbEx5K0VJMXcwSVBaYmJBeDhSUmwzR3NpRDczVDVj?=
 =?utf-8?B?SnB3djR3VUNNenB1WERNb2xrRG5wQUdaVzhyYzJjVjAxU2FrNzFtTzRDeXhp?=
 =?utf-8?B?MnRxUGlYejBVQmJreTJUNXJVTUUvY1VuZElYSDN2RjB5dzFleHBLL1IvWlZ5?=
 =?utf-8?B?RGRFd1V3WEdxeVhtZnBYbTRQdnl5WklFdWQxTU5HNDdpU043bkd3T0dmUk05?=
 =?utf-8?B?Z2hHT0c0U282ajF1UTVNb1VRclNNcHRvaHhrYzJ4NGpEWlhwZHA0L0VWVTh0?=
 =?utf-8?B?bmhOSlJIaU9LMEJiSTlRMmRjNVZ5cnRrZDdDRUpCbGhGK3RTY0JMVWJ4cjBx?=
 =?utf-8?B?dWRacHk1dGNKQWJOQTE4L2FNdTUxOFg5dDFsTFZUbzdOL3FjZDJsUHJTVXlF?=
 =?utf-8?B?OEFCZC8wRHl1ajZJVko0eE1UckQ3SWVlUU5hQW9kVExSeXpydk1tdEJUWE9r?=
 =?utf-8?B?aDRSYVk1VVU1SFFsak96V0Z1ekJCaXZwR1ovSjluUE5ER2ptMWJmazJzZC9S?=
 =?utf-8?B?K3UxamtSYjJSM0tuRHNEM2xaRTZmcFdQL1lHSkhFd1htbXd4Vm16bDFrcGhS?=
 =?utf-8?B?OFE4YUlHQ0EyeUN1eHlyWmpUcW1CQ1RWekRrSnZydmhKNDdOcGhhM3A1L2ty?=
 =?utf-8?B?d2ZwWm96TEZBM2pzVmcrV2RzVThlOWVFYkVkK1czb3I3aTlzSEtod2lTeXMx?=
 =?utf-8?B?SmZ6OTRrdWRFY0V0a0VrS3ZJWUVVOXJZaWdYNkZVQXdaVTN1NzFaQWdkZlQr?=
 =?utf-8?B?MlZ4eHA4Y3J4N0poUUFCbzFDMGUydHdWcnZBTzdBaFYwaUduUkxPc2NxNkdO?=
 =?utf-8?B?b3NjL3dQc21mbEd4bHk3S3huM0ZaYnFZSmRmSFVRQjB6MEV4aUkrNEhFSDY3?=
 =?utf-8?B?bnZwU1RVaWt3VG01ejQzN2tjQnBZTGlCMkYrYWdMUU4yOHQwbERNMjRjR1J6?=
 =?utf-8?B?RnBrekJOU25CSVBqMEx1aDN0aElvdGtBUmgyN2JocmExV01HVHNTekFqZzdr?=
 =?utf-8?B?c08yZmxUV3BsRSsyQ01pcGVnZHB0Q0VhR010d2lzT2VsSys3RmVOWFNKWW9o?=
 =?utf-8?B?cGNPbEUrbld6QmNBQmw1OFMwbUZxd2V0bXdYdTV2bHRUWk94NThHMGMyZ2Yz?=
 =?utf-8?B?NDgvNXp6ZVB6U3hNZUU5M05BRVNiOXArbUFOeFhnVFhDRWVTWlROK0xsZ1Zl?=
 =?utf-8?B?QjJEa3p3bXkxaUEyODhiZ3Zzb3NkRU1TeTYzNjdIS1ZwWUU0dlFKbDdZWWl0?=
 =?utf-8?B?SUFUU2w3VjFDV2tVK01sbzlTVk82ZGhhZk1ZeW1tbHprSlZyYXhrL2xEWFIv?=
 =?utf-8?B?MEE2dE16am13TlFpVzVzUEk2bzdNR0Q2OVlhRVpHYU00ZGZJdXpJTG9hSXIz?=
 =?utf-8?B?RVNEc0xpdHB6M0tndGNhSTBhL2tEbmlLMUtMOWNrRVIvTklmaVByZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37a8b8a-4a37-4acf-3653-08de6e0757d5
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:31:35.1382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dABzYhTTpGRGvYUuqGZZlpTJUU9MX9v9qOizYdsC45HLx163mhkEmymFuaZw9F64MvK/R+JCfCIBBLKJ8WbYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31736-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB8ED14A6BE
X-Rspamd-Action: no action


On 16/02/2026 11:29, Bartosz Golaszewski wrote:
> On Mon, 16 Feb 2026 05:58:42 +0100, Prathamesh Shete <pshete@nvidia.com> said:
>> On Tegra platforms, multiple SoC instances may be present with each
>> defining the same GPIO name. For such devices, this results in
>> duplicate GPIO names.
>>
>> When the device has a valid NUMA node, prepend the NUMA node ID
>> to the GPIO name prefix. The node ID identifies each socket,
>> ensuring GPIO line names remain distinct across multiple sockets.
>>
>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>> ---
>>   drivers/gpio/gpio-tegra186.c | 26 +++++++++++++++++---------
>>   1 file changed, 17 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
>> index 9c874f07be75..daf5aaffa28a 100644
>> --- a/drivers/gpio/gpio-tegra186.c
>> +++ b/drivers/gpio/gpio-tegra186.c
>> @@ -857,7 +857,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>>   	struct device_node *np;
>>   	struct resource *res;
>>   	char **names;
>> -	int err;
>> +	char *instance = "";
>> +	int node, err;
>>
>>   	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>>   	if (!gpio)
>> @@ -937,17 +938,21 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>>   	if (!names)
>>   		return -ENOMEM;
>>
>> +	node = dev_to_node(&pdev->dev);
>> +	if (node >= 0) {
>> +		instance = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%d-", node);
> 
> I've never noticed it before (and it's not introduced by this patch) but I
> really dislike the child device registering devres nodes with its parent...
> 
>> +		if (!instance)
>> +			return -ENOMEM;
>> +	}
>> +
>>   	for (i = 0, offset = 0; i < gpio->soc->num_ports; i++) {
>>   		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
>>   		char *name;
>>
>>   		for (j = 0; j < port->pins; j++) {
>> -			if (gpio->soc->prefix)
>> -				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s-P%s.%02x",
>> -						      gpio->soc->prefix, port->name, j);
>> -			else
>> -				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "P%s.%02x",
>> -						      port->name, j);
>> +			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s%sP%s.%02x",
>> +					      instance ?: "", gpio->soc->prefix ?: "",
> 
> instance can't be NULL here, can it? Either print it unconditionally or
> initialize it to NULL.

The other alternative here is that we just use 'instance' without the 
ternary operator because we initialise to "" ...

  name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s%sP%s.%02x",
                        instance, gpio->soc->prefix ?: "",
                        port->name, j);

Jon

-- 
nvpublic


