Return-Path: <linux-gpio+bounces-30719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23413D39C78
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 03:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5CF23008FA6
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 02:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0006D24A046;
	Mon, 19 Jan 2026 02:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="MP3wUXkr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="cmxotcqX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023118.outbound.protection.outlook.com [52.101.127.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0F15ADB4;
	Mon, 19 Jan 2026 02:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768790394; cv=fail; b=q/cCD72zLmaBZ1NRr+CaJJFO5hMS0ZEGG5EDDZ1faG9bC/qeIr80pkhOSYJmlMtr5l1tUv8v34Ylnbc5gMFQPXVx2aRgqIJ+MlszmEx0SiquAcjmyy+FExOaMGyakcgCR8v7LwisG8NEp1I1hIpgQD2GmTjH1MUIJOCmRAfce2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768790394; c=relaxed/simple;
	bh=5/jn6nx2N5xGFXlrQxpa9J1QrCjsnvpSsb/9hzGvrrw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XPVR8PepwamZdV9wqDaiGurKQQDkTfeY/qwmUh0F2ZDAOZ0kWdeCTIYTqmY7TbLn6QETr1o6NuEv8i8NDw+hUzRwHiVT2ro+UUXp2lhsqlDxl/szv5FQaedtrE6LHM+dn8wCbW55fLW+YOKXQbpIEKiEp4sM65OvvEnO3ePVJmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=MP3wUXkr; dkim=fail (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=cmxotcqX reason="signature verification failed"; arc=fail smtp.client-ip=52.101.127.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/jn6nx2N5xGFXlrQxpa9J1QrCjsnvpSsb/9hzGvrrw=;
 b=MP3wUXkrVB8CBtmTvk1QS0s3Hqkz32/28xdbT+mlPBM23uqlw/pCLM6Z8ku1DWH14fzhinw+/w+KlwqzcNsZFgwyFGJS0TppDx4SN0Ax9rhqnh9nKuRN/Ryf842Bsxu//D6GaDtLHBY37Bko8og364puSx7gmtHoe0/0qtB9/oFfUNYIzvcdLip+lrMVrpIg4majohuqQMSZyTABxsWQUdDqz4WbEX+sOEv7633WeRC3BjZeB6zXHVJ7GW1AXAJBMU0HIVpq+Lyjar5cDmuJesWKb67lUZYpMYI3Bl7gdO3HUZRVPDZCCEj1uEc7Yz76znrEAUnThJQwe4oRWlc3YA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYZPR06MB6894.apcprd06.prod.outlook.com (2603:1096:405:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 02:39:51 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%3]) with mapi id 15.20.9520.006; Mon, 19 Jan 2026
 02:39:51 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Tony Lindgren
	<tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Linus Walleij
	<linusw@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
Thread-Topic: [PATCH 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
Thread-Index: AQHcczsi6yiHaQFqaEONeIjO2QzRmLVHeJyAgA0e9uk=
Date: Mon, 19 Jan 2026 02:39:51 +0000
Message-ID:
 <3e88618470fa4f2ca15ba868dcecb1d3OSQPR06MB7252F20C7715CD90F0DE282F8B8DA@OSQPR06MB7252.apcprd06.prod.outlook.com>
References:
 <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
 <245bb0d1cfc1dee91baaab7c1fd73bc264586a0d.camel@codeconstruct.com.au>
In-Reply-To:
 <245bb0d1cfc1dee91baaab7c1fd73bc264586a0d.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06124c6b-1110-4721-f10d-08de57040544
x-ms-traffictypediagnostic:
 OSQPR06MB7252:EE_|TY2PPFBE94497F1:EE_|OSQPR06MB7252:EE_|TYZPR06MB6894:EE_
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|14060799003|35042699022|38070700021;
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(14060799003)(35042699022)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: OSQPR06MB7252.apcprd06.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id:
 a8900111-6e32-45e5-24bd-08de54d79097
x-ms-exchange-crosstenant-originalarrivaltime: 16 Jan 2026 08:16:35.3351 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
x-ms-exchange-transport-crosstenantheadersstamped: TY2PPFBE94497F1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
arc-seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bn+Om3HVOMpDF2Pd+cKq7dTinIEinI7utdRMbs7mW4btomvsO/2S2noIYDk6X273qhDRpX8fPdilLrt0SMGbg9BmoAtDXRrolxhpTUpwEv25h+0vjZDaQRxPXGItCOhgazFArNTttTCnWbcwA3eGDstcqvd/Hcp27nF16XDVfigElEHNpFJXqYd+KXJlkxxx4qVmXi05N4I2232zuh7BoV0JD9DgxwQUYhs0d2jTbpFEb/8JZE0I/1oFcMMlMMp6/ab2BHNyh6l/a/n5rskTA/xDMvQIkRZfM+SEzQuwkkcyMcBSDtX1SEf4cglh/Sf3EvHdS/jwULuHJxb0vh5wcQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rIs/J2HnIVUjDv1xR/AJYFpwZVPNKndvNB3G8Vey40=;
 b=MwPxCdHLMlY4IC948FjdAGDgECt4ONK+MDfcV3bcuarCKLjYmXglYv9i1+vsxOIaMKXxo8GOd2m4qw4QkOcYYbUGN3Q/Z3DrYUhc5HT55wrgv/K2J+rVNoAzVV0YlYfmg2J2gBVEQHlB0LmAvmDCgeTRlsxOWk1ZOcCa6ekXYtBN+cNo7folY4G0N3UQE4y51n6EA+09p6kG6WbUNbpO8K/Q/cLSYuYEm5vWtnpUykntf8Eib1+Loo3TUbL4PwhBV/PG46rz2fViQ9DZJUoEHkzRdfNPGmwHt2zqlS2YhjbfC6dZkJTXxO3AD0y8jXRsPj55JbDwCdZsU/vhniKPOQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?6NrQlktZBBWK7u9j89sOjqlMiqTaWvb60aBjvAT5L7mpmPPCdFIoD1Dz?=
 =?Windows-1252?Q?7lLZpFbN8Wd3qZuZi6waCocxprJ4PGkmwj9qdPRLUBBmsu0QusvZIsRi?=
 =?Windows-1252?Q?jC0P71EFum4dC1PcSIlDZ33GWiwU1T69AJVq9ss3hJgX771bPWNdCZNS?=
 =?Windows-1252?Q?Uvu3ZPvwETh6iXr8iBpNZd/XiRy6dKVYz22ldRQZYp3il5j6X0tAaNen?=
 =?Windows-1252?Q?2YMf8L4qcL8VSPuumK5EmrQQp5wpMZR6SXtfp+9VnUyVBX39Rtdopl/F?=
 =?Windows-1252?Q?29ciNT96muYuIhQlQ+O3qTvXurWE3hcz1iuMyKEChUeMq2BjoaI10JdZ?=
 =?Windows-1252?Q?QdvYDfTuB+5tmKbEPcIT/dF78TJHZl4v1liQ2AtaMQ8QqrX5NHlH/lo2?=
 =?Windows-1252?Q?+TBl1gTXqbStTVk+688a49tWBr2Lj0LZ08pLTP/+jpqhb3+BZmyh2qRX?=
 =?Windows-1252?Q?2Op6L1kfRtxUJewUmh/Lidz3zp7LXrzi8slQEqmaOa+eYYTQXgyUjICd?=
 =?Windows-1252?Q?tdwFBoJP4FrvxmVlZQgO/nsuUZyiUOLM6puMc3VrCNLDwwGgCtIoeFB0?=
 =?Windows-1252?Q?yAZsL95Y5+Dls/n6Mj4JGwtrWL4iMVY49xg14Jhae7We2qjOB3oEdads?=
 =?Windows-1252?Q?0wsWvwo3Sqj1cagrvz/DqSfAdH5qLfLJ3qVkEleToGl47TdJCx7K2X3M?=
 =?Windows-1252?Q?KjepvWiJuz9o1DdnwwtD8BSW+ToSkaV//WxB0tZ4Fs/c9CLXE568lLbC?=
 =?Windows-1252?Q?1yC4BWTNqM9BUC1Ic9G6ivBo3wDcM/nZoTpa6lENxvp/pwcjBhQOHLgL?=
 =?Windows-1252?Q?JzwVAWGAabDARWhOn/m8nCxV3LJoriUC6CP5K7QJiWTOoHNE/V+ZQXg/?=
 =?Windows-1252?Q?BEFw/2r9TzgZE9Q8XYZlczygZFCv/b/VNwH5FIJilV91KCQAX3qm3xTE?=
 =?Windows-1252?Q?XrHpI+pa4WofL/k9HwS/UoyUTzNnaVWx3YT73kEmU9TWIKIZuQpLkAIq?=
 =?Windows-1252?Q?ZQ95YtrVqARqZsNkl+KiFyRtM9saeuCsXhNRbqqU8qvgZRriYH0aEqve?=
 =?Windows-1252?Q?Oq19gNZVjkbBVgX5l6cba8qyVecjMLrJPA7TtL4/EpWX9xXrlMeZyMKN?=
 =?Windows-1252?Q?S7UiXuNQHQJhkh1RXHOs25WJJ+qyHADqtL+dtGrj7y6yMcYTD32L24pD?=
 =?Windows-1252?Q?jyFD9YQSaT+oq72OllyRoVMMi4e8gVZpS/C9zCSruci2R0fMgsvi85fl?=
 =?Windows-1252?Q?PqoC2//nxKxwxeUb6gLcOBEzGv1rHUk48S82zJ5DuIdM1/Ml9Zs/1/p1?=
 =?Windows-1252?Q?mCuurUJgo73ZlchnXrj6eVas5ZCmUT85VDBu2OnqWYW6JCXgtS/oSacS?=
 =?Windows-1252?Q?O4F7p4gcExohu2JU0c5fUUjeXHmJ3c1q/DhsXkTcjmnKj1oUUE0FTCTf?=
 =?Windows-1252?Q?xUFg+1xJbd7R46yJZ3EvORgpvmy/Buqh970UOEtxg00LEnAfSr7UWonk?=
 =?Windows-1252?Q?GXPuo6pmt4aI9nrJovdfli0ipPojfxLnT/8BQQiUU9f05hfHyTpo9nRB?=
 =?Windows-1252?Q?rEA2AApO+mQQulCjCQtsWHJEkGFpbQ2sYzMMgSk7vrJQ0oPt8Tz0enSs?=
 =?Windows-1252?Q?kfdHHkM8UjiQtuDlGFcNV/xMV7g52hcwABkTcxDGy5R89uMIOtEF6cKC?=
 =?Windows-1252?Q?CsV0gAC8fBYnXHb4FcrOBqq46BQ2luLXkUTqTjH1q8N1gdYMpIrUqqq3?=
 =?Windows-1252?Q?2dqjjDY2cB/Pu8Q/5gg=3D?=
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname:
 vrH8PwVgN/0c4OQS6uPbiShTw/nZEJX7KHh1edhF4FM2Dt9+bvIHOk69yz7QT5FzSAYgHoV5TJ47gl8FLj91fyCbhAnm2Gpjj6Qsps0kCS4=
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rIs/J2HnIVUjDv1xR/AJYFpwZVPNKndvNB3G8Vey40=;
 b=cmxotcqXfQ4AMKQHFqs+j7ZpNDMsq7LgWKlPaBmSf6IwI12/WnBBdle24rvaGU/t8ph75Ap5ls1JofaVIqhh+tEf725/o2n0269y0ehXjQTd/LPAFM4zoMU5pgk3E8G3qZvHD5UwXx7O6uuBYNUMmOtLvgdHQXhgTPKvScbYLTulZtjxHB/vv3Efmdh0l+1JwlCK9+SfOyvMpuYOI1OEpe+h5IGhlayKhcIh6IyIr9WwCNs6DjT2n+ji8ySQKl9hnosi6llF7aiaBq8gxz1JhIIi8fmztp8xdUhKoxdv5hxTOBUMnIWnVAvvOFdL3wa+WoSvIEiuwWqyKiG4sz08Ow==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?xnbe7mrXhtAadpRulkIkinwPL8r7mZvMS9J0kJTCejDKeJcICxFflwNv?=
 =?Windows-1252?Q?Mm0VTp09hNmFn73MS52ODFDgeAtHmvnrIMOVte9t/adJYPcuS01TDYtY?=
 =?Windows-1252?Q?iRDjbQcA9Z1g2oicJOxXGBP10SgA07gIbm8uIT8JmLl5Qq4oahkh7CSo?=
 =?Windows-1252?Q?9x2GmkNz6k5/jK3cdARKPZtXVSN5d7K/MOoVgITxnfcLgt9n5WelFoAr?=
 =?Windows-1252?Q?PUdqlex/bFcJxxXIeHGoqIUsqph/Opa3mKQu1sVfBOA3yt2RJlKR0RSA?=
 =?Windows-1252?Q?EzXZ7nW+JiM8OK1++FACvw8/pcLdloM2JNYvKl+LVRWcbE5lWGbIIN7x?=
 =?Windows-1252?Q?uDtWiKo5PNoojkabNEbUygJGxhEUEglu2BMtdB9SVDjyfct8h2KudOFJ?=
 =?Windows-1252?Q?WNzaRplvOcDdW5NubL7CgNoDqaMHSIbVauYbj+rNrKIWJ8az6BNklbMk?=
 =?Windows-1252?Q?K1GVGXM1c02rD4/De1P01Ds0la2GMlvK1nOTGxj5Fhh8VPI89s1Gh4wT?=
 =?Windows-1252?Q?sybsY6NZgk8D6Jq3kibzC7XPSrNKf8Rp3qY6R5hJsIYh4H+/j2mSW0uN?=
 =?Windows-1252?Q?nz/mUf4KLaQpeJtG+8HVrWkypu7InbBjMdIypt4OofMmGZFh6Hc4f0jU?=
 =?Windows-1252?Q?PZ+68BgHGuL4VmUvcDyOIzQZr2m8+nvjy3pu2YmyDn/X2Xr+TDktMLRL?=
 =?Windows-1252?Q?yGlGcjUzuRDpb2xdCmDJY1lxCfVx+tO1JCEu5xZuULE0ctdgGLouDD/e?=
 =?Windows-1252?Q?zR5wnFUvvenCFJewiqyA7aTUkVLVWd3/QGusVBDBb4UVhqECMMDoSaAN?=
 =?Windows-1252?Q?7/nh8lWI9uM4I26mXdnCy8D5L4Dqejfq4aHyIqE0/whoOT85vjKqALPv?=
 =?Windows-1252?Q?2dLGsRaIkncq0EEdky6N/SQ2AO5Vp/vekRN5bM8IACyHyQd0b5KOrui/?=
 =?Windows-1252?Q?3VEV3pTc1t5I7W0Dwrf6m8gBhshg2RZwqAM9jdOCcX0pRu8icNoyzYU4?=
 =?Windows-1252?Q?EQGzZJ/OUqTR8uMxwjNzDhfCHTdSeP5d1NUgWE0TBLIUgJihhpT+TFtY?=
 =?Windows-1252?Q?kokl1ba/NhluWv5aVJvPUOdG1oRjVpRZKAAEfx0gx4agBx6mp/LFGZQq?=
 =?Windows-1252?Q?1fJPPNmTzc+BEZbOSn9OWkHwJbl52ILAH7zoIUV/wofyLlnWqOvbImPJ?=
 =?Windows-1252?Q?ZQLKWKCvOt/dN2bSQZIpiHSr2ejx8eXLSEQdPkUxF4jPcgpmgeJ7ygBN?=
 =?Windows-1252?Q?b2R/wpbDGTcs+Pk5pY7kRic0bhSEi7gYwzOshYGfh3Fo/wK6Pbnr7l5x?=
 =?Windows-1252?Q?Klw2jGNgs/FFzJJksGWtcO2FvnqsjHxlMRdoZDroIs8nr22hngIrc888?=
 =?Windows-1252?Q?/ixLBfc9jNlwkwjmevoYv+l+4dgItzc3qFDJoTwU5Knf5o34u9MXJqir?=
 =?Windows-1252?Q?0Tu/P3BpOzWBPyTKgkQ457iCVPbAptBcybmIi9Q6p+zTwkHC2Ogi+lih?=
 =?Windows-1252?Q?AktDKzX7DnO0RnZHHXWmTs5Yg6Wt13vhHRdZkZAPUyPc2eFsm1sCWdf/?=
 =?Windows-1252?Q?fMrhj/agy4wn2SXZsa51r+QRj1s7W2FA6/Zt4s3G/8UUaO0nDiRxUc14?=
 =?Windows-1252?Q?nhEEir5UFs/fs+zwiz+p9mBK640Ek3525EKj38TvgmOsc30Z3obly4Dp?=
 =?Windows-1252?Q?ZQ3DkfGl8HK+IG35NngCUNfxt1VxCt1EI6vAi47ziYHWqH67drc2bz7g?=
 =?Windows-1252?Q?mhnkL1NdSyijK+xy4mzhvqFRAbmwzpfTh45E4HFI3kAoMsvSO5vJuJyG?=
 =?Windows-1252?Q?2+brM/Av/mI5kbfdpxiwKXjJfiQvwf2R5pVP6LaaTvVXPa+D3Y3+aMc3?=
 =?Windows-1252?Q?q+nInc8miFN26w=3D=3D?=
x-ms-exchange-antispam-relay: 0
x-ms-office365-filtering-correlation-id-prvs:
 a8900111-6e32-45e5-24bd-08de54d79097
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <DF06DF1D2E71A942A182532DA7B05080@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06124c6b-1110-4721-f10d-08de57040544
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 02:39:51.2654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6iFyTq1sjgZdE1Pg4ZczbCE1zc2sFzqpRQl4CsbHTeD27b/O3Obj1C4OfS1Yj15o6C5gIch6mFU2KV6gGmB3Ys7MBTS3ufteSEUD66t54wI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6894

> > This series updates pinctrl-single to behave more predictably on=0A=
> > bit-per-mux platforms by making its DT interface more flexible, its pro=
be=0A=
> > path more tolerant of pre-reserved resources, and its pin configuration=
=0A=
> > register addressing consistent with pinmux.=0A=
=A0=0A=
> Can you provide some more context here? For instance, this is motivated=
=0A=
> by the AST2700 - can you talk a bit more about why its design needs=0A=
> these changes?=0A=
=A0=0A=
> > It extends the driver to accept a per-pin <pin_index func_sel> style=0A=
> > description for bit-per-mux users while keeping the existing=0A=
> > pinctrl-single,bits binding as the preferred input when available. It a=
lso=0A=
> > relaxes probe failure when the I/O memory region cannot be reserved=0A=
> > exclusively, allowing initialization to proceed with a warning on syste=
ms=0A=
> > where that region is already reserved.=0A=
> >=0A=
=A0=0A=
> Can you unpack what's going on here in the context of the target soc?=0A=
=A0=0A=
Hi Andrew,=0A=
=A0=0A=
This series is mainly extending pinctrl-single to match how AST2700 uses th=
e=0A=
pinmux and pinconf registers. There are three parts:=0A=
=A0=0A=
1. Per-pin DT binding for bit-per-mux=0A=
In the current driver, bit-per-mux users can only describe pinmux via=0A=
pinctrl-single,bits (<offset, value, mask>). On AST2700 the pinmux register=
=0A=
layout is contiguous per pin:=0A=
pin 0 maps to 0x400[3:0], pin 1 maps to 0x400[7:4], pin 2 maps to 0x400[11:=
8], and so on.=0A=
For that layout, describing each pin by <pin_index func_sel> is more direct=
 and readable=0A=
than crafting offset/mask/value tuples.=0A=
Example:=0A=
=A0=0A=
pinctrl-single,pins =3D <=0A=
=A0=A0=A0 0 2=A0=A0 // pin 0 to function 2=0A=
=A0=A0=A0 1 3=A0=A0 // pin 1 to function 3=0A=
=A0=A0=A0 2 0=A0=A0 // pin 2 to function 0=0A=
>;=0A=
This change lets the driver accept that per-pin encoding while still=0A=
preferring the existing pinctrl-single,bits binding for compatibility.=0A=
=A0=0A=
2. Unify pinconf offset mapping with pinmux=0A=
Today pinconf offset calculation assumes a linear per-register width even i=
f=0A=
bit-per-mux/function-mask is in use. On AST2700, pinconf follows the same=
=0A=
bit-per-pin layout as pinmux. For example,=0A=
drive strength: pin 0 at 0x4c0[1:0], pin 1 at 0x4c0[3:2], etc.=0A=
Pulldown: pin 0 at 0x480[0], pin 1 at 0x480[1], etc.=0A=
Unifying pinconf offset mapping with the pinmux logic makes the behavior co=
rrect=0A=
and easier to understand.=0A=
=A0=0A=
3. Probe with busy memory region=0A=
On AST2700 boards the SCU/pinctrl registers are often reserved in the DT by=
=0A=
a top-level =93syscon=94 node or by firmware. devm_request_mem_region() ret=
urns=0A=
-EBUSY even though the region is valid and should be shared. Without this=
=0A=
change, pinctrl-single fails to probe and all pinmux setup is lost. The pat=
ch=0A=
just downgrades that case to a warning and continues.=0A=
=A0=0A=
Thanks=0A=
Best regards,=0A=
Billy Tsai=

