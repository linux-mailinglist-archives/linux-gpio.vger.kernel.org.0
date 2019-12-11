Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD32311B1AF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 16:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388035AbfLKPcV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 10:32:21 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37425 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387991AbfLKPcU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 10:32:20 -0500
Received: by mail-lj1-f193.google.com with SMTP id u17so24554479lja.4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 07:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uAdwNMSEaLso7fXrtNeiaOmvaSTmeujcCsBp3bCVcw0=;
        b=gRvVNXgWH/GGHLtynZ5kGn6PZS05h5WWPN1E07u23x0/z9DzrwKeNfBrpcNLOYoray
         0FmGgY0Q6a+ElNakVq7crLg0/yk+gFaMkYRUHILs3ma8oyEx0sqAej7zouDLHx/jVGI8
         xm/QpBjTCmGtnEBt8q9rVKOahsDgYRRl1KokykL7Hj2/f0W1S1Ycqq/yyX9X/sBeLdGk
         p9kFALBIW3mDlOlGvCkqZ1JIK8bKbwQ5yk/oQ1Y744zPdOhIcLkgyvy2GJCIy70QCiwj
         MfUD9j2DxsyhxQWkCCJ25r1N/41hMRoN2vXBSS+VLcETriLgun8DUzArrqYsVjMYPtyR
         2scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uAdwNMSEaLso7fXrtNeiaOmvaSTmeujcCsBp3bCVcw0=;
        b=SU2TqxleX7BB96CQ0oyfgx2WP43Inp99C+B5ddRL529ZXR4D4Zq6CIW58HRU1M+Pn3
         T+WGfNEuCKg/JEy1//w2WEr9yYu/+bJ+BUiP1tAsdC/ifvdERvcdX8MYfD/fZr7kPEKV
         tCGGEJh01ORYDnk9lx1J36FG0TY/dxRoZ24pU7hOgjnhXnAWJWUAmtEsX29dEgICBPqy
         WoB+Icp5QmpeeJ6332JRSljXgrvvHqOv+33w4Lt64rubIDg3WXJZtJJr5xSCWmQj+2am
         kGGRw5tWdMnR/AO1W0nh+rY+ZFv6/2JzjqDlW7bNEJc/OGn4NURhk4FLrRI7FkAkkpF4
         PvTw==
X-Gm-Message-State: APjAAAW9/f1fNTaWxwGS+1mvs4vofdG3nQ4QBPYd+ORrzklEIhTIA060
        2OxxNgTLQBt4PbgpumWTYQZIqFPUAZh84PcK3xJASA==
X-Google-Smtp-Source: APXvYqyb07WA/LVZKBjQ/5cQvE+z6aYi4eCnetpEKWdQsibymwcNOMIqm2wJdEMPWDP6szaeoLdC98LHcWuGkUrntzA=
X-Received: by 2002:a2e:8045:: with SMTP id p5mr2492343ljg.251.1576078337999;
 Wed, 11 Dec 2019 07:32:17 -0800 (PST)
MIME-Version: 1.0
References: <e8b645da-9921-0436-ccfa-9abf4ae5b9d6@free.fr> <20191211132203.GD25745@shell.armlinux.org.uk>
 <20191211134531.4olcqep5ork5h4fn@pengutronix.de>
In-Reply-To: <20191211134531.4olcqep5ork5h4fn@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Dec 2019 16:32:06 +0100
Message-ID: <CACRpkdZAm5AML6cfrX_VrzyADASj1rsVXC3zwtfdo+aRSgX7fQ@mail.gmail.com>
Subject: Re: Trying to understand basic concepts about GPIO reset pin
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        GPIO <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 2:45 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, Dec 11, 2019 at 01:22:03PM +0000, Russell King - ARM Linux admin =
wrote:
> > On Wed, Dec 11, 2019 at 02:05:45PM +0100, Marc Gonzalez wrote:

> > >     devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> > >
> > > then I am able to interact with the device. How can that be?
> >
> > This is where things get complicated.  GPIOD_OUT_LOW is
> > GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT without
> > GPIOD_FLAGS_BIT_DIR_VAL.  The above will therefore call:
> >
> >       gpiod_direction_output(gpiod, !!(dflags & GPIOD_FLAGS_BIT_DIR_VAL=
));
> >
> > which will be zero.  gpiod_direction_output() respects the inversion
> > that GPIO_ACTIVE_LOW specified in DT.  So, GPIOD_OUT_LOW will set
> > the reset signal _high_.
> >
> > I don't blame you for thinking this is confusing - the terminology
> > adopted in the kernel certainly is.
> >
> > Thnk of whatever you give to the non-raw functions as "low means
> > inactive, high means active".
>
> I think it would be good to not pass GPIOD_OUT_LOW to
> devm_gpiod_get_optional (et al). Something like
>
>         devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_ACTIVE);
>
> would be much less confusing. Not sure this exists, but it would make a
> good alias for GPIOD_OUT_HIGH.

I have suggested in some other thread to create an alias
GPIO_OUT_ASSERTED / GPIO_OUT_DEASSERTED
and likewise change the name of the prototype
gpiod_set_value(gpiod, int value) to
gpiod_set_state(gpiod, bool asserted) rather than the
current int value so it is [more] clear what the argument to
these functions mean: that it is a logical level not
a physical level.

Then gradually or with a sed script just mass-convert
all users of the API to this signature. A single swift
conversion would be preferred by me personally.

I'll try to add it to my GPIO public TODO so that others
see it and be able to pick it up, because there are so
many ongoing refurbishing tasks that I need to tend to
personally.

Yours,
Linus Walleij
