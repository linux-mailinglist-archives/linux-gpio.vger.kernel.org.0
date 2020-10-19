Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1FE292E5E
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 21:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731064AbgJSTVT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 15:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730820AbgJSTVT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 15:21:19 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6DBC0613CE;
        Mon, 19 Oct 2020 12:21:19 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g29so556407pgl.2;
        Mon, 19 Oct 2020 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7U2DM+cXPUFwt0wdUBTyEbcuXwHQWZarnn8BUuaqz2w=;
        b=sGQayWm2k91Spv4d2MxuhoIy5C8BSFoYi5ye+c/9fzD8sni5xZI24z9go78zH+CAi5
         ENFg17zqvlPR8a9SOow47zVHG1FfFCipwAmZ5mAFwGFcFlajJdL/999WwklCZZZ6tNtq
         IOH+g7GRrrIuHBui5dNfZ/I4Np2nNEGduhY62VvEIjxPTq2WGTokCPVzAg00jtpIKEA4
         mZcGHBcUd0Jku+dtQOotucws8G5qbuNcNr3sbhX7wm2oAlUEFLL6B8lBoifTSCcAbw/r
         US5DNZMocRqmgHWkeBF8+Mag3MSg/hT/+mJXt5f+1VstPNFAHmmKGz8yuPIIhuUA5lYR
         78WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7U2DM+cXPUFwt0wdUBTyEbcuXwHQWZarnn8BUuaqz2w=;
        b=uTB+yI+bVD2qRN+B7Pnpj8/AWu81bmdYxUyW7/AikrTE0/sS6pSJNk0hN3QCcUL9U+
         TRDZU6Uo1mQ1h76hz38EGqJ/9Q55qD2zUDgS24zlhrhIXY/Sd/R6++NWjAP8wtiprZ04
         YFGKllO0X6SAltnjeZSKkYypPgrWoxAO8keoeiukL506tHiK8EEP2UFdgCBN/gKZ9scX
         4znI+2CozYnoyJxHUNh7JhKIhNJJ5v1pI3DQgPXpfZ/GoJsx13eCuk5mwqtqJl/4ffA2
         PuggHgwVcZX3TY603IBC2+t9LfYaNQbYgYi5zthmQodEuth/RD0+0cCTVbpDwSxBEZWy
         C0bw==
X-Gm-Message-State: AOAM532TlZP/zrMrdjSpGte0mQeRP9m4I5E35uneprBQCndY1Zidp/u2
        kkltNrNQYvno0WJgCx5rxdipVmOefSMOX6Yusx4=
X-Google-Smtp-Source: ABdhPJze38nqZ9Ik6cQvqmnRK3SMVnAi1GdmpGV5byXnwSWfSNxpXGGeFSMEuZ52oiMHQJHU3W0lQCfagQu2ajKWST8=
X-Received: by 2002:a63:f908:: with SMTP id h8mr1038383pgi.203.1603135278935;
 Mon, 19 Oct 2020 12:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201019190055.7371-1-trix@redhat.com>
In-Reply-To: <20201019190055.7371-1-trix@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Oct 2020 22:22:08 +0300
Message-ID: <CAHp75VfwQB4hnDpk9uo2heWqNc2iv4AVZay4EacznY+why7nZQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: remove unneeded break
To:     trix@redhat.com
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, Linus Walleij <linus.walleij@linaro.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 10:04 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> A break is not needed if it is preceded by a return

When it's a single driver, use the proper prefix in the Subject line.

Also use proper English punctuation, i.e. period at the end of commit message.

>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
> index 5e24838a582f..2223ead5bd72 100644
> --- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
> +++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
> @@ -108,19 +108,14 @@ static int s3c24xx_eint_get_trigger(unsigned int type)
>         switch (type) {
>         case IRQ_TYPE_EDGE_RISING:
>                 return EINT_EDGE_RISING;
> -               break;
>         case IRQ_TYPE_EDGE_FALLING:
>                 return EINT_EDGE_FALLING;
> -               break;
>         case IRQ_TYPE_EDGE_BOTH:
>                 return EINT_EDGE_BOTH;
> -               break;
>         case IRQ_TYPE_LEVEL_HIGH:
>                 return EINT_LEVEL_HIGH;
> -               break;
>         case IRQ_TYPE_LEVEL_LOW:
>                 return EINT_LEVEL_LOW;
> -               break;
>         default:
>                 return -EINVAL;
>         }
> --
> 2.18.1
>


-- 
With Best Regards,
Andy Shevchenko
