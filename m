Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD1A4B33F1
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Feb 2022 09:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbiBLIqW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Feb 2022 03:46:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiBLIqV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Feb 2022 03:46:21 -0500
X-Greylist: delayed 321 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 12 Feb 2022 00:46:18 PST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49FD26561
        for <linux-gpio@vger.kernel.org>; Sat, 12 Feb 2022 00:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644655577;
        bh=6yeoDgDJPy6Mv0rvAeCcJ+cV6rpBoVqlTD6BL6nGPBA=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=P0/5zH1A+NO2EmuHIfUhrqR95GRfolpNGrwRTagFw9ZpQow8nw/8MIT/ds6zPWb7P
         bW1rBLluebIR1yEECZObv9LLT8K1MZjbt+829+D8UK/KQKEf+wmDUAiwO/eyk4zeAn
         5C1oQeV4BlXbQkdA9aB3xqh6gDaoT36892Er0pTM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzBj-1na3rS2BsH-00Hyov; Sat, 12
 Feb 2022 09:40:47 +0100
Date:   Sat, 12 Feb 2022 09:40:45 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Joel Stanley <joel@jms.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
Message-ID: <YgdyjUbb4lnrVHmJ@latitude>
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
 <CACRpkdYEigGHkoGfBg15tFXadgpXUAjDOnw7ePXhmvHJqPEJXw@mail.gmail.com>
 <YfZkis8M81Ejpagq@latitude>
 <CACPK8XdFXRQf3MpPh3z=EMAKtnQSHL+iwwMCVYc5dP9DfQEN+Q@mail.gmail.com>
 <YfpyjDBH83FE7r4o@latitude>
 <CAHp75Vdg8zFSHaTP_8jQua5QfRYbvZ4_rLdCtt3ks8YEibseTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zAZgCYGBplb8VEfC"
Content-Disposition: inline
In-Reply-To: <CAHp75Vdg8zFSHaTP_8jQua5QfRYbvZ4_rLdCtt3ks8YEibseTg@mail.gmail.com>
X-Provags-ID: V03:K1:hJPvO5vHcOttZM1wfVcuMJQGsgrEjDcKwOkTeT64bNtzFABDEGK
 WIamoNhFYPIJHSOMwXV0YQfcg3M4errYW7wm5rOzvzRkWqMDpmhLL04tZCTAsKolznmxDEH
 phmVnU7DTvxszphcydPY+LPpRINwC5jVWzlk5OGTGRtEXG7YLZAd2GCetPFrbrQw1At0n4X
 nqekm7hvvtg4RUJUdg8HQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mWBfiREQJMs=:Wm8SW0O43Ukg6hGYYAzWVh
 PEdmZMA9gSUEvJipc3vIAPD7wkz50mspG7zAZU7QNgWWyc2vYeFOhXB3E61T606WtO4M2Z9ms
 +5pVQAaje5z6xHFL96KvjnsU3L6VPmCx4r9wddJxQFecYn2udBbZR4J2g2BESKb25HdVVBEVc
 Cb1B6wBnT6bpw/xeE8jK3lszSOynTthxWABie3W4bQgRcaZXMK/dduLNkwrQWuky8/UdWlUJP
 kGFKhYTNcCuv8UFjKCq2eEj+GR6TuFFcGo8qAjYFuAtEZ5mzSGXz4vWfZvs0mOHFtWtPG7W8V
 Rr8GwWWTkVW5TSnMdi5Y9cmGxOwSGLG3FxOGYo/PTaqqY8n1SIi2mwOSOKk14wYE8sAeuuXpv
 mx+MQkmGrOgEIF1QuJ54nvho82QXhHmpH/fX2bhowy3/JCt5ZY69A+2ZxCqzWqcHPYx0F4lMA
 KaX09Rrhnv45pL1jPxzzk+by/gfzCoTwW0l7gyOZwSC8kHodO5Xz13bjjrzoVrepwyzuINszK
 DNEsgn5n8dfKR/JkXbK2MdfCOIO1iqHkigYnHHfqqBalxuEaCnp6CRHPQY7qVuASQx+cq+YFj
 pXKW+utbDUkaf76qqo1gX5rxwcNyM70nwL6/m1PhOE3RP6L7rFKLhTDcXxFvwhk/T0/2wMf0i
 LVNobZDOjWWLDXZB1K5tmaSGbeJAVKAKmXeLzQpqdil7qlhm2Rcmn6S27orbc2qovU2XxS70o
 c14rnMOx51bOr+4pdgsl8lK2PC2FLnuQ86wYb2mIk5E6gUBlatk6FD+/xC8ROEpDnk/XiXwho
 mWYNtMH1AGizW52bwUJA4zQt+Fi3DwZvaHhPgQWkvSaeq3YpzArOHxn7dhG+UmJJlXoGF/QY0
 7koSrLfj8sLMIkthcFX+PFVxsi7HTOdanSD4q5ImqVsoigl0HD5JCm0Vf59TM46I5ncK4NzBx
 01XVN6p4gOzrobw/8s3O3+lAhG+WRHMxFUW2vmESpZ2bYyJjPBb9lpcGeld1XIVK+ohl5iRPP
 l9oDSom/gshvXFzk9AqrCE26cFlY9YD9HCzkUEiUmOPSdnh5Qz7j1tDLva0cC1JgJQ391D6sB
 hMpvAuY+M1ynM0=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--zAZgCYGBplb8VEfC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 02, 2022 at 02:10:44PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 2, 2022 at 2:01 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> > On Tue, Feb 01, 2022 at 11:42:11PM +0000, Joel Stanley wrote:
> > > On Tue, 1 Feb 2022 at 13:05, Jonathan Neusch=C3=A4fer <j.neuschaefer@=
gmx.net> wrote:
>=20
> ...
>=20
> > > I assume you're sending a v6 to fix some of the warnings?
> >
> > No, the warnings are fairly independent of this patchset, it's just that
> > the adjacent pinctrl-npcm7xx driver started to be built by the bot, due
> > to my Kconfig change. I'll fix them in a separate patchset.
>=20
> I guess you need to fix that first.
>=20
> Because now and then all CIs will complain to your patch and confuse peop=
le.

FWIW, Linus has applied the npcm7xx fixes to for-next in the pinctrl tree,
which means that they are not blocking this patchset anymore, AFAICS.


Jonathan

--zAZgCYGBplb8VEfC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIHcmkACgkQCDBEmo7z
X9uckRAAoi/mjUjwvtfOFTsTH/PH/r6DDSOiFTU+ycxhILZmK9lMk3c33cNUu1ib
9eJY87Mg8UpRJvvNST2usUdrxKV1eUi/lEI0idiu9+Q9HMFo84s0Wv37NhfwCGDR
mgTW0IbUsLvRegIP6Rl75XSAn6+GTIIYyhMA0Ohw9T37JOa1YI2ysV+dkqPkSala
WUe1CmWQ6yFSyLslMp6ZqZtg2rpTMCR0vat54Ykbfrity9fxd67OZE/561bvGKht
qpCEXrfWk1N35pQH/2VUfVBerwLWfW+Dq6ddq5qGMyTXr4hnGyQiidGQb16aPugT
ZGzq1S7TdnJ3r3k+HwMOpbARR4sn5i4LWkPkvAv2WvGScHfUwOfS4ttM0Q6H6/2T
lLt7jnYuosmvFtArXbc/PllfNWRfQeMylBzRoh8GOHCNSHhgewMZYB+SBqGrMqb7
lue4pyfWONnC85aWCYZyBbM1Bmh9E0LAs/8KxievUS/nWbDOe/Qz09m+XanUq1CF
5QzMKcaJekmiVVxDquzj/17c9V7ZZrb9dT6mTSYSoG0I77rKsPNHMkIccRVHm9ez
J10PVtMUNLYUdc5r62fn9HBo+x/aNtEHdnd/CTx3jZ2CFVPmAW2gGz9fQMwlWLyJ
LAKCGXBxxFoEO/bcZevsri26S8yvt7Lw+mIpupglsw/luJwHNUQ=
=Yhe6
-----END PGP SIGNATURE-----

--zAZgCYGBplb8VEfC--
