Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDB056026A5
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 10:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbiJRIVN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 04:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiJRIVK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 04:21:10 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362D5937A2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 01:21:08 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id t16so124129edd.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 01:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tlBhycv0qO+B/UR4Tbs6xf7dolFDGt0VcAQLm0zQj48=;
        b=zp6/7E5MJU+2hOjkWqKFn5T5NzclrZwRKtR33QDdgbQU9GU/DK4nuUhzzgJmFCVISV
         C1snUQqK5yO6iIu5z2+dunt2/cpUL5UCyiykb86XSExUduLeKg8q+3CZVI8rO5dkFm/o
         AxXX6REm1g7izhD3UIJoZHmoWPu+hJuuBnJoGKDdMYI+n5Ferb06C7wisvfia/fzT72z
         o/Qh5/vpihUt21pJ92VG4s24s54mrQWMvSzd9Dmyosi9NKjEfRbJgqIVXmY2irQPNvgP
         oTjkhet+p7JEsKus2ynuE2wsYN+EkxVAofaeP8rQw2iVHOeM4jB6lyUx3xlYXTW/UjLL
         Fn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlBhycv0qO+B/UR4Tbs6xf7dolFDGt0VcAQLm0zQj48=;
        b=qjEFczsmfUnYI3Thk7tVtm6nqDQl7evDmxDvHKUd0KIgyf6+FRWGlxkKQrx2kwd8pz
         EOHYDnVv3KIw/6aFbkO1Av7XjjVXbXcboI6XF6IcPA14rvTK+zDOfApak5FteXxboDoK
         2bb74/vkZ3PUpmXsOu4v8uqyG+pzQzYdxfl7RYjgni0Ngx/Cu/K3LGI4wK1JaOd3GHKP
         PPvY4pMGWucBz2Y+oM2HVOuaruFL8dLkC1X9TB3CKKA3c5Gt/Uy7Ve6fqnhhzppyp/wF
         v2ruYKZuxh/5Qqutxk+e3wk+q9ETn7MFuksNHGmxTIGvpIDEY8JtwtzffO/JaUMaykZA
         N+yQ==
X-Gm-Message-State: ACrzQf3qf0/CMvhDBKehpfVtcHsZPP/RYK/HX0fff3rA+mPZMH/RCC0Q
        8AAl1wYuaDlmrxSxRXcSMfSWqEQ5IKXCE0qp0S38Wg==
X-Google-Smtp-Source: AMsMyM4AnR0J5CEoykBYGszN3KnizRR6umUFmm4ObZz5qsZVI/oO361LJtUgvSCoLMQ6J1cgkjH8tEDp7M6FplFNFXk=
X-Received: by 2002:a05:6402:4029:b0:45b:d50c:b9b0 with SMTP id
 d41-20020a056402402900b0045bd50cb9b0mr1535489eda.126.1666081266616; Tue, 18
 Oct 2022 01:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221007152853.838136-1-shenwei.wang@nxp.com> <CACRpkdaKncznz5qej6owA2OGMeqbrif9e_QO3CWN6+sGhEApDw@mail.gmail.com>
 <PAXPR04MB9185AE67BF20108CFBF0546289299@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185AE67BF20108CFBF0546289299@PAXPR04MB9185.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Oct 2022 10:20:55 +0200
Message-ID: <CACRpkdZ1hCZ1WoTQ0e584bQxEyBWq9gkZKPPFnm85QnMnNyvHQ@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v2 1/1] gpio: mxc: add suspend/resume support
 for i.mx8x SoCs
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 3:55 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
> > On Fri, Oct 7, 2022 at 5:29 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
> >
> > > On i.MX8QM/QXP/DXL SoCs, even a GPIO is selected as the wakeup source,
> > > the GPIO block will be powered off when system enters into suspend
> > > state. This can greatly reduce the power consumption of suspend state
> > > because the whole partition can be shutdown. This is called PAD wakeup
> > > feature on i.MX8x platform.
> > >
> > > This patch enables this wakeup feature on i.MX8QM/QXP/DXL platforms.
> > >
> > > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > > ---
> > >  Changes in v2:
> > >  - fix a bug when finding the pad index
> >
> > This:
> >
> > > +#define IMX_SC_PAD_FUNC_GET_WAKEUP     9
> > > +#define IMX_SC_PAD_FUNC_SET_WAKEUP     4
> > > +#define IMX_SC_IRQ_GROUP_WAKE           3   /* Wakeup interrupts */
> > > +#define IMX_SC_IRQ_PAD                 2    /* Pad wakeup */
> > > +
> > > +#define IMX_SC_PAD_WAKEUP_OFF          0
> > > +#define IMX_SC_PAD_WAKEUP_LOW_LVL      4
> > > +#define IMX_SC_PAD_WAKEUP_FALL_EDGE    5
> > > +#define IMX_SC_PAD_WAKEUP_RISE_EDGE    6
> > > +#define IMX_SC_PAD_WAKEUP_HIGH_LVL     7
> > (...)
> >
> > > +const struct mxc_gpio_pad_map imx8qm_pad_map[] = {
> > > +       /* GPIO0 */
> > > +       {  0, IMX8QM_SIM0_CLK},
> > > +       {  1, IMX8QM_SIM0_RST},
> > > +       {  2, IMX8QM_SIM0_IO},
> > > +       {  3, IMX8QM_SIM0_PD},
> >
> > this is pin control.
> >
> > I think you need to think about adding this to the i.MX pin control driver instead,
> > possibly cooperaring with the GPIO driver.
> >
> > I'm not entirely certain about the relationship between MXC and i.MX so correct
> > me if I get this wrong...
>
> This is not pin control.

So when something in a driver starts to enumerate all the pads on a
system and assign
them properties, I tend to think it is some kind of pin control.

You have things like this:

+const struct mxc_gpio_pad_map imx8qm_pad_map[] = {
+       /* GPIO0 */
+       {  0, IMX8QM_SIM0_CLK},
+       {  1, IMX8QM_SIM0_RST},
+       {  2, IMX8QM_SIM0_IO},
+       {  3, IMX8QM_SIM0_PD},
+       {  4, IMX8QM_SIM0_POWER_EN},
+       {  5, IMX8QM_SIM0_GPIO0_00},
+       {  6, IMX8QM_M40_I2C0_SCL},
+       {  7, IMX8QM_M40_I2C0_SDA},
+       {  8, IMX8QM_M40_GPIO0_00},
+       {  9, IMX8QM_M40_GPIO0_01},
+       { 10, IMX8QM_M41_I2C0_SCL},
(...)


Which is duplicating the same defines in
drivers/pinctrl/freescale/pinctrl-imx8qm.c:

static const struct pinctrl_pin_desc imx8qm_pinctrl_pads[] = {
        IMX_PINCTRL_PIN(IMX8QM_SIM0_CLK),
        IMX_PINCTRL_PIN(IMX8QM_SIM0_RST),
        IMX_PINCTRL_PIN(IMX8QM_SIM0_IO),
        IMX_PINCTRL_PIN(IMX8QM_SIM0_PD),
        IMX_PINCTRL_PIN(IMX8QM_SIM0_POWER_EN),
        IMX_PINCTRL_PIN(IMX8QM_SIM0_GPIO0_00),
        IMX_PINCTRL_PIN(IMX8QM_COMP_CTL_GPIO_1V8_3V3_SIM),
        IMX_PINCTRL_PIN(IMX8QM_M40_I2C0_SCL),
        IMX_PINCTRL_PIN(IMX8QM_M40_I2C0_SDA),
        IMX_PINCTRL_PIN(IMX8QM_M40_GPIO0_00),
        IMX_PINCTRL_PIN(IMX8QM_M40_GPIO0_01),
        IMX_PINCTRL_PIN(IMX8QM_M41_I2C0_SCL),
(...)

This is blatant code duplication, at the very least we need to find a way
to share this pin library, because it is irresponsible to put the same
information into the kernel twice. You can easily imagine what happens
if one of these pin tables contain an error and it only gets fixed
in one of these two places.

> The wakeup function doesn't change any PINCtrl settings.  On i.MX8
> platform, there is an extra pad wakeup logic and each pin can be configured as the wakeup source
> during system suspend.

So pads, pins, fingers - all these funny names for things like that - those are
handled by the pin control subsystem.

> Because GPIO module is powered off on i.MX8 platform in suspend
> state, the GPIO's native wakeup won't work anymore. This patch just maps a GPIO wakeup to the
> corresponding PAD wakeup, and this mapping doesn't impact or change any PINCtrl settings.
> Also the pad wakeup feature here has a great power consumption advantage comparing with the
> GPIO module's native wakeup.
>
> >
> > To me this looks like two drivers could end up fighting about the control of the
> > same hardware if you don't.
> >
>
> It won't. This patch doesn't interact with any pinctrl relating registers at all.

It interacts with the i.MX SCU and the i.MX pin control does exactly that.

What it does at the end is to call this RPC to set up the asynchronous pad ring:

ret = imx_scu_call_rpc(ipc_handle, &msg, true);

Consider:
drivers/pinctrl/freescale/pinctrl-scu.c

Which also issues a while bunch of imx_scu_call_rpc().

What I think you should do is call into the pin control back-end and have
pinctrl-scu.c handle this for you.

An ordinary vanilla pin controller would use the configs from
include/linux/pinctrl/pinconf-generic.h
but I think the i.MX pin config is custom different, so you need to
figure out what config to pass and how.

drivers/gpio/gpio-mxc.c should however implement gpio line
configuration, somewhere along the lines of:

port->gc.set_config = gpiochip_generic_config;

Then if you look into gpiochip_generic_config you can see that this will
call into the pin controller back-end:

int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
                            unsigned long config)
{
        return pinctrl_gpio_set_config(gc->gpiodev->base + offset, config);
}

At this point there must be a mechanism in place to cross-reference
between GPIO lines and pins, the most common way to solve this is
to use gpio-ranges, see Documentation/devicetree/bindings/gpio/gpio.txt.

This will hopefully end up in .pin_config_set()->imx_pinconf_set, in
drivers/pinctrl/freescale/pinctrl-imx.c which looks like this:

static int imx_pinconf_set(struct pinctrl_dev *pctldev,
                           unsigned pin_id, unsigned long *configs,
                           unsigned num_configs)
{
        struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
        const struct imx_pinctrl_soc_info *info = ipctl->info;

        if (info->flags & IMX_USE_SCU)
                return info->imx_pinconf_set(pctldev, pin_id,
                                           configs, num_configs);
        else
                return imx_pinconf_set_mmio(pctldev, pin_id,
                                            configs, num_configs);
}

Here one path goes down into the SCU, and there your custom wakeup
config will be handled.

At least this is how I imagine it, the i.MX maintainers need to say how
this should work in their opinion, but code duplication and two unsyncronized
clients sending random messages to the SCU surely is not an
option.

Yours,
Linus Walleij
