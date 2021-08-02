Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84463DE2DA
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 01:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbhHBXG2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 19:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbhHBXG1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 19:06:27 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8F8C061796
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 16:06:17 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id y1so2800255vsc.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 16:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xpyVU3ei/AP0KmybjlqX88a6HrifRHguk/VSuzK6yLo=;
        b=ohEu439CYwzdTzfT11BrJ44b15ggEvl6dUJjbnhwnZVt5QmMPMHbfZX+Y4vMm5gv2x
         MBIpC1bQ+TY5lKTRmdNBt+pW38dNcGDFpfFiy/EnwvOvW+uomleQyojIFn6NIDyDghgR
         XwH7Ud7MvQ2uk7HCNkeYZb8G4Zpa4COEHhPw4zGqht5omFkvUnxcLaOqJ0KA2Ohi/Tgz
         A1k5o3iiTu7IF+YkXGofinmq0KwAhxekEOP9ivHeh0DJZIBoe/2/dUc/xbHK7oVNhdno
         YMIy56Zp5BRQFzJAJhqmPmnbJ3o+TeAJntwXv7E8QGwHBbCjaDq2BY2doN6FCTdEWg/2
         92GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xpyVU3ei/AP0KmybjlqX88a6HrifRHguk/VSuzK6yLo=;
        b=kH4cr+rvJIO3pwXW9z+J+48WgxA+s/1bE1zCdx7jE/+0cDdIjhOcnbnZ8cYjZGnvYe
         quUCdacUwsBtKReqKFX8KEpfwFs+e54l0zHJgPodXSljZomJvhbckW5lm1XYK2R7ftIR
         qrvusBfIUdxvnV/QYsUAhF8JxlY+wUOaqPAqNbd3l6URDAfHBYDC9K7lKFRjO8Tnc78h
         DDxf0KMClsMdHp62oXtHQ5Sxe/dBTatNOgN+IC9bkbPs3snfXGqL+PdoReQGQjI3n1Dq
         kwkLponasKNN/3aD5tvy+0RpOVFyKLTdUP+RI4httNSIjwvGGKAbVibDy4bBkZCgEBHf
         NNZw==
X-Gm-Message-State: AOAM5313LHEXvfdhrenYpHZovl2XP11xB02R/TQdbsCYl+ipTFZ3uwIA
        6z6VBGPvgYBFaTa2YioGxOFp+J2eWpoWlE+bio8XrA==
X-Google-Smtp-Source: ABdhPJy4VIZWnscV1Z5U3ENe5sVJSmubutu5e/54rLKoUQ9TLsjSTGstTYauXexlME0HYczpKQNgpC7vEN1H5rzIAmc=
X-Received: by 2002:a05:6102:21b:: with SMTP id z27mr12281035vsp.27.1627945576875;
 Mon, 02 Aug 2021 16:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-5-semen.protsenko@linaro.org> <a1701931-136e-235c-8392-a3f64c050d74@canonical.com>
In-Reply-To: <a1701931-136e-235c-8392-a3f64c050d74@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 3 Aug 2021 02:06:05 +0300
Message-ID: <CAPLW+4mMCzzyqqJTse-UEpjQoVu1b-9Xz3_3L=nmg63uKYFnGw@mail.gmail.com>
Subject: Re: [PATCH 04/12] tty: serial: samsung: Init USI to keep clocks running
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 30 Jul 2021 at 19:32, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 30/07/2021 16:49, Sam Protsenko wrote:
> > UART block is a part of USI (Universal Serial Interface) IP-core in
> > Samsung SoCs since Exynos9810 (e.g. in Exynos850). USI allows one to
> > enable one of three types of serial interface: UART, SPI or I2C. That's
> > possible because USI shares almost all internal circuits within each
> > protocol. USI also provides some additional registers so it's possible
> > to configure it.
> >
> > One USI register called USI_OPTION has reset value of 0x0. Because of
> > this the clock gating behavior is controlled by hardware (HWACG =
> > Hardware Auto Clock Gating), which simply means the serial won't work
> > after reset as is. In order to make it work, USI_OPTION[2:1] bits must
> > be set to 0b01, so that HWACG is controlled manually (by software).
> > Bits meaning:
> >   - CLKREQ_ON = 1: clock is continuously provided to IP
> >   - CLKSTOP_ON = 0: drive IP_CLKREQ to High (needs to be set along with
> >                     CLKREQ_ON = 1)
> >
> > USI is not present on older chips, like s3c2410, s3c2412, s3c2440,
> > s3c6400, s5pv210, exynos5433, exynos4210. So the new boolean field
> > '.has_usi' was added to struct s3c24xx_uart_info. USI registers will be
> > only actually accessed when '.has_usi' field is set to "1".
> >
> > This feature is needed for further serial enablement on Exynos850, but
> > some other new Exynos chips (like Exynos9810) may benefit from this
> > feature as well.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/tty/serial/samsung_tty.c | 33 +++++++++++++++++++++++++++++++-
> >  include/linux/serial_s3c.h       |  9 +++++++++
> >  2 files changed, 41 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> > index 9fbc61151c2e..0f3cbd0b37e3 100644
> > --- a/drivers/tty/serial/samsung_tty.c
> > +++ b/drivers/tty/serial/samsung_tty.c
> > @@ -65,6 +65,7 @@ enum s3c24xx_port_type {
> >  struct s3c24xx_uart_info {
> >       char                    *name;
> >       enum s3c24xx_port_type  type;
> > +     unsigned int            has_usi;
> >       unsigned int            port_type;
> >       unsigned int            fifosize;
> >       unsigned long           rx_fifomask;
> > @@ -1352,6 +1353,29 @@ static int apple_s5l_serial_startup(struct uart_port *port)
> >       return ret;
> >  }
> >
> > +static void exynos_usi_init(struct uart_port *port)
> > +{
> > +     struct s3c24xx_uart_port *ourport = to_ourport(port);
> > +     struct s3c24xx_uart_info *info = ourport->info;
> > +
> > +     if (!info->has_usi)
> > +             return;
> > +
> > +     /*
> > +      * USI_RESET is an active High signal. Reset value of USI_RESET is 0x1
> > +      * to drive stable value to PAD. Due to this feature, the USI_RESET must
> > +      * be cleared (set as 0x0) before starting a transaction.
>
> "before starting a transaction" suggests it is related with transaction
> or something before starting it. Don't you need it simply after reset or
> resume?
>

Not sure what you are suggesting. USI_RESET is set to "1" at start up
(means USI block hangs in reset state), so we have to make it "0"
(that's what this code does); only then UART becomes functional and
UART transactions can be performed. And exynos_usi_init() is called
exactly where you hinted: at init and on resume.

Anyway, the whole comment is confusing, I'll simplify and rework it in
v2. Please let me know if I'm missing the point though.

> > +      */
> > +     wr_regl(port, USI_CON, USI_RESET);
>
> You are clearing entire register, not only USI_RESET bitfield. Is it
> really what you want?
>

Yeah, USI_CON[31:1] bits are reserved, and the reset value of this
register is 0x00000001. But anyway, I'm going to rework that code like
this, for clarity and consistence:

8<--------------------------------------------------------------------->8
    /* Clear the software reset of USI block (it's set at startup) */
    val = rd_regl(port, USI_CON);
    val &= ~(USI_RESET_MASK)
    wr_regl(port, USI_CON, val);
    udelay(1);

    /* Continuously provide the clock to USI IP w/o gating (for Rx mode) */
    val = rd_regl(port, USI_OPTION);
    val &= ~USI_HWACG_MASK;
    val |= USI_HWACG_CLKREQ_ON;
    wr_regl(port, USI_OPTION, val);
8<--------------------------------------------------------------------->8

> > +     udelay(1);
> > +
> > +     /*
> > +      * Set the HWACG option bit in case of UART Rx mode.
> > +      * CLKREQ_ON = 1, CLKSTOP_ON = 0 (set USI_OPTION[2:1] = 0x1).
> > +      */
> > +     wr_regl(port, USI_OPTION, USI_HWACG_CLKREQ_ON);
> > +}
> > +
> >  /* power power management control */
> >
> >  static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
> > @@ -1379,6 +1403,7 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
> >               if (!IS_ERR(ourport->baudclk))
> >                       clk_prepare_enable(ourport->baudclk);
> >
> > +             exynos_usi_init(port);
> >               break;
> >       default:
> >               dev_err(port->dev, "s3c24xx_serial: unknown pm %d\n", level);
> > @@ -2102,6 +2127,8 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
> >       if (ret)
> >               pr_warn("uart: failed to enable baudclk\n");
> >
> > +     exynos_usi_init(port);
> > +
> >       /* Keep all interrupts masked and cleared */
> >       switch (ourport->info->type) {
> >       case TYPE_S3C6400:
> > @@ -2750,10 +2777,11 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
> >  #endif
> >
> >  #if defined(CONFIG_ARCH_EXYNOS)
> > -#define EXYNOS_COMMON_SERIAL_DRV_DATA                                \
> > +#define EXYNOS_COMMON_SERIAL_DRV_DATA_USI(_has_usi)          \
> >       .info = &(struct s3c24xx_uart_info) {                   \
> >               .name           = "Samsung Exynos UART",        \
> >               .type           = TYPE_S3C6400,                 \
> > +             .has_usi        = _has_usi,                     \
> >               .port_type      = PORT_S3C6400,                 \
> >               .has_divslot    = 1,                            \
> >               .rx_fifomask    = S5PV210_UFSTAT_RXMASK,        \
> > @@ -2773,6 +2801,9 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
> >               .has_fracval    = 1,                            \
> >       }                                                       \
> >
> > +#define EXYNOS_COMMON_SERIAL_DRV_DATA                                \
> > +     EXYNOS_COMMON_SERIAL_DRV_DATA_USI(0)
> > +
> >  static struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
> >       EXYNOS_COMMON_SERIAL_DRV_DATA,
> >       .fifosize = { 256, 64, 16, 16 },
> > diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
> > index f6c3323fc4c5..013c2646863e 100644
> > --- a/include/linux/serial_s3c.h
> > +++ b/include/linux/serial_s3c.h
> > @@ -28,6 +28,15 @@
> >  #define S3C2410_UFSTAT         (0x18)
> >  #define S3C2410_UMSTAT         (0x1C)
> >
> > +/* USI Control Register offset */
> > +#define USI_CON                      (0xC4)
> > +/* USI Option Register offset */
> > +#define USI_OPTION           (0xC8)
> > +/* USI_CON[0] = 0b0: clear USI global software reset (Active High) */
> > +#define USI_RESET            (0<<0)
>
> Just 0x0. I understand you wanted to hint it is a bit field, but the
> shift of 0 actually creates more questions.
>

After some consideration I decided to adhere to existing style and do
something like this (in v2):

8<--------------------------------------------------------------------->8
#define USI_CON          (0xC4)
#define USI_OPTION      (0xC8)

#define USI_CON_RESET_CLEAR        (0<<0)
#define USI_CON_RESET_SET        (1<<0)
#define USI_CON_RESET_MASK        (1<<0)

#define USI_OPTION_HWACG_CLKREQ_ON    (1<<1)
#define USI_OPTION_HWACG_CLKSTOP_ON    (1<<2)
#define USI_OPTION_HWACG_MASK        (3<<1)
8<--------------------------------------------------------------------->8

The whole reason for those comments was missing public TRM. But in the
end I decided it just looks ugly. Also, this way I can do RMW
operation (discussed above) in more logical way.

Please let me know if code snippets above look good to you.

>
> Best regards,
> Krzysztof
