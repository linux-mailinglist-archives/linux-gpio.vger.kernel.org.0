Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F7145E3BE
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 01:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244377AbhKZAlp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 19:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239344AbhKZAjn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 19:39:43 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF13C0613ED
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 16:33:43 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id o4so15589729oia.10
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 16:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wx6Lre/FTRaYP7Is5riEW5pRWhsJX4cKj5NqRQzThSc=;
        b=NRSbnWOxKZkNVWUQAQwSoDFrn2GECScFvopaEjnHRamjfijmCRYWeYsJ00frHFcjkk
         usiUMEJK595ZJaVYGufyFOWpOvmJ2Otpz8XvKNt3V4uP1QRG0rfTsirYe7kKKCiKHY0l
         Ok98HXXplUNDbyIDCpEd2YBdmNxGBKGtN+5IBjlZ4jJMWgwEcwib32Zz/zcmse59w0WD
         C/3hG+QF5cBSLv06oZvS+4z9PxYhQm54q5VjqVR3rxOzeVloztXiI8Hreqh7OKjPTSiY
         MTA6AvZKCvSUHtuoVe2HeKCcCntSdORm3XjBRHaIOOVHG34jgU1XQYERMG2HK8b08r6M
         TfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wx6Lre/FTRaYP7Is5riEW5pRWhsJX4cKj5NqRQzThSc=;
        b=sTZyKBrogNvta96A3e1UismPf6/2/md0vKeeQkaKhrclYEdu4iKIj0bPYwHlSIpepc
         TjAfamfpky4jG8xqQI54/TMwk9brmAqNH1OelhUjX37ErzLRHPli4CztnN3ffnu1Pdl1
         oEZVV6Kzc+WbRXi3yiB1znQNXXTBVGS0+cLorkNoRk5Yj2l50d4yeFzGDB23bGbBKooG
         LrHAFuG+YC/S2UZmXOs91S3lbpLeWVqIcXmnkcWCHA2nCnge0udxoL96NfSAGeKzbvUH
         pPsgnPx6GzPkUXm+ZAkKMznBTXn9H5N+EhwsoN+gRfCDoerXk2k2c4wP1Xk+lS9HTtCt
         e37A==
X-Gm-Message-State: AOAM533wJUL2oGWi1G3Q3/Rcf0KwXZ6GxYDoTne36aVmUYU+nfQpP9LT
        82xS7V45OosyGSMLlhEWz4mauRBr/GTfpkCqauGJWQ==
X-Google-Smtp-Source: ABdhPJwgB6TLAOnlEmGYCT6cRaq84tftvhq3x9i14xmCeBq8BnVeKoXTirpt/FSbuhEm+BGOR1qfH64xNOMA8+zN0cg=
X-Received: by 2002:a54:4791:: with SMTP id o17mr20157592oic.114.1637886822370;
 Thu, 25 Nov 2021 16:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20211123155144.21708-1-lakshmi.sowjanya.d@intel.com> <20211123155144.21708-3-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20211123155144.21708-3-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Nov 2021 01:33:31 +0100
Message-ID: <CACRpkdanKspORKBa2ETRvQyBkzgCssca-fFE+QcybZY=GYmMAQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: Add Intel Thunder Bay pinctrl driver
To:     lakshmi.sowjanya.d@intel.com
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        tamal.saha@intel.com, pandith.n@intel.com,
        kenchappa.demakkanavar@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lakshmi,

thanks for your patch! Interesting chip! This is looking very good.

I bet Andy will also give you some attention to details unless you
had some already internally at Intel.

On Tue, Nov 23, 2021 at 4:52 PM <lakshmi.sowjanya.d@intel.com> wrote:

This caught my eye:

> +#define THB_BOARD_SPECIFIC_GPIO_REQUIREMENTS_HANDLE    (1u)

We don't do this kind of conditionals, either it is there or not.
Drop this define since it is always 1

> +#if (THB_BOARD_SPECIFIC_GPIO_REQUIREMENTS_HANDLE)
> +
> +static u32 thb_gpio_board_requirements_handle(struct gpio_chip *chip)
> +{
> +       u32 offset, reg;
> +
> +       /* 0x43 = register Offset for gpio_power_int_setup/4u */
> +       offset = 0x43;
> +       reg = thb_gpio_read_reg(chip, offset);
> +
> +       /* Keeping all power interrupts to Level-High triggered as suggested by HW team */
> +       reg |= 0x1E;
> +
> +       return thb_gpio_write_reg(chip, offset, reg);
> +}

This looks like something that can just be inlined into probe(), some HW
set-up?

> +       struct gpio_chip *chip = &tpc->chip;
(..)
> +       chip->get               = thunderbay_gpio_get_value;
> +       chip->set               = thunderbay_gpio_set_value;

It should be trivial to also implement

.set_config = gpiochip_generic_config

just like the other Intel drivers. This is great because it will make
things like the generic bit-banged GPIO I2C bus use the open drain
hardware support from the chip. (Etc)

> +       /* Register pin mapping between GPIO and PinControl */
> +       ret = gpiochip_add_pin_range(chip, dev_name(tpc->dev), 0, 0, chip->ngpio);
> +       if (ret) {
> +               dev_err(tpc->dev, "Failed to add gpiochip pin range\n");
> +               return ret;
> +       }

It's usually better to put these ranges into the device tree. The
gpiolib core will handle it. See gpio-ranges in
Documentation/devicetree/bindings/gpio/gpio.txt

> +#if (THB_BOARD_SPECIFIC_GPIO_REQUIREMENTS_HANDLE)
> +       /* function to handle THB board specific requirements */
> +       ret = thb_gpio_board_requirements_handle(chip);
> +#endif

Just inline that function's code in here.

Yours,
Linus Walleij
