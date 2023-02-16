Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0BD699E69
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 21:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjBPU5T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 15:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjBPU5S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 15:57:18 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4339B5034B
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 12:57:13 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-52f0001ff8eso42851717b3.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 12:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZFkias2XgSakIyQ/yJ/KyrbmtnCd3NbgWRQs5cfs8Y=;
        b=dwWnz+cEkT/5NSYvQcAE6Cawz48MTxEb3LvO6FmBYdcXFD5uyIkbpmJZ0aJquNh2ZB
         8PYEMsHnDfT2pnEtaxmi2RUiJ3Q/T+6YpQVh3B2OsaNX3UunF22vBzMoIV1tyRM2AFGB
         GQjaB5NHiSo4LQzEWUAdSFpwL2RCx6qGuK0qkPx2SxzpXujg9lKC+3ZF6a6ta7mvWu0d
         eLYFZX5zSFihm7CcFVBDgfKJruF2WoTMcieYpo3TZ9BXAqbzwfU/X0Bg3QJEzo6do2En
         GKQBQZJ4UNdj5QY+5DIwTOGwC2h9wPq9Qfc2CaZIjOwd3wLA/tPEwbSchkiAgazdhynI
         ZjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZFkias2XgSakIyQ/yJ/KyrbmtnCd3NbgWRQs5cfs8Y=;
        b=k7r2B5XgrVIz3VySdfFftO7Bo4HO11qUtFrEg8xfKwGGsSgecLE7v5h/63BNwT4/W+
         ubn4Fw3fsAtMrIE3B1eXpKEsBbWmfE9f4PvqPKaK9wCJZH3p76Jullx0+bCbKvau6KdN
         YoQJDmFwjZC5UsYNJvDFRmw++Nzj/bO6t4JFoXKE2TXCWG7Ar0U2nyC4jOBNcTJHUFkp
         gSGdWUfZSNoTLKXLW6fYF5o+ttcXIIY/IWt7hR7DjhBtgHhS/HI8xnm0R7eUb1tqsMbN
         6A9aPRBVKVJzF5eEfR17iz5S1x9zcXFR3/QX4ATgheIC+InC2J3KhF3PBFikjdM89MR1
         oFjQ==
X-Gm-Message-State: AO0yUKXAMsN4r/m+8vAxW0Zv6ZxNYPT/xtzCPnajv7jk9GN4R7Sg/fLn
        hYGnms+2wLtyc+N8iYs+PSDErryKI+V3SABZwHFZ2TA0pwnMhg==
X-Google-Smtp-Source: AK7set+VVuKsycLpjIeDTjdR60bkGwoSljwMi6eDQ7MEdk2dPfbMdp9P5XGKzkvk9mLroAReurAEXDHfZLP4f8ogJ9U=
X-Received: by 2002:a81:a008:0:b0:52a:9161:f533 with SMTP id
 x8-20020a81a008000000b0052a9161f533mr1072468ywg.64.1676581032503; Thu, 16 Feb
 2023 12:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20230215213843.1737181-1-linus.walleij@linaro.org>
 <CACRpkdbP9HQp2TwB_KLgp11h+DArOmtGYRS+gRBrGb244YqZ9A@mail.gmail.com> <CAMRc=Mdk-7bQchQnHL8Lu5FDQSaWs8+zKLYTTfDPsxyovdjJpA@mail.gmail.com>
In-Reply-To: <CAMRc=Mdk-7bQchQnHL8Lu5FDQSaWs8+zKLYTTfDPsxyovdjJpA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 21:57:00 +0100
Message-ID: <CACRpkdYrRoGWMvwKM3V8kfMuZW_Tjnq5RfZ2RnUjQhOuoSv-Hg@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: Drop irq_base
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 16, 2023 at 1:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> > Bart: they should probably be merged as part of the big set
> > if the OMAP guys are OK with it.
> > Sorry for the inconvenience.
> >
>
> Can you resend all of them once v6.3-rc1 is tagged?

Of course.

> I will not be
> taking them in before the merge window, let's give them some time in
> next first. Those sweeping driver conversions usually end up breaking
> a thing or two.

I was mainly posting them so that people test them and not convert
the same drivers since I'm already working on them, we can look at
these patches in 3 weeks.

Yours,
Linus Walleij
