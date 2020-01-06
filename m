Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C42131C34
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 00:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbgAFXTg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 18:19:36 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43297 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbgAFXTg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 18:19:36 -0500
Received: by mail-lj1-f193.google.com with SMTP id a13so52691137ljm.10
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2020 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ifLICUP3yJ2Jc69aKyPrFElbdfNiE/0Qf5WDAsEJ7k=;
        b=pyrjEmMhzxyrQ1hUcrahOg9m+TH53ZbznItKyNMvrY/fK9J7ew5E739goWY8PcP9KE
         osp4+WXa6IXcUIoxC6oD/scn2Onhm9/F5WLSauRcFyqPnaJoVvPfFzwD+F5P8GTeBsbs
         IKj8xSuE8o4iWnYrwVGJXJHOyotZUEfxCkQMHSfKpuSQQzPqiDDzL5OlFx4j1FOnf8l4
         spxkANE2K6lr2bophpOyTCu3bGpeqx808DpHV/jZSnQMRLbigYYQh4wpTK5LTFz8AmWZ
         F6FWtkrhW3/4vcP+x1KiWc0xlIsBb724CeRwPedJKwiQ92ZcHTft0Qj0PMSU3GQvHilz
         fvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ifLICUP3yJ2Jc69aKyPrFElbdfNiE/0Qf5WDAsEJ7k=;
        b=Fxh+mVEF9Ym/f5apo9A7sMldR7bwJCEaFiP7BJ3XSa19Ml02LgfTnSnpB+jifvmvuB
         xTZEsuSkOeTJzmfWW4V9YSybLKl7AjzChCI+WslpSjITQ/Mk4mosztOzhXkix1PQy4uB
         f3s7MDgs8QIatg1XpmjPcezGnoaQ0dvz5oSUHpz1yHP+qwACQJpZaDjIfQ0TakhvqOoe
         e1kRs08YzZ0z0zzaqW3j1iWCZxNtZP9T3vmaoEtSYFIYTMdn8tUlhSoPyRuVnwEpIulo
         SRqFfV2boQVP45Z9fUdwSUXGLHQW8xiSFsEDJkeRjDQhHoxFr1YHwnm+tavRlKUYWDrq
         lVoQ==
X-Gm-Message-State: APjAAAXt7HlI9nATmZrtfuFMnx1uzXlItaS7ROFYW7t0P/bhT2QoXFKu
        O89RJ/zdfcs/SEuaM6+a3blrudgUoEcJ88YfltIm1A==
X-Google-Smtp-Source: APXvYqxVrJvf9BPRKtKqrWl9CB2TzK8f78daLojWiACCChF+prk4cqTGQs5ip21no8hv5sSnLvVrxbWEWln/dkHJOQk=
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr50504659ljj.77.1578352774218;
 Mon, 06 Jan 2020 15:19:34 -0800 (PST)
MIME-Version: 1.0
References: <20191217121642.28534-1-srinivas.kandagatla@linaro.org> <20191217121642.28534-10-srinivas.kandagatla@linaro.org>
In-Reply-To: <20191217121642.28534-10-srinivas.kandagatla@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 00:19:23 +0100
Message-ID: <CACRpkdbQCc3AUgj81JLfzeUDt4XyVWLTzwkhAQS+0PSskL4ggA@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] gpio: wcd934x: Add support to wcd934x gpio controller
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 17, 2019 at 1:17 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> This patch adds support to wcd934x gpio block found in
> WCD9340/WC9341 Audio codecs.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This looks mostly finished, some minor comments.

> +config GPIO_WCD934X
> +       tristate "Qualcomm Technologies Inc WCD9340/WCD9341 gpio controller driver"
> +       depends on MFD_WCD934X && OF_GPIO
> +       select GPIO_GENERIC

You're not using GPIO_GENERIC so select GPIOLIB instead.

> +#include <linux/module.h>
> +#include <linux/gpio.h>

Don't use this legacy header, use
<linux/gpio/driver.h>

> +static int wcd_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct wcd_gpio_data *data;
> +       struct gpio_chip *chip;
> +
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->map = dev_get_regmap(dev->parent, NULL);
> +       if (!data->map) {
> +               dev_err(dev, "%s: failed to get regmap\n", __func__);
> +               return  -EINVAL;
> +       }
> +
> +       chip = &data->chip;
> +       chip->direction_input  = wcd_gpio_direction_input;
> +       chip->direction_output = wcd_gpio_direction_output;
> +       chip->get = wcd_gpio_get;
> +       chip->set = wcd_gpio_set;

If you can, please implement .get_direction(), see other drivers
under gpio for examples.

Yours,
Linus Walleij
