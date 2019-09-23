Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4F3BB561
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 15:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439577AbfIWNe0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 09:34:26 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46915 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437017AbfIWNe0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 09:34:26 -0400
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 109BA240008;
        Mon, 23 Sep 2019 13:34:22 +0000 (UTC)
Date:   Mon, 23 Sep 2019 15:34:22 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/3] gpio: syscon: Add support for a custom get operation
Message-ID: <20190923133422.GB57525@aptenodytes>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
 <CACRpkdYGCWc007s-9_jvX2aKuZv8fTfV2UX-qBBi7WtePABMVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline
In-Reply-To: <CACRpkdYGCWc007s-9_jvX2aKuZv8fTfV2UX-qBBi7WtePABMVg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 12 Sep 19, 10:18, Linus Walleij wrote:
> On Tue, Sep 10, 2019 at 4:29 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
>=20
> > Some drivers might need a custom get operation to match custom
> > behavior implemented in the set operation.
> >
> > Add plumbing for supporting that.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> Looks OK but as noted in the other patch: we are accumulating stuff
> in this driver, possibly this syscon part should just be a library
> used by individual drivers that can be switched on/off with Kconfig.

Looks like adding support for a custom get operation would be good to have
before moving to a library then :)

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2Iyd4ACgkQ3cLmz3+f
v9GTRwf/QMRbnfLKLj5Ype++iShGpT/O1GGoO4kldJ42cfZrNo0mFTnoqV4lxnRN
JZl4o/S2yv1YNbTwbZu3Cz5AsD0PHfkiQqLyN1rJyKH1br3ixAxMKAfH1cIKSxAF
0u5oLcsXJFawlT33d4XAjC8cezdDVnJi4qqIg/CwW3JLuhBU3OPbUz3Ck04eeCu+
ZqH2GaeJX3IyOHimi3d9wOjCMHV7iTTNsEgwlDJYtnLxRX3xEz8p+MYoFI8rharO
FvyR3+tMzbCYbxQrgAuc6DlINUVQK7hVzB04RA29gnlRyBIh+LHSSDhT5nB5niQ7
O9g4NJbCWp8IiI3Ye9fjNpC/WkKaCg==
=pqWT
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
