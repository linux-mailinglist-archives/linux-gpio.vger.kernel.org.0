Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DCB3AB2FB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 13:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhFQLuA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 07:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbhFQLuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 07:50:00 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411ADC061760
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 04:47:53 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so5947714pjs.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QasMKCIaT47MEF+OQcq8zCDU70HNznQ46OZY6zak3V8=;
        b=YjZuzJ+NWs/14eFKW5mhz42xgNpTsEoV8oZ4cGMsIt9+TzUz1kdmMAfO7xXHgkQq0g
         Ia52JM8iI2whXeKXN/2K6F02pd30D8emps0Jz+/nxWU8zMyroF/HKtyZs5qCYlzNmEFJ
         m1yVj/8f0dsS3m91UPPLrJbA2NkmqZvlrMmaw9lNTbI7VTp9n0jNRu9BOOijGr2AEU18
         UDj8Jdz3wNufxBoaVID02yn3JU9Jx6JugUxGJy8fvS3DFGr1i+L/IPXOWIzR9TlnRoRh
         9r23X01QaTcw9X0haydqFp7C96joqt3lzre2lMeS5hILGfLAh249oeK4Yi6TA9AHtQlQ
         VIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QasMKCIaT47MEF+OQcq8zCDU70HNznQ46OZY6zak3V8=;
        b=Fbww9zOKvL31vGvCky0SzPbCOYitOBzr5pU5S7s0ecTAX0JDFG/8N+hBAtWHx/9SHe
         2ilRll7W90EerNaYcYB0Q7RoYCO2HJtHdqborpnltG0NDYh9J2ZLhwPlnJY+InLJLZXZ
         PHxZeWqPPvUqe2569cQwzvnXriGEGEp6+fe/tpomvdvVd+f0q3d/HOOAXparazIz4z6p
         YkTtY9egl6a3OLp34waUxpVsGZakpMgDntMXrtoghN7GOF68iTOlXYMdqhE0C6h8E//r
         AQPgNUtnG85j0nvTbOMNvTNlBTMCdCTethrARsWzWlDah3zmi46UXtn2luTeAdIqAqsH
         kETw==
X-Gm-Message-State: AOAM532uQ3JV/BCj+S/7foilXriyJQrPVe+oNOjT/e5+NJeCBjngNW83
        IvQ4kqbdKXvcHcGo2fuclRJgIQ==
X-Google-Smtp-Source: ABdhPJxIrIzZcQtKYc+FRL5bxfc04IWWpEdqgixoIsZEOGYOtWJ6eX9RHjce0kFNtrQQQX1ZD1W97A==
X-Received: by 2002:a17:90a:6b42:: with SMTP id x2mr5108905pjl.16.1623930472719;
        Thu, 17 Jun 2021 04:47:52 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id u23sm6288551pgk.38.2021.06.17.04.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:47:51 -0700 (PDT)
Date:   Thu, 17 Jun 2021 17:17:49 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20210617114749.uueu2v63duepfunb@vireshk-i7>
References: <20210616114934.n3grzuh6c64wlaj6@vireshk-i7>
 <5cffb354-0d00-5ace-260d-61ac0c4c7491@metux.net>
 <20210617035901.kfzps6kg2emthjf4@vireshk-i7>
 <116f8135-4ddf-e8fc-6838-94093702ec3d@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <116f8135-4ddf-e8fc-6838-94093702ec3d@metux.net>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-06-21, 11:54, Enrico Weigelt, metux IT consult wrote:
> Actually, I am subscribed in the list. We already had debates on it,
> including on your postings (but also other things).

Right.

> And the ascii
> version of the spec actually landed on the list last year, we had
> discussions about it there.

I tried to search for it earlier, but never found anything on virtio
list.  Maybe I missed it then.

> I've just had the problem that my patches didn't go through, which is
> very strange, since I actually am on the list and other mails of mine
> went through all the time. I'm now suspecting it's triggered by some
> subtle difference between my regular mail clients and git send-email.
> 
> > Since you started this all and still want to do it, I will take my
> > patches back and let you finish with what you started. I will help
> > review them.
> 
> Thank you very much.
> 
> Please don't me wrong, I really don't wanna any kind of power play, just
> wanna get an technically good solution. If there had been any mis-
> understandings at that point, I'm officially saying sorry here.

Its okay, we are both trying to make things better here :)

> Let's be friends.
> 
> You mentioned you've been missing with my spec. Please come foreward and
> tell us what exactly you're missing and what your use cases are.

I have sent a detailed review of your spec patch, lets do it there
point by point :)

> Note that I've intentionally left off certain "more sophisticated"
> functionality we find on *some* gpio controllers, eg. per-line irq
> masking, pinmux settings for several reasons, e.g.:
> 
> * those are only implemented by some hardware
> * often implemented in or at least need to be coordinated with other
>   pieces of hw (e.g. in SoCs, pinmux is usually done in a separate
>   device)
> * it shall be possible to support even the most simple devices and
>   have the more sophisticated things totally optional. minium
>   requirements for silicon implementations should be the lowest possible
>   (IOW: minimal number of logic gates)
> 
> >> You sound like a politician that tries to push an hidden agenda,
> >> made by some secret interest group in the back room, against the
> >> people - like "resistance is futile".
> >
> > :)
> 
> Perhaps I've been a bit overreacting at that point. But: this is really
> that kind of talking we hear from politicians and corporate leaders
> since many years, whenever they wanna push something through that we the
> people don't want. Politicians use that as a social engineering tool for
> demotivating any resistance. Over heare in Germany this even had become
> a meme, and folks from CCC made a radio show about and named by that
> (the German word is "alternativlos" - in english: without any
> alternative). No idea about other countries, maybe it's a cultural
> issue, but over here, those kind of talking had become a red light.
> 
> Of course, I never intended to accuse you of being one of these people.
> Sorry if there's been misunderstanding.

It sounded strange yesterday to be honest, but I have gone past it
already :)
 
> Let's get back to your implementation: you've mentioned you're routing
> raw virtio traffic into userland, to some other process (outside VMMs
> like qemu) - how exactly are you doing that ?
> 
> That could be interesting for completely different scenarios. For
> example, I'm currently exploring how to get VirGL running between separate
> processes running under the same kernel instance (fow now we
> only have the driver side inside VM and the device outside it), means
> driver and device are running as separate processes.
> 
> The primary use case are containers that shall have really GPU generic
> drivers, not knowing anything about the actual hardware on the host.
> Currently, container workloads wanting to use a GPU need to have special
> drivers for exactly the HW the host happens to have. This makes generic,
> portable container images a tuff problem.
> 
> I haven't digged deeply into the matter, but some virtio-tap transport
> could be an relatively easy (probably not the most efficient) way to
> solve this problem. In that scanario it would like this:
> 
> * we have a "virgl server" (could be some X or wayland application, or
>   completely own compositor) opens up the device-end of an "virtio-tap"
>   transport and attaches its virtio-gpio device emulation on it.
> * "virtio-tap" now creates a driver-end, kernel probes an virtio-gpu
>   instance on this (also leading to a new DRI device)
> * container runtime picks the new DRI device and maps it into the
>   container(s)
>   [ yet open question, whether one DRI device for many containers
>     is enough ]
> * container application sees that virtio-gpu DRI device and speaks to
>   it (mesa->virgl backend)
> * the "virgl-server" receives buffers and commands from via virtio and
>   sends them to the host's GL or Gallium API.
> 
> Once we're already there, we might think whether it could make sense
> putting virtio routing into kvm itself, instead of letting qemu catch
> page faults and virtual irqs. Yet have to see whether that's a good
> idea, but I can imagine some performance improvements here.

We (at Linaro) work on software enablement normally and not end
products (rarely that happen though), like framework level work in the
kernel which can later be used by everyone to build their drivers on.

There are many companies like Qualcomm, ST Micro, etc, who want to use
Virtio in general for Automotive or other applications / solution. The
purpose of Project Stratos [1], an initiative of Linaro, is working
towards developing hypervisor agnostic Virtio interfaces and
standards. The end products and applications will be worked on by the
members directly and we need to add basic minimum support, with all
the generally required APIs or interfaces.

-- 
viresh

[1] https://linaro.atlassian.net/wiki/spaces/STR/overview
