Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA9E3E40D5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 09:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233365AbhHIHat (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 03:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233161AbhHIHar (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Aug 2021 03:30:47 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAD5C0613CF
        for <linux-gpio@vger.kernel.org>; Mon,  9 Aug 2021 00:30:23 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id j1so26516112pjv.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Aug 2021 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6AaH/QvzJmMTb/tLFdsE2g2dSuN00KFriVjp+nrWMKo=;
        b=n3JUpjnMCUehTXcRC2vvYvjrX4sIYgtTBEdqO95/Jt9Hn9OnclNx9GduauyhRey287
         8nLtSx5vopa18swm/eS0hMKso9qA3Fhd83TVyljzMEEPfFFGRM/VvDb3XNmXiPrTvfKd
         lVlxk2E8NZOZXs4nO1t/xEGMRdcfrsC/n2KdKJwKvcsMlinlYgPB4iSY3rK5an8sEFH9
         bmTsjn94+sKBDYBbjRA3tJQCluMZeCV5VDnIXdMBDYMAxKSoCXIukdBvFwuF7xPlC4f+
         VRH6yUcShJeOGMF6Q1fDQffqMLo0AenRzsdrZqQqUA+vZAQQhjmb0MFQIgOFjajTZLsc
         x/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6AaH/QvzJmMTb/tLFdsE2g2dSuN00KFriVjp+nrWMKo=;
        b=fZt4+p2k+3dQwH9tQRueFpMr+hermZ4kkfmk0fnx81341JduIXCZT4nxnf5GZkFeWC
         4nzAB8B/WfZgJ/4EDwpoY4d+Fkk3mpuBkTcGL9bjT2Arbj8GmjZ3Z0sRhoA2AANQ1+YS
         b7LAZjw6qoKo+dJb4CnJIoeael/WT/eolDCq5Cj2K833Ct4qULWtkceF6MWk0MGG0Ulx
         rT63TFIJVN5EUCX5asbkSm2ru9hQe6PnVlDrrtvfX4jPbKA5ixzCjBcOWXNKVuOvzj/I
         7r3wY94Yylp5/F4YIJDultcvPnqy3UlNF1LS9m2U4LI46WCl1XJJWfAZpAfqS7Xw+R6d
         aQxg==
X-Gm-Message-State: AOAM533smASQAVPIF3fRl4+YzpQS8dD9RwCD7HOFPUsue9hbXeLLZJu+
        ZnueLiG8U4xpCklKVSAuzDrNxA==
X-Google-Smtp-Source: ABdhPJxeoZhdVD34qHvFm3x0OrPEUWTYjI47uQbkZF5kBJ2jSlkeRPl7vBozGIeSrM03ZFEKr0P5+A==
X-Received: by 2002:a17:90a:17a3:: with SMTP id q32mr3416980pja.195.1628494223102;
        Mon, 09 Aug 2021 00:30:23 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id r17sm23592320pgu.8.2021.08.09.00.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 00:30:22 -0700 (PDT)
Date:   Mon, 9 Aug 2021 13:00:20 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
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
Subject: Re: [Stratos-dev] [PATCH V4 2/2] gpio: virtio: Add IRQ support
Message-ID: <20210809073020.y6ruibdm37xnx7hg@vireshk-i7>
References: <cover.1627989586.git.viresh.kumar@linaro.org>
 <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
 <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com>
 <0100017b1610f711-c53c79f2-9e28-4c45-bb42-8db09688b18e-000000@email.amazonses.com>
 <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com>
 <20210805124922.j7lts7tfmm4t2kpf@vireshk-i7>
 <CAK8P3a0kbmPLGCBrjAv7-dW=JWq-pdSBeGUHCxUFmMKvKhCg7w@mail.gmail.com>
 <0100017b1a6c0a05-e41dc16c-b326-4017-a63d-a24a6c1fde70-000000@email.amazonses.com>
 <CAK8P3a2rrueXJHZxuiiShgVmLD916RaxW7xQHHjQXNFkM3Fpvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2rrueXJHZxuiiShgVmLD916RaxW7xQHHjQXNFkM3Fpvg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06-08-21, 10:00, Arnd Bergmann wrote:
> On Fri, Aug 6, 2021 at 9:44 AM Viresh Kumar via Stratos-dev
> <stratos-dev@op-lists.linaro.org> wrote:
> >
> > On 05-08-21, 15:10, Arnd Bergmann wrote:
> > > I hope this can still be simplified by working out better which state
> > > transitions are needed exactly. In particular, I would expect that we
> > > can get away with not sending a VIRTIO_GPIO_MSG_IRQ_TYPE
> > > for 'mask' state changes at all, but use that only for forcing 'enabled'
> > > state changes.
> >
> > Something like this ?
> 
> > static void virtio_gpio_irq_mask(struct irq_data *d)
> > {
> >         /* Nothing to do here */
> > }
> 
> You'd have to do /something/ here I think, if only setting the flag
> that we don't want to deliver the next interrupt.
> 
> > static void virtio_gpio_irq_unmask(struct irq_data *d)
> > {
> >         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> >         struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> >
> >         /* Queue the buffer unconditionally on unmask */
> >         virtio_gpio_irq_prepare(vgpio, d->hwirq);
> > }
> 
> And check the flag here to not requeue it if it's masked.

I am not sure I understand why this would be required. If the
interrupt is getting disabled, then unmask will not get called here
and so we won't requeue anything. Same will happen with threaded
handlers where the interrupt gets unmasked at a later point of time.

> Now, there is already a flag in the irq descriptor, so rather than
> having double accounting, the easy way may be to
> just use irqd_irq_masked()/irq_state_set_masked(), or
> have the irq core take care of this.

-- 
viresh
