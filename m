Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779893BF5E8
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 09:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhGHHGF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 03:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhGHHGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jul 2021 03:06:05 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270D7C06175F
        for <linux-gpio@vger.kernel.org>; Thu,  8 Jul 2021 00:03:24 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id i42so1157184vkr.11
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jul 2021 00:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AolFQ0Dlxnk8mpgwdaTbhkpjw+QyQ2x2z2tLBCeVDKU=;
        b=JSMx6oJewQlDXLoMI+Mk4yW+QG4e1/UHJT/MSmzqWBGYemY4kSFSWJh+qidXXAdyHG
         kk9h0cAuJ6wv7+WaChvXuvoq86cYFE3wEydjQvuvVgb0rbX84QDOepMZOgqyrKqGjV/y
         w9gQnySkQqXzQQExenmtsUjkil9v/Lk1X0h4Yc2XtAmlY6js9sY47XYQtiEi3ktSsgDT
         /4w1UPgQ8098XZVN6BY6m/o1KfMiplAyD8LeyFMlM8WnalFyliR0kRleW22rJaAQap7O
         aW3hlFM2i1cQ2FGjExmVEbp7IoESM9wcNX7+co2P91XUskUvWjlAlSVez0+bHkxAL04J
         dApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AolFQ0Dlxnk8mpgwdaTbhkpjw+QyQ2x2z2tLBCeVDKU=;
        b=UTmSlynUw1GWO1fKRyazvDWZ0TMDTjozqFZFAKAngzUhjb17X/nSkYmHSLmpSfk2UR
         x4QTCfoO9EAVgsedACdsrFNW7xMx2RsbGxqT9k21XuhkSu/FFcwhQs+gE25fjmtb6ZfH
         igMKaGFBZ17xdRlIeKOzgfjT14yPp50ayqsQM1OTo0Yve0Nc0cedJUJHRQ/y8XVvu483
         FjrhNX6zDBpe3VSQbLBXvWC35BxrEr92W4UtlvTUj53YAgVN2PtkPsXr+QNZRmYC+Lbu
         fYLiKCkM8C5JaqAnIx2YDq/Ww593VHVXFdcS5hiy/pYsuWxvT8qusDlK/+sSsmaaYuoF
         ANvg==
X-Gm-Message-State: AOAM533vYELMMRCMgy7yIKeIyS1L7rd0jHZ10KGbq0OWW7pusDqoF0WT
        chAGBz9sfj97X4JT9ImB7NFDU/TNU/bYmlPqs9F+hg==
X-Google-Smtp-Source: ABdhPJx3MDuK5SJTbuLP4EONy/q5aBt78hArwFacYF0cjtlWb4vFvBylQ5Z+dO7TleD9xWiu4y2VZior7dKHEy0cugg=
X-Received: by 2002:a1f:6247:: with SMTP id w68mr7602824vkb.11.1625727803200;
 Thu, 08 Jul 2021 00:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210707135226.191988-1-aardelean@deviqon.com> <YOW1dKIpXa1GXyXh@smile.fi.intel.com>
In-Reply-To: <YOW1dKIpXa1GXyXh@smile.fi.intel.com>
From:   Alexandru Ardelean <aardelean@deviqon.com>
Date:   Thu, 8 Jul 2021 10:03:12 +0300
Message-ID: <CAASAkoY2Yw7E1ftN+410twQ3HHkF=b85YbzuyCXonKf3LwDehQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: wcove: remove platform_set_drvdata() + cleanup probe
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        sathyanarayanan.kuppuswamy@linux.intel.com, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 7 Jul 2021 at 17:09, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Jul 07, 2021 at 04:52:26PM +0300, Alexandru Ardelean wrote:
> > The platform_set_drvdata() call is only useful if we need to retrieve back
> > the private information.
> > Since the driver doesn't do that, it's not useful to have it.
>
> This is fine.
>
> > This change also changes the probe order a bit, moving the
> > devm_gpiochip_add_data() as the last call. This means that when the
> > gpiochip is registered [and available to consumers], it should be
> > initialized.
> >
> > It's still possible that the devm_gpiochip_add_data() call could fail,
> > leaving the chip in a partially initialized state, but that was possible
> > even before this change; it was just some other partially initialized
> > state.
>
> ...
>
> >       /* Enable GPIO0 interrupts */
>
> ^^^^^
>
> > +     return devm_gpiochip_add_data(dev, &wg->chip, wg);
>
> This is dangerous change. How did you test it?
>
> The handler now can be called before chip and actual handling code is
> registered. It means at least two possible (bad) scenarios:
>  1) the handler may dereference dangling or NULL pointer;
>  2) the IRQ may be level interrupt and we may got 100000 IRQs and
>     IRQ core will disable it leaving device completely unfunctional.


Makes sense.
Let's drop this :)


>
> --
> With Best Regards,
> Andy Shevchenko
>
>
