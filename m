Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29CC3E8CEB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 11:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236539AbhHKJLx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 05:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236312AbhHKJLx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 05:11:53 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4863C0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 02:11:29 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id m9so3416190ljp.7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 02:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=45L965AHZgo82l4aN2SrSPr1cis24KkD7elj4CXl2IE=;
        b=tHkB54ySsHx551ghZG3oiWj9E5OW/jA0gsGikYmUj5abrUVPS1pVfN3YxmEs2Txlur
         ZUKxCfCNrdIg4aTp9DKXjGgZMeKIi7GQEmtRY7jd6QCzL89NhZceOeCtuySmIX8VXHB0
         +fwB+P1mzXXtfPraNDkgH0mZOQmFtC97CavMsU6Y7KYupLPgkK2B5BYh77cPr/720/ks
         CK6XjfVWlCWsRwnBexZGmArWthojlDpRrGh4UTWPSanKqLH2ldait5j3KFIvWCI5ji6d
         67JYZJ2Xm+uVc0Cv6VHJn5x7tGKGvldtq2Kcfk0d1vuVQbKOsUwkjr5fuAm0fDlrX5yC
         TbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=45L965AHZgo82l4aN2SrSPr1cis24KkD7elj4CXl2IE=;
        b=CeNSUpa22CpPfCkzDsaEedBjD7FtFWO5rs67VZCkCMBv7tvkkWao7pFPR5vGPp1KgP
         Ds/7dkZKuHq0nJ0XD2lFF/3W5Ej83r3idWHJpOWQCP5SL3sSNKqRy2hWL9N7r55uNhsU
         vL7skk+B6B4pUWFgyOT/TqZfO/SFeUgndIY2XK4M85LgCvyjl1zTfR4nH8dljb83Q54g
         k0FwVgBxzbhj7cMXeG9zMpiMR0Bj8XXvlEF5OGPD4HlZF+XCdOfMZt7emBnkSuaGXhE9
         O0LjR6+IA8lfP7WfiCB2kxNZYcu6iiiqQIAd9zXF8egP+Zo4jB+VMB8XyOkx1S6ntP0a
         HXRg==
X-Gm-Message-State: AOAM5327YaCOuPW37/N11RJSW8bVM4JbAvyTmikTiqR2sv42oH9ZH0rO
        hZ3PpERhV7pa3sHK1YzJRuuivZU7OL2K6pXXdMULuQ==
X-Google-Smtp-Source: ABdhPJzRqUz/cks6mC/kThItyPh6HXSuFGyiXatmiGVouPLRVCOkyePXj7L3M7v54DYVWz6HfqDUb6kTsZt1fLEjXvo=
X-Received: by 2002:a2e:9e46:: with SMTP id g6mr2650552ljk.326.1628673088252;
 Wed, 11 Aug 2021 02:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210625235532.19575-1-dipenp@nvidia.com> <20210625235532.19575-10-dipenp@nvidia.com>
 <CACRpkdaqKJLUdf3NiFHaTgu6buyhMb_D1yKyHF4M=eTQ94pe-g@mail.gmail.com>
 <b87fa5d8-bef9-9046-9747-d4428ddf58ea@nvidia.com> <20210731061617.GA12414@sol>
In-Reply-To: <20210731061617.GA12414@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 11:11:17 +0200
Message-ID: <CACRpkdab=VhSgWOpBQ2rB4AiQF4zXJ_S20A826ZxufJAvN9cWg@mail.gmail.com>
Subject: Re: [RFC 09/11] tools: gpio: Add new hardware clock type
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Dipen Patel <dipenp@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 31, 2021 at 8:16 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Thu, Jul 29, 2021 at 08:17:22PM -0700, Dipen Patel wrote:
> >
> > On 6/27/21 4:36 AM, Linus Walleij wrote:
> > > On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:
> > >
> > >> gpiolib-cdev is extended to support hardware clock type, this
> > >> patch reflects that fact.
> > >>
> > >> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> > > (...)
> > >>                 case 'w':
> > >>                         config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
> > >>                         break;
> > >> +               case 't':
> > >> +                       config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
> > >> +                       break;
> > > After the checking of the command line options we need a small sanity
> > > check so we don't try to enable both realtime and hardware clock
> > > at the same time, we will only be able to request one of them.
> >
> > This will any way fail at gpiolib-cdev layer. Do we want to add it here
> >
> > as well?
> >
>
> I can't speak for Linus, but I'm fine with it as is as it allows the tool
> to be used to exercise the sanity check in the kernel.

Fair enough, that sounds useful. Go ahead with this as-is.

Yours,
Linus Walleij
