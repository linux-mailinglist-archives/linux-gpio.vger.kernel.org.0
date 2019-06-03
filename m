Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E3C336BA
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 19:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbfFCRac (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 13:30:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40082 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729938AbfFCRac (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 13:30:32 -0400
Received: by mail-lj1-f193.google.com with SMTP id a21so1810386ljh.7
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2019 10:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=87vmhbtFGypbRFP93z1soajD115x6/UE0lciB5UWxN4=;
        b=gcf8Kz3nDQ8H4R5OD/gfn3ipZVokaCSGZjWlkVHFuKzXAwq8UciIa15eIYFlZv2OfV
         QJbx74dOzrOeN/zbmnQK+eThQLmXVaqWc3TU8uQlLp/tUbUDoRc4b8nj0ggcshHj5RrS
         nbEdL7G6sM/MkovcGr9b9zDTrV6Fdwm0QbmR1bQsYVmtqBkB+oBAaImFuV55UyIGMpct
         5IE8HbUHzEpDMe/mrKdchXcHOHH1eGmwAKT2MjZ9BKEpEPvKFWk79HAZYi4DfV0W8/kQ
         Yllkrzr7noCCpo8Ot6alVxigtYls0uRQSiOq9/oyC0qZyKX6wVo59zSL37cn2ltPIaFK
         BlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=87vmhbtFGypbRFP93z1soajD115x6/UE0lciB5UWxN4=;
        b=UNXed+ZKvycNB/J56PmIsTHhhfZM9/KMh8iSSob5FnV6Mmbj6NBt3yfZw0yjjgLw8r
         K1Ah2ytc+sSirNgN5gFovvE9Zbfd6b1yx+1VhbjoxyZUz0OJy8oEwVeqVi1tZs1LmK0l
         BnxuTz/dW409lfAbydCBSszu2ShxKwDW97qYmzjsbzaVDGaPn32HfL3bcKuyFZWnxO4G
         iFY9qvLCfFoUXkFfGxjTfZBSQgzIJqBCuW1c65qtWGNddjnp4gVzFoEohGBSOvNgNDnM
         kDVDrvC6MWKzAJQhrz9v73j5jbfPnmQNn8ZGGbxPGlPVA82ZFePQdkb2xZ/BPp1jVOZB
         JOpw==
X-Gm-Message-State: APjAAAVbE6nJ29oEiM7Zm4k5bZ0A7G+mkzKVmehiYoExZVh6ONIdCtkQ
        IN1zY3KrbchZ2NZJyFIPPmG4gliGddxoVDGdSwo5oA==
X-Google-Smtp-Source: APXvYqzg7eWJ/IwhrWvciMTZ7qEvC9ybwjiLgDg/gaY4C/HmzBeRvsjbwxgqJxnTRMgtB9olOpHCEdFsdPHPGoH9k+g=
X-Received: by 2002:a2e:5dc4:: with SMTP id v65mr7253755lje.138.1559583030373;
 Mon, 03 Jun 2019 10:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com> <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
 <20190603075324.GA27753@ulmo> <CACRpkda47EX981Dw=jLrU=PHn50+AQhJmpVRWJ9uJEQdcAsrTw@mail.gmail.com>
 <20190603121227.GB30132@ulmo>
In-Reply-To: <20190603121227.GB30132@ulmo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Jun 2019 19:30:19 +0200
Message-ID: <CACRpkdaiZEqLWYGoVLYTzWEc-hX10kT4bXqx3bUynBDcyStLjw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 3, 2019 at 2:12 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> On Mon, Jun 03, 2019 at 12:58:02PM +0200, Linus Walleij wrote:
> > On Mon, Jun 3, 2019 at 9:53 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > > Me
> >
> > > > Please drop this. The default .to_irq() should be good for everyone.
> > > > Also patch 2/2 now contains a identical copy of the gpiolib
> > > > .to_irq() which I suspect you indended to drop, actually.
> > >
> > > It's not actually identical to the gpiolib implementation. There's still
> > > the conversion to the non-linear DT representation for GPIO specifiers
> > > from the linear GPIO number space, which is not taken care of by the
> > > gpiolib variant. That's precisely the point why this patch makes it
> > > possible to let the driver override things.
> >
> > OK something is off here, because the purpose of the irqdomain
> > is exactly to translate between different number spaces, so it should
> > not happen in the .to_irq() function at all.
> >
> > Irqdomain uses .map() in the old variant and .translate() in the
> > hierarchical variant to do this, so something is skewed.
> >
> > All .to_irq() should ever do is just call the irqdomain to do the
> > translation, no other logic (unless I am mistaken) so we should
> > be able to keep the simple .to_irq() logic inside gpiolib.
>
> Well, that's exactly the problem that I'm trying to solve. The problem
> is that .translate() translates from the DT number space to the GPIO or
> IRQ number space. However, since gpiochip_to_irq() now wants to call the
> irq_create_fwspec_mapping() interface, it must convert from the offset
> (in GPIO space) into the DT number space, which is what that function
> expects.

It sounds a lot like you want to use the irqdomain APIs for
something they were not made for.

The irqdomain in general remaps from hwirqs to Linux irqs.

The hierarchical irqdomain 1-to-1 remaps hwirqs on interrupt
controller A to hwirqs on interrupt controller B, then to Linux irqs.

The DT number space is not normally any concern of the
irqdomain, and is not normally used to shape up that.

But how to do it is another question. Maybe making it
possible to override .translate() is what we need to do,
as you say.

That way .translate() can account for weirdness in the DT,
get the real hwirq out and proceed to translate as usual.

And then in the end the irqdomain .translate() is indeed
used to fix up weird DTs.... well. Hm this one is strange. :)

Yours,
Linus Walleij
