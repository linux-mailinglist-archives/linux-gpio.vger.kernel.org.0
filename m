Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4444D29E756
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 10:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgJ2JaR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 05:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgJ2JaR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 05:30:17 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89BFC0613D2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 02:30:15 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id s7so2564613iol.12
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 02:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oOIWI+y7UB+B7mKQ1XejmuEN+uCbdLuLnJkhG+XAUXg=;
        b=sSIrfy0iaFuSgIj5W2Cpey08c3xXHJL+wgY9p1P8vfqd2gEaovPS0nJhbZD/6XTNVx
         uXDhJURp8i399ABaJlBVBOsP3csQDvT/Ud10UohRe7jgBCP3MDCMTngCozrvbefR3P5c
         PJWVVMA3cQhAFn8lt/TsuM/rVLXvWMHuWlW8zJP7yTHH/piCjlgrZycJ2HUGZZWTafQB
         GvkAsjld3/Azyo39WmXhShydky6hx+1CyG5+tSmkg0LC8vN3dW3Z/iJXHzIUSLIHdxOR
         qlsuyGfHXyf2VReQqm/gaDqL2lq7GpZ2ATcGSH/EQ495JpqDmJw2mnVtMgON0VjAZMHz
         FBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oOIWI+y7UB+B7mKQ1XejmuEN+uCbdLuLnJkhG+XAUXg=;
        b=hKIftqJqPOfMz01aaZRNEnqNAs3Y6Y540Jh8qewTDTkFnuoBIRltUgrcRP8R5A5KL2
         wBUeEoH1MrhUFW+v/UB6BKJi/QIVR4kE0sNOx4B0BzkpVGb0Ce3Zwv5+yjn0wvPsNO3H
         knY2yb5v8V7t7lDxFE1t2NsV0VV/HtFfhKR0v7op2q7oZ3mtb/qIPw6RlG63iLWo7oHa
         ez9WDyRi+hJgur66QBkub8EJKUPUw9+L84dsv2t2VLSQsOy87hoTj+rBvyDp6HKwq/v1
         5C2jHwCls8s3tlSOxLzGVqgJy1/FoiDwQWQxG9SNwVWyf9PLeiLhINdrhzDXfrdZbmde
         Nr1g==
X-Gm-Message-State: AOAM5333QYdZR2Ja9c26hqTMen7iFXg3px8WyLv3k1EQMCfXOFXwfQy4
        4G0uG361fDKowb0oMWU2hfXHCqnVDuTujf6mzbRltA==
X-Google-Smtp-Source: ABdhPJx9zMBHaZw19qpVm06IdHzHPzlUWhcss2G91tMQHwc7bPynPZC7+Obdv2CzznTo5KJeZSt+E0qI4ZiM1o9j8tU=
X-Received: by 2002:a02:8348:: with SMTP id w8mr2775533jag.136.1603963815210;
 Thu, 29 Oct 2020 02:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201027135325.22235-1-vincent.whitchurch@axis.com>
 <CAMRc=Mdjm8tgxF_76T3f6r3TwghLKtrFtUv7ywtX3-nEQzVGtA@mail.gmail.com> <CAHp75Vff1AyKDb=JiocsAefnft+tcm+BnuWDrxViQqZAQZjuVg@mail.gmail.com>
In-Reply-To: <CAHp75Vff1AyKDb=JiocsAefnft+tcm+BnuWDrxViQqZAQZjuVg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 29 Oct 2020 10:30:04 +0100
Message-ID: <CAMRc=McfToqJOy6AFGVqUup5b8ED-Ld3e=ZRyW5BG1JtD54M+A@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mockup: Allow probing from device tree
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel@axis.com, devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 9:24 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Oct 28, 2020 at 8:41 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Tue, Oct 27, 2020 at 2:54 PM Vincent Whitchurch
> > <vincent.whitchurch@axis.com> wrote:
>
> ...
>
> > > +#include <linux/of.h>
> >
> > Please keep the includes ordered alphabetically.
>
> Besides the fact that that is a wrong header to be included.
> mod_devicetable.h is the correct one.
> (See also below)
>
> ...
>
> > > +#ifdef CONFIG_OF
> > > +static const struct of_device_id gpio_mockup_of_match[] = {
> > > +       { .compatible = "gpio-mockup", },
> > > +       {},
> > > +};
> > > +MODULE_DEVICE_TABLE(of, gpio_mockup_of_match);
> > > +#endif
> >
> > You don't need this ifdef - of_match_ptr() will evaluate to NULL if
> > CONFIG_OF is disabled and the compiler will optimize this struct out.
>
> It's not so. If you drop ugly ifdeffery (and I vote for that, see also
> above) the of_match_ptr() must be dropped as well.
> Otherwise the compiler will issue the warning. So it is either all or none.
>
> --
> With Best Regards,
> Andy Shevchenko

Makes sense, I'll remove this from my tree for now then. Vincent:
please send another iteration.

Bartosz
