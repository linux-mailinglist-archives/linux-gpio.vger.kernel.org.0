Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D649D743830
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 11:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbjF3JVR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 05:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbjF3JVA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 05:21:00 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D623C0C
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 02:20:10 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51d9850ef09so1796270a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688116805; x=1690708805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G18F6df4riglz+fx97D6+kt+RmpbWgrWAbSyMwVzsm0=;
        b=ojXkqEC0msA4chNgXH2YHjLThDShIype4X1kuSDJ2o7u+csr7+UticsvL5Zy9kD1N5
         zHj/Lq2aUIxwuJHxNZz6zgUEzNBXJTaEIXk6rYqv+7qAJQfUIv0Xvhqnf9kANF7evGEb
         mphCrJBwz+Cd+j3s8NBpLD9HNswUzwNW+OXqHopKYctWXQV+FkDm8pY3ebD2xLDGMNa5
         1gLz2uDpwPaGS82KXaDxg2VLVIpzIu7EfFOA/po9Zp2Qt8JktwwM02gxuuylSoff61Q6
         XWJqSrrxHE9DxwgSeYnulgHQ2jl3uwa2tS5aqf+jN/XowCRjDX3AeE8tBofeXFyOIl+w
         msWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688116805; x=1690708805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G18F6df4riglz+fx97D6+kt+RmpbWgrWAbSyMwVzsm0=;
        b=TaswaVBm9Rbr9GBCUJpOEDnx/I07BEl9UcWAGJDUQUwNF4iJ3cxxmWaTBb25zAWcxk
         CfOhQUl/vZMX0kqNS9Lg7MPb1LsYMpROJaVrFt8guVUCnHVsnB90QmfJZtWR9suEom/x
         Ijl8YvLZ2SZD0XAM9oI7cbImie932ElG8l+p+2EQ87H4RUX+aOs5ll6+CQ7KX+2jImDg
         tponMhaJiS1OsmPlEvAzfvsWbrB/F+F9X+D6qOZV0z5/6WC4kOcSfPnxVGZJ8WsFS7PU
         fBdGEZki8pITtJwuBGK9ttTK7LHzwGzcYAmWe0RatQUwZNY/n6ib+K+8Q3p4xkCIcVx2
         NDDg==
X-Gm-Message-State: ABy/qLYqOowEt5PLr4xSOjoZKVekSb+YBOkSYpFZPTRc079GiMYUCu6C
        p89YYUpOQUgkinAYndlabAXcG5Myj+wcbbWlvP4=
X-Google-Smtp-Source: APBJJlHgQeCVylikI3fQ5zY8/heMfDFu2Rml+z4kI9yX7xzHJjeYASkt8h8KugK7sEkZY24oF/3TuMxrrl+0w3T4yCk=
X-Received: by 2002:aa7:cf91:0:b0:51d:a24c:db20 with SMTP id
 z17-20020aa7cf91000000b0051da24cdb20mr1369137edx.18.1688116804567; Fri, 30
 Jun 2023 02:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230629191903.2423243-1-shenwei.wang@nxp.com>
In-Reply-To: <20230629191903.2423243-1-shenwei.wang@nxp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jun 2023 12:19:27 +0300
Message-ID: <CAHp75Vc5JFrh1HqYQca9BcYALQfVD6A-kHgmc5OpwtvcGC4beA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxc: add runtime pm support
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 29, 2023 at 10:19=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com=
> wrote:
>
> Adds runtime PM support and allow the GPIO controller to enter
> into runtime suspend automatically when not in use to save power.
> However, it will automatically resume and enable clocks when a
> GPIO or IRQ is requested.

...

> +static int mxc_gpio_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +       int ret;
> +
> +       ret =3D gpiochip_generic_request(chip, offset);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D pm_runtime_get_sync(chip->parent);

reference count disbalance here.

> +       return ret < 0 ? ret : 0;
> +}
> +
> +static void mxc_gpio_free(struct gpio_chip *chip, unsigned int offset)
> +{
> +       gpiochip_generic_free(chip, offset);
> +       pm_runtime_put(chip->parent);
> +}

So, you want to have this to track the amount of GPIO lines requested, righ=
t?
Calling PM runtime after the first request makes little sense.

But here is the question: does your controller support wake from IRQ?

Have you tried to see if the lines that are used for IRQ with
gpiod_to_irq() really work with this?

...

> +       err =3D pm_runtime_get_sync(&pdev->dev);
> +       if (err < 0)

reference count leak here.

> +               goto out_pm_dis;


> +static int __maybe_unused mxc_gpio_runtime_suspend(struct device *dev)

Please, no __maybe_unused. Use new PM macros for that.

> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       struct mxc_gpio_port *port =3D platform_get_drvdata(pdev);

What's wrong with dev_get_drvdata()?

> +       mxc_gpio_save_regs(port);
> +       clk_disable_unprepare(port->clk);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused mxc_gpio_runtime_resume(struct device *dev)
> +{

Same comments as per above function.

> +}

...

Personal view on this is that it makes little sense to do and is prone
to subtle bugs with wake sources or other, not so obvious, uses of the
GPIO lines. Can you provide the numbers of the current dissipation if
the controller is on and no line is requested? Also is there any real
example of hardware (existing DTS) that has no GPIO in use?

--=20
With Best Regards,
Andy Shevchenko
