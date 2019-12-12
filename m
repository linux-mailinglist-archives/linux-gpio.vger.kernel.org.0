Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 286EB11CB86
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 11:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728824AbfLLK4m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 05:56:42 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:46364 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728410AbfLLK4l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 05:56:41 -0500
Received: by mail-ua1-f67.google.com with SMTP id i31so658766uae.13
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 02:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7o8Fk9J819Xyow7drx4ZJYU+C/ZEQjtfdop8gB9W3vw=;
        b=MqwABbAb1JEd7f4uq6VI77szASf2wBYA5EgrG6grUOUVdh+71vFJNqj8FriYEZ1Tat
         9JXIMVKI84N+uFIA+ksQ4t4Tgnox9Em/ynkUxPzZgDvU8Amwa+xEkwJPnc+ul2lpEos6
         Ak3mDonH1HXgQ0+Mg1c/jMBusEuHaEwc/YELsbBN3wO4z9JMyaDW8aAnt0XtFlaJoidM
         vMzudUiLSu8nKqtFEPfU5d8zzlwzlkcf08kXSzv3TVhYawTboLQwbgVaWAtRhBMPNOnz
         z2NDMyJ0S17C87aSvEbS+qDnAxQg/CjsI4fDlhC1ie1LRfphJI6hbTBs8lx0YCMF3xPb
         lQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7o8Fk9J819Xyow7drx4ZJYU+C/ZEQjtfdop8gB9W3vw=;
        b=e008kuBDtJMIv9WIY22qawC9VHtcMgUwLfjle1/gSLSZDWn0QqZjFGOT7l5y5FXrK0
         tKXLUDu1tSqJZKkzCx6+09GPZ9yQQ+q+8EWon7JP2eneGbk9OnnCgR1QtQ4eWw05EuD3
         fO12Yezp5OvP+U2xf15Lc9NZ/zeau+fQMvQFEitCZRCJY0e2K33alS/nXqYx8H/KQugw
         3k7WbjCVgPTqW5lEyHxAMQvlMTWaj4iavZC0sXppaTK0BtsYTujdVTZu+4CcRKiHLpI/
         xMgfoP1l20J8Sg5km6g5zQzTjcyl091qr326G6Gw9M2YPFupG4HM3GO6Di7OyfGLFPaX
         vHNA==
X-Gm-Message-State: APjAAAUASnMRG/a0adNDZ0S+AKD8B0ktq4RXzrlUSQ0g15Mw8RfF7OJn
        +SlLLxph5Ze61pBwM2NgBdXO1UqUpy1C0nr6dBtzVCTYWN0=
X-Google-Smtp-Source: APXvYqxrge+GLeCeFvK4SbuQYwntNfWyP7h9TYQWK48fu8If8Mqnu4VGAf44wEEKBFfNLi+Qv91pdt5L2Ys/TWxOGKk=
X-Received: by 2002:ab0:6894:: with SMTP id t20mr7740672uar.100.1576148199406;
 Thu, 12 Dec 2019 02:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20191212101134.42420-1-linus.walleij@linaro.org>
In-Reply-To: <20191212101134.42420-1-linus.walleij@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 12 Dec 2019 11:56:03 +0100
Message-ID: <CAPDyKFrGECTVnP+qWgA2n-TKxW2AcyLCr1hqyEOp83XcK=1OpA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Enforce device links
To:     Linus Walleij <linus.walleij@linaro.org>,
        Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+ Benjamin

On Thu, 12 Dec 2019 at 11:11, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Instead of opt-in device links, enforce it across the board.
> Everyone probably needs this anyway, lest runtime[_pm] suspend
> order will be haphazard.
>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> As there is no progress on opting in drivers for this we can just
> enforce it.
>
> I am a bit concerned that with every pin control state change the
> link reference count will just go up, but does it really matter?
> ---
>  drivers/pinctrl/core.c                | 25 ++++++++++++++-----------
>  drivers/pinctrl/pinctrl-stmfx.c       |  1 -
>  drivers/pinctrl/stm32/pinctrl-stm32.c |  1 -
>  include/linux/pinctrl/pinctrl.h       |  5 -----
>  4 files changed, 14 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 2bbd8ee93507..1d2cdeebb316 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1220,15 +1220,6 @@ struct pinctrl_state *pinctrl_lookup_state(struct pinctrl *p,
>  }
>  EXPORT_SYMBOL_GPL(pinctrl_lookup_state);
>
> -static void pinctrl_link_add(struct pinctrl_dev *pctldev,
> -                            struct device *consumer)
> -{
> -       if (pctldev->desc->link_consumers)
> -               device_link_add(consumer, pctldev->dev,
> -                               DL_FLAG_PM_RUNTIME |
> -                               DL_FLAG_AUTOREMOVE_CONSUMER);
> -}
> -
>  /**
>   * pinctrl_commit_state() - select/activate/program a pinctrl state to HW
>   * @p: the pinctrl handle for the device that requests configuration
> @@ -1276,8 +1267,20 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
>                 }
>
>                 /* Do not link hogs (circular dependency) */
> -               if (p != setting->pctldev->p)
> -                       pinctrl_link_add(setting->pctldev, p->dev);
> +               if (p != setting->pctldev->p) {
> +                       /*
> +                        * Create a device link to the consumer such that
> +                        * it will enforce that runtime PM suspend/resume
> +                        * is done first on consumers before we get to
> +                        * the pin controller itself. As some devices get
> +                        * their pin control state even before probe() it is
> +                        * important to use DL_FLAG_AUTOREMOVE_CONSUMER.
> +                        */
> +                       device_link_add(p->dev,
> +                                       setting->pctldev->dev,
> +                                       DL_FLAG_PM_RUNTIME |
> +                                       DL_FLAG_AUTOREMOVE_CONSUMER);

I understand DL_FLAG_PM_RUNTIME is used even prior $subject patch, but
could you please explain some of the reasons behind that?

In regards to adding a new link every time you commit/select a new
state, that sounds wrong to me. Why are we doing this?

Instead, don't you want to add a link when the consumer looks up the
pinctrl cookie/handle (devm_pinctrl_get()), thus when create_pinctrl()
is called?

Additionally, I didn't find any place where the link is removed. I
looks like that should happen when the consumer drops the reference
for the pinctrl cookie, no?

> +               }
>         }
>
>         p->state = state;
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index 16723797fa7c..4306b8444188 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -638,7 +638,6 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
>         pctl->pctl_desc.pins = stmfx_pins;
>         pctl->pctl_desc.npins = ARRAY_SIZE(stmfx_pins);
>         pctl->pctl_desc.owner = THIS_MODULE;
> -       pctl->pctl_desc.link_consumers = true;
>
>         ret = devm_pinctrl_register_and_init(pctl->dev, &pctl->pctl_desc,
>                                              pctl, &pctl->pctl_dev);
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 2d5e0435af0a..ec59a58600ce 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1439,7 +1439,6 @@ int stm32_pctl_probe(struct platform_device *pdev)
>         pctl->pctl_desc.owner = THIS_MODULE;
>         pctl->pctl_desc.pins = pins;
>         pctl->pctl_desc.npins = pctl->npins;
> -       pctl->pctl_desc.link_consumers = true;
>         pctl->pctl_desc.confops = &stm32_pconf_ops;
>         pctl->pctl_desc.pctlops = &stm32_pctrl_ops;
>         pctl->pctl_desc.pmxops = &stm32_pmx_ops;
> diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
> index 7ce23450a1cb..c6159f041f4e 100644
> --- a/include/linux/pinctrl/pinctrl.h
> +++ b/include/linux/pinctrl/pinctrl.h
> @@ -122,10 +122,6 @@ struct pinctrl_ops {
>   *     the hardware description
>   * @custom_conf_items: Information how to print @params in debugfs, must be
>   *     the same size as the @custom_params, i.e. @num_custom_params
> - * @link_consumers: If true create a device link between pinctrl and its
> - *     consumers (i.e. the devices requesting pin control states). This is
> - *     sometimes necessary to ascertain the right suspend/resume order for
> - *     example.
>   */
>  struct pinctrl_desc {
>         const char *name;
> @@ -140,7 +136,6 @@ struct pinctrl_desc {
>         const struct pinconf_generic_params *custom_params;
>         const struct pin_config_item *custom_conf_items;
>  #endif
> -       bool link_consumers;
>  };
>
>  /* External interface to pin controller */
> --
> 2.23.0
>

Kind regards
Uffe
