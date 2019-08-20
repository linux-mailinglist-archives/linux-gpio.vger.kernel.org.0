Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81CE295CD3
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 13:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729556AbfHTLFR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 20 Aug 2019 07:05:17 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46632 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728503AbfHTLFR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 07:05:17 -0400
Received: by mail-ot1-f67.google.com with SMTP id z17so4617743otk.13
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 04:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3YGrbSkleZN3Kg35RZrdrl0Ec9/FU7SXMwQ/xlIPzrw=;
        b=Wj2pNvWLOzIVun3mzcqMrDFDQXJVSMNXYQgFWzivEyGuS52MBqJ07fxO0JSbvunM9X
         PvV98OWlQrJJmx21mSpvMYPld70jM3El+GeGNgAR2+AW31yHm9EsPeH3dTRoJ8xyj3P8
         Dw+7x4mfV7/IVdEUmAYSjFR6mmu2CZkkBccpzz/+n0/5ZsuyuMe2frNbuLrAa3PmGXKM
         M/13EclZm48vLH45YJYo4B9ItSKvJsk5KemwrntHpNE0aqXfXmyVWI/wgg/jImMwuFmS
         3Z219gchJOtrFc+Zd8zgnHM9R5qx6a5x/j/5Amrg6YvomfV7/uTtuzSjG25jivHEGiHo
         9rcw==
X-Gm-Message-State: APjAAAUasB5qrMyICykSEXCs7Oy80pq6QDtD7a9Clqvg6XliJ3CCcGHv
        BxRPCTi2+eZTsDCOd01/uhHhBD7IZdKeYqlFf+zCaayc
X-Google-Smtp-Source: APXvYqyptuLlf0Zd1DqIEYCDiqQxmd90vhMK+Rcl/Z9BDnkUncwy37EKLmuObnDIsT/OmzzZW978f3bnSEeruOJAfAk=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr22729287otn.297.1566299116379;
 Tue, 20 Aug 2019 04:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190820104252.8255-1-linus.walleij@linaro.org>
In-Reply-To: <20190820104252.8255-1-linus.walleij@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Aug 2019 13:05:04 +0200
Message-ID: <CAMuHMdWMA6r_-esqHUVkbMvQZs2o_BMyB_XS8UZUTrqwOMGCPw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rza2: Include the appropriate headers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Aug 20, 2019 at 12:44 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> This driver is implementing a GPIO driver so include
> <linux/gpio/driver.h> and not the legacy API <linux/gpio.h>.
> When testing it turns out it also relies on implicit
> inclusion of <linux/io.h> (readw etc) so make sure to
> include that as well.
>
> Cc: Chris Brandt <chris.brandt@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Geert: assuming you will pick this up if you're happy
> with it.

Unfortunately shmobile_defconfig is not happy with it:

drivers/pinctrl/pinctrl-rza2.c: In function ‘rza2_pin_to_gpio’:
drivers/pinctrl/pinctrl-rza2.c:119:13: error: ‘GPIOF_DIR_IN’
undeclared (first use in this function); did you mean ‘_IOC_DIRBITS’?
drivers/pinctrl/pinctrl-rza2.c:119:13: note: each undeclared
identifier is reported only once for each function it appears in
drivers/pinctrl/pinctrl-rza2.c: In function ‘rza2_chip_get_direction’:
drivers/pinctrl/pinctrl-rza2.c:138:10: error: ‘GPIOF_DIR_OUT’
undeclared (first use in this function); did you mean ‘IOC_INOUT’?
drivers/pinctrl/pinctrl-rza2.c:141:10: error: ‘GPIOF_DIR_IN’
undeclared (first use in this function); did you mean ‘GPIOF_DIR_OUT’?
drivers/pinctrl/pinctrl-rza2.c: In function ‘rza2_chip_direction_input’:
drivers/pinctrl/pinctrl-rza2.c:157:39: error: ‘GPIOF_DIR_IN’
undeclared (first use in this function); did you mean ‘_IOC_DIRBITS’?
drivers/pinctrl/pinctrl-rza2.c: In function ‘rza2_chip_direction_output’:
drivers/pinctrl/pinctrl-rza2.c:195:39: error: ‘GPIOF_DIR_OUT’
undeclared (first use in this function); did you mean ‘IOC_INOUT’?

Are there prerequisites? It even fails on gpio/for-next.

> --- a/drivers/pinctrl/pinctrl-rza2.c
> +++ b/drivers/pinctrl/pinctrl-rza2.c
> @@ -11,7 +11,8 @@
>   */
>
>  #include <linux/bitops.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/pinctrl/pinmux.h>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
