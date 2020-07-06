Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C04215890
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 15:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbgGFNf0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 09:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729504AbgGFNf0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 09:35:26 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05DDC061755
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2020 06:35:25 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a6so40959740wrm.4
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2020 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TwRaXXg7E7jBcwnisCzmd9CCb64NumaI1yqAGCRGlUw=;
        b=JRscr/6ERmVk2G6uaVBsBZG3LvRVatujJkjP2P/JH/QEhNkr6vYL/4IqfMeUlYU7/k
         zeT6z3Ddp6b+6sYwX5CjBK61TVOv8hNXl7vT+NPh01Wx5P0cvCpmBnZ20sZQe/rNYjdh
         c3LjBzUdCkv6ADmhqWauffifBwhpW1AALIivDHPAROPxCqQ/JQuOvr7me89KRLptauE4
         ApYPQNss/g9k3w+xa4HhwObUtupl08qWfCE4cfAPQ78RYUVvV//QS479cIRYXZYoGMvA
         Vihjld8m3v1NUC+KLdBFkOCMCfrbbFkxUv/5UFNM92ExiMqgKHMDsSqDq/tYG+K6Yyjp
         ni4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TwRaXXg7E7jBcwnisCzmd9CCb64NumaI1yqAGCRGlUw=;
        b=jX5v3FpXW7j8b3D3e13sQYcY2pIA3kYyXTh8NpZHPhha2u0adzPPu05JjpGKeaUZsu
         1lhai0ys34EK9QWNTQ7CNqiyDTF56nwLgNdOrTCcpRqNMk7ZTPc+lwvhydFxm/1xk/09
         fUKd5YLTXZqXQkgoX2nInllbBDQiP5JXxsS7gm2Sxi3ZDBbtdwdjgF85RAS5mH/qf+7V
         sz4pPySvOa1ve3Rc4ZZmYMHIkzbBigaqAUUvVC3FHJV588XYeefyxMFbQykwNomsIzDF
         eTlUyaCOVB9aBrXpvTTBCODl5ulVruGMLXW+9QIHR0xTrdHImdZCNvyEhJFtmvZw+gG8
         nw1g==
X-Gm-Message-State: AOAM532hebuazzBeHWuo1GPMede5c8t9cCp8bXNom3dLU2I2WrnXeGbK
        ny93lR4HIXFOf8tsBiwFv+TA7g==
X-Google-Smtp-Source: ABdhPJxsd1TSg/0x6WHfJSKJ7k870wVhTIJR9bNB5uijYRkNvin/5XdgqsRClJZwgFc2+whwywPWjw==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr46913216wru.88.1594042524342;
        Mon, 06 Jul 2020 06:35:24 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id d28sm26415678wrc.50.2020.07.06.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:35:23 -0700 (PDT)
Date:   Mon, 6 Jul 2020 15:35:19 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Rodolfo Giometti <giometti@enneenne.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [RFC] GPIO User I/O
Message-ID: <20200706133519.GA1046717@x1>
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 06, 2020 at 02:19:49PM +0200, Rodolfo Giometti wrote:
> Hello,
> 
> at the moment if a developer wishes to use a GPIO as output or input with a well
> defined name from userspace via the sysfs interface he/she can use,
> respectively, the gpio-leds or gpio-uinput devices. However, IMHO, this is not
> the best nor a proper way to do it, that's why I'm here to propose this really
> simple interface named GPIO_UIO.
> 
> That's why I wrote the attached patch (for kernel 4.19) which it's just a
> proposal, and the purpose of this message is to collect feedback about this
> solution. Of course I'll be happy to port it for latest kernel release and
> complete it with all requested documentation and needed modifications, but I'll
> do it only if this patch has some changes to be accepted by GPIO subsystem's
> maintainers. :)
> 
> For the moment here is how it works:
> 
> 1) The patch is activated by the configuration entry CONFIG_GPIO_UIO.
> 
> 2) In the device-tree the developer defines all board's GPIO lines with their
> names and mode of functioning:
> 
> +       gpio_uio {
> +               compatible = "gpio-uio";
> +
> +               bypass0 {
> +                       gpios = <&gpionb 10 GPIO_ACTIVE_HIGH>;
> +                       mode = "out-low";
> +               };
> +
> +               bypass1 {
> +                       gpios = <&gpiosb 11 GPIO_ACTIVE_HIGH>;
> +                       mode = "out-low";
> +                       label = "bypass-1";
> +               };
> +        };
> 
> Property "mode" can be "asis", "input", "out-low", etc. and the property label
> can be used in case the GPIO line's name should be different from the node's name.
> 
> 3) At boot the GPIO lines are added:
> 
> [    2.398902] gpio-uio bypass0: line added
> [    2.423558] gpio-uio bypass-1: line added
> 
> 4) Then users will find a new class with entries, one for each new line:
> 
> # ls /sys/class/gpio-uio/
> bypass-1  bypass0
> 
> 5) By using the attribute "line" the users can get or set the line status
> 
> # cat /sys/class/gpio-uio/bypass-1/line
> 0
> # echo 1 > /sys/class/gpio-uio/bypass-1/line
> # cat /sys/class/gpio-uio/bypass-1/line
> 1
> 
> 6) Developers can monitor the GPIO lines via debugfs as for kernel modules:
> 
> # cat /sys/kernel/debug/gpio
> gpiochip1: GPIOs 446-475, parent: platform/d0018800.pinctrl, GPIO2:
>  gpio-457 (                    |bypass-1            ) out lo
> 
> gpiochip0: GPIOs 476-511, parent: platform/d0013800.pinctrl, GPIO1:
>  gpio-479 (                    |cd                  ) in  hi IRQ
>  gpio-480 (                    |vcc_sd1             ) out lo
>  gpio-486 (                    |bypass0             ) out lo

This is similar to an out-of-tree driver we use in the kernel build for
our BeagleBoard.org Debian images called gpio-of-helper [0].

It is a DT based driver created by Pantelis Antoniou back in 2013.  It
allows our downstream BeagleBoard.org dts files to describe the gpio
lines that will be controlled from userspace.  We failed to get the
driver upstream back then, and it has remained out-of-tree since.

Currently, I am trying to shrink our out-of-tree patches [1] so we can
eventually get our BeagleBoard.org kernel builds on to mainline. Thus
coming up with a mainline solution for this is important to me. I was to
chat virtually last week with Bart [2], Geert and Linus and it does seem
like the new GPIO aggregator [3] could address this use case. I need to
do some experimentation to understand how that would work.

Regards,
Drew

[0] https://github.com/beagleboard/linux/blob/5.4/drivers/gpio/gpio-of-helper.c
[1] https://github.com/RobertCNelson/ti-linux-kernel-dev/tree/ti-linux-5.4.y/patches
[2] https://static.sched.com/hosted_files/ossna2020/67/Linux%20GPIO-Evolution%20and%20Current%20State%20of%20the%20User%20API.pdf
[3] https://www.kernel.org/doc/html/latest/admin-guide/gpio/gpio-aggregator.html

