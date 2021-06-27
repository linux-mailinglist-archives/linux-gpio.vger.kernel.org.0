Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28EA83B52B0
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 11:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhF0JgT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 05:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhF0JgS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 05:36:18 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80901C061574;
        Sun, 27 Jun 2021 02:33:54 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id m15-20020a17090a5a4fb029016f385ffad0so8390301pji.0;
        Sun, 27 Jun 2021 02:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tZZOgTnq26cH7u8v9oWnAIqSJbt/egQbz+Tfs+AJnPI=;
        b=Q9eppwkaNL0zTXMDMHbQI5GQYYW0P1hAguQHSwSgJC2w+ppzBCGvAi8gHXFNcDK0TF
         PqXaLsY5znilix5mQtPAyoCHDvp5uL/9tpdl93Z9MerCK4MTQ3B2S3ayYHK4Vx7oL5cp
         DglfW1HcxUP8gRD246GGWKHegoUcuM0anQkuLxr2z551C1kO6WsolFC84nvhtjNDCZPc
         K9RrnvNBt71sWp095ltGHuznLlbAJsrjZH71ItbUpXixNUigUZeqPqBGRO3XUodtshjj
         cQsVo+xV3+gvR7ATOkWxPto7iSMhAbr2k6kKLcLYPiwYtw8sB4LT8psEBCbyhJlFLEcb
         XNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tZZOgTnq26cH7u8v9oWnAIqSJbt/egQbz+Tfs+AJnPI=;
        b=gmOS6BLVtzLo5Rr8ssfu3znN5d68nFNDNeNNnTxaGiX3WUjGLqD+IhSiAGEV930KhS
         VzFykdgErJc/LATJzwaGnA6PeHgqguBLxheOE25gbeDoBd0oOqfvZ1MCPjU/qtp7AEzw
         Gm8JPHx0MPnU9ROZjAe7UzN0vl2hoarXL44GA37ih4FbElwyLGbhJL2U/uXxgdK1nV0B
         bWZJZRKqJkDqluxkWjkSAM+DTKpqrspo85dYclY7cOnGRxWxUNhHs0jFCnYEyft1SgTd
         Izo3Lq48zKbPbrEBKXTqPH5sWKxm0pdXUc3IXxZdsS52Psl7pj3jf4MceZlkirUHNzeh
         3Vmg==
X-Gm-Message-State: AOAM533yglgWqBuOd4rIz/cbFl8exjuNhj+6AzkcXEJtPM2n1t1X215B
        3wI8HaXpb1Alf+YRRsMTXXQJQ20kiRQ1EZVZE1A=
X-Google-Smtp-Source: ABdhPJwltJO8wkNr3+ICbhVPX6HFxOvTiRYgeIkpHJD/xorGlOa81O4Efq8WKFv3ng30WnuxLHv92EYTDORymsCkRGU=
X-Received: by 2002:a17:902:fe0a:b029:11d:81c9:3adf with SMTP id
 g10-20020a170902fe0ab029011d81c93adfmr17190069plj.0.1624786434004; Sun, 27
 Jun 2021 02:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 27 Jun 2021 12:33:18 +0300
Message-ID: <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        git@johnthomson.fastmail.com.au,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        neil@brown.name, opensource@vdorst.com,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 26, 2021 at 7:18 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> The default handling of the gpio-line-names property by the
> gpiolib-of implementation does not work with the multiple
> gpiochip banks per device structure used by the gpio-mt7621
> driver.
>
> This commit adds driver level support for the device tree
> property so that GPIO lines can be assigned friendly names.



> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
> Hi,
>
> This driver has three gpiochips with 32 gpios each. Core implementation

implementation


> got gpio's repeated along each gpio chip if chip.names is not assigned.
> To avoid this behaviour driver will set this names as empty or

the driver
these names

> with desired friendly line names. Consider the following sample with
> minimal entries for the first chip with this patch changes applied:

The same comment as per v1:

Any idea why it's not a duplicate of
https://elixir.bootlin.com/linux/v5.13-rc7/C/ident/devprop_gpiochip_set_names,
and why the latter is not called in your case?


--
With Best Regards,
Andy Shevchenko
