Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B01235005A5
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Apr 2022 07:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237056AbiDNFq6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Apr 2022 01:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237039AbiDNFq5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Apr 2022 01:46:57 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D075427FF8
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 22:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=9K3s+7W9nUTmCKdmQk+59GS6xSk1
        eqBtgp2UjpaC9xE=; b=rLClD2Es1TBIXnMwFTuYcV7L+Eh7LsOcdNw6otfs1+t0
        8yQVohqiKXaZb/4HW0rdTcQD/rQcIRMney83fj1WZr+Y0G2dCf7eohBImdS7QEoP
        j91OtUvsdaYgKK0qND7WVltHCoaoNB4SfnKTubclidPVL5jC3/KXw6Eb7LoXpWE=
Received: (qmail 1704119 invoked from network); 14 Apr 2022 07:44:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Apr 2022 07:44:28 +0200
X-UD-Smtp-Session: l3s3148p1@WB6MyZbc/uYgAQnoAHEoAMQ+nXYqllKU
Date:   Thu, 14 Apr 2022 07:44:28 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: checker: Fix for drive reg field
 increase
Message-ID: <Yle0vODAp89idGxl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <e44426a99b20e5f5681ede894d08e36870bcb47f.1649865163.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PESm3vTnzN3N6Aeu"
Content-Disposition: inline
In-Reply-To: <e44426a99b20e5f5681ede894d08e36870bcb47f.1649865163.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--PESm3vTnzN3N6Aeu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This happens because the checker still uses the old number of fields.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be folded into commit d5c9688095d29a6c ("pinctrl: renesas: Allow up
> to 10 fields for drive_regs") in renesas-pinctrl-for-v5.19.
>=20
> Ideally, some iterator or index helper should be introduced.

What about a #define instead of a hard-coded value until then?


--PESm3vTnzN3N6Aeu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJXtLsACgkQFA3kzBSg
KbbDZw/9ECfmLysxjyqkNQAVM3PqdEd/TUsDq9S4spe5uqUmc0x7PWluOFKaNCQz
UxsfClqrsekb62O6KwoOAp2skHAJYzRKynbAMAds5uJED+PD4SDstC/Zh5z02aO0
F0hFwlF/3NeqWTR2zjjIGx0p35aJrZEYwIIZ19Ks16jDlIzTr0Ns0j4XFpPsoSfc
1Oqk3EOMBY6ueybMYUrniICbbW8wZslns+wXWt5wViciCS3i2S9Yyl78rDZ4NG1v
39UvOGf02NdSnSGhsyAgHWfKEszTE/CdHfrydw+POZSFIPiooGwD7Kp1OaYbve1q
aNW3IfGm1+plyJ0W5ev48fjx/z7aAkqBEzxph5UBx4Tir09Sqzpoo+OIbKucKhFy
PlXiBtkNvwvzM3wh59Xh5+spiOkKaji6MU2nEMonSVWjnQLV+DBXNxNpgA+1mqPW
6+SHjlLllnpl0DCjnLfSAbp738LU9An1+S+G/LSapww/MxJGbjFuK72peuzjTyPx
NGsS7R4Kdbu2HgzhdCWd8KAMmZMFX48F4hwtKvRq3coDggZ5y4oHsl595EGKwJf/
ghbga0JvO4rkW1asCDOcimOlV6IBoMgaGVujUhDgW/gOGorwFZJAzpRzc4yEmDvB
wcNOSVoxDi0marGx2qaU05r2I8eQQhDA7MFfGLlX+M7uc/rceWA=
=2L12
-----END PGP SIGNATURE-----

--PESm3vTnzN3N6Aeu--
