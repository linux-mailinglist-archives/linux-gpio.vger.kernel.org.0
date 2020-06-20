Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DD92026C2
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 23:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgFTVRn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 17:17:43 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44530 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728891AbgFTVRm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 17:17:42 -0400
Received: by mail-lj1-f193.google.com with SMTP id c17so15239535lji.11
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 14:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mHgH43K83+iQ6RNkHMCCXAsjIbVyGh9lGIEdQYieGCo=;
        b=tRI9TCQFMHUFSxEdH4oiQp5+HofGbEEvn9/OHlFZinQAhVx1IGJMTXcvbe7WH4Hcb5
         9/rjsg11IGZK6n6azZGrtCNoYqQ1prUOrH1muMwWNsKa8Wjp0abgo75ogPcBbjONtyaw
         2P4HymlgnhG5sWSR8FQqqVJ0txLVHYwN42sipma/x1piwbotMqWbDBzmrZVUGCFcD9oj
         9JL6Stg4vHh0L9Ak1xIxvb0y1u7j5NkZKK/vIzr9JWcFljC3NDSXT26fQSOqhtmzatnV
         vZz12RtFzotGuDuPZIB3zSnlTaPJ4kQWGYdjQlJWdLzja9IehBsMBdKQZ9uj0tbn1Lkv
         42oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mHgH43K83+iQ6RNkHMCCXAsjIbVyGh9lGIEdQYieGCo=;
        b=gcl7ELKrUqTVZPWnth+yBlCnrqvnNU7sB/JwAOK6nnkIKF41qtRN2gfj1tn4jSfFs7
         t8ks/tpoZkJILjCqJ22C18vQTQpoy9uO3r1KERS/mfFlIJ44Iy8cqz4S0xGs2ktCkoNM
         QhP1AKDrGrOsMFAHlQ+1uRFxQlqarlM/gIWzvclZp2Tr56vYAG/37yOKlbR+rDR7F6ZL
         wQgc16M6tOflcNyEoiKLADm4EpmHqYiUGApin65+ZtvqtWWf1U241qISo61uDorkMeG/
         z3zUa4ypcjNZ/Hz37FjxRQ5x/paXJw5oV64XLaljfFjislUnz6CF8Czx6ctUbQqBneu/
         +xdQ==
X-Gm-Message-State: AOAM533IWGt4rMLtQnzd+T5lcLdIbWy9wBfE7v0ChMkaDJOnsJC+k/OS
        e1kSU9r6P2kSDuVyseydQ+0njTkNAvREp7JRcZYNT18ObWY=
X-Google-Smtp-Source: ABdhPJxxwEtCfzQ1FEAh8yrGmSi/M69HcOGzWZfVt/ZikxadOFf/c/H2T7BBkDTM2qTUDHeo7/Sta/Q2mq+LW17OJI4=
X-Received: by 2002:a2e:351a:: with SMTP id z26mr4796925ljz.144.1592687800595;
 Sat, 20 Jun 2020 14:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 23:16:29 +0200
Message-ID: <CACRpkdb31hRr=uhyQVDz+pJ0ArScBz=yKXqmTviCaFg2C4jp=Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] gpio, pinctrl, introduce for_each_requested_gpio() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 5:05 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> While cleaning up Intel pin control drivers I have noticed that one helper
> macro can be used widely in GPIO and pin control subsystems. Here we are.
>
> Intel stuff is deliberately excluded, so, this can be applied to the GPIO
> subsystem into immutable branch that will be propagated to pin control
> subsystem and TWIMC parties, such as Intel pin control drivers.

Oh, nice! There it is :)

I applied this to the branch ib-for-each-requested in the GPIO tree and
merged into the GPIO devel branch, then I also pulled that into the
pinctrl "devel" branch.

Yours,
Linus Walleij
