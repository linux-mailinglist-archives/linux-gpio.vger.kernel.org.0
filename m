Return-Path: <linux-gpio+bounces-26645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69151BA6851
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Sep 2025 07:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F8CA189C097
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Sep 2025 05:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F2A2147E5;
	Sun, 28 Sep 2025 05:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHda7eNL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B508F1A9FBE
	for <linux-gpio@vger.kernel.org>; Sun, 28 Sep 2025 05:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759037128; cv=fail; b=OVqiKAcXq7JKJAkS5taP37T7q2L4fmbDtSx/YAO2XdG29ZfsrAKShv62k+PA1JZy1LKrnaFE8AGi0V837ByfYL7xQtKw68TL2KOZos5QxA5/WLrRXp7BuBInNIJPuE18NMkU7jdHNTq14vvx9/EuHbx2Jcco3grGahlY1Zw2+qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759037128; c=relaxed/simple;
	bh=ljpNcnriynwwlOpPVH/QsdZWNDhVvH6lIdy/MaDmO5M=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LuOOQimCG1+ooK4rpRXNSlt8ZGX3ThnrriTRwPuebOSGlZy9cT9kr3b5CyN5+O0+LKoXuVkKqa/+jv7FOdROGJ0dTmuIjcBeJ9q/OPnDGTrgdV3N6ATJroX6pECFtEf/fVUjhCJdR4GOc9RLRy+MNG0aC2THcyZgTr2kDjEdYy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHda7eNL; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759037126; x=1790573126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ljpNcnriynwwlOpPVH/QsdZWNDhVvH6lIdy/MaDmO5M=;
  b=FHda7eNLt+L36VIKwK3KHu3e4pVHYPBl6yYBxqj6eV9UPcdBYKrWIA/9
   q6sxMTijmMe9nJ8ab1MiBDbz8U6bPy6XhvacHvB3Ifg5Sxk+IpAPYKaOr
   SpB7ywAPiGt637GkHfRtkgRy2z83wGNq9PeD9V+QjOG4MNN7vT6H0qpi5
   /I5PUm3SVRao9RqCixVlFXp1myHWqp0aLs3TiJtKQoiSuIiBjmFeFrL54
   /8VZSfyKFlPVLjbcpft80SDSEYWSeBeX+w+fOuLpRt859l5v51t5UttBo
   Bh7XBTBHEWltwin4ZXh2A6fAPxqDEo75myKy7P9Tsz4jqp/jwm7CNglEm
   Q==;
X-CSE-ConnectionGUID: XoJKQmkNQEisCLC2FBQVnQ==
X-CSE-MsgGUID: 1/5N8vI6ScKcq/uWNzum6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="72679175"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="72679175"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 22:25:26 -0700
X-CSE-ConnectionGUID: 4AXrOOrrTquexOjBMiYyrQ==
X-CSE-MsgGUID: 3vB21WfSRXuFjLjYiaseKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="178344529"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 22:25:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 22:25:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 22:25:21 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 22:25:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRjpu3lwXWMg9nhfzDPiewNCAGo+GAZ6C6hcW7yXxMOd5frZ2FOd526lxmo764xa7Vle162o5/KM0c3j3r6wo3ndamO5Opudh/yFuRVPCzurpNJB4tH+e5nTXrvylcEgoYX0cfneu+OGpVg8yFFKA1PFdy+XptAu0svPstJEtxpBj26RCY7XL3FIUeWD7Dr1Gim7TqB+QScdmLvPkoEm5Baw6saDnJVk4JyRZK+igsoCshLjNeexxvV7+4axc8Jy2cTC8gu36ZciGYhtDEjlU0Pzx5Tn7/aaLl0guiNdEPAVtuAWu6jBez+TfFHcdXMyXmBHSWQObHAUUGiwWJSDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkN1fN+m+cKule8YXVSqhiU/zMaRB3f+QMZWD1hTvPE=;
 b=p4srjKMTadHpwhg4NjKqdxdEhre1Rub3HCyu8R77W1bIuRRc07/r/mQ9uvtyMxTwT1X2gmRHeBZ+CtMLrzGs44Ixjb/OAEXTFlbcLxOklNysxiDNj5racRFvthLhKyeKla8dINWWCBcjojUIl6VrRt9DqaA/TEqrkSyOVq5PA+iriXMvnY/sodNpK382CGh5vPWQNa9/k8zABdgH5JTTJT8/Wdhh0n7sNquuGKKtOPRiKaNO4BMUy093nHtBTdoWkB7PK6Y5PkWpRiV5oR4b0opDBoYlL4iNabG7T/QvHzC70ykTmm3f6JA/7sXMSWLJwoohaZOVvgkK/7FdZ1r1Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM6PR11MB4548.namprd11.prod.outlook.com (2603:10b6:5:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 05:25:19 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9160.014; Sun, 28 Sep 2025
 05:25:19 +0000
Date: Sun, 28 Sep 2025 13:25:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
	<linux-gpio@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [gpio]  b31c68fd85:
 kernel-selftests.gpio.gpio-aggregator.sh.fail
Message-ID: <202509281206.a7334ae8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0028.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM6PR11MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe1fcd1-0fc3-463b-20d4-08ddfe4f69d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i7f3Iz1c3Q66wDV3hgVfGgCQMFeczPcL6Tj4JW1zrbBIO08Mc+EZUk+EY9yu?=
 =?us-ascii?Q?BeccNP8JmDpdOeZ20MwISEKZStSL0KfjUYXu5TlJ5T4pzQeFVCztaa5Rnfsw?=
 =?us-ascii?Q?XcpEQ+WeTeYVsLi+nivOjWu23/CjB2DwRcMwbvureyRs/cd2LDoiG9PiUvTT?=
 =?us-ascii?Q?nrE0KTT9fClIl58anjH3Fed914jjs5wBNahDtHP0X2wLmslPGteqW0CRAFRo?=
 =?us-ascii?Q?QotJjjfrO0kWMZfgZouRXuNnpMKa71z2ZM9OvGNaKBgOn6CQfSByVa4M99bk?=
 =?us-ascii?Q?5jnFVZzESrUnAe0fRKydcBVwQ+zfCLZF2J3HKBoNDQMNEVBri36sh5gDTnIO?=
 =?us-ascii?Q?sfwXxPRimiyEP0HK5r96K1k/FkxacqyxJVcpot2L5h2Q5NgQ/SzvMCFKM0GP?=
 =?us-ascii?Q?e9j0YDmScu2TMCqYGcMqfS4F448LqXnMXLEYV1/bW0SL2rWJXRTutKMElSYs?=
 =?us-ascii?Q?6n6KccZdmBfysBTw+TJ+x8wQ8L+BhKBm4vjM3KutgEl4WF73/QPFKb0V9GgZ?=
 =?us-ascii?Q?5NBjZkmcx2HOdoJqtllPenblshTazirlNTJM4rlJmHavLgRAEp8cryIe+9nq?=
 =?us-ascii?Q?yQGFymxmF3N6IdpZ7IvqZxDJWaVK45M89EhnuVhDCytZ4xxCr2Q+JMwQBtQX?=
 =?us-ascii?Q?I63g2remTD5SL81CMumiv90l2yuTY9CVZ+5mJownKf/+BygLwyd2x3iu1BrV?=
 =?us-ascii?Q?2uVa/Loe9Pzdhv8p0VbvJfdUKpKbPGzwoboKKutlS7jMae93k0lVADvprClx?=
 =?us-ascii?Q?EzHQrj8sQw72sMtqJz18lUDYpIdjFl+yK/JtlmhMtc2sZQcL+0iXOzy+NjBE?=
 =?us-ascii?Q?ZUyg3pcqXtjAKbfhgxTQQCgOSfzqsh+5pPovDGeNpc+XPqmU4fYxRG/XCtkT?=
 =?us-ascii?Q?ExogajZU66MBhLXeTt2KFCdVI6y3y6OXhGKYATNWNowyzbn2OXzF+vXgbgSk?=
 =?us-ascii?Q?5wzUoljogycOtc6zRuSMpBkwaB84wHhDNo6fWkGPIwRl9KyrZZHVOpfdq/7d?=
 =?us-ascii?Q?zppE3sBV3trtEcZqz55n9Oy7dKefSO2lQwnydyFxv3+1OUJQthfcvdLTjZvF?=
 =?us-ascii?Q?DjFEHCQ/tYsEQ5Xc55LzYBJcHbFG7SjnGfehOpKlAVBYW6VEA5GPwIfFQ4GJ?=
 =?us-ascii?Q?/nEeooh+v+6V/VVYq6GDn4LnGvGu4T9yMyFuW0OK6VWssBrHNe1RHV58XLL0?=
 =?us-ascii?Q?P9tvbcKog3RHJ3VS58mNzewq1tHfzGIGXN+XGADoXbfn7fFLhCswT0y15AdG?=
 =?us-ascii?Q?fd4ahJyQb1X2SJfR1R6POx0dLoQ38U/s7bK0p36QM6RKi1PoJb2zfJpYbnIJ?=
 =?us-ascii?Q?dQxOgGpjxgPzCpw6vynNXmA5EHw9w0590J+wnuaSCdFjSCSms/2RhFybRpcE?=
 =?us-ascii?Q?dmF5In434pz+wI8OS71sgDz+9NYSS3BrLxTDsdys9InpZsMsNtAG4Je1ntO/?=
 =?us-ascii?Q?PxAu2zXSDHI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eb2nyX26+bBxfywqSbTPoUx6YuIX9T16PsPJtVqBnQMDAOTS6l5r0vaQmcdD?=
 =?us-ascii?Q?h8CrfK4pm9UK3gC+rBk8TXIHczbwGvRLDPFGVQMAv4YwVvs5R3gb4wFGhNoJ?=
 =?us-ascii?Q?HQShG39ehdojOCjKc3sBvk2CM44tcIetN0GoX3lLaIvwKgnVcFSqO1I7lARJ?=
 =?us-ascii?Q?FBvTw0B9adhA46SgHBoERE7fsY5f7WSApFMlS7EM+p3fuR9hioIabDMHhx5H?=
 =?us-ascii?Q?jQXyoJEnDjXHuIyoIylqoP/t6lzbYxF7LImRW/evrW8XjA6Pes1cY45Wt9Hh?=
 =?us-ascii?Q?PQh59mvgfLscKVQeceAsiHjRNAWZwXWA41t7+lFcZqy9PAHw5V5sPgHheE2n?=
 =?us-ascii?Q?JHL3L7o63oeEv3ZpPtd73DGgMPnax2B7gJX586gGHBuTnm4FbhgRhxlj0sC2?=
 =?us-ascii?Q?iDt6zGb9RiANR19U1jWjULxV628b0Cu349+ZpGSuTl0nub2BgkNWPKd91+l0?=
 =?us-ascii?Q?Kvf+Ex89Z37ecjqGJiKojcVAbQd53VRfyoJYRbcC2FPNslCDEuu312n/Za0x?=
 =?us-ascii?Q?+Mlp5bIUcFAQXNmdUqiuHXu3Q/P3lX8i55Hycwi3H1hFKCwZR8Oje50tZG+D?=
 =?us-ascii?Q?LrY6bVLA6DBdItMzMJVb30YVLQqYxcmS8WagFR5PKj5yUlX7iYD2B+hGtZVM?=
 =?us-ascii?Q?PX95tPxssEF68VqJSEqXAzsEhvF/kY0QIar+eRc2ABoDS8ismvANE98fgMKw?=
 =?us-ascii?Q?/NGGD/BgSowv3o5iYxXUs3yKcq4erMWfKU4uSj0jqkde69ZWCL5vYrk2O65S?=
 =?us-ascii?Q?FAM9o6R4xf3zizqhUuOYc1NEVGiQtA1evsUnbNVHCMHMRLkodfHW/BZkbihF?=
 =?us-ascii?Q?MFbhBWQFwp7n7C3voeK28C/oXch2plPa7ndJMk8PPDAOzYKB+YDtwZw2eT+q?=
 =?us-ascii?Q?a/Cb4bfGNCPnQqL54bVvgsQpcoh7Mwa16ElxRRyasXr7DXcdufSnT47rWSeY?=
 =?us-ascii?Q?VXmSemBLhbRkdPmuKFUGLQecl0H3c8tbarhuBuydcVo43zyLdVcWSwVdn7ZJ?=
 =?us-ascii?Q?m5Kfxbo/VPlgPnuTIghNAzav7rRifxg0rUBFJf4P3G5mYwkulP2T5LjmE7Yj?=
 =?us-ascii?Q?t6IopkBA8b2TGxBmjrJJVmNFXcifnXAYXm0fHPpRVLTjh5b34UYjX4glbYX1?=
 =?us-ascii?Q?k9pa2ISlBuEW+9QzRnqijnG0sMT6q6cI56K0pQz1U10qxHcTTnq8cNUxnkJP?=
 =?us-ascii?Q?Az2xAwAHscHSnFgrSYGS/ueOU1UgPEavFJmhxIsASCWI4WynwvxVUu5h7R2o?=
 =?us-ascii?Q?Dzenk+7Jc2+LwTo664OoxbzueNgozBZ7m2ptkefSN6aTzi0h2l7pFN4fPFp5?=
 =?us-ascii?Q?n8dkKd1lYwlRYKvxkoq3G1YQQovLQBrSzTejkA+8KF5fu9zBuqImHuLfRFI3?=
 =?us-ascii?Q?5RfLay5bRe2dJFE/xMtEDdKnZYAOFIKOpwFamG+VMduLt7iubcmCPhNOqTDg?=
 =?us-ascii?Q?JxikZvCynQckBofCDidbAsOUoJRa7ZUtgrdYGToyMc/laJPGiNDcOl4Q3eKv?=
 =?us-ascii?Q?5nL03RXqvK8QjKZ1JDRFGsbKUHcR1APMV6fijS8rH34eYDg2r/c8ALrVLd6z?=
 =?us-ascii?Q?VlM2dOIRFBJDbJSv+hEjtp3oMaeyqxkzuYww9ihIdx/dgoSAv4ZRkM4amXnU?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe1fcd1-0fc3-463b-20d4-08ddfe4f69d4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 05:25:19.0826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUzdXBAcF5Y4ANR3H64XLwoMzqcrihlhm3jjwjEvjv/os8soaqDcQkzZokNq6Kn1WFMGt8iGdNbydzhvLx73OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4548
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel-selftests.gpio.gpio-aggregator.sh.fail" on:

commit: b31c68fd851e74526ad963362ea205eb97b9a710 ("gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 262858079afde6d367ce3db183c74d8a43a0e83f]

in testcase: kernel-selftests
version: kernel-selftests-x86_64-592a93fea16b-1_20250918
with following parameters:

	group: gpio



config: x86_64-rhel-9.4-kselftests
compiler: gcc-14
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.00GHz (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202509281206.a7334ae8-lkp@intel.com


# timeout set to 300
# selftests: gpio: gpio-aggregator.sh
# trap: SIGTERM: bad trap
# 1. GPIO aggregator creation/deletion
# 1.1. Creation/deletion via configfs
# 1.1.1. Minimum creation/deletion
# 1.1.2. Complex creation/deletion
# 1.1.3. Can't instantiate a chip without any line
# 1.1.4. Can't instantiate a chip with invalid configuration
# 1.1.5. Can't instantiate a chip asynchronously via deferred probe
# 1.1.6. Can't instantiate a chip with _sysfs prefix
# 1.2. Creation/deletion via sysfs
# 1.2.1. Minimum creation/deletion
# 1.2.2. Complex creation/deletion
# 1.2.3. Asynchronous creation with deferred probe
# 1.2.4. Can't instantiate a chip with invalid configuration
# 2. GPIO aggregator configuration
# 2.1. Configuring aggregators instantiated via configfs
# 2.1.1. While offline
# 2.1.1.1. Line can be added/removed
# 2.1.1.2. Line key can be modified
# 2.1.1.3. Line name can be modified
# 2.1.1.4. Line offset can be modified
# 2.1.1.5. Can re-enable a chip after valid reconfiguration
# 2.1.1.7. Can't re-enable a chip with invalid reconfiguration
# 2.1.2. While online
# 2.1.2.1. Can't add/remove line
# 2.1.2.2. Can't modify line key
# 2.1.2.3. Can't modify line name
# 2.1.2.4. Can't modify line offset
# 2.2. Configuring aggregators instantiated via sysfs
# 2.2.1. While online
# 2.2.1.1. Can toggle live
# 2.2.1.2. Can't add/remove line
# 2.2.1.3. Can't modify line key
# 2.2.1.4. Can't modify line name
# 2.2.1.5. Can't modify line offset
# 2.2.2. While waiting for deferred probe
# 2.2.2.1. Can't add/remove line despite live = 0
# 2.2.2.2. Can't modify line key
# 2.2.2.3. Can't modify line name
# 2.2.2.4. Can't modify line offset
# 2.2.2.5. Can't toggle live
# 2.2.3. While offline
# 2.2.3.1. Can't add/remove line despite live = 0
# 2.2.3.2. Line key can be modified
# 2.2.3.3. Line name can be modified
# 2.2.3.4. Line offset can be modified
# 2.2.3.5. Can re-enable a chip with valid reconfiguration
# 2.2.3.6. Can't re-enable a chip with invalid reconfiguration
# 3. Module unload
# 3.1. Can't unload module if there is at least one device created via configfs
# 3.2. Can unload module if there is no device created via configfs
# 4. GPIO forwarder functional
# 4.1. Forwarding set values
# 4.2. Forwarding set config
# incorrect value read from sysfs
# GPIO gpio-aggregator test FAIL
not ok 3 selftests: gpio: gpio-aggregator.sh # exit=1



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250928/202509281206.a7334ae8-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


