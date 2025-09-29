Return-Path: <linux-gpio+bounces-26650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C535EBA83D2
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 09:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE42F1C0AE4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 07:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1C82C0267;
	Mon, 29 Sep 2025 07:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hfSd/C3x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012026.outbound.protection.outlook.com [52.101.53.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D420253351;
	Mon, 29 Sep 2025 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759130690; cv=fail; b=UW1X2py485aNmFrlQE9Ep5Gd514n9AnAgTBvYDWQJ/SzpR1dQEArvbfQ2UbWXkXH+IigxSjQwPZh+AOIUBYl9Y+3JuRoyBSPa1lEi3U8vPSwAqohNYd0xZ/Y9x4HTUNaTr6+8oVrD/Mo3MIeW1u96a4RFEpWjGNv69Hxd0Ni20g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759130690; c=relaxed/simple;
	bh=3O7S1RZXMlxBHqFPQVs/QRowAW2+lBGkivGmrsrQ5ZU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fcr2+VkTwehW2PxyzUfEcH0FVrOUvmCyiZnNcBAVA5MVkw8St/2OwYv+sw622DLBxjzp8+ZdFPcC8JvzYrEXGOrUZNFZ5jcoIDxNz1L0XU+51WM5lWI3x3jqcwypSoF3z+3ajp+y3vBev9AUAyJ4FtW1jRWWQmI7mHNyzVXulIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hfSd/C3x; arc=fail smtp.client-ip=52.101.53.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LywJEkrgsJ30ao/QGogQ5S/L0SNeDK2aGAzpaEKwFuNL2uf55zQX+pzoxOe8LB2pROE/EaFnaB+f9tyYBpacnz8hb9QD5+dI277UU99gnrj+cPdgk325Go+cycE4nGo6BccjIIC+z9VSaTPv7vQ8mZaQrNoPgMcRMfTFn7B5lC4M42u0rnw8vqSRWFoRZi8SatMZ/RE29ohKTl4dvhGuHExCdv+OjtRF9um8doGOQLF/9yTRS0ycN/K201DYfa8OW9ZRr8n5g0EaiVxpwgynZhWLp/yGp3jgqW56Qmj7Nf3sIZwncPUBBx2LBrWINc81RPoUaBdJBanYT9fH1yXKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1x7tp+TUs7pLwaE284RxIhlSsvTAT3l03tWlWNLjPo=;
 b=IjqAx+n0XxVqham3TKuGyyxPg/sjB5bncAQpkm+sEn4zFMswEBgdQqb2NkGDTWuzODU4k1RS3KU/epgR1hb2fu0VHBI5Ony1K6I3292hz2psLvVvSYKn8jLpJR0XJFzSrMgyzsOW9u9T+NsLbYu1MQ25iOgm75HAJmKxPvMHl+kHQRLJ2Yx8D/wfB6YEdZXN2UWeQXkd0goI2J3g/RqvsY8Y/8gR3fzYTSjyrb98A22FzmckIIskNxuFXPtMzmvdu/xEt2S4M23ELMrHQdG8tuAYUnLFT/524eLp28EIRXH5z4wKYPnY858JbzzJ4d6WzNf5TGeoC6LCt2e4CkIziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1x7tp+TUs7pLwaE284RxIhlSsvTAT3l03tWlWNLjPo=;
 b=hfSd/C3xlkYb2YnslqHei5LfqsW5+HdScvZvJnJ1P6Hpy7PxXLSZarltghfgjkYQJeoaHS90P3xKhIvLLsvXxGI+etrwz6UkNZYY9Ho/MP/SMj1v9uR6019JBh5hASxOsJMlY/YXFte9YgkS5V0DAIr6AbOO68FMIE9IE97rV+yS9ekt2rZpHF42/cmflS42Nj4Pe9603rdYAXwQe+NLev5ZK/JQAcagfNlhsWwszz/p5Oqig4ivjj6MTKu2S+NpAc5P2EcIzO3sH/MPtAuJ34PU52Ijs+SGnx1JbWJexJx7U1uOmaSFqXeAoitu3AaHt9A9pHFlJjyAfjxaEH4yKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DS7PR12MB5789.namprd12.prod.outlook.com (2603:10b6:8:74::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Mon, 29 Sep
 2025 07:24:45 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 07:24:45 +0000
Message-ID: <f6c001af-bfaa-4d1a-8c32-1e2889e78650@nvidia.com>
Date: Mon, 29 Sep 2025 12:53:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra410 support
To: Conor Dooley <conor@kernel.org>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com,
 jonathanh@nvidia.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, Prathamesh Shete <pshete@nvidia.com>
References: <20250919093627.605059-1-kkartik@nvidia.com>
 <20250919-undusted-distrust-ff5e2f25cdd5@spud>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <20250919-undusted-distrust-ff5e2f25cdd5@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::15) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|DS7PR12MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c085cc5-2af0-42a0-1ee9-08ddff2942cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1JyL0IvZ1NUSmgwRmtDcEJkUmVKekhPeDI5dFhWaERubU9MYjZCUXpERXp5?=
 =?utf-8?B?SFJraEhENG0vTVd4M0NlWURtN1NjVHdmZ1pza2JtK3ZXM1dRTG02b0dXV0xQ?=
 =?utf-8?B?TjFFTEtJNDZsTkViaEQ4MWlQWU4vSXVXSWszS1c5TnJlUHcrb2lTUFRrQ05a?=
 =?utf-8?B?aERjZlV1QnkxQW9Ja0lENmU5SlBuby9GZ3JrK3JYQnBpREQxUytlSGRxQjR1?=
 =?utf-8?B?Q00yTVp5NkxwTmk1Q2NkdFhUdElQYzBMRWltbFBSOEY0ejJPVitUUElORTJE?=
 =?utf-8?B?OGx4bmRycTdxN3NkVU1KMmJuUGRWZ3lGdUdKL09OSGJrYThTek1zL1hpeUdi?=
 =?utf-8?B?WEIyUVhDYWZSNDFKSlhVSVlTQ0MrK25UcUdQcmswZjBKL3pqNHMyUEEra3JB?=
 =?utf-8?B?WHo5N0Raak5JWnZyQXA5RVJEM05MQVprMC9WRGRFcGZlVGhaeVAzK1Jzcnh1?=
 =?utf-8?B?bEdhK3NCM0xiSlo4OWRxMngrTFR4Mm91SzVUbTBFQVFOL0tiLzZINVRhNUlW?=
 =?utf-8?B?bTIvemZmL0phSjBhS2wySEM1NFN2TWQ2S3JVYUFWNU9iL0NRRHJlTWVKa0Fs?=
 =?utf-8?B?NlVrMVMra3Y5SEp2amd2dVNvMWpsYUUybGxQSW1PZWtDZ0dRT1Y3VXAyTHZm?=
 =?utf-8?B?ZGNzcE1HYzAzQ3ErTE5nUENaN2poT2dsaGl4bmdoZHlKRUdCU2RFMmcyb1Vv?=
 =?utf-8?B?V0ovVzFaR0dsakE5TzBHNjY5T3VXNmF4aTV4cFRmWFVFRkhpeHAyT3U2TDdv?=
 =?utf-8?B?TVJMNlhVdFdKUXNQcjQxTXczNER6RWtrb2Nwc0F0R2NPYmUvaENEejZwMEtY?=
 =?utf-8?B?Zkl5UjBYbDY3RHlHZmRwV3JHaXdqczdZNS81Qk5JaTlEMU5tN0ZYUWxEUzNy?=
 =?utf-8?B?WHFQZGNIQjdJUHdVSnNiL29QNXBVTWZ1L0g0U3FXaCsrbUVSZ1VjcGhxK0Zk?=
 =?utf-8?B?d0pNZkM5V1NlREpHdmZ3aVNRaFVDN1BFR1hDNTVZaFIzbU1KRWdhZGdFaWNW?=
 =?utf-8?B?UXJScXU5THc2eDZnQjlQMU4zWHk1Smowc094cnFyOHpGMWJpVmlHUWdjbU5i?=
 =?utf-8?B?OTJTdU5kdnR4WXdCQlA1K3pvM3QzY3RpRDkwUFZHZm0veTdMVSswdmlKNDFu?=
 =?utf-8?B?UWFKZHZaZWkrTjE3aFo4dm00ajVuejhHQ29HczN4YjBOZXRURXB6Y0ppUDN5?=
 =?utf-8?B?OUVRQlZ2enVQTDRMcWNIWk1rTXZ2QmxIUlRJbFpNM3N0SjBXb0lFRGkwZll4?=
 =?utf-8?B?Z1NmbXlLUlQ2dFZpMzhxN2J6Mkp5L1NsTTFndG9GdC9IejRJY2dqdUllWDNK?=
 =?utf-8?B?N3phcXZPY09tU21xU3hFZGpWUXB5TEdDazFNbWhzSEVKTWRCY01ncDBhYy9U?=
 =?utf-8?B?cW5TWUF3eVp6Y3RWMzkwWjRLZmkrZzBKUFdEZ29vZVpCeEZ4S0ZUbnlQUisr?=
 =?utf-8?B?WldyTVV2UGpZcXRIeWdRUmxkMlNXdTl0RldJYWViR1RvMkdUNWwzRE92RC9z?=
 =?utf-8?B?QVJhUUQzN2pnd3BnZ1d3a3ZRTDRpbFZVU3NPbmFXSGV4TXFnMDZRb2lqQzVS?=
 =?utf-8?B?dVNwVXpMNVlRV0JsbWk2UGg5czJUVy9pL0NIWmxsdm1HSnZTUm5FWk5VbUFM?=
 =?utf-8?B?a205REZvNXNnRWdqZURacGFOZ1NMR2NlT0JrSE5WV1ZKT05zd212Q3BpRU50?=
 =?utf-8?B?ODRkTlc1ZzN3OEdtc25sZkhBQXNqS3E1RW4xSmNSVGoySEsxOU5oODdwNDg4?=
 =?utf-8?B?MFA1TVBrVHpiQWk4NmthK0tvSVprRTJabVdDSXh0L3ZNem1jRXEvd0RrYkRJ?=
 =?utf-8?B?akpDZ2NBZUZNeDNzN25DMHpXMXlsUGUyTDBpbm40SE1uSm4wek90QjhSZWR2?=
 =?utf-8?B?MFZlek9iSDd1NnFPWGxHb1pOczFiU250Qm5BWDN0YnIwRERKcjYzMkpJSFdv?=
 =?utf-8?Q?0ChtgjMhzjOZsH3P/67aKsysuVqQNMle?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnVPQkYyZUo5bzlyOGVQMVpTNTFhbTBBVDFNV2NLTkhndUwrL21wb0praW9y?=
 =?utf-8?B?OEx6cFBmQVlSYkhYZTVGRFprZ0RpeGFHcm9RMHlwMDVVZ0ZucENZRm1hcFdC?=
 =?utf-8?B?VkpxMTRMRnlBTUJrOFdTbksrRlhuZWczaE9Ja2NYeTRvL2pXYnhBOHFxQy9s?=
 =?utf-8?B?WHVNN0loTkcxRmFwZ0cwTm9JZ2xOb3NVbXlXZEMxbEFsbUJ6bDRYZWF1RnFq?=
 =?utf-8?B?UkIwKzFsamlqQ1lzbFJUa05JeksyZVhpUXVKT2E3SjhTWWVVOWx1N2wvODQy?=
 =?utf-8?B?NmJReWdnWUIram93enpWR3NGenk4WUdVZmp4RkRLN2pSYk5hRWNNVnJVRlRj?=
 =?utf-8?B?K1JMcnduUjk3b1gzdEdqczlSL2EySkczQjBpR2ZsOTNNODduU0dvY3VwSGNI?=
 =?utf-8?B?dVNtcE1SUm0zMmJwTWNFMDA0L09McHRvYXJTRmY1V0YxL1BFM0NrRnJuZTlI?=
 =?utf-8?B?U1p2cCtsL2lNWFFyREJTU1Q1dEZUUmx1SW04YjdNTEl1QXJweXR1SWNUMnRE?=
 =?utf-8?B?ZVRkSmlUNE94ODhlbENQSVRKRWV3ZEgvbk1SYVVJWm5RNjR3Q1d4RnBMS3M4?=
 =?utf-8?B?N1g0UG9qQWdiRmNaZW0wbmpJWHh1Y0VHZmxwNHBOV3YvSlFOc1pJUkV5cTBS?=
 =?utf-8?B?RC9XeXZRL00rRzdCZFE1Q1BjNlhCYkxZQ2NPL2k0YzBpTkl4amg2VUs2Tlow?=
 =?utf-8?B?T0E2YWpUNnYwdGx6bjVDZk9JSzRQeWV4VmpiZ2g0M0dFMElCamZtN3oxQzBz?=
 =?utf-8?B?RnlmZGhZUkVrRFcvY2dVVjFncllwZnpQM2x6UklXZjdnNW1tc1dXaGl5WnJo?=
 =?utf-8?B?UjhpekNzNVVZVTZnbVRFY2o0aFU1TmNta2o1VlE2UnY0NkFqdFJoVThSNXBB?=
 =?utf-8?B?azlVVDVVdGN5M1ROYlBuQVdpSXBqRTk1YmVRTGVVNkJOeHBZa1E2OEVZQmp0?=
 =?utf-8?B?MlZKa20ra2pUdFY1WTRYREtQV3dlaUZNSHE1b2NqQlRxcGlKY2RMMW14QzFl?=
 =?utf-8?B?VHZkc21ZRXFrK2FkZEt6VFNaYlJVeDNwSUpxN0lHRjl0OWMwOG9SU3pYV3ZY?=
 =?utf-8?B?MitIcGFiblBhdGVQMCtuOHdFNi9hTDlCNU9WMEJUMlFjZ1AyRVc2UGJDN28z?=
 =?utf-8?B?S1oxajdQNFdrN3RpV2FXUTB5Ui9zNE80MWYvOWd6ZjgyQW03QTVrSnd1Mnlz?=
 =?utf-8?B?QVd5VTd6b2dyYllDeDZwM3Vic0s4UTlxV0JpNkx3RXR1MURGMU1EMzVFK1VY?=
 =?utf-8?B?eXVVcVM1d3ZIdTVtTzdQZWdBTXNyZDBxeG01MklRNnFtMy80RjRyNUliY1oz?=
 =?utf-8?B?Z05pYng0Rjh1UWpHZ2dib29ZRlA1NU4xQVFqUkRacjRGLzcvcGx2d2FSckxP?=
 =?utf-8?B?ZVJuNDA2TzBKRkNZMUl0UGwxeG5IVE10WFVmUzlxU0VSV0U2NllqQTRXakMv?=
 =?utf-8?B?SldaZk9ib1QrV2tRYUx6VnkxTmZYSlcvSDBHNVRFQWttUCtQQ1lLbDlCeDll?=
 =?utf-8?B?cWV6Vi9PS2piRHovVmxRblBMUUJwUWc1TmdJeW1rdTZ4VXRkTEF2MUhycEJM?=
 =?utf-8?B?SXBNNEFhYkw5S2NiTGd5eXRha2F1cFljVlVwN2Jjb3c0cHU2VTBqczg1Qnli?=
 =?utf-8?B?SVFpaGQ1Qjg2SHpNdUVPWEM2M2g1b2RJbkNCdTMrQzlKU0hyYUltNElHTUg0?=
 =?utf-8?B?cWVXcnNuTG5XSXJBUU5NbU1EVXhWd3hSS1BOenJQMGJzR3VwbFl0dmJoMm95?=
 =?utf-8?B?eEpBZVdESG1Da2VOaHFLOURCSTBRN09oNC9qTXRaRkJmUTloSS9lakdkOFBJ?=
 =?utf-8?B?T2llNXlkTkZrTUlndi85M05qUDJsaDNoakdML3VySDhaalIvbGY1UkZpNU5T?=
 =?utf-8?B?Wk1aTlk4TUVhWWVtNmVudmdBMmhQMkFmdDl2ZGljdUY4M045dTRDOU01Rjky?=
 =?utf-8?B?STVjaEpLc3hROWpLK3E2SnZMSjVzdHBzVnVZVnBma1VRRDNzZUtNVmQ5Nnh2?=
 =?utf-8?B?S1VDbFJBRXNRWnQvY3R4MXgrNXVxQ2RpcnRrbmV6MUdwVzdjY3pzTTNqWGxp?=
 =?utf-8?B?ZWNDRDdZRUk4SG1DbThhSmIra1E5VDdCSWNxbFlJZ0ZIeitmQzkzbVhHVkJI?=
 =?utf-8?Q?DiFFTF1BhhBYhRvloPjUF3g9f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c085cc5-2af0-42a0-1ee9-08ddff2942cf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:24:45.5006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZK/THCsq9gpKOybcZy/Uo//q7YRxyuPkoYse/JDrLJDKud/ogXfZ599dMdGWYxQTadkcDv2qK6HZYGJ6QQmMSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5789

Hi Conor,

Thanks for reviewing the patch!

On 19/09/25 22:44, Conor Dooley wrote:
> On Fri, Sep 19, 2025 at 03:06:26PM +0530, Kartik Rajput wrote:
>> From: Prathamesh Shete <pshete@nvidia.com>
>>
>> Add the port definitions for the main GPIO controller found on
>> Tegra410.
>>
>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
> 
> Why are you modifying a binding header for devicetree when the driver
> only appear to grow acpi support?
> 

Although Tegra410 is ACPI-only and does not require a new compatible string,
we chose to add the GPIO port definitions to the DT binding header to stay
consistent with previous Tegra SoCs.

Thanks,
Kartik


>>   include/dt-bindings/gpio/tegra410-gpio.h | 37 ++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>   create mode 100644 include/dt-bindings/gpio/tegra410-gpio.h
>>
>> diff --git a/include/dt-bindings/gpio/tegra410-gpio.h b/include/dt-bindings/gpio/tegra410-gpio.h
>> new file mode 100644
>> index 000000000000..e4d042fbacb2
>> --- /dev/null
>> +++ b/include/dt-bindings/gpio/tegra410-gpio.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
>> +
>> +/*
>> + * This header provides constants for the nvidia,tegra410-gpio DT binding.
>> + *
>> + * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
>> + * provide names for this.
>> + *
>> + * The second cell contains standard flag values specified in gpio.h.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_GPIO_TEGRA410_GPIO_H
>> +#define _DT_BINDINGS_GPIO_TEGRA410_GPIO_H
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +/* GPIOs implemented by main GPIO controller */
>> +#define TEGRA410_MAIN_GPIO_PORT_A	0
>> +#define TEGRA410_MAIN_GPIO_PORT_B	1
>> +#define TEGRA410_MAIN_GPIO_PORT_C	2
>> +#define TEGRA410_MAIN_GPIO_PORT_D	3
>> +#define TEGRA410_MAIN_GPIO_PORT_E	4
>> +#define TEGRA410_MAIN_GPIO_PORT_I	5
>> +#define TEGRA410_MAIN_GPIO_PORT_J	6
>> +#define TEGRA410_MAIN_GPIO_PORT_K	7
>> +#define TEGRA410_MAIN_GPIO_PORT_L	8
>> +#define TEGRA410_MAIN_GPIO_PORT_M	9
>> +#define TEGRA410_MAIN_GPIO_PORT_N	10
>> +#define TEGRA410_MAIN_GPIO_PORT_P	11
>> +#define TEGRA410_MAIN_GPIO_PORT_Q	12
>> +#define TEGRA410_MAIN_GPIO_PORT_R	13
>> +
>> +#define TEGRA410_MAIN_GPIO(port, offset) \
>> +	((TEGRA410_MAIN_GPIO_PORT_##port * 8) + (offset))
>> +
>> +#endif
>> -- 
>> 2.43.0
>>


