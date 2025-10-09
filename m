Return-Path: <linux-gpio+bounces-26918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F0FBC7210
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 03:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B8A94E5119
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 01:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B51A16DEB1;
	Thu,  9 Oct 2025 01:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5pIIdBt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA132940B
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 01:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759974729; cv=fail; b=i64Ih5ZB7OlSsD+nbLEVKUinFSVEwnSEQfoxnNCDFkNvH7GuVSIut71DSqo/7ba/yhPz+dLU0uILdBagoN20eh1tzWTHjHUzyPro7pYRWWEfmXVmrK7/J9eBQM9U7tRBfEsf7DDzURRTEboRWQjHSlnMx77Nsn6WEWB2EmiMrRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759974729; c=relaxed/simple;
	bh=YO9Q22GoVNywA4pwFUTYSV++Byj8TGN2OxPHBW+cxrk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FS31cVYUUomeE7lnrht5w6A+Y9yw/cPQxge1ZTjqtkhd2RTSCvszeNZ1vGjOYZYS783QHOBy7/hgROeoyMl6OJDwJQ4WbZL+DAKJ3cAtdAXqwblA4/Ne9PxFpb2qufPhYVGQ+qj5AzA8EjOGMapNwAvLTVIjyhJpJtWZnlfyAsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5pIIdBt; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759974728; x=1791510728;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YO9Q22GoVNywA4pwFUTYSV++Byj8TGN2OxPHBW+cxrk=;
  b=Y5pIIdBtJVBNesOXvAnfpQPgCXOVTqIAnEyHdAvs3wZXGQZDJl5VKla4
   ZW97PVSbnPA6l7UPF5Web+4npY7LpkVDGgRfLhq6pt4JIeHYfRPDWlfPb
   uCU0wfnLaGkZ0cNORuesFxwqb3Tx4YT74GA0+4p+/JBwWPvKyKuqZFquR
   mNP70IE2wSxAI1gR9z03IANoExTSno0mqHRVibG/I2qkE7U8YP4I/JRwU
   kdo38KRjooYuapU7n8GRTD4XcRJunEElWT1hdoLPggMJbRvTcAu47K6L4
   RfsEBD2kfbhK3sdF22PRdiKhmDgkrL2gqaeDiNXLJip04auyo/gTpUisL
   Q==;
X-CSE-ConnectionGUID: FXV/Ig1cTTW9GwVoJg+Rxg==
X-CSE-MsgGUID: nV1UFC9iRAWXhKy9ObYnTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61215251"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="61215251"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 18:52:07 -0700
X-CSE-ConnectionGUID: 1D0Lwg2SSuKhBDiXqYfkKw==
X-CSE-MsgGUID: n8GQmlLfREGV5qwZXTDUAg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 18:52:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 18:52:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 18:52:06 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 18:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4xgBnfiODeWxrMMt3gdD3amBB8ZBUCFQmrUpoK7z1m/VYt+0peNTDhhzPrNykgJdN8hsEY42RHXzseZtmM0lXSN7yLUBWzZmnwKbtl5HTQ9Xpw7AvNDbuWN9d9GUsMLaPTRvtrWljCrfvly67oCiVBs29kVJMc7BUc8cXJCjR/DFGYiW0N04AJIRhryEnhP6493XOFpH38x+OM+fAEqU0gUu9L/6zOeAOKXco5PSSIfjSuPv4JA7do9hclWBa81svdS8nPpF98gmQmq1vrGvBTvR9BZC1p2eDjSt/VJA+l2sF7lnttRopJtJuNmXx2f58+tqVG8wzLpGo6fjmZ3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6/s06E1evsRRj0izXyw31C8QxFerIeIoHvVK9xLqy8=;
 b=WSa9fhH3crpZ5GqqZbjHG6dGieqLUCFIx04F2Yu6stI02rkM/KAFJqJLwc125idAmDxNXyl/DXemlbj8jd5oRBk4vhMsfaCb6PknCfhjCJpN11V4U0QOUnkTa6aTfZO/E1a/PvJBA3JRvkZPnizzjNIs2b1GkqQv5ulH/JR5X+VWfhGhAalOMtQt+J8uKv23183sZkAUoCy9BIAg/Wp1y2Yw/jSaPaa0u9C4EH3ev9CCr8qUxZvx19XjEKQmeqMuXR9aiYcf6R5V+8VGHym4eE7ckD+vAjKEasDgIxarBuoVRkbzj3XxFDxiMjXM9Vyyyd/08TfhOAwAdIje14Q+Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF11A2D5672.namprd11.prod.outlook.com (2603:10b6:f:fc02::b)
 by SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 01:51:54 +0000
Received: from DS4PPF11A2D5672.namprd11.prod.outlook.com
 ([fe80::458e:ba67:2c31:d3cc]) by DS4PPF11A2D5672.namprd11.prod.outlook.com
 ([fe80::458e:ba67:2c31:d3cc%8]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 01:51:54 +0000
From: "Cepeda Lopez, Israel A" <israel.a.cepeda.lopez@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] gpio: usbio: Add ACPI device-id for MTL-CVF devices
Thread-Topic: [PATCH] gpio: usbio: Add ACPI device-id for MTL-CVF devices
Thread-Index: AQHcMxnKuf13PReLhUGQstRGnfsl3rS5F/8A
Date: Thu, 9 Oct 2025 01:51:54 +0000
Message-ID: <DS4PPF11A2D5672E4BCDA719E756FD3943DFAEEA@DS4PPF11A2D5672.namprd11.prod.outlook.com>
References: <20251001212416.4871-1-hansg@kernel.org>
In-Reply-To: <20251001212416.4871-1-hansg@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF11A2D5672:EE_|SA1PR11MB5899:EE_
x-ms-office365-filtering-correlation-id: beae72ae-9d75-421f-8994-08de06d66c86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?3tNkQgVwGzZ7r+HdqQ57QFjTwMAMwEB2X9cTS5/6sJu94Tmt6NmOzbhL/YD3?=
 =?us-ascii?Q?59Z+WO6/eN8QSyd7IbYo6UQ///DcfC+Tv7pIk0bzIaxmYn3Ap2WV1iozbUbp?=
 =?us-ascii?Q?xH/jWRLG9pOXMojDctM1wQWuNikMIbXBnB3CoGs2pjDnRqQNeTi3kdbkw3C+?=
 =?us-ascii?Q?TVgUao7Bdmh4cThYx9wR2is3bIpVErHInr36UVo2gLLqS4ucKOlD/V99Qxji?=
 =?us-ascii?Q?T+ulITl0t3EJY0MH/KaG4yl79g3Q/0YU6rOGotiIhngW5sJUr071bBPLtir/?=
 =?us-ascii?Q?sWmNqJjPQbcwpDjtoPOcNhkDanG7cQJbvjNtuRGUww7Ft7Vyfl/pMNrdNmqW?=
 =?us-ascii?Q?aCNlAEZiKsqLQo7RBzKDZpxfMS9T8fPb/7z3abbiEkR1ZG/xoTWtexaa2VXU?=
 =?us-ascii?Q?5PLHyfNY1qQ1QYLyMpUGV2GclbLuARbBGFOkMEQOZGDUBu6cQWAI0UT1TrI/?=
 =?us-ascii?Q?V/iv1akj8MIM4C4yFnpv+q/JrhV6BOrXSYYYgwMlb33R3mvx09nsITO3k2Rk?=
 =?us-ascii?Q?QmIdNE5x5dk4u9n9EzJZQbX/zn6kkb3BYpMCmthJ3dju4hqqvJtUzxKekgV5?=
 =?us-ascii?Q?WGKIKpw/rS/x7QwG6WAp08YkFCmaPJdhFeUkL/Z0NrvPBvU8q6fzMMq+E4I4?=
 =?us-ascii?Q?5tlFZJb4hUmOmYnJN2I9YPzZYlCCg1MBi9YVU8pahpUyTUZ+EnwuxPX75zA9?=
 =?us-ascii?Q?byn3hsPMY5mZxa4HoRyqok7wx7LcMZzWipXyHvgDqj6/ACFt9t+W6FfM1KQe?=
 =?us-ascii?Q?e6l2HIDByButvC6GrVZGsuu7JikDiHaF4cJZLezSoo9DhdiBo9AX9K0MG27s?=
 =?us-ascii?Q?OAHYIi7cIr9sKlnBSjbbESV66NaYEE2ozoghk7V7tt+w2TMM8c425xhdAKNi?=
 =?us-ascii?Q?RG9x0lgHeZHU18L0AifmRXR+HrXJnxmJC8NzF7e35ylavst3/QgINFshht7j?=
 =?us-ascii?Q?C3S1wl253uZSqVEn6lTkA40Dp+1EJ25UhU/D++sD4JgE3VlQwMMy67gZHZmd?=
 =?us-ascii?Q?Ix/Wzig5Gje/dDyxrSnCvIp0bCFwo7yrLQ/l6uV70ijF2BiwwUsMv7mqwhTT?=
 =?us-ascii?Q?hDRiP0hxZC9H1w7lfDAvv0u3J6mTGH6QBzfwnum0BL8lp9akC6GcKBEpAyYD?=
 =?us-ascii?Q?M5tTEhf4LOI44RAziaGfS9aQkW/7qQ38ynyZTiPLnPlPtn+4VXjSTBmScUew?=
 =?us-ascii?Q?8OWF1D4bILb2wj7OQDCv/aA6tUX4ledVwFULOaDZgXv6nnHzL2o50AHsgbbP?=
 =?us-ascii?Q?OD2cHSPJIY5u/wZkLyTTZn8JvWsYS0DPxernKKEiOqq5Nff7mj2pgLR5WCYl?=
 =?us-ascii?Q?Y8+aW/PQt3r61x+5+nrJzOohdtJq8Er6zN2k5Fzdfm66QGg/dhG5kCRjSJz8?=
 =?us-ascii?Q?Exn7SD7hFNrE8KQuYT110kmqn1rFGbrXOd59E6Q4Ug6ptqpx6dmwiPbf5umL?=
 =?us-ascii?Q?W6wjJKt3g0AKxJVuOGFKYFZubgsc7unHjvRv+5n2huH2TmpGjCdZ+cd3MCpN?=
 =?us-ascii?Q?OzrYhh0Q0yta6WrUxRVHXEYmPLXRW/toUnaz?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF11A2D5672.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KGcwuPjjXE9vITmVo3g15TazIAgTyjbfsMzOSYK514f0qh09pxiqDWYkOks7?=
 =?us-ascii?Q?fKd5ekoJOMHm7zLbfVl+G9IIdvHEE2y93zkrjytgL86CBl0I9iEq9WTHJgjJ?=
 =?us-ascii?Q?unpJnWER+ruS8rZ+tOJxVjSdQRMNaOP7EhdCCf/017vzz4sSw4pXQym7AqRv?=
 =?us-ascii?Q?sfTVdVuy89fixTON6POp7L0Lw/2vXWsK8+8F5gzd2D79yOoqnI+aa6uZsqCr?=
 =?us-ascii?Q?fZNS6ov9W5OzSBLWuSExJ1mIJAFLgTMans0DK9dXdeAphyvCY1GrPcNZR2bg?=
 =?us-ascii?Q?1fZ0aQBtlQq4/kVybj43c5Lo5hPd9IEzeelYi90+rUnkp9vap/7GK+4SzyhT?=
 =?us-ascii?Q?TOXwwKYoMbr7RwFHruyy2AjQw61ZAfQKLDFtVaYQ1OojrQou0M6RKCV/Pk2y?=
 =?us-ascii?Q?WmNjP0LaJBeZapvdC3xAINKCPd5OJmlcLwQZT8fkTuMHjgqrq7VYqRzHaSzt?=
 =?us-ascii?Q?KJfp/Bxlbn5Bo143/mCJHSiXNQNt9keG+I5ZJsDhOi4pg+BLmMs/yHVXQ417?=
 =?us-ascii?Q?PzdDZUr4C2UusVvVQeKKSfnutdboyWCFcXDKe/Xt/JSQkI0mg+fkOFosO5oX?=
 =?us-ascii?Q?2B4aRfwV4JsoZQv2Vez+udnl9ohbVpwNWPfG2Ckw49JXX0WoP7yklEdvG7cR?=
 =?us-ascii?Q?nnFGwgTB0TYuhCCwkJhtQwwXHLLdG3wlxTn7qW/l63gKooZJRKHK6/mYB9DI?=
 =?us-ascii?Q?GokcCVWd/HbuQ2rWJywO3abXtheLOLHxaleWnjgtlY+KekDjrE3C2Db5ubr/?=
 =?us-ascii?Q?KOxorLrxS0GZEUKniBGXQxOyOoCSniHaWX3Z75djcbfbFmWsFiKgyujlG/Dx?=
 =?us-ascii?Q?PJGqtDEGNVEHQjYi5zUskZ2m5N0hKPtbmwOpFu7KSAZonSy+osGcIUToOBoB?=
 =?us-ascii?Q?al7591rh/chlSTjfMS2xw/TygTMKePB6K5vQkF1fs6I5ez8alcsDzutp7WCE?=
 =?us-ascii?Q?Np/f79uGkFulYQ/Ps0kkhxUFQ+yW47MxuIMg7fJv9aaOZo2P4IcdUeyjtmvu?=
 =?us-ascii?Q?29KvTSYnZixV/flrZQqYtADX/B5lwOAfxNyeWvW3haZPg9lcilBl0vW2kkYO?=
 =?us-ascii?Q?MO3UFPa6IVtjEu68cb/SKFT/eS667nMJd7pW7mpsfz8hMarJQ/pERmfq3CZ/?=
 =?us-ascii?Q?LPJoLJkFTiyNMugkSSyS/ZLKt/9tFLKclW7N9j7NtE4UPWYgBdUCtJoqizxi?=
 =?us-ascii?Q?+tHAgpD7lwAtjgO6EzECSH6SeZkD5KmZAklJ8jWtAGiiaosw5yr/uilbXW20?=
 =?us-ascii?Q?ezwGRCTBNT12Pn4fJpsUUSAtjp/qGhKZqGdTSfwKK+2gZZnAn/KYGvEwdfS+?=
 =?us-ascii?Q?iJVc5V3M93ew+PwMg0vnD7/jpu/cxTxBzPyKoG83d3x812b7ucSxYHEEFOMN?=
 =?us-ascii?Q?wDxOAsKNiT45BTqMQEW9MossO1W4RwMkcOvKi1a9DC8fySDmC9he4wUlMJk+?=
 =?us-ascii?Q?cbZNxYQlGZoEQxvLu57pDtu1C2ysMbep4WcfefDtsW6Kdj/fv6Onx9MAyckR?=
 =?us-ascii?Q?mSUITvrUlRDgZlpgXwJy/RGMJe4T2jG0hk+/wquDb863AsaEaCbmWR9BueNo?=
 =?us-ascii?Q?gXtogNzsTTHwuT3LojzC/rsZyGXMJnBFjXw/rYWy7hG+p/gE63+sRgMBsAcn?=
 =?us-ascii?Q?9A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF11A2D5672.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beae72ae-9d75-421f-8994-08de06d66c86
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 01:51:54.6222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lea3OQh2Eo9aichJdyJPSxGZHwf1qqulix1++N540PDBiANbJB35iikRgdfZbhVJbSq4+vrsrPekXk2pRBRJs4yVanx3f561858tVk5VKEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5899
X-OriginatorOrg: intel.com

Thanks Hans

> Subject: [PATCH] gpio: usbio: Add ACPI device-id for MTL-CVF devices
>=20
> Add "INTC10D1" ACPI device-id for MTL-CVF devices, like the Dell Latitude
> 7450.
>=20
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2368506
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Acked-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>

> ---
> Note this applies on top of the addition of the new gpio-usbio driver whi=
ch
> is being merged through gregkh/usb.git usb-next
> ---
>  drivers/gpio/gpio-usbio.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
> index e13c120824e3..34d42c743d5b 100644
> --- a/drivers/gpio/gpio-usbio.c
> +++ b/drivers/gpio/gpio-usbio.c
> @@ -29,6 +29,7 @@ static const struct acpi_device_id usbio_gpio_acpi_hids=
[] =3D
> {
>  	{ "INTC1007" }, /* MTL */
>  	{ "INTC10B2" }, /* ARL */
>  	{ "INTC10B5" }, /* LNL */
> +	{ "INTC10D1" }, /* MTL-CVF */
>  	{ "INTC10E2" }, /* PTL */
>  	{ }
>  };
> --
> 2.51.0


