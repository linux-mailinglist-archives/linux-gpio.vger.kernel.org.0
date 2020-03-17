Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 103D3188608
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2020 14:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgCQNlF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Mar 2020 09:41:05 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42482 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgCQNlF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2020 09:41:05 -0400
Received: by mail-io1-f66.google.com with SMTP id q128so21022362iof.9
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2020 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QmR4cKXPwmLVESUYOd+uijv8fqlBuTSi+RkgFo8qNnQ=;
        b=KpQZ15LCecBCrHnAqTjcR9wBx6NDPzIUoyffTM7cGZTqPpreBbQzxuZYcLDblusABt
         aH9wWLzE6hmBuHjDsUBTYYp7z/mAmW9gyXqbqesHL6VSOGADT6gl/IJ6JpGDQKKK+SN/
         uqcqX3KnkQpXK3Nbd+iupCaKs9v0zMtVFpaJzlG7I/aYcCKSbPF0WeVC29an8CwlyErG
         +XgygVhDfAdkp1Tav8DZIyG1mm1yCVa40WkFtrsLBbbpW5eBK56Lg9x5q453utDTQvaS
         7tiBapJGu2mYm52Xjp9eZEZjz8RxDYpROcNQhwtecYaUHQG5jDooYGo/3doQCL+/HjRV
         8fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QmR4cKXPwmLVESUYOd+uijv8fqlBuTSi+RkgFo8qNnQ=;
        b=TUsZdfDOh/2c1olObGOJeRCT2iewo3vonc1uoYSyC1cVF03ojIgdBkduENmchR4bO+
         AGlEQfa11F1XO3AYv6o9OBoY7v6fb8fFSVVd19YnqupC/O82pqgTzQQmaXMjPUOKYYnm
         BvYxUgH1+M92k4HmFsN01iCs8gOIuoo2XfIWdFIlVRa9Iz3iKhEz8/dTOxC6OSvKPqqs
         +VZETMqsuiyWfikakPPlVYQuQPRxBiOPK3C35uiQeR9CeliHrTLv5T9IL72a3a/prNnx
         Xt9Wf5HdoINlTz+2LoB506kL/w1VYaPjMlpcM2IfaVE4d7KUuF+glkydNbHOa870gHhO
         ozzw==
X-Gm-Message-State: ANhLgQ1P8r4PoxnNsoPOWQuJ8U8e0EQ1VzFte8gRrTGkfNe4JG5o9F2Q
        CpBDFcfs07kgIiNjfjNgWn1o0d7rwFw/8bhAURC6Aw==
X-Google-Smtp-Source: ADFU+vs1QhGAxGsXaP+7WrcEgZ1EmUiOnWtYeGoQwVTQz61qNKfynJHe/yAWoh85kCDk9Fbj5S2+ZWU+ZJ7nQUwSzZU=
X-Received: by 2002:a05:6602:cf:: with SMTP id z15mr4026478ioe.13.1584452462640;
 Tue, 17 Mar 2020 06:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200211091937.29558-1-brgl@bgdev.pl> <20200211091937.29558-6-brgl@bgdev.pl>
 <CAMuHMdUc9Vwh=B5nA2tW66DwYr3AE6g2Jvd_o0W-oShDs+QQEg@mail.gmail.com>
In-Reply-To: <CAMuHMdUc9Vwh=B5nA2tW66DwYr3AE6g2Jvd_o0W-oShDs+QQEg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Mar 2020 14:40:51 +0100
Message-ID: <CAMRc=MdBagbFGU--YKAN0jCVuU4Zn19YqGTz6zfP9hpEwC0-6w@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 5/7] gpiolib: provide a dedicated function for
 setting lineinfo
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 16 mar 2020 o 17:21 Geert Uytterhoeven <geert@linux-m68k.org> napisa=
=C5=82(a):
>
> Hi Bartosz,
>
> On Tue, Feb 11, 2020 at 10:21 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > We'll soon be filling out the gpioline_info structure in multiple
> > places. Add a separate function that given a gpio_desc sets all relevan=
t
> > fields.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> This is now commit d2ac25798208fb85 ("gpiolib: provide a dedicated
> function for setting lineinfo") in gpio/for-next.
>
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1147,6 +1147,60 @@ static int lineevent_create(struct gpio_device *=
gdev, void __user *ip)
> >         return ret;
> >  }
> >
> > +static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
> > +                                 struct gpioline_info *info)
> > +{
> > +       struct gpio_chip *chip =3D desc->gdev->chip;
> > +       unsigned long flags;
> > +
> > +       spin_lock_irqsave(&gpio_lock, flags);
>
> spinlock taken
>
> > +
> > +       if (desc->name) {
> > +               strncpy(info->name, desc->name, sizeof(info->name));
> > +               info->name[sizeof(info->name) - 1] =3D '\0';
> > +       } else {
> > +               info->name[0] =3D '\0';
> > +       }
> > +
> > +       if (desc->label) {
> > +               strncpy(info->consumer, desc->label, sizeof(info->consu=
mer));
> > +               info->consumer[sizeof(info->consumer) - 1] =3D '\0';
> > +       } else {
> > +               info->consumer[0] =3D '\0';
> > +       }
> > +
> > +       /*
> > +        * Userspace only need to know that the kernel is using this GP=
IO so
> > +        * it can't use it.
> > +        */
> > +       info->flags =3D 0;
> > +       if (test_bit(FLAG_REQUESTED, &desc->flags) ||
> > +           test_bit(FLAG_IS_HOGGED, &desc->flags) ||
> > +           test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
> > +           test_bit(FLAG_EXPORT, &desc->flags) ||
> > +           test_bit(FLAG_SYSFS, &desc->flags) ||
> > +           !pinctrl_gpio_can_use_line(chip->base + info->line_offset))
>
> pinctrl_gpio_can_use_line(), and pinctrl_get_device_gpio_range() called
> from it, call mutex_lock():
>
>     BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:281
>     in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 652, name: l=
sgpio
>     CPU: 1 PID: 652 Comm: lsgpio Not tainted
> 5.6.0-rc1-koelsch-00008-gd2ac25798208fb85 #755
>     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
>     [<c020e3f0>] (unwind_backtrace) from [<c020a5b8>] (show_stack+0x10/0x=
14)
>     [<c020a5b8>] (show_stack) from [<c07d31b4>] (dump_stack+0x88/0xa8)
>     [<c07d31b4>] (dump_stack) from [<c0241318>] (___might_sleep+0xf8/0x16=
8)
>     [<c0241318>] (___might_sleep) from [<c07ec13c>] (mutex_lock+0x24/0x7c=
)
>     [<c07ec13c>] (mutex_lock) from [<c046f47c>]
> (pinctrl_get_device_gpio_range+0x1c/0xb4)
>     [<c046f47c>] (pinctrl_get_device_gpio_range) from [<c046f5e8>]
> (pinctrl_gpio_can_use_line+0x24/0x88)
>     [<c046f5e8>] (pinctrl_gpio_can_use_line) from [<c0478bd0>]
> (gpio_ioctl+0x270/0x584)
>     [<c0478bd0>] (gpio_ioctl) from [<c03194c0>] (vfs_ioctl+0x20/0x38)
>
> Reproducer is "lsgpio" with CONFIG_DEBUG_ATOMIC_SLEEP=3Dy.
>

Hi Geert,

thanks for the report. I added the locking around this code because it
seemed wrong to me that this part wasn't protected in any way before.
Now the question is how do we deal with this.

Linus: do you think it's safe to move the call to
pinctrl_gpio_can_use_line() before the spinlock is taken? I'd say yes
but I'm not sure if I'm not missing some inter-framework intricacies.

Best regards,
Bartosz Golaszewski
