Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2D5298F93
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781789AbgJZOk1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:40:27 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50892 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781785AbgJZOk0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:40:26 -0400
Received: by mail-pj1-f67.google.com with SMTP id p21so3358288pju.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AuWslfBN5ejzhZENZmoJOy4rO2zUtnzh/8/yM7SxCRQ=;
        b=CCf7DOR6Nr9EQiJeWO+jPQjrERcv/FfbWqJComunMyHUSr0gyLfaYpgVJ9nyXaA3a1
         yyqu335QwzRqbaNY4/sy96qCSFy6Cd8HoS7rpcWi4PFChWkF9Yd02Yfi8yKXNzpFoTfm
         Xri43WWPRv5dCUfIWoiQwK21C4YvcotxG4pxbjg7RA96dsy3cpZvs/H8X2PptQvLB6R7
         bi9NmPQWlJ2/5BCcEFZJbyqIN4kxGki8Z9hm1p9n2Sth1Xjf8YgW2gG7ELmicjSt3Nbx
         RxRpXF0T9SYBpCmTsjqekrALtMqsYoVn3hauPILucN3DFRYuynwkA1reZ/7nkbcRhw97
         05ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AuWslfBN5ejzhZENZmoJOy4rO2zUtnzh/8/yM7SxCRQ=;
        b=Y0BT3LYW5FW1Nbwzan8Sr2WFCVDyXw9wvx+BTnoNPxeCl2F/jtG7mSoXYTOVl7G/Do
         4FbjMo3QCo4wrNDd5yJYAW3avlBA02mxpBd5CVQ2X9qfKNyDB7g+Py0r6FAeqn/4Lld/
         o034Ax6bNlFiUELMPPkTXvVxXlQdGweSvqLlq5rvTBb7O0+k5MFU7ICkdXevpvGItMSP
         fiLZ8tRrdKyOFX7Nn4FZtCLIfK7TeK8CO9GoPZTwUyqF7qpxjkehlW8c13kEM/pu2t2V
         vUnzuD2e44oEJk83waCSwIBXME1vXhvpX9xzZlliP6XPmEaIktSIkH7l/k+sgrnzFaYk
         Hvsg==
X-Gm-Message-State: AOAM531aD+hGnJsPUcNPdsdCyplbAhYgAGANOdC0IrePUi18sOYjpv9X
        ce9C5Mpw8r464dxfnIVped1UJ5jEk744v4rBv1g=
X-Google-Smtp-Source: ABdhPJxhdq6fQIJMIAxyC9X5Nj65uc7tMg2ouBcSuZSgOVYewIYlotcCsv4l2ERNs/lBZWA+I78nq5u7wRipF+8F1EA=
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr16486951pjs.181.1603723225595;
 Mon, 26 Oct 2020 07:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com> <20201022170319.GJ4077@smile.fi.intel.com>
In-Reply-To: <20201022170319.GJ4077@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 16:41:14 +0200
Message-ID: <CAHp75VfqQ97oLfRe03pkAbmoS6hq3P7ZScS7Jr1Y=ZAYgWmP7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: acpi: Respect bias settings for GpioInt() resource
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus@black.fi.intel.com, Walleij@black.fi.intel.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 22, 2020 at 9:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Oct 22, 2020 at 07:58:45PM +0300, Andy Shevchenko wrote:

> Missed comment as per v1:
>
> This one highly depends on Intel pin control driver changes (for now [1],
> but might be more), so it's probably not supposed to be backported (at least
> right now).
>
> [1]: https://lore.kernel.org/linux-gpio/20201014104638.84043-1-andriy.shevchenko@linux.intel.com/T/

I probably have to elaborate what above implies from integration p.o.v.

I think the best way is to collect tags from GPIO maintainers and I
can incorporate this into our Intel pin control branch which I will
share with you as PR against GPIO and pin control subsystems.

I'm also all ears for alternatives.

-- 
With Best Regards,
Andy Shevchenko
