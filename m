Return-Path: <linux-gpio+bounces-16658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5B1A46C6C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 21:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37994188B108
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 20:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB92275617;
	Wed, 26 Feb 2025 20:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bU3IPE0s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442942755E1
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 20:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740601763; cv=fail; b=E8ChmGaITQF78H8DsB0ZCZmqDxjzxptuJ59hpYWEaGA2aemMBtX6nz0fLUIFoF/6W+e/vMLygUxUWVXVhY1PXSK754q2M/eVAxIxZH6cLKceMhNuPDozA8/YGe7QKQfSvlAkpvXsazu/Y8hNDX0UT+yCDz/+/MNWD4FOvPFqzd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740601763; c=relaxed/simple;
	bh=kiZzNmQNSAvS6trQaXi051Ud9QuulqqwD/GWcvnTSMc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rfbUWBHtHDlLyUWwoKRp+c3Is4eFFiYyNce0HLRl1/6yCFsk2fjvWkMpkMVt4oR3F3oUUbYVDNsemzyq9nzoGYsRgLayCooyR3OUirB00nQvVnj7ueM+cHhGbtJ9rd9csZBo1pIlj528AUv5WiinqRRPJ5UXCPNlhf3aQaSIJjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bU3IPE0s; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740601761; x=1772137761;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=kiZzNmQNSAvS6trQaXi051Ud9QuulqqwD/GWcvnTSMc=;
  b=bU3IPE0sF/P9/UEYL1Tc7OYBB2q3mktxaaFYwdTuH+nF39Km/7Vj6Khr
   Lo80XxB7wJWxoY6e5MCPMNkdlX7LhsFIYC380yy57Fc4Ib6KsGsGmKqby
   XwpmVRTdNvyX41h2vjhIATV6or0tdGSV7LCWKTZ2ri3su2QPXOQs8Wcnk
   LLrAbt4h/K3OCKvitn1LkLSfMuAUFNy9djL9rTzTaq//R8mPBKcAd1STQ
   k6QMYSsszuq5RFHQN/3mpg4tPi8BEaPp7+ZlGd6VqU3aUvN6SEPJq/OLE
   IHY3yG4dPSuDPduYcmKQ7/h+B4vuE+e7tra8U2qrLcPqPuj+J381HFG14
   A==;
X-CSE-ConnectionGUID: cjXilF2eS3WGauR8Gu0Nxg==
X-CSE-MsgGUID: FJTS7lXCTSWNlTNVmK0/EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41393930"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="41393930"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 12:29:17 -0800
X-CSE-ConnectionGUID: AxSR6HruS/OYGj//20brXQ==
X-CSE-MsgGUID: WilS7YVjQRKZlEnYSs2xbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120930241"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 12:29:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Feb 2025 12:29:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 12:29:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 12:29:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7PLO8JnCVz+bb+6AsYawx5DheTCXCrOuFJV78yVa8woYp6GXxZR4VNLImmN95EFR5Tasyceyqfb+7P5xuPHQZK55wZTb87cG+EQerTuLtFdGK8BbnS2ZjbRefXgWY8OGAJBC3P3JAP6TuaXR7mvFuHWC8rH2SwjIQcRM/ZM+ZgGISen9ZQFLPO7fQ2Z0lZ1xM+1/jSJ5Wj9c7Ku+oUoUhyTqO3uRjuOEaPZOijALBoyhaFgA37guO2zVIU2rTKzmPRlnxLei1lO+P0Plqc1nDSXq+hHPtIeLAEL0edCP9zFk4BCkRQlUqcT6DXRD348bT3R7nTUwPp8XiRi6ma9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6COrNsxOCxjEQVzhNuDjhiVuvEbgOe6IRIgl2Ecw0c=;
 b=aunla1x9fqkMOh0I7wYw+Qh1fypnv2N5LSuTRK67k12WeSWBOe+r2F9JGWKdGSFKOWUiQKZaZWUhaU63jhdvsTGoNVgvk38/j05HBuDVlI8Xm87WFDO113HUwKM7PZ0MhIiOBCd8oKLpBh9N8DOArR9yP2ZDgGvkGrMCNFY3QZAIbNgcYOyEUNonhtrRdttA9t+4iVbFPlBLDF6LbiLEHj/QwZHnpigyi9dSVSmXZLmm4ccpyRd9kgPQA6xhR6in5m15ACX2l+s/lClRpvH5hma/It8M2/iRPnIucBbK2EMjC5SmINsc5khS4AHVBF85TieGxn9Nc6miT6VaaQFPMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 20:28:58 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 20:28:58 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen, Jani"
	<jani.saarinen@intel.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: Regression on linux-next (next-20250225)
Thread-Topic: Regression on linux-next (next-20250225)
Thread-Index: AduIhrAOw3T8Vde6R/Kk4U8loKNURw==
Date: Wed, 26 Feb 2025 20:28:58 +0000
Message-ID: <SJ1PR11MB612979B35DD84F5AFFB789D5B9C22@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA1PR11MB6267:EE_
x-ms-office365-filtering-correlation-id: 0369a92b-4aa5-4d5b-660e-08dd56a432ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?q/J1nWKABHQD4YZTLYkerfBSOOAzC4DuDq8aUzBH/RKz/OJGyuZWagA2Os?=
 =?iso-8859-1?Q?qBg/Xy/OpwxdIodIaPJ70/LQAOepeZJg8sRZeUJkx9/elwvF5H95O+9U2x?=
 =?iso-8859-1?Q?o1tXJBundBGw4GnVwjnmjZCVtkNm+Yai5L06U8hqmtBeyKOhSEm3Ozmhjo?=
 =?iso-8859-1?Q?W7M6fvFGlv/IapHlPvsxKQ76gmtcYFu92D4DU8p10WDDwQUczeZ87GdMrv?=
 =?iso-8859-1?Q?PUGtPQkMULgZl5y7NzAgnWnuMogIccu/NjhgvEIbY/eLpGs9+11sLeW8XI?=
 =?iso-8859-1?Q?OJBKaqpohpM10QXeThG7NiG+XhdnHqM/vZQ4S85kLeY4vjPc5YZWjNsuoS?=
 =?iso-8859-1?Q?XKRNMfRyeEl6tZhZv0pYxYxwlJH4/emLBGJstA59K5y7daV91WbC3J2FG/?=
 =?iso-8859-1?Q?qw3H+euKMkxkc6mE8qDEENP3eab6sBNotHA3cAX5j+ys7O02RP5dqiXGWs?=
 =?iso-8859-1?Q?l25kcCPJRjDXiYpALkoLtQOnJOEr5vy6l8BEIWZOKc1otaa4EKAZ99KouC?=
 =?iso-8859-1?Q?A0VBo2BgW9MoldF9t+7Q+quuvIYegytwvnkMOcUoxnwSxgavnrGoR0UJbg?=
 =?iso-8859-1?Q?QuDCxaAVQ1pquQ3pb4nPADNihDdxEyIoBFQN0PO5QaQ9L+AUTQQTtyp177?=
 =?iso-8859-1?Q?w0hjUA4+F8EyXNFNMH/LGSyT7lrQHG1OBmeu6UWyEt9kqL/fclOdi0EApp?=
 =?iso-8859-1?Q?DNxwgBjU6BmQhIlcW4c2O2kaCtckcHktkKwkbqAg0rGgDFGCn3ki8JI9KW?=
 =?iso-8859-1?Q?HIAxAcsKbuTfSb/W1f8HziXbls66nsYMerdkFqJ/dtecybEGHcVtEUOWsL?=
 =?iso-8859-1?Q?orVW5sXGMgErKozYuZfHGEX+YDS/62dTmdL4STBRcUhvYmV4ZABboLjwvZ?=
 =?iso-8859-1?Q?ji29gb4msWMiei8yh/Vb65InqlJl+PjyNPkxpgHRck42++k/IVVhh69Qgt?=
 =?iso-8859-1?Q?7KsgUVz2Pl7RstQLIg2CtChaRX4B6bonFfk0JkvD0XUeRl2RvGzjPAaz4w?=
 =?iso-8859-1?Q?HPNHS7KAO8SMjIFpf2i4mU8GHZJWOzFoda0s8DSxz08ax8PVJcg0ouTtj8?=
 =?iso-8859-1?Q?h+ZrX0GxNXl8g39+CW99dhV8R9oeWdEOnYeTq3Cv4U0pGk5HGrdJbwdwTY?=
 =?iso-8859-1?Q?5mC63txSKED3PfIX6rG5Sc4ck/jHAsVTGBNVdXJ/CukxgwYM9ybeTEvcRt?=
 =?iso-8859-1?Q?wDeynISOv5MVoIgBf7tXjmclxaf4tXooFTkmqxK0DpcAh/gor1Yb89GsH6?=
 =?iso-8859-1?Q?NKgFilJAzJIT9SxycNLCZRw6ACAadHd0xY1xp+XNlqZaNk/PpPNreCeJ3j?=
 =?iso-8859-1?Q?4YXeh2ZZSdJ2jYz6jeKBTBjOcPUOtgrvI652KFETDmdKlPfS11EPZCn+NE?=
 =?iso-8859-1?Q?UXKfHTu0qktRJsmpz6N79s82Bl3dx0DMPM1gzEeEoiMYLnumC2AOol/Lka?=
 =?iso-8859-1?Q?t+K1RkavpHEsYoJ+pOT2jVr/9bnoemttgBqfSA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VQc68amVgSR/BnZu2+UsHy7HVW0oylb+3z81I+aTqH++5Dz8daGZacZuLZ?=
 =?iso-8859-1?Q?meVkUW/f+Uw0iuDITx+GiSFnELawod7naNeV0DjgEO9Z28WuAqeFnLyC9K?=
 =?iso-8859-1?Q?w5+YaUZQMsG8W+dB7C0zs4sVLv0/4jANXxDsKldGkdcwog53e9gVsbncOg?=
 =?iso-8859-1?Q?yYE8ffY/nqSCL1FCvuGJzNcMlxRuoIzcOivdYIkTQraaDayhH525waI15H?=
 =?iso-8859-1?Q?AGqcbBIJL4Q8YyHodIFp1+c48BepuiHDu4SWL/zoV1iEMrnc6nCjfuX90r?=
 =?iso-8859-1?Q?RThC88pRkLK3uqsJ7vbXNJleTNks51MT3qdePEskjWt9NLSREMy4Tz7Ckx?=
 =?iso-8859-1?Q?mVtg9kiSZkZwQ1L89etGe/LkiPSXCmMevaiKScm9eXV1uAhdoEEg/MVNG3?=
 =?iso-8859-1?Q?m7G78pDGj6YYqDpXm2fD28hwz6hcCNilNS7HipEqFtnWOipX0P9Tew5zZM?=
 =?iso-8859-1?Q?fgx0b276MCZFl3HyOVeYsyEyYlFgn2s1G1UYmkiRrkZiiV2CSeZ5f60VEj?=
 =?iso-8859-1?Q?QUF0gJ5mvTQKtCpxSJyx5WaWJ224YApZoKrbKFjtwqFUW9kIyOzLqaDCuo?=
 =?iso-8859-1?Q?eaaoicmerJAyV5ytQJo1mNdQRzkn0waKgXTEK9+ZUFXnSGmc2+Y800XIJh?=
 =?iso-8859-1?Q?hMKLBfVLdETE2PVvmZuoyBtO9LS9Cs2tzb+1zcloFQ9R6aYauaXwmgRPHj?=
 =?iso-8859-1?Q?eKzYljElaJNvOKyhR/d2NNlVF99LB8BXS8MtNnfaX8dSqaq/nyDeWchtBJ?=
 =?iso-8859-1?Q?ZkTbANAos0xeRHtrT86yQmf9NtF4nVVByMTcFzOemTBTsyunmA3h8cTGmv?=
 =?iso-8859-1?Q?JmildbJwlUbAzag6Rdz5znWtQrKIcJ55wndSgb08QPw4Jytl/rWlnIZtCT?=
 =?iso-8859-1?Q?BkzEQdnkeOFTgfXW5qosw5QmI6kcwB3ekIdMiYC3NyOT33Kj8nQyCDl26C?=
 =?iso-8859-1?Q?ZIGySrRuUmU7b9EDvNPEgxqdlMiVvHfCU57+EKavEudppasMJWKtONi5R6?=
 =?iso-8859-1?Q?35oh9jfzMH4zd3oFVU+dsEWwJtdBghvizNxcZyTAvaMfk6ySHmEoqUe6BP?=
 =?iso-8859-1?Q?ZGmDMiV5mQisJUQb6wy4HQmxzH+wiZvogAVvw64HsxAt9AeyMgkgAoD2Z2?=
 =?iso-8859-1?Q?9WLSFnpd2u6MBnDXixK2auGeYKfNdTl7zmUNgm0JLlwN0yJIvm1kBIGeWM?=
 =?iso-8859-1?Q?kcTuWrWEbo54hzBwnThgdl0e5B+8nQUPMAFOqk33xRuwuuptc/WCjgtW5k?=
 =?iso-8859-1?Q?0PyEU+VZsorP0+LqyWYoPyOUZa8HWop+P1kkSZeRYzdrr06nyCo+4Tsh01?=
 =?iso-8859-1?Q?IlJsKjZ8HbjwDBpmgKB7lNE6lzXfZNZQo1tIEwrjvB7QPHhi/ZC/vZaJMW?=
 =?iso-8859-1?Q?S9gqh74+pcPp4r4MO65LyAY0Sm4LIcQQQqz9G2jCZkCVlNdMYG7lEpJom7?=
 =?iso-8859-1?Q?fvpZ9csrdqghscvwzIf0kj+U6Z51djwVJ+cDY8G7fVdhSgdMijH/yyqsgD?=
 =?iso-8859-1?Q?q4/X25LJoeRC8atMU6WJzbQfzfb/wMfmJICyxMC42nFnzo7Hvfm9R7GXls?=
 =?iso-8859-1?Q?ORMIM87kWO74MKyQ9owsuP7cNzD9GtwymZtGno9j4FBl9eejUSMO6m2Az1?=
 =?iso-8859-1?Q?9G2mJ2mt8jMVIM/PJ4+HSg59cwQcXA9xLHNFdR1idDhM27CkBCjVV1SA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0369a92b-4aa5-4d5b-660e-08dd56a432ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 20:28:58.0704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2K0Tafg/qMDLQELaeC6RLyvcYT/fcD628HCkKIYYUNOj3EsVRUHC2tiNvZJMhN3wCLo5skxdQxCFPt7qpdp3nH7dlThIpRpCjR+Sv13hs7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6267
X-OriginatorOrg: intel.com

Hello Bartosz,

Hope you are doing well. I am Chaitanya from the linux graphics team in Int=
el.

This mail is regarding a regression we are seeing in our CI runs[1] on linu=
x-next repository.

Since the version next-20250225 [2], we are seeing the following regression

```````````````````````````````````````````````````````````````````````````=
``````
<4>[    8.483421] gpio gpiochip1: gpiochip_add_data_with_key: get_direction=
 failed: -22
<4>[    8.483427] ------------[ cut here ]------------
<4>[    8.483428] WARNING: CPU: 20 PID: 444 at drivers/gpio/gpiolib.c:349 g=
piochip_get_direction+0x63/0x90
<4>[    8.483430] Modules linked in: intel_ish_ipc(+) e1000e(+) spi_intel(+=
) i2c_smbus idma64(+) mei intel_ishtp realtek(+) processor_thermal_device_p=
ci(+) processor_thermal_device processor_thermal_wt_hint video processor_th=
ermal_rfim int3403_thermal intel_pmc_core(+) processor_thermal_rapl intel_r=
apl_common intel_vpu processor_thermal_wt_req ucsi_acpi(+) processor_therma=
l_power_floor drm_shmem_helper pmt_telemetry processor_thermal_mbox pmt_cla=
ss typec_ucsi int3400_thermal drm_kms_helper acpi_tad intel_hid int340x_the=
rmal_zone thunderbolt(+) acpi_thermal_rel intel_vsec typec pinctrl_meteorpo=
int(+) sparse_keymap wmi pinctrl_meteorlake acpi_pad dm_multipath msr nvme_=
fabrics fuse efi_pstore nfnetlink ip_tables x_tables autofs4
<4>[    8.483465] CPU: 20 UID: 0 PID: 444 Comm: (udev-worker) Tainted: G   =
     W          6.14.0-rc4-next-20250225-next-20250225-g0226d0ce98a4+ #1
<4>[    8.483467] Tainted: [W]=3DWARN
<4>[    8.483467] Hardware name: Intel Corporation Arrow Lake Client Platfo=
rm/MTL-S UDIMM 2DPC EVCRB, BIOS MTLSFWI1.R00.4400.D85.2410100007 10/10/2024
<4>[    8.483468] RIP: 0010:gpiochip_get_direction+0x63/0x90
<4>[    8.483470] Code: f8 02 5d 0f 4d c2 31 d2 31 f6 31 ff c3 cc cc cc cc =
48 8b 47 08 be ff ff ff ff 48 8d b8 c0 06 00 00 e8 31 2d 95 00 85 c0 75 b9 =
<0f> 0b 48 8b 43 38 48 85 c0 75 b7 0f 0b b8 a1 ff ff ff 5b 41 5c 5d
<4>[    8.483472] RSP: 0018:ffffc9000206f590 EFLAGS: 00010246
<4>[    8.483473] RAX: 0000000000000000 RBX: ffff8881087964d0 RCX: 00000000=
00000000
<4>[    8.483474] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000=
00000000
<4>[    8.483476] RBP: ffffc9000206f5a0 R08: 0000000000000000 R09: 00000000=
00000000
<4>[    8.483477] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000=
000001a4
<4>[    8.483478] R13: ffffffff87f39780 R14: ffff8881087964d0 R15: 00000000=
000001a4
<4>[    8.483479] FS:  00007f4df7e6f8c0(0000) GS:ffff8888dbf09000(0000) knl=
GS:0000000000000000
<4>[    8.483480] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    8.483481] CR2: 00007f4df8003966 CR3: 0000000118522005 CR4: 00000000=
00f70ef0
<4>[    8.483482] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000=
00000000
<4>[    8.483483] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 00000000=
00000400
<4>[    8.483484] PKRU: 55555554
<4>[    8.483485] Call Trace:
<4>[    8.483486]  <TASK>
<4>[    8.483487]  ? show_regs+0x6c/0x80
<4>[    8.483490]  ? __warn+0x93/0x1c0
<4>[    8.483492]  ? gpiochip_get_direction+0x63/0x90
```````````````````````````````````````````````````````````````````````````=
``````
Detailed log can be found in [3].

After bisecting the tree, the following patch [4] seems to be the first "ba=
d"
commit

```````````````````````````````````````````````````````````````````````````=
``````````````````````````````
commit e623c4303ed112a1fc20aec8427ba8407e2842e6
Author: Bartosz Golaszewski mailto:bartosz.golaszewski@linaro.org
Date:=A0=A0 Mon Feb 10 11:52:02 2025 +0100

=A0=A0=A0 gpiolib: sanitize the return value of gpio_chip::get_direction()
```````````````````````````````````````````````````````````````````````````=
``````````````````````````````

We also verified that if we revert the patch the issue is not seen.

Could you please check why the patch causes this regression and provide a f=
ix if necessary?

Thank you.

Regards

Chaitanya

[1] https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20250225
[3] https://intel-gfx-ci.01.org/tree/linux-next/next-20250225/bat-arls-6/bo=
ot0.txt=20
[4] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20250225&id=3De623c4303ed112a1fc20aec8427ba8407e2842e6


