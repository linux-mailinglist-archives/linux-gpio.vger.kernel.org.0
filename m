Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6A76B25B6
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 14:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjCINpS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 08:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjCINpR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 08:45:17 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEE35D886;
        Thu,  9 Mar 2023 05:45:14 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id j10so721419qkg.12;
        Thu, 09 Mar 2023 05:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678369514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v11AOaHZQDwnfId1Bv9Rlr1H8zAtZDF1jf4cQlQVK+M=;
        b=GDY5mW7fR6SlXtCrbYDEQXB8QKFG5ulINJUCK6p7V52BW+1RyhAUEusMf9paRMqs5l
         V7lAWiRYEL0No0H+LZkBt3X7P6EOqXotXyamZgQu/SLm70DoYUPUEmk2ivgBzbVxzXBp
         aS8iRoB4JVoChFcPsYBIRJpIHLYJC4dknhU823I3dbYxUDurmY7c4SxDctcdmPc3YojB
         fE3R5AsQTGkEkeUrjWUXUpEzaFrZZdwupCVku7akgdPunSGadom3tZunjv6o4s4pGSRg
         JWar4H5SFfdsWrp9/CV4cJFcLyZUIysYX1DpsvLEN1MnUsyIjp4egwKLAzHSCeZjqtYw
         J2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678369514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v11AOaHZQDwnfId1Bv9Rlr1H8zAtZDF1jf4cQlQVK+M=;
        b=SpUdoJskGMzwq7TDE5IuXSYivBC5BS3dZfXf1hcXHezf1Z2M7njrXrFa8xL7E+9P7m
         gnYbOYQxBfK+dsvdDP7UCHdYi1ZRGOYafu5Y06+aBoOWhhTHRwBTD4JARxP9KGecPnyn
         SQ5dYNbEb8Nldsyruwq9DeDn6ymYCaMsbdOel8QZaIlzflHZsriDyf2T9lL94FUjdpoF
         DkHfzyU2qhJDbbb2/0a3Yx4NTCNxrVYkyW9v1EdnVYFgNFJGkBVcwU+cz/g2T2aZy3oJ
         rXxIO/DO5AqfYP/cqnIx92+w9qo7yfRUc3DwGHqJnIwycO9ekNw2y5CrBPy+YwUTknNC
         qS+w==
X-Gm-Message-State: AO0yUKWox149Z1tKO50CUSbBo4yANPA6iZs1GICHZjGOysU0gtpp2HBn
        hotdOhv0+czhr9LsHQZ/6C0Xkm9OyMx9fa69wu4=
X-Google-Smtp-Source: AK7set/q5pakb/9veoICw5AwgtLAzfH86Aa5MAVTD034ltvJv769wcy9Qb1QxATSEKJaiLlMKzODAWYNvVLZ2IsAiF4=
X-Received: by 2002:a05:620a:110c:b0:73b:a8e0:7a87 with SMTP id
 o12-20020a05620a110c00b0073ba8e07a87mr6252789qkk.14.1678369513920; Thu, 09
 Mar 2023 05:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com> <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com> <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Mar 2023 15:44:38 +0200
Message-ID: <CAHp75VfDL74cEUQkxC1JuUB7SS1vYTPj_K7+VkQ-i-MKXad5Lw@mail.gmail.com>
Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2023 at 3:26=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> > Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
> > On Tue, Mar 7, 2023 at 10:13=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > > Subject: Re: [PATCH v6 01/13] pinctrl: core: Add
> > > > pinctrl_get_device() Mon, Mar 06, 2023 at 09:00:02AM +0000, Biju Da=
s
> > kirjoitti:

...

> > > > > Add pinctrl_get_device() to find a device handle associated with =
a
> > > > > pincontrol group(i.e. by matching function name and group name fo=
r
> > > > > a device). This device handle can then be used for finding match
> > > > > for the pin output disable device that protects device against
> > > > > short circuits on the pins.
> > > >
> > > > Not sure I understand the use case. Please, create a better commit
> > message.
> > >
> > > OK, Basically pinmux_enable_setting allows exclusive access of pin to=
 a
> > device.
> > > It won't allow multiple devices to claim a pin.

This is a confusion you brought. You got us completely lost. Please,
try again from the clean sheet.

> > Which is correct. No? Show me the schematics of the real use case for t=
hat.
> >
> > The owner of the pin is the host side. I can't imagine how the same pin=
 is
> > shared inside the SoC. Is it broken hardware design?
>
> We are discussing usage of
>
> echo "fname gname" and you asked a question whether multiple devices can
> claim a pin at the same time
>
> and my answer is no.

> as setting->data.mux will be unique for a pin and will be claimed by
> device during commit state.
>
> Am I missing anything here??

Yes. The same fname/gname can be in many *pin control* (provider) devices.

So, it does not uniquely define the pin control device.

...

> > > > Also it is missing the explanation why there will be no collisions
> > > > when looking by the same pair of function and group name from diffe=
rent
> > device.
> > >
> > > setting->data.mux will be unique for a pin. So there won't be a
> > > setting->collision when
> > > looking by the same pair of function and group name from different de=
vice.
> > >
> > > > (Always imagine that you have 2+ same IP blocks on the platform
> > > > before doing any pin control core work. This will help you to desig=
n
> > > > it properly. )
> >
> > Not sure how the pair function_name group_name makes the device unique.
>
> Do you agree Device handle + function_name +  group_name make it unique.

Yes.

> For pin outdisable we are making use of this 3 combination.
> See the details.
>
>
> This patch series adds support for controlling output disable function us=
ing
> sysfs in a generic way as described below.
>
> |    A     |    |     B      |    |     C     |    |     D        |  | E =
|
> |user space|--->|pinctrl core|<-->|SoC pinctrl|<-->|Output disable|--|PWM=
|
> |          |    |            |    |           |    |              |  |   =
|
>
> A executes command to configure a pin group for pin output disable operat=
ion
>   echo "fname gname conf conf_val" > configure
>
> B parses the command and identifies the binding device associated with th=
at
>   pin group
>
> C matches the binding device against the device registered by D for
>   configuration operation
>
> D matches the pin group and configure the pins for Output disable operati=
on
>
> Both D and E are linked together by dt(i.e. PWM channel linked with Outpu=
t
>  disable Port)

Sounds like an overengineered hack to achieve something that I can't
read between the lines. Why is this so complicated interface and flow
are needed to begin with?


--=20
With Best Regards,
Andy Shevchenko
