Return-Path: <linux-gpio+bounces-23868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FA2B142EB
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 22:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 838FF7A1AE0
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 20:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813E4277CA8;
	Mon, 28 Jul 2025 20:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HjErEtFS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC6275AE4;
	Mon, 28 Jul 2025 20:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734246; cv=fail; b=ng57TNEDJIEoSq1AoWOp6pg+D0e4axl9HZpY4nxUtrXbPpG4yJ6Eo++2cU7K47+fXtv8SAhQmcll0ojTmdv6BWpqezz0YFFc5hwhhC0BYKXG8frZzlPZY8R8BfeNSxonSeDKfGLxMFguberzONOo7ggbxWzEAMUqy+00ByJ46yU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734246; c=relaxed/simple;
	bh=sZQjw/CP8vQHw+XUaWyy0z/E/B2u7iVyzyymSWtPSXM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LkRT4U9VZe7r0MIkKY4gNZw8VWWDjtHRCUP6sMaQq7PNnjjMNilC3WJbNpu7Pp/YHTCKlFC7/IUvDIQlIN6gRDF2VVtCtsO91osKgXePv0O/L/s6A/n9i55/wCHliqGGOQ3fMLoswdA3JX17s6QKPpxjWKvJKLIBQipCwTkq9Pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HjErEtFS; arc=fail smtp.client-ip=40.107.237.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gep+kXV80fhAU00b/LTJg3iQFrsrtTEVwBfq4OSrjKO4bie9rF/JPnddV9dvs5mm1C8l8muMidyG5CNdoKOYzl/gMLJ5x82ZtoA3zVhWq4SCImbl95KAkLAeI5e5cpoW7n7yI4cJxJV0iGwU9832oNcEcC/rf6Ohk2HOj+WofFuk34j4vy+kpenB8FzIgY6JhFnlW5OKOmQWFFYiEvFs+cA0J2NeIhKSubN3p/j5ev0Xon2zM8gD3BXj0hysw6CbVcCP64iKPfvcLc0U4iy6Kyds6iEaccVEtqh/j/9PWKGmaVRulFPJQWJ6eB5WIC2H7BKndJiXkwnr1i2ChHF/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZQjw/CP8vQHw+XUaWyy0z/E/B2u7iVyzyymSWtPSXM=;
 b=fo0O+I5Kx3fLQAQebC+F6kBG4BM0S1+uDy2PtFbwanpoxusTm1MnikX0jvJWo9II0I1GwWIYtDFj/LHoTXoa2NWGBlRMKJGLGnO521O16BAHtNN0WTVM9R78Zupgmfqp8hlhKhzvc9GW+v9v75exZ0NY7DccY63mFUSkAsed5iSjC5T9XsFZ43kOhLNg7aX1geTuzNeYthkiQH/SgY7x1/f0dglejZLArEZC6baxmFcHbTqbgwi9PEjEu6vf7GNFKULd9tcOGkFZs2z3MiYYTOihFNgOCqiAw1meHJXKhDHrdl38XxtxYa77LqlNcUIHsWS9g56ufnfITfoN319oZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZQjw/CP8vQHw+XUaWyy0z/E/B2u7iVyzyymSWtPSXM=;
 b=HjErEtFSTLP/85TOHxnlpg3nShMgoFGQejvESMFKrSRWDWvBE0VWOsC3MrlATcLOsJV/zDWJEKJNn/Ums9B7uI6HL5NmJyZIkoAjs+tCim8tKkmMgVElMuIycyPvqiPjIIdu9ByrtcEkbiS9ZEQNMOuvca49zzXCwoqC+Oaa8BJdDtXyUf3y24wCw6ZzHYkNxXQnfPhkgjtdN/ozlXHAJI2cf+DgHMAKywJGeOyZCRPHOXBwRnmi1/zXPTXcP6u2RwaVDQLOM3hKyTEpxiBhWy7hRJnZRjb2CTbrnFlKI1gvK+6fn2Cw+Yo6Th5C3Q5PzMQZxC4MRCM0Fs/znV37nw==
Received: from PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8)
 by CY8PR12MB8193.namprd12.prod.outlook.com (2603:10b6:930:71::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 20:24:01 +0000
Received: from PH7PR12MB5902.namprd12.prod.outlook.com
 ([fe80::f62:33c5:301d:edf0]) by PH7PR12MB5902.namprd12.prod.outlook.com
 ([fe80::f62:33c5:301d:edf0%7]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 20:24:01 +0000
From: David Thompson <davthompson@nvidia.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski
	<brgl@bgdev.pl>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, "davem@davemloft.net"
	<davem@davemloft.net>, Asmaa Mnebhi <asmaa@nvidia.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Shravan Ramani
	<shravankr@nvidia.com>
Subject: RE: [PATCH v3] gpio-mlxbf2: only get IRQ for device instances 0 and 3
Thread-Topic: [PATCH v3] gpio-mlxbf2: only get IRQ for device instances 0 and
 3
Thread-Index: AQHb+luu7Cd6n+BxEEm2XwH7SZerSrQ+O6YAgAGDKoCACEdgQA==
Date: Mon, 28 Jul 2025 20:24:01 +0000
Message-ID:
 <PH7PR12MB5902EBFCAEE90BF7A0AE8DC6C75AA@PH7PR12MB5902.namprd12.prod.outlook.com>
References: <20250721162215.30327-1-davthompson@nvidia.com>
 <CAMRc=Mfg42wvT9qdYrhvFq_wdvThmWpbvvo-p9bHSsyK0pn+bw@mail.gmail.com>
 <aIDqWRmijLIyqcDB@smile.fi.intel.com>
In-Reply-To: <aIDqWRmijLIyqcDB@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5902:EE_|CY8PR12MB8193:EE_
x-ms-office365-filtering-correlation-id: ae6b96b8-6683-4905-26ed-08ddce14b068
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TmRwY3VHQlJtK0ZVNFdVYUdnU0RQd2M2b05nQ2Vpd0xLdEtHSHBaNkpqS1pi?=
 =?utf-8?B?cFdTQWNYck13N2hvMk40R0xRMGFrN0tiUS96TStzNHl4dVpnVHE3cjU5NldS?=
 =?utf-8?B?dlo5VHZiNjEwcEcxTWxrUGZGa1UrY0RMTUFHaFdXTTJJNlBXK2ZJOTVEeDlR?=
 =?utf-8?B?aFk0TWlxOXZ1VXpzVjRWL1dQTjJubUlxT2FtRkIvOWZyeUpTVmlZVlZDenJp?=
 =?utf-8?B?RzduQkNpckszQjEyZUl5ZS9WTm1lUVh0eFFITHBLbjZuR2hrZEtOOHVMM0s2?=
 =?utf-8?B?SE9IZVdVQ2pOSVhYeURLYXROcTF1R01OSnlLZlBsTE41bmhMTTM5aXVvN3JW?=
 =?utf-8?B?bVhrNHE1VklBb2V5bk1nLzFZeklVdGNHdWNmS09jZ3hPSXF5TVkydzNyM05T?=
 =?utf-8?B?QVIxSTRCQkI2dWRpZE5HcmVkNVRNQ0NmTmlPYUZ6dWdMSXdnRytFa0xubVFs?=
 =?utf-8?B?eTgzWjVnWG5iSW1iUEFHS3ozU3kvaXNoTTBuaWp0RVVHWCs5bUxJNUJpMXFp?=
 =?utf-8?B?SmtiS3UvZExMaSt6M2xUWnFiTFZtKzhTR0pZTTVLbU52KzVwV1VJNEhpNnNH?=
 =?utf-8?B?NXV4dEF3Q0tBT1l4WjU0K0gwN3dwaVhKbFo1L2U5VGUvUXlUZUthTnpWRGF0?=
 =?utf-8?B?Rm1SeHFYbzQ5NnFoMmlTZTBOWG1ITmVqV0NlRDFoOFR3Vk9pSmpXZy9DckFH?=
 =?utf-8?B?Qm1JUG05NGhVdDFibzJJNmpyT1NrNTdnNXp6QkhRWlhoODN6a21EdlhIYWE2?=
 =?utf-8?B?Z21kczN3V1l4QkQzS1RVc213UUt0TWVQKzA5RjFKM1EyeEFWSTlwMUdCVDVT?=
 =?utf-8?B?QTczRGJJclNFVEZ3OFA1a295cUhxdlQrQVFneXNsaFRIQmNid0RnREpVU2RK?=
 =?utf-8?B?YWF5YW9GNEVJNWcxNW9GRlVBTG5WdTcrY29ZZHJuUnVmRXJOUE1iL3I4aDRt?=
 =?utf-8?B?TFU5akE2UjRhRTMyengzUG5DZTlsZGVRbUQ0TFlFVTRMMWJVakk3ZjE4SUJt?=
 =?utf-8?B?TW5EREFsUGxJTldCdHNqSHVheTVoOU5sQ1gyZ1p6TkhMR3hWQjB2OEFkSFAw?=
 =?utf-8?B?c01YbnhsdE41TCszMyt6UnpXZUlIVUpCb0ZzUmo3ZEpLTXRjUjFQa0M5WjNS?=
 =?utf-8?B?MXp2ZFgrblBBRHRaQnJSV2xjaitVZU8zVUZqeGo4ZmVzUXJ5UDVHZHdwVWJY?=
 =?utf-8?B?SnR3OGZ2QS9saFd1TTlydVB0dkdlVEN5Z0NUdUI5bFpsUEJuOEVTZHpQblZy?=
 =?utf-8?B?ckVXMnFqWC81UWQrNnJmTHdkd2hhNjlBMEFTc1FqbllUZEZkWDBLWkhCbUdR?=
 =?utf-8?B?cTdWNUFUMlVneVAvZ2pYMkI5am5JNUlQM2NaclZRNFU1MUc5Q3FySjduMHU4?=
 =?utf-8?B?Sm1jUnRyYjdqaVFDUHdxWW0zazc4eng0eEQwZVgraldRaWhtdWhuQy9TQWlQ?=
 =?utf-8?B?cDh4K0xHbGxMV1RqaTBueDJtSHhVTzJHazVlRE9ZelpiZThra1VyVXR4SW8y?=
 =?utf-8?B?Njc2YUVGU3JlWWFYWlY4anFSOCs0N3FieXJ5My9nSmxESVJoL0VhSlViZ2FV?=
 =?utf-8?B?bWtoYXRPUFB5M0F6L0R4b0hQYmIxZHlqWjVCNG0xaG1DNitZRzZYd2NLaSt1?=
 =?utf-8?B?NUVleUd1a0tVSm9YeGwweU8vL2x6clMvTXorMGxmVGxNRHU0QVBjWlJ3UGU0?=
 =?utf-8?B?RnhHQ0IrQ3A4bjVDQkVRblh4L1luNG51ZFd4THRvNk1vRnJUVXhVK1NHdVdi?=
 =?utf-8?B?TTA3TjlXVmo0M0ZnTHZ6VVpyaXJoQ1ZrNU1nS2RvTzBoOFlLMVFMY0ZXSlVo?=
 =?utf-8?B?YjY5THB3SC82S0xLZDRoZFNaOTFvLzM5QTBKNjFKMUVxZ1RLT0ZnVExFcG16?=
 =?utf-8?B?QzVLT1JxOG9wNDRscThIQ1lvWFBUcU5JdSthUUNwc2JYUTV0YnpFL2RmOWYx?=
 =?utf-8?B?dks5c1ppN0daZ2IvN2FrUmNOZVkzVWdiVXM0M2JLNkphMmxEQVI4ZTJRZzFp?=
 =?utf-8?B?NTZSRnhMaHdnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1c4OVlIcjVBS21VY2ZsdEZIYzBFbFRnMUdCcHVhbzg3R1JPUlZaSG1qNVRi?=
 =?utf-8?B?dmt0aStiN2xoelo3WkUxd3dhSklTTWdUczJibVhjdDVNOXFqcGVQQjhQcm1x?=
 =?utf-8?B?Q2g4TVQvRGF4RWx3Z2lya1BOZUQ4MndiZ2huNEd6bW5uZDdiWDdrVjNWcWhv?=
 =?utf-8?B?M1FSLytudTM3S1FJY0RqTXVrU0d1ZGwwcGp1Qkg0RldWekRaaW0rSDA2VFdJ?=
 =?utf-8?B?dWFtVnprdEdkZXNHWDF5Zmp0S1o4T3lPQml2U0xMd0pEOC9obnR4NU1xaEk4?=
 =?utf-8?B?UnAweTNRT0dISkNaZ0ZNQVJaNFloSmU5cy9jbzlhVStqWjhxQ0RJRlk4Vjh1?=
 =?utf-8?B?ajFyTWhIeEU3NTZlb1gzZ1h0YUVLencreEdNZG5neXpEUERGL1ZZZ25MY1cy?=
 =?utf-8?B?NEdKckV4TGlsY2ZEa3R5UEhkK1dLZUZxdE5Cc1Zsb2JJRFZnWnBTd2Fudmc0?=
 =?utf-8?B?UldHWitDNTZlQ0ZUK3BEOFpVWnBFZGM5SjFmdmEwenJPOTJFRnZBcEk4WHpL?=
 =?utf-8?B?bjFmNWFseTVYZFhmWHdtYmZKK3BjQ0xDQTBWb2RIbGRLVmRhYzR2NTcyWkhN?=
 =?utf-8?B?aHNVNzl1M0Mvbk1aTWprd1VpQWpDN2xUV3ZuVnBrcFpFbDhjc2krZk9BTzY0?=
 =?utf-8?B?VFQ5a3dIb1l0OXNlM0pMVFRDdXRNcHBkRnAvc0FDMm93T1Y1OGptVVpTQ2pw?=
 =?utf-8?B?ZytvZm1hUTBweitzamdZU2pPKzZuQ0ZSUi9KZGllcmJmcWFMMHlSMU1mb1pD?=
 =?utf-8?B?MjAwSXBzOE1jV0d2dm1GSUJXZGpBMFV4YnBxS0E4L05FTVZLSWVKeW4xNDQ3?=
 =?utf-8?B?UW5SWm43NGdJZG9sQllDSFcvSWdTN0JrVk4rWitPcnoyWXZVZE9JQU9MTFFU?=
 =?utf-8?B?REVTSCt0OHEycUo2VGpzbmJLZHZudCtlNHhveEVQMVhVUDMrQ2x6NkdNN0N4?=
 =?utf-8?B?SkM3M0R4M2U2UWUxMzduRldhZ0RDUS9qbTFjZElRNldQVjRKRjJyWDh0OEpo?=
 =?utf-8?B?MWNKdHcvL1JrYzlZM0ZyVVF5Nlh5R2krdnA4WWloTk0yK05QMUMyS2JiUFpw?=
 =?utf-8?B?NDNZSWFUak9YbXl2djBZNVBoVURvTitqNnJMS3lLdXdYQTErZFI4Y2RUVGZv?=
 =?utf-8?B?ZGNTQ0dmZy9SZWNBcVBOK1VnemJFYmhXdUxnRzRqTXg4cjVjdDZQUW0rUGp5?=
 =?utf-8?B?ZHo4SkFiUFMyRkVNQ1VkS2RxSmlZYmdUQ0VGVmRkcng5L2VmMmt0Q1BkT09w?=
 =?utf-8?B?K0ZTNXRnTzRIWFJXVUJEaTIzQWllanF1c2hGZ00rbTIxTzczRHJZalNscVgv?=
 =?utf-8?B?SU1lUGswZXQrZ3BPVjRSN05kRTBsV0dUWTVtcmFZZzdqZlNpQjdRRXNZOUNl?=
 =?utf-8?B?c2xFMlN5ZmRzUHdacVIrZ1FDai9sMnNoSmxCSlFaZEdleTl4S0hwM1dXZVVD?=
 =?utf-8?B?ZkUrT3B2eEN5amFlUmkwd0hLN0JpdXN0YThmM3hlUEd2ZEJzZndTUjVwY1Aw?=
 =?utf-8?B?U1ZseG9EVWFUVldnT0xwTlFzSkhON215ZFVIZ2xaNnhjT0JoL292MVJPcFNJ?=
 =?utf-8?B?bktEQTlXcWNqTFpjdnlNR25IZ0FyWEZRd0wvMDE0OGYxcVFHdXpWZU0zUzRM?=
 =?utf-8?B?MDEzQWp1NldTTkxTdGVEWkNmbVJiSnI0YXphUjhYa0EzcDlIVVc3ak9DUVIr?=
 =?utf-8?B?ZFM1aTJRKzBOOG5tV1plUExpa3lBYkF4T2xVOHpBNHdiNWlPd2ZwRzZnb1Uz?=
 =?utf-8?B?a3hFMzN4dU5aTGdZckZudzEwck5uNmVEcVBpb3V0b0JJazVJVUJUZ2lEMkNq?=
 =?utf-8?B?T0ltYUhnTTJiUzcyeWNyRU9BUzRmcGFUVkt5L05KeXVqTndCQTlBOEIvNDBm?=
 =?utf-8?B?eEFuZXhrd0IvZHlOT2ozUnYyWDliS3h1bjVRM2s5SDZJQVVIWjRTc2wwY2R0?=
 =?utf-8?B?em1tVGhTQ3FJS2tUa3dpUkdrL1V5S29iLytCNzBLVU9LSHp5by8xL2grZzNJ?=
 =?utf-8?B?NCtwaG14L0dqYkpWeUlzcWk5UXQycml1QXJMa2V4eHZ2djhPdUhWdWQ5MzZ2?=
 =?utf-8?B?Y29OeldJUXYxbkkxWHJJKzdlakgrMEFJQXJIN2IyN01ZaVZoaXh2amVVT1Fw?=
 =?utf-8?Q?IB9/0VZ4UXFHhmjse+iT2tLU8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6b96b8-6683-4905-26ed-08ddce14b068
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 20:24:01.0482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1MJteE/VByttI+UCygWkBlkKCT37ePGCO2MUP1y9m4glq0NdA32ypL1CG6FT/BcmSJw/G3NraObTY8L2hN4AIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8193

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFu
ZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5
IDIzLCAyMDI1IDk6NTggQU0NCj4gVG86IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYu
cGw+DQo+IENjOiBEYXZpZCBUaG9tcHNvbiA8ZGF2dGhvbXBzb25AbnZpZGlhLmNvbT47IE1pa2Eg
V2VzdGVyYmVyZw0KPiA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbT47IGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZzsNCj4gZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsgQXNtYWEgTW5lYmhpIDxh
c21hYUBudmlkaWEuY29tPjsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBzdGFibGVAdmdlci5rZXJuZWwub3JnOw0KPiBTaHJhdmFu
IFJhbWFuaSA8c2hyYXZhbmtyQG52aWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNd
IGdwaW8tbWx4YmYyOiBvbmx5IGdldCBJUlEgZm9yIGRldmljZSBpbnN0YW5jZXMgMCBhbmQgMw0K
PiANCj4gT24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgMDQ6NTI6MDJQTSArMDIwMCwgQmFydG9zeiBH
b2xhc3pld3NraSB3cm90ZToNCj4gPiBPbiBNb24sIEp1bCAyMSwgMjAyNSBhdCA2OjIy4oCvUE0g
RGF2aWQgVGhvbXBzb24gPGRhdnRob21wc29uQG52aWRpYS5jb20+DQo+IHdyb3RlOg0KPiA+ID4N
Cj4gPiA+IFRoZSBncGlvLW1seGJmMiBkcml2ZXIgaW50ZXJmYWNlcyB3aXRoIGZvdXIgR1BJTyBj
b250cm9sbGVycywgZGV2aWNlDQo+ID4gPiBpbnN0YW5jZXMgMC0zLiBUaGVyZSBhcmUgdHdvIElS
USByZXNvdXJjZXMgc2hhcmVkIGJldHdlZW4gdGhlIGZvdXINCj4gPiA+IGNvbnRyb2xsZXJzLCBh
bmQgdGhleSBhcmUgZm91bmQgaW4gdGhlIEFDUEkgdGFibGUgZm9yIGRldmljZQ0KPiA+ID4gaW5z
dGFuY2VzIDAgYW5kIDMuICBUaGUgZHJpdmVyIHNob3VsZCBub3QgYXR0ZW1wdCB0byBnZXQgYW4g
SVJRDQo+ID4gPiByZXNvdXJjZSB3aGVuIHByb2JpbmcgZGV2aWNlIGluc3RhbmNlIDEgb3IgMiwg
b3RoZXJ3aXNlIHRoZQ0KPiA+ID4gZm9sbG93aW5nIGVycm9yIGlzIGxvZ2dlZDoNCj4gPiA+ICAg
bWx4YmYyX2dwaW8gTUxOWEJGMjI6MDE6IGVycm9yIC1FTlhJTzogSVJRIGluZGV4IDAgbm90IGZv
dW5kDQo+IA0KPiAuLi4NCj4gDQo+ID4gPiAtICAgICAgIGlycSA9IHBsYXRmb3JtX2dldF9pcnEo
cGRldiwgMCk7DQo+IA0KPiBTbywgd2h5IG5vdCBzaW1wbHkgY2hhbmdlIHRoaXMgdG8gdGhlIF9v
cHRpb25hbCgpIGNhbGw/DQo+IA0KDQpUaGFua3MgZm9yIHRoZSB0aXAsIEFuZHkuICANCg0KSSd2
ZSBzZW50IGEgdjQgcGF0Y2ggdGhhdCB1c2VzIHRoaXMgYXBwcm9hY2guDQoNClRoYW5rcywgDQot
IERhdmUNCg==

