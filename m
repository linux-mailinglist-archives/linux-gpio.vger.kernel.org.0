Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF393584F9
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 15:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbhDHNlV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 09:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbhDHNlT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 09:41:19 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A749C061762
        for <linux-gpio@vger.kernel.org>; Thu,  8 Apr 2021 06:41:04 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id r20so2322319ljk.4
        for <linux-gpio@vger.kernel.org>; Thu, 08 Apr 2021 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GtXbzBdE0M1Nm+ar4q3BvNUevDQ17mjgYSKVolqwxG0=;
        b=UAXlRZwWzqDqVm+TVZLuG/9aX2jJ4Wl3yNdGBz3MdsdIwKK1frRrTbyyOFFzbj3iuc
         d2oaovoBG3OctPJdpjfc6tdJGohJKMAKusRTTV2a7+SUa+2yn+iDEuUsiWXmmvdKFKPN
         jq1VgZS5HRf4oXWVOteZJe1li79bLJFEZYK6FKaJGGSpI9tyZv2ZlPvXnfYj9hSLD8HX
         by5xFZolG0/MunXe5+yAuDUjXu7tvNkwYzS0xBotgy2sk6B11Ey42Pr6SA1vsAcLJKPN
         7ztxfKUjam1lmK6jQy3pXzmPHUgrl0/8WCGd84Llu5YZF/AahBjrgt23yJP8xSDAb10W
         ZDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GtXbzBdE0M1Nm+ar4q3BvNUevDQ17mjgYSKVolqwxG0=;
        b=C2nvYTw3ebsJdgb8vjil8Z8Hjzy/gmDm1AAh5mJzA1LMdaOw8DruBWg4ewjM/8zV2W
         N4SWEb14Q5d1M+KOuWS3dRkJZvotRYmMPaHwwo8IXU0bgj6TrT/Nk7XahIkTKBaSQQxB
         nDvqcFyq8OilofY9JyO0leeCLpmEuahQcJ8/EWdNyPO8Amllg8VdcNUZOQ8Gip5UDMP2
         TRGQ9CEWeeSZvme0VW8tnrUdhss8q8aMu9M4xZ0WU/MvPn0PcXitFviahxqTOtRwX9gf
         TXqVMGPikrYKj/yUnlZ+G3AWmhCpWMyOvK/rnJ5kJvmlCZRJMEoNzbqt4Wx5aACGvgUg
         NMDQ==
X-Gm-Message-State: AOAM53251cYSqnuwgijJxxBvlFmEE7Ol12w5AVYMmHOIboRTCj6gBEG6
        7HNPs1vGmBHsJdXmxruvGrWuDivdapr7ZWTnFvRNjA==
X-Google-Smtp-Source: ABdhPJyTMHU0TlT4KAzDlrvO6EJpbswl5uNFx3547wf9kdRUSms7wWxsib6LTdrfRUvi7kIRYamP2OBW/7Rh1Qli2yw=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr5845223ljg.326.1617889262784;
 Thu, 08 Apr 2021 06:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210304013342.1106361-1-jay.xu@rock-chips.com> <20210319081441.368358-1-jay.xu@rock-chips.com>
In-Reply-To: <20210319081441.368358-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Apr 2021 15:40:51 +0200
Message-ID: <CACRpkdY+A4bsW28yXRGeGVnK_UcR70sMeX3jpABGVJc49A-xcg@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: rockchip: add support for rk3568
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 9:14 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> RK3568 SoCs have 5 gpio controllers, each gpio has 32 pins. GPIO supports
> set iomux, pull, drive strength and schmitt.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
> v3:
> - fix route_type to route_location, compile error fix
> - remove slewrate option

This v3 applied. Any additional review comments can be fixed in follow-up
patches.

Yours,
Linus Walleij
