Return-Path: <linux-gpio+bounces-10313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54C097D62D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D69091C2247F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 13:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182C5158DB1;
	Fri, 20 Sep 2024 13:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BFO1cPLQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011019.outbound.protection.outlook.com [52.101.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FC02AE77;
	Fri, 20 Sep 2024 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726839222; cv=fail; b=bcIx+AczAfGJIGN9Y8ND7klPr8GZoh1CMBCX4yC6N3mNGUrLkqUTig80CIrii0+mO3SBldA3CVAMoNbJmBL7RgS+W+KVVk3+VKbQtwKOphexQFGJAF4NUObgoqntLIPFysiOh5IQ4V2rjRBbg3RI84jz2rYCbTIDQtmR/Ltdtuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726839222; c=relaxed/simple;
	bh=Ocnfpl7wzBSNAVDK05gp+dVOYjlUsdv0dpCRAlffUpI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TCR4rzPG1+ayD9pUPcs/Gdp7lfFcuaUvfTlKbEBkjKLq5LpS+ntoGdRKggGxjIocNT7xZJCVn4+9K9/nFdqgqWPxWuzMOA4e5ywN+0n1Jp6HPsjsVRijnHqddYa6uaIXF1ii5fFJvVfYSyil89illP/JxkG1ULjCeDlBCF2TSdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BFO1cPLQ; arc=fail smtp.client-ip=52.101.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1ZD0mFuqeP14nj0LODLEhq1C5lyA9d37QqyC+4u0jNm+hBgEWodV0XeDYD/rIhsRI24Xxeh+75GuoDloO3K7V0xhy0k9RORRT1MhHDG7MWEe3T4/HnccCWkj4/6GPIjR9k++AWEQLAsjvpxT9hX4/2JTxtwFwGixEkaXHJ/spumpPVxIOvle5V86T8JQzuLrDMHmAz6L+n99WYoy+D5xQZKMiMc+zTe5IuULrpfbfN2WF8pNbroCFquUmYf71TFOvQVg9dH/+9q28fAOmaZbYMIEYDmCPd5d5rKo9hG1rOsWQa1w2K603wg6cBZoNk3r1V7Flw4pTMmkOPkl8vhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPv+HJyHIisE+Mq1C24qe8Ynh6O8dryPimZV/db1M9c=;
 b=J/SMhFoxYbCkZTtTVhIfLBz7+zUq0rJBgNu/kvrOU7822ZolAuToHMl/yw9N1G00MaMomIVvFDVV/2Ha7rC0PPue7CRhXF96Ac9FkEQYAX6FvgRFmiyKeZWUPkThx7vxUWEYQTR/FBTR932YiAPNoJ3Y2TKH5DzNQBGNLwQgpanI++ahVANyqeWkcgif2jzZaCZhwStNBOCarmXcbvhoiKwQDgwEzxrZysGBkIRP7hI8GHDMsNvQvXzT1wKHGiE+Agru4yWG4I0MRk9AE8qKxbopwOfUaMV2sefpqpQFTA7ekpoERvI2gANxsI6DC7909m24FeBvJ0RGeX2Jk8gh/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPv+HJyHIisE+Mq1C24qe8Ynh6O8dryPimZV/db1M9c=;
 b=BFO1cPLQ1My6hLzBPw67tG63BqqJxYScyfCxky10r6JwTVxruneo1HWzLuA2RJ8irCSPaCRazWmdedOrtb8uDNPSTpiekfVICnqBzhR6h66CPxdh77YidIuDL5+vTTY006UriolDfWKUJtvcbb9XeJEr8xsF/hPzca+AeJdal2skUQBi4tGOdRhOQwf7MYYjuBdPJa5zLQ/jPSNjS3DPVbrsV+VZXHzcYI+hE+CFMS2kKzjixGLSoIbiCkqqbJwKCi+pHc7XI+jjaBlThwUJZnvZMmLRXOAMaMhy/KhgvvkyDPCfOq6UGmL/t1mV2QUSy42EV/cCcE+9rX7CNJuMAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AM7PR04MB6853.eurprd04.prod.outlook.com (2603:10a6:20b:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 13:33:36 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Fri, 20 Sep 2024
 13:33:36 +0000
Message-ID: <16950e81-e0ef-4e7c-b0ef-4f56415dceed@oss.nxp.com>
Date: Fri, 20 Sep 2024 16:33:32 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
 <20240920-reapply-amusement-a37cf13fd910@squawk>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20240920-reapply-amusement-a37cf13fd910@squawk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::22) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AM7PR04MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 55db98cd-08b2-4962-7177-08dcd978d45d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGVvKy9Dc0lobFFSU29xNy9CeW9qcmgyWTJvYXNMYk94L0dkQVlsL2FSNkJs?=
 =?utf-8?B?SURaM3d3Wm5KRUl0SkM0czU3TkxpbXdTSkRzMHlTYnIwY1RNSndzMWlRUUY1?=
 =?utf-8?B?SDRpRStGVTAvRVcvY3BSZlhFdDRWSHk3elRhOG9SWUdkQnJjR2Fzdms5VUNC?=
 =?utf-8?B?WWlRNWszekJOY3V2VC9TSnNGVU9TSGVFTkpmNWNVUEpIbkp0RUVuKzRUT2VD?=
 =?utf-8?B?YmVON1pEWDEyS2V3WmZyTmpvci80SGJuZE5JaUxEYU5WMmFhSHdBMXM4LzJB?=
 =?utf-8?B?cHlSbXZ4NkNDWVhCanN2TmVqMlN2RXJVRTA2cWxtNklhcTBucVlOUDA1bnRL?=
 =?utf-8?B?RjJxcllIeVlxaFBtRWo3U2k5aEgvZ2NlT1VHSUZPdzIrOTB5QzU5ODArR09m?=
 =?utf-8?B?ZzVZdTBveWhwT2FnUGh5alZaaHczb212V1NYRHVFaGI4d1E1YkZsQ3k2SURS?=
 =?utf-8?B?Y2F2U24xNW9CcS9ielZCY3NZSDloUzVjN2VvZFJNVllsMTk1M0ZmS0NBejBF?=
 =?utf-8?B?MEZzVFcvdUV6ajFKYnl3eituSFI1ak1RckVNZmdaVWtZOVZmVTQvNVo1Q3Zq?=
 =?utf-8?B?b1A5WDI3RkxNZCtmVlZCbFY4bGVSL25hYzVRV0ZTWllVcDRwU1Z4bCs4bEd6?=
 =?utf-8?B?UFFqUGR1WDZ1SzIrS2w4K0NWck1sS3JDeHY0c2JWZ3VPY08rbVJrNkFQeTZR?=
 =?utf-8?B?ZHNsSytYdjZWQnNrdmhUUjA4S0lncHBKQzFBdmNodVh4WTlsNjlKbGZ5M1Rh?=
 =?utf-8?B?SFliTUxyNnpsc0pKMU9FQzBHK2tmd041cGJ1SjU4YUR4QlZKdUdqcXBxMHE1?=
 =?utf-8?B?T3hPZGk2QzZLSlo2UEdpWWV2TWNSdVQycVJxSW5yQ29sc1lyNVRKeGRia005?=
 =?utf-8?B?bTV6QkI3aVRXbmpiTS9XdVp1NWplOGdTUnJTeXJaS2ZIamp3dUpLb2Zwdy9L?=
 =?utf-8?B?dHIrNFMrdjdRSStzai8xYUdwcUZFU2VoM25UZ1VLaXhjdXR4aFRiTHo0ZUJx?=
 =?utf-8?B?WklrRDVNWXNpUGRKZVlaYTJmWm1yWklEekYvQlhROXg3bTVYK2czS2tOVEhU?=
 =?utf-8?B?M25XZTVmYnlIN3NtZGpCd2pjZ1E1Q3VNSElPYmo1NW5aVmJBekk5d3M0UEhw?=
 =?utf-8?B?bzJMYkdTVThDOTIySzRWUTNqUmlDb0pvSHFpa0hISU01dVBNcVZYdUltTXBi?=
 =?utf-8?B?bXVTNXc2R0J1WU5yTVRZcG5NTXlEWjFCSnA3endYcTR6TXNIU3A1dmkrSlhq?=
 =?utf-8?B?NUlsWEJ6MnkzYXB3bVgxM2habGdLVXg1NE10SldmV3BXdUQrUHVFVkNjdkFH?=
 =?utf-8?B?ZHFJK0ZjeWxMTllLaklHSm1rSURmSjlKVHh0SjUxNW1lc1pFRXVoWkJKL3E3?=
 =?utf-8?B?SzgzQUNLajVLZGszZzhWMC9XRGpqTzliTnJ4dUNvUzBoUXVxeTVuR3hVQU5s?=
 =?utf-8?B?cFgwL0h3NldPdjl5TmxaOEx0Zlo1M3JJU2Z3NkFYdXUrNThhR2VkUGdsL0ox?=
 =?utf-8?B?YTkzcC9RNkd2K0FlZGhVdExZK2N5SCt6MkxnZ3ZucjNZOElOK3dHVnVwam1W?=
 =?utf-8?B?NFc1OGt6eWJiaWM4dXBBOUtydXQ0eUZ3SDdFbCthTnZac25aYXd6SkdKU1Nh?=
 =?utf-8?B?YmhJVkI3dklvZTNTeFRDaUhYZnduSUxPNTVJbFdhTGRxWDhJNWllWFZyNUpV?=
 =?utf-8?B?R3lPdjZyOEJGaExlcXJjN0NLS3Fxelc1eDg5Ty9zME8yRmU3dm00dnIrRDFY?=
 =?utf-8?Q?xbdeDs0NFCnBECWy84=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHhBakNTWlJUbHlmOVdtUUxtYld1WkFja0s5WDhlWmdJQlA0Z3Z5d3ArT1d4?=
 =?utf-8?B?dkRSVTRWVjljSmNCUjhNOTlxY3VUVTd3UkVnc2JMS2p1ZnRpdTdKOVRYSGpn?=
 =?utf-8?B?cEpQaWZGT0VVV1IxYVZiTTAxdEc1M2ZLWnNpNjlVRzdrVHlubzdvUE11cXND?=
 =?utf-8?B?RTNzdTVXQi9pMlNtbFEwY1FZS0JWeE5ySlIzTG5RQURpQ1A1NURHazlPbVI4?=
 =?utf-8?B?aDJtQ3JqeVNaTW43NEdlY0FRSkMrZUo4UUVLWm5sMllBZVZtb3hDUTZ4SmNR?=
 =?utf-8?B?dnNjNzdMT255QWJTZWdFZnJIMGUzMFlBLzN6UWhnbjhpbmpjQWliYmNzZWJV?=
 =?utf-8?B?Y0FydG54RHZXR2IrbWpoeVpMSWdLWCtsRUJMelViTWdkUktuc3JJcTZHV2Nt?=
 =?utf-8?B?Rm5BK3MvK0hvMTRjdVFYMnZzdGkzMjNrYTRoTnpGeTNkeGMzc3g0RDN2NWVo?=
 =?utf-8?B?Ykw0aGZPZHMweksyQTN1SEhPc0YrYnJKQk02di9mTTdRZXB1dm1tZDY2L3kx?=
 =?utf-8?B?SVo0R0kvZS9zaWN5SmxYZml1cXJjY2J6dGc3U3lBTVNWN21EQXRxbGR0azJW?=
 =?utf-8?B?dUZWaVJId3pvbWhJRnR2UnlNYWR1cXFTZ1N3Vy9VZWN2OEh2eGJaQjZYb2RP?=
 =?utf-8?B?emRJbG0vR04rU0lINDdLSnVPK016Zmd0cXZPcWxqYVV5bkx3UTkrRGhRaENK?=
 =?utf-8?B?TTlrY0hyKzJBd0Y2SU9FWjZNMnVsSUVNWWQwV1R5LzlYazBaZHNDRTRvRlFH?=
 =?utf-8?B?eFFSV0ZHN1diS1pQOW9GeUNjanBMNDB3cnRERDRKN21CVVYrV1BPWDVHaE92?=
 =?utf-8?B?Q3JBVnhhZ0NJekRLSVRML1Vlb3hpMGpTUGVSVEJFTGdNMWhjbkIyajRqQ05o?=
 =?utf-8?B?TytIYzNnVERMNVZyVW1yTm0rWU04U3o0dFRDaFI2aTVnUklvT0hRWDNJUjFQ?=
 =?utf-8?B?WGo2MEEzSnNUTFBpUEZqRVFFT2VtaGxvRHZHbFhvQmdpNEhlQm1QV3R4N3ly?=
 =?utf-8?B?eFlSWUd5bmtLTm9BdGNaTmltZWtIMk80b3A4bDV0VG9CSTBTR0cxSVYvbDRp?=
 =?utf-8?B?WHZKb2NrakRrNHRMVkRmNWgrYlljTHNBTkVLYlEvVUV1RlBhZDlOY3dyaVJS?=
 =?utf-8?B?ZWZ2TUw3UCtFb2hPekhIbmx6aDFDNk40NnAwOTRNNEpnVmpsWHo1TkVCUGJZ?=
 =?utf-8?B?MzNGR0pXOTVZZ0llS3I1TnR0ZEE3Sy94c3B0U09xNHFPUWl2RkRuOHNIMGpC?=
 =?utf-8?B?TXdHWnU4UEZEdmMvSFR4clRmWFFmYTdxMGx5TkJOVnkwNlBRR1hEMFNPR24z?=
 =?utf-8?B?ZWw3TEVEZm8rK1d4QXVnT25hRlVZSDhmZE1Ec3V2UkRrSm1zcUlCZSt1RW5j?=
 =?utf-8?B?dWRwNkpFTUZ4cFRsM1NDUjlZZ3ZkK2o0akJzSDVRUEZWTkZrMysxblJnWlph?=
 =?utf-8?B?K29lcnZlK3NvNFM5Yk9KbmFOQ2tWMEx2dHkrVlVOckRRTVh6TWt6Q2hQUzU1?=
 =?utf-8?B?aFJjQUM3QnRrejZLekRNa2o1UmJJbXFUN05OZHRxTGYrS0Ruc0c5STVhNE5J?=
 =?utf-8?B?c1BLRHNoTlRsdTE2TmZBSVQyRW95NVNCSHJhMlI4RVFVQVBFNzAvMWQxL3Jh?=
 =?utf-8?B?d0YrdzU1MGUzRU1YVldUQjk3QTR3VkIvZWhvbWJOT2xnU25saTFRR3FLTWRo?=
 =?utf-8?B?U20vWXpXbm15KzQ4UDlmVm1BVDJZc20yYzZ4a2d1c0NJMWMxTU5JTCt1bTVk?=
 =?utf-8?B?aEp3Q09aOWowVndaRFJ5R0ZvUHNSeWtsZ3NwZmc4S0Y2M25yaUtxSkxhSzMv?=
 =?utf-8?B?RkxwVlFaTWdkckxzaXkwYXE3RCtROEh5eWtZUU9ZaVNoelFQVmRXbnp0eTFH?=
 =?utf-8?B?UVlYSU5KamJibTVRc3I4a0JDY1NibUl6cXQvVEljci9rQ2lFU3pTcmNCUDF5?=
 =?utf-8?B?MzMyckNUejZWeitRN3BEL1hwWUlqK3JQUFFPdzR3NTlTWkh0bkJiNWtYMGNG?=
 =?utf-8?B?TXZVZTNZbElQaXVtU21jUkt2YkhKTmtqYXduYXdhMm9JbkFvNExXNjJmcWhJ?=
 =?utf-8?B?UGVlcUFXQ3ZJR2xzSnE2OFRtRDZKam9iQUxXWEhpT3NVZEVNc3p0WVlsUTY0?=
 =?utf-8?B?V2lUclczWk5FRDkzWHVTUlBxenlxbThNYjJ2UWZFa09BcC9GdWZ4SDJDRWxT?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55db98cd-08b2-4962-7177-08dcd978d45d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 13:33:36.5443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5DT9UfjJzmhjUvskr8sCOlhkwT2UMoT2L/TXTC+/gq3QiZAD9PSIaSAXlQLv3akv9DL2go1qwS/RpYy7LaRYABZzE97xnma8sivURz5hdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6853

Hi Conor,

Thank you for your review!

On 20/09/2024 15:46, Conor Dooley wrote:
> On Thu, Sep 19, 2024 at 04:47:22PM +0300, Andrei Stefanescu wrote:
>> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
>>
>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> ---
>>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 107 ++++++++++++++++++
>>  1 file changed, 107 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>> new file mode 100644
>> index 000000000000..0548028e6745
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>> @@ -0,0 +1,107 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
>> +# Copyright 2024 NXP
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpio/nxp,s32g2-siul2-gpio.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP S32G2 SIUL2 GPIO controller
>> +
>> +maintainers:
>> +  - Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> +  - Larisa Grigore <larisa.grigore@nxp.com>
>> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> +
>> +description:
>> +  Support for the SIUL2 GPIOs found on the S32G2 and S32G3
>> +  chips. It includes an IRQ controller for all pins which have
>> +  an EIRQ associated.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: nxp,s32g2-siul2-gpio
> 
> Commit message and binding description say s32g2 and s32g3, but there's
> only a compatible here for g2.

Yes, the SIUL2 GPIO hardware is the same for both S32G2 and S32G3 SoCs. I plan
to reuse the same compatible when I add the SIUL2 GPIO device tree node for
the S32G3 boards. Would that be ok?

Best regards,
Andrei

