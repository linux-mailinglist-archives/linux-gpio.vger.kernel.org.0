Return-Path: <linux-gpio+bounces-37158-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB2TFg59DGoSiQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37158-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 17:09:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B047A581225
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 17:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3725E32905ED
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 14:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F405304BCB;
	Tue, 19 May 2026 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h/uA/9R2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD2376A04;
	Tue, 19 May 2026 14:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202107; cv=fail; b=CxVEHDhCwk5/n89JW6XvwQh51Aw5QVX9Eu6Co4L7yuyOfIUTvd/LjfT7X39Jcy67/bvyRnHudKoL1Md8n9L5I8l/qRMbjNrLFmiRm3Suo/GPD6OXO12hZOtn88/P82oaiNyercknrFFOzSmlWt6tIisl34RQldzDmFtEYtNJjDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202107; c=relaxed/simple;
	bh=soOlzUpkWwPqM0fSmeghiAb9cFfuMZKWDcEBwZT7CaQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MaRBtpst+5tZ9yDygNT+fggCFD/o8AehWJkLqc9b1xn8XNgG//KqInsGtslva2gQfF+ETBS67VrGiTCaNpeY9midCpsnkj6o5OpVOcdJG8kmrsrCdhhAOqfx5ps7+YnO8LkxSxGOE2AmssKJrqI/JoFBpC/wVEl8ZBWkOXzxPeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=h/uA/9R2; arc=fail smtp.client-ip=52.101.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzAIOoYT1a4T8ChDpci7B2RpkdrylkOOk6yd4HPwUdAec4xE1gpEd0u5cFNauvgliqRsFFxMUgTgZs8hAvQNJgtXbyDx4x1uixcGpEejDJEpMSYRxD2nLozQoYW+d/Out50G0VuFfK8mLBFTam/HavVhQ7QApQmNVvDjmXKskvSrGuAqbMbrgO4ZbSGP0fWA7EK+bIrX575LFI0wpULQUs87QDozgYVERKPfMc6rPWECmsVwOaBk+niBSNBrIb10NS1Likc79XX33ZKrp6BvxeeU3i+U9h2JAYd4o6Fm9bIlxZ2ctJHqIZz3jO3b/v+wi7Yrj3Sc8wcRj9+gs8G5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W56RIIPOwz5bPsIJYVxDjp63m1A4YoJCOWu0DFbLRyM=;
 b=eejfEt218aZGhCTWUQGafro2D6vgmF67HkNCvIzxPNOuSc5QKI+BT2rrwEtqUdS8TbJTB92Y4YRQyzX5Jg5O7K014ojhkAh1z8SFHuticdv9CNfwViw/R8aTVX282d9cVRHZWATaS4RvXQ/VloLx4iYFcxkd1wMSZXd8m2Zx9FCuKxfLgIp4Omkn8MZD0XXi0o8xq+mVxX7cx964u6U3KrZZZDK5zasa2DLI99ptXvzDyR7sqsDmQtzSmHgY9usFQU2/dupNQzJmZ3BRTw4JNFzb9YDzjU2Cif6jCvyt26+5aKdOsOMKwWh+ofLblaI83Xp9RD/tFsseWi+4G461ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W56RIIPOwz5bPsIJYVxDjp63m1A4YoJCOWu0DFbLRyM=;
 b=h/uA/9R2OAJ2yZfObV7QxsGYC7EZEe7RJlgayIKEstuwwYbMI4hyLr7Ac5/Z6d+3Ztg1D120ltQRvdtQQ68CnUMTAxgX7R6m3+qDY72Xq7XUL2WGiBkC7nt+ANgv9uvvMH0UIjuvJ2YPNk2GomAIPrFZyFakpecAjkEhfLwgA/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB999147.namprd12.prod.outlook.com (2603:10b6:8:38b::11)
 by SN7PR12MB6671.namprd12.prod.outlook.com (2603:10b6:806:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 14:48:21 +0000
Received: from DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445]) by DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445%3]) with mapi id 15.20.9870.023; Tue, 19 May 2026
 14:48:21 +0000
Message-ID: <498bad3f-6a0c-4da8-b645-1cc837ba1836@amd.com>
Date: Tue, 19 May 2026 09:48:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
Content-Language: en-US
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, linux-i2c@vger.kernel.org,
 linux-gpio@vger.kernel.org, wsa@kernel.org, basavaraj.natikar@amd.com,
 linus.walleij@linaro.org
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com>
 <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
 <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com>
 <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
 <9d5da93e-bbe0-4359-9f17-e3c6b3a5cb34@amd.com>
 <CAMRc=MfT_WVMxPnYZW=mg52PHew0O4VQMGFrfo6G9vxZDDoArw@mail.gmail.com>
 <CANTFpSUX5rYhuTQH3dTTvzW+_yhW8Gs0U=A1t_8LDzKz4dzzAw@mail.gmail.com>
 <agsh652HlC4rg1_1@ashevche-desk.local>
 <CANTFpSU7XaNKwe_FPsTCkxQYeq78Tqusr-nsB-Ww0_teuiWdEA@mail.gmail.com>
 <f0ee2722-1e56-41b1-b70c-5503a2495853@amd.com>
 <CANTFpSWT+cR8Yxyr5jrB2MUidqKteWuPjHOyK_rpSkDUN6SWQQ@mail.gmail.com>
 <c4993bce-5d39-416f-90ed-d870f4ac9254@amd.com>
 <CAMRc=McSLEF_nrkRdJJu9=Bc_KmPWYKDHd6tOD9tJqs0fksv0w@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAMRc=McSLEF_nrkRdJJu9=Bc_KmPWYKDHd6tOD9tJqs0fksv0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0166.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::21) To DSVPR12MB999147.namprd12.prod.outlook.com
 (2603:10b6:8:38b::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB999147:EE_|SN7PR12MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: ec881d78-2ed4-41c2-ecd3-08deb5b5abf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/I6832HVSMfF8wTiLD9dt4BSMz3HG6BA3+qF8TOpLNnPvHmj9v7HYkjmA201VDCUEZ5dmhwx/rXqG+uOgpx8qAPajMNA38B3/bG7PmzEEjGrs+nOZeBy8NA56YtVbWzG6WZrhmDpsT7JTEanYjNct+CJXs11vQtzMS7LAZ9BsLpCSbSBQWw1W6oZM6rwZDvdvWNiiTcVjf30lw0SJJJDdDifKMWhOxkNiA3GmL36xTp1ZPvv4iUrBsj53PbmKDamahxTpKg88ZTdIutp74w/faPgpsXdxYchXllzADY4moHWmeAPbWtpN9cbae10VGlP7txjoFAKA/DaM4NrVsmO/vAHRr/cHjotDDid58xvFutKa/aWPPnoYpJliCtJmIMpsF/qSOlxhIyATihHlpFnP5/cXn8pqKMuEda2iuatOQoEomf2B9q9tSavmPRk5228aMRiMaGMo6S+eIMfBMlmQgwXcRHTnEFFD82rnDF3UVGAsZdnmjBxe7m8aMBghwQC16VvFGZmscj7kc5Vkrf2rrMpKHbSuD8CbpW+sa6YpHxQYSChRmSMr/wnTmvHtoa25XTsys9SLpDI0bsSPLdEud0RdMCQjC182qjnqR5MaJUE0fBVbhV8Fw2iLGtfpKuieqbKwW4/EDH08LGFl2cWzoPC/3UCOAkQDTxNywNasxde+ioBuMVdT/nP3WPop98n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFIrUGVXamJHTStiZWVuUG1ycTNNYWd2K2tpYmVHQzMrdnJFdGtoSzB4NlZi?=
 =?utf-8?B?S0Vub0JkUlRBMTcyRFRZbGZaWjlMc0NlU3NkZklaUFovL0dmeDYrU3krR0tZ?=
 =?utf-8?B?bzhYWWpORDJWNExPak1CRDZFWW05a21uNm8rUlNvd1VRWW5TM2tWbXNmR0Yw?=
 =?utf-8?B?MDA5SmNuR0NlcjluZnZnS3Ewblp4STJEa2d0UVFvNTdUaVhKSERXUlZuOFFS?=
 =?utf-8?B?NERtRHJoN2ViM0hldkZsVlQvSitxSlpVcDFPU0ExT1lYWkVjVWhPMnZLT0Q1?=
 =?utf-8?B?dTVtNVVPdWRsNmZ5ZkU0aklNSlY2L1JLYXV5OHg4MlhsN05BbGpFTHVJNHIr?=
 =?utf-8?B?SEtsZmpSanZ4alptK1FUNjlFNUw2S0hVVFp6YUowZnYySUdtVVFrN1RCaXpL?=
 =?utf-8?B?dFBPV3UzVWhEVkswS2dTbVZXbFByMjFFelN0T2wxdEJOcE9qVEZ1QWNyYXVv?=
 =?utf-8?B?NSt0ZStOYnFGZEN2aTdYQTNIclhZVVYwaGhDMHlYYWZWYlpSRTZDVXpsdDM0?=
 =?utf-8?B?NGV6NnFsN0ZLVDZWczlrNXNGODJGSmxiaWNVK3NITnRudHB4ajlKR3R2NTJK?=
 =?utf-8?B?Vm1MdFFxNUo4WDR6c2J6RGlSTmxNeFQ0Q2ZHaHFRS240SElTajNqNFBHd2FH?=
 =?utf-8?B?OXIxOFNPMHpHTVE1WWhjTzZlb1gycWtkaUpMVVEvbEJEd29LdVc5MnByQnFo?=
 =?utf-8?B?cjVnRERjWWZBcUt3NjZaZmE3dWgxTmE3amU2T29qcGpXZjhLbHpsd0RGZndq?=
 =?utf-8?B?dXp6M05UOWRiRHRwbW12NWpsa2hzRkMrWVpQRWc4YjJleCtkVDJVTDh5NVRT?=
 =?utf-8?B?elFHUlRJaHhoQVlhbDFscHhlVjRFcDZyUWhZSUsxVDk0KzI5emZNRmZCMWhI?=
 =?utf-8?B?Sm9kbTNBbWE3MGJ0bCtjdGVxNEdWSG5KNDBlcnNueW9JeTloRVBJK0JwemRJ?=
 =?utf-8?B?Z2R0UUYwTEJmdFFFUTJNdzM0L2MrZnNrTkFXcEdwSUhtR3RiZUdkdGNuNDVn?=
 =?utf-8?B?aC9CN2ZXRVRBZE1PNlNXNHd3NVpMMXpuV0NyczAvSkQ5bGlCem5CVGd5Tmo1?=
 =?utf-8?B?YTdTRkNNOW9jL3gvZDZHeTUxbS9PWGtaTFZ6U3ZpV0FneWVCd0ViZXZ0c1Vh?=
 =?utf-8?B?UTN1ODRMYTRVSkJRVGhYT05LSTM4bHpMYWtCaDkyM0FJSnRkcmx5TVdLbzdP?=
 =?utf-8?B?dGlCV2xVN1YvOC94VjZlRVA5SW5zNG5JTjdxOUdzM2FXUUcyUVJER1hIZmRk?=
 =?utf-8?B?RWk2QTIxSVc5cHo1bldvSjBUWDR1US9pRUxrc3FDV093d1dHeDB5eXM3ekYy?=
 =?utf-8?B?STB0MWFFUTB4eGxCVWw1T0pxOFhneEF4bGVZdnZnYjNMK2NnTmdYWkVFRzhG?=
 =?utf-8?B?enNrSFd4VEgzanUySUZFOXFxdDhOOU90Y1FVVktsbTZoZy9UdHYwRzlkb2hj?=
 =?utf-8?B?cUxXaEZ0dkNFMHcrNCtjU2w1WlZGYlpwVDdBaUN2LzFCRUNlMHpUU0gyUUNu?=
 =?utf-8?B?WDQ2ZnlqRjNXTERJcEFUNitwYnpYalA2NEIrUWZoL3IvZm90MnhLSk5JSFF4?=
 =?utf-8?B?RGFSUGdXODBpZmhVMlM2RXk3MCtzckxOOFBJNmpodjlvNWwwdzkwZkF2Vytz?=
 =?utf-8?B?NlFTYjZXZlBuMkFWendZUkRxQW8rZ2RXWTJsbzVqbkRiQ2FXWGJ4KzArSExy?=
 =?utf-8?B?MkxmclI5SlgyUFJkZVdnNEZ6KzdqZEpNTENEVmU4clZIbllaTTdpSFFZRUFn?=
 =?utf-8?B?U25LMUZHYUwwd0dIZlFCOEIvdzVZVy9ZS0I1YzlRVGF1ekJVdkNRRjhyclZv?=
 =?utf-8?B?c3YyeTl6RHhaaXdyTXd1clRyZmhPcTIvVzJaMzAzemZpalptTXRROEJIeTd6?=
 =?utf-8?B?a0pHNVpTNWY1cW5KSzhac3Mrb3NuTmVOaFpOOTAvQ0VMelFLQTZLVkdRcjhJ?=
 =?utf-8?B?czlJOGVodGRuYy9XSlhDVmVvMGp3a1JTZDY3WTVkK09neEozenF4anZseHFN?=
 =?utf-8?B?eFcyb1pIMXhzL2VnQTI3Tzg1OHRaK3hlYW9vZXBTb29UbEVGL2RmaUdDRTBM?=
 =?utf-8?B?YkF1TDRKaEhyNWZtTER2dkUrdzV0MU9wMU5uTEtHQUZBMmYxZkYrbU03eTZS?=
 =?utf-8?B?SDdIREpxcEZFU3hWY3ptczV4Qll2aUM1L2x0WTlFOFh0R2pFK1RzUEZMNmZG?=
 =?utf-8?B?elRnSTNRbHNGZ2Y5T2ZQZXcydW92dS84L3VKbnJqOGNMc0V0YjJFSEhLT3Ix?=
 =?utf-8?B?N0JaZkM3M2J6NzkxT3hMSnZNU0hiNUxIcm1qUEZYNjJnaTBHVXNwZ1dRT0tS?=
 =?utf-8?Q?bsn77MWsSWKDybtzhm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec881d78-2ed4-41c2-ecd3-08deb5b5abf1
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:48:21.4228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3sOAYN750kqMRKqUo3VZpRSEgxFZtXQ4dJRsG4G+ceqdk/31h2PQ1dwF4996+V7Zvt5yz/ScqR2IiPV5GwM6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6671
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org,kernel.org,amd.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37158-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: B047A581225
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 09:39, Bartosz Golaszewski wrote:
> On Tue, May 19, 2026 at 4:28 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>>>
>>> gpiochip_add_data() at 0.285952 makes the GPIO chip visible to the
>>> system before amd_gpio_probe() has finished. AMDI0010:02 starts probing
>>> at 0.301454 while amd_gpio_probe() is still completing. This is why
>>> device_is_bound() works and initcall promotion does not -- it waits for
>>> probe completion, not just gpiochip registration.
>>
>> What is the boot time impact to adding device_is_bound() check?
>>
>> Bartosz, thoughts?
>>
> 
> My thoughts are that ACPI could use some fw_devlink. :) It's not a new
> problem, we've fixed it for OF systems.
> 
> Could we modify gpiolib-acpi.c to return -EPROBE_DEFER if the parent
> device of the GPIO chip is not bound yet instead? When resolving the
> reference to the remote GPIO controller we have an address of the
> struct acpi_device. I suppose there's a platform device that is its
> child and then the logical GPIO controller device, is that correct?
> Can we check if the platform device in question is bound at the
> subsystem level?
> 
> Bart

I like this idea.  I guess something like this:

diff --git a/drivers/gpio/gpiolib-acpi-core.c 
b/drivers/gpio/gpiolib-acpi-core.c
index eb8a40cfb7a98..e3511398b1f84 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -142,6 +142,13 @@ static struct gpio_desc *acpi_get_gpiod(char *path, 
unsigned int pin)
         if (!gdev)
                 return ERR_PTR(-EPROBE_DEFER);

+       if (gdev->dev.parent) {
+               scoped_guard(device, gdev->dev.parent) {
+                       if (!device_is_bound(gdev->dev.parent))
+                               return ERR_PTR(-EPROBE_DEFER);
+               }
+       }
+
         /*
          * FIXME: keep track of the reference to the GPIO device somehow
          * instead of putting it here.


