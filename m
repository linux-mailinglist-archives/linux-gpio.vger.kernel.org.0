Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECA42D4C12
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 21:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgLIUja (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 15:39:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:46082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728508AbgLIUjU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Dec 2020 15:39:20 -0500
X-Gm-Message-State: AOAM531bf7FqyU+G1r0+QRPNn5r+N6GGPsQjCork7EQrw+7LiU09Or1Q
        zfLboIJKOT9iklMBouZqK14YMUvw1jLNlVBgvcI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607546320;
        bh=Ha7lLzOpXQ1X99veTNG7S+85hi9hDdUnwFrOdFxJkFY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=m2wotAQGycNW3fNMRpvScONvUE+gNQJa/7UXeuv/E5/eArPXRVUCPnYQLNrImG/mi
         EJQV7WMwocrOB73rk8fCLhZCKjNIIiR/bzljek61mxBTwLpxZP82Xn6jRhlnEUKATY
         iEBAwk/CSGD9Xo47fY9oJGPZG78DcYthsCzyjY+hsWhf7D9e50RNKkGKje4//M6lnX
         86DGjo+2ZTer6Q7yhGH0UvyBu2prkduSQAGOLKN5qBU3EyEyp7I4BzaQZcPiejMXMM
         6hNi9fuj/ykVQO5y8Oy4vK4OaddGLZhWOG0zHrOv8NhJ1xIkzjm0yvECImZOpff6AX
         yJ8H5FndHMpDA==
X-Google-Smtp-Source: ABdhPJx9b5wUc4ET8rElWbclWiQSLM9K0iZJ/2Q/ZLrhCrcYkZDXsayj9l5KMwDCDCiFnl6/qW8E7Vk6lrA60XCvUYc=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr3381889otk.251.1607546319268;
 Wed, 09 Dec 2020 12:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net> <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net> <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
 <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net> <CACRpkdbqVoT56H88hoZwDqV0kW_8XTaE5TkMQsg-RRrPqgF=cQ@mail.gmail.com>
 <CAK8P3a1PRQGUXkjdSmqxXSONX_ZoCgsfx8hJBUdBUk14tyzErA@mail.gmail.com>
 <CACRpkdbNAeDsi9B14kbkAeoqX7NE_Ua_yOX1iNF75oNK0ELefQ@mail.gmail.com> <2827855a-dc4f-2e17-aca3-4b1b9f0d5084@ti.com>
In-Reply-To: <2827855a-dc4f-2e17-aca3-4b1b9f0d5084@ti.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 9 Dec 2020 21:38:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a30=AcEZAZ2yNUgctj=4YM6FhS1ZXB4ts7a7WV=gBcatA@mail.gmail.com>
Message-ID: <CAK8P3a30=AcEZAZ2yNUgctj=4YM6FhS1ZXB4ts7a7WV=gBcatA@mail.gmail.com>
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2020 at 9:22 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 09/12/2020 14:53, Linus Walleij wrote:
> > On Wed, Dec 9, 2020 at 12:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >> On Wed, Dec 9, 2020 at 9:51 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >>> On Tue, Dec 8, 2020 at 3:07 PM Enrico Weigelt, metux IT consult <lkml@metux.net> wrote:
> >>
> >>> What we need to understand is if your new usecase is an outlier
> >>> so it is simplest modeled by a "mock" irq_chip or we have to design
> >>> something new altogether like notifications on changes. I suspect
> >>> irq_chip would be best because all drivers using GPIOs for interrupts
> >>> are expecting interrupts, and it would be an enormous task to
> >>> change them all and really annoying to create a new mechanism
> >>> on the side.
> >>
> >> I would expect the platform abstraction to actually be close enough
> >> to a chained irqchip that it actually works: the notification should
> >> come in via vring_interrupt(), which is a normal interrupt handler
> >> that calls vq->vq.callback(), calling generic_handle_irq() (and
> >> possibly chained_irq_enter()/chained_irq_exit() around it) like the
> >> other gpio drivers do should just work here I think, and if it did
> >> not, then I would expect this to be just a bug in the driver rather
> >> than something missing in the gpio framework.
> >
> > Performance/latency-wise that would also be strongly encouraged.
> >
> > Tglx isn't super-happy about the chained interrupts at times, as they
> > can create really nasty bugs, but a pure IRQ in fastpath of some
> > kinde is preferable and intuitive either way.
>
> In my opinion the problem here is that proposed patch somehow describes Front end, but
> says nothing about Backend and overall design.
>
> What is expected to be virtualized? whole GPIO chip? or set of GPIOs from different GPIO chips?
> Most often nobody want to give Guest access to the whole GPIO chip, so, most probably, smth. similar to
> GPIO Aggregator will be needed.

I would argue that it does not matter, the virtual GPIO chip could really
be anything. Certain functions such as a gpio based keyboard require
interrupts, so it sounds useful to make them work.

     Arnd
