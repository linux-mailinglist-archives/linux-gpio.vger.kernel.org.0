Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4522FB979
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 15:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405168AbhASOcg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 09:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405225AbhASLLz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 06:11:55 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A868C061575
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 03:11:11 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id h16so21003120edt.7
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 03:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZzzlZM79+je0IaX7qHpL9yVgFOtBxcnXULVGyLZiDbQ=;
        b=BjBn3aSUCY5Lqy8Cqpp8fSn7FXd+k9Vfy4O6jRlJfNBNxExwSbKhm2hm7skaWWZ2Un
         RPzSzpy+qtbT0acBlFVorZtRxBDmMGDP5dzt3wYnVzx0NYsymAB1nc/W+N2Kt9wL0jxW
         ckXRc/ak0FPh/CA9Xv3+nflva9jZT+gOOGglaKaTA7QSsOWvrswV2YdmbgYMzYuKlpg6
         65oLG1iDOqzOKVeMufg9gOl6q//FnvuIXSJPu6YssUXvAsXSDqTI1DKbRkBlnmxbdjvV
         M8YimzUoWp8g33VgE+E1We35nyXQbt8HyoPBBwmN7beT+liSOCRNy0y3F928+FVklkEn
         G6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZzzlZM79+je0IaX7qHpL9yVgFOtBxcnXULVGyLZiDbQ=;
        b=g2bwL9iBR9WdzLDQEiaZl0TgepVzcehneNJT+Qz5hSmj/1nqHGuMRE9INhnZCkof/L
         Ab2dDjhwufFJGhMF7iBYKMuLE95m0FBlxH6IrAvCn2QixJI3suX67hxcgFCNVBL7px/C
         jCFIPrXFote27J9luT+d9tlGIpjDoZJjRZrBbOAbWZZic8fv27drVqjsbRKlIMbCK3B/
         /Z93KFZqf5MaNSKjgudGhLraSLOb6sYNPSVdY7ErT0o3pdv102fevxdYKKL74auHnUxz
         mva9ZHJ9VAiEsahO5SolcvA+n3JcScp5sB/zvaiJzr/ySUOa+Bo4mW5AhLUx6ma2SwJR
         ALZQ==
X-Gm-Message-State: AOAM531WZdJaEkI5HL7DFKoYv5BDPPar1FkjiBWKdgzpKPQsw7dswgE7
        S7VdMeptQtQI0mPMF6TsWfpzpE6108sgPcPqiOGTKg==
X-Google-Smtp-Source: ABdhPJwNNMggKrYZPmut1W+3BQp7oi6AHtjMfb5EnDKaIVcqmSkOpdxjdqGNnqUVVFtkBUXTHF20acar1tFffkeZEc4=
X-Received: by 2002:a05:6402:35ca:: with SMTP id z10mr3025956edc.186.1611054670036;
 Tue, 19 Jan 2021 03:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20210119031813.16980-1-rdunlap@infradead.org>
In-Reply-To: <20210119031813.16980-1-rdunlap@infradead.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 19 Jan 2021 12:10:59 +0100
Message-ID: <CAMpxmJWNDLoLEYepj8AtssfYuttOPE9R6D=HF_Nf=Nb0mW_Cyw@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: select IRQ_DOMAIN_HIERARCHY rather than
 depend on it
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 19, 2021 at 4:18 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> This is the only driver in the kernel source tree that depends on
> IRQ_DOMAIN_HIERARCHY instead of selecting it. Since it is not a
> visible Kconfig symbol, depending on it (expecting a user to
> set/enable it) doesn't make much sense, so change it to select
> instead of "depends on".
>
> Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Greentime Hu <greentime.hu@sifive.com>
> Cc: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/gpio/Kconfig |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> --- linux-next-20210118.orig/drivers/gpio/Kconfig
> +++ linux-next-20210118/drivers/gpio/Kconfig
> @@ -521,7 +521,8 @@ config GPIO_SAMA5D2_PIOBU
>
>  config GPIO_SIFIVE
>         bool "SiFive GPIO support"
> -       depends on OF_GPIO && IRQ_DOMAIN_HIERARCHY
> +       depends on OF_GPIO
> +       select IRQ_DOMAIN_HIERARCHY
>         select GPIO_GENERIC
>         select GPIOLIB_IRQCHIP
>         select REGMAP_MMIO

Applied, thanks!

Bart
