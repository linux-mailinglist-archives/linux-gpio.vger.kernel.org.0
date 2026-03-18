Return-Path: <linux-gpio+bounces-33771-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIccBuP5umlwdwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33771-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 20:15:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF272C1E50
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 20:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2857302D6AA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 19:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0094D3EFD00;
	Wed, 18 Mar 2026 19:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VIxBv9MU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563343E9F61;
	Wed, 18 Mar 2026 19:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860961; cv=fail; b=ErRwGA759xqXqKd6srIXyn1QcvdVlqWJ2VZNwHf0xd0kCnui7vx69IklMDnD4GVApI4TUE83pNTt+lqyADOIjpms6q3aAthHnqKmkHG98iipCS3LaqlP0GNIAh4GUOHIHq7oOeIUlEmRtq1AOo5nh+BySnFL7HciFrQBH4mGUus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860961; c=relaxed/simple;
	bh=EOrRS0acc0DYHY1PzE8thHNxA8xeIN0tnyE4TVmxFfM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f5s5eMDbxtRDsL30nkknpJOc+w+Hy6Rs0DU8tTEIoOLj5cw+6WNbGvFYkGYKU82+udq2mxt009+8RYo8zuENBsDJJAllfUyTtqB7UCZUgLMLr14mO03am0a15WDXgCbI5P70GqdzyYvpbyJb6f27hDO/3mqU2QCOG/XOpIv8Jb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VIxBv9MU; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGRjIlGRGJDe1qVsdQr0lSSILQXAvqWUP+vsOWG+8H+zmpiMcJSYH5Z+kyWGJt/y/Ki5FQFjSXhykT2MZ6Jf82F5oJCDbQWWwDAbf5zhV8ia7V5Qmrna2958PZV0liUTPnEUwH/oliWKAMTWykol3rxKcx+0nuhVdnkyjZPLJ78urtApp5tAV7KWML2S5qfbJojHaCbcmxxPxpfXH2dreTGVgUyZbDYvhaXu8NL5GHxrrB9cRYS0QKMthqVbHR/w+gFfCrOe7+ZPIeF+mNvRJxPOQuk5fBukURYujkaR6wxxw+kxsRrYvRinDQQeNzRPSgxhl4ECAdcQwoPC1dr9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InNf1odKeWUiZdLKqX0SPbWhi8kPUw9AhkT0kLviTT4=;
 b=HkQbzWBm4L5o5pKGsfPYLrUWajBzoVHu3qm4/IRHVgO1Rl6W1cuIyfaY3vAZNoXo+DelLy54f40CYTyhtBrI4Tl4NSkRXSPIyqKINymS6ecqVDpHXldXUbcidPPLqMDU5XPkhvGbIZLJOZOn0+0yVIh4arl/WeiRKI4efl3PNPAjnsGp5H0a6En7i+7U/RGOI92iwBfXZN14JM1CwByjVVy2ggVtoIWK4eqgDthBy+Qi9jeT5SBQnXL+dvx8ou8i0GgHiF6TtPro6awg0mORwSzs5dzPk++AonkLWX9Jk+B/5KwEmuOFfo8G2eTNvdMHwISkCHx7Ne1JogUQhokYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InNf1odKeWUiZdLKqX0SPbWhi8kPUw9AhkT0kLviTT4=;
 b=VIxBv9MUVaCZhUBvVVpD24o6bW9T12W3tFPFvw2AvsooHtqhW82ZkC+6M8911iPl5nniR3iGyASBL0oO6uMHMb5f7k1z6xvQzvNlgj0Vfge88EHP5lfJ9fG754fnt9T5SyVy6njuLwx5QbQZiWD14KfYJ2yc4gJ0XsNSY3GUlL4iUraLqNuhG3jf1Ldq0I/uQ5NH5aIAcyT2TEbqJGg/uBaa5OXpFmWxk9KuW0BLvM6fQommK3euZvfMdJ9MZhhsZgHS9NA6rADj0CTO5+/Opq15pw66xydXLcb8o6vCOrgMmlp+Uk+L1mQwjGuOB22O9H/WcsjYOK5oVYwrIRA2Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by SN7PR12MB7275.namprd12.prod.outlook.com (2603:10b6:806:2ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Wed, 18 Mar
 2026 19:09:12 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 19:09:12 +0000
Message-ID: <ab009797-3b48-4568-8e80-b10a44b6fac1@nvidia.com>
Date: Wed, 18 Mar 2026 19:09:08 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
 <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com>
 <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
 <e217c9a6-e2a6-4413-8247-19b7ab72a53a@nvidia.com>
 <CAMRc=MfK_eqbWDdEQHHWgAyz-zMWyW5G=DF8eNh0o+iyt=BtOg@mail.gmail.com>
 <d05d4468-84f7-4692-8381-e0742f1f2749@nvidia.com>
 <CAMRc=McY9dcDLXPM8-QErxzAJuoe1bxy8BX5H2y0uCHXJSsAwA@mail.gmail.com>
 <CAMRc=McMCMuyB7ETefXaWJ6K=-nPcDHo964WZKtPRU9XVVky_w@mail.gmail.com>
 <6ea1e467-b0d0-4ec7-90b5-740ca2415460@nvidia.com>
 <CAMRc=McGaF2XYedgy4n_RZzbHSBBZ2=EMvBEF4f8+ejLbu+CPQ@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAMRc=McGaF2XYedgy4n_RZzbHSBBZ2=EMvBEF4f8+ejLbu+CPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0464.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::20) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|SN7PR12MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 70cd2331-5595-4dbd-8064-08de8521d701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4xat2t3b40aF7dNcrHaAEioF5dq6rCWP5YzvOokjFTKWS0rUAT63Ixm0mB3dhosPkkQVgdWSTZFCLdCTsZ2fXQQdjQ3RdOzeIKlLcKuNb4W7mkfgBC88RpWU84D9ooXzs18wQk0i526BwU3Cw2+nQIsbUPyLscx4+eNW1bs8vjMDxy0dj/mNgar15PofOtFctd+l8dcjOdA27YMf2cTh/SACTPRgvWlW0yIFRXcIECKEn/JbztDiKIjvv6G6u5KURtTzKSXgP7ur18Ve9KyTwdk0OvVgw6oCl/e3Op/zpN6FC11B9q7yFomwzTmCenVVITfc6AngBIzCw09+LC+58gsdUa4ri4h/81WA0LpRGOuC9Z5jRE19LjJ5yh2namEfiSN49dGj/0XAzOOamZ9Mwi2QaC+Y7bZWqZLHnmEOnEU20W5yjyB1Eq2XpqBvt2yjbT23QEe7V6mm2Q+gz3owt5HEk+x/fLs2QRb/suxBrc00sE7BYzM05a0bWwiZNKUDICH5LK1UONXjxhgp8IXgllBz+Y3Ljt6vw1pBSy6JA1qxJXz3umii+qweBbmpskrUFA04X44676kNyNTK354s4T2w/TcuHLPEtBL/kRm/ORpJBLz65V9WhIQH0qqwtyib1rWZ5JfiyHexsMISB1S+6BgBS+IadZlKVjX42gzTMJ6fT86kYC8vsSBRSKM2HdLMKmnTpZN7NhR04vI8c3/tNT9N6Prr/Ekzmh0m0ACSxzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTBFb0hjV2VrNWhQaFNESmZ5QVFWc1UzWE5qOUdzZnJWc0lwak1YL1lPUnZn?=
 =?utf-8?B?czF0ZDJRaHVRMWNpVlE5dGtiMHVKVVYwQ0JxSjZWV3I3VVJlcjYwdXRNU0Qy?=
 =?utf-8?B?ZlB1U2xwYkhUQ0JwR05PNnpwTzJBTmcwT2dVZGVJb2gzNXJHby9hRnRIY1dw?=
 =?utf-8?B?YkozaWlFNXBIWTFVTDBNUXZMd0tVa3owK2tmWm9jenAxVEdpTDlpRzRzUFJ6?=
 =?utf-8?B?SkpLQ3cyS3dZYkl2eDlFd0JoRDIyTVd3b3pBVFNna2NyOUxXNjRuaXFhbDlE?=
 =?utf-8?B?bWtOSWdXNlNQK3Q5VG1MaUtpNzlWU0JQVnVCYkZ3WURXZ2I0Uk51dWV1cGRl?=
 =?utf-8?B?M0pSM0NOM0hFa0ZIV3NiODhPSWZLSXBHUHI0YlBEMDVMUit1aUJvWHhkK0tB?=
 =?utf-8?B?UmtlTEYyNVBwNFJ1cjBPajB3dU8vb29SY0U5dWhQTlBEQ2V3MmxEZ0tiSTV2?=
 =?utf-8?B?VWZwcG1mTXVZTUZDaHVyOHZlR1ZJUmpjY1BnME9XVVZzRnBkeVE5VC9zell0?=
 =?utf-8?B?SVdxRkR5SXhXemRPZ0l4WFJwTlZtcC8rVFBkTUFHWUpqa2pxdVNxQ2hBUk9Q?=
 =?utf-8?B?VHhONXFvTUJDMzRBMkhQc1RWaDVDcTNncVllWmxIYkVqbEpkd3M0Q3YzYnBF?=
 =?utf-8?B?LytVNTFoMmtmU29GR0M1NGJKS0lwQVNrMHlqbTdTWjBBYTRLR0VJRUltVzdZ?=
 =?utf-8?B?R2tPRUtJbUg3T0g2ZWxXdHhvcSsyZXVrOHdaNVpubFFRL09ZNnEwQ1JPOFJm?=
 =?utf-8?B?K2FBWHl1KzdGRThjem52cjdqY3psRS9JTUlickYvd1dnRE5WVTFoZDdoaUlW?=
 =?utf-8?B?dm5rSmFTeUFkNDhZNUY4Szl4YjNvbFNtNlA1bll3UGtMVTUxQk9yVzYwOXpv?=
 =?utf-8?B?RjBISlhqam1VVDVuTithSTJ1VlYwVnRsekdYY1NqTE8vUnZRWVNZNGlCYk90?=
 =?utf-8?B?RHFFK29CcEdrOGQwVDJldXJiMWdYOXp3YmFxbjVKb1M1KzFqWFpXZnFRMldO?=
 =?utf-8?B?RVQ2b0k2ZVVNQmZVclpKemxOSFJ3TFVIWlhJWGZzYUE4RXRMNWtsajAvQ0NN?=
 =?utf-8?B?K0tPalpXL2RLYXBDZXZWc0hHVThNK1JPNGp6YU1CZURHZ21ORk5xa2ZQU3ho?=
 =?utf-8?B?eGgvNHlhZ1FoVjhIU2R0KytBM3BoemtmOGxpSHhFcjMrQWpUU1B5WG95MVQ0?=
 =?utf-8?B?WmU3bk9aNlgxd0R3WCtUTTg4WVJOZTg4ekxSNGpSL0lsRkxNZm0vUzBuMTF5?=
 =?utf-8?B?Yml2ZmNSSERURlhHaktRWkRNY09ST25jSWRXRnRFWktaSUJZbzVtTC9SR1Js?=
 =?utf-8?B?UDF0eTRXaEFrZDNWVWI1enc3cTluemVqTzc4dGFSNktwcEJYTmZUMlEwdmlu?=
 =?utf-8?B?QlpFV2hnRXF4Yk50NEgrd3YzQ2Z5cVNQdTROL1lieHNZVS9ucDlDaTFXdXcz?=
 =?utf-8?B?cURGUTB0c1c2ZWpmOWRmU1dwWkg0MUw4NVdTYUp0YVE4eEFkRU9pdnZGdTlp?=
 =?utf-8?B?OWZuNG02dkU1ZDVKVlp6WlpCdGJwaSs4QWRsblZTbkp6ZEJRTUtMTXdBYVhM?=
 =?utf-8?B?Ni9WU1Y3S1QwTk8vN21Vc0VFY0t1UXpaTy9rTFBCeGVBVGxTamgwU1dPMDJE?=
 =?utf-8?B?YTh5UGc4SmNvdy9nUXdhUXZQdVB0US9nUkNzcVE0MGpNYWJjRHNNQjQreGh3?=
 =?utf-8?B?b0hkNDdsaTNOY2F0Ny94MU1yT2d1dTU0TUg3TnlqMDViQmpGTU93QW9mTk8y?=
 =?utf-8?B?dlkvZEdLcUsrWjJqSFBBdjFXblFvWmtialJTcVp6UEs2TXR1UHF2RjV4b0Mx?=
 =?utf-8?B?T1B1SHN6Z0hTdmJDbFdWNStKK0NtaW0welUrOTlFeEFPczk4Qzl4bWtPZzN1?=
 =?utf-8?B?RjkwZnN0SmM4VXgyY0JNLzdGeVpVMWd6RS9KNjFjNVBuTkFRZkpZbjNyRXQw?=
 =?utf-8?B?WFJpWGxlb0ZGSnVsd2VaQWQzdVVjZE5QbkdxUHJ0Z055blZFRHFBMVpIQ1Vl?=
 =?utf-8?B?SkgreTE4SXVjVGFjNEducGZBNUhFbklUcXM0aVNYVTFTaGpXYVdabE52cG9G?=
 =?utf-8?B?T3JhVmpVb29xbzIyeVpaNjViNk02blBRTXNBeThYN0p6bEZzNTQzcWZ3UmU4?=
 =?utf-8?B?bEE2SU4xOHNGZWpyTVpIRmIySEdCbno4eU5jTWYvVWVaTnNWc0hMN0wwYklC?=
 =?utf-8?B?RTl6aTZGblQ0QjZnaVRZUG1ybXBsbnF5YkZvSUZQM0NsZWRMRDlDYStjUnAz?=
 =?utf-8?B?ZnZNNG5QeGliTVhvcEs5dk55eURIVVVmZE9RR09uWnRNckp0MXVQT1dlT1FL?=
 =?utf-8?B?VXgvckIrOVFwYlBLRlFKT3kweXgvSXA0SUh4cmVNNGFESFZ3SWFMakExeFJQ?=
 =?utf-8?Q?9AeURNUbjKxI3YYNAMYt/+Cff8s9vHdlme9Ai3C6gPm3f?=
X-MS-Exchange-AntiSpam-MessageData-1: bfYJo9+eB2qR1Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70cd2331-5595-4dbd-8064-08de8521d701
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 19:09:12.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DE+BxIB+Ch39df3hQ1/z0RR9AixzzOPxcmc+Da30Q+xmkisQ7UdMtJ40u5pAEcXDu5XsFQqdVSdKIhEibpQE7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33771-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 5AF272C1E50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 18/03/2026 08:09, Bartosz Golaszewski wrote:

...

>>>> I can reproduce this with a gpio-keys setup. I think you hit an
>>>> interesting corner-case where the consumer device is the same for two
>>>> shared pins assigned to its child fwnodes. The setup doesn't make
>>>> sense really but I guess this shouldn't just fail like that.
>>>>
>>>
>>> So the problem goes like this: we're using lookup tables for shared
>>> GPIOs but they are not capable of dealing with two fwnodes that are
>>> children of the same device that share the same pin but are themselves
>>> not attached to a device bound to a driver. While we could extend
>>> lookup tables to take that into account, I think that the setup here
>>> is so hypothetical, it doesn't really make sense to spend time on it.
>>
>> Makes sense.
>>
> 
> Just to be clear, this:
> 
> 	gpio-keys {
> 		compatible = "gpio-keys";
> 
> 		key-one {
> 			label = "foo";
> 			gpios = <&gpio_sim0 10 0>;
> 			linux,input-type = <EV_KEY>;
> 			linux,code = <KEY_POWER>;
> 		};
> 
> 		key-two {
> 			label = "bar";
> 			gpios = <&gpio_sim0 10 0>;
> 			linux,input-type = <EV_KEY>;
> 			linux,code = <KEY_POWER>;
> 		};
> 	};
> 
> doesn't work, but this:
> 
> 	gpio-keys-1 {
> 		compatible = "gpio-keys";
> 
> 		key-one {
> 			label = "foo";
> 			gpios = <&gpio_sim0 10 0>;
> 			linux,input-type = <EV_KEY>;
> 			linux,code = <KEY_POWER>;
> 		};
> 	};
> 
> 	gpio-keys-2 {
> 		compatible = "gpio-keys";
> 
> 		key-two {
> 			label = "bar";
> 			gpios = <&gpio_sim0 10 0>;
> 			linux,input-type = <EV_KEY>;
> 			linux,code = <KEY_POWER>;
> 		};
> 	};
> 
> does. I don't think making the former work is worth the effort.

That's fine with me.

>>> Does this patch fix the real problem on the tegra board that you
>>> reported initially? I doubt two separate GPIO keys, share the same pin
>>> in real life.
>>
>> Yes it fixes the initial issue. However, now I am seeing a different
>> error on the actual platform that is having the issue to begin with ...
>>
> 
> This is *with* the fix?

Yes.

>>    ------------[ cut here ]------------
>>    WARNING: kernel/rcu/srcutree.c:757 at cleanup_srcu_struct+0xc0/0x1e0, CPU#2: kworker/u49:1/114
>>    Modules linked in:
>>    CPU: 2 UID: 0 PID: 114 Comm: kworker/u49:1 Not tainted 6.19.0-tegra #1 PREEMPT
>>    Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS buildbrain-gcid-44496888 03/15/2026
>>    Workqueue: events_unbound deferred_probe_work_func
>>    pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>    pc : cleanup_srcu_struct+0xc0/0x1e0
>>    lr : cleanup_srcu_struct+0xb4/0x1e0
>>    sp : ffff800081cbb930
>>    x29: ffff800081cbb930 x28: ffffd79ff96d0c40 x27: ffff000086059000
>>    x26: 00000000fffffff0 x25: ffff000086571200 x24: ffffd79ff94adb10
>>    x23: ffffd79ff86400c0 x22: ffff000086059390 x21: ffffd79ff94aa040
>>    x20: 0000000000000000 x19: fffffdffbf669d40 x18: 00000000ffffffff
>>    x17: 0000000000000000 x16: ffffd79ff62dc8a0 x15: 0081cf5fe0409838
>>    x14: 0000000000000000 x13: 0000000000000272 x12: 0000000000000000
>>    x11: 00000000000000c0 x10: f7c5d06d757a4b3a x9 : 15ccf89dfeffb5e1
>>    x8 : ffff800081cbb8c8 x7 : 0000000000000000 x6 : 000000000151e960
>>    x5 : 0800000000000000 x4 : 0000000000000000 x3 : 0000000000000000
>>    x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000004
>>    Call trace:
>>     cleanup_srcu_struct+0xc0/0x1e0 (P)
>>     gpiochip_add_data_with_key+0x3dc/0xf68
>>     devm_gpiochip_add_data_with_key+0x30/0x84
>>     tegra186_gpio_probe+0x5e4/0x808
>>     platform_probe+0x5c/0xb0
>>     really_probe+0xbc/0x2b4
>>     __driver_probe_device+0x78/0x134
>>     driver_probe_device+0x3c/0x164
>>     __device_attach_driver+0xc8/0x15c
>>     bus_for_each_drv+0x88/0x100
>>     __device_attach+0xa0/0x198
>>     device_initial_probe+0x58/0x5c
>>     bus_probe_device+0x38/0xbc
>>     deferred_probe_work_func+0x88/0xc8
>>     process_one_work+0x16c/0x3fc
>>     worker_thread+0x2d8/0x3ec
>>     kthread+0x144/0x22c
>>     ret_from_fork+0x10/0x20
>>    ---[ end trace 0000000000000000 ]---

It seems that when the gpiochip_add_data_with_key(), then to avoid the
above warning I needed to ...

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 27ea5bc9ed8a..3130acfeeb66 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1277,6 +1277,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
                 goto err_print_message;
         }
  err_cleanup_desc_srcu:
+       synchronize_srcu(&gdev->desc_srcu);
         cleanup_srcu_struct(&gdev->desc_srcu);
  err_cleanup_gdev_srcu:
         cleanup_srcu_struct(&gdev->srcu);


>>    gpiochip_add_data_with_key: GPIOs 512..675 (tegra234-gpio) failed to register, -16
>>    tegra186-gpio 2200000.gpio: probe with driver tegra186-gpio failed with error -16

Which leaves the above.

> There's a change to how gpiochip_add_data_with_key() error path works in
> linux-next at the moment but it's not in any stable branch yet.
> 

This commit?

16fdabe143fc ("gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()")


> -EBUSY can typically only happen if gpiod_request_commit() is called twice on
> the same descriptor. Is that the case here?

I have been looking at this today and now I can see that we have a
'gpio-hog' set for the same pins that are shared and hence it is
getting request twice. If I drop the hog it goes away. This is a
produce device-tree, not upstream, for some camera modules so I am
wondering if we are doing something here we should not be. I am
taking a closer look.

Thanks!
Jon

-- 
nvpublic


