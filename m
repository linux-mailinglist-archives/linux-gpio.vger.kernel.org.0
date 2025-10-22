Return-Path: <linux-gpio+bounces-27410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48BBF9ADB
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 04:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5624F42810A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 02:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6281FE451;
	Wed, 22 Oct 2025 02:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="bOuz7nru"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023120.outbound.protection.outlook.com [52.101.127.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2C71885A5;
	Wed, 22 Oct 2025 02:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761099005; cv=fail; b=EVYYYlhUugB74N2IH/PC2onFn3FdTIY2MY21xKAOFsecQ145mJJqF0OQ8uv2PqztLOKNJu54sTo2qBJ6C5vbWpMpqsvy3R0cQIzEnmC7T9XIO/fFR0iMjKat4FiK9dhFjUTnV0F09ydw6J4mrID1FG9lzVMmfeMMQ0+SWF3mN74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761099005; c=relaxed/simple;
	bh=8jIydE9x9NXBEr1fYex7jmafychtH9FNlEu6YzXYoKY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gKMMHgukK5F3L97/UF3FL/U1yy1rwqZcmcclnWCPssPJQsEB9Sn4TLOxXgn0prpL5D7Njblh4eMWjeyqg2iDkLYXEDEgcw3w9NUml7v20BIH/FFF/rn9MVToYlNG5B284HA673o3IuxvTvB4R17ifY3ekPq2V2QY7bYssfA23aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=bOuz7nru; arc=fail smtp.client-ip=52.101.127.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODJz16GswZYSMOA412m8YQxIrgJVyylAc7cYWdUWDZXPm9goligsVjt/SO4POgEVCJwetjY6xEDQkiKf17X3+n9BX43deoRXomBtTZ0R6gAp/FvwTgnRRqTY0tGRFvB3jh9hhU4fghw89u0aD5WxjbPmaMUZZpgtVrTzXShARzXGQiMMFoERfUGwLhasbHuHniWj+9UpqnXF6Euktb3v/5HpfcEhBXYu/APZXcunDHSAN3YmTMo6qBJookcrh3dxP16WftEoyQVYNLDu0U8W3V7glytxRIPemiseeliIJHOLSjFrYBX2SbJUuh1oVRSSbKhr/D6itpP5tTm0e9mnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgFanAJFt1rRuXXBQk1spHvxbX+f09Y+vjcZ3duqY34=;
 b=OmspVzF7cx4P92v8wJi45sNbgTSGsA2iz31vhMR937rdemB3bE6HKJEvbxBsfAHrGYCjx4qKN1vj4cgr9IvC1FGMKqYJ5kR7G8ogjy0neGiPGOubo4XUbnq7qpKjGCt8Se4931NZjKJkP6mBb6hHHCB0NKGMJtVHlbfgnyzHocSthqRCWV9KAkx/j9HzGa6+fS11fL+pSy/I9jmUkmmVTCez2FZ4CI0Du0FjxjqO5y91RkfMDKXiF0oExgMPEBgY6YowZIOq7s9PBGzPtBjnV55qvkq9yzdW1dSyB9cWoasTysr3BPx1DDjOp3UOOzlLybprW3KjWULbn+mx6C90mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgFanAJFt1rRuXXBQk1spHvxbX+f09Y+vjcZ3duqY34=;
 b=bOuz7nruqkULfrZY7p9dfnQXDdRBXlvaXAUu628D2FXoVgGyeQ1SHzIiMSqAP6i5VZVAPYY+krGnCyUw3pEx+Zq0kDCtdQp7IAPo61x3R8z/wLtbfyq2qiemxN3yYB9a0xyCozJqkSUYLXxEY2WL+ido66zMDbYHNPuHWEepdQ/ZKnX2bLF8zB6Nf61JASFc47ry9gMw2B8pFsxmLHogFHD0pQGtBQJRIU7gxfC1tX1BaajNcTnlhAceMux9/5WYry3Xy2OC8b6hQVGztcIyYLXRHxpG4H3BcV+p572qCt158/dBOGWxgG+PCAKbveIcNGmqqJzKMlZotVfMQ7ieKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY0PR03MB7282.apcprd03.prod.outlook.com (2603:1096:400:21d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 02:09:58 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 02:09:58 +0000
Message-ID: <5d8e439a-9ad0-4d2e-b106-d6e65a3e4638@amlogic.com>
Date: Wed, 22 Oct 2025 10:09:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dts: arm64: amlogic: add a5 pinctrl node
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
 <20250403-a5-pinctrl-v3-2-a8c067e22295@amlogic.com>
 <6ebddeb4-b33f-4392-b5da-56501b38fd6d@amlogic.com>
 <263b86c9-61da-4d5e-af3d-4b9105112d82@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <263b86c9-61da-4d5e-af3d-4b9105112d82@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY0PR03MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d9afaf-d495-420e-8886-08de1110199d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDlyYkhpdHN1Q1ZMWnltYyt5bTdOSk4wZGRhNHcvQWZ6Vlc5c3hUMVozLzVO?=
 =?utf-8?B?SG93TzQxMWVOZkFjaEpqaE1hOGhvdHN6VE8ramdRZG03OXBXVHdZajdsUGpw?=
 =?utf-8?B?cVQ0OWFpOTkwaVNXTmNPSkQwVFRZZWxxS0RQZE9GV1liZlh5QXhOUnF1MlNq?=
 =?utf-8?B?cE5SL0hEeGcxTXl1M1NxYTBBdGF1eDR0Mnd5WXJXbVBkTTUwcTZRSHp2QTBW?=
 =?utf-8?B?Q2FodVR3N2ticTlhVjlRMjV4ZEZ4R2h3ZHdJTWJhNDhtTW5YNURTWkNqZVRB?=
 =?utf-8?B?V2xzTzBBeE04SW1yOHh3c2JmTUVHT1dtMlBsMnpPL2FTRks3YUlTM2NXNnRQ?=
 =?utf-8?B?aGdTa2pVYk9IOTJWT1p2eCtQUFliaFZmZHNYUXF4MklhRkVSaDAvUkk5cFJn?=
 =?utf-8?B?VG14ekovTU9hL09xMGRWZStyVGpFQ0RBbExTM3RNV0Jmbm1mZjBsYTc2eFVG?=
 =?utf-8?B?Y0kydlZ4aHlYeTFZM2lJMmtYT3RjNDlDdjRUYjZuSTNCcGJhaXI1RlpRUVYy?=
 =?utf-8?B?dXhHd3dpVFByQUxPS1NueGRKTzJmZWd3TDFqRURWUkxQbkNOTnZJSmYyWjc3?=
 =?utf-8?B?VzlHMDRHMTF6cVBtbmd2VWZ2amZ4U284VVhMM0U3NU9sWHpJV3J5SldxL21X?=
 =?utf-8?B?NFBCVDh3azRsL0tGWC9jU0Z2cVdoN2Y3SXB1Z2RLcHJJS1NQdkxFMjBydHJT?=
 =?utf-8?B?dUFzNE8vaU9kREdzQXVGWDNLbWRUV2d5WmdkYUJqVm90TWFidlBnbmpJMUhO?=
 =?utf-8?B?dW5abjlrT0YvVVptWTBlRFBVWGpLNENaODJoYXFYYk03eWlZVDVqd2tRMFdD?=
 =?utf-8?B?aGt4RUQ4WUZVSzFEbU55NmtIdSt4dGJmdERoLzl5ZHo0VE50cXorcmRpZUtu?=
 =?utf-8?B?MlJzREZhTXhsNG41OHZNUHA1Ym01L0VTYXVqdUhmS3hRMFNSZWdQTXgyL2VT?=
 =?utf-8?B?SEp5U0RndHUrcDZmeHdSczdkQUpZUjRoZndKMndwNXJCcmY5bzROSTQ0cGUx?=
 =?utf-8?B?aFh5M3B4VHVBTE1BMThpMlROQjRhRFZlTWpUTWJRNlNldHQwRU4wQTRzWmVs?=
 =?utf-8?B?ZkYvWHJrbFFRRm1NSmdQNFUzMW9ML21ZWXVYZzBwd3oxaTZJeTd5VnFheXJE?=
 =?utf-8?B?OTdOYkZUSmg5RGdJWWNjTVBKQys5dWZjb04yU21uQkpER09GK0Z2Q2tVdnpH?=
 =?utf-8?B?Rm5SbVVORElkMk1Hai9GSkpHQ3doYnA3T1AvWFUvby9RaWd5aklpTEphTEJj?=
 =?utf-8?B?cEV5bWtHUXpRNmJxZENUOXQxVkJMYjVjUE5Rc3dzbGxGaXdOWkphRHdPZ0lG?=
 =?utf-8?B?RzA2WmViazZiZzBMbEs0dHVKVzFXTldUbi9KdHEwdWpDMHk3SVhJNzRZcFY3?=
 =?utf-8?B?d1MrWUREUU9EVVh3d1pMUGVGSUltQk5VeGJwRzZadllGNnNZbE8zampHdWZp?=
 =?utf-8?B?OGFZQ29SSFl4RmhkY1VuM1N3dTNDK0ZGaklmalpEWjlFWjNoTGZ3dVhSSkIv?=
 =?utf-8?B?Rk9ibDVESDhwVmVYYzEwQUJtUTNSK0E0YlZURVpJcUR3OStZelk2QU9jYkNC?=
 =?utf-8?B?OXh2KzZLWExvendtN2JQeHQrclk5d3crREpUVTluS09BcDI5Z2VWMFQ5ZVY4?=
 =?utf-8?B?ZEtkZjBJQXdJNDRBRzFNbVJSdDYrSHRINkJ2UEtCOGErTC81NkpQQS9SR2xK?=
 =?utf-8?B?bW5SNG1Fa0F4THRIME5TdGswdWl1ZEJadDNseitwWGp4VjRIeCs3UlArNnJm?=
 =?utf-8?B?M0tZckUvV1RENnZNWXlQNm03TFM3UTdoVGFmZGZGWXhvL00yYUlyR0VkOFo2?=
 =?utf-8?B?Nnd3b0VmUGppeUNHd0xlTnJMUEQzMy9HR0h0N290S1FjWUhGRi9IeTRMUEpU?=
 =?utf-8?B?UHlTREdkUjdpTkdyNWpiMnZjVEorYys2dlVSS3hBM1JEV0RFRm5aR0hZL3BB?=
 =?utf-8?Q?e8NG5lTDCeMTIc1rVH4eR9p1Bny2ad5q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFJyM2hUYUtZZjMwdERRVU94N1g0T2lQKzVieHBmVFZvelA5QmJxcm5rRlk0?=
 =?utf-8?B?cW92NlBtTWRHQ2k4Mkd2b3RlQkNpUzliNzBOUFFZenNzbFpRamxSa2hLTkQ4?=
 =?utf-8?B?VTlzcnUzdWpmNm50ckxIeFdOTk5jcGZZZC9RRll5Zmsra3A3NkYxdDVLT3Er?=
 =?utf-8?B?aDRVdjVpNVVrTHBKSko0dk90aEQ0NGFscXRhcG5PWjlkYzVZd0F3VWx0MXlZ?=
 =?utf-8?B?NVpkVXFFNldDM0g4TW9zWCtNQ3g5Wk0yVnlocWdwWGovOGVLeGdKS0NwNmZN?=
 =?utf-8?B?OXN0dkppMGtRamUvZE0wQkdvN1c3RVhNTGJyV0NEdkx5R21Fb21LNXI2UUVG?=
 =?utf-8?B?bC9KZGNOOTZsUXdyWE9BNHBQeER4WGhXWFR2Y0pibEd2dllRVWRkaWM4SWE0?=
 =?utf-8?B?Nm9nSFZnTDlOTFQ1TVlQRVJWdE5iMmtGY1hDOW5hakFhN0ZiMnRmWHBvczlC?=
 =?utf-8?B?UWFrOWNWN0x5U1gyVVFReTFTZTVOMzBlZDFVdlU4V3AxbVgxTHBQczZtbGpR?=
 =?utf-8?B?STFUUVYwUFdwSEd2Myt6SVpTWUVEaHd1UWJPK1VienlqWFZOSHFEWEJ0d1FO?=
 =?utf-8?B?TU9uRXdta3prWG5rMDNCeUpaWE9oUTdLRlNTQUwvSXRYVG1BR1o5dTgxSUFQ?=
 =?utf-8?B?YTBxR0FKSzR4YlB1MzUyeldZZDhMN2tlWlBsOVRTWnUvSkg2SG5EMW1hd0Vz?=
 =?utf-8?B?cTlVQmVtK3IzL2RzUStLb0VGTEJkUWdXZHhVVkpPNVNMdVNzY2VJMDJ4WTg5?=
 =?utf-8?B?NnFkb0crSDFlQ0VZYlhNMVM3K3hadmkvM3g1dHpsQ2trMWk2TTQ5U1NFY09N?=
 =?utf-8?B?cmFGQUNXd3JRdGp4cDNGL0pqUGNyYk1GcCt4ZHZYZHVIemZZcE1SdG01TDlJ?=
 =?utf-8?B?VUJPcGg1ZHVlWkxRN3ZJU1UzSHBwYkxQZC91NjJRME5OQjlwaUhDa0ZER0pT?=
 =?utf-8?B?WU5OM25IMjVCNXV1L2MyQ1hjR09Vc0tpbXVKcm5sdTZVMXg4M2ViaDMxUG5B?=
 =?utf-8?B?YkE4TFlUOUZlSmRsbi9uV1VUKzd1dlFESkhDZ2lOTkg5WmhJSUkySnRrVGV0?=
 =?utf-8?B?bytIemZVT1ErVVM4dkxqRVUvMEQ5SVhBaUtVMlBjR0ZjOUowUTZaVis3RkhP?=
 =?utf-8?B?cHA2b2ZuVm93TWhOUkMwNjNmWDVWTG9sejJEMGI4ZGE4dm5qWDErcEdlcnli?=
 =?utf-8?B?OG9tNnBORmVYWTErT3p6Zi91cTV4S3h4TzNLQ1d6YWhzL2pzSkZiU1NoTG4z?=
 =?utf-8?B?QWsrNTVZM2lKREVMTy9yd3prTzgzL0hiUVJjNVNLOUtsMTh6eTQ0Qmt2NkNL?=
 =?utf-8?B?Vms3NnlzTG1UMVkvN2I0RmhhN3JjNC91UkpHdCtvcnBvTkRFNHl3SjVnZkw1?=
 =?utf-8?B?cWlVcUFISGR3cWx1MWU5cU5JZ3E2QnZDVDg1NHFFZUJkdmE0aWV3VVFFZVhW?=
 =?utf-8?B?L015NUx0THNiVGhmRWJmRnpPTmFlSXI4d1hjYjJpZ3NwQ3U1akNiTlQ4TExO?=
 =?utf-8?B?OTMyWVVnbVhSMXpYOGVoZnM5SlN4Y0N0bUJtcGY3ZFlIR1RmSjVxMzZJaC9l?=
 =?utf-8?B?US9pOFRlT29md1p1VE9vU2ZYa0xpVVZBYitSUW5NWncrZEI1S1pqRkUvclU0?=
 =?utf-8?B?MGVYU0NxdXJyTGYzOGdWZEhYaHMrbzdpQzlHUWRmTjdEMkF5Y2tEU2JJaEd1?=
 =?utf-8?B?TTNCWEt3am16NnkvbExENEIwbEdKRnNwRWNqZkxtenVIN2M2RWlBeUpscEkz?=
 =?utf-8?B?dnJIdEl4OEt3N3pjdnlnTWdidy9hVjFDWW5pd1RlaGF4Tit2SnlPOEJWSEJV?=
 =?utf-8?B?QVpIeGlOdWV6ZUdOMjJJOHNzVkdVK1JybzRzZG44WEdPWjdrSHplNllNdU1J?=
 =?utf-8?B?WlZ2Q2NLaGFiWGxlZnlZT01Qb3dvWnc5UVNIajZOTDc0N1Q5SUVjWVg1K0hn?=
 =?utf-8?B?WWhmcGEvWHF2OTJwOXFISGovZ01CbUtvQzZ0NzhsTGx5RG9GdEdUZkx1RjBq?=
 =?utf-8?B?cnJmY21raHhtMzQ2QTBCMFdHTFExbXRNc3gwSnJxdnYvWSt2eVNXYzM5Zm1o?=
 =?utf-8?B?cGdhczRjNU9tdHROajBRTkRmQ0JtZjZuU0pOMTJnQ2h0d1dIMVlvME1YT0F2?=
 =?utf-8?B?bkhVaS9BZlFuNkxuNFJUcyt1aGRwdC9Ub2tZNERUdkJ6SExDS0c1bmpsb0M1?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d9afaf-d495-420e-8886-08de1110199d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 02:09:58.1623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGB62r1UZMQ0fnPt4QOQQvnyoBL1wE+mq0E4xad7PJixVsnHrFtk5O4TpgINuiqEVOffhNvRTLPP+SsI23wymNLFGD1eAZJqJul5BEZCJBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB7282

Hi Neil,
    Thanks for your reply.

On 2025/10/21 20:23, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi,
> 
> 
> On 9/5/25 05:19, Xianwei Zhao wrote:
>> Hi Neil,
>>     Could you please take some time to review this submission?
> 
> Could you rebase on v6.18-rc1 ?
> 

Will do.

> Thanks,
> Neil
> 
>>
>> On 2025/4/3 16:33, Xianwei Zhao via B4 Relay wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>
>>> Add pinctrl device to support Amlogic A5.
>>>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 90 
>>> +++++++++++++++++++++++++++++
>>>   1 file changed, 90 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi 
>>> b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
>>> index 32ed1776891b..844302db2133 100644
>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
>>> @@ -4,6 +4,7 @@
>>>    */
>>>
>>>   #include "amlogic-a4-common.dtsi"
>>> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>>>   #include <dt-bindings/power/amlogic,a5-pwrc.h>
>>>   / {
>>>          cpus {
>>> @@ -50,6 +51,95 @@ pwrc: power-controller {
>>>   };
>>>
>>>   &apb {
>>> +       periphs_pinctrl: pinctrl@4000 {
>>> +               compatible = "amlogic,pinctrl-a5",
>>> +                            "amlogic,pinctrl-a4";
>>> +               #address-cells = <2>;
>>> +               #size-cells = <2>;
>>> +               ranges = <0x0 0x0 0x0 0x4000 0x0 0x300>;
>>> +
>>> +               gpioz: gpio@c0 {
>>> +                       reg = <0x0 0xc0 0x0 0x40>,
>>> +                             <0x0 0x18 0x0 0x8>;
>>> +                       reg-names = "gpio", "mux";
>>> +                       gpio-controller;
>>> +                       #gpio-cells = <2>;
>>> +                       gpio-ranges = <&periphs_pinctrl 0 
>>> (AMLOGIC_GPIO_Z<<8) 16>;
>>> +               };
>>> +
>>> +               gpiox: gpio@100 {
>>> +                       reg = <0x0 0x100 0x0 0x40>,
>>> +                             <0x0 0xc   0x0 0xc>;
>>> +                       reg-names = "gpio", "mux";
>>> +                       gpio-controller;
>>> +                       #gpio-cells = <2>;
>>> +                       gpio-ranges = <&periphs_pinctrl 0 
>>> (AMLOGIC_GPIO_X<<8) 20>;
>>> +               };
>>> +
>>> +               gpiot: gpio@140 {
>>> +                       reg = <0x0 0x140 0x0 0x40>,
>>> +                             <0x0 0x2c  0x0 0x8>;
>>> +                       reg-names = "gpio", "mux";
>>> +                       gpio-controller;
>>> +                       #gpio-cells = <2>;
>>> +                       gpio-ranges = <&periphs_pinctrl 0 
>>> (AMLOGIC_GPIO_T<<8) 14>;
>>> +               };
>>> +
>>> +               gpiod: gpio@180 {
>>> +                       reg = <0x0 0x180 0x0 0x40>,
>>> +                             <0x0 0x40  0x0 0x8>;
>>> +                       reg-names = "gpio", "mux";
>>> +                       gpio-controller;
>>> +                       #gpio-cells = <2>;
>>> +                       gpio-ranges = <&periphs_pinctrl 0 
>>> (AMLOGIC_GPIO_D<<8) 16>;
>>> +               };
>>> +
>>> +               gpioe: gpio@1c0 {
>>> +                       reg = <0x0 0x1c0 0x0 0x40>,
>>> +                             <0x0 0x48  0x0 0x4>;
>>> +                       reg-names = "gpio", "mux";
>>> +                       gpio-controller;
>>> +                       #gpio-cells = <2>;
>>> +                       gpio-ranges = <&periphs_pinctrl 0 
>>> (AMLOGIC_GPIO_E<<8) 2>;
>>> +               };
>>> +
>>> +               gpioc: gpio@200 {
>>> +                       reg = <0x0 0x200 0x0 0x40>,
>>> +                             <0x0 0x24  0x0 0x8>;
>>> +                       reg-names = "gpio", "mux";
>>> +                       gpio-controller;
>>> +                       #gpio-cells = <2>;
>>> +                       gpio-ranges = <&periphs_pinctrl 0 
>>> (AMLOGIC_GPIO_C<<8) 11>;
>>> +               };
>>> +
>>> +               gpiob: gpio@240 {
>>> +                       reg = <0x0 0x240 0x0 0x40>,
>>> +                             <0x0 0x0   0x0 0x8>;
>>> +                       reg-names = "gpio", "mux";
>>> +                       gpio-controller;
>>> +                       #gpio-cells = <2>;
>>> +                       gpio-ranges = <&periphs_pinctrl 0 
>>> (AMLOGIC_GPIO_B<<8) 14>;
>>> +               };
>>> +
>>> +               gpioh: gpio@280 {
>>> +                       reg = <0x0 0x280 0x0 0x40>,
>>> +                             <0x0 0x4c  0x0 0x4>;
>>> +                       reg-names = "gpio", "mux";
>>> +                       gpio-controller;
>>> +                       #gpio-cells = <2>;
>>> +                       gpio-ranges = <&periphs_pinctrl 0 
>>> (AMLOGIC_GPIO_H<<8) 5>;
>>> +               };
>>> +
>>> +               gpio_test_n: gpio@2c0 {
>>> +                       reg = <0x0 0x2c0 0x0 0x40>,
>>> +                             <0x0 0x3c  0x0 0x4>;
>>> +                       reg-names = "gpio", "mux";
>>> +                       gpio-controller;
>>> +                       #gpio-cells = <2>;
>>> +                       gpio-ranges = <&periphs_pinctrl 0 
>>> (AMLOGIC_GPIO_TEST_N<<8) 1>;
>>> +               };
>>> +       };
>>> +
>>>          gpio_intc: interrupt-controller@4080 {
>>>                  compatible = "amlogic,a5-gpio-intc",
>>>                               "amlogic,meson-gpio-intc";
>>>
>>> -- 
>>> 2.37.1
>>>
>>>
> 

