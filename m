Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7ADEFB4B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388772AbfKEKci (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:32:38 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35804 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388583AbfKEKcg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:32:36 -0500
Received: by mail-oi1-f194.google.com with SMTP id n16so17062281oig.2;
        Tue, 05 Nov 2019 02:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iyU7I3+wA8xz3yY7wIVDgPQ0SwWRU8/JQIMa0TOkIFM=;
        b=iKkwpo8arvHoUNwenfLDirmdxnKJ0k4OTRYemjGcU71Y0s7SDmamgi9FFOrU/8sp8V
         1MPiUMUQuz+Bg8PjHwVzAsPNxoGhLwl8IKcDkVQG4daCPrFwH0gETy8kj+tK4GztwzPY
         CdoYsyb2PNZcc/ZWQPEZcLP4HGGllOZkKQ08+VXDUt/WlhxuJmt0wbpOz6gANy0+n7LK
         OgBwpX+VUF+MHi4HZCQmF/2z1QbH/nBBqvrHRkI3c/GTMqFrfCLJPHHdD6R3tL5ylm9y
         bnQ5l5aoH8wWj8IOJ49jKApDI8wo3UDuwghdhbgPq12vqwhfpY4dEJ5NyXMjtRXq2xIS
         FnhA==
X-Gm-Message-State: APjAAAUs4oOwr4vSbCb9v10w48r8WYz10uYXAf/8frTKyG5VTiPk5HYg
        qa69DB10WxjJvOeuLJDr4dr5+iSrod836AXkdN0=
X-Google-Smtp-Source: APXvYqzN8ejo/GmJx/Kagnb4mlYhDh6f20ux9hLD3rH2NISGRcux1+Go5dGCA5J/NiD1U86kKHKDxhdky26vJiekznM=
X-Received: by 2002:aca:3a86:: with SMTP id h128mr3202765oia.131.1572949955929;
 Tue, 05 Nov 2019 02:32:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572945879.git.matti.vaittinen@fi.rohmeurope.com> <05e85f2812eb4e6b92cdd9054ecba675d206db66.1572945879.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <05e85f2812eb4e6b92cdd9054ecba675d206db66.1572945879.git.matti.vaittinen@fi.rohmeurope.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Nov 2019 11:32:25 +0100
Message-ID: <CAMuHMdU6Ws8exqQx9mL0RUAUzeMni7GHccaBo75JTKBqyqQCHA@mail.gmail.com>
Subject: Re: [PATCH 35/62] gpio: gpio-rcar: Use new GPIO_LINE_DIRECTION
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 5, 2019 at 11:29 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
> It's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
