Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C00022E6EF
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 09:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgG0Hu5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 03:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgG0Hu5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 03:50:57 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421DEC0619D2;
        Mon, 27 Jul 2020 00:50:57 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id z5so8985473pgb.6;
        Mon, 27 Jul 2020 00:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HvRchyhkxeOLvzDuOrbaCYZ/zyb156MiLRE1ABCH84I=;
        b=KHuKlq97lOmpgvmfdymhvpN8uf/hANCv3kkGu6QGEqkIdNfGIKZoOZhPHipHkLubxz
         POPDaIvlCDmqdt9EHt7kMEd2b/8zf6vzgQHOUoqBub+XyOdPIzUhYy/M7DPe1oBeuxHm
         VT6qGOMZw880nUoP71XlImKhZHXsHRa6k7ISxETfFyQWt4qsYJEqtGdsxmMoiFbRPzW7
         xIdi8aQIpCR4QQU98/NyNdI8wHvkq5pL1AZmHs3ozQH0nJRU8LdmLjMxR2dn+3BAkL+w
         wVzyC0kgNbBOgIa6RjciRV692+rSYDnkvWWtH0diAUZ0nlE8RHT718PeeBTdn4lFfUpR
         IFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HvRchyhkxeOLvzDuOrbaCYZ/zyb156MiLRE1ABCH84I=;
        b=HCleAqbcx+s9vj2bLP8jhzp+X46HhVkMUSek6zuN0/EeGaMN3feNdEn8sTvi5WeJ83
         NA/Zi3197LovCvVwoOx5N3vkj9Aov1IwjFrp4O2HiSemiDfjtvWfApcebwmhQ1T4ySLa
         gvdKLs1PvMraT6+8nklmPH1wWk5ncLBFbNtoGhE2KDBYdz+0YlAcCqYBx3bQaUz3Qh8+
         imghdUJ79CZ6rehvlgTAB6QReeH+oRwKeHjHXSWlWWnO3H85GwgWjUM9KxWvgcvROHRL
         GrWmNusLa7MMPWAH1B9Uts9rlZOKCMa/YAHbaYqdUB0y9rzu9r4Z5vA9dN5KDAs7dqE+
         sQYQ==
X-Gm-Message-State: AOAM530tDAsn5x94XOZAUcFIHHriepA3vTfPXMMyJ6aBgOQIAubxDwrl
        gryum4sAjdSdAl4F+UdiO5alzG64fcGlvdcuoP4=
X-Google-Smtp-Source: ABdhPJwZN36/0+bYxDq0YBCSQHuH6bnFz+l4e8yWNnes2mWDmufxX0YDvCAitBi7fUC2Q0zTyPsuywd9QxQfHrNA5eQ=
X-Received: by 2002:a63:924b:: with SMTP id s11mr18169222pgn.74.1595836256878;
 Mon, 27 Jul 2020 00:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200607162350.21297-1-mani@kernel.org> <20200607162350.21297-3-mani@kernel.org>
 <20200701130206.GD3334@localhost> <20200726155223.GB12036@Mani-XPS-13-9360>
 <CAHp75VeP8CMZ-T2Kk24NzOPiWHM62GErxCDUgBbYzNotwiFHhw@mail.gmail.com> <20200727044610.GC12036@Mani-XPS-13-9360>
In-Reply-To: <20200727044610.GC12036@Mani-XPS-13-9360>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Jul 2020 10:50:39 +0300
Message-ID: <CAHp75Vddgt=dDxjtd9A7HejVYk+_GMVgvUM3dfzH5giCwhbaKA@mail.gmail.com>
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

On Mon, Jul 27, 2020 at 7:46 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Sun, Jul 26, 2020 at 07:34:54PM +0300, Andy Shevchenko wrote:
> > On Sun, Jul 26, 2020 at 6:53 PM Manivannan Sadhasivam <mani@kernel.org> wrote:

...

> > I'm wondering if you may use mctrl_gpio_*() API instead.
>
> How? mctrl_gpio APIs are a wrapper for accessing modem control gpio pins but
> here we are not accessing the pins but rather exposing the pins as a gpiochip.

I see. Thanks for the explanation.

> Am I missing something?

-- 
With Best Regards,
Andy Shevchenko
