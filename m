Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C286A31C228
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 20:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhBOTFg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 14:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhBOTFR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 14:05:17 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37848C061574;
        Mon, 15 Feb 2021 11:04:37 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id q72so4247281pjq.2;
        Mon, 15 Feb 2021 11:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UYLNhytd7v886uc63zcR0navuWwD0MBhzc/Hcb/3Fes=;
        b=JSKxY4XB8WZHE5qtWbRYvmsVYnQRuZPNSKpgNcNrnlVqEb+6UzIbdh8qb9TgiT9iDI
         Vot28fUfuhqOpo3alSF9jo84spixGtwyC84JeqLW3Lq2XeNhYqI8j5q84iIsLDhSPZ/k
         aUECjf6X/N2AJM4qeU5sS2kzQUKHGwDWPFwjjnaZVVChhOkvI3FEIuMSKqG5ZOPaADS3
         LPcEMUDUQ09UPU59skjxKeBe3x5w/8In3IWAUWyps9xPoc3fmRK+10WtMmPlOK4rCCDC
         igNKKgjsNZL2P7AW1RcFfXBpSh2sougZCUiN3xVjZHzrc3T3wpH/WhHEs2MuHOjwQJ1z
         jdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UYLNhytd7v886uc63zcR0navuWwD0MBhzc/Hcb/3Fes=;
        b=TXnXlczYJQ0hgmbiUKIHNoGyYHwBuwKK7ItaqPStcNqXP/zG7PhsoA83kMsJxB0yyJ
         5hxm3p9ysqeE9UfxVLnke/sdAVPgAA6TyvgTLj5uSnlU0cy9GrRxEhq2XmVtgAih4NIy
         JmwFONp4jVllbfQk9eV73cNmwhqe/UQ9jQwU8yc/PHZ95CHkE0+qzph/p/Drh1ANOP+B
         WKtvL/KKKsN7tzaP1V4MM9Rl7o1ndywc9t+meI2CytKOBIICnQ7DMokDAI2RzxvtqiEC
         fMxU59XiRhkjmIPovxSQ8HhG+dJCoHkEUnBcMMVmDvLjMq+/H0v/Zk7/mPwH0zZWrxPt
         Z33w==
X-Gm-Message-State: AOAM5334g3e/a8NcJBW/blNWt9pTuS4VOrUN27DhckBFo1HMvM276pxW
        VbZqYP2lL3DBnyYAu3/WFjFk+BWhyKvZS/SXfzw=
X-Google-Smtp-Source: ABdhPJzWYouTEy9alTWPz12A0fG9sL5WQUk6HAAMeSkjDHq6gen24qQK2T+1wI/b3HXKW+zB9tJteGl+aAXo+XwIaY4=
X-Received: by 2002:a17:902:a710:b029:e3:b18:7e5b with SMTP id
 w16-20020a170902a710b02900e30b187e5bmr16271877plq.17.1613415876685; Mon, 15
 Feb 2021 11:04:36 -0800 (PST)
MIME-Version: 1.0
References: <20210212223015.727608-1-drew@beagleboard.org> <20210212223015.727608-3-drew@beagleboard.org>
In-Reply-To: <20210212223015.727608-3-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Feb 2021 21:04:20 +0200
Message-ID: <CAHp75VeqbKjg7pLCgO9-vd2NnqQy6VPaRFKrAWn-1TaJgi1-SA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 13, 2021 at 12:30 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Add "pinmux-select" to debugfs which will activate a function and group
> when "<function-name group-name>" are written to the file. The write

The non-standard way of showing parameters, I would write that as
 "<function-name> <group-name>".

> operation pinmux_select() handles this by checking that the names map to
> valid selectors and then calling ops->set_mux().
>
> The existing "pinmux-functions" debugfs file lists the pin functions
> registered for the pin controller. For example:
>
> function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
> function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
> function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
> function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
> function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
> function: pinmux-spi1, groups = [ pinmux-spi1-pins ]

Format this...

> To activate function pinmux-i2c1 and group pinmux-i2c1-pins:
>
> echo "pinmux-i2c1 pinmux-i2c1-pins" > pinmux-select

...and this with two leading spaces (for example) to make sure that
people will understand that these lines are part of the example.

...

>  drivers/pinctrl/pinmux.c | 99 ++++++++++++++++++++++++++++++++++++++++

Still needs a documentation update.

...

> +       const char *usage =
> +               "usage: echo '<function-name> <group-name>' > pinmux-select";

This is quite unusual to have in the kernel. Just return an error
code, everything else should be simply documented.

...

> +       if (len > PINMUX_SELECT_MAX) {

> +               dev_err(pctldev->dev, "write too big for buffer");

Noisy, the user will get an error code and interpret it properly.
So, please drop them all. Otherwise it would be quite easy to exhaust
kernel buffer with this noise and lost the important messages.

> +               return -EINVAL;

To achieve the above, this rather should be -ENOMEM.

> +       }

...

> +       gname = strchr(fname, ' ');
> +       if (!gname) {
> +               dev_err(pctldev->dev, usage);
> +               ret = -EINVAL;
> +               goto free_buf;
> +       }
> +       *gname++ = '\0';

I was thinking about this again and I guess we may allow any amount of
spaces in between and any kind of  (like newline or TAB).
So, taking above into consideration the code may look like this:

/* Take the input and remove leading and trailing spaces of entire buffer */
fname = strstrip(buf);
/* Find a separator, i.e. a space character */
for (gname = fname; !isspace(gname); gname++)
  if (*gname == '\0')
    return -EINVAL;
/* Replace separator with %NUL to terminate first word */
*gname = '\0';
/* Drop space characters between first and second words */
gname = skip_spaces(gname + 1);
if (*gname == '\0')
  return -EINVAL;

But please double check the logic.

...

> +free_buf:

exit_free_buf:

> +       kfree(buf);
> +
> +       return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko
