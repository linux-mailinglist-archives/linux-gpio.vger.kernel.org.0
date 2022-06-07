Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F39E53F668
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 08:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiFGGmV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jun 2022 02:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbiFGGmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2022 02:42:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2EF23BCF
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jun 2022 23:42:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nySuv-00060U-19; Tue, 07 Jun 2022 08:42:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nySuv-006wTk-9R; Tue, 07 Jun 2022 08:42:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nySus-00EiMF-GA; Tue, 07 Jun 2022 08:42:14 +0200
Date:   Tue, 7 Jun 2022 08:42:11 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel@pengutronix.de,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] gpio: pca953x: Make platform teardown callback return
 void
Message-ID: <20220607064211.zyqbevl3bwh53o5m@pengutronix.de>
References: <20220502170555.51183-1-u.kleine-koenig@pengutronix.de>
 <CAMRc=McHZWjdFywntMwfg19U2H4Jh99SBa8Zz+0N79W4EQJ9gg@mail.gmail.com>
 <20220527071136.zlyjp4s7stnhby6w@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dfpk26jxnmniaz6r"
Content-Disposition: inline
In-Reply-To: <20220527071136.zlyjp4s7stnhby6w@pengutronix.de>
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


--dfpk26jxnmniaz6r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, May 27, 2022 at 09:11:36AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Thu, May 05, 2022 at 02:44:40PM +0200, Bartosz Golaszewski wrote:
> > On Mon, May 2, 2022 at 7:06 PM Uwe Kleine-K=F6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > All platforms that provide a teardown callback return 0. New users are
> > > supposed to not make use of platform support, so there is no
> > > functionality lost.
> > >
> > > This patch is a preparation for making i2c remove callbacks return vo=
id.
> > >
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> >=20
> > Looks good to me.
> >=20
> > Sekhar: please leave your Ack if you're fine with me taking this
> > through the GPIO tree.
>=20
> Sekhar: Did this patch fell through the cracks? Would be great to get
> this in during the next merge window (i.e. depending on Linus Torvald's
> counting abilities maybe the one for 5.20)

I want to use the release of 5.19-rc1 as an opportunity to ping this
patch. I intend to change the i2c remove callback to return void (i.e.

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fbda5ada2afc..066b541a0d5d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -273,7 +273,7 @@ struct i2c_driver {
=20
 	/* Standard driver model interfaces */
 	int (*probe)(struct i2c_client *client, const struct i2c_device_id *id);
-	int (*remove)(struct i2c_client *client);
+	void (*remove)(struct i2c_client *client);
=20
 	/* New driver model interface to aid the seamless removal of the
 	 * current probe()'s, more commonly unused than used second parameter.

) directly after the next merge window.

So I ask you to either take this patch before (my preferred option), or
accept that I send it as part of a bigger series that eventually
contains the above hunk and will probably be merged via the i2c tree.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dfpk26jxnmniaz6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKe80AACgkQwfwUeK3K
7AnvQAgAlLDai5zJ4poYFviz3zTTYcBpW8R7yLvk/f1RXff8vxi1cDYaZjoiFcjr
3e2GwUISqODjuEhRO/uZo04Lo3MnW2b2bqpoV9eAPb5vQaMQ30np3IAtSBsIXnm9
IR9N6Xpo3w8DkrsjdfDZ/YaFjg6SwYftRnh2V2V+y2Ij4hy5lAAHE7nHy00a+Vrc
V/rhFbU+Pw1oSjFc/5bIfB3KQ4IOfVezntn31TJHXgHmwyx3U5ARbL6KJKbk0gKy
AnNzXzxAbsbtdMCc306vIRA8OCXYDTZbbn9bO2/4MktozIFpFLmKK3cTfwAvz2S5
lBlyf0sf4aAvKmjJYjPMnjEAOy/KnA==
=yi37
-----END PGP SIGNATURE-----

--dfpk26jxnmniaz6r--
