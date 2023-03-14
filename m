Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7076B9D08
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 18:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjCNRax (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 13:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjCNRat (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 13:30:49 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BAB9B2F3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 10:30:44 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id j2so15073286wrh.9
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678815043;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jA81WFPNy0EPSrNo17igrl0CGZjDcJvedSMpZSsU+6E=;
        b=zsgo4bmYuM5zBKJbeDnLMyJYui7WTJq+Ao3H5aI86gdk9ZZX5pQVX4JKVsUtcqaBGT
         g9RgUHRbN8Km9VTjus+dqrUxdNTvFuF2Warrfq86P2ra3luIoUUm24WsgLkfAkit2Yta
         DwpdYxGD9li4/tuvZ/lGV0cyd0UWKfKXNIN/81RjB0I9z0h6hxJbTmbjmMenEucI8trw
         KFjFYtt3hcpOsNg2VUzEfZJnurs7Y33OcE1ewlHh5Co2/6HHBz7MOhR2FKpqNUEncaPQ
         oAiH0myhwXqyPAmZj1THytxBOh8Y7BW9oLXrOleErLFwb/7aVArWy8FTtP566yrp8YFe
         Ntpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678815043;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jA81WFPNy0EPSrNo17igrl0CGZjDcJvedSMpZSsU+6E=;
        b=hseNzJB57RJ7lVddR5QskTet8jy+jfQwCUI9SoL/T5buMT5oHsaqWzYDBq94/L/M6i
         JF1I8Ap8KBuZwzyXhwrc2M4EfDxLk43dScg1vGdI9Y044oK3B/SSHeAVmW9WEa4ykV0x
         K+GNbm24LUplwUFvOD6pZs1TTPIvzBjfeEyLysaL5qHLt5V7AKWvwZys8AlFsdqFp0OQ
         fkRe8n7/FC75OKOOqILMe1SctWqYf78NLEpGAenIevCSy0PpE/OzML5cVtYE0eFFf9Ft
         Z4geQ/sr2PcNU4NQgES+UdjN3xzXuH39mmejDtkGlA06/cVuNmJJhW5IOz9os766deYF
         5tyw==
X-Gm-Message-State: AO0yUKVbrV5QbFRKalLUVnpUxhkFR5fNgcTzKpcQcMpuMq1BE+z753d5
        bkSGwpchmRyR5vvZ2MtR2d/kdA==
X-Google-Smtp-Source: AK7set/T/8WEyVxTYMU9mTmjG8IrLeEeDinPS2KNKEzSkgnXTy6In34QdyaalWS2HiJrvbKl3i4NAg==
X-Received: by 2002:a5d:4521:0:b0:2cd:de25:1c76 with SMTP id j1-20020a5d4521000000b002cdde251c76mr11116164wra.17.1678815042700;
        Tue, 14 Mar 2023 10:30:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:28d:66d0:6662:e593:9847:a659])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c0b5500b003dc4a47605fsm3355042wmr.8.2023.03.14.10.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 10:30:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 14 Mar 2023 18:30:40 +0100
Message-Id: <CR6A9IIIMSIY.G13N1XGBQG2M@burritosblues>
Subject: Re: [PATCH INTERNAL v1 2/3] pinctrl: tps6594: add for TPS6594 PMIC
From:   "Esteban Blanc" <eblanc@baylibre.com>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <jpanis@baylibre.com>,
        <jneanne@baylibre.com>
X-Mailer: aerc 0.14.0
References: <20230224133129.887203-1-eblanc@baylibre.com>
 <20230224133129.887203-3-eblanc@baylibre.com>
 <CACRpkdYck+=3sUKQbg2j=KMfv_FEiofFxHpDsXgFo=p2uMYfEQ@mail.gmail.com>
In-Reply-To: <CACRpkdYck+=3sUKQbg2j=KMfv_FEiofFxHpDsXgFo=p2uMYfEQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon Mar 6, 2023 at 3:10 PM CET, Linus Walleij wrote:
> On Fri, Feb 24, 2023 at 2:31 PM Esteban Blanc <eblanc@baylibre.com> wrote=
:

> > TI TPS6594 PMIC has 11 GPIOs which can be used for different
> > functions
> >
> > This add a pinctrl and pinmux drivers in order to use those functions
> >
> > Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
>
> > +config PINCTRL_TPS6594
> > +       tristate "Pinctrl and GPIO driver for TI TPS6594 PMIC"
> > +       depends on MFD_TPS6594
>
> I would add:
>
> default MFD_TPS6594
>
> so you always get this as module or built in along with the MFD.
> Otherwise Kconfig gets complicated and tedious for users.

I did not know this, thanks. I will add this to V2.

(...)

> > +#define DEBUG
>
> Don't put this in production code.
>
> Look in drivers/pinctrl/Kconfig.
>
> config DEBUG_PINCTRL
>         bool "Debug PINCTRL calls"
>         depends on DEBUG_KERNEL
>         help
>           Say Y here to add some extra checks and diagnostics to PINCTRL =
calls.
>
> Look in drivers/pinctrl/Makefile:
>
> subdir-ccflags-$(CONFIG_DEBUG_PINCTRL)  +=3D -DDEBUG
>
> Nifty eh? :D

Nifty indeed :D. #define DEBUG will be removed for V2, I should have
noticed it for V1...

> > +static const struct tps6594_pinctrl_function pinctrl_functions[] =3D {
> (...)
> > +       { "scl_i2c2-cs_spi", TPS6594_PINCTRL_SCL_I2C2_CS_SPI_FUNCTION,
> > +         (const char *[]){ "GPIO0", "GPIO1" }, 2 },
>
> Ow this is starting to look hairy.
>
> Is there some better way to get here?

I tried with a macro but I was not able to pass an array directly to
avoid both the cast and the hard coded length. I saw on other drivers
that I could generate the table dynamically but I'm not a huge fan of that
and I feel like it would look even more clunky...

>
> Other than this the code looks very nice.
>
> Yours,
> Linus Walleij

