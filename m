Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8A457146FC
	for <lists+linux-gpio@lfdr.de>; Mon, 29 May 2023 11:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbjE2JTQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 May 2023 05:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjE2JTP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2023 05:19:15 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BF79E
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 02:19:14 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-ba81deea9c2so2422785276.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 02:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685351953; x=1687943953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRtrZJDNE1gH0d57uQ8iJiIEvEp4ayD19IjPOjYxZRw=;
        b=SF7NW2Z0cno3RIZjdFf2Ac8pfzes0UvvZxqJhMaEL+JJh38A7/mChBhveTBPU1Bl3I
         KMqpYp1TIF+rfUq1OfVeFvGMtwfDIac9bFLWrit+eiaJyH2gf7qbvxXIoPDk1hjTkw6z
         djRbLAjIk0usuWGtsEC4+r38mMss9Pm4hKFwW/6VEgaDC6jLr0WLAa1v4p4XBCpBpIod
         8D9NKozUCKtACJxLfOvzkiG3zCagS8I28oRRG9/y93qVyN2sk0OkG3UGBWwlobf4ODkW
         CPxnozxDxEEqefzHdimSTvUzNwPVDheb5CzVU/2sN+VNGv0nT766SJAOZVCpkqeD+Eih
         RUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685351953; x=1687943953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRtrZJDNE1gH0d57uQ8iJiIEvEp4ayD19IjPOjYxZRw=;
        b=W2OKOOLlCFJeAVsuD4M5jTsi0WQaXOZv318oAJsE62ZZsYBtS2JdV92pd5nL7/sB8p
         Q97yhH+10FHCoL4aK4BIuJrZP4PthMHCEoeWRwyUUhFMOZR5VjxmH8COEoTZ/Ad+S2rM
         WHX09C2Z/pCpCuyWe/tFFFhIvhc7xOOPycooiirIhqekMuFSVApYmTi6sNALjGMmaZVs
         NqXbaLNRYFzj8mMcgLlCa31fhWoJEO7zOExE4luqmoNVB1Bq//SuZN6zFTifg55LpXp7
         MKVCGmV3uKYCQ+mzTjhYAB4yJgPwrOmn/O309FBzL+RYqOh3SpsndHRLEWkwrvLUf/rb
         NPvg==
X-Gm-Message-State: AC+VfDwtHTcMwdgtzodM6XLerexkFDhag1ljaBWCmamSPvgNOTZ1eT2s
        k5Wv8SuUcHWWr7lvisYckV1b/zxsFxBLlZXok9eH3w==
X-Google-Smtp-Source: ACHHUZ4BPMWIY4E7PN/0ftBnUVGfGDIGHcwYgkd3ig6+yKYqCa7V1DhuDWG00hGBzKT++q+XzAnl29SSKkt7UnGUY9g=
X-Received: by 2002:a0d:d8cc:0:b0:549:2623:6f65 with SMTP id
 a195-20020a0dd8cc000000b0054926236f65mr10946133ywe.33.1685351953650; Mon, 29
 May 2023 02:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230512042806.3438373-1-chris.packham@alliedtelesis.co.nz>
 <CACRpkdYz9ipNTo2ORXKWy5Q4uCpKL=9Gd+kK76pestX7Onuz-Q@mail.gmail.com>
 <b36fcdf1-45ab-0c06-efe4-237df0612466@alliedtelesis.co.nz>
 <CACRpkdbiSAFoJP_JB1d_6gQ+Xx7Y+mLAh=C6Za+fpyWuRe6Gbw@mail.gmail.com>
 <31a23398-9b0e-4a19-3576-84fcfd3ce4b5@alliedtelesis.co.nz>
 <ZGQH8/hH0Llx3rzZ@sol> <a61415db-fa3f-2fce-9c21-08d8dd026960@alliedtelesis.co.nz>
 <CAHp75VfSnb2DWX8iMZ7BiSnrEquZdbzvTD+bcHk_Oc_rh7ectw@mail.gmail.com> <604467c7-c5d6-38b1-be98-42c7da031416@alliedtelesis.co.nz>
In-Reply-To: <604467c7-c5d6-38b1-be98-42c7da031416@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 May 2023 11:19:02 +0200
Message-ID: <CACRpkdYGD5z4rrFsBGm8ihHEvWBep6sgqXPXSn2Q38jGod58GA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Avoid side effects in gpio_is_visible()
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kent Gibson <warthog618@gmail.com>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "johan@kernel.org" <johan@kernel.org>,
        "maz@kernel.org" <maz@kernel.org>,
        Ben Brown <Ben.Brown@alliedtelesis.co.nz>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 17, 2023 at 11:30=E2=80=AFPM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:

> > Why does the MCU have no in-kernel driver?
>
> There isn't any PoE PSE infrastructure in the kernel. I'm not really
> sure what it'd look like either as the hardware designs are all highly
> customized and often have very specialized requirements. Even the vendor
> reference boards tend to use the i2c userspace interface and punt
> everything to a specialist application.
>
> Of course if anyone is thinking about adding PoE PSE support in-kernel
> I'd be very keen to be involved.
(...)
> > I'm a bit lost. What your app is doing and how that is related to the
> > (userspace) drivers?
>
> Probably one of the primary things it's doing is bringing the chip out
> of reset by driving the GPIO (we don't want the PoE PSE supplying power
> if nothing is monitoring the temperature of the system). There's also
> some corner cases involving not resetting the PoE chipset on a hot restar=
t.

This sounds like solid 100% kernelspace territory, and while I do see
that it can be a bit intimidating to extend the existing frameworks, there
are some really helpful people in the netdev community.

For example Andrew Lunn and Sebastian Reichel working on netdev and
the power supply subsystems can most certainly figure out where this
thing goes and what is already available.

There is: drivers/pwm/pwm-raspberrypi-poe.c
referring to this hardware:
https://www.raspberrypi.com/products/poe-hat/
which is a bit odd: I think this PWM controls the fan on the PoE
board only, so it is probably not a good example.

Yours,
Linus Walleij
