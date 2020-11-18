Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA9B2B72EA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 01:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbgKRAPo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 19:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgKRAPo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 19:15:44 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D806EC0617A6
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:15:43 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id r17so368433ljg.5
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eWrhbtxMaDvAA/hqZtx4oXS0+2NR8hi9OYu+UfYxShM=;
        b=eW9ytAHGHiQg0UjXTBR2k5vHOB0NAXJ6YaKbN8S6L09yrDcZNbH8+z4GWfYUzfhW3t
         dzMuoT3NE4oZTkYczeQRW/gufIrbJN9ca7ZWH66NdhDmdwSjgTYMibESojmaoZcq35wr
         XoAMrI3eC4yy9MqqxMDiaV+3CaIUqfFiQoy6Fkv/o2sCnuzTiXxiA2Jccqvh0lvkzmAK
         mAU3B6JFW9rh8NE8GDLQ4Udmys+N76Ac8+xucJwBSxI7phXYbeoBsjddLquKWuLgWWiN
         cwXKFVUjAxBLCdQ2aYWpz/872jnOmvRxvJSki6BzeUoJKxNxzMRRTFwbPlWHoN5XW+85
         pzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eWrhbtxMaDvAA/hqZtx4oXS0+2NR8hi9OYu+UfYxShM=;
        b=uK2Uwjw1acKk3QwUFRYVbtKNX2JiVwarrQ/3CiI1tVvDCt2JvN7RlW4lt/u4x0gtrn
         R4kKJ1kI7aqYpasRfX/nd6RH+lCJ6rX7yidgJ4kOa2qaqyRzzC5d/+mr7HBTWjh+5AMS
         fgVR/eYveLl1/8uuVvBY9goDRg7N0g6P7rHwCrrPvPMmrdaqxhRv56YmTD00JU/HwDIr
         EcpQWkwyHiEErDkfDjXCcDfQ8WOdInY4oow0oJ7PfWhWuEgyZnw4/qpTSIG8Z++h+2es
         5LoMCDIICNVvI8vSM0bRsJMdeK+FVEKPptSG5ozBF9Ko5lFIgIlEBvZ7NUAj2YJMDg+p
         qFqA==
X-Gm-Message-State: AOAM5313VF6SHT/2psFMT1NkT+zadTrAJE9FRBBYWAD5x0cIMhzihTMy
        E2MmgqzuJfUEin+zA3FKVdjlbkkQd7JCuiJ4sISieA==
X-Google-Smtp-Source: ABdhPJyeahuY3HMFK2a8FC+b5Gfa6NyYvm+3NwaEh5oPTktmnIxFCR9vwlEUeZSFblV0ihPS9NFFlAixhcvod44jUX8=
X-Received: by 2002:a2e:998e:: with SMTP id w14mr3143826lji.100.1605658542224;
 Tue, 17 Nov 2020 16:15:42 -0800 (PST)
MIME-Version: 1.0
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com> <1605201148-4508-6-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1605201148-4508-6-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 01:15:31 +0100
Message-ID: <CACRpkdYsWpB-09efW1OPRXvrS_e=i5HduSJkEor7Lfb3NgmHpw@mail.gmail.com>
Subject: Re: [LINUX PATCH V3 5/9] gpio: gpio-xilinx: Add interrupt support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Srinivas!

On Thu, Nov 12, 2020 at 6:12 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> Adds interrupt support to the Xilinx GPIO driver so that rising and
> falling edge line events can be supported. Since interrupt support is
> an optional feature in the Xilinx IP, the driver continues to support
> devices which have no interrupt provided.
>
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

(...)
>  config GPIO_XILINX
>         tristate "Xilinx GPIO support"
> +       select GPIOLIB_IRQCHIP
> +       depends on OF_GPIO
>         help
>           Say yes here to support the Xilinx FPGA GPIO device

Please add:
select IRQ_DOMAIN_HIERARCHY

Because your driver requires this.

> +       /* Update cells with gpio-cells value */
> +       if (of_property_read_u32(np, "#gpio-cells", &cells))
> +               dev_dbg(&pdev->dev, "Missing gpio-cells property\n");
(...)
> +       chip->gc.of_gpio_n_cells = cells;

Why is this necessary?
Mention in the commit.

Other than that this looks very good and good use
of the hierarchical IRQ feature in gpiolib!

Yours,
Linus Walleij
