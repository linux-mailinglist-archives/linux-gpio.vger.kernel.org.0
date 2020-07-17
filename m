Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E241223F43
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 17:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgGQPPi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 11:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgGQPPf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 11:15:35 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9822FC0619D2;
        Fri, 17 Jul 2020 08:15:35 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id m9so5531694pfh.0;
        Fri, 17 Jul 2020 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I6+Gg2dMEy8yC+S+Fxjs5glLlnuYKKsxqf5pCCJciRo=;
        b=H+z3hlCuvV9BA2AGk60mTYNhgOJlhQBPzk4Dnae6P6ZbJXIhhtV/kvLliiuBGA9uYi
         uMUav22rbb8b+oHRw766Bdp+BszYeLc6j24HpWoDLgZLwukZMoEz4GPbJrO86iz5+Lt+
         bc29xiqaJKH2R0Ze8rvS/Hbc8/2aNgDbiFLlnuJf5RGslNi7rKsa849DyBR9mqwJ9wIV
         mZ82ZYXnQJ83TbF38K4QB6zlltFmVbzuvg9mC9DhzniLNCpONNFjOw86AsxTf+IVG/Vz
         7SLBxggy/HGvLFrKJ9B3dcULmAufVCJsrkya3zGmRZgBz6oLnHk9u3dMCIVbIOUsujMY
         PFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I6+Gg2dMEy8yC+S+Fxjs5glLlnuYKKsxqf5pCCJciRo=;
        b=pTjY8SzzkNFpOINjWWsGH/40rNk/tHsa+Bl32Xpfq8NWlHUswAqz3JzhWJ21tsISsi
         qlOsT3YKGUsXxb7HY1JCmlWSIrp15zck/bvzUVrNUxkJNDHDbvK0XFo3/lWCrugkPORL
         Cctwz1bb1hy9hub6kJfWU4/Qj+ryNX6C5BVc5AuiL+RCHCKf1HmA7+J5o/BWPWsO4SvS
         VkI+qMHM/4ol7iIlgMZOMagmpvOrcRZF4aHgc9A0OjAEf3f1NNJzwx+oYYYMLUAMzujd
         gb50FybkwTpwKTEO3HNHs4KbglclZ9c8C9B4x4k20+OM1WKh7JxCTOErGj6bCHrPkX1c
         YRcg==
X-Gm-Message-State: AOAM530sJ1UD4QHj0aqs1699yIqs39O4vbdXOWkyyvgyeEFbbWM6Tk10
        EYGJyvdpiRecWMWOgmfZvtL8anOPZfwQRa20Cdc=
X-Google-Smtp-Source: ABdhPJy9LPCHV2KeqdiFYSHKoRKTI4XByWBUnS/DJGonreDp2oE3KFBCTzqd7qvaMzZ7XDT17DsoNkLKG6B/FmwgTfI=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr9287082pgi.203.1594998935011;
 Fri, 17 Jul 2020 08:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200715213738.1640030-1-drew@beagleboard.org>
In-Reply-To: <20200715213738.1640030-1-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Jul 2020 18:15:18 +0300
Message-ID: <CAHp75VfYXuZgtkUvrm0VGX7CcyZoC2mzC_x4mVhzVCeTjZpiJg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: omap: handle pin config bias flags
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 12:38 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Modify omap_gpio_set_config() to handle pin config bias flags by calling
> gpiochip_generic_config().
>
> The pin group for the gpio line must have the corresponding pinconf
> properties:
>
> PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
> PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown"
>
> This is necessary for pcs_pinconf_set() to find the requested bias
> parameter in the PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.

...

> +       if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
> +           (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
> +           (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN))
> +       {
> +               ret = gpiochip_generic_config(chip, offset, config);
> +       }
> +       else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE)
> +       {
> +               debounce = pinconf_to_config_argument(config);
> +               ret = omap_gpio_debounce(chip, offset, debounce);
> +       }

It's a rather strange indentation of the curly braces. Don't you run checkpatch?

-- 
With Best Regards,
Andy Shevchenko
