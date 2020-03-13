Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53259183DE5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 01:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgCMAiw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 20:38:52 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:45561 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgCMAiw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 20:38:52 -0400
Received: by mail-lf1-f50.google.com with SMTP id b13so6423213lfb.12;
        Thu, 12 Mar 2020 17:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=snVpnAGd/XEPtPPjHQpq2rJ6xYI2D1KtF5KErXLyfNc=;
        b=kO8AmqJOU+KM9qP2BE8ZHr0kKAljWPcAU1wW63SQo4f4kqim0ROgU7TocO0UvimuzP
         VxJeGdEjnxKqBtNNE0m+sOoYxHInxhEP4fHZGZ8GXM6d2FWKLhHsgfK9ES6XRp+8+iI6
         Gkn7lVExsXheiI3v7cJp6w5OcJ1BiFWJk74UctZt13R4ycSJxuNxpVk5kzUWhSVEO93e
         oJHxopgo6np9KnFMkMHWhQiVidjUReVIsAfN5tXh5I7wjW7heuSJfNzd8aVXBSR5hRw2
         E952aaseIWKsbYmkT1dY4I/je0es4DaEZ5MhuKOjOsq7Cv7afYmstKjPppuoV3eMK3W1
         Yg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=snVpnAGd/XEPtPPjHQpq2rJ6xYI2D1KtF5KErXLyfNc=;
        b=mTMflYpU0z+KRaNR0KjB4WmKVIyDTMvJeVoG7419jmymI2NJ83i0qKBb2TQfPQ6/hj
         pJtO0a5BacMW6WwlPI2NnnpqCaQH2F0jF6H09e2/MdS/+YzrpZXMjNb/DKJnydKT/Rt7
         8YC70tNaNwBRfiVwJPcdsoscMfpT7j7ctqxE0AXsrcn2eD7G0Yhlv62R/TJwsCYKPyDE
         gF7Rg8RCQjZGH/OzObJ+uNH7M9J+yh+oTRmZjyQx1avnSerfjzJqP2pRHj9QOrBoeAA0
         9XDkmgKl99G85HyWTYw5obCLcVNCQ12+h3hBfgVT7Fhdq1zQPEMU/U0r+ET+r51FLMO5
         RYRQ==
X-Gm-Message-State: ANhLgQ23QamB96WaelpvE/YCdB4ThtgQHR+SRPtA+fQgP5A++EMpil5y
        hibrfamQaeBZN83wzL33UesG6z1NhW3MQMLSmRw=
X-Google-Smtp-Source: ADFU+vtTVjJ+RxjxbR7JULOQJhmBILTR/P/ggcbgW2SaHaxZT4d05DxUBzxF/wBT+F5bZ4L6qd1clmpi3RgqODdEerM=
X-Received: by 2002:a19:4cc4:: with SMTP id z187mr6667902lfa.49.1584059929444;
 Thu, 12 Mar 2020 17:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
 <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
In-Reply-To: <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Fri, 13 Mar 2020 03:39:13 +0300
Message-ID: <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 12, 2020 at 1:43 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> Do we have a datasheet for this GPIO block somewhere? Should
> be the datasheet for the ASIC.

I am looking at the AM335x reference manual [0] but I can not actually
find any references to pull-up/down or bias for GPIO pins.  I guess I
was making of the mistake of assuming this would be something the gpio
pins support.

> We already have the required .set_config() callback on the OMAP
> driver, it's just that it only uses it for debounce.
>
> The driver is a bit convoluted with register offsets in a struct
> omap_gpio_reg_offs depending on variant, but if they have
> a register for this I'd say just get hacking.
>
> If the GPIO driver is using pin control as back-end you are
> looking at something more complex similar to what Intel is
> doing inside drivers/pinctrl/intel/pinctrl-intel.c: this driver
> is just calling up to gpiochip_generic_config() which will
> try to configure the lines behind the GPIO using pin config,
> which works if the proper ranges are defined so the
> framework can map a GPIO line to a pin control pin.

Thank you for the feedback, Linus.

Upon further review of drivers/pinctrl/pinctrl-single.c, I am not
certain it actually supports pull-up/down.

I see there is pcs_pinconf_clear_bias() and pcs_pinconf_bias_disable()
but I don't see a place where the PIN_CONFIG_BIAS_PULL_DOWN or
PIN_CONFIG_BIAS_PULL_UP get set.

I'll have to look at that some more before I go back to thinking about
how to integrate into gpio-omap.

Thanks,
Drew

[0] http://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
