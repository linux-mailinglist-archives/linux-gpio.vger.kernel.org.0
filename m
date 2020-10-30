Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F66329FCD0
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 05:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgJ3Eqg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 00:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgJ3Eqg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 00:46:36 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07E5C0613D3;
        Thu, 29 Oct 2020 21:46:35 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id z6so3896426qkz.4;
        Thu, 29 Oct 2020 21:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fzgksPitq4UPlfGWWajj2JVz/dE561nycQDfwW8jv/Q=;
        b=RUvZPpLVywLKx60cuN5lSvJ+mzOhfVU7aPuAxNPxSRMtUGswTg+o7antOx3Wl1SvoX
         rmCERtnGcygp6w6G5WC26TD0SEX3vDuGJ83NSt7E2Cdx0ggltyDUzESq0l6LTeaA8xEa
         BRuFB1wb8WaU0etZepm03Pl0F4KfB0/MEKWBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fzgksPitq4UPlfGWWajj2JVz/dE561nycQDfwW8jv/Q=;
        b=Yyw0u76zb5TXp/qOmhOVKxPRua4/XGjONgMZqqxeuv5Va73COLA+CdFX8m+cFt8MZh
         7mGl/Hhhlyc1/P/x7Cfg+D1jGlN74PeXqrPXR+VwaFXO3gErp691+Hm8EO3RwrnWGxAW
         GSHylLxZ43MtLjTJatIoBLI6c/cCJWMqY1p8hwvvyLjYreYERSKsbtyde4KLm9OH27A5
         fUncpvqavFTB1zJUhfJXzaRYgI6mzIoTiRx27jzTQf3osCujUUbUBxOH1r/ynN/ZiAIh
         jXweMFQptoD1QKTuDhE4x4sB/PGYWQ0Esx0+eaTSvaMH+Qcod5YrRIt63Tk62Dcen2ix
         v6rg==
X-Gm-Message-State: AOAM533mw0JhYATm1k3W2EXWlQEjkVIDOgmDzs9Rh8waWgsFg5euLSOU
        BhmEmcQwGtW7okzBiOXcFsNd2vkDTD8A/CCR53c=
X-Google-Smtp-Source: ABdhPJw9D8ZjdZeQ8bvbkpU8ZXxlO1FOkzIT5AF2J70UORhP8FUuHjJwZykaO/bhfxXI7fXHA+KA0noTFMsBLYhK380=
X-Received: by 2002:ae9:e90d:: with SMTP id x13mr570307qkf.66.1604033195037;
 Thu, 29 Oct 2020 21:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201027084417.10137-1-billy_tsai@aspeedtech.com> <0d5e5d0a-cc74-4cb7-aed0-bb8c62661339@www.fastmail.com>
In-Reply-To: <0d5e5d0a-cc74-4cb7-aed0-bb8c62661339@www.fastmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 30 Oct 2020 04:46:22 +0000
Message-ID: <CACPK8XdFS957Jnv+S6=ufyjMEmGAd5a1PZNk-ytOCYapSAjPag@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix GPI only function problem.
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Billy Tsai <billy_tsai@aspeedtech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 30 Oct 2020 at 04:28, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hi Billy,
>
> On Tue, 27 Oct 2020, at 19:14, Billy Tsai wrote:
> > Some gpio pin at aspeed soc is input only and the prefix name of these
> > pin is "GPI" only. This patch fine-tune the condition of GPIO check from
> > "GPIO" to "GPI".
> >
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>
> I'd like it if we were a bit more specific in the commit message, and even
> better if we update the comment in the code. A quick look at the code suggests
> this issue affects GPIO banks D and E in the AST2400 and AST2500, and banks T
> and U in the AST2600.
>
> Functionally I think the patch is fine.

Also add this line:

Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")

Cheers,

Joel

>
> Cheers,
>
> Andrew
>
> > ---
> >  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > index 53f3f8aec695..a2f5ede3f897 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > @@ -292,7 +292,7 @@ static bool aspeed_expr_is_gpio(const struct
> > aspeed_sig_expr *expr)
> >        *
> >        * expr->signal might look like "GPIOT3" in the GPIO case.
> >        */
> > -     return strncmp(expr->signal, "GPIO", 4) == 0;
> > +     return strncmp(expr->signal, "GPI", 3) == 0;
> >  }
> >
> >  static bool aspeed_gpio_in_exprs(const struct aspeed_sig_expr **exprs)
> > --
> > 2.17.1
> >
> >
