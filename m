Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE1B39C315
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 00:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFDWCd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 18:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhFDWCd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 18:02:33 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AB9C061767
        for <linux-gpio@vger.kernel.org>; Fri,  4 Jun 2021 15:00:46 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id d2so9250915ljj.11
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jun 2021 15:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J3cUQxofReVfzXAKx9OJNj8MTjPpRu0z60JXwKyp/4U=;
        b=P4xVpSmnFgkUukbaUkp1IvyEIsFhcnEdT15u+jPLp31nt3RNzK8OXdffCc1qj3xsAZ
         2qPRTCZluy2EPg/C690Yq92VxbuGhEt3kcAvXtaqeC6Vz1G3eV2Zv8Eff+zL8VFTAXJt
         Fgy2Z/1CFxs6Y9ZjtAHsyqHNl21O+93bZySEqCeSSFndsiN9bjsnL2yZMMqFBu8Px86F
         ii2+qcN074Fdxo6lV4FbNTsFS8oZopCN79yxu+oRoecq87DFmaGTdfnUlRB6zVNAWQ0N
         ruLObxLsXtgTbFojy3tcmhpZtSJMdGreTqLgmn65i2jm86kXPhiAq/9uQfutbyV3OkYB
         Wp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J3cUQxofReVfzXAKx9OJNj8MTjPpRu0z60JXwKyp/4U=;
        b=TB4Nxv7hcy+xc0Xp/jRJbYON4ZD+mvXxag8vlvVM247oQLLWvXPEeP8jkekWMXKcNH
         LIDPX4wjpsx5raUO37K/PFeEy4AvnN8FiaNcOMHcCFn4DLISorsPkmvUTLdwBox4dXsc
         xL7Dpm9fsZuzHbCHsvKW1lDZlVlAxyIrdO3EA4Vqj8EVBJUbsO2JEYvmLFtUg6Wlj7Jy
         GQvt3lC+oEL3U41yCeWAlqQJXJpo+vcqBj3tNEGLadzXIk5qmVvKo/ubJlhzJiAoZzjq
         TcBUGxxFgY61aUeCQ33uy+LY5epcHeluss01Q4A0aIam7mX3SQfBordvoXkryTg/Ic7Q
         jViA==
X-Gm-Message-State: AOAM530iVzEJvawo6tOdCNNSmT4qdRh6kZ3fk3+5fC3Xo8XezUr8d4eI
        Rzx4lgy+Zvv906tVrbDmGZlrL5uONItfmSsy+z6PhA==
X-Google-Smtp-Source: ABdhPJzA+eEseEIOeM7ox8//dtfVJ/jk/IvXotEGWlUh8YepldC1Hn82qb7pfwZITeiMigq7HnI6XHobL6dPCo2i+Y4=
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr5008239ljg.368.1622844044656;
 Fri, 04 Jun 2021 15:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210604110406.11006-1-michael@walle.cc>
In-Reply-To: <20210604110406.11006-1-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Jun 2021 00:00:33 +0200
Message-ID: <CACRpkdZEytf1WJa4JNJy6o3CBqOJAZLb-D=_rGQb+naH=TKmZA@mail.gmail.com>
Subject: Re: [PATCH] gpio: regmap: move drvdata to config data
To:     Michael Walle <michael@walle.cc>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 4, 2021 at 1:04 PM Michael Walle <michael@walle.cc> wrote:

> Drop gpio_regmap_set_drvdata() and instead add it to the configuration
> data passed to gpio_regmap_register().
>
> gpio_regmap_set_drvdata() can't really be used in a race free way. This
> is because the gpio_regmap object which is needed by _set_drvdata() is
> returned by gpio_regmap_register(). On the other hand, the callbacks
> which use the drvdata might already be called right after the
> gpiochip_add() call in gpio_regmap_register(). Therefore, we have to
> provide the drvdata early before we call gpiochip_add().
>
> Reported-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> Btw, I'm not sure how to handle this "was part of another patch by another
> author" thing. Should I leave the Sob and just add mine?

Ideally just stack Sign-offs it is called the "delivery path".

Yours,
Linus Walleij
