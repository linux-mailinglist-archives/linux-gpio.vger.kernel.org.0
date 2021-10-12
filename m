Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7352342A977
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 18:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhJLQdx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 12:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJLQdx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 12:33:53 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8311CC061749
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 09:31:51 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id s3so7677213ild.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iw9QJo/84T3WomDFU6RT6oMiaO5fSEG3pR5RMhjSIyM=;
        b=SBo5E22X2dPYignx1or33Qf4VsdxKhNkuV0vn01sOdy967YW4bdSIoG2JI9ewPgLV2
         36E5nUym/dMouMF9CUaWgsmCTdl3Qoju+ly8n3K+QthjQSWoa8LrbSiyhemBMakSRGfF
         CP1jo4hOD6HEnNcd4sIhwyRnEmLIz9BnBQzOyYQhVPvROFLCg2jD2yTrWtf8ESDuyqI5
         ArEZJpIYWrIFuS0H+PYf1R6Fq1d9IJRM0ZvhK0dN0Ig/4XCu7RiKL889h+xxEBCetfSF
         Yq7drg4T+dqaLWOFZromuSBRaVXpMVZFhb4qAozf6nICcBm+obMbH8GU8As/imnsQsoD
         MPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iw9QJo/84T3WomDFU6RT6oMiaO5fSEG3pR5RMhjSIyM=;
        b=E5JPDHH5LGNI6wYNi4NiDfOTXIASMjNISrXA00vkQcRdfSCmxgWyGaDLiTJy9Pa38k
         0NqLYyhDwU8nYD95IajhIywNsOxcPjoEFm+1GNghG2Pl4EJywBqcLR/t9m5dGznPNsa6
         5+PZyPkW7nlaSM1OKdUK0+wwTzKCDpYEXXfHAgho7LlZR43SdgWv5mMHiWAARIZvvwWD
         1yKwAeRIGMlWAn4++lTGLPRT4AvMwm3IbQMnJqHPeAtvxNisZd3BtHvgJsSx0Ezz2grt
         /OgS3/TGOcVcZoZIb9EJL2OTfwXMF4mhXxMNpW3LYxmH9O6prFGFIaJbPQG0EV52LERL
         09gg==
X-Gm-Message-State: AOAM5313z0IoO5scfUUTq69ryKZQdIMLbQKzc/zg4PhLbtS2tscThKGN
        Fir1a0uXCfQSuSbiLzLSW8x2Q9exd9w7FFBgR9CV6Q==
X-Google-Smtp-Source: ABdhPJzmEqZj9D+83Txyx5v6milizTobe+5yMaZ1tg/3dO2lUnIGl+NfkDWxuiJc9gHumk1D5JciNVUJAqwtHj818WM=
X-Received: by 2002:a05:6e02:6d2:: with SMTP id p18mr22118845ils.159.1634056310899;
 Tue, 12 Oct 2021 09:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
 <20210607123317.3242031-5-robert.marko@sartura.hr> <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org> <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
 <20210719225906.GA2769608@robh.at.kernel.org> <CACRpkdbq6Jow6AT9OpsR7Q0JVCWVMcmamh9KHPXMtUnkoe7ZFw@mail.gmail.com>
 <CA+HBbNFEs-=5XTK7PUL+LsgBCcPfwHsCPe4v6byK0x=O_7TRPA@mail.gmail.com>
 <CACRpkdZfZLQMgpMAF2FwSVt1YAzhQJ9ZWkVUjVc2xpmWL7yEvQ@mail.gmail.com>
 <CA+HBbNHZyYnnyz9=4Hgav96ZH8-R-nYoi300j2x3fgei8aa4zQ@mail.gmail.com> <CACRpkdaBUrgnyFnO0Tdae56PKR4pLN1boLpK0FMCk7eYshZ5LA@mail.gmail.com>
In-Reply-To: <CACRpkdaBUrgnyFnO0Tdae56PKR4pLN1boLpK0FMCk7eYshZ5LA@mail.gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 12 Oct 2021 18:31:40 +0200
Message-ID: <CA+HBbNFeTN45cz8G75V94tF9cBcOGNzeenTMjdJ-4oKFCvHYLA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>,
        "Jonathan M. Polom" <jmp@epiphyte.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>,
        Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 4, 2021 at 12:48 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Robert,
>
> sorry for slow reply, I am a bit busy.
>
> On Tue, Aug 24, 2021 at 10:03 AM Robert Marko <robert.marko@sartura.hr> wrote:
> > On Wed, Aug 11, 2021 at 2:17 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > On Tue, Aug 3, 2021 at 9:23 PM Robert Marko <robert.marko@sartura.hr> wrote:
> > >
> > > > The pins that this driver wants to expose are used for SFP-s only,
> > > > they are provided by the Lattice CPLD which also does other things.
> > > >
> > > > Linux has a generic SFP driver which is used to manage these SFP
> > > > ports, but it only supports GPIO-s, it has no concept of anything else.
> > > > Since the driver is fully generic, I have no idea how could one extend it
> > > > to effectively handle these pins internally, especially since I have more
> > > > switches that use the CPLD for SFP-s as well, even for 48 ports and 192
> > > > pins for them.
> > >
> > > Which file is this driver in so I can look?
> >
> > Hi Linus,
> > Sorry for the late reply.
> >
> > Sure, here is the generic Linux driver that is used for SFP handling:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/sfp.c?h=v5.14-rc7
>
> So this has this:
>
> enum {
>         GPIO_MODDEF0,
>         GPIO_LOS,
>         GPIO_TX_FAULT,
>         GPIO_TX_DISABLE,
>         GPIO_RATE_SELECT,
>         GPIO_MAX,
>
>         SFP_F_PRESENT = BIT(GPIO_MODDEF0),
>         SFP_F_LOS = BIT(GPIO_LOS),
>         SFP_F_TX_FAULT = BIT(GPIO_TX_FAULT),
>         SFP_F_TX_DISABLE = BIT(GPIO_TX_DISABLE),
>         SFP_F_RATE_SELECT = BIT(GPIO_RATE_SELECT),
>
>         SFP_E_INSERT = 0,
>         SFP_E_REMOVE,
>
> This does not look general purpose to me at all?
> It's just some hardware engineer that thougt "GPIO"
> was a nice thing to call this.

Hi Linus.
These were historically always just regular GPIO-s, usually connected
directly to the SoC
GPIO controller or some kind of a GPIO expander and thus it uses gpiod.

>
> > > Maybe it is not a good idea to look for generic code just because
> > > it is convenient? I have had this problem before with GPIO, along
> > > the lines "lemme just do this dirty thing this one time because it
> > > is so convenient for me" (more or less) and the answer is still
> > > "no".
> > >
> > > Can you either augment the driver to handle a regmap with bit indices
> > > instead or write a new similar driver for that or refactor it some other
> > > way?
> > >
> > > It is not a simple solution to your problem, but it might be the right
> > > solution even if it means some more work.
> >
> > I understand your position, believe me, I spend some time looking at
> > what would be the logical way for these switches.
> > But I see no way how could the SFP driver be extended in a generic way
> > that would allow supporting different register layouts when it comes to pins.
>
> Why do you think you have to use the GPIO abstraction and bindings?
> Just invent something that satisfy your needs, the bindings are just
> strings. Why does the consumer have to use the GPIO binding?
> They can just use phandle named anything. Some "sfp-foo-resource = <&...>
> or so.
>
> For example I created this:
> Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml
> It's handling out a resource using a phandle. Nothing different than
> GPIO, regulator, clock etc. Just invent something for SFP?

The SFP driver requires GPIO-s, it only knows how to use GPIO-s, and
its a generic driver,
it covers any device that has an SFP port that is implemented per spec.
So, I cannot just extend it to suit my devices needs and I don't see
how can I extend it in
a generic manner so that it controls the pins directly via a regmap
for example, especially since
each switch has a different number of SFP ports and thus pins and a
different register layout.

I have added Andrew Lunn as he is one of the maintainers of PHYLIB
under which the SFP driver
is, he may have some input on how to proceed with this.

I honestly think that we have some kind of misunderstanding here and
look forward to resolving it.

Regards,
Robert

>
> Yours,
> Linus Walleij



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
