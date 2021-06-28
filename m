Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501F43B5F40
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jun 2021 15:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbhF1Np2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Jun 2021 09:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbhF1NpY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Jun 2021 09:45:24 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3318DC061574;
        Mon, 28 Jun 2021 06:42:58 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 21so14137808pfp.3;
        Mon, 28 Jun 2021 06:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=890/5nF8wFidagUBpaqnYpFmsARoaShLJGXJOFPo/lk=;
        b=OcdrV+sNOQSvdLeBy2GpI4EwUStSeD/4XGpGtI7MYaScOauIbaIpV/Xc16UfGnB4oX
         pQk6kIXJ4nH36nvMRPFly78lWNxYJosKVqZ9ZXqt+O+kHQIaoml+AsRJU6drRZrYJwX4
         UatTU9IhJs4SMO9JBZyT6hTW6zcnm4GbYp6TY/T9md1AOtFqwaWVI0ON1S6IAGKms1+M
         U7q9ldI9+K4sLxpZLElyUrWjFdgQtxEsjIy1VE+Uff63WR8IxdxOBdoNfPp4bbJ0kl3w
         BpE2eH/vs/YwtDayqeuj2MLFdCdLQZK7XDA1kcSmQ0mvXHw5pKTdl6Zf+e91ZU2mkAVf
         D47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=890/5nF8wFidagUBpaqnYpFmsARoaShLJGXJOFPo/lk=;
        b=IZPQJYd3Iz2T+z4mWxvYGZ+Aup6STvLeN/y1LrMIfrVkFIqJH4s7roDqFIybnNMlsY
         TyT1zw+6vPTE2cpJG0QwmPEuCcSTgq4pfOejH6UC2bBmSo09UjueYEaSN/LlCHaTmPsf
         BUBUN9Fk1lSOXj6TqxtqZ0kg62GNWpXxywocvWxosLBKbIbPnkAqsCBs6d+SWWPH4evn
         /0xBgwp1rEpPBmG+xW0HiMSgTAiOWbv17OQvtKOW3ydXY7QGCi55ysnJSpzAacx7QF9f
         bMjYoamC/kOCjHU3T8IJUBjot2sUAfgsklQLSKiEWnoaudpb3aBVOYIh4o5jHUb6GZ7t
         Jrlw==
X-Gm-Message-State: AOAM533PlpVOaKgU7TsEDXlJ8XPFRo9NSFGEX+T0i0esGmnb4j6vePuq
        OE0CCjEvqJ70g8CULOxalDwd477LaBkJGtu5PWY=
X-Google-Smtp-Source: ABdhPJz0ZHRXEJEvnhznfPNPPaNs0COH7ugtXPFEaZTdR+V2zdUSjqr33gWBRi/FCk6XXVMljD9CkzHDLhzzwMvuO0s=
X-Received: by 2002:a63:df10:: with SMTP id u16mr23438227pgg.4.1624887777701;
 Mon, 28 Jun 2021 06:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAF78GY0jB_oeKgfZc4SHWBVusGnNfxKk5jTC4UBDsteSEVEzTw@mail.gmail.com>
 <CAHp75VeZwUiK2v8HZ=MLGSkK8wLudDEJFhBSm--Wu9gzABhmSg@mail.gmail.com>
In-Reply-To: <CAHp75VeZwUiK2v8HZ=MLGSkK8wLudDEJFhBSm--Wu9gzABhmSg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 28 Jun 2021 16:42:20 +0300
Message-ID: <CAHp75Vd6M6D9baiGi8fU8a=pfXnSKtEgQ4+eMiwPh6P9cg1ojA@mail.gmail.com>
Subject: Re: gpiochip_lock_as_irq on pins without FLAG_REQUESTED: bug or
 feature ?
To:     Vincent Pelletier <plr.vincent@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 28, 2021 at 4:40 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Jun 28, 2021 at 6:37 AM Vincent Pelletier <plr.vincent@gmail.com> wrote:

> > While trying to debug an IRQ handling issue on a sifive-unmatched board
> > (which is a very recent board on a recent architecture, so I would not
> > be overly surprised if there were bugs in hiding), I realised that I was able
> > to claim via sysfs GPIO pins which are being actively used as IRQ sources.

And one important note: do NOT use sysfs GPIO interface. Use a GPIO
character device instead.

-- 
With Best Regards,
Andy Shevchenko
