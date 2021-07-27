Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AED53D7965
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 17:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232634AbhG0PJG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 11:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbhG0PJF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 11:09:05 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F76AC061757;
        Tue, 27 Jul 2021 08:09:04 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id q68so7278179vsb.9;
        Tue, 27 Jul 2021 08:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LODqsW/1ngmYUbMgNby00su93F62N06Tj3ly3YeQuu8=;
        b=uo8EQXgRWZ9JsCmhbvecIDs7UFt6gf45CbCLSX89gZvV05cpmDYxsq4q7djWl6V+zv
         RkgcAww9e48cgedaDiYGy02wM6kOUabDZzKSOrB31bbE+qFVKW5wTMGAYjBn1mf5DpWr
         2oQ21yT7d62nU5z5J6s16lUG3MHh+DNe4tyltIBZ1VdrRNHemFSaB+zLGofVcnPaLM5R
         O96ZpxwwUhKy31BZ8EmmKLYFXdPQb5c/A4b74K3NjhEGlRPs3TCA3AcUyjze3WRIx7FO
         1xItwyCGYoHFcV4xBDB2Kk7/N7dVwwbx65UvTuZtUUwy3hHr7ooX3uHVbjcGJ4VvB4e8
         333Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LODqsW/1ngmYUbMgNby00su93F62N06Tj3ly3YeQuu8=;
        b=fXD508Rjg6xy7S4butY5P5TUg6JxGBwqIXzID1SFQ42YvO8FPQ2zxUcmt71Rw2fdAD
         an1169E7pM2dBR0rU2jSwMp2U2g1xNFm2YiKZheOdC5Rz0XVYq6rlpvRd0eZyclKImnP
         KCwJZDkFFujDKRPuJhlyHj9DFzWLzngIYX2vgKkTAvfq+CcnDV8/Okxk6RQ5QYkBGzEw
         Hyxx1FtYz3Yhh1NF4GoP7dIpfLF0dWTaZjAGsfCEVVYBERRdLeyEMIqz+E+W1yLcgVZQ
         U+AGT8xOL7Th5Rq2YxLJVpksSSRgZ5H3kGg8kEydUvBgNOz4xdt0FVym43wy9f9wFp9g
         fxIQ==
X-Gm-Message-State: AOAM530kVhtSKfYC8AjNZdXdcFQ45GVHbqVGNClH0p4MmAoNLvUX+XOW
        AV4FiI581zZPpnktxdfBNrAEfTjAPi0O92nQ20c=
X-Google-Smtp-Source: ABdhPJxoQ+xAJ8pctlldjhc+igE6bcD64Yold6eElIL6035jZ3l7JenxM765onZHshhoQQPNf/7SwtAONt5EOwCGMKY=
X-Received: by 2002:a67:e94c:: with SMTP id p12mr16820940vso.28.1627398541870;
 Tue, 27 Jul 2021 08:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210727144816.8697-1-sergio.paracuellos@gmail.com>
 <20210727144816.8697-4-sergio.paracuellos@gmail.com> <CAHp75Ve9eYNbs=uBsVvFdkpU1vLXB8Fy4NpFbaWV1g59vfrenw@mail.gmail.com>
In-Reply-To: <CAHp75Ve9eYNbs=uBsVvFdkpU1vLXB8Fy4NpFbaWV1g59vfrenw@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 27 Jul 2021 17:08:50 +0200
Message-ID: <CAMhs-H_Lubu2dLeSX=Q+0FAwnZ-qB6a88r=p0EfWGcE9noMpLg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        NeilBrown <neil@brown.name>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 27, 2021 at 5:07 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jul 27, 2021 at 5:48 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > Gpiolib core code has been updated to support setting
> > friendly names through properly 'gpio-line-names'.
> > Instead of redefine behaviour here to skip the core
> > to be executed, just properly assign the desired offset
> > per bank to get in the core the expected behaviour.
>
> Since it will be a v3, reflow commit messages to occupy a little bit
> more available space (per line). Something ~72-75 characters per line
> is good balance.

Sure.

Thanks,
    Sergio Paracuellos
>
> --
> With Best Regards,
> Andy Shevchenko
