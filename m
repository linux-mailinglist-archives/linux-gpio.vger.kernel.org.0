Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE655255D2D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 16:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgH1O5C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 10:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgH1O5A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 10:57:00 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53B9C061264;
        Fri, 28 Aug 2020 07:57:00 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t11so580609plr.5;
        Fri, 28 Aug 2020 07:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nRvu+qRJqDJhNa3gYpoNc/gx5D78M+eCbN8D4GvM74w=;
        b=o7kSzWU8Z9uef/5hTVmhxLBrUMmZ95TP0woeDAYb5WDxIuLxIFHhAbQeuPEjRwp5xm
         3dGtIGGEZ3UQsDbr6eUXebjQ9LFCNPOCLCHtV6kA9FuOq8jaM+GrZOKllRDmngnwDNhm
         H64VzfWfcAOInnLFQfHIAfwEEo4Ne+KnCnA8nBSErANT/s8bislIijA2I11G/nV9zk10
         s/Px8/usAsA7bwixahN6gMXHIEE3HpPyVxwPABIi6UFGbLYPMYPerLmFxChaIiwVEhqM
         FZ2+Y+WtVR3u+zTdP5HJBTnhWQYI637rInWB5gEZORRfFt7O7E2eH5UZZXj1SgaI7pd4
         xZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nRvu+qRJqDJhNa3gYpoNc/gx5D78M+eCbN8D4GvM74w=;
        b=sUPUz05oA0d4ng5AmsXtut0G0Eo0WgcLTUYfLuiin/keBU0FOB4TXvQnB5VzdHud2n
         3iLJPD3uWEWZF8E5dN3e916TR1re5VMn0CSuKE2+cQ184tKxyJcOAG+M83UxAE4qFdqc
         phUg4ZdvtPg+F0pdJECvFsUosfMsN/BYhQkZzk42hu5Fmg4ox52CA+tgeXGbTP+fH8C1
         DSEQNM9rZqEnvawgEliUpNr0bQlbMXrE5oShLbAZT7vUK9xnfOeC1yb7T1H2ejrTiL6D
         ypQ8IOsTAxvUxOHQPgvt9xEf/FO627c6vAxn4RP4lX9T29i7f/YVszXu3lGWACi/h6Xp
         gTtA==
X-Gm-Message-State: AOAM5332/MXWwz/ndAiwwe6kEhz1wcSJpu6pKODfAwDKWvCA7dZx4Ldo
        yIektiXwublb3BLkbCkOzn5hfplNOxJ4fY/4Czk=
X-Google-Smtp-Source: ABdhPJx0f6thqge+C12HNjJ5r8B71prxz9VZvcsd3hChezg6qVLZ3el+cfR0Db/qvKvqj7o1RZJ/nW0h7z6v6iaT/0E=
X-Received: by 2002:a17:902:b194:: with SMTP id s20mr1572889plr.321.1598626620299;
 Fri, 28 Aug 2020 07:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-25-krzk@kernel.org>
 <CACRpkdZNS6TTpUDEiezORKXu-h0Sdz_dPcCxmR+UbT_Rc+oMpw@mail.gmail.com> <CAJKOXPej87cqgPtt4it66fp2CgjcyAQULG2260UH60hsnOZu7Q@mail.gmail.com>
In-Reply-To: <CAJKOXPej87cqgPtt4it66fp2CgjcyAQULG2260UH60hsnOZu7Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 28 Aug 2020 17:56:43 +0300
Message-ID: <CAHp75VfOSqxs5mw7jK0Xp2H2xFFLbb3i=ARxiuViOEniafCp7g@mail.gmail.com>
Subject: Re: [PATCH v3 24/27] gpio: Add devm_fwnode_gpiod_get_optional() helpers
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 28, 2020 at 5:45 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, 28 Aug 2020 at 16:31, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Thu, Aug 27, 2020 at 9:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > > Add devm_fwnode_gpiod_get_optional() and
> > > devm_fwnode_gpiod_get_index_optional() helpers, similar to regular
> > > devm_gpiod optional versions.  Drivers getting GPIOs from a firmware
> > > node might use it to remove some boilerplate code.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > OK then, I suppose this gets merged with the rest?
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> That's the easiest unless you expect some conflicts. Only one next
> patch depends on this so worst case it could wait one cycle.

I believe Dmitry and Linus are familiar with the concept of immutable
branches, so it won't be a problem to create one and share.

-- 
With Best Regards,
Andy Shevchenko
