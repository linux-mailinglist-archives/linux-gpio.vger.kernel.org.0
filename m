Return-Path: <linux-gpio+bounces-31482-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAlTKvyXhWmUDwQAu9opvQ
	(envelope-from <linux-gpio+bounces-31482-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 08:27:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B14FAF4F
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 08:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C91A3058090
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 07:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FA930BF75;
	Fri,  6 Feb 2026 07:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="CUx+pqsp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023122.outbound.protection.outlook.com [40.107.44.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9B92EC08C;
	Fri,  6 Feb 2026 07:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770362656; cv=fail; b=MuauZEY7JqsiW0sPz25ritOXDP93yD6j73IqmZm2sSn+4jwErkSNwkKRJnVnV71AHvphYOTtInHBQFk/gyfwr/JPfrg6fbk7swMLazkfw+Zfd3x+BHxfxB+LYjvyvRNNrkwndzLkBfg4NN/9AQ7+aCX1fOPJ9Qhg9nzmyOsz92o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770362656; c=relaxed/simple;
	bh=TdM+y6GZ4PckjXxjEGaCAcatiZYqVkQvgND1ou+om5s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u1zObOxU3G2n+PXE7M5EUO8hmNlYMGHdHN434tSDAUNLoIHUugS20SUpwsvpERWX6szJQ8MMRQJfpPQlhWsFDDxIvKeFXD9MEi0HoxbzQ4NEb6lvST3Dh7JACiT2D8++gIcJQWSCpMWENS3R4hEAwKg8IvzwDKkDQSQjGPZtecE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=CUx+pqsp; arc=fail smtp.client-ip=40.107.44.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ae8fSeHkcRCpWZaMGdCodhNE9ALZiimps26Dd+uCOfuWTtHEf/4mB3jcEFOt97UNh8LuVyaCc/4Lk5Hfut+LxMbYyy3FMtf6xQuypQoqHjULFkd6R8fO5csnl20M6csaZ8nursm1/YmO0VqDKnLEaoFYb5ojIHCTmIGtjxp8eimVkB7jTtut8Ctpx3Rlcs/UpDss/lf/XfAfORaSjqni8ADb39ZHKauWv6Q+1IPvk0qGxx03jfB4Onq2Aau/M6y0VKjjhaPoaC0GbPThmCp4fxdAsiBvlsqdgD1EYl0yhISDyL/qh/iOb7x3RArMquVnzMo/ZlyoD59TvQxKdzyEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdM+y6GZ4PckjXxjEGaCAcatiZYqVkQvgND1ou+om5s=;
 b=bc5QyhyTMAOeAHmnm8PgBeQ1to+RCeWUK0hUqgNkrzdO9OKZxBkmaLZW/uIm8In/bJ5ng6zx/U97Rq22YODlbtynDLsebEU4jcZEQqHwcrCq4zxZBwZWNAWlVDhXJB2yGynY5h8bw533Jh/mIwfHJdku6RgENmGB5wSI9thKCJbSK2xrT2aKR37tJIssV3phT7j1wvHKCQRwV+8IwosVEYrb5FgU92fxVl2Xjo5e4mY9ap1e8HWmguBRFniz+zrWDNblDPDGXzg1z3ctq3Vi5u47GIhqQCUuwAFuBh3F6Ylv3eQAMvnYheSeXubDtkPTWmT8PAN2aAzVqLjBHuGHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdM+y6GZ4PckjXxjEGaCAcatiZYqVkQvgND1ou+om5s=;
 b=CUx+pqspXwjWU4xGYbxRRKBN/3up4DY1XkjkFw8vhupQVKCk6/9zY9c0zA3g4Gj73E/nDq6r/a2JsQgRGkWeITpy6tRSU+Iw7iZz38HCodNb1JeFV0qxgPOCZ1bhkQpzTWq6I5JYkGw02m6EQq5QIxFbDsDAOZE01q9gmBL2ra11qrU/f1EHlIc6mLHmZ65LYBaMugHjuopZy+wRSXdcP5eBHAYTbXxXbENSjq0cio2zvFvkVf5qEnOghY1weZ4Fz0mIzErt/JvRCfpRLmMlOHB6fWSNjzxvF4G8x5XRp7w4BGzxBecKtlswyEBRyEFfWnPrqiVIh4OF7HQEv03Vzg==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by PUZPR06MB5540.apcprd06.prod.outlook.com (2603:1096:301:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 07:24:12 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 07:24:12 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>
CC: Haojian Zhuang <haojian.zhuang@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Linus Walleij <linusw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, BMC-SW
	<BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
Thread-Topic: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility,
 probe robustness, and consistent pinconf offsets
Thread-Index: AQHcjBon++X4WP13bEy2OWyHfoxUrrVwK6aAgAH+4O+AAv2egIAAIat4
Date: Fri, 6 Feb 2026 07:24:12 +0000
Message-ID:
 <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References:
 <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260206042215.GA5376@atomide.com>
In-Reply-To: <20260206042215.GA5376@atomide.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|PUZPR06MB5540:EE_
x-ms-office365-filtering-correlation-id: 9a3e511e-22d8-4825-ee4c-08de6550b9c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?CkEceG0DIiiJ2N6F+949q+D4uflbF5HiUDDPRql1oLRGPnc+xQ2ijuN5?=
 =?Windows-1252?Q?AFX20ojL7wmshAZwMXaiFehvJyqlHPL4RC2x1aziS2oBvP/ZC7NotT7e?=
 =?Windows-1252?Q?ER3zy8ygZOUQDdDJLOcWcPOLwElOrzYsvvrW7no7GmI2H1LMpZr8+Qj4?=
 =?Windows-1252?Q?L0KGQ1nYDMWhGRCn7rjBlICMR5CQI5lze5hE5zyipx+BgcZoYsvHjk+u?=
 =?Windows-1252?Q?BDX9gpBphS9fEqzIn5Nl929xlvcMcVLB74MFXIFhcrWSBVntE9tkO3xK?=
 =?Windows-1252?Q?bC2rsf2AG/8y/82oDDZcRxVD1+lLb2ImOe9SxInGwwM3fIleFFzvrXma?=
 =?Windows-1252?Q?VOvsXOgR9Hsv6JwReAxi+3Tfh4wOyZ6/wG7DdGwaWp19WutCWOGeeENE?=
 =?Windows-1252?Q?DraeDaZDV7vlwmNIX8azTTHzYbwNb9ADh6YGUgXTOEvOP/b6M8qYx2s9?=
 =?Windows-1252?Q?xqYQ5Ax9LSRLlFsyjaAgBzXHl22VzZJTgVeT/VDHTIwe6PaNMJWD2xId?=
 =?Windows-1252?Q?g5aQprOeZ26OTeACYvpX9J/Iwm1Gokid4UkX0K4YQYdwUXlNXNeGkk6T?=
 =?Windows-1252?Q?sanyB75VT/DfjT46iMtcHAz/v3rxdBtLDcV+NqdbNU1oEEbPgYROFCdB?=
 =?Windows-1252?Q?uF3a/oSL3TZXAF82a0is580ZMscce2Jq3c6ODmBaPpu7UEBucjGg7Br/?=
 =?Windows-1252?Q?1CUuZOqoJFRgkSordp7tt7a/ghT8Qnn5PEQmPRmbxP3IjKr5bJeMsje8?=
 =?Windows-1252?Q?EvbvVRwBP9uBsCCAVBosjszgi6bJlaUAXqb4iLhRRzEKynZ78l5dbhGH?=
 =?Windows-1252?Q?iHyrV2d066JSK0/CX63SR4Tr+JAlBmoeb1Yuxe2nt5RfFH8eN9slz9mu?=
 =?Windows-1252?Q?PMeRT6crUB/1ueDAJbd8h0lVoJKyxhsCBtiO8FJx/bwijiXKTnlcAk7W?=
 =?Windows-1252?Q?506kmak+h6EK0/MfQ+iRnfaT0qbGz3YSpa8i2yzbCXeBlTsZUOqeo3pO?=
 =?Windows-1252?Q?4yrs7eQ+r6T2jBNr682/5teQWIQs6QTTxOH8U8CZW3M1Vy4L7eCqRyNs?=
 =?Windows-1252?Q?nks3NC10mbFr1dIvWrDRubwq1zOYqdVbyuoCOe2B2ymj4QCaKDwxZk2l?=
 =?Windows-1252?Q?A08QfjjPcAl+mdI60W6lMvikysXxD1cvg3qIwdqxSh+jNvClxx6lLz4R?=
 =?Windows-1252?Q?psRHDxqyOGeN51AUXI8tXTDi2Cpr92870Qwv6ZqiytYKtr0V1PPtuapu?=
 =?Windows-1252?Q?+J8qa/tw5kgBG3NFoWrscrNu4XM9/vcqpA4ur/lPiNFghaePYEa69ryY?=
 =?Windows-1252?Q?6G7NsaAbnaM2D0f8ztzMwXKuT7LoQ68GuTtFbQ/rikFBP9jGNL/lc/li?=
 =?Windows-1252?Q?eXGpBd4LxCxjHO5+TbwqBzjUJL20bKVJwlO8tz4HKK4b15rRefpvNSIY?=
 =?Windows-1252?Q?+HR4v6EpGDd1kOV/XYBvRGzXPsJARxKvPYlmEsVRiPtSSkYsWXQwNRZV?=
 =?Windows-1252?Q?YQJX0052T75kwrFF5BTRcpxWmUpSyGJT1nKI8Z3DTiac77ZTLgeePDyc?=
 =?Windows-1252?Q?DpBdAq0BhcPnNl2ZCWnXM2zJaCmTQVIJ3eYGZrd51zjeMQOTyHuRFAse?=
 =?Windows-1252?Q?h43SlPYvf3+9Tfm6rzvnwsmQwUKAFtK8cRQPQgUNPL0pmrfeJAbtSLnk?=
 =?Windows-1252?Q?7VZAAmQQ4yIojpFLepNj7selpHYBRbIt8Y9iV4P7fsrTZUM1ltcxJ9yV?=
 =?Windows-1252?Q?TY/6rQSyovQak6B0idE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?8Wp3XBToF5dGPN4skpqa1XKGm1O0AthNE6IXZKlw0SmOTvuemW6XgPb6?=
 =?Windows-1252?Q?2im2LV2T0dy+8uI+/WHZ77U1cUiJnQA+uaVK1Dkqe/2pQJcfPD8cFxWl?=
 =?Windows-1252?Q?MoXrkwX3EX/AiRO+Be+olWDwIoa1lg4mRbyT20Ayf3oqdlm3bvL7aWRe?=
 =?Windows-1252?Q?RFamF1qfCmq3amk2tbXuRZ2YnHNCxIMvSyQkfgVrrXQON+636hC+zAqi?=
 =?Windows-1252?Q?PubgaMbDlvcBDBUTnnx5ky35VclR5WblxUdyCgKPoO4alUpJxVkwee9A?=
 =?Windows-1252?Q?H9ur2139lCmExp027sbaqABPWH9xUGlOkoeMEJANW8vTizXDaJHyMerw?=
 =?Windows-1252?Q?ZGeAqVaGtMBuIR2ZmDVb0AnfrG8npvfQPpiHMSvgEBWfiqmyK2gS0+kT?=
 =?Windows-1252?Q?roXuH2L7cvMzmc3+7ntZx01q3tDPiGoKT5kmPeBiWyCPsQRZbEyN5bvC?=
 =?Windows-1252?Q?5aaYmr7eAV+bUSap2MI/jxMcx0Zarr1sDhKsAp62bLxpGuRENdEHxlsh?=
 =?Windows-1252?Q?4njBoQb99bOuYzV80MJjbAz1J+ihPjgfauq2nyFpzMt1wN/GsA0ert3M?=
 =?Windows-1252?Q?AnOjcWkfgReodbDwn0TyeikZSTgyeprHIbgYWFOtFnKyNhDH9gJb93CH?=
 =?Windows-1252?Q?d/HxRLbLiG4UeclXPrAf6oCAQ5a5gd8ts2ZSJsn5upagU5udhSAJXEbK?=
 =?Windows-1252?Q?ehXu7oGvhqdG0iez/IDaFKu5TyrI32ye/RnXMIaWiDWaBOpURvKRAK3G?=
 =?Windows-1252?Q?fUKIxagyAWZxZB3Lk2tzZWAve3NIiMzd9/UxrqVVTAM3Jn4xdv2SJeYN?=
 =?Windows-1252?Q?LqIuku2JalRfrEw0tX+JPvzpu86okfc79UnCYoodoj3SMCnhbVE2K5Ma?=
 =?Windows-1252?Q?kZjObL5HSIG6WqRZE+HMIBncptlbYVVm6IA2j+CtYanrLf9CVIJzfAGi?=
 =?Windows-1252?Q?ksUJ95TkMMArmtOHghj+4ysVA70wUVY7KClM83ZrD8UXgIuo4ETcLuxU?=
 =?Windows-1252?Q?rDW91yrr7wrE9O1jFwAsXqhsKICHuMOl+NBLeXNYOH4Zn4lAzjDvB/XI?=
 =?Windows-1252?Q?+q9LBSLXHKWFmhiVZyenA+G8+lVh86SNq+KKqxS2Jlzgw6kQKcu4n8KW?=
 =?Windows-1252?Q?edspJMioRimVCOs0NmSPgv4+YVBh/nyqQrbiIBHrqijSX9/PXgfaIcsg?=
 =?Windows-1252?Q?cD3B2UjAdy4cHktBuS3rWQad2kvQJwlOVO63Xe8ukonluJUllrjZM6UD?=
 =?Windows-1252?Q?fOVOPNJvzv/VoTHOsPD3RKpikW7XhwtnKLTzHdBASi5qJSVWWo+zkckN?=
 =?Windows-1252?Q?FTj7M7goCx7vxMysTBBohMJNWGAmlBMgWgRh0Q71owut16DfW2KWtviW?=
 =?Windows-1252?Q?9i0qAADrL4bhoqZtANkZp1vKt6lDtoHWt4F2IiegOgPj76BZ5vhFNQiT?=
 =?Windows-1252?Q?oAH5agbcgVOb65t5T73KdT2rTuAsJpc6RQaACK/EWDZ+5UL1iUa8UXjb?=
 =?Windows-1252?Q?xEvj/7T7huB7kFihEU4f4E6j0frLJqAWpvapMDc0boc+L/GJeAg7BeUR?=
 =?Windows-1252?Q?YrsVcKGNB+PfXIpqKxtZtkF5Z8FHK7TPRw6EDGFBsyEMrDryWpK8xsNR?=
 =?Windows-1252?Q?ZqAT06dc7mhUkzKaNJ79LV4sh7DsjG4Tlnc8nulVSsrEb/H/0hMUiUDs?=
 =?Windows-1252?Q?MicnSgMoQ0Z70wTNEL7chC8HyCmPlUeX0cNOQBiBnBRAH/J8x+vYF4gf?=
 =?Windows-1252?Q?S5lBPooaFhOBh9UK0Q+80gUO6kX2KhI1mBV8I+ZhT8cK+Bu366jezWje?=
 =?Windows-1252?Q?Co8YgEzw6g9Qw+o8jSo57QXRRCpajRwjMbM8V2y6oJ5qMTsyRtppYASX?=
 =?Windows-1252?Q?0pg91svyPvLUlw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3e511e-22d8-4825-ee4c-08de6550b9c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 07:24:12.1074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7t6CJDIs9tlXg8e5r2edu/TVcOIzKkusGT1p89o5VzZmDpWy1aNiBiCC+Y3qxWIjNsiW+V8LzFXmkFGA79EXnE8Fa2pcV0f0b5Hrcbx9NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5540
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31482-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aspeedtech.com:email,aspeedtech.com:dkim,OSQPR06MB7252.apcprd06.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 25B14FAF4F
X-Rspamd-Action: no action

* Billy Tsai <billy_tsai@aspeedtech.com> [260204 06:54]:=0A=
> > Hi Tony,=0A=
> >=0A=
> > This series proposes a set of changes to pinctrl-single motivated by=0A=
> > bit-per-mux SoC designs such as ASPEED AST2700 (per-pin DT encoding,=0A=
> > aligned pinconf offsets, and allowing probe to continue when the MMIO=
=0A=
> > region is already reserved).=0A=
> >=0A=
> > Linus reviewed the series and noted that he would prefer a custom=0A=
> > pinctrl driver using existing helpers and the pinmux =3D <...> DT=0A=
> > property, rather than extending pinctrl-single, and suggested that the=
=0A=
> > pinctrl-single maintainers review the approach before any merge=0A=
> > decision.=0A=
> >=0A=
> > I would appreciate your guidance on whether extending=0A=
> > pinctrl-single in this direction is acceptable, or if the preference is=
=0A=
> > to pursue a dedicated driver instead.=0A=
=0A=
> I agree with what Linus that separate more targeted drivers are better=0A=
> to avoid the drivers getting complex. With the GENERIC_PIN* helpers doing=
=0A=
> targeted drivers should be trivial.=0A=
=0A=
> My preference would be to move the bit-per-mux handling out of the=0A=
> pinctrl-single driver into a separate pinctrl-single-bit type driver.=0A=
> Seems that can still handle the cases where no hardware specific driver=
=0A=
> is needed.=0A=
=0A=
> This would simplify pinctrl-single driver quite a bit, and would make=0A=
> the new driver quite simple too AFAIK.=0A=
=0A=
Hi Tony,=0A=
=0A=
Thanks for the clarification.=0A=
=0A=
I understand the preference is to keep pinctrl-single minimal and move=0A=
the bit-per-mux handling into a separate, more targeted driver built on=0A=
top of the GENERIC_PINMUX/GENERIC_PINCONF helpers, rather than extending=0A=
pinctrl-single itself.=0A=
=0A=
Based on that, I=92ll look into refactoring this into a=0A=
pinctrl-single-bit style driver that covers bit-per-mux / bit-per-pin=0A=
layouts generically (including AST2700), while keeping pinctrl-single=0A=
focused on the simpler register models.=0A=
=0A=
One additional point I=92d like to raise is the handling of pre-reserved=0A=
MMIO regions.=0A=
=0A=
On AST2700 systems, the SCU register range containing the pinctrl=0A=
registers is commonly reserved by a top-level syscon node or by firmware.=
=0A=
In this setup, devm_request_mem_region() can return -EBUSY even though the=
=0A=
registers are valid and intended to be shared, which currently causes the=
=0A=
driver to fail probing and leaves pinmux unconfigured.=0A=
=0A=
When moving to a separate targeted driver, would the preferred approach=0A=
be to treat this condition as a warning and continue probing, or is there=
=0A=
an alternative pattern you=92d recommend for handling shared SCU-style=0A=
register blocks in pinctrl drivers?=0A=
=0A=
Thanks,=0A=
Billy=

