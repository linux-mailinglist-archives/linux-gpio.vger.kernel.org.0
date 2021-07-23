Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A093D41C6
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 22:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhGWUNM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 16:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhGWUNM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 16:13:12 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40526C061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 13:53:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d17so4201440lfv.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 13:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C1tgSaA5jfbkPSzbt45vZI5ReEyhIa0dRE9SLYpqK9s=;
        b=gI5jwiKBsTDdJ9ZW745yh6ajgk1x+xlabKSAZOB77aA6J8nVVTLopdA79XGN/7npc9
         A7TMSZNWsTAqyavPfIPtBOslt0A+xuoC+H9rojND9bg5F3UDHT4ESbTF3kVHI9nMTFBy
         KRsf/46ZFCLvQqLhifKBUXnWV1HjOs7xLvm4XxB6nH6dQ5z2ugy2tiOXKTBCHTzUmTTB
         uxLaBjEAkLsRWOSDTtem0cdl8GGnack7tABHZTykAF2v624zREMQ6wk4Jn/PtT1a11p6
         6W+abDhkambr07sCHENVeElLqryZZWSPSCmvS6hmRJctv2nA7D/2XQVitu8H/n6Hj/NI
         KDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C1tgSaA5jfbkPSzbt45vZI5ReEyhIa0dRE9SLYpqK9s=;
        b=J43LajXLxjmT1vHXovx7QjeuWf5VzRi36E61wAtUBhNOhmKzTc5X+jnc9TXYNdD2pe
         az7RI088uIMo7kFkmlVXukpXVwYXckbvmQB8f67gUbFKu9jwZ4su+GO6Agz//5Q4LzxP
         ajiJu+HsYYceC3Nyb+uCr6QMFXufycSd5YzZ8yHprAEAzQ4aWR+QFGgjgOf0zTsZyOPG
         fMWVdm7+ci0h/hSkicvGO73zCJxd9M8JXG+CwN+tacBqNPxuN0cXmm/cNqprR/FxVnYF
         KTNh1zwLJ5wgh8CqDTV3bO5yHBdiRhgYl4GwK2pjNa+tUd7JtHI9yeIeooCwjzkqC0AH
         gF3Q==
X-Gm-Message-State: AOAM533DZH1rRWWolTHtvyiU2gMZ0ukwOfNBxruAkHQO6yYv66o6zm79
        ecFvf42r9p89YMvBqtmaCW2CfpMiQKq3Uyseoba6vA==
X-Google-Smtp-Source: ABdhPJyXHQoCy2hUHiDE2D+wQnjUW9fPPhk1XLNJe3QijPVJbtuffwILmMxZu3/FOgosS9ocL4hLLKSGc32tCridOcg=
X-Received: by 2002:ac2:5312:: with SMTP id c18mr4007185lfh.649.1627073623610;
 Fri, 23 Jul 2021 13:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210723203242.88845-1-festevam@gmail.com>
In-Reply-To: <20210723203242.88845-1-festevam@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 22:53:32 +0200
Message-ID: <CACRpkda_gfTR6Z3bw_afFXPx=5XVLewkhyJKgwJodHRSysjLtw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx8ulp: Initialize pin_reg
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 23, 2021 at 10:33 PM Fabio Estevam <festevam@gmail.com> wrote:

> The initialization of pin_reg is missing, causing the following build
> warning:
>
> drivers/pinctrl/freescale/pinctrl-imx8ulp.c:228:35: warning: 'pin_reg' is used uninitialized in this function [-Wuninitialized]
>
> Initialize pin_reg the same way as it is done on vf610 and imx7ulp
> to fix the problem.
>
> Fixes: 16b343e8e0ef ("pinctrl: imx8ulp: Add pinctrl driver support")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Wow how fast!
Patch applied.
Thanks for fixing Fabio, excellent work as always.

Yours,
Linus Walleij
