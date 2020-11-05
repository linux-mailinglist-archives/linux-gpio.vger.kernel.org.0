Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5254C2A7B04
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgKEJw4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKEJw4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:52:56 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467AAC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:52:54 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id v19so913088lji.5
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7+TxYIIv3+XKkfN40exA1OolXvZmQTS7eH4pZ266X/8=;
        b=nO9UrRmax30wHrf2cNbf7PxTaCUypntKNicZDA8Y+7qyZ2/bsPVXIXcXIV3zJqHQAx
         UuSj+Nf//c1+iqhMEp0GQXM/xEpUD3uciPS7D5HSsBO8i48Ook5A+VcB0a7X2QN6Yrpx
         TNRAOfhI+u8NeUsuX9Fy2WCmsSrGSodAD4p3VUax5nAnZR4+PcgyhBcXmMunSvfwmwjP
         HthrT/PwUYm5ernY3NT7bY9ZAfdJA1OB0B6TZ5dztKjXf1zHeDrxsoIZIo1Q/U3M15gY
         0W2L/6b5hBBXKo01InTyaDUDMuN7+KGprF6mLUYUOKw5WwT0ww+jNkikfbBLY7uLpNOH
         +Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7+TxYIIv3+XKkfN40exA1OolXvZmQTS7eH4pZ266X/8=;
        b=nReTT5NmsxLD1eAKJ9+Fuoe5q+3NvoXtWZHAnobtvHUtdjOSXKyqYV4o4AWjXG1QsX
         R37XtANpP8qp0sIyswlu1E0TCf6uFuYuUfergNI65ZQZY4aLQ0iqBhqoZb31Keoi/jNj
         Hov9THRytTm8b8VKqxkrWABBNq2vPB2c6PIxFUi/B8LsV8VZipd0/7ZBTEIqn5/clbLC
         s5xk9Q9mEU49ijXfMSOJ8h1ZPh/DU9vy+uC/RA8fpuEE9Ke2zUS+pcXETaP42ppMY8U2
         3qr1GGWB+8tNYrMMHRWRLLmm3A80J4NEfZ/A+s/hFoVVRqDE+y8Q0dVN4Mol7qXX7Wpl
         0i4Q==
X-Gm-Message-State: AOAM533pcVHUQiGmV5a6vGQtR47fSyUbR7UutNHAL+N1vqmWwFYHNLxP
        z64yI5otnTGS26I+xxGJXkyBIRpDqDg7uct0x9tMuDSURZApfA==
X-Google-Smtp-Source: ABdhPJyld8rWHfsJdEsNav4GDmAxi3+b7TTt42kQPme4xBfa7WOQGbXRQ0yyjAzgNOoRhcHUGHuJAQ9qVE4eh6NDIMc=
X-Received: by 2002:a2e:8905:: with SMTP id d5mr570231lji.144.1604569972777;
 Thu, 05 Nov 2020 01:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20201028151637.1734130-1-geert+renesas@glider.be> <20201028151637.1734130-4-geert+renesas@glider.be>
In-Reply-To: <20201028151637.1734130-4-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 10:52:42 +0100
Message-ID: <CACRpkdYVT0KL4+KdE0QP7UEKCrAUOOS0aAXV7xfY_28DtpvokA@mail.gmail.com>
Subject: Re: [PATCH 3/8] pinctrl: renesas: Reorder struct sh_pfc_pin to remove hole
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 4:16 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> On arm64, pointer size and alignment is 64-bit, hence a 4-byte hole is
> present in between the enum_id and name members of the sh_pfc_pin
> structure.  Get rid of this hole by sorting the structure's members by
> decreasing size.
>
> This saves up to 1.5 KiB per enabled SoC, and reduces the size of a
> kernel including support for all R-Car Gen3 SoCs by more than 10 KiB.
>
> This has no size impact on SH and arm32.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/renesas/sh_pfc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
> index eff1bb872325ef3a..3b390dffacb4910d 100644
> --- a/drivers/pinctrl/renesas/sh_pfc.h
> +++ b/drivers/pinctrl/renesas/sh_pfc.h
> @@ -34,10 +34,10 @@ enum {
>  #define SH_PFC_PIN_CFG_NO_GPIO         (1 << 31)
>
>  struct sh_pfc_pin {
> -       u16 pin;
> -       u16 enum_id;
>         const char *name;
>         unsigned int configs;
> +       u16 pin;
> +       u16 enum_id;
>  };

Hehehe :D

The compiler people have something that is called "premature optimization"
which is when you try to outsmart the compiler.

So since you have metrics on this you have obviously outsmarted the
ARM64 compiler (I guess GCC).

What I'm thinking is that some compiler person should look at this
and say that "yeah sometimes you have to do that". In this case
I suppose the compiler really isn't allowed to reshuffle struct members
in memory since there is plenty of code that relies on them being
laid out strictly in the order they are defined into the struct. So this
is really necessary.

Second I think it warrants a comment in the code to be careful with
aligning structs on 64bit boundaries?

Yours,
Linus Walleij
