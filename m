Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A302F3B2DC9
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 13:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbhFXL0e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 07:26:34 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:44731 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232350AbhFXL0d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 07:26:33 -0400
Received: by mail-vs1-f47.google.com with SMTP id y21so851816vsm.11;
        Thu, 24 Jun 2021 04:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lVDFM2egDpvqnDo30q1IPYbxI0B4Ih+sEd5+e011q5M=;
        b=mNjwajiMNZjOetYajKbUpKEGvcRF3iFrynkLyKwl0+/AtMDJSjtH7JWbic/8L5aZ/L
         rW/USZJ+DNTnLdLc5EFCqsPOd/C7ZnTjwABrE1crsurxRbt1omg8vP7oj1CiK0FXTJD3
         gXXy4k8TT3e1IYsoAmO9i21WElYgnmmn2iQDL4eOfMHZoAQ1Aq6YIjmB3BpGAb9Pshk9
         CBDMLwSAH94Hwq0Fq0IrzmTvRCWX6MbnKgmgi7YeBVY+JTqcCE4ulTFXp5N4KnQl6OoZ
         pLi+XLTGut+NvvUujiJ1Q+ISYgI5ji8+iBLIizs2Pd8T0CElsAaOkM5p2YNVN/eI+i69
         BBtA==
X-Gm-Message-State: AOAM531TILFuH8UcbHohxeKyUfWYhDWYO0q9c3+HnHWObbMfe1+zZHW2
        G/rEg3wmdE4YclIBSuV8tCECvto4s/DibAkfIXE=
X-Google-Smtp-Source: ABdhPJwA1CABlFUl6laeiRuNOWNPw1TAWvmkoUaSFwr8okRvwOZJ8lcaUCWt+U/3kUZmWvhrxPVt0Bck8wAPZnaurNE=
X-Received: by 2002:a05:6102:301c:: with SMTP id s28mr1364307vsa.18.1624533854391;
 Thu, 24 Jun 2021 04:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210616132641.29087-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210616132641.29087-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210616132641.29087-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Jun 2021 13:24:03 +0200
Message-ID: <CAMuHMdX67Ghrw4mHt6hT+QrMtEjuOTtirHWv17Eix4XnnwMHkw@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: renesas: Add pins/groups/functions for I2C,
 SCIF and USB supported by RZ/G2L SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Wed, Jun 16, 2021 at 3:27 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add pins/groups/functions for I2C, SCIF and USB supported by RZ/G2L SoC and
> bind it with RZ/G2L PFC core.
>
> Based on a patch in the BSP by Hien Huynh <hien.huynh.px@renesas.com>.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pfc-r9a07g044.c
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * R9A07G044 processor support - pinctrl GPIO hardware block.
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +#include "pinctrl-rzg2l.h"
> +
> +#define RZG2L_GPIO_PIN_CONF    (0)
> +
> +static const struct {
> +       struct pinctrl_pin_desc pin_gpio[392];
> +} pinmux_pins = {
> +       .pin_gpio = {
> +               RZ_G2L_PINCTRL_PIN_GPIO(0, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(1, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(2, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(3, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(4, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(5, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(6, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(7, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(8, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(9, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(10, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(11, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(12, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(13, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(14, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(15, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(16, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(17, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(18, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(19, RZG2L_GPIO_PIN_CONF),

RZG2L_GPIO_PIN_CONF is 0, ike all of the below?

> +               RZ_G2L_PINCTRL_PIN_GPIO(20, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(21, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(22, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(23, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(24, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(25, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(26, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(27, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(28, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(29, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(30, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(31, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(32, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(33, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(34, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(35, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(36, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(37, 0),
> +               RZ_G2L_PINCTRL_PIN_GPIO(38, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(39, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(40, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(41, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(42, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(43, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(44, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(45, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(46, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(47, RZG2L_GPIO_PIN_CONF),
> +               RZ_G2L_PINCTRL_PIN_GPIO(48, RZG2L_GPIO_PIN_CONF),
> +       },
> +};

Doesn't the above belong in pinctrl-rzg2l.c?

> +
> +/* - RIIC2 ------------------------------------------------------------------ */
> +static int i2c2_a_pins[] = {
> +       /* SDA, SCL */
> +       RZ_G2L_PIN(3, 0), RZ_G2L_PIN(3, 1),
> +};
> +static int i2c2_b_pins[] = {
> +       /* SDA, SCL */
> +       RZ_G2L_PIN(19, 0), RZ_G2L_PIN(19, 1),
> +};
> +static int i2c2_c_pins[] = {
> +       /* SDA, SCL */
> +       RZ_G2L_PIN(42, 3), RZ_G2L_PIN(42, 4),
> +};
> +static int i2c2_d_pins[] = {
> +       /* SDA, SCL */
> +       RZ_G2L_PIN(46, 0), RZ_G2L_PIN(46, 1),
> +};
> +static int i2c2_e_pins[] = {
> +       /* SDA, SCL */
> +       RZ_G2L_PIN(48, 0), RZ_G2L_PIN(48, 1),
> +};

[...]

> +static struct group_desc pinmux_groups[] = {
> +       RZ_G2L_PINCTRL_PIN_GROUP(i2c2_a, 2),
> +       RZ_G2L_PINCTRL_PIN_GROUP(i2c2_b, 4),
> +       RZ_G2L_PINCTRL_PIN_GROUP(i2c2_c, 1),
> +       RZ_G2L_PINCTRL_PIN_GROUP(i2c2_d, 4),
> +       RZ_G2L_PINCTRL_PIN_GROUP(i2c2_e, 3),

[...]

As RZ/G2L, unlike R-Car, does not have the concept of pin groups, I'm
wondering why you are defining these groups? The pin function list
spreadsheet also doesn't have the "a" to "e" names of the possible
alternatives.
While I agree it makes it a little bit easier to describe in DT the
use of a group with lots of pins, it does prevent other use cases.
As register configuration is per-pin, I believe the hardware supports
the use of pins from multiple groups (e.g. SDA from the first group,
and SCL from the second group), and thus the board designer may decide
to make use of that.

With pinmux_pins[] moved, and the groups removed, this file becomes
empty?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
