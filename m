Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE950602B81
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 14:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiJRMRr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 08:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiJRMRq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 08:17:46 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3939A3450
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 05:17:45 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id a5so8445034qkl.6
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OlSg04/4Dd8U3EuUogDMELPRpoMqkuY3GumBRBmWFI0=;
        b=ve3mDns3CqM7+7NxyWsndkD0guUHijbrCAucM26kfe6BL9xq0EPS69ikH1r+oKIwbw
         XF19Fx7G2EHRFmsZw0LGj8fECAHmCZvQGThIwUQIt+begtsVLgoklhorPzaP/29PfM6p
         CbgX4BaT+1W5j8RvXp/PFSlhmqG4E0756krQguM19r9lHxvnfdNPEL1ADd3PWBPf2lX7
         VqVBZyjxaG1DvXLl5HcGzBLSurPLu57Yr+BBfjij4+g2o2/HDhfS9NCdiorCaqhZu76G
         67b8HuzYk2s6m55RqeHTFjbNyGrPjL1g0zJmENKk6Ke3yLJk7j6oVWxPq2VsyuuW7ng0
         5RDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlSg04/4Dd8U3EuUogDMELPRpoMqkuY3GumBRBmWFI0=;
        b=ZZNC6VkH9e1C6CVokzWHQBc9wMUd/Nt3+urUDnGBK5j7+9Sb9yngjB7wCnbShh/NyN
         f0kbiSxinotXF3BME4+Y56ON5jpOku7skULffYewAuAyx4qq8OFNQYeUlGZLV/p0Ftsj
         HmmaHdUPYAxuPAAaCALk6x8AOByAdeN6XXbDon1qPJ4xhPy0Um3cee8FHibDpdEDznki
         R2B7As6iIFPWRfree9Y32hNsudmFxaEJbaNr79nyABtCYOE3+uY9tQLnVcHNHJb166ym
         yQ3EME+Y+V69C6vCmU9dZwnjB8MDSeUXR9hFUdO+6F+aJ6tenuk66x+hUYobdQy3jjhX
         GP0g==
X-Gm-Message-State: ACrzQf3BrvAgUq+sveA7zXt8Jq5ZOktiioTuLFAm8+TAhQTFp+NFuogD
        93+dRrbqPYGa8eBg4a681ADgwA==
X-Google-Smtp-Source: AMsMyM6ZG32yzEaXg8k2oSN/Tpw/jWYy6gTmmM/nXLeLt3qfUN1KFM8aIVURt5SG0G0p7IE4zhw70g==
X-Received: by 2002:a37:ef0d:0:b0:6bb:4ec8:b312 with SMTP id j13-20020a37ef0d000000b006bb4ec8b312mr1529324qkk.249.1666095464842;
        Tue, 18 Oct 2022 05:17:44 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id oo12-20020a05620a530c00b006eeae49537bsm2161924qkn.98.2022.10.18.05.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 05:17:43 -0700 (PDT)
Date:   Tue, 18 Oct 2022 08:17:41 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Qingtao Cao <qingtao.cao.au@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpio: exar: Allow IO port access
Message-ID: <Y06ZZQ4q3Ql0sNkm@fedora>
References: <20221017170600.88480-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbNkPG5KsB47jByseDh=nOt+J2eE_nh5EJqRLAPDp8v8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Gqn9ZZgaixBaZ3cX"
Content-Disposition: inline
In-Reply-To: <CACRpkdbNkPG5KsB47jByseDh=nOt+J2eE_nh5EJqRLAPDp8v8A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--Gqn9ZZgaixBaZ3cX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 10:29:13AM +0200, Linus Walleij wrote:
> On Mon, Oct 17, 2022 at 7:05 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>=20
> > It's possible that PCI device can provide an IO port resource for
> > the device. regmap MMIO currently uses MMIO by default. With an
> > additional flag we enable support for IO port accesses.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> Looks clever to me!
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> I would let William have a look at it as well, as he's worked extensively
> with port-mapped I/O.
>=20
> Yours,
> Linus Walleij

I love how simple it is to add IO port support to these drivers now. :-)

Acked-by: William Breathitt Gray <william.gray@linaro.org>

I'm hoping to convert several of the port-mapped GPIO drivers to the
regmap API later this cycle, so it's good to see other modules making
use of this interface as well.

Thanks,

William Breathitt Gray

--Gqn9ZZgaixBaZ3cX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY06ZZQAKCRC1SFbKvhIj
K4a2AQC5tyMmVg9lmM0Ig4lRNMikOooM39OWgxDsLS6TvV4qaAD+LgrR2MNu2N7+
UI00cdLogtU8YgtpqEbld147YhZXoQo=
=vFbp
-----END PGP SIGNATURE-----

--Gqn9ZZgaixBaZ3cX--
