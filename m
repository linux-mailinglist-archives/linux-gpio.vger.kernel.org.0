Return-Path: <linux-gpio+bounces-9580-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AB69687CA
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 14:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5895C1C2198A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8423C1E868;
	Mon,  2 Sep 2024 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UBgGXKrW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACD215C3;
	Mon,  2 Sep 2024 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725281150; cv=fail; b=pkvOaGgAg5eBFr9SWr8eI/Lx81SlIrYEYCBpa89jsm1wWadYwN2GM9zxBuTk9KIjSonnvtxMguIKifl0Hy+TwLi9T/aBfls6oOkZjVwKhvc4PzgsUXmRGxBnGnmPZDQ7QndgMWYpap8vPSvlhJaDs3DrBVOBXuS4rfe/b8ouWlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725281150; c=relaxed/simple;
	bh=15aabFEw4XCgVe65iTj4d0RF3JF7aQvNTDMaxFoeGsw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hkoiO5eR0FbdgtBnD5fdnOqjUXEN64VwHXkjh3zmelfNUu8CjqE5x8A0OBU/gdLH7k2FISiSahdh1X6eNzAvQBvWNpb9UbMTrVDENLT+SSIUCH9v1tOo5tIIVqHz5E4RFbYpT8wCMzQjesor0N5p42Hb0w33e1Vju4MrZguw+QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UBgGXKrW; arc=fail smtp.client-ip=40.107.236.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLokmZE4XnTd4eLyq+peZxjzPTruW3sYvMZrQL7T22il5uHD6lo2dUA2z1Ezq6r9yQfdpXQr39PNiZeG37WDfeajicam1iOmlPhRfD0qxKqpeVA46PtIb3fPklmZeWP/475Wuid9u1uM0wJwdect0qMHTyQ+jc8HZxscrJfiqnFVh3lA5CwVWZfZcBgV5wOlbQqIXaN/HiNpUxuVJzQJOoMK3ttL7mSrFgT5gliumYqVrlMF0FIsOUne3Uvlf3hMD6bJ98yxRBPFh5aV8gfYCRGba8yHSccazRqiCbHig9koKGuvcbM1DgVa/kgWvRQH3jBh4P+cUSmqvhcpvTaPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yHQFGaOt+nNwzgqSg+0UZ25PbK+bhCt6Ggrmzfe4Kk=;
 b=wzc4JtV0MglahRNhqfLNHmb0sVh0Auj3TstIeZ3qdcGFqhxHegoGY0TZykopRFDESubR4j7tmEjsPkxu1d5pSYiH7qTZcDi3yN3nHxtN2GnfDZiyiHh611j1rmIw9945W+COihww7yVW7hpCAgl92j9cyVmUlk/gu9dHZ/JSoUA8NtiQSignJ3iSeDYIKVCoMBoF9F+CZpHPi5QGzXfGZfYlAJf0RllK2r2R2XWUqScP552JjiYcf5Dv2vYPAgxSl+p553aDXIExKDbl8K9YyhJuDxqtljjbz2eQz/ahQqZHUrAoW2Vl9z4/ZZFvCZ3whd3/fVkzxbnkmiAhF2mVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yHQFGaOt+nNwzgqSg+0UZ25PbK+bhCt6Ggrmzfe4Kk=;
 b=UBgGXKrW+8/q3Bg3GQNzPHfs7QtHKVgEMFeggmGvVPt1sss/7ErwJDiIajGZm0BCo/Unhe0wVIZLZLjcfEXyBJmmkRJzJc2EFNORF7megwfDX2awks0rCzxV2fDEoiv8mFF/x+C/06O6FmHQ36vxKixOrif8FT+UpxwOCaSk74s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 12:45:46 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 12:45:46 +0000
Message-ID: <d58fab14-a91c-45eb-94b5-c13ec3ff7984@amd.com>
Date: Mon, 2 Sep 2024 14:45:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] gpio: modepin: Enable module autoloading
To: Liao Chen <liaochen4@huawei.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, brgl@bgdev.pl
References: <20240902115848.904227-1-liaochen4@huawei.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240902115848.904227-1-liaochen4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0122.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::7) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DS0PR12MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: 951c825b-6419-4b34-bc4f-08dccb4d2a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amN1M1hNc0gyRmNjdVBLclFYYlNsdDRkZXgxaUNGYnZ0bXNMb1o4aVJKRGx5?=
 =?utf-8?B?T0dkWUM3d0xIN3JZQXN5cndPazBDNXZMRnQzSk45Y3VOUkFFVmpOMHRvTXJy?=
 =?utf-8?B?dTFIc2hnU1JLYWlnOFhFaEdlODNlS0VrenVFWGg5bTdiRk9YZ05aem9od3RQ?=
 =?utf-8?B?N2dBa09DRStlTytPQUFRYlNWZUJCeTlybnBjdXFSOXZad2F4eWVLeFFjTlYz?=
 =?utf-8?B?RlNlc2ZSc3R5RmNZOVU4VlZRUlg4L1AvdEZHQjRIYU52ZEZHQmp5TGRERzBE?=
 =?utf-8?B?MUFJV2xXcDM3ZTRHUWtNT3c3UGpYMllYaW1BZ2lwOUlXODhhZm5tSjdSN3c0?=
 =?utf-8?B?SHpWZGJOeHFhTXVjMXhUdHhNMjNNSWtVdVJCbk5FZENzeDZQNGhDVDNGbVUv?=
 =?utf-8?B?N1pWdEhaMitDWW10aC8xNmxucTFpZTczOWMwRW9kQnprRUdleU9TdDBneFJr?=
 =?utf-8?B?NU5uVG0xN0hlaDFoYUtDc09FWEROLzdrMTNGakxqbzNGUkZnQ0R2K0VTNEZh?=
 =?utf-8?B?SGs0ZC9TSmNvSExJYmlLcGxVVUtuVEtYRnl3OWdSU1hqVHRzRCs1WVNFcVZ2?=
 =?utf-8?B?SU1BVld1RmNaL2FLZFhyOXkzYzJwbWxGYzRReG5scnBiMGRUTzVGamdZZ2RV?=
 =?utf-8?B?REJzY2VNNXArcXk1Smw4Y2VKd21ueHZ5MS82eHFQT0UxdEh5OGNyMnhQNEFk?=
 =?utf-8?B?SmxLekR4ZlFoRnlONmZObUtwRkcvWXdCNDVoRmM4ZUQ4cXV5Z1k3aHA2b2Ns?=
 =?utf-8?B?TEh1TEFmNkNJNGd5Z2kxZVJYZ1pRcXV6aHFOS0R3SzdzWEx5eTV5Skt2U1FV?=
 =?utf-8?B?VCtNVC9CM1BCL2d6dzdsY0lFRzhXRDllVG5neGxFOUl2ei9uN1JxbXYyY2hC?=
 =?utf-8?B?VXRjaTJlSVVPdmtQV0Y2QlNzRWo4TWtJbDdYYUJ6SUNnb29FdkN4M2c5Y2l1?=
 =?utf-8?B?eWF3dmI0cUlWUGtoVFFodEZZNkV1dEdZbi9VclZtYmJhVGlYbkNMZGJybnBo?=
 =?utf-8?B?TWtpYkptV24zby9sOHNDQzdIa3loOFpXNEdNK2x3d0s4UUt3VjZtSzBrRzZW?=
 =?utf-8?B?RTAzejdQT1ZJOWR0UFZVQXNqQjVaZlpBem9ZQVJOY2hOdjRnUUZERG16VnhD?=
 =?utf-8?B?MDF1VG9BZWpsdFJyVjJYU0prQjZlTDhiWUJYQlB1OTYydzN6SUVVcmFOL1o5?=
 =?utf-8?B?dWhyYnhydmNzTHQ0TWdVeG9TWStNR25qN21sMit0MW9OZVdqRW04WWJjNVly?=
 =?utf-8?B?NkI0MXliRU0yS0RZcVVZODZ2VXpVSWpMeHdYK21XUVkzREF4TXFWbTRiclpT?=
 =?utf-8?B?YVNldFYyK3BvZDVuRDBCUW1NZ1FLdFBNTlh1WUk5ZFV2S1pDK1BMQ1oyY3NK?=
 =?utf-8?B?Yk95OEFXQlU3SGJ3OVAzNnlqR1hIOG9XV1FGM1lPRVRRbFJsVVNDa3FycDdN?=
 =?utf-8?B?TGc5b3c5VXFCVEU3aFRkYUFZNU13R3V4NHd6RUdkTXpNME5pRTdkSk9yeG1h?=
 =?utf-8?B?YUxMZ1ZXaCs2U1l4SjE0bXZVV0lhcm16b01Yci9uTzYvTnlJWnp0MWhrSEtO?=
 =?utf-8?B?c012K1hRQjlId21BN0NnTnF6K1JUTTNlelhzdEVJZmNJcWNrK1ptOGJyWDRU?=
 =?utf-8?B?bG56eHJ4ajVKTUhBSUxIbDZlbmZyR3B6cS93U3dEUUMrc3J2VTczOVZUOWRy?=
 =?utf-8?B?Z2czRUJWSWM4dTJQRDM2cG9MTVBtN0o1bExMaUNjd2hlL09EdS9oL3NEdlJJ?=
 =?utf-8?B?aVY0RC9KNXQzdjRWQVNxanpGUTN2aUZtSlhRcC8wN3lEZjU2MW5mRE51WDFO?=
 =?utf-8?B?NENHekZ2S28yQjNrTE5UQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlZhY2NQbnRDSTlnTnBLUExrajZ3M1FTNUZSMjBTMFB2TkVualRGWkg0Q2px?=
 =?utf-8?B?aDRJZVRLNEc5WUt1VHZndC9BbTkycm9OR3NUcWhEMUNKdGJxTzk0Rkp0T1N3?=
 =?utf-8?B?V2hYckt3TTFLZ2JZYmdxV2E5K25RdFQ0ajBOQ0RBQmIzYjcwQjRPV1VHaS9t?=
 =?utf-8?B?VDZ0bzVFSTJON1BYZnZvcmsrblBISWpXT1o0NFdKMXN6MnBCQ21TSjQ1Vk1L?=
 =?utf-8?B?dmlSWGNNeEJ5MWJRYnI1TmRlalE3QzE2L0xMSDJHblpoY2g4dHhTNnZRZnFN?=
 =?utf-8?B?VjdzcGFCZXE3L3FqYWNoTzZZdXF6a0lCckNKcFpSRDlxaWFQOURiQ1Q5NnQ0?=
 =?utf-8?B?TzhSVHJncnRmWmVUamVONTlDbmVqRmVncDNJbktpcmlWRkpha2x3L0wrcFF0?=
 =?utf-8?B?aEFHR3JzTTRKYmdVSTNkc3Y5bWRSRkNRbXdmQTF6UEUzTWVJcithRXdqSzN5?=
 =?utf-8?B?bmdzUWFmVUgzbTFacW1JbEZaQkRTZHo2V1lsWmcxT0YzWXpKdXBQT1dUR2Jv?=
 =?utf-8?B?a2I5Zy9XZHRLUnc4bWJ1eUVXaHFCY2RxUGwrRVdBbWY4Zlk2OWxUbUpLZWg1?=
 =?utf-8?B?MTEveHhudEFSemVmSXBWS0VsblFqSCtpeXFIOFA2S3JkeUZObE9tRkxiWjAy?=
 =?utf-8?B?ZGFTTlVacjJuU3pCWktrRDUyM29vbGxKMDVaRWkwWjZodTQyeXFUaDdTaWxY?=
 =?utf-8?B?SWV5QkFHTEo5WWpWL1FnKzEzanpDQ1AwY1VYVVB0RkdxQ09HRmIzRWdNbTZz?=
 =?utf-8?B?ajNQbFEwUXlrZmdGanEwSFlHVUxTRVlKNXpPY2JOelNKakhKZS9DYzkzMDlw?=
 =?utf-8?B?M2RoeWNHTHk4ajNhZGVMdS9zRDJ0ZWFzTFJwcFYwSXdiU3crbjcwWDBBakky?=
 =?utf-8?B?R3pOcGRmTWZEeEYrdm9KTkw5SWRmTnYxSVN0NE5tSU1aZUd6czFBRnhxU0wv?=
 =?utf-8?B?SzlwN1orL1FnSDd6VUpBQnNwbkgwN29zWUFid1kxMThSMVU3SmdOZTB4dHFv?=
 =?utf-8?B?NUJ1U3AvSDQ1SnB1a2ZFelJpWDdnMTVIY3N6b0ZRYURxL1V1dkt4U2dDT0Ux?=
 =?utf-8?B?aHErclF2UHlHYlJTSE9LczhQMXVzZHRoUjUybmtyZTEyS0diQ1R4Z01MYTJG?=
 =?utf-8?B?ZnFId0hiN1o2aEs3K0JycEhabWhTeXlUWDhWaWdPZ2NGaTlCQzdLZ2J3KzAx?=
 =?utf-8?B?VGVkOEVBdWdkdFFVa1VHWWgyV0N3MFVIK3Q5N1YvaHVPbEhlVGlkRDcrdG1J?=
 =?utf-8?B?T1gvYS92aC9ZZlQ5TnFydjhXUjVwRnVQVU5aZ0FPdUpsanljUUZqVTQxL004?=
 =?utf-8?B?RUJpcTJkUE5sQ092Q1dUTFAxRSsrMHRUVDhsSGlGTm5OREJXMXRuTzYvczM2?=
 =?utf-8?B?OFFqR3FxV2tnSjB3V1hwWXV2S0F5WTRabjhtM21KMVBpbnNKSWczNUk2Rmll?=
 =?utf-8?B?Z1FKV1czcGI4OXlhSWtzTC8zQVdNR3ZHN1hpeUJvNW41RWw1NWNpUUFMTnU0?=
 =?utf-8?B?Sk83eG01a2JxVFlwRGMvVDQ2VmhkQnFtTDRkUUErSE1PYXdiSkhJRnJCWVJX?=
 =?utf-8?B?b0dzcTg3SVhXN29ua083QytVSmRHZ1o5dER1WnFUeFY1dzM4VXRSUEFTL1Z2?=
 =?utf-8?B?YkJvcklEQndrNXBVeGZOdStpTDJ2SnJFTXppeVBNNW93Sm5MS1R6S29BL1dN?=
 =?utf-8?B?czFsRjlpYUJuc095OFQwMUs5Zm80MWYxYUFDL3RleW9ubGozYlNaVlFnQXZK?=
 =?utf-8?B?RGdVeXIreU9NYm9hQ1JtTEl5NzR0NEJ6a1dHZ2hpRG9wcDBOdWQ0dWlidG1z?=
 =?utf-8?B?Nk1XQWc4aGhCTFpRNm9LUlhhTHVabGNBQ0treEdRY0kxT25hRnN1MThMQWlk?=
 =?utf-8?B?STUzeldsbC90VENLNTFZeWptRThDcGlZOW4rcksxUmN4clpFZ2lpMFJWTjYv?=
 =?utf-8?B?WUI0aUFlbmpBVVFucDdpdG1LK3JpRUdrNGJ1b3h4WkZWdlhnTTVMU0Ftc0Fm?=
 =?utf-8?B?WkhzSGR3SUt3T1NJdEFpL1dRU3VFU3NLN0dsNDlCRnBaUU5XMnNyQ1o4c2JX?=
 =?utf-8?B?Q0hVc0Z5aVRhZ2ZVK0Y1cHVxWnkwaFNRL2JXRTJMano3M0p1aEhUcEVCOFlY?=
 =?utf-8?Q?PptGyeW5e6wu05ezfb4WB2xX2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951c825b-6419-4b34-bc4f-08dccb4d2a25
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 12:45:46.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlMnHSEUrOu9DJ6rVx+DIYiFbrgOhxedLsF6hQWBbGjmqiXkiog8mh64xe1b8CeB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488



On 9/2/24 13:58, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>
> ---
>   drivers/gpio/gpio-zynqmp-modepin.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-zynqmp-modepin.c b/drivers/gpio/gpio-zynqmp-modepin.c
> index a0d69387c153..2f3c9ebfa78d 100644
> --- a/drivers/gpio/gpio-zynqmp-modepin.c
> +++ b/drivers/gpio/gpio-zynqmp-modepin.c
> @@ -146,6 +146,7 @@ static const struct of_device_id modepin_platform_id[] = {
>   	{ .compatible = "xlnx,zynqmp-gpio-modepin", },
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(of, modepin_platform_id);
>   
>   static struct platform_driver modepin_platform_driver = {
>   	.driver = {

I did the same change internally some day ago but didn't send it.

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

