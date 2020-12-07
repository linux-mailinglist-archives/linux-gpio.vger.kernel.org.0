Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785772D0D7A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 10:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgLGJzW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 04:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgLGJzV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 04:55:21 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F94C0613D4;
        Mon,  7 Dec 2020 01:54:14 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id t7so9332345pfh.7;
        Mon, 07 Dec 2020 01:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cQNqejnHKcv71ogNXQXWu1nJrilCEf7ocHyvluhTstc=;
        b=g30udMM1VuAWbWxL2/BJDWR/lG7bQE0VU8xjEd13qKZzRC6KOfzAM3WN6wc1JFbUHA
         paIDx534W92bNFGN6L83h9q3FDnYpttE7r7Bv2xV3Ze43sSth+v2VYm26zGOeHaZrOWB
         K5JT73YDl7u5Lb9cS975oglkf40inKuAm0n9Dipd+bsG/QvK5CZ4xKAwGOcPaigvGP/a
         g9aakI2R15t8MdqHVPsbX+FOBUjheBnAA/bXO015PUAAlY1cLo93A6lJTeqqUmQidw14
         tJoEpe61zudYXm6NDHfTEutMMmOKqCVCKc5O4pMdKMgzQDzAi0V7NWH+nIXFGyJzdJlz
         lelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cQNqejnHKcv71ogNXQXWu1nJrilCEf7ocHyvluhTstc=;
        b=QwI18E4a6B3FAKeIgWsVohwaqw8/ogjF4oDgnKOOHJiKLOFhKZlMPq1n1V1szgMHyH
         Sh78YPBB2HclboGB8RIU00ULlQ2M/JmGbmRwRKsSPUX9iVjPMWYDok4hNXEHEd0Zj57v
         ZIkhNVUBCtZe0WVnoTOqhYW3HfyWRFBgI2Jyw5sXLv2DacqIcnHhU6CG9EixVhrcuZ6/
         E/KRav3C6HF0H9MOnAy0XQ2Ei6Vrexc+GxTNGgi+I3agOC1EKmaSUugGESpLUQElqCQu
         5XKpx1Kgt1AFWV3EyOJqUpryWJaebRfF4DCAIYlkf6F0HxNN++dGS9P1ed05DBDqluuz
         EG3A==
X-Gm-Message-State: AOAM5332PXVg6a6IKiQgAqe/prlzhTIin/CbR8qvWJi/zs5JpUYMFYy2
        qdTHZzYV0pr4ubhpY/nKIrNWNv6soNh4pbDqFGI=
X-Google-Smtp-Source: ABdhPJyjR8NCqP4BwkiF+lJpanNRuoSGVUTlMMZMbsnJVenOsZ3LLSVlxWxATKrXkRR4Y8N6SIPiC5/CdXA7fBL9rLg=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr15382640pfe.40.1607334854121; Mon, 07
 Dec 2020 01:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20201204164739.781812-1-maz@kernel.org>
In-Reply-To: <20201204164739.781812-1-maz@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Dec 2020 11:55:02 +0200
Message-ID: <CAHp75VcDqHLzaAZ=EOV8EfhOxLvEC4do+UDVmAWD229xmEok+w@mail.gmail.com>
Subject: Re: [PATCH 0/4] USB: ftdio_sio: GPIO validity fixes
To:     Marc Zyngier <maz@kernel.org>
Cc:     USB <linux-usb@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 4, 2020 at 6:49 PM Marc Zyngier <maz@kernel.org> wrote:
>
> Having recently tried to use the CBUS GPIOs that come thanks to the
> ftdio_sio driver, it occurred to me that the driver has a couple of
> usability issues:
>
> - it advertises potential GPIOs that are reserved to other uses (LED
>   control, or something else)
>
> - it returns an odd error (-ENODEV), instead of the expected -EINVAL
>   when a line is unavailable, leading to a difficult diagnostic
>
> We address the issues in a number of ways:
>
> - Stop reporting invalid GPIO lines as valid to userspace. It
>   definitely seems odd to do so. Instead, report the line as being
>   used, making the userspace interface a bit more consistent.
>
> - Implement the init_valid_mask() callback in the ftdi_sio driver,
>   allowing it to report which lines are actually valid.
>
> - As suggested by Linus, give an indication to the user of why some of
>   the GPIO lines are unavailable, and point them to a useful tool
>   (once per boot). It is a bit sad that there next to no documentation
>   on how to use these CBUS pins.
>
> - Drop the error reporting code, which has become useless at this
>   point.
>
> Tested with a couple of FTDI devices (FT230X and FT231X) and various
> CBUS configurations.

Series looks pretty good to me, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Marc Zyngier (4):
>   gpiolib: cdev: Flag invalid GPIOs as used
>   USB: serial: ftdi_sio: Report the valid GPIO lines to gpiolib
>   USB: serial: ftdi_sio: Log the CBUS GPIO validity
>   USB: serial: ftdi_sio: Drop GPIO line checking dead code
>
>  drivers/gpio/gpiolib-cdev.c   |  1 +
>  drivers/usb/serial/ftdi_sio.c | 26 +++++++++++++++++++++++---
>  2 files changed, 24 insertions(+), 3 deletions(-)
>
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
