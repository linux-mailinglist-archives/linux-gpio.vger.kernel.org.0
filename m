Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9720424A554
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 19:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgHSR4W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 13:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgHSR4T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2020 13:56:19 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377FDC061383
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2020 10:56:19 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id f19so13977299qtp.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2020 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gfiunOf44XI9+MPstBMX2TkSWz+lSVO6pH2bOmIQZyg=;
        b=dr3dJhrH7Fmq9QexZ8NGZnM6Swg7W4thUUaNwI2rHnqIu5z4g6DUG/HdvRyI665jyN
         UshRRSz1Eckur35WFE3NFtjEPKm+LSVU36xgljQ4KddIzTauT/Ld7fyVb6ur+Tw6cUOu
         xwjI7yuH8xDlPGsE9lyHjvbNF7hCat8xT26w0T4b1C/dywBj6ynGmDzejPCwyC/VyqFK
         4cDB/R028NBn2N1cGP7IWHEWnItDcJLhUuC5Ce9ld2XZt2cl+ezYlIlsTeUjPadIM4tW
         qd22R/LWVasY9Aj6lvN+7ooEDxHu50trpxMP4EMGo4ftF/AaFhGpI7airSQTlk+Odcbm
         A1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gfiunOf44XI9+MPstBMX2TkSWz+lSVO6pH2bOmIQZyg=;
        b=YcIHEfiWc/Sl/8TOOqnZXRgdGwEAnj/S2WdtFqDtQaCR6XxGUfL1A1eFwZD181krwx
         lX96o57xI/gyWPf7dAh5/O7zs9Wy32FR531PaG9a/VAjxmUtgfqEd+VNxmJqGNbMQnSS
         1uNcFHfOM8gH4Z+xtNPb5WyrwZ1XicmEJ8F4Rs1a88bQCn2yN85PwHSD1xDv2d0v3Cdd
         mTzhUPRzhJFIf9VAe26z7xdIOuaWnGqleMV6x+tNXTarUh54VD/eSLI2hpNeVwFB+7zg
         +S/bXeAH9VVkY1W6i0QLtMQ+kgec5vJeMIfPnTPPod8vnw9pVO9GXzW0kihkha7L9LWT
         xytw==
X-Gm-Message-State: AOAM533Ct9VlQgYXC6BPNJFtgq51xwabrBiwzUmGAWWxtIyAQDov/Abp
        KlJD3o97JevlKrgKvb+iD4XLocZ1ASyk2zv23audPA==
X-Google-Smtp-Source: ABdhPJyQtuknrzEQNakf3MeOPHKQ+Hx1XSYnrhn3uCBBj+Y38XMt1c6t8P7GG779ClFTdqFo8Nvm3vjlS2YB0moYWYE=
X-Received: by 2002:ac8:4e39:: with SMTP id d25mr22979101qtw.208.1597859778427;
 Wed, 19 Aug 2020 10:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200721144832.750728-1-abanoubsameh@protonmail.com> <CAHp75VdFvAYR+z8c6R2J9Q2JK-WpHS4LU_-cWvsOa2g8+Gfk9w@mail.gmail.com>
In-Reply-To: <CAHp75VdFvAYR+z8c6R2J9Q2JK-WpHS4LU_-cWvsOa2g8+Gfk9w@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 19 Aug 2020 19:56:07 +0200
Message-ID: <CAMpxmJVW0yXdVVxYYiNjHw5XsKx+cyb6hV7KTeOQBxgFJWWx4w@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-crystalcove.c: changed every 'unsigned' to
 'unsigned int'
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Abanoub Sameh <abanoubsameh8@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 6:05 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jul 21, 2020 at 5:49 PM Abanoub Sameh <abanoubsameh8@gmail.com> wrote:
> >
> > Changed 'unsigned' to 'unsigned int'.
> > This makes the code more uniform, and compliant with the kernel coding style.
>
> In all patches you wrongly added 'gpio-' and '.c' parts. Also you
> missed the version of the patches (I have told you about) and
> changelog.
>
> No need to resend, I fixed that this time for you. Be careful in the future.
>
> --
> With Best Regards,
> Andy Shevchenko

Hi Andy,

I was going through pending patches and noticed those from Abanoub:
are you also the maintainer for gpio-crystalcove and gpio-msic? The
MAINTAINERS entry for Intel GPIO drivers doesn't include those - do
you want me to send a patch that adds them?

Bartosz
