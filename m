Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 314125359FD
	for <lists+linux-gpio@lfdr.de>; Fri, 27 May 2022 09:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236909AbiE0HMt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 May 2022 03:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345723AbiE0HMP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 May 2022 03:12:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A58387
        for <linux-gpio@vger.kernel.org>; Fri, 27 May 2022 00:12:05 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuU8h-0007sv-7t; Fri, 27 May 2022 09:12:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuU8h-004pHz-2T; Fri, 27 May 2022 09:12:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuU8f-00CQ4W-1v; Fri, 27 May 2022 09:12:01 +0200
Date:   Fri, 27 May 2022 09:11:36 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH] gpio: pca953x: Make platform teardown callback return
 void
Message-ID: <20220527071136.zlyjp4s7stnhby6w@pengutronix.de>
References: <20220502170555.51183-1-u.kleine-koenig@pengutronix.de>
 <CAMRc=McHZWjdFywntMwfg19U2H4Jh99SBa8Zz+0N79W4EQJ9gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="woz3cgfj4rs4xa6r"
Content-Disposition: inline
In-Reply-To: <CAMRc=McHZWjdFywntMwfg19U2H4Jh99SBa8Zz+0N79W4EQJ9gg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--woz3cgfj4rs4xa6r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, May 05, 2022 at 02:44:40PM +0200, Bartosz Golaszewski wrote:
> On Mon, May 2, 2022 at 7:06 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > All platforms that provide a teardown callback return 0. New users are
> > supposed to not make use of platform support, so there is no
> > functionality lost.
> >
> > This patch is a preparation for making i2c remove callbacks return void.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
>=20
> Looks good to me.
>=20
> Sekhar: please leave your Ack if you're fine with me taking this
> through the GPIO tree.

Sekhar: Did this patch fell through the cracks? Would be great to get
this in during the next merge window (i.e. depending on Linus Torvald's
counting abilities maybe the one for 5.20)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--woz3cgfj4rs4xa6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKQeaUACgkQwfwUeK3K
7AkKfQf8DckvwlEwqNnkuwb2l0G7Q47BcU3IIqkrg+CqsQ4PbQfqEKBtronLbcTZ
LiSwRbGakcD+q4RGw62cWVj39fsOM0NMgQXrSJ9tk7gWKMD/pUUtbiSskAEvaUEe
0ICbb44LCONNciUJaNM83htJkUBKPckIrjf1bxxDlWqkM+HhwXztqyjKCFWFheLw
2U5oOQHBlFpIn2xT/FPkhGIbVg2W4qyBOKAEB6GTQApRov4yt/3I3Qy4hjZAqbnu
DHX/7vEAWsW/MUmEv25HJ7q5je7YAaYQACBs6H6M51ywzE0OXfEp0Un5UN/XkNyI
i4zLTv6b7E7FnPVs2IDa4IEV1rVLCA==
=opnX
-----END PGP SIGNATURE-----

--woz3cgfj4rs4xa6r--
