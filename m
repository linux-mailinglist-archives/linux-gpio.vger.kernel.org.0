Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B182D40F9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 12:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730664AbgLILVR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 06:21:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:36270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbgLILUH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Dec 2020 06:20:07 -0500
X-Gm-Message-State: AOAM532+D1hj72eNWbigRJ36XrBNtiQmRz5DI82g8Yf9iTfbpsBahqes
        ErwYIaeDpOESo7af9GUCqOGwN8m9PPUD1sC8EYc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607512766;
        bh=U8CiCE+927eWk1WjnrHEeDDVKhi+XWJxlcOhS4QhpHE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CZbfYp5eMW4vCNbBV9SJiILwyOwti8/kZsAVsYvK2NDemL3iD6lIVzx6OIJEzAsWN
         K7x05Wm2fieBTM1ho1osVEiUn4PDp5UA/CU+Z08ZXp4Zz0dKo11UaIjzG6QhQ0V8kk
         PtKS7Mx+K8wZf/TTtpqjFwiyKbSmLsa5ATNjqokNb/UtL8Te498LaiXp/3Sv+J7B0+
         fEyxHwC6s2/HAlh66Tv3eglhNIQdcjWYfLF610MdIfaY8OjsdW/JTUqSY3wvAtnGAl
         7QogIuRU22jLlxkLW6zhhTRccEomhcXrCKo8BJhDFfjA3QRJ48x00BzLy2atC0/7rv
         gm5xle3EZOSYA==
X-Google-Smtp-Source: ABdhPJy+RZN5YZE70pJEXGADA4yibSdAI8aJxjowtgSH9QR1iHKhytI8wUUYsRy7Qa7sG+nxaBUGbjy4r0F/blrkE+c=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr1277831otk.251.1607512765731;
 Wed, 09 Dec 2020 03:19:25 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net> <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net> <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
 <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net> <CACRpkdbqVoT56H88hoZwDqV0kW_8XTaE5TkMQsg-RRrPqgF=cQ@mail.gmail.com>
In-Reply-To: <CACRpkdbqVoT56H88hoZwDqV0kW_8XTaE5TkMQsg-RRrPqgF=cQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 9 Dec 2020 12:19:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1PRQGUXkjdSmqxXSONX_ZoCgsfx8hJBUdBUk14tyzErA@mail.gmail.com>
Message-ID: <CAK8P3a1PRQGUXkjdSmqxXSONX_ZoCgsfx8hJBUdBUk14tyzErA@mail.gmail.com>
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
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

On Wed, Dec 9, 2020 at 9:51 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Dec 8, 2020 at 3:07 PM Enrico Weigelt, metux IT consult <lkml@metux.net> wrote:

> What we need to understand is if your new usecase is an outlier
> so it is simplest modeled by a "mock" irq_chip or we have to design
> something new altogether like notifications on changes. I suspect
> irq_chip would be best because all drivers using GPIOs for interrupts
> are expecting interrupts, and it would be an enormous task to
> change them all and really annoying to create a new mechanism
> on the side.

I would expect the platform abstraction to actually be close enough
to a chained irqchip that it actually works: the notification should
come in via vring_interrupt(), which is a normal interrupt handler
that calls vq->vq.callback(), calling generic_handle_irq() (and
possibly chained_irq_enter()/chained_irq_exit() around it) like the
other gpio drivers do should just work here I think, and if it did
not, then I would expect this to be just a bug in the driver rather
than something missing in the gpio framework.

       Arnd
