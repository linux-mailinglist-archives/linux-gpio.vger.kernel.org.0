Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27FF401B11
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 14:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241644AbhIFMWh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 08:22:37 -0400
Received: from www.zeus03.de ([194.117.254.33]:42860 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239993AbhIFMWh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 6 Sep 2021 08:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=hnOVDPy4wQT6lRUTZ5FlrXLSl7zn
        Bdab4cizSh4j1ZE=; b=WKH029+o7GLhjVCk8AtQpn/E9UYR0rpTyQuHq5hV9DlR
        Atk4/dfrEI77a8f9+82CVjsYNhI5iaOkf5uOT6fZ17rLrB4ZAsLcbDfA/n97ZIRc
        6/3QmDlIPGvo8itGS4MUv6JgO6LZ3F8qd26CDg4sc8UNDA45+IBZrxnHt0MKdD0=
Received: (qmail 470026 invoked from network); 6 Sep 2021 14:21:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2021 14:21:30 +0200
X-UD-Smtp-Session: l3s3148p1@NPMtsFLLBMsgAwDPXwUCAIKQ4fZTZm0q
Date:   Mon, 6 Sep 2021 14:21:26 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <YTYHxkNdtCA0v244@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20210901194549.3999-1-wsa+renesas@sang-engineering.com>
 <20210901194549.3999-2-wsa+renesas@sang-engineering.com>
 <CAHp75VdZt_dDb0YpThfsoqRvWdjfVZT70o=eCJCbThJ9qbD42w@mail.gmail.com>
 <YTXZgNQJj0aI4zuC@kunai>
 <CAHp75VdJZhgqshOQS=L1rKiNZLTqNnrc4FXoJKaNpaQT0QB_Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E2KqYzKKcD6Ak7yQ"
Content-Disposition: inline
In-Reply-To: <CAHp75VdJZhgqshOQS=L1rKiNZLTqNnrc4FXoJKaNpaQT0QB_Eg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--E2KqYzKKcD6Ak7yQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Yes, it means you are not able to use * (a.k.a. glob() function) in
> the shell which increases a lot security and other (misuse) concerns.
> Instead you have to use `find` or similar tools to collect the list of
> the files of your interest.

I see. I don't think this is relevant for the script here, but I'll try
it nonetheless for educational reasons.

> To me it's less error prone to have something like this:
>=20
> while [ $# -gt 1 ]; do # notice the condition, btw
>   case "$1" in
>   opt_with_parameter) ...; shift;;
>   toggler_opt) ...;;
>   esac
>   shift
> done

Ok, I like it. Thanks!


--E2KqYzKKcD6Ak7yQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmE2B8MACgkQFA3kzBSg
KbbM2w/+O/7VKU5zWJjfyw0XWGAcLDw8fPBjXuH4Wo9GrgpyP6gb+OJZB2qxMjzE
uj6lWuMc8LfgpqDdApUBnxjtuVA0IlyLfwVmIL/LXL9q8MtTPC9e2jIzcyjPlDP7
eyZG9NdF/DGC9CE2wCntk+f4tadGxD9L+NX4OwpoPSmk5M7NFIorz1lVBR9AKCNd
nPGCX6FPfD/bxQLFj5pCA/f27kWzY371OlU6ifWuX6rLUwwAIrKsA0UMwRBMQ88P
shhqnOt1ELS08IubdTw4Zp5sxQNMhIqhSm1Iaq0A0BcSAXTVbYnxYpC+pAHbLqtm
A5qyUed7/bCNEKa8WzdmL2NDCtEJi6bB/2dMNdc7BzQqwHLqEFHfYM2IPbYwADzJ
4YQm0OjVoKxOTLIipkS0ND9utid7b61kjfMA/2+uTWc/CgzU8F7QyKWiR7NxKmVl
BAX1A4Cx9fhDmKMxucwCbU5avNjPHOFP4j8s6lKt8jQU2uAUh+q3o3pqXOLXjwXC
hr/KLhQP3JGHT5FxgAyzfurk8aCGvdGWGsydveFiR6jfM7QnEdxfBeoxEaucgRGU
Lk6xbKOKve7usethcKWVGfuskcvtOcLs2aNLErprE8IkX3zeML5b8WDdlaVxsi9r
xSUz7Mb/9Rgb1cuzQOodnAqzdXpnTG8nbG873XbY8c6HEw1XGaA=
=g5mu
-----END PGP SIGNATURE-----

--E2KqYzKKcD6Ak7yQ--
