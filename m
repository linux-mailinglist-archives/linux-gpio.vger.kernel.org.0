Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94FF295CDD
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 12:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896594AbgJVKmh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 06:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896590AbgJVKmh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 06:42:37 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F634C0613CE
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 03:42:37 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id l2so762587pjt.5
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 03:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bQe9GIJn06e600jWgJkXk1Ukg8VpqBwjzkRSMOKseTo=;
        b=fnJjiIO7Xni6bJpLYIA3gQ9llzhZKhymVNLB55yrP3ItE7oLf/5YX4ZOLErycwabo8
         si2Isb8I9cfCzAc55Sk5brnR2QlhejSBj+L6973iiQ1DbGdP4sz3/M70WaPJRvx89siF
         yYSYPHAkXUDOnBr57kQTdC9N9Bl4PZiX4mzv8lz3dYhowxRtDiHlWxBRy9EdAH0Rcasf
         V+gGXY+eWodRkcRJ/IDKJXTN3mRqZesXUQd27u/s/dHhcOB20SCG5dM9uorGHXI6UMa0
         ZfPIKR/zc434JdmHhvfRfhMfAThEE5GCCdjuxxoNe1C75pYjZn26ayJjgUaa+J+w81A2
         irDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bQe9GIJn06e600jWgJkXk1Ukg8VpqBwjzkRSMOKseTo=;
        b=BCmD8yX8kY2qrt8LRvZS+k6i512Cg3etq1bEwk4ctoknKnCQcKtQ+qPg3IPGHMXiFg
         7Tt/ETN8GkN9H1XG2hP3xco5Z1KYcBdCbdGFaqgcLYuPiwrCjHNMgWqYEPEDHVAHWP+X
         S5fJc3BsPQC7S1QGAHfB5uYlAnIn0E2KcSpmyhbPwnTrGDNjiGINExF4NEYCk2b0SxWv
         ymeo2rw3SUmpS1M5jP+a7fA5hll1o9+yTsgETV3W3Jp11a9lxLokuIP3qVnZuVLxd2GP
         hK+xJgvQqe53Wd5lV8z512rYRuTKTBMQKgjw7gctA+K0LHVU26PvmvWG3W6zKrnFPMK9
         nbVQ==
X-Gm-Message-State: AOAM5300eAd/dNAB8FIyDg6HZLHhCj/r4JWQ8ViJlaDOYwRD7D1w3CrY
        iFYeAwyNJ1cnEJG/KdAUWpnPcpK4bpLC65fY+7w=
X-Google-Smtp-Source: ABdhPJxSgwksRsfjaXg/IferGJLgwHCiKzgSUSkNXqX7tZkICy4fcZifk/XSvGGMsTuWChmYS2To/UNpK5C61LlZ+68=
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr1813503pjb.129.1603363356543;
 Thu, 22 Oct 2020 03:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
 <20201021095854.GV2495@lahna.fi.intel.com> <20201021163844.GX4077@smile.fi.intel.com>
 <b747a80e-27e1-be81-58dc-7d95c2cc567a@redhat.com>
In-Reply-To: <b747a80e-27e1-be81-58dc-7d95c2cc567a@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 22 Oct 2020 13:43:25 +0300
Message-ID: <CAHp75VfMmLBKmZMt7XRenkUtn9r320-hJhOYoq5CoZSudig2vQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpiolib: acpi: Respect bias settings for GpioInt() resource
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jamie McClymont <jamie@kwiius.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 22, 2020 at 12:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/21/20 6:38 PM, Andy Shevchenko wrote:
> > On Wed, Oct 21, 2020 at 12:58:54PM +0300, Mika Westerberg wrote:
> >> On Wed, Oct 14, 2020 at 04:31:52PM +0300, Andy Shevchenko wrote:
> >>> In some cases the GpioInt() resource is coming with bias settings
> >>> which may affect system functioning. Respect bias settings for
> >>> GpioInt() resource by calling acpi_gpio_update_gpiod_*flags() API
> >>> in acpi_dev_gpio_irq_get().
> >>>
> >>> While at it, refactor to configure flags first and, only when succeeded,
> >>> map the IRQ descriptor.
> >
> > ...
> >
> >>> -                   irq = gpiod_to_irq(desc);
> >>> -                   if (irq < 0)
> >>> -                           return irq;
> >>> +                   acpi_gpio_update_gpiod_flags(&dflags, &info);
> >>> +                   acpi_gpio_update_gpiod_lookup_flags(&lflags, &info);
> >>>
> >>>                     snprintf(label, sizeof(label), "GpioInt() %d", index);
> >>> -                   ret = gpiod_configure_flags(desc, label, lflags, info.flags);
> >>> +                   ret = gpiod_configure_flags(desc, label, lflags, dflags);
> >>>                     if (ret < 0)
> >>>                             return ret;
> >>>
> >>> +                   irq = gpiod_to_irq(desc);
> >>> +                   if (irq < 0)
> >>> +                           return irq;
> >>
> >> Should the above be undone if the conversion here fails?
> >
> > But wouldn't it be not good if we changed direction, for example, and then
> > change it back? (IRQ requires input, which is safer, right?)
> >
> > This makes me think what gpiod_to_irq() may do for physical state of the pin.
> > On the brief search it seems there is no side effect on the pin with that
> > function, so, perhaps the original order has that in mind to not shuffle with
> > line if mapping can't be established. But if setting flags fail, we may got
> > into the state which is not equal to the initial one, right?
> >
> > So, in either case I see no good way to roll back the physical pin state
> > changes. But I can return ordering of the calls in next version.
> >
> > What do you think?
>
> I think it would be good to do a new version where you keep the original
> ordering.
>
> Also if you decide to keep the ordering change, that really should be
> in a separate commit and not squashed into this one, so that e.g. a bisect
> can determine the difference between the ordering change or the flags
> changes causing any issues.

Ack. Thanks Hans, Mika for your comments! I'll revert that piece of
change. I dunno what I had in mind when I did it in the first place...

-- 
With Best Regards,
Andy Shevchenko
