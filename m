Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 120D2620D00
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 11:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbiKHKS4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 05:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbiKHKSy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 05:18:54 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654FA13F67
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 02:18:53 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v27so21726878eda.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 02:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gFvAEqcX2SoKxc0SrRrjfQO/ZDEDZy3wvqZ4CGCRRdY=;
        b=UtRv2ephasNogp/Bf61ydaqIDXXvZ9eWiOJeIzhxKCyfygkFfe8X5PK/ZiWJLHFmwK
         PMCVKjgbaCXHtRBQYpK8KjfDRli28GpClwLzcB0Lx3HG8Zu5ajbezFqGqZCIWPaTc45y
         1hIAaSwL4i4jcB82qANzHwrmJB8m0c0R0q+OocobN4rGN0z4z5LJ9z18jwfwuIvaMZAK
         usPE0+X9egrm5dDnqgUhQe2gOvSylQZOKU1j0slSdn/Xpz6mSnPKxu4rOlV5hbFk/PQj
         umNginHwdoAexGLQ9kklqwEnp0ar/5US7blA8jzkp4L0KzgU/sL9dO7E7fUUXMT4A4w5
         KCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFvAEqcX2SoKxc0SrRrjfQO/ZDEDZy3wvqZ4CGCRRdY=;
        b=7EQbn3W3UzEgV1aMAAxuI32On66FPd5wyd1h+CaXZHfBZVpY5asj1qvHM+qX/USYIN
         S/09pU8I19B8eDfUf6JgZ8ZLBjB2kPV4U662dmYkZckoNQeHFJH9YH9Tz1MGfkRb+FkD
         m4stX80rfUaEgSMYfLMi3ASN0qjencke/V+W3Uaew9Wfz7nXsBO0PV7ycBUG9oMyPguE
         +xZc5C5eHMU6zTN504AcFBZZd9RYT8BN7hTmcraGHPQZa0f9mcp1vl8cYlamkJWLGtZY
         xUj2kX6vo26iuzTsV+qiCn9A8ftbFUWjw0MHwfbHiptFqbDpl6Hc7W4fXzcik7TYyH4W
         NDjQ==
X-Gm-Message-State: ACrzQf3P3CRSmyPjQocUNtgy+pufbDH11L9eASL7luGTFz+DKhhmcHJo
        CXxtk7PmTq3oKQ5sf+kL+ma6WR+jOelJwsfK4kUksQ==
X-Google-Smtp-Source: AMsMyM7KDr4IoKerd9GxRXQW7LCbeRYZBOMMDpO3SZpyci03ZSKkDAoOOFmW/2XBy+0roMxXeYR4jZqJJ7zKp7LUYhU=
X-Received: by 2002:aa7:d6d1:0:b0:463:ba50:e574 with SMTP id
 x17-20020aa7d6d1000000b00463ba50e574mr37119966edr.158.1667902731962; Tue, 08
 Nov 2022 02:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20221007152853.838136-1-shenwei.wang@nxp.com> <CACRpkdaKncznz5qej6owA2OGMeqbrif9e_QO3CWN6+sGhEApDw@mail.gmail.com>
 <PAXPR04MB9185AE67BF20108CFBF0546289299@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CACRpkdZ1hCZ1WoTQ0e584bQxEyBWq9gkZKPPFnm85QnMnNyvHQ@mail.gmail.com>
 <PAXPR04MB9185639BA2F9D61FB935741589289@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CACRpkdaa0=m9FNiV+3XJ7MUGF4eJxc5mNVKUEUn_d8SMBiOTSw@mail.gmail.com> <PAXPR04MB9185F5AF97CDB15AC8435487892E9@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185F5AF97CDB15AC8435487892E9@PAXPR04MB9185.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 11:18:40 +0100
Message-ID: <CACRpkdbgOoR60G9k5DqzLcrPSX2oJE5wjT+oSZc9+1ihjEtChw@mail.gmail.com>
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

On Mon, Oct 24, 2022 at 5:05 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:

> > Cross-referencing GPIO line numbers to pins/pads is literally the job of gpio-
> > ranges (the DT property) and we have excellent support in the GPIO library to do
> > exactly this.
> >
> > It can even be made using static data in the driver if gpio-ranges for some
> > reason cannot be encoded in the device tree.
> >
>
> The current implementation is using the static data inside the gpio driver, although it
> is not used the gpio-range data structure.

So get to it. Use gpio-ranges and put this functionality in the pin control
portions.

> > I don't get it. gpio-ranges can contain any number of "holes" and whatever, the
> > name "rangeS" (plural) implies it can be an array of ranges. If you want you can
> > have a list of single-pin ranges, no problem.
> >
>
>  No matter you prepare the mapping by using the gpio-ranges or the static array in the
> driver,  they serve the same purpose. The only user to use the mapping is the gpio driver,
> and the mapping is constant for a SoC family. That's why I chose to define the array inside
> the driver.

This is not an excuse to not use gpio-ranges and duplicate code and
data. Switch to using gpio-ranges.

> > The MMC/SD card bus has ways of waking up devices by pulling a line low, as
> > does things such as UARTs. And then the pin isn't even used as GPIO.
> >
>
> That's another kind of wakup method. Currently we are talking about the pad
> wakeup. The examples you gave like SD/UART, they are not pad wakeup feature,
> we can call them as IP native wakeup.

Hm intersting!

> For those IP blocks' native wakeup, they are not managed by SCU. It is managed by
> the block's driver directly. For example, the UART's native wakeup function is
> enabled or disabled via the driver itself, and no communication required for SCU.

OK I was wrong about that.

> > > As I explained in the above, this is not the problem of two clients
> > > accessing the same resource, so there is no conflict between the two
> > > drivers. It works in the same way like SCU power domain driver and SCU
> > > clock driver. The communication integrity is guaranteed by the call of
> > imx_scu_call_rpc itself.
> >
> > I understand that it makes your life simpler to just implement this as a hack in
> > the MXC GPIO driver like this, but it is not a proper solution, and I ask you to do
> > the more complicated and work consuming task instead.
>
> This is not a hack because the imx_scu_call_rpc function is designed to serve multiple threads
> use case. As the pad wakeup function is an independent feature accompany
> with the gpio function, I prefer to put the implementation inside the gpio driver.

Our job as maintainers is to make sure the code is easy to maintain.

If duplicate data is stored in the GPIO driver and the pin control driver
just because gpio-ranges are not used to be able to put the wakeup code
together with the rest of the pad/pin related data, that means more work for
us.

For this reason:
1. use gpio-ranges to reference the pin control subsystem
2. Act on the config inside the SCU pin control driver which already knows
  about all pads/pins.

It just makes more sense for us.

Yours,
Linus Walleij
