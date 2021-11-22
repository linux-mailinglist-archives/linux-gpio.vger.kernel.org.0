Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CEF45957D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 20:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239051AbhKVT01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 14:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235437AbhKVT01 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 14:26:27 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0F3C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 11:23:20 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id y13so81444185edd.13
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 11:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=br2/0+aMiYK29mXTYI6KgiUCYb9p215pr7NguUMDV8w=;
        b=nLyRj2xXu4wIt2sNbhEaNmAaw4JYrz4A4ri52QaPckwZZMe5EunAgheCrtDsseWHmo
         +BhzqWkLD1g+A+uFiPih2c0nBTDPKTBM/j6zsveXI/9EfbJWNsKyUdetkFva5Rl5H8zU
         J6SO3Svj9z05lEX5/gf8VsvOYgskziYRh9K+eH0/iFdicNjGUTveP8UKXGc19FkZlUf+
         yieQrnq+uqCEKe3Sg8KnPZHrOMMyrDEeRcuUig6CyRGl4uYNISDdYnymHVOWmLD0sQC4
         0hkap7Fs43Mquy6Ay4Tjpkjb6u0bVW2K9JvLEDbq/jJbjazcRJG9vzATGw1IBc9IT4fQ
         Qa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=br2/0+aMiYK29mXTYI6KgiUCYb9p215pr7NguUMDV8w=;
        b=o/X1tiOTlSyW2OYS7DVf+vMTEL/rl/i/1a0Plvumd/T0pRa4ctilsbinUS2kGS551U
         WVOw71vtCjN6QylU7EfbiSnYWTNU7lyYsJwBw1S3upNYaUGBym5I/9/wA9rhfRWpDXPJ
         Abxhu8FuOWaogcej6geBoIT52BWYWZ9EtyVMjWsOnitF3ESv+vSPnBlif6VB2tS0it3c
         nKgpIlRTT01uzJXjMWfr3dCriB7p3/If0YIvPKwljuugjA6Md5PUL8e6sPsx2io8yvzu
         MRep6AzAslacKMnVq+f7+VyJ1IIuNhfKx2XG5ODv1FuOOygjjfUnajyKYgiRvprEQnEO
         s8hg==
X-Gm-Message-State: AOAM531KYlukg//ceJQDoUxENn+ZS2H/SiDk06cxB216eZz0XlHGxl33
        lure1DphgWl6tqkPZ/kCWLdyvtqtfzL5JOnEC27ZnQaJpZY=
X-Google-Smtp-Source: ABdhPJykNdLG+8uiI2uhbtUY2JCXR4HPVcS6AncPBTU2WeBc85OGmr17vP75FAGYXOxoo3hZwhSjLVq4nQhckaPsZQg=
X-Received: by 2002:a05:6402:51c7:: with SMTP id r7mr40974227edd.359.1637608999164;
 Mon, 22 Nov 2021 11:23:19 -0800 (PST)
MIME-Version: 1.0
References: <CANqO7_ZUzfmhj9dt1bDW2YmVtr=fRyCErsuoMS+PqSgGkZsjXA@mail.gmail.com>
In-Reply-To: <CANqO7_ZUzfmhj9dt1bDW2YmVtr=fRyCErsuoMS+PqSgGkZsjXA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Nov 2021 21:22:41 +0200
Message-ID: <CAHp75Ve7YD3Bq2QgU3-WunB5gHA7pXcSfpoGBt1GASn1WA8C4w@mail.gmail.com>
Subject: Re: [libgpiod] Strange error
To:     jnugen@gmail.com, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 22, 2021 at 9:00 PM James Nugen <jnugen@gmail.com> wrote:
>
> Hello,
>
> I'm getting a weird error when trying to access GPIOs from my machine.
> The "gpioinfo" command is returning this error message:
> "gpioinfo: error creating line iterator: Invalid argument"
> This happens as a regular user and as root (via sudo).
> "gpioget" returns a similar error.
> "gpiodetect" works and finds two devices.

What's the output of `gpiodetect`?

> The machine is an Intel NUC running Ubuntu 20.04.
> Here is the "uname" output:
> Linux nuc 5.11.0-38-generic #42~20.04.1-Ubuntu SMP Tue Sep 28 20:41:07
> UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
>
> The installed version of "libgpiod" is v1.4,1.
> I tried the latest version (v1.6.3) and got the same errors.

Is it possible to try the v5.15 kernel on your side?

-- 
With Best Regards,
Andy Shevchenko
