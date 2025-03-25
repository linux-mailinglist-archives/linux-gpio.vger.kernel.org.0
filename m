Return-Path: <linux-gpio+bounces-17931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA3A6E96F
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 06:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1B1C188AC12
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 05:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63C2221717;
	Tue, 25 Mar 2025 05:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="TPZfPQ+p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE62233D98
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 05:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742882353; cv=fail; b=i7vfPYXnNA7h9ssEea0enirNyllPd5aVHbeuELsrhjSTqnj58TWl7tt4G2b0a8XxQCu3ycnMpI9p4X1pl+cYbtdqvMTZ/35Wah9EFKCQq9Jp++RauV2IFQ5cIx6UxE7+LGv+qZ0/7BnJQtpD7okd4yCmsrRqeMchK0mILuyCOQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742882353; c=relaxed/simple;
	bh=CjxLLqJ7qSuUAX2UUydvrwYlp/B5wRKDr3osm5m7Bdk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mVnFkiYnnt/c9cNGM67U0INgoTgODVH96oRfv8dbMEMJXP2LqdSO6v9x2nxrDm93Jk3KtNYbni4ZwhW/XX0hkLw8yN8CQN7OC2oiVb+WMMRzVbWrOrl/ms/wjUaP7E6GlSsrnxmIMuEILwulXq6JMw4hVEN4kP0pzeflBQecAN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=TPZfPQ+p; arc=fail smtp.client-ip=40.107.117.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOrYbVuwqspgcc+Zwjl9ZvFsSx4skmYOJ2CGb7gltHaw4vZXlwcYV1tLl6AA+ZxKHHQ18gLz/eR1GMCZ+BYk+dtZUsX9eTb38dRAcE2QlO6ThOgZ+5lx7VpfyPIfbqdVs79pfe65Oe2xutZzTQVHmvLaiQynSRN7+RgoYyogPbjd6qqz5wrfon/6FFF1AoIMP1chJrHki1fAQb/a8Yx6YU53sSFv29dasqji375/mzajzdijFTy5BlQeG3t9SqT/BeHyf4rAFYo0+w6se/p6kL66Xbe+rbbqZo7a+uHMEhz2EFNmgt1ORALbIvI33w6TOZPPlGl4eF/KqJAfvubArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cU/qZwn4MsdKx2wii2xEv6Bwsu6r30qTJuRLtSWZfEs=;
 b=xkLbl7DZkMFcV5dadGGJiLjj4AEMlPom4/t8dWMMeMJP8Z1KBAuFogYSDLKUDlJw03fklFyR0MZrMluEbHjm5VojDV5g9KdfOIhq88QU42QETlLA0eHwgX0cqmXDMphdsIZj+DgMnZ2H9aXKZ3JQcqR8UQuQiHweZfYAbqlSydX0LAu5I/uEg63+Xrql1M/LQYE60G3SqYlcPi5n5TZgSrGoBJH9fkkFSMsapC1LOXCZNKJIivfPOcUGIKXMUn3tXK7FLNia1A875YlOUjuX4NGbghWLWz/Aa6z5xuRaqXTD+sAd3uo5lK1GJxvTYYK0dxiY0gAzmMj5SV9678SqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU/qZwn4MsdKx2wii2xEv6Bwsu6r30qTJuRLtSWZfEs=;
 b=TPZfPQ+ppMbQ1sHNRQFcRbhQeVy8+7I/BJQwsb+i8fQDFzU5I9RH4pspMtrZQcrESTSQLxk6FV3Fb7tCBK6Y9hqxE/vU2jltMOD4Q5eKn8L47Oyb8Yx46rc5lKuoqfGo/KaZjj/ChfKk4xaeykjkg0LWVxvvsTgWcNlOzsjGtZ/OyyUlJ4cIAc4zZXN3J0j19kTIWeWk7xsQ6HJ2qpDHSnrYwKXVuosC306KPynXYFxPTSEJDQpd5PDtMgfZgubx5ppakXH0jGu3JGnL25PyhoBdhmb6dS4Uc8xfzEOUN6OcwaXKcoaQu6OYoonrcZJk8syKqjFcJsiWvSIpIbgXUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by PS1PPF13FF26649.apcprd03.prod.outlook.com (2603:1096:308::2c6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 25 Mar
 2025 05:59:05 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 05:59:04 +0000
Message-ID: <965df044-50f6-46a2-9471-0ab355378e16@amlogic.com>
Date: Tue, 25 Mar 2025 13:59:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: amlogic-a4: Drop surplus semicolon
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250322-fix-amlogic-a4-v1-1-bd5ccf9ca1bb@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250322-fix-amlogic-a4-v1-1-bd5ccf9ca1bb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::19) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|PS1PPF13FF26649:EE_
X-MS-Office365-Filtering-Correlation-Id: f30eb319-c567-473d-6853-08dd6b6225c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REFGMWNGcExRNklLVEhkL2hDQTJKb0tnY3l1eUtXUExoNm5hN1dLVHZ2aW9o?=
 =?utf-8?B?bDZuSmhEVzQwWFU5YXNaMHhrRHRkZzBrTnRXUFh4cm5JNFFqRUNWbVZ4c1JY?=
 =?utf-8?B?MytaL2QrMVlvUXdpWWh1THBKZGYzampyMm83bHIzSE1KaHVjV045K2VkYUxi?=
 =?utf-8?B?WldmWjk5Y25sejZ3dWNjVG9BdHlsRENqRldZRE92VDVucmhRTEZ0Q25SUmpL?=
 =?utf-8?B?N3hLdmt5ZUZid3M5VEV2UDMvd2YrSEZwUC9Zak5YWUJXcGRCNStXbGw1VWtw?=
 =?utf-8?B?bEIzcFZOeVE4ZHpkVU53OVlGL0VVU0J5MTdJWmkyN1FTSkRpSjJWdHlmckx3?=
 =?utf-8?B?VmZzSUJVOWRDclBZUDNrUkNhdURuUG52UEpJV1M2RzRXUmpuZ01IUExGYVIw?=
 =?utf-8?B?U25JcXVSRklyQWx1Um5vV0ZhVDlaR1RpeFZab3loeGJPbDBXWHNjNEJmTnZH?=
 =?utf-8?B?M0xTSWpTZVVtMWVDK0V4a2NNQWNWK2RlN3l5UDVMa21sNmNiMmIxaVFUMk5o?=
 =?utf-8?B?MGRDTWxmY0hVN1haVDBZWkxtS2NHaHovOC9LRk82UEVaa3pUOFNKUU5ZM05L?=
 =?utf-8?B?R3RMdzhOcTdqWmxSNFNsWFNjVCtoQnJFcytScUZQRmh0bzJtL0gxZEloV0xo?=
 =?utf-8?B?cEFFUHBBZkE0YThUdTNocU9UdDFuZjJRMmF3dkQ2VWJuRzVBYkpWdi9UNFFB?=
 =?utf-8?B?eTlranNPVy94SmIvUU5oQXhKZGhZV25wUGVvWHhRYnVna0hzVnBOWjB5bWlp?=
 =?utf-8?B?VkpOZ25UanZYR04vRWxkbGd3QmhncjBlZzIxOG81ZzZTVUM5K3dDOXRGM2gr?=
 =?utf-8?B?SkgxVCtlNUp0aTJ1OWJOU3U5Vlc0b2JWWTNlSnUrU0d5ZTlJZHE4cFVMQkNL?=
 =?utf-8?B?RCsva3k3RzdRVUZiMzR1ZXltMlJzZjVrRTVCWW1XU2hGaStiZFRLTjNQNFlv?=
 =?utf-8?B?bExWTFZpQUlTNExCZ1IrR0pERkNyc1NXYlErRGlITjArRVJpelR1ZGF0Rjls?=
 =?utf-8?B?VEd6VWRNSm1HV3VxWjI4N3JmZFBpSTV4dkFpUXJHRVhsMDZ4TGEreXNwb0Vl?=
 =?utf-8?B?Z2N6OWc1dDFxQW9YakdkbGtWU2hhYXduY3B4MVZwN0Q1Tytsc1ZYYTRoc01w?=
 =?utf-8?B?Um9NMTVjWkE5RWh2b2dHV3JSNFk2Y0dod2tvVDVkT2pLNzJ2MFJTaUVwMU9H?=
 =?utf-8?B?TGlLLysxMVhoZ0h4ZW5RUzkxbWJwSkt5eWtSWitQWXRTd0ltMlJNZ3ZTaEVl?=
 =?utf-8?B?SGVvN2RRSzlKbXFYVFVTTGxUeUFFSld0TGpBWFBWN2tiZVRmYkZIQXlhbnlC?=
 =?utf-8?B?dm9VSHA2aTByZnRLbm1sTUpiTi9oKzUveTVnWCtrbkluTW5kNzJqcEFDaGts?=
 =?utf-8?B?UE54ZzI1VTBkQTlHKzRNYktMNllkYjVDS1R1Nkw1alRIZ3g4NXdVYWNHbElu?=
 =?utf-8?B?cWlQaDdwd2N6bGtPSnJDZ1l2YzVJY0gzUkFpUlFDdHBkZXhUWHltY2RkYk9P?=
 =?utf-8?B?eEsrSTB5bjJKblpQd1E0U1lCb1U3YmFNTFVQbFQ3TW40RHRmckNrYllSZmhx?=
 =?utf-8?B?NWtBTm9Ib09oallMU1FaVTg2dTIvZkJuZWVCY1EzSFhCcTlGaThFWlJ2SE1p?=
 =?utf-8?B?clV6OEZra0Q5WVlXWk1ZZjYyK0tjczgrb3Q3NEgraGMwSm9kdGU1aDNPNVRy?=
 =?utf-8?B?cFcwZ0d3MjBkOUREZStGcmswdWt0ell3aDhYS05EVHVHWXE0ZklhK0NTNzN3?=
 =?utf-8?B?ck16T0tGZm9yOGJsOUllWXZrYnRqaUgwNUFUQlR6NWowWUtZeEdpVk9Jd1d4?=
 =?utf-8?B?eFhEb0FyWjBiM241NFZrcTdxa1pLZHh4ZEhxdkxjaldzSUVIN2JwTGZJelVX?=
 =?utf-8?B?c0J0Vlg3RGRZV2R3MngzanRDaGxSdDFnL29pWjZod0RNRTZDa3hSczZieTFk?=
 =?utf-8?Q?DzcRbHRbzCg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXc4RllONGJ3bVFkd2JDc0p1WkRvci84OFVacUpuNVhnYURJaUdlNXVoeTJ3?=
 =?utf-8?B?dzZYbUVjdlNmUzBoWWRhVytaSk5hMHlVbjZGR2ZVTVpucUoxWnRicnp5d1li?=
 =?utf-8?B?bWhwZEFwbmVFeVVmeEdwdHJGbEdyYWJNUXRWWjZvUml3YS9hL05wd3oxMEVz?=
 =?utf-8?B?b2p0Mis4NEg2WlZuTjg0aTNKcW9sVisrWTk5MnNLbnFCUDlKT2l3bWRINDBG?=
 =?utf-8?B?L05Cb1ZUMkp6TVFqcGxvN0RvbVJFUFowU2trbWdHUW1pc0t5SVZvTWJRYU1O?=
 =?utf-8?B?QzBITFJoM2pmWkltYzVWTGlQZVM2Vm40VDd4bnVnT01nSEFxRzdNcDZWYjJx?=
 =?utf-8?B?M094YWwxTnUxQ1JrajdYcUkwUU1EM2hHRGdlWVBFZnp6VWc0VjZpUGdhNFNq?=
 =?utf-8?B?ZkhIdWRMU2o4RHZxZGFVSzR5VHQ1djB0RExDeEpGWEt4TS94RXB0eERmWk1S?=
 =?utf-8?B?UGh6aHFqS1I1MVFzY2xiaHh3TUx3WlczSFF5b0pnZ3Roblk3SHhjeE5LN0Nw?=
 =?utf-8?B?aFlELzBjWmZiWmJpNUpFSTV1WDNTbENoUDM2QjgzL2s0Y2hrQkJkNGFwT0Zk?=
 =?utf-8?B?OXBMTlpXWWlQcGdIMVpoK1I0d0l1WE8zN1RNVXhyQU5majJkNGZHdE1GOHp5?=
 =?utf-8?B?aGV2cU1zb0tYbG5udXE5emk0dUo5V2xhSWc2eU13K05ia2E2TDdnckVLbDR5?=
 =?utf-8?B?YlQxUVJKeVNYeVIwV1BMYnBHMzZ2OThjS0trUjRRVXpNYU4xc1dPWVhpSDY3?=
 =?utf-8?B?R0JJRWd6TlJEVmxDTElzQXBLU21XbHowNGJmajNHNXJJMHRoSFdvdHhISVJK?=
 =?utf-8?B?YUs2RVlITmNta09NQnpZeWs2MjJFRVNrQlR2b3duQjAvSFgzRnlVYkVqTkR4?=
 =?utf-8?B?TmhnVlZ5QVU4dDNqV2dwRkpESndBeXZHWXRubFZqK1ZFVkVpbGdMelBoRUVy?=
 =?utf-8?B?dmttUC9aOE11bE53U0JUNzJ4Qzc5a2VCREhsU2dUcEZ5Y1Nad0tTempEQ1A5?=
 =?utf-8?B?djc5Z2YzSTRlbzM2cHdNbzBlcVpmRkxpQ1VTMFNCWENPclh4eVZ4NGQwU1lX?=
 =?utf-8?B?a0w3Y1hpc3UyYVl6a3Nlb0JXd3VYQkNQelJ6ckpLN255TDc0V1RiQU9UMTJx?=
 =?utf-8?B?aFVsT2EyU1luR2Y3ZExrZVF6OHoyeG9DMzFuTFBOV25EWmF2Tld0ZVpGY1Va?=
 =?utf-8?B?NVQrdjBCYVhxTklPUE81d2xlcllobEZqOGR3YWZMclA5TnM0NjVNWEo3M1dz?=
 =?utf-8?B?QzBWM0Z0bEpXQmRWdkxoczhiVTJjQU04TnlGVUo5aWNvbE11UlVvRDN2UEVS?=
 =?utf-8?B?U3k0S2tOTWRydk9YUkJULytzcXdsSEFjaU4xRk93Z3FoTVV3WC9sNytGYzV2?=
 =?utf-8?B?L1J1WkFrVk4wMUNFb2xlN3ZFWmxNUE4yWVBKdjAwdGd1T0JNQmRscU0yaXhr?=
 =?utf-8?B?a25PdE9aUGpkV21HOS8xL2VVVWp0OEp6NGtLMkQ1N212ZFdUY3RsYndrek1L?=
 =?utf-8?B?ZzNaR2dReVRIRE1KZUJNOEc3TVV6d3dFOS81UjVGOWJJMUVYOWp1SVpPcDFy?=
 =?utf-8?B?cTk0QlhQeTNRWDU5OURvdkZQc2NTcTlOa21ZOUlNV2RWUGZHT2c1ODNiMFdj?=
 =?utf-8?B?MkEvNExLVERnOXo4Mmk4VnZrQUc1QTFjUENKVEtwdjh2WmdtRm5Dak04ZFhr?=
 =?utf-8?B?SDFZK0x5aU9kdjZab3QwTFlUMm9yVmNVajBkMEVxYlY2VzdRRW9jMEZqRFhP?=
 =?utf-8?B?QkNGZU1UZXhwWEpBaVowc1FqKzBqU09Qcm1sV2xwUXRFRXI5emxJSXpkaGI2?=
 =?utf-8?B?bCtHOXIzTW1oSFlZbGxXWXgrZW05dWx4bWgvaEFTOTJVTmZFRHliMU5NNExk?=
 =?utf-8?B?cVdVWFVWekVUQXFsRnF0cDFzaThyalN3V0pkbFA0VHh0cU5aTFcyWGU4c2ZI?=
 =?utf-8?B?aFl3ZTArYmtrVEtXdkQ0em9PYjkydWlPWFZSVEpacWRFTFhvQS9DRWNWZ2Q5?=
 =?utf-8?B?YktYcFd4R3pXcmZLNXZXZHpSdmIvRVlScnpoYUlyc1lyZGt2MkoxcEtINUhn?=
 =?utf-8?B?VjNiaHYyMStUM0wvM1psY0x4eENPZHp6TWg2alROQVR0QVVQMlo5dmRYbXdM?=
 =?utf-8?B?ZFJEblU4Z3R0YmRmYUhYNEI3MmN2ZjJ2RkU5Ulhvb09pUnpUSHphakQzcnFM?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30eb319-c567-473d-6853-08dd6b6225c0
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 05:59:04.4024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3erIrZ4daZZmRXr6NnfTaSP4EeSmOGCC+R3Ih8UwZffyEvE0TPZhTfBDPCww6a4VgQSHuIfzz0jDmMKpGAqSAKLiz5epfwMDSeNNWiHEG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF13FF26649

Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

On 2025/3/23 04:41, Linus Walleij wrote:
> [ EXTERNAL EMAIL ]
> 
> The kernel bots complain about untidy code found using
> coccinelle, fix it up.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503212354.Hx2qaDRe-lkp@intel.com/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index 35d5540b8eaa2378197d7791ef2470ca6591f693..ee7bbc72f9b36c0c6d5bec76780711f9db3c155d 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -856,7 +856,7 @@ static void init_bank_register_bit(struct aml_pinctrl *info,
>                                  break;
>                          }
>                  }
> -       };
> +       }
> 
>          if (def_offs) {
>                  for (i = 0; i < AML_NUM_REG; i++) {
> 
> ---
> base-commit: 693c9ecd832669c55e8d8067eba064440d9a4709
> change-id: 20250322-fix-amlogic-a4-55a05e1402d5
> 
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
> 

