Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D356A1D93
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 16:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbfH2Oss (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 10:48:48 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44102 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfH2Oss (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 10:48:48 -0400
Received: by mail-oi1-f194.google.com with SMTP id k22so2709520oiw.11;
        Thu, 29 Aug 2019 07:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hiAHa/voyVoH1QYery5m4rcBu4D5Fm5KhAfRtZkvLYc=;
        b=e598WGKRCD9ObOeLTHGjPSqb7Z0dYfuKPVPfkHsE6Z3x6UpbN3SN/PxYU2IqUU080d
         wQhVfISwFKXUoW9Zjv1WQeNDS8/znjgedYTjCF8ncsPAe7UAwh/HTZCwOygqVurZMUIk
         /sjf2xOCQgu00Sgp4GfLcppFhwUhMYdVDKXVy5YgIo8ZlOWLr8h1Pi9upRSyLCuoAjhK
         GBPTLJDpnPFGDnqTL1UiwI0kbqU2oJKH1BQf7P7WFcr/xVc68bYHZ7vH4xvFuz4tQ2vJ
         GHwNvxHTRhDO8p8844mH5qrRP12MysNGkj/XOuSREw/rtWoEVFmOJYABLcOxQotsdUhI
         72EQ==
X-Gm-Message-State: APjAAAVf5WooS6VAXuyFh9wsTFQRThOnJuM9oBFMpRRwnqs27YOxh9KY
        qmcEs3yTOz0Cy0/npy+6c9L3acinTkMWnsdziRU=
X-Google-Smtp-Source: APXvYqzVzozGOwks5QWXJdwAqpHzNYHb0M9r4XWLvaaHNaQd3/t/cwLqEmG48jVTfERS0tta0PFe8HvjWD3HWdEXY1A=
X-Received: by 2002:aca:3382:: with SMTP id z124mr6945510oiz.102.1567090127215;
 Thu, 29 Aug 2019 07:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190829143742.24726-1-brgl@bgdev.pl>
In-Reply-To: <20190829143742.24726-1-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Aug 2019 16:48:36 +0200
Message-ID: <CAMuHMdW8d1h-81jy-dgDiLfGB3MGPx+f-Zqz+4D5S+gtmk3-BQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] drivers: add new variants of devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Thu, Aug 29, 2019 at 4:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> The new devm_platform_ioremap_resource() helper has now been widely
> adopted and used in many drivers. Users of nocache and write-combined
> ioremap() variants could profit from the same code shrinkage. This
> series provides two new versions of devm_platform_ioremap_resource()
> and uses it in a few example drivers with the assumption that - just
> like was the case previously - a coccinelle script will be developed
> to ease the transition for others.

Please be aware that the number of ioremap() variants is being
reduced, as some of them are redundant (e.g. ioremap() already creates
an uncached mapping, so ioremap_nocache() is not needed).
So less is better than more ;-)

https://lore.kernel.org/lkml/20190817073253.27819-1-hch@lst.de/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
