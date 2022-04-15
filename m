Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1104650265E
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Apr 2022 09:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235169AbiDOHuz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Apr 2022 03:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242674AbiDOHux (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Apr 2022 03:50:53 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F83A1443
        for <linux-gpio@vger.kernel.org>; Fri, 15 Apr 2022 00:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=QIfUpEx/NR3GITE4jqqRFUXMz0f8
        bXyhKB0/xUDUdsY=; b=oWZ2rc3R371o/2fcW/gjzqiDD9+Pm/Bi/F1wDgr+d3jo
        O7lcJ0H5bIrwzn4UAsFE6o9PP8bm1SU8h2wgiVONSYrSvFRZSYk3QIzj7Jzm4rBI
        DUL5aM3q2HeFOjWp9cA+qSvei4gYAypgXJz2OsE0BQo9bH7ijDWTucWuBYd6+qU=
Received: (qmail 2142296 invoked from network); 15 Apr 2022 09:48:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Apr 2022 09:48:20 +0200
X-UD-Smtp-Session: l3s3148p1@IIhZoqzciNQgAwDtxwyoAOfJPDZkSTZ/
Date:   Fri, 15 Apr 2022 09:48:19 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: renesas: checker: Rework drive and bias pin
 iteration
Message-ID: <YlkjQ2+O0h8jDTqq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1848e56e6496b8d5ed50fd6adc8ef2078b454ce4.1649944305.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lbu41cTPydjuH3oP"
Content-Disposition: inline
In-Reply-To: <1848e56e6496b8d5ed50fd6adc8ef2078b454ce4.1649944305.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--lbu41cTPydjuH3oP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 14, 2022 at 03:57:36PM +0200, Geert Uytterhoeven wrote:
> The checker code to iterate over all drive strength and bias register
> description items is cumbersome, due to the repeated calculation of
> indices, and the use of hardcoded array sizes.  The latter was done
> under the assumption they would never need to be changed, which turned
> out to be false.
>=20
> Increase readability by introducing helper macros to access drive
> strength and bias register description items.
> Increase maintainability by replacing hardcoded numbers by array sizes
> calculated at compile-time.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Cool, this makes the code much more readable!

In general, I am fine with it, maybe one tiny addition to make it even
more readable?

> +#define drive_nfields	ARRAY_SIZE(drive_regs->fields)

Let's have here:

#define drive_ofs(i) drive_regs[(i) / drive_nfields]

> +#define drive_reg(i)	drive_regs[(i) / drive_nfields].reg

and here

#define drive_reg(i) drive_ofs(i).reg

> +#define drive_bit(i)	((i) % drive_nfields)
> +#define drive_field(i)	drive_regs[(i) / drive_nfields].fields[drive_bit(=
i)]

and here

drive_field(i) drv_ofs(i).fields[drive_bit(i)]

?


--lbu41cTPydjuH3oP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZI0MACgkQFA3kzBSg
KbZG0A//fcEETh+AGhpx/ij8luvlCzwCej6crI7fNHGTEHyAO5bN708GsqqojeJQ
0DB2KxxMbadRi/Wg02/3aKaJDYUdwPfkmfkCd0rtRPDUWSSqvEw/eYB80lPbw/x+
ZoiAHd6B15U+ZpXH8Vqh33gu+XuWXjJQu6j3BZtDGsnb5BVWgqZDPAZQ0+AO+JWw
SlwPgpYqZD2i4UjXaV/utC80MNmfsrdwcLMjMCC7onPYSeB+o5SAlpvukYHHd8gZ
npLuhG4He4jbfIoUhv/J9PIYCrQhRbtUUy0jsWntSOSIJxiu4LbcVgBnhL44YaTc
3fykVgcQTU1VWSG97QYjZf3wbcCnmMyu7FcbF+YqqrvaFmVr27XtHZ8F1EiMmBm7
u/2C8TIFXu6mysCwc8/gPZNeNpxcSzKiit9AlhMhhAwVg8Hnx31TnfraIzjOZ4j2
t4xuGxa88yPlFZMPNZj1UbAwGyhT9kxO2wYbS2slVox1WMCXCa9BH8DR7OGmau9s
WPnuXrFGej6ioGkV4CTUQK09yDVoemPLOmq+EOcmXmV/BLRZ+YuNYmvN9uwX+NCm
/SaADnpWD1sVn/3RZVbHcOaUbfwGhQR0o+ZetyvwVLUPfM8YxL5UGEFJuND0Dh4p
feSlLsILiMpb+ZrkE6APubqTsDBA20FEdol0z9d1/y747YXcDcs=
=xos/
-----END PGP SIGNATURE-----

--lbu41cTPydjuH3oP--
