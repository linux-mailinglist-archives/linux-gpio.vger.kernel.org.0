Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3791F3E557D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 10:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238402AbhHJIdQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 04:33:16 -0400
Received: from www.zeus03.de ([194.117.254.33]:38312 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238461AbhHJIc5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Aug 2021 04:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=w/gJ095skrfvL1/SC/xS3/zoKeiU
        RiAKx6U1BK1iVP8=; b=FqotDhBXY3RfyNUP808nEQ6IzS93IrYIL4HUKHRRGk8P
        NgbVlGR5Va384cq1XEGSMScu6SJwRuC4E3YBkiKxXu4bw2BMfap3edRYOK5inDIB
        PXfrp3q/gkPrX/UcoUOTznDrD4DCWEeYOKneCz1H5QF5PMqeYWW99JKFpM2iXM0=
Received: (qmail 2221528 invoked from network); 10 Aug 2021 10:32:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Aug 2021 10:32:28 +0200
X-UD-Smtp-Session: l3s3148p1@OmhJVzDJsqQgARa4RbjTAX75MNjKNQSJ
Date:   Tue, 10 Aug 2021 10:32:23 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [RFC PATCH v2 1/1] misc: add sloppy logic analyzer using polling
Message-ID: <YRI5l+T1o3QXZ9Lo@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
References: <20210519132528.4394-1-wsa+renesas@sang-engineering.com>
 <20210519132528.4394-2-wsa+renesas@sang-engineering.com>
 <YKUlbsWhT45l5Zm0@smile.fi.intel.com>
 <YQRZkFApESOIMRmv@ninjato>
 <YQRk0vpo1V709z/Z@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1os8AFbjS/jUEc2N"
Content-Disposition: inline
In-Reply-To: <YQRk0vpo1V709z/Z@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--1os8AFbjS/jUEc2N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

> Nope. Below is the compile-tested one:

Well, then let's add this incrementally once it has actually been
tested.

> > I don't understand the first sentence. And we still need it to clean up?
>=20
> If you know the name of the folder, you may look up it, no need to keep a
> variable for that.

I need the dentry twice, subdirs are also created in there. Of course, I
could look it up twice, but why the computation? The variable seems
simpler to me, despite it being static. Or is it a debugfs rule to not
save dentries?

Happy hacking,

   Wolfram


--1os8AFbjS/jUEc2N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmESOY8ACgkQFA3kzBSg
Kba9nA//eTlnTTsWqLfUhMH+z8eYbUMarQHSTCPKF0lu1mZbW0jteLy7nr+GGve/
28w0aZ6/TfYSw+KKqkoSfCx5P4VfKsvoPmSMQsgUQk2uDFmt3op5zNOpugswv9Em
n2YwQA00XSS4IcHEsKlWn9HTOWs/YxpcrEdWUTsQOgtgt0pZ1Y+pLvcpLyJgKRlJ
Ma3KvRdNkOpdMJMisyqdRaPZZZxx4l6IvCip1MHS/EQXdiqlS2x0HzrNhPqV3O4e
oZPznlwpLLpYGQHEigxPUmzKcpiW/cqTrHMdsg20MsCPYzIJZldh9zxUf6Ba64FJ
OiEnlIRYTXMO6fLYxOo4g0IEBH3QS9dglfXtf4kZCL9I82FX0P72nLxDOrWkpYsH
YH6aMIA+GCA0nMvgLe3Vwu4Tzex2XsRx72BmN/lkBj6Bdbf/lTdt2JAvNyamRYIj
YnOyD8wnzP3aWhfAs1ndCXPBrDL5LwX3cGE8kOT5Z51p1FMW3A9Wv50HrH7HIbey
F9NktrtOOJv2sVaGmHYEs6RDsElrXr4W994V3RY6QmCsoEYwpAUmCeaW0ILybtCF
oLkqB46Fl8rwuFol1dFA/e6ssT7EkkhCo1OUW3TGNFdnLx38SQVciaIUqynEkS4h
BvRUj1bFeoRwfpo4QP+ALQ/kLlTDG0ww5MDIyrHJ2fQyx3pRLVo=
=Wnc5
-----END PGP SIGNATURE-----

--1os8AFbjS/jUEc2N--
