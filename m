Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0624F626FAE
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Nov 2022 14:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235305AbiKMNV3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Nov 2022 08:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233029AbiKMNV2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Nov 2022 08:21:28 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F06BF5B
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2022 05:21:25 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id k4so5956131qkj.8
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2022 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9VTVruZTXl4GHO8+iCPT1okFT3iFnttO9/2cCNMuDs=;
        b=XMSPBRy5/p9joDupTOL/28XobIv3HXFrmnMbttRqOPs5uTYBgDwPhZW9cHWlJfUQ5F
         oCbDEmc7UPNPUssqTn82dCIcANlaRDJGja3pkNLW8UpINNiv8+TdHvyK8JHH3kHGrmmu
         Va1kyTGSHaBXck2crToJwseCrey7nEyOu3eqQbT/7fedSwylJ6euVUy9WszBpZpJzwNv
         dKJW1cvsdvMfB5BFPuftKe9wecRjVFP2lmjzuSx93ViwC7d/tem6Pb7XclJVWf5Z5lmL
         3vK9TrsKFE17TPPsWQRQ4+mTWC0WHhhgamaZmBdSfY1SpPuti7O4c/lnd0x5L5bmQK8Z
         6IzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9VTVruZTXl4GHO8+iCPT1okFT3iFnttO9/2cCNMuDs=;
        b=qY+GWnMT7MbUTg9SMJ4iWwvCCYLeag+kcsRhsvVcsxfEp9dpiJtam37J85m6qgPClu
         VDC/UrLegsvm5A1ymo/gidPQbEpuqWnbaxpMEOq9GNzsHhqWofmgxYJJIRDa6LZvEW5J
         HPNZsVYxybYzw9n+fyjcMPBLP2T9r+H4y/B+7ixpfBMN/Ail5jDni7mBzroeOQZUOwXr
         pAqRhFvA/nSIIe2lViThTBN/7f3gWXe7sEswbA9L+RGCtetl5EycRZxExSancIJkNoDc
         vkMnn7vTXS9N6YLyDvBlzi6ExrXvJb5SIVmybk3deTN/ovnomZM5x++e6RQn0J/pxUVn
         5t2g==
X-Gm-Message-State: ANoB5plsayv2Xb4R9lyf1R6rUI1bDAFyWNcke/6LZByGbCAUtS2pNuXy
        Nhb7gn31eDP26T8OXikBdLjvyg==
X-Google-Smtp-Source: AA0mqf5uZWqv4l0TiXBDlKpngDb82wS+r9ZEbV8QQ/fvyLk9KYI0TR0r72cuc3E0d4apvN92JdDmEQ==
X-Received: by 2002:a05:620a:b4c:b0:6fa:6c8f:8309 with SMTP id x12-20020a05620a0b4c00b006fa6c8f8309mr7798913qkg.226.1668345684339;
        Sun, 13 Nov 2022 05:21:24 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id de38-20020a05620a372600b006bb87c4833asm4816144qkb.109.2022.11.13.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 05:21:23 -0800 (PST)
Date:   Sun, 13 Nov 2022 08:21:21 -0500
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        michael@walle.cc, robert.marko@sartura.hr
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org
Subject: Re: [PATCH v2 1/4] gpio: regmap: Always set gpio_chip get_direction
Message-ID: <Y3DvUaA7YYAsypGv@fedora>
References: <cover.1668129763.git.william.gray@linaro.org>
 <1805d1ddb5bbce8e86164e66421ddde481cce4f9.1668129763.git.william.gray@linaro.org>
 <Y3DlsTAQMi6kKObJ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H1NUJboC79HDNr5p"
Content-Disposition: inline
In-Reply-To: <Y3DlsTAQMi6kKObJ@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--H1NUJboC79HDNr5p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2022 at 02:40:17PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 10, 2022 at 08:55:50PM -0500, William Breathitt Gray wrote:
> > If you only have reg_dat_base set, then it is input-only; if you only
> > have reg_set_base set, then it is output-only. Thus, we can always set
> > gpio_chip get_direction to gpio_regmap_get_direction and return
> > GPIO_LINE_DIRECTION_IN/GPIO_LINE_DIRECTION_OUT given the respective
> > register base addresses configuration.
>=20
> Seems legit to me. Have you checked if we have any gpio-regmap drivers th=
at
> have something like this in their configuration already? In such cases we=
 need
> to be sure they behave as expected.
>=20
> From the code perspective:
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I see gpio-sl28cpld has two device types SL28CPLD_GPO (output-only) and
SL28CPLD_GPI (input-only); gpio-tn48m similarly has two device types
TN48M_GPO (output-only) and TN48M_GPI (input-only). It doesn't look like
the change in this patch will cause problems for them, but I'll let
Michael Walle and Robert Marko comment if they see issues here.

William Breathitt Gray

> > Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
> > ---
> >  drivers/gpio/gpio-regmap.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> > index 6383136cbe59..f907c9c19fce 100644
> > --- a/drivers/gpio/gpio-regmap.c
> > +++ b/drivers/gpio/gpio-regmap.c
> > @@ -111,6 +111,11 @@ static int gpio_regmap_get_direction(struct gpio_c=
hip *chip,
> >  	unsigned int base, val, reg, mask;
> >  	int invert, ret;
> > =20
> > +	if (gpio->reg_dat_base && !gpio->reg_set_base)
> > +		return GPIO_LINE_DIRECTION_IN;
> > +	if (gpio->reg_set_base && !gpio->reg_dat_base)
> > +		return GPIO_LINE_DIRECTION_OUT;
> > +
> >  	if (gpio->reg_dir_out_base) {
> >  		base =3D gpio_regmap_addr(gpio->reg_dir_out_base);
> >  		invert =3D 0;
> > @@ -265,8 +270,8 @@ struct gpio_regmap *gpio_regmap_register(const stru=
ct gpio_regmap_config *config
> >  	else if (gpio->reg_set_base)
> >  		chip->set =3D gpio_regmap_set;
> > =20
> > +	chip->get_direction =3D gpio_regmap_get_direction;
> >  	if (gpio->reg_dir_in_base || gpio->reg_dir_out_base) {
> > -		chip->get_direction =3D gpio_regmap_get_direction;
> >  		chip->direction_input =3D gpio_regmap_direction_input;
> >  		chip->direction_output =3D gpio_regmap_direction_output;
> >  	}
> > --=20
> > 2.38.1
> >=20
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20

--H1NUJboC79HDNr5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY3DvUQAKCRC1SFbKvhIj
K78gAP9AJ0CWHYsCwOO5NsGRTrWtZ6ivLgeigZrj4RLRuvBkSwEAo+yJF2CJ5Sxr
Uo/oeieaP1mPRjx/HA7+RGOnAiFC9AI=
=d440
-----END PGP SIGNATURE-----

--H1NUJboC79HDNr5p--
