Return-Path: <linux-gpio+bounces-23406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1856B08DF2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 15:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4703A1A66D00
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 13:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F90B2E49A5;
	Thu, 17 Jul 2025 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jMkgVEqQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E272E4995;
	Thu, 17 Jul 2025 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752758198; cv=fail; b=RPZHgpaYja9ZWJqy9LCcP8V+m9ju9vPZYehyLq+C3ca0NHrQwESN/KIhRBeVjVgj/Ut9vrRVuZR1zyRxxO5RWoj2TWD6iFj5/MjxKrm85q2HU/wXUiPUGKk4dh4J8yqBm/Aybj6fw2i7KD4Iz2aUHuWdVjxWHWSZSlIDmRYgjKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752758198; c=relaxed/simple;
	bh=z0B4yRxPvSZ9lVDwlZ07x3Rzu5GI79F+dkGioTqCboM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K8d9ogKc4TlROVtY4MRZ0YhXkkNaBU6gmn//AGIgiS1DdMPDkivmxmHig25vYb0gn4UaHGK9abKrHXfdLHOX18BrnZ/bKE858+35HS6z9yTOj7/D1kyg27WTSUnJNbohd7raI3kfMr7vCNc0Zqi76pszUwGbDioI+je7F/I6o3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jMkgVEqQ; arc=fail smtp.client-ip=40.107.94.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D56t2CDvhQEkVWiiXu/LnTAiR6NQQgllWxwm6UFVSr6RSXIWpPXNVYQACWzZeDn/qPhuDccJo2IBNw5a8FbdwqEmPbjlN+T6DFCccgH2gk+Xz/NkF5sfjx0a1rMStQU+New8aHkDKB3SMWGf4nq1lJdXC+EhkhG1ilLU4CJjF6zPAkfN04N6ekaviG/bTPYZb794PgRQ4qMajVMWbETu3dKkbf69a+ujc6Z6Vt8JQWKtcOkMAQ8sf331WhhheuZ8mWDyNdCrJ5zajwu5IH6TPldGS1jmFUNeBovyk2WT/5ubEDkmwl4/TwLLENCS0Sm5jjs5S2T4VeZDRJQ7bA8Y/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9fq7/nXWJBxVyjbA23B8G5Jx9ItYJhGvBCCClBpRNE=;
 b=pI+EedGUPAauLN7BpNz95VOQft2FVF22LBKAj70Lij0ZCQGj5HyEHjAkPIdUoin4ApdnOOrZTAFWE+4HZCowz0LWLeShr7SNnkhJQzbNWaLnhWuNo440JD90Ile6EPyc+URQlIJwi2QaxoKOLMrhFO+A7szYEEappZvd8mJunffDc50urSE3y/abDHxfLgIIp8H2NI4ogWGdaIYucbuuEUWRYEWXkm7H2JpqjlZm7wJlAyVmxr8mTL+WXYOLC+BIiaZI3PBw38fZIdJt69LYsZB7pQ/SwqNg9HwHRU3J3BoiT6gY6wOQePGMQxL5y97uvF1ZVxA4e1G7BOSFc4LMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9fq7/nXWJBxVyjbA23B8G5Jx9ItYJhGvBCCClBpRNE=;
 b=jMkgVEqQNtkL4IkSZTKF2yL0iLm+7J5OzigsizGLhv0CgRgXE9BTyD2EihHzkMJsKt0pzWHd1rLxBb10s4yHTxcWs30lx0ShgkAtq9zboly9HR0zmOulPcoLDw7olKzYPXxiBLKBD7gPA8nITRcAQw+rsEEMEXBlWBiPxDRiTRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CH0PR12MB8531.namprd12.prod.outlook.com (2603:10b6:610:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 13:16:30 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 13:16:30 +0000
Message-ID: <d658a6c5-1d38-455f-8531-9a42a2db2b6f@amd.com>
Date: Thu, 17 Jul 2025 15:16:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: xilinx: convert set_multiple() to the new API as
 well
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250717131116.53878-1-brgl@bgdev.pl>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20250717131116.53878-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0065.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::18) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: fb71c59c-aeb1-45a5-0f53-08ddc53424cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEpTNmM3eTVzVzBYNHdmaURUUTdoYTdmbG1leW1DejZNWlRHRVNINUhxUnhY?=
 =?utf-8?B?SDZPaG0rTUY0ajdLNGRZMUhSRmt6VU41MFBYOFJjbFdOK0pyTFhFRlNnRDNN?=
 =?utf-8?B?UHUvVEFva2ljc0hINWtzRXpPam1mSHpwS0hjanZYNjkzT25nODNtWEZqbWcv?=
 =?utf-8?B?Y3d5R05mVGhrbkpic29McHA5K0srSE5yM2F6aWc3NWROUGhYZ3lyOWIvNmZI?=
 =?utf-8?B?bGhMbUcyWG5UdEtKdXg2Nzc4aWVBNFFheWhSYllvTHYxWktUWXJsYm92NHBq?=
 =?utf-8?B?amRKNzYydGtmWVRpbjFCT3BwZ01XWEp2eVMzQ0IrSjFqUU1Fak1OekVEcUlo?=
 =?utf-8?B?blorMng4S2tva1kvQm1ZTWpQeGhCSWhwSlVkVWpUSlNGM2RyQXFqT001Nkk5?=
 =?utf-8?B?RGF2eFRBZEpHWk5Rb2oxbVNKT2dHN29XWVljREZlM3dqMy81aUdOdGxFNVJp?=
 =?utf-8?B?Rkw1cTZpbnFsVld6VUV5RWR2QWk5YXJtZkh5ZndWVDZXMU9UMFphWVQrcGt3?=
 =?utf-8?B?ZEpHUmdMWldiSUxOcEdvMVRJajZjWWhtY2Q1clgzdDNzalFMQWUweWtxUEdF?=
 =?utf-8?B?UmlFRy9mcFlQcXhydWVLME1SZnNJd3puOEs1ZEhXVlhSdjd3UUNMNmpPQzM2?=
 =?utf-8?B?WjBSTEk4ZGtzN3RRY3ptOEphOUpMeVJWQitoY0VieGY0NDZncGYxbEZtVW5p?=
 =?utf-8?B?SXU1YTNZZVUvYWxRVW0wRmFJM1MzUGRaaEJEaUtLUHFTOVAzNlRFSW15RG5r?=
 =?utf-8?B?M1NYNCt5VWlUcjlMdzdya1VYV01LM0xrNkRYVWszMFcrREJaRGtsZ3VxNXpt?=
 =?utf-8?B?WkNIZE5teDlzYkVKVVZJWWhmc0luQmpHYkNMTVFCUUNKZlB3TkllUjI4RUF5?=
 =?utf-8?B?WUhMaWtHcTZWVGRlVEtnNjBlbStTa1M2MVQwQ3RlS3ZabXBaSGZWY09MZjYw?=
 =?utf-8?B?cC8yY3htU1lCeGhDRy9TcGIzVnRxMm5xZVhCTjc0RFBUZHNlODlrMHpsaTl6?=
 =?utf-8?B?enRRM2ZkdjhieVNZc2NBNGkyVDBBSmRjNHcwb2N2clpDUU13aU01dDRUTUFZ?=
 =?utf-8?B?NGZJUHRrOTR1MzdrdVhzeFVIa3pvK0hNSXA0QVh4OEtoSjNUTFdSV0kyNTJJ?=
 =?utf-8?B?UFNLSFBJeGk4UVR4OW91cjB2d3ZKYWlxeTcrejNIdURVejlFelF1My9xYXda?=
 =?utf-8?B?TW5HTCs3Z3N1c3hHTnpuMjhxeklIbzJiMEFRWTdrSmVMNjhhbzZOcVVSMTdS?=
 =?utf-8?B?QjVFUTAxREpTYXhPSE11QlVrdlJwbnpaaFJFRHovb1Y1aXcvTWpoWTA3a21T?=
 =?utf-8?B?UTdGbEdOTFhHK3QvNExweEx2d1B1Wmd2RVp2MWx5a2JKci9vTUc3NVZ3Lytn?=
 =?utf-8?B?bTBDSzVUUFlDU2oybUFMdjByVDJRVlZoeWZyWlp2WnBPVjZkVGpmbDdrenlG?=
 =?utf-8?B?em9PTVhxbnk0SnRneW4rUEhnSnd5a242Nk50aWNmMFpGSW1pMVFKeHhZQS8w?=
 =?utf-8?B?YnJPb25GVkhiaXFGQWNOcjhVSFdySGFQS0RBRk85WlR0RWw2bnRvYm16b2Vm?=
 =?utf-8?B?b1ZrYmVjYjVCV3JQeXdaQ2h0WmNydmt0UjEvb3lJN1NtM0QvQnR1aDNWNk40?=
 =?utf-8?B?eXVraEFyRGNOVUY3Qlp2U20zTGlMWCtsbVBCcjhnUXUxNFlLMWhoKzdrVHl3?=
 =?utf-8?B?ODB1UnViZ05TVFFhM1dIMTdlYi9jRDNNNFlWNTEvK2xVQ05KT24wdHJidm93?=
 =?utf-8?B?VEpPMHk4bDdGQkFaRHFBMnFsQzY4T3hlY0o1TVZkbVBGTkkyRXJLTkR4WmUw?=
 =?utf-8?B?SWtobW9CRVRBMzh4MDdqMDNlYUN6Yy9BeTRUQmtoNmJPZUd4N2k2QUlzY245?=
 =?utf-8?B?Rzc2WDNBWFpzdDJxZ0MyV3UySlVhcjhRSGtFc2RjRE0xYXBDQmxTdHkwUkxM?=
 =?utf-8?Q?9BAE/6Z/Zv8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXR0YVJJYlc4Ymd3bU1XWUlMaWdJMEFXWkROc1VTU1lWUFUwcHlLR05ZMTNF?=
 =?utf-8?B?Ym1JMkxmYlZQSURqRnkzQTNYeGRVM3daZjZGOXIxU0RlZHUwZ0d4TEwwUXJq?=
 =?utf-8?B?WmZtd1NPOGcybkRKd2ZRSjViaHZmNVR2eExBczZUaG82ZGxuYjlRZ1JlV09y?=
 =?utf-8?B?MWh4Q242MmRWR0RNbVVZeW42VUM2enNnbHFkRXIxUm9obzlGVnprZ0NPaWV1?=
 =?utf-8?B?VDdQNk9XOXg5VVBoeEJ0cjU4d1hxK1lBcVMwb2FSNmErd0ZENzZVUzZaL0JR?=
 =?utf-8?B?cll5NUg3bmFCeTQ0eUI3VzFYSGc1dGZzSzRyWDlFNWw1QWUxR1pVMUlwTEw4?=
 =?utf-8?B?dkROVWw0aTJrT1o4dTF0SVRSTmpXS3gyblM1NzBYN3JQUWhHZUlOOHRiTDZy?=
 =?utf-8?B?bi9jaHFoY05oWkdiOCtkN2t3NU1tNHhIV1hvaExsd2NZdjZOZjJPdjNoS0JV?=
 =?utf-8?B?LzBrckQ0K3NOUmpDbG13OXBJWTB5R2FiSVhvcDBxR0RTL1Mxa0lTZG45ZnV4?=
 =?utf-8?B?QlJVU0tQd1lwZENOb0lmSUFYd1grejhZbStIVWtXM3BnM05QRHRFVURKYVNh?=
 =?utf-8?B?VHM3R2NYMmVnRFo3WGxHdUtleU9YTGpPYzZRaVVRUVNLM0tHamh3cm1KWjRI?=
 =?utf-8?B?blVzSXJnU2N2WlZ3d0IrTlVYWVhZV3lWS05uaGFmbTFTWDR4MUdqblJLM012?=
 =?utf-8?B?RHNZNFRsbTZSd05CUGxXQlkrUXZjY3FaK2VwSkFISXhGY3FGeVpwLzM0QytZ?=
 =?utf-8?B?MTVDZmhvTFl6T2lpYUJzMGp3UUhsdVZnN0VvWFJGaGdnbkl5aUJ4Z2dFcUp1?=
 =?utf-8?B?TFp6M1ZzL3pLWkhVYlFQZHpLc2czVXVBa1R0V1hTeEdvZStBcC9oRDVGaCsr?=
 =?utf-8?B?SzZTU0UxUE40REc0SjJMMUJlU2dqeDZ4VGtQUlFyM3N6eU83Tkp5cCtPVVQ4?=
 =?utf-8?B?bDFLaVk4K0V5VE1UOXUzdDdlMDB4SFdyVEI1YWJ1RDVXQWxKYzFPaGdkRUdR?=
 =?utf-8?B?UmNrdk92RTI3YUJaTkc4TzdxajhuR3dXaENNNmJEb0xsZXBrMjNJTWlQTFV5?=
 =?utf-8?B?eGZKcDVWbUxPZEFiMm8rNjRyQi9EcXQ5dHNMU0NCTTVCSENCZmRTRllHZHJx?=
 =?utf-8?B?VkpNZnRabzg5Y0h2YTJ0QVNyNHZIbnEwVU44NlJWamUzWk5KbS9xNlIzeExI?=
 =?utf-8?B?NkgzWnBvMnR1UjM3dVI0Y1lBYnZzc2FvRXdaUllhblE3L3hyMHZ5bnM0SGp3?=
 =?utf-8?B?VkgyUExCejc1eGlJWmNQc0w2R2xyUnl1U2hUVUltYk9PQTZQWVFnekZlYzJT?=
 =?utf-8?B?aFJKVnNnTDdFaGNwdVN4ejRocllZT0NaWDFKTDBnOFp0UmZtdHd6UHlWYnAz?=
 =?utf-8?B?ZmRWaWE5RUUzaDJIekEzdHVpbUsvdmIybmVGc1Z3TksyZGtQNGlFdERCVEJy?=
 =?utf-8?B?Ukg1NHhGWjc1ZSs4aU1jQTVpWGg2aVlrdU1tM0IrZENGOEFOalpvM1ZMMFZD?=
 =?utf-8?B?M2phaTIzUm5adFc1dElvTkhwVURsWjNpbXFEU0ZXRk5FREZJWkU2OE1ReEtQ?=
 =?utf-8?B?eDI1dTYrdU4xUTBJYW4ySlVCdmtydnN3R21tdnpaT1dtMWJXeTczUklheGdP?=
 =?utf-8?B?Zko4UExSSmVXSnFBa2wzTk1PMVNybDc4L2F5SW9xWm9ocXd5bncvQ1BseDRL?=
 =?utf-8?B?cVZaRldpZlQxU3NoWCtSR0VCV3EyVXZkbi9kQUg0SGUzZUdQY2VSUTBHTUsr?=
 =?utf-8?B?Y0d4NHlOdklBRXR3WGt3ZWJPNlVRR0pQb2ZVNFJSejZ0eUlzTTVTZDhHL0sx?=
 =?utf-8?B?RXFhbjdscWVYVXhhMGxoYzhZSDRTWWlYblVQWDN4OUoxQjZ0SE9mZEwxWlZB?=
 =?utf-8?B?OWx4b0J3UFJqZnVOak1Xd1F2WmZVNVUrcXBHUmJxR2JEMkVzRWdGNmNZNlBO?=
 =?utf-8?B?cEV4cTJlVEdkelBVbFBKa3NhMHJ1VnR6SGxxemU3T2VzYzZvZGM2Q1BXTCsw?=
 =?utf-8?B?MllrK2paaHNSOGtCSUxKZVFEMnBHTFBnbG9VeEtkR3JEcWtrMUNsa0JEQlVo?=
 =?utf-8?B?dXRHWkdMNEp1OGs0ZXFxQlJ6cDI2cU4xZWM0bkxRNENKY3Z3dkhIVk9jTDVz?=
 =?utf-8?Q?4X7RbG5iNIx0bM0SBavfXaOLH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb71c59c-aeb1-45a5-0f53-08ddc53424cd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 13:16:30.4311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Xw4wyxdeQeEsoQkzIbQWM9keDxYlMGFpFKyGQt68I3fg716eAfkm2E67nsHP+IC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531



On 7/17/25 15:11, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The patch converting the driver to using new GPIO line value setters
> only converted the set() callback and missed set_multiple(). Fix it now.
> 
> Fixes: 1919ea19a4ff ("gpio: xilinx: use new GPIO line value setter callbacks")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpio-xilinx.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index aaaa74117980..36d91cacc2d9 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -175,8 +175,8 @@ static int xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>    * This function writes the specified values into the specified signals of the
>    * GPIO devices.
>    */
> -static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> -			       unsigned long *bits)
> +static int xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> +			      unsigned long *bits)
>   {
>   	DECLARE_BITMAP(hw_mask, 64);
>   	DECLARE_BITMAP(hw_bits, 64);
> @@ -196,6 +196,8 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>   	bitmap_copy(chip->state, state, 64);
>   
>   	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
> +
> +	return 0;
>   }
>   
>   /**
> @@ -605,7 +607,7 @@ static int xgpio_probe(struct platform_device *pdev)
>   	chip->gc.set_rv = xgpio_set;
>   	chip->gc.request = xgpio_request;
>   	chip->gc.free = xgpio_free;
> -	chip->gc.set_multiple = xgpio_set_multiple;
> +	chip->gc.set_multiple_rv = xgpio_set_multiple;
>   
>   	chip->gc.label = dev_name(dev);
>   

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

