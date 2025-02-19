Return-Path: <linux-gpio+bounces-16249-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71278A3CC3D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 23:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F272716E705
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 22:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FAE2586CA;
	Wed, 19 Feb 2025 22:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LBVYrqnv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52300225765;
	Wed, 19 Feb 2025 22:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740003862; cv=fail; b=La3mDYmEPVTXD5huaqH2AlKzgRYhxgzlXa+gn4GY87kBoLvjMRttk45Lt9d1L3NmxcaqvrYqeVeqNB9/Yw/qWRVyuvMLvXotb3rnHfS7JMzWzvEtzAIRb4Bc39ucUgKdHMqgGUwCQS2eIeGp4iddUQsHInBRzgXiz1I4a9SR32E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740003862; c=relaxed/simple;
	bh=+EA//rzBAcQJlFmGM3FJViiohCUkRR+CB0zdIoywx60=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f8mVCJ2TPriYUQgBp84qV4lWRo5DUWk1CKm06MlL+OEmTM5le0g2EtnxItyhC+o79b/sWw16cyCKn8RHTe25KMBaYHu4IKjOltc11JioGgrngL1vJ2WpDTPiMMNU2OLyU6SZnlH5bL3gh656OVHAigRjeb/OuMiSnXQPPQ2l8Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LBVYrqnv; arc=fail smtp.client-ip=40.107.237.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRDfbZXwjhAHB2y95cRK3nTpdxRsvs6CkPmL/rwAw8VIxv+fdsQ00dGbaA4J6Rnc9COnk9Hr5oy5EKMuW3070BxbO5sgCz7PCzO+LTX7UKSyO3UMH5xvnczynVa2argLbkwhVbVlv2q9muO4A84loRunsbfuzPYV9MD39R618u+zkkyRmEAEWyO5WODKoo2pm+wB86prfToAsgB9nRUPfFLQsQPRm2D4XV78bmM45VxiYdo72EQ2nOM5Q7qDdqIeym9jRJ3xo0fXpkbECqAvxNzcv4iswncH1Q6zV53YQTuMAS6quVhWcmR9AUHe4fBSzNnirwumbqT0oJQFnJcgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXosnLALzEl9o52/24UFiAMeLh4t2Sd/ESprhqXEl7s=;
 b=HuXDoWG7RBrp37FkV9CeKW36hP3HflBaPgmfH0xFkrNaTj5cRUZ470VAynRMsARPhnDiNGLSe/nx1aa2xPc3wwWA7umr125nS2O8N4VHfc3qIlg1JHSIoFfnCjkAizj7kfUS9tYn6nm3pjVGRjuZ/9jTyzRs/N6qbWtyGg2gCPcE32xdppFhRVn9a7Iq68xuBDXt9dbZEGSdbNGHHHY99gRMttR49u3JW7iAM94HQpSyDKvdgjwQ6RAmwQeDjluKhuC9G9oqLdEonVVHwu82zlCKZvpvepcZKwlZUkmGJ8gOXYwWqxbKb6ONxjpPopfVjUn4rjIgtE0GhnHA5V4I4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXosnLALzEl9o52/24UFiAMeLh4t2Sd/ESprhqXEl7s=;
 b=LBVYrqnv4x2Ojg8azTrTv8LFyX4nOb+K2oE2oYbOlnAYckthR/ZR2lYQytPlm8AN7EsViKEXj32hdfifACGpFPni2S3C2qSj2aOG1hqoH4uGkHU0EGx+lVglH6e89+RQIv2jIYuIhJwcTG9GcPfgVp4H5uq5jqv170XU7IBNsEtWPOAJuDQHWjU/0si1Ln5+kZqaWDHZWTS7TC50HvtMsaTWuQqIDKRNB2Xu6ggk+yU9L1X3K3rE+keXjIDDjeGmzEeL+1o/YZ3jxVEJhNA4VcGmbDVyleYxF1q92CqXla7pYTUVL1tKVlxznHM9vXVl52g2LG8lkGEiMxmD/Q5ovw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8209.namprd12.prod.outlook.com (2603:10b6:610:123::18)
 by DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 22:24:16 +0000
Received: from CH3PR12MB8209.namprd12.prod.outlook.com
 ([fe80::9127:5857:7ba5:a7f2]) by CH3PR12MB8209.namprd12.prod.outlook.com
 ([fe80::9127:5857:7ba5:a7f2%2]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 22:24:16 +0000
Message-ID: <0bc59e86-fc8f-492a-846b-5d439cb8c5c6@nvidia.com>
Date: Wed, 19 Feb 2025 14:24:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] gpiolib: don't build HTE code with CONFIG_HTE
 disabled
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 timestamp@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250217103922.151047-1-brgl@bgdev.pl>
 <20250217103922.151047-2-brgl@bgdev.pl>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20250217103922.151047-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To CH3PR12MB8209.namprd12.prod.outlook.com
 (2603:10b6:610:123::18)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8209:EE_|DM4PR12MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: cf98ff5b-6973-451b-1bf7-08dd51342515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDlvRnk5S3M3cnVmOVN6eUJTRTZwQ3NPa0cvNTkySlh5TU5wRk9vV29vbkJN?=
 =?utf-8?B?bXF1QTh4YjlDclp4aVZhS2p3b2JXM2s2ZnlMS09WVG8vb08xclFBMHcrN1I1?=
 =?utf-8?B?WitxK0s2ZU1kaXhiVndyRWFSOXEzaFJEMzJRNTlFZmpabDhuTFpQTUxCU2d0?=
 =?utf-8?B?SVJXQmRwMVpheS9vY2VKdnN6dkdTSVJ1UFpORTNvZWhDQnBKYVEwR2ZNOHZm?=
 =?utf-8?B?Y2xxSjIrcUJodGZ6SU9TMWFGMVNLSUZPSDk4NHY5T1crZW94cVNueGppUWpm?=
 =?utf-8?B?SGV1b1pkTHQvcUk4RjdoWWt6clBlREd5OWJwVkhNMFNLM3hBaGlvQmh5NGZj?=
 =?utf-8?B?QWEybjU4Njg0eVppVHo0ZFNEZEZPYXRvbGx4K3o2eWFRQUZEWkI2VHM2Ykxn?=
 =?utf-8?B?UmdiSUV5MHpuQXJ3TFVCY0dMNFBBOWprVmpwTnZFdTZ0eGE3TVYwb1lTSTNi?=
 =?utf-8?B?N2szKzV0UlVwZTRPTEp4anB4RFdONGU1UmxVbjVncXJja2RIQ2RSZ0ExdVlE?=
 =?utf-8?B?dEFpYjM1UktIREd1clZpSVJyaWUyWHJNbU0yUHgxc3dMOVBVMnppNGJId25u?=
 =?utf-8?B?Vm1BWTcwUS8xZk44V2ErYzVFamdzdVlENXZkRUsySEx3aWpzSGhjcjlCZEIx?=
 =?utf-8?B?Nk9tOG9HUlk3am9KUk1rRlhEWFdCb1pvaVpJSFdEdGVnSHJadldKeDMvMGpq?=
 =?utf-8?B?eXhsZzh0S3VRcGRiMzVpSHMyeGE2Smo1a0ZLN0Znc1M3bUM1ZzNZNUJUL0ly?=
 =?utf-8?B?UUsyZVRqSUlGUko3Tmp3RkM3NFEydkxnYVRtR2duejNwdGNPYlEra21wZFZi?=
 =?utf-8?B?OUovY0V2ZVlCU2orUG1tblkrR1NZakYzQmdrMjVKTUV4N0szbE5BNGVlcVlr?=
 =?utf-8?B?KzJLTVpHZEdGOVpZeEtnMGtWNk9JaHVSL2RTV0QvNmJkTVc2RzVBNENiQlBQ?=
 =?utf-8?B?eGVUdVpZaDhYVDNWeE5YZ2xuMVd3dnJaWjdmSUR1VTQreHcwSFlBVzJzemQ5?=
 =?utf-8?B?TmFEUWM0dkcrOEx3U0Y5Q1NkRnlTbmdFOVFzVUx3Mm1lVGFmS1ZDaEJHRnFw?=
 =?utf-8?B?dDlHSnFIdVgxMkFqSVlYOStMOFMvOHl1dko4SnI3Y01mL2Y3emdzcGMxcE5q?=
 =?utf-8?B?UDBjYlY0eWdmZk16UnZXelJxVzM5L2EyRkRjSFErQW5zQUFteTlFNzJkOVZZ?=
 =?utf-8?B?Nk5KSndOWllOUGlrckdYNHRHNndFRzVRajZRb2ZKVURIQTEwOFBlNW9EcVRt?=
 =?utf-8?B?MGlVQnIvOGg2WFZKL1NLYXQ0bXViaStwdDJubnhhL1BvbDNxSjZibVBVRlRh?=
 =?utf-8?B?R3psRTR5M2RSSWl5NlhxOWJmclp0STdjU2xVSjkxTmNHU2VjK3RsbTJManlh?=
 =?utf-8?B?Yy9oNE9lZGlBZXNoMGNlZTRuNXJDNWtIOWZnb3RyOUUvNkxIcnNDMWZlN1Ry?=
 =?utf-8?B?S1JsemtmN0tZQWFBMVowdVpTUDQ1d1dOZ0E3Q09HdHc0Q1N4Z2RQaDg4RklB?=
 =?utf-8?B?M1VlanZyOGJoUjVkWHFJVU5hUU0vdGUxdjVaS01EdTVYdUJkVjNROXp6WXBv?=
 =?utf-8?B?SUxuMDJndUtUY053NXVtaVVpMjAvU0NmMkMyNFB2N3MrbFJISWVjaTV6NXNq?=
 =?utf-8?B?YWVLVWVkSHg0MmpJRmI3ZFNFUXJzVW9qLzlOT0JNS01sUTI0Z0IwNXZqNERZ?=
 =?utf-8?B?alVWV0p4SUUzV2tObUFOcWJsbW5waUU5V0o3Rmlyd2VZditCMVdBSGVuQ3d1?=
 =?utf-8?B?ZjA0OWNHaGYwS0RodEZhOWVzN0FuczRLVGRvRjZrVGYzb2lVNUREQ2RLNjZH?=
 =?utf-8?B?YnBFU093SndVRzlZRjZxdytGbEZIeDVGUE9OQWpGc2VmaDNrMC9TWTZtN0x2?=
 =?utf-8?Q?Wu7M0Ms3EmUeO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8209.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDBxM3ZQYUYrVWlMSVM1a3QwUkF3eXlScWIzTDcwV2xlWElvYlNMVkl3MkJr?=
 =?utf-8?B?UDhRKzVMZ0RYYlFIUXlMOUsvdTA4VUxoV016UWlYRTc5YnJXeHZYUktTYnFB?=
 =?utf-8?B?aGxrSmxFbktoOEt5VmM3WUNFZW9sbnhZMzFNSnI2ZllwVmFkd1VyVUtmcHhZ?=
 =?utf-8?B?MFFuSTBIN1F4d1ZoWnplMWJ5MEFlRWkvTFhKVDVQN1c4VUlDdmJucmtFVG8z?=
 =?utf-8?B?R2o2K1lWc3JDZFhEWGNydHUzTEZQZ2k1S0NZdFVybXl4K3RKY0JvVm1hUzNE?=
 =?utf-8?B?azZEbmpLbTZmcDRXRndSYVh3VE4ycU5mdFFVb2pjVjZYeE5SNUNBZlNPUCt4?=
 =?utf-8?B?d2E3WWJya3ZIWlZtZXBKdDJ4TU4xWTlGU0oyV1FuTU9BMFl5VzZUaEI2VXNR?=
 =?utf-8?B?UFQ3UlNrMnhoNSthdVM0MnlZWHJVZzZBMnB1cjVsWHM3U25CZVhraUlBVCtx?=
 =?utf-8?B?bkJHRlBRalBGVFVDWG92M3J3YWhIRHJXYmcxWlVDSERUcFMrcG9rYmMxQ0hY?=
 =?utf-8?B?MjBBdUw4SEVmazJHS1FHaGh2K25CUkZjMXlYVDdINzV1WVVsRGZyeHk4WHpQ?=
 =?utf-8?B?ZGRtcDdVVTYwdWNnc3UxQjd4UWdOL3M3UWdPbjNhVnlOa2ZlQUZCckw3SC8r?=
 =?utf-8?B?eXlreDQweWs2cUdtL09Md2lsVjQ1MXMyQ1N5SU5ZR3NkSEplRTd5MDRuUTAy?=
 =?utf-8?B?ZjBLMVNMak51SEkvOW9sc0x1ajFRWWVGek1IUHZEL0RPczAvZlJoajl4Tnc5?=
 =?utf-8?B?SmFyVTMwNjUyaXJDSjBQaGlYN0wvWWEwSlUzWUFXQm5TQkVwczdBQVZiTVFK?=
 =?utf-8?B?aTlBTjNEWG1FRDNOU0dlL2hpOEhyVjdzWW1aLzBlaXZQaDUyZHRtQVp5bkJM?=
 =?utf-8?B?Z0llV2Fjckc0T3lIOXZzRlJ5a1NUd3B3bGNqZy9maHNXcG0zUmlQUCtEYnR1?=
 =?utf-8?B?bXJNcEVCUXlONloycFBMcEhweG9RRG80QkprSGp0SnF4RGxhZzFHbzFheitN?=
 =?utf-8?B?ZzNxUUxmaVloQU5PSnN1ZFlDcjFuOEczY3dPQVpMTTljVERhcXRHTnZRR09l?=
 =?utf-8?B?WDdlQlR2cnp6dWovZCtXT0l4TVZCZ2dRUkQ2cFkzODNVckxzN1RENHFwWStS?=
 =?utf-8?B?SEhpV1k1MUw1VDlLNWRwMXFKUzI0ckhHcjlWVHFQRFI0Z2VWaWJyeDlKejRi?=
 =?utf-8?B?QmNpUHAyMjc4OVRnR21nRjZsVnlPWWc4cmh1MEVFZE9zdm9KMWMzalRnSFBT?=
 =?utf-8?B?N2JYV2FWMEVqY0NYSHVvWTFuS3M0blY1UUdxMW02aTY3VWpJd1ZGN1dxM2JZ?=
 =?utf-8?B?Mmd6amVIOUl6SjRvK3FRT2dNdllld2hza2RUWUVFa1NweCtQSTF6N3l2aW5B?=
 =?utf-8?B?RjBiNTBlUHFaM053RHUzNTVXcG00amFlL2E3eFpXbUMxNk9kRUZQQ1FndFBE?=
 =?utf-8?B?bGhCRjJrcVJXQkhLS3RRVk9UMmNVUXVib3ZYN3d5Z0QvVGRBT1ZST3pQNXZZ?=
 =?utf-8?B?NkZjc3lIR2VaeTZEODQ0bDBwQkpWOUJGRHhsNkxGbEkzY3dKbDFvNS9QNFF5?=
 =?utf-8?B?ZG5RTkFFTlhHbVRqdFBMckFzZksxWVRBK0QxSGVlYUVGTWJxblNDSFVSS21R?=
 =?utf-8?B?QWlJb1Nzc0YyTTZjRTdpVmgrbFFBM0MwVmhwZUdKWktQVWpyYkxVS0hzMWxC?=
 =?utf-8?B?bjBxNm44bEtGdlIvZWpCbys3RXFla21tblplck5wRjlENTM3UjlYK0w3dnlo?=
 =?utf-8?B?MkN2bHI3SmtwQVpkdlVFTE1GU3J2Q0NQSHhWa1pDUXR6QnRqdVphWFUvbW5t?=
 =?utf-8?B?NE4vQXZJY1ZkbEtkMTFMYURzWTllN3BrZ2JmeGhTbCs3eGNLN0l1TGIvL3N3?=
 =?utf-8?B?SjZObHMzWVpiRkhMbm85aml6dkVDOVQrRUJJdHh2ZmVoWmZ5VFlGL3lsaU9E?=
 =?utf-8?B?ZThGekhKQkhhNlh0djBrWlhCeWtVZzhzYWZ4RUJlNWQwTThGYUIvZGU0SUdG?=
 =?utf-8?B?WXdEUlhZRXkvcFdUMXd0MEVReU9Ma2RLNHBHR1oxZUgxTlBDdTNGdVFqRlNQ?=
 =?utf-8?B?VFgxK3NUdzdXOVlzTnR2Sk9TY0dONHJ2U3BQNVd6N2ZuUDUxOTBIWThxM3Jw?=
 =?utf-8?Q?q4TVmCMVf5daesjYxUwb+71WM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf98ff5b-6973-451b-1bf7-08dd51342515
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8209.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 22:24:16.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CB9mPghBneJBAKpBobtXwMTHp7tGRMwBAHRrDjiWb4TqdRcSCDvkWhWv26PHPVEnVTIJdpdNeyg76iH8XJXwQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6494

On 2/17/25 2:39 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Hardware timestamping is only used on tegra186 platforms but we include
> the code and export the symbols everywhere. Shrink the binary a bit by
> compiling the relevant functions conditionally.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v4:
> - rebased after fixing conflicts
> 
>  drivers/gpio/gpiolib.c        |  2 ++
>  include/linux/gpio/consumer.h | 36 +++++++++++++++++++++--------------
>  2 files changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index f261f7893f85..65ca749a1078 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2906,6 +2906,7 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
>  	return 0;
>  }
>  
> +#if IS_ENABLED(CONFIG_HTE)
>  /**
>   * gpiod_enable_hw_timestamp_ns - Enable hardware timestamp in nanoseconds.
>   *
> @@ -2971,6 +2972,7 @@ int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(gpiod_disable_hw_timestamp_ns);
> +#endif /* CONFIG_HTE */
>  
>  /**
>   * gpiod_set_config - sets @config for a GPIO
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index 0dc49b5fca5c..0b2b56199c36 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -114,8 +114,6 @@ int gpiod_get_direction(struct gpio_desc *desc);
>  int gpiod_direction_input(struct gpio_desc *desc);
>  int gpiod_direction_output(struct gpio_desc *desc, int value);
>  int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
> -int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
> -int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
>  
>  /* Value get/set from non-sleeping context */
>  int gpiod_get_value(const struct gpio_desc *desc);
> @@ -347,18 +345,6 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
>  	WARN_ON(desc);
>  	return -ENOSYS;
>  }
> -static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
> -					       unsigned long flags)
> -{
> -	WARN_ON(desc);
> -	return -ENOSYS;
> -}
> -static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
> -						unsigned long flags)
> -{
> -	WARN_ON(desc);
> -	return -ENOSYS;
> -}
>  static inline int gpiod_get_value(const struct gpio_desc *desc)
>  {
>  	/* GPIO can never have been requested */
> @@ -559,6 +545,28 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
>  
>  #endif /* CONFIG_GPIOLIB */
>  
> +#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
> +int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
> +int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
> +#else
> +static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
> +					       unsigned long flags)
> +{
> +	if (!IS_ENABLED(CONFIG_GPIOLIB))
> +		WARN_ON(desc);
> +
> +	return -ENOSYS;
> +}
> +static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
> +						unsigned long flags)
> +{
> +	if (!IS_ENABLED(CONFIG_GPIOLIB))
> +		WARN_ON(desc);
> +
> +	return -ENOSYS;
> +}
> +#endif /* CONFIG_GPIOLIB && CONFIG_HTE */
> +
>  static inline
>  struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
>  					struct fwnode_handle *fwnode,
Acked-by: Dipen Patel <dipenp@nvidia.com>

