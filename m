Return-Path: <linux-gpio+bounces-19276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46726A9B02C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 16:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A5A97A755A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 14:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C0519048A;
	Thu, 24 Apr 2025 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="jrUafrK0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426C612CDA5;
	Thu, 24 Apr 2025 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503725; cv=fail; b=FEUAoRrCsb+4WEDfiH9dTvgpn58A2V7LE5fahMy7Dh38xUlVrVH/wils2U8WLSGGxV+gSXvahehYbbQqU8OShkHSzR4kFI15igF1/Q1YUVj7DkA8ZJmfbCRxSvWjeHsu6+iGX88qYk44hebsTMv3juoXEfp+i1Azo9gbK+RdvvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503725; c=relaxed/simple;
	bh=FjsGTVq6/6WBHcefRVDVW6Auhqd52x4sq+VnPGcLSGU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AxESqt+GlOZdeuDcwV5BmFBeg2o8je+ERjL1jxCDFVeFq4xgsA1Hz6D60uQ6LQ6qL5IE7pPKdzVqoPZ7eMUz3efUPvq/K0VugjbR/0MfqoTAftOG3DxDsj5nb0TX5c6z5w8wy9i4lGwVJta6Tk9oiVq0wJVaxJIjVQRDesTEun4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=jrUafrK0; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ODrH2S019219;
	Thu, 24 Apr 2025 14:55:41 +0100
Received: from pnzpr01cu001.outbound.protection.outlook.com (mail-centralindiaazlp17011028.outbound.protection.outlook.com [40.93.132.28])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 466jhvrt0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 14:55:41 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj0n5voM/jKE1zQKs3m/RhsvVifNply2qKbBnfyCnhaKoQGMoi2roQ13QO+bt+K9nlopRjszRqmD4sq5a51uYa0DEREGIdXiOeFRi2I+LxB+9Gj+AbD+7YcJqvS5J8Gm6V+1NNZTgcycLgC2KdG4d7J2IgCWPIjPwlC0l+FWfLZ4NbjpQmEXpLasHoaWBc1eqck0Uk4/DxwQ0lSr3xufCeOrSIKNqqjIW3DS5uai5AnCV9ozr2x+ifhBF2P3YYrV2ndWMQUlK6VuJ3+v+UbaIo/p31PU+78ltZone5hkwuTVSPViHZun1i7nTWGr2YlZaAOO9m6G+p6fuRtX/J4QBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCfi89pA/QUIh5DO1zvxYlWl73Iex1drdWSLpw/QnRk=;
 b=oOJQqg9OmwTDr3A5EXHkfJAC3277Q3NMmmeC3JfVPyf5MDXFbBHJiYgy+b326Pss/OPnGSK+KKkX9u6gcsuFOmZOMI0QeffDmPfnYaAI1QluKFA0aXRreAbNf/0GG4H07bsGntWmFQPJa8vX29kv4MHfDlVGy+/B5MILH4WztwnefML/FOoFX/m1SR9J1I0PLoRgO5W07+F+frp7nYl7AkCsn4Fl4nsbeDvOHhEffbxSEv5HsrJsQZmB6c2jGhjGUrm4EPg2wTfCHkr3y3iKc4DUzyoH6SrBphZf0vVG9v7jWwS3MsH9f7P+ZGcjtsU5Z11VrfLdAWJ0q09Hr7D6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCfi89pA/QUIh5DO1zvxYlWl73Iex1drdWSLpw/QnRk=;
 b=jrUafrK0GajA55rk8uMcpdbFjVKXnCat6OiMdQSxYYIpjshA6LkZyOLfL0s4KOH1KE+VIT5TwxnkKBRHfmVcG0Sh8a3tv/vKp4YHfmtclp8bLdh3E8tYj7mwQVoNrYTX4GZz/BqVj59kxWpWf4aEG1kxTa5DiQxMzJOrSSzSi0w=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by PN3PR01MB9776.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 13:55:37 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%3]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 13:55:36 +0000
Message-ID: <0aecfa4c-f00c-4914-8ca1-d54c41b3a948@blaize.com>
Date: Thu, 24 Apr 2025 14:55:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: blaize-blzp1600: Enable GPIO support
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        James Cowgill
 <james.cowgill@blaize.com>,
        Matt Redfearn <matt.redfearn@blaize.com>,
        Neil Jones <neil.jones@blaize.com>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Matthew Redfearn <matthew.redfearn@blaize.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
 <20250327-kernel-upstreaming-add_gpio_support-v2-3-bbe51f8d66da@blaize.com>
Content-Language: en-US
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
In-Reply-To: <20250327-kernel-upstreaming-add_gpio_support-v2-3-bbe51f8d66da@blaize.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0195.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::12) To MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:12a::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0PR01MB10184:EE_|PN3PR01MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de82a71-c3f0-4899-f67f-08dd8337b05c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0FXbmFtb0NLL2txRmp2MVdMUG1BUUltVlc0QVF0QmsvVnNiR01WMzFnZFU1?=
 =?utf-8?B?QWFMS0tMRnlwMVdZRGZrdjlrcEwwcllwOFl5d1EyNjhRWnN2eHFRaGJWd0lC?=
 =?utf-8?B?emlEOWRUWFRQS3hSNjN5OHFCS04vWjBEVzVnYUxmV2RzdnlDTUhvTnNFb2tQ?=
 =?utf-8?B?cjNvYmlhdTR3c1ZNR1RkamxKS3gzUmFKdkJMNE04VURqY0hJRkRuVVFhOTdM?=
 =?utf-8?B?b3RiczZwb2pnT0VzT0lxdXlwTStsaExBSVlMOUhwZUU2d1M2UVdTQ0haSysy?=
 =?utf-8?B?SEtLeTBMeFAvTUkvVTVjaEJVcDN3dHQvMElZVXluMlNhekpBNzU4blBIQmpu?=
 =?utf-8?B?cldFMFd6aE90Uy9adkE1dE1qM25uZHlueXpGWXkxODRGM00xRHMyZmk3ZEY4?=
 =?utf-8?B?cVRxRnhMaU1RR3VmYjFmeUtydm9kc0IwbVY3VTk2SzhYdnlHalRXdGNycVVv?=
 =?utf-8?B?NHNjM09RRmE2QWp2WU0vb0RhbFBtNGh4cURycnAxMWk4YmpnUGdydFpueUFH?=
 =?utf-8?B?dFBldFNIcjF6SWMyM2RqNVVCQ2dHWnpFeHdFYkVhVE54UWxlVHlqMmg2Wkpz?=
 =?utf-8?B?NDI1UEhhaVdKS3d3bHlPMFpOT05Ob2c1WUlaQU9TRE9LcmljdE1RZStGN0hv?=
 =?utf-8?B?NllSeFBzTkJ4Nmhhdk0ya2U5eHZhaFV0eTJiclBudGhGNlJZa284ekNTMkJ5?=
 =?utf-8?B?R0l2aCt0dmYyM21TaVdpOFJhWG92ejdpcXpFUVc0U2xjQmhVTnNJYUVpRWh0?=
 =?utf-8?B?dEoxZDdFNnBzZWE2VVVRUE00cDk3VFNIMG1HNVp3TVdKU0hFcXFraTZUeFRn?=
 =?utf-8?B?YXRZMHpNWnNBS0tqUm9iQjIrT3NQU0IvRSt1NnlMcWpqVzg2ZDh5aE1wTm9o?=
 =?utf-8?B?RjZ0cUZCZGxLcHQrVk10WWNzL2g5UmRHMDhKeDR6N3Zla3l1V3VVTjluWFRF?=
 =?utf-8?B?d1cyYzFqZ0NaUWl6ZjlMbzdqOGdsc3UwS2FxY0d4WG94VHpXOG5MbUR4U01y?=
 =?utf-8?B?ckpwc1UyMUkvZ0NoNWlibzAxRE5TSk9GVmtGZUJhMW1keWFZRmYrWDhQSzQr?=
 =?utf-8?B?U1FVcnZaS2xUY3dRaUttZnhHc1I0SFgvNHJ4eG9BelF2TVJHemtPM3BMNzRG?=
 =?utf-8?B?cnhUbWJyaUNud1NGMXkxeFozOU8rK29jVlY4d0pwRTlZYWx1VEVEY1ZOOHZo?=
 =?utf-8?B?a2pnanphbkRaTVc2U3pBT3Q2WEVZV0F3cCszR2dQL3JCbnpvWW40M0hqNmlQ?=
 =?utf-8?B?Z3RpdDgyWlJuQ2lITW91MGx0ZU54OHVNa0p0QVQxSE9XQlhwZlhybUVqN3A3?=
 =?utf-8?B?cTRwK1VlTTBSYnpISWpYM1lISFNVOW1JYlJLL3NqVzU0MkdFY2MxMEhuQmFV?=
 =?utf-8?B?emNNMEtoVkI2WTJFcXM3cTA4MG56M01yUXpmTWQrWWc3ZG5RRHNNRmkvcEpq?=
 =?utf-8?B?VStUUWpWWTRXY0VnRTc2TDdIRmkyMkhqeVNEeDJoVWRHUE9Sa2JuTDJxMzU4?=
 =?utf-8?B?OUtmTDZ0MldzS0c2a1VQSnBqMmJSTWxYajdnZzhyemw0SUhYajdVdS9xVUt6?=
 =?utf-8?B?NStWVlFrM1gxWkFlZ1RlaHMxNE9FQU5lYWFlbEdWTkQrL3VTMG5EY2lYZTA4?=
 =?utf-8?B?Yzl0bFZPUlFJUVJSTkpkMmNMejV3N1dFQm9KWHlDaEFoa3pHSHBVYjdvU1pP?=
 =?utf-8?B?VHBDd003bDgrQUZBcGhCOXV1WGFkZ2RCeXhiZkNmelFFdU84aUlTZU9YajM4?=
 =?utf-8?B?Sm1SQlpGVEVtaXRJZWg4K0ZJcFluQnhMVFFmd3ZmZUEzcXN1UlFYc3hkeVd0?=
 =?utf-8?B?UFZueFpHbVQzcWUyaGhBOUpVS3pjZ2h3dXJDK2wyTTJaOXFrVk5KV3pxUW80?=
 =?utf-8?B?cDFMTUhrMWZxRVpISXRncCtLcThkcFJZRGV4R0l0V0s0VmdBS1hSdGpURU9G?=
 =?utf-8?B?WXJBcDZIeDlVTjVZOGlJRk1oVzMxQkxwbVdRZlkvS0YwemNWSENDaUlDSGdI?=
 =?utf-8?B?T0ZvY1hlZ2VBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2laVTdVV29WWUcyaEhGbFpvTVJsMkNzSFA3aXRSTHFHTXpJN0xPb3M0eDdy?=
 =?utf-8?B?UnI0MUpqUkVSMm4xY0wwaVNSM2NQVTAwTithdlFSdnQxc2l1TTdCeU5YVW5s?=
 =?utf-8?B?TExWZTY1K1pBdDBJb0ozQ1p0NkJ5MjZSY0N6Q3dyS1ZnT2V5YkxhVzdMc1li?=
 =?utf-8?B?YmdtQkswdEF2RFZLUEJtYWpyTDNVb2tNaFJQNGdlZXVyd1IvSERob3BmdXNx?=
 =?utf-8?B?LzYvcXQ2Y3dFVFBFYURlRXpieUxBVlJScCtmcGVSNktDaWltaXNKSElzL0gr?=
 =?utf-8?B?SHRBNWpFK1VGQTU3V3pOaEZYK1NiVVkzN0NjUkYvSWVncmtKdVc5TGYzVlJk?=
 =?utf-8?B?Q014VEFNYnAwVDhFdmpOOEQ5dVRpTHlWd3AzaDRvREVvNmN0cVREelZDY1VY?=
 =?utf-8?B?QWVOZVlKOWErTmN6NGRaY1hrQ3EwNWcxVS9lRkRHbGlOTGdMYUFIdHhNNVZL?=
 =?utf-8?B?b0lJc0hJNldOS2pjL0dBNmJCR2QzdzcwTGFDU2ZreEJkY08yTldWODJ6MDdp?=
 =?utf-8?B?N29QMExHaFp6ZUE3NWkxSit3aXZpc1JtUzZmREFmYWU5TTh0MG5idzJrSS81?=
 =?utf-8?B?YmlDNjc1YkJpZGkrMDdGcWY4bTZ4SFIvaHZPd0xEZUJnNVBmbWFBY0pRanEv?=
 =?utf-8?B?dzJkdzVsY3lYSS84Sll5NlVQQnpLZVVmTHBzRlVzL0ZRYTVFenloYnJiZmtP?=
 =?utf-8?B?UEpnY0lnVEpXUDgwaXoxdjhoYWc4WFkycmNDQ3NqM29SdjdaOGwra203dEFh?=
 =?utf-8?B?RjJtYWoyL0JuVmk2MVd3MzJ5RHNFZng5cFdNMGd2WUdsNWVna0Z0a25udkpx?=
 =?utf-8?B?d1Q0OTcrNGJYMjZPajdsb0lETGU1TlQwYlBpQTk0QmtTNUQvekZYVnlJUklH?=
 =?utf-8?B?ZkEyQmhNak1ERThtdzdJUHlvRDY4MU5rZUhCb2dRZ0pNc040NlZuMG90YndK?=
 =?utf-8?B?K1pmRlc2aXpiVTdIUVp1S25GMDQ1Y01ZcDdXRmV5TExzTkJNZnBmc0V2enVD?=
 =?utf-8?B?SVI3MUxoQ0tBNm5XYytreGZUOUgxSGVLSFpPbHJrSFZpaWNTRWxLM05TS2hK?=
 =?utf-8?B?N0lxKzlzZVpjZWVVK1NmTUthK2VxZjRGZmEvNUpvVjY1L1pmOWl4UFVnMkZ4?=
 =?utf-8?B?cWZmSEVDRUhvRjgzejJVU0lRUXljZ2JOWERCREtqY3FmMi9mczZDVHVVTWY2?=
 =?utf-8?B?QWNIM2t4bGQ2aWJEc0tET1pMNXZoOUxUVFVMa3AwbXBKRmlvT25ZVDZqR0o1?=
 =?utf-8?B?NDByUWM4M3FhOE1uYTJ1RDEvb0o0ajhyK25rQXcwZno4V3VPQzlRSkZlUCtn?=
 =?utf-8?B?MXo3QmxkU282ejhJRERNVzBESW9MN3c0QUd3cG4zY2dtQ2UrTWFOSFo1bk5j?=
 =?utf-8?B?aWkwL3pBSGJiN3ozVzlUZlQrUjJMNm9hVFYwOEZGeUQ3VTF3OWtFRlFMTEty?=
 =?utf-8?B?c1A0bzVUaUlVWVRZOUNwR09COUR5cGkzV2w4RHpnYSsxb1dDOGNpMEN6NFZS?=
 =?utf-8?B?cEJuU3NXK2Y2aW80TnVNRUdJTFBnckVMYytudnFScUZ4SHRGYTR6SDZxRjlp?=
 =?utf-8?B?TlNPc0Q3U3MvblgrUTRhMUxMQkVnUStvWWFOelFHYmRkZkkxZ0t6ZDBrUStE?=
 =?utf-8?B?VGp0SU1QRS9SbnRHSUFOcWpkZzFLTzFHYmhFWjFOSDVGa2IvNWJSNGZEK3c1?=
 =?utf-8?B?NTBkU1hlQTFXdDdHQW5UU3pIVW5JZGx1dTFwT0k4LzEzejBVMVgvQnk1RlV2?=
 =?utf-8?B?ajRyd2F5U2JrWlhhUlk1NFpnTVpNdmN6b1R3N2Z1ME1McHlHdTRuSkdKZWlN?=
 =?utf-8?B?dnpUaXNpaVNibG5CdFdlTmZMc05rdTFIMUNsNWt1NGhqSWd5aFFBWU9zSENC?=
 =?utf-8?B?My9zelZzMEpXVzAxZnphTkpEZnlnUnQ3OW51QlF3aHViTjNPV1lWaWVFd2RN?=
 =?utf-8?B?cVI5VVNpZXpkdkdUa0g4YkprUFQxTFZkOUVYMFd1aGkyV000WmhPdEZSMzVk?=
 =?utf-8?B?cXBKaFJrZklHOE1yWSt3UFduL1VQUTVaRlk1ZWZoaVNIU2tXdGpiL2d1U3py?=
 =?utf-8?B?WmF1a2hLZG5lMWkwbGJMRjFPbUs5bUlQT0U3a2UvdEVZNzZPUUF0bER4NmxU?=
 =?utf-8?B?ODNNMDhuMWZuaUhpUmV0NUpHbFNsZDh1M3hxL1UrWnBCZDJMcDRrekFlSW94?=
 =?utf-8?Q?ar+HujnWRgrKT1JjgJHzbKs=3D?=
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de82a71-c3f0-4899-f67f-08dd8337b05c
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 13:55:36.5070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufV1FQipwHDYPfH0TOPV5vej8Hd2umk5XiU4/OAI+n17CCvuslCRGXXgicE9/WemCjQQfJNQ+eh1fQ2OvNWpS2w0o+nPoVZvhs+FeMrgP/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9776
X-Proofpoint-GUID: cv0_1cqoUw7e4Ju5uXrkl-EiHB5Z4WnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA5NCBTYWx0ZWRfX3iguP2qfftfc zCGVv7MZF/nqfTHfRCkU+r75dpIGAEyjtqqdn8pXRvzkfhssPi9iPttPn3xUCv0jS1VtVWdyHqi cTGDvZDnFQlEBzcf+E3C7Okn9YNSthtDQH7tbi5x9Gv7RTHgsQc/xGNkQDVGwsvswiS/crcZGRW
 ufNvU14F+j+hUvKziW9NIKQ4KM1/F/vzRkBKbxRKh/8R7vLHFCsw23JsLc12DuMYXm0HVaRZqp9 VolKNwj7tj8wWQA8Aig61TrHdGtPIzCrNZlWudA6mg1vU7+noRcb0JuBe22Dc+x9QnGHZq5lPz/ d3I13Y356zis7+720u1LF08Dq3yL3U85rardFSTC80PHGGUsXB0cGBhFCtz0lcYaWcP4ElfuIZH
 74EDqIATDdJJKsAPFkFDJ++Dh7owZoSbvRCe0vPeBfHOhDyN/grMaqUEwCIxnmX63X1rELNN
X-Authority-Analysis: v=2.4 cv=ao6yCTZV c=1 sm=1 tr=0 ts=680a42dd cx=c_pps a=gncIvgqb4a+koTErn0Mphw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=x-MnYZxxJV6qP73kXPMA:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-ORIG-GUID: cv0_1cqoUw7e4Ju5uXrkl-EiHB5Z4WnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Reason: orgsafe

On 27/03/2025 11:26, Nikolaos Pasaloukos wrote:

> Blaize BLZP1600 uses the custom silicon provided from
> VeriSilicon to add GPIO support.
> This interface is used to control signals on many other
> peripherals, such as Ethernet, USB, SD and eMMC.
>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> ---
>   arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts | 36 ++++++++++++++++++++++
>   arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi    | 12 ++++++++
>   2 files changed, 48 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts b/arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts
> index 7e3cef2ed3522e202487e799b2021cd45398e006..fb5415eb347a028fc65090027a4c4fc89c8280f5 100644
> --- a/arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts
> +++ b/arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts
> @@ -81,3 +81,39 @@ gpio_expander_m2: gpio@75 {
>   				  "UART1_TO_RSP";	/* GPIO_15 */
>   	};
>   };
> +
> +&gpio0 {
> +	status = "okay";
> +	gpio-line-names = "PERST_N",		/* GPIO_0 */
> +			  "LM96063_ALERT_N",	/* GPIO_1 */
> +			  "INA3221_PV",		/* GPIO_2 */
> +			  "INA3221_CRIT",	/* GPIO_3 */
> +			  "INA3221_WARN",	/* GPIO_4 */
> +			  "INA3221_TC",		/* GPIO_5 */
> +			  "QSPI0_RST_N",	/* GPIO_6 */
> +			  "LM96063_TCRIT_N",	/* GPIO_7 */
> +			  "DSI_TCH_INT",	/* GPIO_8 */
> +			  "DSI_RST",		/* GPIO_9 */
> +			  "DSI_BL",		/* GPIO_10 */
> +			  "DSI_INT",		/* GPIO_11 */
> +			  "ETH_RST",		/* GPIO_12 */
> +			  "CSI0_RST",		/* GPIO_13 */
> +			  "CSI0_PWDN",		/* GPIO_14 */
> +			  "CSI1_RST",		/* GPIO_15 */
> +			  "CSI1_PWDN",		/* GPIO_16 */
> +			  "CSI2_RST",		/* GPIO_17 */
> +			  "CSI2_PWDN",		/* GPIO_18 */
> +			  "CSI3_RST",		/* GPIO_19 */
> +			  "CSI3_PWDN",		/* GPIO_20 */
> +			  "ADAC_RST",		/* GPIO_21 */
> +			  "SD_SW_VDD",		/* GPIO_22 */
> +			  "SD_PON_VDD",		/* GPIO_23 */
> +			  "GPIO_EXP_INT",	/* GPIO_24 */
> +			  "BOARD_ID_0",		/* GPIO_25 */
> +			  "SDIO1_SW_VDD",	/* GPIO_26 */
> +			  "SDIO1_PON_VDD",	/* GPIO_27 */
> +			  "SDIO2_SW_VDD",	/* GPIO_28 */
> +			  "SDIO2_PON_VDD",	/* GPIO_29 */
> +			  "BOARD_ID_1",		/* GPIO_30 */
> +			  "BOARD_ID_2";		/* GPIO_31 */
> +};
> diff --git a/arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi b/arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi
> index 7d399e6a532f5b24385dd837be965be771c7d24c..5a6c882b2f57d57d304869dee877c996cbabb712 100644
> --- a/arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi
> +++ b/arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi
> @@ -120,6 +120,18 @@ gic: interrupt-controller@410000 {
>   						 IRQ_TYPE_LEVEL_LOW)>;
>   		};
>   
> +		gpio0: gpio@4c0000 {
> +			compatible = "blaize,blzp1600-gpio";
> +			reg = <0x4c0000 0x1000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			ngpios = <32>;
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
>   		uart0: serial@4d0000 {
>   			compatible = "ns16550a";
>   			reg = <0x4d0000 0x1000>;
>
Hi,

Since the rest of the patches have already been accepted, should I wait for a review
here before I send this patch to the SoC list?

Kind regards,
Nikolaos Pasaloukos


