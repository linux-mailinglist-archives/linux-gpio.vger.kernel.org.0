Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC311704EB1
	for <lists+linux-gpio@lfdr.de>; Tue, 16 May 2023 15:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233498AbjEPNGP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 May 2023 09:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232617AbjEPNFt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 May 2023 09:05:49 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535E24EED
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 06:05:31 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-966287b0f72so2191637866b.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 06:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684242330; x=1686834330;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SILiKT7DyQHGvk192s9Ly9vz52SszDMfSKnLZJbbwME=;
        b=OKYCj8ao+l6YoC9a2Ext9WHsseMCn+eb0yyEwQDdY9SGFc5Mhii8DPzaZCLqVETaDO
         v1cN7V0nRZNiLkcrlsredYoUwJVT+e2Nm1vGi44Q3EWupAabrLVRenHK49vPp46040S9
         jCaXwpqxkZhHQ9UvHHGZyCri3+CvZ4Z06R0Gqloqwdspd+1xJtJwvoIM7AeiW2RO+cp2
         R7OgLX3KjxMPV9iQUpvFvxVKM6DXGdQN28MIZT3NMevbE+egXhdLFj9kDwdvy/wtx3q5
         spxIFh0ptWBmNrq712d6mE3EW45ysxzcNiuwuGKMF2h1z5bFj4VVqLlklJsjKKZrfPyZ
         8UnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684242330; x=1686834330;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SILiKT7DyQHGvk192s9Ly9vz52SszDMfSKnLZJbbwME=;
        b=UyfSaCC5Rdgzhn+zRqi8ZuccwnxgVz9YbdynJiVNN4WUucZtPo3bHV+mb7YJb6MnFH
         wefV6jnHtYduCTJk72EdCWAw2JYa55YR99S32pDPIFaV48p2ASOg4u3val/nF5Eg1ulg
         EkJi4DY8DpkaPHDTvPN6uE3ibAh4SxxBGi7Vi4x/j+Ap7RqaGGFah38lfrjSbMVveL/q
         Yc8pJwSYWPf7osipfslne/Z6H/q/fHtWUKvOT2mmmZ+XCTJLVbp+HwrhlTgB+L4DVRO7
         NfnT0D9kn6TMsbY7Ca9LYXMs9j/rDqFM4QleE0Gu3eIueLX4nWl8eYQS+dErEE0sjqJD
         kw2Q==
X-Gm-Message-State: AC+VfDxzek/8pi8U3DL72u0KeYtE7OKawMJHpNLTuWUCUTRZJ2qqUy3I
        tVnRTfvnRFSuM8BIAFe/VKmPNg==
X-Google-Smtp-Source: ACHHUZ4p++q6A01FN2qI1ELY6dUfQfr9w1Rob5iLw7tQwgDjNyLDPtKFnIwj+OPpVhqkO16PluVA6A==
X-Received: by 2002:a17:907:7d8e:b0:96a:63bf:89d with SMTP id oz14-20020a1709077d8e00b0096a63bf089dmr16895629ejc.47.1684242329274;
        Tue, 16 May 2023 06:05:29 -0700 (PDT)
Received: from localhost (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id hy27-20020a1709068a7b00b0094f1fe1696bsm10848372ejc.216.2023.05.16.06.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 06:05:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 16 May 2023 15:05:27 +0200
Message-Id: <CSNQ2RRG7XDC.164H6P357UHSR@burritosblues>
Cc:     <linus.walleij@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <jpanis@baylibre.com>, <jneanne@baylibre.com>,
        <aseketeli@baylibre.com>, <sterzik@ti.com>, <u-kumar1@ti.com>
Subject: Re: [PATCH v4 2/3] pinctrl: tps6594: Add driver for TPS6594 pinctrl
 and GPIOs
From:   "Esteban Blanc" <eblanc@baylibre.com>
To:     <andy.shevchenko@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230512141755.1712358-1-eblanc@baylibre.com>
 <20230512141755.1712358-3-eblanc@baylibre.com>
 <ZF5yb4DbVDbfxVU4@surfacebook>
In-Reply-To: <ZF5yb4DbVDbfxVU4@surfacebook>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri May 12, 2023 at 7:07 PM CEST,  wrote:
> Fri, May 12, 2023 at 04:17:54PM +0200, Esteban Blanc kirjoitti:
> > TI TPS6594 PMIC has 11 GPIOs which can be used
> > for different functions.
> >=20
> > This patch adds a pinctrl and GPIO drivers in
> > order to use those functions.
>
> ...
>
> > +config PINCTRL_THUNDERBAY
>
> Is it correct name? To me sounds not. The problem is that you use platfor=
m name
> for the non-platform-wide pin control, i.e. for PMIC exclusively.
> Did I miss anything?
>
> > +	tristate "Generic pinctrl and GPIO driver for Intel Thunder Bay SoC"
> > +	depends on ARCH_THUNDERBAY || (ARM64 && COMPILE_TEST)
>
> This doesn't look correct, but I remember some Kconfig options that are u=
sing
> this way of dependency.
>
> > +	depends on HAS_IOMEM
> > +	select PINMUX
> > +	select PINCONF
> > +	select GENERIC_PINCONF
> > +	select GENERIC_PINCTRL_GROUPS
> > +	select GENERIC_PINMUX_FUNCTIONS
> > +	select GPIOLIB
> > +	select GPIOLIB_IRQCHIP
> > +	select GPIO_GENERIC
> > +	help
> > +	  This selects pin control driver for the Intel Thunder Bay SoC.
> > +	  It provides pin config functions such as pull-up, pull-down,
> > +	  interrupt, drive strength, sec lock, Schmitt trigger, slew
> > +	  rate control and direction control. This module will be
> > +	  called as pinctrl-thunderbay.
>
> Ah, the above simply a mistake. right?
> Why is it in this patch?

I respond to all comments about PINCTRL_THUNDERBAY.
It is indeed a mistake on my side. I failed my rebase on 6.4-rc1...
I will fix it for the next version.
Sorry about this...

> > +config PINCTRL_TPS6594
> > +	tristate "Pinctrl and GPIO driver for TI TPS6594 PMIC"
> > +	depends on MFD_TPS6594
> > +	default MFD_TPS6594
> > +	select PINMUX
> > +	select GPIOLIB
> > +	select REGMAP
> > +	select GPIO_REGMAP
> > +	help
> > +	  This driver supports GPIOs and pinmuxing for the TPS6594
> > +	  PMICs chip family.
>
> Module name?

I'm not sure to understand what you are looking for. Something like this
?:

To compile this driver as a module, choose M here: the
module will be called pinctrl-tps6594.

> > +obj-$(CONFIG_PINCTRL_THUNDERBAY) +=3D pinctrl-thunderbay.o
>
> Huh?!

Same as for Kconfig file, it's a mistake.

> > +#include <linux/gpio/regmap.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pinctrl/pinmux.h>
>
> Ordered?
>

It's not, I fix this.

> > +static int tps6594_group_pins(struct pinctrl_dev *pctldev,
> > +			      unsigned int selector, const unsigned int **pins,
> > +			      unsigned int *num_pins)
> > +{
> > +	struct tps6594_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctldev);
> > +
> > +	*pins =3D (unsigned int *)&pinctrl->pins[selector];
>
> Why casting?

It's an error, thanks.

> > +	pinctrl->pctl_dev =3D
> > +		devm_pinctrl_register(&pdev->dev, pctrl_desc, pinctrl);
>
> One line?

I use clang-format quite extensively so I would rather keep it like
that to still be able to just run it over the whole file without having
to fix this line every time.
If you feel like I should not respect the 80 columns recommendation, I
will fix it.

> > +	if (IS_ERR(pinctrl->pctl_dev)) {
> > +		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
> > +		return PTR_ERR(pinctrl->pctl_dev);
>
> 	return dev_err_probe(...);

Did not know this one, I will use it. Thanks.

> > -#define TPS6594_REG_GPIOX_CONF(gpio_inst)		(0x31 + (gpio_inst))
> > +#define TPS6594_REG_GPIO1_CONF				0x31
> > +#define TPS6594_REG_GPIOX_CONF(gpio_inst)	(TPS6594_REG_GPIO1_CONF + (g=
pio_inst))
>
> Why? The original code with parameter 0 will issue the same.

I felt that replacing 0x31 with a constant would make the computation
in TPS6594_REG_GPIOX_CONFIG more understandable. What do you think?


Thanks for your time. Sorry again about this "thunderbay" confusion...
Note for the future, don't send patches on Fridays :)

Best regards,

--=20
Esteban Blanc
BayLibre
