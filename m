Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C854934F12A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 20:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbhC3Soz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 14:44:55 -0400
Received: from www.zeus03.de ([194.117.254.33]:57768 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232866AbhC3SoT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Mar 2021 14:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=O4VbJF+YDNgsNTzgNn0mfyiakjki
        ADsY05pkHFzVjsU=; b=kUI/6wuYWPvLhp7/WmUzjQsFjPaeCxmR6xbgQclkZhYV
        vKJO0w4YmNXdQb0/fk22a2yiv4e7M15XXg1LtaRaXwrI3CEsRTNPzC+FZAlVMA3w
        6gAvw3SyqffiUnNgRkNSBWySVaGxF3oKAArFtO1qIkHkIABZZ0LYPbkuqe4ZzBo=
Received: (qmail 301911 invoked from network); 30 Mar 2021 20:44:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2021 20:44:17 +0200
X-UD-Smtp-Session: l3s3148p1@soqxYsW+eJEgAwDPXw7aAOihkzMkaJHc
Date:   Tue, 30 Mar 2021 20:44:17 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH RFC/RFT 1/1] misc: add simple logic analyzer using polling
Message-ID: <20210330184417.GA1001@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20210330085655.12615-1-wsa+renesas@sang-engineering.com>
 <20210330085655.12615-2-wsa+renesas@sang-engineering.com>
 <c74ddbd9-900a-0817-4c16-86f7cf9d96cc@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <c74ddbd9-900a-0817-4c16-86f7cf9d96cc@infradead.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +snipplet which analyzes an I2C bus at 400KHz on a Renesas Salvator-XS =
board,
>=20
>    snippet

Thanks!

>=20
> > +the following settings are used: The isolated CPU shall be CPU1 becaus=
e it is a
> > +big core in a big.LITTLE setup. Because CPU1 is the default, we don't =
need a
> > +parameter. The bus speed is 400kHz. So, the sampling theorem says we n=
eed to
> > +sample at least at 800kHz. However, falling of both, SDA and SCL, in a=
 start
>=20
> Is "falling" like a falling edge of a signal?

Yes. It seems I should make it more clear, then.

Thanks for the review, Randy!


--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBjcX0ACgkQFA3kzBSg
Kbad6w//X72lK6IZh0vnjMP39emDS43pbDRSr2sNWgNjt+Hfd9TF3VBu8grY79ob
7ywAAgQ7iBwCuiQbwGZNV+leIxIt7ENioZZBsMCV4OiiWHfn9LC5gCUWW2OWCqtO
H5dLB+sSE5huaYqbzWO7AB0vgH1PhPdMLzJEIvkzkGpV1XcaYJMRyfLcNnUkdjFy
bUI2OZZVqeWlYxmyL3ngVk7SvMO79le/2KQYQ65ZI7qaQOprvcg6AODxgqzTQdbi
B54K8coC1DhaKH7XWrpZNP7nkDIVC8TmE1otTmt33WvzExdT9rlO7R3WJ2VvKbOp
HCD2o4lYYGyXvN1cWAD5CcohuFS/NZRMdOjr0vvZSWOD7bqNqQ3yL0tLhCo2jB4W
kUAZKozrpEZfgxFZcEnB6m94ZqcQgSoVsH3ZpIpXkTTUAU7uI4B+3unzTguAve5T
jQ66PoEaLnFc+e/wjg1WK0mjL94dVFAC7noeGIwQDvXpTss/LRtAbtkVtMciU+Dq
k+RdjCWmdoCVlPIDZKcXxhr3U4HbCodh7g5LITE2QZdDUteY9cZjMP1y1xRV78zd
XqcjokDceNaRvStJz6s3WBGCxSj8AHeI5xuHC8LA7QfnSm/wGyH7dHQrRD6aomb/
IzPW7QPR+6tzDdVXPpP65sHJ/Ge/5v5GP2sMMsL7QDMnTwrmXKA=
=wZ8q
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
