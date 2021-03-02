Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBCA32ACF0
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383809AbhCBVS1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447372AbhCBN32 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 08:29:28 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21FDC061A2D
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 05:28:47 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id z11so31203510lfb.9
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 05:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s80/8MNAZMPOuwZzNkynpuWzzNF35UpnoUBKn77qTOs=;
        b=Xr5PtU7CD1IOPT1IhYf6kS5+jFkrtgNmoblkqQIIBFBwB6RBOZrkMYcuv/hwmapNif
         ebAZkpI5EhzuCQ3d4FZpgBWJeKg4YOy4S96r9eb9v9asvfQCMJ5f5ZRwyxsCU5qbS8TP
         TvT9Vhp6huvQJozFsblH2XcPHu6KeJqWQnUI1urhsedGuJESbcImt0RFFrvvwsc7MXj7
         ykixu7d7vJGKgGZpzF4PrktSaO2dMNi6EL3yMi3taQXXUS5YZJ58RtPOycLnh8yRjaGH
         4q9s8QzKRL5AINA1pTgXnzUGwL3CKJZgVXzNKuf/5PC+3nPt+VGw5Z2Rv+3wrNA19E7P
         xjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s80/8MNAZMPOuwZzNkynpuWzzNF35UpnoUBKn77qTOs=;
        b=tzpjBuI0WYTpllF2rpleUANvNHiRI5f51pE9Th/+HfanuInl86K3qDgjGBfD/hg9m0
         p52cOkew5f7ZKi+atfhzd1rXTyNYK/b0t3lkB06/p0WbvfbBt+GavdOF6SVeM9hYehBF
         HfKp+mag+MnMGpOzva0ufObAKy3/q0zjhbtDSmRgiYo2knrhgdRnppoP5pNToAlb8lx8
         NpNPh8H9FnFIpryfIub2LyD161uh2bhcrTr5FlttN6hnWcEjUmlvno+sXNynJnnlS1D0
         E/YvbS/zNyzLYi/WEkOeE4kmD3nVGIWkzhwFps1SGKsITNssst/390mEn7LYJFZjemXA
         kc+A==
X-Gm-Message-State: AOAM530J/zoCewYyemXH56bk49DGGNmTmgSMtvPVZNDNqdZp7xl1CXDT
        TBxOobr6fqn+NdIwHSJXH0SYKwXLtfbQS5wdPh9mpw==
X-Google-Smtp-Source: ABdhPJw7e9Adz2B46qbB8NKAB22zPE9AMPJq/Rjd3y6K3ppW/uh6rKoQYCSoHMbhmRouWT4Zwck0Q1HXhFiSdaPXrr0=
X-Received: by 2002:ac2:5d21:: with SMTP id i1mr11824168lfb.649.1614691726168;
 Tue, 02 Mar 2021 05:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20210223101937.273085-1-jay.xu@rock-chips.com>
In-Reply-To: <20210223101937.273085-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 14:28:35 +0100
Message-ID: <CACRpkdaWi6QVYjcO+1oEVWEgudQkKgLgfxopOx8Du4dciCO8eQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: clear int status when driver probed
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Ziyuan Xu <xzy.xu@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 23, 2021 at 11:20 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Some devices may do gpio interrupt trigger and make an int status before
> pinctrl driver probed, then the gpio handler will keep complain untill
> the device driver works to stop trigger.
>
> Signed-off-by: Ziyuan Xu <xzy.xu@rock-chips.com>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

Patch applied.

Yours,
Linus Walleij
