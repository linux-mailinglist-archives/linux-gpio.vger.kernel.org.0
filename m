Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253C42A67FD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 16:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbgKDPpt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 10:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730391AbgKDPpt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 10:45:49 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09843C0613D3;
        Wed,  4 Nov 2020 07:45:49 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id x20so19693035qkn.1;
        Wed, 04 Nov 2020 07:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C8okzA8sOEsVWkQrRSpAG+sSYpv4C493zXUAbeEuuQY=;
        b=rRqlB9ZpPy/2Hy7eHiQO/sGV+iRjSpgsKdWo/swHyGrKVleb30VLORtZOc310PH+9A
         Jyh4xqi5xQHPWSMCP3AcG4vc1YYBuZbeQ4/iAAAhJbG26cUJMPehbyuIS1uQ0QkFcpKI
         MYBQuDKfk+FkSDqeFzkr3R48kqbMyg81lvmsUGAZ7tjeBIL+2x7H2KwybXFOavy2MC6V
         lNb416Rhsy+zleqp6Uv5lgX37Of9I7tncqUp6nGfdTjTdd6+2NGT1mAyBQo2FLKLxi2y
         Nl5xTcYGb4td15vP9xFRqLqK86c7oeFhhyBKdoJWVQLPkjQsVcGjyR/beQ6OcgDBN4x4
         xgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C8okzA8sOEsVWkQrRSpAG+sSYpv4C493zXUAbeEuuQY=;
        b=IRHjepQSDkdVWRRl2eDHzH7yPWhXKcY7Lle4G0yXVpHP9rh9/ZIoiSahFkbXqCztU8
         Em/w0l2rpRDBavsMzQTGxMTIAInDRql/NE/5DkOBTyRw+GedqR4ixN3mCKTWhqV1UU9V
         /qzzAZBj7yTsIT8FlKPqrNBH58wt9WfA6p5Slew06EqPyhtYa4wXuIqCuSnN6Nol5hLn
         M1t/9Diy8SbYwUNrXrEzKIiJUPkOwz/AFyzi6WTonlyS22nh8fHrLp80r31GXYgTJ+uE
         kBjxMTdMw9bPxktIqQYmOEnWHSb8elYiXNLR9QN5BzdK2JJ0GIpvs74wg57hscTFCyA3
         TQHQ==
X-Gm-Message-State: AOAM530WWkowTZwevpRER8IZuHsmPVSVidxnklIda+SK3k2/OMwkM8hH
        7u0x7xXZAcTTQoCaNbLzank=
X-Google-Smtp-Source: ABdhPJwVHWafu664QVPMYQHX/8Z/kOpGMg2bsN4nwbXGYjxjzeyzjZ/BXENA0xuD/9Kpp2xdxMO+7g==
X-Received: by 2002:a37:9b0e:: with SMTP id d14mr1249249qke.168.1604504748224;
        Wed, 04 Nov 2020 07:45:48 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id r16sm2618588qkm.1.2020.11.04.07.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:45:47 -0800 (PST)
Date:   Wed, 4 Nov 2020 10:45:29 -0500
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Arnaud de Turckheim <quarium@gmail.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/3] gpio: pcie-idio-24: Fix IRQ handling
Message-ID: <20201104154529.GA406355@shinobu>
References: <20201104152455.40627-1-quarium@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20201104152455.40627-1-quarium@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 04:24:52PM +0100, Arnaud de Turckheim wrote:
> This patch set fixes the irq_mask/irq_unmask functions and enables the
> PLX PEX8311 local interrupts.
>=20
> With the current version of the driver, gpiomon (from libgpiod) or a
> poll(2) on the sysfs value are not working. According to
> /proc/interrupts, there is no interruption triggered.
> The main issue is that the local interrupts are not forwarded by the
> PEX8311 to the PCI.
>=20
> There is also two bugs:
>     - The IRQ mask is not correctly updated when unmasking an
>       interruption.
>     - The COS Enable Register value is not correctly updated when
>       masking/unmasking an interruption.
>=20
> It seems this problems exist since the initial commit.
>=20
> Arnaud de Turckheim (3):
>   gpio: pcie-idio-24: Fix irq mask when masking
>   gpio: pcie-idio-24: Fix IRQ Enable Register value
>   gpio: pcie-idio-24: Enable PEX8311 interrupts
>=20
>  drivers/gpio/gpio-pcie-idio-24.c | 62 ++++++++++++++++++++++++++++----
>  1 file changed, 56 insertions(+), 6 deletions(-)
>=20
> --=20
> 2.25.1
>=20

This patchset looks good to me and fixes several fundamental bugs. I'm
going to reply to each patch individually to give my Reviewed-by tags
for the benefit of those picking up the patches.

Thanks!

William Breathitt Gray

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+izHIACgkQhvpINdm7
VJJIXg//S/TIeMk+G+YlFHYyHYn0FwgG/2/ETVMgMBh5BG5ngJvf7lP08G1ntMMY
WIIr24GHIpyQn0fREOhtAO0vScusaXizpDxPkZit3OD7OYnO/HBb3cp4+dsC9yi/
t6YRpyruNiy+fObf5TYtFpg8SgSlfXe1djS03Ql1Ofaxjdj3CoV0lZM5iWRhrwJh
PDbWbmBHpyRlmn8m+Dzt6Uqjd6xbwhkb7k8YvUMuyf/3my4vftYPSP9EYBj7DXnE
a3Lg0wnjQ17rEpBjbpDhdpmGvhRXd0rek4SdJiX5L2c9wJYcUxVEyUmUrWUjUjZp
r2So/+9BG97wuF5UdDBr9A2KkXtBbrFP2j5Q9P2aMP0LWM/f+EXO6liN3aTrOh9Y
9U7sSJ5h63YccLAyn5p1TJWsvW5zfe9OxzhAPQpUL9AFAz7w+4m/h0pqWsQacuzS
NJkgBNMYErydifHh25PMN1AI6aeqomIS6R8Oo6f+0usSjiNFTm23WlZt282SlGtX
DMKFBHZemVn68xU6dWVzVTXS8Urx+AHOL+7lPdNZkvZh6ghdU2RH/ZoRWbLJJo9F
MFZ1tZTn7UXkcVLTghhnrfCPOvfQ008k0FhtiMsgEj3+VTlHFbQJy4WHPHTDseGe
6HUn0ialdpNlHwbJRz2j0FHz23+jj7mIgJpxK2yiAy6cFh5J8Qs=
=iy2L
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
