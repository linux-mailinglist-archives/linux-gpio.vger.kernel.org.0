Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1216288A26
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 10:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbfHJIv4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 04:51:56 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46589 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfHJIv4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Aug 2019 04:51:56 -0400
Received: by mail-lf1-f67.google.com with SMTP id n19so2785307lfe.13
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2019 01:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EptPs7iPcbS003ql4LofPryli8/kPRHigttfa0soGPM=;
        b=dY4tmKhPRkkunQn4UGIQVrsBDJJjmPHo8Zno912x+TJ8dzjiGFuxd76ubqw8MCLP5t
         p5MwPMZhibwnWf+UnCMS/azgJ7pEWR+PJWYzVau9tW80vpZ0ftga211e10RR9o93Ut5U
         3WZIT+eAQNY8RrhebusFP/sAX5TuYrF38e7p3L4NJiXc+hGWOsBBRpQT/vazmeHXJjEj
         T79XP88p35y8oqVSt5ezwijpyhVTgF4ixGNtONNqGpDzh0J5gRq/wyFHm4LNGieQBuSV
         oS4jiDM1efuGQivvU08x1ozI5BokzjdbbQO7j41mycYCRHILLyQGPP9+x77ehtCUCXHd
         md/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EptPs7iPcbS003ql4LofPryli8/kPRHigttfa0soGPM=;
        b=jMK1j8Bfapmh1LfMTGUgLHktLwMCEkcgEYJjpT+SkwSC1a0DwtYE6bIgsJxM5rG1x1
         KMGszFzCbIamoMvZMd7XZD5oCQGshpVoMWOQy9iSK9gDmGVs39tCqOpMl07XgRBzNuZY
         wlkHigWe3Z70BUgHt4iy2+PHgpDP8+rPxrzKfmfqYG5ySzlzEV+nZjHCdejatw2LXTy5
         oThdJTQRwDYbnuDUQFc4zlfO82HvN1u3LsjLQE3HB0W9qh5RnhlVaH0Wnbscs/iKiDDy
         RhYce1VpKSH/F0t5kmdAfg+6bU96U8TLSnJTKUM7MHAxmfh8qhy0vCldWnIPqKeBDovR
         eOOA==
X-Gm-Message-State: APjAAAULLt3cbqRhik9J1Td5vipv7FrETqYnsCCge9jmD16u0zmR43EM
        ms92qYYAGabvbUsbRwRYvMP6FRkEkPeqsio7GsmTKA==
X-Google-Smtp-Source: APXvYqy0q3+99yt9Yrth805vgSHJ+YTcfeZacji31vbJYYZzgrHB5Tsjno2Q6ZJtod05sQ2eaXqEh7kKho/FGfr4x7U=
X-Received: by 2002:a19:e006:: with SMTP id x6mr14722940lfg.165.1565427114167;
 Sat, 10 Aug 2019 01:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com>
 <06c95f15-d577-e43d-e046-ee222f86c406@mentor.com> <CAL_JsqLQvjtnfUsZ2RP4eozvdwMLzNxtgmT+XFaxW4xzoFjL=w@mail.gmail.com>
 <f1616784-4dbf-d0fa-b33e-c85fd569383a@mentor.com> <CACRpkdZ+vXG-mGjn0Tt5gyGowAuxiCSQNdjEPGTP9qj23CwkSw@mail.gmail.com>
 <CAL_JsqLp___2O-naU+2PPQy0QmJX6+aN3hByz-OB9+qFvWgN9Q@mail.gmail.com>
In-Reply-To: <CAL_JsqLp___2O-naU+2PPQy0QmJX6+aN3hByz-OB9+qFvWgN9Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Aug 2019 10:51:43 +0200
Message-ID: <CACRpkdbmyc9LsJ2xiX=zAQR9FZ9dmwu-nPrNbt1Tgud9+rBGpw@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Harish Jenny K N <harish_kandiga@mentor.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 9, 2019 at 4:08 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Mon, Aug 5, 2019 at 5:15 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > There is some level of ambition here which is inherently a bit fuzzy
> > around the edges. ("How long is the coast of Britain?" comes to mind.)
> >
> > Surely the intention of device tree is not to recreate the schematic
> > in all detail. What we want is a model of the hardware that will
> > suffice for the operating system usecases.
> >
> > But sometimes the DTS files will become confusing: why is this
> > component using GPIO_ACTIVE_LOW when another system
> > doesn't have that flag? If there is an explicit inverter, the
> > DTS gets more readable for a human.
> >
> > But arguable that is case for adding inverters as syntactic
> > sugar in the DTS compiler instead...
>
> If you really want something more explicit, then add a new GPIO
> 'inverted' flag. Then a device can always have the same HIGH/LOW flag.
> That also solves the abstract it for userspace problem.

I think there are some intricate ontologies at work here.

Consider this example: a GPIO is controlling a chip select
regulator, say Acme Foo. The chip select
has a pin named CSN. We know from convention that the
"N" at the end of that pin name means "negative" i.e. active
low, and that is how the electronics engineers think about
that chip select line: it activates the IC when
the line goes low.

The regulator subsystem and I think all subsystems in the
Linux kernel say the consumer pin should be named and
tagged after the datsheet of the regulator.

So it has for example:

foo {
    compatible = "acme,foo";
    cs-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
};

(It would be inappropriate to name it "csn-gpios" since
we have an established flag for active low. But it is another
of these syntactic choices where people likely do mistakes.)

I think it would be appropriate for the DT binding to say
that this flag must always be GPIO_ACTIVE_LOW since
the bindings are seen from the component point of view,
and thus this is always active low.

It would even be reasonable for a yaml schema to enfore
this, if it could. It is defined as active low after all.

Now if someone adds an inverter on that line between
gpio0 and Acme Foo it looks like this:

foo {
    compatible = "acme,foo";
    cs-gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
};

And now we get cognitive dissonance or whatever I should
call it: someone reading this DTS sheet and the data
sheet for the component Acme Foo to troubleshoot
this will be confused: this component has CS active
low and still it is specified as active high? Unless they
also look at the schematic or the board and find the
inverter things are pretty muddy and they will likely curse
and solve the situation with the usual trial-and-error,
inserting some random cursewords as a comment.

With an intermediate inverter node, the cs-gpios
can go back to GPIO_ACTIVE_LOW and follow
the bindings:

inv0: inverter {
    compatible = "gpio-inverter";
    gpio-controller;
    #gpio-cells = <1>;
    inverted-gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
};

foo {
    compatible = "acme,foo";
    cs-gpios = <&inv0 0 GPIO_ACTIVE_LOW>;
};

And now Acme Foo bindings can keep enforcing cs-gpios
to always be tagged GPIO_ACTIVE_LOW.

Yours,
Linus Walleij
