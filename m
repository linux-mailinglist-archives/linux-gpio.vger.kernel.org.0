Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA9B31F672
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 10:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhBSJVR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 04:21:17 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:41156 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhBSJVL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2021 04:21:11 -0500
Received: by mail-ot1-f51.google.com with SMTP id s107so4510226otb.8;
        Fri, 19 Feb 2021 01:20:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SYEpGoDgvI1QlzJlU8ePdTmRC3GRxsqITcqVy9n45cY=;
        b=KU7VHZPtJ2P5KynNLFYEVRwAgW5VKEcobysHO4UPsWA8NP5ROEDHWWdFud/Ifz/KOE
         knZ2CvMxYthS/W+IQKGI4o5M3sCLEhNIIMOtdNOt3oII5jtNMexU7z7puZbuZhGBNNW/
         w3AeQKUCoQmuyv3jaIfJPabwXbnIq7R9HnvHjv3P0ZuufSjKn3GI3xUjEGik6BQvWvsU
         ZYV/Odkqyad9ZFqI4UTrFbaQIa4G/YdEZGtlDbKsi65OHVVjsF70/K7xNmM1+sHEnr5P
         NmXacrF3VOr2wyRpii2KtqDkQK4urrmeJbfNAY+g5P6YtXAWtcp3a5P7kK5PkGJFcbZ6
         UMaw==
X-Gm-Message-State: AOAM531pHefkQGAVazUcLroHqMG/l0sRWZ+KWRoqbZ8Tl3sB1F5JEjpg
        Nh4OX7/JKn4pGJA7E3K1rDhHe/tGTP+HeVee53A=
X-Google-Smtp-Source: ABdhPJy7q8P2LtwfPYQgkPIegG+jc5n3oogMK/uGMAfvC/1FRtz16dPDqNjkj5uhgwUBUnTzcQR/PzqNDGCa3koXHlc=
X-Received: by 2002:a05:6830:148d:: with SMTP id s13mr6076963otq.250.1613726429698;
 Fri, 19 Feb 2021 01:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20210217221457.1827266-1-drew@beagleboard.org> <20210217221457.1827266-4-drew@beagleboard.org>
In-Reply-To: <20210217221457.1827266-4-drew@beagleboard.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Feb 2021 10:20:18 +0100
Message-ID: <CAMuHMdXrD4-bcTR0ioY20qZOMaDparyFDqCzQr71te1_Uqw4eQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] docs/pinctrl: document debugfs files
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
> Document debugfs directories and files created for pinctrl subsystem.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Thanks for your patch!

> --- a/Documentation/driver-api/pinctl.rst
> +++ b/Documentation/driver-api/pinctl.rst
> @@ -1428,3 +1428,40 @@ on the pins defined by group B::
>  The above has to be done from process context. The reservation of the pins
>  will be done when the state is activated, so in effect one specific pin
>  can be used by different functions at different times on a running system.
> +
> +
> +Debugfs files
> +=============
> +These files are created in ``/sys/kernel/debug/pinctrl``:
> +
> +- ``pinctrl-devices``: prints each pin controller device along with columns to
> +  indicate support for pinmux and pinconf
> +
> +- ``pinctrl-handles``: iterate through the list of pin controller handles and
> +  print the corresponding pinmux maps

Do you need the iterate part?

"prints each configured pin controller handle and the corresponding
 pinmux maps"?

> +
> +- ``pinctrl-maps``: print all pinctrl maps
> +
> +A sub-directory is created inside of ``/sys/kernel/debug/pinctrl`` for each pin
> +controller device containing these files:

Sort the below alphabetically?

> +
> +- ``pins``: prints a line for each pin registered on the pin controller. The
> +  pinctrl driver may add additional information such as register contents.
> +
> +- ``gpio-ranges``: print ranges that map gpio lines to pins on the controller
> +
> +- ``pingroups``: print all pin groups registered on the pin controller
> +
> +- ``pinconf-pins``: print pin config settings for each pin
> +
> +- ``pinconf-groups``: print pin config settings per pin group
> +
> +- ``pinmux-functions``: print each pin function along with the pin groups that
> +  map to the pin function
> +
> +- ``pinmux-pins``: iterate through all pins and print mux owner, gpio owner
> +  and if the pin is a hog
> +
> +- ``pinmux-select``: write to this file to activate a pin function and group::

a pin function for a group?

> +
> +        echo "<function-name group-name>" > pinmux-select

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
