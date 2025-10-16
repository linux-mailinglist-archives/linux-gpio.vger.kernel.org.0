Return-Path: <linux-gpio+bounces-27191-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B43FBE1CFB
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 08:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD7D21898270
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 06:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55A82EDD76;
	Thu, 16 Oct 2025 06:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJZ9zG4j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E5E23D298;
	Thu, 16 Oct 2025 06:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760597517; cv=fail; b=U0zOwey6j7bJO1rENuPOU6Z6OrzDRG5zWXAAu2fTJ4inUeb1og9cHWhoECrVnyxqGpKxRPm+aVKrOOgNVt54nMAE9E2Bp7cykfZeRRUGGaah090IOv3VuUzPDH2upXqMo8Ss9nI2KXBiSP+WVRpo913yoImEMPca/gaTVplmTRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760597517; c=relaxed/simple;
	bh=LHnB+z4bPxV+ntjp7MrwJXg+CxYzITi6Z36tcjYgtgk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=maiXRibw5cQBIC5QmoVNeGz2aJPlJCzVSpc0N+1UTZqIP7fIhs/l4QbNjSdNGn+O1twkdEpfVgb3n1szjhD4JnXXpLumCEO4IcZ7mwoaWUMjRzoOnJ1ZjMxVZDAl+I/rz+xdXlv1a36cDyJrdV4m5AwnHu2vRZdxKZwIl5cCqL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJZ9zG4j; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760597516; x=1792133516;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LHnB+z4bPxV+ntjp7MrwJXg+CxYzITi6Z36tcjYgtgk=;
  b=KJZ9zG4jiPatHZsoh4bRoVs7yxbTYhb6KY3XI/ZdHr9ndeK4GvPa/DMP
   7q1RuoqlSPYh4t5At0qgpRIKaMZ2+yZO72NzV5ttalzBILiF/+rWy8Yyt
   xLUh6PkDXD5bGBjPrDSgzQQqDq9A92qlDZhnLdWUllzWaEr7A+cOukj/v
   PRGCb922CrW2zVm5l4xwTLNwxVtVEih8w18XEfJF9HwH9/FMPFfHnmGD0
   zZZYhu9nb3a2FirzW3BV+4EXtAduqxPJAG/rYsja1gjlS/wJWtKAXv3ik
   wr2JQuzIekZvLlXKlV0fpWNHvote4HEo1KhUft3rXQxJJ79HwWV1ik2+B
   w==;
X-CSE-ConnectionGUID: pbZAMRXgQJybhcXoeqLvpQ==
X-CSE-MsgGUID: IP82GgmcTmqGraxlPUEFLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62712245"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62712245"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 23:51:50 -0700
X-CSE-ConnectionGUID: MeWPsR8kTf+JwD9/uwSKFQ==
X-CSE-MsgGUID: Qra5CoSMSJaL/9cyCZZbrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="186776128"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 23:51:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 23:51:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 23:51:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 23:51:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHgzV6d4RZLdwJwgw4mgL9Hu4kHTdFMnJpygdOe7zwSpH7k16iq72ucZqerNB1zw9UVPJkJlkV6K6XHIleZun/zcZ7Mn4lijWZ62ukcw1lWNhDclN+d4Z+wu2hJ3r0Uu4SkdAdGtq6z+J4rvjZcHhbHoKMyfIL52bG6lqepeRrpN6yqMMlEnx+59ibxGcRv8ta0Yk1Z6Fbq9GkrMAF5G0o8JQpdJMEvieA4SL41wkXqaPsIU/gc1fvU0PmzU5xOHW3pGmzoEszxFZLJCLas/zjbU0UB7nLtzpCRqoW25h2SnJQGVCQ0WW0f/qAsCW+g+vMBRvcI2Bs8ekaBtxdJQRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cm3Gr2QmmMV0kiONYAp50Gz5MbjDCrf4g0bZN7bZvuk=;
 b=S7jMMBcT0eBjrwB8Xno2pwl+ODDHbMCWlLTnQUK1cscgVGPqOSgOj/34a+jv8gCi4H6dTYMWFBwDbHvatoIxdNvJbT9jAa4K30GXe7WADkvgW3lXWVdKUjAnwBX8BxSIeA8Y5YmIoyS1pz5oFpXt4UuV6/qYDKGsPWJKN2rHOok2cn8Jpap29SajqPCzRszCZWh3SEH/gurpCANlJxM5JQgU60IpixW/ZyMFPkGES2pudBO4iktWfAwzLlucDEUBsj8rQMqtCVucgjrceAYtFuO1jJhaambFk47f3J0cVES2ogjAXTq+saCXJjl0pelQ3+CdNl9gzZ5oSHz24ACyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA0PR11MB4608.namprd11.prod.outlook.com (2603:10b6:806:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 06:51:41 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 06:51:40 +0000
Message-ID: <5f7a4e3f-0f60-46bb-8448-6750803fdd8e@intel.com>
Date: Thu, 16 Oct 2025 09:51:35 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] mmc: core: Fix system shutdown hang in mmc_bus_shutdown
To: Michael Wu <michael@allwinnertech.com>, <ulf.hansson@linaro.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <avri.altman@wdc.com>,
	<wsa+renesas@sang-engineering.com>, <victor.shih@genesyslogic.com.tw>,
	<andy-ld.lu@mediatek.com>
CC: <jason.lai@genesyslogic.com.tw>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
References: <20251015060714.67558-1-michael@allwinnertech.com>
 <9f666390-653d-4834-800d-8997665b6dac@intel.com>
 <6ac35d5e-7d2f-9af6-d1c4-831725c33896@allwinnertech.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <6ac35d5e-7d2f-9af6-d1c4-831725c33896@allwinnertech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P194CA0015.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::10) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA0PR11MB4608:EE_
X-MS-Office365-Filtering-Correlation-Id: 75cb458e-4a13-40d5-367c-08de0c8075d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVAxekRBVmJWMG1EdzlmQk5CTUhqWFVyVyt4WFJ4aTRtUzdVbzBUV0htL1RQ?=
 =?utf-8?B?YnpaZnpQTHJCNnE3WnVDajRFQzlISGlCK1hEMEZGZWUwNFNZUHZlcUVROVI1?=
 =?utf-8?B?b0NMY01WbFZuTEU5UGdtUFZSaFA1bmk3Wm9EbUl1ZnU3UG1Ib283dUVpV0tq?=
 =?utf-8?B?dnhDOGZ2bFJQbHBmSXY4QUlrSzN3eDIzQlhNVE9NamhuVkhRNWNrbFUwWUU3?=
 =?utf-8?B?bXdSV2tYeEFBdjlKVStiQ2RKQ1R1MzVRL0VLSDdFWDIxZjZYMVVPckl3V2E0?=
 =?utf-8?B?R2R1Tld1T1p3UmZWaWZ0dHNMRUIzYzc4aHZNbnV6OW9SbVMxYjNaTlJrOUtL?=
 =?utf-8?B?bXd3dXFleDloK1g3S2syRUkyVHkvN3JVdW9Jbk9RdE80blBHVDYwby8xSWRQ?=
 =?utf-8?B?S3dWU0x5d2hVbVJ4VGFDT3FCaWRwamV0T2lmazRYY3lEQytBKzZITXIwTTdE?=
 =?utf-8?B?Z0RyNFVHekpNSEJ1RCtvUUdZU29HWEdza1g4VVRhUWQrekdBRTU1TkxyZFBI?=
 =?utf-8?B?R2Z2TkF0M244anZmUGxhOW1ZSFhtMHR1YllXQlMxS2o5ZUdkSDBlVTNMNERj?=
 =?utf-8?B?UWFFdVF1OFg1dEtnUVZpVExrc0U2VFRZZ1M1UGc2LzdjeDRUZWR1dE9mNzdl?=
 =?utf-8?B?MDV6UW5KM3k5aDJvMkdkYlRhNU9oWkVObU9nVHZlNkFzcjhEcTdlajc1VWRj?=
 =?utf-8?B?YXA2dTRRS2NRTEhoQUxQdkdKQmZta3o0elRGdEVpRFVRcCtTQ2dtNmNqdWpY?=
 =?utf-8?B?VGNaN2czUUtXQjRSczZtVjRWTnErc05QdUlKcEpJZndNbXpoNnJ1L2JiU2Ns?=
 =?utf-8?B?ckQvM09VMDl0OWtoYmxUb1hHZHlrbXNjRnJnamxYY25pMUd0Q0QxUDhBRmVj?=
 =?utf-8?B?eStxUHphdkdhT0xSZ3hHRVdJb3FUcldWTVh0bVBJRXZ3aDhtQmNNVUJXanpm?=
 =?utf-8?B?SHM0T0xOcUZUUjNZU1FGR0o0QUQxcGg4V2tuOFhFZmhiQkl6WEh3MGtmbHJi?=
 =?utf-8?B?cFZaZUhjUTByN0FEZU9mMXA5ZStLaGw5RTcvSEZya3JtVElObzVWdEtTNXVk?=
 =?utf-8?B?Q1NHZldocEhiNGdhZENmS0E5L2R5d000bUZHZENGbVJpbjFuRDNkOVhrbFMx?=
 =?utf-8?B?d1lkRUtRNkxiaUJ1ZTNONmJXU2paZkNpSnh4MHlUaXZROUwxQTlPT3YrdTVD?=
 =?utf-8?B?T2VoZnd5VkQzQm1MRlBkQmJHVFRUZ0RPWUltN2E4OTdBMXhRa0Frd2ljenQz?=
 =?utf-8?B?UDlzRWZvKzhQMW1NeS9OOXFEMlNBZUYrbzFzSkhwUkpYZGxKb2FMN2lSU2Zr?=
 =?utf-8?B?b0RES09vd2RaZEp1VTErYzE4cjcxelZPWXRFWjNUNWx5aUtienpYNXBYSldW?=
 =?utf-8?B?Y0xITHRZaFRQVzZhNkV4MEwxR1cyNU4yKzdRYzZYeDQzN2Qyd3lKMTZrMDhy?=
 =?utf-8?B?Z2dxNk55bEV4aTJod3prT2JSRHJtUWhjeTBVSG41b2xpRVJXMXQ1U210RnpN?=
 =?utf-8?B?R0hjMExmWkpOVHVHdUNTclRvQzhTSmlvNk5ZWXZvV2tCU3E1anRORC85UUEx?=
 =?utf-8?B?czlQdDNsSWpnV1lkRlZ0UE5kZmVnbVVlSGFYTS9ubUxKOFJ4U0VaM1hTejRD?=
 =?utf-8?B?aU5lY3J4aThZdnZSRStaZnNGZGZOUG1hSWE3dnhMZjk4UFFJOXdTWVBQOGVK?=
 =?utf-8?B?TTVKdDh4TGgyMVBmaDFpa3ZoZk9YcEg4QTBOMGc1RGZEaXlGMnY5amwyZ2N0?=
 =?utf-8?B?YWlHTitUclQxZHdyRkErRktjbnAvSW5WOVZ1QTNMTkZrMkl4MUNkVGkrSjVQ?=
 =?utf-8?B?YVBnZllwdVdvQVZXUEVkR0lFTnBvdGhENVFTckdLUEtCRTlTNzN5aktucTcz?=
 =?utf-8?B?c2F6Y1N3Q2k1K1J3azN6L25ZcTN3RlR5MUFJNm0xSnhRWWlpeXUzb0pCTjNM?=
 =?utf-8?Q?u3RkSwN/n2IP4qvQmHyeX2I5O6cgjeDh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3MxMTFMTE5yTnVBUkpybEdvWTFvRXYwZUt3dVkyUTVITEVOTGRlWGloOFpF?=
 =?utf-8?B?Yy9tQjBBRGRSQzJEa3BUMjRkTFdkNTdjUldib2hSOHBCSUQzOUNIczlQVzF0?=
 =?utf-8?B?SDBYcVRIck8wVHZXb25uL0JGZmprMUY0UWV0ZjZFQVdULzZFZWhPYnZFZ25Y?=
 =?utf-8?B?ODBjNjhLZyt1Wkk5ZEN1NEltNEN0YUZlZVN0WHVLc1hoM0J2S2V5c3dkSW5i?=
 =?utf-8?B?bGdKS3NoSGZIYm5LZmppejViZ1dMbGxacFFlVDNpYmRaS0NyOW9LZVRmYS8r?=
 =?utf-8?B?ZWI3dVlXR3QwcVByVU5HZjAyZnFiSkRRc3d5MkNmaUhvUmxQa2RlcWFXb2ln?=
 =?utf-8?B?TTRQZEd3bEtwUXpabldlaWFrRzJQSGY2eDNKMjBnbE9tWmVPT3l3YWR1b1JK?=
 =?utf-8?B?VC9nUHJKVkpFN2ZBRHdzU1FQTkpKVWZQeTJ5d1NlZFdxb3N2Q2ZOTHk1NjJn?=
 =?utf-8?B?b3JoZUE0dTJBR1pPOHNnV1ozS1FrRllQMGVaYTc5ZzNnNisrUHBDOEQ5dk5V?=
 =?utf-8?B?OVVXSE04OTdGcWpqSyt5UXNLVk9raHZCdXNFVW1BcjlmclJ0bTdDd292Ylo1?=
 =?utf-8?B?YVJtc2pHL0UxcjRKUW0xTEFXNHlCdjBISytuTy95YjBWNFFjcGlKUEJGSlk5?=
 =?utf-8?B?aHpnak1DNWpHK2VENnVYZDNIMUwrUXVPSG1oSWo5M3k1dFlIaEZLYTJZUE1F?=
 =?utf-8?B?ZG1CeUNxM0hIVzVrTU5HY3Jwa010aVJYWUFhMDB3OFhEMWJXMEdPMmZPU3JO?=
 =?utf-8?B?MUJxeW9UM1BhRzVlQmVaNkh6TnBydjNlell6TFJ2YjBFRVhTSW1qeVBKL2Vt?=
 =?utf-8?B?OXM5Y0pOV0dRNWlCbzZLUi9UNmJhY2dOT2VFdUlOandadkl3NHdwbTFHb250?=
 =?utf-8?B?NHBWMFU0NlpRNUszZ1RzbWEwdFZKOFdtNjVoZ3ZxYzI3OWxkN3BnN1R2QStP?=
 =?utf-8?B?VVM2TXVTSEoydkdXQzB3Z0F1RDdNQlpDaERybUJlUnVEUW5ZblhIRzd5Z0p1?=
 =?utf-8?B?eDR4Q25jZjN0WVFkcE94YnF1Si84cDhxclNCd0xraDdPOWZZT0VDUXNPV3Ji?=
 =?utf-8?B?cGV2RzJrNENyZmlCQ3d5dmZxeHVneU9jdXdCLytEUmtXdWFTbmRtSGJjTXZx?=
 =?utf-8?B?RjhNQmtNR1FBajRlMk1ZamFhcS9SUE1jVU5aNmpYTDltR0xLWGJWV3piaUN4?=
 =?utf-8?B?V0N1UWlXaThYYTdzR3dVRDVoQ21qL0RkL2FETG5QMTRSNll6SE9tMnJOcGpT?=
 =?utf-8?B?WmpjRjc2UExLUjJKN1A2VG9kSEVFVU5DNy8xQWhvVm9kKzJpUU90Nk5naWs0?=
 =?utf-8?B?ZythRWJPQVpVZ0laM0JvQmVwNEwrUmNEMEFsaWhSSHpjdTEzaTJHTTVkMlFP?=
 =?utf-8?B?eVJNUFRJbGVnS24ybi8xdTVTS3ZyUlc1OFAvNGxvSTlKUzZuVTlyLzFNVjR1?=
 =?utf-8?B?bUVWZEpsaUF0SEl1elMzSVp6aDQ5SUVUL2ZkaC9laWFJcDdjcjlUdzBwSldl?=
 =?utf-8?B?QXpMc1R3QjJiaVoxU3hZNnFMRXp3Q0lLT1JZWXY5RGMzNGl5WVJZRjBwNGcv?=
 =?utf-8?B?cE1HOHp6RXpscG4vYmxTSVhTajJLL2V5UzZobDN1SVpNb3RFMnE5QUJ0TnNa?=
 =?utf-8?B?TzhQemRobCs1LzhreERCMy9rQUxUbytSYy9XQ0pydWkxY3prUGtCbGVBYkJE?=
 =?utf-8?B?bmpoblQ1cUd0bmxiYVNTOFcrLy9iRHNmZ2dRUTZKVyt2emg1MVcxbWp4bExU?=
 =?utf-8?B?SWlGWGxEZmI5eVFKRHlMcW5FdjFCcDNDUGxvNE1jVnJRU0VNQlp6MEFhMGo1?=
 =?utf-8?B?bStRbDZ5eGp0aUorTVg0Qit6WkgyU2pxRTdDMitXdTRqU3lpNlg5dHJIQ2RY?=
 =?utf-8?B?MmtxZFFhUDJRQlROYVErKzNQRk9OYnBEazdUT0tPamJXd3A5VnpLUmtSejdu?=
 =?utf-8?B?amFRbm94aldKaHU3eDdtYlBPT3J5Y3BEQmlOdDZoV1hZaGNCc09GTlRzNit4?=
 =?utf-8?B?UStpSlNPa0tDdVR1WUYxZW1ZUVNBd0dOekdpbDd4OEprSmd1SThBcVZkdFEx?=
 =?utf-8?B?Sy8vT3J6eG04dlFxejhqNWkrd3kzbDdjZUtscHUyWlVYeU9aZDZtdU5IZkRW?=
 =?utf-8?B?N2xxdzZvY01kcFM4M1Q0aDMwdklJZG52U3VReWt4MDJ4R3I2aXlXSllsMzV3?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cb458e-4a13-40d5-367c-08de0c8075d5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:51:40.7966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIz4arV7wZBvd47xLVdbcYLFkdJyoGiinS1VmS91ABP99ULrCa1CgjpIDlFj3kmEJQ/McfY7iBveI3N+Viomyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4608
X-OriginatorOrg: intel.com

On 16/10/2025 09:38, Michael Wu wrote:
> Hello,
> 
> The execution timing of this `host->detect` work actually depends on when the WiFi driver executes its unload procedure. 

Devices should not really be removed during shutdown.  The
requirement for shutdown is to ensure there are no on-going
operations and to prepare the hardware for power-off.

So this sounds like the WiFi driver should not be executing
an unload procedure at shutdown.

> This is something we cannot control and cannot handle using `reboot_notifier_list` and `register_reboot_notifier()` operations. Moreover, different WiFi drivers may have different handling sequences for this timing.
> 
> From this perspective, we believe it's not convenient to address the issue in that way.
> 
> We noticed that the `mmc_bus_shutdown` function calling `cancel_delayed_work_sync` was newly added. Therefore, we suggest removing this part first.
> 
> On 10/15/2025 3:09 PM, Adrian Hunter wrote:
>> reboot_notifier_list and
>> register_reboot_notifier()
> 


