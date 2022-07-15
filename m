Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636C3576712
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jul 2022 21:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbiGOTEH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jul 2022 15:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbiGOTEG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jul 2022 15:04:06 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D52B01;
        Fri, 15 Jul 2022 12:04:02 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-31c9b70c382so55749937b3.6;
        Fri, 15 Jul 2022 12:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GvNoylKdUFrFiai+l4kyUHpO6WjmryHFiNYK1D6xN6A=;
        b=JcLJbZ3bNqnfCoqGA+VQZ68OshK7IqcM4z9kh664iA3UNoDmVOejj2QYbmS9bHMX0d
         jyuN+fA3JBT2iOVPvcB0PswHzrq5Dpk2WhD53peRTqLidDCahw/nYQFQnaVbAaAX3gPo
         5c2xR6rJwyT74sgHTLWhJKEibrE4uhKpSKd32UVOB6I8qKiSibSLMoD10rd9dQOYM9pA
         yZkkwomaguKuSoWL+I6XKhFUOIXZG7VAiv80oXnjHdHEW1jCxsDE7ZD1MejZqZ2jHERZ
         tcTH8sCImbu4Fznw++oA/6hFUFe/7TLdsjmT4qP29E6LtPvCEEYRbeU++2ld//zuVScp
         hDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GvNoylKdUFrFiai+l4kyUHpO6WjmryHFiNYK1D6xN6A=;
        b=Rte3in0lb3JE+vw+c1F7J4KTVHWaEb7lvQGvbdfDirWlby4HpPMMdRLHboS5iC6QxX
         hK4BO7guegWmGq2w3+gldYGlPkAAFCEvqEtZYmSoi6QGA5NH/dVhdzLtHiXDmmJgC1Vn
         v/DI5W9XSXxRGGDzy+sACLxt3YOyL23YsUC+nIJ8UpItvy0fIsT4ZYrNRBjNzTM9+VWU
         yYmNtJvct9flhM+U3FioGTYzQBEwukmG9k89NdrR00C1Mb5AAiQNYDrHOklTEW5r6B0k
         53sMxmNd+Wp7w6IsTJ/oBSbAPAasofdG+X9xPtlbVm5c5Oraz1aY4bI19Ql50dEyCo5W
         eDBw==
X-Gm-Message-State: AJIora+yM+Tgmb8qfe12tagdj+hnOQsjwIZyDTTwtVpuMO1N411ADkam
        a3egS6erYaFiOF0xFPOpbeItFcWoCBxGxZItD4A=
X-Google-Smtp-Source: AGRyM1u4JjC5NUYyUjGT2sgcCJnp/jYPFLkDzsR3mAo1UbOSpuRLrdEs/lA1+F4+cyDgmjMbaow6pDNthqyeWODDNpk=
X-Received: by 2002:a81:8397:0:b0:31c:8a02:3f6d with SMTP id
 t145-20020a818397000000b0031c8a023f6dmr17875107ywf.486.1657911841461; Fri, 15
 Jul 2022 12:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220715125138.378632-1-nuno.sa@analog.com>
In-Reply-To: <20220715125138.378632-1-nuno.sa@analog.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 15 Jul 2022 21:03:25 +0200
Message-ID: <CAHp75VcYAErGywT=29ovPinAubVJCjVoWa6g-5N+OdowaGAmvw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] adp5588-keys refactor and fw properties support
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Fri, Jul 15, 2022 at 2:50 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> The main goal of this patchset is to remove platform data and replace it =
by
> firmware properties. Original discussion in [1].
>
> While in here, some refactor was done to the driver. The most noticeable =
one
> is to replace the GPIs events handling by irqchip support so that this gp=
i
> keys can be "consumed" by the gpio-keys driver (also as suggested in [1])=
.
> With this, the gpio-adp5588 can be removed. This change comes first so th=
at
> we can already remove some platform data variables making it easier to
> completly replace it by firmware properties further down in the series.
>
> As there's no users of the platform data, I just replace it in a single
> patch as there's no point in having support for both (even though it migh=
t
> be harder to review the patch as-is).
>
> Special note to the gpio-adp5588 driver removal. I'm aware of some change=
s
> to the driver in [2]. These changes are in the gpio tree and this patchse=
t
> is naturally based on the input tree which means that patch 2 will
> not apply. So, I'm not really sure how to handle this. I guess in this
> case the conflict is easy to handle :) but just let me know on how to
> proceed in here if there's anything for me to do.

You may add my tag to non-commented patches (excluding DT binding one)
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> v2 changes:
>
> [1/10]
>  * Turn hwirq signed so we can compare < 0;
>  * Replace WARN_ON with dev_warn();
>  * Do not set of_node on gpiochip;
>  * Moved to use a const irqchip within the gpiochip;
>  * Set default handler to 'handle_bad_irq()' and change it
> in irq_set_type;
>
> [4/10]
>  * Dropped "-keys" from compatible and added vendor prefix;
>  * Fix -Wformat complains;
>  * Don't use abbrev in comments (fw -> Firmware).
>
> [5/10]
>  * Be consistent on $refs;
>  * Drop "-keys" from compatible.
>
> [7/10]
>  * Include bits.h;
>  * Use GENMASK();
>  * Use BIT() in KP_SEL();
>  * Reflect code changes in the commit message.
>
> [9/10]
>  * One line for regulator_disable action.
>
> [1]: https://lore.kernel.org/linux-input/20220504084617.36844-1-u.kleine-=
koenig@pengutronix.de/
> [2]: https://lore.kernel.org/linux-gpio/20220628193906.36350-3-andriy.she=
vchenko@linux.intel.com/
>
> Nuno S=C3=A1 (10):
>   input: keyboard: adp5588-keys: support gpi key events as 'gpio keys'
>   gpio: gpio-adp5588: drop the driver
>   input: keyboard: adp5588-keys: bail out on returned error
>   input: keyboard: adp5588-keys: add support for fw properties
>   dt-bindings: input: adp5588-keys: add bindings
>   input: keyboard: adp5588-keys: do not check for irq presence
>   input: keyboard: adp5588-keys: fix coding style warnings
>   input: keyboard: adp5588-keys: add optional reset gpio
>   input: keyboard: adp5588-keys: add regulator support
>   input: keyboard: adp5588-keys: Use new PM macros
>
>  .../bindings/input/adi,adp5588-keys.yaml      | 110 +++
>  MAINTAINERS                                   |   2 +-
>  drivers/gpio/Kconfig                          |  14 -
>  drivers/gpio/Makefile                         |   1 -
>  drivers/gpio/gpio-adp5588.c                   | 452 -----------
>  drivers/input/keyboard/Kconfig                |   3 +
>  drivers/input/keyboard/adp5588-keys.c         | 719 ++++++++++++------
>  include/linux/platform_data/adp5588.h         | 171 -----
>  8 files changed, 588 insertions(+), 884 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/adi,adp5588-k=
eys.yaml
>  delete mode 100644 drivers/gpio/gpio-adp5588.c
>  delete mode 100644 include/linux/platform_data/adp5588.h
>
> --
> 2.37.1
>


--=20
With Best Regards,
Andy Shevchenko
