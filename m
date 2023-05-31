Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97AA5717F71
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 14:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbjEaMDc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 08:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbjEaMDb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 08:03:31 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AA4101;
        Wed, 31 May 2023 05:03:29 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6260a07bf3cso27868566d6.0;
        Wed, 31 May 2023 05:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685534608; x=1688126608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtbVG1YWIEUr+aeV2KwQg50uYk9KnsxMDR8QzyGUeK4=;
        b=GAiQ6Z0FIgRniNlnMacMNUvm8GthL156aivMM9tVOccU1M9gUCBuu7Qk08iry7Gtz1
         c0jzb0mqCsMtaMPfXd80xOgUdcTOsWO2/hRAkD+EbtVXorKGzVGEubqDSXKTFLFCvdAM
         4vTBPsUHuBKZSfQtz+9KzF4r0yJqheUEI8p1ur0SD9HXZGL6VBPuOTXG8tQ/t2EWN/+8
         9WforMng4vfkXtQ2SJ2yP+/1c8wGnoW6NGLHx6EpCCsVPZFlOZbN82EqKWFqQ4Q+DCeX
         XHOoyc3QWfrEvZNJq7DI+BZhFctbJQNx+l0iYEi6qGf0yYLRClPtGXc2cZlYYQfJxmgJ
         T8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685534608; x=1688126608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtbVG1YWIEUr+aeV2KwQg50uYk9KnsxMDR8QzyGUeK4=;
        b=Nc0+PM41/lnfwwKdQoCBmntSdpU+R+8i4l69JkXE6zgiNI1Z8ZJHE7sIVxU+XqNeQM
         uQRVMvqZF3FULP2CCr5JMD4Kjqe7VacRamhdMiUmFcJuYNaEZ5E63Qok29Z1sWC/aiKB
         mTVpNoMjLIAAAZ38gPTUhUlJBrzXVW1epZjieSFua12eMcTGphv5tDTZUITUT7Wrotg2
         ET81Z2AtqX0qvN83rjhUxPTsCMKO6sachzSxD3mP7Uj1pUZBlWfkxLNdKlFCD99FX/2o
         z1pogrXRt2BfCH7Ov0zMJBgxvR/rRcWDTnEfyWUYTgx4yUZVTPO+JmkSg63zQmpUsuad
         Hb/A==
X-Gm-Message-State: AC+VfDwXvoXdc1Gjzf97W/uk6TUhHqaAPO7ugt7PgkGz+qptHeZfDxEy
        ZiAX91ifX1aYzqZu8i7biefSr637r7CDK+eIAOY=
X-Google-Smtp-Source: ACHHUZ5JJFZxtwbIo7hGbzXQyHgik+3QWnbi74aiR8IfM55m4Rdn3onpWvzWyHDNw4I7xgMwJqBOEwm8j5UuzJhLdXE=
X-Received: by 2002:a05:6214:c61:b0:625:aa48:fb6c with SMTP id
 t1-20020a0562140c6100b00625aa48fb6cmr4512643qvj.54.1685534608559; Wed, 31 May
 2023 05:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <a926837c-8773-1809-0bb3-34d449c5d7a5@linaro.org> <CAHp75VcJMwoG07-d86obSLuPNGRQuRo_oW2JJA50ps--3s0kJA@mail.gmail.com>
 <4810610.GXAFRqVoOG@steina-w>
In-Reply-To: <4810610.GXAFRqVoOG@steina-w>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 May 2023 15:02:52 +0300
Message-ID: <CAHp75VdXF2WcF_SGMJRGtePUh7WBPLET1HLLE3aHnV7yBT783w@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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

On Wed, May 31, 2023 at 9:53=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> Am Sonntag, 16. April 2023, 20:46:43 CEST schrieb Andy Shevchenko:
> > On Sun, Apr 16, 2023 at 2:42=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > > On 16/04/2023 13:33, Andy Shevchenko wrote:
> > > > On Sun, Apr 16, 2023 at 2:21=E2=80=AFPM Krzysztof Kozlowski
> > > > <krzysztof.kozlowski@linaro.org> wrote:
> > > >> On 16/04/2023 13:14, Andy Shevchenko wrote:
> > > >>> On Sun, Apr 16, 2023 at 2:04=E2=80=AFPM Krzysztof Kozlowski
> > > >>> <krzysztof.kozlowski@linaro.org> wrote:
> > > >>>> On 16/04/2023 11:36, Andy Shevchenko wrote:
> > > >>>>> On Sun, Apr 16, 2023 at 10:42=E2=80=AFAM Krzysztof Kozlowski
> > > >>>>> <krzysztof.kozlowski@linaro.org> wrote:
> > > >>>>>> On 15/04/2023 17:06, Andy Shevchenko wrote:
> > > >>>>>>> On Fri, Apr 14, 2023 at 9:37=E2=80=AFAM Alexander Stein
> > > >>>>>>> <alexander.stein@ew.tq-group.com> wrote:
> > > >>>>>>>> Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy
> Shevchenko:
> > > >>>>>>>>> On Tue, Apr 11, 2023 at 10:19=E2=80=AFAM Alexander Stein
> > > >>>>>>>>> <alexander.stein@ew.tq-group.com> wrote:

...

> > > >>>>>>>>> So, taking the above into consideration, why is it GPIO pro=
perty
> > > >>>>>>>>> to
> > > >>>>>>>>> begin with? This is PCB property of the certain platform de=
sign
> > > >>>>>>>>> that
> > > >>>>>>>>> needs to be driven by a specific driver, correct?
> > > >>>>>>>>
> > > >>>>>>>> True this is induced by the PCB, but this property applies t=
o the
> > > >>>>>>>> GPIO,
> > > >>>>>>>> neither the GPIO controller output, nor the GPIO consumer is
> > > >>>>>>>> aware of.
> > > >>>>>>>> So it has to be added in between. The original idea to add a
> > > >>>>>>>> property for the consumer driver is also rejected, because t=
his
> > > >>>>>>>> kind of behavior is not limited to this specific driver.
> > > >>>>>>>> That's why the delay is inserted in between the GPIO output =
and
> > > >>>>>>>> GPIO consumer.> >>>>>>>>
> > > >>>>>>>>> At the very least this is pin configuration (but external t=
o the
> > > >>>>>>>>> SoC),
> > > >>>>>>>>> so has to be a _separate_ pin control in my opinion.
> > > >>>>>>>>
> > > >>>>>>>> Sorry, I don't get what you mean by _separate_ pin control.
> > > >>>>>>>
> > > >>>>>>> As you mentioned above this can be applied theoretically to a=
ny
> > > >>>>>>> pin of
> > > >>>>>>> the SoC, That pin may or may not be a GPIO or a pin that can =
be
> > > >>>>>>> switched to the GPIO mode. Hence this entire idea shouldn't b=
e
> > > >>>>>>> part of
> > > >>>>>>> the existing _in-SoC_ pin control driver if any. This is a pu=
rely
> > > >>>>>>> separate entity, but at the same time it adds a property to a=
 pin,
> > > >>>>>>> hence pin control.
> > > >>>>>>> At the same time, it's not an SoC related one, it's a PCB. He=
nce
> > > >>>>>>> _separate_.> >>>>>>
> > > >>>>>> I don't think that anything here is related to pin control. Pi=
n
> > > >>>>>> control
> > > >>>>>> is specific function of some device which allows different
> > > >>>>>> properties or
> > > >>>>>> different functions of a pin.
> > > >>>>>
> > > >>>>> Sorry, but from a hardware perspective I have to disagree with =
you.
> > > >>>>> It's a property of the _pin_ and not of a GPIO. Any pin might h=
ave
> > > >>>>> the
> > > >>>>> same property. That's why it's definitely _not_ a property of G=
PIO,
> > > >>>>> but wider than that.
> > > >>>>
> > > >>>> I did not say this is a property of GPIO. I said this is nothing=
 to
> > > >>>> do
> > > >>>> with pin control, configuration and pinctrl as is.
> > > >>>
> > > >>> Ah, I see. But still is a property of the pin on the PCB level.
> > > >>
> > > >> No, it is property of a circuit, so property of two pins and a wir=
e
> > > >> between them. Not a property of one pin.
> > > >
> > > > Electrically speaking -- yes, software speaking, no, this is the
> > > > property of the one end (platfrom abstraction in the software) and =
as
> > > > you said, consumer which may be SoC, or the device connected to the
> > > > SoC (depending on the signal direction), or both (like pull-up for
> > > > I2C).
> > > >
> > > >>> That's
> > > >>> why I said that it should be like a "proxy" driver that has to be=
 a
> > > >>> consumer of the pins on one side and provide the pins with this
> > > >>> property on the other.
> > > >>
> > > >> Not sure, why do you need it for anything else than GPIOs? What is=
 the
> > > >> real world use case for proxy driver of non-GPIO lines?
> > > >
> > > > I2C is an example where we have something in between, which both of
> > >
> > > Are you sure you have RC (not just resistor) in I2C?
> >
> > I'm talking about an analogue. In principle the pull-up is part of PCB
> > and not of the SoC.
> >
> > > > the ends are using and this is the property of PCB, but luckily we
> > > > don't need anything special in the software for that, right? But fr=
om
> > > > the electrical point of view it's exactly a non-GPIO property. That=
's
> > > > why "proxy".
> > >
> > > Still I do not see any reason to call it anything else than GPIO. If =
you
> > > think that there is any other usage, please bring it as an real,
> > > non-theoretical example.
> >
> > The first, which one I found, is time-stretched ADC. The idea is that
> > the portion of the signal is split to the phases and each phase is
> > passed via time stretcher for the low-speed ADC to be digitized. So,
> > if we have an SoC with 4+ ADCs, on the PCB one can add an externally
> > clocked mux and then 4+ time stretching lines and on the SoC side it
> > will be ADC (note, not a GPIO!).
>
> What do I need to do to get progress on this topic? Without this kind of =
delay
> handling the DSI-LVDS bridge on our hardware cannot be used in mainline.

I have looked into the entire thread and found no replies from Linus W and =
Bart.
They are GPIO maintainers and should fuel up this discussion.

--=20
With Best Regards,
Andy Shevchenko
