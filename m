Return-Path: <linux-gpio+bounces-35786-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LdHNwzT8WnPkgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35786-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 11:44:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E8D49234E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 11:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CE6C309C657
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD413B7757;
	Wed, 29 Apr 2026 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BcZw4NNH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010013.outbound.protection.outlook.com [52.101.85.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8F03BF69A;
	Wed, 29 Apr 2026 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455554; cv=fail; b=YuHm4eKXVLdJRAJlPwqjdL/0D6EgosxkyBsYfDAlGdXrE1SDrT9iwD9C7+b/L1MaYZ8lMLJSVWE92pvYild9Uc93b4aJ3hJzk4T98RHs3wthhfO/bnF4EnpPVBoKqF4RW84XEF56iuN/L2dztspex6CjaZu7fccfrMM/NrSr44A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455554; c=relaxed/simple;
	bh=vWE8GZC9TgIa1b1BY5BVXO2Sn6NCR0Sm3ckGPDHNATU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VwS6SMwj9VQbik26L3CO2hNJQbrYzaauJM7y45e3rD1i7Zzqj5qiFEgksDZSkp+4uTQQSPfvv4GFBkxhnJZXXmh0fv6K28ZMCHhEISrvI6aAF+wdPeYLlQKzziUky3RCD6qrNaEruYmxczy59QIb7ys6B1x7XlsHDaP64gPcN5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BcZw4NNH; arc=fail smtp.client-ip=52.101.85.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDHbw0cakD00sAPSoNV8De2+f1IdpuCzaon9cSRFZVhP2DcaOSHifnn5sWYAt85Om37zCzWPA6RaqJO/t5ybI8fYVImo08F5Ju1XVrq/zuKKpOWwLoPjVisdGpdouGZwkVDnoNwMn96ZxgjnwlgLbLx92t1+neM0aAz9F4eQsMxz3R6xMxN7LSH8UsC2255kkPKAj3mywy/S8gLc+ahQNCH5zJcMdXWAVKLjaYCsAB7ffxM4h7HSC0QBJP9WJecwKhG8RWV95GfrxuUl1EmSJHoOM5gYtE/hX3FF3Y7j+oPaIKGuP+BfZ0OTTVAPATii3Tify1yKYyJuO/AG67+ldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMxe/N+wBBXnH1iC8hK/AJ3v0ZpfpuIJqUWcT4jo3oM=;
 b=SmimPr8JI60jp6e8aqApcC/eQ8SVvFVmetRWOf4aNq0/kr7Thx+6wJvFFN9h2IQdV3Ix8KDBeVrhMsLBp3kHOOf+FrGKcL+kZS1iZ/FXTqMJdKZM8BIfsOsAOqdN+CcFHyPsAWfKBIbBvXRH0lE0lGNTAlGExx1qAQsbNWgHnGdLSu1uVWHnZzD4w2GX9X29uqAam6p+gBL307HiLN9LI7UOphOTG0isFatbP0kbWIJFSq1E+njoW5UzTYLZdExpE/jSlLI3YVn1tD706W5IohmFBB6XRPLsySz+r/4BQmVsEKm3agamciCshuZOP68AFHqA8L/E3O6wQxeFpKgQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMxe/N+wBBXnH1iC8hK/AJ3v0ZpfpuIJqUWcT4jo3oM=;
 b=BcZw4NNHqOcjPASx8/q9zf5UOWXb+QXkFtC8Uv5hLXOXm1Hdeayd5upm8T0L4G1zHk0t9dSLq9BnVA3/6hZ1Of8fKnpHJTqOHD48zyaoRyxnShx6Ok1y3GCQsMLYpEtx9Bx/sTQdVFLcLGdkyKTU4rZvE9QVqdlkckiXoSBcSOXUyO3DO0W7VSARgUAMaHMk+4bFMKVMq9sQEXO0bDUT0MH6T3SYM1hd1S9JMH1mYL2KdftesDEG+RY1parmQvcpvrHf3ZTrDsknusOqMYr5+5CrelqtvwESdKf7c6i/O1TmBGYtNywy4GfpYjQ4hcG7nij8KNEkbw8EGVFhaeYsdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 09:38:59 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 09:38:58 +0000
Message-ID: <e134911f-e4cc-41ab-be41-0c559790acde@nvidia.com>
Date: Wed, 29 Apr 2026 10:38:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add Tegra238 and Tegra264 pinctrl support
To: pshete@nvidia.com, linusw@kernel.org, thierry.reding@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: webgeek1234@gmail.com, rosenp@gmail.com, linux-tegra@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260427134231.531222-1-pshete@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260427134231.531222-1-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: ed07a7d9-f868-4ce2-32c1-08dea5d323b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iCtMBjeGXpPJ3BXc1tlzrSDVBr6Xnv5bSySXPxxRxM53qcpax9JZ7DQbljem7ke0SqGHGgJCOEk4Bl1WUUFL3bdc5mVkZtrXXnEB9MxPwbq/HDCBE3hbsx/HaIZCcLNvxgjfn+cqdxdSQL6bQ1vYrmdxqaujcClhfWQk1c7FPweNCa04YnhRrSXNFl1M4kV7TFYLHaK9GN3ojqCvcEGBW2uryUO07Mhp5kOWpElJRJGMol5FkWPPXXqKsMPsI4mNZ9rrwK8Sx4aip6eeqWbNXd43OwCllJgpPGVGNkZDAz/z2CemdepI6GQOc98u3xfG/fa6qvoFgsA8XwykDI99rNsda6entibC74NxAGiKEWx6BSMeUZFE/tWUc95E5uiKHLm7Zro0c3C7Qyt5VVMoPgVJi7toMUa6wjM4MApSYwiI5wmVsPBxJJqPhar2S8zpNKr7hSHIu/oScIuZ52IpkzwELOi0g52r9zqEY+ueFmXmi2Fs5m/a6+ZglyaylgWT+ya/EMqaBvV7OhFpt/zUpM2Qrqi71Nc9ycthRGLyo/gkKlv5utUQ4S4V9hpPYnVT/5vrnSDwNhy0HdODP1TksAQ+38uz+n//Qy4PurpdHrUCvEjympxT9yuOZ4zNCsJZEe0jzjm9q+LbJIIwj8HrLbwptdX7iy+ZgyfCRiWszNWhn79bzzi+Ivvwy+EOtXWcdeoXtwbFaVzf7PncF2hZlijXSFyt7nNJHY7vQcYGmEU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0RCSUpHd2ZvcUhMbkkyM3Q4NzJLSlc2WUhMV1l0bnl5UmE2eWx0NEFxeS9N?=
 =?utf-8?B?MldtUWNUWUtwbFZDNVl6Q2FqemhyeTJmNEVZb3ZyWW5iWmtFMjFIWHdkeHF2?=
 =?utf-8?B?Q1FYVTJFeS8ramJSdW9tK2cwa2VyWkdLNEpYR1E4bTlIRSt4M1N0SVRvYm5P?=
 =?utf-8?B?MTl6bGhhaWxDcFM5ZFA3bnczUHFrdGVTZi9GWVVETXJlcVRJWW9tODRndWlo?=
 =?utf-8?B?UzZrUCs3a1dMZWJjWG9hVVFhUFFJTGZoL0R1LzhSTHMrbFlyS1JyTmpZN2hx?=
 =?utf-8?B?RnlSN2Jrc01Kb0VnaWlRS0toaXduOXpzRmNaaXh3ZHlvTTljL2JPd1lnc3hy?=
 =?utf-8?B?TXlFQTFjeDREbWVkemQrb2cwNlJBWUFkWDVnN1dJQkQvMjZzWUM0bVIxTkJG?=
 =?utf-8?B?Q3duOGVZV2NpMFlvWElnWFk3YVF4WVlhSnFHRjZSbGRDaDVQR2JZNkZjQ1Nv?=
 =?utf-8?B?T0ZtZDBiQ1NPWFR4N0VpUHpWTE03d1BhbHU5QXFVV2hDWWtRbW1nakl0eU9B?=
 =?utf-8?B?SEZNdmJSQXM3bWFpWStoNkxpOVUzQXdvbDdlT0JFRVppM3llSUMycUtqaFpD?=
 =?utf-8?B?d0NYNUNsUXp4WjZ6MWMwMjR0SXc2OUdKODZiLzBuN0t3bk55dUpwQ1c3b25K?=
 =?utf-8?B?UE5Xb21UM3JGWHcrM1p0MHhiaXd3cmw1azZQbXIvOVVpblA2cGN3dXhQTlBE?=
 =?utf-8?B?OWlNemJDMjhod29oaENsbzRWNnZVYXJUMzhNWU56R3RjMkRYWFdwVTMxdzlt?=
 =?utf-8?B?NUpoRHhFNWNicWtHa0Z2MWRnSmdGMFpqbGFxeWhjSXZyVlp0R1ZBRm8zUFEr?=
 =?utf-8?B?MnFWaVlyZS9QbEg0NU0rZTdJVnROZHR1UkR4L0ZwbmtUUnZPa1FQaDlZY2E2?=
 =?utf-8?B?Z2g0RmJsZE1zeittTEdaZGhBaUZHNzNBcklFeE15SVJSV2xBZEx4QVdWZW82?=
 =?utf-8?B?Z2xrR0Z5U1Y3Y3hRaDZ1cDkvU3VsZEJWSjk4QXNoUDk0ejFNc3kzbUtBcGFL?=
 =?utf-8?B?U1pyM2dRalNQa2hHc2pycklRMWtqSk1RaWx1dHBwR29wY3pxSUxFZmRyYWZZ?=
 =?utf-8?B?Q1VWeTBzaW4rVnBtUU5mQjFUckVkYkY4cWtwVzBGNk9YNnA2cG5qN0VMVFZW?=
 =?utf-8?B?YUtidms4VFJiVnB6ZXBXVmJvSUg4SzBteUY5WFc2UERua1lPMTk3TVc5emNx?=
 =?utf-8?B?U0FPenhlSnpLa3JIYW1EZE9Wck81QThDTnlZNUxwMlk3TXBCSnhpb09ubXcz?=
 =?utf-8?B?TXVWMElCVVpUSnRCaUNGMWxncnVCZ1lLM0UzQXBsOVFQYVdrZ3QraFNqRmR6?=
 =?utf-8?B?eDFhS3hBQVQvSDZjSlluNElpMG1GNW11UGlqOEdiOUoyd0lxOFNGM0Z1RkFh?=
 =?utf-8?B?anVzTjhOWC9pNmFpZW5SMEs4RU1FaU5HNE1GaW1DelRScWxmRkxaMlRqUHpY?=
 =?utf-8?B?U2RPZE1ITEQvMlNldURTYTBRTVNyRnMzd0ZpSFc4bmNJaWR5N25ZbmpkS2Y1?=
 =?utf-8?B?U2drRFdoaERGblliN2NsU3hMVUk4ZDZybjI0K29ITDlNU1p4T0NvQjZYSEM5?=
 =?utf-8?B?TWp1MUdWcGMxRXlzWkpDRHJ3eWhXN0RGT0ZjQnl4MVhnYUM2NVRSN203RmtI?=
 =?utf-8?B?YjlTZ2d3cEcyRXF4aHNzbmlGMU5TdGhCMTFnYkxMc1pJcFN4dExEK2JTVGdS?=
 =?utf-8?B?M0tBLzE0SVl1R3ZkdG5oMVhkcTRTYldkRGNPSXF2OWQ4MHdXdWdFeFcwYUU5?=
 =?utf-8?B?Q3QrVHpyZk81bjBGZzRxRWlZL21qK2hMbHdCdjd3ZnFYZmpCNnpjZ3hLT0Rq?=
 =?utf-8?B?WFlDZ2tqQjJwRDA5Rkl4ZktmQ0UwL0JPdGdDWHB3TjBLWExINktaNWFLNFFk?=
 =?utf-8?B?cUNBc2ZXMndrTXNDWEJvNUZVQlA1cHljbXdHUnRYZzBCdDROZjBBWndQdy9N?=
 =?utf-8?B?dk5GU1RQckxlaHp6ZFJrYjJwY1kvdjI0b3hZYmtVanlUOU5BRkI1NW9tZVBx?=
 =?utf-8?B?R0JpaGxNM3VtTFNMQXcvcmwrY3AxL3lGZW04eC9qYkQ0NnZyS0lTbVZ4eEpx?=
 =?utf-8?B?NDlQTVVnLzFVNHVhem90dm5lTUc1UGVJSWROaEFNK0hML2VRd0tJeDlJMjB6?=
 =?utf-8?B?ZFF3Z1NvQ3h2VjhtMFZhK25HbWRLNjNkZkhvOGRCODRzazg0SW94bVlKZDE1?=
 =?utf-8?B?WTVsYmF6aDRUYlByRm5SSFJsWjl6SVRKQUp6dnRXdEVwZTBmaDh6WlFNMzF0?=
 =?utf-8?B?ME84eFovQjNNcm8veHVFUU1DalNkdWVQbnczZGZzVFd6REpxMlNYNEtJY2J5?=
 =?utf-8?B?MEdpcmdNQkVoMnRtWS9DQW5xcjgyb092OU4yWkd5OGdvUFBMa1VaM2xUZ0Er?=
 =?utf-8?Q?GOQohtiID9Gn6FrgXo9gslRxEBA58PsX0Yh6xKHrKCZk6?=
X-MS-Exchange-AntiSpam-MessageData-1: H43mPib7BfDXWw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed07a7d9-f868-4ce2-32c1-08dea5d323b1
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:38:58.9334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fRL6fDPjTtOadN5WWIO82XQpSTNOcICQHLR5+99S3t4Pi8IuHENWx9yoVowPNKxT2qfEnnQLE6+bTchqK0sMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342
X-Rspamd-Queue-Id: 76E8D49234E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35786-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]


On 27/04/2026 14:42, pshete@nvidia.com wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Add pinctrl driver support for Tegra238 and Tegra264 along with the
> corresponding device tree binding documentation. Additionally, export
> tegra_pinctrl_probe() to allow the drivers to be built as loadable modules.
> 
> Changes in v3:
>    - Wrap commit message to 75 chars per line (v2 was too short).
> Changes in v2:
>    - Drop the "arm64: defconfig: make Tegra238 and Tegra264 Pinctrl ..."
>      patch and instead add 'default m if ARCH_TEGRA_{238,264}_SOC' to
>      the PINCTRL_TEGRA238 / PINCTRL_TEGRA264 Kconfig entries so the
>      drivers are auto-enabled as modules.
>    - New patch "arm64: tegra: Add pinctrl nodes for Tegra264" that
>      describes the three Tegra264 pin controllers (pinmux_main,
>      pinmux_aon, pinmux_uphy) in tegra264.dtsi.
>    - dt-bindings (Tegra238 and Tegra264 pinmux):
>       * Add 'required: compatible, reg' to the top-level schemas.
>       * Switch 'unevaluatedProperties: false' to
>         'additionalProperties: false' on the top-level schemas.
>    - Reword commit messages to use imperative mood.
> 
> Link to v1:
> https://lore.kernel.org/linux-tegra/20260409131340.168556-1-pshete@nvidia.com/
> 
> 
> Prathamesh Shete (6):
>    pinctrl: tegra: Export tegra_pinctrl_probe()
>    dt-bindings: pinctrl: Document Tegra238 pin controllers
>    pinctrl: tegra: Add Tegra238 pinmux driver
>    dt-bindings: pinctrl: Document Tegra264 pin controllers
>    pinctrl: tegra: Add Tegra264 pinmux driver
>    arm64: tegra: Add pinctrl nodes for Tegra264
> 
>   .../pinctrl/nvidia,tegra238-pinmux-aon.yaml   |   82 +
>   .../nvidia,tegra238-pinmux-common.yaml        |   73 +
>   .../pinctrl/nvidia,tegra238-pinmux.yaml       |  219 ++
>   .../pinctrl/nvidia,tegra264-pinmux-aon.yaml   |   80 +
>   .../nvidia,tegra264-pinmux-common.yaml        |   84 +
>   .../pinctrl/nvidia,tegra264-pinmux-main.yaml  |  167 ++
>   .../pinctrl/nvidia,tegra264-pinmux-uphy.yaml  |   78 +
>   arch/arm64/boot/dts/nvidia/tegra264.dtsi      |   15 +
>   drivers/pinctrl/tegra/Kconfig                 |   20 +
>   drivers/pinctrl/tegra/Makefile                |    2 +
>   drivers/pinctrl/tegra/pinctrl-tegra.c         |    2 +
>   drivers/pinctrl/tegra/pinctrl-tegra238.c      | 2056 +++++++++++++++
>   drivers/pinctrl/tegra/pinctrl-tegra264.c      | 2216 +++++++++++++++++
>   13 files changed, 5094 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-common.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-aon.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-common.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-uphy.yaml
>   create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra238.c
>   create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra264.c
> 


For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


