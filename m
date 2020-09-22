Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17B0F273CEC
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 10:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgIVIEj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 04:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgIVIEj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 04:04:39 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64425C061755
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 01:04:39 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t7so1099685pjd.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 01:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zWqMa5Tshn6/Q/+0NbjHssCgmjlzoGeaz2OwCpGnxIc=;
        b=o/yM6JQvsi6DjItC3CRu/Tv1fTiYPo/8iKDgTUJ1RHV8lDJ1nlt+gitLPQnF+AKtEc
         ZMlYzTxJwOkHv6ovFjjXX4bdwV3masNtzO529eknwWfJZYQiBfVmq2XwSzSYs10AHeZh
         WNZIxdFIz8zpz9iYqIYun5QicxneCbfIQNb33VCKrKuKcXGaCoKQ9xRLTUBQPgsuxiFb
         3SmySMO8IjFXWVO+ZJ/eFH2+Xm90MrJN/6AqWUVJgAER+yoILR4rnCK3dGOhnhOYY6sb
         1HLdSga0x/08zVoize5nkVMd6mlwX93Jzmo/JqXfSm24vHUIVp+CV2MFlNCcy0S4o/Dr
         hSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zWqMa5Tshn6/Q/+0NbjHssCgmjlzoGeaz2OwCpGnxIc=;
        b=YsxBEKeCmo8g+letA3qLQl7zh20aELaz1pH8Uac9ukx6JMd03+J81cA7E/EvwXDD8E
         k2zDoRWxbitF70LEb0ANa62CsA4dLkqe7OvZz4N1nYdwZfc6DvZWIbGE+TIuoL3SIWL+
         Ry9OFZzxfMh5wn1Pn6ZpZhSCRUGBRDYQe2rbBDYba6BQCpfvd3yDnUctF7rqs3kucSRH
         dUjIPXP7fC1q8mpXxFS5hSJQPj03C5ZMDWgzXMvO4/nG2jUcWpX2Tg2grSGAZT2h4C/i
         lRz6koOkSud/0v0xwxTGyVTEiyBTrrTSfcW68qNu2n9q7S0XxxzcJa728+gftWyLbRYE
         QX0g==
X-Gm-Message-State: AOAM533oHSA6iuJQLBN3Ylg3zJwipSzTA95wXohn+ZBKfAT+LwRGBuBG
        8Pc7iUCmDFhdjI33oxsU4Yu22az/b50xhgdXItbxioDFKKCAHA==
X-Google-Smtp-Source: ABdhPJxJ1oLq+Mbwmj0c6MQZ8BFvHR+O89bL3XPms7m56ubQ34qi9IVxDe6hKJR9Oni88QrI2yHrTbO5owLjHaldt9c=
X-Received: by 2002:a17:90a:fd98:: with SMTP id cx24mr2636975pjb.181.1600761878937;
 Tue, 22 Sep 2020 01:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200914155714.GA43910@black.fi.intel.com> <CACRpkdb7tP-Zz0ycpss885nWOx-LoT6iPmRT5b-FrBM+x8aLpA@mail.gmail.com>
 <CAHp75Vd0L7AZnWfZQBycztS_OEORb4J=DQpS_cjdOf5cSOQRkQ@mail.gmail.com> <CACRpkdaufgS_LKfRvGCm0BXgrHyXfaVkMrqLh2ypf-bjDhJ93Q@mail.gmail.com>
In-Reply-To: <CACRpkdaufgS_LKfRvGCm0BXgrHyXfaVkMrqLh2ypf-bjDhJ93Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 22 Sep 2020 11:04:22 +0300
Message-ID: <CAHp75VcdXp_7rXtJdbJqpevsRHtBvZJK_ZW_N57-F++rtSiGYA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.9-2
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 12:48 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Sep 21, 2020 at 11:43 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Sep 22, 2020 at 12:08 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > On Mon, Sep 14, 2020 at 5:57 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > One fix for v5.9 cycle from Hans.
> > >
> > > Hm the pinctrl fixes are based on v5.9-rc2 and I got a ton of changes with this
> > > so I suppose it is based on some other -rc.
> > >
> > > I will attempt to just cherry-pick it to fixes.
> >
> > It will break fast forward. Is it a problem to have v5.9-rc4 there?
>
> Not really other than it is kludgy to merge it in, but is it a problem
> that I just cherry-picked it and signed it off instead? Is something
> built on top of it since you're concerned about fast-forwarding?

I rethought the scenario and I guess it should be fine.
Please, go ahead with cherry picking (it's only one commit anyway).

Thanks!

-- 
With Best Regards,
Andy Shevchenko
