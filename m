Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906161ECFC5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2020 14:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgFCMb1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 08:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgFCMb0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 08:31:26 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC70C08C5C1
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 05:31:26 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id n23so2471273ljh.7
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 05:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L1NJYuTKReAQCzwmp21v6oxd6VH6o0/1AXhj3Xbp+FA=;
        b=GYLRyR3OR2you4gt5Qoe94eTqGpHQxHxJtDqtMFwAwycpFKpORilUHJ+cpxeyB10dZ
         HZZIncnj4Nc5euIkBmYg91PiCtTZXQoWLM//bJq/8ljVCqKGsEkudebxu1rD/xFge7XX
         gUcQtcfaYyLClnFKKSzUJFm9UdTCKp09CFDZ/ll0z2c+BjIUHXiTXK0/xIsaBmZFPgzW
         5PcPHAb51hM1T8b69zqjgmxhk7njDjDVmtYtpuT0xSkK8+vIbM4iI1M6M5/VlhCf0/Sn
         7xxUT6j3nTgizmvd+kLannVm19nUGA+BXHohp50BOfs5E71QhnvSDS02jxYWWK3eWHCv
         fbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L1NJYuTKReAQCzwmp21v6oxd6VH6o0/1AXhj3Xbp+FA=;
        b=FeeM/3/3jbsVsW6IgbIjfCZqUkcQzomPCFuuebTHiZss5BYr+nT02cDJDnMNF+e1dR
         282z904GKnZ7YfsfP10CZkFkrFRjtWj/fGJSDD2aLsWcYsKSZ+ZvUtMk6KIqPD3FY9r3
         uw5wkBNtdpdw40aDCPvbBEZH5B2X60esx82bK2QWqU5z3bSyAnwCkuno6038gp47/4hn
         lDURVd2Jj+i/Ie1ZRqpb9tO599b0FIWsqosi+c5jdupl2kW1wRgaJHWXASSxS+xVjQGa
         C0NWzDndzXejbvkJ7sYJQvjVlz7/s9NbjFKqCanncCS0bABbTPx8KR7UXGoQUu8JDaQ5
         FUzw==
X-Gm-Message-State: AOAM530ostIwP7hCbockE0Ku18VsMtFB7Zs7uZPtqkhQIYeLMojMDiBK
        d+Yn7QSdaYtg9pakhXGjrPGUxmTD32ES9ePuUyuiHA==
X-Google-Smtp-Source: ABdhPJzeYHCrqoAKbg/iXMZc2UHkSMqVGpsvQRy6zx+BK4rdk3W1fxIGP76BKw3wR0/nVnq2bumPP8UA4bGzDwuUJyc=
X-Received: by 2002:a2e:350a:: with SMTP id z10mr1920234ljz.104.1591187484286;
 Wed, 03 Jun 2020 05:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200530201952.585798-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530201952.585798-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jun 2020 14:31:13 +0200
Message-ID: <CACRpkdYvoe8o8Db1mszfgcHA3XZF7LJ3P1u5pnKOfEfS99F0Ew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imxl: Fix an error handling path in 'imx1_pinctrl_core_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 30, 2020 at 10:20 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> When 'pinctrl_register()' has been turned into 'devm_pinctrl_register()',
> an error handling path has not been updated.
>
> Axe a now unneeded 'pinctrl_unregister()'.
>
> Fixes: e55e025d1687 ("pinctrl: imxl: Use devm_pinctrl_register() for pinctrl registration")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij
