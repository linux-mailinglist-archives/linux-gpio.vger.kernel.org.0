Return-Path: <linux-gpio+bounces-38248-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zqIMJ0BMKWrKUAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38248-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:36:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAA7668D91
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:36:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=iVQgvprM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38248-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38248-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7DE893008447
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 11:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DCF3E2AD4;
	Wed, 10 Jun 2026 11:27:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE453E168A;
	Wed, 10 Jun 2026 11:27:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090863; cv=fail; b=I+pwtrNirC4OqrwUNgFMzVHpljDeOnKnd8pc7tJ2la92HEI/g/yQV+yadBThptn6FjMhfOacnYsl9fQdKE9Zswx8cHUzugs6PmBbZijFUEgVbRkNtPuRm0m6Ji31q4wNJ2A239EXou3U6vTAbitDP7rLEtwRBZk4RmX27w9lYyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090863; c=relaxed/simple;
	bh=xxO08ZTcvnIi6RPXOr0BdUo8+/kdOcha3/CVK3zb8JM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eVYO8J39DFaR7GYPUxu0ifDDb/Om/WflF3heT/TAJSYxy8V1ZC6Q0ONCmqSeBz7xJw0qdFpMqC91zgSG+JUBJNcfVYHQK6kt5VFZkw1mFO36TSbBxOa25NvsYIbJHrQ/hHobXSkHJcXbaHRNEAW19rkpAYOV0g6K0cs+vmf1TJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVQgvprM; arc=fail smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781090859; x=1812626859;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xxO08ZTcvnIi6RPXOr0BdUo8+/kdOcha3/CVK3zb8JM=;
  b=iVQgvprMNTffn0qnEhiNzPib8Mv9nthKYXFktOaCqaJF26tR7s75hEQE
   ymBxNc55IeRNs4kW16roRC5XPJjwpaNcYFm/IzYDNr8+Wokr/zCHomCY2
   AckLrLquGAFJZELWJOBv6R2neha24ynjpgIlIGr1SVU+VuLslHQ6rR0G8
   EIzsje70e0Hf+ZdqPt5eI7lBp6aOkR/vxc+uI8l8PqFFOaS7mvfTwneNy
   s7XLAFGt52UIgZ8I/SFtVZ1RLiG0Xl1gi9lgh1TQ5g6LPVvgIViZsRKXZ
   65uibFbPz+opnlr7Q2V99dIH8xATPNce2hBQ5QRZhEB3jwENkhMtFl2Rx
   A==;
X-CSE-ConnectionGUID: 6q7Nc9J8TJu2C2clq7oOQA==
X-CSE-MsgGUID: Ubtp5rt8TV2KL6G9IW7LsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92199161"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92199161"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:27:38 -0700
X-CSE-ConnectionGUID: MtnopH1AR/+I6jqlwcniZQ==
X-CSE-MsgGUID: 3VxJvPguRW26nimBBDaMhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245014894"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:27:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 04:27:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 04:27:37 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 04:27:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhvE8JZeNyooUnACzew1ajOPHzeGyW6zsgcT0VdY2zL37+GVMOo/p9wILEw9xqmOLjNJsftBXZFOrIQ99XindH4v6MoriBaKuCNZUbjvtOJDrgvzmlma0Z57awrBeWELjja5qTBpG33Ugq8SBydBayI8JxVx45+RmuNnKnLIQ35P+6lYPXDV7YTF+o0weFamygmvGoCNr8PZWIiKADV73eheJC3X9RIbvOFElRz+B0pUu4nAfJmLRTcESExiWUBLVAAg5rq9ShIEwK4Y/ofISLEL1myVPfpp5jZiavQvkfkHBFuCJJpF1A3cLMnCfiFaldhmUMZWDEwit7fEFrfbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfgejuPAE6TCL0UGKVL6/q/w443lzw+LINrCvgb+Gsc=;
 b=btaCumX9XzXNC/R5sQCnE59aVt7QTnkq33EBk5IFkImDopTWFb01kFhpiTnuJ3jn8VUmp7QepPDLVXajQxJh+8/i3X0UiEt8oT3bcTvuKqz0jx8Re5UKcrSFx/uoJ+zrd1M0Q7UZqZerInUjtMALCiaAZRhbdxFYJ7EAiLluSTnjqfWmAEHTzqN1sMWa0DV4FJW+ULvihjmHN642gWSCVWcIY0zqAHgO7y3Mr5KT7rTtuz1im5xHfe8GWs2BbePGXdsWM73BrgLhepZoPNg/qZNvekAyxW7Rpfr2GGe507UuUMy9DStyNFA6SCwTdv4ppOLqgenKtTgZKXB2nLiGVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CHXPR11MB9674.namprd11.prod.outlook.com (2603:10b6:610:2fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 11:27:35 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 11:27:35 +0000
Message-ID: <9ad67346-f9bb-4f72-8f0f-b3748371b8e9@intel.com>
Date: Wed, 10 Jun 2026 16:57:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "i2c: designware: defer probe if child GpioInt
 controllers are not bound"
To: Hardik Prakash <hardikprakash.official@gmail.com>,
	<linux-i2c@vger.kernel.org>
CC: <linux-gpio@vger.kernel.org>, <wsa@kernel.org>,
	<andriy.shevchenko@intel.com>, <mario.limonciello@amd.com>, <brgl@bgdev.pl>,
	<basavaraj.natikar@amd.com>, <linusw@kernel.org>, <nathan@kernel.org>
References: <20260610083701.18663-1-hardikprakash.official@gmail.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260610083701.18663-1-hardikprakash.official@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0246.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::13) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CHXPR11MB9674:EE_
X-MS-Office365-Filtering-Correlation-Id: 770d7192-9104-4de7-35fa-08dec6e344d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: OTBEzJUQMth50Ox01YZg+FJOR7PR/XbT1YmqdC+rGMW3sMGDsrRq3a7nGan1uNv6wdwoiAT+RIyTN+7t1mSak0AZViwvLjSy8jDaIupEM+OanQg4iYXwvl2YFMkhZyW8A4Bs812g79tQT202LFeZWo5lWpX311u0GEp1GoRA87RSikwGyvTigOqrVH2vXqVUlyyhtCuEl/OLJ96VGhqbbI/ddZUhIYFmCJ/g9ld/YOWogvW1qgguyKgZPD5qzIn55WrQ8NuAnimFtIEBi01ZyYQKpPEPxA5QWhIgRB40zRVPqtGenP0bjEvciTvrhBfF3vg86ht6ZLPXtXElgortTCov00CeBayJplVCRnwKTgM/dCeoJ//N6vp/BxpQN2xTHN4JlWZBrtmXYavBiq8NCpy6BdztAfOMp35j7kz0esdCJjsFKf3yjj7pEbch9tEv7q8eKfJsJCkX2RQBIDqCuZMw1fSVUH2yEgM96NWiUbpdykm9xmSGg08bur9jxKlW7UkPwGBETWws0DHFiDW0hdPCI92ntERS/4uPA6jmwVK/ScJ/yBL/aSMJA/ffmA5Pcrh93++xDyL6bMf3DaAlHSe+4dx/r48gV09VUpGz63Fe9SlQaJuzIaniHWZc/noa6MMfiJ0NeEGWus6w04oxmpgPCbL/t0MP6+ReOSK7XMqxnsO6IPdy4ppjsBFNhF07k6FPraGDe+ErhFJG7oOJtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDZYOGJkVHJsWmR4VStTZFAzU1VpcDJxUjg0alVOUFVPZTBWbU1BRGR0YVF1?=
 =?utf-8?B?RDcrdnpWemtxaHoybWk5VUVtZDh5R0Yxc01hblFxY3hhNHFDaHlQaXcwQkMz?=
 =?utf-8?B?aTBJYWIra08wdWpEWmtoQ3Nnc2lieXJHSjR5OHZIYWFwOCtLaTBUZ1BsM0Fa?=
 =?utf-8?B?amRZV0NnL052SzZCb3B5OFJ1ZXl5dHlhWE1VUCtXRHJNME1MOGhySzRkZ2NX?=
 =?utf-8?B?SGFBR1hVV3FlanpDOENwNmFSNUNKcU9CK1Q4a2hrV1ZYTXIxL3QvQnNkaFEw?=
 =?utf-8?B?NmJWQ24xWDBJNVprNkRxSmowZ0IycS9VY3g4U0xxYVQyMzNvSk5vNFZUeXE1?=
 =?utf-8?B?a0YwU2RjY3JqQm0wMmVDQUd0eEFQZjk4NSs3YUM3YnlLZ2V3ektNWEVLRjJj?=
 =?utf-8?B?ZFh0QnVHVXA4eEx3WTczSEg0U3dHaENCOXRqTVdsVTUzVUFza0RkYzV1aERk?=
 =?utf-8?B?RkpQZHMrR3BiSytCbE9aWlAvQk5tQXNhcUc4Y3hxcDMwL3U5MlJEaFgrcVBL?=
 =?utf-8?B?bVAxUmZLQ0dHYnZ0TjZTVUovaExUbFpaNTNRYTRKMXgxK1hXTWdZVzBTamFI?=
 =?utf-8?B?VENraEFnZmIwWVJSam5HWlE5LzlNVktkbkNHcnhwaGVRQjZYaTc3bXpRY1Bu?=
 =?utf-8?B?OWJ6UDBGNUZtdHVwS3Z4VWJ0OGYzRTVxTmRvSVMwYkRHRVJIRWdmQWhBOEt4?=
 =?utf-8?B?dWN6N3ZZVUQ0OHpMZXlIUUlPOUx6ZHNoUEtOc2NXRm42elNmK2hmQVo5YXVF?=
 =?utf-8?B?UWNHbEJmbmd1RVVnYkF0SCtoZFpjUjZtN25RQnowSWc3cUVUUWxabTZsTTdj?=
 =?utf-8?B?Z2s0OFAya3FnK0tGSTF6cjhmMk1mTm51U3ZkeDZOVzd3S21uRkFNOU5pKyth?=
 =?utf-8?B?c0xMTitqMXNwREJhOEZDbnNDaUJOUzBtVC84M0VXN2d2T0o2TzJLU3ZxbWlO?=
 =?utf-8?B?QU1IWWhJQks2MWQxdXY2VFFkd2RNemtaUTVZTURudERaaHMzU1RsYnI3NWZ1?=
 =?utf-8?B?YXZRMTcwdGVnNkdMVUFZU20rTDA1Rlc2bXQ0MTVJUHUvcFVldWo1R1NoUUlC?=
 =?utf-8?B?bXB1S09FMzFHQlh5b2FuTGlhSEZqQWtiVUM0N0VSd3NJd2wrY3Q2Zk40UHN5?=
 =?utf-8?B?YVVCcE9ucWlYbEdRTzhjZWNVNDl6MzdmSlhsUUpjOTlaK2RQMnpBMTg3SXJE?=
 =?utf-8?B?d25sN2hUMnhjM3hvY3Z4MHdQTkxpdVExcGZXVEFwbk4zbE81VlpmdENRRmUx?=
 =?utf-8?B?bXRlT0s2aitqTVpzaGRLTkNZUGgzbmw1blQrNjkwOUt0S0haMTRVWFNVSkdi?=
 =?utf-8?B?ZkZYRDhhOVJERU5PZWpYclh1bzZuOGl5Mm84dFNieG9PL1RQN2N4U1l5UlY2?=
 =?utf-8?B?MSs2VmFOR3VkTUZkWVZHL1liRHJwMGZhVzZCTjhWVnVjSjJPd0w0Tjhkb1Na?=
 =?utf-8?B?V0lycVJQZmhnS1F2Um9uRzl3TkpXcGF5LzRpNHJHaFdPWDVxSnJEZFJPR1BG?=
 =?utf-8?B?K0I4UDkyMHZ5ZzVqVi9jWmM1aTdNRFo2cWxZOXNpUHFscWsrdSsvTnlWNmgz?=
 =?utf-8?B?RXNYZzhNMC9yRmR3RVN4b04xS0tQTnFIQXRQM2FKQVFIS0h0d0FqZU1wb1l2?=
 =?utf-8?B?S3o5NGdUOUlWMGtHL0NkcHBhK2ZyOHZLeXVGRlpmRmNNZlFNQ2VPVkdtSnI5?=
 =?utf-8?B?SWV0eDB2NUxYSkdmWFd4bXdxQzN3T1gzWjBOa2tpdHNZaVBEOFFoaE14WFJa?=
 =?utf-8?B?NEFpaWEzc3ZxTUZIZCthc0lvMktKc0hOdmhPK21VS1dHa25WTlNQYUVlOVV3?=
 =?utf-8?B?OTBNNWphVllUNWJBMTY5V0V3NWtKZ2xlbENFenViZ2RMTTFWYVhySlAxQ0Fi?=
 =?utf-8?B?QisrV0x3TC9ocTBITUVjOEY4TlU2QVRDcVNuNlhpb09wZU5aeWY3NU9OSU1S?=
 =?utf-8?B?Z0hHUzluQ2FHb2hIMTBBcUluR21rNloxWVgzRkpiaUc0bnZRTjUwNFZhZFlq?=
 =?utf-8?B?ZlY2SzJ4Y1lTZElpRjR6UDR6anlOdmtqV3hkMEF1SVFhUXcyN0VLOHI4dUY2?=
 =?utf-8?B?eS8yK3QraGh2MncydFQvTGViTlRYbk9LQ0c4MVdlODFXaUZFL2M3cmJuQVdV?=
 =?utf-8?B?YjIxUkw5WkxDaFhtcWg3Mlc3TGJLWktXSW16NHp4YTBBT0FRd0ZleWYvMGl5?=
 =?utf-8?B?dElUVkJEUy9QbjE2TUxHbzhmdmd4VE54YzJ0QkkwcXdwWXNib0N6U0I1V1Nj?=
 =?utf-8?B?c3ArUWwzTWtEYXh3UFpRL2hVUnZIdmNXV0VycEJ2aFlaVXYrYnJ6b3ZwRGk3?=
 =?utf-8?B?VkpPV2xMQTlCcjI5cDRPRVVydWI4V0V4OGNTcVJUVFZQdHlWUk5mVHd4RE43?=
 =?utf-8?Q?LpdThBi05vTZXtPI=3D?=
X-Exchange-RoutingPolicyChecked: T902RyUVbBboviCzy5gg8FfwT8OyKA/lSLFoTbdUyQEdmwGbL+EbCwt2dH6KEYNslPy9dpeWzZn5iwjY+iLgoJwzNSh++JEIsTTPHIh5Zyj18698rYiV7erx6ILajZbC1jMqc1H6D3MtoTyNFzXMPAT3D/x7dH9tQsG2kV/NfeYRs2VSoUukkT6PERbIYHPrfUJLOWiE3KaU6gCovnw7P0c2twlRgkp6V+bBGzXWYsqRcU3R2FoOlwoV1cnLMTiG9qXZ9hVAH+giCxGOLHGvmnFnCszArn56afE8MKnfvBORU/lXPFzJV5kh3CQwNLk9Hgk8qrJ2+ZVew5A9knwQKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 770d7192-9104-4de7-35fa-08dec6e344d6
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:27:35.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nbLcUspmZt8sh2GbZ6b5TF74V+p5jp8U/DDujCQSQ9NFW+2ShVaAhEjNXlUAeX0K55cB2xELgVW+tQ1Pz/PqO4zzfTQIjYZXV/d7qFMRiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9674
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38248-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chaitanya.kumar.borah@intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BAA7668D91



On 6/10/2026 2:07 PM, Hardik Prakash wrote:
> This reverts commit ef76a3a28c79b628890431aa344af633e892035b.
> 
> The patch causes boot regressions on multiple machines. A NULL pointer
> dereference occurs when agpio->resource_source.string_ptr is NULL (i.e.
> when string_length is 0), and a probe deferral loop causes CPU starvation
> leading to kernel panic on Intel CI machines.
> 
> The patch needs a proper rewrite addressing these issues before resubmission.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>

Perhaps needs

Closes: 
https://lore.kernel.org/linux-i2c/90656be5-eca0-4a09-9b19-0c6e85f1d455@intel.com/

Feel free to use.

Tested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 156 --------------------
>   1 file changed, 156 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 1c01b0460385..3351c4a9ef11 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -8,8 +8,6 @@
>    * Copyright (C) 2007 MontaVista Software Inc.
>    * Copyright (C) 2009 Provigent Ltd.
>    */
> -
> -#include <linux/acpi.h>
>   #include <linux/clk-provider.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
> @@ -132,152 +130,6 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
>   	return 0;
>   }
>   
> -#ifdef CONFIG_ACPI
> -struct gpio_dep_ctx {
> -	struct list_head gpio_controllers;
> -	int ret;
> -};
> -
> -struct gpio_controller_ref {
> -	struct list_head node;
> -	char *path;
> -};
> -
> -static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> -{
> -	struct gpio_dep_ctx *ctx = data;
> -	struct acpi_resource_gpio *agpio;
> -	struct gpio_controller_ref *ref, *tmp;
> -	bool found = false;
> -
> -	if (ares->type != ACPI_RESOURCE_TYPE_GPIO)
> -		return 1;
> -
> -	agpio = &ares->data.gpio;
> -	if (agpio->connection_type != ACPI_RESOURCE_GPIO_TYPE_INT)
> -		return 1;
> -
> -	/* Check if we've already tracked this GPIO controller */
> -	list_for_each_entry(tmp, &ctx->gpio_controllers, node) {
> -		if (!strcmp(tmp->path, agpio->resource_source.string_ptr)) {
> -			found = true;
> -			break;
> -		}
> -	}
> -
> -	if (!found) {
> -		ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> -		if (!ref) {
> -			ctx->ret = -ENOMEM;
> -			return 0;
> -		}
> -
> -		ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
> -		if (!ref->path) {
> -			kfree(ref);
> -			ctx->ret = -ENOMEM;
> -			return 0;
> -		}
> -
> -		list_add_tail(&ref->node, &ctx->gpio_controllers);
> -	}
> -
> -	return 1;
> -}
> -
> -static int check_child_gpioint(struct acpi_device *adev, void *data)
> -{
> -	struct gpio_dep_ctx *ctx = data;
> -	struct list_head res_list;
> -
> -	INIT_LIST_HEAD(&res_list);
> -
> -	acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
> -	acpi_dev_free_resource_list(&res_list);
> -
> -	if (ctx->ret < 0)
> -		return ctx->ret;
> -
> -	return 0;
> -}
> -
> -static int i2c_dw_check_gpio_dependencies(struct device *dev)
> -{
> -	struct acpi_device *adev = ACPI_COMPANION(dev);
> -	struct gpio_dep_ctx ctx = { .ret = 0 };
> -	struct gpio_controller_ref *ref, *tmp;
> -	int ret = 0;
> -
> -	if (!adev)
> -		return 0;
> -
> -	INIT_LIST_HEAD(&ctx.gpio_controllers);
> -
> -	/* Walk all child devices and collect GpioInt controller references */
> -	ret = acpi_dev_for_each_child(adev, check_child_gpioint, &ctx);
> -	if (ret < 0 || ctx.ret < 0) {
> -		ret = ctx.ret ?: ret;
> -		goto cleanup;
> -	}
> -
> -	/* For each GPIO controller, check if its parent device is bound */
> -	list_for_each_entry(ref, &ctx.gpio_controllers, node) {
> -		acpi_handle handle;
> -		acpi_status status;
> -		struct acpi_device *gpio_adev;
> -		struct device *gpio_dev;
> -		bool bound;
> -
> -		status = acpi_get_handle(NULL, ref->path, &handle);
> -		if (ACPI_FAILURE(status))
> -			continue;
> -
> -		gpio_adev = acpi_fetch_acpi_dev(handle);
> -		if (!gpio_adev)
> -			continue;
> -
> -		gpio_dev = acpi_get_first_physical_node(gpio_adev);
> -		acpi_dev_put(gpio_adev);
> -
> -		if (!gpio_dev) {
> -			ret = -EPROBE_DEFER;
> -			goto cleanup;
> -		}
> -
> -		/*
> -		 * Check if the GPIO controller's device is bound. If not,
> -		 * defer probe to ensure GPIO initialization (including IRQ
> -		 * setup and quirks) is complete before we enumerate I2C
> -		 * child devices.
> -		 */
> -		scoped_guard(device, gpio_dev) {
> -			bound = device_is_bound(gpio_dev);
> -		}
> -		if (!bound) {
> -			put_device(gpio_dev);
> -			ret = -EPROBE_DEFER;
> -			goto cleanup;
> -		}
> -
> -		put_device(gpio_dev);
> -	}
> -
> -cleanup:
> -	list_for_each_entry_safe(ref, tmp, &ctx.gpio_controllers, node) {
> -		list_del(&ref->node);
> -		kfree(ref->path);
> -		kfree(ref);
> -	}
> -
> -	return ret;
> -}
> -#else
> -static int i2c_dw_check_gpio_dependencies(struct device *dev)
> -{
> -	return 0;
> -}
> -#endif /* CONFIG_ACPI */
> -
>   static int dw_i2c_plat_probe(struct platform_device *pdev)
>   {
>   	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> @@ -286,14 +138,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>   	struct dw_i2c_dev *dev;
>   	int irq, ret;
>   
> -	/*
> -	 * Check if any child devices have GpioInt resources, and if so,
> -	 * defer probe until those GPIO controllers are fully bound.
> -	 */
> -	ret = i2c_dw_check_gpio_dependencies(device);
> -	if (ret)
> -		return ret;
> -
>   	irq = platform_get_irq_optional(pdev, 0);
>   	if (irq == -ENXIO)
>   		flags |= ACCESS_POLLING;
> 
> base-commit: 3f786abd23951f3f600a62fef42469d9200d5f52
> prerequisite-patch-id: 22fa9ba20fa28cf94185281704c51feef7abc701


