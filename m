Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7EA5B9F22
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 17:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiIOPqT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 11:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiIOPqS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 11:46:18 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6104F98D30
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 08:46:17 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id l7-20020a056830154700b0065563d564dfso12782156otp.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 08:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=f4Fumy8gcL3d3cQFNIhX6OmK6+nx7NWNfwT8g9ms94Q=;
        b=dgy3yC+GbPWzn6EryT1gBQVG3Urhiu762MCvKGNxmT1/82uUu4Aa56SWDG08ffSBE4
         fodx6YTHss/KqGaPHbd/HPgbQxiTPo8H0YCQ0yQ4L7dY3PRxkg/dCKB0tYAi26/ZtlUJ
         e+8Yq4w9g8Ls4l7PjHXLMnB1RulP8PcVDZLBy0+ZMuV5Fw8KDt0Mlf/s1sPC7hE6RYZu
         9AN+DwIQNrBaT6Zdqa968LR+1RTnH0cjQTXSOJUsKTasYCAt75fInjI3Wskka7LMoFVI
         G3DbLYW02B57gdiy0Ner8tqgO7x8yN6BsIgx1NeTSnAB6m5eC88ou/Yxl7YrZ13G7H1x
         5Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=f4Fumy8gcL3d3cQFNIhX6OmK6+nx7NWNfwT8g9ms94Q=;
        b=aL10fcI0cvzHTNepRPY7gCap91/ekx6CDVa8zc8NvHM1o3RhL6CUOTNf7wbMbDS15k
         D8iDEeRcI+RsYXcEYQKMv62Muqu+9y6kK2OsW4yfVpxLGyRVgs27MOiE6C4Zv/1f4MYz
         MB4SB+wPwgHDmKT0L1rjOGYqTQ6VP5ulcJO9cYbV9mOi9v7pDcnvJJe0BClo1HIsG7U4
         gDgTvHNwhBMr0vA40SI1YocnYusZXg3+n1SA1TZbmsOi+k6+lnSPQsRheLJXB7Em/DGO
         3z36SvNqbH9IkL/z2XqgM9nGcMx3JmuV5M5t/FH//gbz10LW8+zPiOwqHsy9wdS7dN/0
         pT7Q==
X-Gm-Message-State: ACrzQf3IJcM7tmp0WUVoGXKi2YMe1+PD5jGSwSHb/xG+9s+STijsNt+2
        LjbwDz0muZGGLh5vf+AQQfaicw==
X-Google-Smtp-Source: AMsMyM6PIJngKnpR+IIYYsxZy3aFT965jWLYIrPPCRaXofO8IJrdB691WEpW3mAQvxDitrTXDYBDxA==
X-Received: by 2002:a05:6830:2094:b0:656:56cc:662c with SMTP id y20-20020a056830209400b0065656cc662cmr134857otq.191.1663256776708;
        Thu, 15 Sep 2022 08:46:16 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id 107-20020a9d0ef4000000b00637190319eesm8795094otj.29.2022.09.15.08.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:46:15 -0700 (PDT)
Date:   Thu, 15 Sep 2022 11:46:13 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     brgl@bgdev.pl, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] gpio: idio-16: Introduce the ACCES IDIO-16 GPIO
 library module
Message-ID: <YyNIxWS0sneUKas0@fedora>
References: <cover.1662927941.git.william.gray@linaro.org>
 <6b28fb497c35def57c1920362c82402bed4bd23f.1662927941.git.william.gray@linaro.org>
 <YyCs1/HgOG31MX1N@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Nzu/QuXFHOIMvVdg"
Content-Disposition: inline
In-Reply-To: <YyCs1/HgOG31MX1N@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--Nzu/QuXFHOIMvVdg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2022 at 07:16:23PM +0300, Andy Shevchenko wrote:
> On Sun, Sep 11, 2022 at 04:34:38PM -0400, William Breathitt Gray wrote:
> > +	if (*mask & GENMASK(7, 0))
> > +		bitmap_set_value8(bits, ioread8(&reg->out0_7), 0);
> > +	if (*mask & GENMASK(15, 8))
> > +		bitmap_set_value8(bits, ioread8(&reg->out8_15), 8);
> > +	if (*mask & GENMASK(23, 16))
> > +		bitmap_set_value8(bits, ioread8(&reg->in0_7), 16);
> > +	if (*mask & GENMASK(31, 24))
> > +		bitmap_set_value8(bits, ioread8(&reg->in8_15), 24);
>=20
> So, the addresses of the ports are not expected to be continuous?

No, unfortunately the IDIO-16 devices allocate the FET outputs to byte
offsets 0 and 4 while the isolated inputs are allocated to byte offsets
1 and 5. I don't know the design reason for the split but that's the
reason I'm reading these addresses by byte rather than by word.

> > +		return;
> > +
> > +	spin_lock_irqsave(&state->lock, flags);
>=20
> > +	if (value)
> > +		set_bit(offset, state->out_state);
> > +	else
> > +		clear_bit(offset, state->out_state);
>=20
> assign_bit()
>=20
> But I'm wondering why do you need the atomic bitops under the lock?

I don't think atomic bitops are necessary in this case because of the
lock as you pointedly out, but I felt using these made the intention of
the code clearer. Is there a non-atomic version of assign_bit(), or do
you recommend I use bitwise operations directly here instead?

> > +static inline int idio_16_get_direction(const unsigned long offset)
> > +{
> > +	return (offset < IDIO_16_NOUT) ? 0 : 1;
>=20
> 	return (offset >=3D IDIO_16_NOUT) ? 1 : 0;
>=20
> ?

I have no particular preference in this case, so I can switch this to
the >=3D version for consistency with the rest of the code.

Thanks,

William Breathitt Gray

--Nzu/QuXFHOIMvVdg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCYyNIxQAKCRC1SFbKvhIj
K3YnAP95t6WB1f2/suNqh2Of/obYvWHLqiVLCQDkfzLB3jOgRwEA4eU+HB/vod5c
mxTR52mBZou143ZlB9l/Uw0zfY6nHQk=
=fJeF
-----END PGP SIGNATURE-----

--Nzu/QuXFHOIMvVdg--
