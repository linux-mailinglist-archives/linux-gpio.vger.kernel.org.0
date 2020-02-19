Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91E3C164311
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 12:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgBSLLf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 06:11:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:52626 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgBSLLf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 06:11:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id AF769B11F;
        Wed, 19 Feb 2020 11:11:33 +0000 (UTC)
Message-ID: <5909a00b6f95b14a983ba86297c0af29c290d0c1.camel@suse.de>
Subject: Re: [PATCH 4/4] ARM: dts: bcm2711-rpi-4-b: Add SoC GPIO labels
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
Date:   Wed, 19 Feb 2020 12:11:31 +0100
In-Reply-To: <1581166975-22949-5-git-send-email-stefan.wahren@i2se.com>
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com>
         <1581166975-22949-5-git-send-email-stefan.wahren@i2se.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Z3GG+XB2cSE7kwAK7O6H"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-Z3GG+XB2cSE7kwAK7O6H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-02-08 at 14:02 +0100, Stefan Wahren wrote:
> This adds the labels for all the SoC GPIOs on the Raspberry Pi 4.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Patch applied with linus' Review tag.

Thanks!
Nicolas


--=-Z3GG+XB2cSE7kwAK7O6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5NF+MACgkQlfZmHno8
x/6CqAf+K9om+tz33E8dthw3hcUjPMENZG/D5qLKSIwqgCA1GP6d98AvL391IBEr
mLBaZOEmws5YB70++XxAYPItxq6ictCaK2TGauHaTfLnYaCPUi8OMfssr6wEXXyw
zoyNDg7kMjmJZpEuu2gW6qbmIzaMLkYlEK0mYYm0UhsOihbvGt+f3LlMS606S5Qt
JRjPUgNgE1hUK3HCK8h/MZj3HDvvLZQcz4InESnFEeGU7HI9ozyR+tTu3c/jPQs+
ta6erOveoIYmMU5dmz3dSqknne43Cue4MIhsOzgbzw4nQZ8yp+WVyG+NeTAM7PfR
XnfmnuQtIic21pY5W2uUa9MmtBfECw==
=yuBe
-----END PGP SIGNATURE-----

--=-Z3GG+XB2cSE7kwAK7O6H--

