Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20AB3607223
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 10:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiJUI10 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 04:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiJUI1R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 04:27:17 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E0516D556
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:27:14 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id y14so5299337ejd.9
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NZZVthiUsfhuSQCQF/2Kz3M4VDmTpfQlRvTbiOafepY=;
        b=v36u6Zx+Z9iCMEesPTfEFaJQNf/UIR/IGkzaIYkQuXvm8w8CZ646Phdytr4AzQi1m+
         TX8JDCGARVuTApmwjEGn0binwnF7sDpg/mYIzKVDau418a9fTXyt0bglGAqXV95L4b/m
         XIdY0oGWxz//fyB5SeBeqfjrDTCli3q9pFb9Yniw1FBi/EogMVn+TwPkfrPUirPU53SY
         WPgBMPumvYKn28wKWHk/hTgweSimYm3Y+0N3l9QMIn7yJPH54goC5Xc5rZ3hV1kAGHQN
         QrPn5cF1pwvFIeLPrZdwl3IV8pKxJXM0vL2vv5i/a4kgIdGVL0yr0SO+mlOiAvXZyuvJ
         6yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZZVthiUsfhuSQCQF/2Kz3M4VDmTpfQlRvTbiOafepY=;
        b=kDVx+BVUCW8+sdOKLvi2QfjqxJOdG2udna15oGsYuM7KnD46QUQnGRfvNYuP1tDoCa
         GPs5g8DoRdEzfb7n2usMVj+6KHdIwAu1lNermkFurnfmWhFBTBgvWhjHwzvdOi8+yN6n
         dpxeynoa/rFB+PmWIT3y4UKycnSCQUkkzlNdp3ObbOuDnfhDuH3h7/uFkgnGqki//pZx
         UvNaLHwHxk7K8I8CJydzcwYW7pdYDcExR55x+RcJ+IdqUa7DVwCB9czUY64r605fqrFB
         B4MurDZrvSzBd5fRYu9Xp7Slw4uq9nXMnAh9C0Hzq+CBt8pOK/PRsXW+FFJMGcrmV8SI
         GmNw==
X-Gm-Message-State: ACrzQf1mZS0NeenjRGoWF8lLQrE68J1QuZ47j0Ti9BoTTsbORmw65q5e
        papqiEaGtQANxCEkB8Hic8ePdhV518Uobq9JmNfIeg==
X-Google-Smtp-Source: AMsMyM4J2JvAflrC06L/U2vIYE2FhpntoqRXP7GwQ6oK/QB+8ORhydUcw8PaegivA9Cw98BZArn//1/E/qa6LuU5gPM=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr13674851ejc.690.1666340832730; Fri, 21
 Oct 2022 01:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221007152853.838136-1-shenwei.wang@nxp.com> <CACRpkdaKncznz5qej6owA2OGMeqbrif9e_QO3CWN6+sGhEApDw@mail.gmail.com>
 <PAXPR04MB9185AE67BF20108CFBF0546289299@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CACRpkdZ1hCZ1WoTQ0e584bQxEyBWq9gkZKPPFnm85QnMnNyvHQ@mail.gmail.com> <PAXPR04MB9185639BA2F9D61FB935741589289@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185639BA2F9D61FB935741589289@PAXPR04MB9185.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 10:27:01 +0200
Message-ID: <CACRpkdaa0=m9FNiV+3XJ7MUGF4eJxc5mNVKUEUn_d8SMBiOTSw@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 18, 2022 at 9:42 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:

> #define PINCTRL_PIN(a, b) { .number = a, .name = b }
> #define IMX_PINCTRL_PIN(pin) PINCTRL_PIN(pin, #pin)
>
> The imx8qm_pinctrl_pads array gives each PIN a string type of name.  The array I defined in
> this patch adds another dimension information of the PIN, which is the GPIO index. These
> two are not duplicated information.
(...)
> The purpose for the array here is to record the relationship of a GPIO line with a PIN.
(...)
> From the PINCTRL driver, you may get the information regarding a PIN's Mux status
> and something relating to the signal settings like pullup/pulldown/drive strength. So
> you can know if a PIN is a GPIO function PIN or not, but you can't know which GPIO port and
> which GPIO line the PIN belongs to.

Cross-referencing GPIO line numbers to pins/pads is literally the
job of gpio-ranges (the DT property) and we have excellent support in
the GPIO library to do exactly this.

It can even be made using static data in the driver if gpio-ranges for
some reason cannot be encoded in the device tree.

(...)
> In order to build up the cross-reference between GPIO lines and the PINs, you need
> have a pre-prepared gpio-ranges mapping in advance. Because the relationship between
> the PIN and the GPIO line is not a linear, you end up to build up the gpio-ranges in the same
> way like the array in this patch. This turns to a chicken-egg problem.

I don't get it. gpio-ranges can contain any number of "holes" and whatever,
the name "rangeS" (plural) implies it can be an array of ranges. If you want
you can have a list of single-pin ranges, no problem.

> As I explained above, this is not the duplicated information. It adds another
> dimension of a information regarding a PIN. As these information is standalone
> and self-contained,  no matter how you change the pin tables, it won't impact
> the function here.

Since the information/setting pertains to an electronic or similar property
of a pin it falls under the pin config umbrella.

> This is a kind of GPIO wakeup function, and it happened to be given a name called
> pad wakeup. From the user point of view, it works the same way as the native
> GPIO wakeup. Except the name itself, it has nothing to do with the PINCTRL.

Hardly.

The MMC/SD card bus has ways of waking up devices by pulling a line
low, as does things such as UARTs. And then the pin isn't even used as
GPIO.

I bet a million to one that the exact same setting is used inside the
SCU for waking up on such events on the pins.

I don't believe that just because a pin is muxed to something else than GPIO
it cannot be programmed to wake the system up.

If you look into my presentation "building GPIO and pins from the ground up":
http://www.df.lth.se/~triad/papers/pincontrol.pdf
see the picture on page 13 and page 18. The asynchronous edge detector is
what takes the system online in sleep. That is a property of the pin
cell, it has
nothing to do with the GPIO block, which is further in.

It belongs in pin control because it is a property of the pin hardware.

> As I explained in the above, this is not the problem of two clients accessing the same
> resource, so there is no conflict between the two drivers. It works in the same way
> like SCU power domain driver and SCU clock driver. The communication integrity is
> guaranteed by the call of imx_scu_call_rpc itself.

I understand that it makes your life simpler to just implement this as a hack
in the MXC GPIO driver like this, but it is not a proper solution, and I ask you
to do the more complicated and work consuming task instead.

This is because it will have partitioned the problem in a clear way that is
recognizable by the maintainers and will scale to other SoCs in the future.

I also wonder where all the other i.MX maintainers are. I need their input
in this discussion.

Yours,
Linus Walleij
