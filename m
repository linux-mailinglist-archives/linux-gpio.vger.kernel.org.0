Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F292933C0A2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 16:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhCOP5y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 11:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232445AbhCOP5q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 11:57:46 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD348C06175F
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 08:57:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v9so57674589lfa.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y05LxKqxHARRJz9b41KUmPJQO8MgmeiKWNfuMrL5SJk=;
        b=sg+CBQyG0EjOu0RLfrShAXMw/eoMGUCyFdU3ApyPzUZVu1ZoUxTbmz/aGui6ivYpXH
         kvuF8su3Y4ap3MPR3845uPRC9oASkjOYntE5efRPKCwArsq1lC02nJEyQpC/3isyQgr0
         5tgBmSz/41MgYy+cPQB6z1GWEv5ltp+lMmGj6QMmJVJSPFnV3y8IY4S8hdJkMEHccjD0
         KxLbqpfobp9IGnahjh1O/qkoqsimBu61rQWnWo4iHOPmxfk0QgyQVD81jDbdUHJRqKHN
         Sbv0uJJnNq0QyR6kR93rH6ylHh6X//AGKnrCt3UTJuSffK7yNbT1xQ0FBT/p997oWOFF
         o+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y05LxKqxHARRJz9b41KUmPJQO8MgmeiKWNfuMrL5SJk=;
        b=mXQ9vdyWo601NM+V//d/L3dTS/pVmPwnDtqzAKO6U0uODNO3ayqOyF8IwBm/KFK9sj
         hYshR658Zu544cqpao1QrGGEBEPzJ5fJNh6qh3JcGWp3lW1rb01wALCl17ptHUKRGHOK
         SjDyUZmuqhWXk44ZzKp4FT/UJBK/nRBzAYGW2cnKsc7FNh2IA9oBIsigpl/NWtYM5ppL
         8E0UfZ8ii4dmjyYtlqFJWQ+VYVU/FihtVdelEWZjUdxbXiJqnO9MnIaPqtkqhx5KYOkI
         wlPpE3iALT3iAYnaed6hlcaw35jdbZ5l+E/ZifEUEZT04EolbUfRLSUIjitdYldg5x61
         6d7A==
X-Gm-Message-State: AOAM5316QTDDAhhfXYyW6prXKigj3Bf/HSoAMMaeOBqOlg0ONNPe39S3
        E026qkdeJW1d5alfPtm3zqDHe7XqtZ99IemAxxqWhQ==
X-Google-Smtp-Source: ABdhPJxRhR8dLQ9brlpYFBH8NsT25ShjMtXNo8KXS6U7zOznqlJQR3PVgtOqbNDaDQFjsxiQnxKHDxYzuKLrzXEmuS8=
X-Received: by 2002:a05:6512:74a:: with SMTP id c10mr8496071lfs.586.1615823864353;
 Mon, 15 Mar 2021 08:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210310125504.31886-1-noltari@gmail.com> <20210310125504.31886-5-noltari@gmail.com>
 <CAL_JsqK4b+U7cVb04+moB4biGVFC4mr3VGx70KdQKitiCGdtnQ@mail.gmail.com>
 <A2B4813E-4177-4969-9119-A40B39A36948@gmail.com> <CAL_JsqL+CwnhKY4bijnp7eGfYLwRpDUK+iFharVW=DWipsvZbg@mail.gmail.com>
 <693A763C-14D1-47A2-A87E-2358E69DC993@gmail.com> <CAL_JsqJzDj6bKwEfWzoa_m8HjP2VbZH21wYXXEUUEmLwHjrY_A@mail.gmail.com>
 <90994df6-9d7d-686f-8668-a1cf5267aa16@gmail.com> <CAL_JsqK_00BQ4DkO8KUF1+TzxwCfU-=9tck7gdFL3Fh6mktHMg@mail.gmail.com>
In-Reply-To: <CAL_JsqK_00BQ4DkO8KUF1+TzxwCfU-=9tck7gdFL3Fh6mktHMg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 15 Mar 2021 16:57:33 +0100
Message-ID: <CACRpkdYDRHkwfgefWzzU781EPWg3Caw8wFTCtud81UAE0QuE7g@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] dt-bindings: add BCM6328 pincontroller binding documentation
To:     Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 11, 2021 at 7:14 PM Rob Herring <robh+dt@kernel.org> wrote:

> > Or this way (2):
> > syscon {
> >         compatible = "brcm,bcm6328-gpio-regs", "syscon", "simple-mfd";
> >         reg = <0x10000080 0x80>;
> >         ranges = <0 0x10000080 0x80>;
> >
> >         pinctrl: pinctrl@18 {
> >                 compatible = "brcm,bcm6328-pinctrl";
> >                 reg = <0x0 0x28>;
> >
> >                 gpio: gpio@0 {
>
> This doesn't make sense IMO because GPIO is not a sub-function of the
> pinctrl h/w. They are peers.

This becomes an ontological discussion, as in "what does the world
consist of and what are the proper definitions of the
things in it".

A couple of years back I had this presentation:
https://dflund.se/~triad/papers/pincontrol.pdf
where I try to investigate how hardware engineers build
these blocks.

TL;DR: it depends on what the hardware engineer
did.

A HW block can be pin controller, GPIO controller
and interrupt chip at the same time, that case is
straight-forward. One compatible, lots of
properties.
.
A second case is when the pin controller and the
GPIO+irqchip are two completely different HW
entities, and then they also get two different
device nodes on the same level in the device tree.
(We usually see this when the different blocks
live in totally different memory locations.)

However in the third case HW can also be bolted
with a front-end pin controller (facing the pins) with
several GPIO+interrupt controller back-ends.
Then it gets the structure in this patch,
subnodes for each GPIO controller.

Our current bindings have all three examples
and it simply reflects the different ways HW
engineers have chosen to integrate their stuff.

Yours,
Linus Walleij
