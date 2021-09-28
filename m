Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DADC41B9A2
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Sep 2021 23:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242013AbhI1Vwp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 17:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241482AbhI1Vwo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 17:52:44 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF71AC06161C
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 14:51:04 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g8so583889edt.7
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 14:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Szx0KRxAY1iWhBwzGcls18nxb/23uO/zCRJ9bshJ2Og=;
        b=NkzmBZz3oUk1D/opd7WXzsGsTivcv+VE4r2n5gqmNnHMvUBjSQZuoyhm3UxWfkeJST
         +1+cw9zKXJ/QtNK/AY/OEtR3zg5zRF/FZBMUwZNA4LRMqWPuLqQG91DPlaXDo7UFsrdK
         X6/Nl0MztyE3Z7sN7029hRYCEohCJRn9WJBHbda9gk3qbrKCKWgAZddXxkKrO7jewf4I
         /9ANmDEEy1kTs9TRsHadOoMpHnohV6U3yeGukRWCUT4EASo0uiVqR7+vIaWdUZtkDho+
         gDLiBXpfc4dFOvhRSHEfMjUwnF6b6Ut6uJwVR/6ODVxh76XO6HukVrgFhgLGpTdupneY
         9vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Szx0KRxAY1iWhBwzGcls18nxb/23uO/zCRJ9bshJ2Og=;
        b=ZZI8mc7e/h6VuTOhvf0eF4IxW0y8SnYhdItl8iVd98eJQnGsQUlki29ggpuUbNCsUA
         B79sBGl6WQDAwrRxMa0K8qyqdtdbBSBsT2R5kQk9K1ULkhQPE4MIOYeRXO/kGjS/7SN1
         LHZ3TSJEIQ9f0uK3NYIxHR0K+n15eAsAy7Qq0akWJDVcbIzYKIYUaRVNHONfyAiCLhZN
         DGwKqyQGI8dUqfXBzbh/LmoXyBxt3mRsYosXSG7+9f4sy/hlb+oMJnXtRkU6fh2J5rvk
         gRg19vbh7COfdEEFJolI3bw98jez9/eHDcRjlTbKCOJ8e8er+tZgMghumSh5mdPRnC9w
         60pw==
X-Gm-Message-State: AOAM5322K2ZvlOUZscymOK30sYUOMzpMhqhQgXCXRrQBGJDQ4KPSRmFV
        4WJvBlCjuahmeBNOeXu8TB/tTR9hvLe70h+R+4NyJA==
X-Google-Smtp-Source: ABdhPJySp59BnT957BPe66/9N/APdOEP6Y8XeUIK+LsgfxsRdhVk90NaT8eveE7qTfwAvtS0dJoF6FwgYVapwKtWvMs=
X-Received: by 2002:a17:906:54d:: with SMTP id k13mr9811132eja.382.1632865863299;
 Tue, 28 Sep 2021 14:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210921222956.40719-1-joey.gouly@arm.com> <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com> <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com> <20210928182114.GA19131@e124191.cambridge.arm.com>
In-Reply-To: <20210928182114.GA19131@e124191.cambridge.arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Sep 2021 23:50:52 +0200
Message-ID: <CACRpkdZJepfZ4WpWoUyKO_OyoibAVOaisLm-ADaLq8a0H2fWVQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, nd <nd@arm.com>,
        Stan Skowronek <stan@corellium.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 28, 2021 at 8:21 PM Joey Gouly <joey.gouly@arm.com> wrote:

> > > Linus? Do we really need this?
> >
> > I don't really see this as necessary, we don't need to check everything.
> > Not that it hurts either, so I would say maintainer preference?
> >
> I'm unsure if that means you (Linus), or Hector Martin as I put this
> file under the "ARM/APPLE MACHINE SUPPORT" section in MAINTAINERS.

Your preference, I am sure that even if Hector certainly may want to
chime in, he expects the code author (you) to assume a bit of
ownership of this piece of code for the foreseeable future,
so do what you consider reasonable.

> > I think npins should be known from the compatible (we know that
> > this version of the SoC has so and so many pins) and the base
> > should always be 0? It's not like we have several pin controllers
> > of this type in the SoC is it?
>
> All we need is the number of GPIOs from the DT now.
> I got a bit confused with the 'base' here, locally I have removed the
> 'pin_base' variable and usage. I was confusing it with the `gpio_chip.base` field,
> however that seems to be about the internal GPIO numbering.

The GPIO bindings have a standardized "ngpios" property that
indicates if you use less than the HW max number of GPIO
lines (roughly).

This is about pins rather, so something custom like
apple,npins = <...>;
could be used in that case.

Yours,
Linus Walleij
