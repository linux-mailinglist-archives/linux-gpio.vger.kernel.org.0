Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 475FB4D51E6
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Mar 2022 20:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244855AbiCJTbh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Mar 2022 14:31:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235547AbiCJTbh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Mar 2022 14:31:37 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AC413C9C9
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 11:30:35 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id bg10so14380037ejb.4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 11:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FKNb2woAN/ogVBDtyGjLgMM8TFR85EErV6rTyMqQOHE=;
        b=hJ8wYHPm1Vu4JRAQiYGwZ1DLPZl09RsonpRp0w7gH5eEFpRYQx0FS6Ds4afFYEqboG
         Acp+mv2OQZre2lMbttv8IaeieOPvw5YNWyeeuIbUKm4k1k0VrnZF3mvkDLo5+IW1t8E/
         MZKup0cf9OPXpi2ixIYyswpBjY5/PGndXIv+CCXCZ0uRVXbFEi+3T5aV5GaYYYBobj0c
         +ETsbwu9zzvMFf6UrhgDAF1mSFUBjUw5YG8CSPEFRPMn1q/ZyamKbQxKiTZgRo/VdjuE
         nelyILS9Z8vwgohGg+61iaVmrtJTxoVSWOVnmh9XuGRLTz35NR/kU+ROw8LfAS+8j+5a
         FieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FKNb2woAN/ogVBDtyGjLgMM8TFR85EErV6rTyMqQOHE=;
        b=Am8ynIusHe6Fgzlqi+ynhk82zUCTG453L7tTZXFfY9mLDYHdbOBWOjDlSSVxEb5BFC
         0NYsNlA60/9BboE4QEvk1mTOXV/9Ey8PvgsnnyKCx7ruRIq6VtIlzXy90uK+IdezbkhT
         EX4+6SHtNaJN82SNz6Vu9Q8Rie4OYbUUxagDvDEJodCK4VdElVYHJkdCjYr8fLUgNf3W
         zhNodlBKLGkP3AwZefbdv/r3smsboTpOLJtvOUAg4nGXl4YFVGo6DCxMHuGt/KvQym8b
         saRBwS+1M6hiJ/lcxuj5alJtOInGySrgHmBtFOoznd/YiLWW3xPPhSJrsRgSR4s+h/Rv
         9Fag==
X-Gm-Message-State: AOAM531RZh+dj6tbIp2Z+gXkQubk6oHYHb2rF3gL+bcfutxpxAlh7psG
        b1uQpRcRL9cc3BBbaWlvCBSEX5XPjUCJdigNrtrSXQ==
X-Google-Smtp-Source: ABdhPJxjlJm4ZlcYdr0irGLNCOsqGAyohlNGd1x2M7njvASMS9LrOXfsKcv51bZZWjaJ3FT9bKlCflPB1qUxdvkX03M=
X-Received: by 2002:a17:907:72c3:b0:6da:c277:8c62 with SMTP id
 du3-20020a17090772c300b006dac2778c62mr5643087ejc.492.1646940633807; Thu, 10
 Mar 2022 11:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20220310011617.29660-1-kris@embeddedTS.com> <20220310011617.29660-2-kris@embeddedTS.com>
 <CAHp75Vdu1r0S2ZCjH2mjToYZiwQTOiUAvY5v-T7f=u28tVuxcQ@mail.gmail.com> <1646933773.2804.1.camel@embeddedTS.com>
In-Reply-To: <1646933773.2804.1.camel@embeddedTS.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 10 Mar 2022 20:30:23 +0100
Message-ID: <CAMRc=MerqLPZSCd8+YSAwJPe1_zpOYQK5C-DXirC6dvR4Yss5g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: ts4900: Do not set DAT and OE together
To:     Kris Bahnsen <kris@embeddedts.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Featherston <mark@embeddedts.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 10, 2022 at 6:36 PM Kris Bahnsen <kris@embeddedts.com> wrote:
>
> On Thu, 2022-03-10 at 16:48 +0200, Andy Shevchenko wrote:
> > On Thu, Mar 10, 2022 at 2:22 PM Kris Bahnsen <kris@embeddedts.com> wrote:
> > >
> > > From: Mark Featherston <mark@embeddedTS.com>
> >
> > Same comments as per v2.
> >
>
> Thanks, I'll get a v4 put together shortly to clean that up.

Hey Kris,

I already sent it out to Linus, please create a follow-up patch for that.

Bart
