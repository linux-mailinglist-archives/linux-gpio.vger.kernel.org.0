Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A57F57952D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 10:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235328AbiGSIZY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 04:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234607AbiGSIZX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 04:25:23 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B194E647C
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 01:25:21 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id v12so18561788edc.10
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0Bx1R2Q+QF2P7tkGM2MKWEw3+rYL23IE8pFzoPZ9ico=;
        b=6hRcrdCJ2BshcOCbYbe2sRHcqlivkYOUKRE84I+rX41yRyrvRQEK1XIK1HlJYruEkv
         INRDvJcb8qFVqYqWqyjzaSjix4VOwkqzR0rSH8VLpU6uGw5Q7TheEZmmQp+0NFfy7BZU
         /0VAY1N8UHLevRO0WAJotK4G+8idOGuGfcKqSPD4VFSgoDoS1B4PE3AyCQdJO4cPf0S3
         o2CEs/zOR0Mn+671sWr3uuWQb6/jD1NFbJcObX9OTzA+g7riPHkzdwDxnVAlOlw/UDM3
         yYwOF/EZ02Zs9rAJU2lSS68Ak8f3palKQfiglqmB+HAAZ+nGJTmoSMod/6wmhTxKkRLG
         b29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0Bx1R2Q+QF2P7tkGM2MKWEw3+rYL23IE8pFzoPZ9ico=;
        b=RINSq3Oclpb8Rpcu7iHKmqSkhpfpnclOiJ7RYltYrCZFhQ9tgkUvN5QhPJJc3031Ad
         lcWtgu2TsLGFHoGLc+NcPgMzJJ+wUQ06/YJUCnya1wJJEgZaSnw1fThU226Vs47LNN4D
         EwNk4WDpoiT+icXR9FzJ5rSys1g0o5g7oAarDS/X8GECGrMkcEqcdOvRpmacgGwfhvbR
         +oX6S+set5Q2fXqZY9hr34reU1DG3y46EelVfPTea2i4hWbtqslDjRigwAc7SzlvRtjU
         7sGXcRLqHMeh31MApF9HheudyDNf2qDa9ZDYSdDiPliP4UBginu8qj0vD7xSOkzjQg0G
         YNFw==
X-Gm-Message-State: AJIora9wmDtIGuC67IGuVulxdcahCVqPWolcq9yAfq/7GVQKCBemoHyr
        k8Y+M8qxU8xUp6JcElZ56sybvbaTbbfR4Pnj71sCJA==
X-Google-Smtp-Source: AGRyM1vU1xwjz1SfwM44SYQkgwe8ke45JUbb6IETgCphk3Y4YooIsTzECQ56OEJIjeBIYNUTQcXYhmMF5sC/VjWZhHc=
X-Received: by 2002:a05:6402:4c3:b0:43a:f612:179d with SMTP id
 n3-20020a05640204c300b0043af612179dmr42549702edw.422.1658219120252; Tue, 19
 Jul 2022 01:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220713131421.1527179-1-nuno.sa@analog.com>
In-Reply-To: <20220713131421.1527179-1-nuno.sa@analog.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 19 Jul 2022 10:25:09 +0200
Message-ID: <CAMRc=Mf1w7DCGMAku0wPHAhTtDWoWkWOfvxkx=_b1pKp8U8yOg@mail.gmail.com>
Subject: Re: [PATCH 0/4] add support for bias pull-disable
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 13, 2022 at 3:13 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> The gpio core looks at 'FLAG_BIAS_DISABLE' in preparation of calling the
> gpiochip 'set_config()' hook. However, AFAICT, there's no way that this
> flag is set because there's no support for it in firwmare code. Moreover,
> in 'gpiod_configure_flags()', only pull-ups and pull-downs are being
> handled.
>
> On top of this, there are some users that are looking at
> 'PIN_CONFIG_BIAS_DISABLE' in the 'set_config()' hook. So, unless I'm
> missing something, it looks like this was never working for these chips.
>
> Note that the ACPI case is only compiled tested. At first glance, it seem=
s
> the current patch is enough but i'm not really sure...
>
> As a side note, this came to my attention during this patchset [1]
> (and, ofr OF,  was tested with it).
>
> [1]: https://lore.kernel.org/linux-input/20220708093448.42617-5-nuno.sa@a=
nalog.com/
>
> Nuno S=C3=A1 (4):
>   gpiolib: add support for bias pull disable
>   gpiolib: of: support bias pull disable
>   gpiolib: acpi: support bias pull disable
>   dt-bindings: gpio: add pull-disable flag
>
>  drivers/gpio/gpiolib-acpi.c     | 3 +++
>  drivers/gpio/gpiolib-of.c       | 7 +++++++
>  drivers/gpio/gpiolib.c          | 8 ++++++--
>  include/dt-bindings/gpio/gpio.h | 3 +++
>  include/linux/gpio/machine.h    | 1 +
>  include/linux/of_gpio.h         | 1 +
>  6 files changed, 21 insertions(+), 2 deletions(-)
>
> --
> 2.37.0
>

Series applied, thanks!

Bart
