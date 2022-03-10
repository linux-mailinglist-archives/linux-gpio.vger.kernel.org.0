Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6172E4D4679
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Mar 2022 13:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235493AbiCJMIv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Mar 2022 07:08:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236088AbiCJMIs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Mar 2022 07:08:48 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CBEE0AF0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 04:07:47 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id bg10so11607955ejb.4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 04:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yqnZcig/be+PF2hUda3ZyVexXIqRExOLgLqUfMRrRj0=;
        b=aU0fRZ97Bv+K9YLWjSVjFA2fu29lenHxRUDmKmjyPUQ1hbtXHtSjqALKEMwpTMQe7b
         oSybaWKGc2qjTXedXVmu22sWqM/Ra/nyrAPLIsAcKzmlifERYaG3e0c2cpgQXIEredMZ
         cqWkaYd6vJE9To6Huxl5m1c+oETkXQFQjay3HwnjmB48MeYznkUvEqCCgn8l3nounloH
         c5JIEXAcy3DOEwQ1J4PbfImoZXA2a32OnoeYenq+sdVo2ajPM0XwyfuxRTmu7gohXBTA
         WBP+oE/uANJEcxhg0dr9VikStqzpohLJwCx3PCAGlSN2+XdhbmBB+GMfAgeYLpqXcZKn
         WL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yqnZcig/be+PF2hUda3ZyVexXIqRExOLgLqUfMRrRj0=;
        b=MOoPADd3CGqiE22vuOesZ2XBAi4cuWO45/iKnG9CVadQ/nAoMEr0SjStCh2uM426lv
         YUDYAiRgmtRx5GnIIcGbn1ByUXnixdOvqcrtd20EAcb3fyDCvQe+583bI3yKJay6oS4q
         5UXEwSWMux4Q9OBIYa9ze8/mRD3cgswbSRvhEqKzh4sQCQKiJGs/nUuWXQX9J6/V5J6Q
         c2KY1qGXTZCOxUVkoJgP8tA+QjDYlw06cyoCRy3u9CcYHT960Zyy7AvReXt9aevXvFrs
         5lrP+wT/zpeL6bUrPsJYo8poSNJnlUwayCz7cTRdSn4j5socv6bZ1bZbvtgbXa8qjPqK
         lydg==
X-Gm-Message-State: AOAM531gQ0I8+Rk632zkxlc4LTsMALAV8C9JfiNLWv03VQ7KiIjv5Cnn
        FplboUNmOZDYQp9OOAyOHdtZfOeft7GHOG5zYfg=
X-Google-Smtp-Source: ABdhPJwN/lLYuJmsxz7o7B/CtBPXq9VKTLpeIkKGQs3KRsA7wuIDel3WQMnMElNVbUUrsEpuaAHMMJLpTScf5B9LVSU=
X-Received: by 2002:a17:907:6e01:b0:6d0:562c:e389 with SMTP id
 sd1-20020a1709076e0100b006d0562ce389mr3950855ejc.497.1646914065777; Thu, 10
 Mar 2022 04:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20220308032546.2169929-1-jay.xu@rock-chips.com> <20220308032546.2169929-4-jay.xu@rock-chips.com>
In-Reply-To: <20220308032546.2169929-4-jay.xu@rock-chips.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 10 Mar 2022 14:07:09 +0200
Message-ID: <CAHp75VfXQ2JH_Wawp-RHukNnazv4RQCNW0-29NB_Jcv9iV8Kwg@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: rockchip: allow rockchip-gpio driver works
 independs on pinctrl
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tao Huang <huangtao@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 9, 2022 at 1:41 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
>
> Currently, the rockchip_pin_bank is get from pinctrl, that binds the
> gpio driver to the pinctrl driver.
>
> rockchip-pinctrl
> ->probe
>   ->register pinctrl
>     ->populate gpio platform
>     ...
>     ->rockchip-gpio probe
>       ->register gpio_chip
>
> Once the pinctrl device registered, other devices may try to configure
> pins througth pinctrl_bind_pins before probe, and if it is a gpio

through

> operation, that make a failure since gpio not ready.
>
> Heiko has provide a output-defer-list to store settings between pinctrl
> and gpio driver, once gpio register, the list will set activate.
>
> With this patch, the gpio can register itself before or without pinctrl,
> even if pinctrl driver used, we can make the gpio register before
> pinctrl by another patch to rockchip pinctrl driver.
>
> rockchip-pinctrl
> ->probe
>   ->populate gpio platform
>     ->rockchip-gpio probe
>       ->register gpio_chip
>   ->register pinctrl
>
> Since the pinctrl is registered last, other devices will do defer probe.

will defer

...

> +       gc->label = kasprintf(GFP_KERNEL, "gpio%d", bank->id);

No NULL checks?

...

> +       static int static_gpio_id;

>         id = of_alias_get_id(np, "gpio");
>         if (id < 0)
> +               id = static_gpio_id++;

You haven't stress tested that, have you?

...

> +       clk_prepare_enable(gpio->clk);

Error check?

...

> +       printk("%s: probed %s\n", __func__, dev_name(dev));

Why printk()?!

-- 
With Best Regards,
Andy Shevchenko
