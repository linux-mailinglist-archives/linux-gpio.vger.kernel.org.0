Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 167F06E37C1
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Apr 2023 13:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjDPLea (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Apr 2023 07:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjDPLe3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Apr 2023 07:34:29 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEC72D56;
        Sun, 16 Apr 2023 04:34:28 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id bq10so64754qkb.0;
        Sun, 16 Apr 2023 04:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681644867; x=1684236867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlYy3eXYWsShD3NMmHngdRJUg5eOV87owj4SyMuQt6c=;
        b=Jeh9UVJrDLWGUf/2BC7gm8pXW42W4fbNFUrRZ85Dfim3tXSxe/Gx9OuLH6/tV+LtJz
         KsjJsoIXWXeOZo3Qdbk39Zo5+8dI6ZO3AokUDHdcg4KHJFntGVREMHWmmGWaYqUvj866
         6Xb4QBv49eQNrWXIB91QHrieje/9wBL81cEIoPMl+owY7M/FZfgWgPRuR19GW2dKhp+l
         wJe3IY4XWT2oTxAmuekIwZsnVuIbvFc2gI3zeq+5iMI8u5pEE4FFFFXQCmGLrzLjMO4E
         NeCmNi7cKVVMkUj3667DeQJ6U1yIA+qRbFLIBPNEDq0+bUcUIEJqMVMqIH3p7W4ArWzA
         M+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681644867; x=1684236867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlYy3eXYWsShD3NMmHngdRJUg5eOV87owj4SyMuQt6c=;
        b=eZq2qdXYYXINi25jWxMdiiKxInGaOC3WHdadf9yr2zVY7KO81XUZCxCsKZGRPomRNS
         qc0AcS+TWzZdOn1br5eTpukYjQqEe++P9UHKPdt6S+nusS/fCT3IG6hPp3JwbVCwLacU
         pjr8G+BHgIzKVNbZ0h356OTM6n+KIyycLS3bbO5Bm7U9I/tURjR1v1M9YG9+2jA49mJD
         xpvGDsP6qdYgyB63th0MTvnFRJz/e5A3DEctF8IqLws93c/KyM6wthmyDXzXRnDMRrhq
         CbvEpRuLeHQOKbJuE8TeKPWv2r0N7gPjVvIVf9aOZooXwnOMz6K3UkacWy5Q3NcVSm4Y
         a6ww==
X-Gm-Message-State: AAQBX9cIUbwQFaKcISixcxTr3dJnxt/ZWHSs6mvuhAtH/YsQpToMbNZQ
        HcA9J8DNYvlXupZmOyI7NazHadGMJ2aul0ksxrZ44KzcbVU=
X-Google-Smtp-Source: AKy350bh6HyrJkZZPnF2GcWvYOumA4o5gaWRk+WmTlNWmBR0DMC2+1yyoITCSX1TctK5Wdf8Yo7VJxPQDxcNBSAqFLM=
X-Received: by 2002:a05:620a:1134:b0:74a:dc9d:95f8 with SMTP id
 p20-20020a05620a113400b0074adc9d95f8mr1703831qkk.14.1681644867272; Sun, 16
 Apr 2023 04:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <3231223.aeNJFYEL58@steina-w> <CAHp75VeR5R_CqWNT=Fpbyp-YSeo+3QXBnR62C=K_tyr-qQ2MVw@mail.gmail.com>
 <4800953.GXAFRqVoOG@steina-w> <CAHp75VeTFDkaYRfX+9hE7LYE4Z-NpNfP=xfsGt27nm_DrTC_cw@mail.gmail.com>
 <a79134a3-be9d-7297-15e1-1de4eb4054d0@linaro.org> <CAHp75VdRjCvcwjVO8GZfrVhFqJmO+WaqmJ63A2vVK4iELx=OXg@mail.gmail.com>
 <ee53f7cf-b94a-ba0f-1e28-5ffa2c0f5e78@linaro.org> <CAHp75Vc31cQLT0TNS7UZddA+M=215qy_xZMpzTeRj0LV7t69tA@mail.gmail.com>
 <ca984bb6-18b9-8e65-edb1-007a0fae4fb7@linaro.org>
In-Reply-To: <ca984bb6-18b9-8e65-edb1-007a0fae4fb7@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 16 Apr 2023 14:33:51 +0300
Message-ID: <CAHp75VfCm-80LuDmTNuOX-DP=xWnVibrpzu_wFAa5Wg0QY+yWQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

On Sun, Apr 16, 2023 at 2:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 16/04/2023 13:14, Andy Shevchenko wrote:
> > On Sun, Apr 16, 2023 at 2:04=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 16/04/2023 11:36, Andy Shevchenko wrote:
> >>> On Sun, Apr 16, 2023 at 10:42=E2=80=AFAM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>> On 15/04/2023 17:06, Andy Shevchenko wrote:
> >>>>> On Fri, Apr 14, 2023 at 9:37=E2=80=AFAM Alexander Stein
> >>>>> <alexander.stein@ew.tq-group.com> wrote:
> >>>>>> Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy Shevchenko=
:
> >>>>>>> On Tue, Apr 11, 2023 at 10:19=E2=80=AFAM Alexander Stein
> >>>>>>> <alexander.stein@ew.tq-group.com> wrote:
> >>>
> >>> ...
> >>>
> >>>>>>> So, taking the above into consideration, why is it GPIO property =
to
> >>>>>>> begin with? This is PCB property of the certain platform design t=
hat
> >>>>>>> needs to be driven by a specific driver, correct?
> >>>>>>
> >>>>>> True this is induced by the PCB, but this property applies to the =
GPIO,
> >>>>>> neither the GPIO controller output, nor the GPIO consumer is aware=
 of.
> >>>>>> So it has to be added in between. The original idea to add a prope=
rty for the
> >>>>>> consumer driver is also rejected, because this kind of behavior is=
 not limited
> >>>>>> to this specific driver.
> >>>>>> That's why the delay is inserted in between the GPIO output and GP=
IO consumer.
> >>>>>>
> >>>>>>> At the very least this is pin configuration (but external to the =
SoC),
> >>>>>>> so has to be a _separate_ pin control in my opinion.
> >>>>>>
> >>>>>> Sorry, I don't get what you mean by _separate_ pin control.
> >>>>>
> >>>>> As you mentioned above this can be applied theoretically to any pin=
 of
> >>>>> the SoC, That pin may or may not be a GPIO or a pin that can be
> >>>>> switched to the GPIO mode. Hence this entire idea shouldn't be part=
 of
> >>>>> the existing _in-SoC_ pin control driver if any. This is a purely
> >>>>> separate entity, but at the same time it adds a property to a pin,
> >>>>> hence pin control.
> >>>>> At the same time, it's not an SoC related one, it's a PCB. Hence _s=
eparate_.
> >>>>
> >>>> I don't think that anything here is related to pin control. Pin cont=
rol
> >>>> is specific function of some device which allows different propertie=
s or
> >>>> different functions of a pin.
> >>>
> >>> Sorry, but from a hardware perspective I have to disagree with you.
> >>> It's a property of the _pin_ and not of a GPIO. Any pin might have th=
e
> >>> same property. That's why it's definitely _not_ a property of GPIO,
> >>> but wider than that.
> >>
> >> I did not say this is a property of GPIO. I said this is nothing to do
> >> with pin control, configuration and pinctrl as is.
> >
> > Ah, I see. But still is a property of the pin on the PCB level.
>
> No, it is property of a circuit, so property of two pins and a wire
> between them. Not a property of one pin.

Electrically speaking -- yes, software speaking, no, this is the
property of the one end (platfrom abstraction in the software) and as
you said, consumer which may be SoC, or the device connected to the
SoC (depending on the signal direction), or both (like pull-up for
I2C).

> > That's
> > why I said that it should be like a "proxy" driver that has to be a
> > consumer of the pins on one side and provide the pins with this
> > property on the other.
>
> Not sure, why do you need it for anything else than GPIOs? What is the
> real world use case for proxy driver of non-GPIO lines?

I2C is an example where we have something in between, which both of
the ends are using and this is the property of PCB, but luckily we
don't need anything special in the software for that, right? But from
the electrical point of view it's exactly a non-GPIO property. That's
why "proxy".

> >> Otherwise bindings would be in directory matching the real hardware...
> >> but they are not. So you can of course call it as you wish, but from
> >> hardware perspective this is not pin control. This is RC circuit, not
> >> pin related thingy.
> >
> > Yep, I put it as a pin configuration which is part of pin control in
> > the Linux kernel right now. But I agree with your above explanation
> > and it seems that we lack a, let's say, "pin modification" framework
> > that stacks additional (PCB level or why not even some special in-SoC
> > ones) properties and adds them to the given pins.
>
> It's nothing to do with modification of properties of some pin. It's a
> separate circuit which has an effect on how two connected pins behave.
> If you look from an effect point of view, only one side is more
> interested in the effect - consumer. But still this sits in the middle.

Yes, see above. And we are programming only one side of this scenario.
For us it's a property of one side of the equation.

--=20
With Best Regards,
Andy Shevchenko
