Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E888832ACEB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383794AbhCBVSN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235316AbhCBK3L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 05:29:11 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC38C061756;
        Tue,  2 Mar 2021 02:28:14 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id g20so11785605plo.2;
        Tue, 02 Mar 2021 02:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pZBuFiSFvwZwFfJYWsagpR2A6eSeQpZJ/5fg5LnhiZU=;
        b=ZIcyDpEBF2JC+ZxX2HNiwAv6Qi/1JKPSg9rXbiUi6omEvd14LzkWWa+3adkH6097bN
         6sQYVGK9mQd8VbqE6IKl2eFVqEwJtzkhER+T4NDDJKV1IJT4c1EbEA6M0S/xixfDu5H+
         CbeWPSz7a2Ncm1b6FW4rRMd8196c24o3oTn77qSLcwpu1nChOb1hRNONuNOocO+TdUgx
         qMTxvEnaB1WSJSntX5z1hWtqJPlOfnxKDLbG6pKpOwMyd+4VpTKA1jVE6hxEcCFN15Wu
         rnN/PiQOGANrTSEeh9sU+nkJbTBtgbtnGAoDBbaL30clcO8AfNn73YUnAzF6mRMoNzv8
         YyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pZBuFiSFvwZwFfJYWsagpR2A6eSeQpZJ/5fg5LnhiZU=;
        b=Y9zVvhXnYT5w1UDQyT/OgxDXCI36DNLdTFOMpiza98mzNsimksCSw9URd+/exqhUCq
         73WOvwZH5VjzJBXxyQaZD0rY593bk6Rev31GuiAPjfQvPVhu3GM3X50FwkDweLw8oGHL
         iDPb8PSei1uusEiynlz1IEtgN0TrYRcv3oKBkb3MXC9qSer3VDN5b6zbqaQGf6X+7QzC
         427R/3idueab7172YyTgJ0aLv1BCLUr46/2bsaZpnCoO1q/xjGZZMpWhxG09Y06abj8h
         Wc1AA3ZKc/gJUA+Yts2MjpfueNZ7bE7DIdBPQwuQ8ufpongqMLcusOIOBJqxSVWgPq09
         1PzA==
X-Gm-Message-State: AOAM532z1f60JAb7Whr39VNuoLtFe00aKviZgIlqEv15V0V8BTCsTuhO
        wHprx0AhUscndhpfaSGt9PVpLT6eR7QoX1PSe9A=
X-Google-Smtp-Source: ABdhPJxl6bjNLv3qtf+ATmlXlF4Bblbnnx+M4xfgVaqJyt16Me8SRd6tl3F0P1TjcGoDrKmliuZQIiLA828MYoZ3n/A=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr3813149pjx.181.1614680893555;
 Tue, 02 Mar 2021 02:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20210228025249.19684-1-shawn.guo@linaro.org> <CAHp75Vdi1WuZxhBKqGS7xnVzZpBrKwNbXbp5k0Y5ibZ4aAyBrg@mail.gmail.com>
 <20210302010225.GG24428@dragon>
In-Reply-To: <20210302010225.GG24428@dragon>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Mar 2021 12:27:57 +0200
Message-ID: <CAHp75VcDF+i1fwEWDFD_6+AgZn6uenobg7RXs-+uc3SSALMDOw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: support gpio_chip .set_config call
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 2, 2021 at 3:02 AM Shawn Guo <shawn.guo@linaro.org> wrote:
>
> On Mon, Mar 01, 2021 at 07:07:03PM +0200, Andy Shevchenko wrote:
> > On Sun, Feb 28, 2021 at 4:55 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> > >
> > > In case of ACPI boot, GPIO core does the right thing to parse GPIO pin
> > > configs from ACPI table, and call into gpio_chip's .set_config hook for
> > > setting them up.  It enables such support on qcom platform by using
> > > generic config function, which in turn calls into .pin_config_set of
> > > pinconf for setting up hardware.  For qcom platform, it's possible to
> > > reuse pin group config functions for pin config hooks, because every pin
> > > is maintained as a single group.
> > >
> > > This change fixes the problem that Touchpad of Lenovo Flex 5G laptop
> > > doesn't work with ACPI boot, because PullUp config of Touchpad GpioInt
> > > pin is not set up by kernel driver.
> >
> > by the kernel
> >
> > ...
> >
> > >         .pin_config_group_get   = msm_config_group_get,
> > >         .pin_config_group_set   = msm_config_group_set,
> > > +       .pin_config_get         = msm_config_group_get,
> > > +       .pin_config_set         = msm_config_group_set,
> >
> > This can't be right. They have different semantics.
>
> As mentioned in the commit log, this works considering every pin is
> maintained as a single group on Qualcomm platform.  So configuring one
> pin is essentially to configure the group containing the pin.  I can do
> something like below, if you think that's easier to understand.

Yes, in your case you must have a selector == # of a pin for each
individual pin (not just declared that you have enough selectors to
cover the amount of pins and beyond).

If there is such a requirement, go with it.

-- 
With Best Regards,
Andy Shevchenko
