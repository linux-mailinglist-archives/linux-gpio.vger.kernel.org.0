Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 194823291D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 09:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfFCHIJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 03:08:09 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36973 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfFCHIJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 03:08:09 -0400
Received: by mail-lj1-f196.google.com with SMTP id 131so2550907ljf.4;
        Mon, 03 Jun 2019 00:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WQJinh/xC2bOeYFsYlUlkNYdlsn0JSMzJ6+7ugAlLz8=;
        b=QZZQgoLbbQc0jrkVDfSpuzJpgIayaXHNRgSjaSbQdmowgI1JNqXl47Wfu0zLb8DFca
         X3+uh5fbMFeyVbLsukRUfCEF0iWzY/8W+Fl6fkASVKi+IFM8vmBIVJJ396/+MGD41L+e
         mP/jf2ZiiNIll9kzGPJEwCl0r/IJWNWZa4snnakIQkEo1a7XZ4ueBResvFcmWdbwKqRq
         0WGd6MtPvNs7DMAYiKphJXQl5i0GbbuuG7sCJUCJ6e5XI7xq0HxqJ39IvEXk6WRhSUOk
         AvkSV6huBvXj73U5hz4fyCmCIypibf8Ws9K3uxefBseq2UY4MjySworHalZ+x78AvTPY
         llYQ==
X-Gm-Message-State: APjAAAXLP5JkiB0ql/R2W5DaNVzUGeaHJYe5BRQCvePB/pBByRpVy59Q
        V+N9iqXT2lxp1LHRiSAiKFPWKJm4geYM50niJAg=
X-Google-Smtp-Source: APXvYqypxYOxQMw1wVILyzLBXGz+DJuPq5TH5W+toycfqpB93xioye3d2NaNp9HP84cOJVmXrpIamDZiegLE7qs7sEM=
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr1410332ljg.65.1559545686497;
 Mon, 03 Jun 2019 00:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190601032242.10405-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190601032242.10405-1-yamada.masahiro@socionext.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Jun 2019 09:07:54 +0200
Message-ID: <CAMuHMdXXbEr=oU0amKLbEkTm3cZ=jyQuk1-aZa5L4JL_dUmYMw@mail.gmail.com>
Subject: Re: [PATCH] treewide: fix typos of SPDX-License-Identifier
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Kees Cook <keescook@chromium.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Takashi Iwai <tiwai@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Joe Perches <joe@perches.com>, linux-spdx@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Yamada-san,

On Sat, Jun 1, 2019 at 5:24 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Prior to the adoption of SPDX, it was difficult for tools to determine
> the correct license due to incomplete or badly formatted license text.
> The SPDX solves this issue, assuming people can correctly spell
> "SPDX-License-Identifier" although this assumption is broken in some
> places.
>
> Since scripts/spdxcheck.py parses only lines that exactly matches to
> the correct tag, it cannot (should not) detect this kind of error.
>
> If the correct tag is missing, scripts/checkpatch.pl warns like this:
>
>  WARNING: Missing or malformed SPDX-License-Identifier tag in line *
>
> So, people should notice it before the patch submission, but in reality
> broken tags sometimes slip in. The checkpatch warning is not useful for
> checking the committed files globally since large number of files still
> have no SPDX tag.
>
> Also, I am not sure about the legal effect when the SPDX tag is broken.
>
> Anyway, these typos are absolutely worth fixing. It is pretty easy to
> find suspicious lines by grep.
>
>   $ git grep --not -e SPDX-License-Identifier --and -e SPDX- -- \
>     :^LICENSES :^scripts/spdxcheck.py :^*/license-rules.rst
>   arch/arm/kernel/bugs.c:// SPDX-Identifier: GPL-2.0
>   drivers/phy/st/phy-stm32-usbphyc.c:// SPDX-Licence-Identifier: GPL-2.0
>   drivers/pinctrl/sh-pfc/pfc-r8a77980.c:// SPDX-Lincense-Identifier: GPL 2.0
>   lib/test_stackinit.c:// SPDX-Licenses: GPLv2
>   sound/soc/codecs/max9759.c:// SPDX-Licence-Identifier: GPL-2.0
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks for your patch!

>  drivers/pinctrl/sh-pfc/pfc-r8a77980.c | 2 +-

For the sh-pfc change:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
