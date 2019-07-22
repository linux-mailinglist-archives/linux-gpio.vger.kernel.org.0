Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04A9B707EF
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 19:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730615AbfGVRyb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 13:54:31 -0400
Received: from anholt.net ([50.246.234.109]:56338 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730583AbfGVRy3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 13:54:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 71FEF10A13E4;
        Mon, 22 Jul 2019 10:54:27 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id aH8J_s4S6swk; Mon, 22 Jul 2019 10:54:26 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 4BDE210A277E;
        Mon, 22 Jul 2019 10:54:26 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id D34312FE2547; Mon, 22 Jul 2019 10:54:28 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     Stefan Wahren <wahrenst@gmx.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 03/18] ARM: dts: bcm283x: Move BCM2835/6/7 specific to bcm2835-common.dtsi
In-Reply-To: <1563774880-8061-4-git-send-email-wahrenst@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net> <1563774880-8061-4-git-send-email-wahrenst@gmx.net>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1 (x86_64-pc-linux-gnu)
Date:   Mon, 22 Jul 2019 10:54:27 -0700
Message-ID: <87d0i2eyzw.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <wahrenst@gmx.net> writes:

> As preparation we want all common BCM2711 + BCM2835/6/7 functions in
> bcm283x.dtsi and all BCM2835/6/7 specific in the new bcm2835-common.dtsi.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

For display:

We should probably move HDMI to bcm2835-common.dtsi as well, as the
block has very thoroughly changed.

The pixelvalves have also changed and will probably need to be separate
for 2711.

DSI, DPI, and VEC I belive are the same thing at the same address still.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl01+FMACgkQtdYpNtH8
nuhNHg/+Kh+yQKGTRWQP2MLJ7DLvk+gXyEFVpdOkBDEUZ0VgeOgNkhVPV5v/jS+5
XSmTkAXPSerrT01GwkGw7c8Df/94Jqmt3CXNqI8+35rCYWB6Xj1kw+YhuXzTQafb
7IS6VYlp+3RoFhPGYYivunRWDv/Q2zQt/ML8LxLLQ+xfqlzwsLICZRC88jnJLabs
cJAs22DioTwqgFqmsSCaPLFRe4prW/Y3RV3QNGwfh5GtaYTUQQma/vAPqhfqorlL
zEUik/0nY7/n+j2lDf8jHDZ4wEbGz6miKcIu5NuBBxYw09iK3vDzDnPfKjNd3GZN
NVnyML39lLAlZfPYYKlGLb1k9brDXtdCWvHAJ8evrpA6pg78QNZgVZPPHpJ21Dxj
MUEHw8ZaTrDcj015kmDVEntQrdMrEJz74U/V+kSVLYkmxMwss3zl/oh7c3scZwCU
/ED57Gfl3L6jusiZExmvgmoirrg3B+Nv7y66LdjHGA7o/eTSfrTcfXz2AsF5D+ym
25ZYalODm+22UO/Spxoak3hP67CO8L9iqU5Nm+7PTVZwuMZPVcwOz1+2taiqXwrT
iYheIGIxYFZorb+ojg7NMDJf7i0VWGVcn+/D/1+FBlV6aNyfqU1bJcs2BNRv1pXK
aWm4pX9+rl6ylR9VuGwb6GCGF4y2vPHDDUWYXIaAS91HaVeDcSo=
=oOH1
-----END PGP SIGNATURE-----
--=-=-=--
