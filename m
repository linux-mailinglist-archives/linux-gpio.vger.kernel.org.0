Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B651838C6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 19:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgCLSe7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 14:34:59 -0400
Received: from mout.gmx.net ([212.227.15.19]:34145 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbgCLSe7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Mar 2020 14:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584038093;
        bh=f56xVHIr6zr2PZHI0TS7LUqKLBAli/KY7kMif9yhxy0=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=V4idd58raCGnnFUXYwiJAquLjofThszFDTGpDCYypEnYHfbhB7mP64BSV32P2pr6k
         ztzTuqHMWIsVXjIbSzMvgFPgrhn48OFl1tYcNHQtAJXj7GG78a3o3DZv/Pzu2YQBYm
         kWVNn7zRD90TKX+woWpRtnMUCcH4bTm7Wy+wS4Kw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.34]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mdeb5-1jlnUC1PTV-00Zejg; Thu, 12
 Mar 2020 19:34:53 +0100
Date:   Thu, 12 Mar 2020 19:34:52 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: driver-api/gpio/driver.rst: fix code blocks
Message-ID: <20200312183452.GF2376@latitude>
References: <20200312180650.1365059-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Content-Disposition: inline
In-Reply-To: <20200312180650.1365059-1-steve@sk2.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:4djGkxK8HRts3U3sv1OSqZPHYAc9JiWcsVUMAEWwSiJThefE6M+
 3Ezy8jEu8zfg7xKAal+KwWz3gjK3FhwyEAq+kRaNwmJrjKY84WFKSsOGveklpff+zkbD8bs
 ygbmt74xP9CLDdxTdGJbQG3uAN+NwxZ/I9B1JhPe0F15fwQM495YAlczrPICqL5f+B7NlEe
 Aeu3653rM46ouuEAVJUkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:307PlKFVLfM=:3EP8wbRYu7nviegtlfHjn6
 HuoFGhZZBF3DzJCP+NO7jRuVdk8CKE1BDc3YNLY07OMrA7PbEtVPq1ADLL/XQkS0UWfhRKG4D
 vMRMgWiPu5usclWPXALb8LM2m5Jvtibf1gZwsXVdDPapLX5Bx4dsbgsMk7P0Ob/OiVx8Vz4IS
 TIZKVlFXPKhmpPYWawlpiYh24cFNmuhg6qx4vJQajXYRhP0gmXCy5Nktc2JWqSOA2c5hKF3yR
 JxUEIfm9emrJWqmHS+7DT9PspgruTIcXcQJRfXZLmBad7q7C8uVgAR9CKgdse5LB1PE79W+4O
 AODaBvFpbE0wmG8jN7OMpASuzZdlwOT4TmeFFwLHK/PzbyUdNOPNT35dg+B6059I6PYqTQGd4
 ptdXqUfIJ8IBV/dIEBaRZn8Teig0axAooO7XY4Hp7pQxJFRxc+y1frOv6bpm2Q7kzoqe+aaHf
 tbeQUB5T9fHb7LQhK6x3Qrn8o10w1mdWCRCVsHaP59GF945a6LvYsEL18JEWsUmKBesfGiFxm
 IukK7Y7eqHGJDweDHUxVlEpIUHW+nJV83I3IiK0BAdZcdqIvvc8PaAL8JRzrUJHRt8LUQj4yg
 5G6AYut50uYROz4VQuawhr0RwIVgnXyA1WBsN0q4XoC7o/Ou4QWLyomTqDhpcqSecwf/YHa1l
 Zz3c7u6eBFPLL3zOXNK2SKZ+9hnYsYV5PYeY9cosRZ3QOH3XBQJax3DsWfMb0LICwZHCYAeMg
 7Il15ezjkbrFRB0cDxbvZcKQo/iXIWYYNUv1CADzU3ky2AKE4aVcVP2oYC/nBhzKF8XfuxHkd
 YfZA52F/qlN8o82v6sYnPNtCuSBSfDKJKgW3NfL9/uhTxqwktxj7UbLm5bQ2a84gyV5M2c0rC
 5/8q/GDf2Et8Y8tdz3qw9yFxJurIieIzq9wME2ik8dStJgDXOhzWsKAxrcA7qFOy1RLnYBbfN
 4a/yOlZRA3BtXYe67WfRFgjslot88ebFApiNjjjrHqRRfgbt6Ft3CpNX7AMSJTLWdyOiHEl07
 bZfljBEiN7kEEFXdvaQsNGWuVuxUizHP47gksdmpMk7Oxcy/2CLchkUt8bYZKulyrmC43YRNO
 ph1O7IhuCcWdoj+k4hKrrfOxMbV3Vzk6y20WiPE/j4i1SFk4QGtBXP5EU54mDEpcmy/AvJq+g
 +emx98YZjW+jfwkeuR5u7d1OQ9fwylZHG7kv3lhyLsrUdTCS1AVs1xtPwMqb7uDcIhCRtiJju
 wcZ7ku/bKlc31GiFq
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2020 at 07:06:51PM +0100, Stephen Kitt wrote:
> -is a typical example of a cascaded interrupt handler using gpio_irq_chip=
::
> +is a typical example of a cascaded interrupt handler using gpio_irq_chip:

Thanks for the patch, but Mauro already fixed it:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3Dc1c8b1ff0a1985d4992f49a5775bbcf6ee5ccfba



Cheers,
Jonathan Neusch=C3=A4fer

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl5qgMUACgkQCDBEmo7z
X9uQ9g/+JakMD13xglbFpTuEQ4Ny5G7da9WPxI7Gw3nEFve3nK3g/iipF76GJYmy
UutgaQ0n18lyy531xH77pkVtLeQlWSh60i6yvMn0BDx0x6rRbJ4fXipAXNw2P4Q1
eelUj7tGn8ZgHCDbeF30zxFd5qm/xGBgw7eIZe7pht+836WspJTSZCNuWh3sEGFW
Mq7UtnKVqx11uTun7sOzp1JUuCiDDe6LXjqGVpORTImU1D27M+Wv5J44sOAXqJyq
XOyY83v7JLHow2RANRH+griJFctFYuRpNHpLVuXp/+ROfaQPLPf2DpMx2CdsQKCn
jMCsLd0wb23nFiO2KFQv3nzlXa0qd8KLmCCKdogul//De1DikOcFMQhvU+0CucVq
uaV5OflNViaJ6UCI6frDPfpFiEl7cFU/3iA3ETqdSkXr0f58P4yVWAG77Iu9zLB8
UNm9vCQoRbV3j3n89cD0oS1u7ET+ejBTWV1XwdQWA9PChIkqmKJYnRmAlovxkrP9
le46kHIugAmGFitu1vaLEZi7BKd6m3NglIzUXevHpUVCB9XTya76rmDOUseOCMqO
32Sl0FcawyMp5A6fhNWBtm20B/s+w0dJEkfMGKdJyF23nChFvD9uNDtRJAffl5QI
PCf6461DD3KaHIkZEoJNX8HsdLk67lHYQemv+BfKk5zQ5zSXd2E=
=MRzh
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--
