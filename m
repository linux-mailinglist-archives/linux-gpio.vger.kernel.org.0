Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D465732DF0D
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 02:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhCEBYj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 4 Mar 2021 20:24:39 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:41014 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhCEBYj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 20:24:39 -0500
Received: by mail-io1-f44.google.com with SMTP id z13so253376iox.8
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 17:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tW3NXvFvBalaTF7h/3KBcn4BZri8iHoiBz7ZbXqYf/I=;
        b=Ujq3B90Nt05SJocUMKBANqYWI5Pq5ivhoVwqRb5HCSypqSTKgaHRMtiYxnF70rYC/Y
         4hdVb9Vyfjy/Cvv6hBf+QGnB+rTZ/2aNOwRAaHhGnU1P/4lu6ceFlp1qsOL6zBYNM8wm
         FZI2Sd1moqDhPVOFhWa9NI+R0sbK9B/2YWTPKn5NUqwq5EPq0U1Xh5WwgURlXMy4+wSn
         llZLPv8l/BtKfBYP15L5aha6RUlJohfw+Cs62tCSnf1LMMoAmca3EawIO9TcJwM475Yi
         PGarYJmkXfSWkfZQsseHmqsUT67bJz9UNhuZ2mCY3J0otCuZop3Cg7UPynz2P0puLJbH
         yx3w==
X-Gm-Message-State: AOAM530Us7RwOa+yOeSkX9deGoYAAdAe6KacJZ7l6Y/y3213cQQW37Fi
        EeRI8Eat5akK9SnQGzdcjRHca5zG93/vY4ergOs=
X-Google-Smtp-Source: ABdhPJyvvjaDk6hmKIpSJxIdwZqNOP92TIMGRUKQRcOdp61Iygkarsv92noUrlyYL1W5DQhBEHg+otWXP2opi2ykWVU=
X-Received: by 2002:a5d:81c8:: with SMTP id t8mr6138514iol.38.1614907478757;
 Thu, 04 Mar 2021 17:24:38 -0800 (PST)
MIME-Version: 1.0
References: <20210224113918.957738-1-jay.xu@rock-chips.com> <20210304013342.1106361-1-jay.xu@rock-chips.com>
In-Reply-To: <20210304013342.1106361-1-jay.xu@rock-chips.com>
From:   Kever Yang <kever.yang@rock-chips.com>
Date:   Fri, 5 Mar 2021 09:24:27 +0800
Message-ID: <CAKUh=RybQ+x5c4Nt_m3sKNAuxDpNXQ7XL-qFOYuBv4WuMgjYJQ@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] pinctrl: rockchip: add support for rk3568
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Jianqun Xu <jay.xu@rock-chips.com> 于2021年3月4日周四 上午9:33写道：
>
> RK3568 SoCs have 5 gpio controllers, each gpio has 32 pins. GPIO supports
> set iomux, pull, drive strength, schmitt and slew rate.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

Patch looks good to me.

Reviewed-by: Kever Yang <kever.yang@rock-chips.com>

Thanks,
- Kever
> ---
> changes since v2:
> - fix mux route grf base for gpio bank 0
> changes since v1:
>   suggested by Heiko, thank for heiko
> - modify _GENMASK to WRITE_MASK_VAL, and add comment for the define
> - modify MR_GRF to RK_MUXROUTE_GRF, also for MR_SAME and MR_PMU
> - add comment for pull setting for GPIO0_D0-D6
>
>  drivers/pinctrl/pinctrl-rockchip.c | 319 ++++++++++++++++++++++++++++-
>  1 file changed, 317 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index aa1a1c850d05..68ae46a2a919 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -61,8 +61,17 @@ enum rockchip_pinctrl_type {
>         RK3308,
>         RK3368,
>         RK3399,
> +       RK3568,
>  };
>
> +
> +/**
> + * Generate a bitmask for setting a value (v) with a write mask bit in hiword
> + * register 31:16 area.
> + */
> +#define WRITE_MASK_VAL(h, l, v) \
> +       (GENMASK(((h) + 16), ((l) + 16)) | (((v) << (l)) & GENMASK((h), (l))))
> +
>  /*
>   * Encode variants of iomux registers into a type variable
>   */
> @@ -290,6 +299,25 @@ struct rockchip_pin_bank {
>                 .pull_type[3] = pull3,                                  \
>         }
>
> +#define PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, FLAG)                \
> +       {                                                               \
> +               .bank_num       = ID,                                   \
> +               .pin            = PIN,                                  \
> +               .func           = FUNC,                                 \
> +               .route_offset   = REG,                                  \
> +               .route_val      = VAL,                                  \
> +               .route_type     = FLAG,                                 \
> +       }
> +
> +#define RK_MUXROUTE_SAME(ID, PIN, FUNC, REG, VAL)      \
> +       PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, ROCKCHIP_ROUTE_SAME)
> +
> +#define RK_MUXROUTE_GRF(ID, PIN, FUNC, REG, VAL)       \
> +       PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, ROCKCHIP_ROUTE_GRF)
> +
> +#define RK_MUXROUTE_PMU(ID, PIN, FUNC, REG, VAL)       \
> +       PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, ROCKCHIP_ROUTE_PMU)
> +
>  /**
>   * struct rockchip_mux_recalced_data: represent a pin iomux data.
>   * @num: bank number.
> @@ -1394,6 +1422,102 @@ static struct rockchip_mux_route_data rk3399_mux_route_data[] = {
>         },
>  };
>
> +static struct rockchip_mux_route_data rk3568_mux_route_data[] = {
> +       RK_MUXROUTE_PMU(0, RK_PB7, 1, 0x0110, WRITE_MASK_VAL(1, 0, 0)), /* PWM0 IO mux M0 */
> +       RK_MUXROUTE_PMU(0, RK_PC7, 2, 0x0110, WRITE_MASK_VAL(1, 0, 1)), /* PWM0 IO mux M1 */
> +       RK_MUXROUTE_PMU(0, RK_PC0, 1, 0x0110, WRITE_MASK_VAL(3, 2, 0)), /* PWM1 IO mux M0 */
> +       RK_MUXROUTE_PMU(0, RK_PB5, 4, 0x0110, WRITE_MASK_VAL(3, 2, 1)), /* PWM1 IO mux M1 */
> +       RK_MUXROUTE_PMU(0, RK_PC1, 1, 0x0110, WRITE_MASK_VAL(5, 4, 0)), /* PWM2 IO mux M0 */
> +       RK_MUXROUTE_PMU(0, RK_PB6, 4, 0x0110, WRITE_MASK_VAL(5, 4, 1)), /* PWM2 IO mux M1 */
> +       RK_MUXROUTE_PMU(0, RK_PB3, 2, 0x0300, WRITE_MASK_VAL(0, 0, 0)), /* CAN0 IO mux M0 */
> +       RK_MUXROUTE_GRF(2, RK_PA1, 4, 0x0300, WRITE_MASK_VAL(0, 0, 1)), /* CAN0 IO mux M1 */
> +       RK_MUXROUTE_GRF(1, RK_PA1, 3, 0x0300, WRITE_MASK_VAL(2, 2, 0)), /* CAN1 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PC3, 3, 0x0300, WRITE_MASK_VAL(2, 2, 1)), /* CAN1 IO mux M1 */
> +       RK_MUXROUTE_GRF(4, RK_PB5, 3, 0x0300, WRITE_MASK_VAL(4, 4, 0)), /* CAN2 IO mux M0 */
> +       RK_MUXROUTE_GRF(2, RK_PB2, 4, 0x0300, WRITE_MASK_VAL(4, 4, 1)), /* CAN2 IO mux M1 */
> +       RK_MUXROUTE_GRF(4, RK_PC4, 1, 0x0300, WRITE_MASK_VAL(6, 6, 0)), /* HPDIN IO mux M0 */
> +       RK_MUXROUTE_GRF(0, RK_PC2, 2, 0x0300, WRITE_MASK_VAL(6, 6, 1)), /* HPDIN IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PB1, 3, 0x0300, WRITE_MASK_VAL(8, 8, 0)), /* GMAC1 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PA7, 3, 0x0300, WRITE_MASK_VAL(8, 8, 1)), /* GMAC1 IO mux M1 */
> +       RK_MUXROUTE_GRF(4, RK_PD1, 1, 0x0300, WRITE_MASK_VAL(10, 10, 0)), /* HDMITX IO mux M0 */
> +       RK_MUXROUTE_GRF(0, RK_PC7, 1, 0x0300, WRITE_MASK_VAL(10, 10, 1)), /* HDMITX IO mux M1 */
> +       RK_MUXROUTE_GRF(0, RK_PB6, 1, 0x0300, WRITE_MASK_VAL(14, 14, 0)), /* I2C2 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PB4, 1, 0x0300, WRITE_MASK_VAL(14, 14, 1)), /* I2C2 IO mux M1 */
> +       RK_MUXROUTE_GRF(1, RK_PA0, 1, 0x0304, WRITE_MASK_VAL(0, 0, 0)), /* I2C3 IO mux M0 */
> +       RK_MUXROUTE_GRF(3, RK_PB6, 4, 0x0304, WRITE_MASK_VAL(0, 0, 1)), /* I2C3 IO mux M1 */
> +       RK_MUXROUTE_GRF(4, RK_PB2, 1, 0x0304, WRITE_MASK_VAL(2, 2, 0)), /* I2C4 IO mux M0 */
> +       RK_MUXROUTE_GRF(2, RK_PB1, 2, 0x0304, WRITE_MASK_VAL(2, 2, 1)), /* I2C4 IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PB4, 4, 0x0304, WRITE_MASK_VAL(4, 4, 0)), /* I2C5 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PD0, 2, 0x0304, WRITE_MASK_VAL(4, 4, 1)), /* I2C5 IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PB1, 5, 0x0304, WRITE_MASK_VAL(14, 14, 0)), /* PWM8 IO mux M0 */
> +       RK_MUXROUTE_GRF(1, RK_PD5, 4, 0x0304, WRITE_MASK_VAL(14, 14, 1)), /* PWM8 IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PB2, 5, 0x0308, WRITE_MASK_VAL(0, 0, 0)), /* PWM9 IO mux M0 */
> +       RK_MUXROUTE_GRF(1, RK_PD6, 4, 0x0308, WRITE_MASK_VAL(0, 0, 1)), /* PWM9 IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PB5, 5, 0x0308, WRITE_MASK_VAL(2, 2, 0)), /* PWM10 IO mux M0 */
> +       RK_MUXROUTE_GRF(2, RK_PA1, 2, 0x0308, WRITE_MASK_VAL(2, 2, 1)), /* PWM10 IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PB6, 5, 0x0308, WRITE_MASK_VAL(4, 4, 0)), /* PWM11 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PC0, 3, 0x0308, WRITE_MASK_VAL(4, 4, 1)), /* PWM11 IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PB7, 2, 0x0308, WRITE_MASK_VAL(6, 6, 0)), /* PWM12 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PC5, 1, 0x0308, WRITE_MASK_VAL(6, 6, 1)), /* PWM12 IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PC0, 2, 0x0308, WRITE_MASK_VAL(8, 8, 0)), /* PWM13 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PC6, 1, 0x0308, WRITE_MASK_VAL(8, 8, 1)), /* PWM13 IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PC4, 1, 0x0308, WRITE_MASK_VAL(10, 10, 0)), /* PWM14 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PC2, 1, 0x0308, WRITE_MASK_VAL(10, 10, 1)), /* PWM14 IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PC5, 1, 0x0308, WRITE_MASK_VAL(12, 12, 0)), /* PWM15 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PC3, 1, 0x0308, WRITE_MASK_VAL(12, 12, 1)), /* PWM15 IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PD2, 3, 0x0308, WRITE_MASK_VAL(14, 14, 0)), /* SDMMC2 IO mux M0 */
> +       RK_MUXROUTE_GRF(3, RK_PA5, 5, 0x0308, WRITE_MASK_VAL(14, 14, 1)), /* SDMMC2 IO mux M1 */
> +       RK_MUXROUTE_GRF(0, RK_PB5, 2, 0x030c, WRITE_MASK_VAL(0, 0, 0)), /* SPI0 IO mux M0 */
> +       RK_MUXROUTE_GRF(2, RK_PD3, 3, 0x030c, WRITE_MASK_VAL(0, 0, 1)), /* SPI0 IO mux M1 */
> +       RK_MUXROUTE_GRF(2, RK_PB5, 3, 0x030c, WRITE_MASK_VAL(2, 2, 0)), /* SPI1 IO mux M0 */
> +       RK_MUXROUTE_GRF(3, RK_PC3, 3, 0x030c, WRITE_MASK_VAL(2, 2, 1)), /* SPI1 IO mux M1 */
> +       RK_MUXROUTE_GRF(2, RK_PC1, 4, 0x030c, WRITE_MASK_VAL(4, 4, 0)), /* SPI2 IO mux M0 */
> +       RK_MUXROUTE_GRF(3, RK_PA0, 3, 0x030c, WRITE_MASK_VAL(4, 4, 1)), /* SPI2 IO mux M1 */
> +       RK_MUXROUTE_GRF(4, RK_PB3, 4, 0x030c, WRITE_MASK_VAL(6, 6, 0)), /* SPI3 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PC2, 2, 0x030c, WRITE_MASK_VAL(6, 6, 1)), /* SPI3 IO mux M1 */
> +       RK_MUXROUTE_GRF(2, RK_PB4, 2, 0x030c, WRITE_MASK_VAL(8, 8, 0)), /* UART1 IO mux M0 */
> +       RK_MUXROUTE_GRF(0, RK_PD1, 1, 0x030c, WRITE_MASK_VAL(8, 8, 1)), /* UART1 IO mux M1 */
> +       RK_MUXROUTE_GRF(0, RK_PD1, 1, 0x030c, WRITE_MASK_VAL(10, 10, 0)), /* UART2 IO mux M0 */
> +       RK_MUXROUTE_GRF(1, RK_PD5, 2, 0x030c, WRITE_MASK_VAL(10, 10, 1)), /* UART2 IO mux M1 */
> +       RK_MUXROUTE_GRF(1, RK_PA1, 2, 0x030c, WRITE_MASK_VAL(12, 12, 0)), /* UART3 IO mux M0 */
> +       RK_MUXROUTE_GRF(3, RK_PB7, 4, 0x030c, WRITE_MASK_VAL(12, 12, 1)), /* UART3 IO mux M1 */
> +       RK_MUXROUTE_GRF(1, RK_PA6, 2, 0x030c, WRITE_MASK_VAL(14, 14, 0)), /* UART4 IO mux M0 */
> +       RK_MUXROUTE_GRF(3, RK_PB2, 4, 0x030c, WRITE_MASK_VAL(14, 14, 1)), /* UART4 IO mux M1 */
> +       RK_MUXROUTE_GRF(2, RK_PA2, 3, 0x0310, WRITE_MASK_VAL(0, 0, 0)), /* UART5 IO mux M0 */
> +       RK_MUXROUTE_GRF(3, RK_PC2, 4, 0x0310, WRITE_MASK_VAL(0, 0, 1)), /* UART5 IO mux M1 */
> +       RK_MUXROUTE_GRF(2, RK_PA4, 3, 0x0310, WRITE_MASK_VAL(2, 2, 0)), /* UART6 IO mux M0 */
> +       RK_MUXROUTE_GRF(1, RK_PD5, 3, 0x0310, WRITE_MASK_VAL(2, 2, 1)), /* UART6 IO mux M1 */
> +       RK_MUXROUTE_GRF(2, RK_PA6, 3, 0x0310, WRITE_MASK_VAL(5, 4, 0)), /* UART7 IO mux M0 */
> +       RK_MUXROUTE_GRF(3, RK_PC4, 4, 0x0310, WRITE_MASK_VAL(5, 4, 1)), /* UART7 IO mux M1 */
> +       RK_MUXROUTE_GRF(4, RK_PA2, 4, 0x0310, WRITE_MASK_VAL(5, 4, 2)), /* UART7 IO mux M2 */
> +       RK_MUXROUTE_GRF(2, RK_PC5, 3, 0x0310, WRITE_MASK_VAL(6, 6, 0)), /* UART8 IO mux M0 */
> +       RK_MUXROUTE_GRF(2, RK_PD7, 4, 0x0310, WRITE_MASK_VAL(6, 6, 1)), /* UART8 IO mux M1 */
> +       RK_MUXROUTE_GRF(2, RK_PB0, 3, 0x0310, WRITE_MASK_VAL(9, 8, 0)), /* UART9 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PC5, 4, 0x0310, WRITE_MASK_VAL(9, 8, 1)), /* UART9 IO mux M1 */
> +       RK_MUXROUTE_GRF(4, RK_PA4, 4, 0x0310, WRITE_MASK_VAL(9, 8, 2)), /* UART9 IO mux M2 */
> +       RK_MUXROUTE_GRF(1, RK_PA2, 1, 0x0310, WRITE_MASK_VAL(11, 10, 0)), /* I2S1 IO mux M0 */
> +       RK_MUXROUTE_GRF(3, RK_PC6, 4, 0x0310, WRITE_MASK_VAL(11, 10, 1)), /* I2S1 IO mux M1 */
> +       RK_MUXROUTE_GRF(2, RK_PD0, 5, 0x0310, WRITE_MASK_VAL(11, 10, 2)), /* I2S1 IO mux M2 */
> +       RK_MUXROUTE_GRF(2, RK_PC1, 1, 0x0310, WRITE_MASK_VAL(12, 12, 0)), /* I2S2 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PB6, 5, 0x0310, WRITE_MASK_VAL(12, 12, 1)), /* I2S2 IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PA2, 4, 0x0310, WRITE_MASK_VAL(14, 14, 0)), /* I2S3 IO mux M0 */
> +       RK_MUXROUTE_GRF(4, RK_PC2, 5, 0x0310, WRITE_MASK_VAL(14, 14, 1)), /* I2S3 IO mux M1 */
> +       RK_MUXROUTE_GRF(1, RK_PA4, 3, 0x0314, WRITE_MASK_VAL(1, 0, 0)), /* PDM IO mux M0 */
> +       RK_MUXROUTE_GRF(1, RK_PA6, 3, 0x0314, WRITE_MASK_VAL(1, 0, 0)), /* PDM IO mux M0 */
> +       RK_MUXROUTE_GRF(3, RK_PD6, 5, 0x0314, WRITE_MASK_VAL(1, 0, 1)), /* PDM IO mux M1 */
> +       RK_MUXROUTE_GRF(4, RK_PA0, 4, 0x0314, WRITE_MASK_VAL(1, 0, 1)), /* PDM IO mux M1 */
> +       RK_MUXROUTE_GRF(3, RK_PC4, 5, 0x0314, WRITE_MASK_VAL(1, 0, 2)), /* PDM IO mux M2 */
> +       RK_MUXROUTE_GRF(0, RK_PA5, 3, 0x0314, WRITE_MASK_VAL(3, 2, 0)), /* PCIE20 IO mux M0 */
> +       RK_MUXROUTE_GRF(2, RK_PD0, 4, 0x0314, WRITE_MASK_VAL(3, 2, 1)), /* PCIE20 IO mux M1 */
> +       RK_MUXROUTE_GRF(1, RK_PB0, 4, 0x0314, WRITE_MASK_VAL(3, 2, 2)), /* PCIE20 IO mux M2 */
> +       RK_MUXROUTE_GRF(0, RK_PA4, 3, 0x0314, WRITE_MASK_VAL(5, 4, 0)), /* PCIE30X1 IO mux M0 */
> +       RK_MUXROUTE_GRF(2, RK_PD2, 4, 0x0314, WRITE_MASK_VAL(5, 4, 1)), /* PCIE30X1 IO mux M1 */
> +       RK_MUXROUTE_GRF(1, RK_PA5, 4, 0x0314, WRITE_MASK_VAL(5, 4, 2)), /* PCIE30X1 IO mux M2 */
> +       RK_MUXROUTE_GRF(0, RK_PA6, 2, 0x0314, WRITE_MASK_VAL(7, 6, 0)), /* PCIE30X2 IO mux M0 */
> +       RK_MUXROUTE_GRF(2, RK_PD4, 4, 0x0314, WRITE_MASK_VAL(7, 6, 1)), /* PCIE30X2 IO mux M1 */
> +       RK_MUXROUTE_GRF(4, RK_PC2, 4, 0x0314, WRITE_MASK_VAL(7, 6, 2)), /* PCIE30X2 IO mux M2 */
> +};
> +
>  static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
>                                    int mux, u32 *loc, u32 *reg, u32 *value)
>  {
> @@ -2102,6 +2226,94 @@ static void rk3399_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
>                 *bit = (pin_num % 8) * 2;
>  }
>
> +#define RK3568_SR_PMU_OFFSET           0x60
> +#define RK3568_SR_GRF_OFFSET           0x0180
> +#define RK3568_SR_BANK_STRIDE          0x10
> +#define RK3568_SR_PINS_PER_REG         16
> +
> +static int rk3568_calc_slew_rate_reg_and_bit(struct rockchip_pin_bank *bank,
> +                                            int pin_num,
> +                                            struct regmap **regmap,
> +                                            int *reg, u8 *bit)
> +{
> +       struct rockchip_pinctrl *info = bank->drvdata;
> +
> +       if (bank->bank_num == 0) {
> +               *regmap = info->regmap_pmu;
> +               *reg = RK3568_SR_PMU_OFFSET;
> +       } else {
> +               *regmap = info->regmap_base;
> +               *reg = RK3568_SR_GRF_OFFSET;
> +               *reg += (bank->bank_num  - 1) * RK3568_SR_BANK_STRIDE;
> +       }
> +       *reg += ((pin_num / RK3568_SR_PINS_PER_REG) * 4);
> +       *bit = pin_num % RK3568_SR_PINS_PER_REG;
> +
> +       return 0;
> +}
> +
> +#define RK3568_PULL_PMU_OFFSET         0x20
> +#define RK3568_PULL_GRF_OFFSET         0x80
> +#define RK3568_PULL_BITS_PER_PIN       2
> +#define RK3568_PULL_PINS_PER_REG       8
> +#define RK3568_PULL_BANK_STRIDE                0x10
> +
> +static void rk3568_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
> +                                        int pin_num, struct regmap **regmap,
> +                                        int *reg, u8 *bit)
> +{
> +       struct rockchip_pinctrl *info = bank->drvdata;
> +
> +       if (bank->bank_num == 0) {
> +               *regmap = info->regmap_pmu;
> +               *reg = RK3568_PULL_PMU_OFFSET;
> +               *reg += bank->bank_num * RK3568_PULL_BANK_STRIDE;
> +               *reg += ((pin_num / RK3568_PULL_PINS_PER_REG) * 4);
> +
> +               *bit = pin_num % RK3568_PULL_PINS_PER_REG;
> +               *bit *= RK3568_PULL_BITS_PER_PIN;
> +       } else {
> +               *regmap = info->regmap_base;
> +               *reg = RK3568_PULL_GRF_OFFSET;
> +               *reg += (bank->bank_num - 1) * RK3568_PULL_BANK_STRIDE;
> +               *reg += ((pin_num / RK3568_PULL_PINS_PER_REG) * 4);
> +
> +               *bit = (pin_num % RK3568_PULL_PINS_PER_REG);
> +               *bit *= RK3568_PULL_BITS_PER_PIN;
> +       }
> +}
> +
> +#define RK3568_DRV_PMU_OFFSET          0x70
> +#define RK3568_DRV_GRF_OFFSET          0x200
> +#define RK3568_DRV_BITS_PER_PIN                8
> +#define RK3568_DRV_PINS_PER_REG                2
> +#define RK3568_DRV_BANK_STRIDE         0x40
> +
> +static void rk3568_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
> +                                       int pin_num, struct regmap **regmap,
> +                                       int *reg, u8 *bit)
> +{
> +       struct rockchip_pinctrl *info = bank->drvdata;
> +
> +       /* The first 32 pins of the first bank are located in PMU */
> +       if (bank->bank_num == 0) {
> +               *regmap = info->regmap_pmu;
> +               *reg = RK3568_DRV_PMU_OFFSET;
> +               *reg += ((pin_num / RK3568_DRV_PINS_PER_REG) * 4);
> +
> +               *bit = pin_num % RK3568_DRV_PINS_PER_REG;
> +               *bit *= RK3568_DRV_BITS_PER_PIN;
> +       } else {
> +               *regmap = info->regmap_base;
> +               *reg = RK3568_DRV_GRF_OFFSET;
> +               *reg += (bank->bank_num - 1) * RK3568_DRV_BANK_STRIDE;
> +               *reg += ((pin_num / RK3568_DRV_PINS_PER_REG) * 4);
> +
> +               *bit = (pin_num % RK3568_DRV_PINS_PER_REG);
> +               *bit *= RK3568_DRV_BITS_PER_PIN;
> +       }
> +}
> +
>  static int rockchip_perpin_drv_list[DRV_TYPE_MAX][8] = {
>         { 2, 4, 8, 12, -1, -1, -1, -1 },
>         { 3, 6, 9, 12, -1, -1, -1, -1 },
> @@ -2202,6 +2414,11 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
>                 bank->bank_num, pin_num, strength);
>
>         ctrl->drv_calc_reg(bank, pin_num, &regmap, &reg, &bit);
> +       if (ctrl->type == RK3568) {
> +               rmask_bits = RK3568_DRV_BITS_PER_PIN;
> +               ret = (1 << (strength + 1)) - 1;
> +               goto config;
> +       }
>
>         ret = -EINVAL;
>         for (i = 0; i < ARRAY_SIZE(rockchip_perpin_drv_list[drv_type]); i++) {
> @@ -2271,6 +2488,7 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
>                 return -EINVAL;
>         }
>
> +config:
>         /* enable the write to the equivalent lower bits */
>         data = ((1 << rmask_bits) - 1) << (bit + 16);
>         rmask = data | (data >> 16);
> @@ -2373,6 +2591,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
>         case RK3308:
>         case RK3368:
>         case RK3399:
> +       case RK3568:
>                 pull_type = bank->pull_type[pin_num / 8];
>                 ret = -EINVAL;
>                 for (i = 0; i < ARRAY_SIZE(rockchip_pull_list[pull_type]);
> @@ -2382,6 +2601,14 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
>                                 break;
>                         }
>                 }
> +               /*
> +                * In the TRM, pull-up being 1 for everything except the GPIO0_D0-D6,
> +                * where that pull up value becomes 3.
> +                */
> +               if (ctrl->type == RK3568 && bank->bank_num == 0 && pin_num >= 27 && pin_num <= 30) {
> +                       if (ret == 1)
> +                               ret = 3;
> +               }
>
>                 if (ret < 0) {
>                         dev_err(info->dev, "unsupported pull setting %d\n",
> @@ -2426,6 +2653,35 @@ static int rk3328_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
>         return 0;
>  }
>
> +#define RK3568_SCHMITT_BITS_PER_PIN            2
> +#define RK3568_SCHMITT_PINS_PER_REG            8
> +#define RK3568_SCHMITT_BANK_STRIDE             0x10
> +#define RK3568_SCHMITT_GRF_OFFSET              0xc0
> +#define RK3568_SCHMITT_PMUGRF_OFFSET           0x30
> +
> +static int rk3568_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
> +                                          int pin_num,
> +                                          struct regmap **regmap,
> +                                          int *reg, u8 *bit)
> +{
> +       struct rockchip_pinctrl *info = bank->drvdata;
> +
> +       if (bank->bank_num == 0) {
> +               *regmap = info->regmap_pmu;
> +               *reg = RK3568_SCHMITT_PMUGRF_OFFSET;
> +       } else {
> +               *regmap = info->regmap_base;
> +               *reg = RK3568_SCHMITT_GRF_OFFSET;
> +               *reg += (bank->bank_num - 1) * RK3568_SCHMITT_BANK_STRIDE;
> +       }
> +
> +       *reg += ((pin_num / RK3568_SCHMITT_PINS_PER_REG) * 4);
> +       *bit = pin_num % RK3568_SCHMITT_PINS_PER_REG;
> +       *bit *= RK3568_SCHMITT_BITS_PER_PIN;
> +
> +       return 0;
> +}
> +
>  static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
>  {
>         struct rockchip_pinctrl *info = bank->drvdata;
> @@ -2444,6 +2700,13 @@ static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
>                 return ret;
>
>         data >>= bit;
> +       switch (ctrl->type) {
> +       case RK3568:
> +               return data & ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1);
> +       default:
> +               break;
> +       }
> +
>         return data & 0x1;
>  }
>
> @@ -2465,8 +2728,17 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
>                 return ret;
>
>         /* enable the write to the equivalent lower bits */
> -       data = BIT(bit + 16) | (enable << bit);
> -       rmask = BIT(bit + 16) | BIT(bit);
> +       switch (ctrl->type) {
> +       case RK3568:
> +               data = ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1) << (bit + 16);
> +               rmask = data | (data >> 16);
> +               data |= ((enable ? 0x2 : 0x1) << bit);
> +               break;
> +       default:
> +               data = BIT(bit + 16) | (enable << bit);
> +               rmask = BIT(bit + 16) | BIT(bit);
> +               break;
> +       }
>
>         return regmap_update_bits(regmap, reg, rmask, data);
>  }
> @@ -2640,6 +2912,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
>         case RK3308:
>         case RK3368:
>         case RK3399:
> +       case RK3568:
>                 return (pull != PIN_CONFIG_BIAS_PULL_PIN_DEFAULT);
>         }
>
> @@ -4210,6 +4483,46 @@ static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
>                 .drv_calc_reg           = rk3399_calc_drv_reg_and_bit,
>  };
>
> +static struct rockchip_pin_bank rk3568_pin_banks[] = {
> +       PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT,
> +                                            IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT,
> +                                            IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT,
> +                                            IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT),
> +       PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT),
> +       PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT),
> +       PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT),
> +       PIN_BANK_IOMUX_FLAGS(4, 32, "gpio4", IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT,
> +                                            IOMUX_WIDTH_4BIT),
> +};
> +
> +static struct rockchip_pin_ctrl rk3568_pin_ctrl = {
> +       .pin_banks              = rk3568_pin_banks,
> +       .nr_banks               = ARRAY_SIZE(rk3568_pin_banks),
> +       .label                  = "RK3568-GPIO",
> +       .type                   = RK3568,
> +       .grf_mux_offset         = 0x0,
> +       .pmu_mux_offset         = 0x0,
> +       .grf_drv_offset         = 0x0200,
> +       .pmu_drv_offset         = 0x0070,
> +       .iomux_routes           = rk3568_mux_route_data,
> +       .niomux_routes          = ARRAY_SIZE(rk3568_mux_route_data),
> +       .pull_calc_reg          = rk3568_calc_pull_reg_and_bit,
> +       .drv_calc_reg           = rk3568_calc_drv_reg_and_bit,
> +       .slew_rate_calc_reg     = rk3568_calc_slew_rate_reg_and_bit,
> +       .schmitt_calc_reg       = rk3568_calc_schmitt_reg_and_bit,
> +};
> +
>  static const struct of_device_id rockchip_pinctrl_dt_match[] = {
>         { .compatible = "rockchip,px30-pinctrl",
>                 .data = &px30_pin_ctrl },
> @@ -4239,6 +4552,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
>                 .data = &rk3368_pin_ctrl },
>         { .compatible = "rockchip,rk3399-pinctrl",
>                 .data = &rk3399_pin_ctrl },
> +       { .compatible = "rockchip,rk3568-pinctrl",
> +               .data = &rk3568_pin_ctrl },
>         {},
>  };
>
> --
> 2.25.1
>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>
>
