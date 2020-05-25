Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D761E0957
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 10:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388891AbgEYIug (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 04:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388827AbgEYIuf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 04:50:35 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AAD7C08C5C0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 01:50:35 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id a4so10063558lfh.12
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 01:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7MClqz66Xz6cvx9U2z34WXfhFIf6bKDdfxKE4l1S5Dc=;
        b=PVmyC9t1Z3kTTSKm2hlXSwuZ4zCyT1V5zi3DvufV6enEk9caxMbM9EwjGHOAa15zXL
         4VcBCEA7Cbbj7wdMXzI6KXnxQKLzpc6Ny+MiSJEMqsu83vdADazzfJILQKj+eVhEpzZq
         /1Xv2TjwzEbzj2SUq8eh0YoJc1/APIpcOqdLz1qKEFuljfkLTbV6D8I0LNqGh6EPKMgH
         6bOnf/+i+2I0SEBxgysQe3swEwHX6SkG3W05RAU2AzBLhrk8E1pCMNZv5l9CsAUkrpNC
         WiYJ2O2Z6AQpigrRkQ3DPbudFvtSlmzyN0BIolAKiiPYIhSLyz2r2kyxohrYMzRIO1Bh
         4vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7MClqz66Xz6cvx9U2z34WXfhFIf6bKDdfxKE4l1S5Dc=;
        b=t0+dzQ4yrwinR0RiQvlntv+l1toRDLJldwNEjf9Qr69ySUP+nwGRNsR4wIR108qZiB
         DoYhfYTs1mPKI0qfHLTxXh0zcLn+JWAJvgr0fucLNy1Y7Ysj68oFYwaIYDqdGTuxuzNP
         aOvxyu7BGWDmMXGBtODT4YvMRrrAg0U+Xp7+1ZHegI+N8VXl0HTTpbwXn4JoikZsj83s
         lK8Y3adJdKkmWPKH2gGR8Ni2i0p4yA4gsYWo1k3zBO8f1w7wOzUMIVkcjjf4bCsBrsDb
         mFSQ3kV8gUG4DKd2+sjSaVCpuJK0PPKxd9PRWo6sBeMKoH3EhE0BOpoKjgMT9eeUfZhw
         2GYw==
X-Gm-Message-State: AOAM530wlEiyvjm6TkpkR+QytpYtllMkrvpp9PGycFAjpmZP19uorWhB
        UanX3294pg4Cw/0IQS9rOrKaFf8YmvKVUT+k8c8ZPg==
X-Google-Smtp-Source: ABdhPJwEqiQr6pJCsZYfcsO57SsykPVbI/VsBBSRlb4YLFujW7KBNC+YrNwAzMlIvsgiyenalkPQqpdKxVH4ZoO4loY=
X-Received: by 2002:ac2:414c:: with SMTP id c12mr13992943lfi.47.1590396633587;
 Mon, 25 May 2020 01:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200513141134.25819-1-lars.povlsen@microchip.com>
 <20200513141134.25819-2-lars.povlsen@microchip.com> <CACRpkdZa7OM3bqB+zRprEQ3M4m9hG3uPCoYxrdH_O=oxD8zi8Q@mail.gmail.com>
 <87pnb1nf2j.fsf@soft-dev15.microsemi.net>
In-Reply-To: <87pnb1nf2j.fsf@soft-dev15.microsemi.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 10:50:22 +0200
Message-ID: <CACRpkdYesD9sRQZXQNEaBY2Ouu3bjKKGWpRtU-Lpa4AcjyPwXw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add bindings for mscc,ocelot-sgpio
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 18, 2020 at 10:50 PM Lars Povlsen
<lars.povlsen@microchip.com> wrote:
> Linus Walleij writes:
>
> > On Wed, May 13, 2020 at 4:11 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
> >
> >> This adds DT bindings for the Microsemi SGPIO controller, bindings
> >> mscc,ocelot-sgpio and mscc,luton-sgpio.
> >>
> >> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> >
> >> +  microchip,sgpio-ports:
> >> +    description: This is a 32-bit bitmask, configuring whether a
> >> +      particular port in the controller is enabled or not. This allows
> >> +      unused ports to be removed from the bitstream and reduce latency.
> >> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> >
> > I don't know about this.
> >
> > You are saying this pin controller can have up to 32 GPIO "ports"
> > (also known as banks).
> >
> > Why can't you just represent each such port as a separate GPIO
> > node:
> >
> > pinctrl@nnn {
> >     gpio@0 {
> >         ....
> >     };
> >     gpio@1 {
> >         ....
> >     };
> >     ....
> >     gpio@31 {
> >         ....
> >     };
> > };
> >
> > Then if some of them are unused just set it to status = "disabled";
> >
> > This also makes your Linux driver simpler because each GPIO port
> > just becomes a set of 32bit registers and you can use
> > select GPIO_GENERIC and bgpio_init() and save a whole
> > slew of standard stock code.
> >
>
> Linus, thank you for your input.
>
> The controller handles an array of 32*n signals, where n >= 1 && n <=
> 4.
>
> The problem with the above approach is that the ports are disabled
> *port*-wise - so they remove all (upto) 4 bits. That would be across the
> banks.
>
> You could of course have the "implied" semantics that a disabled port at
> any bit position disabled all (bit positions for the same port).

I don't understand this, you would have to elaborate...

In any case microchip,sgpio-ports is probably not the right thing,
use ngpios which is documented and just divide by 32 to get the
number of ports I think? But that is just in case they get
enabled strictly in sequence, otherwise you'd need a custom
property.

Yours,
Linus Walleij
