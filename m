Return-Path: <linux-gpio+bounces-27144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D9EBDCD37
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 09:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6986C3E028D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 07:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8236520B7EE;
	Wed, 15 Oct 2025 07:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJEldf6s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A3D29BDBC;
	Wed, 15 Oct 2025 07:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512152; cv=fail; b=JGFiaCgyB8gpPOdhaIPGEhNeC9TBGqU98xUptOQzVSGzgTVy5H/vGPLKaPtflDNFxhXa4LpaE72Vscb5R2/jMDmrKNXRMpPoEHW+JtsgtBPi2OxxFnCWAfRhevBRMf+RNkefLnbou4D7cZGtWYphiD/HjXHreCQ8lNDBGoPoCUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512152; c=relaxed/simple;
	bh=YPn2oIGUuqEqHwCFqih6LW0OlrJwXEU0athYGfLZWes=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I0Z298l5jQEm1wE+B1/oEwKHBSW6KMOqVjoGs+vtqab0RVdEjIrQEIgFYK32sQBVEmaJW5Q7jNVEhBvP68NnAFH0eESscohEXCFiYf1IZW7Fhtnu2KDnFHtg56AqzhIriR1/ui5sIQRTfF1rZ86OXzlP6vEoWAV5YtXqLYjjN38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJEldf6s; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760512150; x=1792048150;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YPn2oIGUuqEqHwCFqih6LW0OlrJwXEU0athYGfLZWes=;
  b=fJEldf6sx9EChBw6QQ7WuWXZx+9smk8/lmFnY6xCSROZfy8LY4fLHLrf
   Qq2iboR9/VjnjwNab9TFAhar9Cmk/XpDT/t940vle8eelkdMsyRQmTt+K
   pqsxVRmeRJoWO/SaMPa41r0/Qm9ypGojgAbBgWNetJQAtyKYcQZAb1KJM
   2o16adi2abqF+YIXYD+ifvRbRtRQp1vXv5pGr+1SZF252zslQkzJKef5J
   9sXDkJJuq2Q0nRaZNcw6h14QX+aGbZmNfZIYMy92ebhD+eBj5dIdxAKQ6
   p5h+FmrXWSx8/IAeYprOtlbltL2Pw1ywMtFJiSWVfBpnYoWXGcjmQA8qA
   Q==;
X-CSE-ConnectionGUID: Htrs9d1aSmK5QPENIgBZ+Q==
X-CSE-MsgGUID: ii8G8J0MRnSDSM5k5pYL0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80311730"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="80311730"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 00:09:10 -0700
X-CSE-ConnectionGUID: 1a+IDKrJQQqzT2vDJQ/6kA==
X-CSE-MsgGUID: 0tgama1YQj2o/yJTTgljwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="181770786"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 00:09:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:09:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 00:09:09 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQ3eQJeEC+M9nT1vUbCSeb8PMvwYCZZ6oYjbDQvx/yw5wF2SnRrvFu5bJBlw2oyfy7ZsyWvwejZQu7whUI54/dwlrE9roPG/rfPytPIuHVtrJ7PEZ/E8w894esSs+SOSskcGyUAs+gNp/sL49tpGUS72BjMSrdbtCgXzsGrjFg6vhH1yG/f/t6gpLgHbxp5RMnTt9UvCz9K7qoLeF/9ASlheb24K7TeXxSHcwrDXri3RJrP6oOujGIhznDgPenXl3QgERWVqC33fANpgUf/Z6niwAAEgdQP+ZknJOrY0x6HP3DwHWUm9fbQqawD2fOEd9QiMgjqg+bjixuyXczKJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyXfCOSzlxgVM0pnG+MS6Yx+UgRL5S9LHLni/dqeJfg=;
 b=PTmVmIxNttrT+ol7bEIRJowgHFl7ABpBlcCCdAC7bGuzoqwPuSGWobiiaNsnaboWCNixiCmr82j4a8Sx9b62549uMuR8LnQ74qe8B6RpRzaWkB4yYpyk65HtZ5VBqGk7giKETSM3VKuhGTBHnZtfUaPkGRRDf6CM3zCzcAOn7Ycv3w5vLCFg4q0Kao8o4s4pr77kjNh5nsLreCcvMhWPUfBdVmOD0kH+dV7N80jup73YhJRVmFN5pY3VNgr0A/M/oVy53PcB5bQTztvit4oNwvLkixleNAUDNO3UVHVnIuGgBGCfa5JE14YaF9EBJ3aai2vTEpXYFNUNXCXjk7EA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB8570.namprd11.prod.outlook.com (2603:10b6:510:2ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 07:09:06 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 07:09:06 +0000
Message-ID: <9f666390-653d-4834-800d-8997665b6dac@intel.com>
Date: Wed, 15 Oct 2025 10:09:01 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] mmc: core: Fix system shutdown hang in mmc_bus_shutdown
To: Michael Wu <michael@allwinnertech.com>, <ulf.hansson@linaro.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <avri.altman@wdc.com>,
	<wsa+renesas@sang-engineering.com>, <victor.shih@genesyslogic.com.tw>,
	<andy-ld.lu@mediatek.com>
CC: <jason.lai@genesyslogic.com.tw>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
References: <20251015060714.67558-1-michael@allwinnertech.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251015060714.67558-1-michael@allwinnertech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::11) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a25a0d-1f29-4ff8-ced5-08de0bb9ba59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTBiYzJHSW90WVFoQ2czbSt2YXFzaHdnK2s4aTNFa0lCbG9nbFFmWWZkTzZz?=
 =?utf-8?B?WjF3V0xHOUxCQUt6a0FnTk9iVVBwYXZnREI2Y2t0NStwaUJyY2hLSUVyQkJn?=
 =?utf-8?B?c0pCbkZKRTlpbWlvNXdLVjM1cG90ZVdYT3dITEhNUlVIZVRQT0xiSVRWekpj?=
 =?utf-8?B?aS9SZ044RXVzeEp2SWhzZ3BpemNEbDhtaGtFamt6T2pzRENndTJPdVN4UHBj?=
 =?utf-8?B?VlNTbS9OaHVFQVVSRHZYOS85UDMzK0RXbWFlWEZFQnVqK3VtU3luck42R1ZJ?=
 =?utf-8?B?SU9BVTZiaHh4T1RoUDkwTmRCV3gxbmQzYXFZa1B4UUwzajUycks4aFl5emJo?=
 =?utf-8?B?cDRiUHh5Wlg2ZDVISGxKT3YvY0hOTWdJM3dpdURXS3NPdDlFUmlaKzZVOWpG?=
 =?utf-8?B?bzVpUUF1YjQ4TG1OaUtKOVVLYmoycERKUTVaYTMwS2hWQSs5V0hvTlJ6SHMw?=
 =?utf-8?B?SkJjVnVKZDdlcU9oYXZBYklteWRpZjROZ2kyS2ZWYXgyUWl5Z0s0Y2NmSkVz?=
 =?utf-8?B?TzVFeHNZVFZSN213NXVzNSs3ZGNnZU5LRTVSeTFPQVpRL3k1UDJyRkJhclhv?=
 =?utf-8?B?d1JvWDVuZTk1Ymk1RldiTkR1SDhRZDMwbFA3NERwd3c3MVNocG94ZjJERVZL?=
 =?utf-8?B?RFBpL2gvd1RTYkU5a2lsRFRadVU1M3NIYVdqYXZ6ZUVXd013WjYzQVZZdDZV?=
 =?utf-8?B?b0lRSDFDMWVTaUhtVkxicjM2ektuMjJVRXJ0SXNNMTN1N1gzdVRVUFA5bEM2?=
 =?utf-8?B?aU1UZmZpcTk4eGp6N2tLTWI4cXgyL3ErYnFCNEJYbno3dzhJMEgzejRPSjM1?=
 =?utf-8?B?YTFsMHF6WUQ2V1RtMXBuOEFYSDdidXJtbnRZWkNQSFJCWWlpYzBNa3EvbUtz?=
 =?utf-8?B?TUI4RFNCeEkyZGxRdlFPRVc5WHppeVFzZnZTdklKNjFYQ1ZobURMbnp5TEFX?=
 =?utf-8?B?SzROQnE3SWVlZEcxNlBHNlNuUy94bnY3SXM3VkY2NEJxTGpnZElwcjd5M1dv?=
 =?utf-8?B?ZkNCaUN2M0JYN3FxZ1dxeW5mZ2xJdUExaW1hL0NORy9nczFOY2lzVE1reWp6?=
 =?utf-8?B?aTl6b2tJbWZpczQxcmlOMzlhZ0o1aUxXWVJ0cnE5RXM2TkwxaU1CdGFkeVo3?=
 =?utf-8?B?RkJQL1o1ck1JOEtQZDA4TkZuU1BMQ1BVWllWbTc2b0F0TXlmSHV4eEJTR21a?=
 =?utf-8?B?bk5UTmpST0ZDeWNnYm1CZ0RaZGx1dlFQdWQ5M2Q2WFBXalFvUyt4T3JUczJB?=
 =?utf-8?B?eVRxN2x5ejVSdFJpYmtQSkQyTG1lK2ZEUDJNNjYxL0R1K3RncWRyNlhnclNx?=
 =?utf-8?B?TlVXUVRKa1h6dHdNMXpXREszZURPa3g0RklYQld1M2t4ampSQWRua3ZpWHlv?=
 =?utf-8?B?TXRiUGJLbTFkWkdTRFllQXA3OXpkL1hnUXRIZHZjaXFBQ2NpYThWSmU5bUht?=
 =?utf-8?B?YklEY2thRnUyMGc1NHZGMHQvSGVhVndLQ1paenIvblliU2FGa0hzeHYzY0h3?=
 =?utf-8?B?WElGVVd3Q3JmaTQ4QUVjM00yejE0UHA2ZFhWRkdhNnlaSDVVeTNLUWhxRFRq?=
 =?utf-8?B?OFdBREZRcVM2dlorKy9VWElIUi92b2djYXM0azcxR1ZBb040WkYzaWZGbTgw?=
 =?utf-8?B?ZjRaQlhWVGh1dlVzaXVxQUtBc3plVktJWE50S1Bma1NsMjQ5RjdvTDEyakky?=
 =?utf-8?B?dTkrTWFRWEdRMGxYVktMYnVmaWRGUlYzU21BaXdUOGNwMDNVajZrN00zVm50?=
 =?utf-8?B?THdSY0NGS0NIdWJ2WStRd0ZTZmJMQnFuOXhqQ21Tb0dIZ3k4cWxNdEg4OGFw?=
 =?utf-8?B?NmdBclJaMzFOeWlRWGg3ZklqRUppeWZ3dlNkUUJVOWpUWXRNZ200TmFIcWhF?=
 =?utf-8?B?MWRUTnQ4d0s3WHJzRkJEa1h2Z3dHTEVhUElNamRod2dBVEVIZE1pZjhRdHAr?=
 =?utf-8?Q?sSCqVag/oAJsjLwPn1bJ42gjY8U8fYi/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWhBSWdId1duNEMybklXNVNZZ1YxYzdKM2EzSHd2ZmZac0VKQlUyazZHQWdG?=
 =?utf-8?B?UTF3UDd0Q1VJS2QyWDBhUWpDYmQxTVVsQTdnd0wzS1dUVGtBbGFNK1hNZHlp?=
 =?utf-8?B?dnFaMCtHOWREQkEyZDZnSWI5R09ISGxhMGZDK1dpd1NwaUZtaWJwMktqeEJ6?=
 =?utf-8?B?Q0lXcUZLOTEzQ1ZWV21idytoNHY4anVmcUh2RW94bEQ2bFVkcTNObENCSkZE?=
 =?utf-8?B?RHhiK0tVZVRWUURIRzN4cGthanNsaDcrbjFVeXVmSklTaUxCckM2SFZ1Mzl0?=
 =?utf-8?B?UVZTZ2U5VFpOTTQ5dGpNeHBoSTE0bnE5VEIzMGhBZkpZWDlKTzNMYUtwYnRq?=
 =?utf-8?B?TkpMRENNeGV0eDZyaTFLTHlDem5kQmd5MXRRQ3FubnEwdG9URS8xL3dyWC9q?=
 =?utf-8?B?THhudEN3UXJiMjZFQk5RbTlueWFlNjl4ZU1rR0cyY0VYdFdZT0lMdVd3dW5G?=
 =?utf-8?B?dUxCeFVuS3dKNEViSlZQZ3krdEo2M1JoYkZtSStCdUxzdHBBdkhkVnNCY2xi?=
 =?utf-8?B?alRNVWZPWmRka0ZxWGdINWorUFI1YVlZdG1URlZBbExsR296dTJtM0ZnalR4?=
 =?utf-8?B?WkFQTWhmNDR1NWJJbHJoWlFyKzRSZXE2eDRMZDhEOHBDMWpHYlZ2YmRmWUZK?=
 =?utf-8?B?RUZlQ2tTSVN1OVhabmFzMmxYdmxncUpHT1lTM3RJNTN3eVVDNElyWFhaVENL?=
 =?utf-8?B?bC9ZOHBJSzJlN2pvUDhwSW5xeGhDQmJaT3VHRWFDeGZxUVNRYW4vd3FxK1dL?=
 =?utf-8?B?eXVkdElSOVhwRTZjc0RwUzZ2MVEwVkhZVCtjUSthTTJGUThXWTNHZW5FWTZo?=
 =?utf-8?B?SitmU3dnWUNyTnBzOEdXKzdoK2tFeGFtVmhJbFhJN1QyL0haY214TEgvbFNS?=
 =?utf-8?B?ZnZsU1U2VjZXWXdqUnFjODQ3SjVtSWduUnR2d3hodUFZNW9BUmdVUjQ4a0o4?=
 =?utf-8?B?VjRMajJPUDRmVitCREViTVVpbEQ2bzNqbDlmWkZudVJubTFvNWhVZVVHcC9n?=
 =?utf-8?B?d2ozSDRpRStOTkxWTlpDelJyMVpCNU1iVkFTcmlTbElNZ0dUSU55b1c0TThN?=
 =?utf-8?B?bUlQNnFCRTZXaENJeXJKZ243VFFIbXFkZTBqZHdUc24zYVBGNWp4ellGZHRp?=
 =?utf-8?B?Z0pzN0FVWEFLa2FJZzE2VWZvUktUcEFoZXM4UXptYlI3ZDVPa0tuK2FzVnJ6?=
 =?utf-8?B?V2lzSWkrTUc5RlZYN1NlZkRQNnBDOUVWd0F3T2JLbHVncDFzRnZMbnFsa1FW?=
 =?utf-8?B?bGk4NnNaTFNOcVJMQWw5Tm02ZDhiY0dVUFpXSVloUGp4a3RMNnpWTjVoWHhT?=
 =?utf-8?B?Z0haa0p0T1ZQN29LdzJWeUwycmlxRjVwQldMVFBiWGlzSVp4aUNBQ3FxQ1l5?=
 =?utf-8?B?Mlc0eTJ6SVFJdVV5VG1oN0VVVHZiNlMwSEkrenJEamRLemdXU3hmTjgxUGRX?=
 =?utf-8?B?RlpQenVMaUxZUTBUT1E2dUwvN3Y4NkpwYVl2all4aTJ2SDlSUWpYRUVJSnRo?=
 =?utf-8?B?OWxLZjJWZ0xSTjRSeUZoYUNIQzZWM1FqV1RiYVcxWStCSGtaR05sNFRONmdT?=
 =?utf-8?B?MGNvTGtMMUVWMzNKdE44QjBVR2JaU09qc2pMYTQxQXlYU29RUXhHZERzNzc5?=
 =?utf-8?B?QS9SNTZaQmJWV1RKWmJic3FzeWgzNDJxWEhKZ2FzUDU4L2pqN2FDN20zU2kv?=
 =?utf-8?B?MmtGUlBVT1BzNVNKSXVpdGFFdEg5dXl4anNkam9kSWFzeUJ5NnFzRm1BbHBt?=
 =?utf-8?B?VFNtS3RIeFJoWkNMYzFqSEV3MnM2bUhHUWZnOGxOTC9JSEl3eVpNUHNROThS?=
 =?utf-8?B?K3pBN0poZGR4M2JjZndtUnJtOFBGQ1k3bU5kaGxrVUNTMGlGT0h5Y2ZTc3pj?=
 =?utf-8?B?SUlXTDV2NkdMS1VkRGh3RVVSVTRwSmVFdDFRd0lOVVBycld5emE2SU5TQTRI?=
 =?utf-8?B?QkJHTHgwVnovaTRqYS8rUEJ6cmxKOEU3b1dmaUFlRS9YWXJxbWdvYU1GWUFl?=
 =?utf-8?B?aU56cmMvdkV5OVdXMjNhUXFCVi8weWZFdWdzVkpkNDNrVzdvems4cXVaUXBS?=
 =?utf-8?B?SFE5Q2lEcHlMcEdSRkdENW9RMEZ6OGl3UXZNaTFXekRCVjcvZ3VsL0hBaUp2?=
 =?utf-8?B?dksyZWFZa1JJcXhIaWpGd2RnREpXQzJNN0hpcWg1MlJIbER4TTRxdWlNMi9M?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a25a0d-1f29-4ff8-ced5-08de0bb9ba59
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 07:09:06.0657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUfOZeLQPfM26Xmo7b2CF2MA41ctfKrwhd2aS2Cf6etqkhNwB1mooFvoZgTB+AGpSDu0iMj8j7VhghlHjXPSOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8570
X-OriginatorOrg: intel.com

On 15/10/2025 09:07, Michael Wu wrote:
> During system shutdown, mmc_bus_shutdown() calls __mmc_stop_host() which
> uses cancel_delayed_work_sync(). This can block indefinitely if the work
> queue is stuck, causing the system to hang during shutdown.
> 
> This patch introduces a new function __mmc_stop_host_no_sync() that skips
> the synchronous work cancellation, preventing potential shutdown hangs.

mmc core must ensure there are no ongoing operations racing with shutdown.
Leaving the work running does not look like it would achieve that.

Perhaps it can be cancelled earlier?  There seems to be a "reboot" notifier
associated with shutdown, refer reboot_notifier_list and
register_reboot_notifier().  Note, in that case, it is also necessary to
ensure nothing can queue the work again.

> The function is used in mmc_bus_shutdown() where blocking is not
> acceptable during system shutdown.
> 
> Changes:
> - Add __mmc_stop_host_no_sync() function that avoids cancel_delayed_work_sync()
> - Update mmc_bus_shutdown() to use the new non-blocking function
> - Keep the original __mmc_stop_host() unchanged for normal operation
> 
> This ensures graceful system shutdown while maintaining existing
> functionality for regular MMC host operations.
> 
> stack information when an error occurs:
> INFO: task init:1 blocked for more than 720 seconds.
>       Tainted: G           OE     5.15.185-android13-8-00043-gd00fb6bce7ed-ab13792018 #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:init            state:D stack:    0 pid:    1 ppid:     0 flags:0x04000008
> Call trace:
>  __switch_to+0x234/0x470
>  __schedule+0x694/0xb8c
>  schedule+0x150/0x254
>  schedule_timeout+0x48/0x138
>  wait_for_common+0x144/0x308
>  __flush_work+0x3d8/0x508
>  __cancel_work_timer+0x120/0x2e8
>  mmc_bus_shutdown+0x90/0x158
>  device_shutdown+0x204/0x434
>  kernel_restart+0x54/0x220
>  kernel_restart+0x0/0x220
>  invoke_syscall+0x60/0x150
>  el0_svc_common+0xb8/0xf8
>  do_el0_svc+0x28/0x98
>  el0_svc+0x24/0x84
>  el0t_64_sync_handler+0x88/0xec
>  el0t_64_sync+0x1b8/0x1bc
> INFO: task kworker/1:1:73 blocked for more than 721 seconds.
>       Tainted: G           OE     5.15.185-android13-8-00043-gd00fb6bce7ed-ab13792018 #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/1:1     state:D stack:    0 pid:   73 ppid:     2 flags:0x00000008
> Workqueue: events_freezable mmc_rescan.cfi_jt
> Call trace:
>  __switch_to+0x234/0x470
>  __schedule+0x694/0xb8c
>  schedule+0x150/0x254
>  schedule_preempt_disabled+0x2c/0x4c
>  __mutex_lock+0x360/0xb00
>  __mutex_lock_slowpath+0x18/0x28
>  mutex_lock+0x48/0x12c
>  device_del+0x48/0x8d0
>  mmc_remove_card+0x128/0x158
>  mmc_sdio_remove+0x190/0x1ac
>  mmc_sdio_detect+0x7c/0x118
>  mmc_rescan+0xe8/0x42c
>  process_one_work+0x248/0x55c
>  worker_thread+0x3b0/0x740
>  kthread+0x168/0x1dc
>  ret_from_fork+0x10/0x20
> 
> Signed-off-by: Michael Wu <michael@allwinnertech.com>
> ---
>  drivers/mmc/core/bus.c  |  2 +-
>  drivers/mmc/core/core.c | 14 ++++++++++++++
>  drivers/mmc/core/core.h |  1 +
>  3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/core/bus.c b/drivers/mmc/core/bus.c
> index 1cf64e0952fbe..6ff6fcb4c6f27 100644
> --- a/drivers/mmc/core/bus.c
> +++ b/drivers/mmc/core/bus.c
> @@ -149,7 +149,7 @@ static void mmc_bus_shutdown(struct device *dev)
>  	if (dev->driver && drv->shutdown)
>  		drv->shutdown(card);
>  
> -	__mmc_stop_host(host);
> +	__mmc_stop_host_no_sync(host);
>  
>  	if (host->bus_ops->shutdown) {
>  		ret = host->bus_ops->shutdown(host);
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index a0e2dce704343..2d75ad26f84a9 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2336,6 +2336,20 @@ void __mmc_stop_host(struct mmc_host *host)
>  	cancel_delayed_work_sync(&host->detect);
>  }
>  
> +void __mmc_stop_host_no_sync(struct mmc_host *host)
> +{
> +	if (host->rescan_disable)
> +		return;
> +
> +	if (host->slot.cd_irq >= 0) {
> +		mmc_gpio_set_cd_wake(host, false);
> +		disable_irq(host->slot.cd_irq);
> +	}
> +
> +	host->rescan_disable = 1;
> +	/* Skip cancel_delayed_work_sync to avoid potential blocking */
> +}
> +
>  void mmc_stop_host(struct mmc_host *host)
>  {
>  	__mmc_stop_host(host);
> diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> index 622085cd766f9..eb59a61717357 100644
> --- a/drivers/mmc/core/core.h
> +++ b/drivers/mmc/core/core.h
> @@ -71,6 +71,7 @@ static inline void mmc_delay(unsigned int ms)
>  void mmc_rescan(struct work_struct *work);
>  void mmc_start_host(struct mmc_host *host);
>  void __mmc_stop_host(struct mmc_host *host);
> +void __mmc_stop_host_no_sync(struct mmc_host *host);
>  void mmc_stop_host(struct mmc_host *host);
>  
>  void _mmc_detect_change(struct mmc_host *host, unsigned long delay,


