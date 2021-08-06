Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A7D3E249F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 10:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbhHFIBQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 04:01:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:39192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230119AbhHFIBQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Aug 2021 04:01:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9554E61164;
        Fri,  6 Aug 2021 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628236860;
        bh=ztwkXxuWZMz/g6yZbgT0o5O4xY3oCyRVtcaRxW+vzjc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GJcB4WYC17pGs7DrCFLhOVLYml6GF4ytUAgy+rJpR/UpPv+ykfP9B+7FDb65CjZMf
         EQ9P7LssjEowBvl7E+IYCesSfHJUBCNu4sMbwbNkQ8Wl4+cB4lmB6xoB/pj+J5UHSV
         mm+XML2WZBrGO0/3DMsY2W40k8Qjng1CqIAHlhMmdhC6/ISkLC4AQXRtJ/dJc9bRVp
         73yeP//jZ6tpI7O6cYQW6riWzLkTH15TVGrbOz7d+kk/8PEMKcEbnEMUuNyfxe70M3
         Ksy0Y+uOxu3/6mmIpHDgzBN2KpCySBf2GTMbp6MddPn4cn+oIxVJ0Zxiu1qpJ5XRkZ
         H8/5hxq6Tfqog==
Received: by mail-wr1-f49.google.com with SMTP id c9so9884393wri.8;
        Fri, 06 Aug 2021 01:01:00 -0700 (PDT)
X-Gm-Message-State: AOAM531nGkBErkA5AQucV+qGafBwBE99QHbCBm5qxq2HdzBQ4kU5kbD4
        cAeYvSalAoPPiy03zt0vbNYeFbm6LXZdgnQ7cJE=
X-Google-Smtp-Source: ABdhPJwo6F2j4b2SHDNHGQozJB+IoZwYRfg4nlpJNBaRYbtLxX3J/PyAE2/Fn575dufIMYN5qJa9QILoPOtN4acsUKE=
X-Received: by 2002:a5d:44c7:: with SMTP id z7mr9646198wrr.286.1628236859101;
 Fri, 06 Aug 2021 01:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627989586.git.viresh.kumar@linaro.org> <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
 <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com>
 <0100017b1610f711-c53c79f2-9e28-4c45-bb42-8db09688b18e-000000@email.amazonses.com>
 <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com>
 <20210805124922.j7lts7tfmm4t2kpf@vireshk-i7> <CAK8P3a0kbmPLGCBrjAv7-dW=JWq-pdSBeGUHCxUFmMKvKhCg7w@mail.gmail.com>
 <0100017b1a6c0a05-e41dc16c-b326-4017-a63d-a24a6c1fde70-000000@email.amazonses.com>
In-Reply-To: <0100017b1a6c0a05-e41dc16c-b326-4017-a63d-a24a6c1fde70-000000@email.amazonses.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 6 Aug 2021 10:00:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2rrueXJHZxuiiShgVmLD916RaxW7xQHHjQXNFkM3Fpvg@mail.gmail.com>
Message-ID: <CAK8P3a2rrueXJHZxuiiShgVmLD916RaxW7xQHHjQXNFkM3Fpvg@mail.gmail.com>
Subject: Re: [Stratos-dev] [PATCH V4 2/2] gpio: virtio: Add IRQ support
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jason Wang <jasowang@redhat.com>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 6, 2021 at 9:44 AM Viresh Kumar via Stratos-dev
<stratos-dev@op-lists.linaro.org> wrote:
>
> On 05-08-21, 15:10, Arnd Bergmann wrote:
> > I hope this can still be simplified by working out better which state
> > transitions are needed exactly. In particular, I would expect that we
> > can get away with not sending a VIRTIO_GPIO_MSG_IRQ_TYPE
> > for 'mask' state changes at all, but use that only for forcing 'enabled'
> > state changes.
>
> Something like this ?

> static void virtio_gpio_irq_mask(struct irq_data *d)
> {
>         /* Nothing to do here */
> }

You'd have to do /something/ here I think, if only setting the flag
that we don't want to deliver the next interrupt.

> static void virtio_gpio_irq_unmask(struct irq_data *d)
> {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct virtio_gpio *vgpio = gpiochip_get_data(gc);
>
>         /* Queue the buffer unconditionally on unmask */
>         virtio_gpio_irq_prepare(vgpio, d->hwirq);
> }

And check the flag here to not requeue it if it's masked.

Now, there is already a flag in the irq descriptor, so rather than
having double accounting, the easy way may be to
just use irqd_irq_masked()/irq_state_set_masked(), or
have the irq core take care of this.

     Arnd
