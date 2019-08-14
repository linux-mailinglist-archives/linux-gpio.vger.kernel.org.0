Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5C08D4C3
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 15:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfHNNcq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 09:32:46 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39840 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbfHNNcp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 09:32:45 -0400
Received: by mail-ot1-f67.google.com with SMTP id b1so14189648otp.6;
        Wed, 14 Aug 2019 06:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=beLzQawyfc7UIoMRey2f6xfbpIYzWP+xaR6q/S9sQcg=;
        b=WI44r8kfzJ0YgXUZpawu4xzhU2K0eLuiqzzUZphPOLszhxzcn+8u2stZ0sAWCJRuG5
         GivgFt7ojQhdj6YuBTMaiH+pL6u96GriMA1QkSUynwKiq5D2D5rHQrAAb+FybWdvR2dA
         gpgBr0Ehz+LptP8pXzmQVE69WDHIHnzCrEr8tp4NxuUXdbNmkLZptGBM+WwSMD+1brLL
         ne5jGjm9FRmsKA1yQrPQFCYELGatj53P65EbVVxJoUoLp1sSnSPGvckx6WAL9n41AJu5
         werLlJnH9VoNTiF82g7/Z6iRLYHNJGcoHhWg1QL9KgHnyzNSenx3FRRkQ2kampB1k/Ez
         4CEQ==
X-Gm-Message-State: APjAAAVIlnUGITFLX8uoYAaAnpkqR9e8ce+F8gZRidXbDnXkW+fRuWSV
        CK+UluRfIuh7+gOeQ8QZBkQ6vLhJVFb+4GnBwdGkHw==
X-Google-Smtp-Source: APXvYqzumOvf8nrrzkhnLTjSm7b87Pg2tlGKiqmjgK8Q5ksCRuDpt1g6qP5D7jqhdKrbSltc+5mACe/HVrAr5q5yw+A=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr5461604oto.250.1565789564541;
 Wed, 14 Aug 2019 06:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190808132543.26274-1-sr@denx.de> <CACRpkdYzg0At4qf1Nv5_+SzgqQ-iLU1ND9Svhj47=pXJf9E7Mg@mail.gmail.com>
 <CAMuHMdXP8K+yvUHrjnegnNuViG3YsCAD=PxTsDHJcTLRRjJguQ@mail.gmail.com>
 <CACRpkdZqFGyZETZBoo6xSE9FSMpsbinLquX=4M=2FghdLMxWKw@mail.gmail.com> <2f78c3f4-08a4-480e-ff70-8526d0a671ba@denx.de>
In-Reply-To: <2f78c3f4-08a4-480e-ff70-8526d0a671ba@denx.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Aug 2019 15:32:33 +0200
Message-ID: <CAMuHMdX7wa+0OL8eOqFhELJNHKGRp_aWrZvEVAw9-ci-_6tMVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: Add for_each_gpio_suffix() helper
To:     Stefan Roese <sr@denx.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Stefan,

On Wed, Aug 14, 2019 at 3:17 PM Stefan Roese <sr@denx.de> wrote:
> On 14.08.19 10:48, Linus Walleij wrote:
> > On Mon, Aug 12, 2019 at 1:18 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> On Sat, Aug 10, 2019 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >>> On Thu, Aug 8, 2019 at 3:25 PM Stefan Roese <sr@denx.de> wrote:
> >>>> Add a helper macro to enable the interation over all supported GPIO
> >>>> suffixes (currently "gpios" & "gpio"). This will be used by the serial
> >>>> mctrl code to check, if a GPIO property exists before requesting it.
> >>>>
> >>>> Signed-off-by: Stefan Roese <sr@denx.de>
> >>>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >>>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >>>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> >>>> Cc: Pavel Machek <pavel@denx.de>
> >>>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>>
> >>> I really like this patch, it makes things so much more readable.
> >>
> >> Do we really need to spread this *-gpio" legacy support all over the kernel?
> >
> > Not really :/
> >
> > Isn't it possible to use something like gpiod_count(dev, "foo") to
> > check for any GPIOs instead?
>
> Good idea. I can rework my patch to use gpiod_count() to check if the
> GPIO exists before requesting it. This way, we're not spreading the
> legacy "-gpio" support any more.
>
> But I'm unsure, if I should change the string malloc (kasprintf) to the
> fixed length string on the stack as I've done in this patch version.

Would that work for the mctrl-gpio case?
The issue is that there exist GPIOs (found by index), but they don't match
the passed con_id.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
