Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA0CD6F573E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 May 2023 13:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjECLhN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 May 2023 07:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjECLhK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 May 2023 07:37:10 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F4E59EA
        for <linux-gpio@vger.kernel.org>; Wed,  3 May 2023 04:37:07 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3063433fa66so1745100f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 May 2023 04:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683113826; x=1685705826;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElfKrvCpInhLz/Z11HONGQ5ugEk4h7txKdzMFSSJ7WI=;
        b=3YMjtCt+YEx9MHKvkBysT1EG56mO+Vo+YpW/LTWjsGLyLxMn4K1HSNucKEXLONZNCS
         WlRhlXGKcOJD4M45LldidayZsG5Q8hQjdyXJBulUn46q6719ha8EyNR+cgUlFWYgmCw5
         JI/7dApiX3rNM6wdb+rqnYcNzgvSPb+lZeQ0aIwyA/9Pz5gOLMuCqo2BJMkAziMYt2f8
         dpw0ICkRigcxHcGuG2Dn03W4Des24k+0QnLpLOzy4T/cQhMTErvk5Ze73frvNBXAWxVK
         bbiV3YKwcV63I7Bqd1pW/6ITZojNpCoW02a95gVkOiRmm1tg5N143mfA5laDQ/UAo7sR
         Ak/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683113826; x=1685705826;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ElfKrvCpInhLz/Z11HONGQ5ugEk4h7txKdzMFSSJ7WI=;
        b=bWJ+0UBruaBDSLrqeMEzjotsyYkx9HPePDe6rnGYxJYjnUiyLma/5if0ztshSziqHf
         EzToffl8eGzYVTAS2fVCbIH9tbSM9QrOntP62TLv607xr0aVRjpLThLAQiGC2MeTh9CK
         D1ys+PMjkMwZJ10abF1q1kukabZ3ONjDr4Od5UcI9z6rJFoZMHAvyfb/U0ACmk3xTVeQ
         E5GhzSwAxYw/WzLB6scz8zPT9wSCKUBXpoeBGdA36UcvXKWZaJlrwGy1teMYbGoPsNh5
         xfDtWLJH2E5HpFe6+fSqDliktJZH4SXeXi8LPNZVVAO8ADVT31+MqInZJ5wWOVt2uFQq
         PdgA==
X-Gm-Message-State: AC+VfDwcJ0mcItF/nBYTHGRlcIfZSUgFDwDMjYdV5WpCV1ZVw7UfCNvd
        WGWbkBWrtWZ+iA5bR8HuioLT3dtiOOqgHRe2wblVhA==
X-Google-Smtp-Source: ACHHUZ4DApPSRWp2+mUTN9/wyi4skFbo/r44ueyxB4RUcB9WR+vb3A1heHuO0vLG1ABVxySeBoCIDg==
X-Received: by 2002:adf:fcce:0:b0:306:2d3d:a108 with SMTP id f14-20020adffcce000000b003062d3da108mr6793461wrs.11.1683113826415;
        Wed, 03 May 2023 04:37:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:28d:66d0:a20d:16d3:a674:dfc4])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600012d200b002ceacff44c7sm33708069wrx.83.2023.05.03.04.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 04:37:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 03 May 2023 13:37:04 +0200
Message-Id: <CSCM20VPW7QB.RQD36XO6634I@burritosblues>
Subject: Re: [PATCH v3 2/3] pinctrl: tps6594: add for TPS6594 PMIC
From:   "Esteban Blanc" <eblanc@baylibre.com>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <jpanis@baylibre.com>,
        <jneanne@baylibre.com>, <aseketeli@baylibre.com>, <sterzik@ti.com>,
        <u-kumar1@ti.com>
X-Mailer: aerc 0.14.0
References: <20230414101217.1342891-1-eblanc@baylibre.com>
 <20230414101217.1342891-3-eblanc@baylibre.com>
 <CACRpkdab_26D9BMGeSygy_oa6SFa62ytXcy+Ydi3yPzQO3tU4A@mail.gmail.com>
In-Reply-To: <CACRpkdab_26D9BMGeSygy_oa6SFa62ytXcy+Ydi3yPzQO3tU4A@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Apr 21, 2023 at 10:34 AM CEST, Linus Walleij wrote:
> Hi Esteban,
>
> thanks for your patch!
>
> On Fri, Apr 14, 2023 at 12:12=E2=80=AFPM Esteban Blanc <eblanc@baylibre.c=
om> wrote:
>
> > TI TPS6594 PMIC has 11 GPIOs which can be used for different
> > functions.
> >
> > This add a pinctrl and pinmux drivers in order to use those functions.
> >
> > Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
> (...)
> > +config PINCTRL_TPS6594
> > +       tristate "Pinctrl and GPIO driver for TI TPS6594 PMIC"
> > +       depends on MFD_TPS6594
> > +       default MFD_TPS6594
> > +       select PINMUX
> > +       select GPIOLIB
>
> select GPIO_REGMAP
> ?
>
> I think this driver can use the GPIO_REGMAP helper library.
>
> Please look into other drivers using this, such as
> drivers/gpio/gpio-sl28cpld.c

I had a look at this driver and gpio-regmap.c. I think I understood
what's going on, but I'm not sure how to handle the
gpio_regmap_set_direction case. It is using the same reg_mask_xlate to
determine the register and value to write as gpio_regmap_set or
gpio_regmap_read. The problem is that this PMIC has 1 register per GPIO
for the configuration (GPIOX_CONF registers with a bit for direction),
while the in and out register are used for 8 pins (GPIO_OUT_1,
GPIO_OUT_2 and GPIO_IN_1, GPIO_IN_2). This means that the register and
mask returned by reg_mask_xlate will be erroneous in one or the other
case.

I noticed that I could override reg_mask_xlate, so I should be able to
"just" match on the base address given as argument to perform a
different computation depending on whether we are using reg_mask_xlate in
a "direction change" or not, but somehow this feels a bit wrong.

Is this the correct solution?
Am I missing something?

Thanks again for your time. Best regards,

--=20
Esteban Blanc
BayLibre

