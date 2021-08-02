Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825D83DDCD2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 17:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbhHBPxU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 11:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234782AbhHBPxS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 11:53:18 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB2BC06175F;
        Mon,  2 Aug 2021 08:53:08 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id e21so20119245pla.5;
        Mon, 02 Aug 2021 08:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=He1JxcN5PXlKNn8WaGEGVkwF8pqLAix+LjTxiFwgp/c=;
        b=XNpAgmIjsuknmLP/hmfJjSh6n8xb+F2JHP6pg1EoIsKveAjPCaItDVdN7L+BOi6JXk
         zREklnCiceNcLwr1M8TBz/tSWnE/5Gigj6GQW5upnPI4bA8e9rauLy4XHwq5qqbQ10HD
         p/H0cs1MRl56dvbVPtun/PIRk0lRLlC+ZbbTofj8+1NPHlFuv1o7aHL/aAaSFLii8B2q
         6dTRM9CljHRBSGjTPVXKnDXpFktbnhSevm4+nNn2M+OUK37wy2lmLu2xMQO7EVHDshg+
         tCVjM3c1amMmTibk1NGkw4FqzgaM9oNoDL1AvLUkubJoECoV5f7KTWGKQzaEDYzaQHCM
         VArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=He1JxcN5PXlKNn8WaGEGVkwF8pqLAix+LjTxiFwgp/c=;
        b=TyMaKT3B4i93IeM7Ec5VoPAD84tm1RMF8OY+hgfmpso6vz2IjeEWsS/27SKUxsCWXP
         XXXJ1brG1nGqZ6M02ofpvzdCzBekkrMLjYcQ2l8dgloXbSrycSK4h2+uFgE+4whY7krb
         RJ3YSd04z7AqxLh5vhZRYpVLG46bVwP5FBM6S9aoElJFhVco6e108m6Q7eUCnq8W/w8L
         5g4sNx10cdU44QzVGw/bqbIBYatmgtOTlpzHUQ8gI9IViAaxC1ddI/W4IehsNbDmAMv9
         1Wd3G4SY3OgNslOFhAP5j3/D9XwdJSso35Ynxi3KGzkA0gv4jjbLcvP8RrPhjFsEoHzF
         IQHw==
X-Gm-Message-State: AOAM530riAsR6evoz2vA6KbQrvHz8eJcROPjT6mxsh4M6z9knjq4jZXp
        +cNWp/yOO+aP4LVziT0PIrYnmJnhI+S08fQjHow=
X-Google-Smtp-Source: ABdhPJxwEvLKN3p+ghFL2b1migWxC4pLzUKlghPZSKKER7wEwrmikDgIvp6nap/xI43kdpA0WG0OezEDz9D+a42CxdM=
X-Received: by 2002:a17:90a:b10b:: with SMTP id z11mr18198490pjq.181.1627919588424;
 Mon, 02 Aug 2021 08:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-2-andriy.shevchenko@linux.intel.com> <20210802135839.4clqd34npppwasyh@mobilestation>
In-Reply-To: <20210802135839.4clqd34npppwasyh@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 2 Aug 2021 18:52:28 +0300
Message-ID: <CAHp75Vcz=vkaGObUcOOTZA51pHPoMc50RpPBLg4fgZgHdUStRA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] gpio: dwapb: Read GPIO base from gpio-base property
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 2, 2021 at 5:14 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Mon, Jul 26, 2021 at 03:54:34PM +0300, Andy Shevchenko wrote:
> > For backward compatibility with some legacy devices introduce
> > a new (*) property gpio-base to read GPIO base. This will allow
> > further cleanup of the driver.

Thanks for the review! My answers below.

> > *) Note, it's not new for GPIO library since mockup driver is
> >    using it already.
>
> You are right but I don't think it's a good idea to advertise the
> pure Linux-internal property "gpio-base" to any use-case like OF
> and ACPI FW nodes.

I don't want to advertise them, actually (that's why no bindings are
modified). Perhaps introducing a paragraph in the GPIO documentation
about this (and / or in GPIO generic bindings) that gpio-base property
is solely for internal use and should't be used in actual DTs?

>  Especially seeing we don't have it described in the
> DT-bindings and noting that the mockup driver is dedicated for the
> GPIO tests only. What about restricting the property usage for the
> SW-nodes only by adding an additional check: is_software_node() here?

I don't think we need this. But if you think it's better this way just
to avoid usage of this property outside of internal properties, I'm
fine to add. Perhaps we may issue a warning and continue? (see also
above)

> @Linus, @Bartosz, @Rob, what do you think about that?

-- 
With Best Regards,
Andy Shevchenko
