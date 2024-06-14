Return-Path: <linux-gpio+bounces-7456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F320A908CFB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 16:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E24021C21826
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 14:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D668E19D8BE;
	Fri, 14 Jun 2024 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b="RQR+uPPD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BD719D88F;
	Fri, 14 Jun 2024 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718373962; cv=none; b=MHJlQQchzTOIbeHmaqLXUuRLGLnCxfyVnPPM0DtmT2vV1o2dOZSAMr8o1cAhHGN2uHfpk9oYfWpnitKviW2e5FgMNtbeYyCN7Bg6c0R4f8UHgFhtHRHYTv2RVCcNTQ8jODjK6GHu+YYXnoiz8VN1pf1t1wIrvu/Mdj9NtnK4t1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718373962; c=relaxed/simple;
	bh=TKHF47sXnLG72YWH8FC/814ZuqkNPRiQnlqAPPi1EdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/oljp8TYYPgdWPK/H/0lKKTOypuMaZQn6kaRoO2fPyaaUpab0RrJLFJLY8x7pf6LRK6Skjeltxfmm7pDZ9xyB+K4UzX0bj9w5os6TQbhpaFX6BwU77Tj4NLMoCtKL5PMerb6RFAFMdSACFlwnyThBb7Dob5apdOoSq++qW17l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b=RQR+uPPD; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718373937; x=1718978737; i=j.neuschaefer@gmx.net;
	bh=aPL/fRcAWifCtBqWYTXUxPusiEBvwiSQUuAYnUUTckw=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RQR+uPPDPPGbsr7M46TkyAbL/0Vx1NQnu0/zPA152mvzIauXps3qh9do/oPTCufq
	 FqKFPGjEpNRnXZtmLuFRAuXDF+i6VisDg/Hlk506jHbuow62/JeSHS4ZHakai5ZU4
	 oDaT1SqXaCnu5CYD1mY4Cj2A1FGKv639aEzsCedeCEUQImrL5G9oV0lekT+lyZIg6
	 7RUbvPHP49fAti1HwX9abTpUSjOQrrAhxUMYA/8Ha5drup05P9ErMTF1ZCnji0vGy
	 O0Y3+4BkXSsB1PXTymVJzWChBplF/fvFK6qYu6vqiU5oB+i6YN1y8vouOX1NH/kUu
	 26zo8+ete7cgPW5+IA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.59.135]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bfw-1sSfz52exa-016EqB; Fri, 14
 Jun 2024 16:05:37 +0200
Date: Fri, 14 Jun 2024 16:05:34 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	Shan-Chun Hung <schung@nuvoton.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/4] pinctrl: nuvoton: Make use of struct pinfunction
 and PINCTRL_PINFUNCTION()
Message-ID: <ZmxOLrrZ_ExpoE-Z@probook>
References: <20240611093127.90210-1-andy.shevchenko@gmail.com>
 <20240611093127.90210-3-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240611093127.90210-3-andy.shevchenko@gmail.com>
X-Provags-ID: V03:K1:S+HB3W8uX/0zqI5vXfrLmsRjMOTfGY0EljrATJB3J+9k2C7F01X
 GehLgo98RlIS8TuMJfVZKdZMcKx7HZvVYSJnlkrrgJPMSvJqW8jnbA7USNDWtx+BWMSAVwF
 AR7M7CmRTgpKgvdmKY3FLS1OTamlFaDsPrrvZC/h2Puy0a6bgdcPuyKI/UaJmctwCHy8CQ4
 QZiv2arQx4oKKLTpkCqFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8lYG63WaI7Q=;1kjoaL/xNDjNXsUlTmt7vZs0GZd
 7wr5agsPfClkTigK2jLAD+Y3GDFoiAfPRqyKVwWSqN9HWi+GbRYkLdLdTviTD1rTMiihHUh3z
 +RKjA6GV/uQnBkOUOKEgR3odo5siUDWnLFoWCOv3E5tfgXRiPA3plNffC6CmrqeCUbtmiZmL3
 H2ksR7uWVvmOn3diQ6fc+W7L+ajPBtVyicAdu7PZg1FEEKYqV+hV1RVQjKgzEQ4iJmBayoGmh
 TGioqjDIkGjz5EoesQHDbBhU90yKNH0JUeuuCQOEzbl/ogNCKFZD9bpg5Rh2oQWon0wv5HbdG
 cV2t9IIWgJAW+/Q9nX+Ttu+3z1MTLG+teW5vlnCfVi4eglA2h/9OXgnMnwxvl4HPKwbYD4xvG
 IMXG4nNDVTB7R81GkyFxxQmUZkUIWu2upuajTwtS01Qwfxv2Gh9C9D+1sqDKiu03jy2diS/nJ
 9iiSO77vs4MPwSh1xsKyCweguz3flInMkAdTCa0tKf65TEtg1LZM/zaOu2JJxT+wlSqqM+ogf
 CkQO3s/ZfZCWdjx/RymhE/NtC5c71pxQZ/Pr/GojgRRfR2Vcmjd58L5No5rPPbJqn2DThb1IJ
 WnVEq26qp3ufL9lw9AEMKhe7Ul/JEWviw+V9lzuGhBCRutjwIPbunYBpuWoonqGuHujfFLxhZ
 ODN/47bp/NiSqeFYueHd/56MPx0ijTpfaP6HxCSNnPAYDoIC1aCBiZ4kSdarHcapALHaMQHAn
 pIfSabSwnLZFzLfaXhy9OXLYm8vcKcWe2CNMyg9fp9YXk5/FzQeEIY3J6ccqpTc4qijuMWNQ3
 50Zywf4GZwn60g0DnWBN+qrApZ+5lJ43Xi6tL+ULYaT4o=

Hi,

On Tue, Jun 11, 2024 at 12:30:23PM +0300, Andy Shevchenko wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Since pin control provides a generic data type and a macro for
> the pin function definition, use them in the driver.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---

Thanks for your patch, it's always good to see code simplifications like t=
his!

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

>  drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 19 ++++++++-----------
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 11 +++--------
>  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 11 +++--------
>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 11 +++--------
>  4 files changed, 17 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nu=
voton/pinctrl-ma35.c
> index fb933cddde91..62e877b76a25 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> @@ -98,12 +98,6 @@ static const u32 ds_3300mv_tbl[] =3D {
>  	17100, 25600, 34100, 42800, 48000, 56000, 77000, 82000,
>  };
>
> -struct ma35_pin_func {
> -	const char		*name;
> -	const char		**groups;
> -	u32			ngroups;
> -};
> -
>  struct ma35_pin_setting {
>  	u32			offset;
>  	u32			shift;
> @@ -149,7 +143,7 @@ struct ma35_pinctrl {
>  	struct regmap		*regmap;
>  	struct ma35_pin_group	*groups;
>  	unsigned int		ngroups;
> -	struct ma35_pin_func	*functions;
> +	struct pinfunction	*functions;
>  	unsigned int		nfunctions;
>  };
>
> @@ -1041,9 +1035,10 @@ static int ma35_pinctrl_parse_functions(struct de=
vice_node *np, struct ma35_pinc
>  					u32 index)
>  {
>  	struct device_node *child;
> -	struct ma35_pin_func *func;
> +	struct pinfunction *func;
>  	struct ma35_pin_group *grp;
>  	static u32 grp_index;
> +	const char **groups;
>  	u32 ret, i =3D 0;
>
>  	dev_dbg(npctl->dev, "parse function(%d): %s\n", index, np->name);
> @@ -1055,12 +1050,12 @@ static int ma35_pinctrl_parse_functions(struct d=
evice_node *np, struct ma35_pinc
>  	if (func->ngroups <=3D 0)
>  		return 0;
>
> -	func->groups =3D devm_kcalloc(npctl->dev, func->ngroups, sizeof(char *=
), GFP_KERNEL);
> -	if (!func->groups)
> +	groups =3D devm_kcalloc(npctl->dev, func->ngroups, sizeof(*groups), GF=
P_KERNEL);
> +	if (!groups)
>  		return -ENOMEM;
>
>  	for_each_child_of_node(np, child) {
> -		func->groups[i] =3D child->name;
> +		groups[i] =3D child->name;
>  		grp =3D &npctl->groups[grp_index++];
>  		ret =3D ma35_pinctrl_parse_groups(child, grp, npctl, i++);
>  		if (ret) {
> @@ -1068,6 +1063,8 @@ static int ma35_pinctrl_parse_functions(struct dev=
ice_node *np, struct ma35_pinc
>  			return ret;
>  		}
>  	}
> +
> +	func->groups =3D groups;
>  	return 0;
>  }
>
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl=
/nuvoton/pinctrl-npcm7xx.c
> index 2601aacfb976..c6b11a198c76 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> @@ -639,13 +639,6 @@ static struct pingroup npcm7xx_groups[] =3D {
>
>  #define NPCM7XX_SFUNC(a) NPCM7XX_FUNC(a, #a)
>  #define NPCM7XX_FUNC(a, b...) static const char *a ## _grp[] =3D { b }
> -#define NPCM7XX_MKFUNC(nm) { .name =3D #nm, .ngroups =3D ARRAY_SIZE(nm =
## _grp), \
> -			.groups =3D nm ## _grp }
> -struct npcm7xx_func {
> -	const char *name;
> -	const unsigned int ngroups;
> -	const char *const *groups;
> -};
>
>  NPCM7XX_SFUNC(smb0);
>  NPCM7XX_SFUNC(smb0b);
> @@ -764,7 +757,8 @@ NPCM7XX_SFUNC(lkgpo2);
>  NPCM7XX_SFUNC(nprd_smi);
>
>  /* Function names */
> -static struct npcm7xx_func npcm7xx_funcs[] =3D {
> +static struct pinfunction npcm7xx_funcs[] =3D {
> +#define NPCM7XX_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_S=
IZE(nm ## _grp))
>  	NPCM7XX_MKFUNC(smb0),
>  	NPCM7XX_MKFUNC(smb0b),
>  	NPCM7XX_MKFUNC(smb0c),
> @@ -880,6 +874,7 @@ static struct npcm7xx_func npcm7xx_funcs[] =3D {
>  	NPCM7XX_MKFUNC(lkgpo1),
>  	NPCM7XX_MKFUNC(lkgpo2),
>  	NPCM7XX_MKFUNC(nprd_smi),
> +#undef NPCM7XX_MKFUNC
>  };
>
>  #define NPCM7XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k) \
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl=
/nuvoton/pinctrl-npcm8xx.c
> index 9834a13cf5c9..7c37d2cda9f1 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> @@ -829,13 +829,6 @@ static struct pingroup npcm8xx_pingroups[] =3D {
>
>  #define NPCM8XX_SFUNC(a) NPCM8XX_FUNC(a, #a)
>  #define NPCM8XX_FUNC(a, b...) static const char *a ## _grp[] =3D { b }
> -#define NPCM8XX_MKFUNC(nm) { .name =3D #nm, .ngroups =3D ARRAY_SIZE(nm =
## _grp), \
> -			.groups =3D nm ## _grp }
> -struct npcm8xx_func {
> -	const char *name;
> -	const unsigned int ngroups;
> -	const char *const *groups;
> -};
>
>  NPCM8XX_SFUNC(gpi36);
>  NPCM8XX_SFUNC(gpi35);
> @@ -1060,7 +1053,8 @@ NPCM8XX_SFUNC(hgpio6);
>  NPCM8XX_SFUNC(hgpio7);
>
>  /* Function names */
> -static struct npcm8xx_func npcm8xx_funcs[] =3D {
> +static struct pinfunction npcm8xx_funcs[] =3D {
> +#define NPCM8XX_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_S=
IZE(nm ## _grp))
>  	NPCM8XX_MKFUNC(gpi36),
>  	NPCM8XX_MKFUNC(gpi35),
>  	NPCM8XX_MKFUNC(tp_jtag3),
> @@ -1282,6 +1276,7 @@ static struct npcm8xx_func npcm8xx_funcs[] =3D {
>  	NPCM8XX_MKFUNC(hgpio5),
>  	NPCM8XX_MKFUNC(hgpio6),
>  	NPCM8XX_MKFUNC(hgpio7),
> +#undef NPCM8XX_MKFUNC
>  };
>
>  #define NPCM8XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, =
q) \
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl=
/nuvoton/pinctrl-wpcm450.c
> index cdad4ef11a2f..5cf6d555c5a5 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -482,13 +482,6 @@ static const struct pingroup wpcm450_groups[] =3D {
>
>  #define WPCM450_SFUNC(a) WPCM450_FUNC(a, #a)
>  #define WPCM450_FUNC(a, b...) static const char *a ## _grp[] =3D { b }
> -#define WPCM450_MKFUNC(nm) { .name =3D #nm, .ngroups =3D ARRAY_SIZE(nm =
## _grp), \
> -			.groups =3D nm ## _grp }
> -struct wpcm450_func {
> -	const char *name;
> -	const unsigned int ngroups;
> -	const char *const *groups;
> -};
>
>  WPCM450_SFUNC(smb3);
>  WPCM450_SFUNC(smb4);
> @@ -555,7 +548,8 @@ WPCM450_FUNC(gpio, WPCM450_GRPS);
>  #undef WPCM450_GRP
>
>  /* Function names */
> -static struct wpcm450_func wpcm450_funcs[] =3D {
> +static struct pinfunction wpcm450_funcs[] =3D {
> +#define WPCM450_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_S=
IZE(nm ## _grp))
>  	WPCM450_MKFUNC(smb3),
>  	WPCM450_MKFUNC(smb4),
>  	WPCM450_MKFUNC(smb5),
> @@ -616,6 +610,7 @@ static struct wpcm450_func wpcm450_funcs[] =3D {
>  	WPCM450_MKFUNC(hg6),
>  	WPCM450_MKFUNC(hg7),
>  	WPCM450_MKFUNC(gpio),
> +#undef WPCM450_MKFUNC
>  };
>
>  #define WPCM450_PINCFG(a, b, c, d, e, f, g) \
> --
> 2.45.2
>

