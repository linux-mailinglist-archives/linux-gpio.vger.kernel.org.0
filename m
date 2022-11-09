Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B93646234D6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 21:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbiKIUrm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 15:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiKIUrl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 15:47:41 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A143A30563
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 12:47:40 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-13d9a3bb27aso77106fac.11
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 12:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mlILSCrCtCZ7SWPN1ae7BwNtNDv+bCD2Nri50k4Scg=;
        b=eLdGI94HySynagVSocIxzSs5e7Pg+vZ074527p8pkow/i3oeFdyAQzEQYEqTCMhy08
         lvQVvXffeFNVL2yXU/mRMa1h3G9l9iiddM1/nLD5NNe0UGN26g0FR3qBglqEIpJ2fjsj
         JUBnfryak5Tj0/rpH4BK6D6mc4kM8l9kNRKDHy3bQKXKnw1xGcTrI8SboSILI5rVrqen
         w4CsLlqb3PsQ+lqPgKKvyFlXHEby18pPqw17JZzfE/vmsr+p0gZI+aF7rOnf4NooESfb
         Ygf4/EWcL3cmHiGy5bSuY8zTwPpXQKYaNthp1jQE9CwA/mO4nkAFsxVCVKxoYUfS4EFX
         tJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mlILSCrCtCZ7SWPN1ae7BwNtNDv+bCD2Nri50k4Scg=;
        b=I3mQPJlddy30t6yffvf3exThsmcpuL7cgbTqmBx3AgOoc2eRF1V/D39WLBPlUtFbQy
         5AkWc1FkkzpsInqAOa8hyomFHBNePPqcWJtRwE9u9fphJ5msNmUZJ9akYQoIVbgpczLY
         2Ks54tudSazejtxnlRcfaK34OuXKnbl7ZCwaZAXdn3x5RVd39phTfp7py6EjA14AxnJB
         HPn33hU9mRv/0/3mBDxIjfMVxx+xy3yKgx7INuNJQrHXX9HhzJ6Za39ilOcnG3PwzyTj
         rIdrICSEcVtrC4MvhIW3CTBuo/m9Vqh6/VQSjWrJ7GzwICX0ppDqTGK7K0mnzCjFRyTy
         M+Xg==
X-Gm-Message-State: ACrzQf15aKSuKDlYwwTuEiHFlkp6MIr+J8a11uqCQ+Bp959QEaId4Wb9
        U+UiVeXOlFVp3oTB82mlrABPGA==
X-Google-Smtp-Source: AMsMyM4aJla/V8ktl3X0fIuS8gA9bNApUoJE2YblkcwIQcY2haV098loweeN3oUp4GrOSjeGkyiBIw==
X-Received: by 2002:a05:6870:7027:b0:13b:a5b7:165a with SMTP id u39-20020a056870702700b0013ba5b7165amr45849592oae.194.1668026859270;
        Wed, 09 Nov 2022 12:47:39 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id m8-20020a4aab88000000b00480816a5b8csm4568623oon.18.2022.11.09.12.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 12:47:38 -0800 (PST)
Date:   Wed, 9 Nov 2022 15:47:36 -0500
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] gpio: 104-dio-48e: Migrate to regmap API
Message-ID: <Y2wR6AKmQBTctrEB@fedora>
References: <cover.1667472555.git.william.gray@linaro.org>
 <523cfe2bfbf804e64e8c9f6ed38339e850e6d9d9.1667472555.git.william.gray@linaro.org>
 <Y2jgN1YiHVDxzBFE@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PN51vnWeBKDbLLPW"
Content-Disposition: inline
In-Reply-To: <Y2jgN1YiHVDxzBFE@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--PN51vnWeBKDbLLPW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2022 at 12:38:47PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 03, 2022 at 07:20:47AM -0400, William Breathitt Gray wrote:
> > The regmap API supports IO port accessors so we can take advantage of
> > regmap abstractions rather than handling access to the device registers
> > directly in the driver.
>=20
> I'm wondering if gpio-regmap can be used for these...
>=20
> --=20
> With Best Regards,
> Andy Shevchenko

I might be able to update the gpio-i8255 functions to take advantage of
gpio-regmap, but the changes in the precursor patches are primarily to
handle the device interrupts. Currently, I call gpio_irq_chip_set_chip()
to assign the struct irq_chip structure to the struct gpio_irq_chip
structure. What would be the equivalent for gpio-regmap?

William Breathitt Gray

--PN51vnWeBKDbLLPW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY2wR6AAKCRC1SFbKvhIj
Kz1FAP95Cm2NoGkBesR351aKQWMvtiayALavukaCRwt/3IpYmQD+MfhzA3xK9DMx
wJ09FbX8hGlr4LfbWyBiw6evi/h2TQA=
=EZuE
-----END PGP SIGNATURE-----

--PN51vnWeBKDbLLPW--
