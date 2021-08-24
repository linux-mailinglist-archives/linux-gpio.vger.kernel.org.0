Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD9B3F5998
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 10:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235124AbhHXIEA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 04:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbhHXID4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Aug 2021 04:03:56 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95323C061757
        for <linux-gpio@vger.kernel.org>; Tue, 24 Aug 2021 01:03:12 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id q3so7816359iot.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Aug 2021 01:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L63odCo4yNap7uJZXQxb32IpEjuy5tIEHRzlg7AD9/Q=;
        b=JFacL5p5al23wT7l/I0YIM9ewuicMzmhsmVh4xzL+NJEmXtWF9H+spTUu7eW3moo/N
         cvKKZrur8YB+y083vmI0LZpzgLdVvKY7iTkAeyHeXUS/zxHNx1jsOZbZYV5z5nqw0APi
         U6eCpQdfATUsKX9oL5yrrxbsL+tf3uauXMNr4aqjlD4AVd0jOE74kzpPTDpmnNme+CsV
         RHwLFJuWd/biPWAxwgMAdtYBvXxvipegC3Jf/fn1+sdusuJAN4WeQh4Y8/uWe4J4DEwP
         lwDIDKrjn3nXcI8gyDcXEnBROKWPCrlyXugOx0/xEgA47Trqa1xQuyur54N2VO67wxWj
         BAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L63odCo4yNap7uJZXQxb32IpEjuy5tIEHRzlg7AD9/Q=;
        b=ELlNMqCXYj2E0xhPQkYwOCZ3E6Ju54v56Nw6fjGLOO6K6SvqdTqCOxoFk/+vo4VQdL
         DIY063OX7s1RP3jwOS8RXC/bY9VTqhE6zVmaInaMvfVKhO006SvLSNbG8FP/RMkzXiLP
         zKXwHIoRBEcUXicJNnxge4G3dtrrt0WzVWGSXp0TOxDMBhi17SO9GWh17EzkxcDI6MBn
         5hCjjZ5f5/u4dNrzbIsiugeD5zod9N9SSQkFbRkZqKZmUAut7Oko1tnMHkjn7YekM0AQ
         He2kKckKj5vwBj24tob3Ppp2g1xBFmvf8bHwsBRncG0eO+h75lcomUyakrpFesUDM1GA
         I8XA==
X-Gm-Message-State: AOAM533Q0ZRJnQoeHQwqc3TM8PvRmTR2sReP4AetpxG4Ll/f+PUNg40U
        ckLb6uQVIHXUSFb03JiGWnN0IdRxIYyPsCMO9I/L3A==
X-Google-Smtp-Source: ABdhPJwK3nWLpscquSTWrXSuAus1oucKx3/G5sEauT7L1N+e9fWuQlSHmQPzBD2SSzjoUPMdl2AivUqmrfqfd/Vu+dA=
X-Received: by 2002:a05:6638:d0a:: with SMTP id q10mr32900691jaj.88.1629792191590;
 Tue, 24 Aug 2021 01:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
 <20210607123317.3242031-5-robert.marko@sartura.hr> <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org> <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
 <20210719225906.GA2769608@robh.at.kernel.org> <CACRpkdbq6Jow6AT9OpsR7Q0JVCWVMcmamh9KHPXMtUnkoe7ZFw@mail.gmail.com>
 <CA+HBbNFEs-=5XTK7PUL+LsgBCcPfwHsCPe4v6byK0x=O_7TRPA@mail.gmail.com> <CACRpkdZfZLQMgpMAF2FwSVt1YAzhQJ9ZWkVUjVc2xpmWL7yEvQ@mail.gmail.com>
In-Reply-To: <CACRpkdZfZLQMgpMAF2FwSVt1YAzhQJ9ZWkVUjVc2xpmWL7yEvQ@mail.gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 24 Aug 2021 10:03:01 +0200
Message-ID: <CA+HBbNHZyYnnyz9=4Hgav96ZH8-R-nYoi300j2x3fgei8aa4zQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 11, 2021 at 2:17 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Aug 3, 2021 at 9:23 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> > The pins that this driver wants to expose are used for SFP-s only,
> > they are provided by the Lattice CPLD which also does other things.
> >
> > Linux has a generic SFP driver which is used to manage these SFP
> > ports, but it only supports GPIO-s, it has no concept of anything else.
> > Since the driver is fully generic, I have no idea how could one extend it
> > to effectively handle these pins internally, especially since I have more
> > switches that use the CPLD for SFP-s as well, even for 48 ports and 192
> > pins for them.
>
> Which file is this driver in so I can look?

Hi Linus,
Sorry for the late reply.

Sure, here is the generic Linux driver that is used for SFP handling:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/sfp.c?h=v5.14-rc7

>
> Maybe it is not a good idea to look for generic code just because
> it is convenient? I have had this problem before with GPIO, along
> the lines "lemme just do this dirty thing this one time because it
> is so convenient for me" (more or less) and the answer is still
> "no".
>
> Can you either augment the driver to handle a regmap with bit indices
> instead or write a new similar driver for that or refactor it some other
> way?
>
> It is not a simple solution to your problem, but it might be the right
> solution even if it means some more work.

I understand your position, believe me, I spend some time looking at
what would be the logical way for these switches.
But I see no way how could the SFP driver be extended in a generic way
that would allow supporting different register layouts when it comes to pins.

>
> > GPIO regmap works perfectly for this as its generic enough to cover all of
> > these cases.
>
> Yeah but it might be the wrong thing to do even if it is simple
> to use and works.
>
> > CPLD also provides pins to test the port LED-s per color as well,
> > but I have chosen not to expose them so far.
>
> Have you considered
> Documentation/devicetree/bindings/leds/register-bit-led.txt

Yeah, but unfortunately in this case it wont work as the LED-s
are for debugging/test purposes only and you first need to switch
the CPLD out of it interpreting the LED state with a BIT flip.

Regards,
Robert
>
> > > If it is a regmap in Linux then that is fine, just pass the regmap
> > > around inside the kernel, OK finished. But really that is an OS
> > > detail.
> >
> > Yes, its regmap but I cant really pass it to the SFP driver as I don't have
> > special driver handling the SFP but rather the generic kernel one.
> > It only knows how to handle GPIO-s.
>
> Of course you have to program it. If I know which driver it
> is it is easier to provide architecture ideas.
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
