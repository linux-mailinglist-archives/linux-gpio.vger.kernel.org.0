Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552F32D8595
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 11:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407215AbgLLKCt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Dec 2020 05:02:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388641AbgLLJyn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Dec 2020 04:54:43 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120CCC061794
        for <linux-gpio@vger.kernel.org>; Sat, 12 Dec 2020 01:23:45 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id h18so10649277otq.12
        for <linux-gpio@vger.kernel.org>; Sat, 12 Dec 2020 01:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xgiZ9VtOzrjlt3iDYW4+OsekZtWirZOtT18aN7Ejh9k=;
        b=MP5e2TU4LQfx3RJf/wvRLjMZbwPvHul7cWetAIxdHgGch6eHNST1gDS05Zo2yBfoVz
         J6829BX4mmhAs3ZZ49Ib0q/pABaNrTkYpm+b7LJ4j0LwT4KP6PfNjCTa4Fmuxaulx0+P
         lphrhJIm3zWZp5hDWcm0jG80MwDsAJGi8/3YjjpGxrbLkl6tffz09C7UNlVRKFiL84QL
         lIhXKXg5GpmVki5vBX1wFZaqAVJgmbD9Qhu4IhlN/wwujafr1k81F6ML4v9JFcjK3hgE
         jR56du119Ok9kf215kjW8LMXYdiuRDXfm4qIxcYwxQhowHjGNxnL+wUYj/d56EXXfCKN
         SScw==
X-Gm-Message-State: AOAM533T4atq9PkSGqYiomVQ5yvxdZb5nXXTB3/HdgPbLm4Y+YnbIQsB
        wFOyevo0MsVlA8MRRbJSGJDKb4hBlnbYbKCD7VGisGSQutg=
X-Google-Smtp-Source: ABdhPJzyFA+xVN/CyFvNWH/GJ3zT/UzoxVOJVlzs5CqLCrBy4ZvhX1Zoxy800oHOZQleGlN+aVLa2fCcmcfPSK/CiZo=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr12899143otc.145.1607765024305;
 Sat, 12 Dec 2020 01:23:44 -0800 (PST)
MIME-Version: 1.0
References: <20201212003447.238474-1-linus.walleij@linaro.org>
In-Reply-To: <20201212003447.238474-1-linus.walleij@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 12 Dec 2020 10:23:33 +0100
Message-ID: <CAMuHMdXZft=w4JZz_xAJ2r3AVh1QS-OGrSuVjXd8mR8=Xhr+rA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Disallow identical line names in the same chip
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Sat, Dec 12, 2020 at 1:36 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> We need to make this namespace hierarchical: at least do not
> allow two lines on the same chip to have the same name, this
> is just too much flexibility. If we name a line on a chip,
> name it uniquely on that chip.
>
> I don't know what happens if we just apply this, I *hope* there
> are not a lot of systems out there breaking this simple and
> intuitive rule.
>
> As a side effect, this makes the device tree naming code
> scream a bit if names are not globally unique.
>
> I think there are not super-many device trees out there naming
> their lines so let's fix this before the problem becomes
> widespread.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This may be just the first step in tightening this up.
> Googling gives at hand that the colission warning doesn't
> happen much so we might go as far as to say the name can
> be required to be globally unique, but that creates a flat
> namespace so I don't know if that is desireable.

As the names are specified in DT, I think the biggest "use case" for
collisions is GPIO chips on expansion boards, if multiple instances
of the same board can be connected.

This is a bit similar to clock outputs, cfr. commit f491276a51685987
("clk: vc5: Allow Versaclock driver to support multiple instances"), but
in the clock case, the name of the clock output is dictated by the
driver, not by DT.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
