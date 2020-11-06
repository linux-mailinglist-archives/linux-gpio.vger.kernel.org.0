Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288C52A9362
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 10:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgKFJvH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 04:51:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726459AbgKFJvG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 04:51:06 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54802C0613D4
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 01:51:06 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id v18so739010ljc.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 01:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0UwxZE4fayPRnvQxDAbTZKD+y1CSxe7+6Z1whH6kMNE=;
        b=MP+8Ww1jr5M0U/EN/842njJFwNLARYITc9Xon6uZ8dA1TKARpQyaLBumduDVl7/uzZ
         x6Scf/u1gF/A0Pt66DGyYin/JtmFO+qNsp8f0eY0kuGGW3tiQSDYS89wjfMv/UR3P6Zi
         iZOE8y4Ba3dCMdte+VAqnUJPFA8nTaiV5dDFx11asKO/BxmZZoB6nhU5q7XKfeg9oVow
         4ZV/m6ddzTMXLeYVUcl4+2Psbk3kdLFanOAxO7elc12Nigojmv8iW5zyW1Ulkk1+okKA
         fLy5JzvQl6OMWH3Fd0nKE3Z4Ziv3WWK6SJn0zgDG2trFi2Z9feVWjuli7xkq4mLY571Z
         /5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0UwxZE4fayPRnvQxDAbTZKD+y1CSxe7+6Z1whH6kMNE=;
        b=mACjmPHBh6d6dbGfYte6NBXgkfQRFrZsKmL6hW+OmUItT6cb8cnO2inMhexqKXAENy
         lQc890QzvWX+TbgHTsMevU5+ZEdQ5p96BtdKhGtNYPbrAwilBLGQE9W6WAOGtoTF5DM2
         8rPp1MayNht5RAtBsW2e/9HsIyC7vgispTHq8HTG41qyFJqMZuWhiyYboBhIg+0aOj9P
         bQnEB3Vb9KYN+TvUbgyvEKu69rgciNDw4JY4UasNYx39DiF4BWB7nxmMAEoC9Wvlp5BZ
         I59sYu/38i6WJQAn5y1Noe6MQdOhYIXpS8JqH0hCYutfVsrw6UZSEm1eFn8PXZNAU8HH
         TjEA==
X-Gm-Message-State: AOAM531bEHvWpbRb3iT6+aVMInlHgWFq328qXnhrARnRhwsoZsb03f33
        PlX5XzfhWyrY2xCJXxmrAcuCiFLqgyNOjyKFXTr5zxrraB5Z/w==
X-Google-Smtp-Source: ABdhPJxeQK2BYHJcOBYczjSxnwq3O+zvrpPSmHdio7wYUwV3iXXdNLvCmTC8KQhbsAbGmaRxdy9qN6r1KN3q0sLiqU0=
X-Received: by 2002:a05:651c:1205:: with SMTP id i5mr479722lja.283.1604656264669;
 Fri, 06 Nov 2020 01:51:04 -0800 (PST)
MIME-Version: 1.0
References: <20201105120410.18305-1-srinivas.kandagatla@linaro.org> <20201105120410.18305-2-srinivas.kandagatla@linaro.org>
In-Reply-To: <20201105120410.18305-2-srinivas.kandagatla@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Nov 2020 10:50:53 +0100
Message-ID: <CACRpkda91ncAVGj8_qcEyKPnRQdJjXMMCQ4ZJ1t7bVfcCZF=CA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Srinivas,

thanks for your patch!

On Thu, Nov 5, 2020 at 1:04 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> Add initial pinctrl driver to support pin configuration for
> LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
> on SM8250.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

So this is in essence a completely new pin controller that shares
nothing with the previous Qcom SoC pin control hardware?

I'd still like Bjorn to review it of course, but if you are going to
maintain this driver an entry to the MAINTAINERS file would
be nice.

I'd like some more talk in the commit message about how this
driver is engineered so I point those things out below.

> +config PINCTRL_LPASS_LPI
> +       tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
> +       depends on GPIOLIB && OF

These days you can actually just
select GPIOLIB
but no big deal.

> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/gpio.h>

Do not use this legacy header for new GPIO drivers.
#include <linux/gpio/driver.h>
should work.

> +#define LPI_GPIO_REG_VAL_CTL             0x00
> +#define LPI_GPIO_REG_DIR_CTL             0x04
> +#define LPI_SLEW_REG_VAL_CTL             0x00
> +#define LPI_SLEW_RATE_MAX                0x03
> +#define LPI_SLEW_BITS_SIZE               0x02
> +#define LPI_GPIO_REG_PULL_SHIFT                0x0
> +#define LPI_GPIO_REG_PULL_MASK         GENMASK(1, 0)
> +#define LPI_GPIO_REG_FUNCTION_SHIFT    0x2
> +#define LPI_GPIO_REG_FUNCTION_MASK     GENMASK(5, 2)
> +#define LPI_GPIO_REG_OUT_STRENGTH_SHIFT        0x6
> +#define LPI_GPIO_REG_OUT_STRENGTH_MASK GENMASK(8, 6)
> +#define LPI_GPIO_REG_OE_SHIFT          0x9
> +#define LPI_GPIO_REG_OE_MASK           BIT(9)
> +#define LPI_GPIO_REG_DIR_SHIFT         0x1
> +#define LPI_GPIO_REG_DIR_MASK          0x2
> +#define LPI_GPIO_BIAS_DISABLE          0x0
> +#define LPI_GPIO_PULL_DOWN             0x1
> +#define LPI_GPIO_KEEPER                        0x2
> +#define LPI_GPIO_PULL_UP               0x3

So the way I understand it, the GPIO lines have one register each and then the
functionality of each line is handled by different bits in that register, like
output is driven in bit 9.

This would be nice to have mentioned in the commit message.

> +static const unsigned int gpio0_pins[] = { 0 };
> +static const unsigned int gpio1_pins[] = { 1 };
> +static const unsigned int gpio2_pins[] = { 2 };
> +static const unsigned int gpio3_pins[] = { 3 };
> +static const unsigned int gpio4_pins[] = { 4 };
> +static const unsigned int gpio5_pins[] = { 5 };
> +static const unsigned int gpio6_pins[] = { 6 };
> +static const unsigned int gpio7_pins[] = { 7 };
> +static const unsigned int gpio8_pins[] = { 8 };
> +static const unsigned int gpio9_pins[] = { 9 };
> +static const unsigned int gpio10_pins[] = { 10 };
> +static const unsigned int gpio11_pins[] = { 11 };
> +static const unsigned int gpio12_pins[] = { 12 };
> +static const unsigned int gpio13_pins[] = { 13 };
> +static const char * const swr_tx_clk_groups[] = { "gpio0" };
> +static const char * const swr_tx_data1_groups[] = { "gpio1" };
> +static const char * const swr_tx_data2_groups[] = { "gpio2" };
> +static const char * const swr_rx_clk_groups[] = { "gpio3" };
> +static const char * const swr_rx_data1_groups[] = { "gpio4" };
> +static const char * const swr_tx_data3_groups[] = { "gpio5" };
> +static const char * const dmic1_clk_groups[] = { "gpio6" };
> +static const char * const dmic1_data_groups[] = { "gpio7" };
> +static const char * const dmic2_clk_groups[] = { "gpio8" };
> +static const char * const dmic2_data_groups[] = { "gpio9" };
> +static const char * const i2s2_clk_groups[] = { "gpio10" };
> +static const char * const i2s2_ws_groups[] = { "gpio11" };
> +static const char * const dmic3_clk_groups[] = { "gpio12" };
> +static const char * const dmic3_data_groups[] = { "gpio13" };
> +static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
> +static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
> +static const char * const qua_mi2s_data0_groups[] = { "gpio2" };
> +static const char * const qua_mi2s_data1_groups[] = { "gpio3" };
> +static const char * const qua_mi2s_data2_groups[] = { "gpio4" };
> +static const char * const swr_rx_data2_groups[] = { "gpio5" };
> +static const char * const i2s1_clk_groups[] = { "gpio6" };
> +static const char * const i2s1_ws_groups[] = { "gpio7" };
> +static const char * const i2s1_data0_groups[] = { "gpio8" };
> +static const char * const i2s1_data1_groups[] = { "gpio9" };
> +static const char * const wsa_swr_clk_groups[] = { "gpio10" };
> +static const char * const wsa_swr_data_groups[] = { "gpio11" };
> +static const char * const i2s2_data0_groups[] = { "gpio12" };
> +static const char * const i2s2_data1_groups[] = { "gpio13" };

The driver appears to follow other qualcomm pin controllers in using
the "one group is one pin" approach. This is idiomatic and should be
mentioned in the commit message.

> +static int sm8250_slew_reg_offsets[] = {
> +               0x0, 0x2, 0x4, 0x8, 0xa,
> +               0xc, 0x0, 0x0, 0x0, 0x0,
> +               0x10, 0x12, 0x0, 0x0,
> +};

Maybe it is obvious to everyone what this array is about, but why so
many zeroes? I think it warrants a comment in the code if that
means for example that some pins do not support slew rate setting.

Overall this is a nice and self-contained driver that uses the abstractions
the right way and very straight-forward, so I think we can merge it
soon.

(Look into Andy's comments as well.)

Yours,
Linus Walleij
