Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A96301EE3
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jan 2021 22:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbhAXVOC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jan 2021 16:14:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbhAXVOA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jan 2021 16:14:00 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F5CC061573
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 13:13:20 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id f63so7229303pfa.13
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 13:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TlRSz6Pn8512gJpZf/3Ltqb+kC22NyUXWAknWvTSOJk=;
        b=EQYuZhTrIu1B4WAWM/3cyIuzM/MmQiReIw7AQE/bTWT6Vu3Nyg4mQ9nkr4/J2iriIY
         re6t/eSfmtr8TK0bZ5MbexcTeKXh3ScKwWHfEyQCVtgGj/YUj3NsNNrRJGRvMcQotAcq
         Dswgg3sC6EDNZVgC3eekm1dwU6xXmnYBJYRTXUdEL2cSwk5kiGDHnVPZyBuRRcxs9voU
         gHCTjL4Oy00wGyXJwksPsUkcfA+LUghWQFenRJG1qjXSGF8144WUYlO/SWgRLHnUCNmn
         VJCbRqv14d7Hf/PuYbaZta42LhZlWMVdefjJe5JFMa0CWkgy7AYMbf3gSz9bLpjeDCBl
         cPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TlRSz6Pn8512gJpZf/3Ltqb+kC22NyUXWAknWvTSOJk=;
        b=Hu+MawoMsMx46+kP9cVOwDOVsqJ2upQi4ChE3581JRLb40C1uF1NGwhyL6s1EoWUiq
         FHyH+O4fhJkM0wnTGsmPyFcHupnFdXBlmkZ6Mx8RlnRpRKqyYN2jLy4Rvcd4DjIyZgos
         c7IZcpYWvwiUsnETN5Ks0g7VpdTHeFL6iBWsNiV9GUohMmlbWV2K8fsQ5u0pZWVo9IZo
         cavlM4gzsDoBcOpK2f184XROeQgWKZYahjRezhYOuSKN1KraF0t/PizZhryix6AwQMM3
         W9TIyEXsqrHZbDoh/mug+qfVzejuJfmcoa4NRunJjFQ/wUn/jq4Xyt+E+L1FRzdCGkw+
         YaWQ==
X-Gm-Message-State: AOAM530TmaVq+0gtbUyx5lN3s4qgOM2fupv9nm8wNVS6yy3KLsovzOqA
        Xm9SuBFScDjRRHA8yTK/KFngpNouGtZFLrDtXrk=
X-Google-Smtp-Source: ABdhPJzwEQs5d0mwG9efjKj59mtprEGZlNtDvaO61Rc+jkEyqj3R2nrK75VxeOHKTioE0yemLK7ivzbRVMqOS0ZXCtc=
X-Received: by 2002:a65:644b:: with SMTP id s11mr15293898pgv.4.1611522798827;
 Sun, 24 Jan 2021 13:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20210123202212.528046-1-drew@beagleboard.org> <CAHp75Vfa2iS0RTXxaoUv9zwr7+GvaUwm0xqu4tiSF8zu1CkECQ@mail.gmail.com>
 <20210124202154.GA585361@x1>
In-Reply-To: <20210124202154.GA585361@x1>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 24 Jan 2021 23:13:02 +0200
Message-ID: <CAHp75VdyrfCxDxaV64eJDCvSiow-iL1jF7h+2EebA8=hAJS4og@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinmux: add function selector to pinmux-functions
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 24, 2021 at 10:21 PM Drew Fustini <drew@beagleboard.org> wrote:
> On Sun, Jan 24, 2021 at 10:01:49PM +0200, Andy Shevchenko wrote:
> > On Sat, Jan 23, 2021 at 10:44 PM Drew Fustini <drew@beagleboard.org> wrote:

> > > Patch note:
> > > This may seem trivial but I found myself coming up with series of pipes
> > > in the shell just so I could see the function selector in line with the
> > > function names. At first, I thought I could just pipe to 'cat -n' but
> > > that counts at offset 1 instead of 0.
> >
> > SO advises [1] to use `nl -v0` instead.
>
> Neat! That is a nice utility to remember. I feel bad now for piping to
> perl to solve the problem :)
>
> I know this is rather trivial change but I think does seem to make sense
> to print the function selector along with the function name.

I'm not against the patch. Simply learning shell together :)

> > > The only downside I can see to
> > > this patch would be if someone is depending on the existing format but
> > > I don't believe that is a concern for debugfs, right?
> >
> > Debugfs is not an ABI.
> >
> > [1]: https://superuser.com/a/1433656/415970


-- 
With Best Regards,
Andy Shevchenko
