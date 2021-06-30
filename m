Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E5E3B7D85
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 08:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbhF3GlC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 02:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbhF3GlA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jun 2021 02:41:00 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897D9C061766;
        Tue, 29 Jun 2021 23:38:31 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id x37so597104uac.13;
        Tue, 29 Jun 2021 23:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s2FjwLxovXBV9j2+en42ozr40O/MKm4dTTxEw/Bf9Q0=;
        b=NKRJwc3qnwV8NIgwx+hi/D946yO6PRGMnL611nOz8th3n45Qxv5tgbb2FZ/sYMki6d
         /Dpc9Dm/1Qj0L3NKLKQqRa1r87vZffiQy3ABOWPnZURvUr9nOtHIQpV16qIXxDRRfpwh
         1xtW6Bqn0OIZMfm5wz7dl+zg4JXOxHokdOqEqQbahHMg4uhxu8alGUVneHw6USRFFevE
         0uHrkW8nBPpZJhWitCO6cgY670kU7BiIXYniyv91GUfDxtLHzMgwI2tbNWyO5JIB8vcz
         cJIw9IfVfNLtXI4PXQ29hyBSqNpkI9ZrCTE+1QSbylUgFoWfO877aqkZGvKr38Zs1nvz
         h3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s2FjwLxovXBV9j2+en42ozr40O/MKm4dTTxEw/Bf9Q0=;
        b=idIgBWWNnalNvMJ51CHrUbvALvKSxhiLqzcO8J2S0k5WcupuprarfsYCdxm/0gmhZh
         7+7uGzUuY5VrTM1DM3851HbJ/GFTj+iXjeoakj89VsFn+EunSLRuYgI5wrHRNixdYKZ3
         G3bxHuNMG418MQ+K02cAKhgtjMH43ZwnqHOlmeWkFHb+ge2FGX8M5F5hhFCgCMsk+4uT
         cQNVV1onvh3QBgDT7+wLZCBTWLBaXdvt/OmQVmJAr8tOCPKOzf0onCW5vYiwb/1R5tME
         7QjlZvwdwlJVmV1aMR4dmojfvhuMvuX00wcMTJ6v7eiXeEzi47tE8+i3bmu301Imo3YX
         xiww==
X-Gm-Message-State: AOAM532bSfnnAkyuTXQ37hk/+/ufJa83ynzwoXcNyOZnRPi+i/ZLFYjc
        t5QYgZL0UpJHQ/DjosMZQ0WepSrlgz0p0rnVFVg=
X-Google-Smtp-Source: ABdhPJxJ5n2FIByplo2fbqSuTw0k3n9ealqhoFzmX//g82nZe2r8ZP3+7FVZYTdUXjA1YQejA6halQ6ecwY1hiRTGtk=
X-Received: by 2002:a9f:35e9:: with SMTP id u38mr30206243uad.131.1625035110794;
 Tue, 29 Jun 2021 23:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210629143407.14703-1-sergio.paracuellos@gmail.com> <CACRpkdZJjuCMrxka5R2YLgcjwjjXCBEgDP5_+M7nxo5ZX6W4+A@mail.gmail.com>
In-Reply-To: <CACRpkdZJjuCMrxka5R2YLgcjwjjXCBEgDP5_+M7nxo5ZX6W4+A@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Wed, 30 Jun 2021 08:38:19 +0200
Message-ID: <CAMhs-H8up-47e9T4uGxTfwiM1V=_ofok3-ZRbawFZKBVMnYk4A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: rt305x: add missing include
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 30, 2021 at 2:40 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jun 29, 2021 at 4:34 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
>
> > Header 'rt305x.h' is ralink architecture dependent file where
> > other general definitions which are in 'ralink_regs.h' are
> > being used. This 'rt305x.h' is only being included in two
> > different files: 'rt305x.c' and 'pinctrl-rt305x.c'. When
> > file 'pinctrl-rt305x.c' is being compiled definitions in
> > 'ralink_regs.h' are need to build it properly. Hence, add
> > missing include 'ralink_regs.h' in 'pinctrl-rt305x.c'
> > source to avoid compilation problems.
> >
> > Fixes: 3a1b0ca5a83b ("pinctrl: ralink: move RT305X SoC pinmux config into a new 'pinctrl-rt305x.c' file")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> Patch applied!

Thanks!

Best regards,
    Sergio Paracuellos

>
> Yours,
> Linus Walleij
