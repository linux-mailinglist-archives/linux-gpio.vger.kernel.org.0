Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64EC831F64F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 10:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhBSJKC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 04:10:02 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:37638 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhBSJHo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2021 04:07:44 -0500
Received: by mail-oi1-f172.google.com with SMTP id y199so5163022oia.4;
        Fri, 19 Feb 2021 01:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WMmV+pg/AZEmOZWqm+tCw4vrAAYkC3Vrjkj4xpthz5Q=;
        b=qBgKiSZjiy+AsAFN0BRkVX/1Gy66LIv9oVg43bXGptf9YINb+E7sgU0ToL2VYJ3dxc
         0qV/aSF5W7UNUtpxSHLlmkS+3aYaboSAksG5lfQnxDtwSdFsJcw6brf4/9cUTYT17mUY
         5T4EHvWPojdCgLThd42rOlV3H8qRXMLrw409zEDTbmScYOlaqI9M8CJcFcd1MofGyZ5j
         ArwzDuquJmA97UVRvVWPY4ecCiWWgEw8dVbWeeFxThvAU6O1M3kRia6glxTCCcYTdYcz
         QjPzzbpjmbzupL/egG/ShZHTCYbqMZVdvuY2geEjMORCLXq8tUqH25fRNS58pidM/ziL
         7hNw==
X-Gm-Message-State: AOAM530nNbtcIbOCFXE8B1KJ1u4mg0NyC5TSKwWTqDZDlBrOoNJ8oubT
        k3mtI/rQMLFocNPmukrDzPL18rU+FY49bcfGUdA=
X-Google-Smtp-Source: ABdhPJxUDGyEvmeXZSHKn0xtxAcKCVUH2HgwBut5V3rBKZFoINqT1AaIOH4mYn/CXF7oGXnaG4WgBw+wf8B4k5R8xDM=
X-Received: by 2002:aca:744:: with SMTP id 65mr5682790oih.153.1613725622900;
 Fri, 19 Feb 2021 01:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20210217221457.1827266-1-drew@beagleboard.org> <20210217221457.1827266-3-drew@beagleboard.org>
In-Reply-To: <20210217221457.1827266-3-drew@beagleboard.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Feb 2021 10:06:51 +0100
Message-ID: <CAMuHMdXNz8ZbFXRgYCGuAd1+Cz8xTvMc-rkwXXiE-E-Fb5XXNA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] pinctrl: pinmux: Add pinmux-select debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

On Wed, Feb 17, 2021 at 11:15 PM Drew Fustini <drew@beagleboard.org> wrote:
> Add "pinmux-select" to debugfs which will activate a function and group:
>
>   echo "<function-name group-name>" > pinmux-select
>
> The write operation pinmux_select() handles this by checking that the
> names map to valid selectors and then calling ops->set_mux().
>
> The existing "pinmux-functions" debugfs file lists the pin functions
> registered for the pin controller. For example:
>
>   function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
>   function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
>   function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
>   function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
>   function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
>   function: pinmux-spi1, groups = [ pinmux-spi1-pins ]
>
> To activate function pinmux-i2c1 and group pinmux-i2c1-pins:
>
>   echo "pinmux-i2c1 pinmux-i2c1-pins" > pinmux-select
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Thanks for your patch!

On R-Car M2-W, which does not use pinctrl-single, I have:

    # cat pinmux-functions
    ...
    function 14: i2c2, groups = [ i2c2 i2c2_b i2c2_c i2c2_d ]
    ...
    function 51: ssi, groups = [ ssi0_data ssi0_data_b ssi0129_ctrl
ssi0129_ctrl_b ssi1_data ssi1_data_b ssi1_ctrl ssi1_ctrl_b ssi2_data
ssi2_ctrl ssi3_data ssi34_ctrl ssi4_data ssi4_ctrl ssi5_data ssi5_ctrl
ssi6_data ssi6_ctrl ssi7_data ssi7_data_b ssi78_ctrl ssi78_ctrl_b
ssi8_data ssi8_data_b ssi9_data ssi9_data_b ssi9_ctrl ssi9_ctrl_b ]
    ...

On the Koelsch board:

    # cd /sys/kernel/debug/pinctrl/e6060000.pinctrl-sh-pfc/
    # echo ssi ssi2_ctrl > pinmux-select # Configure i2c2 pins for ssi
    # i2cdetect -y -a 2                  # Fails
    # echo i2c2 i2c2 > pinmux-select     # Restore i2c2
    # i2cdetect -y -a 2                  # Works again

The order of the 2 parameters looks a bit odd to me, as the operation
configures the pins from "group" to be used for "function".
See also arch/arm/boot/dts/r8a7791-koelsch.dts
For the i2c2 example it's not that obvious, but for ssi it is.
Might feel different for pinctrl-single, and perhaps I just need to get
used to it ;-)

Anyway:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
