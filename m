Return-Path: <linux-gpio+bounces-9339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D8963C21
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 08:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 095391C23E86
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 06:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F3016B754;
	Thu, 29 Aug 2024 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CbJYpCa6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A243A17740;
	Thu, 29 Aug 2024 06:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724914720; cv=fail; b=rXWXGePGatbNii62bfyg5HF9id0Z3Bjr3zsk+8rUbQ744yQBTrgEieMv2kwlMNNQfkhHwZmXLwklQBEXplC9NHwfrmEFFRwkK3bm/xqnzwYBQ/CPUW0wb6TEufQlocfQl0tEGkBsmpksAYEGbxFtoIQP8J9Ri2APmWB1XbFtlBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724914720; c=relaxed/simple;
	bh=PIo8jawdLjpR3EubrIWCM2BZbcbpDr0YUBJ0vvNkgqQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jxs2BE05nACum7s1mTOsV0YJoHsFZdEjj9kSHthX+whtV2EXvDDqtCv1k5wPClfcGYAnmXaYE/+pjFKjaii2E17o6sNX1AYZbtXHoNEl0Azb7neoOvf89ADO8PuC3GZnLCiJUHc3Sygenfvg9VuRcZpJBY1rFrXgBZ0u0QkaLN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CbJYpCa6; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgY9kcjlUrTKZgTczaRkYZ+F0r9DpYgdj2ByWeLEDOKC6SfLSXp7/9FE08KaiQXj122rYsH9NTOvbN3g0lB/1Pw2X5GYo+r8FAvHySi3Ju2GzEyU+hYAi9At8rUqY68kdkJtCnyDNfrM2QPgl7amfi+VZLZSWPyffHrDaLZduD9Af0AbxIy/8ObBybkIEJxFVXkPl/5aLzawjvnPLivlSp/D8ERxd+hK1dep5gywdDKaPR7HhtjJqWfg031/RNSU1lbawQe40qGwPoDVPP9XESV2KvlryLluq2aDlpwZ3m4o5l8dMINbgt7xRirHbmGNheitWGMCQkYPnCBB5Hg/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVZR16mASjFYBmUQR7gJS7/8y1FsREGstxTbpoai2u0=;
 b=Ggty6jvIhk+DBohw+CmRgmD9/f0boOkyQWULF+YutBKTc51WZFAyCWYDwenQL9zUKYQ3tgfUsuiOTvgyVaVsycMOZYabr0CC2zSQJS9bSleq0UPUeNc/J/238nElx+98SG/zJ/BHfv0SR2tafwDXjXHceI/vHPlZLH5oFbmBMD84wSCl10J3H3dPbKSE6+CuQZY7r3oZvaS2OtHqTAMKTbir8SmuZCq7T8i3Z24uERN4Sa0PYNCYL4cmFMQQcmqHbaIwznt+0IAffkRrp87rEM2DF46bxxELiG7/USGG+oGzi/tK30C1xKIG5ZGhgr4u5bqUOF7YQa6EWVmQzI02sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVZR16mASjFYBmUQR7gJS7/8y1FsREGstxTbpoai2u0=;
 b=CbJYpCa62RDQGgu3lcWpBcXA3nA3hp63i3BmNCfNKVClGMraznstNr/x+VqVhEq15/DKPS4ZIQU8q7btLp/rGkd41JwDHDQo/njxyUpKVTcupWJ9JTtUWwL9xrO3EkGiJM8A3P1TEQlob7/lpEGvDlkdm64ct1GV0ngxkYaYdFQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6005.jpnprd01.prod.outlook.com (2603:1096:604:d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 06:58:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 06:58:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wang Jianzheng <wangjianzheng@vivo.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, "open
 list:PIN CONTROLLER - RENESAS" <linux-renesas-soc@vger.kernel.org>, "open
 list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH 5/5] pinctrl: renesas: Use devm_clk_get_enabled() helpers
Thread-Topic: [PATCH 5/5] pinctrl: renesas: Use devm_clk_get_enabled() helpers
Thread-Index: AQHa+d/YnlzWQQZNrEG/k6dIbnJRf7I9zNew
Date: Thu, 29 Aug 2024 06:58:32 +0000
Message-ID:
 <TY3PR01MB113468218C44791CAD67E7D9C86962@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240829065018.36863-1-wangjianzheng@vivo.com>
In-Reply-To: <20240829065018.36863-1-wangjianzheng@vivo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6005:EE_
x-ms-office365-filtering-correlation-id: 6c9c224d-3ebe-4421-1876-08dcc7f7fecd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?f/j5oo+3ed8zGfVkIDdpeNlwWO6AV6QkewoqfXzWwCmZREaZJcuN44PGiZDz?=
 =?us-ascii?Q?sMyPorJSA2qzKIZ++6FjJowo8j+BVpvflVPNTVqyChOtd4lP1g1UsIA4H2nU?=
 =?us-ascii?Q?3L7r4dNspQ3iVBOUyjlgTQOvbCEtJjhS0SyXx82LuJQ5IZ2pscSudsL9h9pw?=
 =?us-ascii?Q?DVwVCHBVRdklOBqhYryon8SI5CznjYqCjFUj15Uwh1lEYvihDRSH5zEyIkX6?=
 =?us-ascii?Q?3fzYZjxCkJpZb+c3lw9nakxbUzxgyCQ2mkFGYdk7FZAHHy4lEho9J7Uf+R/G?=
 =?us-ascii?Q?ntSOjkAhGShjj5fQVb3bjd0AhaztcFvb+Sv7mup66Vv/AiLPrTJ12touJQWq?=
 =?us-ascii?Q?onvyixrzRwA4JV3QrLHn1v4t9z2CisDxx0ptw0EUv6zzhQExVX3ybIljGeb7?=
 =?us-ascii?Q?mrTEAMR0Rtpt9chTakcDbgH2OTsK5OEB4FnQTbuPag6ats+qeBg32StAPnCO?=
 =?us-ascii?Q?HeWvud/Pzs49os5yBFGEb36s+Bm5nLCM3b+mwUCxsws4D52vwWr0KLt2WfZa?=
 =?us-ascii?Q?53PDxer5ehOWCcJK5jrYvIvzwrrHk4sWFfCLutuklC+FEaKv8T8XUPwUwLuz?=
 =?us-ascii?Q?Zp2N0Fn8hj/W2J5ima/uGIqwh8jZ5iBwRzKYr70ADMLnZgEyKf+9ikVOPcOs?=
 =?us-ascii?Q?DddgWFUZvSznR3riSH5VLO53uCxhlWr9d4QdRb6JV3XruseYNIRmaefde1vJ?=
 =?us-ascii?Q?y2zjOeQCHwMVNSWiXHW3ybZswCDlrWIhFt7XC1eXTFN+XtIRhZQMgjYvyPmE?=
 =?us-ascii?Q?GhtYRTt21eh3JslIQZ1NqqeF2/17UWRSn1boHKNZ/6L6k5nqX1G+fWzb8r5r?=
 =?us-ascii?Q?DIN594qqDFWUwWcCC3rQ2Hji2UBTxTs4AwdhTwNZYD+msPLJUuOfH4xWtCBR?=
 =?us-ascii?Q?iXvd3+T3ZlhqQftnj7T0K/kurQBwohObtCmKFCuRFqHv812zb94pawjdgQmY?=
 =?us-ascii?Q?PqyWgGenXrJ7J53GU7n+WqA0W7UDDha1aRs29Qt+F/mrBtnFppNxs0SL76G5?=
 =?us-ascii?Q?5aCeZol+p0zFqHEU/z2vqpEo/HknOriTTrfD9JWjctEHWpaxPDt0EjztFON/?=
 =?us-ascii?Q?RWAw0a8CW9T5c9eNcwmZ/GmtHnzmqR0mD+WMbh0c4KdqvBU7WhQH25yA3BAG?=
 =?us-ascii?Q?cW7pLgQ7YwAQy78/KYtdR/Typ2YS5TWqwSskv7E4K8RiLXYUtoow9GwV/xOl?=
 =?us-ascii?Q?/+lLsTpynvIFzIwB1/VK+uS8xqsgdf/9HuTr90l0M4YHNg3EMLpCty7ooXBy?=
 =?us-ascii?Q?LYJXO4wzp9ueIzEIx/8H+lC6vBxOit9080qxqn9uQXGYJ42l3zgjyDjupQTV?=
 =?us-ascii?Q?8zMy2tsbAulmXLhRY0X2G+mFq536RYRtcx3w1X+XPntjJQ3WxY2wkHI/HOqO?=
 =?us-ascii?Q?omugQnKkgRl9qrqBD7gcz/MucmcWK5Ks8/cXPqmnA9YZaI2Uwg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7j0MzeWjCRbLgowW5BufNzFnVq4cj1qZFyyHiK6F/KLjfFGlvc0ywp3OJgfD?=
 =?us-ascii?Q?vY59YbMJ5WQ4+H3eJoBOpVw/pSvDkMwjhXNXBuKVT5rMNBhxnEfOkrs0tmdC?=
 =?us-ascii?Q?Ctkg7hLodTTITtRLWeRhFTQb/3PrcoBWG7cAQ1g55nVaRIOJ2NDShm23D257?=
 =?us-ascii?Q?72fL1KEggz2s+urxHQyVZ1m9+yxI0VSMXIRqTDrlOKH4N1h3TLJTckX7ISwu?=
 =?us-ascii?Q?0vPO2hmJijviJc96AndZOeWcx7ZgBuiXYPHrGY4wFVkAnAffJBvTp14Jgy6D?=
 =?us-ascii?Q?iqvm0B8zETBFXMg00tUnk1zQaS2+2L/BPSLxmT/MFIN07U8SfibwJfjQkXNB?=
 =?us-ascii?Q?lbtY3zrDGou8CkopkM2YxLOSCB8Fo4rk/WAyOdGpOoZYhANE82l9w2NHXDsd?=
 =?us-ascii?Q?hO6gtLf+90ylORjOHO5Q5jag+dkxubU7bh0k94yoBfw2J//CC8CAb09zUOoC?=
 =?us-ascii?Q?Rgji0uYtYJQfERdgaFMchkDbWhFOqSZkN7P9GjoIG4ZZOoME+tU5CHRkSxMl?=
 =?us-ascii?Q?ZG5revaRUCtezrcs5h2CK+zwZms7egAjtWgCTtrJS79qaSOU7FC73viqLzHF?=
 =?us-ascii?Q?4bCGQqbIxt3X+lQjfSJeOOj1phc8PAKrb9/sUxJ2+pzg9n6XOaxotEsiP6Rs?=
 =?us-ascii?Q?Qx5GJJzhF84YfbqzGWYGBjaS8SekTkrEAYlS1Uiu3L9SI7J6CP9PpgmwbLzR?=
 =?us-ascii?Q?cGvXIXpQSQu1dNVP/FuLQVZOvflLbL+EeF+1FILqKEcXy4led0dQqZM3yTGK?=
 =?us-ascii?Q?XHVy67ufCAKGLtELYfmaILYk6+gUJ02cERAI+HB+iBQIw9zw39WcFWGUD076?=
 =?us-ascii?Q?qFFH28YwdS2rSO4FRymID7eeY+iboM6UBwmthTv+qY6bIkeDf3+9BVe3n5Pw?=
 =?us-ascii?Q?BC0Axdx0/D0vZpZNg6roZcN8Gpj+a6Iiu87sro+NFT0HuYx1Z9yfqbGQPf30?=
 =?us-ascii?Q?h/R3E2bD9VUACZETbY7suDg6oaW95B5bsstV4E56Y6x5cJwNVguh5K39rhIJ?=
 =?us-ascii?Q?CUp+zmFqTkWVdFHOll8GnYounO9TzctiCUmG5NbaZ/uU/1NmlFHQpVkYrXgf?=
 =?us-ascii?Q?Cul7zz0cdCXTOlS8P4RoKS0cqQsxE8brAJjz0CSfW3IhEfVSP256qMWYbLB+?=
 =?us-ascii?Q?gpNbI1PSByX0r6e5txyxSvYJ8v436bpZwAUxTXbMYS9QZeKC5mKWYW+kjYcn?=
 =?us-ascii?Q?LCfwPgnYpaods3grLUabZ45gZKrbOL3tlaJJ9VWYuZzYJ8MqKaBtLy6eivre?=
 =?us-ascii?Q?k4QzVLX1c5YXCtbGzrZ55Q6SgpghJDGWECPyRsbGeFyrgHQ+RVl6cVP9lCnY?=
 =?us-ascii?Q?t7+4wxdgDfWcj6YBK1QgpmekBYkrRW+b5p0zE5N7Ny9vUjc7JDbAuVcaaJ5f?=
 =?us-ascii?Q?wZODLQPh02m6s1pjcjA3dgRZuLx6PE+/3QpUuTbOrmHIXRI4b5IfvO3nkIY6?=
 =?us-ascii?Q?i4jpzMM3yOPAr5/zk1IvOf5G7GSkAUfBLebx1+3H3HNflUhMciW1HJhsu/Zs?=
 =?us-ascii?Q?zgGABeLN6fsECw5/y8++RhBiHiQqFqOfx+q/ra69XtkjzMffzHAkG15BpCcP?=
 =?us-ascii?Q?q9kfe+xfW0ZgnuqaDmd+hKZ51gl8yNkFglJw99nDwHURPzwfBqZt2y2CMrpx?=
 =?us-ascii?Q?ig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9c224d-3ebe-4421-1876-08dcc7f7fecd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 06:58:32.4922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FY4BZDyGkTqmG1tr0ZqfBVei4vqa7bgXXMY7/1sioXZGTn0eku1MkKhDBjWze3HUwVesrsvDc6zxqrxjkPzi3JDgWi88tU69immu1P+RTjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6005

Hi Wang,

Thanks for the patch.

> -----Original Message-----
> From: Wang Jianzheng <wangjianzheng@vivo.com>
> Sent: Thursday, August 29, 2024 7:50 AM
> Subject: [PATCH 5/5] pinctrl: renesas: Use devm_clk_get_enabled() helpers
>=20
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>=20
> This simplifies the code and avoids the calls to clk_disable_unprepare().
>=20
> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzn1.c | 24 ++++--------------------
>  1 file changed, 4 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/ren=
esas/pinctrl-rzn1.c
> index 39af1fe79c84..6a3616944b37 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> @@ -869,12 +869,9 @@ static int rzn1_pinctrl_probe(struct platform_device=
 *pdev)
>  		return PTR_ERR(ipctl->lev2);
>  	ipctl->lev2_protect_phys =3D (u32)res->start + 0x400;
>=20
> -	ipctl->clk =3D devm_clk_get(&pdev->dev, NULL);

> +	ipctl->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);

Now the clk can be local. Please drop clk from struct rzn1_pinctrl.

>  	if (IS_ERR(ipctl->clk))
>  		return PTR_ERR(ipctl->clk);
> -	ret =3D clk_prepare_enable(ipctl->clk);
> -	if (ret)
> -		return ret;
>=20
>  	ipctl->dev =3D &pdev->dev;
>  	rzn1_pinctrl_desc.name =3D dev_name(&pdev->dev); @@ -884,7 +881,7 @@ st=
atic int
> rzn1_pinctrl_probe(struct platform_device *pdev)
>  	ret =3D rzn1_pinctrl_probe_dt(pdev, ipctl);
>  	if (ret) {
>  		dev_err(&pdev->dev, "fail to probe dt properties\n");

		Replace dev_err-->dev_err_probe.

		use struct device *dev =3D &pdev->dev and=20
		replace all occurrences of &pdev->dev->dev as separate patch.

Cheers,
Biju

> -		goto err_clk;
> +		return ret;
>  	}
>=20
>  	platform_set_drvdata(pdev, ipctl);
> @@ -893,28 +890,16 @@ static int rzn1_pinctrl_probe(struct platform_devic=
e *pdev)
>  					     ipctl, &ipctl->pctl);
>  	if (ret) {
>  		dev_err(&pdev->dev, "could not register rzn1 pinctrl driver\n");
> -		goto err_clk;
> +		return ret;
>  	}
>=20
>  	ret =3D pinctrl_enable(ipctl->pctl);
>  	if (ret)
> -		goto err_clk;
> +		return ret;
>=20
>  	dev_info(&pdev->dev, "probed\n");
>=20
>  	return 0;
> -
> -err_clk:
> -	clk_disable_unprepare(ipctl->clk);
> -
> -	return ret;
> -}
> -
> -static void rzn1_pinctrl_remove(struct platform_device *pdev) -{
> -	struct rzn1_pinctrl *ipctl =3D platform_get_drvdata(pdev);
> -
> -	clk_disable_unprepare(ipctl->clk);
>  }
>=20
>  static const struct of_device_id rzn1_pinctrl_match[] =3D { @@ -925,7 +9=
10,6 @@ MODULE_DEVICE_TABLE(of,
> rzn1_pinctrl_match);
>=20
>  static struct platform_driver rzn1_pinctrl_driver =3D {
>  	.probe	=3D rzn1_pinctrl_probe,
> -	.remove_new =3D rzn1_pinctrl_remove,
>  	.driver	=3D {
>  		.name		=3D "rzn1-pinctrl",
>  		.of_match_table	=3D rzn1_pinctrl_match,
> --
> 2.34.1
>=20


