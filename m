Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CD22CA5DB
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 15:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391278AbgLAOib (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 09:38:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388620AbgLAOib (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 09:38:31 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA147C0613D6
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 06:37:50 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id t22so3297876ljk.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 06:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U5JqANZHI6IE63msBOtqjTP9Lnlr40urg8p0rQpF1os=;
        b=nUmBR6Rhr6RwUm/ExCSsIEelcOzUu2enLaU+tVqRNw1b+hIMOq/A0syBqJtsjqD+3g
         Kd1BAoJb5/eLkNWsJqmg22QoTwO6YToOWFgeeiNYGFlpkWRk+98Nf645tUA3/MNJgt1c
         abVbnUZjsTExWTHKhFugK/cEwEUNb5zLcDV0TtyPh6BA70LFaeUbMf4sUvyztf37CMAZ
         BpKBUUViwXZ9dKUDl7iOXPANg5+qlBpGAHFKrOxnnIRtyyPj4Y/BxSdIhsD4crpG30sW
         TfBkcBwOYxIfxbAEtL/mGIq1GFVn6xtsN6I+qAA+WDGagBAEEBYyaN26mHWrHWx8l2sW
         yUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U5JqANZHI6IE63msBOtqjTP9Lnlr40urg8p0rQpF1os=;
        b=ZHBWYzpj34j56m8QdMBa1msUsvI/8ItLONv8lLl4vHMu3zyrrrsarPv73OMC9UMr34
         dTQ40DHtyZ5j5oPQ2O+t/QKoAF2AtJ61eCxj2SznwYFPm0xCAVb63zmJArgdK3abha3Y
         U98kL9pRF+lmbLVW68oYVC1pmw/NtSxdue1lwLngK1qa7l0Kz/Vo8+pp8DXD1BwArzoI
         Qa0lD0FyB6UGh9cASa8e9N1JCJ0xidgZmv9Og3nzGUpzayJDVtftA56nJ/0JfESSZrVd
         XI2+r4mm87cyBKlKvA0Qci7NOqiZ2r8M6Yvtqm7vvhcJ3NsY6XttCJ04xWN2W9PMG89o
         tqKg==
X-Gm-Message-State: AOAM533NStC18DyK1MMv91iWg/zA7k2J/H6LgHRYZFcul+fsPftLMgE1
        pgREJd0erNu7N0RUcIFpGFU+Z5WaU5YlZkF4145yqA==
X-Google-Smtp-Source: ABdhPJwI3mG+5vEbQWTkRy2ZlcHAebtOPhoj2FgTlzifmIeWuXJt4guAi8I8k1kqlc9IN+GThnSimPG/riS27TdNJnY=
X-Received: by 2002:a05:651c:111:: with SMTP id a17mr1447882ljb.286.1606833469260;
 Tue, 01 Dec 2020 06:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20201122170822.21715-1-mani@kernel.org> <20201122170822.21715-3-mani@kernel.org>
In-Reply-To: <20201122170822.21715-3-mani@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Dec 2020 15:37:38 +0100
Message-ID: <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        angelo.dureghello@timesys.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 22, 2020 at 6:08 PM Manivannan Sadhasivam <mani@kernel.org> wrote:

> Add gpiochip support for Maxlinear/Exar USB to serial converter
> for controlling the available gpios.
>
> Inspired from cp210x usb to serial converter driver.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>

This looks good to me overall, provided that it plays well with the
serial port.

One minor notice:

> +enum gpio_pins {
> +       GPIO_RI = 0,
> +       GPIO_CD,
> +       GPIO_DSR,
> +       GPIO_DTR,
> +       GPIO_CTS,
> +       GPIO_RTS,
> +       GPIO_MAX,
> +};

You know the names of the pins...

> +       port_priv->gc.ngpio = 6;
> +       port_priv->gc.label = "xr_gpios";
> +       port_priv->gc.request = xr_gpio_request;
> +       port_priv->gc.free = xr_gpio_free;
> +       port_priv->gc.get_direction = xr_gpio_direction_get;
> +       port_priv->gc.direction_input = xr_gpio_direction_input;
> +       port_priv->gc.direction_output = xr_gpio_direction_output;
> +       port_priv->gc.get = xr_gpio_get;
> +       port_priv->gc.set = xr_gpio_set;
> +       port_priv->gc.owner = THIS_MODULE;
> +       port_priv->gc.parent = &port->dev;
> +       port_priv->gc.base = -1;
> +       port_priv->gc.can_sleep = true;

So assign port_priv->gc.names here as well with an array
of strings with the names ("RI", "CD", ... etc).
This makes it look really nice in userspace if you do
e.g. "lsgpio".

With that:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
