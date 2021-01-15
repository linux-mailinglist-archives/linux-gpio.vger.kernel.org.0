Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8DA2F77F0
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 12:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbhAOLss (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 06:48:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:50564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbhAOLss (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Jan 2021 06:48:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8819623877;
        Fri, 15 Jan 2021 11:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610711287;
        bh=2FXJx+J7jGNXU0EI3dRz6nWEdXFhGtyHzcWOXcQynAM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oI53dkxePWrR3nCNKsLN8B3AsyoEGZksJJNLoNR9Y84WrWa0EWpXvW8B7WNsvo+L2
         XWZ10LIJfsmdeu+rSvwSkR8vKCNmfMIhPUXEE3dTW7i5v6Jb3l/GKaFCHkEswpP8CF
         hjwlGqo9XS0VXzMZ4M9RztMCAL39nBSqBIfTx1vrPcM6hyGeidB0QuCUWIcWpohaZq
         DnIKE8jpNWiq8zTA6DiYTdyvJS3698EqNHFzkntyD3xNb8FwSERLZbtqv5JQoqt3hF
         hXprqczIRGFLasrGZrrNbSzwZOR+PLYgQAPKCc/EnkUZ0WyQQZlY2S4Uqx5yqfogZS
         ByNyHhhV756nw==
Received: by mail-oo1-f44.google.com with SMTP id x203so2117502ooa.9;
        Fri, 15 Jan 2021 03:48:07 -0800 (PST)
X-Gm-Message-State: AOAM5319+RhV9gNNC19Yiytco8Mkufwmy0t1GoNxH8wkgK7QL2mfrAe3
        qWNCVGW0q5hF/Y8mq1EV1uQJiZIQ+Dju986Ao/w=
X-Google-Smtp-Source: ABdhPJyadqil0mlsM91YOrRmmiXTHg0kLTBdvFeiZefouVbslArety1BTB33bURbT3TyZ6zNoYLMY1pLhEnrUgaN8JE=
X-Received: by 2002:a4a:9c01:: with SMTP id y1mr7844928ooj.15.1610711286913;
 Fri, 15 Jan 2021 03:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20201213235447.138271-1-paul@crapouillou.net> <CACRpkdYautJ+aNrK+gqmAUzVCOgQH-WuXqEOn4FyW1hfeWa2zg@mail.gmail.com>
 <NNHRMQ.2ALS3SQBYT352@crapouillou.net>
In-Reply-To: <NNHRMQ.2ALS3SQBYT352@crapouillou.net>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 15 Jan 2021 12:47:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Jiza_0=31hrj439nJSG23W9EytgxQf12KxT_6dWL9WQ@mail.gmail.com>
Message-ID: <CAK8P3a0Jiza_0=31hrj439nJSG23W9EytgxQf12KxT_6dWL9WQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kconfig.h: Add IF_ENABLED() macro
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>, od@zcrc.me,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 9:45 AM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi,
>
> Le lun. 14 d=C3=A9c. 2020 =C3=A0 10:05, Linus Walleij
> <linus.walleij@linaro.org> a =C3=A9crit :
> > On Mon, Dec 14, 2020 at 12:54 AM Paul Cercueil <paul@crapouillou.net>
> > wrote:
> >
> >>  IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is set
> >> to 'y'
> >>  or 'm', NULL otherwise. The (ptr) argument must be a pointer.
> >>
> >>  The IF_ENABLED() macro can be very useful to help GCC drop dead
> >> code.

Looks great! Thanks a lot for getting this sorted.

> > I can apply this with the other patch to the pinctrl subsystem if
> > Arnd or someone else who is good at KConfig provides an ACK.

Yes, please do.

Acked-by: Arnd Bergmann <arnd@arndb.de>
