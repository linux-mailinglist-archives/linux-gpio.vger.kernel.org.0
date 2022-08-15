Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69199592C26
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Aug 2022 12:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242240AbiHOJ5o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Aug 2022 05:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242222AbiHOJ5n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Aug 2022 05:57:43 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837671CFE8
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 02:57:41 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id fy5so12696266ejc.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=r1NsrzieKJbz0xeysq9ijMttBXf0JDgLn0ohifJ6FV0=;
        b=gFptx6rdf1WmUqIRWVe+56U/Fl2x7Vlevj+kn9aSdpUpmlTGT8zizF89evlAIXSLr0
         qcp4N/y8VKls98M6J9BBaplfbsqSiDbFZuWf/4hACiKKSOAj6QuMMsxoRfyLjRCS5ynX
         BWgAPx00uVspe9NbSXzukFJptl4K6fbbFVi56ECvPsX9N45wwEt6GA7TRgYueiGoIbMe
         N4YA5FtvIMKaIU/XuIm+47VmJ99k7WMAhXmNwaVK1qMMcmUI18SymK23LPQ4RCIGRy2p
         627xhWBGUoql2p8Lz/bjmhKdXNE6u+YdFOiEN7OT2QnaPqX9PwFExEDljV42PTk4A6EH
         Nk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=r1NsrzieKJbz0xeysq9ijMttBXf0JDgLn0ohifJ6FV0=;
        b=xjpKB27E6vwT1G6qRq/k5zJHsvW/pPWzm5HRPCZFl8FaL8lFm6a3TsoOvrv7LSjhwT
         BP7AHVLd3McLcQlW5hfcIi1tYTS23hgPXlbvkwsyjF6akYnKbez/UzhH+Q+SRXy2e9jS
         bOleF13fPjsff9Wwp3c7wjQGU8crNPSUO+8nICK7Dd5TUf8Ims0AE701oG5qZIsweucO
         AQyFe/KY6wcemklb7mdsZghPJWbpFqT8Hp6sVx/7Xe/YZHWo/NPWhRQt1FJiZKBbj66x
         +YaM7uub3IpmQlcIaiIg5/rTdQfnlxqCd/5tQV+slv2o0vovVgXaOci3pnJCS9MRlazY
         JjWA==
X-Gm-Message-State: ACgBeo2o2YaFIJtZCH/Dqou+8E/W+SPiRsX/0LNdt/23OpnhrSqIoo+H
        t/7gLtX8hwOee1zDGBil4LxWWM8pBea/fNn5lnxhuw==
X-Google-Smtp-Source: AA6agR42gGHsKm0sw1MEgLwBiUC1pxf/08kt1kKkLbCwyDpNq+KcaYcUtN0ZKxYuGENxjoXyk9gWqGn/QTO3a8wYKnE=
X-Received: by 2002:a17:907:7254:b0:731:61c6:ecf9 with SMTP id
 ds20-20020a170907725400b0073161c6ecf9mr10009999ejc.101.1660557460076; Mon, 15
 Aug 2022 02:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220810060040.321697-1-saravanak@google.com> <20220810060040.321697-5-saravanak@google.com>
In-Reply-To: <20220810060040.321697-5-saravanak@google.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 15 Aug 2022 11:57:29 +0200
Message-ID: <CAMRc=Md=8TQf=EPKaTbOUF2=fuXVzC_dvV1SUo3Y2Tx-5hnzew@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] gpiolib: Clear the gpio_device's fwnode
 initialized flag before adding
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tony Lindgren <tony@atomide.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        John Stultz <jstultz@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 10, 2022 at 8:00 AM Saravana Kannan <saravanak@google.com> wrote:
>
> Registering an irqdomain sets the flag for the fwnode. But having the
> flag set when a device is added is interpreted by fw_devlink to mean the
> device has already been initialized and will never probe. This prevents
> fw_devlink from creating device links with the gpio_device as a
> supplier. So, clear the flag before adding the device.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/gpio/gpiolib.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index cc9c0a12259e..1d57d6f24632 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -522,6 +522,12 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
>  {
>         int ret;
>
> +       /*
> +        * If fwnode doesn't belong to another device, it's safe to clear its
> +        * initialized flag.
> +        */
> +       if (!gdev->dev.fwnode->dev)
> +               fwnode_dev_initialized(gdev->dev.fwnode, false);
>         ret = gcdev_register(gdev, gpio_devt);
>         if (ret)
>                 return ret;
> --
> 2.37.1.559.g78731f0fdb-goog
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
