Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EA63A70CF
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 22:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233581AbhFNU6q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 16:58:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:39004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233438AbhFNU6q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Jun 2021 16:58:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5531D6128A;
        Mon, 14 Jun 2021 20:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623704203;
        bh=E1qZ+2Ke4P/ssD7Vsx+wfQ8T0WTXGzCGKuvQKbgQf+8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hFzecTgqr4WHAiH4iAbmbmyw8fvFcuy2xUNVlSpSP1bxPxPzPjMBSmj9B18bsVxj1
         O0zkWtcJcIwg7hfklwkIB77R6H9/SXCDmy2FB/+QFIASp91Q4B7A5Yl7bFiFt4xYtO
         wWOd+wV0lSiEzzQyrraoYvJf9UXhv6dkJXYQM7ZBMhiFqvCiL/4W6W/3MRoz+UvDcJ
         PC9maYM6CsTLOCS/gUiS/up+IvYZdZInonSFDVkuYaXdMQ0rNZl4sk15zjNtHfmKsg
         Y/IvPrfD9CXyIeKHtnAD8fUQQCWkAcuSwPEDumjx4a4bigeopmhUncFbiV80vau9FP
         x7mKEFhtV7qIQ==
Received: by mail-wr1-f51.google.com with SMTP id r9so15920824wrz.10;
        Mon, 14 Jun 2021 13:56:43 -0700 (PDT)
X-Gm-Message-State: AOAM530BM+EfPP2NH3sqf5+CLloyXEl5shMOdyZMokExyJ0t1Gwnkpo2
        xomZscBm7uq6YYRkPtbUk9eOGZTOVs6hCrrfCpA=
X-Google-Smtp-Source: ABdhPJyS6ZvM6TWKj9v+SDxahX4oGQrEvfPKU9E67fPz08XeIGZePXDDDposyCthauq0Sf7fAc0gQdSrNRWqWXDqWk8=
X-Received: by 2002:a5d:4050:: with SMTP id w16mr20973530wrp.99.1623704201928;
 Mon, 14 Jun 2021 13:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
 <20210614102119.qifm5sj7fpg54iqo@vireshk-i7> <CAK8P3a10yObfX_dFMSsqW_fGugdtz0nutJFwDB_OY0DebdGjXQ@mail.gmail.com>
 <0100017a0a9264cc-57668c56-fdbf-412a-9f82-9bf95f5c653e-000000@email.amazonses.com>
 <CAK8P3a0-cVF=n1OxURZM8yXLKCPAAgBnZNXZVUzxA8m2ZzjP1A@mail.gmail.com> <CAKfTPtDya2gY5nxvEA7mFQN2myQEocVz2Ugc4Of4rkNiUtpgiw@mail.gmail.com>
In-Reply-To: <CAKfTPtDya2gY5nxvEA7mFQN2myQEocVz2Ugc4Of4rkNiUtpgiw@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 14 Jun 2021 22:54:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2SmZcqrJcget=7-p07GsHqAfiDgzjEQOC6NHwaFydgPQ@mail.gmail.com>
Message-ID: <CAK8P3a2SmZcqrJcget=7-p07GsHqAfiDgzjEQOC6NHwaFydgPQ@mail.gmail.com>
Subject: Re: [Stratos-dev] [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 14, 2021 at 3:24 PM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
> On Mon, 14 Jun 2021 at 15:00, Arnd Bergmann <arnd@kernel.org> wrote:
> > On Mon, Jun 14, 2021 at 2:50 PM Vincent Guittot via Stratos-dev <stratos-dev@op-lists.linaro.org> wrote:>
> >
> > But this example seem to be completely different from the ones I mentioned:
> > The scmi node that you have here looks like it shows up under the root of the
> > device tree, not below the virtio device that implements the scmi transport.
>
> I was thinking of something like below:
>
>     deviceX: deviceX@YYYYYYY {
>         ...
>         gpio = <&virtio_gpio 0>;
>         ...
>     };
>
>     virtio_mmio@a000000 {
>         dma-coherent;
>         interrupts = <0x0 0x10 0x1>;
>         reg = <0x0 0xa000000 0x0 0x200>;
>         compatible = "virtio,mmio";
>
>         virtio_gpio: protocol@22 {
>             reg = <0x22>;
>         };

Encoding the device ID as "reg" seems somewhat odd, especially since there
can only be one child for each virtio device. The other bus types use the
"compatible" property instead of "reg" for this purpose. This is still
redundant,
since the type is also known from the contents, but it seems less unusual.

The gpio node in the example is usually called "gpio" or "gpio-controller", and
it would then need the "gpio-controller" and "#gpio-cells" properties so other
nodes can refer to it by phandle.

       Arnd
