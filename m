Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65DBAE3270
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 14:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439143AbfJXMfW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 24 Oct 2019 08:35:22 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41463 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439084AbfJXMfW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 08:35:22 -0400
Received: by mail-ot1-f67.google.com with SMTP id 94so564729oty.8;
        Thu, 24 Oct 2019 05:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jSiRc6xB10SUU+vv6d8heaflLgEwqtN8e8jkVm34t6Y=;
        b=lp4Cq02jhAumMSjqAroZqShlauPH7Fk8+1RacC0y/SHb4BhxEkPIidpzlXQlZDxFPp
         I/dbWeIEGTYmo3eNgfitDKmeNNnzqtFIy0yy1dBVOts323YB2683pCL9/8zREN/+hz8f
         Ot3ae3veAirAPY0T3adu8+068WQRDOXSVSB74qTsl6NlqVgIYIhtiSM6NIaddXuXl4OZ
         YgTxyOlLqbiLwB4vsoUojzrHpqKILeYSkMLJy0a+mlQe2A2Zzkg4uofxUXeZ/4KhbWbH
         O0z6+XhYcBlSF70Cq7ABbKv0ritdyy7Qi6Jx73TpVRH05IGnScdqjAoEHPim+4Jj6DuN
         fcLg==
X-Gm-Message-State: APjAAAVvfgXHpKcLnrKmG2shiQp7OJ+5FgH1ntU1WcID/7CiNFR50Hl9
        rdohcFrsvx4UkHVFv0ABCDxWZKkvMLc1YU3jRd2DMQ==
X-Google-Smtp-Source: APXvYqyleEgy6cLO6O8odvlFZlEWdOVD2w1Zn0KJ4M+Gl/rt8Y6NhRXRbfWaeehcWB1Ofknlbw5xmd2iUWlZsWnjapg=
X-Received: by 2002:a9d:7345:: with SMTP id l5mr5505138otk.39.1571920520926;
 Thu, 24 Oct 2019 05:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191016142601.28255-1-geert+renesas@glider.be> <CACRpkdathjE3CLWsJYapL-0ri9_mC-uCKrh058zBk_nN5wHkDg@mail.gmail.com>
In-Reply-To: <CACRpkdathjE3CLWsJYapL-0ri9_mC-uCKrh058zBk_nN5wHkDg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Oct 2019 14:35:09 +0200
Message-ID: <CAMuHMdVQaCtWR9ZO7N-HKOZS1ivBNWssjqzV1B0XwSBkMFp8Ow@mail.gmail.com>
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

On Thu, Oct 24, 2019 at 2:07 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Oct 16, 2019 at 4:26 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > As platform_get_irq() now prints an error when the interrupt does not
> > exist, counting interrupts by looping until failure causes the printing
> > of scary messages like:
> >
> >     sh-pfc e6060000.pin-controller: IRQ index 0 not found
> >
> > Fix this by using the platform_irq_count() helper instead.
> >
> > Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> > v2:
> >   - Add Reviewed-by, Tested-by.
> >
> > Linus: Can you please take this one, as it is a fix for v5.4? Thx!
>
> I'm not sure the little error message counts as
> a regression, certainly users can live with it.

Several similar fixes have already made it upstream.
But the decision is up to you.

> Can't you just put it in your queue for the next kernel?

Sure, will do (after ELC-E), if you prefer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
