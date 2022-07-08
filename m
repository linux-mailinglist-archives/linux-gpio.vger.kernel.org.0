Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B29E56BC12
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 17:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237849AbiGHPFe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238635AbiGHPFd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:05:33 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C616A60685;
        Fri,  8 Jul 2022 08:05:32 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id i14so18532327yba.1;
        Fri, 08 Jul 2022 08:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sHdZMjuoRE4kSneP3GTBfSm74jcfA4zhYWrY7dFeEL0=;
        b=KRuQR1PHZJyT1MQ2g7tB7PmlDnksqI6U9gu/KYhScY/QcZ2oPsOCfb7x1WqnnB28IJ
         VyToEPEihNRpLToGyv+ytouy4V/xlkTBVU3ryj94N1N/TNVyUDPK65xxzoKq/oaF+gXY
         KD+aaZOCLRNKLU3qqTSghfXA56i+bArkxYu+sF9YuGYaNeEdT9Ni6HYissiXXt1rn1Zy
         a0BeE5WAX+ki+cBmY9/3wb8CyMDStbV18t648f61huyfBz+P7kEjiiWLGGBBsKFGh8Ko
         vrgwbaphD9zbtF6VON8E6nwd7iJHpyehwM/dtU9W4vZF6Bwzc5nmLvxS+QEWgHKy5EUL
         puNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sHdZMjuoRE4kSneP3GTBfSm74jcfA4zhYWrY7dFeEL0=;
        b=SbTcv0Cfe/AJnBsfL12qWOo6BR0a8feP4NLy7RX2f42c3U36HKcGIoPJhohnrvPtna
         QBR9+2ie07ku6Zb/G2nvN3o/gErTx1PlEjhK4xAkR3IoW4IQ1kktNuCeVGzmnntPj/KN
         E0kqNEKA4rSP3u4NwMjlrfnccaiIb4FxwDL9wUfeglP502X4nSJ7vyxp4lGEdnE69dv7
         6sho5Hw6cy+FNV/6nRhoCYewnvAPlp8k9mHgmLNgAzBfSU8CE+epZnmjU1s8rdG343gt
         mmBcs95Yv5Otx2RcGvBGaSdhWt0uPmHa8yHHiuHD3YNzzkSnHmyTjVqQZOmj26dboLkY
         QpzQ==
X-Gm-Message-State: AJIora91ZBX1bIj9VJijhR4QUNJgaNqngXbU2zr7DP7ezJ45o17XCYA4
        mfLdM35N4vecWxbOZe4Rr19KDAP2FIDJyh5pEnesN4UNUAM=
X-Google-Smtp-Source: AGRyM1sN3qtVaO1kjd8l4J309EilmfjmepAmt482sj/2d6+F6LQRbldnf7Wc9QAXgyZo2TiebyodLtAqmYHq/PXlfJc=
X-Received: by 2002:a25:cbcf:0:b0:66e:8893:a02c with SMTP id
 b198-20020a25cbcf000000b0066e8893a02cmr4124791ybg.460.1657292731685; Fri, 08
 Jul 2022 08:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-1-nuno.sa@analog.com> <20220708093448.42617-2-nuno.sa@analog.com>
 <CAHp75VcJErVteT0P7=HhHB+c0UWFP8R5rc6u==Zf4p5JS4c=6A@mail.gmail.com> <PH0PR03MB678607A61ECA67E28480565499829@PH0PR03MB6786.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB678607A61ECA67E28480565499829@PH0PR03MB6786.namprd03.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jul 2022 17:04:53 +0200
Message-ID: <CAHp75VfWABdHczuvBPh02cNarZZwNw-M8LhMmMQuFX6pDNMn+w@mail.gmail.com>
Subject: Re: [PATCH 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
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

On Fri, Jul 8, 2022 at 4:55 PM Sa, Nuno <Nuno.Sa@analog.com> wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Friday, July 8, 2022 4:18 PM
> > On Fri, Jul 8, 2022 at 11:36 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote=
:

...

> > > +       kpad->gc.parent =3D &kpad->client->dev;
> >
> > > +       kpad->gc.of_node =3D kpad->client->dev.of_node;
> >
> > We are going to remove of_node from GPIO. Moreover the parent
> > device
> > and its node is a duplication, just drop the latter and GPIO library
> > will take care of it.
> >
>
> Well the of_node was set so that I had a proper name in the IRQ domain
> IIRC. Will this be handled in the GPIO lib in the future?

In your case it's a dup. So in _your_ case it will be handled in the
future. For the rest we already have an fwnode member.

> The parent assignment was also to make things neater in
> /sys/kernel/debug/gpio.

Sure.

...

> > > +       girq->handler =3D handle_simple_irq;
> >
> > By default it should be handle_bad_irq() and locked in the -
> > >irq_set_type().
> >
> > > +       girq->threaded =3D true;
> >
> > See documentation above.
>
> I see... I will look at Docs. In practice I don't think this matters much
> since this handler should never really be called (I think) as we just
> call handle_nested_irq().

There are two different comments, one about handler, another about how
to properly write IRQ chip data structure and mask()/unmask()
callbacks.

...

> > > +       /* should never happen */
> >
> > Then why it's here?
>
> because I do not trust the HW to always cooperate :). In theory,
> we can get some invalid 'gpio' from it.
>
> > > +       WARN_ON_ONCE(hwirq =3D=3D ngpios);

On some setups this can lead to panic. Why? Is this so critical error?
hardware can't anymore function?

...

> > I don't know this code, can you summarize why this additional mapping
> > is needed?
>
> You have 18 possible pins to use as GPIOs (and hence be IRQ sources). Now=
,
> if you just want to use pins 16 and 17 that will map int hwirq 0 and 1. B=
ut
> what we get from the device in 'key_val - GPI_PIN_BASE' is, for example,
> 16 and so we need to get the hwirq which will be 0. It's pretty much the
> reverse of what it's being done in the GPIOs callbacks.

Any reason why irq_valid_mask can't be used for that?

...

> > > +       /*
> > > +        * Default is active low which means key_press is asserted on
> > > +        * the falling edge.
> > > +        */
> > > +       if ((irq_type & IRQ_TYPE_EDGE_RISING && !key_press) ||
> > > +           (irq_type & IRQ_TYPE_EDGE_FALLING && key_press))
> >
> > This is dup from ->irq_set_type(). Or how this can be not like this?
>
> We get here if we get a key press (falling edge) or a key release (rising
> edge). The events are given by the device and it might be that in some
> cases we just want to handle/propagate key presses
> (not sure if it makes sense). So we need to match it with the
> appropriate irq_type requested. Note that this kind of controlling the IR=
Q
> from SW as there's no way from doing it in the device. That is why we don=
't
> do more than just making sure the IRQ types are valid in irq_set_type.

I see, thanks for elaboration.

...

> > > +               handle_nested_irq(irq);
> >
> > There is new helpers I believe for getting domain and handle an IRQ.
> > Grep for the recent (one-two last cycles) changes in the GPIO drivers.
> >
>
> Hmm, I think I saw it but somehow I though I could not use it (because
> of the previous calls to get the irq_type). Hmmm...

Maybe you can double check?

--=20
With Best Regards,
Andy Shevchenko
