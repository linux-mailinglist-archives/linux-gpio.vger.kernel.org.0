Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1513E448D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 13:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbhHILUH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 07:20:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:52728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234657AbhHILUH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Aug 2021 07:20:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2E0C61004;
        Mon,  9 Aug 2021 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628507986;
        bh=RQCOogQ9mJQxyDapNiOoSY73gdfpVbaZ71bUZ+LL2NA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UecVt6vx5862rMgdKPGDZ5nFaiR+XCtrI3nH+YgZsgyeEKU90IQCTUDJDcMrc5RIs
         rzNFq6Cr7K/UCqkqE+l8NDoZTRhcriNtyLxa8hAL4SGxKdQPJlq2ONRsiAqbdLjsGi
         viqiDZkMG8P3wC+M6vl0DgTScfTiMGhpxpJEXXD2IQF1cOOG9HswP2s/mQh39rPD9K
         Y2z9wmRMTiQg7S6NTOBfgMdXdtVY92U25PWyc21ggvb14icB25KljZbxyfmPJjgZ+5
         eQSRZ12YxcYBr1udpSMl+45fFv/RcCKjwgRqLC4/nVMarGPfnZi0iGL0ZCXeFRVbI9
         BQGMcor8YjzwA==
Received: by mail-wm1-f44.google.com with SMTP id d131-20020a1c1d890000b02902516717f562so11246950wmd.3;
        Mon, 09 Aug 2021 04:19:46 -0700 (PDT)
X-Gm-Message-State: AOAM532whSvAqbLHq+ULgFyvnTXXFP6aS+iX9wJx/gY9Dds7+uxO8pMH
        IUJyCZ5PQRFxMMs6F7qlnIAJZJhSpGfEhrBBz08=
X-Google-Smtp-Source: ABdhPJy/gQFqWtKPTewnQcS4i0Qy8/1Qz0/EDjK/S5Yypcd1Jcj8yNomlxp6WiiR0A3m4+JYUiJaXCS6t1ZWV4FzDA0=
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr32350595wmc.75.1628507985226;
 Mon, 09 Aug 2021 04:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
 <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com>
 <0100017b1610f711-c53c79f2-9e28-4c45-bb42-8db09688b18e-000000@email.amazonses.com>
 <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com>
 <20210805124922.j7lts7tfmm4t2kpf@vireshk-i7> <CAK8P3a0kbmPLGCBrjAv7-dW=JWq-pdSBeGUHCxUFmMKvKhCg7w@mail.gmail.com>
 <0100017b1a6c0a05-e41dc16c-b326-4017-a63d-a24a6c1fde70-000000@email.amazonses.com>
 <CAK8P3a2rrueXJHZxuiiShgVmLD916RaxW7xQHHjQXNFkM3Fpvg@mail.gmail.com>
 <20210809073020.y6ruibdm37xnx7hg@vireshk-i7> <CAK8P3a3TabswETDAUec-2rbiNBk_K48-UdpTA5Ckvu5ogOyHjQ@mail.gmail.com>
 <0100017b2a85eaf8-08b905fc-89f7-43a4-857e-070ca9691ce1-000000@email.amazonses.com>
In-Reply-To: <0100017b2a85eaf8-08b905fc-89f7-43a4-857e-070ca9691ce1-000000@email.amazonses.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 9 Aug 2021 13:19:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0L3Wg8a8ips97KQ4OskGCZp-5i=LUV0DqcVq__wrEZAw@mail.gmail.com>
Message-ID: <CAK8P3a0L3Wg8a8ips97KQ4OskGCZp-5i=LUV0DqcVq__wrEZAw@mail.gmail.com>
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

On Mon, Aug 9, 2021 at 12:47 PM Viresh Kumar via Stratos-dev
<stratos-dev@op-lists.linaro.org> wrote:
>
> On 09-08-21, 09:55, Arnd Bergmann wrote:
> > Ah, right. There is already a flag that gets checked by the caller.
> >
> > It does feel odd to have an empty 'irq_mask' callback though, so
> > maybe there is still something missing, just not what I thought.
> >
> > It's probably the result of calling handle_level_irq(), which as you
> > said is closer to what we want, but is not exactly what we need for
> > this protocol.
>
> Okay, I have tried to take care of locking as well now and used local
> flags only to make sure I can depend on them to get the locking
> working properly. Lets see what's broken in this now :)

I don't see anything wrong with this version, but let's see what
Marc thinks. I expect that he can still poke some holes in it, or
at least find some simplifications.

I was slightly surprised at the relation between the disabled and
masked states, where 'disable' always implies 'mask' and
'enable' always implies 'unmask', but I don't actually know how
those two are actually defined in the irqchip code in Linux, so
I assume you did this correctly.

          Arnd
