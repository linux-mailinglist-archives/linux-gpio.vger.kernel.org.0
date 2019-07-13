Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADDEE67AEF
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2019 17:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbfGMPfC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jul 2019 11:35:02 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46960 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbfGMPfC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Jul 2019 11:35:02 -0400
Received: by mail-qt1-f195.google.com with SMTP id h21so11326583qtn.13;
        Sat, 13 Jul 2019 08:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/VYOF52fJvexeKbOu9BKHZH1XPWQ9fg20nK1W0PVBPU=;
        b=N6ZDCY84nmzm9o9fc7+bE+lRW3ZudNjOdihqZm35ZDybQ2EK7Uw+a5GsYJII3bHlrU
         EsfdA3RToVDtZqZbfMEcpsSVGZGv3CFPjk5YjDp13LsuKbz9eemIVTH6NKm4i8kmKHPZ
         aLrdI0Pnl71pTcafFbqwq+CpgyDNsglyHeIoPkfhPWe8QVxQwc1XXvC4fc/aUJcfQ7we
         mIWm0vTPRSfRxvCOtxr+MlZUmokd8d48ZeY9KeN74APgzxN38aNcVdFAYeY8ANyj/V/F
         wO2RLlZIzC499COdaI9tI+cLPuTOsZ3ZR/q/ejSog28ZoUGuPfvy/EADynjoElSFbeEG
         iOfA==
X-Gm-Message-State: APjAAAVONo95XOuRy1gfwTtFQVEPStdc49UQMkHJQWFN0KwKpVxjKHXY
        v7KzCqCvVOORi14AwRJmfGgnW6xn4HyY/b9lJ44=
X-Google-Smtp-Source: APXvYqx27JWKTE5WBop/U7bMtyQP/Kzr2bIFkryE+f5lOFq7JP5QSUbQfKs8QOW9ZjZHS4O4f+3uLloLQ3C7fGXHhRU=
X-Received: by 2002:a0c:b88e:: with SMTP id y14mr11211808qvf.93.1563032100815;
 Sat, 13 Jul 2019 08:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190712085437.4007720-1-arnd@arndb.de> <fb36b507-e637-e4d9-fdd4-2947eb7faf14@metux.net>
In-Reply-To: <fb36b507-e637-e4d9-fdd4-2947eb7faf14@metux.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 13 Jul 2019 17:34:44 +0200
Message-ID: <CAK8P3a3SPpQAbXu5+rHjEaF-MSVxVmG9sWy9hxu844HKn8JgLg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: pcengines-apu2 needs gpiolib
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 13, 2019 at 4:36 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 12.07.19 10:54, Arnd Bergmann wrote:
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index e869a5c760b6..cf48b9068843 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -1324,8 +1324,8 @@ config PCENGINES_APU2
> >       tristate "PC Engines APUv2/3 front button and LEDs driver"
> >       depends on INPUT && INPUT_KEYBOARD
> >       depends on LEDS_CLASS
> > -     select GPIO_AMD_FCH
> > -     select KEYBOARD_GPIO_POLLED
> > +     select GPIO_AMD_FCH if GPIOLIB
> > +     select KEYBOARD_GPIO_POLLED if GPIOLIB
> >       select LEDS_GPIO
> >       help
> >         This driver provides support for the front button and LEDs on
>
> That might compile but the driver won't work, if KEYBOARD_GPIO_POLLED
> or GPIO_AMD_FCH isn't there.

Right, I agree it's a bit inconsistent. A better way would probably
be to turn all of the 'select' statements into 'depends on' here, or
possibly just remove them and document in the help text what others
are required.

Generally using 'select' in order to save users from thinking causes
more problems than it helps, as the build problems in this driver
have already illustrated.

      Arnd
