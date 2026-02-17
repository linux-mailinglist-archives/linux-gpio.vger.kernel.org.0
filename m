Return-Path: <linux-gpio+bounces-31737-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBENFTM2lGlpAgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31737-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 10:34:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8A014A6EC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 10:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6112B30166EF
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 09:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40D130E825;
	Tue, 17 Feb 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PI7sH9cI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011016.outbound.protection.outlook.com [40.107.208.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C08830DED7;
	Tue, 17 Feb 2026 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320880; cv=fail; b=QXd4eVFzSoiot6k1phevJYel1Va2m9V3vHDixX//tBOHiam1nDAIZh8skDIfP7PPx42dJEg1HBchleiIFKzV2ClYI9TJLMybXmfre9dtftkI1t6yU1WWhsqd5l55tf+4lX9YZRYjnBGraTBEoeoYajYi2QHixA6W+gGErDw8INY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320880; c=relaxed/simple;
	bh=kfeC8+/6pG2PExanqnZj7yYz1ooIIF0fm+fmtv4g3yQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XWql1iAm6sRT87y9hfby83k26WNAHf/bNGg6HOhFUbOfcmEEKSqxTHPK3McZt8CPDnEMIkO7Rf+xmkJitm18asgM9JoG57g16EsLG000VxStdrRVZrHnvsVK8AbW1EBf4u/T+Q0TGLFVO3XU0dT6JszWdT5Or9XxfSAerqNTN0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PI7sH9cI; arc=fail smtp.client-ip=40.107.208.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eagiHLQnpZH5LWVBSNDjwimiEbGfLGU+sL8IjsSNZ/TNBTYS4L74kGGYYnLra7mg6If1Ls9r2ZZJ17gXWXX/g85KGEK5q7vbOgv/dVNBrcqSwrk+sZiiXx4Rf6adUURWfooS4flBfg0LvradFPvhsr4OQOG8Tk2whZDnRYBtA4MiROsL+1NxQrK9anvfXXPBvybBErEDL/tzsm5bAzQ5+9t8k5vRr/gxY+1ciGjde/uOR9AlzUcr6Fj/DG+3K3WEP4Ee2+tj9Hj+GrMklJ6gysqOmLaCDGd2wZwVqRR/mHD6jf7D/uj/qEUF1BHE/O5gl3wIIO9q0ZhiimE1KIjRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UesUlpfGuman8y0burSnmKQP4hpmtvq96UuIhUgrgoU=;
 b=LpJuq/SwQ1f/kYGsyzfO7FvA08aGDBfalmUw2qyaKCqgmIzwkkdK0lGs8FAiRK6/RQ4VukZQHYAA2CzLgepHT7sFGEZ3lAojcWVECLZTd8vvuuqSSDSBLOIB49JQXpKHuRbMnfT9LvOKb+925vsHnwcrLXzv20wkHvYCjgId7217HCodogJehumIl9WLMe6YxiBMdCpeKdoL7wMGW7Q6PSv+l8ns3eb85Nu8q01nNYKclV5+KeOeU6iNvVJPto97ANIw+0+FIuj59GZ7cM9HCDsg1KFzcT37PVuaQhkR4Qaf80QlF7R7Jm8frLif/OtOXD0IYzGsCVesZuJa1MMZeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UesUlpfGuman8y0burSnmKQP4hpmtvq96UuIhUgrgoU=;
 b=PI7sH9cIRf2hEOPiRHyDi8WvPyNyokgri1ucpkQOVHyZuQ/k1LvbGQKVr7djGlP5sOb37Gz6OG504qfDSnQiXzqDj1HRmAhNPZafRH/MmFNDJPjg+sPIDiGpnWlIaiVPOR5ABROcHVd4EEjOZSFBwveEM824fHAZ77IifmcCR6dMfpc9lAIlR11fyBSf4tsrN9Xo8LM8tzYaQD4gRt390Fl+udmOiouCUGJLhbqQ9BBqIDHkr0KBRtylS0IgrqzVae54YmYj1P1T1cD602/3hYX1JA/WjKDUSnIC+Az/g2JEIpEJqiLUX0v0I0txn16owQKhhs4goOUXps8MhHcEKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 09:34:36 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 09:34:36 +0000
Message-ID: <5b3fae55-23a0-45a5-9690-19a7533fcc3c@nvidia.com>
Date: Tue, 17 Feb 2026 09:34:32 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: tegra186: Simplify GPIO line name prefix
 handling
To: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org, brgl@kernel.org,
 thierry.reding@gmail.com, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217081431.1208351-1-pshete@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260217081431.1208351-1-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0401.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::29) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3fb85f-7f72-4922-9fcc-08de6e07c3ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZThhVFV4dUZobEFYY3o4Szd2QUNQUUdTNnFsUzU0dzdESEdtTWV1SnhpL0Ir?=
 =?utf-8?B?aWZWRzI3Ri93QVJpTXV1UVZIYmMrcmE2Y2duRi9DemU0UW9pWlNWVzdDMktQ?=
 =?utf-8?B?ZjR6SVBSbWVORHlHdFk4bUx5OEZ1WXJTQzRXeE52SVRYa2t5SHRvalZmakQ3?=
 =?utf-8?B?THZrR29HanYzakozSEpWNjJBYnhWdUdIZ0VxcFp6eldad0UvQkJzU3Rtbita?=
 =?utf-8?B?OG1FV2RvMkQ1NmcvSlcyYS9UVWtCaWRsUG0yUEpLcUkweTdkTkpQeXJwbktx?=
 =?utf-8?B?NVlNN0ZHTG1oazVTcWorajZRMjNnNVFpMHhPd3FZT0EvR0tJdlJ1ei9uWnd3?=
 =?utf-8?B?eER2VW5PVGFSY2ZRdGNqUi9qRFUxUlRXK2N2VXBTRXpzQ1hiUlhZTTNvYXd3?=
 =?utf-8?B?UC9WK3FQWkpCZW1IN1paK0RsdThzaXljdENZdTFlelRISU83RmoxUXB0NjV6?=
 =?utf-8?B?SkphRG5NTWFKaFlzemo2ZlhoSXpuL1ZnSlIrT2thbTlvbEZTKzJ0bEw2YU5S?=
 =?utf-8?B?QUc2SmNTWlBBcUtRTE9oNzI5aFRGdmVOQWp5aVhtU0RRRUw0bm82YzNPSUhL?=
 =?utf-8?B?N1RJT3ZZcllRRU1WaFE5d0JLV3NCUGFWMzdaTmpMd2NtS1JoR0xKOUt1ZHJ1?=
 =?utf-8?B?MG9uZDBGc2ZzbVdJNUlQZ1FRTHhobTdVcS9yT3BLQ1ZVaHg1cXQzdDdLeDlV?=
 =?utf-8?B?UERuNng0ZGZPNzhhOFcxK0MzOXl3WnJjc2RoNjMrNEpZZ040UFNMUUxmYyt4?=
 =?utf-8?B?WDUyTFBHcmJjSzFFazd0QWdhZ0hxVkVaUUl4ZFp4dEhQdU5nMWxUUXoyQmpk?=
 =?utf-8?B?MnNiYm94ODNCV2h2ZHZWZDI0RHlLV2VMSnVKUXpScE8yK09DSGJ0RW1mMnRz?=
 =?utf-8?B?ZjhNOFFONUt6OTUweEZJS29RRWMwZnNneEVsanVqOHNqcDNNWThib3NRcDZB?=
 =?utf-8?B?eDVIbjNYT1pRTVAwbkRnREY1V2hKY3Z4L2FNbEY4cmlBWDMwZ29UR1FQcWw1?=
 =?utf-8?B?ZlV1TmJ1eVE5bzY2cGxOclVLR1B1eDdtYUZVVXhnbE0zbysvVVMwcUtTSTdJ?=
 =?utf-8?B?dWpsbHFDYkJYZVJSazNHR0srYUxadFA0aDVjMndXVWlwbDhNeWF2WnlQWE1z?=
 =?utf-8?B?SWYwTGdWK2VJb2p2d0JjdDV1QVhuWmZvUStGZGZPWkhCTmNnVVlqWEE3SENM?=
 =?utf-8?B?ZjhIYkt1TVpwQnZnZFRYcjZTaGo4WGNCRUxmNWhVeVhxbmxjVEZGWlh1aDgr?=
 =?utf-8?B?emxyWG1mSDFvdHgzOXpXK3pQSzlXVFZJcVp6RmRBamlJU3h5QW1pMXV4VjIy?=
 =?utf-8?B?eGRWdXpvcmJPWXNnK1pSZjZieDdIYm1xbTlaaVVPR1duK1haUzg5cXdwNkUy?=
 =?utf-8?B?Zm43c0xIQTBYNUUyVzVNOXN2M1hJbXJqUG9JcGQxTldpYWttc3JRV001UlZ1?=
 =?utf-8?B?SUhuczZ1UjlOV2J1RldldWVKYTRDcFlUeVY5elQycFRsWWxKKys3VUNuK0VQ?=
 =?utf-8?B?VlJiS25YWjFvUG02VlkrYWtWUHZlVlNWTnpUOHFlTFNZU0dkTUJ6RDFGcEs5?=
 =?utf-8?B?MmxqUnA1bmhVNFhoT2hkR1BHOEJySW4vU1ZFc0l4Zm9nbGhiMjEvcnkzYzFL?=
 =?utf-8?B?Z04rRFZGbW45dCs1OTIvUHIwU3ZUTnhQZ2RJM0Yzdm9nQnFDZE5oY29xS1dk?=
 =?utf-8?B?MWhwRVhXb1NFaUJBaVpQWmdtaGJ5YVF3MWJmSEZIaHVrNWpuZmN6ay8ya3BC?=
 =?utf-8?B?MjMvYXp2d2s1Q2tMZkpWS3VpOFRiN3VEMVh0aXovQjQwYnVUdU5xcklGS2NG?=
 =?utf-8?B?eWZQaDVxby90dllrNjhwVU9XN1pwU2dVMVJkN05WR0hydThqaGs1bmZNRStK?=
 =?utf-8?B?QUFWeVhFVERxcnEzMXlLS1NRNlFqaUNDa0RMT0lSUUZCS3U0Um1FdVFIN2ZM?=
 =?utf-8?B?RnRmYnF6MXIxNnhLbWdZNW45VTRzY09SWktzS3lMRDhwcG9Ua0JMd3BaVXhM?=
 =?utf-8?B?NWVsYWk3RUdObGxMRllYcnZiaG9lOGFDbk94dWhSdVd1eWxzSmdpaE1IdzdK?=
 =?utf-8?B?eElkdE9LRlFhVUp4ZjdjOVpVdzM3QlhRa3IwWk1vam1aanFVY0ltMTRUa2ZH?=
 =?utf-8?Q?vuYA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1ZBSTMweVM3dWZvY3B0b3RXWmprbk5GOXFMcmpYNmt2NjRiRzdhcmVwUHFR?=
 =?utf-8?B?WGRvSVd1N3dybnAzdDdiWHFnNktueUpIREFueHljL0gvTmVmMHlybzRBMTVn?=
 =?utf-8?B?NFVKd0VjWCtxVVBrUXpkM3oySG5wdUIyVTVMb2pUd2YrcXNnazFlZXVpOTBq?=
 =?utf-8?B?WEw5UlhEbHAwTE9rbThDYzUrN2I2WG5FdEhaN01Qbk9FcXJYYVFXeFhGL0xU?=
 =?utf-8?B?RUJrODVGZWZsNXpZei9nTWkvUGpxUGZnZEZvSWhERUlFUkJ2QVBHQWJGTU5z?=
 =?utf-8?B?cWNiWkRPVWpmeEFFNDdvbmFOd1pHeFVKUHFoektZMktUMWp4MHdydnBFbnlT?=
 =?utf-8?B?eDNQdmdMNFBRK1FIOUYyVGYvYTFVbEZnUGVxRjVsNWtKZDAyME13TjdFTVBZ?=
 =?utf-8?B?RXNFTllqK0U1ZXVNdDgvRXVoK2dEeVkvREozK3ZFMUhORDI5aGF3d0pSalI4?=
 =?utf-8?B?WEZJYTNNYnNTeGVyZng1czRlUnRIckNZNmVRc1hadGZmdzFqNENpcWpReThP?=
 =?utf-8?B?WTc1dTVtMVRFRTJHYUNScmhvN3Bzd3RSOVErL1NLQmU2V2RhVHJIOURraVdF?=
 =?utf-8?B?S3ZNYjJGVFQ1TXRBaG1VZEc3ekpzUzUyQ2phYitTS1RJbFFTOGpXVkhaRjg4?=
 =?utf-8?B?MVVGQ1RRY3UwanRGdjRMK2pBRnQySlhJWUZ4WWVpc3AvdEhnU2EyS1ozc282?=
 =?utf-8?B?Mko3QjVsQ2NoRVZ2c0hrM1pDUE5pZGVYMmNRU0c4VG9zVzFJbUFHWnN6TEV1?=
 =?utf-8?B?cFpLanBxMGE1TDZGL2EraFlJOWsrZ2VzNDlFM3JVOUE0MDZmRUpyT1U4ck93?=
 =?utf-8?B?YTFIdS9XN04zNWh3UEEwdTJlUkNQZDRWNnpieHkzU3ZneENFY0Jqa2tsclNN?=
 =?utf-8?B?OVpWaGtyLzNtSjUraXRlb3pzUmlCQXQ1bXZ1VktBNXU1YmdpY1A0RHh4ZFRQ?=
 =?utf-8?B?eGUyMi9JYUppZ2FLQ2ZrYjJuWVhla1drdVpoV1M2eXZZdmxyMkxOSFQrMVhv?=
 =?utf-8?B?MGpIQ1VTeHErZHZKamlLaGFaSHRyR2h6dEJpREo1ampGcnZKUjNuSG1IR1Rz?=
 =?utf-8?B?bnBxWXN0czNYL01Jdkc5dzBpczFTQUxKUDZBZjdwSHpobnNHdHpEaUpUM3lI?=
 =?utf-8?B?YXI1aEhzeTVmdUU0SjlWWHhvRUVlcU4xRmxXOHZtSWgweXJFTEYxVjJjQTg0?=
 =?utf-8?B?eUZkREJQQzZKUXdRdjVNSTZxOGRYclBxWVJ6NUtDUFdnT24yeTJkYS9McUFH?=
 =?utf-8?B?NW1EVThNcGJFZitaeE1IZVN4dm52NVNJU2VHOGZ4dm1hRXljZ045VWd0OWsr?=
 =?utf-8?B?bjlNemNibyswUjRkcGcwbWlhb2o2N0J4aDBISy81UEx1NU5vNXhHM2xTMFhZ?=
 =?utf-8?B?djJKWmQvdTl6dVlLczBBMXJhZmhDQStlb2d5bXBFK282a1pJRFFxdWdHeURu?=
 =?utf-8?B?dnRpQXBGandTempxWXF3SzJXaytMVlM0YWtxUVl5TDdVb1g3VGgrZmJRZ1gv?=
 =?utf-8?B?WFB0cDV1YkFXa2xTVk5oZ08wSzdFdzk0cXplZVZNUEpRSEZSYVVhZGtnY2NW?=
 =?utf-8?B?YSttR3FaVU9PeE1SVTR5RkVleDFEWTRKVkxyZ1dnTjlac3MzQXJNaS9tMUpQ?=
 =?utf-8?B?cjh6YUozYU9wQnlYVzBNRlRXbmFQd3hScWN2TkMxWXQ0SmtENk5YVnl1bGxn?=
 =?utf-8?B?K21LbXo1S0M4N05pdWZwNWFEckdRNnJSNXJFTUU2dlQ3SC9HRXJPam1tNGdC?=
 =?utf-8?B?NUNjRzVmWUhFQ0prM04xbUdLWEV2ZGduMjRSVmNTcWhoUTBVZlMxN2xrK2N2?=
 =?utf-8?B?MW1QNlN4MmVtdE5WenNPS05na212NUVma3ZtQTZYcnNTbGEzalUxR0YrdTNK?=
 =?utf-8?B?WXBzQm9tOTFITXF4a1ZXV3UwM3JaTnc0SWJod0JPZ1pBZ0QrTXB5YU9YSlpE?=
 =?utf-8?B?UVNaSTZuUmozeDI3by9jd2haaUpVV1dBSmYwUFM5U1BqV3hnR1RGcFRENC9h?=
 =?utf-8?B?T3FOdDlmaDhmbC9Ic1ZyOTU1QmNCckdydXVlSjFmOVRhODFnaEo5d2h4Ri9K?=
 =?utf-8?B?Q01MR1Fla3hkQW5kSm1oSzNzTndrL1R4bjZjSFpqWHhMTDRRd3cydzk0dUFt?=
 =?utf-8?B?VWJndkxwWWVBUVlvSGd1N0R1RTFpTFZkUXdxcHVkSXBQWWwzMlRGTW5ETjFR?=
 =?utf-8?B?dnh4WGlkdGdVSEpMRzh0TnJaeTVhZjFlb1dQcGQ5QjlZTFJqMXdUcHRPSGVL?=
 =?utf-8?B?a3JybjJxMEZ0N09JRS9pNGRmajM5SmVaSndNeXJsNmdQengxVDI4ZklieFo1?=
 =?utf-8?B?bktNTnNwZHhOTFAxMUVERlhmNnVsMnBvZUZ3cFQzSnp4eHJIVS8rQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3fb85f-7f72-4922-9fcc-08de6e07c3ee
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:34:36.5013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alQZ35Bj036xZ3jeFRM3XXP35gi/V7pGUyGhsPHXttizX/qyEqpfkYZQJTRXiUkGvM+/iKeh1kC3v2rft7GWLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31737-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,gmail.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AF8A014A6EC
X-Rspamd-Action: no action


On 17/02/2026 08:14, Prathamesh Shete wrote:
> Introduce TEGRA_GPIO_PREFIX() to define the Tegra SoC GPIO name
> prefix in one place. Use it for the Tegra410 COMPUTE and SYSTEM
> controllers so the prefix is "COMPUTE-" and "SYSTEM-" respectively.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v2:
>    * Split the v1 patch into two; this one to simplify prefix handling.
> ---
>   drivers/gpio/gpio-tegra186.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 9c874f07be75..f04cc240b5ec 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -942,12 +942,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>   		char *name;
>   
>   		for (j = 0; j < port->pins; j++) {
> -			if (gpio->soc->prefix)
> -				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s-P%s.%02x",
> -						      gpio->soc->prefix, port->name, j);
> -			else
> -				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "P%s.%02x",
> -						      port->name, j);
> +			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%sP%s.%02x",
> +					      gpio->soc->prefix ?: "", port->name, j);
>   			if (!name)
>   				return -ENOMEM;
>   
> @@ -1373,6 +1369,9 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
>   	.has_vm_support = true,
>   };
>   
> +/* Macro to define GPIO name prefix with separator */
> +#define TEGRA_GPIO_PREFIX(_x)	_x "-"
> +
>   #define TEGRA410_COMPUTE_GPIO_PORT(_name, _bank, _port, _pins)	\
>   	TEGRA_GPIO_PORT(TEGRA410_COMPUTE, _name, _bank, _port, _pins)
>   
> @@ -1388,7 +1387,7 @@ static const struct tegra_gpio_soc tegra410_compute_soc = {
>   	.num_ports = ARRAY_SIZE(tegra410_compute_ports),
>   	.ports = tegra410_compute_ports,
>   	.name = "tegra410-gpio-compute",
> -	.prefix = "COMPUTE",
> +	.prefix = TEGRA_GPIO_PREFIX("COMPUTE"),
>   	.num_irqs_per_bank = 8,
>   	.instance = 0,
>   };
> @@ -1418,7 +1417,7 @@ static const struct tegra_gpio_soc tegra410_system_soc = {
>   	.num_ports = ARRAY_SIZE(tegra410_system_ports),
>   	.ports = tegra410_system_ports,
>   	.name = "tegra410-gpio-system",
> -	.prefix = "SYSTEM",
> +	.prefix = TEGRA_GPIO_PREFIX("SYSTEM"),
>   	.num_irqs_per_bank = 8,
>   	.instance = 0,
>   };

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


