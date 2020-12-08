Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E355F2D27BE
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 10:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgLHJeS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 04:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727665AbgLHJeS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 04:34:18 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E500EC061749;
        Tue,  8 Dec 2020 01:33:37 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id s2so9295544oij.2;
        Tue, 08 Dec 2020 01:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sn6Mvm7ZmrJkPQrGVxcpQJZVeyCsWajsVTNwPKt74sU=;
        b=aC0F/6iu9EwuGc8jmPYxCi2CB5N/zPLlA4IB0bhhlvYRvNoe0YzEs13jDF0aPVdqFE
         OuRjz6q/9B+WfSd9Aez7oDv+kRYaNvAKJAc/2dAkbH93J7M9j+hWCdPqL1SsfOojkaf0
         cLvtXn5Rd/l11BhYJa07xEo5dHYyKm8jP9dEIaziTdGutEs+gCdp6NqwHK39krD/M4CY
         OP84yHsLzf1Ed7mkL9KYpu0GpkE3okt9FO/W8urjNBw+oCrpoUWdz/UjffBBWL/e5QWQ
         DJiyCgcZ4qnHt/hBoqFY8quQhdccqHmV+Y312gXxG3eEuKYIgtMIpLYKz532Ao8+cmxv
         bJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sn6Mvm7ZmrJkPQrGVxcpQJZVeyCsWajsVTNwPKt74sU=;
        b=fxbryvbuBTuLabXwkDmkgdeU0JWVQYP6vxxo35+Fc46NI4TWibF12zjHJlAxZg177j
         udkOGrYol9tC0rUYlyyOUZhcnl3r1NuegqqLy16UYGkhfAPPlAhQI0PcxT8FInTwuTL9
         ynfmAXJbCa+mUel9tlL9iOe79sCzrfHjXhq5ZHl76fj8NoBQUrTcNI6TW4ZJhx2nwzXL
         lNSiG48YXISmP9DuffJAaGLvKDdcI+HirsmuPaLmpG9oPatOX0MhSvuEluBBPXwmHD5T
         NWfvnxCqpc3LzeJA+XIEnrQvhYkuy/1fKO39tzjh0RXUdUiJdGLP/lVt/9LM+DsNcZiF
         iCww==
X-Gm-Message-State: AOAM530Wkvj+RLHZBpYIcHTqXPW10GImb32a4m8B3OsifwLxRieO6QOn
        /27Qf6UjRN+zpe5wjGIH5NDJbEEfwut4aA00PcI=
X-Google-Smtp-Source: ABdhPJxnkpUAZAlkDDdw3nw8s6hL//yyR64F45aERlZd75YSXFrAA4SqLcC0/0BsSQcjU7uTwP2w/+dX2MZVoTS/7n4=
X-Received: by 2002:aca:5a86:: with SMTP id o128mr1978305oib.23.1607420017349;
 Tue, 08 Dec 2020 01:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20201208075523.7060-1-sergio.paracuellos@gmail.com>
 <20201208075523.7060-3-sergio.paracuellos@gmail.com> <CACRpkdY_Me8kO-Fa-vUspJNv+2vy0fswTM-RaUoaZJ5rCfuynA@mail.gmail.com>
 <X89BiDacLNQ7ZQOH@kroah.com>
In-Reply-To: <X89BiDacLNQ7ZQOH@kroah.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 8 Dec 2020 10:33:26 +0100
Message-ID: <CAMhs-H9ZW0f9wvjk9OeiZpiHQT+qFFEbvHsH4jxwEa6xYXVy0g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: ralink: add a pinctrl driver for the
 rt2880 family
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 8, 2020 at 10:03 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Dec 08, 2020 at 09:21:31AM +0100, Linus Walleij wrote:
> > On Tue, Dec 8, 2020 at 8:55 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> >
> > > These Socs have 1-3 banks of 8-32 gpios. Rather then setting the muxing of each
> > > pin individually, these socs have mux groups that when set will effect 1-N pins.
> > > Pin groups have a 2, 4 or 8 different muxes.
> > >
> > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >
> > Greg I'm happy if you just apply this right now for v5.11, as Sergio
> > is obviously on top of things and the DT bindings will get there
> > eventually so I don't see any need to hold back the de-staging just
> > waiting for patch 1 (which I will eventually apply directly anyway).
>
> Now merged into my tree, thanks!
>
> greg k-h

Thanks!

Best regards,
    Sergio Paracuellos
