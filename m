Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20353DF583
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 21:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239686AbhHCTXW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 15:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239660AbhHCTXW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 15:23:22 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B87C061757
        for <linux-gpio@vger.kernel.org>; Tue,  3 Aug 2021 12:23:10 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id a14so20520385ila.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Aug 2021 12:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FS37KECEL4e1VDdBSpsRlHZt/0umCIgUOkN/1CQEOk8=;
        b=njSlxFUjc+Bre8vGN31wbqloV434BOkHCLoO+1hC29YhUkUOYLzI5SU4Q5HXgfzLAv
         Ux63sSBASBeNDCHXThmTQOAwfBvTjMZRqskmwvH5Vh4sE8tg7P3WP0u53d9fYrSGy1AD
         sGn0Xp3zAf9uMx0TN7EBnTJuvPUk6YPg5oCxsyNaN3RZqP+n2IkwmxmoNruYpU1pD7i7
         KGkuGr+S7E/qJweL7VPP2XyzRHEiFnNxMJF6aJffUjHesO3ixg1gzeozY09L1Q/GpUhu
         cKAAyHtolgkuYtQ5CDI5AjLR7Tpa3PuSMAzBgnyn0CDJj5tzEI7u7ZZv6RY1RWhaXg/d
         rGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FS37KECEL4e1VDdBSpsRlHZt/0umCIgUOkN/1CQEOk8=;
        b=rc/suAq2tYuWYDIn8bc3OZ9Yr8BnnIYohIzHfc0PvXhpfBwFXO2P2sAY9lKcRr5Y/3
         AqNdXBzF7VxfvCumyniSXULoILG1Df+h94tG5pHQh5sEY72uX0q/XL4r9fsTMORlO0Ne
         vgAccmabcxO9M0bmRNkhpih3UO31gdjugSwrSYSg91TcXGhHMFDElDWlEXalqh9lEIAc
         0jYUAIQ38rAZreJG2iCkvydNetEBH1i1mI+iYOoO8Rr581PezztMKXfX8JxxTbRtMun8
         hZ7NprRPGg2ucm6Ob6vpdQI2S8CWXixE8HxnT7Yk1bEhXleZucEMizs47bL0ZeFGI7SX
         apUA==
X-Gm-Message-State: AOAM531wfYHW9Y+t3ZgD6nmVoqIUmB/qmAtGESeBzSYCZUabFBfumbWX
        ekA9BTfiFDoiFqxGD+K8cqx7ehwPO/7TK/JBLs+E4w==
X-Google-Smtp-Source: ABdhPJyyf8tG/tlDlQdel66L6ie8hc5UJAr2OnbZHNE3EBk/DLK8xbvIC0C4uiVlo5+BB7lBeHdd51sVRL9t93UtYv8=
X-Received: by 2002:a92:c989:: with SMTP id y9mr1667932iln.183.1628018589543;
 Tue, 03 Aug 2021 12:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
 <20210607123317.3242031-5-robert.marko@sartura.hr> <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org> <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
 <20210719225906.GA2769608@robh.at.kernel.org> <CACRpkdbq6Jow6AT9OpsR7Q0JVCWVMcmamh9KHPXMtUnkoe7ZFw@mail.gmail.com>
In-Reply-To: <CACRpkdbq6Jow6AT9OpsR7Q0JVCWVMcmamh9KHPXMtUnkoe7ZFw@mail.gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 3 Aug 2021 21:22:58 +0200
Message-ID: <CA+HBbNFEs-=5XTK7PUL+LsgBCcPfwHsCPe4v6byK0x=O_7TRPA@mail.gmail.com>
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

On Wed, Jul 21, 2021 at 4:17 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jul 20, 2021 at 12:59 AM Rob Herring <robh@kernel.org> wrote:
>
> > > > > Are there any issues with the bindings?
> > > >
> > > > Yes. Primarily the GPIO function being part of the compatible. I'm
> > > > surprised Linus W is okay with that.
> > >
> > > I think I already explained this before, having a single compatible
> > > won't work here.
> > > Then there would not be anything to know whether its input or output
> > > only as the pins
> > > have specific purpose.
> >
> > The client side should tell the direction. Are you using the SFP
> > binding?: Documentation/devicetree/bindings/net/sff,sfp.txt
> >
> > Specific purpose IOs are not general purpose IOs. Repeating Linus W
> > here. Maybe his opinion has evolved...
>
> Nah. I think at one time or two I was convinced to let something
> special purpose slip through as "GPIO".
>
> Typical case: LED control lines that were in practice used for other
> things, such as controlling motors.
>
> Here there is a pin named "SFP TX disable" which is suspicious.
> Why isn't whatever is now managing SFP just read/write this bit
> without going through the GPIO abstraction to disable TX?

Hi Linus,
The pins that this driver wants to expose are used for SFP-s only,
they are provided by the Lattice CPLD which also does other things.

Linux has a generic SFP driver which is used to manage these SFP
ports, but it only supports GPIO-s, it has no concept of anything else.
Since the driver is fully generic, I have no idea how could one extend it
to effectively handle these pins internally, especially since I have more
switches that use the CPLD for SFP-s as well, even for 48 ports and 192
pins for them.

GPIO regmap works perfectly for this as its generic enough to cover all of
these cases.
CPLD also provides pins to test the port LED-s per color as well,
but I have chosen not to expose them so far.

>
> If it is a regmap in Linux then that is fine, just pass the regmap
> around inside the kernel, OK finished. But really that is an OS
> detail.

Yes, its regmap but I cant really pass it to the SFP driver as I don't have
special driver handling the SFP but rather the generic kernel one.
It only knows how to handle GPIO-s.

>
> If the pin is in practice used for other things, say connected
> to a LED, I would soften up and accept it as a GPIO compatible.
>
> > If the programming model of each instance is different, then different
> > compatibles are justified. But describe what the difference is, not the
> > connection.
>
> IIRC that is the case as the instances are different.
>
> So those differences should be described for each compatible in the
> bindings.

Ok, makes sense, I will make it clear in the bindings.
>
> So there is this:
>
> > +  GPIO controller module provides GPIO-s for the SFP slots.
> > +  It is split into 3 controllers, one output only for the SFP TX disable
> > +  pins, one input only for the SFP present pins and one input only for
> > +  the SFP LOS pins.
>
> This should read "the hardware instances are different in such way
> that the first can only (by hardware restrictions) be used as output..."
> etc, so that it is crystal clear what this means.

Ok, makes sense, I will make it clear in the bindings.
>
> But if the lines are special purpose not general purpose, they
> should not be GPIOs to begin with.
>
> Yours,
> Linus Walleij

Looking forward to your reply.

Regards,
Robert.
-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
