Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4240030AE06
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 18:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhBARhm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 12:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbhBARhk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 12:37:40 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933A7C061573;
        Mon,  1 Feb 2021 09:37:00 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id c132so12559577pga.3;
        Mon, 01 Feb 2021 09:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H6yx9f8R2sg1FqRwpipM1vmfkjs77ldyQGrFxy8CsBg=;
        b=aUPFPwy7bk8XQTFX4LTmfLI15xsOY1AB9KwIyquDIx3B9CGHR1g1KRI3shDk/dQ8qJ
         c+AI9gSFAv6oj2/HwaRqGUGu1T+OxEOlXtELOc4xM3fo/m0UwI5newp8OzHOBexS1yQC
         C5SV6vvxxuOXyUVu4WPYIlrSUnZj/UOlgGJPWa87wxEU7rpZoArUv2XW+EeLGP/sY3k1
         l1MQ94WwhuwUZGrzD/1XxrYMyPeHUfNrz0hyj7txBQR7/0EDUghyGe3nYunTm3QTS0pw
         3J+3tndyRm8xRaH1t/S4AtNuOBnq/irjg3B+zE++fmmp11FYlsZ1LBsWTQdSAjnKg9LX
         tBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6yx9f8R2sg1FqRwpipM1vmfkjs77ldyQGrFxy8CsBg=;
        b=MVSlsojRUFjRIeljzTbzRHwnVy/VAW3TcWryuW5FsL22fTP8bzpRG6qlo+OqsVV5gb
         W1eZ+AJp9nHgTRrzawpWS56+LzHTlJKJ4iOhb0gIMaICCdOWIEiJdSlCVCg+TIG+RVXK
         zG2SOBGdBqDQkJU37euO50V7t17EqczN+f/e0qQTW5UrySL/93CV0TX/6wLlL1dH100V
         /PtD+WSGg3A6V4RaU5+Ks0hfk+OZRFtY1YmVJpngNwWFGxo4U93T89d3d24KXXZdpId/
         e6XEkARAiaNFuLBBTLTAjaG6Kgoq0pmLtVHVKBEWFGcRLLfTSjVNKdEfjAPGf0oasxNH
         0rXg==
X-Gm-Message-State: AOAM533O4pr6HKRRqWwWlrmoxZpI0ZeZY27DbzP6IqQ0ahJA7GVYBolV
        d0gGhf77ET0i19+ExSmhaEZwdlHFLp9FqGqkko4=
X-Google-Smtp-Source: ABdhPJxtFEacJKNWoE68wQFPva1Sfqinywa2s95tLxO3Sm2MvplTvKstr/63TPBCDpTQFTU6h9vE6f7TR9SJlaC5DL0=
X-Received: by 2002:a62:5a86:0:b029:1ae:6b45:b6a9 with SMTP id
 o128-20020a625a860000b02901ae6b45b6a9mr17081018pfb.7.1612201020053; Mon, 01
 Feb 2021 09:37:00 -0800 (PST)
MIME-Version: 1.0
References: <20210129081917.1808218-1-quanyang.wang@windriver.com>
 <CAHp75VemJWQDKFFrrCKWnUGHFiPhuh=4Aqhn8T6qF5yuMOCOKg@mail.gmail.com>
 <02e614e9-fe2f-d7b2-6c47-2431475780ed@windriver.com> <CAMpxmJWNJ3MVT58nKhkzNDtr39Tr7xPTSKvmcisKY9OBVg7wzQ@mail.gmail.com>
In-Reply-To: <CAMpxmJWNJ3MVT58nKhkzNDtr39Tr7xPTSKvmcisKY9OBVg7wzQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Feb 2021 19:36:44 +0200
Message-ID: <CAHp75VeiN-g9BzFg1st6gJ2tYpev4qOBHUxZXk_eXBEdtvAHzA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: free device name on error path to fix kmemleak
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "quanyang.wang" <quanyang.wang@windriver.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 1, 2021 at 5:50 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Sat, Jan 30, 2021 at 4:45 AM quanyang.wang
> <quanyang.wang@windriver.com> wrote:
> >
> > Hi Andy,
> >
> > On 1/30/21 1:26 AM, Andy Shevchenko wrote:
> > > On Fri, Jan 29, 2021 at 2:01 PM <quanyang.wang@windriver.com> wrote:
> > >> From: Quanyang Wang <quanyang.wang@windriver.com>
> > >>
> > >> In gpiochip_add_data_with_key, we should check the return value of
> > >> dev_set_name to ensure that device name is allocated successfully
> > >> and then add a label on the error path to free device name to fix
> > >> kmemleak as below:
> > > Thanks for the report.
> > > Unfortunately...
> > >
> > >> +       ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
> > >> +       if (ret)
> > >> +               goto err_free_ida;
> > > ...
> > >
> > >> +err_free_dev_name:
> > >> +       kfree(dev_name(&gdev->dev));
> > > ...this approach seems to  create a possible double free if I'm not mistaken.
> > Thanks for your comment.  I didn't catch the double free. Would you
> > please point it out?
> > >
> > > The idea is that device name should be cleaned in kobject ->release()
> > > callback when device is put.
> >
> > Yes, the device name should be freed by calling put_device(&gdev->dev).
> > But int gpiochip_add_data_with_key,
> >
> > when running dev_set_name, "gdev->dev.release" hasn't been installed
> > until in the tail of gpiochip_add_data_with_key.
> >
> > So we couldn't call put_device here.
> >
> > Any suggestion is much appreciated.
> >
> > Thanks,
> >
> > Quanyang
> >
> > > Can you elaborate?
> > >
>
> Andy,
>
> gdev->dev.release is assigned as the very last step in
> gpiochip_add_data_with_key() so the patch looks correct to me. Do you
> still have objections? Maybe I'm not seeing something.

OK! (Sorry, don't have time to look deeper, just remember that netdev
code used to (or still?) have some twisted cases with device
registration and similar syzcaller issue, but in that case it wasn't
so easy to fix.

-- 
With Best Regards,
Andy Shevchenko
