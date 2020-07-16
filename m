Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C4C222462
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 15:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbgGPNzM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 09:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728940AbgGPNzI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 09:55:08 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A87BC08C5C0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:55:08 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id o4so3321866lfi.7
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fSYl+obZVE+fUKznzfN+YjGdJqq6f8RfiQS+28i+3lU=;
        b=yW0TqbV2Cmn34g+off5Xzod+BSQ8M1Xw4VxORpFRWUx+wIaEXJJhwqCsu+hmjEWM3V
         PPGCXyWxy+R+W2N+bI0gtgOCetsz7Z1owadn47BzqxHpW9p53Ifhqefkn9j5GEfIVKq5
         fOxjHE3rHiAeMdcJKce8rB8zIiKvTuuGTx67ld8xXchrZVzXBSWAGnbYPold/YYUaAto
         i7EFg+cxceta14JfCDJZ5tHMznT+lsvoaLzdBaO1/+uPiyw92qJ0FxVswVSvg+ZJ9MyQ
         /836A7RemmSD/r7Dt/coNl6VqvR67ATuNOirwQOyk3OYgq/k94bVCxNguezzutd+sM52
         ZEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fSYl+obZVE+fUKznzfN+YjGdJqq6f8RfiQS+28i+3lU=;
        b=T+dPuTTNfhiWjaAIa9ZquiCfd9WqBH85hYH6Q+S8kl9puQvVOheuR242Bj96RjrMp4
         bsFyFMQPCl42HylhjNKIzODm/i1sPH1SioFhz8Gd1/s7qx1Yo1nWD9oGT5r/dQRSnKPk
         1nVub7vvraXsvvZFzTx0QyJyWKHnbtrUBt2qLvI++ynth2w5ySyXshv8u6WD8i05gCN9
         c9R9msv9W5uW4TFyToaY6F2VWt6A/Kyt6n5VTtEG0YhBQ5uvgykHA0LqJ06ZzOTM8cbR
         0O0df+/8E/eKfMruqabLNugsk49KiImSY7KBOxB9tJzAtFTAPHd4cYHlTDBwQ827XR6D
         VKig==
X-Gm-Message-State: AOAM531EPBY1acq+TeqWmhxNR5LPajYVMbqRTobOtSQgWw2HkJMFefd2
        NCoPHhQBD2HGpL1qo5Acy5CsY0g9/rruX3P/KsM+gA==
X-Google-Smtp-Source: ABdhPJzPt8lneTMty4LKVohX0XpVyQrsxGQOfHKHWJDQ5g7QK57hNzDZxOt+c+QzpVfm9NT4EJMpAs/zLD29z0/+tig=
X-Received: by 2002:a19:f20a:: with SMTP id q10mr2210486lfh.89.1594907706496;
 Thu, 16 Jul 2020 06:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 15:54:55 +0200
Message-ID: <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
To:     Anson Huang <anson.huang@nxp.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 15, 2020 at 4:44 AM Anson Huang <anson.huang@nxp.com> wrote:

> > Subject: RE: [PATCH 1/3] gpio: mxc: Support module build
> >
> > Hi, Linus
> >
> > > Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
> > >
> > > On Wed, Jul 8, 2020 at 1:28 AM Anson Huang <Anson.Huang@nxp.com>
> > > wrote:
> > >
> > > >  subsys_initcall(gpio_mxc_init);
> > > > +
> > > > +MODULE_AUTHOR("Shawn Guo <shawn.guo@linaro.org>");
> > > > +MODULE_DESCRIPTION("i.MX GPIO Driver"); MODULE_LICENSE("GPL");
> > >
> > > You are making this modualrizable but keeping the subsys_initcall(),
> > > which doesn't make very much sense. It is obviously not necessary to
> > > do this probe at subsys_initcall() time, right?
> > >
> >
> > If building it as module, the subsys_initcall() will be equal to module_init(), I
> > keep it unchanged is because I try to make it identical when built-in, since
> > most of the config will still have it built-in, except the Android GKI support.
> > Does it make sense?
> >
> > > Take this opportunity to convert the driver to use
> > > module_platform_driver() as well.
> >
> > If you think it has to be or it is better to use module_platform_driver(), I will do
> > it in V2.
>
> I tried to replace the subsys_initcall() with module_platform_driver(), but met issue
> about " register_syscore_ops(&mxc_gpio_syscore_ops);" which is called in gpio_mxc_init()
> function, this function should be called ONLY once, moving it to .probe function is NOT
> working, so we may need to keep the gpio_mxc_init(), that is another reason that we may
> need to keep subsys_initcall()?

This looks a bit dangerous to keep like this while allowing this
code to be used from a module.

What happens if you insmod and rmmod this a few times, really?
How is this tested?

This is not really modularized if that isn't working, just that modprobing
once works isn't real modularization IMO, it seems more like a
quick and dirty way to get Androids GKI somewhat working with the module
while not properly making the module a module.

You need input from the driver maintainers on how to handle this.

Yours,
Linus Walleij
