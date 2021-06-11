Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441463A3A97
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 05:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhFKD6e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 23:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbhFKD6d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 23:58:33 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA386C0617AD
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 20:56:25 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id mp5-20020a17090b1905b029016dd057935fso5037530pjb.5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 20:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y2qSt5MTPC4i/yZdbT2U8qNkMyz0fUe0S4KpmrMnVM0=;
        b=Pp54dHVW2lnIM30U3BV+erjZRwPxWl9KORNqmsFACq8HbKd5iPcisfpwWc91sIL5Ij
         9S771WrqAVUEKhWx7BqzNbsS5RF80FgTojcY/EGfrtgbqjeDp/LmqmWxO5D8EPPnfVxr
         xPX3zlRloqrk+x4GWXKe4dHJpJFv3yOGGjjKW2mm3RJxhkXsVtZgMPCtQj+EooWZddvZ
         hM5t8W2h9iE076WyTRmzN6YfCuF2c+7ZcUODvU46ko+T0SCOYbZtXwqvQ/hohb2B0d41
         INHeHvqoarmtJaERP8nL++YxGKksgDcSxw+x1ezbmqK8LApbkQbcvC8yhOXIyIsP0sk2
         lKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y2qSt5MTPC4i/yZdbT2U8qNkMyz0fUe0S4KpmrMnVM0=;
        b=IALklBNyu9nFc9FpWbS49lABrD1UwDGK/CVk7V3xu5Kzwti5703QAQ97FOfjUyWjbD
         sZtxQiT/otmDT0uD99K/5NdCL1vjTY6lYW7B+dK3wr8VNFT4fX7bHNjk6hAVnO71ExCr
         YNGZNuXeeUUvHaod1CeD56z1OPD2UbY7ea46YJq4LycCfDtfkFcS+CgapcptYOOfaokI
         QYMWTkTo8gmTZgjuUYnYG1ULkWewoYPy4VIYsx4eo7sCopWixeEogbGCUGQUXnD6rjSb
         AbQcbl3McAKJMMRAiBq6WzFOT6Hfvi3pWm3c8ElK99EgrFRu1l84OTYYXb7tkq5uetH0
         fAhQ==
X-Gm-Message-State: AOAM533Rh6dXRKpD359vumw6dpD2ZO/NJwIurhXX9o+7abYKjMKvrsr3
        dXKmM+eUiIw/vM6NtkGtkrIedg==
X-Google-Smtp-Source: ABdhPJzxIiGetfFhS9ztQIZMMt8HMOkWddsWstwWGvKVrQ/FQp/VBvvqy+rgJCiiMFWYHJR4YkU9QA==
X-Received: by 2002:a17:902:8695:b029:fd:6105:c936 with SMTP id g21-20020a1709028695b02900fd6105c936mr2013079plo.25.1623383785323;
        Thu, 10 Jun 2021 20:56:25 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id g8sm3889378pgo.10.2021.06.10.20.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:56:24 -0700 (PDT)
Date:   Fri, 11 Jun 2021 09:26:23 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org,
        Alistair Strachan <astrachan@google.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 10-06-21, 22:46, Linus Walleij wrote:
> Hi Viresh!
> 
> thanks for working on this, it's a really interesting driver.
> 
> My first question is conceptual:
> 
> We previously have Geerts driver for virtualization:
> drivers/gpio/gpio-aggregator.c
> 
> The idea with the aggregator is that a host script sets up a
> unique gpiochip for the virtualized instance using some poking
> in sysfs and pass that to the virtual machine.
> So this is Linux acting as virtualization host by definition.
> 
> I think virtio is more abstract and intended for the usecase
> where the hypervisor is not Linux, so this should be mentioned
> in the commit, possibly also in Kconfig so users immediately
> know what usecases the two different drivers are for.

Well, not actually.

The host can actually be anything. It can be a Xen based dom0, which
runs some proprietary firmware, or Qemu running over Linux.

It is left for the host to decide how it wants to club together the
GPIO pins from host and access them, with Linux host userspace it
would be playing with /dev/gpiochipN, while for a raw one it may
be accessing registers directly.

And so the backend running at host, needs to pass the gpiochip
configurations and only the host understand it.

The way I test it for now is by running this with Qemu over my x86
box, so my host side is indeed playing with sysfs Linux.

> Possibly both could be used: aggregator to pick out the GPIOs
> you want into a synthetic GPIO chip, and the actual talk
> between the hypervisor/host and the guest using virtio, even
> with linux-on-linux.

Not sure if I understand the aggregator thing for now, but we see the
backend running at host (which talks to this Linux driver at guest) as
a userspace thing and not a kernel driver. Not sure if aggregator can
be used like that, but anyway..

> Yet another usecase would be to jit this with remoteproc/rpmsg
> and let a specific signal processor or real-time executive on
> another CPU with a few GPIOs around present these to
> Linux using this mechanism. Well that would certainly interest
> Bjorn and other rpmsg stakeholders, so they should have
> a look so that this provides what they need they day they
> need it. (CCed Bjorn and also Google who may want this for
> their Android emulators.)

I am not very clear on the rpmsg thing, I know couple of folks at
project Stratos were talking about it :)

@Alex, want to chime in here for me ? :)

> On Thu, Jun 10, 2021 at 2:16 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > +static const char **parse_gpio_names(struct virtio_device *vdev,
> > +                              struct virtio_gpio_config *config)
> 
> I really like this end-to-end plug-and-play that even provides
> the names over virtio.

The credit goes to Enrico for this :)

> I think my patch to the gpiolib to make it mandatory for names to
> be unique per-chip made it in, but please make that part of the spec
> so that we don't get the problem with non-unique names here.

Oh, that's nice. I will surely do that.

> I suppose the spec can be augmented later to also accept config
> settings like open drain pull up/down etc but no need to specify
> more than the basic for now.

That's the plan.

> But to be able to add more in the future, the client needs some
> kind of query mechanism or version number so the driver can
> adapt and not announce something the underlying virtio device
> cannot do. Do we have this? A bitmask for features, a version
> number that increase monotonically for new features to be
> presented or similar?
> 
> Because otherwise we have to bump this:
> +#define VIRTIO_ID_GPIO                 41 /* virtio GPIO */
> 
> every time we add something new (and we will).

Yes, Virtio presents features for this. The patch 2/3 already uses one
for IRQs. We won't need to bump up the IDs :)

-- 
viresh
