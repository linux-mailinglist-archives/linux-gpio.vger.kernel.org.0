Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E734781BC
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2019 23:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfG1VTv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 17:19:51 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39052 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfG1VTv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 17:19:51 -0400
Received: by mail-lj1-f196.google.com with SMTP id v18so56511852ljh.6
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 14:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TDsiiK8fY/eCw0/oRwXiIcaBuytiXIQKXCiKrrbtZ+M=;
        b=ogNarvdPNGi8gnGrNn/CLA5w1m7OvNEuqHzUQrp/OhzgGIsjpL1W4bARn4XCe1LQLB
         EDdcs8dwL3k9wx5NwKcE7Lsla0j8Tod4Io1qQqyeiwM0svAQDTTWfIYqZU6Cu9oz9+H9
         NQhjaLfacJMsqmhjLxNQHESZr6r/OLzaFlGopRMV0qXg+sLk/o/LrgjsCVhfVLtkgYKP
         wDXI7mCyp2D0yLBdhktCkU/FwJfl+C/72U2yqgH1XC7XYHZJ/Y/geP2xCTccDPiSs2xN
         pHMs18qv9sSqW9iksK6Gj0jGDefy+zrgQSd1a2BIxcrRYoC1pBLIpsrmNgtbxdTAR5cT
         Bv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TDsiiK8fY/eCw0/oRwXiIcaBuytiXIQKXCiKrrbtZ+M=;
        b=fxiPWQ7oicwnhAWguf/U4DHSJPycQnHzVPP18DhYVeZV2P/QHbOwDfZNFPbk+muNdA
         h7uVaqhFLlasgprFGtXGM4vqhCs9keJL9nfL+w8zCsMH+kJWVaVdirVi5mDGogoU1gq+
         p6TnNCsaD5071b/c/Qe9DcpL8CwSwabM+Pi957LRL0SMNdK8nS0RSOL1E7jXCJCKG8rO
         oMy5+wkQvSLSr3RrPRDi8rJx93czS3LGV5kl8pDH8qUtpYbOfdyf1WMHew63usvckpRj
         mwoBvGaqKyc4eM/8x6MaJ3/F6rfEsvb/kT0g35gbQne5TyBzWytntZEf4tC0CqPIBFYD
         aOrQ==
X-Gm-Message-State: APjAAAVcblyCGEUbFDkRn+7Kq8SOmuo9ZfV+zn8fltlUIM0pafJAisd/
        IzQU/2dFUZXLfKaInl8hXQxZeWOsJyr8Hzc58f7JgZZZMK4=
X-Google-Smtp-Source: APXvYqygEeZ4MglOLTcsoeBoL1MDwd3O5VRSSA/7ppEBUDP3P/IzK/awUrZbkelpqgUq4A3gYub1tolCrXGlQoC06II=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr7255400ljc.28.1564348789301;
 Sun, 28 Jul 2019 14:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190717071001.3858-1-linus.walleij@linaro.org> <20190717092808.GR9224@smile.fi.intel.com>
In-Reply-To: <20190717092808.GR9224@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 28 Jul 2019 23:19:37 +0200
Message-ID: <CACRpkdZ-ntmgneb092wdMH2-nhEFHe0TRqBoi2J9M1ZErJYpqA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: of: Break out OF-only code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 17, 2019 at 11:28 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> > Create a local gpiolib-of.h header and move stuff around a
> > bit to get a clean cut.
>
> Are you going to split ACPI parts as well (at least to a header)?

Yeah when I find time, unless you beat me to it :D

> One nit to address below (sorry, didn't notice before), and take mine
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

> > -     if (!gpiochip->need_valid_mask)
> > +     if (IS_ENABLED(CONFIG_OF_GPIO))
> > +             gc->need_valid_mask = of_gpio_need_valid_mask(gc);
>
>                 gpiochip->need_valid_mask = of_gpio_need_valid_mask(gpiochip);
>
> Even with full name it fits 80.
> Can you drop renaming here?

The renaming is drive-by syntax fixing. I want to change all of these
variable to just "gc" to declutter the code. When I touch functions I
already work on I change it a bit here and there.

I'm fine with unrelated syntax and style fixes in patches to some
extent, I'm not one of those who dislike it. I just follow
Documentation/process/4.Coding.rst, given the number
of independent patches for coding style I get people seem
not to have read this at all:

"pure coding style fixes are seen as noise by the development community;
they tend to get a chilly reception.  So this type of patch is best
avoided.  It is natural to fix the style of a piece of code while working
on it for other reasons, but coding style changes should not be made for
their own sake."

I just accept both: separate coding style fixes and changing the
style while changing the code.

Yours,
Linus Walleij
