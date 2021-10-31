Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAA45440D62
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Oct 2021 07:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhJaGo6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Oct 2021 02:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhJaGo6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Oct 2021 02:44:58 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58795C061570
        for <linux-gpio@vger.kernel.org>; Sat, 30 Oct 2021 23:42:27 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id e64so6602891vke.4
        for <linux-gpio@vger.kernel.org>; Sat, 30 Oct 2021 23:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P9DsuqSyJPp2ah6vaAGEYBOyFXAqSYh99S5sr1wE1SI=;
        b=b0Tt6Pl2t9bRhpfaxgE3cak5BqGlno/H86g3vvu+HknlhS0K6RvOXQFE065qdau55w
         Z5oK/XNHPvP7HxiOdN5atT5dekKNCYZxjEfA/onB46fIneqs5fM5QZ/1RckBg3+moXMH
         qNrgTvW927yodlu79zOeBOpB6jve/PKeU9HhBs6PDwwVt5jc35G/gesjLgIrDMVBlNuK
         O5XVnNVekx+0ySBxQcaL1G1u8sPDjPdtAesPU/QPuwrr9L9Pa40YkPVo12PNxOe4dabn
         a8AkKrOZszeVNsEwpRrUzKM+EP+CACMCYK6nbgSkkXXl/dY4vOnVaq+Z1oSi1DHYMr/X
         SVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P9DsuqSyJPp2ah6vaAGEYBOyFXAqSYh99S5sr1wE1SI=;
        b=MbTXRZ6pQll6ue29vug9GmLEYA/ON23IEWzWuVIylaLgv0J42OIBVAoFlAyo2uihZL
         ChoiGSs4XenQygsb8PnDstkDSl92ga3KIA0aWHshw0cs/VNL++4Wryal+oFsSyU5GhC0
         M1lsZMAcRvLWdMzXIcPXIuDJZNZetGTUVr3Zu9EgnoLoG7QwmM+7JnrQg5J2yILWXtBD
         rXuNbpc6XTroGETBqImlzG/gm/BOqeQbgMCbdyZ0GYbUlsTN58UYKINu7u6ZJbd0+8Zs
         SB4iKZYJZjOda/bq4mZ3oeLTQJTH84cXGWQvPR5X3Wz1Df1HUjKCOJBpJRqJk36KP+oA
         vj2A==
X-Gm-Message-State: AOAM533+fBPxYbEgKkkB5roIVTmNrxk14LiEmlA3WjuVVpV/tXrThaoX
        W6qrywSSVTO+wFaJl5BEV+gog0tAI8JztiA/Gl4=
X-Google-Smtp-Source: ABdhPJzKUX27CjuM4Z6WEwihBNwylNCcMXNoJ0gun/cr4g6MyBpjWFmaZzF7EKKgbTogu5y9W/ahOzZicfHQGeDpB4g=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr9387518vkl.4.1635662546439;
 Sat, 30 Oct 2021 23:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211018005915.17601-1-luizluca@gmail.com> <CAMhs-H_=7D9mGweMxRigVxSWR4GCaowExjgM28D7NB7MsPvcew@mail.gmail.com>
In-Reply-To: <CAMhs-H_=7D9mGweMxRigVxSWR4GCaowExjgM28D7NB7MsPvcew@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sun, 31 Oct 2021 07:42:15 +0100
Message-ID: <CAMhs-H9zUmL6BTqjS8Om+oLMZcMAwoNUwdB+dt9AfdRZeFzauw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: include 'ralink_regs.h' in 'pinctrl-mt7620.c'
To:     luizluca@gmail.com
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jiri Kosina <trivial@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 18, 2021 at 6:57 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Luiz,
>
> Thanks for your patch. I thought I had reviewed all of this since the
> kernel test robot complains once for something similar but it seems I
> missed this one :).
>
> On Mon, Oct 18, 2021 at 2:59 AM <luizluca@gmail.com> wrote:
> >
> > From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
> >
> > mt7620.h, included by pinctrl-mt7620.c, mentions MT762X_SOC_MT7628AN
> > declared in ralink_regs.h.
> >
> > Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
> > ---
> >  drivers/pinctrl/ralink/pinctrl-mt7620.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/pinctrl/ralink/pinctrl-mt7620.c b/drivers/pinctrl/ralink/pinctrl-mt7620.c
> > index 425d55a2ee19..6853b5b8b0fe 100644
> > --- a/drivers/pinctrl/ralink/pinctrl-mt7620.c
> > +++ b/drivers/pinctrl/ralink/pinctrl-mt7620.c
> > @@ -1,5 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >
> > +#include <asm/mach-ralink/ralink_regs.h>
> >  #include <asm/mach-ralink/mt7620.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> > --
> > 2.33.0
> >
>
> Can you please add the "Fixes" tag and CC also stable linux? With
> those two added, please send v2.
>
> Fixes: 745ec436de72 ("pinctrl: ralink: move MT7620 SoC pinmux config
> into a new 'pinctrl-mt7620.c' file")
> Cc: stable@vger.kernel.org

I have already sent v2 of this patch including by myself what I was
asking you to do, since no answer at all came from your side.

Thanks,
    Sergio Paracuellos

>
> Thanks,
>     Sergio Paracuellos
