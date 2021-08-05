Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77A73E150C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 14:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241491AbhHEMtl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 08:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbhHEMtl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 08:49:41 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F3FC0613C1
        for <linux-gpio@vger.kernel.org>; Thu,  5 Aug 2021 05:49:26 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id mz5-20020a17090b3785b0290176ecf64922so14462274pjb.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Aug 2021 05:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F1MbFXcnuN9pjWPNAa72glUadkAUJinAs+z8GV+IyLk=;
        b=GPPWMa0bFoy0buCBXmfsNtAnrv5MXxcRHUZJ7/r7DHglcCHVdT5R2BkodtNr8fXb9E
         wPevm0KEqOa9H8wb/A3lHwCeo8e090BOPSSbzj+FsYFI3DUeUnHD8HjOHwVMfiWeQ1wh
         wTknrNOO8Sig9Lj5qWg7ty5OgIgw194KG4e165244BPRJ3xWGTmJFMoV8LtbfRCIXTII
         P5dlErGWaZzNzirHtL2HKOfUAdVztx58SsHeyqTIBzCmqyp+TZvk6npEI3Nfiw6ZErVE
         PW4aWzRFnLQFh4gxeXk8A6mZVTR8SBP+jVOccXd568slgkD5dKs9L+UBx8GzZDKuDZha
         dZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F1MbFXcnuN9pjWPNAa72glUadkAUJinAs+z8GV+IyLk=;
        b=KTt7XdaOQnLQQc/YsUUrt03FEPgdtPRumn00xt2EtV31iIWxguUpER4bSKUqNzTI8H
         BUMKytWdqLLOyfpJ+52WmpHBiG/UfThunkm66gxM8k4PujLk5AxOkij0F+7iK9bPU2+c
         aPS0yHng2MKbtK1qoA4V8PGo2mROIeQA0a2Ze3qCnMHYfFfX1THXoBGS58C7q9/vXJwO
         BDw2tzKZiKJMIB5Nc1gbD1pPQCXgNtufRcVzo12Zj2AanuVot+QGPQFmCeH43gUFpjW9
         1zSc506gbfZ4McF6VDStayTKFUxbwl/s8Ijq93e4kR3jpTECBbqdxZeONcjEBI+pDmOJ
         l6SA==
X-Gm-Message-State: AOAM530pB41NGN5P5PPWRGQLBIewLbDP2k/thuxKY07M+Vb72WoWuBne
        6rMyMGZducMjp0b96CS+Z40Kxw==
X-Google-Smtp-Source: ABdhPJz0h7q3yTGaeHYn8lFKeSzJMOv94e7fkfP1oY5TE3vNb42+mj6TLtrxhtTA2RCH7pmg/EpgDw==
X-Received: by 2002:a17:90a:1f8a:: with SMTP id x10mr4472178pja.167.1628167766138;
        Thu, 05 Aug 2021 05:49:26 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id u16sm7963740pgh.53.2021.08.05.05.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 05:49:25 -0700 (PDT)
Date:   Thu, 5 Aug 2021 18:19:22 +0530
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
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jason Wang <jasowang@redhat.com>
Subject: Re: [Stratos-dev] [PATCH V4 2/2] gpio: virtio: Add IRQ support
Message-ID: <20210805124922.j7lts7tfmm4t2kpf@vireshk-i7>
References: <cover.1627989586.git.viresh.kumar@linaro.org>
 <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
 <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com>
 <0100017b1610f711-c53c79f2-9e28-4c45-bb42-8db09688b18e-000000@email.amazonses.com>
 <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05-08-21, 14:03, Arnd Bergmann wrote:
> On Thu, Aug 5, 2021 at 1:26 PM Viresh Kumar via Stratos-dev
> > Based on discussion we had today (offline), I changed the design a bit
> > and used handle_level_irq() instead, as it provides consistent calls
> > to mask/unmask(), which simplified the whole thing a bit.
> 
> The new flow looks much nicer to me, without the workqueue, and
> doing the requeue directly in the unmask() operation.
> 
> I don't quite understand the purpose of the type_pending and
> mask_pending flags yet, can you explain what they actually
> do?

They are required to make sure we don't send unnecessary
VIRTIO_GPIO_MSG_IRQ_TYPE events to the device, every time bus_unlock()
is called.

mask_pending tracks if the masked state has changed since the time
last bus_unlock() was called. So on an interrupt, both mask() and
unmask() will get called by the irq-core now and mask_pending will
change to true (in mask()} and then false (in unmask()). And
eventually in bus_unlock() we won't send an extra
VIRTIO_GPIO_MSG_IRQ_TYPE message.

> Also, I have no idea about whether using the handle_level_irq()
> function is actually correct here. I suppose if necessary, the driver
> could provide its own irq.handler callback in place of that.

After looking at internals of these, I felt handle_level_irq() suits
much better in our case as we need to queue the buffer only at
unmask(). With handle_fasteoi_irq(), we would be required to do the
same from multiple places, unmask(), eoi().

> > Also I have broken the rule from specs, maybe we should update spec
> > with that, where the specs said that the buffer must not be queued
> > before enabling the interrupt. I just queue the buffer unconditionally
> > now from unmask().
> >
> > I am not sure but there may be some race around the "queued" flag and
> > I wonder if we can land in a scenario where the buffer is left
> > un-queued somehow, while an interrupt is enabled.
> 
> Can that be integrated with the "masked" state now? It looks like
> the two flags are always opposites now.

Yeah, but then there can be races and keeping them separate is a
better thing IMO.

I was thinking of something on these lines, disable_irq() followed by
enable_irq():

CPU0                                                 CPU1

disable_irq()
 -> irq_bus_lock()
 -> irq_mask()
 -> irq_bus_sync_unlock()
   -> sends blocking VIRTIO_GPIO_MSG_IRQ_TYPE
      to disable interrupt
                                                     Backend (at host) disables irq and 
                                                     returns the unused buffer.

enable_irq()
 -> irq_bus_lock()
 -> irq_unmask()
   -> Tries to queues buffer again
      Finds it already queued and returns.
                                                     - virtio_gpio_event_vq() runs at guest
                                                     - Finds VIRTIO_GPIO_IRQ_STATUS_INVALID in status
                                                     - returns without doing anything
 -> irq_bus_sync_unlock()
   -> sends blocking VIRTIO_GPIO_MSG_IRQ_TYPE
      to enable interrupt



So the irq is still enabled and the buffer isn't queued. Yes, need
some locking here for sure, confirmed :)

-- 
viresh
