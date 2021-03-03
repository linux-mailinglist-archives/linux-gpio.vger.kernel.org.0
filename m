Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB2C32BB4E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237075AbhCCMVu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:21:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1843024AbhCCKYd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 05:24:33 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7338C0698DF
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 01:22:14 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id k12so18689309ljg.9
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 01:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lffy/+3m67+T4Jg78wOzYp/uIqDyr2dG9zAtQWv6kSE=;
        b=iZ9jBV3DgDRRSPB6PMDbYm+A0uZKdbOIW1yKNggIHUzDqTOR4KltoIiSe9Eq+FKKkE
         SAaMx7qvGrcDhBxF4sv1TWZV6tyV6sJmwcOA+6Y1PQOuPFQIg+W55NHs8+aHKWjozH9Y
         T7hNpwXNkfOJfFBUujKl5tULCYau500xqCbtYIaZsDCxdbksTDnzyrdYbEphRpofMMNV
         E48rNXRKjUE2ssVp9DDB+0iVFKZab6hkpFf/MsIfrhf+DUVB9TUpJg01olJBnXcPhMU0
         WFlA7jjLQej7iBE5V0C6uWs3rbE0Y9olEejSJL3f2+yOgqwqmC3SBBjyWTCqmBl1TeQO
         JBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lffy/+3m67+T4Jg78wOzYp/uIqDyr2dG9zAtQWv6kSE=;
        b=P6IpTrKrVACMnY45wAWEFEodWh8akRTS7AnsfInw4td22oWWZp8a9xcRApke0OS8t/
         MiVJgRP9eLfXkIQ81lcJCOajpZwjcDobjXafXTsUTFzghZhSV+jDItjlq3PH9jA5z6H+
         oU9O/U0AmDqJpOS0ds/euAzjjFp1WEDcsCawjezeI23IDT+m4sIILBUYNgKbu50xBm5B
         lba4zq9Z7hSxu/VEfrzIXIMHJA+tjS3rCvqesaOlJhe+9i656sOn/+N63wfpHJkyayly
         0xH/v0CfnoDgnPK23EgUkGa8uTzSnMRnyaLnKzQZopAbbpMYshy/KRgjn5yUGluLSw+s
         sjaQ==
X-Gm-Message-State: AOAM533bNrgpmXdGJ4U1p4+5Zjk/bJMApBHB2WuBn0zBVfFeYN1s/gUx
        eOmOXqxIyxQvDbvzU8rKnuh/AOTJSv7AW/o2xmgBqV+vtIUM4A==
X-Google-Smtp-Source: ABdhPJw/jMhdI0dgZp7+cH+S0T1kqPgX/eCSWYz4SJ4ExvDKzZObPLOHLJ4FEYdymMYnoKqA561mVbAWEMuwwwE7F+E=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr14629406ljc.368.1614763333165;
 Wed, 03 Mar 2021 01:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20210302153451.50593-1-andriy.shevchenko@linux.intel.com> <20210302153451.50593-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210302153451.50593-4-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Mar 2021 10:22:02 +0100
Message-ID: <CACRpkdYjs7y=YMoQmFc2iXoMEtSAk7S+zYsz1Y=yPYw=97T+Nw@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] gpiolib: Reuse device's fwnode to create IRQ domain
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 2, 2021 at 4:35 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When IRQ domain is created for an ACPI case, the name of it becomes unknown-%d
> since for now it utilizes of_node member only and doesn't consider fwnode case.
> Convert IRQ domain creation code to utilize fwnode instead.
>
> Before/After the change on Intel Galileo Gen 2 with two GPIO (IRQ) controllers:
>
>   unknown-1     ==>     \_SB.PCI0.GIP0.GPO
>   unknown-2     ==>     \_SB.NIO3
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This first part seems to do what you want,

> @@ -1457,9 +1457,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
>                                 struct lock_class_key *lock_key,
>                                 struct lock_class_key *request_key)
>  {
> +       struct fwnode_handle *fwnode = dev_fwnode(&gc->gpiodev->dev);

(...)

But this:

> @@ -1504,15 +1497,14 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
>                         return ret;
>         } else {
>                 /* Some drivers provide custom irqdomain ops */
> -               if (gc->irq.domain_ops)
> -                       ops = gc->irq.domain_ops;
> -
> -               if (!ops)
> -                       ops = &gpiochip_domain_ops;
> -               gc->irq.domain = irq_domain_add_simple(np,
> -                       gc->ngpio,
> -                       gc->irq.first,
> -                       ops, gc);
> +               ops = gc->irq.domain_ops ?: &gpiochip_domain_ops;
> +               if (gc->irq.first)
> +                       gc->irq.domain = irq_domain_create_legacy(fwnode, gc->ngpio,
> +                                                                 gc->irq.first, 0,
> +                                                                 ops, gc);
> +               else
> +                       gc->irq.domain = irq_domain_create_linear(fwnode, gc->ngpio,
> +                                                                 ops, gc);

This looks like a refactoring and reimplementation of irq_domain_add_simple()?

Why, and should it rather be a separate patch?

Yours,
Linus Walleij
