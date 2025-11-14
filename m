Return-Path: <linux-gpio+bounces-28480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F38CC5C7BE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 11:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FB863BC95D
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 10:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F60B13A258;
	Fri, 14 Nov 2025 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="czYAiytA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF59309EE1;
	Fri, 14 Nov 2025 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763115001; cv=fail; b=AdI+sHlW9fR/fVY0lCmPeeBaq5HzSx9nu2+BXnY0NJ/x+bROOjzyNhoP+g86gknj7DqbXyP5QapuHi416u3U1r0VcGxH3/5jzI1WAGgbVOSvJlx0XOGDpq+2Cc7BYosJCK5mdmCkBuqy9r/L04seCgj6+MnkJMh2xjFpyqz6MVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763115001; c=relaxed/simple;
	bh=7Ya8q2AdfU/ifL8hqM2izRmbcQfJSJm0ZBA4iuP0MQo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d1wqwDe2WJSIO05L4JJAxZknwK7vqZlBPlOM3Ypf30NseE1gKYb1ORXyFclV0rCNsgLQx+QiD6t1ciOFl8pLFonHu0rbWi2t2G53QXpp1pelyyYCKtZsazQfCivbBuACdDzVr/jRngK6BUJbfwWUd2zwXKLx9EGJORxpvnW4mOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=czYAiytA; arc=fail smtp.client-ip=40.93.195.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxVorSc4D65t/AMdj8eLS+VTeNqkBljQJfcBaM+mZ68kIrzB+9qiO5lG6/M79bWuM2yTRa4KVPVUIoi3Ko8r/d2X7oa4IctnhJwZ2KE3A8QsDYN3Mbp7PiYkxrPeKow3dDdNrBRYYUNYjtnj2NivDs/qAgi2oHBbT0KWzy10nzJ+h4dMZDpl4ufATU+oBK4HDMzW33oUjNVb6LDjc4WxtVWRaPd3Ex4lq13V6knPCBiptNS/9YvgkLD0U7q4g6DrIZ900PyPZvPrXnEuMTHV1W54jQMXG9oe+2fYHeU57lRcZifZEOg3Q3YgGQpPvdp2juqNJcyh+/qWtWhEuWzIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GSKQ0fraRvDvpAsv/SEz7NtlCGNFJzlTtrJlz4pXZU=;
 b=Y6+NNzqG6QDNYLZ0OrhVAv2okJ2SVamatfwOTtDNoqfNB775HYbeOF4gd2NaryCDvRs7qbQ3bSaHjlHWS+AgWXd5bqoYTdcNcjNPpQn+jJvgXWq2zGI1NAUc8k6i7GrYI2f5/D3oc0CCjTVAPG8eRlKQGZ5emlqcxDsbSfzgOOODzpLUOp6SfgWRPkNoqxtmXIga5s5iYfYB8KfD+FN9sQPz8GYcJBVqr61QyX3Tb8LCUsX1gmxzxI4LQp4Oxibd+LKffQNWL0ZBmufSI9KmjLp4QyI3accE1bHCrTg9b7P5p0EomQQVCAVry3FvJ7rizKz/fq1Dseo/xb+ss5DGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GSKQ0fraRvDvpAsv/SEz7NtlCGNFJzlTtrJlz4pXZU=;
 b=czYAiytAI1I63hXTz2ji+VC5/4LZCRmLyXrUUJcZuLllLrdifd33qPMeApzWCEUoGwlaBSpwjsCuiBoEtKS69IcJGtXfvAdUofOkZZiN2n640Jae7SxbufzDcdMfo4k19hGt3VBZFFWrgKfYtVCaC2j2wTUjRdOcWBx+HLuyvh6BBbTo/v6cXVryKQZxpIdgShi1TLUEYdWlr9FZWdP59ZNIj1wgAlrCGVOmkjs04eITM5zQBHUXUzaWl+0DKnjUISWd7utF2L/TSuXAKw9dtPoL+HOgMeUdhHbCrlwHwSi8ZxG3hbR4eTFNqmMesOh49geEWuK0C0YaW/72MrYM9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA1PR12MB6163.namprd12.prod.outlook.com (2603:10b6:208:3e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 10:09:54 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 10:09:54 +0000
Message-ID: <c21580ab-8da8-4a0d-a575-4248c40a58ef@nvidia.com>
Date: Fri, 14 Nov 2025 10:09:48 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: tegra186: Fix GPIO name collisions for Tegra410
To: Kartik Rajput <kkartik@nvidia.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, thierry.reding@gmail.com, pshete@nvidia.com,
 nhartman@nvidia.com, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251113163112.885900-1-kkartik@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20251113163112.885900-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0190.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA1PR12MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: bff62a4c-fee8-4f98-0357-08de2365f4b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2FMNDJ1NEtKWk5rVUh6VURLcWJ2aFc5UTNYVUdnUm5XajhzR2FjRytsNjV5?=
 =?utf-8?B?SnltVHB4T2dyWllaK3VCWjNpVEJCU3djM3JnOXNsQ2RMLzlFU0RzSDBVY24w?=
 =?utf-8?B?S0Vxd2VyN0NEbFo1Lzg1b3hNYjNOSjJpNWluMWMvcDd0T2JXYVNNN0xmTURJ?=
 =?utf-8?B?R0J5YlFKS0p6KzNhRFBaY3l4REljOVRwR3EvcU9lSmFNc0RTK0x1eVN3SHky?=
 =?utf-8?B?NFlCU0ROa251aU93TGZDK3FJMGRDejRZR210RnJBclRROUZCZU8xWU9iYTVv?=
 =?utf-8?B?MkpUYWZ3cmFXVEFFR1lIMHpmSjd6YXJYMTFUNm50NjF6ZHcyY05IMHNiblZF?=
 =?utf-8?B?empBVFEyaHhOZFQrbHl4UmhBQjR0aGJLZjl2M21EaHNSTHJIU1YzYkJkMHV3?=
 =?utf-8?B?VFpneGE1eGk5TVFKckRHTjVsU0Zyc2NUK2gyUjZTaUt5Vi9RaU04TDlNUU1G?=
 =?utf-8?B?Nlp0bXZUOHNzc2w2Y2xJUHVrZTlrcnZXZjRFTWtYY3R2RXArazZBZWN1U2pD?=
 =?utf-8?B?RlJ2aGl6VFV1R2libDlrSXlHTkNiWE1sRXRZT25CVFZBYkdGa0pIVjIwMmZN?=
 =?utf-8?B?SkVWd0xWRHhEQzFzeXpNU2VxbHRDOXpQcWxScEdQQTdKU2lwNTlSam5OVVhQ?=
 =?utf-8?B?NjFiT1NEVHQ3em5qeXlJemFaTG9SRUFMVTFxSHIzeitDOGQ0NU5WVnVtNFZG?=
 =?utf-8?B?d254L0hrWFZIK3R6Qm1nRy9qa1lpMVJuK0dlQkV2c3ZFVVZib0ZZZ0lXN3JB?=
 =?utf-8?B?Y3dSaGF5Z25ieDU4cGx1c2FTMGFDeDY3bnNMRmxnalpGNzR4a2pxbHBEd2w1?=
 =?utf-8?B?OXJpZlo3Z0NZN0twdWZLUGpFcDNHNW5ycGU0bXJCNVlCSjYwOUZvUHk2V3I4?=
 =?utf-8?B?YlgzVjVFU2poTTJmZGtSbEMrMzNQb0IveExhcnQ1MFN5WVN4T2I3cFlhbXBC?=
 =?utf-8?B?WXJ4VWlCSUhXVEZBcjA3SkxnMHEwMldBTE5iK2lOOTZMUDZ0aXRLa2ZUcEww?=
 =?utf-8?B?VlBIUTJqcGJEM3RQV1dNM08zai9SVHlacUdZUWdESjBZZXZacG95OXNqVlpK?=
 =?utf-8?B?MmxFMnVlRVhrMEMrY1ZFNk1aLy9EcnFTUkk0YjdEbU5jZnM3dTJVUnJVM1po?=
 =?utf-8?B?UHIvcDZxMldxUENGWklRYTE1eWY1YStaN2pDOTljaTNlek9VWktSNXRIN2VX?=
 =?utf-8?B?QTJ0SXl4TWNRTDZCK3NJb2FSNXcvcG9xcmJWWDB1Sk9oUWNZVmUrK0huLzVS?=
 =?utf-8?B?VHhyUDdPc1E0bjAvSlZ5UUxQeDlOMG1XOTFhUmtWdFh1WFZJWS9yVXlhSys3?=
 =?utf-8?B?SnF3eFB1MUhscnMxajdra1J2SHRyeXk0TTdIMmx3Z3FMZWZhUFVmWW1LbU5y?=
 =?utf-8?B?UDNrOXZZdmtiYTA0YWIrVmxLMDllNDhRdmlndThOVUFPWWYzWmM3bUsyNXdY?=
 =?utf-8?B?RzNkYkNBaTg3dVpPS0E4TEVEb2hrcnIrN3V4cUZpc2pIWWVDOWJwUW1xUDRY?=
 =?utf-8?B?RTZKSCtXTUQwWnJVZ0pDZnpMTmNaWmJlNG1RM2lZUGZvZGVSeGx0SGQweEtq?=
 =?utf-8?B?Nng4VlpVZHcyZHB4SXF4OVZmcGdLSjU0djYwcXYyYVdkT3oyZ2VaTXgwRVYw?=
 =?utf-8?B?eFBIeXdZUjJ2K1VmU1drOWRoV3NjZThyMGtWTDJvS3hJV0NyNzJBVlFTa0hh?=
 =?utf-8?B?ajJKWmc3Q3dwN2Vtd1NVQW9VNytrWkc2OTU2NTBDRDlvcVRETWUxVENzbFA4?=
 =?utf-8?B?UHBHS09YcmdOYlVydmtJY3EyMGprV2pQOWxRYVJ5dGFHU1lsS2NKY1N0Y05O?=
 =?utf-8?B?aFZlRzdvT0pkeEtUMEUwUHozT3BWNGpTMnRlRmdSbjlCeTJyRG4zYmYxS1BN?=
 =?utf-8?B?UTlSU1dqTUUxc0RKckhvaVpYdjJjYXNLNlpaZlFxc2JTQWpLSUdvZW5KSkc2?=
 =?utf-8?Q?o0xiAzpS5Mrhs2lM6lQP1Ez/D2NScfyr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0UySzQyUEpsbjRkUFJlbGM1MlkvZ2ZHZkxqUUhqazdFY1J6WndrWGdXZ2tN?=
 =?utf-8?B?Mlp2bHErTkJtY0s5YlZQb0hXTkhMS1dPZlJBQks3TTlyanRCYzBRRmFlRjNh?=
 =?utf-8?B?bldVU2FXdkxhVS91L3JMWXFwKzRoZHNWNG42V3ZhekRqVHhncHJPcGQweWFw?=
 =?utf-8?B?NkJmT3JyQXNIMThUblNwcmpWN21GRFlpQW5SY0p1aXlsV1pDOXB1am9ZdU16?=
 =?utf-8?B?d1NWMHZ0b3d3WkNSMitacDZOMEJJd3hHMDhEczUxeXlCYU5MUlg5OFBVb3NX?=
 =?utf-8?B?aXRUU0V3OEFXTjNUK0Zrb1d1MlNjQnZmTzVPZXUyRlpCRTR2aUtGUSs5U2s3?=
 =?utf-8?B?NnlmS3VnSU1qZTFOTHZUZzlSeXZ5ZVBNVlZmMjlBMFRva0cwMzlCOFFLK3Vv?=
 =?utf-8?B?VzVTSTcxZndHekMxcktRS0w4Y0d2bnd6Y0ZuRjFHcWVRTnYyZlhpR3FJdm4r?=
 =?utf-8?B?OTVQMlo4UnkwVmc2OWZmSXBHN09NWHRhTHdrbFBKNVRnaUJremhCZ0NTcnRh?=
 =?utf-8?B?bWhPQVRxOFZVN1JQYkpUaURXQ1VXT0VwWDJvYnluZFRjV3dWNlBpSjlJQi9a?=
 =?utf-8?B?UmNyV1IyMWM4S0YrNktXbmd2YVB6dkkra2VzUFRCaDkvUlo0MDEyeXF1NE9p?=
 =?utf-8?B?cjh2Z1hmczNldk1aSWRBUHNGZy9LSDRTd2NzSGswalowSzA3aktPL21wWGlu?=
 =?utf-8?B?SEZ6YzRNaHcwOERUTHQrdmZjZ2tnS2kzMEJSemlEVzA4L1IvWGtSS2FCUXBj?=
 =?utf-8?B?b2tITEpYS3JKYXRUMDJ3UE92bWdIbURMa3h3Y2hxeXY1eURaTGpWbHFGSWV2?=
 =?utf-8?B?cU9ncFNkTUxUMVNZL1ZNRGwxYkFuNDRlakZ0MlF5WUxKK0wzQUFxajFOSmpo?=
 =?utf-8?B?WDdmb1FocUQ4bWhJZjJHZG5hMkhqUVpTVFk4eU44Uys4MkRpeHdTQXk3RU13?=
 =?utf-8?B?dXpDYTBmekJHakpLZ09zOFVFM01QQUlaWlRtZkxvZGJ3YUptdlZBSmZibXEz?=
 =?utf-8?B?QmRqVVZmZUR6Nnh6clRnT0VWaTkzS0JubUUvVmV4MmRkVnZnbW40MHdoVzUy?=
 =?utf-8?B?bzVhNWVMRCtKWXB1Qi9lWFRjZEJwSkJ1TmxhN3hsMGJFT01WVHdTMWpMYk1V?=
 =?utf-8?B?aFhsa0FFWFZlWHUycjVBWFRBaFlubnYyQjRNOEN2NkdwZCtGcW9tbUFpaU40?=
 =?utf-8?B?a2hhYmtrSHBGQTFVcXBHR2QzZWtXUCsyeXNYUTk3Qy9CdEVYQ0pBSEh2d2VN?=
 =?utf-8?B?Mkt6bEFHNUNEc296NytpLzRPbk5rb1JrUHp2UHlBT3hKa1JlMWtaMlJ3MDlr?=
 =?utf-8?B?NGZzc2xCNG1qS1V0OG5WUHRyT09qdjdwb0xBQVI3cUI3STlRNWxjV05EV0hT?=
 =?utf-8?B?SmlESHY3T0hFZFBTTXcrdDdoTnRXaGdXcEJCZUVyb2VZVVc2V0p4QlRLcUFt?=
 =?utf-8?B?Nkk0U0F5akszMXZ6b0NRcHNwZEtvWE5wcFpFK0d1a00zNHBCUnpVMUxYdkly?=
 =?utf-8?B?anlVbjkrSHZBVnBIRVZHOUJtVkpXWk8wUGdMQW9KV3k0VEp0SDNWSWRWRFRk?=
 =?utf-8?B?V05Bd0dDYVJZck1MQ1lHMmQ4aGFPM1lWY092MS9xNnVVcFFwZm0vV2w0MExF?=
 =?utf-8?B?Mno1aE1BaTYxdGNCbVRLMFB0ZktIVnlzNVdxWlg1TjhxQ3p2eVBuOWFxR0xz?=
 =?utf-8?B?eVdxY3BpdDNBbnZoK016NzZLQzBEaWE4NUlaazVqQ2NsWTVKUk4vcVFZa1Ux?=
 =?utf-8?B?YnN6MDBPdXFrV3BLUG9haE9NOTlobVhpcGdCKzVWSkhWUGZ6OHdDdXlCUnl4?=
 =?utf-8?B?d1NBd1BvN2hxR2lTZm5DYmdPdXoxd0xvNktlUWR6dGV1Q0hJM2hRZWZHZlkz?=
 =?utf-8?B?dWR0a1h2c3pmOEIxZVc1dlBIT1dZVk1UNHhXZ3NaZURqTi9peWxJcTJFRTdW?=
 =?utf-8?B?M1psV0l2VWl0bUFhY3N3czhZc3FNZHlkUkl1L2xDRzczNUtnV3BRS2VtZk00?=
 =?utf-8?B?TlZ3WWVOK2pYeWVvcHBYOUh6dXA5QzA3OU5mTjhpODQ2TUp4dnFzWHV6bzB1?=
 =?utf-8?B?bmU5VVFBQnJBL3F3WHJaWHpkN0N1UllXM0dhbkRhWUMydmVJQlV2bDFLV2Zn?=
 =?utf-8?Q?BRXAa1QUlp60q/BRIgO9nzWsB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff62a4c-fee8-4f98-0357-08de2365f4b6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 10:09:54.0083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQM8NwoKoqB6fjU6EbZiJy8PNCNU8UGX8FXWoYq6TWHIEpk7N/z88dFArBTkIDeWv1VVfZTXQ8AAk5y7lSUbNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6163


On 13/11/2025 16:31, Kartik Rajput wrote:
> On Tegra410, Compute and System GPIOs have same port names. This
> results in the same GPIO names for both Compute and System GPIOs
> during initialization in `tegra186_gpio_probe()`, which results in
> following warnings:
> 
>    kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.00'
>    kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.01'
>    kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.02'
>    kernel: gpio gpiochip1: Detected name collision for GPIO name 'PB.00'
>    kernel: gpio gpiochip1: Detected name collision for GPIO name 'PB.01'
>    ...
> 
> Add GPIO name prefix in the SoC data and use it to initialize the GPIO
> name.
> 
> Port names remain unchanged for previous SoCs. On Tegra410, Compute
> GPIOs are named COMPUTE-P<PORT>.GPIO, and System GPIOs are named
> SYSTEM-P<PORT>.GPIO.
> 
> Fixes: 9631a10083d8 ("gpio: tegra186: Add support for Tegra410")
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/gpio/gpio-tegra186.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 83ecdc876985..b1498b59a921 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -109,6 +109,7 @@ struct tegra_gpio_soc {
>   	const struct tegra_gpio_port *ports;
>   	unsigned int num_ports;
>   	const char *name;
> +	const char *prefix;
>   	unsigned int instance;
>   
>   	unsigned int num_irqs_per_bank;
> @@ -940,8 +941,12 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>   		char *name;
>   
>   		for (j = 0; j < port->pins; j++) {
> -			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL,
> -					      "P%s.%02x", port->name, j);
> +			if (gpio->soc->prefix)
> +				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s-P%s.%02x",
> +						      gpio->soc->prefix, port->name, j);
> +			else
> +				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "P%s.%02x",
> +						      port->name, j);
>   			if (!name)
>   				return -ENOMEM;
>   
> @@ -1306,6 +1311,7 @@ static const struct tegra_gpio_soc tegra410_compute_soc = {
>   	.num_ports = ARRAY_SIZE(tegra410_compute_ports),
>   	.ports = tegra410_compute_ports,
>   	.name = "tegra410-gpio-compute",
> +	.prefix = "COMPUTE",
>   	.num_irqs_per_bank = 8,
>   	.instance = 0,
>   };
> @@ -1335,6 +1341,7 @@ static const struct tegra_gpio_soc tegra410_system_soc = {
>   	.num_ports = ARRAY_SIZE(tegra410_system_ports),
>   	.ports = tegra410_system_ports,
>   	.name = "tegra410-gpio-system",
> +	.prefix = "SYSTEM",
>   	.num_irqs_per_bank = 8,
>   	.instance = 0,
>   };


Looks good to me.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic


