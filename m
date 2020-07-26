Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B12822E15F
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jul 2020 18:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgGZQfL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jul 2020 12:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgGZQfL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jul 2020 12:35:11 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D75C0619D2;
        Sun, 26 Jul 2020 09:35:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mt12so450045pjb.4;
        Sun, 26 Jul 2020 09:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8voVJsDZ/x6rxbdF+Ob6Fh+jKZhP3BmoIaT4W44hxwE=;
        b=KkYpNh/cSOnYCe2mDU0mmBa7FCJ+4I/3s0i9OjIKYBlwABEnO7g9UMutLLPsQCUJMz
         EuDNyL1yH7Zjr8JONCnuO+34FbHJf4YanGOSCs2QQApAtLByYRn0bT5EhzkyU0j1xgso
         uFh385Fgeo9/FxeB0QHJLFqekhc/7TWfP/iBTk09rkdbFmk/gPoZTZswWKOGWipWNFbd
         6NEyvUAOk1I8hmVLXJuyFozSUeAWJKJJkzkogLZ1yVA00DDsTcesZenfdFSIiqfymVrC
         Y41DeR2tYYbh4mpr/PKKgZ4GofdxmOylpn28vD6sxSlSPnrmuBVJoQHC0Qqa+LbFs7d1
         Z58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8voVJsDZ/x6rxbdF+Ob6Fh+jKZhP3BmoIaT4W44hxwE=;
        b=QJQ6GWaYCCIpxGt4jaYvNkIrkT/RI9rMJAtzw8nxg7tAqNHcX4MFYZBM9+xaKpC1Bn
         +Ry4TBuzCjgdGvhjH692wA7mFyOAqRAKGedeFLF+DmYLGwA1pKwftuuMZUSBLi9CEFTs
         wwd2WjkInyG4U2wiZxSJbGtcHOeyLCbRz9WiV+PWQcjVto1dR9juolndRgrZI48jPAoq
         mBE5pj11xaxp7gly38V9woat9F8rhjMgCZ/qCtH7cPBj1NF56eRqmQTf/Q8DodjpEqS5
         PUFnoF76dL0VQryviYNa0jY5fDWJQoOfCT+NhDAj21WTNdGC3DmpbTjErPs6aumTNM8z
         Pqsw==
X-Gm-Message-State: AOAM530s/mv5ZBICcb4glZ5F/EvNhKtqeLmkYZ88rxbvA2/X/svDbgcJ
        bgqqzkvJh48SrGPQPDh5WSB23ylZvlAxcnTq4KWIVWFm
X-Google-Smtp-Source: ABdhPJx0gm/zxl5XQMhhtnLnDmrDp87FFz/+XzYlVW5K8oQ3zwcVYswESH7l91aR7OOE7soE3uZFlcmFutDawFveOZg=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr14631499pjb.181.1595781310704;
 Sun, 26 Jul 2020 09:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200607162350.21297-1-mani@kernel.org> <20200607162350.21297-3-mani@kernel.org>
 <20200701130206.GD3334@localhost> <20200726155223.GB12036@Mani-XPS-13-9360>
In-Reply-To: <20200726155223.GB12036@Mani-XPS-13-9360>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 26 Jul 2020 19:34:54 +0300
Message-ID: <CAHp75VeP8CMZ-T2Kk24NzOPiWHM62GErxCDUgBbYzNotwiFHhw@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 2/3] usb: serial: xr_serial: Add gpiochip support
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 26, 2020 at 6:53 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Wed, Jul 01, 2020 at 03:02:06PM +0200, Johan Hovold wrote:
> > On Sun, Jun 07, 2020 at 09:53:49PM +0530, Manivannan Sadhasivam wrote:

...

> > Same here. And perhaps just ignoring the pins managed by gpiolib is
> > better (cf. gpiolib and pinctrl being orthogonal).
>
> You mean, we can just make TX,RX,CTS,RTS pins controlled only by the serial
> driver and the rest only by gpiolib?

I'm wondering if you may use mctrl_gpio_*() API instead.

-- 
With Best Regards,
Andy Shevchenko
