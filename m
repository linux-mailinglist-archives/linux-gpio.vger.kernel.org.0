Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBEA5220630
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2020 09:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbgGOHa0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jul 2020 03:30:26 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:40396 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728888AbgGOHa0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2020 03:30:26 -0400
Received: by mail-oo1-f66.google.com with SMTP id p26so275694oos.7;
        Wed, 15 Jul 2020 00:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RLNkBPIW71RcOqElB3Id5RxSoGdsejG2KtjK1rMAFHY=;
        b=YNBw4OmW97icHYFH3RxLG5i6hChddV/tKD10rh2DLgdp9k2LQYLScp27mnCNP+IS+A
         BKJs8YMj/39XFtvaLrZ5yLkKSmyjcDwgjzYRV1eqjtNl6dftZvYkK8pHAWx8LYUUavj3
         7V8POU1C6HF3HVgDOkEXnEDD64xYxQzQPYCnVzVwPf9YgXjobAGkGXcQ4GOcI8JZ10aN
         5X2ro1Ywu+p9PDLjV8cX46a/7cUBiOmNld6PpdrCE8xPQ2cO1IZwJ2Zn4PpFern7+xqQ
         r0Iyms39EhsHxDgf7Kwgg7Fvkv+qpM+Rs4w051k376d5YYI5XPme2DytGJKoCLNep1or
         2zag==
X-Gm-Message-State: AOAM532TQyI1lLnNnjzs41Oj2L/sC9Q+QhlOInTnuMBq+L8KavuFKlyT
        b3x+m8rVeMB7WP6G0wW9qTeo68Mron0Wxbotz4fUfFQJ
X-Google-Smtp-Source: ABdhPJwUcUtIg7K2JzyI+BERW5m83JdHkH6A19d4/+jRcXY/W3rEJUYw/7y2g8mT8rfWN3ZWRip0YQBAdckvjUkwTN8=
X-Received: by 2002:a4a:8c2f:: with SMTP id u44mr8289648ooj.11.1594798225239;
 Wed, 15 Jul 2020 00:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200713144930.1034632-1-lee.jones@linaro.org> <20200713144930.1034632-21-lee.jones@linaro.org>
In-Reply-To: <20200713144930.1034632-21-lee.jones@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 09:30:14 +0200
Message-ID: <CAMuHMdWMUN8sU09J1eSsSJ9sXMhf10GUHeP47UDf6+yp8vnAnw@mail.gmail.com>
Subject: Re: [PATCH 20/25] pinctrl: pinctrl-rza1: Demote some kerneldoc
 headers and fix others
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lee,

On Mon, Jul 13, 2020 at 4:49 PM Lee Jones <lee.jones@linaro.org> wrote:
> Some description blocks are void of any description/documentation,
> others are missing 'struct' identifiers, there are also a couple of
> misspellings of function parameter names.  Fix all of them.
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/pinctrl/pinctrl-rza1.c:81: warning: cannot understand function prototype: 'struct rza1_bidir_pin '
>  drivers/pinctrl/pinctrl-rza1.c:90: warning: cannot understand function prototype: 'struct rza1_bidir_entry '
>  drivers/pinctrl/pinctrl-rza1.c:98: warning: cannot understand function prototype: 'struct rza1_swio_pin '
>  drivers/pinctrl/pinctrl-rza1.c:108: warning: cannot understand function prototype: 'struct rza1_swio_entry '
>  drivers/pinctrl/pinctrl-rza1.c:116: warning: cannot understand function prototype: 'struct rza1_pinmux_conf '
>  drivers/pinctrl/pinctrl-rza1.c:443: warning: cannot understand function prototype: 'struct rza1_mux_conf '
>  drivers/pinctrl/pinctrl-rza1.c:462: warning: cannot understand function prototype: 'struct rza1_port '
>  drivers/pinctrl/pinctrl-rza1.c:482: warning: cannot understand function prototype: 'struct rza1_pinctrl '
>  drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'port' not described in 'rza1_pinmux_get_flags'
>  drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'pin' not described in 'rza1_pinmux_get_flags'
>  drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'func' not described in 'rza1_pinmux_get_flags'
>  drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'rza1_pctl' not described in 'rza1_pinmux_get_flags'
>  drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'port' not described in 'rza1_set_bit'
>  drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'reg' not described in 'rza1_set_bit'
>  drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'bit' not described in 'rza1_set_bit'
>  drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'set' not described in 'rza1_set_bit'
>  drivers/pinctrl/pinctrl-rza1.c:672: warning: Function parameter or member 'rza1_pctl' not described in 'rza1_pin_mux_single'
>  drivers/pinctrl/pinctrl-rza1.c:672: warning: Excess function parameter 'pinctrl' description in 'rza1_pin_mux_single'
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
