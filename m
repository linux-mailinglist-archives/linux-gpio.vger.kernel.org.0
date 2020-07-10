Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC3E21B69F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 15:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbgGJNiT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 09:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgGJNiS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 09:38:18 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90B5C08C5CE
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 06:38:18 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x11so2258667plo.7
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 06:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Sv+M4adAfJ2KBtRs5C0W7kTUr6n09tXW5cgJGIdyAw=;
        b=LtJSq9XDKod6tTtgAbU1RkPblFLJjaykur27qVZtTtOgLqpNZL3xg2Uj+YT+2Z/78Y
         +33qXMQm497nQsGPWKGagcuNqN6x0vJmadtUywDwVcZO5yk/FJ9ut7Kkq2MYD73bN4dO
         yqUPy1B0QxwwZAvBQHecFJeYqPZB3PzmPb9Z7XJP3Q5UiQaHeyCWSlxGAG5r8/kTticg
         V3xmto+AAyZnkRgS/YtiFOj9u8I7la36xPSnTeath2CqnoSLGhKmDFVddpj4VAiWuVuE
         RG8zBGmrPorlETOOcoI+a5pEQpsuRrjghrB/Frb4uNe0lddOU7ny2z5scnJfFSZ12Wim
         mEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Sv+M4adAfJ2KBtRs5C0W7kTUr6n09tXW5cgJGIdyAw=;
        b=BOp3uHv7l+CEcmI4pujMsXWSmxWI7CBIvgtjgJNojLTXfIH05bpqxMSUH/Nttascsp
         yHk5NzltZvtsKzACnmbhP/l+E0vXu2uRbXv/+CONFsiodsuj/iBv7dfPXUYFsYU70wT2
         uDnd9iG65GCS6JhBGissPp9c5NOIKNeuF0NXU6o6jdQxJxiZ9KS/jVpZpxGlk0DcpfHB
         7WCcsh9m45z8O9OIOEkgYEmu2Cfu8G5kgdTCY4bJ/wVPoWxbtSGzWF8oV3CnKjIsejtV
         e843D88cNDWbUx9aHmsddnkVyL2UN8aEIoPjrQzNgvhQlrCbQKft3BsQ0aDy0DYY1HYR
         kWTQ==
X-Gm-Message-State: AOAM533GgGAODMzZah4PVITj+OpG9yXSNbN8qfLNO8c/Wund0H2KVl+0
        Z4QJ4b1m2iwu8aoFMpxMR5saD8/F6lTrL6Dm/84=
X-Google-Smtp-Source: ABdhPJwZkzEGB5HuDtj/fTkBtveFlUr/+cj2Uj2F8lHvP3D0U3AHx3tPnOvmH2O+yLJI/wyrLCErU97x62QfbZSEUUI=
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr60520971pll.18.1594388298181;
 Fri, 10 Jul 2020 06:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <5f049035.1c69fb81.15cb1.53fdSMTPIN_ADDED_MISSING@mx.google.com>
 <CAMpxmJWDiF+x5YzYcgcQgH9C6U3rpZLex19UGFAAj7Dh-+BA=Q@mail.gmail.com>
 <CAHp75VevzXfUH2E6DPRt4QP82xcDqPAZeKfqFAmiwcNG4XaK2g@mail.gmail.com> <BY5PR12MB41141291F53618E098239A73F9650@BY5PR12MB4114.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB41141291F53618E098239A73F9650@BY5PR12MB4114.namprd12.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 10 Jul 2020 16:38:01 +0300
Message-ID: <CAHp75Vc8WTO5pO3wyuuRZczavE+QKJM3=ji1J3OEmzjFdjj+ww@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Add some warn print for easier to debug
To:     qiao mnlife <mnlife.qiao@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        mnlife <mnlife@foxmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 10, 2020 at 6:11 AM qiao mnlife <mnlife.qiao@gmail.com> wrote:
>
> However, in development, it is not easy to know that this problem is caused, just looking at the documentation is not enough, I need to read the gpiolib source code more attentive

Have you tried to enable CONFIG_GPIO_DEBUG?

> From: linux-gpio-owner@vger.kernel.org <linux-gpio-owner@vger.kernel.org> on behalf of Andy Shevchenko <andy.shevchenko@gmail.com>
> Sent: Thursday, July 9, 2020 11:40:52 PM
> To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: mnlife <mnlife@foxmail.com>; Linus Walleij <linus.walleij@linaro.org>; linux-gpio <linux-gpio@vger.kernel.org>
> Subject: Re: [PATCH] gpiolib: Add some warn print for easier to debug
>
> On Thu, Jul 9, 2020 at 4:27 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Tue, Jul 7, 2020 at 5:09 PM mnlife <mnlife@foxmail.com> wrote:
>
> ...
>
> > > +               if (size >= sizeof(prop_name))
> > > +                       dev_warn(dev, "prop_name %s is truncated with size %d\n",
> > > +                                prop_name, size);
>
> > To me this isn't a reason for a warning. If anything, this should
> > simply be documented (if it's not already).
>
> +1. This can only be useful in the development cycle.
>
> CONFIG_DEBUG_GPIO easily catches this as well.
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
