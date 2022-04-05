Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C69314F41E4
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Apr 2022 23:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238743AbiDEOex (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Apr 2022 10:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377189AbiDENMq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2022 09:12:46 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177E1121504
        for <linux-gpio@vger.kernel.org>; Tue,  5 Apr 2022 05:13:02 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id w18so8389505edi.13
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2022 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MPvaywVSzLQsDypuAZWtv58R2kwucV8I6O2XfMn8CQ0=;
        b=K14qIg6mMRkLPr4OiAE9Cpu4U+tbA3P91G4RHNesqQyi39uh/EQnwZQg47N4I1HFGa
         VaAqAu3jWh3kOpu/vkFSBsrj1wlQcT4uTVYmxgreiwzNn3G4cU5MD051hiN68+YGuGmY
         cWQCyd0GCycNunk8Wgl1kQf10tQCes43bS272nOze5ZBtFeq/ovHUODYcVLcH0YQyWiB
         gjAhy8svdiXMCYEiMuuZdKtDH70VTPDrXTpKYTpEPlY5O8uUWZtdPs0P7eBHzY2zgCU7
         sPECd23ZpDiAOHiDWi0xlIBEdLwSexx11IbYL6ItqaYg5rExP1x8AxgVNc8xIyvnJDdV
         uHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MPvaywVSzLQsDypuAZWtv58R2kwucV8I6O2XfMn8CQ0=;
        b=ZT7/TyuwsL9GRzJh/Cb288SqDrs3QM/AnhNUsVjYeEyGJ89Vrjm8xgbmNbctcfY7kd
         fqc/3y87/d4iJxKcTE5S2uhjB+1Nt+xtsHi5h8gWI75/oRc1sUhpk711TsQWD7JyrVIp
         cSsr31gWhEy8iPKbNKhj4MK9XTTw5GGW7H5TjGcbj9++PP60AaUEhSB5sNIxj7JdJ3H7
         cVR3zFoGcZBCxQ2MBLA42gIPHnRVCTRUhHXy0/fnRW32n/CaxBHQjOEwVHCZ2eliGZt1
         ED/McTozLn4PVhwFUPGZnv4KPBnz6LVNh7NhakxNuFoGzo2vEMs18jmvkqXkgVsMij59
         EeiQ==
X-Gm-Message-State: AOAM530XnQaRo58LbB+8Va5/kkO5EhNmmENu9Em0q7HzH9kWzko3uC9V
        TVEAR/Riw1+u/XO8nQiQI7D8eEiwgFxUIhhAbJYO/w==
X-Google-Smtp-Source: ABdhPJyK6ciXtk4jJTmoikX0fzgqwOpbxHs/TrQKtZElemmsFiXP5Rij+6j+c5XTQ4r1vrmfsngJLLE7wspd4bNThOM=
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id
 ec12-20020a0564020d4c00b00410a415fd95mr3310237edb.288.1649160780633; Tue, 05
 Apr 2022 05:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com> <20220401103604.8705-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220401103604.8705-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Apr 2022 14:12:50 +0200
Message-ID: <CAMRc=McWk1piiJu60Zgzkiw5zJPmH=1Pizdn06H7YKn0HzVTHA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] gpiolib: Introduce for_each_gpiochip_node() loop helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Qianggui Song <qianggui.song@amlogic.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 1, 2022 at 12:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Introduce for_each_gpiochip_node() loop helper which iterates over
> the GPIO controller child nodes of a given device.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/linux/gpio/driver.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 98c93510640e..bfc91f122d5f 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -3,13 +3,14 @@
>  #define __LINUX_GPIO_DRIVER_H
>
>  #include <linux/device.h>
> -#include <linux/types.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/lockdep.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/property.h>
> +#include <linux/types.h>
>
>  struct gpio_desc;
>  struct of_phandle_args;
> @@ -750,4 +751,8 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
>  }
>  #endif /* CONFIG_GPIOLIB */
>
> +#define for_each_gpiochip_node(dev, child)                                     \
> +       device_for_each_child_node(dev, child)                                  \
> +               if (!fwnode_property_present(child, "gpio-controller")) {} else
> +
>  #endif /* __LINUX_GPIO_DRIVER_H */
> --
> 2.35.1
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
