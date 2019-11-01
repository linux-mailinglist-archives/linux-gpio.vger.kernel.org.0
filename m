Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2C6EEC317
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 13:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfKAMqG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 1 Nov 2019 08:46:06 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44710 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfKAMqG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 08:46:06 -0400
Received: by mail-oi1-f195.google.com with SMTP id s71so8014985oih.11;
        Fri, 01 Nov 2019 05:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5ePSdIm6pah0cj12lWYKf0TPdMueWECgaXObaXLnaO0=;
        b=g5/smSvVe7wGbwQqdRahN0khEVpnicA/L4ySYqrF/dAyVPMoszJywBFK7Nhkqj8nLt
         vYKbsXCCka35+2xQ4XSw0Kz7RiTK4jSIW0HPuVXUTxHchzOtH7QWO+rGtq47/Zh4zItx
         PnZxLbppSUAl0kBwEEyj4NbgL7R8PEGDLfhfuGE3n0ZkAUqGpUgJFgj59nSjZcj1MktQ
         x/l/AiuKohBxpD1rJt6g8/aMFnfr45wJht62ujdYl4NDGQgqHKWDri2RaJTyuLl1URge
         keZPOpdn73ObJdA91b+DjdX8U64ooExF9BvtVo6z6VcvkKwhTDZrwjumIBuZM06g/iYl
         6RKg==
X-Gm-Message-State: APjAAAVVcRqRcmf+A+HG6L3oQAqTu+3iNMvmydwwjXA7fu+O3Q6P6zq8
        jYTkn+rFigQpouATxAqoXyK7J0WtfCA2J2xgThk=
X-Google-Smtp-Source: APXvYqwlddboe7ivMWjOKf93FGaNASg7HlPVjO+wJM7HX6dWoWcJ8Gr6urg+mAaFKSAdWCZGC0DaqjEIy8+88o4+A7U=
X-Received: by 2002:a05:6808:60a:: with SMTP id y10mr1877464oih.102.1572612365503;
 Fri, 01 Nov 2019 05:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191016142601.28255-1-geert+renesas@glider.be>
 <CACRpkdathjE3CLWsJYapL-0ri9_mC-uCKrh058zBk_nN5wHkDg@mail.gmail.com> <CAMuHMdVQaCtWR9ZO7N-HKOZS1ivBNWssjqzV1B0XwSBkMFp8Ow@mail.gmail.com>
In-Reply-To: <CAMuHMdVQaCtWR9ZO7N-HKOZS1ivBNWssjqzV1B0XwSBkMFp8Ow@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Nov 2019 13:45:53 +0100
Message-ID: <CAMuHMdVxCEAdxj4xfnU2DEr0UkL5-xNzVdUFkvFgpzr28a7Vfw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: Do not use platform_get_irq() to
 count interrupts
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Oct 24, 2019 at 2:35 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Oct 24, 2019 at 2:07 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Oct 16, 2019 at 4:26 PM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > As platform_get_irq() now prints an error when the interrupt does not
> > > exist, counting interrupts by looping until failure causes the printing
> > > of scary messages like:
> > >
> > >     sh-pfc e6060000.pin-controller: IRQ index 0 not found
> > >
> > > Fix this by using the platform_irq_count() helper instead.
> > >
> > > Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > ---
> > > v2:
> > >   - Add Reviewed-by, Tested-by.
> > >
> > > Linus: Can you please take this one, as it is a fix for v5.4? Thx!
> >
> > I'm not sure the little error message counts as
> > a regression, certainly users can live with it.
>
> Several similar fixes have already made it upstream.
> But the decision is up to you.
>
> > Can't you just put it in your queue for the next kernel?
>
> Sure, will do (after ELC-E), if you prefer.

Queuing in sh-pfc-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
