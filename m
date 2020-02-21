Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFBD01680E4
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 15:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbgBUOzH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 09:55:07 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:38964 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgBUOzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 09:55:06 -0500
Received: from localhost (localhost [127.0.0.1])
        by antares.kleine-koenig.org (Postfix) with ESMTP id 2B01A914D3D;
        Fri, 21 Feb 2020 15:55:03 +0100 (CET)
Received: from antares.kleine-koenig.org ([127.0.0.1])
        by localhost (antares.kleine-koenig.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zsaRwU_lopSI; Fri, 21 Feb 2020 15:55:01 +0100 (CET)
Received: from taurus.defre.kleine-koenig.org (unknown [IPv6:2a02:8071:b5ad:20fc:a421:6a61:ccd2:9af1])
        by antares.kleine-koenig.org (Postfix) with ESMTPSA;
        Fri, 21 Feb 2020 15:55:01 +0100 (CET)
Subject: Re: [PATCH] gpio: siox: use raw spinlock for irq related locking
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kernel-janitors@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <87d0al4600.fsf@nanos.tec.linutronix.de>
 <20200211135121.15752-1-uwe@kleine-koenig.org>
 <CACRpkdYXBn+30HJWU7rbvfkgmwxxiRs7k3H9KWNb-X1WLEgt4w@mail.gmail.com>
From:   =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Autocrypt: addr=uwe@kleine-koenig.org; prefer-encrypt=mutual; keydata=
 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
 6uMoO1VgFtcQHWHTtbSYLQ8YHVFZMQ==
Message-ID: <e5ceaec1-edaf-f039-f4c1-8a4cf27df6fe@kleine-koenig.org>
Date:   Fri, 21 Feb 2020 15:54:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdYXBn+30HJWU7rbvfkgmwxxiRs7k3H9KWNb-X1WLEgt4w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="eXuhYJQwEGxsabst4nQyMNwROx5MXEYLG"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eXuhYJQwEGxsabst4nQyMNwROx5MXEYLG
Content-Type: multipart/mixed; boundary="jAO6r4hM7yb6opjeKNvChGl3fB1QD3xzG";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-ID: <e5ceaec1-edaf-f039-f4c1-8a4cf27df6fe@kleine-koenig.org>
Subject: Re: [PATCH] gpio: siox: use raw spinlock for irq related locking
References: <87d0al4600.fsf@nanos.tec.linutronix.de>
 <20200211135121.15752-1-uwe@kleine-koenig.org>
 <CACRpkdYXBn+30HJWU7rbvfkgmwxxiRs7k3H9KWNb-X1WLEgt4w@mail.gmail.com>
In-Reply-To: <CACRpkdYXBn+30HJWU7rbvfkgmwxxiRs7k3H9KWNb-X1WLEgt4w@mail.gmail.com>

--jAO6r4hM7yb6opjeKNvChGl3fB1QD3xzG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/21/20 2:52 PM, Linus Walleij wrote:
> On Tue, Feb 11, 2020 at 2:59 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koeni=
g.org> wrote:
>=20
>> All the irq related callbacks are called with the (raw) spinlock
>> desc->lock being held. So the lock here must be raw as well. Also irqs=

>> were already disabled by the caller for the irq chip callbacks, so the=

>> non-irq variants of spin_lock must be used there.
>>
>> Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
>=20
> Patch applied. Is this a regression so I should put it in fixes?
> I put it for v5.7 for now but I can easily change that.

I don't care much. AFAIK siox is only used at Eckelmann and we will have
to deploy the fix there anyhow. Conceptually the conversion to raw is
only relevant for RT (please correct me if I'm wrong), but too early
enablement of irqs probably can yield bad races.

Best regards
Uwe


--jAO6r4hM7yb6opjeKNvChGl3fB1QD3xzG--

--eXuhYJQwEGxsabst4nQyMNwROx5MXEYLG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl5P7zcACgkQwfwUeK3K
7An5lQf+MOWHqgxmuf4I47HedK4AozSY0QlIGDg3IAxofKZXo8K8Q/PDALx+5iPR
9h4GzrbHiF0hut7xtyaclTy3oVDWGK1PDI7AI3EWAIcoe8cxs2LDFsNwFk/SOzMw
o3Hzvptp8qPe5LV6Kb2LpPR4eSI++D3u7ywQl+lbkWfFBjQay8xsuE8VuCPJ6AGo
DyJ3I8xVqxW0I87zPEnynBn4TrP8QfyyFI4RRU2HHT5AblZdaccTlLUFlvGVy2Jr
U/cwfrNGXMci1Z9NN05vAK+4ho/jqnRQWy93rLgkX6sQKl2tKYTZj3NQrikgGOoZ
iD6atp9fWNDt7y6hH+IHawrPN6gxAw==
=SVfp
-----END PGP SIGNATURE-----

--eXuhYJQwEGxsabst4nQyMNwROx5MXEYLG--
