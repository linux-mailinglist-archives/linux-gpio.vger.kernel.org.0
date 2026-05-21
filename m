Return-Path: <linux-gpio+bounces-37247-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAK+I6bCDmrXBwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37247-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 10:30:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5195E5A10CB
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 10:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB0913126441
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 08:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8311D3A542F;
	Thu, 21 May 2026 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N7HOHY5v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C43A48F5;
	Thu, 21 May 2026 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351790; cv=fail; b=qVgH4gRe+bDpE5EH8lRrjtO+CnSDVNhjmbc4GSJXR056XCe1Q123XikoxZh9njlz4+m1cYhIyvLR8qNCqDsbWtXM9dMzv76cIifl7nVQ5G0u4L+ZikgpWyrFbeFHIIf+YmoyyhNuaDwPaSE2DeMcrWkl5mpKHbONRlEsIrfXm38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351790; c=relaxed/simple;
	bh=tm7ixulyOGrCJWiqrwZsjHG5x9ESRuGffxCsbxfSVpg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o+2WFr3MDctad0cdnFIkNYtYnXGvwYDkP2wIVSKdte50Wi3Fk+N/xgLoAcBeiByEg/JpUHLhHsW/+h+M6/9VjZBX6aYTlE1kXa19+xQN7C0+MEm30c8ehyqgfgbklcEAcM/Jhql4b3+V1ozYrmrgxFgo/vGBEU9O0gFrAZPo3YM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N7HOHY5v; arc=fail smtp.client-ip=52.101.48.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uU9bCr6XvpG8FSoSJR+MLQ7h9rXOaA4jHCV8VODE2LPeug+2Sjt8o3+PAcSkyntY0FA1Iv+Fu/YmwyQwMU4g9RD9fMOmAANlgnfkWiygpGU2SnXOVLVEt3vS3lJzYqCIiQt3AtCJe9PDl4bIJ28b4CLhfbhk1/Cotd6byrqnTSZCWS4A4qJFH5MkB7sVsuw5pqVlbHjHp+Z6CE9HFrr845+Ubez8FWUGmIu77xtLUEzK7t82r+ympBvx/DRVO381bBZOuXzDtvvUsIYsuQnRe6OWbG7FgTWOrzRp6BZ95asMf8JIQf4ZpFDQGNENG/RCNLv/Ha7q2oVC9F2YbAqXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBx71xz67K4eQ4p+BjGpsYR9ZYckNt2ag5k4i/Q8Z+E=;
 b=QTtMvA+X0eLbRAEzX5792B9aGQqHXDj9zwXMbKXBIQ9LiwM2KQrDjS5/Yz+/gghRGYiKiidUTBQQqv2xB/ivHOZnot6z+/Vs/XAe7qA2ka4xbBmfqpSkW44mBuam9T+7vtXiGou+itUHG2Scbx+vTaR29hahc6IVpgJgUZr0ErgVRwT2rBswoIpxZV3bgMNU/G1GLwFgwnSimxDN+rxGJeRFp5B/XrE6P930Px02TM9dy4prThsHJNKGCYYWPPyD8vp+Tg4/CsaWgujzyUzQRV95c/Btew+co1Gn+0pxXb+oduDEg+G2vbTj5u2+AkAVKKP9R6WSwWwA9t1SoX/k1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBx71xz67K4eQ4p+BjGpsYR9ZYckNt2ag5k4i/Q8Z+E=;
 b=N7HOHY5vxw8giQ16yoMBgfwsn6V8k3Jt6gCbNSAwXHZH2jLTE2G3rjoH7PQwMn18PZxsZV70B0VnUlqj4+oRyhmhvHD5RgzSOfW8EPN0D54tkCBxamJYonf3KNmj7510/WUUwmGFempUtCg3j6eBujwm3uioozOAM31Mv3wzMQ2PWztHLMMDWzj5giTrjcsT8g4c9Y8wf/bdAF6HX0RuadIVaOZcr5PAMOXJY/nkxNzx3F/KBVdBkyy2UyLZALJjnGFE2Y57eeDHlCPmT7Re/rdUG+NITw5DEOfW5CVpoa4+L7BZGX66483AnQpZJoYsB9de98RpdCVOtqR0fv9/iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA1PR12MB6043.namprd12.prod.outlook.com (2603:10b6:208:3d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 21 May
 2026 08:23:05 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 08:23:05 +0000
Message-ID: <0f253066-44e5-4dea-9121-67ead57d5f6d@nvidia.com>
Date: Thu, 21 May 2026 09:23:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: tegra186: Enable GTE for Tegra264
To: Suneel Garapati <suneelg@nvidia.com>, linusw@kernel.org, brgl@kernel.org,
 thierry.reding@kernel.org, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260521012031.2003914-1-suneelg@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260521012031.2003914-1-suneelg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA1PR12MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: aa93d7bc-b00b-46ca-d6cc-08deb7122eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kSEySi5Eozo0g9+GM6GeYGMvKtRnXAVyS042yzYp9+lDl3sDbQJhvp8/BKKj8sljFGA4mo7vwNVJorTLjZfqLWUft8eyIFRv8767M/bHbRverZFh1BDkIvcRg6wTidO6i1gxnSduGetVnpOTiQlTOolNk6WUWIJ0zwqKJ00/RVt9C5v6YO67+KmnUkQDJgPqL1s/9tYcA3fO0eHDbiT99p+0h0b5ihZg6QYdaKh4jspewy/O/3ogBEubDNr6oz6WIQwWdNQEm5xXwussVXVBA4V1YvG1JWbtSwLZDmwFbSYpzORmw6aqqsVi7mRSB7H3ty9d2//6PkRT0jqLV2MWNpAGC0c66MKH4TLcYqXj8j0wKiviFhlZ1Z0hCQFrn93vYyIw7tCq3SZlUdtWIgfDifuIHXmjhTHRCfRBGREH+3gbe5ptjZ4sk1h69zz3a4j5EA0NIma43kcBuDgSPEj4bVXHCFJqFUz+McA2XV4wXjBqHT0lIpPo/s9r3U5ZG+JaF6oK86JI/UVTy+FYln0PoT69dJ0+U7So8HaSVjc70yr087zPJxD7RTuiS+LJR9f8Bg7OgmCTee2wFDsTV22SHwHPMYF2GXWNnClhIY0mk0fXwQVrhWqmnTUcyLlLAP2FuZuWwDu2HZFeTOAnpbvm9o5S9QkKBoHmlXi0iYH7qBbT7mwzDRBHqB4PabC1+4yB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUFnUmxndkVwdVNPK0g2UEhzdSt5ME1WamlUSklZWjBtclVNUVlIN21VeG9G?=
 =?utf-8?B?UTVDbGczSlpoYUxBU2ZmUDJuN25BK2FJeE9YMFFIeXpudlErODBRWFZwVDBi?=
 =?utf-8?B?VTBSMGd0YWY2ZWpUVjdqeEN3S0xGWU9wU3JHbkNFVjhnQ3hSbHBZNWJjdDJx?=
 =?utf-8?B?R3RWMnVQeHNHT2IyVS94dFM3NjFZQkhOTXVvQytYT0pPWno1enh5YlFXWXZI?=
 =?utf-8?B?NFBxcEVHQWM5MlpqamhXWkV0UElTc2VJUnZETndhQk9RREYrZFhmdVhmMlg1?=
 =?utf-8?B?OVVMZDRoRFc4Um1aajFBeDdJcFJGUVgzcTdPbFZ2dlR6QWRLeFQrajBNdnJO?=
 =?utf-8?B?MDRoczJjQjBIdVNIMWZDT1ZsOU5LVlRhRDdiVjMwd1BzcTFkeENNNis0M1Bs?=
 =?utf-8?B?ems5WXhDZEJxN0ZTSnN4aHFycVFwamI1Nmx1SmVXYUt0QXVSamxGVFBPb0lT?=
 =?utf-8?B?a3V6QXFRU0gvblU0RUdxczIxNGJMWmhVWk5JL2UxazFqOXZOQ01ZYzlMQmRU?=
 =?utf-8?B?Um1hR2tsa0J6TXZUVEVKTXNZQjVVM3JtUG1TN2FwTTNKcmw5OFU0Kzc4OXE1?=
 =?utf-8?B?dk12Wk5YL05Kd2p3U09BUk5UajY1c0o2Nnl1WStQWVhWVFd4ZjEvQWRCNHRz?=
 =?utf-8?B?aTFpcVQvSnJMdEUzSnF3ZlpVRko5QThXcHhPZDlNUTRpaHhsbEMzM2V3bkZh?=
 =?utf-8?B?cm5JcXI0V3ByckpnY0pzd1J4RU92cXRlVDFidVdabzJrYW1ncWw2bkpZeWpG?=
 =?utf-8?B?TzY2ak13K3h4UFFmcXVBbDB5LzluR0hrcXp6SlljWDZWUFpablkxc05pUGR6?=
 =?utf-8?B?OEhLUUx2K0VVOHVKZVdZMk9hMEFEVm1ZZjlhdVJFM2ZSSHcyK0tRUzlPQURX?=
 =?utf-8?B?UWlrMFYwYnZ2Ny9jTk1tM2dYRlpybUZKT0ZkN3lxK01FNlQxQ1U1cjhIOFA2?=
 =?utf-8?B?V0NyRG9qK0R3c3ZMSUhTQ2FuMlFmUk1CSG9xLzNORzlmWi9sbytGbTVHajZW?=
 =?utf-8?B?WFNkWGZIZnI4alRFOElBVllVREVPTmhxdDlPVDdZWWtONlU3NU1EVEF5bWpu?=
 =?utf-8?B?OUR4UW9Sd1pkd3pza3Vzclk2amdzd0h2UkJNd2UwNGwrRCtldEJZRGl4dmpx?=
 =?utf-8?B?T0M4ZXV5ejVJcDFaY2NKQjhxYlp1ZmtUamFBS09QcGRYeGtySjJFOFgwSWts?=
 =?utf-8?B?d0FidWRDaXh1ZEVDTERia1IrdVd0VndHMno5dEprZ3BOUGRnc2VINk12QW45?=
 =?utf-8?B?bjlSMjNpUHU5a3c1UnRDU3ZvVUk5bUZTZTkzbFdsNit6NDFRWVl4U1VtUWd2?=
 =?utf-8?B?TFMzU2dKbE9CWnVGaUpuMVBLaU5aOTBWUkhJUXNIazR1bFdOdzZUd0REZy9E?=
 =?utf-8?B?RmpVazMweUZEWnlrdmhnTXd5TDY3dDlOemZBWERXYld4VzBrM1F1OVhkQ2Nt?=
 =?utf-8?B?SG5xOURBcEZjSGlkMlgvSHpGd1JwL2FjbHUya21IRVdUaVRCMHI5N2xqWWwz?=
 =?utf-8?B?dDZ6dlU2RVF3cnJFNGpNQVJNcXhVT2h6cXN1TVNGY3RUNzZ0WHFXMGpMaFRo?=
 =?utf-8?B?Z2tGaHE3MjZGWjRrYzc2R0Y0Wmo0KzVvR0VpUjZNSWg2YTVtMS9CRld5azBv?=
 =?utf-8?B?NGVFVVV6RSt5VU5Fb01JTHZGdW9RT0huSDlyWWlaNnNDczd1QXNnbFY4RzNh?=
 =?utf-8?B?bzV5bUFaeVZLN0JlL01ZSnB2TkNmRkY2UE1aSnhDb00reTNNeFA3Zy8zM0dY?=
 =?utf-8?B?c2pWbTlWUnNKK3Yvd2Q5Q1FGOWVKVlJybzFBdkkzeWMrK0VvcTNoamczY2tz?=
 =?utf-8?B?T1lOeVZ5Y2Z5bDBPZVVxMmVJc3FhK3hWSU5PbktGSzR4K0RFMkN1M3RucHpt?=
 =?utf-8?B?cHNoaFlRcy9jb25IY042ZEpNV1dtWXRReVl5L25iWXNqVnBNVkRkWWtxRlJI?=
 =?utf-8?B?S2Jsa3VVZmp4T2ZNZ0VFQ0ZiNjFBTXR4WUFyR0FnVU9pOFRtOVlnQXZ5ZFhY?=
 =?utf-8?B?N2FhbkdBMWppRjIrNWVMbEcyRllieWF2OWtpbnh3M1I0UzZaTGlFeC9qaFUr?=
 =?utf-8?B?cDV2OEVsbnExWm1lNzA3QzN5MUZOcm8vM3k2TUVsa0dsRTdrMnFsQzZsOUh1?=
 =?utf-8?B?U1I2WUFaTVNJUG1WeHBmT2Y2REprcHdQdUNiTDNiZFF0V2tubTNMWlJJTFZh?=
 =?utf-8?B?bW01TzVDM0VpYWVwU09xNkVpSGZIUVBUM21EbmQ5a1RzSnVSdittY1JIYXdj?=
 =?utf-8?B?QjJOR3Y0M3dUSjIzRS84YWswVW01Y1RBZG1lMTBUV29LL3hOdTVaWjF5VHdY?=
 =?utf-8?B?V1BVd3UrLzVXMElySkdMMXdLVjRmbTFDK3VRcmZpOG1tb3dsWGV3Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa93d7bc-b00b-46ca-d6cc-08deb7122eb7
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 08:23:05.5537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I47RSXPMOMEr3flsSSiTlsgK5opvhbPIB5356C8xg0i21M1ahA8Wz0LiCpOd/jnGyamJtcaFaQUkVQsuqHDiOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6043
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37247-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 5195E5A10CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 21/05/2026 02:20, Suneel Garapati wrote:
> Set has_gte flag to enable GTE for Tegra264 AON pins.
> 
> Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
> ---
>   drivers/gpio/gpio-tegra186.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index f56617c298c0..d9a2dedf50ea 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1395,6 +1395,7 @@ static const struct tegra_gpio_soc tegra264_aon_soc = {
>   	.name = "tegra264-gpio-aon",
>   	.instance = 1,
>   	.num_irqs_per_bank = 8,
> +	.has_gte = true,
>   	.has_vm_support = true,
>   };
>   

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


