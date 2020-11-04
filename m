Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE85B2A6801
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 16:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730424AbgKDPrM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 10:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730274AbgKDPrM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 10:47:12 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1A2C0613D3;
        Wed,  4 Nov 2020 07:47:12 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id 11so93394qkd.5;
        Wed, 04 Nov 2020 07:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l/2D/bogFpKCDWQ5x1wkO00y8+j6f9nhwSfZULOrkvU=;
        b=gzfToeJwioQ7A9lhYGlwofo4JyXtEs0/dGYXwE87/5tVtGN2y8Et8Fmoqq1na+xLTL
         fbU8/k53x99Y9n+v4D0lD94Qsml+FovoaIL/xscyKfpEIQqLbq1xGai29hhtqSSVenZe
         07M9xM/Xfmc25TjTm0sSTsgYVdWWiAQtKi4UMlhorMsb1QPqb9DJE9gO3HJOmNupeLY/
         AEIVvFSJUdtNuJGlfZNdzfhS+0hFjvdbuF9ao7iNRW4Mc1kH+Hv1XEFmV568eFcXv749
         Ystx/wPbcDeDimDMDJ+t9fXVdQ1eAx3KGCX5Gy6lvjeFQutj48Vc7lvLUsERfKIu5nvC
         IQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l/2D/bogFpKCDWQ5x1wkO00y8+j6f9nhwSfZULOrkvU=;
        b=OzY9cJheVSFktFZT9uHYIdjk03yTXFCF3C75txX219touDyKcLaEESi8uuAnVzm0Wm
         lZgALYilMz6IiZ3FFx9UMmeKlB+CDaIRoRTF4pXZWCK8mRnUcRW+MJjb+YfMVuOCR1bF
         RO6QW983fANpDVdotJDpjIjREVDrdPmS43mex52FqqH7Y7+48aqk3CQ7s4PQRlwiHC+4
         4EY08qllaKWJKde2B3r7WIatRD1jEUWls4gaYQN3RHRQRlZ04SFl15iwejKUbDv6J9j7
         mVF9WkqrgGN8p/6hAGO3s5UEw9La2VNaJHWOHLmP4oXOtRo48OOa95lTGz/QoCH7EVTf
         3jig==
X-Gm-Message-State: AOAM532Ae6MUQQDwmpK4AaWbFrIogW1RWdw7CS00IEVdmaPr6rjuhvTE
        7LWIV5sWRkOuLRR/1Xe+NvU=
X-Google-Smtp-Source: ABdhPJz0rypOVrHg2msNeEJRs2LsorCYGS3LEOV0DGaFMfccmfv5kb5F8wBhC0kWyZR8g3CwN7CT6g==
X-Received: by 2002:ae9:e508:: with SMTP id w8mr26662019qkf.110.1604504831072;
        Wed, 04 Nov 2020 07:47:11 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id z69sm2840719qkb.7.2020.11.04.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:47:10 -0800 (PST)
Date:   Wed, 4 Nov 2020 10:47:08 -0500
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Arnaud de Turckheim <quarium@gmail.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] gpio: pcie-idio-24: Fix irq mask when masking
Message-ID: <20201104154708.GB406355@shinobu>
References: <20201104152455.40627-1-quarium@gmail.com>
 <20201104152455.40627-2-quarium@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline
In-Reply-To: <20201104152455.40627-2-quarium@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 04:24:53PM +0100, Arnaud de Turckheim wrote:
> Fix the bitwise operation to remove only the corresponding bit from the
> mask.
>=20
> Fixes: 585562046628 ("gpio: Add GPIO support for the ACCES PCIe-IDIO-24 f=
amily")
> Signed-off-by: Arnaud de Turckheim <quarium@gmail.com>

Reviewed-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
>  drivers/gpio/gpio-pcie-idio-24.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-id=
io-24.c
> index a68941d19ac6..5ea517416366 100644
> --- a/drivers/gpio/gpio-pcie-idio-24.c
> +++ b/drivers/gpio/gpio-pcie-idio-24.c
> @@ -339,7 +339,7 @@ static void idio_24_irq_mask(struct irq_data *data)
> =20
>  	raw_spin_lock_irqsave(&idio24gpio->lock, flags);
> =20
> -	idio24gpio->irq_mask &=3D BIT(bit_offset);
> +	idio24gpio->irq_mask &=3D ~BIT(bit_offset);
>  	new_irq_mask =3D idio24gpio->irq_mask >> bank_offset;
> =20
>  	if (!new_irq_mask) {
> --=20
> 2.25.1
>=20

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+izPsACgkQhvpINdm7
VJLTXhAAnRsqPsc2j18Y3YFH6nkX3Z1WbmixAbwJUGplfH1UfhdPzoExsXmHCmoU
uiDdAS3H8X/+IsIWatO70+Gy/n637PCmJ1830ASPIaXS4F18mseXkTxJginY0wdU
Mk0wEQPlKfZQhxrWCRJbEXwMmjxGuMKvx6ZnwseyaKo43MUREfTHRxPi+t07SMUP
0rQTdbCmBZ9yIeJYBsrEqdM/QrWVld0ANPlwwZzIIj4M77dOtopb2H3KvYg0q9s5
98t2400Fxk+Kn0imGDHkBRaKx6HadDAzDZhPoDekBfSk3e24W2ayg/fLglPH57WQ
c+BH/TAEASX+TutcuxhDan4O00cVMllBC9lhULu/aLpJs0iAd0RDVTptU8v6JFyk
Q0DavX2uh2LiB74XObW1BrkyGFnviY5KdnWxMxMzGbGpyzzEvvVi6qS9C0PFgGYV
d5WYmG2Ocv1rl4LqW7jvGR0UKOXnUc5Kneu4QzC9+aIkOiKWTqbxTCV9gab8iNOy
5XNASL/Jc3jLEXUcGka3x+ynUZWWmo46MNgB5DjzK4a5joI8oVdSDcU3R2+MPU9R
OV/AhvctVEIbikHtw3T33Dwtwo3CXSd8rJvvZC0gCNOyJZ36wt6kqyRbvj4cNElL
TmexmmJySSDfX0EvFth8yPxSHkzX0wrE/SR2xgy8MS2l95RK3do=
=3V7R
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
