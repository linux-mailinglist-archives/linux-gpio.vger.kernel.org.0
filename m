Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E9323D8D8
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 11:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbgHFJmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 05:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729123AbgHFJmA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 05:42:00 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03128C061574
        for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2020 02:41:59 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id c15so8476588lfi.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2020 02:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xiBtfv09Rewh33AK2W77Sh/BJrs195/KdV/txM9SnfM=;
        b=pOD4YJJB9NYsTyVi9YyMgqMX62jv0IKvTH/+546UVtScHjOj3YuqppoyOxGSpZGLZ3
         ktZJOx941KjDIIlY3sQA7PFxCfPLJTzi6cbZfCiLmVLCdTy0SmkKy09SfUjFQAZzz9ms
         m1tPoDTkMu3jzV+SPc1rIT4rmQ04eTGKEnU5XlwUCCjGqGBZc2fwwidT85azIsxdrVOS
         uo32jXEPDrWuvNQW5fmud877MRS3RT1fmMQNZUe2Y2Iev1SJXOU6RLWc0lLbs9f7wp42
         smKzQigDbG9RqsRVAozGIMFQGw3muz9Q8A9H86StSnr5FFrPNPEei2hzdlTTLBTb7Evz
         SwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xiBtfv09Rewh33AK2W77Sh/BJrs195/KdV/txM9SnfM=;
        b=U/xlZZUU4VwlRzrLL0YYNF0gsm5pBY2jBp/qig9QL3HFdqOuIjlGMXjh6qQhFOYI9S
         v+8suu7HZY35OX5iMVHzHPhax0CYhRvZ9aAnJBbb8SjaXRJTwE0la6CRV779q9a8QMbF
         f5Yrwr2viUryTBAFNjzrRyWnLTPW//ZUWgnmfZ9rzwwRM6v1jTFKrDzFPuGqRsVzirtN
         g3CTiKv4hW7SDMtGfPPzv23HjCp/dC+Fl1378DvyV0omhgDzg2D5QS+OQpyF/UEzAmNy
         SW6KX13vHtons3msFqrHNWjsPzjw0BAsIA+UaDjge96+O4AC7vFU8WizHAJcpBRy5S8G
         oS+A==
X-Gm-Message-State: AOAM533tTeOciJrU5KsLltZPeytKjfvVVzLezDEj/CAh9HvkOJyWh1ui
        uyFzy0YSL/RufWwDdFuOC4jVUVRqgIKz+Tr59JqllQVyQUo=
X-Google-Smtp-Source: ABdhPJyiQSuuZkL3S5NCMXaqBrOx5c7oy6V+lNy2kA0O0vzu+FVy9yoWAyu8VznLi9x/g0S6xr6H38ivfdD537KQdgM=
X-Received: by 2002:a19:cb53:: with SMTP id b80mr3544428lfg.77.1596706918251;
 Thu, 06 Aug 2020 02:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <f32130bf-cfd4-b1bf-538c-dbc9ee2d947a@eaxlabs.cz>
In-Reply-To: <f32130bf-cfd4-b1bf-538c-dbc9ee2d947a@eaxlabs.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 Aug 2020 11:41:46 +0200
Message-ID: <CACRpkdaHNuuS-2zMwWf-2--8FFV_4aQuAjYx8pLu66h4adQcwQ@mail.gmail.com>
Subject: Re: pinctrl: sx150x bug
To:     Martin DEVERA <devik@eaxlabs.cz>, Peter Rosin <peda@axentia.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Martin,

thanks for your report, let's check with Peter, Neil and Andrey who also
use this expander if they also see this problem (CC).

On Wed, Aug 5, 2020 at 11:28 AM Martin DEVERA <devik@eaxlabs.cz> wrote:

> I encountered bug in SX1502 expander driver in 5.7.7. Here is relevant
> DTS part:
>
> compatible = "semtech,sx1502q";
> gpio4_cfg_pins: gpio2-cfg {
>                          pins = "gpio5";
>                          output-high;
>      };
>
> And part of OOPS:
>
> [    0.673996] [<c023cfa6>] (gpiochip_get_data) from [<c023b235>]
> (sx150x_gpio_direction_output+0xd)
> [    0.683259] [<c023b235>] (sx150x_gpio_direction_output) from
> [<c023b363>] (sx150x_pinconf_set+0x)
> [    0.692796] [<c023b363>] (sx150x_pinconf_set) from [<c0238fef>]
> (pinconf_apply_setting+0x39/0x7e)
> [    0.701635] [<c0238fef>] (pinconf_apply_setting) from [<c0236c77>]
> (pinctrl_commit_state+0xa5/0x)
> [    0.710648] [<c0236c77>] (pinctrl_commit_state) from [<c0237e03>]
> (pinctrl_enable+0xff/0x1d4)
> [    0.719139] [<c0237e03>] (pinctrl_enable) from [<c023b791>]
> (sx150x_probe+0x1a3/0x358)
> [    0.727027] [<c023b791>] (sx150x_probe) from [<c02c38bf>]
> (i2c_device_probe+0x1bb/0x1dc)
>
> The problem is that sx150x_pinconf_set uses sx150x_gpio_direction_output
> but gpio is not
> setup yet. Patch below fixes it but I'm not sure whether is it correct:
>
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c
> b/drivers/pinctrl/pinctrl-sx150x.c
> index 6e74bd87d959..3f5651edd336 100644
> --- a/drivers/pinctrl/pinctrl-sx150x.c
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -1154,12 +1154,6 @@ static int sx150x_probe(struct i2c_client *client,
>                  return ret;
>          }
>
> -       ret = pinctrl_enable(pctl->pctldev);
> -       if (ret) {
> -               dev_err(dev, "Failed to enable pinctrl device\n");
> -               return ret;
> -       }
> -
>          /* Register GPIO controller */
>          pctl->gpio.base = -1;
>          pctl->gpio.ngpio = pctl->data->npins;
> @@ -1191,6 +1185,12 @@ static int sx150x_probe(struct i2c_client *client,
>          if (ret)
>                  return ret;
>
> +       ret = pinctrl_enable(pctl->pctldev);
> +       if (ret) {
> +               dev_err(dev, "Failed to enable pinctrl device\n");
> +               return ret;
> +       }
> +
>          ret = gpiochip_add_pin_range(&pctl->gpio, dev_name(dev),
>                                       0, 0, pctl->data->npins);
>          if (ret)

I don't see any problem with the patch, can you send a proper patch
with git-send-email so we can test it and apply it if it works for the
other users? Include the mentioned people on CC.

Yours,
Linus Walleij
