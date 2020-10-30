Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0552A086A
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 15:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgJ3Ot5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 10:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgJ3Ot4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 10:49:56 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A67CC0613D2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:49:55 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id gr24so109613ejb.9
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xqovcv4BEyRg+JlcMei9IWSybV8Hh/8M7HCklbD89kU=;
        b=yV9K85qHGB+1HuRuct8xpOltYQd3bFJXVXraAIrpu7TnNlX4Vb2LQVsa7MoKTqmri4
         YO89b8/uhIQ2tEdCwgWT0AN3SMku4E34WkYdTGZ4GgP0fi7sr2Neqz618/aqSM3JPv86
         Q+gnt8vkeR/rS2yGmmxyL23SryGKcb5twew1SlvG62uYTKY/nmtZCaz5iJsqX8GFEnx2
         0S6JjG4W1GPhdmv8f3P6eX1WOcyNYfaGG3HKTn0eeVAEaiK+aOE+1IYk6BusoUvBDmkx
         rm9UhCpTe43ygBooGf6LCvujT5ATRAWONtEkh02ko2SYdmh/4O0vHPJ/+l6w4K38jbMm
         cI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xqovcv4BEyRg+JlcMei9IWSybV8Hh/8M7HCklbD89kU=;
        b=ZONXwsaHEQuROZRM6F4V/VMBcHHo64cAr8wArG/CUqbKwhIJuH823T9La3Wi6IOYer
         VytWKYd4nMHF4wFCFaAg61voCl8eKpaqODS7g5Cw2M8+JoAALmBxT2NH7tSsuwJ0qYXJ
         KtqAWBEWfEE+v/okdR0Xk61gLqjx3FA+xgBIDrZ46CB5J7rjcxCjrKtEnteyWCPDXUvn
         XCfDodnh74/M7low1U5q/pYGvM8HSAJ7ixvugJkqD/vJlxtAy/zF3+lT0RbvylSaueX4
         +Wl6xxWEzlyjwx3r0CWye+ivaV6WKjux+z2n/WcDE0zdyzOLQguS7l811k1Lf8yCKqgb
         jCXw==
X-Gm-Message-State: AOAM530d7dHktK7+czDYJUA1c8X/tZYv9WVLW3BX/ntG1iJYzBlVxRpH
        F2Ihv7AgNoi+qZ8H3/DfLazl3aAAKQfubj5hx/ALjg==
X-Google-Smtp-Source: ABdhPJxWPoDgIa0BiqFupfsveL3/XvkS0oLh19YB9B4h+jznc28HVKswdV4KZEuYgyoEx18RNRs5w2sA4f7tsmtK0wI=
X-Received: by 2002:a17:906:7d0:: with SMTP id m16mr2757733ejc.445.1604069393835;
 Fri, 30 Oct 2020 07:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201014231158.34117-1-warthog618@gmail.com> <CACRpkdbTsN6p4n3f9SJrgAjdkzDu2S67rU3tLWwX0X50ekjctQ@mail.gmail.com>
 <20201028232211.GB4384@sol>
In-Reply-To: <20201028232211.GB4384@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 30 Oct 2020 15:49:43 +0100
Message-ID: <CAMpxmJX61dRE_d2Eyu2nXKx64rNrrTfScrdg=Cc-N-R_FKfUNg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpiolib: cdev: allow edge event timestamps to be
 configured as REALTIME
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2020 at 12:22 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Oct 28, 2020 at 05:01:49PM +0100, Linus Walleij wrote:
> > On Thu, Oct 15, 2020 at 1:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > > This patch set adds the option to select CLOCK_REALTIME as the source
> > > clock for line events.
> > >
> > > The first patch is the core of the change, while the remaining two update
> > > the GPIO tools to make use of the new option.
> > >
> > > Changes for v2:
> > >  - change line_event_timestamp() return to u64 to avoid clipping to 32bits
> > >    on 32bit platforms.
> > >  - fix the line spacing after line_event_timestamp()
> >
> > Where are we standing with this patch set? Good to go so
> > I should just try to merge it?
> >
>
> I'm fine with it, especially now that I've tested it on 32bit platforms
> as well as 64bit.
>
> Bart was ok with v1, and I doubt the changes for v2 would negatively
> impact that, though I did overlook adding his review tag.
>
> Cheers,
> Kent.
>
> > Yours,
> > Linus Walleij

I'll take it through my tree then.

Bartosz
