Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92FBF157CB5
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 14:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgBJNqw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 10 Feb 2020 08:46:52 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35618 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728249AbgBJNqv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 08:46:51 -0500
Received: by mail-ot1-f66.google.com with SMTP id r16so6374429otd.2;
        Mon, 10 Feb 2020 05:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/ZFbzfC90P2KHFmW6waI4OosS69JRy2/8RNnTux9U2U=;
        b=BJY/HMijW+Go5RQBoazfpraTYXHuKKRb4gwA46mDuaNpDD+NoB1mcNDOubH1dz3dl9
         hd8MyR9zj0J9a5ASddelUBkr4M13hjtvp8JhExn6fUTAzO3fbbm9fltCypRGOoDQ/Y11
         AsMsljEgkW3q+bBP5f/DyiZ58S9QPIcQZkp07Go0x4krUc+ACZN3ZzYweW4VqHZGdqFT
         39sNvr4/xrqIMb59JKKqr5BGTTTFzVND7kS4wk8L3C5xK5W/lac5tcCOzgTb1VM9mAgx
         jSluAfscHbkTbkcK6T+OpRiXkY1WT0T16oY6C/JKL5oyx3WvzrulGDXthOyxT8NYGOqs
         dMtg==
X-Gm-Message-State: APjAAAXekLQqbXxzvOyPAbvelezZ1JJogr3KMh7Am3qhwPZLNXHW8gmc
        YCQ89mj4QTOwO8vFVtGYQzYhm81sNSkDTbPnquh6HQ==
X-Google-Smtp-Source: APXvYqzkRHhAOxHdiqT2ZVWU53eMoYFCCS7FiEnmMlCth4Rg8ZlPe5+gc+7kpKQ8/k7RbWYlTIobp30xib8aZYPnurI=
X-Received: by 2002:a9d:7602:: with SMTP id k2mr1121914otl.39.1581342410947;
 Mon, 10 Feb 2020 05:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20200110131927.1029-1-geert+renesas@glider.be> <20200110202950.GA695049@oden.dyn.berto.se>
In-Reply-To: <20200110202950.GA695049@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Feb 2020 14:46:39 +0100
Message-ID: <CAMuHMdVCwkwobX=LTx3Oz6Jq3orZ9j6VjdfbZTXAREZTWM3Mgw@mail.gmail.com>
Subject: Re: [PATCH 00/13] pinctrl: sh-pfc: checker: Various improvements
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 10, 2020 at 9:29 PM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> Neat series. I always worry when my eyes start to cross each other when
> looking at the big tables I will make mistakes like this ;-)
>
> On 2020-01-10 14:19:14 +0100, Geert Uytterhoeven wrote:
> > This patch series contains various improvements for the builtin pin
> > control table runtime checks of the Renesas Pin Function Controller
> > driver.  These checks are enabled with CONFIG_DEBUG_PINCTRL=y, which can
> > be combined with CONFIG_COMPILE_TEST=y to increase coverage to all
> > Renesas ARM and SuperH SoCs..
> >
> > Note that all issues detected by this have already been fixed in "[PATCH
> > 0/6] pinctrl: sh-pfc: More miscellenaous fixes"[1], and are now part of
> > linux-next.
> >
> > I plan to queue this in sh-pfc-for-v5.7.
>
> With the fix you point out yourself in 13/13 for
> CONFIG_PINCTRL_SH_FUNC_GPIO=n feel free to add
>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> For the whole series.

Thanks, queue in sh-pfc-for-v5.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
