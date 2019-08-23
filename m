Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C639A932
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 09:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391415AbfHWH4o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 03:56:44 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44522 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391272AbfHWH4o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 03:56:44 -0400
Received: by mail-lj1-f193.google.com with SMTP id e24so7984516ljg.11
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 00:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZoH99gCCqRWJNWWiOrWyp5IoDarLlyblNQ/wC6mp43o=;
        b=BV74voyGG+vzjEEv5SxUv3lMMiWzg2Gt744uxljX5dPLJ4uZjgE5jQ3sgQJALIFyip
         h7UyPzA01YTHo7q26n0zZMVRTEM0Z3xtsafYIcrVDvyWXe+qjN+JG2vbsOjJCH+AX44v
         JSgI3dPhigaNYXXayRrqcu3NAteYguM4g6K85LsPqb2iAl1sy5PIRg76hmdF/f284+1G
         Qjdy3h6zyYTL/7Y0zRA9zJE2epLWWqu5I13LmMtGJ6Yr2xurXupp29/haDb/o0U/Bm2Z
         S9vAZe8BlvwcalWIlYiWiwzuS3CkzN33bl+vWbBjxv5yladJ9Rtj3auU3t/YMsOVmbfQ
         lwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZoH99gCCqRWJNWWiOrWyp5IoDarLlyblNQ/wC6mp43o=;
        b=dgqAeaRzQGfC/b3Ni5L1YyMpUcfWEfHJmf6KW2Ybh0EbZQ0OVst0ccoArPma4LNliA
         yVztH93W7gfsUsl2MmTi3nS7sM0iveNWnALo5rJciYFXprkf2M/d3nWmNzCwudOyb7D/
         r2SfYRpNwDSwfAXmf3PVriJNjhLHHaSt6zuBJLONF452LwFUtO9Uu+kZaVRvvT4fjlWj
         JaguUuApDweImi4hJlVFaZ8REh/Ua4Kgbw/2mlhWJDFWVNg2UAg4EgJ4dXwSZ2Ha0ynl
         OkEUguqK7cnc8HgDx3TlvId4GXsbyBVfcm27DhMtLrfGnK5eJ/YCznb1HethhitT8elw
         8g6Q==
X-Gm-Message-State: APjAAAVxxYtTSdg2xv6eIg597T+eon/Jxbjc68kZMDUsFEOA2DtWnVyG
        fqleY6Rg5HJSCWcIBtpTfLnqUN04Q4Au+ZAp3mOYKw==
X-Google-Smtp-Source: APXvYqwJYQ4Xm5tr03gXwgQ6Q/M4wcA7Z91VrCJJBTW9+/jKLRaw4zkjmBh4t3cxoJm5k/TQoDDGkEeRnrfM/ZO+GrM=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr2113497ljo.69.1566547002430;
 Fri, 23 Aug 2019 00:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190814090540.7152-1-drake@endlessm.com>
In-Reply-To: <20190814090540.7152-1-drake@endlessm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 09:56:31 +0200
Message-ID: <CACRpkdZUB_aJetES+Wq1sSVnEu+xEJ117kP1LLmEyxRPG0xSmA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl/amd: disable spurious-firing GPIO IRQs
To:     Daniel Drake <drake@endlessm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux@endlessm.com, "Singh, Sandeep" <sandeep.singh@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 14, 2019 at 11:05 AM Daniel Drake <drake@endlessm.com> wrote:

> When cold-booting Asus X434DA, GPIO 7 is found to be already configured
> as an interrupt, and the GPIO level is found to be in a state that
> causes the interrupt to fire.
>
> As soon as pinctrl-amd probes, this interrupt fires and invokes
> amd_gpio_irq_handler(). The IRQ is acked, but no GPIO-IRQ handler was
> invoked, so the GPIO level being unchanged just causes another interrupt
> to fire again immediately after.
>
> This results in an interrupt storm causing this platform to hang
> during boot, right after pinctrl-amd is probed.
>
> Detect this situation and disable the GPIO interrupt when this happens.
> This enables the affected platform to boot as normal. GPIO 7 actually is
> the I2C touchpad interrupt line, and later on, i2c-multitouch loads and
> re-enables this interrupt when it is ready to handle it.
>
> Instead of this approach, I considered disabling all GPIO interrupts at
> probe time, however that seems a little risky, and I also confirmed that
> Windows does not seem to have this behaviour: the same 41 GPIO IRQs are
> enabled under both Linux and Windows, which is a far larger collection
> than the GPIOs referenced by the DSDT on this platform.
>
> Signed-off-by: Daniel Drake <drake@endlessm.com>

Patch applied!

Yours,
Linus Walleij
