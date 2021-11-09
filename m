Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FDD44AD6F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 13:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241169AbhKIMXw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 07:23:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:45692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230463AbhKIMXv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 07:23:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2355260524;
        Tue,  9 Nov 2021 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636460466;
        bh=dozVN3aXN7KzW/dp21NF6YI8jGJeBazvwDtTr2omBIY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nfDEQhckfaxD53crGajiQtff4xCwpZzAGEs/yzif2M0ep8JqlNF10uIYSgZasHbQ8
         GgO3NqVpRVE73RABBBrFXncgsWairiiOV7h62nnV42ReoBEDhgvLxpMfMd/uSH/nZh
         0wiJbJ79vouveEuESn1wfSgsv9FnrthLF93Hk1NPd9etWxi1bHWXgoduJjQYvlWHsJ
         HE91+fWO67fCcW1xSHs8KwfmSLnH1Y6v62Y8okF/1Ie6Ats8TynqfycZ+ckSpQ4A9q
         5WqUSYmqKEtlyImPjsNB92XOaADqHVvHH4GnRpofjREjsjPGOnGuUou9k5Ggb8i6t5
         wrASUUPx/4BhQ==
Received: by mail-wr1-f48.google.com with SMTP id i5so32691173wrb.2;
        Tue, 09 Nov 2021 04:21:06 -0800 (PST)
X-Gm-Message-State: AOAM530b2se7Wu71FsgNYR79QfzJY6ytdefsGLbX3cTteCIQC03JYX3E
        Y09tAyRjunjYc1f60UJdNFvvoMxkMotdaNgla+U=
X-Google-Smtp-Source: ABdhPJzZui+hgh9BnKtwF34B9Efj54GbCHBg7w4r8zquI5Y/PkFCYyTJ48uRwwFKD0z5vxSlU9IYQUvcMgi7nLU9XQM=
X-Received: by 2002:a05:6000:10cb:: with SMTP id b11mr8887374wrx.71.1636460464585;
 Tue, 09 Nov 2021 04:21:04 -0800 (PST)
MIME-Version: 1.0
References: <20211105130338.241100-1-arnd@kernel.org> <20211105130338.241100-2-arnd@kernel.org>
 <CACRpkdZ=z2YZ0rtD3=xqEQOMbwph-BEb-3xP_LajCzykmpYgSg@mail.gmail.com>
In-Reply-To: <CACRpkdZ=z2YZ0rtD3=xqEQOMbwph-BEb-3xP_LajCzykmpYgSg@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 9 Nov 2021 13:20:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1OhwZx0k0gnnwvdL=0cTUX9YneHdyuRWL98vZv0gErcA@mail.gmail.com>
Message-ID: <CAK8P3a1OhwZx0k0gnnwvdL=0cTUX9YneHdyuRWL98vZv0gErcA@mail.gmail.com>
Subject: Re: [RFC 2/3] gpiolib: remove empty asm/gpio.h files
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 12:51 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Nov 5, 2021 at 2:04 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The arm and sh versions of this file are identical to the generic
> > versions and can just be removed.
> >
> > The drivers that actually use the sh3 specific version also include
> > cpu/gpio.h directly. This leaves coldfire as the only gpio driver
> > that needs something custom for gpiolib.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Excellent!
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I suggest Bartosz can queue this in the GPIO tree.

I just sent v2 with slightly updated changelog texts and additional patches
but without your Reviewed-by:. I suppose I'll have a v3 after the merge window,
let's use that.

      Arnd
