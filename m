Return-Path: <linux-gpio+bounces-6240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE5E8BFCB8
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 13:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A6AE1F21CD2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 11:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7087A82D64;
	Wed,  8 May 2024 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Lq0ap9sG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4833E81AD0;
	Wed,  8 May 2024 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715169310; cv=fail; b=Z3MwXYWEQTy3iePI6FP0XAxNjWP5UV3o8wlWg0uVEDM0I6YeXe2yfDjW4wa2UBl0RP6bGGWC7RXe+mUkOy5Izcb2/Rwhx52hdb+PkiXB/GJU97hbzHUvm5fyUrjCqAsxY8ie9Krl4UAxSb+wwyl76Fauxze41B+0dIXLs/Ek9y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715169310; c=relaxed/simple;
	bh=4JK7YlbDp3soJFfiKEt0hkgAXdRqIHygGzMCiZmrfkc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rn+7PNWVhdbtJHS+Cup+kEH0bkBsJoaX8o24lkIlhs6k5AmgU0iumefAd1upjn+FJ5QVLu8Y0BCi7IRS6A/xZu23nyVM5JVEnbxqaXZI9hS8LzcW/bMdL26u52eLg8JVOU2jD/EBUd295Prle4Ub38p9QXbkuIYUsR4i6Whf6XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Lq0ap9sG; arc=fail smtp.client-ip=40.107.100.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOmBPuCusXJG6lSc24qjZ33teetRCxKyaMeyMIO+VuD+k7sYx5ksYiQlbQ3Zr2XaDSholHDj5z3tuP+ITs4AwzrDRm14MWLFTFbeoETG0zIiSl64BHyu5l7nsN1WVuLpWKU0Sjz4SOmlazWR6DmrC0bKYnMFAmk4QsmK1oGG6zVPZCIhV2AB/vuEPt2uN3FA7g1rpIESOjahWz2urqU1wasATezlDP2JsMIH70kD9ZcFSTZ9fFnMThkh1Sa1/Bp2ZYlZpbjL7i6JuzBivouLqG9hlOj1D6xnhe4hEIHBP1UaL5mLZ7rG1vcmyGbytHks7hlUwgAu40EFKEh2BvED2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpHSeOSzLROn6ukpnAreaoSVt3qu6FpWK/IOQ/HGnhY=;
 b=jZMNIwTdlJmzHFcJtafX+JHsh4N0fuR0f40Bl2HC5gWOkbevvh/8TA91M4iJN9/yfapvNFH+VbjbfakoSftU0ufnocgBlQLqlpoloQnRQ7mw+1dWHvgYp5HQeDHTaYF532hY6JathdcomL/V96EkRKBRzf/u4d5As/m1kYAhKrVl2vVDcVti/Fbt/25r9E+WJskUaZrVcXWiFvGS30+9e8Mvswa7wpZKAiCqNhvpXvFr5mbIoj/xtWfQX6cPJHnJFjCa/GHgn7XA7ikJDyk7J8/swvsjoLZP57GCDndkHgV9T+ZRq4AVtmEkOEJORTEdVx/wGWMJXrdkLySC0OQx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpHSeOSzLROn6ukpnAreaoSVt3qu6FpWK/IOQ/HGnhY=;
 b=Lq0ap9sGu+ruMBVQejo6BaxlVuIiSuWA4D7q4THu3A6Q9UEEQlubk4Hiqmk80GlZoBfz2pS5wIB87T4sxltOTZ9EDeX5oYDXyUk8UCqah0HRoXo1fhJgZwbF9FxANEFOSHbSqxECyuUstim0o5istuCaOFLiZ94liRpQgLE1580=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Wed, 8 May
 2024 11:55:04 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::c3fc:3be9:dde7:745f]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::c3fc:3be9:dde7:745f%7]) with mapi id 15.20.7544.045; Wed, 8 May 2024
 11:55:03 +0000
Message-ID: <d64eb924-0f12-44c2-98e2-5e682292645d@amd.com>
Date: Wed, 8 May 2024 13:54:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pinctrl: zynqmp: Support muxing individual pins
To: Sean Anderson <sean.anderson@linux.dev>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
 Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20240503162217.1999467-1-sean.anderson@linux.dev>
 <CACRpkdbOAoSDNFhXfz3djUZh1_MQ_T75CC+-LmojRXvyCbUusA@mail.gmail.com>
 <06a4e5fd-3d26-4923-bcbf-0bdd66d756c4@linux.dev>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <06a4e5fd-3d26-4923-bcbf-0bdd66d756c4@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::25) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 204703cd-65f7-44e7-ade1-08dc6f55b27d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGoraEoxSVBWcVNxd1RJa09CNUVyVHFVcjBZUTIzM0gzenRSUTJGVzhXSEVZ?=
 =?utf-8?B?RlZJVEE1UGpXdHRTQXZnWkk5RExIZ21jdUIzWTRudk1BMlRpOEhNSW82VnBo?=
 =?utf-8?B?d1k2SVJjYnVXQ3JwQ2FYTDN5Q0JzU252WnJvdDF0bTZsSHgyZjQ2dXl3UDlM?=
 =?utf-8?B?TkVSVEJGTDRiOFhuZERkUGxiblpZVTN3eko2aXdLWGl6T2dqSmh3YUNpdW9G?=
 =?utf-8?B?OFJScVFCbGhtQXJSMGlHYzFPYlROb3l5ZDh6cFVIM29JUmhZTVA1dTVZYWxD?=
 =?utf-8?B?aEdicmFvT0RzZnBUSlJWQXk3eVJiMCtxYjhuNko0Y0piYWxnMGRjOXhjRXdY?=
 =?utf-8?B?ZUVjY2pCL3lMTTF1WlJybkZxeklsL2d0S1U4TzYrVlN5VHVVTW9wSTdQLzl5?=
 =?utf-8?B?VXVSaHNhSm1pSU03SnpVRzJYbDRhS2pna09ZU3p5Q1B6RmZvclBMV0Vpc2hE?=
 =?utf-8?B?VUx2RXBYSDV1bXhTdzl6cElMbHFURm0zT2VRaVBFRFZaWUZlS05Tc0NuckF3?=
 =?utf-8?B?eExyZFhwWDJrWjk1aXoyRTlHNkxOdTdIbFhRU3VRajZ3NXBjRTkwU3lXcXBW?=
 =?utf-8?B?R1cyZW5vR0F3ZEMyT2RrOE1Kd2ZZMmJmSVNuZHIyMHZpMXY3bWNYdHl2T0Y2?=
 =?utf-8?B?RUVNeUlrNHU1dVhvNG1MWXFsbk8zb2p1aDRGamQ3c3d6WlpzZHQ2dmMvbVJ1?=
 =?utf-8?B?MC9RRGx1UzhHeWZydGhzVWZjTGIwcWJJa2llWExBelh3MTF0ejNjTi9LODIr?=
 =?utf-8?B?KzhlV1VLOFdremhIRGY5dlpDWk1ZNWNNTEQ2ZUZ6RzBFVU5zQUFwSGhhdStH?=
 =?utf-8?B?b0tOUHpJTHNpbi85VGxvV1luOWt1anlZSHBONlhqbUUzK2RLWU5SZU9wQ1Rq?=
 =?utf-8?B?dTJEVkdCRXB3NEJBMHVhc3hlSWhGNmhDTkYwYVRhcWl1SG9ESmlpejRFbW9z?=
 =?utf-8?B?eDg4MkFqbGtqZHo0NGVwREtjaHhPeGxPU0xVS1I5Y0JEclVybVYwNHExdVZz?=
 =?utf-8?B?NDNmNG05TjZteGpPZFFQak9JT1FYbGg4N2tIeDJzOUptYnR5QlFRUFFuUDZh?=
 =?utf-8?B?SlpmaWl4SnpQSCt0QUpoaXp3ZUJ4d282VHF2ckFKdFo0ZkFkVkpTdk5CSGgz?=
 =?utf-8?B?aSsvd2dOWUU1Y2JPMDJvUVljaUkwVC8rUXVadjEzUWZYU21tUXhRbnZoOFpH?=
 =?utf-8?B?ZDlsUlJmUFYwbXJIbkZoSTEreVBNS080RUhCdlM2NkMranNCWEVnNEQ1cVRG?=
 =?utf-8?B?T1ZrVmJRMXp5MWVjWjNKTm1VcTJBYTdLSEcxR29MRzhOUFZZTW80ZU51Y3V2?=
 =?utf-8?B?VnlYTGJVQWl0bTkwaCs5UGl2NGpBV0VCNFNNVHFGK3N2UkRHOUNRbCtKZkhW?=
 =?utf-8?B?b2J6OFhsak1mVDhYdFp4UHh4NzNtMXFicVpzekdJdHZnSXI2L09FdW1KdFhX?=
 =?utf-8?B?My9yMmltWnNzOEI4Q3dMcnhzYU45YXJjckhBOStWMWtCeXJ4R3g4U0szKyty?=
 =?utf-8?B?TXFyKzRkSi9TZCsyOFdVS3NUYWRiaHllYi9OcUhtSzlIbGRqbm5mczRGU1cw?=
 =?utf-8?B?SE41Y0pNMDVkVmNldk5nMzdNMGVHUEQwUW5ZSy9BUTdDNU9XWlFYWjloNTMy?=
 =?utf-8?B?Rno1RXdtZ2dCdHBuSTRPcndkYWJkRWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0V4ajBpWXc0a1Q5QWxrb3Z4M2dKdUxOK1AyVUV2NDlpb1d1M05EenBzMU04?=
 =?utf-8?B?c2tOY3hNblRFOFJyK1lOQm5EK2RUcEpjeFpMUkJRYmE3T3JXbFFQaGJFSUJq?=
 =?utf-8?B?RE5PZFo0WjZWeEs3QmliZ3JSdysvTTdLNW92UDN4M1A3bkErTkJlUkxlalJi?=
 =?utf-8?B?LzBvZm13RDd3enV3cWFTU01tLzNseEVtR3JETkVZcCtUN00zRExBbGZ5NXdl?=
 =?utf-8?B?RytXK2k1dWxDcGQvSnc2M3hRNld6MU5oTVpyMUNwaFozTDNlOFJpWEhJYW5x?=
 =?utf-8?B?RWNBZ3M2VUhxZUNiZS9lNWdPa09rNkxYczNZQ3FRUGtXTHQ0b0V1am15NEtq?=
 =?utf-8?B?OEVZWnR2TE9rei9ORnlTVUZ5VUZRUmFyV0J2OU1JRWRHZk9udTJaSkNoOVQr?=
 =?utf-8?B?VzAwaWJpa3VEMHMyNmFUUkdiTXd1MzFONmNoUkJlZ0did1NhZjRZOEJTdFZE?=
 =?utf-8?B?SmltaktQRGtwZGVLS2tNeGJEZmpOUTBCMWR1bVRCNE5WQnpDZ2FLLzA1VmYx?=
 =?utf-8?B?eCt1UjZXeGRzK2dxd2F3bWludlFweTA4LzAwNnU1RHRMaXNLY0JmaFRmalB2?=
 =?utf-8?B?OTM4NXFvc2NkRkU5clFLL1lHZ01keVpjR290ZnRzcHhiVVlVcDM2dDlWMjVr?=
 =?utf-8?B?WVFtR1dKSElVNmZXbi9DNzh6Y0U0cVdtMzliL2o5ejBDRkZiVEZZQk0rUzFL?=
 =?utf-8?B?YjhXeXNLRVhPcXAyZHRNSFA3YUFtTEptWEhhTUtrTm5Rd1E1aE52WFRHbWdF?=
 =?utf-8?B?WEcrWHROTUsreWdRaThNY2ExRzgvbmUyRzY1UTFLcVdKVHBETUpCYjU5N0Er?=
 =?utf-8?B?dzN6ckpJMFlOVkczQ25xc0dRc3pEdzFOYjBXRVRMR2o2RVltaDhxQWdCMTMw?=
 =?utf-8?B?b3ZnQjdqYUtvenpQZWNBSDVCNjNuSkVjRVBqYWphNkkycStGbC9JNUVzblBh?=
 =?utf-8?B?SDRmQk84dHlpMk5jMXVZVUdFekdoMG9CeVUwOUlwTEppM1ZoVVFqeEl5cGd3?=
 =?utf-8?B?VWI2cmJJbHRDV1oyVElqakdsd1laOUMwQTNEemJac3dnclF5Y3FHak9wcHJT?=
 =?utf-8?B?RWp2eWVYUm9aMkJRU2JEREl1VmxaWTJ0ZmNqVW0vSE1OTFBPTDhJOUNUUnlP?=
 =?utf-8?B?TW02UTZVRTF0dDljcytPSDlYcGlXa0tpZ3dwZ3BWU00rTWlOamtxUS9KSnV5?=
 =?utf-8?B?czQwbU9TRVpDYnpiR2QxL0lYN1JQRGt0bXdOVHMvQU9BWHBrcjBaQjdWL00z?=
 =?utf-8?B?NHdyaEQvajYyRmVHRzRsZzdOODVpSW90UDk3WkcvWUdWSjZubGhOeHRnM0NM?=
 =?utf-8?B?OHpjNFhFcENBU2pUZy9DT1pQMHE1Vk1hMk1qTlk3YTZRZVhBMDlYempqKzRE?=
 =?utf-8?B?WTRyYTVxNDhIZy9YcEdTR01qc0M4OFpsalRLSnFlMmFVTStRKzE3RWxvcEgw?=
 =?utf-8?B?SXhsdk45b3dqMmhLa0V5OFRvdFUrQW10WVFPcjVYUkNBdUo2ZVV6bU5MMmdN?=
 =?utf-8?B?TWorcEhCaTdqeGZMb2g1SjBJWVRERmpXbTdRbUtEcFVIc1FqZHJ6WkUvak0x?=
 =?utf-8?B?UTh6YzB3QnltZS90OVQ0QVpSdlNXMXN4d2NabHdTYzNCS1Z1ZUJVZS92RDBL?=
 =?utf-8?B?UzBOSVNRRUF0RVhUMWhJa2hLbHZiRitTclVwOHhUek1yL1BPOUtmTE1GV3RS?=
 =?utf-8?B?SlVweUtvNXNNRnp6WDRoL3BjYWdPdmYvSCtQQXMzVFRwMWpVUzY0ZXFGbUtP?=
 =?utf-8?B?WVVTVittOXh5aytpNDRBM1kyRURvRFNjeWdoNzJLRjcxbzN6ZlZBMUt6MERK?=
 =?utf-8?B?cVdwUUNMR0NKRkhYRXNMOTNPYmF4dXhlUXRVTDcxYUR5b0taeFVLZGprY1Rw?=
 =?utf-8?B?VEc2Y0ZNK1V3UXZLOUZkK3ZwQUtDRTVPL0RwdWpsVTFkMFZ6cVhhMTM5YlY0?=
 =?utf-8?B?dGxKa210K2FnR3d1aXJJekZneXprU0tTK09QS1ZUYmVFL3hvYjN1Q25oTHV4?=
 =?utf-8?B?Nmh5RVlPWTlCaGsvWW9wYnVPVHhoeUhxT3RaTUJqWEFtazkvUDhsMDU4dGJq?=
 =?utf-8?B?OUZnV0lxMGZUQjJzY0cvVjQ0WU85NzNVbEt4dWFCSDVnb3JFcytHKzhTdGd2?=
 =?utf-8?Q?ZVO2l6FKqRBTRwcEX4xwBg7K4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204703cd-65f7-44e7-ade1-08dc6f55b27d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 11:55:03.8312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ovfpq3+7sXjHXfcVK63C/nuPSO84P7aY1vCZZ+t+0C9VJZctRHjmJeaxGHA2oyfn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603



On 5/6/24 16:45, Sean Anderson wrote:
> On 5/6/24 02:43, Linus Walleij wrote:
>> On Fri, May 3, 2024 at 6:22 PM Sean Anderson <sean.anderson@linux.dev> wrote:
>>
>>> This series adds support for muxing individual pins, instead of
>>> requiring groups to be muxed together. See [1] for additional
>>> discussion.
>>>
>>> [1] https://lore.kernel.org/linux-arm-kernel/5bb0dc7e-4c89-4f3d-abc6-41ae9ded5ae9@linux.dev/
>>
>> The way I usually would recommend to solve this would be to
>> define new subgroups, so e.g. for a UARTS:
>>
>> uart0_grp = pin_rx, pin_tx, pin_cts, pin_dts, pin_dcd;
>>
>> And today this would be used like that:
>>
>> mux0:
>>      function = "uart0";
>>      groups = "uart0_grp";
>>
>> Then we realize that not everyone need all the modem
>> control signals provided. What to do. Well this:
>>
>> uart0_rxtx_grp = pin_rx, pin_tx:
>> uart0_modem_grp = pin_cts, pin_dts, pin_dcd;
>>
>> mux0:
>>      function = "uart0";
>>      groups = "uart0_rxtx_grp";
>>
>> Now the CTS, DTS, DCD pins can be reused for something
>> else such as GPIO.
>>
>> I *know* that this breaks ABI: the driver group definitions change
>> and the device tree needs to be changed too.
>>
>> This only matters if the users have a habit of distributing the
>> kernel and DTB separately so a new kernel needs to support
>> and old DTB. This varies in how much control we have but I
>> think for Xilinx systems the kernel and DTB are always updated
>> in lockstep, so it really does not matter?
> 
> Well, the pin groups are actually defined in the PMU firmware. And
> frankly, I don't see the point of pin "groups" when there are not actual
> pin groups at the hardware level. The pins can all be muxed
> individually, so there's no point in adding artificial groups on top.
> Just mux the pins like the hardware allows and everything is easy. Cuts
> down on the absurd number of strings too.

That Linus example is split which would make sense but as Sean said HW is not 
really working like this. Because you can actually take tx from group0 and rx 
from group5. You can't configure it in design tools but you can configure via 
registers and it will just work fine.

Thanks,
Michal


