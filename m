Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441D36BA0BE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 21:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjCNU3i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 16:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjCNU3i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 16:29:38 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F3C2BEED;
        Tue, 14 Mar 2023 13:29:36 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 967191C0E01; Tue, 14 Mar 2023 21:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1678825774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nJ8ZoDVBp9N2S7vrzr0YU2PolIoNsLTp2XBOlcdlIPg=;
        b=BkSCCzU02feAm65GhqP0GWWI8z0CCoN7pMIy6PMi0oONerZwtL+8LOaHFoXDg170UqC2ce
        620SxtcllPMosAjZWojyNv5hUk0dwzSnXQINwjmz2i7CDb+vCw9i6S3SVNGZz0gqmuIJJ0
        vh4ZX7ptDoWwZVC36ZeE8TYuY/aPJ9k=
Date:   Tue, 14 Mar 2023 21:29:34 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Felipe Balbi <balbi@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] leds: Delete GPIO LED trigger
Message-ID: <ZBDZLgb1+2aMTE7A@duo.ucw.cz>
References: <20230314115940.411939-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tKhNwwcLaBcO0xrj"
Content-Disposition: inline
In-Reply-To: <20230314115940.411939-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--tKhNwwcLaBcO0xrj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The GPIO LED trigger exposes a userspace ABI where a user
> can echo a GPIO number from the global GPIO numberspace into
> a file that will trigger a certain LED when active.
>=20
> This is problematic because the global GPIO numberspace is
> inherently instable. The trigger came about at a time when
> systems had one GPIO controller that defined hard-wired
> GPIOs numbered 0..N and this number space was stable.
>=20
> We have since moved to dynamic allocation of GPIO numbers
> and there is no real guarantee that a GPIO number will stay
> consistent even across a reboot: consider a USB attached
> GPIO controller for example. Or two. Or the effect of
> probe order after adding -EPROBE_DEFER to the kernel.

So... what? If your system is one of those with single GPIO
controller, you can still use it. If you have modern "complex" system,
your userspace can find out desired GPIO number and then use it.

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/leds/trigger/ledtrig-gpio.c | 202 ----------------------------

No. :-).

You'd need to delete it from Kconfig/Makefile, too.

But this is not how we handle deletions.

Likely noone will miss this trigger, but correct way is to mark it as
deprecated / broken in Kconfig, first, and see who screams.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--tKhNwwcLaBcO0xrj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZBDZLgAKCRAw5/Bqldv6
8klMAJ9RYjzXTBTo4QfS2v/LhV6OgE+IRQCeNI5XEn8aDS6eILWYfiQJoWARBEQ=
=qCyO
-----END PGP SIGNATURE-----

--tKhNwwcLaBcO0xrj--
