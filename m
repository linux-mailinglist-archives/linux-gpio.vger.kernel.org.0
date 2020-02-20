Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091221664C7
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 18:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgBTR22 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 12:28:28 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39400 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbgBTR22 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 12:28:28 -0500
Received: by mail-wr1-f65.google.com with SMTP id y11so5543749wrt.6
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9HLrH9B+9M96XvbzbC62n+ihyZm9Xl/arrOuZzCySRA=;
        b=kdS0utX1TJ7aUSDB8MR792caZ5Csslv4slskhik3iXiLZYHRDBGPNbTfBBMBbqC8i4
         /UXczD2kQSO7jNTIaYoFEEySjyi5XfsJwtmAF4QCwwbE3VJXbo/3iXaTGul9JmsqOLEK
         ajG9KUY0TvFqn7D769MTflum8evrHiFU7dwM24/kygY082ba5NOqof9ySYtsQuN1omvk
         Z4pJqWjOlQzedzYytS/jWfzEFq/z+LRjMT1lNSvn9d2OUw8/ZxMhM5pxXfxcsIWVdzFf
         mVkegrSWQvgw7xz7R+Iu1AlJUetn2b1Z5xPUY9ORZT24uOQLqRCDFcnQuRQkR9Bi3p73
         1yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9HLrH9B+9M96XvbzbC62n+ihyZm9Xl/arrOuZzCySRA=;
        b=ZKbM1HE6NEGHjtaK3dLT7SYnSTbq26qDjeguKbbYga2w96jJVRRDeowbrvDIafQZQU
         WhMCE0qvRzOyU8OEKm6OeHLQg3Yx8oPaJRNbgijwJRto7nJayqPdR1DpzlM4TMJa8cFv
         ZmXFP8UxRDKeDaiJizFEJGaOOh5SeLboFLesmr/+2T5o9nylsETeNPCuYhXxnoTb+4Tc
         /i+0vbsJrch4ZR+Hq+1T9CyCKYM17xSYqulO0GSkGT2mzOc3MVYJjnWCqSsIPx3ZJ813
         J54jReBKYuQ0pStWJpnBuSvVfI2ofNl24jRGIqh6kQ911FOory6e945bTK0mNjl2e+UW
         GZdQ==
X-Gm-Message-State: APjAAAWkQqpHswZBWo1QrLvd55Wiuw45tZKqRtE6YZ0ODlvkAgXpEjZz
        dX0MO8blSkTcZP83x+Bv717kYrERptKde4hba+I=
X-Google-Smtp-Source: APXvYqz/1EN+FC/uNZC+cWFKl1Gu53oLSQx1zC4GL5BRZp+dkeliZ7CB5GCVSC1Dh1nPlLxzoqJgviEbxGxtlZSwtp0=
X-Received: by 2002:adf:a381:: with SMTP id l1mr43487880wrb.102.1582219705972;
 Thu, 20 Feb 2020 09:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20200206173247.GX25745@shell.armlinux.org.uk> <CACRpkdbzjBnaeXJg3XvZ6G2FdtQQa0u7MPy9bgN-uo-F1vSpbQ@mail.gmail.com>
In-Reply-To: <CACRpkdbzjBnaeXJg3XvZ6G2FdtQQa0u7MPy9bgN-uo-F1vSpbQ@mail.gmail.com>
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
Date:   Thu, 20 Feb 2020 09:28:14 -0800
Message-ID: <CAHQ1cqFeMKrb-MxnifVJXfGciQH8wsjS1dSSeTTc0R06jLT+Cw@mail.gmail.com>
Subject: Re: [REGRESSION] gpio hogging fails with pinctrl gpio drivers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 20, 2020 at 12:18 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Feb 6, 2020 at 6:33 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
>
> > It seems that sometime between 4.20 and 5.5, something has broken the
> > ability to specify gpio-hogs in DT for GPIOs that are written around
> > pinctrl drivers.
> (explanation that makes perfect sense)
> > Consequently, adding a gpio-hog to DT for this driver results in the
> > driver endlessly returning -EPROBE_DEFER.
>
> I suspect this is sx150x-specific and suspect these two commits:
>
> 1a1d39e1b8dd pinctrl: sx150x: Register pinctrl before adding the gpiochip
> b930151e5b55 pinctrl: sx150x: Add a static gpio/pinctrl pin range mapping
>
> I suppose people weren't using hogs very much with the sx150x and
> it didn't turn up in testing so far.
>
> I don't think for example pinctrl-stmfx.c has this problem, as it registers
> the pin ranges from the device tree as part of the core code.
> But other drivers calling gpiochip_add_pin_range() may be experiencing
> this.
>
> Peter/Andrey, do you have some idea? Have you tested this usecase (hogs)
> with the sx150x?
>

Haven't done any GPIO hogging on sx150x, unfortunately. My use-cases were:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/vf610-zii-dev-rev-c.dts

and

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/vf610-zii-scu4-aib.dts

which didn't have any hogs so far (there's a chance Russell is using
the former for his experiments, so maybe that'll change). I don't any
useful input on this regression, sorry. I do have Rev C. board readily
available, so I can provide Tested-by's if I am CC'd on fixes.

Thanks,
Andrey Smirnov
