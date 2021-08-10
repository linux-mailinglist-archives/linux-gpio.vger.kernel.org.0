Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700F63E5452
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 09:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbhHJHfi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 03:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhHJHfi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 03:35:38 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C57C0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 00:35:16 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id a20so19867060plm.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7EzgN9g1XtwnyFgpdk0FQ59crTERL3asDSmTaguV9xw=;
        b=AuOgsblc4N+hr+jtlgYsCxhbLE8O+YSNlnuJH9zDj9JMZc+kCmcwFRTv+5/YNfgvn4
         +5kWdadLfVcSyV9nk99Q/4jdRKRY1W82ZPXDnYkr1oPJaxgjZf1VkVPKX9nmDLal5UXl
         Er6+ASCwLQwR8GqfcCyBbs1KpKrPfmGtqdtO8DEUZF5LrqxJ0kAgyNSUIiD+tpL4XeZ1
         Hx0cFNAI0y5mhD5XjHiJLiVktD6IJ/wTjTOtxivYNqN4gk9xFGuvecZnUhiN4Ihq2k9u
         msU5qKLy0QZGJwI07XEMoLHXzRraVZZKXO3Md+Dj442FU+8NSo0/cUSyyYpnM6n2pXc3
         acAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7EzgN9g1XtwnyFgpdk0FQ59crTERL3asDSmTaguV9xw=;
        b=C/FF0MTH5z414Fnav3XOue7wnIHktz+r4o2hqFxu2/5bHTkYmvcxSzWJHcL9VOr8jy
         MCsH4L6njqHacdbb6/Swt3z4Cam1OZBlWR9Tz1cgeCg4ozAhFsZ01PJUH8enB8Dnhia6
         GlAeQ2XNNQV25MeTv99valLBcXuaE3AZOfWu51PbPE6NJJ4+0ZHQftpn2DgvRXeAB2P1
         QtpiGj3uj5eLisNayp6ugB38T743HwUIfzNgKHyeBstCZJ/HNKjzM8Ml3b6ZWc6+3xw4
         HPgItLgR8caVJ5SlXoGK8NzV2v0Be0MoZGayHvaBstg9/fQ2LMK/RNOdmsMAMy4otAXh
         BYYw==
X-Gm-Message-State: AOAM533yEnMD/Etxhu95/VHTnuCvh/mMTz4OfhkU1/e3H9Lm8rAd9p6j
        UevFDyAmmaocDr7KSfUTxUlHRw==
X-Google-Smtp-Source: ABdhPJyTE+WX5eApTwQ/BWrztdRfSU9QZ8XJbeCuJSJ38AXbx5SetupsHR5upHroaSJcA82ydwu+0g==
X-Received: by 2002:a62:6307:0:b029:3ca:f9cc:b1b8 with SMTP id x7-20020a6263070000b02903caf9ccb1b8mr11838858pfb.39.1628580916410;
        Tue, 10 Aug 2021 00:35:16 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id lk17sm1854172pjb.37.2021.08.10.00.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 00:35:15 -0700 (PDT)
Date:   Tue, 10 Aug 2021 13:05:12 +0530
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
Message-ID: <20210810073512.5n5vsjvvurgdemk6@vireshk-i7>
References: <0100017b1610f711-c53c79f2-9e28-4c45-bb42-8db09688b18e-000000@email.amazonses.com>
 <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com>
 <20210805124922.j7lts7tfmm4t2kpf@vireshk-i7>
 <CAK8P3a0kbmPLGCBrjAv7-dW=JWq-pdSBeGUHCxUFmMKvKhCg7w@mail.gmail.com>
 <0100017b1a6c0a05-e41dc16c-b326-4017-a63d-a24a6c1fde70-000000@email.amazonses.com>
 <CAK8P3a2rrueXJHZxuiiShgVmLD916RaxW7xQHHjQXNFkM3Fpvg@mail.gmail.com>
 <20210809073020.y6ruibdm37xnx7hg@vireshk-i7>
 <CAK8P3a3TabswETDAUec-2rbiNBk_K48-UdpTA5Ckvu5ogOyHjQ@mail.gmail.com>
 <0100017b2a85eaf8-08b905fc-89f7-43a4-857e-070ca9691ce1-000000@email.amazonses.com>
 <CAK8P3a0L3Wg8a8ips97KQ4OskGCZp-5i=LUV0DqcVq__wrEZAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0L3Wg8a8ips97KQ4OskGCZp-5i=LUV0DqcVq__wrEZAw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09-08-21, 13:19, Arnd Bergmann wrote:
> I don't see anything wrong with this version,

Great.

> but let's see what
> Marc thinks. I expect that he can still poke some holes in it, or
> at least find some simplifications.

Right, though I may resend the patches properly first to make it less
confusing.

> I was slightly surprised at the relation between the disabled and
> masked states, where 'disable' always implies 'mask' and
> 'enable' always implies 'unmask', but I don't actually know how
> those two are actually defined in the irqchip code in Linux, so
> I assume you did this correctly.

I did have a look at the irq-core, but didn't go in real depth. I
rather saw how stuff happens at the driver's end.

- On setup-irq, the core only calls enable() and not unmask().
- On interrupt, the core calls mask(), followed by unmask() (which can
  be delayed for threaded irqs).
- On disable_irq(), the core only calls disable().
- On enable_irq(), the core only calls enable().

And so I ended up at this version :)

-- 
viresh
