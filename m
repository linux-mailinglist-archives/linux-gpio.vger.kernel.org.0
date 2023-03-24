Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1666C83B1
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Mar 2023 18:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbjCXRuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Mar 2023 13:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbjCXRt7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Mar 2023 13:49:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D6F91BAEB
        for <linux-gpio@vger.kernel.org>; Fri, 24 Mar 2023 10:49:12 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pflX1-0001Xk-9M; Fri, 24 Mar 2023 18:48:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pflWy-006R4F-ER; Fri, 24 Mar 2023 18:48:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pflWx-007gCW-P8; Fri, 24 Mar 2023 18:48:47 +0100
Date:   Fri, 24 Mar 2023 18:48:47 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     kernel test robot <lkp@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] pinctrl: mcp23s08: Implement gpio bulk functions
Message-ID: <20230324174847.mliztdmecz4kivgo@pengutronix.de>
References: <20230324140148.479125-2-u.kleine-koenig@pengutronix.de>
 <202303250001.YzK908so-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jdcyibuamcdvvmri"
Content-Disposition: inline
In-Reply-To: <202303250001.YzK908so-lkp@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--jdcyibuamcdvvmri
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 25, 2023 at 01:05:58AM +0800, kernel test robot wrote:
> Hi Uwe,
>=20
> I love your patch! Perhaps something to improve:
>=20
> [auto build test WARNING on fe15c26ee26efa11741a7b632e9f23b01aca4cc6]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/p=
inctrl-mcp23s08-Implement-gpio-bulk-functions/20230324-220530
> base:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> patch link:    https://lore.kernel.org/r/20230324140148.479125-2-u.kleine=
-koenig%40pengutronix.de
> patch subject: [PATCH 2/2] pinctrl: mcp23s08: Implement gpio bulk functio=
ns
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/2023=
0325/202303250001.YzK908so-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=3D1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/0e7980f9275391601=
f384ff6fe0c4713114f0f0b
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Uwe-Kleine-K-nig/pinctrl-mcp23s0=
8-Implement-gpio-bulk-functions/20230324-220530
>         git checkout 0e7980f9275391601f384ff6fe0c4713114f0f0b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 olddefconfig
>         make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303250001.YzK908so-lkp@i=
ntel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
>    drivers/pinctrl/pinctrl-mcp23s08.c: In function 'mcp23s08_set_multiple=
':
> >> drivers/pinctrl/pinctrl-mcp23s08.c:351:13: warning: unused variable 'r=
et' [-Wunused-variable]
>      351 |         int ret;
>          |             ^~~

FTR: I noticed that myself and there is already a v2 on the list that is
older than this bot report.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jdcyibuamcdvvmri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQd4n4ACgkQj4D7WH0S
/k6CpAf/QSISNpSmnOhxh4EgkGKOdWrQl1BSake3bQkrhUgYJVFcFnGE/mTRF1+N
NI5YhIeJtiAvMebKsr+N4OpJuc/wg8JoCTFLSqWWu5TdjB4PK2p2zYJNEifhRDkh
TGXXAQm9oYKvTP2foFc5iZsWltGJu1liKr9n8RAensyGlhFCy0xjuaZ2PldTXjPc
L4eJAgrNs+MVEoCiLexyzIiKYYSoXoWVtClc+wr0f8fanzm8b7kvKr2siGHXNkyf
HDjFASD5/Ui8fIanxPNRPfdZrzzfuT4PUD1+u6sxBYEygGA7uywzx/62tdm+EQmD
rwu62wP2Odm8CN+nsjx66ce2NOip5w==
=6u03
-----END PGP SIGNATURE-----

--jdcyibuamcdvvmri--
