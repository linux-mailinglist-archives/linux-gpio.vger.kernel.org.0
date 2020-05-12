Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1712D1D0028
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 23:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbgELVJX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 17:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726324AbgELVJW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 17:09:22 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4386EC061A0C;
        Tue, 12 May 2020 14:09:21 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id w6so13901732ilg.1;
        Tue, 12 May 2020 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YA8zNP4b5D3ILHHzh+PoKh6Aq9QfuIQ/xBD90HQx3wM=;
        b=kqKa0iCLug4Ge+sm7fKli2nz0vkdO+EuZS+hztljWSLCTd7ktmaXvBKx8Ej81F5Q50
         AMJvhXN4CmbAoihmr6CO4xLbbWJS22UQ15ahaAIuUWiSbsYFZSHEMlxF9TgRn51FSrjh
         rsSUMrjL7Dxnn4/2Ti6nV8XkG/wR+lzMsO3INwDkhYzG0qH7pV1GSfMTQ9bEKPsTUemm
         aUNVkyHYCnd84UUIiTf5hHx8aXwSIPh7UNnPNSoIvQesreI7glfl5YH3kOhRe/pFLK1M
         iibxp2VtIt9A0vu9j68bB1TOBlrKDMCPnZ4JquL2G4j1nZruY96PrUQkeL8Kgd+mOtH/
         iC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YA8zNP4b5D3ILHHzh+PoKh6Aq9QfuIQ/xBD90HQx3wM=;
        b=RjjcZ93yZxvnl7+SqBsWPBnBSeZqKnbXd/X4gScRZ4sYs02IHGDHlsIydyiaHesiIX
         3M9QAjLDpGkgL3HmLndhRaXKeEaUu/25igngtfYrzrBGLJdVCqvJp9VvOw/vrbI4qZ9M
         cXoCcZpw7f3lbJvJ5cFjG9CGvanT60a5jk/sEqeY3SclVx+qQfca5pSJLo37H17t7h94
         7haOytnn8O64Or+AMfuwdAP61rjGmN2AwMWngxAsJMmaihVqLIvacOuy++qWXVkwYUcn
         ZwG/tZ7OZHKjZsNa7CkEm420FMtuTnI+JLe+oP1IWHar4dG2lgqBbcmXfX7XNYaJ/PVM
         tnBQ==
X-Gm-Message-State: AGi0PuZfQnQ7VJw1E9XEbhBdNKexRD6RhAEuN+BACQa0+DmdOYQFVzaS
        P4cL0WAeybIXuI1CXXAy/VEgcdHRJ07Z5kdJea0=
X-Google-Smtp-Source: APiQypIWzLFfm9ywTEcxOxyz1qFQvElK5xmP5/DecFMolM7jE40MUushb26pwgZUzyMX/wxkLEO6bN4B5/09tPX0ypY=
X-Received: by 2002:a92:7a07:: with SMTP id v7mr24375024ilc.238.1589317760606;
 Tue, 12 May 2020 14:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
 <20200428172322.2.Iacb3c8152c3cf9015a91308678155a578b0cc050@changeid> <a23b7a97f349e6f74b993a4e127564ad3f7d6929.camel@perches.com>
In-Reply-To: <a23b7a97f349e6f74b993a4e127564ad3f7d6929.camel@perches.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 13 May 2020 00:09:07 +0300
Message-ID: <CAHp75VewDvjDJjvKgQ_5v_=Kxp6B1js0J+PrsfP-WC+qa=ogtQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Make "offset" and "unsigned int", not just "unsigned"
To:     Joe Perches <joe@perches.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 3:40 AM Joe Perches <joe@perches.com> wrote:
> On Tue, 2020-04-28 at 17:23 -0700, Douglas Anderson wrote:

...

> +       int     (*request)(struct gpio_chip *gc, unsigned int offset);
> +       void    (*free)(struct gpio_chip *gc, unsigned int offset);
> +       int     (*get_direction)(struct gpio_chip *gc, unsigned int offset);
> +       int     (*direction_input)(struct gpio_chip *gc, unsigned int offset);
> +       int     (*direction_output)(struct gpio_chip *gc,
> +                                   unsigned int offset, int value);

Here...

> +       int     (*get)(struct gpio_chip *gc, unsigned int offset);
> +       int     (*get_multiple)(struct gpio_chip *gc,
> +                               unsigned long *mask, unsigned long *bits);
> +       void    (*set)(struct gpio_chip *gc, unsigned int offset, int value);
> +       void    (*set_multiple)(struct gpio_chip *gc,
> +                               unsigned long *mask, unsigned long *bits);
> +       int     (*set_config)(struct gpio_chip *gc,
> +                             unsigned int offset, unsigned long config);

...and here perhaps offset to move to previous line despite checkpatch warnings.

> +       int     (*to_irq)(struct gpio_chip *gc, unsigned int offset);
> +       void    (*dbg_show)(struct seq_file *s, struct gpio_chip *gc);
> +       int     (*init_valid_mask)(struct gpio_chip *gc,
> +                                  unsigned long *valid_mask,
> +                                  unsigned int ngpios);
> +       int     (*add_pin_ranges)(struct gpio_chip *gc);

-- 
With Best Regards,
Andy Shevchenko
