Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7AA3E1460
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 14:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbhHEMEM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 08:04:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:45990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232222AbhHEMEM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Aug 2021 08:04:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81B8061154;
        Thu,  5 Aug 2021 12:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628165038;
        bh=PUkPUdCS+EFwjPhDiy36RRp9jIOhYjhIvZ+Y2AdomvU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gRHH4wLfHAoHckki0adkRHZJlxKorg3iI1ULFM2E1CmKFkyeK3EN6KbVYfvnq5c4d
         uNCvzAxNFrCPn4XOmw36Q9A+7nbaMYSXnKGfDkaPfzAtkZ/wCtt2QRSmsJ5tMO6i8D
         kvMJ/1dvyO4y7v4roat2f//N1vQWt3puk31Ui3ogfhA2S1DNu2EmWc0o41QDhmwIDX
         zfdxRO/VbcQXZQvcFV2+HadCruWfDnYlpk5KtPlGQapjtf+iBtzHS0QpDoaettVdWe
         lE24CJ9o1Ab4qXg+1MmpHnSODKr4oGw6XS5oEGAgtSJ8Hpy4vnti9oBYRZGGN0kiFA
         tgQSAp34BgFRA==
Received: by mail-wr1-f54.google.com with SMTP id n12so6217159wrr.2;
        Thu, 05 Aug 2021 05:03:58 -0700 (PDT)
X-Gm-Message-State: AOAM532VrQYeiBo9bVW9raWm+vBeceDHUiREzZz3WNQ8W9P0NzzDCm21
        iKjNscsiA8V5wQVJYEVAWjngrnLDyJIXwG+W9D4=
X-Google-Smtp-Source: ABdhPJxM8yF9ntp+YFGPcBdE5QsOflMbRxXUGLBCAojbJQuy7+TQBwukBkQT2c6tY70LJ/zmNnIXtCtz5o6RtYRO4wI=
X-Received: by 2002:adf:fd90:: with SMTP id d16mr5092822wrr.105.1628165037147;
 Thu, 05 Aug 2021 05:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627989586.git.viresh.kumar@linaro.org> <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
 <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com> <0100017b1610f711-c53c79f2-9e28-4c45-bb42-8db09688b18e-000000@email.amazonses.com>
In-Reply-To: <0100017b1610f711-c53c79f2-9e28-4c45-bb42-8db09688b18e-000000@email.amazonses.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 5 Aug 2021 14:03:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com>
Message-ID: <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com>
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

On Thu, Aug 5, 2021 at 1:26 PM Viresh Kumar via Stratos-dev
<stratos-dev@op-lists.linaro.org> wrote:
>
> On 03-08-21, 17:01, Arnd Bergmann wrote:
> > As far as I can tell, the update_irq_type() message would lead to the
> > interrupt getting delivered when it was armed and is now getting disabled,
> > but I don't see why we would call update_irq_type() as a result of the
> > eventq notification.
>
> Based on discussion we had today (offline), I changed the design a bit
> and used handle_level_irq() instead, as it provides consistent calls
> to mask/unmask(), which simplified the whole thing a bit.

The new flow looks much nicer to me, without the workqueue, and
doing the requeue directly in the unmask() operation.

I don't quite understand the purpose of the type_pending and
mask_pending flags yet, can you explain what they actually
do?

Also, I have no idea about whether using the handle_level_irq()
function is actually correct here. I suppose if necessary, the driver
could provide its own irq.handler callback in place of that.

> Also I have broken the rule from specs, maybe we should update spec
> with that, where the specs said that the buffer must not be queued
> before enabling the interrupt. I just queue the buffer unconditionally
> now from unmask().
>
> I am not sure but there may be some race around the "queued" flag and
> I wonder if we can land in a scenario where the buffer is left
> un-queued somehow, while an interrupt is enabled.

Can that be integrated with the "masked" state now? It looks like
the two flags are always opposites now.

      Arnd
