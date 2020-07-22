Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61B4C229431
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 10:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgGVI73 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 04:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbgGVI72 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 04:59:28 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E75EBC0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 01:59:27 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id k1so828077pjt.5
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 01:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yr1lK/q6KP22S+Ipenl35k/wY85ISfWTsG9+SvOUmhM=;
        b=Fyuf5FHLu5IqGlZlP9e6bMWgMv/GpYOaA4uNAYylBhhWrVvQLhEVQde8R5gvHURb6A
         7XYOt8qaOAdgsRB1kjpFp91K7nzOSbPNENmOyw0H/e63CR49Fwjh88U4BpeT0mOaL4iU
         xYbJYSmzWGH3nxlLbBON1E/H+LcxNiteGpjTNtzdBY7p/CpkGfaDJaEUAAtRvKPZPK8t
         bwKOJGGQLOLEDoc/81PCk03x65NXwDFvPwGZSr3QBIqes7bV8AtLek9zRukMrHrGRyyQ
         1jDdabvIqMioMUsd1a8D6H4fJejNM0+PflFmOW/UKauANq9jAePUimFdKISmR71rD1t6
         /5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yr1lK/q6KP22S+Ipenl35k/wY85ISfWTsG9+SvOUmhM=;
        b=FiZ+Qwn/d7gwzPvr2QCH4PGSZKR1zeUMxArIm6rp9OXtzN8woDnlUf+ial6kN+EpSq
         kGtApXB2lF/jKjPkMsuUOMXREsSxss32Ii1cNXqUJlJObLLjBBKm6c5HwYxCxTsPzPYO
         3Uhf0Xf3Tn7K9IHPPpicEHPie0dOnzLIuz+5VGBFlEImOU3AAUk1JEcRYubKOXdikSuO
         924/byMhyFUMc+7GxJqHWROut/AmRHho45HSnZ4lf7Otw3ys/Avc/5HWrhycsf16uPpe
         khb6E6JUc5IP0Be13oXkPIXx7jyVbqrNZ+4TYlG+thZs7rSP4wJ70l9GuZGR/sxcnVAp
         RrQw==
X-Gm-Message-State: AOAM53185zfnAm5OHhMST5BY9t4QUQhlLZSZFzlgbS8UOtsnRI1R1Law
        mP99Jji4q6G7p3HqnkgfP/x4uarq9W9mhcXxg8E=
X-Google-Smtp-Source: ABdhPJyi4vZJNIUH/PBS7V9IQilMn5pjrqgfia1pk5GFxYy0R6ZL2f1hcMAizWU1Eh8R1hFYaaK2BdgBXfupS7D+Gr4=
X-Received: by 2002:a17:902:9a4b:: with SMTP id x11mr25764118plv.255.1595408367465;
 Wed, 22 Jul 2020 01:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200721140153.369171-1-linus.walleij@linaro.org>
 <20200721153936.GL3703480@smile.fi.intel.com> <f8c609a2-30cf-dd4b-c956-1d90af9cdf02@redhat.com>
In-Reply-To: <f8c609a2-30cf-dd4b-c956-1d90af9cdf02@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Jul 2020 11:59:13 +0300
Message-ID: <CAHp75Vf8u_uC7+GzL8bY5m4-HO8EzEmggjkMwMf2pKvF=c-HbA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: crystalcove: Use irqchip template
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 22, 2020 at 11:56 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 7/21/20 5:39 PM, Andy Shevchenko wrote:
> > On Tue, Jul 21, 2020 at 04:01:53PM +0200, Linus Walleij wrote:
> >> This makes the driver use the irqchip template to assign
> >> properties to the gpio_irq_chip instead of using the
> >> explicit calls to gpiochip_irqchip_add_nested() and
> >> gpiochip_set_nested_irqchip(). The irqchip is instead
> >> added while adding the gpiochip.
> >
> > Took this version instead.
> >
> > I dunno if Hans can come with some comments / testing results, I would like to
> > send a PR today or tomorrow.
>
> Sorry for being a bit slow with testing this.
>
> I've given this patch a test-run on a machine with the
> PMIC the driver is for and with the caveat that I've not
> actually tested the GPIO IRQ functionality, since that
> does not seem to be used on any machines, I see no adverse
> side effects from this patch, so it is:
>
> Tested-by: Hans de Goede <hdegoede@redhat.com>

Thank you, Hans! It seems we also don't have such a reference design
which uses PMIC GPIOs for IRQ.

P.S. Does wcove case similar?

-- 
With Best Regards,
Andy Shevchenko
