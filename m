Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60DCF3E1563
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 15:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240055AbhHENKy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 09:10:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:34522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234312AbhHENKx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Aug 2021 09:10:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABB0361154;
        Thu,  5 Aug 2021 13:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628169039;
        bh=QQA9M84zOLiXjfuh5E6eK/hBQlM1baUtTQpzmyypR74=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lYvAt3pYUj5qCKGcwZag2MBqCBLHe+LYMTpWbEfxmsKWOfXwvyrfM3XzqDqcxY7b0
         9O0aqh8h4rzfX2gcgwoXXjkeJP0a2J3tr3Lq51hWxQd62Gq9cRJ81UuTuBTQT8jGRQ
         LCKWKXAhiyAjHjVbd227yP7HayDzBj2fshsAbWiG/vGARRYvSgmTv1VwjmZyS1a/8b
         Hu6GQhCdxJW84TzerlaDPtKGLYa/UTZl2GYP234UxAJb77h53ny7Q1C6o7IjGBMbr6
         FBpMLa9+hFZ/c9uPWRiX2FVB+bPzMa71QARedLKVTfsi4lLvlPcVRuxtkTSCJunH6h
         tILehCGum1Lkg==
Received: by mail-wr1-f53.google.com with SMTP id b13so6494078wrs.3;
        Thu, 05 Aug 2021 06:10:39 -0700 (PDT)
X-Gm-Message-State: AOAM533LcvDjErX03TelsMVRn37ITAVIcOSwLHfd/P7tAWKoCPu83o0w
        XbIYFth+2oxTCCOsXgCNQMkBjEJqR2jUhF9SSnM=
X-Google-Smtp-Source: ABdhPJzJ3q23yWULPmYarFc6LQ2f+oqZKR52QPdkY3aJ7YFOrTLLCmAZkoj2nKCXOgFeRCWRllATQUfJVza16VQTrmY=
X-Received: by 2002:adf:fd90:: with SMTP id d16mr5479015wrr.105.1628169038272;
 Thu, 05 Aug 2021 06:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627989586.git.viresh.kumar@linaro.org> <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
 <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com>
 <0100017b1610f711-c53c79f2-9e28-4c45-bb42-8db09688b18e-000000@email.amazonses.com>
 <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com> <20210805124922.j7lts7tfmm4t2kpf@vireshk-i7>
In-Reply-To: <20210805124922.j7lts7tfmm4t2kpf@vireshk-i7>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 5 Aug 2021 15:10:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0kbmPLGCBrjAv7-dW=JWq-pdSBeGUHCxUFmMKvKhCg7w@mail.gmail.com>
Message-ID: <CAK8P3a0kbmPLGCBrjAv7-dW=JWq-pdSBeGUHCxUFmMKvKhCg7w@mail.gmail.com>
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
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 5, 2021 at 2:49 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 05-08-21, 14:03, Arnd Bergmann wrote:
> > On Thu, Aug 5, 2021 at 1:26 PM Viresh Kumar via Stratos-dev
> > > Based on discussion we had today (offline), I changed the design a bit
> > > and used handle_level_irq() instead, as it provides consistent calls
> > > to mask/unmask(), which simplified the whole thing a bit.
> >
> > The new flow looks much nicer to me, without the workqueue, and
> > doing the requeue directly in the unmask() operation.
> >
> > I don't quite understand the purpose of the type_pending and
> > mask_pending flags yet, can you explain what they actually
> > do?
>
> They are required to make sure we don't send unnecessary
> VIRTIO_GPIO_MSG_IRQ_TYPE events to the device, every time bus_unlock()
> is called.
>
> mask_pending tracks if the masked state has changed since the time
> last bus_unlock() was called. So on an interrupt, both mask() and
> unmask() will get called by the irq-core now and mask_pending will
> change to true (in mask()} and then false (in unmask()). And
> eventually in bus_unlock() we won't send an extra
> VIRTIO_GPIO_MSG_IRQ_TYPE message.

I hope this can still be simplified by working out better which state
transitions are needed exactly. In particular, I would expect that we
can get away with not sending a VIRTIO_GPIO_MSG_IRQ_TYPE
for 'mask' state changes at all, but use that only for forcing 'enabled'
state changes.

One part that I think is missing though is remembering the case
when an eventq message came in after an interrupt got masked
when the message was already armed. In this case, the
virtio_gpio_event_vq() function would not call the irq handler,
but the subsequent "unmask" callback would need to arrange
having it called.

        Arnd
