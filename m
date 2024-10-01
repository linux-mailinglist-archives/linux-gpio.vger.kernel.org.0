Return-Path: <linux-gpio+bounces-10610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB1B98B9B4
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 12:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7CDD1C22CF9
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 10:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBE23209;
	Tue,  1 Oct 2024 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dLHmSKuy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E914594C;
	Tue,  1 Oct 2024 10:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727778574; cv=fail; b=skwHLXpYNRm0IMY+zSIsnSPgwXrd4M6oCOPjsPZk3ci7xnLyoRlqnu7oxU9GFQ5elOaUZYHaKuGnaXKfNekCnbnBab0thoEJipJL1lQGNc4DjplkCwB1H9H47F+pvA+J1xjYD4VttZbQbRvokEvSB6Na6uUqjZeL+ngZ+iS/Bow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727778574; c=relaxed/simple;
	bh=LFl99NDU6iS8wqamOjhe7UtSgqX9WkTdTelqG340v7w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IxFx1EhrBJ4gkI1GaSbXNlGNg+z8F/AXVWVhzl1BHByBkeDhp/vEvRYqQkrtSt9XSBWQ2AkTsC4aCqKnXrnyWl4ISoH39E83DgMKVij0+ai1585khvfNDupO0/5WX6LkLqusD1tT6Ih620WE9BgP6bqSdDV4KQegbIvxG/ML2IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dLHmSKuy; arc=fail smtp.client-ip=40.107.223.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxxubMtNGONkpC9HHwzV631hxBXBdwMYQqnxBGeaCP6Ox4VMGH5moygnKLDm2970eJcnwGaepHbguyPeojOrVa1rdXjXbK4M2U5AxROaMYWs3HFIv0OKKtnk7Kl6Q4lV5Mqh6fYR+Qntz0b5VMR0mnSfllzL2x5fQMFHG16kn4YPySBvBumJSrvkkTZ+dOodpjOmeLNEYug977+3BLM2fXT/lgwBuVnnmgOKYnO8oCI1rFuxsoAamZ4+QfvgVRBuivIWo8HU1CyQ0nyaugJxPdtN2fDX3i1nxHoitz3E5GSx1qM5FZPTAEQO27sZYDL924cQxCLiS8qttH79H89feQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qvq8IhMhe6woHBvrAHUyVrCMl/cbNNFLeXbAkcJd0rs=;
 b=CuIIUmqAV6QkQgQMRy+cml0klYYzFE4x60bXfyd/qTsqBkdzkNPn6vo0CZqlYIpo/Y0UEr3FHiNkx375f2EdyAetjmbOuaDXcTnjoJBsKLjNfoi1T5hqVpUeoP00JLZceb+cwOJ+sSwNBUhw+Rm+PxtS0qvArtBByYMysyVvFZhQ2vBR6qcoOMFzd+BYj2q4HM3rc4XYS+hzU/suJ8EXqGtp0DivlV08jwBL+JMHQU6NdkamYpwAIMvLdkbvwPP2Zkr37CQUbKUJ7/zLKZARRZUCwbfnD5gBcbbN0P0dpnSY95xvHBPQXimOBWiigfgQv9nF4z3cnmFiy49QwST8vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qvq8IhMhe6woHBvrAHUyVrCMl/cbNNFLeXbAkcJd0rs=;
 b=dLHmSKuyiWSQl8qWHFfGoiLu+yMz4rrAELqXCmmyH/mvYXm0awehZNGXhyrUzqiP8tf//GWwwlmzSjYq5ffJDP9NiM8G0UPevw0mezQfEFM3C6dA244hLOCnedg3LK6vOgcZmpEWxC6NAD1Vj1mH5m7RN6j0Ayb//ZKKKB3TbVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 10:29:27 +0000
Received: from SN7PR12MB8101.namprd12.prod.outlook.com
 ([fe80::fdb:e120:f99c:c899]) by SN7PR12MB8101.namprd12.prod.outlook.com
 ([fe80::fdb:e120:f99c:c899%6]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 10:29:27 +0000
Message-ID: <971af2b4-158f-4dcb-9264-90f942b34294@amd.com>
Date: Tue, 1 Oct 2024 12:29:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] gpio: xilinx: use generic device properties
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240930144804.75068-1-brgl@bgdev.pl>
 <20240930144804.75068-3-brgl@bgdev.pl>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240930144804.75068-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0220.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::41) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8101:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da9ea64-b3bf-460e-b78f-08dce203ed0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmkwdEdBcjNHNTU0UFN2RVVYS0ErU3VKcGEzSWlpdFprOEpVdnc4NmRNaFYx?=
 =?utf-8?B?cWc2OE1tK2NqTk9tZ0tJU01NT1dOMzJDcVcxU0pGdUtJZldVTjZWeGtkNjRt?=
 =?utf-8?B?ekJobmtjSVZINkNIOTVucUcrUlpBelhiM3VzTjcwRUZldGgrU25FL0dRL3da?=
 =?utf-8?B?Y2ExLzQ5ZEJRRTRMd1UxVjQyc1NuOXgzdGxNcHZIQ3FaM0dTTzJ1V214bzVT?=
 =?utf-8?B?aHlLTjV5aVJ2QUVTdGpEUEg2S1g1ZVIrNGhvd1VpUllySzkxTXR2NVlQMThX?=
 =?utf-8?B?ZndZNG5LNEtyMm1Jb3MwODlRUllLZmVralpibU5xdko0UUxIUWRnZ1ZIWEg4?=
 =?utf-8?B?OENyS3hpdzR2dXJ4dmZuU1JBQnlUZHFuc0M0aVB0RDZsWW1GUGQ1bmloK1Ra?=
 =?utf-8?B?MWVjb2FIN3BwTmU3S1FyREhRdkY1QUZDcUtXTitaOUdvcjRZdU9TU08vSUNs?=
 =?utf-8?B?UXBuVmg2SldYMFhlb3EyZFNmQWVwbnkzRGxhUFdvaEZyN1k3MXlpNGFZbms2?=
 =?utf-8?B?eDdJaU5lcGtKaDQ4bDBra2JLUjNETmZzSEp5bGtPVFBvbDArMFdxNWhrdVJ4?=
 =?utf-8?B?aEZTN3BBWVlTM2VES3RxalZ1ckZYQ2wwbmFjcUZUWGhIWVpQV1g2cCszeXRW?=
 =?utf-8?B?U3RKc2xOOWJTVSsvSUs1MG9aMXdrUmpzVjNjeVc3b1lFTFJ3U2I1QTBnVWUz?=
 =?utf-8?B?KzFnRDZnVnVSK1pEOXA4MFJRRzB6TEpVb0FOZE9yZW9MNEI3cjNDZXNENnNq?=
 =?utf-8?B?bmFkanFkd0hpa29jRlFMZG05a3laeTlVY1lKY0sva1MxazFGMXptVlFOVDR3?=
 =?utf-8?B?alVPK1ViVWc3a0tJNC9GVFlaZEZwczk1TlZnd1dodUdPTXAxUVJRR3hNeDJ4?=
 =?utf-8?B?L0ZxSnhuRkoydTNxWFhtVVlnbWdsdkJ4T05ncHlsS1JEUWRpU2gvSXM4cTRm?=
 =?utf-8?B?eFNHRjBERDM4NDZoQ3J2eVNSc2pkRnhWOUduR3FGQ0djblRqZE0rdks4dVcv?=
 =?utf-8?B?S2JISXpYWEpnZ251L2tXSTZpTmFOU1Ewc0hZaUtTazJEenMwU2Y4cHZ6MlRS?=
 =?utf-8?B?ckVmU1ZoaEF3RUVXSFJaNmVmTUt4QzVVNXNjK2x5TW52NjM4TjVtekdxV3hY?=
 =?utf-8?B?TThHbjFENjBBMUNxb04xNGs4a1hDRmNzN0tYbUFSR09MejN5emgzMmQ4WlFz?=
 =?utf-8?B?SGhhSVpGOHcweENpRmRGck1TMXZvS0FUY05JaG9raURYS2sxMnZMbGlCZFVv?=
 =?utf-8?B?YjZUQnErYlVkOG1TWGJxNmpCL1FwbU8xbG8wcWZvdXlwU3ZXMjRweXdSYnVn?=
 =?utf-8?B?dDdFeHk3Q3BHVmpydnd6aEhva09hMFM4a3E4TXdoOHBQSmtXVmJXc085YkQ1?=
 =?utf-8?B?RnVmQlFnOFpRZ2YyaFQ5VTNsY0N0M25wTFFMRE5BbCs3aUZYbjRWaWcvUGtO?=
 =?utf-8?B?T1lPYmdjMWxiZVFOQ1plemtzOVFITEs0S25tdXF0bHJTUVhMbnV1bW52QXI1?=
 =?utf-8?B?VC9YTGtpN0h4ZjNKd3ZuOHFNMW9ZSnRzS2thSU5aQnJNTS8zM3VmZzkzTU9V?=
 =?utf-8?B?OWJkcjdmNG1GdFBOeGQxckhtMGhIczJiK01RWVZvaFZNYUtBL3kxc05oUlpN?=
 =?utf-8?B?cktHZkZuSGljQzhSTUk0T2FsbmdzTVdyTmpCRnhvRmNZZUJTZTYzbXpzZWlv?=
 =?utf-8?B?TXA1OW1Ub2lHM0JwVUlnTllQaW1WM2Y3THVrSnhmeTdrRHVRczNIRFBWMmkw?=
 =?utf-8?B?MnJuanhRN3F0aHZzWlVCQkl6UVZ4TSt5REpRVjZNNnN3U2dnVCtZd3lEWmNk?=
 =?utf-8?B?UmgyTlZNNDd6WVFxUUZCdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFZ0WkRWREM2OFVXMGlrV0JNNXE3MmE3Yjd0Y1dyQ0pkM1RkNExEQVpNNGVB?=
 =?utf-8?B?cFZDb09Rc1h5MGJRK0I5K0xSTWVPNVFJaWFka0twZUxoSHdmbGdpWmU4bDR4?=
 =?utf-8?B?eElQK2ZBMHQ3YTRwMHF6d3NOWjh5c3FtMS84dHVKVzBLRmhvRFJhYk1vREZo?=
 =?utf-8?B?ditHN0VabjN1YVB0UjRSNUJIUnhjaUwrVW9RYndEbnp0akp6Q0ZyOWJoVy82?=
 =?utf-8?B?T1NMcEpxSEoyTG1iTmNRTTR0SHpJWVkwQ1ZQVkwwY1FhclVhUGFjdDV6b3Vu?=
 =?utf-8?B?NHZRNUhtZHFvSEk2K3lBWVFXN0tYUDJMekk5bTFpSU5CdTFwV2lVUklBVDBw?=
 =?utf-8?B?em9ZamRxS210U1FsdGxYVzF0Z05abUxGUHJ2ejUxTjZmeHhTcmJ4Y3YySVc3?=
 =?utf-8?B?bVNPVHVhWUtoOGYrcHlYRm9HaUFyOHpWTnhER1JBSHFLMUpEczljSlB5cUFH?=
 =?utf-8?B?SFpiMkJQTXRHN3M2U2hFK21lNkFOUVVnc1Jla0szRVBCbjU4d0dXNkxRMkZM?=
 =?utf-8?B?K3NaQTNPOG5VRHByM2xvZ1hmN09iSW1PWjAyMzhzdkF2ODhPV3pxVlROSUEx?=
 =?utf-8?B?Z0FTc1d2UVIxaXhOck11UTVybVdmTHZVaEI3ZGRFb3R1M1dxMlZpVWtSQlhY?=
 =?utf-8?B?dkxyKyszVndDU0dLeWZNRHBtUEZQaEZaaXpQMGhBWXB5OEhmeFdkUHg4V3dC?=
 =?utf-8?B?Q25Nb3BWQTZhUm9mQTFLS2luOUdsRmtST01tbmZDdVJ3MzhDWU9rcG84VXRy?=
 =?utf-8?B?Nmh2VXVzNEtSUEdGeGkvdUpzRFYzeS9rclpKWHoyZk9VRzBmRm1idXo5bFBa?=
 =?utf-8?B?V0IrOGlHOExIK01VNDVIUml1TGpXL0wraXp6dnJPN2Z3OENPeGZBSFR6UDVE?=
 =?utf-8?B?SGZjOXBJdkRrMTcxVXpaeE8zU0t2dUxHb2RYa0JRQnZOWDdUT0orY3FwVU9C?=
 =?utf-8?B?NlZIRGVHZzdWQ2FqQ2ppeVhLbjQ5NGFtaTZYTlo3ZHo3WGlLci8wZXVjR1hS?=
 =?utf-8?B?NjdMM1Zwd2licTJTRzE3ZS9zUGNUVGdSQitpeVdYRjFZV0ZUTXc4SnBaL1Z4?=
 =?utf-8?B?Y05vTXk2YlhyeDJLaUk2WTJLMkhHVGdWUzhBbW1tZ2ZOZ0xieUJ6ajNzNWs5?=
 =?utf-8?B?RkdlRFloQjIzL1dBczBuMmF3SkF0cTJoSnBuWVc3K1B3d1Z3WmZIZlRMVUpm?=
 =?utf-8?B?L1VyT1RBZEFkNk9zVjNibUkwTGIrU0ROS3hVVGh1enFLQjJadDNuWVpocnJv?=
 =?utf-8?B?cFVlbFVSalJmOXc1Z3NZbms4cDIwdWpZYjNaUGM3MFZXYkJLOXdDNkZCdlll?=
 =?utf-8?B?K1dqbEtRaFJIUmR6Y21jenJySWdETnRzSit6WkNxSG5DNjNIbnAvTHpRalV5?=
 =?utf-8?B?bjZMaUU1bGUvNW5nQndrbXozL0Q4MzNsb3NCcjd2WElGcDZ4N2pwWnZFQzJx?=
 =?utf-8?B?V0xRRkhZMU14S2kxTHhMYVg4YUZzSTdvUldRZXg1di9OSWJyRFVMcFR1ZjR2?=
 =?utf-8?B?Y3JsY1ZWckZiOTFhbnZRSnd1eW1UcWcvR2pEdHU5MVowbmhHb0JQendRQStp?=
 =?utf-8?B?UTM2ODA0N3pGbGxWbmJkSURnbEY0MGU4czR0RDBNRTErSWpud1pVTDdhby9N?=
 =?utf-8?B?Q05mQWltOGtDWVJSa0JYdktKelQ1TGhTKysvWGE3VmNlV28zSmZQMTJxdjV0?=
 =?utf-8?B?ZzVjd3pZYnQ5Ti9YTlpYN2xWY1l3T2ZEOTNYN3pZZ2ZZVDVXaGFycmxzU2oz?=
 =?utf-8?B?QlIxTmgySTJabEQ3L0VWL2J6Q2hEMDdIMEpibXA3RlVZNWVOTmQvS0JENDBm?=
 =?utf-8?B?SXJqUlhUU3dWVGRBSUM2MEdaUE84bkZNT05xV2hLR3RyZk1KanU0eDg2ZGgy?=
 =?utf-8?B?bW1TbFBUYlRiQUcyMWV5Ylh6aE1KYlNHVWhVN3orWVhNYVp2aVhwTktnditx?=
 =?utf-8?B?ZjRTK3E4T01EZEJpaVlmb1huYTJ0MGo3TnBFN3E1cVd1VlhzKzFKT2gxMGNI?=
 =?utf-8?B?NVJjcGQ3V2VLeW9HWG83cEF2QzBybHlVYlNRVlJQUEt6a3VUSkU0UTYrVnhG?=
 =?utf-8?B?RVBiTHV4ZTBVVzdhdTB4UVZ5QkxEVGxPbmEzaW1ld2dZbmtqKzZaQmhhRkVj?=
 =?utf-8?Q?cn1Umr9dK21UUC1Bat2LjaiIi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da9ea64-b3bf-460e-b78f-08dce203ed0f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 10:29:27.5957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OC/QQk695wCdUfcO8Yn+l/RKgyTclxV9rdOq5JgLUdlkgFXtIaEgQ5waXnLwff8W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662



On 9/30/24 16:48, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> OF-specific routines should not be used unless necessary. Generic device
> properties are preferred so switch to using them in the driver code.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpio-xilinx.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index d99824d42c77..41c552a58059 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -15,7 +15,6 @@
>   #include <linux/io.h>
>   #include <linux/irq.h>
>   #include <linux/module.h>
> -#include <linux/of.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/slab.h>
> @@ -564,7 +563,6 @@ static int xgpio_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct xgpio_instance *chip;
>   	int status = 0;
> -	struct device_node *np = dev->of_node;
>   	u32 is_dual = 0;
>   	u32 width[2];
>   	u32 state[2];
> @@ -579,7 +577,7 @@ static int xgpio_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, chip);
>   
>   	/* First, check if the device is dual-channel */
> -	of_property_read_u32(np, "xlnx,is-dual", &is_dual);
> +	device_property_read_u32(dev, "xlnx,is-dual", &is_dual);
>   
>   	/* Setup defaults */
>   	memset32(width, 0, ARRAY_SIZE(width));
> @@ -587,14 +585,14 @@ static int xgpio_probe(struct platform_device *pdev)
>   	memset32(dir, 0xFFFFFFFF, ARRAY_SIZE(dir));
>   
>   	/* Update GPIO state shadow register with default value */
> -	of_property_read_u32(np, "xlnx,dout-default", &state[0]);
> -	of_property_read_u32(np, "xlnx,dout-default-2", &state[1]);
> +	device_property_read_u32(dev, "xlnx,dout-default", &state[0]);
> +	device_property_read_u32(dev, "xlnx,dout-default-2", &state[1]);
>   
>   	bitmap_from_arr32(chip->state, state, 64);
>   
>   	/* Update GPIO direction shadow register with default value */
> -	of_property_read_u32(np, "xlnx,tri-default", &dir[0]);
> -	of_property_read_u32(np, "xlnx,tri-default-2", &dir[1]);
> +	device_property_read_u32(dev, "xlnx,tri-default", &dir[0]);
> +	device_property_read_u32(dev, "xlnx,tri-default-2", &dir[1]);
>   
>   	bitmap_from_arr32(chip->dir, dir, 64);
>   
> @@ -602,13 +600,13 @@ static int xgpio_probe(struct platform_device *pdev)
>   	 * Check device node and parent device node for device width
>   	 * and assume default width of 32
>   	 */
> -	if (of_property_read_u32(np, "xlnx,gpio-width", &width[0]))
> +	if (device_property_read_u32(dev, "xlnx,gpio-width", &width[0]))
>   		width[0] = 32;
>   
>   	if (width[0] > 32)
>   		return -EINVAL;
>   
> -	if (is_dual && of_property_read_u32(np, "xlnx,gpio2-width", &width[1]))
> +	if (is_dual && device_property_read_u32(dev, "xlnx,gpio2-width", &width[1]))
>   		width[1] = 32;
>   
>   	if (width[1] > 32)

This is also fine.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal


