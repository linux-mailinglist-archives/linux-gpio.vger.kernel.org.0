Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5298ACCB77
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 18:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbfJEQtx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 12:49:53 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35046 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfJEQtx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 12:49:53 -0400
Received: by mail-lf1-f68.google.com with SMTP id w6so6549640lfl.2
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bFYXbByYhGEXfOvEgQ/Yv7O8maPlLwNPKG6/+oAaKb0=;
        b=F5Qjpvpi6G+ab+VeuCiBsb6tm18qqaMtmFRT4reLGjpmUHLQIKEy38RCdhiSjtQoYr
         gxUT6twp6LaP1bTlGnWGv4bQySjuigIwrgHhmPKCbxPGBjd7/LYxeuA+gBsCmRkysK3O
         pH/XMlhMcKe8iXOk/2VDpQk54SIR+ndpxUrBJzAe/NI5B0WdIBaj5ogYjdYehYK3cQ35
         Uz82JVR+RRWh/cH1+2hUTPNVyI31grf74MbU6CHnN01sEYQskDQY5F905me9Q1O4MIuO
         66UKqnl76X1MvlQ2KDltSwqSE5p2wZNmWRtT45rianVJwNaprLpXKDq9dfy+9WkxiBB0
         rISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bFYXbByYhGEXfOvEgQ/Yv7O8maPlLwNPKG6/+oAaKb0=;
        b=ZKCjxv0xadWjnxWU8nXGniT/Ci87AFhxqkLUSU37xLOWr8aG7VIff3vGq4xdbXhVD7
         WmjZDLnJxC12iIi/S6NZWt93RVvi6LtZhXePr/uyWkIBiV770qI46MWLnoKZ0A1lpTaf
         XhE6APYgkM38JTDRvSBrYVKBZvyahjh1af70GmSibKcFKjYqGgzTHFk588T7YLiWDNyv
         mUn+NjC9NVumrFXeEoKMM3c4fOyixjELstXSDA8FyOEZwBGiUoAQ0XCCd/Abb6z081q9
         ckt/VrqAHOK/Zr3yFzjScE8R4z4TRr9XtlvdO4ZBoE20xF7EISmCaSWB31xuU03v+6kc
         uOWg==
X-Gm-Message-State: APjAAAV3LC30Jo6p+TWWnjrPURNemPllc+p2maw2IdoyIqPzGLufSGTT
        ws9rL5Mn//jbH+KG9OJpvStHjIK1cVwrvtEnPJwwKKP3NMz9gQ==
X-Google-Smtp-Source: APXvYqzWLIXea2bSktYcXAMWUxPBnRthWgHgKi9V9cmgUV7xXLZpltHmYaRhUSOORfu5uwvTkgz2I3T7Lp7NJCXeluc=
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr12207816lfp.61.1570294190713;
 Sat, 05 Oct 2019 09:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191004122923.22674-1-amelie.delaunay@st.com>
In-Reply-To: <20191004122923.22674-1-amelie.delaunay@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 18:49:37 +0200
Message-ID: <CACRpkda6CyYCt-s-VkaK856Jt3TxQg+HVDz-5Ww9T9KNHHAjaQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: stmfx: add irq_request/release_resources callbacks
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 4, 2019 at 2:29 PM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> When an STMFX IO is used as interrupt through the interrupt-controller
> binding, the STMFX driver should configure this IO as input. Default
> value of STMFX IO direction is input, but if the IO is used as output
> before the interrupt use, it will not work without these callbacks.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

OK I see what you want to achieve.

> +static int stmfx_gpio_irq_request_resources(struct irq_data *data)
> +{
> +       struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
> +       struct stmfx_pinctrl *pctl = gpiochip_get_data(gpio_chip);
> +       int ret;
> +
> +       ret = stmfx_gpio_direction_input(&pctl->gpio_chip, data->hwirq);
> +       if (ret)
> +               return ret;
> +
> +       ret = gpiochip_lock_as_irq(&pctl->gpio_chip, data->hwirq);
> +       if (ret) {
> +               dev_err(pctl->dev, "Unable to lock gpio %lu as IRQ: %d\n",
> +                       data->hwirq, ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}

Just call gpiochip_reqres_irq() instead of calling the lock etc
explicitly.

> +static void stmfx_gpio_irq_release_resources(struct irq_data *data)
> +{
> +       struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
> +       struct stmfx_pinctrl *pctl = gpiochip_get_data(gpio_chip);
> +
> +       gpiochip_unlock_as_irq(&pctl->gpio_chip, data->hwirq);
> +}

Just call gpiochip_relres_irq()

But all this duplicated a lot of code from the core which is not so nice.

> @@ -678,6 +706,8 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
>         pctl->irq_chip.irq_set_type = stmfx_pinctrl_irq_set_type;
>         pctl->irq_chip.irq_bus_lock = stmfx_pinctrl_irq_bus_lock;
>         pctl->irq_chip.irq_bus_sync_unlock = stmfx_pinctrl_irq_bus_sync_unlock;
> +       pctl->irq_chip.irq_request_resources = stmfx_gpio_irq_request_resources;
> +       pctl->irq_chip.irq_release_resources = stmfx_gpio_irq_release_resources;

What about just adding

pctl->irq_chip.irq_enable and do stmfx_gpio_direction_input()
in that callback instead? gpiolib will helpfully wrap it.

Yours,
Linus Walleij
