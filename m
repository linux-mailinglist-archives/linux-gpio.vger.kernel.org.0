Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86FD9257AF5
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 15:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgHaN4c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 09:56:32 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35289 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbgHaN41 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 09:56:27 -0400
Received: by mail-ot1-f66.google.com with SMTP id i4so2365522ota.2;
        Mon, 31 Aug 2020 06:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMV/EoVeJQ+WE/pRMaOPgKoQ3X4PP3hTHyFfNRH16Yc=;
        b=MEVcGdiqrBZ1LBRiTS2RhrfcbSrAUDFgYw3XwVxu3rbUCQwePMQSo6ac0RQ/TLA3NJ
         L2ZTUwq3fQbeZh5OQ8R32gVRQUbHR9+nu2jhemupJ6+rqOh00F+8PUxsVeYkk2Lu+6Vb
         qwbK37YnqKLdP2Vm3kDTLhJHV8jePsN04Tc1WgQKxz+ZoAmNrB6RcO8jwrRxvuXh98yb
         pRCQsQlEAGYki7DzD3/4I32WtTja3xpYDixLBckuvoenE2U8wwsKOJVNt4eVXXMqZ4sQ
         1VMYQajj0h7leiWiwI9umydIXvEOyDPgC3NP/S1ni67Jl+bbJgyvrUJchq1vrry8QKuU
         lBXw==
X-Gm-Message-State: AOAM533Oy9zqeOEiIV1Luk2OYCqhATTVk4rT12t3HLm57P0P2V9rurPm
        In4XeDk7D9dVUQpvMxHxZ8GRWnJUlj2yfMGT+Ac=
X-Google-Smtp-Source: ABdhPJzTXguJdldjIZvbu9ab5h26EOrA6qb4WKvoiX9HF/l81ts75sWE0AvKhL0Px4ZYTU0MOeP7YQlHL2FUuMJQesU=
X-Received: by 2002:a9d:162:: with SMTP id 89mr1080208otu.250.1598882186075;
 Mon, 31 Aug 2020 06:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <87r1s5hoht.wl-kuninori.morimoto.gx@renesas.com>
 <87pn7phofb.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdWqc1Peo06g_1JrEvEExyaY+k33WJNmbhugE7YrppiRmw@mail.gmail.com>
 <87blj0zzax.wl-kuninori.morimoto.gx@renesas.com> <CACRpkdZ_ss-GqV0ig2BPpEE+8-F-9qZzpb+-C5h0TpbWCcL6Rg@mail.gmail.com>
 <87imcz7moy.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87imcz7moy.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 31 Aug 2020 15:56:14 +0200
Message-ID: <CAMuHMdV9np6G3+xamFH-cdB0SJ3yXFa2_8D4x-78Rrbqi99tJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: sh-pfc: collect Renesas related CONFIGs
 in one place
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

On Mon, Aug 31, 2020 at 1:14 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > > >
> > > > > Renesas related pinctrl CONFIGs are located many places,
> > > > > and it is confusable.
> > > > > This patch collects these into same place,
> > > > > and group into "Renesas pinctrl drivers" menu.
> > > > >
> > > > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > Still wondering about moving drivers/pinctrl/pinctrl-rz{a1,a2,n1}.c
> > > > into drivers/pinctrl/sh-pfc/, too.
> > >
> > > As I mentioned before, I'm waiting Linus's opinion.
> > > But will move these in v3 without waiting him.
> >
> > Sorry for slowness. I agree with this move, let's collect all the Renesas
> > stuff in one place.
>
> Thanks !
>
> > Renaming it drivers/pinctrl/renesas may be a good idea too, but I'd let
> > Geert decide and execute that, it mainly affects him and his maintenance
> > work, not me.
>
> Geert, my patch moves files, but do nothing to folder names.
> I agree to Linus's opinion, please execute it.

Thanks, I will take care of the rename.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
