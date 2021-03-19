Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C65E341974
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 11:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhCSKEl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 06:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbhCSKE1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 06:04:27 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1F3C06174A;
        Fri, 19 Mar 2021 03:04:24 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id r17so3338628pgi.0;
        Fri, 19 Mar 2021 03:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cIF840WHHbMimxYNljpuxfKSY2LGH6W0yrfdQOXK+HY=;
        b=W4sLJB0lgpMy0BvORgwtEupsCMdBI157b42/+emInFb3Bc09VDbS+fWcmDegZgSXVe
         NQJ1sgjjophd9NNS2QUpwoHEOe8YeyFFS4BO02XtbO5TRvrjAg/85AsK0HZOf1yf2YSv
         SCXFxZUyI2H7KgdD6jy+AeaP5GlW2S2Q/KyCdwQ9evvWzoZgEGMYdFE4jIDNbBImWJ4b
         8qmV28c5xQpm0XcpSXGvCFlqCPe72L0nd9yTg5R7N/EAAwb6yGg9QO15MgdecBNArorE
         lmY1FqVrhOBvr6rgNrcUvLTZXzXYgc6zWJitE9bn8xaeyUdi6N9wa4OPfVxwvJ5RYFwA
         CCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cIF840WHHbMimxYNljpuxfKSY2LGH6W0yrfdQOXK+HY=;
        b=PnR07ZIX2jW26l73UWwsNqny1iRjZIrdUs+U4+xkSKLvbzhwq7yIWcGbwRaDOrR+qF
         RUZSheILYJMsiY3VF/0J7scL27NJ2f8N+AsfrNnfsxiFO3OOa9iGaUanWpHOxHnI6JJc
         5JjfsYJ0rReSoY+SoQvOfh76sRXkhjP2/qDlY+NbYfwUQKMGH30d+ARTJWzSXivhkJ98
         W3CjzlDS6+NvIxfTreHEzWQ3gi4GOmLo3VY/WdTBC5wIpguLoqkKzBCpFyB9p4hXP7ie
         oRNIiEs0y4RPiWHEldhgak4IVdXb+jLEOnKQhX+qvxfcPlhVMBYlgEBeynH12xZv6B5+
         GQTQ==
X-Gm-Message-State: AOAM532sswmVdzYFTaXbnMI+LEBPDPIQZM+LdVVRj1LjGQHlgA/QP/4a
        H2HW15Xjg/5BFpban5DGR5Gu75UsuKUz8yGDTUO40c8jEtsj0g==
X-Google-Smtp-Source: ABdhPJyDF4yPgnd7NSChPy3uWStR7M7wOgJ4TrxefxNZK4ex35+euO+4Ypr8whrISkbSiTrIiJnM7s7yO5WP8Ddas0A=
X-Received: by 2002:a62:7c43:0:b029:1ef:20ce:ba36 with SMTP id
 x64-20020a627c430000b02901ef20ceba36mr8556469pfc.40.1616148264353; Fri, 19
 Mar 2021 03:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210317214149.20833-1-hhhawa@amazon.com> <20210317214149.20833-4-hhhawa@amazon.com>
 <CAHp75VdYeVOHu5T37EBEjL5xfgjevzb-ErZb2QMy7defXDS5fg@mail.gmail.com> <cd589749-7f37-9f7f-9d36-42032c724506@amazon.com>
In-Reply-To: <cd589749-7f37-9f7f-9d36-42032c724506@amazon.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 Mar 2021 12:04:08 +0200
Message-ID: <CAHp75Vc-5DxJC41+ATVjuczGgdHkDkukvpFzi0bWH5GD7uMfHg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] pinctrl: pinctrl-single: fix pcs_pin_dbg_show()
 when bits_per_mux is not zero
To:     "Hawa, Hanna" <hhhawa@amazon.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Woodhouse <dwmw@amazon.co.uk>, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, tgershi@amazon.com,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 9:53 AM Hawa, Hanna <hhhawa@amazon.com> wrote:
> On 3/18/2021 2:15 PM, Andy Shevchenko wrote:
> > On Wed, Mar 17, 2021 at 11:42 PM Hanna Hawa<hhhawa@amazon.com>  wrote:
> >> An SError was detected when trying to print the supported pins in a
> > What is SError? Yes, I have read a discussion, but here is the hint:
> > if a person sees this as a first text due to, for example, bisecting
> > an issue, what she/he can get from this cryptic name?
>
> What you suggest?
> s/An SError/A kernel-panic/?

Not below, but something which makes clear what SError is.

Like "A System Error (SError, followed by kernel panic) ..."

> Or remove the sentence and keep the below:
> "
> This change fixes the pcs_pin_dbg_show() in pinctrl-single driver when
> bits_per_mux is not zero. In addition move offset calculation and pin
> offset in register to common function.
> "

-- 
With Best Regards,
Andy Shevchenko
