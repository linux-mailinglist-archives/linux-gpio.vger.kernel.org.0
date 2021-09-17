Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588CB4101CC
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Sep 2021 01:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhIQXgo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Sep 2021 19:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhIQXgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Sep 2021 19:36:44 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E13EC061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Sep 2021 16:35:21 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y28so38421372lfb.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Sep 2021 16:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PkDGmP0aGYLJS6/pcxej119Ez5GceZ/Qr9wqpNPM2Hg=;
        b=iRflbXUDbQwR8fPuqpGMIZRh5d5XJIBmq1xET2tbgxzSe+8GcHffEhQyAF9XeGYfA1
         l4zVOrlw8Z1Hdpl4/B223pyke78E3D/9CDXOR3ZENcxqmdg4OvgJtr/u8yq3EQXYk6sk
         T7r2o+56gRd5mBmTSwiicZgiyQtw86FFhemFN4LWj0ksot3wSIO4QvNDpuKbIU56ykjC
         T1vggMUqdATSRQnUtCDMnp6Th5CAN+cSR2G3pP1FLHRPaEJlPaJnkbEYGjMGy9Xak558
         kMUztiwqCtIb43GpMoSgmMzVc1IeWXBXaL8dZDHpr2m06b3AjpBbYtLZ9fHOYIfa7uTX
         cC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PkDGmP0aGYLJS6/pcxej119Ez5GceZ/Qr9wqpNPM2Hg=;
        b=F+j1r4fQ3b1bru178CwvXHlDlJQLAkrtM4KtsqRbCfP/qnrB5CbOni2c22NRq6CdV7
         H3FmtEzZOddiSoyXHYnXIWX5DIzo4JNKp4krgvcwApXmSABkrq1BgwQm201bdxhEnSWb
         ekWeOZSkQyPXGJpOOyVqkK3P9CFlPb8KDDglLRwsFDeDzeB4lJgDv96erVwiCR+yVzhX
         rX+xiceGB01b0tu94hBO92zdBULvUnVt4Q64+qZJNyWsYRuLoCi7NK7MMqc9He44wv7X
         YcTVBRQ6qDuqoBUmJyFiHXrdcnP2BI1BgrEB4l1P/FxTRQ83UUHoD9sJn8JoMywU7aZM
         5bHw==
X-Gm-Message-State: AOAM530u5Xu7cnhUgCacBGIIZXCndQQK0MR+5nGBuXjpbg0tROCh9U7l
        3IaYGANah1Kgd6YlRqL/ey96Xlj0YW8Fx3hDNw0J2g==
X-Google-Smtp-Source: ABdhPJwCbWUAYcAMUm1bFcDDe3zwixhPDj6NEeY3En+++VFztG2zcjFpXcFPx6/FTV0ZDCyJo9XMKU7O4NzvBvTy9cg=
X-Received: by 2002:ac2:4d03:: with SMTP id r3mr10251096lfi.339.1631921719948;
 Fri, 17 Sep 2021 16:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210913224926.1260726-1-heiko@sntech.de> <20210913224926.1260726-4-heiko@sntech.de>
In-Reply-To: <20210913224926.1260726-4-heiko@sntech.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 18 Sep 2021 01:35:09 +0200
Message-ID: <CACRpkdbWR68xv6a96Nt6mXhrMZaEVT=ejMvqm=TPYngEo6C3RA@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl/rockchip: add a queue for deferred pin output
 settings on probe
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 14, 2021 at 12:49 AM Heiko Stuebner <heiko@sntech.de> wrote:

> The separation of pinctrl and gpio drivers created a tiny window where
> a pinconfig setting might produce a null-pointer dereference.
>
> The affected device were rk3288-veyron devices in this case.
>
> Pinctrl-hogs are claimed when the pinctrl driver is registered,
> at which point their pinconfig settings will be applied.
> At this time the now separate gpio devices will not have been created
> yet and the matching driver won't have probed yet, making the gpio->foo()
> call run into a null-ptr.
>
> As probing is not really guaranteed to have been completed at a specific
> time, introduce a queue that can hold the output settings until the gpio
> driver has probed and will (in a separate patch) fetch the elements
> of the list.
>
> We expect the gpio driver to empty the list, but will nevertheless empty
> it ourself on remove if that didn't happen.
>
> Fixes: 9ce9a02039de ("pinctrl/rockchip: drop the gpio related codes")
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Hm this is not very elegant but what can we do.
Tentatively applied for fixes.

Can we not use device links to get around this?

Yours,
Linus Walleij
