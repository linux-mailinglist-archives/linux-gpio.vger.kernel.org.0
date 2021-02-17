Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F2731D76C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 11:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhBQKSG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 05:18:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbhBQKRv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 05:17:51 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D4AC061756;
        Wed, 17 Feb 2021 02:17:11 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id o38so8178937pgm.9;
        Wed, 17 Feb 2021 02:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uUihTefjqIAmQxqDsY7sGc4WNgB25pgmkvLnHk+zr0M=;
        b=Y40G0VIe6PsED4Mk/qur99QANAUuV3Si698lAW1MFXTXudUdXB3VomSUvUjNntQhFI
         73ON+2fifvwUH8oMmTeH1s5qxt8c0E+wSXtBtjZDU0HSwPn+6M4NtitmQBqnz/pW0k3K
         1LtkIj5oJTwVFUw5dwfvhnXyUmk5Noye4cQlw7m3UnwG6J9CY98ce+ZL04Cl1yveKRlv
         N7jl+8UcSNQ1+evsCUOni2Y0/4VpJg89OkFyjEnzgw9a0jT++8rk3iNoTdABpr3KRm7K
         NitU0idyJq2iGrQ1YvQav7hJq45FMQzZClthXmmD9wtNEBSmoPUA0/7jNFrIY969bObL
         oMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uUihTefjqIAmQxqDsY7sGc4WNgB25pgmkvLnHk+zr0M=;
        b=Qk4sXdJtgL4shHwNtxOa+VQNlb3wpevwR6yiSv+sjMtqUSGWqaLwFpODym20yUBQQf
         KsUTSE6XvDDQjwDf0LSQM2hMpnbZW0/WQXM+swYY1T8ABgXyc4NyXbS0XeaQnkTJl7LS
         cwbAdPIDzECZQTfTjLY8pEinSIh1d5PVAR7XWvMp9gmHckb9/A/aWU5LrF5dUJm/TVk0
         DGk6z4zvHVya1RiNMXEWznjDFpbtwVI2ZLpgtzLmGopL2spBG5DlXoFKIorHiizRC5w+
         KWnDzbNZDXs5ylrKjqBNA1naLw+1CdN9/B8/6cOoSLqfKkDiFdP49vnnomaFUU7YhaWC
         3DfA==
X-Gm-Message-State: AOAM5326wTgkqblAdLyPf46tVMu8c5NcWXdWXeumzX8XcKkFd000rQe9
        3RvGAoq3rU4BUKhz4pDuQnAvDMsI1rQ9x2R6kfg=
X-Google-Smtp-Source: ABdhPJzayHVcbJMk5xLETWxUGMZ9+zU5JUZjBIhFAzTFO4cx477pSIWb8CULht8zMIZXDp7K7kK9vl5ngin2x/pbQ0w=
X-Received: by 2002:a63:3d0:: with SMTP id 199mr23377851pgd.4.1613557030577;
 Wed, 17 Feb 2021 02:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20210216224455.1504008-1-drew@beagleboard.org> <20210216224455.1504008-4-drew@beagleboard.org>
In-Reply-To: <20210216224455.1504008-4-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 17 Feb 2021 12:16:54 +0200
Message-ID: <CAHp75Vdp58uCVS2Gw3pQ7wVatHHcFrHB53-ynybxcAcJ2bUKpg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] docs/pinctrl: document debugfs files
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
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 17, 2021 at 12:45 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Document debugfs directories and files created for pinctrl subsystem.

Thanks for doing this!
I won't bikeshed now because it's about debugfs anyway, so
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  Documentation/driver-api/pinctl.rst | 37 +++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/Documentation/driver-api/pinctl.rst b/Documentation/driver-api/pinctl.rst
> index 3d2deaf48841..37bc3bd64cd8 100644
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
> +
> +- ``pinctrl-maps``: print all pinctrl maps
> +
> +A sub-directory is created inside of ``/sys/kernel/debug/pinctrl`` for each pin
> +controller device containing these files:
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
> +
> +        echo "<function-name group-name>" > pinmux-select
> --
> 2.25.1
>


--
With Best Regards,
Andy Shevchenko
