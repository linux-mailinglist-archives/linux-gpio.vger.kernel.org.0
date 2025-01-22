Return-Path: <linux-gpio+bounces-14988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C56FEA18A53
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 04:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73F0F188B5AF
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 03:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB6C13DDB9;
	Wed, 22 Jan 2025 03:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jc7BiSmA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F372563;
	Wed, 22 Jan 2025 03:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737514851; cv=fail; b=gujNtKkr8fe4beJO9afbjehWgnhU3cJSrrH1sTZ5TKZeJ0OxjT1A38bdCteyfa9A8LIGAi6gp+9OgaLce0m25qesQPR7dHW092OmGWizuer4pP3wE5K6nTjKMrP2Etyg7/+yjMn/p2BrAVAslJcYMot6aDgpDAMjuTJ74fwYyMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737514851; c=relaxed/simple;
	bh=0Smd7RN+pQbf6JvUKVng9yufPiQi5pWJ0MdIyBF8ghs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EIl5AW5eGMcvps8yCmvlcLhec//D52ntoyYNfCHfnSBVfrfOVbw6z4i18Rdtxh0QBDBQp4OXlWLyyit0FxJoAQUy3ynYQVqN6OM4MpUcuATsR1FHqvQ5P7K9Dj3ei+IC7v9JlmS7dE948ZYw0hJLNTIHzy85K/sVvPAfQeYQRUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jc7BiSmA; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737514849; x=1769050849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Smd7RN+pQbf6JvUKVng9yufPiQi5pWJ0MdIyBF8ghs=;
  b=Jc7BiSmAYreg/SwkU3xNCvLm67AaZd7kUyyfazo9W4E+J/isHEWA4nkZ
   wh5NLHv4ENJ3xvf5hobb7Wz/U6tig3ketZKFyFIJh46lVQBbEfc1wFurJ
   oY0Tzpxe/N1o9kFX7g5xa7cNbRVqOgNSjuavgYSbX3gPdUy4vjAIn1QbJ
   pHewUT73TdEjForpRwryn43oFhqiiw34yc5OasCMvqkNGlQep1CmBFxGu
   BoIi3mfzIHQrUSJmo34j2oEQWb1lrvneXOSM8CMHzwfN2PiDBHVaSfIW6
   h2g/VmeQQ5MdBQGc+TWdRMx/1fQjbVy4FCvuW/+GBXbjgHFR5sYJPhZca
   A==;
X-CSE-ConnectionGUID: v5Jk0GMyQa+V4TOaNlqG1Q==
X-CSE-MsgGUID: wmaX5VSTQ7Gpx0MfQPjzDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37842197"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="37842197"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 19:00:48 -0800
X-CSE-ConnectionGUID: Sc2iMRe1TwWEF92g+TF1Bw==
X-CSE-MsgGUID: YZkJPupPSUOQRWejtPs0bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="107602181"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jan 2025 19:00:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 19:00:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 19:00:47 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 19:00:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWKJE4rzAzw2UEEUNGGK26HEfQkMJodOMX/M0YSH1bWQjr6Z8gdZmbxB4KAirn9lIU32iC3UIDLycV3OCeP8yW8RWKmQynve1kOpCPmQBaVczweZWE5q6/yIq/5TP7ZEPOa/J/hu4VQSzfT7s2uxzZsr8mmbkMqNKdP2pzCfkMP9GOPF10KkPm6B1l0NLBYzdf86YvmKx+8qneDZjFWHf3S53cu46SNASMc8CmDm39fKC1RMRCPwcGKwm6Hz9E1g2UXRSRnjB7mdPixjf4tPKRD1aj1xv3yi9gvUsaIMpGIbVGzzERZYsyOvN87xCDl5TUgjr+yEZrBAd7dojy3GUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2T45fKzCizVvQVZslAzS6l5+iSLnsdtgiSPpPh5tvs=;
 b=H9lYl4Bqktshc7B8Cj+prroI0Yb5oYqRyPxPsSEluyvocmtkzQp10L5HMJTiZ0/LqXxS6alFx9kSjzjQC1ExxQx7PhMoKf+0POwBOHCS9JBIJgvTn7dRGAnHGD1WJ37VWiWhP7p6uzFgzUuNuZvSOsBGP1cGeRkEwfoxCcM0yosjsz5pvtZbTSkgdwPNitxQhyDmbKOSQLuMf8/lfjU/as5LqAj0QZmhjChlSyQ+X6qQxxaa100+ihB1/cK6AH0ZgW6zJXh3jrcNwWMwqNXK9KMlIANnu/BoNDx62tKEhD1uUae3t+YTKONO8zDdp/7IDS0xFT6UP7qgQFKaWcxiyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 03:00:16 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 03:00:16 +0000
Date: Wed, 22 Jan 2025 11:00:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Koichiro Den <koichiro.den@canonical.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	<linux-gpio@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linus:master] [gpio]  8bd76b3d3f:
 kernel-selftests.gpio.gpio-sim.sh.fail
Message-ID: <202501221006.a1ca5dfa-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0092.apcprd02.prod.outlook.com
 (2603:1096:4:90::32) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: eeda4d45-5140-492c-750e-08dd3a90e5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yvv48wBUCw9L1k1nHuv7E8i1EW0HDFnXNZl6E+akXLqPMvbTGQ8dxpPsDVjk?=
 =?us-ascii?Q?4F5d2B/+fb855PdBQ15tdD+Ty6vxYI/1IZwo/Bu2JPrZ2IeZ/ol8h68eHj2x?=
 =?us-ascii?Q?9s/WzazhGQMPrMXJOTy0rcGke1LmbrOqd0HSwx9muAgVPPw72YnSAj3/Oi1i?=
 =?us-ascii?Q?ZmXbVwqVQlQeN0ycHDE4Kli3+RTOfVtayhXZDXptlJ73vmPgS1zqXCd37OR/?=
 =?us-ascii?Q?wfWQcJxawFBCqpDz7uJMN7OzJu794+s1x19Gv5ioIcPKwldfvAEMgbpx4doG?=
 =?us-ascii?Q?JU7Kv7meljV8Y0yF/4k45dIfCQTEijCVvlAtdRuR+xIEU8iDDUE205Y+xGKQ?=
 =?us-ascii?Q?sU+5xFC9msTSAhuU1uHi7yngdMSWZEY+LLKq40u41lKJsxLN/oiCWwiX1C7T?=
 =?us-ascii?Q?pxukgLjITIq0QAn0QELFozTBaJy+1DiRoq2lBuptbmkOq48EWdOtfvOK06Pq?=
 =?us-ascii?Q?PGmonwheSa/nagjXgXTb9wEhJ8Jio+KtG2lI+4GauRjJgOMdNWmlsePgj60m?=
 =?us-ascii?Q?inKKDG7S1zYCQr+lJ+o4xaNRXBzt3JTO9bcPCGiiMcwP/WmkHSvWiODt6Go/?=
 =?us-ascii?Q?kI4MZN8sLIaF8modudM+EiE4Hkb9yY7Wye33WriCfThKOcAsChEjFEJWe8Iw?=
 =?us-ascii?Q?eQCyPbv/aSmbOY1sxK9ynK46++QalgoGMg+/rguIhc8mDnuWpS5358Idv7R5?=
 =?us-ascii?Q?9XXWGHDbC916hAIUp7s+8PMxC6ChisNZfOeaPU/Dxb4b4pKqRf++i+FSpbCF?=
 =?us-ascii?Q?vzP+oOB8jLtOTFSuASpgvGWjjikUVYpMdikIRh5Fg1PDA0lZERAbS1LogoKS?=
 =?us-ascii?Q?yKFuWyM0PjZUgOywvtGxdViklf3UrM0+8LIVTplWPqT782aSXs4grvtUauW2?=
 =?us-ascii?Q?ss0FyjNmd/wCTeQ9bqJesOR39Y56ucsgBweYPOX8UR08QO3EW61+/awaFAmr?=
 =?us-ascii?Q?r3yU8G4XFepN8dKcVSGR5+1647FdiRAyLyAw4JK95ouChfPhoy4J5C5d+lYJ?=
 =?us-ascii?Q?bYjrhN/1E/V52n+kEz+6mpDj2pUtWPAR1n9CCG1ncKij9xRf+HsGsEiIcm2+?=
 =?us-ascii?Q?C0r79LPNb/4BrnW2z++nfwJJsD/4XXraOGGMyAWComUceXa7GuLVfG6IiOVd?=
 =?us-ascii?Q?NIAhKnL00Yf/bp6Mbj/Tw9FTp7CeNWQu470KkykCZipwCOXoKn0NYlN4k32r?=
 =?us-ascii?Q?FOZ7fEDLmwtyhb0y/+n+u03ZHAUM8XEA0IVVEKqMFGYwOEWdr8U9lp9TUy0Z?=
 =?us-ascii?Q?x198f77lQagWV8M8XLBnE++6CK7kqkOxWVIdlCuHLGmSdJyyFfXUg8SUDxAj?=
 =?us-ascii?Q?x1/a8F39oq9sEc1o9bx97zKknaVKiY87ackerZ5GztMY6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zx4SlGm8T1Ge5MrhrGvCWPaIwtNHmJisQzYS0s0rpthWC4XDJ+XB3duzlIQT?=
 =?us-ascii?Q?WgwipLWJm2lys5CNOxrT+UpT1O0/X/dvlkcZIXyzf4l0Sn8AKVEFGdwrontu?=
 =?us-ascii?Q?ZlJZiAs4V+46fa1Ft231sT25nO1Y1dIuu2Kdi2rANQaE+nqW41BNQj3eh/+/?=
 =?us-ascii?Q?Wkd1yonZVVxKpqfZHXYY5zsVZmAX31Jc+42WNcY6BAtX3Yucwdz8YTelKbRL?=
 =?us-ascii?Q?DUOpJUlCKLFLEI3UdmzUD6OIiqmxUONE+RhzYqhNcX7s0XRFN2ZxbkgC2taU?=
 =?us-ascii?Q?TiOA3MJm1NKGLwazLh5PNCWv12A85qIs5G4FGQTTuYQ0KQ/mX/m1lY4p+ilS?=
 =?us-ascii?Q?4elyoAOZbR3xKd+TOIDgZw64Vkp6ZwPj39DRHHObfSGytcCSv80dKfpUL7+p?=
 =?us-ascii?Q?CoJ78XDgYaFWmnYQu73BCdb1D/E11WilMsXSbX8B0ksS5bl92QqeZ3K9gdAB?=
 =?us-ascii?Q?ThOKRtuT0ByLBskn1zHGpvDYFnb/OpQOqn5drnZIV54ROPWJEy1RkPs3CdpM?=
 =?us-ascii?Q?6WFVvRRyLD7mQvZD+1lyRHTBW5RsenkWO6aYM11HgZsCB/LUx1RxOCpze6im?=
 =?us-ascii?Q?wR/whMqB66fh+o247+Y5qBmf0Q6XG4vDD8AYnYqcqLYP7IaUsDyGaj0ZUB0P?=
 =?us-ascii?Q?ToVOmYiKOcP4DA6n4/KNHlbtn3Oq7rgx2d6ftsq3jdK6vFBk0ayqewY3w+jQ?=
 =?us-ascii?Q?vkeGVXBYnCqSLLMwtC6heHi4+wDRGLY6LI+8vWkNhXojcIi33tOnhbgQXuZo?=
 =?us-ascii?Q?aWuKIWaWugUNtUTVdIbgjAlHqJ/JkmNm/7J+bAPEpwAQS/73twPIyRATZ4UW?=
 =?us-ascii?Q?9gG/TdDeYYHXySscudSGTvzGR4rTztgGFVsSVThwzp2TewNDrzMHSmBVFmR1?=
 =?us-ascii?Q?t/5lHM+1xJzFz6U8/OP2qrVu3kVbnroRrt/mYYqol+Ot03ma7en3c38Hskot?=
 =?us-ascii?Q?xdWxDw8q7iwrrHDtJO9faCxo93cjJID5UHTHV03AEV2/6ButigTdN6e6Aov4?=
 =?us-ascii?Q?pAWmAXJv6ZrIX7o/oKBS/sNtvg9pkMjiX+M1OJyYl9dyUGRtlxl6AF6gZPOQ?=
 =?us-ascii?Q?vYBSX8LQGbN12sYqEyXHBKTd3AxUbCrAJxxCPmUMGRunFxcqW55mIohZa60w?=
 =?us-ascii?Q?Iwpza3WfOTzCwJ0QBl5SsJOAuMYtAcVt+F/JGQUKNhQTgyptpd07gGq8TKAe?=
 =?us-ascii?Q?QAbh/4KUTsOmOnqP1/hV7zac/na6UEHGS/TnJjXpXhRMGxp2/dvfRbJ1E7Xl?=
 =?us-ascii?Q?5ciDF3gmwB9xOQLwP44mBRfQsq9WnZ5+3cOpcRtENzNWq49PbQbkItOGek41?=
 =?us-ascii?Q?C1ZaHuUZvr3sY/fH232FzE3gDCaPHnKWEqyHcwd54B8o5x6OlWUspNsbfvJA?=
 =?us-ascii?Q?vMQKlmK1p7mQXiU1+C/WeSbdHfO4/wvKOVzYtGttkzrWS7sWCJ6/6RF9VGnO?=
 =?us-ascii?Q?+r5Iwr+S17Et5bhrapb0/nWNxzZ+07mCqC6AtE98w7V/RPvMkCf50hT0E+7n?=
 =?us-ascii?Q?62MN4aCsh9WLAsWzlXteUyyqWbhwDRj70N0Q3exbIopiK6MuXOuJM4aQGj8F?=
 =?us-ascii?Q?7BbdcER+x18eIIuAaLakkitj0bhCLmucxTyBmNw7f9nNLmSTip+l3i/clVa1?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eeda4d45-5140-492c-750e-08dd3a90e5fe
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 03:00:16.5630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxebjDQh9hqVSjt/Koe8CpnBV9Y34pl1y3JDuSSXKbLoDF6FLmOb34mPsjJeufhNcHEHGUQb8XVnZBEnV8Fn3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6771
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel-selftests.gpio.gpio-sim.sh.fail" on:

commit: 8bd76b3d3f3af7ac2898b6a27ad90c444fec418f ("gpio: sim: lock up configfs that an instantiated device depends on")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3]
[test failed on linux-next/master f066b5a6c7a06adfb666b7652cc99b4ff264f4ed]

in testcase: kernel-selftests
version: kernel-selftests-x86_64-7503345ac5f5-1_20241208
with following parameters:

	group: gpio



config: x86_64-dcg_x86_64_defconfig-kselftests
compiler: gcc-12
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501221006.a1ca5dfa-lkp@intel.com


# timeout set to 300
# selftests: gpio: gpio-sim.sh
# trap: SIGTERM: bad trap
# 1. chip_name and dev_name attributes
# 1.1. Chip name is communicated to user
# 1.2. chip_name returns 'none' if the chip is still pending
# 1.3. Device name is communicated to user
# 2. Creating and configuring simulated chips
# 2.1. Default number of lines is 1
# 2.2. Number of lines can be specified
# 2.3. Label can be set
# 2.4. Label can be left empty
# 2.5. Line names can be configured
# rmdir: failed to remove '/sys/kernel/config/gpio-sim/chip/bank/line0': Device or resource busy
# Unable to remove the line
# GPIO gpio-sim test FAIL
# rmdir: failed to remove '/sys/kernel/config/gpio-sim/chip/bank/line0': Device or resource busy
# Unable to remove the line
# GPIO gpio-sim test FAIL
not ok 2 selftests: gpio: gpio-sim.sh # exit=1


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250122/202501221006.a1ca5dfa-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


