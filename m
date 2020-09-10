Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E59263BBB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 06:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgIJEK1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 00:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgIJEKS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 00:10:18 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACC8C061573;
        Wed,  9 Sep 2020 21:10:18 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id e23so6665999eja.3;
        Wed, 09 Sep 2020 21:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YGErWqzdCXUZ8GEfs8VwODgLH3bAUZ+0e535T36z444=;
        b=MrXS4SRuYdMUw6uafhVbvyAIYTv8AlL+Z+TnwQZyduJLIkfYW4D8TXDPOlI7SUm7nN
         fJmWR7aK/fZk4xmeMya3O2TSn+uN0CHBUKbTTfGbGD9ajBq8+wFU0ZRJGzEasjfULvV1
         S2M/NVRthwLSJUy5Adch0OTHRU9+eEXxlJLs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YGErWqzdCXUZ8GEfs8VwODgLH3bAUZ+0e535T36z444=;
        b=az20f0OE0bT7ZunvwkeKp2ijgCFiDs2MER4sTgZ58myQhiqLtXDzMYA7tM6UA+BpCD
         63ShoxBs4QdF/kF8qcnWXPUHhrm5amT6H9V1OGBdEoi3hNkUfy99akDVmDktjBAIA4kS
         hCzjjo4QXev61ysJ+eXiAJaJj8ZoBUQDXDZActcoUtfr5fpzDaDVLBx5zMaNyNpvIjgt
         7pgIck1tJA8/12pHIy7gV54mgPdEUxHp0CcVS8d25FsxffFyfeRaPODp404FzC8TIGHR
         uQrgM07KZP90CyuthA0c977zrw89n4x6o9/AAZnx9O1gNVP572VeB0EaJhtHYtvguUDA
         i5Fw==
X-Gm-Message-State: AOAM532KCQ+rZGAvivpflfwS6bBmEsj/v6RyowOouVWvHlxw+DbTTCTd
        FjXM9CuZ/6MShxHf/NcG+88XeEX7SS8GvkD83CzIlBVYhPQ=
X-Google-Smtp-Source: ABdhPJz4dWpkLm01ZcAHO4YymAk5+CGB8BtAUfcYjnJcZYzn6Tx7X1lqIF00zYCcs542WIWNqCpkqfnaZlZ0xnNqKCY=
X-Received: by 2002:a17:906:fcc7:: with SMTP id qx7mr7292901ejb.254.1599711016851;
 Wed, 09 Sep 2020 21:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200715135418.3194860-1-jk@codeconstruct.com.au>
In-Reply-To: <20200715135418.3194860-1-jk@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 10 Sep 2020 04:10:05 +0000
Message-ID: <CACPK8XcT02qv+1H=DDv8BRAdUmrBoweZ+Qb3aG34bQ9-UC08Xg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio/aspeed-sgpio: enable access to all 80 input &
 output sgpios
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 15 Jul 2020 at 14:06, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Currently, the aspeed-sgpio driver exposes up to 80 GPIO lines,
> corresponding to the 80 status bits available in hardware. Each of these
> lines can be configured as either an input or an output.
>
> However, each of these GPIOs is actually an input *and* an output; we
> actually have 80 inputs plus 80 outputs.
>
> This change expands the maximum number of GPIOs to 160; the lower half
> of this range are the input-only GPIOs, the upper half are the outputs.
> We fix the GPIO directions to correspond to this mapping.
>
> This also fixes a bug when setting GPIOs - we were reading from the
> input register, making it impossible to set more than one output GPIO.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

A Fixes: might be a good idea.

> ---
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt |   5 +-
>  drivers/gpio/gpio-aspeed-sgpio.c              | 115 +++++++++++-------
>  2 files changed, 77 insertions(+), 43 deletions(-)

> diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> index 8319812593e3..927d46f159b8 100644
> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> @@ -17,7 +17,8 @@
>  #include <linux/spinlock.h>
>  #include <linux/string.h>
>
> -#define MAX_NR_SGPIO                   80
> +#define MAX_NR_HW_SGPIO                        80
> +#define SGPIO_OUTPUT_OFFSET            MAX_NR_HW_SGPIO

A short comment explaining what's going on with these defines (as you
did in your commit message) will help future reviewers.

> +static void aspeed_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
> +               unsigned long *valid_mask, unsigned int ngpios)
> +{
> +       struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
> +       int n = sgpio->n_sgpio;
> +
> +       WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
> +
> +       /* input GPIOs in the lower range */
> +       bitmap_set(valid_mask, 0, n);
> +       bitmap_clear(valid_mask, n, ngpios - n);
> +}
> +
> +static const bool aspeed_sgpio_is_input(unsigned int offset)

The 0day bot complained about the 'const' here.

> +{
> +       return offset < SGPIO_OUTPUT_OFFSET;
> +}

>  static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
>  {
>         struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
>         unsigned long flags;
> +       int rc;
>
> -       spin_lock_irqsave(&gpio->lock, flags);
> -
> -       gpio->dir_in[GPIO_BANK(offset)] &= ~GPIO_BIT(offset);
> -       sgpio_set_value(gc, offset, val);
> +       /* No special action is required for setting the direction; we'll
> +        * error-out in sgpio_set_value if this isn't an output GPIO */
>
> +       spin_lock_irqsave(&gpio->lock, flags);
> +       rc = sgpio_set_value(gc, offset, val);
>         spin_unlock_irqrestore(&gpio->lock, flags);
>
>         return 0;

I think this should be 'return rc'

Cheers,

Joel
