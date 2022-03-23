Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0124E56D5
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Mar 2022 17:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245513AbiCWQsi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Mar 2022 12:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245522AbiCWQse (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2022 12:48:34 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD37310FFE
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 09:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648054016;
        bh=clK8dTzbJPPhyCG2hwx0uFJXKSPZ468mOiSqHyTswjQ=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=aQpT9bOWiGDVcSn5N+ubNzX3YOZ9yF5/5YwnVePhVpUzPDKBgQugqRXAv0Ns+Fm2+
         RbhYi+7f2B+X3Qo3QHuVZjao2idCiJKsdQJNtP1SjHli+zsQxQGdxPQmywF1RPxuKq
         Vabi4LSck/H5C3y6l41L/fsBJgnFgajDnhdBCo1M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSc1B-1ndLYX1Nnt-00SwzJ; Wed, 23
 Mar 2022 17:46:56 +0100
Date:   Wed, 23 Mar 2022 17:46:55 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kernel test robot <lkp@intel.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        linux-gpio@vger.kernel.org
Subject: Re: [linusw-pinctrl:for-next] BUILD REGRESSION
 0c3c8458428ab471178a0d155222eaa62083d033
Message-ID: <YjtO/0zlcYPdFR59@latitude>
References: <623b33fa.pb2pVWdVg3WqlK6+%lkp@intel.com>
 <CACRpkdb2hifdLLtquEMqty2hBzr8ap_HxZVNRq5GY5ed3kR3YA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bZnMrCvGAi+ivXfQ"
Content-Disposition: inline
In-Reply-To: <CACRpkdb2hifdLLtquEMqty2hBzr8ap_HxZVNRq5GY5ed3kR3YA@mail.gmail.com>
X-Provags-ID: V03:K1:IR5t3LsBS+PKHiSYCIC3wQSUEuAy3HuOcSkjQKldp+MhM88su64
 BojirzY+mamOWxlx8i2V1DYgbJiNKXWJJ1zqajwuQ4owm/LT6oIKSO7rhSrVcMkSgdZjvpH
 K8OxvOkWjGNt/pCInVXlkogT1yIpnnF5nOurynObWkXSitPsJoLTJ5vz6MM+1s0CcVBuUyw
 TiYEt6tSwrGeusVyzpBsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B03S244B63g=:2o4682KG14m4wp+MTWYo7V
 bYnblCgga/8czY+TUNlrZrXS7tePLLdPKfWt7wBNLuhmBUEK0g3LBDT/pkAU1XhWokPQa07Cg
 3QcMr6usXEHkEKRm3ptP8toNWTebO8kWzErp42KlnPwQ2RdfGu/52OUsgl7DhI9nFGi6QMm7+
 BOHsmtpt0cW8duQHtZoxQotZClyYGU8kpVjgCsZv0LXTR09te42OVZoU1TAkCfenZyZXaTxrX
 ryd4mJXdE6QvOAzj6OJbdhto6uEA2gPkG6fwaHuS5+K4TEoDMHPmFxEWP9+dOyfGmjE3FCHbf
 Z8ehGvi4OBGWlvmIFZeHzbE+B9SOWMYssGM8iUBHe0p/iaLKD7N1OLrX2uloF9YuTaLoOSNvJ
 9QOZQ5+p7y5eeL+cW9BtNPXunwUafKsnzMxSGYdlTmXZfVZJNu24/DUkRzZm7bVZXB+/aVW7E
 jccB/UKU0a3HT3scjxdcSImxvhvjzLU2ur4Ld3Bp2hyTakSGRVgAfbPVpqwcFhPwmKCRPrd2T
 x+eXaHHTzpGkxiMrIzCeyYnhKvkxL/8zrXJbDaqahhIEfIVhfyMgaHHapuKqDcuwmXmLhz91x
 X9mV5RKXjOWAiL3dRIFmuLmuQxGhFDIUGgfgn+V5jMIiqZAITWQIE6ln2mKNLPjecJnizIq5t
 C+MDMq2WN0MUiuKhfYA2xc2MLtHaq6c+wKxxl8Bak3Xkg9Zjp9g614jfTP8eVvlMMy2aS4DZw
 E8F5rQb3qkktegYflLqARM5wKhnRuXMtTdBye/zKAb0mNHRlDVnWfrzSXAgxPOJkc9fKB1Cv9
 E7S5kDYo9bfPq+nZV8peUdWolSc0ngnxbTGQAzX/WDcBUVtTcfHxoRgs57bbqEHyyG615TEaI
 /LqucAQ+sbUys7+S2CmaUIF3txzyP2NXm/3iyszXApQ7xpSavc03qal2V4i03zMsv/k8Nq7Yo
 rfF4BmP5eNxHtc5mPDe7tO91LLUHyRPd15Yozl/U3QgZmWarwACXkWJs4G9K73hYSjF7UE8Sf
 LzaEEBGF4x4VaHPEVN+gMignKy3KEkdW1/wg3zMBANVsnsW8oofhAvbnpbYnsV5dS54geOrQL
 AOe30yidQ9C6JY=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--bZnMrCvGAi+ivXfQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 04:05:02PM +0100, Linus Walleij wrote:
> Hi Jonathan,
>=20
> this driver just keeps creating new sparse warnings, I try to fix them
> but I wonder
> if new warnings will result everytime I fix something?

Hm, sorry about the chaos.

> Do you think you could run sparse over the drivers in some way and check
> what else needs to be fixed?

I ran "make C=3D1" on drivers/pinctrl/nuvoton now, and only noticed the
same array initializer syntax warning as in pinctrl-wpcm450, in pinctrl-npc=
m7xx.

>=20
> Yours,
> Linus Walleij
>=20
> On Wed, Mar 23, 2022 at 3:52 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/lin=
ux-pinctrl.git for-next
> > branch HEAD: 0c3c8458428ab471178a0d155222eaa62083d033  pinctrl: nuvoton=
: Fix sparse warning
> >
> > Error/Warning reports:
> >
> > https://lore.kernel.org/linux-gpio/202203222145.UcCrXHfm-lkp@intel.com
> >
> > Unverified Error/Warning (likely false positive, please contact us if i=
nterested):
> >
> > drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:470:26: error: array type has=
 incomplete element type 'struct group_desc'
> > drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:470:40: error: array has inco=
mplete element type 'struct group_desc'
> > drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:824:56: warning: parameter 's=
elector' set but not used [-Wunused-but-set-parameter]
> > drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:888:48: warning: parameter 'g=
roup' set but not used [-Wunused-but-set-parameter]

This bunch was fixed with my patch "pinctrl: nuvoton: wpcm450: select
GENERIC_PINCTRL_GROUPS". There are also two more fixes sent by Jialin
Zhang and Dan Carpenter over the past week.

> > include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width n=
ot an integer constant

Unsure about this one.


Best regards,
Jonathan

--bZnMrCvGAi+ivXfQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmI7Tt0ACgkQCDBEmo7z
X9tg0A//W4EvYxIBMzKdla1AFd3Mhazxujobj8dN6cQ6D/+CIObrBtjjymLlNAhR
IPKbJD3FI5UQ8PaRLV8wrwJKPsW0hnntl/BQbhaRaGGYaNeFAKgeX3avkNBG31zT
ZGLmF+ytU7VRoEeo0a7uzXXVkAGKqimFBR08UayELOFmAlqPbUmAYBcvx2NjtgMU
5CAZYnm25/tA5hrTnqWqIP7DhaCaEVdEqj1BMgjc9ZGhRIxkfIyYpUUXtBwfSDC5
tnyNHEYOq8dxAiXUe/rxRcHb8BEsndKSEb4UY/Kr3it6eSDEBXh5Y3UqiquLr9mL
R/hL34zshtNb3wHfeJDf+e4anl1hgJTiIZ8zw/DD4gQ084Lrx/1anwj1HPQ52wTh
1lEkMRqT+QU95taepB36bKLYq3Teuzu6kQ2hNXYBBQQUOoCel9dts7bDnswWyfd/
TJ1DNjlEpLad8xbB2avGaNH0obRYBvavSXQz/Uo2+DqxP1pxv9WKs8WWlQlEGLq1
82u4J/hVpbDr4XOY9kqrckPtVP9OBwDqIPMn/Vs04kQ0s1Uztxs+9Lpcz7JDzcnH
6za4u7iOHq6Gon03Rkr/8H6R/Znrzd22nZvzi8ESC2gvieiiqapqaqODnrtJSOyk
bTufbP1hZiKywvv3tinsIo77Fl35zVW1ZfyqCGd9gNxqubbjppQ=
=l0h3
-----END PGP SIGNATURE-----

--bZnMrCvGAi+ivXfQ--
