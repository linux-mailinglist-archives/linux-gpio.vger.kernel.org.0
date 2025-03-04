Return-Path: <linux-gpio+bounces-17079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C6A4F166
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 00:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BC5A16D6A6
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 23:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D815B27780E;
	Tue,  4 Mar 2025 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BxErnK3W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEE81FBCB6;
	Tue,  4 Mar 2025 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741130578; cv=fail; b=RGXZLvLu3mo2vQyOG1vwI1SjPHD7d+OdisUxv8+pHjcTvNS7Ith+cMxje2SuCFaamuhxOVye/Ybe5vYLdIIbOYQTuBmapf8yySCiUHXFQBigxpb+jqinEe6bK22fSfXFlUv09dmR4QrWP5WxEsdGPlmfigz3zkF050hRzekDBlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741130578; c=relaxed/simple;
	bh=PFXL69rpbZkKyFmuVlYUUNL67OJbeNwxdjuKnx8Miw8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uOLR+UuLj0qRcAWjZrSl/pxiI295+dyDnukNtYx73BS6t0KBQD6ZsFTtemO7JBrx1FfTNJf9WhfyhsjMNLts0dp9jB94lPpdWK8Le5PaZd+r6Jqddfev3kMVmAjepkV/78A5l3sYTNP+Qfi25QBi9T4FezS5NdAxj2j9daTbUsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BxErnK3W; arc=fail smtp.client-ip=40.107.92.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/9rv27N51HX/qhtXgleo4VaFA7op7gB5z2SYMfxOrsF3eQyhBDJIaj50lU0qxej8NpDTZhOP8DtgryJnZN44y0bRSIMT9cS5i7PiE+1Pe+KrzT2L1I/GHMZWx5CWeYtEKjUbAEJ5+hogUz3E/dsZTFay9eZJmuZOn7sHKxbzKlN1gczMOiU50E8O0CxLkgZr4RCMvQRgzw+nfZZoD5/fXex78dGKjaOLCdfjFVIrlYNPAVk5nkjprwTeyhpRMph7anJ+RScsn4JX+KJXd/zakdLeSqqzf3wcgCTUaBgvhAnRVPoB5wdBxHv2X2NxGVg4LaEM0PrIwgRIPleourBfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2um4XyXlW3FKEMF+JxgZFoTCU+2iku+6B0FlyIf/HN0=;
 b=Xl/QRkeiZHu/DxiTGn/smlVc+7Fd8JJDbr6c/jHwGFtt/yL6u0TTZ8BokF9eIiSJEUyP2PIbHVKnodoZ1cH4RazI3Bxw5Q4IwNn6dYFWQI+KDzmdHMZKTkrbD1j8XZ6b6Wo5yPl4zwygEcmZmQWrIblBVLfNiYK9W8VMSifRHtu3PkNh60SweXR8uEKmavBTEbr5scG3Md+5wZYIAYlM00kSr2U2vCkvD6nOXc6DygiTMQD6VF8p5aE+LeLnV9X0u06uLGlbSreNpL8ir10l3HI0prjIYfWcPDYMjYZLzOj3HcrBhY2OoheXq2NLpNycNle1c5k4YzaHmnU2T7N6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2um4XyXlW3FKEMF+JxgZFoTCU+2iku+6B0FlyIf/HN0=;
 b=BxErnK3WCnJomKKPuXC0RYX7GLumjhGTRHgAblrROVdhuMmzflxmMqmMdzYOR1waq+aOZ7Z93Shz6X8yM0p50P7JRTw3A8CQWaCj27SgAkjbWx7yYvXVPaAvzYhi6T7LviwfxOHB15IfkXYbqbLlitoW0bg5aMZnyqjtFl838Xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CY8PR12MB8194.namprd12.prod.outlook.com (2603:10b6:930:76::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 23:22:54 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%7]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 23:22:54 +0000
Message-ID: <6aa1f21d-7f80-4aec-b0f7-382277ea6bb4@amd.com>
Date: Tue, 4 Mar 2025 18:22:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
Content-Language: en-GB
To: Linus Walleij <linus.walleij@linaro.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, dominic.antony@amd.com
References: <20250228165749.3476210-1-pratap.nirujogi@amd.com>
 <CACRpkdZv6ykTPWUNmbPNv+VS=a_YTFBqiDS0eojt28Myvs-ZZQ@mail.gmail.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <CACRpkdZv6ykTPWUNmbPNv+VS=a_YTFBqiDS0eojt28Myvs-ZZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::43) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|CY8PR12MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: e295ba5d-eb83-4468-12bb-08dd5b737d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUdaTG5qdzF5MHM5cFFiUmFkZDBRWmFFV2hicFFGTndYaElNOEIvOVlhdmJm?=
 =?utf-8?B?K3VWRWJ1Rzk1cjdSYWNTQjQ5SGpHTUMxdU1hSExOWkxqR01RT2puUWZYekhj?=
 =?utf-8?B?UEQ4dFpzN2JtWmpvUXE3ZnY4dHhKOU9uSXVFZVlvbisyZ1FnVHFpL0JGSTZF?=
 =?utf-8?B?eXdaOW9aSnBFK0VHbUoyK3lyV1RCbFBJZG40ejFnb3IzN1BrZzhaQnBKOVdi?=
 =?utf-8?B?NSt2YTc5SldTYVh4dW5nTjlFbjE2ZE9LZFZLM2JEaWhHbDg0Y1dlRnNGSG1v?=
 =?utf-8?B?M3R4M0NFRCtkb0JZS2NjRW45MDZld2pidG9LYWl1b0NhQU5DUHp2VHF1RUF0?=
 =?utf-8?B?aFVmUHl1MjNzNlBJZEJOamZLSjZhc0F4YUdQeUNOMmcyRTBaR0NyYWF2SU42?=
 =?utf-8?B?T3pVNkhmdlg1Y0FPRDE1RUtsMkZrU2VnMld6YTNBQmhCUkVCMm5yYzR2NWlQ?=
 =?utf-8?B?UmxwVmUrZVowRkJwemtyQXlWVEhKMXQrVERLZ0VXNkV1NE5jY1NyTmpaZzUz?=
 =?utf-8?B?cS93SXFKVXlzZ3l3OXJFQ05hSDJQakRiaGJncm5DUmt3L3pCd2FkMm9lc253?=
 =?utf-8?B?dG1KWGxSQm9mcjk1aS9hUkZUeml5czZGaG8xTnZMY1NUNTZzWHExTGgxUWh0?=
 =?utf-8?B?Vk1QWjIrelhWRlJFT294bzhPN0xvcDlZVlBEenVkZUdZaW5FYmJMOFh4dUFj?=
 =?utf-8?B?MGFmZTgyeG5uNnV2SGh3RndQUFRLdW4xZWFMd0J0M0pCeUI2MlRXWDhQUFBk?=
 =?utf-8?B?MlU1Nkp0UGw2MXdFYnlVQm94M2lSdW5mbDVpUk8xekVpUkhsTElGZm1EMy80?=
 =?utf-8?B?L3JRQVJ6M2MyVHkySGwzaitlbktBOXhaTXpyZFIyMGN5cmpiMjRsT2Fjemt3?=
 =?utf-8?B?blErK0xmdUdnVUZCMjliQWc0aEJYcTJkeTZmZ2ZKWWh1Q3RJUG9XNzY3OHhZ?=
 =?utf-8?B?aGVmTDNvZ3lBRVpLSDZJTWh1TytKQUZxTGlRVHdvRXlXWWg1Mzl0cWZyVzgw?=
 =?utf-8?B?T1pnNHlWNHlMNkViUWI4U3Jwazl3aXZRNEJEQlFXMWxPZHRZTW4xdnFPRDZt?=
 =?utf-8?B?T25PRjZHVVRHd25aRUxyZHNtcW1yUEQ0TE0zb1JhSDVCVnkxSXRKZUg3Rnpz?=
 =?utf-8?B?cG9OUjFMd2VRanJuRkJHL093bVpLMk1EVmphMCtQRUE3bnJ0dmZTTGhWcXVs?=
 =?utf-8?B?MFZpQjFhVGpLNWprUEZzY0Y5dy9MeFNDbGJEdDVGdDhqVjRZa1M5WE54OE5t?=
 =?utf-8?B?NkxjMVEzQ0RLVllyWDZVREptRmJPYzU4aDRLQ2NIUjIzZmZXb2ViZExFSzJh?=
 =?utf-8?B?M2FCcGYxcTd4KzdqWm9XOFF1NEZKMzYzeHJnVmpLVFp1bW1QRFhhOVpvSnFj?=
 =?utf-8?B?K01BWEtXTTJQd1F0aXlWZjZKNnJIenRhS1lqTGpMc0VyQ05QQnRNMnpYd09T?=
 =?utf-8?B?eDFMT0JCbDl6aXRCNENsV0FGbGpYS2JVQ0hmb0lTZ0RwL3BFMjRYVVlpVkEv?=
 =?utf-8?B?OW5ZNjdWSWVXN3RaVTYvM0JqVWtlT2I1NW56dXlUNFVhcGxPYUJtQmNnL1BF?=
 =?utf-8?B?ME9OVW1Yd3NHME5FT21mOEo3clBuRDdRR1RQd1BIRzBjV2NNZTFCeUlVSGti?=
 =?utf-8?B?Mno0cGxvWm82REREMS9qcm0rYzZTT0pmRmtGWk9TVmxRempSVkZuUHgyajMv?=
 =?utf-8?B?dVVid1J3OHBpVGFrWFJnS0hxVzJiWDhva01LZWVlZmRCMzQ1Z0Z5ZHpWMXda?=
 =?utf-8?B?L0p6OVlkaHZ4MlJUMFE2K1FwVnRkN1NvTjM2N1JDdzhZU2VUSkZGS3RQMUxO?=
 =?utf-8?B?L00weWRqZTdJQm9qd3ZkNHVldGtpZ3VYR0FIRHNZaGxlR01xYmQ1VEZtUW1x?=
 =?utf-8?Q?Hsmah/Mjtvm7D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUJZYThkbWg2WGdmaFltTG56eTBYZGE0RzZKVHB1TVN0cGV2UFphZmxIZCsv?=
 =?utf-8?B?dG4xa0pnMEJqTEVlWFdtbnFOU25NK3Q2cW9SUm5kYkJneFlkd0t3UGVNQ0RL?=
 =?utf-8?B?ZGlpWjRlNTBKZWtaZHNtZzFDZm5NUld1a3JSdGRra2NFeFd5Q2s1c25ZQlNw?=
 =?utf-8?B?SHpMcmRTQnAzZkJ4MWpGQy9oQjJISmZ1RTdlayt5ekEzQlA4L0kxWTEvd3pa?=
 =?utf-8?B?THN4elQ1OXlKd2pOd1R2MlhjbWZnUkRrK0FFUjk0cGJTOUhud3ZIZyt0ZXdB?=
 =?utf-8?B?NGNEa1VUUzRsd0VMb0Z1MTZMT3BwbTlqb01NT1NBRXpyUXl6NHYyL2hMOXhT?=
 =?utf-8?B?azQ1WURsRHg0L2NGMnJUNnZidndBTjBkSWpaZ1ZJbklLTllzZ0FXekJBakk1?=
 =?utf-8?B?d2lhRVNZRVpuVm1Gay8yMy9YQmRCNkthZENwUnliR2lnaWNiZFlSWll4cXlH?=
 =?utf-8?B?TXRHUk91TGZtOXVtVnh0Ym1WczA3NkpyUUE1d2JkcUViWnZzV2lyYkdOMkUz?=
 =?utf-8?B?TVREaGZTVkF1Zy90YVZvajBNZkQzMHVoTWFvRXRXQVpvQTZ4NVlIUEFvcERS?=
 =?utf-8?B?TDZReGFReHZIRUhkdk1EaTkwNURCdUpFbVhlK28vR0VhbStRMUFiNEVFZXdJ?=
 =?utf-8?B?U3BGRDFTdkJnN2MvQURNZCt2REVPV3R5eTUxeDI5YTVKQU5BQkR5ME8wa2kz?=
 =?utf-8?B?ZG9Uam9sa1U0dnRDWTk1SFgvSUtRaFRSazMwR1ZESEh3KzNnM2RWeWhDSVlh?=
 =?utf-8?B?NXp3cUlzci9Eb2NSVEFDVzdsSDV1N1ZFWEx0aVcwYmU0dlhVeGY1bjUrUG9J?=
 =?utf-8?B?ZEREZ2FURnlXNVNoblNYT3NudVpBVzl1S2NoUVozWDdCK1JpTXpYY0pwcjIv?=
 =?utf-8?B?Qm50UDRmd0hLcHNDZmR0dGxJcVdVZjRMZjVvYlZRUHhnZVJpZ2pkdm1MdzdW?=
 =?utf-8?B?Ky8rVzJkWFJBN1Jhb0VzbU1VS0tOcWwrV2t3K3h3MTZpMmxkSUNXckU4OVV2?=
 =?utf-8?B?emdmcnRXdDV2TWNxQ0ZsZWNPazdZRlBsWlRYVDZDSENaVEFoYUM3cDJuMHBn?=
 =?utf-8?B?aWJ4L3dvWENRWEcraU1WaWJ2a0hmQk42WFpjVWZ5aGZndWppZ0k5Tkh5Y0Vs?=
 =?utf-8?B?TnNtMGgzWnF1bGZ2Q2ZLNUl1OGIyRTRWS1VZbWFZREp0VFh3RWpmbENJK3BH?=
 =?utf-8?B?Ykp4Rkk5MTZGOWFCSnpWd3l2MUlORUxOSHZxazkwOVBIMUk4bTR4dURNR2J2?=
 =?utf-8?B?Y1FHanZ4VitMWm94WDN0L3BqY3ZsckJDZTRGVkRKRkcwaFlzZFZ4bFovUkR1?=
 =?utf-8?B?dW5aYnI2U1M0VUsrUHo3cDlSRWpHcm5uU0hFS2tWSTQ4V2dmTm1Ud2cvT2Iv?=
 =?utf-8?B?WXJFc3U1YTdIOTBNa01HbzN1emZtWHdlVnNtaHRBbnpVejNwK29GdC84V1RJ?=
 =?utf-8?B?b24vdWpOL3FzMGtvRWk3aHV4MXhXaHRmUzJwTUhUL1Y5aWRuNXVESmhaY1gv?=
 =?utf-8?B?dGZNVVFCVlNNRlVDaXhzRmk3bks0elR3NFBOeWg1Zk5FYnQxSWNDcDdPOTBM?=
 =?utf-8?B?S0h4SU5ka0E2aWUrM0xaTTlHNDJkSEphcDBZeVhkWXVTMEd1N0pROGh6c2FB?=
 =?utf-8?B?TzFVSkxhRmFrTnVMNnh1MCtKdk5LYXZoZnRHeE1VbVVpWm5MUVRmaXBzUmdv?=
 =?utf-8?B?RDZVd0hnNVZhSE94WGxIdkh4cGE3bmJRb0pGREtLMTlZSnUraDVCbXNyeW1j?=
 =?utf-8?B?cEhMVjhPUTVQeDJxZVliblZHUzMzYmdmTFpBT2t3dmRmbTR4VjhFSExHOVFn?=
 =?utf-8?B?T0JhdEdSZy81bjdEWVMveC90dHJFVU8yREN3ZXppekhaSUx2RFVzdzRhaVZr?=
 =?utf-8?B?ZUZRQUZEdStsRWg2cFVRUDdKdlBQMjYveTdjcytGMlRYK0xzcHZFWGRraE90?=
 =?utf-8?B?bkd6bjczUTZ4Z2NkekUrTUl6WVRmTS8rQXFhanJBc1B6b2dXQVlhd0lMZURH?=
 =?utf-8?B?QVFXOXRyQ0w5UXMrS1pjYjd2Z1dPTnhlZWpHMTlELzRHRGRCK2RzYUhzdlJY?=
 =?utf-8?B?RUVReitYZnV3aEVxNlJwalJpaGxON29WWFB2TFgwWVZ4cUpqR3c0djhTTi9W?=
 =?utf-8?Q?kEcQN6wculEwwvSflu+WXoMB6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e295ba5d-eb83-4468-12bb-08dd5b737d7c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 23:22:54.2703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pA7XKkgxi34Uz5Kh3fABHRi+uc0/BpyVEWdKRxJo8RzZtZz/SW+zN9aKqGDuL7td8B1car5U9sCzpC1PFhwXmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8194

Hi Linus,

Thanks for your review. Please help reviewing the new v2 patch with 
comments addressed and will look forward for your feedback.

Thanks,
Pratap

On 3/4/2025 3:34 AM, Linus Walleij wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Pratap,
> 
> thanks for your patch!
> 
> On Fri, Feb 28, 2025 at 5:58 PM Pratap Nirujogi <pratap.nirujogi@amd.com> wrote:
> 
>> +config PINCTRL_AMDISP
>> +       tristate "AMDISP GPIO pin control"
>> +       depends on HAS_IOMEM
>> +       select GPIOLIB
>> +       select PINCONF
>> +       select GENERIC_PINCONF
>> +       help
>> +         The driver for memory mapped GPIO functionality on AMD platforms
>> +         with ISP support. All the pins are output controlled only
>> +
>> +         Requires AMDGPU to MFD add device for enumeration to set up as
>> +         platform device.
> 
>> +/* SPDX-License-Identifier: MIT */
> 
> OK we have this...
> 
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
>> + * All Rights Reserved.
>> + *
> 
> That can be kept
> 

>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
> 
> This is already in:
> LICENSES/preferred/MIT
> 
> Which is referenced by the SPDX tag.
> 
> Can we just drop it? It's very annoying with all this boilerplate.
> 

Done. Updated copright header in v2.

>> +#ifdef CONFIG_GPIOLIB
> 
> You select GPIOLIB in the Kconfig so drop the ifdef, it's always
> available.
> 
>> +static int amdisp_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
>> +                                 unsigned long config)
>> +{
>> +       /* Nothing to do, amdisp gpio has no other config */
>> +       return 0;
>> +}
> 
> Don't even assign the callback then, that's fine.
> 
Done.

>> +static int amdisp_gpiochip_add(struct platform_device *pdev,
>> +                              struct amdisp_pinctrl *pctrl)
>> +{
>> +       struct gpio_chip *gc = &pctrl->gc;
>> +       struct pinctrl_gpio_range *grange = &pctrl->gpio_range;
>> +       int ret;
>> +
>> +       gc->label               = dev_name(pctrl->dev);
>> +       gc->owner               = THIS_MODULE;
> 
> I think the core default-assigns owner so you don't need to
> assign this.
> 
Done.

>> +       gc->parent              = &pdev->dev;
>> +       gc->names               = amdisp_range_pins_name;
>> +       gc->request             = gpiochip_generic_request;
>> +       gc->free                = gpiochip_generic_free;
>> +       gc->get_direction       = amdisp_gpio_get_direction;
>> +       gc->direction_input     = amdisp_gpio_direction_input;
>> +       gc->direction_output    = amdisp_gpio_direction_output;
>> +       gc->get                 = amdisp_gpio_get;
>> +       gc->set                 = amdisp_gpio_set;
>> +       gc->set_config          = amdisp_gpio_set_config;
> 
> I.e. drop this.
> 
Done.

>> +       gc->base                = -1;
>> +       gc->ngpio               = ARRAY_SIZE(amdisp_range_pins);
>> +#if defined(CONFIG_OF_GPIO)
>> +       gc->of_node             = pdev->dev.of_node;
>> +       gc->of_gpio_n_cells     = 2;
>> +#endif
> 
> Drop the ifdefs.
> 
Done.

>> +#ifdef CONFIG_GPIOLIB
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       if (IS_ERR(res))
>> +               return PTR_ERR(res);
>> +
>> +       pctrl->gpiobase = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(pctrl->gpiobase))
>> +               return PTR_ERR(pctrl->gpiobase);
>> +#endif
> 
> Drop ifdefs
> 
Done.

>> +#ifdef CONFIG_GPIOLIB
>> +       ret = amdisp_gpiochip_add(pdev, pctrl);
>> +       if (ret)
>> +               return ret;
>> +#endif
> 
> Drop ifdefs
> 
Done.

>> +static int __init amdisp_pinctrl_init(void)
>> +{
>> +       return platform_driver_register(&amdisp_pinctrl_driver);
>> +}
>> +arch_initcall(amdisp_pinctrl_init);
>> +
>> +static void __exit amdisp_pinctrl_exit(void)
>> +{
>> +       platform_driver_unregister(&amdisp_pinctrl_driver);
>> +}
>> +module_exit(amdisp_pinctrl_exit);
> 
> Why do you need arch_initcall()?
> 
> Try to just use module_platform_driver() for the
> whole module.
> 
Done. thanks for this recommendation, replaced with module_platform_driver.

>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMDISP pinctrl driver");
>> +MODULE_LICENSE("GPL and additional rights");
> 
> Well that does not correspond to MIT does it?
> 
Done. Updated license info in v2.

>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
>> + * All Rights Reserved.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
> 
> Can we drop this?
> 
Done.

> Yours,
> Linus Walleij


