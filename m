Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4878838E205
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 09:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbhEXH4u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 03:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbhEXH4s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 03:56:48 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4242C061574;
        Mon, 24 May 2021 00:55:18 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id k5so14370357pjj.1;
        Mon, 24 May 2021 00:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m1J/Jo+r8mKr38XIJ9QtR6SB9IFiAQBUxXoKzYHmwE0=;
        b=QXIpB+SG0A8zH+V/w3KQ2u/djXkMVX/IZX+d9fzo6Csz2xrHLL9p5Q6jTQvg0DUMU8
         WmnYXRnT+V8PgP/7bsaDHFltfIXbbzO6D7WLUhGOqOQM2zKJzG8Vc4lMeGzLY2KuAyWH
         Wg3/o8OJSbQ9PhQgaEeiA6AKMXMFRPX6Mci10ROPQerji7Y4soeHKnc0Woz+JgjhkZJP
         4LcT48gWm8OHyS8g30hmYVMtPEq8hb4Dq5RMK0DYfZXczv5/UXovnfYL3m5MTXj+S/In
         oB44mzjE4W+sREOoqv5COyC+f7zGFw5apYjsNbINuohZjsga1mByKj3npE0wQrbPIbDh
         8mbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m1J/Jo+r8mKr38XIJ9QtR6SB9IFiAQBUxXoKzYHmwE0=;
        b=rIFxd58DCgnXEAWRAIRXMXI4aS5GUnxmZC8P5pKLGd1CXM2emTcCUXeVtFZAvOZGZe
         rnxnuMiTlyuB3tqleych9KpYX6UnxghQcqQsVfMxqZphE7+1RUWvNd62zPMOy1tsvCxW
         fIHTauqSEnY4Wkm1iBqkCxWn+bbx/TAL207D3LuwmJ2tklxJWY7DGCacofM57edCVmPo
         nTWbFiOxPpPQXAbCwvrkJZnlAdpnNzfZmzIX9pI82ZwPmHGH+3Y22dIJWljL4u/P3SFA
         q4HbrvzVEvZzalPiI+i9KFafpNpHik6Pfg3snz6srBS5YXPDnhlnRc+o8xLJi+ctx5yq
         SAEg==
X-Gm-Message-State: AOAM5305V11EUP/88GX0NgH0Hzsb74XednbBHMY4UkMFLRrOxS1dXofJ
        WCdUI7ObZavW6avEfcRKoluqDzWIQyCk6mv+7yM=
X-Google-Smtp-Source: ABdhPJwhv389tH+Fd5hw1e/lij1tH8rmYSXV/xbIpl1M9c+IF8Fu+egL203tyIcW9tF5cw0JtRBntT4s1Vnn665smfU=
X-Received: by 2002:a17:902:bf48:b029:fa:9401:cda8 with SMTP id
 u8-20020a170902bf48b02900fa9401cda8mr2816160pls.0.1621842918255; Mon, 24 May
 2021 00:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621279162.git.sander@svanheule.net> <f1ca940216c0accfc804afee2dbe46d260d890ae.1621279162.git.sander@svanheule.net>
 <CAHp75Vc5a4PsHsJ2sNsRNT7BaBJ=Kxb+KKM7x7jWeRdOS8WfnQ@mail.gmail.com> <33eb043f2ef9d81bbe26876a1c73859f56a8abd9.camel@svanheule.net>
In-Reply-To: <33eb043f2ef9d81bbe26876a1c73859f56a8abd9.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 24 May 2021 10:55:02 +0300
Message-ID: <CAHp75VeVq31q6U+fXGi=ME0Bx5D7V+KiE70JZB4MLy+SbEJP4A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] mfd: Add RTL8231 core device
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 10:50 AM Sander Vanheule <sander@svanheule.net> wrote:
> On Tue, 2021-05-18 at 00:18 +0300, Andy Shevchenko wrote:
> > On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net> wrote:
> > > +       err = regmap_read(map, RTL8231_REG_FUNC1, &v);
> >
> > > +       ready_code = FIELD_GET(RTL8231_FUNC1_READY_CODE_MASK, v);
> >
> > If we got an error why we need a read_core, what for?
>
> The chip has a static 5-bit field in register 0x01, called READY_CODE according
> to the datasheet. If a device is present, and a read from register 0x01
> succeeds, I still check that this field has the correct value. For the RTL8231,
> it should return 0x37. If this isn't the case, I assume this isn't an RTL8231,
> so the driver probe stops and returns an error value.

Right. And why do you get ready_code if you know that there is an error?

-- 
With Best Regards,
Andy Shevchenko
