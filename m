Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1F5570528
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 16:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiGKOPb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 10:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiGKOPa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 10:15:30 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67F02DAB0;
        Mon, 11 Jul 2022 07:15:29 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id z23-20020a7bc7d7000000b003a2e00222acso1890056wmk.0;
        Mon, 11 Jul 2022 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=frW5NMx6E736jHy6OxQtX58IMXxNhpe8fKpMWLaqeaQ=;
        b=M3Pjp1jMA3RZOYDusE6sfvvgal/ljkqkDcpzoUAZyz2XlGj4a98gMrq7zfSIWVXkGZ
         knBujiXaJffxluoMIBT2s/36V8/9mgOejsMgsnrU49kSnFBph8bjSFrU9kcFfutUq2j0
         CpUrsdx1O4Je21njGK7dIfOBdUc/5zGgxnB4gDVrDrzKLPJ6a9elAY8JkHsHKeuHze1Y
         sxywECYinW9xKWs+8LuBRtB9vzXV55HHRuUVThiq3Lx2JGHDRqCrBMV5Ml2vHT6J9mfx
         mVy3XMw8XPHJTEa5cixa32iY1+6Ep1b/8YYetPfKNL063z/k1ATtEaS8nDBAVAhNlNn8
         yyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=frW5NMx6E736jHy6OxQtX58IMXxNhpe8fKpMWLaqeaQ=;
        b=cSbFgbGEmEn9XimHM7C11w+xfpmSaBzagUiT8o6hjYU8Ke5kgFa/DYVxUofombOpAH
         whc+pnhawLw5He7MBSlizVk/nJ0JNZ+PAh4YKHvdDTrabVE+YopEeF0Hz1Vc4hnOHDtl
         U+7q9QwcW7s4QCa9JpLM94iLmHTvLMZdWawbztXo1wimjSavD4eGL0y50NOZ8BESyox9
         XosWZzVQLmGbpN4igP0jg/dgcR5LKYFhax7wOlzEDucafMiPK8z4Dwkid9oSzlatyTv8
         yvK7yhJqxZh8XxpmweBvhu/1Pe2uzwquZHx2MnrE5VX4mYbwOXXWYrm2yNM+okA58H42
         q47w==
X-Gm-Message-State: AJIora/NBuN7/QmpCQcSJS15/emAe5SBPQVAUsPFmrlhxwlIpWJXx1kA
        FO6X1GuLTL2BJ8zDGZEMaIo=
X-Google-Smtp-Source: AGRyM1tsO2EPsSzHvGdrkz3Px/FannPm8LaiQTQsukRL6qSEfNc2egW5KyT7qT/TtHq3wH+844eQRA==
X-Received: by 2002:a05:600c:3845:b0:3a2:daf6:89c5 with SMTP id s5-20020a05600c384500b003a2daf689c5mr16280293wmr.120.1657548928331;
        Mon, 11 Jul 2022 07:15:28 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de. [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c0a4900b0039c4ba160absm26565585wmq.2.2022.07.11.07.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 07:15:28 -0700 (PDT)
Message-ID: <a87cffae7ab1bd86c7e1c923bf110b5799671219.camel@gmail.com>
Subject: Re: [PATCH 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
From:   Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To:     "Sa, Nuno" <Nuno.Sa@analog.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 16:16:31 +0200
In-Reply-To: <PH0PR03MB678606B868F668FFBE9DF8FE99829@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220708093448.42617-1-nuno.sa@analog.com>
         <20220708093448.42617-2-nuno.sa@analog.com>
         <CAHp75VcJErVteT0P7=HhHB+c0UWFP8R5rc6u==Zf4p5JS4c=6A@mail.gmail.com>
         <PH0PR03MB678607A61ECA67E28480565499829@PH0PR03MB6786.namprd03.prod.outlook.com>
         <CAHp75VfWABdHczuvBPh02cNarZZwNw-M8LhMmMQuFX6pDNMn+w@mail.gmail.com>
         <PH0PR03MB678606B868F668FFBE9DF8FE99829@PH0PR03MB6786.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2022-07-08 at 15:24 +0000, Sa, Nuno wrote:
>=20
>=20
> > -----Original Message-----
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Friday, July 8, 2022 5:05 PM
> > To: Sa, Nuno <Nuno.Sa@analog.com>
> > Cc: devicetree <devicetree@vger.kernel.org>; open list:GPIO
> > SUBSYSTEM <linux-gpio@vger.kernel.org>; linux-input <linux-
> > input@vger.kernel.org>; Dmitry Torokhov
> > <dmitry.torokhov@gmail.com>; Bartosz Golaszewski
> > <brgl@bgdev.pl>; Hennerich, Michael
> > <Michael.Hennerich@analog.com>; Rob Herring
> > <robh+dt@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Linus Walleij
> > <linus.walleij@linaro.org>
> > Subject: Re: [PATCH 01/10] input: keyboard: adp5588-keys: support
> > gpi
> > key events as 'gpio keys'
> >=20
> > [External]
> >=20
> > On Fri, Jul 8, 2022 at 4:55 PM Sa, Nuno <Nuno.Sa@analog.com> wrote:
> > > > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > Sent: Friday, July 8, 2022 4:18 PM
> > > > On Fri, Jul 8, 2022 at 11:36 AM Nuno S=C3=A1 <nuno.sa@analog.com>
> > wrote:
> >=20
> > ...
> >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kpad->gc.parent =3D &kpad->=
client->dev;
> > > >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kpad->gc.of_node =3D kpad->=
client->dev.of_node;
> > > >=20
> > > > We are going to remove of_node from GPIO. Moreover the parent
> > > > device
> > > > and its node is a duplication, just drop the latter and GPIO
> > > > library
> > > > will take care of it.
> > > >=20
> > >=20
> > > Well the of_node was set so that I had a proper name in the IRQ
> > domain
> > > IIRC. Will this be handled in the GPIO lib in the future?
> >=20
> > In your case it's a dup. So in _your_ case it will be handled in
> > the
> > future. For the rest we already have an fwnode member.
>=20
> ok, I will drop the assignment...
>=20
> > > The parent assignment was also to make things neater in
> > > /sys/kernel/debug/gpio.
> >=20
> > Sure.
> >=20
> > ...
> >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 girq->handler =3D handle_si=
mple_irq;
> > > >=20
> > > > By default it should be handle_bad_irq() and locked in the -
> > > > > irq_set_type().
> > > >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 girq->threaded =3D true;
> > > >=20
> > > > See documentation above.
> > >=20
> > > I see... I will look at Docs. In practice I don't think this
> > > matters much
> > > since this handler should never really be called (I think) as we
> > > just
> > > call handle_nested_irq().
> >=20
> > There are two different comments, one about handler, another about
> > how
> > to properly write IRQ chip data structure and mask()/unmask()
> > callbacks.
> >=20

So I think I have most of stuff understood for v2. About the handler, I
don't think we really need to set 'handle_edge_irq()' in
'irq_set_type()' as this is a nested threaded interrupt and so, the
desc->handle_irq() should never be called (I think, not 100% if there's
any strange case where it might).

That said, if you still think that I should do it (for correctness),
fine by me.

> > ...
> >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* should never happen */
> > > >=20
> > > > Then why it's here?
> > >=20
> > > because I do not trust the HW to always cooperate :). In theory,
> > > we can get some invalid 'gpio' from it.
> > >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON_ONCE(hwirq =3D=3D n=
gpios);
> >=20
> > On some setups this can lead to panic. Why? Is this so critical
> > error?
>=20
> Ahh, you're right. Forgot that in some cases WARN can actually panic.
>=20
> > hardware can't anymore function?
>=20
> If we get in here, the device is probably in a very bad state but
> that
> does not mean that the system is...
>=20
> I will just move to dev_warn(). Thanks for the remainder!
>=20
> > ...
> >=20
> > > > I don't know this code, can you summarize why this additional
> > mapping
> > > > is needed?
> > >=20
> > > You have 18 possible pins to use as GPIOs (and hence be IRQ
> > sources). Now,
> > > if you just want to use pins 16 and 17 that will map int hwirq 0
> > > and 1.
> > But
> > > what we get from the device in 'key_val - GPI_PIN_BASE' is, for
> > example,
> > > 16 and so we need to get the hwirq which will be 0. It's pretty
> > > much
> > the
> > > reverse of what it's being done in the GPIOs callbacks.
> >=20
> > Any reason why irq_valid_mask can't be used for that?
>=20
> I will have to look at irq_valid_mask.
>=20
> > ...
> >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Default is active l=
ow which means key_press is
> > > > > asserted
> > on
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the falling edge.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((irq_type & IRQ_TYPE_ED=
GE_RISING && !key_press)
> > > > > ||
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ir=
q_type & IRQ_TYPE_EDGE_FALLING && key_press))
> > > >=20
> > > > This is dup from ->irq_set_type(). Or how this can be not like
> > > > this?
> > >=20
> > > We get here if we get a key press (falling edge) or a key release
> > (rising
> > > edge). The events are given by the device and it might be that in
> > some
> > > cases we just want to handle/propagate key presses
> > > (not sure if it makes sense). So we need to match it with the
> > > appropriate irq_type requested. Note that this kind of
> > > controlling the
> > IRQ
> > > from SW as there's no way from doing it in the device. That is
> > > why we
> > don't
> > > do more than just making sure the IRQ types are valid in
> > irq_set_type.
> >=20
> > I see, thanks for elaboration.
> >=20
> > ...
> >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 handle_nested_irq(irq);
> > > >=20
> > > > There is new helpers I believe for getting domain and handle an
> > IRQ.
> > > > Grep for the recent (one-two last cycles) changes in the GPIO
> > drivers.
> > > >=20
> > >=20
> > > Hmm, I think I saw it but somehow I though I could not use it
> > (because
> > > of the previous calls to get the irq_type). Hmmm...
> >=20
> > Maybe you can double check?
>=20
> Sure, I think the helper can be used...
>=20

So I did looked and I think you are thinking about
'generic_handle_domain_irq()'. For nested threaded I could not find a
similar one (maybe a new helper to be added).

- Nuno S=C3=A1
