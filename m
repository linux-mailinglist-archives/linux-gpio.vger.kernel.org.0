Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBFA187B68
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2020 09:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgCQImB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Mar 2020 04:42:01 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39126 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgCQImB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2020 04:42:01 -0400
Received: by mail-ot1-f65.google.com with SMTP id r2so5370266otn.6;
        Tue, 17 Mar 2020 01:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KAPg4bTos1rY9vws0C/xCO+F9oh55hyP0CnonU852I=;
        b=iubqMyUjFGwNTCeuykhwnWPzi4ZrZ5EAUPhIabkVYgSTUKLyhu0/Oq8Ej1wsSQ+Lhr
         FVEjQixNIRRE46dW4+rFtOr1cutw+RabudP3D52+hPUkpmrTxBDJisfA/yJwx1f6rmLO
         X4vETRYEpsYWPE0GWBbd4kUyPXL8wnq/9vnUZyKo7qF1awioM9aH7npPywhmNMcDvx73
         2ZU4QqcbSUSzl8d/iQWMAUjo2Mu4K+5TCNS1PXNn06R7/mKjAL5HRELuqimlg19z8yk4
         d11x4D3uhpfK6WSjEwagBzsIYNMpZQWEbdPFsdFspkT4keJXCGDRM4eYBH8AyrciIcaq
         NBwQ==
X-Gm-Message-State: ANhLgQ26eX7G394qQtfH2C+Y4ZRrRj+jDJHMnLERKIzaUsN8u5SW7faW
        Dg48UiVckW6MyEJqHVrHGM7QUC/OqdhE0lTVY7g=
X-Google-Smtp-Source: ADFU+vvJp0nv92HoVayJxMdw/lQoVKJfhGofeOWGjeWQZ4VsyHP2OYzQFJDW/aLh70OIkdl5GYBag7ZinGzuIjBpa74=
X-Received: by 2002:a9d:8d0:: with SMTP id 74mr2800645otf.39.1584434518599;
 Tue, 17 Mar 2020 01:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200218151812.7816-1-geert+renesas@glider.be>
 <20200218151812.7816-2-geert+renesas@glider.be> <CACRpkdZGKB9opaOFT8Yz-tfE9vcCVeF9EvvBi7jWWuAAh3C_FA@mail.gmail.com>
In-Reply-To: <CACRpkdZGKB9opaOFT8Yz-tfE9vcCVeF9EvvBi7jWWuAAh3C_FA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Mar 2020 09:41:47 +0100
Message-ID: <CAMuHMdVM=F_p0L24shstWbQSur7JJ6irVBiugxxqKsky0hxdAg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] gpiolib: Add support for gpiochipN-based table lookup
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Mar 12, 2020 at 3:23 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Feb 18, 2020 at 4:18 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > Currently GPIO controllers can only be referred to by label in GPIO
> > lookup tables.
> >
> > Add support for looking them up by "gpiochipN" name, with "N" the
> > corresponding GPIO device's ID number.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
>
> Just like with patch 2/5 I have the same problem here that
> the commit message doesn't state the technical reason why
> we need to change this and support the device name in these
> tables and not just labels.

As these "gpiochipN" names are not stable, I will drop this patch, and
the related support.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
