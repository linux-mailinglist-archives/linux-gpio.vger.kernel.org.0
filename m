Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B48F416EA0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 11:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244756AbhIXJNg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 05:13:36 -0400
Received: from mail-vk1-f178.google.com ([209.85.221.178]:37401 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244738AbhIXJNg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 05:13:36 -0400
Received: by mail-vk1-f178.google.com with SMTP id s125so3683129vkd.4;
        Fri, 24 Sep 2021 02:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/uMOyM/kn6W1y3lwAj9XHqWDpckzKii2lWoZciM2c/4=;
        b=6wOcYultGjTbwWnV0L/y4PRVpXPy4RVVxsJqkcLgy+3kyUMCtnDntBUSGAUrtaxCvw
         QqmHLGzy0UTnDy+RWzc3tX4/LjDfIutOkQFXRhA5fOidwxeViydskGiGEJD6ggKI5D07
         qUIKdMUmnEbAxBoeZc6s+Is1Fgu7KZkdHyX3gyFjTwSs2lzaSeSeNYWBKz4oQRQUBAb1
         PjIuAGmjBVaG5gMKxssHMlX2QferRzam9rJvv5dadS8Fj6AMCXjWgmzMv1RAunA8T8x3
         C3sIzReBBXXPmaxjlaO1qiSWHcFSAbZ4mfEshrisBlAEz79AvG7PENn528Me1wYYK9cR
         zGAg==
X-Gm-Message-State: AOAM532ACMa6LKJZet71H98ZzwCc12Hc/oN3OiEfE6UAUwX6/7/f+vRu
        nU/RKGcn5BvyqNynJtAaA9PevieuaKsM04QHaZY=
X-Google-Smtp-Source: ABdhPJxLKsjnITpMAZEr7jHX7Dwk73lJ2fn1vA5V16IlLlnoERQRRnpzs6HLlunEpc3sBoZ4JerCRV5W7Q0g014rFiE=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr6819125vkj.11.1632474723162;
 Fri, 24 Sep 2021 02:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210922074140.22178-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXpELNRXbLTidmSdAqio27WLm8JK=sk0Vhz=wMdN3UX8A@mail.gmail.com> <OS0PR01MB592275447C1FA46DB418B6B686A49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592275447C1FA46DB418B6B686A49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 11:11:52 +0200
Message-ID: <CAMuHMdWzTV7Q+_BeS-b23Xc9CpW7_tXgGvHhUvaV7FQiKb6heQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix missing port register 21h
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Fri, Sep 24, 2021 at 11:03 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 24 September 2021 09:46
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>; Linux-Renesas <linux-
> > renesas-soc@vger.kernel.org>; open list:GPIO SUBSYSTEM <linux-
> > gpio@vger.kernel.org>; Chris Paterson <Chris.Paterson2@renesas.com>; Biju
> > Das <biju.das@bp.renesas.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix missing port register
> > 21h
> >
> > On Wed, Sep 22, 2021 at 9:54 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Remove the duplicate port register 22h and replace it with missing
> > > port register 21h.
> >
> > Thanks for your patch!
> >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> i.e. will queue
> > as a fix in renesas-pinctrl-for-v5.15, as this will become a dependency
> > when enabling SDHI/SD0, right?
>
> OK thanks. port register P21 corresponds to p17_0, p17_1 and p17_2.

Oh, this bug only affects P17_[012], not P18_[01] (which is used for I2C
on the SOM, not SD0, my mistake)?
As P17_[012] are not connected on the SOM, I'll postpone this to v5.16,
unless someone sees a good reason for not doing so.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
