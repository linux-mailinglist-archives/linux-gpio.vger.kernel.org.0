Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750FC332AD2
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 16:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhCIPoR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 10:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbhCIPnt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 10:43:49 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03A0C06175F
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 07:43:48 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id h10so21087966edl.6
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6sZr9r6fI7r4+t4w17yKTJjfVekLAeORM+vM+wv9vwU=;
        b=ZVk5GJ9ljaUFantUykH3qadtsuXKnzsjhxhzViQ149UuzK5WHNMaxPsrjjbNnwmf9S
         zuBz02Aq2oNeT6hKvKbpxfPix0vcmxgqRfYjVh/otXkG0EeVa4p5S1dNF2Sjltirq2SZ
         1nzc0TuWgYUJxh4EXVbNbHcnPFFU/CefnIGBOBaSB7JVHlm6BDF9x2d+ApKdkleabR5C
         k6UoNnDE74gzBdIqNI+yqGxyld4AUHntx0Yatg9v7qVdh4cHQjaj7JFvm7VLf38uxrAQ
         PmgNmc/OsH4tKvqigO6ZfC964cGbyMjRxDPgtZiYIWzPXW5yRXR0TZyLDec1DCgrdvE5
         Mj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6sZr9r6fI7r4+t4w17yKTJjfVekLAeORM+vM+wv9vwU=;
        b=cBUwrfUZtk8lH0jW71XuKoR63WSOMVuXP0kXzpcxWkSxpz5Oe21kmp2OVItM13EzD8
         ewhECJg9WL0xuB/XCZCNOHdtp17pbsjuoy6zjHZ0g15IJHzvQtKQPWGYGQL2jrOxPp6u
         KrZEPn/4/ZiTx/LfdudU30sb3+lDDUqQklMnMwQr6eds3dnHUv+h2jcW2p7qXfKcEpDG
         UfR7CP9QdqtEOju4DMSWM4QoaJJX/opMjsfnZZTNssrBHyc4QI2HQwGne3p/mPpt3JsY
         KHCnz2n5Dl/ujULnak4cBD3xfymH3qpFrAO1C2c4D9KrUefVoDzQnaGStsVc4k/aLdkR
         /12w==
X-Gm-Message-State: AOAM533y3AA3mw5eAdvt4j+24BODGGp78fK3Ze9bMw++SdRVvMehRfDK
        B/fIIwcLRJLABFbuR/5rGzPfkKp2ng7zCBmVVwtclw==
X-Google-Smtp-Source: ABdhPJwd1S0e8S8cg6kxwZDXa4+nwPtDxLSrDLyYs0ScEQWrKwV7nO2uPlIbZRFHivU8iMFcoWUa+jK/zA/bZWBbukU=
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr4218153edu.124.1615304627413;
 Tue, 09 Mar 2021 07:43:47 -0800 (PST)
MIME-Version: 1.0
References: <20210309153443.16647-1-brgl@bgdev.pl>
In-Reply-To: <20210309153443.16647-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 9 Mar 2021 16:43:36 +0100
Message-ID: <CAMRc=MfO7J1z8oGy+OiRR000dJAYg1LTynz33Kh6BMb1hUrg5g@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.12-rc3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 9, 2021 at 4:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Linus,
>
> Here's a bunch of fixes for the GPIO subsystem. We have two regressions in the
> core code spotted right after the merge window, a series of fixes for ACPI GPIO
> and a subsequent fix for a related regression in gpio-pca953x + a minor tweak
> in .gitignore and a rework of handling of the gpio-line-names to remedy a
> regression in stm32mp151.
>
> Please pull!
>
> Best Regards,
> Bartosz Golaszewski
>
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
>
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12-rc3
>
> for you to fetch changes up to b41ba2ec54a70908067034f139aa23d0dd2985ce:
>
>   gpiolib: Read "gpio-line-names" from a firmware node (2021-03-08 11:59:17 +0100)
>
> ----------------------------------------------------------------
> gpio fixes for v5.12-rc3
>
> - fix two regressions in core GPIO subsystem code: one NULL-pointer dereference
>   and one list corruption
> - read GPIO line names from fwnode instead of using the generic device
>   properties to fix a regression on stm32mp151
> - fixes to ACPI GPIO and gpio-pca953x to handle a regression in IRQ handling
>   on Intel Galileo
> - update .gitignore in GPIO selftests
>
> ----------------------------------------------------------------
> Andy Shevchenko (4):
>       gpiolib: acpi: Add ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER quirk
>       gpiolib: acpi: Allow to find GpioInt() resource by name and index
>       gpio: pca953x: Set IRQ type when handle Intel Galileo Gen 2
>       gpiolib: Read "gpio-line-names" from a firmware node
>
> Bartosz Golaszewski (1):
>       selftests: gpio: update .gitignore
>
> Johan Hovold (2):
>       gpio: fix NULL-deref-on-deregistration regression
>       gpio: fix gpio-device list corruption
>
> Yang Li (1):
>       gpiolib: acpi: Add missing IRQF_ONESHOT
>
>  drivers/gpio/gpio-pca953x.c             | 78 ++++++++++-----------------------
>  drivers/gpio/gpiolib-acpi.c             | 21 ++++++---
>  drivers/gpio/gpiolib.c                  | 19 ++++----
>  include/linux/acpi.h                    | 10 ++++-
>  include/linux/gpio/consumer.h           |  2 +
>  tools/testing/selftests/gpio/.gitignore |  2 +-
>  6 files changed, 58 insertions(+), 74 deletions(-)

Hi Linus,

I realized only after I sent out this PR that I had rebased the branch
on top of v5.12-rc2 (because of the v5.12-rc1 situation) without
--rebase-merges and this caused git to drop the merge commit for
Andy's pull-request. Please let me know if you can pull this as is or
if I should rebuild my branch and resend.

Best Regards,
Bartosz Golaszewski
