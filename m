Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4482304D1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 09:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgG1H7Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 03:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgG1H7X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 03:59:23 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEE1C0619D2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 00:59:21 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q6so20100793ljp.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 00:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2KLjPmHtt09LPvfgj7g2oSkZYAImQc8MPSPeld1Rcms=;
        b=KFEJSXKx9mTJGwSqcBgX9mxSd7dWW6zjdmO//1OAFN2wL8ptcszwKLmUWRdauB/drZ
         P0/Sfht9PFKrQzV+yt0IOwAvFsSCZO/6CwE9XZqbLHjuS6W0vPf0RPj4HsXTICSjIVUX
         eGoxDZHZPdWaGfUfaumWHDG25uQt2zVkppRVQhtxMSi1HMWBDuKG6YDFzEBwspwjFNUP
         kJe/NRhAMICeP8BszFzNTfXdbc0k8YjtNIoGr41oyM9EuwK7OswfVcjAUY6UMIrqdg3O
         FcnQBZxFlfZYml/YnFzpstFQZP+zh1PUY1JhO0dbe2X/tW45FlSnIvWQjwlIo8frh3Fs
         mT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2KLjPmHtt09LPvfgj7g2oSkZYAImQc8MPSPeld1Rcms=;
        b=LO0FrZKrKarFGtRYlxU9lgxd/LhKvO/sWYl+r2hZo/UoZ8iXYWRAkUFFkDRjXqrdgM
         5LOy17RXWvfz6xPQfAhdbbwVAK0gan3AhI/zDedyeDhGSlDjtjbXiv7WTi2AHOQnOrUl
         uEuDbV5VYZW6npgK/YRY9Yrh6+2wXrU8wPri/6S+r5+m2oEk4UNxhmoAf1muoqOnsFlc
         Y3gTBBFiXoXxFwbs25an1RbKILJJsE9VkDjmJs7JE7Ey0Ssmu2FbPQ++LzDzleb3HsNM
         ubSHhe90Yp5XpBIk/R7S2cKJW0IlGVFBHhmfQOQM7qmW6n2Bz+8uJWd0ZZ7Jqw/eySyQ
         Bd/A==
X-Gm-Message-State: AOAM532P4OKcgWXX8n/ZhDkcgSZdtE7FfuFz4VDycFjqeuJQIhAHbd5x
        +2N43OF6F+WskdICdBGYv2OJ0R+vEGyvRhL66Da4XA==
X-Google-Smtp-Source: ABdhPJyeAt95Wz+o2VKFP+7wM5gyrPB+KKI+3eQ8R+Ubel9xs84GsZEg7Nm2MffyMAQJb+trStenCPJYstKDh4JFbuE=
X-Received: by 2002:a2e:9d4a:: with SMTP id y10mr7016604ljj.104.1595923160378;
 Tue, 28 Jul 2020 00:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
 <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jul 2020 09:59:09 +0200
Message-ID: <CACRpkdb0=9K4-F2xFWN6OvnOi5-jwLXihdphTgMCA1vTejB_Qw@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] gpio: mxc: Support module build
To:     Arnd Bergmann <arnd@arndb.de>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Anson Huang <anson.huang@nxp.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Peng Fan <peng.fan@nxp.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 12:44 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Jul 27, 2020 at 10:18 AM Anson Huang <anson.huang@nxp.com> wrote:

> > > Why is this driver using syscore_ops rather than
> > > SIMPLE_DEV_PM_OPS() or similar?
> >
> > Below is the original patch of using syscore_ops, it has explanation:
> >
> > commit 1a5287a3dbc34cd0c02c8f64c9131bd23cdfe2bb
> > Author: Anson Huang <anson.huang@nxp.com>
> > Date:   Fri Nov 9 04:56:56 2018 +0000
> >
> >     gpio: mxc: move gpio noirq suspend/resume to syscore phase
> >
> >     During noirq suspend/resume phase, GPIO irq could arrive
> >     and its registers like IMR will be changed by irq handle
> >     process, to make the GPIO registers exactly when it is
> >     powered ON after resume, move the GPIO noirq suspend/resume
> >     callback to syscore suspend/resume phase, local irq is
> >     disabled at this phase so GPIO registers are atomic.

This looks like it would have been easier to use
SET_NOIRQ_SYSTEM_SLEEP_PM_OPS
as pointed out later...

> The description makes sense, but this must be a problem that
> other gpio/pinctrl irqchip drivers have as well.
>
> Linus, could you have a look? I see these other pinctrl drivers
> using SIMPLE_DEV_PM_OPS:
>
> drivers/pinctrl/nomadik/pinctrl-nomadik.c:static
> SIMPLE_DEV_PM_OPS(nmk_pinctrl_pm_ops,

This one does not involve IRQs rather calls
pinctrl_force_sleep/default which sets up hogged
pins for energy saving while sleeping.

> drivers/pinctrl/pinctrl-rockchip.c:static
> SIMPLE_DEV_PM_OPS(rockchip_pinctrl_dev_pm_ops,
> rockchip_pinctrl_suspend,

Pretty much the same as Nomadik, with some extra
register (also not IRQ-related).

> drivers/pinctrl/pinctrl-stmfx.c:static
> SIMPLE_DEV_PM_OPS(stmfx_pinctrl_dev_pm_ops,

This one is problematic. However this is on an I2C
expander meaning the slow bus traffic needs to be
working and if IRQs are off at syscore suspend/resume
time, I2C will not work. I think Amelie has tested this thing
pretty thoroughly, and that expanders are less sensitive
to this.

> drivers/pinctrl/qcom/pinctrl-msm.c:SIMPLE_DEV_PM_OPS(msm_pinctrl_dev_pm_ops,
> msm_pinctrl_suspend,

This one is like the Nomadik: just forcing some hogs to
go into low power mode.

> drivers/pinctrl/spear/pinctrl-plgpio.c:static
> SIMPLE_DEV_PM_OPS(plgpio_dev_pm_ops, plgpio_suspend, plgpio_resume);

This one is affected by the same problem, I don't know if anyone
really has this hardware anymore, but there are some
SPEAr products deployed so the users should be notified
that they may need to move this to syscore ops.

Viresh?

> It seems that some drivers use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS()
> instead, which looks like it is meant to address the same problem, but
> as I have not used that myself, I may be misunderstanding the problem
> or what this one does.

IIUC that callback is for exactly this, and occurs after IRQs
are disabled and before IRQs are
re-enabled. Again the same problem if you need slow bus
traffic in your callback (I2C/SPI devices): it is not going to work.

Yours,
Linus Walleij
