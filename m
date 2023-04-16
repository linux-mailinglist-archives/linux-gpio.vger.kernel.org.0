Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2DB6E3B50
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Apr 2023 20:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjDPSrX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Apr 2023 14:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjDPSrW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Apr 2023 14:47:22 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA8C1701;
        Sun, 16 Apr 2023 11:47:20 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id me15so2994375qvb.4;
        Sun, 16 Apr 2023 11:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681670839; x=1684262839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJvMNdbxF5XOII47Xfjnzs7nVVAPVvhFaQVsW7lIS/c=;
        b=kQcxZY2YLw9qC3hQOSKH1NdFc6WVEQppjyMc4ibee4uBlFoFiUR34W1jhZFDXQ5X+1
         hY6vB7upVxvALgiaqShu9Xug7dERrnwEUIaw45nk+TrYiMNDubZZ8zwCUO2EXGXf8c53
         u5cRuO5xI5W7TTCiwdbh3Eo+B/3zxqejmX7z/UkZsfraeASs2RbyEb12xcZkbvQl1Yql
         TFzQchGXX6NkNTIIq4ecWCOkYg9ucUPUpcvyJvohgPyaqXLsLlXk1em6UIryNf3ZSOaY
         3RoaLHiiQLE5i5frgqyFcbeYd9O1LMQYlHWm6hJZjFHzK7oBfUx+HQLQLU4o7C4YXDm2
         3GLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681670839; x=1684262839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJvMNdbxF5XOII47Xfjnzs7nVVAPVvhFaQVsW7lIS/c=;
        b=dnL8YnXnsg02UlEs1GchyuGCVZbl5QGMjhWfHtg9WBos7os6BHAuobLjVs6Pp3rIu+
         FGiG1DgusGPPkJwQHKbCvLR+TnKXHCP0uPOeDUhFVVjz8bO9VEBoOPIfoZ7FeRB9twv3
         3sm9G0g1+s1usm2hXdnV/1dm9hzCKR8IBeRcx2xDHlGrwDp1LCyqu3biCXzIOtqflWq7
         6nbfQrHiG9ly1hkTIeZzGMIKEFc31GZe4qdyAHAtHjfxIE7whYNNWB0GqqCzeO+ncNOc
         mOgME9Co+QO3vyURi1y7fBFu+KmtWni0Cu264Ny9GteiVWf8wEEwGW6bwdtRhTFMEjrC
         yeNA==
X-Gm-Message-State: AAQBX9ff/HBPfSfnTS8YAwWIRZfDdF5wp/9mAyoa2HjVsiwguURKjDVu
        Hll2T/lwSpVKznjy4p+rp+gUlXm3N9orM03dyRn1FI0mqZY=
X-Google-Smtp-Source: AKy350aSoWqDWWUwxtyHLrbMNipEHi+sv2d9tKp86w6bE9QfGfBdatlNc/+/RRIlFuvJfmKzTAmz9iRv93EdRSKFZ/0=
X-Received: by 2002:ad4:5505:0:b0:5ef:474f:eb84 with SMTP id
 pz5-20020ad45505000000b005ef474feb84mr1463627qvb.10.1681670839367; Sun, 16
 Apr 2023 11:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <3231223.aeNJFYEL58@steina-w> <CAHp75VeR5R_CqWNT=Fpbyp-YSeo+3QXBnR62C=K_tyr-qQ2MVw@mail.gmail.com>
 <4800953.GXAFRqVoOG@steina-w> <CAHp75VeTFDkaYRfX+9hE7LYE4Z-NpNfP=xfsGt27nm_DrTC_cw@mail.gmail.com>
 <a79134a3-be9d-7297-15e1-1de4eb4054d0@linaro.org> <CAHp75VdRjCvcwjVO8GZfrVhFqJmO+WaqmJ63A2vVK4iELx=OXg@mail.gmail.com>
 <ee53f7cf-b94a-ba0f-1e28-5ffa2c0f5e78@linaro.org> <CAHp75Vc31cQLT0TNS7UZddA+M=215qy_xZMpzTeRj0LV7t69tA@mail.gmail.com>
 <ca984bb6-18b9-8e65-edb1-007a0fae4fb7@linaro.org> <CAHp75VfCm-80LuDmTNuOX-DP=xWnVibrpzu_wFAa5Wg0QY+yWQ@mail.gmail.com>
 <a926837c-8773-1809-0bb3-34d449c5d7a5@linaro.org>
In-Reply-To: <a926837c-8773-1809-0bb3-34d449c5d7a5@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 16 Apr 2023 21:46:43 +0300
Message-ID: <CAHp75VcJMwoG07-d86obSLuPNGRQuRo_oW2JJA50ps--3s0kJA@mail.gmail.com>
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

On Sun, Apr 16, 2023 at 2:42=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/04/2023 13:33, Andy Shevchenko wrote:
> > On Sun, Apr 16, 2023 at 2:21=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 16/04/2023 13:14, Andy Shevchenko wrote:
> >>> On Sun, Apr 16, 2023 at 2:04=E2=80=AFPM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>> On 16/04/2023 11:36, Andy Shevchenko wrote:
> >>>>> On Sun, Apr 16, 2023 at 10:42=E2=80=AFAM Krzysztof Kozlowski
> >>>>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>>> On 15/04/2023 17:06, Andy Shevchenko wrote:
> >>>>>>> On Fri, Apr 14, 2023 at 9:37=E2=80=AFAM Alexander Stein
> >>>>>>> <alexander.stein@ew.tq-group.com> wrote:
> >>>>>>>> Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy Shevchen=
ko:
> >>>>>>>>> On Tue, Apr 11, 2023 at 10:19=E2=80=AFAM Alexander Stein
> >>>>>>>>> <alexander.stein@ew.tq-group.com> wrote:
> >>>>>
> >>>>> ...
> >>>>>
> >>>>>>>>> So, taking the above into consideration, why is it GPIO propert=
y to
> >>>>>>>>> begin with? This is PCB property of the certain platform design=
 that
> >>>>>>>>> needs to be driven by a specific driver, correct?
> >>>>>>>>
> >>>>>>>> True this is induced by the PCB, but this property applies to th=
e GPIO,
> >>>>>>>> neither the GPIO controller output, nor the GPIO consumer is awa=
re of.
> >>>>>>>> So it has to be added in between. The original idea to add a pro=
perty for the
> >>>>>>>> consumer driver is also rejected, because this kind of behavior =
is not limited
> >>>>>>>> to this specific driver.
> >>>>>>>> That's why the delay is inserted in between the GPIO output and =
GPIO consumer.
> >>>>>>>>
> >>>>>>>>> At the very least this is pin configuration (but external to th=
e SoC),
> >>>>>>>>> so has to be a _separate_ pin control in my opinion.
> >>>>>>>>
> >>>>>>>> Sorry, I don't get what you mean by _separate_ pin control.
> >>>>>>>
> >>>>>>> As you mentioned above this can be applied theoretically to any p=
in of
> >>>>>>> the SoC, That pin may or may not be a GPIO or a pin that can be
> >>>>>>> switched to the GPIO mode. Hence this entire idea shouldn't be pa=
rt of
> >>>>>>> the existing _in-SoC_ pin control driver if any. This is a purely
> >>>>>>> separate entity, but at the same time it adds a property to a pin=
,
> >>>>>>> hence pin control.
> >>>>>>> At the same time, it's not an SoC related one, it's a PCB. Hence =
_separate_.
> >>>>>>
> >>>>>> I don't think that anything here is related to pin control. Pin co=
ntrol
> >>>>>> is specific function of some device which allows different propert=
ies or
> >>>>>> different functions of a pin.
> >>>>>
> >>>>> Sorry, but from a hardware perspective I have to disagree with you.
> >>>>> It's a property of the _pin_ and not of a GPIO. Any pin might have =
the
> >>>>> same property. That's why it's definitely _not_ a property of GPIO,
> >>>>> but wider than that.
> >>>>
> >>>> I did not say this is a property of GPIO. I said this is nothing to =
do
> >>>> with pin control, configuration and pinctrl as is.
> >>>
> >>> Ah, I see. But still is a property of the pin on the PCB level.
> >>
> >> No, it is property of a circuit, so property of two pins and a wire
> >> between them. Not a property of one pin.
> >
> > Electrically speaking -- yes, software speaking, no, this is the
> > property of the one end (platfrom abstraction in the software) and as
> > you said, consumer which may be SoC, or the device connected to the
> > SoC (depending on the signal direction), or both (like pull-up for
> > I2C).
> >
> >>> That's
> >>> why I said that it should be like a "proxy" driver that has to be a
> >>> consumer of the pins on one side and provide the pins with this
> >>> property on the other.
> >>
> >> Not sure, why do you need it for anything else than GPIOs? What is the
> >> real world use case for proxy driver of non-GPIO lines?
> >
> > I2C is an example where we have something in between, which both of
>
> Are you sure you have RC (not just resistor) in I2C?

I'm talking about an analogue. In principle the pull-up is part of PCB
and not of the SoC.

> > the ends are using and this is the property of PCB, but luckily we
> > don't need anything special in the software for that, right? But from
> > the electrical point of view it's exactly a non-GPIO property. That's
> > why "proxy".
>
> Still I do not see any reason to call it anything else than GPIO. If you
> think that there is any other usage, please bring it as an real,
> non-theoretical example.

The first, which one I found, is time-stretched ADC. The idea is that
the portion of the signal is split to the phases and each phase is
passed via time stretcher for the low-speed ADC to be digitized. So,
if we have an SoC with 4+ ADCs, on the PCB one can add an externally
clocked mux and then 4+ time stretching lines and on the SoC side it
will be ADC (note, not a GPIO!).

--=20
With Best Regards,
Andy Shevchenko
