Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022DF32ACD5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381653AbhCBVMN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348511AbhCBBDM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 20:03:12 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33706C061788
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 17:02:32 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id t9so757059pjl.5
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 17:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+0VUSGFLYK6QWHloiD8y298ROdYOOUYk1IlRpMFRmfo=;
        b=CRwemkUeeRQDrhVpkiPov4BtSxK9bsoGlRXnq/dJd9iKSBkJCXX5XES/HyloT+RRLO
         am60H/0ik0a1HZxTlqBSCipir9xE2E6avzwd+tCdpivhYEFLdR6gLVxQjmmHrELi3Qf0
         qQfHcfdfntwmoAq4XF3h3SNGWMrIT6dKIaBNSYs+FOhczVy/ZV10rU3Bp4PKYH8a25U5
         npy+py42ZFZbOh/+Hr4n1+x2XdLstV6lIYj+xuP3vXEp7mqEAP1fKnus5aC9kdWIXJWs
         tc8s3uVm9OEPfdFpFeQGu2QFD39H/8+Xw6XQkQAc+gsR8pWfJ+VCozXyIkYsfLIii9FJ
         siqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+0VUSGFLYK6QWHloiD8y298ROdYOOUYk1IlRpMFRmfo=;
        b=M7x1/iCiTgBEpK/ZyRvDWAtTDJaa3cLlX71NekA9IZhm8HyQZaAHSg9Aw4nK6wBfxk
         Mm9UfkNc9nL7GmHncbvvC3+wmO5u0eB7PwbFGnp/LOhDuEwuO2GZ8GPsEqsIGx73DUCU
         rNGwehMRxe4QaIgbhUlTWxPcoBmsHJn3nqAY5GCZRA9nf2WQeaIkB8fVOkdX9YsEX1cV
         GhQ9f8b/Rs6ROdGotjXLyMq38H8FTxoxn2Qgzjv02JM4pHNDBYfWj9GSilSHjV4jKMx5
         9A4jm10upsUIxJXD6/c94Zl4o8i/ghdsCeBePhB7LJcew65sYxM8pW33BrEaEq4GoHEJ
         u+pA==
X-Gm-Message-State: AOAM530jfe43qxl+xkQ3GRJAz8wgpK+TE8Yuhcp9Uw+DgF/K+xSbZuoW
        zuB9rgXkQFOMEThhEkB4HfyNmA==
X-Google-Smtp-Source: ABdhPJzedTNcIpv9/QDN3avssVwIFVJxWrkxdxTB+bnuEwPGehr8/eb88Y17vm9Mwc0nDqOQWshkmA==
X-Received: by 2002:a17:90a:8:: with SMTP id 8mr1653128pja.6.1614646951556;
        Mon, 01 Mar 2021 17:02:31 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 134sm19325298pfc.113.2021.03.01.17.02.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 17:02:31 -0800 (PST)
Date:   Tue, 2 Mar 2021 09:02:26 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: support gpio_chip .set_config call
Message-ID: <20210302010225.GG24428@dragon>
References: <20210228025249.19684-1-shawn.guo@linaro.org>
 <CAHp75Vdi1WuZxhBKqGS7xnVzZpBrKwNbXbp5k0Y5ibZ4aAyBrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vdi1WuZxhBKqGS7xnVzZpBrKwNbXbp5k0Y5ibZ4aAyBrg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 01, 2021 at 07:07:03PM +0200, Andy Shevchenko wrote:
> On Sun, Feb 28, 2021 at 4:55 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > In case of ACPI boot, GPIO core does the right thing to parse GPIO pin
> > configs from ACPI table, and call into gpio_chip's .set_config hook for
> > setting them up.  It enables such support on qcom platform by using
> > generic config function, which in turn calls into .pin_config_set of
> > pinconf for setting up hardware.  For qcom platform, it's possible to
> > reuse pin group config functions for pin config hooks, because every pin
> > is maintained as a single group.
> >
> > This change fixes the problem that Touchpad of Lenovo Flex 5G laptop
> > doesn't work with ACPI boot, because PullUp config of Touchpad GpioInt
> > pin is not set up by kernel driver.
> 
> by the kernel
> 
> ...
> 
> >         .pin_config_group_get   = msm_config_group_get,
> >         .pin_config_group_set   = msm_config_group_set,
> > +       .pin_config_get         = msm_config_group_get,
> > +       .pin_config_set         = msm_config_group_set,
> 
> This can't be right. They have different semantics.

As mentioned in the commit log, this works considering every pin is
maintained as a single group on Qualcomm platform.  So configuring one
pin is essentially to configure the group containing the pin.  I can do
something like below, if you think that's easier to understand.

static int msm_config_pin_get(struct pinctrl_dev *pctldev, unsigned int pin,
                              unsigned long *config)
{
        return msm_config_group_get(pctldev, pin, config);
}

static int msm_config_pin_set(struct pinctrl_dev *pctldev, unsigned pin,
                              unsigned long *configs, unsigned num_configs)
{
        return msm_config_group_set(pctldev, pin, configs, num_configs);
}

static const struct pinconf_ops msm_pinconf_ops = {
	...
        .pin_config_get         = msm_config_pin_get,
        .pin_config_set         = msm_config_pin_set,
};

Shawn
