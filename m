Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233D2414A80
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 15:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbhIVN1A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 09:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbhIVN1A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 09:27:00 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C6DC061574;
        Wed, 22 Sep 2021 06:25:30 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id t8so6901043wri.1;
        Wed, 22 Sep 2021 06:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y36K6bPDxpy/zwfLP47l15jg47JT44a6c0meP9UjwOg=;
        b=Oi0Vk/H4LR+Mt1fhkW1VciGkU3+lAL1M/G9hlORMYYPJJtP+0mgmDUjKaaQFSZNyJ2
         NExaWa4D2yKwnWvcIw18vw4WZeE8DyTxgBvZ8tkz7dccCzMoXsTZ0ZYyco0Bc0VQPZOW
         yNhBfmcGaJoW306ElKF1AbPgCWmOxzqHA4uA1sk8DuBhtShOcZFeAe5C+OMZYK25/O4n
         EB2V3oJZlxNqZAtn0FsRhie7GYQryaAvKed24kBsChZweXmCTCwHa0wkQYV5ra9e/Pzw
         ib8+S5KzxlDpAlwDSjQJAEIWaox6/fgVpxfx8/6lg2RdQu+C7enEdUN/ObQK8rBg/TBG
         ar2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y36K6bPDxpy/zwfLP47l15jg47JT44a6c0meP9UjwOg=;
        b=lqD6GTkKhy6L85PPEPTn2lOVaJJtdbQXLTgIgbVAm0r/V2s0ud+gIDZv9N5xUS2Uf8
         12PB7he4AE480eS1LihogQ3/wU73ZCRBms6TxjF8uCa/EqRFKW+6JCsjEDxcaSiQpUZi
         quODCOxNJ9InvmEF3SlXXU+THFz9VzPbNgb9DxjkiyriQzHstNNdQInEqUt/KcZcFqxn
         6od6VPM/52b1CeW6yD18sLoVwNdTBSBg+LW2zKC59ns4mJvjle9WggkXZaRb3u8EOLbW
         uQLVD/TiU4Gft8ueMFfrsNF9hYv1cPZymo9AKY+ZnLRkimHd5e5LO2zD3Kd7NtZIWRF1
         F/zw==
X-Gm-Message-State: AOAM530m+pa2W8B1rRimzSNeQXH/HyfFXKEhJXVXSnMavWYkENNE3G+l
        3xZ6eWdPRLY2DpcolZHOjcc=
X-Google-Smtp-Source: ABdhPJxklTnpEoamKeDaCyghdtkVhqfhVkLVAeKdHXtzzEL72GVxr1UfMNwcYhs/cXc6CEN2M0hjxQ==
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr41734333wrn.389.1632317128992;
        Wed, 22 Sep 2021 06:25:28 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id k22sm2290355wrd.59.2021.09.22.06.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 06:25:27 -0700 (PDT)
Date:   Wed, 22 Sep 2021 15:25:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Prathamesh Shete <pshete@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, smangipudi@nvidia.com
Subject: Re: [PATCH v3 2/2] arm64: tegra: GPIO Interrupt entries
Message-ID: <YUsuxvLWgVZpjNpE@orome.fritz.box>
References: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
 <20210907073224.3070-1-pshete@nvidia.com>
 <20210907073224.3070-3-pshete@nvidia.com>
 <CAMpxmJWyepTvUQEAVDB2b=uocFTq49=yRiCXrxnwyLMe7LY_1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TZWXuD58jiQlRBqH"
Content-Disposition: inline
In-Reply-To: <CAMpxmJWyepTvUQEAVDB2b=uocFTq49=yRiCXrxnwyLMe7LY_1Q@mail.gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--TZWXuD58jiQlRBqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 11:29:21AM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 7, 2021 at 9:32 AM Prathamesh Shete <pshete@nvidia.com> wrote:
> >
> > From: pshete <pshete@nvidia.com>
> >
> > Tegra19x supports 8 entries for GPIO controller.
> > This change adds the required interrupt entires for all GPIO controller=
s.
> >
> > Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 49 +++++++++++++++++++++++-
> >  1 file changed, 47 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra194.dtsi
> > index b7d532841390..c681a79c44ec 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > @@ -34,11 +34,53 @@
> >                         reg =3D <0x2200000 0x10000>,
> >                               <0x2210000 0x10000>;
> >                         interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH=
>,
> > +                                    <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> >                                      <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> >                                      <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> >                                      <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
> >                                      <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
> > -                                    <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>;
> > +                                    <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
> >                         #interrupt-cells =3D <2>;
> >                         interrupt-controller;
> >                         #gpio-cells =3D <2>;
> > @@ -1273,7 +1315,10 @@
> >                         reg-names =3D "security", "gpio";
> >                         reg =3D <0xc2f0000 0x1000>,
> >                               <0xc2f1000 0x1000>;
> > -                       interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> >                         gpio-controller;
> >                         #gpio-cells =3D <2>;
> >                         interrupt-controller;
> > --
> > 2.17.1
> >
>=20
> Prathamesh: what are the changes between the three versions of this
> patch I have in my inbox? Please always include a brief list of
> updates when resending.
>=20
> Thierry: does this make sense to you?

Hi Bartosz,

the following patches from me that you applied earlier:

	[PATCH 1/2] gpio: tegra186: Force one interrupt per bank
	[PATCH 2/2] gpio: tegra186: Support multiple interrupts per bank

are replacements for patch 1 in this series, so that should no longer be
needed. Patch 2 of this series (the DT change) I plan to pick up into
the Tegra tree for v5.16.

Thierry

--TZWXuD58jiQlRBqH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFLLsQACgkQ3SOs138+
s6H1IxAAs2MG8Sjg2u/ML2lglBekLE+MEl+e+TGzJPTVmckSesk/sbcdkPqenHso
frfGukBgQy4nBeYaF0sYcuAvBctIdiRjJSG33P0SOUDM5eihF9PcEvZQNXY+rLl6
HquKqkz1qhyDTHv0jaooSWStOyittpSL2hZ2jSJ3HETMPOZyiuNy9IOWc61J78yB
HgKGHSKvZsHDk1vcH+hn+NAD4k4lKlut6D0Ijf+KLqQGjc8Z7QEUyXf5ipXVt7Bh
/+yxTHW9lQBpwb7jlekD0fPa88g5UyFcS1vwgD7zLNsCx0tk5W5FPtJxa+Vlso1q
zDqxAmlUoYOnlgr2zepIksv7Yv+ga/Bej+sibjrkd4gOcTuXyrQ7Nn10JC0Ja3Vo
Go9nDcT8a8v9UkM1o2WhuJM8S2dawvykIsq47eT9vF5cmJKUErNfQ0EnW8ZtaDg9
Xk6ScDbAD/nEGBefrWF7dyGrciHZI8PEgE5ZBqkn0HY1+7KWxVo9/mtsuPKh3oNt
3np+BwPRtOgYT49I72Y7FeGwUVBISPW6pd9F1cpk9yM/pTceG52r+ycbtsT0JhXL
ef2T99e5Mr/TOb9G8Ck4hoAc/sRopShby8kPuSpw6MtEEr/x13f+u9YRCypStgIG
vOQyCDNl8QLYMiE0pqTWf5G2R9Sh0vmyJ1NAIkUu97Mmj9hli4M=
=zlYR
-----END PGP SIGNATURE-----

--TZWXuD58jiQlRBqH--
