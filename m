Return-Path: <linux-gpio+bounces-25305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5211B3DFD9
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 12:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B534B7A6A8E
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B0B30AAD3;
	Mon,  1 Sep 2025 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="lMJ9nUmX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013058.outbound.protection.outlook.com [40.107.44.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8A52AE72;
	Mon,  1 Sep 2025 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756721618; cv=fail; b=VGvJ8zVSuTAFfNYtQ1VX+N4zG2XJsiP4shZfms1HCv6EtuBxV9CaJDDj0fPDdsRMUCg84cSEttls0X0xgnl0ozfWOMB0a6TJZGM8GlaWdBcDJR2emVP4C1d87mykFvBAdDoB6Erh1zBkk+rfQx6MYXYKAhxAvejg4PXlvvt/B/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756721618; c=relaxed/simple;
	bh=zOlJvtekTXh+GGAVbEAZ1r6jaYJTsuLNt5EBKh1YP3c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AleRtbgED6rCiAKOF71mQVfPGYe2ErNvFmRWt8l3kA1d7Kr+fVUYHq63jW/Xj7UYjBNlziFS7tKnrDn9afxgMznh8rGPPuCAoYK9F8kxAxfWfky379ieuqLJe4l0Ksh1rbFdmIe5BqrZh6eJJCO/7iP51cZXjEj/HuSx263N20s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=lMJ9nUmX; arc=fail smtp.client-ip=40.107.44.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nO2LyoxCYDhS/DHjjxdbtewauZqtVDVYNb8YmemBa4eDLptP3IVH5QCkpcwweRqhcZ3bDDPGiYsnHUUWkoVGkw5D15vouT69lZ2KOelNgozMYiFBsS+HxMfTqE+hRZ9ASI0Et+EYpHGDQ22a29IfY2mjWPO8h+s40g2PSKLntxn+4P9otAcGgZ18SC9VjVUQahPUhciZmiBeMi4jpkZWE3yRm5HTF303AjFbwISQDGIhM92ER/D0Pq9xj/MF4elEqBPjUzBP40sOE46eIrDq9AxvOl0hXlrDhhjNb10f7HLiiYJSHR8PkRyzJGnBoetLc85BxDJj5bsBLLep8UnFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN5D7qZSMr7J15Xshcoo/nP/WXzSIE2sgkUYUzdLBUA=;
 b=zALdUW/qoWkW3fM+L7G+yQDmAuSStiN/safLVirLYB9xpGcFk4LfkwUUWbcPjq98h3Lj4JLy4Tdpf8ZYxIpNCSUhtYS1KvGTglq6d174dofJqibD5LbY0cCPNLNRsQfnoz4dtXF49A7QvhXyZod+c5xvRcg/S+3Eemk6ZKRe7RYS++i4CQkD/G8AfV8vpGcoJm9XtyvkFnKda1rkXj3d+zgg2p58+0Z0IfAzMBPwG1xejVnxfZqL6t26iN+gjq9/mueHXc3QFYh3+3gnk6cfO5F18xBcVc99XcPuYGPGJfortmU7o3bHdlRvoNoJFJgws34HZZ+FUrNybEvpdJ1+4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN5D7qZSMr7J15Xshcoo/nP/WXzSIE2sgkUYUzdLBUA=;
 b=lMJ9nUmX0aiwZ7eYGWlTXAsE9yXoolHNaA5KhQxn2Zm7Hm6lUL1i1wFML3SS0N052VSoOVrVuxnBfwZh64twUqX6/sjLndBlmHJjDTI4BzMm6MtqR2SefE+PpDZ3Ox1W/+hJ6rImVw+521Z3fQiRkzmzCcaiXPbdVrOP5C82X77fTKnbYv0ylUIblmw6Ew6qZhEbjjcwEI0dgf0VZgvq0eo5arQQ8w2bnlIFDvjB2R7uw2LQ3ihSAOINh17NBD1/6Mbl378CcF+U4wnzDvvoQJuaAtxZ5TJkEFNKo5GCc9toUHGTtrWWXvU4CtER6zZTjLo6CPAQcq4MnbhL2eFhvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB5689.apcprd06.prod.outlook.com (2603:1096:101:9d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Mon, 1 Sep 2025 10:13:24 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 10:13:23 +0000
Message-ID: <89294a30-47a7-45bf-80f7-04ffcad378a7@vivo.com>
Date: Mon, 1 Sep 2025 18:13:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: renesas: Use int type to store negative
 error codes
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "open list:PIN CONTROLLER - RENESAS" <linux-renesas-soc@vger.kernel.org>,
 "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250831084958.431913-1-rongqianfeng@vivo.com>
 <20250831084958.431913-4-rongqianfeng@vivo.com>
 <CAMuHMdW59wJCKq8nQ-SZHXVsX2kSCF0zg_gTP2vi3ApwH_SXAg@mail.gmail.com>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <CAMuHMdW59wJCKq8nQ-SZHXVsX2kSCF0zg_gTP2vi3ApwH_SXAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbf66fc-33d9-497d-e43b-08dde9402f19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUU2L2xlU3pPV3RTZUd3eUlxKy8rMHZyWGt2MENJaWhRNmRVNm1kN1R5b29B?=
 =?utf-8?B?ekxJdm13emxabzVhemgrZjdJWXRQcVRoU3ZHQVFOVjRjb1BtSCtud25VQnJ6?=
 =?utf-8?B?azNRc1dBNDR0YU9udE5QZFZaaVJGeXNEVmZJeW0xTHd3UHlNKzRkcUxpY0gw?=
 =?utf-8?B?UXBMRS9jM1pndkJHNlZIUm9VM1NNbGpwRFBvcFM0VU5RNmlEZHYvN3RZN0Zv?=
 =?utf-8?B?S3ZoYytvNXh4dU9ZbDFrdUh4RmJWbmZYK2FmODRMam9Ca21tNTNSVkVtVGlB?=
 =?utf-8?B?WkxIdGg5Q1hIRDJucjVkVnpGVWZNTDZCOE5oZG1uWkpET0t0cjYxNTdsMjVS?=
 =?utf-8?B?dG9JWUsyaTQwNkVweS9yMlA5U0hBQWxyLzJLWUpJcTdzQVdieWlCbkViemVH?=
 =?utf-8?B?YUt2cXpKRWt2QzhDRzNFcE9Xdk1UTFdtaUFyMzNESUp0Z3BrREE5aC9DRE13?=
 =?utf-8?B?dElEZ01YQnZrVVphQ0dYVS9xVjNEQnZCUjhJbVBQeVFaR0pPQkR5YVlWMFlD?=
 =?utf-8?B?eGpBYUk5QjZBVEdKaFdFK0hvTGdWNDR4ZVhUN2tTV3FtUEIvdHdlaGRBRFRJ?=
 =?utf-8?B?Q1UzOVRLYXVWZzg2cldYMXgvclBXUmJMZndkUGtiOHRPb2dmRDdLNTJrNCtR?=
 =?utf-8?B?Nm4vVjRKQ0tJemtudjQ3aFlleDVvcDhmbXZDaXc3THNqcElDYkVaU1JrZ21l?=
 =?utf-8?B?VjIzQ1VJbWhxYW8xelp0WmFPLzNOa2RrN0tQck1yOEtrZHBrVjNjUzk4Uk9N?=
 =?utf-8?B?VDVUTE0rSW0relBjZXJMRTh6b0tjeWpQSWcremUzSDgxUWNDck91MzRyTTUw?=
 =?utf-8?B?QXNoZnV1dWNwbUtEMXFRcVFKTmxDUTdaakRiUGlWbmJCY2sxNFc5OGgrMDY4?=
 =?utf-8?B?SXdhZzRtZCtoWFRnRU9YY244ajdPU3lhcjg0cFR6enhIcjdsTEVMcGFaZGJH?=
 =?utf-8?B?ODlhTmNaWjdlS21WcWJuczRrdkk5aFVhUkFWampldVRmVGFpK2gzbzdYV25N?=
 =?utf-8?B?cXBJcUFvWVBGUUFuN3N6SHQrek5idC95VkFUV1JZeHlJdzdLbDljWjdMV3N1?=
 =?utf-8?B?WGw4R0liZllwQUpBMzFXMjhUeTk3VmF3alA2UWpLMXZJaGMrcDJZeDE3dVlW?=
 =?utf-8?B?SVVGaENWTTRHZEdsdUVEK0l0VFVpZ1hFWk1qOEF4UXozUmdTRC9QQ1VrOTJT?=
 =?utf-8?B?YXg5c3IvNXJ3czE5QXVBQnBLTGlnWXM5MldnaDJsV0k0dXcwZ0FJeXcrTjhR?=
 =?utf-8?B?NWx6SnRoVHl1MVI4MGRjRTRMcy9LcnhEdFhjTkU2d1BLMjJvNmNZWTBNMjQr?=
 =?utf-8?B?U1ByRUdVd0JRdXl5b2MramZSQkVISVpEbEhCeFVhVEgyVlVLdy9WcEhSb3Q1?=
 =?utf-8?B?Q2oyYmJxbUREeC9CMjhValk3cHZ3R3ZReExsNVlZZjd6UG4wWlp2QnFsU2ti?=
 =?utf-8?B?U1l6U21sOHU1Tm1hMklRTXdSalQ3b09weS9kcXQxTStndTVpMzNOL2dDOWtR?=
 =?utf-8?B?c21GcThoYkRJRWVhTStKcENvT2VEVHM3L3E1Y01XQk1IOUs2N0Y5NmJPK3pI?=
 =?utf-8?B?Ukc0TE9pSGFYTnNWSHVWZzBLOEMydTVsa3p4L0RtekRDUVU0MXZKZ2pvV0dM?=
 =?utf-8?B?SXVNR0ZyMm5Nbk5ZSnlKT0thNEl2M2NKZXZjcURkVGEyZUhEeTRTaVlhbFhT?=
 =?utf-8?B?Mm1PN1AwdkJYRm1ObXJ5bUNDczhWV1haL2xwSk01R29TTjZKQWx0dFlKMHZu?=
 =?utf-8?B?dTI5YUptbUNiUVhNQ00za1RMYTZ3VThWOHhrNFV5S3JPb3lwVHRXKzJrZHl2?=
 =?utf-8?B?bzhEZlRMN3NaU0pwdVBDR3dOUC9WVnZoTCtpWE56Q3NDSFE0VUFFLy95SlF2?=
 =?utf-8?B?YloxQ0xuUVArc3liYmxNWnlYeXNnM0UyUzQ4d2tmdE9Rbk0zQVRPaGpaSmt5?=
 =?utf-8?Q?De+D5mNign0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0RVSlBRMURDSjR1eG96WHh2WTRkKzltNFB1bkN0N0tUYnZ5UlVUa3kzaUZD?=
 =?utf-8?B?OTFROUwvbkl5WnpSRi9UMEpmR2MrMEdERkg3VGR3eVk4cUJyeitpV0N0aDRH?=
 =?utf-8?B?SHB6QWNkdkJjeUM3N28xaTdIc2RRck01aGYya3d0a2gyN3RTaWpaaVNuUTF1?=
 =?utf-8?B?eFJtQUhvb1ZOeVBoM05NNjhoLzc2eUFkTkdRZUlyeFByUFo5ZWMra1lDQml1?=
 =?utf-8?B?NmZKWGZCMVdQQ2ZWT2ZaZ0JBYW45OFVIMHpzRCs4K2xSdFNOYVZ3V0Z4ZWJJ?=
 =?utf-8?B?dXZIRXpHaXZOZ3dKUzRNZkdXUzhzNjM5aERxanZWOWcvOGNkSG1pemQ2ZTkz?=
 =?utf-8?B?M2piZUxYdmV3akp1WXhaVGw5TTcvbjZRdUdzb1hBWXZ2SFdwRXdGZExpY0dU?=
 =?utf-8?B?VCtQcFh6TEV4VUgwUHdGV1JQdWQyNyt2VlViNHJBdHN3bnA4NjdHN0cwS0NU?=
 =?utf-8?B?ZGxmNWpxd0puRFhFUXVtZlRKWERjektXekg5bkh2MzJ1OCtmTjF2SHZaR21L?=
 =?utf-8?B?akZXazZDeDJnRWxTSTVQcGQ3TndPcVR2R0JlWitWZnhNSjl1aVlJVVhSdGhr?=
 =?utf-8?B?WEFtT0l5OVJRTGVtK0hHMVRhM1Y5aUhLQzBmMm1JRlk0c3dJM1NVS3pNTm1I?=
 =?utf-8?B?WmkwaEtnU1M5MFNKaUloL0t1SUhSNi8yaTN6N0J1YmV3SjlmaVV0VU1EMnFB?=
 =?utf-8?B?SU9xanJnalJGM3NLWHJ3VTFPQTIwUGNhNG0zeE80SE9xTDVQK1JwYkV1UDZD?=
 =?utf-8?B?VDNlcWRZSytXR0svcjluSGJsMEFuS0dSb3g0TUVIYWNuQXpyYVZZUFBOekty?=
 =?utf-8?B?bm44K3ZEeGVURWpYNUFhTGNTK1lGRzlsYzcxK2xGV2VlSndiYSs2ckpaK3Qw?=
 =?utf-8?B?eXh6WHB3MUpReWhlYUxscmV0V2MzWDA3SGVzd0UxUDNvZTU0UjNRQ2dFMUFv?=
 =?utf-8?B?aHBCU1pHNzhrU2ZJcXJPRkk5WVE3cmhUMjhOaVJqT1FHT0RpUWlEOFVhWEw1?=
 =?utf-8?B?Wmo5bGgwZkNmWkhZbkt4OUJ4cm1ZM0FBSXhWUWVEVXNCZnlaQnkrTFlJNFI3?=
 =?utf-8?B?dXh3M0NVS3pCSWgrNko3Z0RMRXVESHR5bi9CZE51b25GcTg0MS9rUC9jRHkv?=
 =?utf-8?B?NVlrRU9nVUdlN2VWeU12Z2IrTGVPTWwxZEEySG95L0dJaXNtRmhTdFc1bXQ2?=
 =?utf-8?B?amdxTXJld1NvUjJNZ01xVDl4bHFtcHd6RmdpL0J4SHk5UFdYU1cyR0ViT0Fi?=
 =?utf-8?B?M29aRStNUHljZDRRaWxuU0wyaWpXTEVOMGY4d1NQdWc5Q1AwSEdEOFpMdWl4?=
 =?utf-8?B?MkZWR2FJV0tkdUY1bEp6UUcrY3hZMmtsaDNSWndpbG11c1dxZ1FSM1ZjYlhN?=
 =?utf-8?B?UUJwemxTNHZIUTZwWk9lTVRValZUT3NDekdFcUZQUU9OOFI2KzNPNU16VjNM?=
 =?utf-8?B?MS8wUDJ2dkJrVVZ1ZFdwM0trUlVRQTBOS3Q4QTIwODJUS0JadXl1WGxkTzQ0?=
 =?utf-8?B?VHowNkFpVFBacm9UVGV6a2JNMWZqMm42dUNVOWNMZWVpUzJZVG1TajJ2V1Z6?=
 =?utf-8?B?cjNScnlWcEdiUWpzVmQrcUg2WnFrQXRRVWgrenNQWHpiRnFkMjRRU0NqWE9I?=
 =?utf-8?B?c2dQWWZqRTZER1p6TWw3TUFmSHU2bkJDMGE4WnVlclhkMHNkaWZyNWVsMW1Y?=
 =?utf-8?B?SzhNVEZmcW1YdWk5QjBtMHpZU20zZHZneWJrRUhxTmJHeGhOM2Izc3pZSmdY?=
 =?utf-8?B?NWViK0hwNmo5Z3dEZHdwQzVHRit5ZFJ3U3QxWDViUnF4NnNOdkt6elZuZHZK?=
 =?utf-8?B?elZzblRoanVLQkRtWXRJRW1Ha2psRlVrZ2Z6REZ6K1BUTHpjZ3BIVVpBeVR5?=
 =?utf-8?B?UFFHVlk4VHlJMld0aUoxWmRRWitvNWlRS0MwdWlSZVVLRUdoOUU1Tk1OVkVp?=
 =?utf-8?B?TVkwZktvbVQwdWV3VWRkT2JESXVEUTc1ZzhxdkliaXpubjBXbUJFc3NiQVI2?=
 =?utf-8?B?cFdwVWtRYWFESWFKWGJtWk9GUkxwYnRFRGZvTWk3RFZqTitaOVZlWDF0MTFm?=
 =?utf-8?B?RWpxYmZVWHRSUHFCdHZocTdWUmRVdUM0d3Ivbk5KN3VvTkp4ZjA1V1VYRE0r?=
 =?utf-8?Q?HfLhSeDES7yeamLtzUmeMsnCR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbf66fc-33d9-497d-e43b-08dde9402f19
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 10:13:23.5527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40GD+zVZC34wEo+0x4R8/RMz63Nhpjdh6pkwUVxpfzMDYEezjkOVB5Hrnk4SxdeO/sDdp6S4FNR3DqrHWWhvXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5689


在 2025/9/1 17:07, Geert Uytterhoeven 写道:
> Hi Qianfeng,
>
> Thanks for your patch!
>
> On Sun, 31 Aug 2025 at 10:50, Qianfeng Rong <rongqianfeng@vivo.com> wrote:
>> Change the 'ret' variable in ma35_pinctrl_parse_functions() from unsigned
> sh_pfc_pinconf_group_set


Thank you for pointing out my mistake.

>
>> int to int, as it needs to store either negative error codes or zero
>> returned by sh_pfc_pinconf_set().
>>
>> No effect on runtime.
> Fortunately the issue was indeed harmless.
>
>> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> Fixes: d0593c363f04ccc4 ("pinctrl: sh-pfc: Propagate errors on group config")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v6.18, with the above fixed.


Will do in the next version.

>
> Gr{oetje,eeting}s,
>
>                          Geert
Best regards,
Qianfeng

