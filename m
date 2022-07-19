Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267E05797E6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 12:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237282AbiGSKu6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 06:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236840AbiGSKu5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 06:50:57 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4D926AF2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 03:50:56 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-10bd4812c29so30960931fac.11
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=REBp+rl3gSn9omYkNN8b0CUXii3A/lstSm1y66vG9j0=;
        b=HivJoTnaCg6ax+oa/Ey/X7F4l6Cg3tymTki9n3byTNOFfOgF/apT64LcoRdDWTue1s
         tEDy6vf2/xImdUmsy/ZqGTYclqNPqa5tQpWaDi4j6rqibERLa4jJXU78APuo98f81qvn
         nixvWWp2JHt14+JnhdPQ5R2COURYqZK01NXG+xaKjsKeRFalWr5AbuaMSzbQrSGr8H+z
         nAEvlQP8WDCRwsf7bcK/+Yv0Y3q83Aua7IijZNpamBrV5Cfdz7AUOkYMUYFW0LU/ycqQ
         7Nj55CwodKnTcEImsWCZJHo6NzhyRJ8KdS52lCNWo2bqBjehOSwj9uADXt784dt/5gg9
         vu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=REBp+rl3gSn9omYkNN8b0CUXii3A/lstSm1y66vG9j0=;
        b=nwyOep40vaxMYfSSkw1+AOkQFEOvXUkDXpwY6ULJFbHBYE8pJ9+fRgldX0PhlfMkEv
         62g6N8U2cxl27nTTAnUh8r8qrtvbd5M+Ek23gstU/Vb9SvjAdbiXMykjqL70lyMgwJfh
         Bj8k7G1MQG4HI19AsC4/p2n3IgaVj9xfXjif3dM/OFpMZSB35NDQNmp1Y1ZE0pF7r7fV
         x0b9lOqrb2lIXNq73/fSVwhsiPPnE7teRrcjTo7m/R/0DzCbFgaziH0T8Gs4quntsbjr
         7OxOrJtz2Gt2eoKqbzuo085T3h4YbTxjhvlq8m8MmJbYm4Dvu6j+4/rgkMYd0FRd41E3
         jZSA==
X-Gm-Message-State: AJIora8bWJd0lJnavj3yrr4tUjNvY0dQ0PcQW5UXQdbYz/GkxmM0joja
        WN5spLE0Slw4vpA2NaIjcjsaPg==
X-Google-Smtp-Source: AGRyM1uGMVZUoFDUrriyMxpw0p0TKS/UGgEbkl9R6iHRJ3Yo7FPblGiyUhb3RkNHa2YiL9EFDc3AJg==
X-Received: by 2002:a05:6808:23c2:b0:337:ab89:d674 with SMTP id bq2-20020a05680823c200b00337ab89d674mr16259865oib.250.1658227855384;
        Tue, 19 Jul 2022 03:50:55 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id l15-20020a05683016cf00b0061c98bd6278sm3212990otr.73.2022.07.19.03.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 03:50:55 -0700 (PDT)
Date:   Tue, 19 Jul 2022 06:50:53 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Hentges <jhentges@accesio.com>,
        Jay Dolan <jay.dolan@accesio.com>,
        Fred Eckert <Frede@cmslaser.com>,
        Paul Demetrotion <pdemetrotion@winsystems.com>,
        techsupport@winsystems.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 0/6] gpio: Implement and utilize register structures
 for ISA drivers
Message-ID: <YtaMjbUPCnpIlmMF@fedora>
References: <cover.1657907849.git.william.gray@linaro.org>
 <CAMRc=MeoZ9tp_AJPqD8DWGa_HJojwSrwfZMbTv_6uRq-dSMz9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eJGcoHntsLXwwxhM"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeoZ9tp_AJPqD8DWGa_HJojwSrwfZMbTv_6uRq-dSMz9w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--eJGcoHntsLXwwxhM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2022 at 10:09:33AM +0200, Bartosz Golaszewski wrote:
> On Mon, Jul 18, 2022 at 10:56 PM William Breathitt Gray
> <william.gray@linaro.org> wrote:
> >
> > Changes in v3:
> >  - Updated contact information in MAINTAINERS
> >  - Added help text for GPIO_I8255 Kconfig option
> >  - Move include/linux/gpio/i8255.h to drivers/gpio/gpio-i8255.h
> >  - Include "gpio-i8255.h" instead of <linux/gpio/i8255.h>
> >  - Include linux/types.h instead of linux/compiler_types.h
> >  - Add underscores for *PORTC_LOWER* and *PORTC_UPPER* defines
> >  - Move (offset % 8) expression to a port_offset const above the io_port
> >    const in i8255_direction_mask(); this should help optimize assembly
> >    instructions on some architectures
> >  - Implement an opaque i8255_state struct to organize and access i8255
> >    device states; this replaces the control_state array passed to
> >    various i8255 library functions in previous patchsets
> >  - Implement and provide a i8255_state_init() function to initialize the
> >    i8255_state struct for a consumer
> >  - Use a spinlock within i8255 library functions to protect access to
> >    i8255 states and synchronize I/O operations; a spinlock is used so
> >    that these functions may be used within an interrupt context
> >  - Export the i8255 library symbols within a new I8255 namespace
> >  - Update the 104-dio-48e, 104-idi-48, gpio-mm drivers to use the new
> >    i8255_state struct and I8255 namespace
> >
> > The PC104/ISA drivers were updated to use I/O memory accessor calls such
> > as ioread8()/iowrite8() in a previous patch series [0]. This
> > patchset is a continuation of the effort to improve the code readability
> > and reduce magic numbers by implementing and utilizing named register
> > data structures.
> >
> > One of the benefits is that we can now observe more easily similarities
> > in devices that share similar interfaces; such as the i8255 interfaces
> > used by the 104-DIO-48E, 104-IDI-48, and GPIO-MM drivers -- as well as
> > the similar interface used by the 104-IDIO-16 and PCI-IDIO-16 drivers.
> >
> > A new module supporting the Intel 8255 interface is introduced to
> > consolidate the common code found among the 104-DIO-48E, 104-IDI-48, and
> > GPIO-MM drivers.
> >
> > [0] https://lore.kernel.org/all/cover.1652201921.git.william.gray@linar=
o.org/
> >
> > William Breathitt Gray (6):
> >   gpio: ws16c48: Implement and utilize register structures
> >   gpio: 104-idio-16: Implement and utilize register structures
> >   gpio: i8255: Introduce the Intel 8255 interface library module
> >   gpio: 104-dio-48e: Implement and utilize register structures
> >   gpio: 104-idi-48: Implement and utilize register structures
> >   gpio: gpio-mm: Implement and utilize register structures
> >
>=20
> Hey William!
>=20
> Are you planning to submit a fourth version anytime soon? I am willing
> to take it for the next merge window if it arrives soon - like
> tomorrow at the latest.
>=20
> Bart

Hi Bart,

I'm incorporating Andy's comments for v4, and I expect it should be
ready later today for you to pick up.

Thanks,

William Breathitt Gray

--eJGcoHntsLXwwxhM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCYtaMjQAKCRC1SFbKvhIj
KzzPAQCw72Nsbwiaz+nbhBmo7OVV0aHb0zCW5i9PAXczMXw1CwD+KUQi8fWqDpGR
2elcsZ797xPL0VKeQixDa5lNvNdBsgk=
=+9Dz
-----END PGP SIGNATURE-----

--eJGcoHntsLXwwxhM--
