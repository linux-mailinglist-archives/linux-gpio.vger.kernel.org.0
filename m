Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1F3A1E7A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 17:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbfH2PJx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 11:09:53 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:37773 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbfH2PJx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 11:09:53 -0400
Received: by mail-qk1-f194.google.com with SMTP id s14so3255780qkm.4;
        Thu, 29 Aug 2019 08:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6u6dCwC2AXkIji3mWvHkjCdJECAtIHmA17odygtXfv4=;
        b=EmLtseUKbwckhUwybNTPRma2kFhUf0KBHggEvVEXhuDAw1OL5tuDurb0pdEpKmN4hW
         lm0cLveE80IYJLOuh6oXY4U8o8aCyYCIv9Jb2UPQgwytGNmaFMXxoY1O6wf1+TZtYwuf
         QsJ8e8/DUv/XU9sHXg0iGSO/QEijOz1MizLITpIO6SUOJpr7y0fCvqwoNt3VV0zeS/Du
         c3UFdl+aq092Sk/GQIzKs8rEZF8H7rJuNGG9x1nQIivWcrJC1i/OpJOUNeqjvorOPi9Y
         C3smr69EMx3IA9bXsQ/Ls32rWD0qagzBbFgfkecPo4bFWWtT0g1R7VNdJ6MxpqQNsI9n
         Cgeg==
X-Gm-Message-State: APjAAAV++5N4smUutPjhsU4vWubJBHUEhi6b/g0zshU6pu3z8SoCloYx
        pdHTyYamJs6nmARtxl21yXLJ3PKJV5uvIL8CVxU=
X-Google-Smtp-Source: APXvYqz+OTLX5WalC0BHdlzlG68GfRdHuWYXB7TEvUIwtsbgeNRNSEwMSu7vDs8mtEOGVF2Qu2vjyjHby17ElUNZrYQ=
X-Received: by 2002:a37:4051:: with SMTP id n78mr9705549qka.138.1567091392126;
 Thu, 29 Aug 2019 08:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190829143742.24726-1-brgl@bgdev.pl> <20190829143742.24726-4-brgl@bgdev.pl>
In-Reply-To: <20190829143742.24726-4-brgl@bgdev.pl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 29 Aug 2019 17:09:35 +0200
Message-ID: <CAK8P3a1vKmYS-sRj=GrjtqudjbYrwmEOEiKWOVRfHm2rLqxgPg@mail.gmail.com>
Subject: Re: [PATCH 3/9] lib: devres: provide new variants for devm_ioremap_resource()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 29, 2019 at 4:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> @@ -710,6 +710,10 @@ extern void devm_free_pages(struct device *dev, unsigned long addr);
>
>  void __iomem *devm_ioremap_resource(struct device *dev,
>                                     const struct resource *res);
> +void __iomem *devm_ioremap_resource_nocache(struct device *dev,
> +                                           const struct resource *res);
> +void __iomem *devm_ioremap_resource_wc(struct device *dev,
> +                                      const struct resource *res);
>
>  void __iomem *devm_of_iomap(struct device *dev,
>                             struct device_node *node, int index,
> diff --git a/lib/devres.c b/lib/devres.c

I think adding devm_ioremap_resource_wc() and
devm_platform_ioremap_resource_wc() makes sense, but I think we're
better off without devm_ioremap_resource_nocache() and
devm_ioremap_resource_cache().

The only architecture that actually has a difference between
ioremap() and ioremap_nocache() seems to be ia64. I would
generally assume that any driver using ioremap_nocache()
that is not ia64 specific should just use ioremap().

The ia64 version of ioremap() tries to guess whether it needs
a cached or uncached mapping, everyone else always
gets uncached these days.

       Arnd
