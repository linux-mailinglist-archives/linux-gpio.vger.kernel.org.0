Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1089338266B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 10:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233996AbhEQIP0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 04:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbhEQIP0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 04:15:26 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E4EC061573;
        Mon, 17 May 2021 01:14:10 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id a11so2699145plh.3;
        Mon, 17 May 2021 01:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4RsJHAkXM13g+/qrHRXPZI6LQum424LLJFzHPADOTkg=;
        b=ijdufWDWPGznD7QEMu3dOT+uzMupZ0bWeJoCCehjcbjWi5nZ8sEjO/238STVhDt/VA
         nlIIS6alNXavim6RtzW/ULyvmEYcTFZ728Ig0dA3f+zFGKS1B2YlT0HiTAK3iCjEYbhE
         Pcn9mxqBqbv7cTXorHb0AGPoV2nkUsWqe9U8N4WUXn9WUNkv2P7hwfSPIC5cRhBqYETO
         VIrKYlJyjpLgF7mGvPzU99DB4Ccw/z9i6QOitrrTKJWp8ffwwlJpn0NDwJyYYgWpIwUp
         nrhVcA0dshY1GTxmWx06wDwhgIc4v2cDtLFqF1r3KHQpfWT63k+ReawdqpMJP3ZlBTMU
         zofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4RsJHAkXM13g+/qrHRXPZI6LQum424LLJFzHPADOTkg=;
        b=aaiIEAPMvD2gFmmm5PKJ9PTdHAC28bibePPmtjYGU5FNM2bvAShq+FZpnO0J8KaUOQ
         NKOQQCPvx/iz5HeC1gElT7bYtKd3SuvhNNUCDt9ywaHBDltX9oTd4SPtODUnqQckC0m+
         560v/NU73rSpr17Tu859VAOxsDY0Ga28xgyu5EWyGZCFwK/+IOdoZ0ONeMD08YfbEWvT
         8pgXFKEqqTFsCofxY2LdEofEQDhnfJzFTdZKd14Xz2Pm/DK46baamvYnjTya/eSGxgI5
         TWNxH9k7sGPBUkjGhEhtvSJutMfwJx6VuyD3+66Fnf3lgOmBq+UBl74/dvz34ElSRQpD
         YPDA==
X-Gm-Message-State: AOAM530B7s3CVjA4/dubzhW0SaiKtp28G+a/5A5w4s2p4NoozHeVD/IL
        b2r9kid7JbFUASWPDZU9xhskHKAB8vYI50XQ/G8MbEMQFfI=
X-Google-Smtp-Source: ABdhPJwfykSolhqvWJ+YlKXhqn13Qc5iEjFXiZuhIO/gwNJuDK8GoDS8r31itW8qiQuCa4uObrLYpwbmPoUsLqXpxz4=
X-Received: by 2002:a17:90a:6c23:: with SMTP id x32mr30526126pjj.228.1621239249794;
 Mon, 17 May 2021 01:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <CAHp75VffoKyyPJbdtKMLx575c9LT0S8+EHOk7Mw36j=aTL6Q4Q@mail.gmail.com>
 <b7d39a26bc3a90de4d8e4fdbf8f944de43d12a56.camel@svanheule.net>
In-Reply-To: <b7d39a26bc3a90de4d8e4fdbf8f944de43d12a56.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 17 May 2021 11:13:53 +0300
Message-ID: <CAHp75VdS63n55b3RG7ZL1=uVgB=7ZiBtTOmV0t+5hw6xKoLFSg@mail.gmail.com>
Subject: Re: [PATCH 0/5] RTL8231 GPIO expander support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 12:40 AM Sander Vanheule <sander@svanheule.net> wrote:
> On Wed, 2021-05-12 at 18:29 +0300, Andy Shevchenko wrote:
> > On Tuesday, May 11, 2021, Sander Vanheule <sander@svanheule.net> wrote:

...

> > I have several comments to the series, but I may give them next week.
> >
> > Just couple here:
> > 1. If subsystem provides a regmap API I would suggest to use it, I.o.w. try
> > again to understand what is wrong with MDIO case.
>
> Are you referring to the MDIO regmap interface, or the GPIO regmap interface?

MDIO

> For the MDIO regmap interface, I have been able to resolve the Kconfig
> dependency issue. So I can reintroduce that, if that's preferred over the
> solution in this v1.
>
> With an extra patch, I was able to use the gpio-regmap interface, dropping most
> of the GPIO code. The current gpio-regmap implementation makes the assumption
> that an output value can be set while a pin is configured as an input. That
> assumption is invalid for this chip, so I had to provide an extra flag for
> gpio_regmap_config, similar to how this is handled in gpio-mmio.
>
>
> > 2. Please, switch to fwnode API in LED driver
>
> Since you had the same comment on my previous patch set, I had already tried to
> this this into account as much as possible.
>
> There's a few things I couldn't find the fwnode-equivalent for:
>  * I use of_node_name_prefix to enforce the naming required by the binding. I
>    could just walk over all (available) child nodes, which would be mostly
>    equivalent.

AFAIU the LED traditional bindings is that you define LED compatible
nodes and all child nodes of it are the one-per-LED ones, there
shouldn't be others.

>  * To get the address of an LED child node, I use of_get_address, since this
>    appeared to provide what I want to do: get the address of the node. I know
>    next to nothing about ACPI. Does the equivalent exist there? Or am I taking
>    the wrong approach?

What are the means of an address in this case?

> I have updated patches ready, if you would rather just review a v2.

-- 
With Best Regards,
Andy Shevchenko
