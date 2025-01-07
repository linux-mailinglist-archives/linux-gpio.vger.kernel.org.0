Return-Path: <linux-gpio+bounces-14569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 850A6A04555
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 17:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63869161EEB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 16:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97BC1F428A;
	Tue,  7 Jan 2025 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gfewWP5o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79B71F471C;
	Tue,  7 Jan 2025 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265625; cv=fail; b=VDbAo6JRPhTKSfGLzoA/SrWx5fRgOSYvpRZ0g/B4jx0AHrmH2jGQEYn/Lxst/CtN/MsNbeDwV/q9tjimFZsCDs5Au3dW03rjGEqz+woflzdSYFSVBA9zRUj2o7aw5Q8WMXm+wcU0+vqKLOSDbkwf1isnsPNcKNI/f+aQGdlzrwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265625; c=relaxed/simple;
	bh=OvRiH5bYBS4Tj5gBtoR1UiEBcmv7h0YOJbFWJ2W3Y0c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NBripDAC8gtN+kRewfEzED8Ul1jjP4iv0Uf8yFYFWK5XqRmCckfP99h4tClV6BAfw+uGDSrc/rx+W1LZLOq7L9r78tx6EAwa9AA/wTcIrG+OH3al1ZfqshcGL/iBPHIe1tf46xloJukjZGU0SNnBQuAGchAMbOZ58IEc19oDqrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gfewWP5o; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrq6N723dDqbsMtxZ3ng6Q9KtT5n2bG5ORbuVHwIs3Qp6L1DRMBJJSs40dhTKpKijlDa7qjKdFbWUv7l5YHrpY1JimNupbwY4fdJ3iveYSi8kfLz7UxzH1R7JabLxpYNW6vC1INfLNxO5B+HqpWzwpIfv8X5wgqQq/J+TfCta8C/W+hXJ6RcbXcb6zyX5VMGCh88bWM+7auqLlDlIq9TA79UWXTtjo5SPmads40BYxVqNZ2V/gLB6CsfIlOhbzVbHiKCqLmjxWsJ4/suKa7SbMeAr43fjttG2g5i4TRV3G2FH4TGIrOwRqvsIodiy8IODH9zarGqVdIo36QMo/i59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/r7zoMK9Eqo1zQMyAaWuZbAz8TbhXlIm4xOMdHjPBLk=;
 b=CjZ17bt07/5UGv1hptTr6tBZR8NgHAYniB9BJ4KkV78LrV2jcMjBv3UvPyQ+ZVeVSlWrQHOo5cBcFS/XXGU+2GMICt9aJU9u2iLg4DZSLUTEX/ZVq3hNOfW9Uce3eq4U+Hiy5roUzhl6ahm+8gi9bR76tm8he7xfLw6rXhkRYc8Jganssq4H2JIEThQX2r/Ww8hua3wXX4xOoIdbx7gkbhI1/wx/6UN92BpA61AziI+oOC4I/Op312YRiUXAqXDp7qAO1iPbIWJnZlQ7x4f9LZo23/cvfzQuwX5cJa5VQMCkzuwRSqjfji/ujPVeWpOj1qSLZs8NRhJu1HIa321wPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/r7zoMK9Eqo1zQMyAaWuZbAz8TbhXlIm4xOMdHjPBLk=;
 b=gfewWP5oM5E/R5WfkzBRFLrk3nNzkttBHdgwib9WDPsKAezhG1W6DjtxPSHXZLlZDDyTGry9fxpdn2QgSid4IeraqFk0W1JQvrXyC2yj3M0yG3afUvv+GxzAeRwIYa+EZ9CKJqlHm0NwxPlb1wwkJaVpHbWn2BZ/3KxoazP5zs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MN0PR12MB6366.namprd12.prod.outlook.com (2603:10b6:208:3c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 16:00:18 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 16:00:18 +0000
Message-ID: <658f7146-2a7d-47cf-bd3c-561bcf04931a@amd.com>
Date: Tue, 7 Jan 2025 10:00:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: amd: Take suspend type into consideration
 which pins are non-wake
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <d4b2d076366fdd08a0c1cd9b7ecd91dc95e07269.1736184752.git.mail@maciej.szmigiero.name>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <d4b2d076366fdd08a0c1cd9b7ecd91dc95e07269.1736184752.git.mail@maciej.szmigiero.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0003.namprd21.prod.outlook.com
 (2603:10b6:805:106::13) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|MN0PR12MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad6af6a-6284-4fa7-a529-08dd2f3461f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnJTZGkva2QrZ3FPQjZRck1POG91Rk5WM0FZUjR4ak56eUc3djBFMk4wanpo?=
 =?utf-8?B?Q1dJTlJYMFE4QXl2WXVvZmo1aVhiWm5SdEppM2lvSExYUzJjZTkzMjBOVHR1?=
 =?utf-8?B?QVNDTXE3Y2xCMWkyUEo4c1l5alRncU4rL29wenFWelA0UytBTk0vU2duQmg5?=
 =?utf-8?B?MDhSWkNpRml2cFlCZ2pIL3V0eThzT2tBMTdJQWdDUXpCc1NEck94L1NnaW01?=
 =?utf-8?B?V2RDK1BWSGJoVktoWmdmSFBKK0YwNzFSTlhGMEN0dUtkcUcwa0M3Ulk0ckxk?=
 =?utf-8?B?NkRGZXd6NjdTTmlQaGRwZ0VJUERiMVFCaWJBWXRGcm8vSWZMYmpZdUJEbWtL?=
 =?utf-8?B?TzJkR3JQK3Y5U3ZhK2VOekVUcDdPcTBMazgzWXlZY2IwTTZBVkhzUG92S200?=
 =?utf-8?B?bmMvV2cxTWpZaEVXam5SdFVUeGp1RDlZR2Y0Zmc2ZWJVVEh6WWdtSzRNdmFO?=
 =?utf-8?B?ZjVkQ0FPN2JUbVM2OHdhU2NXY2FGNDlyUFRoN3RmNFVBMGNmV1dMZ0Q5NnBy?=
 =?utf-8?B?eVNLblZTUStNSW5lRXRVQldaQjhnRFNMMUM4M044UGRjQVNiK01TUGliNk9h?=
 =?utf-8?B?N3paMnRwdEh6N0kxR0hXcGtscXVHUDgwekNJQXpFUGY4aWZiR0tvYytBT0ln?=
 =?utf-8?B?bk5ZZWlSU2NQU2hWOG1kRkVncTNOcFJMcVgyMzVlU1lHNmM0YjFYRHI4YmZV?=
 =?utf-8?B?VUVZSHpmaUR6S0VQQW9BY056aEtBWHMrUGFtVnhtemI4T2NXMXRDNjJhQmw1?=
 =?utf-8?B?dTQzVUt0UzcyUXpSZ2E0Y2JNaGhOVHYxMW1VMVZ5M05IRVJzVWNSTmJyQXFC?=
 =?utf-8?B?RnJGZTlDaUZPZ1pLNjN1cW5JMmh1R1hqTGhWUkVjcmRmVHNPV2V2Vk1aTG5u?=
 =?utf-8?B?c25oOUlqNHpDclV5TTRsWXgyQ1FnaW9HUlRrN0JidDUxYVRDQnpVOGRoSTJW?=
 =?utf-8?B?bmVidWU5MUNFVllDUFNWSVYvcGIrQWZINVdlcVFRSlJ6NzJnOEpkRHdPSUtY?=
 =?utf-8?B?WlF1ZXVVc1F6MXBUellQQjBLTXk1Q04xUDlBbWRpY3FqMDNZWmo1cXJOS2VP?=
 =?utf-8?B?dlpZWWpiZFQ1ZUl3eFFVRHY0cExzaDlhSC80cHg3UUxKVERRVkFKM0lSaVln?=
 =?utf-8?B?R3UvR29HS3FlcG5lSHQwOXZ3aWpwSEwxUjZ1ZHlXcldrbEk3T0szM2hmYjAw?=
 =?utf-8?B?dDU0QkZzYzZNOWtjNHdoY0d0K3RPU2l0SVlHclZ0dlg2bXl3Z29ucHZNT2c5?=
 =?utf-8?B?clFVUzUxTUlERVp3eWRJVWZlaFd6VXppWEFsOUFMRVpGRGdtdEVCc0FMNzRn?=
 =?utf-8?B?YWY0bGtsT1ZDdDBtbTZmLzFRczRoT0JSVnAzZU9VZ2prZkR0UDA4YlZqbTUr?=
 =?utf-8?B?Y1pzYi85MDYxRVErVUlwTHErdm14dXhJRkhOalBFMGZ1dksramw0LythbTBR?=
 =?utf-8?B?ZGV0RXJsMTRXMGRNS2FubDNSemJuL0N3eWF3eE51UEJyQlkyYXllME9oUFRV?=
 =?utf-8?B?MWV4ZzYvU3ZZR1BDRGdWbWIvb0I3U2lzMFQrTlZwdjN5eHBzL0lQNjhJeWIv?=
 =?utf-8?B?TGZSNUVBYTlpd2xzTDFsSXhOOUhhUzY0QnE2N1N0YzRvSXhMcmxZekJUZkpI?=
 =?utf-8?B?clpWM0wrY3hZYUpFZUJvdkZkRXVRcmFwSXdzVERHaEZ6NzYrenRxZ2hLQWNh?=
 =?utf-8?B?LzVlRUJXSGM4UWJOYUN2d05rTlI0THN1b1JNVWFhcGpIM2xONnhMK3JuMFVL?=
 =?utf-8?B?OUQwS0hDSU9wWElZQWJ5NW9odGpOcDR1MTZaMjlla243L0ZSZXQwMWN1cEdK?=
 =?utf-8?B?Smh4QldEM3duZThJNjRCTWM4aXNISVorRTNwb0hROE5UWUNVajcwN1gyYzNF?=
 =?utf-8?Q?oQaM0uggVrktZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHo4ZnlkZlcvUGdlMC83SE9WMGdxSEZ1V0VYSlQ4elFTTWg3QUNTTkJLTDEv?=
 =?utf-8?B?REZuMlFFekFiaHVPWlpaSFJ2dlJSS3NYUGZTV25kRVdBRVNPb3FnMlVxOThk?=
 =?utf-8?B?c0lUdHZ0TmpnN0g5QUNxV0NQbVd4MjMvVXFlRktwUUxxNFZuQmgvWno3WlZo?=
 =?utf-8?B?Y3NXc280dDFKaHkwTlRna0NraG92WjBqdTdCMWZTU1FDVXRlZFFyQVlwQXRX?=
 =?utf-8?B?SEIxV1ZVaXRmR20wWk4zeVhlNXlqVTFTbmlVbnh1OThTenVValo0eWZRVG1U?=
 =?utf-8?B?TFdhWkNYN3MvRE93bWtVUVd4c3I2ZEl4dzRmcUprTUhTMmRiRUcxakhHTm1Y?=
 =?utf-8?B?bStmQmNpNG4vMDlDZXdvT2NLU2ovdFV5VXJwZC9aUktYM2tHcW0yRzMzZjFS?=
 =?utf-8?B?RzBPQWJxN3dNU3lwam5GM1N3ckRPMW5TbTJIdVFoY3o1WnlxK09YUWp2eWE2?=
 =?utf-8?B?czBJOS9zYi9UcU5sd1pYYkJyVUdrVXpnZEd0V242bEZKODBoMDlmUk91YTlk?=
 =?utf-8?B?ZTRhNXFJRmhkSWMvNHh1Vnh0UWMranVRT3NicWk5TFIzTXBOclJlS1J6MExR?=
 =?utf-8?B?b2xMYXBmVzhhcHUrNEFPNjAyRzlDZmt1ZGNONTJnQmx1eEJyOWVaU3UyQis5?=
 =?utf-8?B?bEM2RmlmV1BnRzhDNXd2VVg3UFdBZTlwS3hTVGQ2d2YyYUZqUHFrWW5uY2J5?=
 =?utf-8?B?WVBWelhCalMzWmppckdZeStuMmRpTmlNSmtpbTB2TlRCV3YrclQyS2ZMTUk0?=
 =?utf-8?B?YmtNOFNMZVIvR2hGcE9UMDFFS1dhdEtuck9BT29MMHhqUWVzSFZpbjBxemxB?=
 =?utf-8?B?cUJtVzFDVVR4dkVkQlNkR3BSTG9kSTNQUlQyQTM2ZGdnRTJUNndWR3J6dllQ?=
 =?utf-8?B?cDlIS05KTkF2ZlFtcEd4VGF5VVh1TWp3d1p5aWNjZWpWRDduOWIrS2d1eXZB?=
 =?utf-8?B?dk5RbSsvYTdjbjBZYmRBaGZCNXM3T1EySzZ4bFY5ZUQ4QlV1QkJZcXQvdmtM?=
 =?utf-8?B?ZDYzbmh2MElWT2U2VElyUm1xaGw5S1ZDR0xUL1hrZlV4MHdaaGJNdUNxaVlu?=
 =?utf-8?B?K1VCd2hidFB4TXlRWU9ScnByOXUwQUpzZWxKVUpHYnU0UnhsYXBDMGVKeXBV?=
 =?utf-8?B?ckltYk9TSzR6aUMvNitkSk9PRmFCRTdCSjNnMFloRko1dzROQjBhTHZKZEFN?=
 =?utf-8?B?R1FrL0VkSWUyRTNIZWlFMytxemswOXhXQm9QcndWOTYxemJkOGJPSFUwek9i?=
 =?utf-8?B?UXBRV09vaWMwSzVsbUNkeXdvbzdOZklVTlNFTzAxcHJuRjByd0h1d1ZSQjF1?=
 =?utf-8?B?R3o5ZW1WK0pWV1ZyUy91enYwMElQK2NYcWx3QUpwQTR5VVc1VXphNk5jVmw5?=
 =?utf-8?B?TmNwT3VkUnJIekgxbjRlTENvUzVwWktUMGNPb2RhZHNraExCRVlWdVQxcWwx?=
 =?utf-8?B?dDNNRkxzNWJuWVlJUG5sRDVYNGNzV21PbjdzcHVNSmJ4NWJRVnhpTlhHTnZ5?=
 =?utf-8?B?U2NZMEc4bDhrQWZWSm1JOUdPWHQyQUQyUkJqanZaMzFkUmlIUmJnYkNKeWZz?=
 =?utf-8?B?TzljeXBJbnRESkpWRVJOMjVlZERrdmFENFViaklQVnVLeWd6SzVxSHArYzk3?=
 =?utf-8?B?NVhrK2RaVC9udlZQdHNMUzdWdW1mR2ZVTnZycXdiWTR5UVVHeEl2WUFmalhy?=
 =?utf-8?B?emxXWDMvd2lEOG5LQ2wyR2FNcVRycFBFS1poUmFBcjV4WmdrVjRsZ2JpT3JO?=
 =?utf-8?B?LzZsUFZQS0Nxc1ovemZ2eWtUNVczeU50bllKRXNRZjVZck52Y3d2SThJc1FV?=
 =?utf-8?B?NWdONEN3NlJ5YVBvMm5hU2FEMmIwWVU4V2Y4TEt2bzI1ZlpTR1BnSUI4bzlM?=
 =?utf-8?B?YUdYRWM2OTFNZ1FMbUYyTHVyVU9CYVVhZjhKQWVNV3JlVUVNOFczQUVVeWcx?=
 =?utf-8?B?MitGSUNDVU9POTF0OG5YWWpYV0dYTlYzR3YzazZoRlhLakpqNjJBZUFaekQ1?=
 =?utf-8?B?RzBrakozY21zRlFtMktXdlhlTmt3RFh4UUp2T0EzWHJua0JwSVB3aXVnc2NV?=
 =?utf-8?B?dUhQbk5zdmpnNjF0N1BDOTQrQy9zVWd6bk42OGJMYTRKS3pOcU9EaTk1dzds?=
 =?utf-8?Q?TC51nCfOP1adbcAZ5MS9edN0O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad6af6a-6284-4fa7-a529-08dd2f3461f7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 16:00:18.6615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvOarLyITy2kqM5KY6BjLzvRGJIdjrzzg4f5t7HYrExtVI9ZTrYPcnLhE1jam7RMZCMUKrf6r7r72l8DhwuY4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6366

On 1/6/2025 11:41, Maciej S. Szmigiero wrote:
> Some laptops have pins which are a wake source for S0i3/S3 but which
> aren't a wake source for S4/S5 and which cause issues when left unmasked
> during hibernation (S4).
> 
> For example HP EliteBook 855 G7 has pin #24 that causes instant wakeup
> (hibernation failure) if left unmasked (it is a wake source only for
> S0i3/S3).
> GPIO pin #24 on this platform is likely dedicated to WWAN XMM7360
> modem since this pin triggers wake notify to WWAN modem's parent PCIe
> port.
> 
> Fix this by considering a pin a wake source only if it is marked as one
> for the current suspend type (S0i3/S3 vs S4/S5).
> 
> Since Z-wake pins only make sense at runtime these were excluded from
> both of suspend categories, so pins with only the Z-wake flag set are
> effectively treated as non-wake pins.
> 
> Fixes: 2fff0b5e1a6b ("pinctrl: amd: Mask non-wake source pins with interrupt enabled at suspend")
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>

Thanks!

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
> 
> Changes from v1:
> * Clarify that Z pins only make sense at runtime in the commit message.
> 
> * Clarify what GPIO pin #24 is likely for on the test platform in the
> commit message.
> 
> * Rename S03 and S4 to, respetively, suspend and hibernate.
> 
>   drivers/pinctrl/pinctrl-amd.c | 27 +++++++++++++++++++++------
>   drivers/pinctrl/pinctrl-amd.h |  7 +++----
>   2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index fff6d4209ad5..a03feb5a60dd 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -908,12 +908,13 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
>   	return false;
>   }
>   
> -static int amd_gpio_suspend(struct device *dev)
> +static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend)
>   {
>   	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
>   	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
>   	unsigned long flags;
>   	int i;
> +	u32 wake_mask = is_suspend ? WAKE_SOURCE_SUSPEND : WAKE_SOURCE_HIBERNATE;
>   
>   	for (i = 0; i < desc->npins; i++) {
>   		int pin = desc->pins[i].number;
> @@ -925,11 +926,11 @@ static int amd_gpio_suspend(struct device *dev)
>   		gpio_dev->saved_regs[i] = readl(gpio_dev->base + pin * 4) & ~PIN_IRQ_PENDING;
>   
>   		/* mask any interrupts not intended to be a wake source */
> -		if (!(gpio_dev->saved_regs[i] & WAKE_SOURCE)) {
> +		if (!(gpio_dev->saved_regs[i] & wake_mask)) {
>   			writel(gpio_dev->saved_regs[i] & ~BIT(INTERRUPT_MASK_OFF),
>   			       gpio_dev->base + pin * 4);
> -			pm_pr_dbg("Disabling GPIO #%d interrupt for suspend.\n",
> -				  pin);
> +			pm_pr_dbg("Disabling GPIO #%d interrupt for %s.\n",
> +				  pin, is_suspend ? "suspend" : "hibernate");
>   		}
>   
>   		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
> @@ -938,6 +939,16 @@ static int amd_gpio_suspend(struct device *dev)
>   	return 0;
>   }
>   
> +static int amd_gpio_suspend(struct device *dev)
> +{
> +	return amd_gpio_suspend_hibernate_common(dev, true);
> +}
> +
> +static int amd_gpio_hibernate(struct device *dev)
> +{
> +	return amd_gpio_suspend_hibernate_common(dev, false);
> +}
> +
>   static int amd_gpio_resume(struct device *dev)
>   {
>   	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
> @@ -961,8 +972,12 @@ static int amd_gpio_resume(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops amd_gpio_pm_ops = {
> -	SET_LATE_SYSTEM_SLEEP_PM_OPS(amd_gpio_suspend,
> -				     amd_gpio_resume)
> +	.suspend_late = amd_gpio_suspend,
> +	.resume_early = amd_gpio_resume,
> +	.freeze_late = amd_gpio_hibernate,
> +	.thaw_early = amd_gpio_resume,
> +	.poweroff_late = amd_gpio_hibernate,
> +	.restore_early = amd_gpio_resume,
>   };
>   #endif
>   
> diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
> index 667be49c3f48..3a1e5bffaf6e 100644
> --- a/drivers/pinctrl/pinctrl-amd.h
> +++ b/drivers/pinctrl/pinctrl-amd.h
> @@ -80,10 +80,9 @@
>   #define FUNCTION_MASK		GENMASK(1, 0)
>   #define FUNCTION_INVALID	GENMASK(7, 0)
>   
> -#define WAKE_SOURCE	(BIT(WAKE_CNTRL_OFF_S0I3) | \
> -			 BIT(WAKE_CNTRL_OFF_S3)   | \
> -			 BIT(WAKE_CNTRL_OFF_S4)   | \
> -			 BIT(WAKECNTRL_Z_OFF))
> +#define WAKE_SOURCE_SUSPEND  (BIT(WAKE_CNTRL_OFF_S0I3) | \
> +			      BIT(WAKE_CNTRL_OFF_S3))
> +#define WAKE_SOURCE_HIBERNATE BIT(WAKE_CNTRL_OFF_S4)
>   
>   struct amd_function {
>   	const char *name;


