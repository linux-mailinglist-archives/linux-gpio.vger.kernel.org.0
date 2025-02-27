Return-Path: <linux-gpio+bounces-16693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C2A47B13
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908523ABEAF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 11:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D21218AAF;
	Thu, 27 Feb 2025 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B13kmnek"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5950EEBB
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654027; cv=fail; b=tzxoELTAZ/wQfcyZnENKfD/yQ7hjCFnAp+Kf0y6tieGlmtSB4OryAwEfRXu8EPxlXg1fO2FMq+QM/6tYxz+BztYhb+InMMvMGlJ/0wHPMb7eDX6I4hftWyyVtl4+crN+oJyiSFm4uWmSphFIAVOrH8BWSQ1SzfQYU9J9jVu8YU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654027; c=relaxed/simple;
	bh=qXMcG9JvxMQpkACw/1UoWaPQerwpsCyDKRzvzw4RAIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HMCzEU+HCeZhG9uSu2+jOFZo0YEM0IK9TgLOLhEOCakLfE9gExkGhe8ZgCSPgDdNbfg+df5NOBgEsRMYK+sYOuqBt0l6c7Q9WX9jOXB79CBQ+FJB7563TSH/ohChMEUE6aPTreCKZp4mg8axkrl4kxQerkdZk1thqsQ38/+wpEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B13kmnek; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740654024; x=1772190024;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qXMcG9JvxMQpkACw/1UoWaPQerwpsCyDKRzvzw4RAIQ=;
  b=B13kmnekDgu9aPOHVoJWJhsKm2NGUETBD4o2y+KOzMqvAlIxJr1cosK1
   mWCJApIjTWZXqVD1LuYPaEr+oz1f9V2ZPBYC2aJIvX3Zb8raw94F3Kkir
   pb9BSgf9Jh688+hFKaMRVYmYJlBDgkTEcqFRe+ygjnqVlRwQaII/O8EUe
   s6jhOhITzpK2kz7HH4RUFFT1b9DmgFZrHqiAXFTzkGF/34ogHgyI4QxSy
   uEBVZqK5WlsVGA5NlenRn6y8az7L7YJxah/GF1Ok8g1s+KaloEPbsi7W9
   eiahXjzI6pIIz/Bv2wapEfHfS+K8x06zxtap2bnIM/jHafQH63E9eFVKo
   g==;
X-CSE-ConnectionGUID: utncDDRFTzCkE+HyolLDmQ==
X-CSE-MsgGUID: lR+SYeTCTfGOy+iTqCVCjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44362975"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="44362975"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:00:23 -0800
X-CSE-ConnectionGUID: XgXQRdGsS32HrldcElPjoA==
X-CSE-MsgGUID: /hxQA2hVRP2k1JqgO7AJlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="116766732"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:00:23 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 27 Feb 2025 03:00:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 03:00:22 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 03:00:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzraHejerHB4e2TrQamQY7VV5nj2NT4wxMz8yN4xXwa+GiscP27n4hdD20CMh+eSkWQ4dtbY4uL1htWgghxHH52TS2NyrY+VqahiCkDILQo4rMssKZ2/mpEbYV2e0W8VvG7cBFm5m8BOCIKI91cFs2LZkKpLWYp1oe39ezTZ4lKwHTmFiK9FqXhXP+nbEE+jL+tjADqD5JhBAyJjOsO1uEOLVOjpxgaM+9/6SZO5clhhJoMwdmVwOFLAPWre58AU1hb+WrVr8Avvzd0EGb8PJGjXFz/n5Yb/dzqBVBV6hxcDlxcHSQFhvlUInILgxTRrOO0zIS+wq/F+7ErKT0mBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXMcG9JvxMQpkACw/1UoWaPQerwpsCyDKRzvzw4RAIQ=;
 b=A0XgdHEz4epMXj4fVAyoPiv1hYgSd+9y0bqKvCoDDg4spR+osl1YFGwTXUSotELMe+NMKBU+MqnvvGG6v+HVOm84ee/E+EF/WbsOK5KAM5ECzp3Pq+BfiZN6YXI+mvOuuQFWniaAQnEqXk4eG+j+gEibdyPiFHCczR/u/7tktPnWm3eBfZ249QG3eHW0GXCcIdlENfaRSwE5aWEsnEAmRThMfT0pjlr5irrw+dUwBLsd6wMp6XZpaIQ9BvmpdlR3kpR4RJDc63ypQeeLkJSXMmIQVSr7NUWscSbGCZz3n0GBOfo1RYi2vksISXEfwiKk9y+fJrMAwo/B869fZnLLvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 10:59:53 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 10:59:53 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen, Jani"
	<jani.saarinen@intel.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: Regression on linux-next (next-20250225)
Thread-Topic: Regression on linux-next (next-20250225)
Thread-Index: AduIhrAOw3T8Vde6R/Kk4U8loKNURwAZtumAAAZEuOA=
Date: Thu, 27 Feb 2025 10:59:53 +0000
Message-ID: <SJ1PR11MB6129C85643FCB6E153714210B9CD2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <SJ1PR11MB612979B35DD84F5AFFB789D5B9C22@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <CACMJSeseiRfAHQX0+vjL0DO+Xd-+RwW5rs4RkYHCfP6NKz2DLA@mail.gmail.com>
In-Reply-To: <CACMJSeseiRfAHQX0+vjL0DO+Xd-+RwW5rs4RkYHCfP6NKz2DLA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6277:EE_
x-ms-office365-filtering-correlation-id: f7409688-d1d7-4279-d473-08dd571ddd0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OGpMazl1Y3AxRmVxZUhFSEg5TC91THo4NVdoaFB3aXljbjU1MStBV2ZOTXlK?=
 =?utf-8?B?ZTBqRHpOaW9vQmVBd2p4Z29CY0czU0JtWm5LOUlMb0IrMm84K2hNQlh0WmZE?=
 =?utf-8?B?cHFtTXRDektrR2VPTjhZakV4dHdxOFF4UHg0NGtzeXlieUxtd1hFNXZtOGl0?=
 =?utf-8?B?aGtwV0VXQVdJZS9zSXM3Unl3VGZrK1F3MHdzYXNWZ1BBam1uMSsxNW1kZG1M?=
 =?utf-8?B?Rm0xUzhCWWhRcnY2VUVMcUJ1K2ExeXVwMHN6YmNaZGFYajZDa1ptMGFqTmtW?=
 =?utf-8?B?RTkrcXUxSDYrVFRhMUI3UzY5WGJDS2paSzdERTdnMlFMT0RMQlRVNkR3Ym5U?=
 =?utf-8?B?eHpPL1M0U1FrQUM3OWVqWXZpTkFZa0VYeThIbjBDb1VVeHJwYVNTUU84bk5V?=
 =?utf-8?B?UHJNM3JVbldteGNtT1BXamRsZlZndmhZRXRaMzM4ZFJkY1pOYUpLZFdCTGVS?=
 =?utf-8?B?M2J1QUIzQk8yWllET0ZJZXUxTmYybGVMUTVHSVAwdmlGMzNoMmRwQUlnUnhZ?=
 =?utf-8?B?STIzblJSaWxxRXBtT3pQQ2xJdHM4T1NhSU9WRkJFN1RCSDdNTUpSMWpGM0pM?=
 =?utf-8?B?RGlTWTRrSzNXelEzMzcwWXVRSHdSUEs0aE5nYVg1N1h0MSs2RjB1NU5xc2g1?=
 =?utf-8?B?QjhzSEJ6SDRDaFBkS1ZZMzJNWlF5OVhpSlY1b2F1cVA5YjMzRHd0N1FUSlVR?=
 =?utf-8?B?disvUk9oU0k1MjZrcklGYVJpR2V4M2RwNVhDOHdUemw4VDVzK0grUm5KYWtx?=
 =?utf-8?B?V1hMSmF6UHZyR2N1NUh6THFieWNueGFSMG1nVHRYem1SSENLK0VhMmx1TnRa?=
 =?utf-8?B?UnZ0VVZmbVZUczdialpiUVVORzZ3Ym9FTEpIWlk1QVR1T1lhUmpzaHpJdEcw?=
 =?utf-8?B?V2xnMTFHRGJOYUxVbE1NamgzVGNhVWhOaUQ5L21qdFNkWWF5c0lWVEZWd0w2?=
 =?utf-8?B?ZzhIOFhOdmdTd2NwcXU1clF1VGJIcEN2VmJDY1BiL09iRDBGOWV2UEhvRG55?=
 =?utf-8?B?OFpIWVlNYmpyVE5RWFM1YVNXSUVVVFlLY0lrNVRYeFpaTnlaS2JNeTdpWFVE?=
 =?utf-8?B?TDlsSEVvVkZPazBBWmVVYmtUUjZlTzkxY242TE1POEVNRjdvOXlIbXd0dWZq?=
 =?utf-8?B?Z1lqc0grTGxRTjJpWlF1bVZYSFo3cER3WThiamZuK1AzVmxxRHVua294QnFL?=
 =?utf-8?B?dzN6U0xrcmR3b2lIRVBqVVF1a2tFOWUxYWtEU293aTE5NkQrekVZajhmamUw?=
 =?utf-8?B?M25relcyUDZEUEliYnJKQnduL2lPMGEwS1FESUFzTGxTbDdMOHM1cTZLeW9K?=
 =?utf-8?B?b2FISkR6endRUE9TZFEzUUFkWUtsVHBCMWpEaEtyeWZzQ2JhSnZZNk03cXN1?=
 =?utf-8?B?WVUxTXc1QUJPRStpQ0VZL0drSDRRNE9objU5eHlSbWhmNUJFYk92aGNXaXRV?=
 =?utf-8?B?cWloK1h3SHRjWitRTGh0aGQ4ODNoTWZJN1BVakV3N29oaEV5aWpRek9UNFZB?=
 =?utf-8?B?YzhCTlpsZ3RTeDNjUDBIWnRxcVB4ZzNnTG1wVmVnSnNEQllnOUVmSXF6VFl0?=
 =?utf-8?B?dWhVR3ZIZ25Ea0ljNWxENG4vQzVWSjRrajFEQlQ2RlBLK2xWd3lZWUwyQmtt?=
 =?utf-8?B?YmFtSEgvVUY1Q2RqRkpGMm9Gck1qMndFSitVSjdyOGFvSXBKR2VvTGd6cHo5?=
 =?utf-8?B?MVBHSUxDaFNpQkl5WkdNOTFTc2VFeVJSMDlkcENsTkVGK2hnZmZZVENUOUEx?=
 =?utf-8?B?QVpFSXBoeEJNT0lGYWYvSnM3Sk1qNktRV2c1aURJemo1ZUpBUk5IYXZvcWtv?=
 =?utf-8?B?NVY5VWQzeXR5aXQzUEo5SDVheVhaSWhFMS8wemhMZ0J1dEN4WHJsYlVQMzFG?=
 =?utf-8?B?elJOOUdDN3BnOVl0R0xwbjVYVUVCU2pMcVU5THhzSW5DV1RPaUhjOXdlcjBr?=
 =?utf-8?Q?eucsUdWsnSuMdTzdTPwIYjvnEz9gGqNL?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnhjSUw5VHN1dnpkUXhBUnJ3VWFRUUNoWnZhK0tIbmx4OGJEU3RWSi85d1Uz?=
 =?utf-8?B?c21yaGtCZHYwaTlJakFnc2VEQnoxODM2c3o1Sm9LV2NkWjBhWkVsS3VpTDZl?=
 =?utf-8?B?YVNJamd0ZDRYL1Nqanh1OEFMejh3Tkw4RkFGRGkwL2RHc0I2cG8rTXYxT2la?=
 =?utf-8?B?THpxZytpc1BYeFYxdS9sSjhyenNhNXU2ZmRITXdUOVJKVG1sQWxNTzdCZjNV?=
 =?utf-8?B?K2Y0TkdlY3VWcnd0S1AwV0x3WnpmbWVBdmdTeHFCcUR0cFFvZ3BVNEVGcnpF?=
 =?utf-8?B?S1oyb2lrRHE0cFZyQllGOFBLNXVuSnE1WTEwQlZaZUlhT1cyOVFnSDlnSml3?=
 =?utf-8?B?U1pSd1VMNzZCaHYyTTJiaWtjWkZULzlRQ05UZzR1SUFqMk9NV2d6dzk5aFVE?=
 =?utf-8?B?SnZVQ2dWdDhsakRxWTBGMllyb1hRNDJya1lZdHhMSUFVK0NDeTU5UHNsd3hu?=
 =?utf-8?B?Rmk5bCtEdS90YnpHTWFjeFp6a2tJd3YzMEdFVTkrVEN2bDA0WHFhR1IwNlBw?=
 =?utf-8?B?anAxWUVQMDJ1MkpGUG1ySFlreDdYNG5yWFNSZjNySVljNzlHem45ZG4zY0xv?=
 =?utf-8?B?bFRoRmlBU01MS1EyMDlzaXdFdVk3VUFMeER4NWN2MDJEYzhYcVFUeldKUnl4?=
 =?utf-8?B?dUxneU1SL1VmWStHNXFrRzNEeVp1WjRTMURhOCtNOUNWTGhMdENoSHh2UjR0?=
 =?utf-8?B?UVBGSWFSSkFnR0J2TzZEN1JzVzBWSmtyT1FlbVBGRElUWkI1MCtoU2lTcExN?=
 =?utf-8?B?OGVtWW5TMUhXcGgxTm1oSkpiZlpRV3QydUFmYndOUFo0L0lPakpsMm84ck1H?=
 =?utf-8?B?U1FxZGVJek5LbEs5c3h6aTl0b0F2citaZEVBbVRINmhhTHpnVEVwcS90bWpy?=
 =?utf-8?B?dEM3VjQ3bTFMalptaE9ZMDhrZGEyMmRCRlNwOEJEZUJEb1A2UlU3TC9SeXJm?=
 =?utf-8?B?Z2s2VmlHdDlFL0xMNGRuU3l3bythRkltWlE2dEZGamVZRlpWZ1hobFFqZGti?=
 =?utf-8?B?S0dKVGc0c01IMExEWWYrWWU4cC9qZVBkWGNGcExZc1NDOGl6YmJZeFZjU2Fh?=
 =?utf-8?B?T1cyaUpPd3dGZ2hLNVY3ckpQaDUzT2F0NzdsOWlFcmR4NDNSR3NjZGx3N1g5?=
 =?utf-8?B?cGRWSndxejF4MmNhcitrQlF2bEU3aGRTSzJ6RlExUEcySnM3SytTRzlsZ1Jm?=
 =?utf-8?B?ZE41eWlHd3dpd3g4RFV3VExwZ0FlTEw2VUZibTJiMnhnR09VTzI0bkd6RWJS?=
 =?utf-8?B?MEZOMytKU0xBWmNUZ0E4V0JMYUN4RXU4dzJ4UnFSRFJrc0lMSnpsbXZjeWdu?=
 =?utf-8?B?MEZXbEo3TVNzTENaaFl1Y3hqQmFVZkQzd0ZzUU5CUWgxWWwwTk54eHpwaG43?=
 =?utf-8?B?UnBUUW5QRlc1NlFzaWIwWkcvYnZGam8xYUl1NTkrSFFUUXFQV1lDVUJ0SVhh?=
 =?utf-8?B?OXU2ZHQ3bmorSkgraFZZbys5OVhEbm1QZHpFSmJCbkZjNEV5UURWUjRjUGZX?=
 =?utf-8?B?UytyUDFtRWpudkt2d2xORm42eGtuSGlQL3pXZDJvSWtHcXFrZ0FrK1grdEI2?=
 =?utf-8?B?T1FUeURtSWovbExvTC9xVWgrMUhLREVpVkJILzhFZnFLT0ZUS3J0TkQvOEtQ?=
 =?utf-8?B?Zkkrb1NRV2VLRlpKRWxyOWJPU0toak5XNzVNaFJsMmhSY3AyVDBHaDI1NEoy?=
 =?utf-8?B?Nkk2RElocktpOXNjRzZMWXJoQ2hrekhiQnNKSFJzcmk3amJrSys2QmZ0TTNH?=
 =?utf-8?B?empVUkRybk5NZmQyVi9qQ2Q1M1BjUitUUTNLZTJueTB4dFNCbTZ6aFNqNG9o?=
 =?utf-8?B?NElURXFtVVdVK21tcG5lWGUweWE5T0ErNERBUkFGUVQ3L1RmZkFlRGZHMmpw?=
 =?utf-8?B?VWpmcWJLZlo4NnB4NGk4bmdDNjRnOTMvUXdENllnMmxGOUxGZ3NiY0NKYTNF?=
 =?utf-8?B?ZVBaajlRTnE0Q3kwUkZxUi9sdlZmWnQyM1RzRzh2REx0OUdXd2VqVzQ1NSti?=
 =?utf-8?B?akxsWENtd2RFVVI5b0pNOFdlVjZHOWFnWm8xMUcvUGNvd0JBWlJmRkRBbmlO?=
 =?utf-8?B?ZGhWd0RpNllEOUVXYzJLSkx3T1VKT0Q0aTBpYlZnUEp4VjdBc1ZZY3V3eDk4?=
 =?utf-8?B?TGVqS2JQMW9Cd0hybFBCY0RtNi9jL1JBMDdMbFNrTDJsU0dXcmFNZ1lTNkZa?=
 =?utf-8?B?V1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7409688-d1d7-4279-d473-08dd571ddd0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 10:59:53.0673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oiBT7TpkahnN6B4TicVBB7alXd6BS6OpWWOdUiaSB2gfQGtI1BF2t8cGCoIXjjw2wVbN31k05Y56GmKG454Znl183b2A7/wHMTrc66qMHPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwg
RmVicnVhcnkgMjcsIDIwMjUgMTozMCBQTQ0KPiBUbzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8
Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgS3VybWksDQo+
IFN1cmVzaCBLdW1hciA8c3VyZXNoLmt1bWFyLmt1cm1pQGludGVsLmNvbT47IFNhYXJpbmVuLCBK
YW5pDQo+IDxqYW5pLnNhYXJpbmVuQGludGVsLmNvbT47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwu
b3JnDQo+IFN1YmplY3Q6IFJlOiBSZWdyZXNzaW9uIG9uIGxpbnV4LW5leHQgKG5leHQtMjAyNTAy
MjUpDQo+IA0KPiBPbiBXZWQsIDI2IEZlYiAyMDI1IGF0IDIxOjI5LCBCb3JhaCwgQ2hhaXRhbnlh
IEt1bWFyDQo+IDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPiB3cm90ZToNCj4gPg0K
PiA+IEhlbGxvIEJhcnRvc3osDQo+ID4NCj4gPiBIb3BlIHlvdSBhcmUgZG9pbmcgd2VsbC4gSSBh
bSBDaGFpdGFueWEgZnJvbSB0aGUgbGludXggZ3JhcGhpY3MgdGVhbSBpbg0KPiBJbnRlbC4NCj4g
Pg0KPiA+IFRoaXMgbWFpbCBpcyByZWdhcmRpbmcgYSByZWdyZXNzaW9uIHdlIGFyZSBzZWVpbmcg
aW4gb3VyIENJIHJ1bnNbMV0gb24gbGludXgtDQo+IG5leHQgcmVwb3NpdG9yeS4NCj4gPg0KPiA+
IFNpbmNlIHRoZSB2ZXJzaW9uIG5leHQtMjAyNTAyMjUgWzJdLCB3ZSBhcmUgc2VlaW5nIHRoZSBm
b2xsb3dpbmcNCj4gPiByZWdyZXNzaW9uDQo+ID4NCj4gPiBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGANCj4gPiA8ND5bICAgIDguNDgzNDIxXSBncGlvIGdwaW9jaGlwMTogZ3Bpb2NoaXBfYWRkX2Rh
dGFfd2l0aF9rZXk6DQo+IGdldF9kaXJlY3Rpb24gZmFpbGVkOiAtMjINCj4gPiA8ND5bICAgIDgu
NDgzNDI3XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gPiA8ND5bICAg
IDguNDgzNDI4XSBXQVJOSU5HOiBDUFU6IDIwIFBJRDogNDQ0IGF0IGRyaXZlcnMvZ3Bpby9ncGlv
bGliLmM6MzQ5DQo+IGdwaW9jaGlwX2dldF9kaXJlY3Rpb24rMHg2My8weDkwDQo+ID4gPDQ+WyAg
ICA4LjQ4MzQzMF0gTW9kdWxlcyBsaW5rZWQgaW46IGludGVsX2lzaF9pcGMoKykgZTEwMDBlKCsp
IHNwaV9pbnRlbCgrKQ0KPiBpMmNfc21idXMgaWRtYTY0KCspIG1laSBpbnRlbF9pc2h0cCByZWFs
dGVrKCspDQo+IHByb2Nlc3Nvcl90aGVybWFsX2RldmljZV9wY2koKykgcHJvY2Vzc29yX3RoZXJt
YWxfZGV2aWNlDQo+IHByb2Nlc3Nvcl90aGVybWFsX3d0X2hpbnQgdmlkZW8gcHJvY2Vzc29yX3Ro
ZXJtYWxfcmZpbSBpbnQzNDAzX3RoZXJtYWwNCj4gaW50ZWxfcG1jX2NvcmUoKykgcHJvY2Vzc29y
X3RoZXJtYWxfcmFwbCBpbnRlbF9yYXBsX2NvbW1vbiBpbnRlbF92cHUNCj4gcHJvY2Vzc29yX3Ro
ZXJtYWxfd3RfcmVxIHVjc2lfYWNwaSgrKSBwcm9jZXNzb3JfdGhlcm1hbF9wb3dlcl9mbG9vcg0K
PiBkcm1fc2htZW1faGVscGVyIHBtdF90ZWxlbWV0cnkgcHJvY2Vzc29yX3RoZXJtYWxfbWJveCBw
bXRfY2xhc3MNCj4gdHlwZWNfdWNzaSBpbnQzNDAwX3RoZXJtYWwgZHJtX2ttc19oZWxwZXIgYWNw
aV90YWQgaW50ZWxfaGlkDQo+IGludDM0MHhfdGhlcm1hbF96b25lIHRodW5kZXJib2x0KCspIGFj
cGlfdGhlcm1hbF9yZWwgaW50ZWxfdnNlYyB0eXBlYw0KPiBwaW5jdHJsX21ldGVvcnBvaW50KCsp
IHNwYXJzZV9rZXltYXAgd21pIHBpbmN0cmxfbWV0ZW9ybGFrZSBhY3BpX3BhZA0KPiBkbV9tdWx0
aXBhdGggbXNyIG52bWVfZmFicmljcyBmdXNlIGVmaV9wc3RvcmUgbmZuZXRsaW5rIGlwX3RhYmxl
cyB4X3RhYmxlcw0KPiBhdXRvZnM0DQo+ID4gPDQ+WyAgICA4LjQ4MzQ2NV0gQ1BVOiAyMCBVSUQ6
IDAgUElEOiA0NDQgQ29tbTogKHVkZXYtd29ya2VyKSBUYWludGVkOiBHDQo+IFcgICAgICAgICAg
Ni4xNC4wLXJjNC1uZXh0LTIwMjUwMjI1LW5leHQtMjAyNTAyMjUtZzAyMjZkMGNlOThhNCsgIzEN
Cj4gPiA8ND5bICAgIDguNDgzNDY3XSBUYWludGVkOiBbV109V0FSTg0KPiA+IDw0PlsgICAgOC40
ODM0NjddIEhhcmR3YXJlIG5hbWU6IEludGVsIENvcnBvcmF0aW9uIEFycm93IExha2UgQ2xpZW50
DQo+IFBsYXRmb3JtL01UTC1TIFVESU1NIDJEUEMgRVZDUkIsIEJJT1MNCj4gTVRMU0ZXSTEuUjAw
LjQ0MDAuRDg1LjI0MTAxMDAwMDcgMTAvMTAvMjAyNA0KPiA+IDw0PlsgICAgOC40ODM0NjhdIFJJ
UDogMDAxMDpncGlvY2hpcF9nZXRfZGlyZWN0aW9uKzB4NjMvMHg5MA0KPiA+IDw0PlsgICAgOC40
ODM0NzBdIENvZGU6IGY4IDAyIDVkIDBmIDRkIGMyIDMxIGQyIDMxIGY2IDMxIGZmIGMzIGNjIGNj
IGNjIGNjIDQ4IDhiDQo+IDQ3IDA4IGJlIGZmIGZmIGZmIGZmIDQ4IDhkIGI4IGMwIDA2IDAwIDAw
IGU4IDMxIDJkIDk1IDAwIDg1IGMwIDc1IGI5IDwwZj4gMGIgNDgNCj4gOGIgNDMgMzggNDggODUg
YzAgNzUgYjcgMGYgMGIgYjggYTEgZmYgZmYgZmYgNWIgNDEgNWMgNWQNCj4gPiA8ND5bICAgIDgu
NDgzNDcyXSBSU1A6IDAwMTg6ZmZmZmM5MDAwMjA2ZjU5MCBFRkxBR1M6IDAwMDEwMjQ2DQo+ID4g
PDQ+WyAgICA4LjQ4MzQ3M10gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZmZjg4ODEwODc5
NjRkMCBSQ1g6DQo+IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA8ND5bICAgIDguNDgzNDc0XSBSRFg6
IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESToNCj4gMDAwMDAwMDAw
MDAwMDAwMA0KPiA+IDw0PlsgICAgOC40ODM0NzZdIFJCUDogZmZmZmM5MDAwMjA2ZjVhMCBSMDg6
IDAwMDAwMDAwMDAwMDAwMDAgUjA5Og0KPiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gPDQ+WyAgICA4
LjQ4MzQ3N10gUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6
DQo+IDAwMDAwMDAwMDAwMDAxYTQNCj4gPiA8ND5bICAgIDguNDgzNDc4XSBSMTM6IGZmZmZmZmZm
ODdmMzk3ODAgUjE0OiBmZmZmODg4MTA4Nzk2NGQwIFIxNToNCj4gMDAwMDAwMDAwMDAwMDFhNA0K
PiA+IDw0PlsgICAgOC40ODM0NzldIEZTOiAgMDAwMDdmNGRmN2U2ZjhjMCgwMDAwKSBHUzpmZmZm
ODg4OGRiZjA5MDAwKDAwMDApDQo+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDANCj4gPiA8ND5bICAg
IDguNDgzNDgwXSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUw
MDMzDQo+ID4gPDQ+WyAgICA4LjQ4MzQ4MV0gQ1IyOiAwMDAwN2Y0ZGY4MDAzOTY2IENSMzogMDAw
MDAwMDExODUyMjAwNSBDUjQ6DQo+IDAwMDAwMDAwMDBmNzBlZjANCj4gPiA8ND5bICAgIDguNDgz
NDgyXSBEUjA6IDAwMDAwMDAwMDAwMDAwMDAgRFIxOiAwMDAwMDAwMDAwMDAwMDAwIERSMjoNCj4g
MDAwMDAwMDAwMDAwMDAwMA0KPiA+IDw0PlsgICAgOC40ODM0ODNdIERSMzogMDAwMDAwMDAwMDAw
MDAwMCBEUjY6IDAwMDAwMDAwZmZmZjA3ZjAgRFI3Og0KPiAwMDAwMDAwMDAwMDAwNDAwDQo+ID4g
PDQ+WyAgICA4LjQ4MzQ4NF0gUEtSVTogNTU1NTU1NTQNCj4gPiA8ND5bICAgIDguNDgzNDg1XSBD
YWxsIFRyYWNlOg0KPiA+IDw0PlsgICAgOC40ODM0ODZdICA8VEFTSz4NCj4gPiA8ND5bICAgIDgu
NDgzNDg3XSAgPyBzaG93X3JlZ3MrMHg2Yy8weDgwDQo+ID4gPDQ+WyAgICA4LjQ4MzQ5MF0gID8g
X193YXJuKzB4OTMvMHgxYzANCj4gPiA8ND5bICAgIDguNDgzNDkyXSAgPyBncGlvY2hpcF9nZXRf
ZGlyZWN0aW9uKzB4NjMvMHg5MA0KPiA+IGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGANCj4gPiBgYGBgYGBgYGBgYA0K
PiA+IERldGFpbGVkIGxvZyBjYW4gYmUgZm91bmQgaW4gWzNdLg0KPiA+DQo+ID4gQWZ0ZXIgYmlz
ZWN0aW5nIHRoZSB0cmVlLCB0aGUgZm9sbG93aW5nIHBhdGNoIFs0XSBzZWVtcyB0byBiZSB0aGUg
Zmlyc3QgImJhZCINCj4gPiBjb21taXQNCj4gPg0KPiA+IGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGANCj4gPiBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYA0KPiA+IGNvbW1pdCBlNjIzYzQzMDNlZDEx
MmExZmMyMGFlYzg0MjdiYTg0MDdlMjg0MmU2DQo+ID4gQXV0aG9yOiBCYXJ0b3N6IEdvbGFzemV3
c2tpIG1haWx0bzpiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmcNCj4gPiBEYXRlOiAgIE1v
biBGZWIgMTAgMTE6NTI6MDIgMjAyNSArMDEwMA0KPiA+DQo+ID4gICAgIGdwaW9saWI6IHNhbml0
aXplIHRoZSByZXR1cm4gdmFsdWUgb2YgZ3Bpb19jaGlwOjpnZXRfZGlyZWN0aW9uKCkNCj4gPiBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgDQo+ID4gYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGANCj4g
Pg0KPiA+IFdlIGFsc28gdmVyaWZpZWQgdGhhdCBpZiB3ZSByZXZlcnQgdGhlIHBhdGNoIHRoZSBp
c3N1ZSBpcyBub3Qgc2Vlbi4NCj4gPg0KPiA+IENvdWxkIHlvdSBwbGVhc2UgY2hlY2sgd2h5IHRo
ZSBwYXRjaCBjYXVzZXMgdGhpcyByZWdyZXNzaW9uIGFuZCBwcm92aWRlIGENCj4gZml4IGlmIG5l
Y2Vzc2FyeT8NCj4gPg0KPiANCj4gSGkhDQo+IA0KPiBUaGlzIGlzIGZpeGVkIGluIG15IHRyZWUg
YW5kIHNob3VsZCBiZSBpbiBuZXh0IHRvbW9ycm93LCBzb3JyeSBmb3IgdGhlIHRyb3VibGUuDQo+
IA0KDQpUaGFuayB5b3UsIEJhcnRvc3osIGZvciB5b3VyIHJlcGx5LiBXZSB3aWxsIHdhaXQgZm9y
IHRvbW9ycm93J3MgcmVzdWx0cy4NCg0KUmVnYXJkcw0KDQpDaGFpdGFueWENCg0KPiBCYXJ0b3N6
DQo=

