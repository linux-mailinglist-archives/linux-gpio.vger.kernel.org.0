Return-Path: <linux-gpio+bounces-29114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C7C8BF54
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 21:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7939D3AE5E4
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 20:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5D8343D6A;
	Wed, 26 Nov 2025 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FQL9GXZx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236ED3431E6;
	Wed, 26 Nov 2025 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764190612; cv=fail; b=B+MPgIjqtDXwfvhOvUxHM5HU0FVlLYAE5deq17pWKcM4JXHS7IsaCVglNMizSkkHGWRiCmDBRkKdZfZceHnUldxiALYttgdZWlH4EvBT6sANClnDJyvyYtntxzOxmT8dENKYA2SKB4XDJTUFbW9fuGvOtuGgtRHA+ktoO5dNynA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764190612; c=relaxed/simple;
	bh=3yD1sFaFX9k90I5S9uSgzQVyjyJkZx3bM0XMPHW1Y2k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aaDybNJw5GMbzMN+7fTFAkpN2BuSaMZxrgeTg+fMf1QfdiG5aWQGBsim+iyFw+EsGvZq+9ap8Kya5nc7BewQBUifGXhEjFp9TollsMtLbJOAL+96HjG6OwVKj5Sz+dlzQ7VzW5SV3tASCQRF18pU+z1ZgwkiJVh1+mTx6n+AE1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FQL9GXZx; arc=fail smtp.client-ip=52.101.193.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vu8Av2NrYzqRORnehdrLnwa9Fb0YEVQ+LMCxO3UTtw7apEK3sBZfBLc50qmYxuG2aqLhcsuF4npVBRjQh+MMVw5ZMkUX1h6mEtjejKw6CzNf7FA2GnrfGkLhEd/df4KZ5hQ+jrkbhkvum8y3uuh9OKymxFvHHH0deyhcaYmGpiSiA6pNcO5Fkbj/STHdjHHGZI4oQv78kF8Qx+OAYk3s9XpZ06WMGW0Gmuvcv4PaN8c47DtYg+CMo6HVM54Q+K/VggvZ6UGA3FIUciJsbtqdf2GjkGp/XmEPrJbjBQEV0SiDxSa4eaHUPehGZoPRidCtz6reoaqGBukOI78JEZ3zxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zM5pp1B+pTJtBDwl0BKc6Q3Cq645c8esVJ9DxkF4pw=;
 b=Wfu+QnbF/POiUJhlbR8O+gEapJvwHiA55r7RU3a4xS9UINVonmSJ2DCh8n6KJ/tc7wkgjX7YdX3zuKSrRAhs6Ud/SW94jaCBw7u7fGjon2kMjRaNn6eTypEZttaHI0dzcaO+XdFr+pqOq3AEUcgN62QX+nqopdj0ZX/UfPKekIDwqG52+/HbpZocbhO++UyHELfif9JfKqZrKIrZ57EDknLmz6qFyP03uAQdk0lPDgXDMNcVhQAtjp6olx+8HQE10ZMFFDmnJXCt1VM0H2XiENYtDMLablg4nrTAsSIhUtMxE2bJ8wIrBLV7yON1c22mVVnqDAJ+O7Iz/BY0HEpfwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zM5pp1B+pTJtBDwl0BKc6Q3Cq645c8esVJ9DxkF4pw=;
 b=FQL9GXZxQZ5QofZOb/pIduVpjdghASYm2TnYvmfRDWzVf00XgplzGkpLmF4XmsbWKskbwmfpmntbXMVksfrTl3s16OwCeT6TxiSIm8iR4MbOpCKOYAbMTkpXhzPR3vJKcqWgWKuoN2gaCKS+8gZdfH1JdiyMxScc0RzfDXjH9qIKBw7VHTxy8fgVf0AFJYeokVMhnKLHqL6shRFnDrXgwhbnI9RcW1dTqpqTaG7qdHaCFJM2etUJdKrRjA5EWabBdU7R9v6UDBgLvg5VjIljEbbcHXEXzlp4VeRe+Mlv6kJUi/PQQFN2roL+YCZGhDCm5acrNzqnMEaBErpbKH1wHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 20:56:45 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 20:56:45 +0000
Message-ID: <080dd053-972b-43f7-a91b-920750dadcff@nvidia.com>
Date: Wed, 26 Nov 2025 20:56:40 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpio: shared: ignore special __symbols__ node when
 traversing device tree
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251126-gpio-shared-fixes-v1-0-18309c0e87b5@linaro.org>
 <20251126-gpio-shared-fixes-v1-1-18309c0e87b5@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251126-gpio-shared-fixes-v1-1-18309c0e87b5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0309.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::33) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0cfd34-f0a4-4e4e-04aa-08de2d2e4eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzAyNHZHdkRqQUwzU2hKZWY3N0JIby9zeXpSZnlpOXp3c2xLMmdmYm45UnJH?=
 =?utf-8?B?VW5TSWNkd0xmcUpXVUVBVTZkYUQvUDJzTThKVEhRSm1mRlp5bC9USkZRUHIr?=
 =?utf-8?B?T3hCWnk3L3p2MC90RnByclVtN1RmenFPL2hWS3ZiRXZGc2Y2bndTelhYU0hr?=
 =?utf-8?B?NElYQzZOQUNocU9QUXZXTG5KTEpUWGFlb2UrRTNlS1NSc2kxMCs0U0huK2dK?=
 =?utf-8?B?SGJqTC9yL2djamJPL01DdWFOSlMzNGcrYmxvVUFvWDE4MWFRUURNbVJMTlBJ?=
 =?utf-8?B?cnU4RXZ1SWQxU3U1WjNRUVVuOXdGdEFyQkt5R3YrZG9scGV6dllZQkVFTnFi?=
 =?utf-8?B?aCtPRVVVL1NHb2MrN2I0OXJPVnlTS0w3TFBnb0d2bG5pZXkwSmdaVnpIanRv?=
 =?utf-8?B?NUNyNnROMTNFMXp3V010aTlBNU83YkZTSzF3QWJja25IVFBnMXEwUDI1RU9q?=
 =?utf-8?B?SDhBY2UyWTdHUEFkWUF4Qm13QlhMbWRUdGRRSW1QbGVlMUNkZFhEYjRyNWVv?=
 =?utf-8?B?UThPdFdPYXFBYUl2M1IrVmcxS2RUR2Y3TjZpaktldyt5bS9KWlJEOGd6UmhJ?=
 =?utf-8?B?MmhTTTBXM0dPSVlwbVVrL1NyQ0hrcHJQbjZaeXVqK2lId3o4T0ZCQTFKSzJU?=
 =?utf-8?B?WCtaVTBqTlZOQUFLeGxrUzFJbWdlRU1reVkyMkRmMWdrekhEWit5RkdMa3RO?=
 =?utf-8?B?UmRHa1ZwYi9jMTJQdjcrWVo2eEVJSk9tOFNuMm5iV003S1VHOVFwNy8wd0tB?=
 =?utf-8?B?MDdoeEs4T09sVUhXNW5JSlMzeWc1aTdkOWtXZDRrUkJ2ekl4VmZSbDRiMm1n?=
 =?utf-8?B?WW9PdXlGM2J1aGJpSXdkMFAwdlVzbmFjaFJ1TXVCa1Z3elhlSEZibGpIVWU3?=
 =?utf-8?B?K1ppQTZGaUovU3FSeFFSMDBYdm55enJvMllGVjk2M2ZVMm1TTlJkbnI5THlr?=
 =?utf-8?B?bU9USmJMVmVxWEgvR2Jjbmp5K0xuNEEraDFSUlJybG1aTzRzUTJ4ZHBmYkVj?=
 =?utf-8?B?T2xJNSt5Z0dTZm9HaTZiYU5sK1FlNUZ3M09ud3BnNmdjMjN2TExvUUsxYUpx?=
 =?utf-8?B?YktPM2paMFhnZHhtcDA2S3VPblBsNTc5cDdraW56ODFWU3lrak8rdFE1aFVq?=
 =?utf-8?B?TTlEN3hXMEcwcnpoV0lIaEhvanRDSnNWcDJyazlhT3ZkVTlGMkhqem5POFF5?=
 =?utf-8?B?SHNpS0dQNGgwSVROL0xpb0k4ZnI5OFd0UWJGMXVwVWpzRnBOZXc0WWlMOXRZ?=
 =?utf-8?B?NU12KzR5b1lnMy9ZNmkxN1MyUEZ5SXZUNVg5cHZ1NXFwUWdRcHYxRjI4YXJV?=
 =?utf-8?B?eDFLamNrUjF0V1pHU28zMGVNdEkrbnhOLzJiRC9zRjRRTkhQRllvQXlVclZ0?=
 =?utf-8?B?bEpyMzRabU5oVUUwZWhueUV1aytKTHVPZG9Pd0xoRkhvaFd3cndZcC9VRllZ?=
 =?utf-8?B?UGNObVRLM3EzVXN1T3lSRENLeTZvMHVYMmJoM2wvV3hnM2NkNWFlNStqNlVo?=
 =?utf-8?B?NXhmRnUrQWcrcXFEK0JUSmJKWGpxLzN2TUllNlFOeEFCRU5YT3gwVU1mdStl?=
 =?utf-8?B?Y2tJSU91RDcySVJ3Y0lKSjZoak1UcGxVNXcwM1RXVlJMZi9ySGFMYkZnQkZ0?=
 =?utf-8?B?OWdHL1pKWURLemhSOVFlOXpiaUlDaEtMeDRkcUlSTDRGL2pObHJ5N2RsU0g1?=
 =?utf-8?B?MG1XeGNOenpuOGJyOW5sajdKSnBNNVJWemE1V0twZStrbWdsMm9QRVFwN2Vh?=
 =?utf-8?B?REZLMVBsZWlwK21yc21FZlNjK2hidDBtcHIvSjkvUFQ3dHFGNitUV2pWZlMx?=
 =?utf-8?B?bytVNXRPQUNhZ09nVk50L2E4WDBHK1k1amJLTXpiMk5SWG40SUFJaVB4QmRX?=
 =?utf-8?B?a3grYUprT3VOSndzR29sY0FQZUFvNlNTSysyTnVCVUpuWFdHNUN3N0ZHcDZk?=
 =?utf-8?B?MVVSZ2VQZkJkRU43UW1zWmpQbUVNZUhUWnFQVXF2d2lqTVgxTlAxKzV4SlZk?=
 =?utf-8?B?Y2pPMzlLK293PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHVqUWdoZGZZdUhSNm5OUlBkTlJLc01ROENGSnB1L2RwSnBKcldQdWxPZDVn?=
 =?utf-8?B?dGJjZlJ5eG1MNDRMc1hkeThjdlk3UzhBQWhSbjNYNlJnckJXZ0lLUU92Vm1W?=
 =?utf-8?B?aEhaYTlFNHFRbElDbUIwWUtIUm51VDQ4NE5QNDQ4S0RMclF4SXdvVjhTbDdB?=
 =?utf-8?B?UWVSVVlXaUJPamRUQ0J5ckd2ZURyQ1JBSXJuRklOL0VTZ1ZNYUZONDdVVktw?=
 =?utf-8?B?L3BBeVBlcExscFNabkxiaUprMDdPNlVYekZ4ZUIzRDA2Q1BtS1FjVnNVTnRr?=
 =?utf-8?B?aXVXOGIrWUdyUy83T0ZjSTJJTTUzN2hKUWdNUnBHNFZJWGdieVdXMmRMdGZ3?=
 =?utf-8?B?MTIwRnorakg0MmFEMnZnSlJwZ3VJQkFnU1d6a0g1YjFZaC94Qy83K2doZ0cy?=
 =?utf-8?B?b1NBVjh6VWhOdUpiejJGcmRueFhXbDYxamMxT2pkc0pWcVJzckZXWEc1bTNv?=
 =?utf-8?B?dWE4bWxDTTY2c3VudGxUQ0tZT2J3WGtNS21CYmM2UWVVbkNOOUI3eEdDdnR1?=
 =?utf-8?B?QlQvOVIxOGVZQ2wwMSs2aWsxOVk5VitpdmlHRUt1Sko5MWREbENnYTJjZGhQ?=
 =?utf-8?B?eXJJdTFKTXhpTlNsc2F3Nlg0Um9oZ0RZRU9PTHZhZ3NEVnJiV2svcEFYN1Rj?=
 =?utf-8?B?TnJXK1UxMnZVZnhKZUpzeWNwVEJFbDZucUhLRkUxT3lERHNGWndSNHlmWUxS?=
 =?utf-8?B?ODI4ellIUlFzUFh3b0RvOU51b3R2S1llSm5QeDhaYWVRaUgrUXVHL0lnZ1Bx?=
 =?utf-8?B?ZHFSbGZqdmlzN3ZjWGV4dDArUWRBczQxOWoyUVRkdmRDZlJJc2o3NURmTmVS?=
 =?utf-8?B?M2NhbmIzZDFUd0huM0lsNUlRWWpQekgySGZyUzNGdWlsS1BHL1h6WXA4dVVT?=
 =?utf-8?B?NWI0NElDQ2d1MkE4UkVqakpiU29RMjI1ZFFnVEpEWU1oU0NySENqMmU5SDRJ?=
 =?utf-8?B?VitLYjRQd09vUmdzRTJBd01IZ0JXTnVjSTRTdGkyeEpUdkdyYTh3WXcwaGJJ?=
 =?utf-8?B?Y1RtTk5zcVpaWTIxUmRKNkJjV1dQMXl2UWxNV0ZhVEJFcE9VM3d2ZHJUV3hi?=
 =?utf-8?B?cTl3SlN6WkFhWGdYcWNlVGVaY1dLTjkxSHNNcFdYWXpXTURNT1lCQmpDUkV2?=
 =?utf-8?B?OXB6VFQyQ1NGLys0RC9TeTVMZGlIREtZQ3FPd3dlaW9jRThSa202aTJnL3ps?=
 =?utf-8?B?bS8xMy9nN3pWZkUwVHUvcHRFaForclEvdlpSZlFPbzZaUFNkM0JxYnJEQ1Rk?=
 =?utf-8?B?OGVFUU90Ynlxb1R6THNKeDE5TE9DZ3VZY1QvVnI4RzU2TnVlOU5CcmxqODhl?=
 =?utf-8?B?Y0doMkxLUk5tdGRObTlVN3JJdmJlMXZ2NFh0bDJicHhzN053TWpEaStmeHJF?=
 =?utf-8?B?SFJBYkw2WXVKenpCQnc4ekE4N2RjdW50aCtrQTVCRHdna3BZUXdna1B1ZlhH?=
 =?utf-8?B?S3p0a1NYT2JyNjVJUm0vU0tjamZlTHZ3VzhYbGZkbDM1dkpzTFd1a1VWVmln?=
 =?utf-8?B?TXNEblRjOVk0VzN0QU9NSmltQmZBUzlUVytoS0FFL0V5enlUTkhqZzFlL1B6?=
 =?utf-8?B?NXlwSGVCWWNKd09aVXpUcGdJRU83OUVQUytCRUpJdUZiR29mbmdXdExqdG4x?=
 =?utf-8?B?ci9TV2loODlpMWFnWTNYbERjSGsyR0l0WTY0U3JpQUVlU3lyQ3lscUlUZ255?=
 =?utf-8?B?Q0tUN2JiOTlUU3BDYm5ZZGkzbWVUTnZ0QU0yZUhGajVWQlkreFp4eFNQSWJL?=
 =?utf-8?B?aDR6YmljUzFSaHZPeW42YlVLdmEvaldWR1V3bm1NZ3dGUkpLQ2YxbzQ0dkNk?=
 =?utf-8?B?d2sxdlhTT0dtMytRT0lFMlRYUG5PSFJoN3JYanBrRTRVWlozMVNkN0wzRXg0?=
 =?utf-8?B?UmlUMGhLV3o4UWNNRzRZdVU2MldtU0piYXVBOVpJdWZDTTRIUTZ2WHQyVnZM?=
 =?utf-8?B?L2NNMkF4bWRiSldQNzcxY2FybENQOTVDTkt4UUxhK3I4L085L3IxYitRazhU?=
 =?utf-8?B?Uk9WMzZJUmtGNkxaN1ZRYjhpU3NZNk9WcFhEWjhmZ3VRNys2UUNuMEU2V2Z3?=
 =?utf-8?B?YnVCeHRKTjRxbm5CQkU1NElULzhxOWVhT2ZpZlA5cXRSQlYxOWNsUHpxSEFw?=
 =?utf-8?B?RU9QZTFMRXBOa0hnU05DZzh3RFNKZmM3aGEzQTFtbzE4MlhRRTdCbWlkcVhE?=
 =?utf-8?Q?52UmVo8Pc0021w1Ec83rYlK4e7ILyIFWThylR0MeFg2r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0cfd34-f0a4-4e4e-04aa-08de2d2e4eca
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:56:44.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkL0taReEjDcwQzfveQxI9y3JNBvw4OcgItZABQHuKNPTHgK4GI1uaDowlV50vxLim/aXAfYIwMfyS/di5LBSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836



On 26/11/2025 16:49, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The __symbols__ node is a special, internal node and its properties must
> not be considered when scanning the device-tree for shared GPIOs.
> 
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpiolib-shared.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 3803b5c938f9933dab01c6d777c349ed3b42ce9b..62f32489a8a6f70c567ed93645f1e36a81612def 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -73,6 +73,19 @@ gpio_shared_find_entry(struct fwnode_handle *controller_node,
>   	return NULL;
>   }
>   
> +/* Handle all special nodes that we should ignore. */
> +static bool gpio_shared_of_node_ignore(struct device_node *node)
> +{
> +	/*
> +	 * __symbols__ is a special, internal node and should not be considered
> +	 * when scanning for shared GPIOs.
> +	 */
> +	if (of_node_name_eq(node, "__symbols__"))
> +		return true;
> +
> +	return false;
> +}
> +
>   static int gpio_shared_of_traverse(struct device_node *curr)
>   {
>   	struct gpio_shared_entry *entry;
> @@ -84,6 +97,9 @@ static int gpio_shared_of_traverse(struct device_node *curr)
>   	const char *suffix;
>   	int ret, count, i;
>   
> +	if (gpio_shared_of_node_ignore(curr))
> +		return 0;
> +
>   	for_each_property_of_node(curr, prop) {
>   		/*
>   		 * The standard name for a GPIO property is "foo-gpios"
> 

Fixes it for me!

Tested-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic


