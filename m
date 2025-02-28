Return-Path: <linux-gpio+bounces-16795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D525A49755
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 11:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF1503B913D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61BD25DAEF;
	Fri, 28 Feb 2025 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ecs9Erf3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406125D8FA;
	Fri, 28 Feb 2025 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738508; cv=fail; b=ANBRjnwJVclpBXHxWp4r5FzFUdAG8aKftkN22rnxSa+l2XBP8ZfG1dtOAr8TaLtxy9gl+mp44q78N9/MjhlyJ/muNc5SxvNc7nhiikhFkpadd0P9IWO1ua0Oh8r++Ye0tC7/6/epsODbFbxJBq8cYFTauxbfPs47S45NavpKmgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738508; c=relaxed/simple;
	bh=tlUqs1rAwJ0Dr9LK/rFjUJPxo/qv5kUYOOd2ZqRxM7c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kmoDqpLFQ1dhSq3bNbLr0h83o+lKDiVKK96QRzgZheATZuoHSHaQgT2csXCElswCe5DmS3hDHjAwatYywDpZcw19apt3ruEo6F7WVvRJ43/I7pmyQJcfzIn2ofdAiNpcV/ibTQlDizO4IZJCWENqI1n/teoT7pADMS+RhU/Q5dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ecs9Erf3; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRYA6nOiDP38sV1wOKjVa9xwvWoMQvtgAE+e8Mk/BgZ9qtmk0nmkzmLYAXpsKnZCAUxqS962+XpKGn5goXhUwIsjhquthmq36F+Bcklf/K6UvZuKBsrDaTvkHkPNTlZVukwVgqXqvsfGU3G7wZCynceCRgvAqjTe+HLrGw9kkRz3ZfwSgjI8NGbhcZKYAdJIpyAVBrM2Ki219SYWAfJeRQl2hHdexNMj0psVZV7NgSYGhJU7svZ9ZomoHg5xrltRZaZcT8vX5FgJtrMkRneOLTdhATlLKViw9v2Dg9gARLeK7CirBq6ebIYkaqGFAihWk5Ij3A46kBrZF2Lp+g4V9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlUqs1rAwJ0Dr9LK/rFjUJPxo/qv5kUYOOd2ZqRxM7c=;
 b=mpwYL3qo1QeV1HOE1TK/349tnMWFNtB/p1CqztWW6VhP6DnqZGLtq5K/MpaZ9N0f6y6uebB5D0DtCcGHLhDBr1mDF4XWNPA0ENDrDqKC0/ldaKOV1cM7LyJltAAqcrkPa0R2Wrmg9y2HMk6M+nC/tBBjbNfty4DeJwda82uOhKpoKyES86MNJyQmAtrqninTgiHY5MYLM2WM7c+54by1n4EgFoFrVcJHH+HN2HmDLQXl8iAMBm0CB7i6t2GdkQdbhwixqFOEK6GtSCrU2DXXl4yVGxw9KUPsrprF4Ayn4SSP/MAA76Ef3UxLl68Fu/zkv+KD6YrUzabHcaR1Po7ccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlUqs1rAwJ0Dr9LK/rFjUJPxo/qv5kUYOOd2ZqRxM7c=;
 b=Ecs9Erf3n3xJiv6QIp1uMMIuPZoYqaH4NATu2vx+ZrTbCuoWOC0IQh7lVb3pa/Dd2lu1h38OztqlQAxN6Q/y+LCXmGGcu5yd0lHCNatjNKW8l1BrCScEtu8Fabkq3hsjus2auPmJ7WFnGoimeqleuRU7xhWKoEOnZyzoIrMss5c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14409.jpnprd01.prod.outlook.com (2603:1096:604:39f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 10:28:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 10:28:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij
	<linus.walleij@linaro.org>
CC: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen
	<matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] gpio: Document the 'valid_mask' being internal
Thread-Topic: [PATCH] gpio: Document the 'valid_mask' being internal
Thread-Index: AQHbicO23IScfXI6HEiu2jnuDYpfdrNcgrDg
Date: Fri, 28 Feb 2025 10:28:21 +0000
Message-ID:
 <TY3PR01MB11346EC54C8672C4D28F931F686CC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <Z71qphikHPGB0Yuv@mva-rohm>
 <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
 <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com>
 <CACRpkdZtWLGAn0K+xENY+RF6CsWPn0m7R--W9EaH+xTKazALFg@mail.gmail.com>
 <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com>
 <CACRpkdasQZ26cEv7CCSu75MJH=Pn8a45XQvZmNt4MB=hzTSa6A@mail.gmail.com>
 <CAMuHMdVLqS0=OXBMPAct9bkNWcRHTEN49v0uUiZdK8M-hmRKxw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVLqS0=OXBMPAct9bkNWcRHTEN49v0uUiZdK8M-hmRKxw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14409:EE_
x-ms-office365-filtering-correlation-id: 5a148025-73e2-4b4b-6005-08dd57e2a004
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N01KZGJTaXhNdEFLaGREN2R3SG15MGc1VHdZamx4MTNrVXpiSmZ2bVk5bzBk?=
 =?utf-8?B?Y2VDSjgyWWlrOW55b09OZzhNS3JvekJFMmtTaW9IV25wcTdOZWNWQlBEL0Jr?=
 =?utf-8?B?UTNjNWpicG9vZ2UyWWFHd1N0MXgrMDVzZUw5blVGb0hiYVJabWVpNDEvUUty?=
 =?utf-8?B?OFA5ckJXc0xBaWVuVi94K2NrUE9FM1FvS3VLa2VEdnFGU204ZWZib1FKSnRU?=
 =?utf-8?B?RXhXZlFUTTBuUVdUQkZ1d2R6MGZxaUdPZ21pandUY2YvZk1GQWpTN2l5WDVl?=
 =?utf-8?B?Q0pPYmNVMHhUTTg2Rk9Pd3F0SUdTc24vNzFJQUZmdUNzUW5DUjZVTTFZR3JF?=
 =?utf-8?B?YlJ5bzBNMnUxUTBTekpMTDhQUlpRd0Q5TnhOTzNONDllTVRnUFd4SEdKcXBF?=
 =?utf-8?B?VnlEYTI4Nk9KMjZWS2Nsc21kRGtKK0NqVWlZcDBaU0J6RVRXYmlmaXc1dCt6?=
 =?utf-8?B?Q3JwQTI1RGt1NjZRR1pFbFZGM0tySkEzODhSbjduN1IvekVwamhpb1ZiYjdq?=
 =?utf-8?B?S2pDYUVnSGpUTHdRMDNQWkk4RldqQkhuLzFXRjVrNVJWOVBrYkNsUzVkd3Np?=
 =?utf-8?B?U1pKL0RLMlk0ZHlHOTRZZmxkL1JIZGxVVERoRE9NeVJBRGtZT0t3amxrUW1s?=
 =?utf-8?B?SzdybDFYYmpqTkhsNGVyYXFjak1ZL1gvUGl0WnR5d0hmUXRGQnpkNWVGYTlL?=
 =?utf-8?B?S3dHUE51QXZBeTk4R2l1Z2hGWUFkT3lvTW5PWFRvMXhhKzRxWFNFTmo4R25M?=
 =?utf-8?B?MitGS1RzV1pwelh6dzN0dUo4UGkyTy9tU0pKaHAwT3pBa1FNdnBqNEg0NzFI?=
 =?utf-8?B?bWZJZXhoUFc4Rm82UXF3KzZDUzhBT3duelJHNEJSNUlwbUpMM0huME54aWE4?=
 =?utf-8?B?WUVETDBGVzR0a0NtOFoyS1FUMXlVTmExQWlCTUhxcnljb3FnN2VXRjhLLzFB?=
 =?utf-8?B?T1hsTXdoSWoxOXFRbEM3OXJsU3QxaGhZS1lXa0RYRXAzaGJCMllOb3VUcmpv?=
 =?utf-8?B?QVY1RmJUVmRwZ0IwUGducGV6ckNpYW5GUjRkTE8rRE5zR1NuK3NOMWMzTHJI?=
 =?utf-8?B?R215a3pvTFYyYWEzZm1IYytpaGRTMlJNM0xkejdLdGp0eUdFb0oveFBTYUdI?=
 =?utf-8?B?d0YxZ2VCUmpEdDFCcnI3R3hBUHE1VmhIV1VJUWJQcU44SWJnbVdhOGJvZGJC?=
 =?utf-8?B?RG1icGlkQXRCdnMwcVEybFp5b2k1Q2pPdnJaYkdKM3l5enFKWk1oRUd5K0VC?=
 =?utf-8?B?UnYwY2NHdFNGRzdtc1FBTjgySElDYlYxcnAxNjNJMHJLM2VNR2pjVno2WlpI?=
 =?utf-8?B?OUhCQzBSV0VhcVhmTnE5TGJHbkVXRUVxb0MxL2k1MXJwMkxyVlAyNTZpdFBv?=
 =?utf-8?B?bSs5bHJRditMenVkeDVCeXpqayszTnQwMzNsRGpSeFBSZ1VseDVwdEZrS0Nj?=
 =?utf-8?B?cEdENThmS0lHbTY3YUgvNW9kaE10ejNWOEdlS2M5THd2aUljSk9UY2trY2hB?=
 =?utf-8?B?U2RyN0p5VEp3R09ZYWo5YXFsRWx3bnVqRmlkSTlOa1QxUGcrL2Y3VWUyaHFM?=
 =?utf-8?B?U0JuM2FOcXBCVit3SjkwNk9UV2ZSS3FWVXY3TjJnRVNvUzZLREpKOVBuMElz?=
 =?utf-8?B?MnZLNkxnVVZmT1kvMmdsWm5ZV1VlY25HYW44NnZKODdMQ1JnUmR0THFJaldl?=
 =?utf-8?B?MVRVNDNPL3YxdGRIQXJVS3gzVEFJUXIyRzhla2xlaENEeWd3cy9lczRoRm9B?=
 =?utf-8?B?QVpXMEJ0VlZRNG9tempiSDRBV3J6N1lZNmR4OU0vQUlvMCt3aVZQY2lUM3l2?=
 =?utf-8?B?Q01HSHFnRnRRRlhUcE9kamdIMHJ3UkdwendLUzQ5M2R4cFdQMmkwRGU3R2Jl?=
 =?utf-8?B?Lzl0UHMrdS9BU3pVbEhuTzIyWnZRc2hCOUhVSHNJbVJGOXA0YjMxc3V2SWJj?=
 =?utf-8?Q?64ry2Q17OoP9Jmwbgrzg0GZDBMtxDRwt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ny9UWExKODQ4ZllVT2Z3K0pRY0ZsT1VaV3JyVVA1UEtTTVZ4T0t3eW1ud1hM?=
 =?utf-8?B?SVJLdWxDdmRlQ3pobUxaWUE2dVl2QVNWMnVqek1Ya3V1UTFSQzNleTJzTy84?=
 =?utf-8?B?QmZCdnljNDY0VWhjTDlDWVBYWjUwTVpNN0tNTzFHZVprRGYrMzM0ZzhwdE1N?=
 =?utf-8?B?Wno1QVc3Nm5xUTYrb0xsK05HQlQ3ZnN0WENpL2VMMDdXTCtmcVRRVkJQSlhy?=
 =?utf-8?B?N3pkaEhGVlN1Ull4WHR3YklVVmlFb3VpSlRrdVczWVA0TVE3ZWpoQTNzbzNy?=
 =?utf-8?B?bmlmS2VDYnI3ZW16OStoNnVFUG5GekdjaXpSemNpS1BZdHhHdjhxQW9wVS9G?=
 =?utf-8?B?NDhNRmtCQm5jYnB4eHI0YSsxUnpIU09XSG42amhadCt1QW0yc0pDWGNxZmVU?=
 =?utf-8?B?bHg1c1JnS3BoZVp4Sks5ekI2M0ZoaVBSMU9Wa2N3MHF5NVNjQkhpbWxIUTFD?=
 =?utf-8?B?MHJ1RGU4cHpnSEcvUWowMVhHZVZ1cHlpMTI2d0xGOVVxSTJRbitUallMS1Jl?=
 =?utf-8?B?d2FDUXpjUzVDY0o0UTdLelhtMW4ySXhBWG1ySjUyNXUzT1c0d09IbVZWOXVO?=
 =?utf-8?B?OXFVMThnRWNZK2VGWEw2ZHdaL05Rakp0NUw2RXNzNTBnUFFObmtYRkhyTk5t?=
 =?utf-8?B?b3VPa2QwdCtjTTdXaWtRWnY0Q1BjOGlFd3ZObHcyd2dpY2ZKK1N5MWN3cGI0?=
 =?utf-8?B?K3kyZUcrTkMrakgzQTUwUDhpbzN4QmJQNDdVWmJ5T1lsaUUvMEorZlRWc1Z5?=
 =?utf-8?B?Qy8wTXN1bkVtQm1rRld4eCtuRWdCU241SjRPUjBWcDBPZGRJV1JWMmlwSWxO?=
 =?utf-8?B?RHhBdUVRT0ZmeVBrNDJOWlMzd2U3bXFFWkpHNURkZ3I0NGNucW5RbHZhWFdh?=
 =?utf-8?B?YlJzU21ERUNtbUtuZ1RYc0tHSWVVMWtrQThOUWk4TlN6WHBLUzI0ZGRtVkQv?=
 =?utf-8?B?VEhCb08yYjh1V1BMZVZ5bHBoWUdCSUtmWkR4bkRtWGY1c2wySTNhUWp6K1E3?=
 =?utf-8?B?LzBzbVN1NHFpMGVlMi9neS9lOVduTkx2dm9KdUUyazUrL1JkUkFjYWpiVTJL?=
 =?utf-8?B?eldKV2JlSkYwalZOeDYyMG4wQXRJZE9mWVJZbXVEaDIxdHYwRVhyQjZnbCt6?=
 =?utf-8?B?MS9VK2xBaVpYbzVZOWZmRU1DS3pOenlYL1FoSXFnQTFROGd3dGROMWh5NUQv?=
 =?utf-8?B?UHFFSzM5S1o4N096UWZXV21HSXFrQkM2amNaek5vQVlIZFFSMjh2dFhveGlC?=
 =?utf-8?B?N3Q1UnU0eG5TdTlJbzYvWEQrYjZyS1IwWEJKaWZFUVBkbnpGQUxkandPNHZF?=
 =?utf-8?B?SUtWSEU1N0QxNHhZMXdIamR3Sk1COXIrQXc2NERTNU80M3ZFaHdDamRiTjVW?=
 =?utf-8?B?Q0RnUGJaYVZZSXowQVJmMFdzNmg4ajNKM0JsMUZCZ2dvbHR0MVhYUHlNUkU2?=
 =?utf-8?B?OEZzaGJjQ05vRFAzUnNQWGFDWWU4ak1aWmE3RnB6V3RJTFJ6eEV4dU90N0Nq?=
 =?utf-8?B?c2ZlVWJzKzA4MjZUbXlONktjOWE5N2RsYjNOdUJSRVpaZGtYZ0ZOT2lReHBS?=
 =?utf-8?B?MllRbisxSGQ3VHJEQU1YWkwwWUpXRUZrRGFsMnVrQ1IxTGJJRG5vK29ZQ011?=
 =?utf-8?B?cnpFSHhYV3pPUVQwNXRMbWZoc3p3bnlFSTU0RkFuQzhGbjQrMXA3WTVVd3pU?=
 =?utf-8?B?dW5wTlIzdW5PZTJmN3cxbWg3VGRnOHk3dDJZQjRabkRKMVd2dUU4VG1GcFJh?=
 =?utf-8?B?bVBDZjRwaElNdnJFY3VTR1NjK3l4bTNVWTJ0dW9ZMzZHbVNIZnluQ0RvUTRY?=
 =?utf-8?B?aHVxYnBLZ1VnZkwvZ084bUYvREpLUWJVOWFBSDRRbDQ3ZGVZeE5PY2h0WjJ5?=
 =?utf-8?B?U0FER0RsNEdNMHVETVhVYmRObFZYVW9LYzZFZnFQanZ3cUM2ZXl6Lzl6SmNS?=
 =?utf-8?B?WklKS29ocTdScTg5SUVSaXh5cnJzSllvbkRQNmlLNW5zYzlHdS9kaDJpWDFz?=
 =?utf-8?B?ZjhjYkRvR3pWZ2RlbVFoUy9TYlpLazY3ZUJEeDVYV2JUNmozcExlNVdtekNT?=
 =?utf-8?B?aS9CM2k2Vkt5V0VtSU5rR0xCMlN2a1lYQWlMM2R1N3dXeWo1TFRRZW9KTE5z?=
 =?utf-8?B?eEV4K1F4YkptczZxZitKR3J3enl3SVBxNWI2Z2Z1NGltRFJ2cEg1OUIyODYw?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a148025-73e2-4b4b-6005-08dd57e2a004
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 10:28:21.5199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9C1KWtem7xrChfW0s9S75LXWScVbc+hxet4cLQMV05zz85O6bwTGNObgBNHMcanQYP2ELuB7ACK9wFU5Owdlx0hJYNMtWEQiFIva1tHbetk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14409

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjggRmVicnVhcnkg
MjAyNSAwOTozMg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBncGlvOiBEb2N1bWVudCB0aGUgJ3Zh
bGlkX21hc2snIGJlaW5nIGludGVybmFsDQo+IA0KPiBIaSBMaW51cywNCj4gDQo+IENDIEJpanUN
Cj4gDQo+IE9uIEZyaSwgMjggRmViIDIwMjUgYXQgMDk6MDcsIExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4gT24gV2VkLCBGZWIgMjYsIDIwMjUgYXQg
MTI6NDLigK9QTSBNYXR0aSBWYWl0dGluZW4NCj4gPiA8bWF6emllc2FjY291bnRAZ21haWwuY29t
PiB3cm90ZToNCj4gPiA+IE9uIDI2LzAyLzIwMjUgMTI6MTgsIExpbnVzIFdhbGxlaWogd3JvdGU6
DQo+ID4gPiA+IFRoYXQncyBlYXN5IHRvIGNoZWNrIHdpdGggc29tZSBnaXQgZ3JlcCB2YWxpZF9t
YXNrDQo+ID4gPg0KPiA+ID4gVHJ1ZS4gSSBqdXN0IHRyaWVkLiBJdCBzZWVtcyBtb3N0bHkgT2ss
IGJ1dC4uLg0KPiA+ID4gRm9yIGV4YW1wbGUgdGhlIGRyaXZlcnMvZ3Bpby9ncGlvLXJjYXIuYyB1
c2VzIHRoZSBjb250ZW50cyBvZiB0aGUNCj4gPiA+ICd2YWxpZF9tYXNrJyBpbiBpdCdzIHNldF9t
dWx0aXBsZSBjYWxsYmFjayB0byBkaXNhbGxvdyBzZXR0aW5nIHRoZQ0KPiA+ID4gdmFsdWUgb2Yg
bWFza2VkIEdQSU9zLg0KPiA+ID4NCj4gPiA+IEZvciB1bmVkdWNhdGVkIHBlcnNvbiBsaWtlIG1l
LCBpdCBmZWVscyB0aGlzIGNoZWNrIHNob3VsZCBiZSBkb25lDQo+ID4gPiBhbmQgZW5mb3JjZWQg
YnkgdGhlIGdwaW9saWIgYW5kIG5vdCBsZWZ0IGZvciB1bnRydXN0d29ydGh5IGRyaXZlcg0KPiA+
ID4gd3JpdGVycyBsaWtlIG1lISAoSSBhbSB3b3JraW5nIG9uIEJENzkxMjQgZHJpdmVyIGFuZCBp
dCBkaWRuJ3Qgb2NjdXINCj4gPiA+IHRvIG1lIEkgc2hvdWxkIGNoZWNrIGZvciB0aGUgdmFsaWRf
bWFzayBpbiBkcml2ZXIgOikgSWYgZ3Bpb2xpYiBtYXkNCj4gPiA+IGNhbGwgdGhlIGRyaXZlcidz
IHNldF9tdWx0aXBsZSgpIHdpdGggbWFza2VkIGxpbmVzIC0gdGhlbiB0aGUNCj4gPiA+IGJkNzkx
MjQgZHJpdmVyIGp1c3QgaGFkIG9uZSB1bmtub3duIGJ1ZyBsZXNzIDpyb2xsZXllczopICkNCj4g
Pg0KPiA+IFllYWggdGhhdCBzaG91bGQgYmUgZG9uZSBpbiBncGlvbGliLg0KPiA+DQo+ID4gQW5k
IEkgdGhpbmsgaXQgaXMsIGdwaW9saWIgd2lsbCBub3QgYWxsb3cgeW91IHRvIHJlcXVlc3QgYSBs
aW5lIHRoYXQNCj4gPiBpcyBub3QgdmFsaWQgQUZBSUsuDQo+IA0KPiBDb3JyZWN0LCBzaW5jZSBj
b21taXQgMzc4OWY1YWNiOWJiZTA4OCAoImdwaW9saWI6IEF2b2lkIGNhbGxpbmcNCj4gY2hpcC0+
cmVxdWVzdCgpIGZvciB1bnVzZWQgZ3Bpb3MiKSBieSBCaWp1Lg0KPiANCj4gPiBUaGlzIGNoZWNr
IGluIHJjYXIgaXMganVzdCBvdmVyemVhbG91cyBhbmQgY2FuIHByb2JhYmx5IGJlIHJlbW92ZWQu
DQo+ID4gR2VlcnQgd2hhdCBkbyB5b3Ugc2F5Pw0KPiANCj4gSSBsb29rZWQgYXQgdGhlIGhpc3Rv
cnksIGFuZCB0aGUgcmVsYXRlZCBkaXNjdXNzaW9uLiAgSXQgd2FzIGFjdHVhbGx5IEJpanUgd2hv
IGFkZGVkIHRoZSB2YWxpZF9tYXNrDQo+IGNoZWNrIHRvIGdwaW9fcmNhcl9zZXRfbXVsdGlwbGUo
KSAodHJpZ2dlcmluZyB0aGUgY3JlYXRpb24gb2YgY29tbWl0IDM3ODlmNWFjYjliYmUwODgpLCBh
bmQgSSBqdXN0DQo+IGNvcGllZCB0aGF0IHdoZW4gYWRkaW5nIGdwaW9fcmNhcl9nZXRfbXVsdGlw
bGUoKS4NCj4gSGlzIHYyWzFdIGhhZCBjaGVja3MgaW4gYm90aCB0aGUgLnJlcXVlc3QoKSBhbmQg
LnNldF9tdWx0aXBsZSgpIGNhbGxiYWNrcywgYnV0IGl0J3MgcG9zc2libGUgaGUgYWRkZWQNCj4g
dGhlIGxhdHRlciBmaXJzdCwgYW5kIGRpZG4ndCByZWFsaXplIHRoYXQgYmVjYW1lIHVubmVlZGVk
IGFmdGVyIGFkZGluZyB0aGUgZm9ybWVyLiAgVGhlIGZpbmFsIHZlcnNpb24NCj4gdjNbMl0gcmV0
YWluZWQgb25seSB0aGUgY2hlY2sgaW4gLnNldF9tdWx0aXBsZSgpLCBhcyBieSB0aGF0IHRpbWUg
dGhlIGNvbW1vbiBncGlvZF9yZXF1ZXN0X2NvbW1pdCgpDQo+IGhhZCBnYWluZWQgYSBjaGVjay4N
Cj4gDQo+IFdoaWxlIC5zZXRfbXVsdGlwbGUoKSB0YWtlcyBoYXJkd2FyZSBvZmZzZXRzLCBub3Qg
Z3Bpb19kZXNjIHBvaW50ZXJzLCB0aGVzZSBkbyBvcmlnaW5hdGUgZnJvbSBhbiBhcnJheQ0KPiBv
ZiBncGlvX2Rlc2MgcG9pbnRlcnMsIHNvIGFsbCBvZiB0aGVtIG11c3QgaGF2ZSBiZWVuIHJlcXVl
c3RlZCBwcm9wZXJseS4NCj4gV2UgbmV2ZXIgZXhwb3NlZCBzZXRfbXVsdGlwbGUoKSB3aXRoIHJh
dyBHUElPIG51bWJlcnMgdG8gdXNlcnMsIHJpZ2h0Pw0KPiBTbyBJIGFncmVlIHRoZSBjaGVjayBp
cyBwcm9iYWJseSBub3QgbmVlZGVkLg0KPiANCg0KSSBhZ3JlZSwgd2hlbiB0aGUgY29kZSBpcyBt
YWlubGluZWQgYXQgdGhhdCB0aW1lIHNldF9tdWx0aXBsZSgpIGhhcyBzb21lIGRyYXcgYmFja3Mg
YW5kIGhlbmNlDQp0aGUgY2hlY2sgaXMgYWRkZWQgdG8gdGFrZSBjYXJlIG9mIEdQSU8gaG9sZXMu
DQoNCkNoZWVycywNCkJpanUNCiAgDQo=

