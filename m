Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64FD3A7800
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 09:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhFOHc1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 03:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbhFOHc0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 03:32:26 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C43C061767
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:30:22 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c11so23655164ljd.6
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4byd1Dk2m0bIGpNxLD6eAHBG7Y25yTaDEnQlvjF1Zdc=;
        b=K0Y4uaRKlTe9bD7p/ynZX2uKJVkiiBpfk+SgKt5vGiCWcoQOX9XJ0ivBfWxt3jtiAh
         ++0V6U4ObgYdunpMP36P1hQHeGC0iY1IPkAkOnzntkf82faltK8uByibgnbrNBlZ/7wz
         V07ZKXEzErCHHdvsj5ZSAQbehQEH82uF/hEKsWkPFRwL3tCMafNKnLaKQWQaklqiloeT
         FCnwa2EUKdxjqGPM1tLa4e0ztnxMIUu/0jp8EAdCK0bBdeXg7aS5Vb72mQS7fze2XBVO
         GJpTzJULDdeVasxfBe5VPbqe/DP+QLLMIHZIeUYd/XkjNGBVC4DKTqsdydkp6bO5Ja8P
         gnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4byd1Dk2m0bIGpNxLD6eAHBG7Y25yTaDEnQlvjF1Zdc=;
        b=LMrQBMP+qYO62IIpeHWbeWF63Sn8BFy3FrorA3RxYUf6mVom2s31uTRAvpn87nTE+t
         HU18ndjIQCxSSoYLKe0AyLkWFdSW8yE08AttbiyrXA4IQtOuhtk9wG8j1UxsMA0opssJ
         9z+BbEdtAQEZ9KzOxmsHSk+pkFQz9RaXmtiOXOnRbknhqtYTq7DfYf8haziOADbJcUAJ
         eFU8h1UM8gA7jJ32GE7Dfz+Q4R2ZIKsyU3zMkKiiF/OyeGeguNe7BYC58tDoURrsBICV
         pB4BiPMsm3Wyya8e38FOSFsjWxWo8a7Mwfn87netSSS/DiahLmuIE2JJX6YTwiC7/X4n
         VkqA==
X-Gm-Message-State: AOAM532WkVhX9OVetYuXramJ4ao3C4gOXFrnIOjwXfdYzI2o7LT0p7nk
        zQvLsp+bbKT8q4zX7o2g37mhhP825fRLvVrYo2BtIQ==
X-Google-Smtp-Source: ABdhPJxpMjRoPyGeUPqwD/dVoDByW0MDQB60HJBouvwSs62fSq0v9vJxpy/IOQk2n48ZlUYvztjAInD9WBzdbB4niOE=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr9470415ljg.401.1623742220641;
 Tue, 15 Jun 2021 00:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
 <20210614102119.qifm5sj7fpg54iqo@vireshk-i7> <CAK8P3a10yObfX_dFMSsqW_fGugdtz0nutJFwDB_OY0DebdGjXQ@mail.gmail.com>
 <0100017a0a9264cc-57668c56-fdbf-412a-9f82-9bf95f5c653e-000000@email.amazonses.com>
 <CAK8P3a0-cVF=n1OxURZM8yXLKCPAAgBnZNXZVUzxA8m2ZzjP1A@mail.gmail.com>
 <CAKfTPtDya2gY5nxvEA7mFQN2myQEocVz2Ugc4Of4rkNiUtpgiw@mail.gmail.com> <CAK8P3a2SmZcqrJcget=7-p07GsHqAfiDgzjEQOC6NHwaFydgPQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2SmZcqrJcget=7-p07GsHqAfiDgzjEQOC6NHwaFydgPQ@mail.gmail.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Tue, 15 Jun 2021 09:30:09 +0200
Message-ID: <CAKfTPtCrAxADvpcEqDOXru249ON-yvjMt_ti+8prv5FTiZUZaQ@mail.gmail.com>
Subject: Re: [Stratos-dev] [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Arnd Bergmann <arnd@kernel.org>
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

On Mon, 14 Jun 2021 at 22:56, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Jun 14, 2021 at 3:24 PM Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> > On Mon, 14 Jun 2021 at 15:00, Arnd Bergmann <arnd@kernel.org> wrote:
> > > On Mon, Jun 14, 2021 at 2:50 PM Vincent Guittot via Stratos-dev <stratos-dev@op-lists.linaro.org> wrote:>
> > >
> > > But this example seem to be completely different from the ones I mentioned:
> > > The scmi node that you have here looks like it shows up under the root of the
> > > device tree, not below the virtio device that implements the scmi transport.
> >
> > I was thinking of something like below:
> >
> >     deviceX: deviceX@YYYYYYY {
> >         ...
> >         gpio = <&virtio_gpio 0>;
> >         ...
> >     };
> >
> >     virtio_mmio@a000000 {
> >         dma-coherent;
> >         interrupts = <0x0 0x10 0x1>;
> >         reg = <0x0 0xa000000 0x0 0x200>;
> >         compatible = "virtio,mmio";
> >
> >         virtio_gpio: protocol@22 {
> >             reg = <0x22>;
> >         };
>
> Encoding the device ID as "reg" seems somewhat odd, especially since there
> can only be one child for each virtio device. The other bus types use the
> "compatible" property instead of "reg" for this purpose. This is still
> redundant,
> since the type is also known from the contents, but it seems less unusual.

At least this ensures to match directly the protocol id instead of
mapping a compatible string with the protocol id.

>
> The gpio node in the example is usually called "gpio" or "gpio-controller", and
> it would then need the "gpio-controller" and "#gpio-cells" properties so other
> nodes can refer to it by phandle.

yes, This short example is just to show what I mean.



>
>        Arnd
