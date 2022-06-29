Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA3F55FF1B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 13:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbiF2Lz5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 07:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbiF2Lz4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 07:55:56 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B573F304
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 04:55:55 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3178acf2a92so145411887b3.6
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 04:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=L4S+XGlQ8O/W1cikvFGBcAbdmj465OeX/GhaJJUYfVI=;
        b=MIA/EQOqTFM4A+JvBhtpDIsDHti6kSuYGUXc+41kkmJ+pxhLUkpgr4cIOW/RMdv9jZ
         7P/mV80pZrj8ofnVHIMhXvZuqFvP5zsI98PK6MGLIzYnz/eW9vHMv0V/Aci5jOns4JDR
         c0KE8GW+WtoNfKRRAU9ujri2C0e57N9kl2L2NM47tn50fmujLNbDxSAlelxHaFHWbpzC
         7xdkaJYr4yaCg7dCb55FJmz/6LArgBXTpcaxbt0ntOfecoYKKholBeCjeRPPlP5h9Myg
         tw1UI8tB1Ibr7sT9mlXGo8VoIzCVPbiTxrECpZZ72iiRk6qANosK1HLGsScTi3PzZ69O
         9Cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=L4S+XGlQ8O/W1cikvFGBcAbdmj465OeX/GhaJJUYfVI=;
        b=JWRZlNT0/VVfs3hqBeDbeIw/wR7g/yVo7nm4elOfjzRDH22tUpKY3t8Pcb7ReJbUml
         Wlwz+xAu6LwyjjtpBdEQjI5Jimr8fr9ZEO5rgfwkuW2HaE8V1lNfU3ar+w35uH1fplfb
         RVpxr9/ocC0ruswGwFfBAdeEs0XUJPLvvlbFr3wU2bkR3CANgTv6MUVCg0k8KWxnj/Lh
         M5+jRRBfM2UqlecBgYchLdjaKOdhyDbAaSYqoUZUknFeuU0c0ZILMzmDljyZ6KHYJOxm
         wmpTzxovx+WfKQomdBn6D7QG4FVlX1wOYy1z6GQ66mHK1IIEHE4nWjgX+GGmOC9m8Utm
         xf5Q==
X-Gm-Message-State: AJIora/36FlputBI7E8U9CwfQQig0vbUAiH17/DfJVP+GgD3uxdeLwY0
        Q4fm4lD2Z4Mf0sZxIpk5Mlclnu6M/y5UlfdQ9O8=
X-Google-Smtp-Source: AGRyM1uSLtl0/CwMR1e5pmab/0Ji91Q2SEu2gjdculBhvYO1kGVwQm9jplerDzCqe9kTp6EjGePboizc9wWw13sAhHY=
X-Received: by 2002:a81:5d88:0:b0:318:31c1:56f3 with SMTP id
 r130-20020a815d88000000b0031831c156f3mr3421506ywb.18.1656503754716; Wed, 29
 Jun 2022 04:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol> <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol> <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol> <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
 <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com>
 <20220629104757.GA29289@sol> <CAHp75Ve5zpwgc9kk06LYJU8GveXFdgbgyyxXoQm0dy_OiLTF2Q@mail.gmail.com>
 <20220629112022.GA30306@sol>
In-Reply-To: <20220629112022.GA30306@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Jun 2022 13:55:12 +0200
Message-ID: <CAHp75VcXTCCMRn+eC3vsdi=VN1iEca40xWCnqkqxgi63UHMDKw@mail.gmail.com>
Subject: Re: [libgpiod] feature request: output state read and sustain
To:     Kent Gibson <warthog618@gmail.com>
Cc:     =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 1:20 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Jun 29, 2022 at 12:58:18PM +0200, Andy Shevchenko wrote:
> > On Wed, Jun 29, 2022 at 12:48 PM Kent Gibson <warthog618@gmail.com> wro=
te:
> > > On Wed, Jun 29, 2022 at 12:27:13PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Jun 29, 2022 at 11:27 AM Ji=C5=99=C3=AD Prchal <jiri.prchal=
@aksignal.cz> wrote:

...

> > > > Do not use shell. Use proper programming language that may give you=
 an
> > > > easier way of handling this, i.e. _context_. Shell tools are
> > > > _context-less_ and here is the problem you are trying to solve, but
> > > > from the wrong end.
> > >
> > > Actually my proposed gpioset for v2 will support running interactivel=
y
> > > so it can maintain context and be driven from shell - for cases where
> > > basic scripting will suffice.
> >
> > Dunno if it's the right direction and if I missed any (additional) disc=
ussion.
> > As far as I remember the idea was to introduce DBus aware daemon that
> > should handle the context of the line and at the same time consider sec=
urity
> > implications. Allowing shell to be context-aware is a hidden mine
> > field. What will happen if the script/user forgets to move the line to
> > the proper state and the chip will drain a lot of current? So, at
> > least PM concerns just popped up immediately to my mind. What else can
> > be problematic? So, I dunno, it's a good idea to allow shell to leave
> > a line in some state when the user actually doesn't care about it
> > anymore. At the bare minimum this mustn't be default behaviour.
>
> I don't think it is what you think it is.
> Take a look.  If you don't like it then get Bart to bin it.
>
> There was no on-list discussion.  I had preliminary disussions with Bart,
> and had intended to float it as an RFC, but got distracted by other
> things and ended up going direct to an implementation.
>
> Last I heard the DBus daemon is still on the cards, but not sure where
> Bart is with it, and the gpioset addition is for simpler cases where
> DBus is overkill or where there is no daemon.
>
> It is not the default behaviour, it is an optional mode.

Good!

> gpioset maintains the context, not shell.

A-ha, that's cool, it pleases me.

> "User's forgetting" is language independent.  Shell scripts matter!

:-)

> What else have I missed replying to? I don't know.
>
> And good to see our apparent agreement in the previous mails was just an
> aberation.  I was starting to think there was something wrong with the
> universe :-|.

Ha-ha.

--=20
With Best Regards,
Andy Shevchenko
