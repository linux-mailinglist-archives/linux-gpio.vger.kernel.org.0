Return-Path: <linux-gpio+bounces-21512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F66DAD8903
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EA5E3B55F3
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 10:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE442D238A;
	Fri, 13 Jun 2025 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AhD/2RrE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A332DA77C;
	Fri, 13 Jun 2025 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809632; cv=fail; b=LWWw9LyuhBHao3R2KtA8db41bB/Xuvs2xrmYVm0JMLgo0KEVDdWeUJB1A2zDRF4uB/yT9BTOvMPdUbJj2AeC8Vz3HI3KpaLC+uBnwpqsMWo5MFKLDEXhmbjFj2Thl/+gCILBYcWfoYvZbB1A3V9qPZ5ty2D2Zk+W9eVgsUJvzI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809632; c=relaxed/simple;
	bh=E2ielEWRGEAzwbUt+9gBYhqnU4BlGDa7k1sleuLHZ4g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tje9drjteoFqISyWhCAqNbuxQHcWPb+sZztWxm4QB4H91E4Ti12qIW+HD+ccYlTvjmzMyJcTC5FDe2ggrIQ+ERXJKGdujJSDSyvANZSgr6B6mXN/6X04iZ78JpsO+RGE/bbMJ6+3VFeo0LpZL1xeKcSJrw8CmsfkTeS/MnwtRZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AhD/2RrE; arc=fail smtp.client-ip=40.107.93.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXAoDp5rGWX8I6CZLVme2IE0rttQoOkBcXAo4OU/sNM146Id9Bou1KOkw299PgsAp66m9LjCnqVhvtvygCJIJXsF415YWbsqwPO7mlSzA97IwD6GfJK9kVAiF7fexPHoBJ10skqzMwbmJdL6lCOM/wOMpqQbY0+TTRtcvSi7gFKl5tLopRqU0PNP1nD+xwP2GEyLm/Xg13kdjUCgA/nOO7arhIFU/t3BPb3jUr+ODPlBAWvQ1XkMc/DuPZahmHk9n6o8hieYJ+Jl5O0D5Y+5I5J7Nxq3bT1iVGlq/dezEv9WuwB8ORXZ2GbWYaVX9QS57IHLJM0uS4CH7yPLP5YxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqluGdhMU2VdEtQpXhcoCDUnHjETObTlXbKZvcsGY4E=;
 b=H//bMHGdUWh1ByoD5TNgd9MtFc6kmx/mk2irsLbqLqiGcPPbJDnAA25J+Sp9J0heCxbFz5uNDvB21CmcK5v/1ffvVHDxOXFjJ6CJGFRlaCC7OP/5G+FmqZaHRw4uQgdq3NjeLV5v/BqKJD8WYw54p/Zdz+dqi11kyoNw6HmVCAMT0+Fqq4mZfabiiau5+VNnqrQQXuMXkq1XFljCRHewhC7HUQYCJE1oBceNjkvh64gjRIpncUcqm6VTPkhGRVUSVn7vr4R82BuAm5KblLDNsBMF9BNwpCDWpjf0HWGE6biRD6G/hyspyF128z1lqjLleuu/ZFwmilI9pbnZAIPNXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqluGdhMU2VdEtQpXhcoCDUnHjETObTlXbKZvcsGY4E=;
 b=AhD/2RrEwcgeBFCUWAyhl7IA3pVFJzGuriGHxcRbSvDQfG9yNZb7xkZG/Eh2BV352bvr8J8/b5AGg8mhp2xh6KqoWbNwPzQpGb1UmcDemqA+zTBym/kTsOnsrlX3CQCZexQixcZ11UeC7XMgGOsV1UzOBMs94gcZ5iMxp5+q2s0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SN7PR12MB6692.namprd12.prod.outlook.com (2603:10b6:806:270::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 10:13:48 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 10:13:48 +0000
Message-ID: <cffc0323-88c2-4a8a-8460-aaa4b32482c2@amd.com>
Date: Fri, 13 Jun 2025 12:13:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: gpio: gpio-xilinx: Mark clocks as required
 property
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, michal.simek@xilinx.com,
 monstr@monstr.eu,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Srinivas Neeli <srinivas.neeli@amd.com>, git@xilinx.com
References: <dba4f2c39a25b54010c292c36e349cb289d6cd98.1749540869.git.michal.simek@amd.com>
 <174954437576.4177094.15371626866789542129.robh@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <174954437576.4177094.15371626866789542129.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0060.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::49) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SN7PR12MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: b4038d39-3a42-4275-d88e-08ddaa62fce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzJaNXFhT2piaUZPTGFSZjZhRHJvVGFDUExiSUR3bkRQNkFFemh1TGJUMEtF?=
 =?utf-8?B?WGJZUHFtR1dZVmEyOXJFVTdIOHlpRFNPY3lHZy9hZGZwR1Jkd1hmU1hFTzNm?=
 =?utf-8?B?Mnp5WC92b0VsY2xTck1iT3R3VU43Y1A3TXBWeGtCbEptclFBM24zaUNPTm5O?=
 =?utf-8?B?ZDNvSkFldHlNNlo0OW9GOWhER1RLVnJVOEduazJOYy9USlYxSU1vVUFYY0hJ?=
 =?utf-8?B?VHcxckNSUENyNGpkQnd0M0hqU3JxWGhNVnR0TjFGckpKdjBoVmptcWY1RWFU?=
 =?utf-8?B?UkJkZ3A5SkpjZi9ISnVGQmt4eDhOSlA4NC9yWURwVVNUckxjN1ZPWENCeVcv?=
 =?utf-8?B?TGw3V1pIWWJDWFBscXBCcFRoUmJ5b24xbzJvS3JnTzlsQng5VHFuN1FJTFhV?=
 =?utf-8?B?L2NWemtMTDhyTUlpZlZaSkpoUkhReWt0RWtOZlh4MGtXWmpCQUt3T3ZzN0hC?=
 =?utf-8?B?NC84YU4zdTZkRUZnNHJEdmlScnFJSTR0dUpGTDVnby95bXdPZU80UlZwTUdJ?=
 =?utf-8?B?eUx3cnhHVUJTdEhRYVI4WU8rRGxuQjN4bDFSQnV4SjZUNXlQekVMc002RENx?=
 =?utf-8?B?UU1ldWIxU2RlbkxMOWdaeTRMUnp1Y0xoS0haZzQrYjl6Ymt3cCtUWnRiM0dU?=
 =?utf-8?B?OWYxL09hODBXWXplTXJ0UytjZ0NWbHAyWWxqL2NJR010RXkxNEY2WG1vT0RI?=
 =?utf-8?B?eGZqZURleFFUSFJlS3RWMVcwcUtFTGo4aHQwZ2tRTjF3QlhnK3RROVF5N0Ri?=
 =?utf-8?B?Nm91RUprRXJIdmxWdHZWNEtMZFFzcXhlUUE1S3AvS3IzMFdEWkt2aHYwZjdu?=
 =?utf-8?B?VEU1OWMrR3M3N0s1cXBNUndyNmNkenc5aVdBK0ZJc01DeS9lUGJMR1M0QmlQ?=
 =?utf-8?B?Qk5pSTl0aUxsUytBWDBjSFk2TUZrOGlsQ1ZGRGV0ZUErZnJ2NU1zSVlQMmcv?=
 =?utf-8?B?dUVwV0hxS1pReVNBVmxNTU9kcWUvNVZQS3VBWkNTa0NVWi9SdkpIUUpSYW1l?=
 =?utf-8?B?SUMvYWdtMVprbWhJUW1zUXhWbCs2OWNvaXp2dlYzcHJ5VFhVY1R6MHhLS1Rn?=
 =?utf-8?B?TThvNkcydERvQlN2dW9CTlh4dnovUVFaNXk4TnJsaUtiTGl2cXY4cStzR3dV?=
 =?utf-8?B?R05pd01KdGRoMDI4bkJkZDg4cjhIWW5rVG9VcEdLSWRqNE85UWZ6Y2JlNWZm?=
 =?utf-8?B?UjhaeXNxc2U1WjVFemVTNFYwY0UycUFQVlBUaVN4WGYrYmx3MlY3RUp6VXo0?=
 =?utf-8?B?bjJTd0JNdEhUdkhkd0lqdktkelJMejFhN2JPNUhIUzRTaVJHWnVjSHUxaGsz?=
 =?utf-8?B?ZEl1aHVQK2lVNmFVOTgxWURpMGEwUm90d1JuUFhBemFPQU16eDlGZ3IveWFa?=
 =?utf-8?B?aE9keFJUc2RSV29sMlVrRWt1ODZSeWorTnNCZndMbFAvT01qa1Z4MHZ5dWtI?=
 =?utf-8?B?VkVVQk1RWU1nMnNJVGNabEVvcGdjUXRlVi9RSFlwMDNHeXVzL3RRcnEvM2Vi?=
 =?utf-8?B?TUNRdUNIcFl5Z3VQMHp4ZDZkUFgrNW8yVFIyYWV2NDhTVkNtRll3b3RFMTJS?=
 =?utf-8?B?RDJwTHU4dnVhb3FDWitFK2FFWTREY2J2Vk5MN0U3Zzl3SmFKTUQ4dlBkanl6?=
 =?utf-8?B?eWpCa2FTWlZYT1RDR3Vuem04d2NQaURRWksxQ0pnRWQ4UXRaTGMzNFdwOVlN?=
 =?utf-8?B?YW9sUVFPM1lrV3ljRWJoWEFoNVZNbnkxdXR0bGNqSHVPWVYvT0VUbWErd3Mr?=
 =?utf-8?B?RWVxM0pQN0d6Z09nbUIyaHg5WWZ5eGE3SUx6ekErRUlVMlRwY1FpMVU2Z2R1?=
 =?utf-8?B?QnREMW83emhPaml3ZTdETjNQbXkwYkRGU0xodkpLOUhLVSt6T0pXOWJRakRY?=
 =?utf-8?Q?/ymgAXX7mnDkc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVZlQ1RjTCs1cXV0elVCMVlhcWw5eG9JT1A2cE9jbFBEeFJMdWI4UTJBaVFR?=
 =?utf-8?B?MkxCTzBaZXRDSTJlNVRPZ1UybkpGSm5qNnFzSEFYU2liVkk4OWJ6TzEzR2cr?=
 =?utf-8?B?ekJDVmZvSTEwN0hGMGR6U1phUXVINnBBcXorNlgvd1lUR1huQVBQZFd4T0g1?=
 =?utf-8?B?bTF5QkhBN1V3OFFUNVRpQkJOa2FKVmcyL3dwTk9nQWk5VGZnKzNaZndhcGVJ?=
 =?utf-8?B?aGFjYXR6ZmZ2M0xoY1VLcXVmcXVLdlFHUWVwc0ZWUWwvWm1IUWRtUUE4SlN6?=
 =?utf-8?B?MGVsejFQMEp2ZmhWT004NXdsRXhneUVrcHdqRlB0SmFISmUwelAwVUtmRkR1?=
 =?utf-8?B?c0lzTFRLR0FkMGxBdVFuVklaekJEVTQ5ejgzM084UG5RSkhJdi9oNXRUbkRq?=
 =?utf-8?B?dHdKZ2xIRElpM3Z2RXFVZWEyRy9nNTFLUkhTWTgybmpYRjcyZEVpOVc3MVcv?=
 =?utf-8?B?L1oySUoxbkxXTVRlaUgza3lEbnBibEVCa3BLdXhnWGZiSDY4MWNldTJhZURa?=
 =?utf-8?B?blAxK1ZBT3ZmVEhncmIrRjlCY29IYVVHRS9RNmxnLzlOTEFGMHRKSGlxQUV4?=
 =?utf-8?B?cG5LanZIWThtNG1SeHVVVk5EOXdkL0FEeVhWbUdDcmNRUHBNU050WWNoWDVq?=
 =?utf-8?B?eVZsdTlyaTBTZXBtWkhsbm1Yd2RCbzI0WGpqRlVRczdGUTkrNDJzSlJHeWNp?=
 =?utf-8?B?MEdrOXhuM0JzSkg1RGtydjA1WVJwbDJuVXNmTmllZUZlZUd3azF4RGpUbVMv?=
 =?utf-8?B?V2k3OXlVamNLazA1N1RRMFB0ZG1VMWszdTEweXlqem9VOGZ3bTQ2MUs2allL?=
 =?utf-8?B?RnZ6RmZSY1c5cXhkU1doSXZMS0VMOUlaWXlpSVAvOHFEaW0zV3NMbDVQVWt6?=
 =?utf-8?B?OTNQbGwxV0RUM0lpbHFwS2owOVp0Y3ljb2RuY2Fad2ZjWWpuTUVDV1NoRnMy?=
 =?utf-8?B?U0xHV1owZEdOQ3E5Y1Q4RlJXajBoZ2duRDd2b3QyK1ZvTS9vbUsxM1JEOWg0?=
 =?utf-8?B?OTFDWDZoeDZTbEV2eTdGL2hXZUgzWWNSVHNMRG1oREMza3JKWFNydFRLSkpj?=
 =?utf-8?B?eExKSysyZmFObDV6UmRXQTNnMmdYeGllV3J1VVdBZmQvUU8yN012SytFbCtY?=
 =?utf-8?B?WHNTS2M1YW04a09sMFpORVk1YWsvTEZrc3NobTI0ZXJSSThudXNsaTd5Tm43?=
 =?utf-8?B?SnlWd3diRDlCSnRYaTNNQ1hsenhYNE9MV0VuZlQ2SVlaeDdUak14bFlLelpw?=
 =?utf-8?B?aU1kZS9KNGxOQlgraXZ5SzNhS0w2bDZER3gyRm5Kc0NmaWFSM3BnSWFaNjBM?=
 =?utf-8?B?UU85S1dmSnpjazVVanB3S05qRmJRVFhwME45YUlXVC9mUkFsY0hMM3VXbGdz?=
 =?utf-8?B?WVFtOXFlbVBBNDlFYXJTbTROSVptQVg2TmxFbFBNMXNSeGRzZG9yVVNKV2Yy?=
 =?utf-8?B?NUpDZEpUSDBUaFlTUXgyditGZGtlSjBOeFRBRXBCenRUSVdpOFJqcTVsSWda?=
 =?utf-8?B?bnozNHJyTy9aMWxpL2NiQTVSOWd5S1lwMGNhT3VMYjRFMnVDNUhHdVBKeVVY?=
 =?utf-8?B?YWhtSFIxei9xUzR6T0N1NlJUTEVqUEwzUFo4K0FpYTF5cEIvTnArbXZBVlk5?=
 =?utf-8?B?VFdWWDc0b29aMmpWNlRVSVc2TXp1U2h0YVVDaktHUW1sZGZjeFFBVCtKYnd2?=
 =?utf-8?B?cm1JRE81QXQyVFVmZENibnpEMzV6OS93ZDlHWDU0a0VlWVNENnhYZmhXOUJB?=
 =?utf-8?B?L0JNV25VaW9aaVpVM2JyZWs4QVo3aVo5NFVUK3ZNV3BWSGxVR3BlTCtucEo0?=
 =?utf-8?B?NS9YSldua2R2bEhsSzd2RmJsVWhheDh4eDNQTERMY0E5MkpEVTlWdkxRVFI5?=
 =?utf-8?B?SE4zRVoxRWgvcEF5eEJrWjBpM0haZ2tLZ1RFSjEvV1BSckZjcTdKYXZmOFIv?=
 =?utf-8?B?TDFUM1hxMkxJWjh6UWhDMEgvcVY4UVpiMDVSRXRLbk1YZHZ1UGpPUWpSYzNH?=
 =?utf-8?B?dmpPQXdPRm9UeXk3VThMbWQwTlJDU0t6KzJjVXZVd0JFOWFYemMrRVNtUzJy?=
 =?utf-8?B?dWNxRkU0YVFFcWZTYUQ3YzI4WXRhTXZleUdFOEhNczk2R3ZVNzNWUU5NQW9r?=
 =?utf-8?Q?PaznBAkIx8pZaRPjBX6z2mBUM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4038d39-3a42-4275-d88e-08ddaa62fce7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 10:13:48.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYqFhphPcwOZgIxV/UAX4Uu1rul/g4GFQ5mavb34xD16q0EGMfxdfa+9wjkfzIzG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6692



On 6/10/25 10:32, Rob Herring (Arm) wrote:
> 
> On Tue, 10 Jun 2025 09:34:31 +0200, Michal Simek wrote:
>> On Microblaze platforms there is no need to handle clocks because the
>> system is starting with clocks enabled (can be described via fixed clock
>> node or clock-frequency property or not described at all).
>> With using soft IPs with SOC platforms there is mandatory to handle clocks
>> as is explained in commit 60dbdc6e08d6 ("dt-bindings: net: emaclite: Add
>> clock support").
>> That's why make clock as required in dt binding because it is present in
>> both configurations and should be described even there is no way how to
>> handle it on Microblaze systems.
>>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> ---
>>
>> Based on discussion at
>> https://lore.kernel.org/lkml/20241002-revivable-crummy-f780adec538c@spud/
>>
>> Actually this shouldn't be only targetting GPIO but also for example
>> xlnx,xps-timebase-wdt-1.00.a but I would like to check it first on gpio
>> before starting to check other bindings.
>>
>> ---
>>   Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/fpga/fpga-region.example.dtb: gpio@40000000 (xlnx,xps-gpio-1.00.a): 'clocks' is a required property
> 	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/dba4f2c39a25b54010c292c36e349cb289d6cd98.1749540869.git.michal.simek@amd.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

I have sent v2 to also fix fpga-region DT binding which contains axi gpio nodes 
which is what this error is reporting.

Thanks,
Michal


