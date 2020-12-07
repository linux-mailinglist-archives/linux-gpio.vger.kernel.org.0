Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C2F2D1E00
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 00:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgLGXB1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 18:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgLGXB1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 18:01:27 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE41DC061749
        for <linux-gpio@vger.kernel.org>; Mon,  7 Dec 2020 15:00:46 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id w13so7765171lfd.5
        for <linux-gpio@vger.kernel.org>; Mon, 07 Dec 2020 15:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MRIaz/QqwQXKXSXb3nYPYT/g6KDa16uGLes5GkMKucw=;
        b=I3Yudz7nX7p+tWeGi5ph2E0TAva8TL/UBIq0ubmfa3xumuDzsXpp/l8ed6YuW6hNac
         eRz3/aE2Z/qMBQivOjEKOmfa467OY6IEMa4mxTbxHNLjAj3deqCdAfHCcttajzl3B7RT
         IzieTMJEE3NdR6H3itBuhVmVdROVBej5UIN/aPAoEJONTo+lgNjMQgee7f3PWy/6aWvg
         NmOQHSmXAnnjdz93N4lWIxa7Veb2oHKwMJKoud+BhGEHX4fH6VswVWWXsRhhmkLTeXAU
         i5xD/t+14ys1OE2nwpSKhnGXsfnOciVSbamtMQxvIFyoTkcXy7lF5msRj19DT+gt0e6t
         pXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MRIaz/QqwQXKXSXb3nYPYT/g6KDa16uGLes5GkMKucw=;
        b=Gq2bhnr0E+fOxCKFn15b4WEi/wFr5rx3vOdeH0RVK20DtPwWaGoT1BAAEfq4ubBMom
         lQboGg42tY1lkBtCIoYwx/BKIlpIX8eYEQxcL7Dk//JpWNs1wn321lPL7wapGMvK4SQO
         RNqmS+agHZ7Bcl+QYwRNuJiOGW0+w0WYYXZlJWlvTY5urmZi67Li4ipxEQJXior7b3+n
         YhfnYa4tluPTXygo30ZEpzXb+umj7jsOreICn7/+ZadzT0wZ+OoNflbZNp5YiuYRUD5O
         TqItNnGJNUuUvg/dT6ffP6HTAJB2C2QZsmp3dB4SMMBFCMqoKH1lGCF23m+qeayvWlO6
         Mn+A==
X-Gm-Message-State: AOAM5304gtSa6o9sF8X1f8RvMHERAhgRDQejvB5ZcoCuWfN6dnOn+k69
        rzL6McGWzArVk8P5QDqELU1mmWugWcPlMI4E/1e4Dw==
X-Google-Smtp-Source: ABdhPJy2sUGuSdRe+WHjDjkACjfv4ZbpS4pEOJB0KAz1DrrDHq1eFB3zVzh2Pu7z8R1AeVPsyMxOi0snYGph3Deuutk=
X-Received: by 2002:a19:cb45:: with SMTP id b66mr2646521lfg.441.1607382045497;
 Mon, 07 Dec 2020 15:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20201207192104.6046-1-sergio.paracuellos@gmail.com> <20201207192104.6046-3-sergio.paracuellos@gmail.com>
In-Reply-To: <20201207192104.6046-3-sergio.paracuellos@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Dec 2020 00:00:34 +0100
Message-ID: <CACRpkdagTdkMbg=nw-N9KQhsWXqLxofzpD_9YLgpKPBxo0vyhQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ralink: add a pinctrl driver for the rt2880 family
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jason Yan <yanaijie@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Serigio,

I dug around some to try to understand the patch I think I get
it now :)

Squash this with the third patch so it becomes a
"move" of this file, preserving history. With that:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I have ideas, but it is better to move the driver out
of staging and improve it in pinctrl.

Since there might be many sub-SoCs for this pin
controller, what about creating
drivers/pinctrl/ralink/* for this at the same time?

On Mon, Dec 7, 2020 at 8:21 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> These Socs have 1-3 banks of 8-32 gpios. Rather then setting the muxing of each
> pin individually, these socs have mux groups that when set will effect 1-N pins.
> Pin groups have a 2, 4 or 8 different muxes.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
(...)
> +#include <asm/mach-ralink/ralink_regs.h>
> +#include <asm/mach-ralink/pinmux.h>
> +#include <asm/mach-ralink/mt7620.h>

I think in the next step we should move the contents of
rt2880_pinmux_data into this driver, then we can drop these
mach-headers and show the way for the rest of the ralink
chips to push their data down into this driver (or subdrivers)
and depopulate mach-ralink a bit.

> +       p->groups = rt2880_pinmux_data;

So this is where the driver actually gets a pointer to all
groups and functions, and these groups and functions all
come from arch/mips/ralink/mt7621.c right?

I think after this first step we should move mt7621.c
to pinctrl and become a subdriver for this pin controller
and then we can hopefully move the rest as well once
you set the pattern for how we do this.

Yours,
Linus Walleij
