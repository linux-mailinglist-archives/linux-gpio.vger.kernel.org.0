Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 097454E4AB1
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Mar 2022 02:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240879AbiCWCAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 22:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbiCWCAK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 22:00:10 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFCC1D322
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 18:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648000712;
        bh=dUjMMpVrka2fLhad+UZjpbON2yQBVeaep4ypkzMSDos=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=MKVYgdjfYBwZEblw3ryL1fQFXXc/wXt7AXCgvjz7bPcsi2vN7jlj91VChdFbaOttN
         NSuse/5X57r/wRUn1MCEyHMieH4FkF1uE+9y1Gn41RuT9oFl2pwi5HkN8XkCUDrPeG
         VRSucUJjPqqUoBAJT3x2wvOKMNUCfYPATRMOGS+s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysRk-1oIjnO2JN4-00vzVt; Wed, 23
 Mar 2022 02:58:32 +0100
Date:   Wed, 23 Mar 2022 02:58:31 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] pinctrl: nuvoton: Fix sparse warning
Message-ID: <Yjp+x5QWhT//1oT8@latitude>
References: <20220322231604.491272-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZeG3IKs0O7qsJAib"
Content-Disposition: inline
In-Reply-To: <20220322231604.491272-1-linus.walleij@linaro.org>
X-Provags-ID: V03:K1:Hve6ENidaB23UPba+RWQ1IurauxR8PZFKJJQd0IqxUdZ+cWWIkH
 S/LpiYfTXTkv0BWZVoDSm5hblu4VWT7WGL6gGoaEq9xxA61xwLvjG+99pSCtvVK+Qf41dti
 mbh6Gni0+u6XQW661Ig9mUGn61aQPkDNVbuE/RaOFw7i7lK3xZImJgyZeS2Hu3NaVwj4zlH
 IbVTdglvDKjS3/QOTxMPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z2p5lqHnBLw=:eaJb1uj47FN+Ni2Fm/gc1D
 mY0zgGlqynvzWkIi+niCMowm6O5g5UqumftJsVSXmJD67hld3LLHtHH6osXiqXXYegKpGVJPk
 s3RUcAgSQkAg3SicFnXFMWQBYlng4kLFQ5ucgAer0Tzn/uVxLiIxU3XG1R9xYrKVTuaJPxC75
 tar7R6JIUJDRvadIauN+GWNQyax9Z09A/hjEpMQ2g3dtUv0VenwAsD50/RcuMRNdtCdBNb2oM
 mZAF2L0g7zlEBdn9LRMCS4032YwUJudkXEGbKxWNvEc4LTI5mbaXl5pSVYLaYgIjI1CYOK7lh
 R5YRuMCQj2iWWw+3rcD76XLypeUs6UQ9DZIRLjcGXIduLsyBsgH+JRiQBQTFe22RKHvAsFveO
 Hz/c4YvWTwjY8gzTUtVzFPu51EyyHK9iK7nItePuh7cEgpVXyxqhhewwhzp47t2iEuFAChukx
 XtaBz1Uqogia8tUowmyJxjQeXk8gBRtNjAQt2g8yb2nNwG0NrwO0gYMYnU9M4xhL921IV2Uej
 KAcPFEOAkP4ZaqXQ+ZF0pgoCihmZvmFfiBDBzPro73VWpbVHOKPRdEtshr3IBxDG88JXAZ8Fi
 xzhQZA90iL2P3C1WB7I6aZR61TQlnkoJJMc20CJWOnQfc+4HzfBDhI7RpXFqV2X3SLEIQiyhZ
 v8M3rSTSrslTrkNNnEFR6hr5zEPilHC00qFy1fXd03dqw97IQvz8DidOqQc4EfDfw0qqukFId
 Vkl76UGjik0SP0SD7vJzcgzuSuSUUVLTPzMOwnntGtYSc4JVOJm4Oyo2wA4vla7E07B6r45rf
 XuFjbUuIa37V+tH7n8zj+sx/U98vF4Pnl1WUZrqfokr2gifDccHmBLCWNgpaqOAeAKtJ69Yk/
 OSPthGJrb10shNUxkr8MNJwtRSFn1T9ow/EJZZxTweyiCd9+W8qk/BksLVpogvU5aCG65Vni/
 MkGdYDPB6yOJn1RMJ5wWLwFFZOVihnVoU5fHylBWyx/Ez+ZozVvwnPtXeCthbHXfDT8bMyChC
 K4bWFToxZA1BGUgaMk4N9EJBHY5Xtc/JU99QtBrttD5atO8lOyeDWPIzU+1aOZVjbc1dh/ANj
 aAKFYMT3u1oR9E=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ZeG3IKs0O7qsJAib
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 12:16:04AM +0100, Linus Walleij wrote:
> Sparse complains:
> drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:626:9:
> sparse: sparse: obsolete array initializer, use C99 syntax
>=20
> This is because no equal sign is between the array index
> and the assignments, in the macro.
>=20
> Fix it up.
>=20
> Cc: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Sounds good to me, thanks!

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/=
nuvoton/pinctrl-wpcm450.c
> index 661aa963e3fc..1402840af11f 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -613,8 +613,8 @@ static struct wpcm450_func wpcm450_funcs[] =3D {
>  };
> =20
>  #define WPCM450_PINCFG(a, b, c, d, e, f, g) \
> -	[a] { .fn0 =3D fn_ ## b, .reg0 =3D WPCM450_GCR_ ## c, .bit0 =3D d, \
> -	      .fn1 =3D fn_ ## e, .reg1 =3D WPCM450_GCR_ ## f, .bit1 =3D g }
> +	[a] =3D { .fn0 =3D fn_ ## b, .reg0 =3D WPCM450_GCR_ ## c, .bit0 =3D d, \
> +	        .fn1 =3D fn_ ## e, .reg1 =3D WPCM450_GCR_ ## f, .bit1 =3D g }

You will find the same in the pinctrl-npcm7xx driver:

 #define NPCM7XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k) \
        [a] { .fn0 =3D fn_ ## b, .reg0 =3D NPCM7XX_GCR_ ## c, .bit0 =3D d, =
/*...*/  }



Jonathan

--ZeG3IKs0O7qsJAib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmI6fqUACgkQCDBEmo7z
X9vCZQ//WACV90Ea6xM6BilUUv6ilierdAoyPwGfVQiObqr6eFKjbNvpJ9LPxjYV
4xrs2VT40oDo96lL9jZzTb/3qYe7GcxxeNtCuXyI5skhZDVkSFPOaRQ3GX/Qrxju
eFKb98fGVMTYmRAlxgpkQXhDVb0qEeQOZpeiASCCh/QaxlGGzyGJRWTMZfrhHBs0
Vjxv/fecEZohv9CKiFkG9sllC5IuxucbtV7S9mArNIbw0DOwGJSCItn2JUy1H79O
g6iVmyg7uwHyhFA4oC6WXn7flCttnduxilTdJZL8V2JZP3clJR1gc5BxK2pIfZkU
D1Yeow7QWATH6fEhAgw/DYehYtJfu/0zfx+fIeQG6W4Xjcc2PZYNw+ujJ+RSq95f
BVZQi571EMKnacsXDIrbxcxbmKElNUM6Ma4puJKISyLB418eAMkajjyi7ywDMSTW
8R5cXa4bmjipwGL8QXYSooinI7TphAE99uNMKa8fS3Clqg4jaEOg6YsflzXwVmgY
GeqZVTXuByMw80h7hsAeTHWMe4akoW/Vd4yTndw8EivCKej+RZCAbbkLThY/Sd7R
9iAhhqIYG3pUudMVivylsplon0pRgEnfryEWY0nYmN3O8mLehoO0ZYbSi8Q36CvI
aSq5WrC1RElScT/rar99IVEGNQ994Wk5WHEiM6yT5m3MsCzvBD4=
=sj7V
-----END PGP SIGNATURE-----

--ZeG3IKs0O7qsJAib--
