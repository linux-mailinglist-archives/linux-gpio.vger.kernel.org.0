Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855E5401737
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 09:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239864AbhIFHjy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 03:39:54 -0400
Received: from www.zeus03.de ([194.117.254.33]:48258 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239689AbhIFHjy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 6 Sep 2021 03:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=MrtIgEqDkP9PbcSgnHv2XSS0bpGz
        tTDcdECCVa9O9FA=; b=ylvkB/KxH1isD1m9O2dXKZxP1rWYMPW88aiGdTBZQYMO
        mZKpfX7lS/vDK09/Uf8fH4/twq6gUCpbXJfrmZVXg4i4xH2N/zjeS0t/MHEke/fE
        ZQ/Tq7no7YphnVYNX6qyoCBSwpevkk6rm0SaOA7j7y9X56Y1yk6OXbUNCKNmiDk=
Received: (qmail 376496 invoked from network); 6 Sep 2021 09:38:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2021 09:38:48 +0200
X-UD-Smtp-Session: l3s3148p1@QuBTvU7L4qEgARa4Ra5MAc3ZBYWvSFq1
Date:   Mon, 6 Sep 2021 09:38:47 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <YTXFh46EBghq8lyq@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20210901194549.3999-1-wsa+renesas@sang-engineering.com>
 <20210901194549.3999-2-wsa+renesas@sang-engineering.com>
 <CAHp75VdNnvUfMEL3gMrJOFix3AATL8LAiU18LXJJVL77feBRow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nZd6jj4n1W97kInJ"
Content-Disposition: inline
In-Reply-To: <CAHp75VdNnvUfMEL3gMrJOFix3AATL8LAiU18LXJJVL77feBRow@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--nZd6jj4n1W97kInJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Any reason you are not cc=E2=80=99ing me? ;)

Yes, your reviews are too strict ;) No, seriously, since you always
responded to the patchset anyhow, I didn't see a need.


--nZd6jj4n1W97kInJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmE1xYcACgkQFA3kzBSg
KbaaHg//a7eS/p81rpVV4WePIp20JdOU2fzyFoWgN2Y2N4Fx+RaDC5AdLmHdR63f
ay4oUciRKbidLa81HeV3LRunislGiWA5BX3ivwGXXTW5f2pi8dLjVHnTE/5qO9S7
PtaYvanG0+4x9Mg9Vk4I4mcFUGoNtIbiEaaGK9xfwSrq7huhvql3VvW5rYDrCSO2
hSJSMg+C6oP0WiXSHHXuUteXFpx7AcxquMEc37XMm4pUndvpXv1iY7QkkWZGtpcF
GD+RX9+cu7bPddxIBGIp2ROwfL4YUUbjKhoXiXAftxc0DtU585t6Pq+b9f1Ot3g/
E9TRwuiEjQAZYATKvgx1gz/qNdSKODtVg9Pngfqi/IYdNz3qH3528w/ATuKEcjmb
dN5VCgvL1e3LZ5u+HJES2pmZfwAiYqAmC2vJk0OAG4svl7M0rBT2fNYHHvice5+D
8gN/FbAjpKKXhlgckuV6/iYAdDICNdGEpxSWr6AQmEuk+nWQ8CDqguX+xQi4lkxb
oJGi7Kfh5his14Og6WcTl2X7UjrqNHuNOH8oHaDGWySQxH4lhb/tsBShfzFJHbFa
PSQj+MpL+w4utavUTyCATeWrdXprnvEzGon9x2dkpqu+TOcM++IQpyuK0E+2Ti+0
jQEONDBjnFgY6SAOQCDGcANILj3EhMiGolp4D+YjPSS6GkiKRTg=
=7aY7
-----END PGP SIGNATURE-----

--nZd6jj4n1W97kInJ--
