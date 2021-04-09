Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513053593B1
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 06:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhDIESK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 00:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhDIESK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 00:18:10 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC1F0C061760
        for <linux-gpio@vger.kernel.org>; Thu,  8 Apr 2021 21:17:57 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a25so6550519ejk.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Apr 2021 21:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xjLmX+0W+Jqko8UnmbNDaV4NBI6cs+ZapnzWx2XbzL8=;
        b=FueXYB6uy3pZNO93x50/2tghHZBuN7kLOv+hepFCjZj3H/EyNcEesP35TElP3218qh
         0KOwlx5TMO24WACwX7dOLoTEPSqUa5gXJ8Mt4mWVUKJ2tM6qCtU5u1MdO2mdDE42rYEc
         OqdYKctOv5UwSMco5ED7OIVGyjeOEQyS+FfKdqlJUvOC5LK1askcPiGg5XBytqZ7KDQj
         xnZyLZpi2TL7YbmjQDgECQz+saEWMgqH3u17NRf5E4seu8YoszhrHQtVsafd6nDgn1e1
         KJl+izlDeqGOaWu1WQlm9CyqNoaBlrbFRL3tzZ9S6dZVZgJx1e1ttObDd/UnNZTNfqHm
         KfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xjLmX+0W+Jqko8UnmbNDaV4NBI6cs+ZapnzWx2XbzL8=;
        b=sHWBG3zzok70Nvweq2sn7IHhxyJPDmXPjrS+D4HwRaYW7D+hiPzU3JOIuPrmjBF1DN
         aVLIrjMqOU0+ISEQRQ0nHL6zcpVGTj7FbapqsJq9sAX1tbZWoHwpABUfbENf/wicE5bN
         DzxjUcvVkl4lvXUnCqkKxKw75OEtzvIp/1mtHwauyKokRgzTiAw7x4NRMXpr1Rts6ovi
         LtdDv9ROFzZ6pNqGfM3xCDzi2aJfQYgHfJozyU38lpchCdnHECeYSOFW7ZFyT2M5qqk8
         dAzBt4rbwxWbgZFIrC6CepU9tkuJ4kU/8ZyWt6SKTOL1ArI8Rg2Ij97E3ym81nLBdtAu
         Wgnw==
X-Gm-Message-State: AOAM5315hM7uJcClnd7k5+bEiD4DLDUR0Vu/6JKlnK/hIQvgyu34Nopm
        WO7XNBw5srJDUBdvQ7CnJ0kpFh0I4dupwwkAOa1ZwQ==
X-Google-Smtp-Source: ABdhPJzLwQMMroP5RiiLjJwxVb4h7XR/9MCox0k4BlZf5q/dnYFVfklNVCiigBwqcaAU7+O3JPdawaf00SekOCw9ZHQ=
X-Received: by 2002:a17:906:148a:: with SMTP id x10mr14411250ejc.92.1617941876621;
 Thu, 08 Apr 2021 21:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210304013342.1106361-1-jay.xu@rock-chips.com>
 <20210319081441.368358-1-jay.xu@rock-chips.com> <CACRpkdY+A4bsW28yXRGeGVnK_UcR70sMeX3jpABGVJc49A-xcg@mail.gmail.com>
In-Reply-To: <CACRpkdY+A4bsW28yXRGeGVnK_UcR70sMeX3jpABGVJc49A-xcg@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 9 Apr 2021 01:17:44 -0300
Message-ID: <CAAEAJfB3csiXBtAioV768PYMb4Sv8UYvmaVaOXZDhJWEzXPLeA@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: rockchip: add support for rk3568
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus, Jianqun,

On Thu, 8 Apr 2021 at 10:41, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Mar 19, 2021 at 9:14 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
>
> > RK3568 SoCs have 5 gpio controllers, each gpio has 32 pins. GPIO supports
> > set iomux, pull, drive strength and schmitt.
> >
> > Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> > ---
> > v3:
> > - fix route_type to route_location, compile error fix
> > - remove slewrate option
>
> This v3 applied. Any additional review comments can be fixed in follow-up
> patches.
>

I'm really glad to see RK3568 happening this early :-)

Seems we are missing the dt-bindings for the new compatible string
"rockchip,rk3568-pinctrl". Is there a patch for it somewhere?

Thanks a lot!
Ezequiel
