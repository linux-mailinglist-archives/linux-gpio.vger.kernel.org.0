Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C22B38F6CB
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 02:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhEYAI1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 20:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhEYAIZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 20:08:25 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70EE9C061756
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 17:06:55 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id q7so41809124lfr.6
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 17:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kMpOljGnfPeM78kPggxibkmCL00Y57PzO5ZmaEV0BXY=;
        b=MewdMHu8pSiz9xtZOKCGO2UN+t5TiiRcBHH1a51nLZOQ930DNpl6gJPaV2XGMGRFVM
         e/50I9+o6cNImkcNqVmAHX1IG1yNlF+DM2eszkohBGYtUWYHCehhn6ipxRJhfR/9wxcu
         yp+JYSiP05pJjGHOkI4oqCGDNxIX+rKjQWIB2oIlP8QoqW7i9RYKKn76Ir0HgL2Vkyol
         qZ8LWSZkflFyvnqM1aEJNpem1C1r3uEIL83lAtsZ+Qs1MafIqT6TVc99DPwYyg6+YxgP
         n9xGP/9mCT8suXOUCn2J9jmJLenG4SLFB9g1rhAIWDXz8kpASz65DzXqXMLjzllemIH9
         menQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMpOljGnfPeM78kPggxibkmCL00Y57PzO5ZmaEV0BXY=;
        b=DWlWZfzFtof1v8q68GgokKaxq42gfUjK/e15KomICEcH98WaEc/iN0kykjRVW9ttKf
         tKX3CInrlMQvNST+Pz07Ue50QtA5QpojUT10fjQ222lrmYIq7XcqI2LT8yGukAyptIuz
         ZNC+2juVhxjeMfQxKznJ34JNIOFj40kHM6h++zihLvI/ZGpThfTNre56R6gO9DJzDx9Q
         mZ1PQ1n7OllfSesxsbJlmfVUWNZQK0rAcDzSLJ30Xid/qEdQzwp/gyjpE+IY2mfJSJSM
         mpjZotzE6YwWVPK5fjvQqhB28DtO7N2xKGElyZXi4fkhmOdaiKD5YL7MWyR7skooU4I+
         FVGA==
X-Gm-Message-State: AOAM532RdJ9JNoJacbP0TScft6Xn18QcNnLQMjiU9yiNzMgSOYwmng6n
        mA7XES5px7rLcT3Z5zzTPS6rUZoMe1+RUNyfdC233Q==
X-Google-Smtp-Source: ABdhPJx94W96U3rvN6Jk3W8XwfHaYZxs8wqy2iOgobL2N4vLXoIZf9tS5BonEJmR9TdQKSwTD05BGaGxDwMtobVK2RA=
X-Received: by 2002:a05:6512:1185:: with SMTP id g5mr12286057lfr.586.1621901213604;
 Mon, 24 May 2021 17:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210510063602.505829-1-jay.xu@rock-chips.com> <20210510063602.505829-4-jay.xu@rock-chips.com>
In-Reply-To: <20210510063602.505829-4-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 May 2021 02:06:43 +0200
Message-ID: <CACRpkdaZ=3AsT9NiOKrwEDWXReDX0w_PsdgwC6fqSb4Yecry-g@mail.gmail.com>
Subject: Re: [PATCH 3/7] gpio: separate gpio driver from pinctrl-rockchip driver
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 10, 2021 at 8:36 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Separate the gpio driver from the pinctrl driver.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

Overall this is very good and should be applied.

> +#include "../pinctrl/core.h"
> +#include "../pinctrl/pinctrl-rockchip.h"

Please explain in a comment exactly why you need to include
these files. I think it should be the goal to get rid of this dependency.

It seems that the driver can be further simplified using GPIO_GENERIC
but we can deal with this later, once it is separate.

> +static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
> +                                 unsigned long config)
> +{
> +       enum pin_config_param param = pinconf_to_config_param(config);
> +
> +       switch (param) {
> +       case PIN_CONFIG_INPUT_DEBOUNCE:
> +               rockchip_gpio_set_debounce(gc, offset, true);
(...)
> +       .set_config = rockchip_gpio_set_config,

Can't you just use gpiochip_generic_config() and rely on the pinctrl
back-end to deal with this?

> +       .to_irq = rockchip_gpio_to_irq,

Normally this should not be needed with GPIOLIB_IRQCHIP but
since you are refactoring an existing driver it is acceptable to
keep for now.

Yours,
Linus Walleij
