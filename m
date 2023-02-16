Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0919F699465
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 13:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjBPMdN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 07:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjBPMdM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 07:33:12 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C35635A1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 04:33:06 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id e3so391323ual.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 04:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zbQKkVJYaXmvefnmGnnZuWcvieEQHLdfzuwgj9rhurw=;
        b=oq8XOChlpWLoER8uyDq2MFy9GYOq0wgMFaamv5lb6uEOGNJzW6dvI4sTdDfpbwkRkQ
         h/bmy1B2KXuObUpkkKEe5F0STegEUpae5CttaarKJhts02pArSK+Uov3K2H9pBcP9Grm
         wffE2nWKq57TwC8cbdksmSLpe8LWQ4T1qS8UZiWPKzz3O58RKh4eDj99I4uaVXs7RY3S
         KuBuXC3Bz6GpfqllWhiKMKLhVmh+B4TbPpI9G9zYJ+uBoBFhsowKwmzssOf3NfYbIR3z
         N9t/53L4EDPHiC30T2mG14iTyNAn7GZ0lRBP3LMySHZgNelF+2O5LECXs1CkjahNxhZU
         SU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbQKkVJYaXmvefnmGnnZuWcvieEQHLdfzuwgj9rhurw=;
        b=l+Z9xtHo9Fbs4tTFS2Nf/ya2xMs1ADyYzK0eOs00JC+8ACpyHRZiKgbc1Cx52sh4du
         jGjKTplR+wmlP/aaMyM8Dpv9/nN+o5NPJjYApzJ9bRELrwJ8fzDkz8Y0H/W5PERoG2U/
         68+IC8d0LO8mjUALuj6ephDlGBZ5ybcbNABF+g9Zo+uWwpduYX0jhj2AgIii5OyWqAYb
         wDAXKMWQxCZf7wP0Hl0QUzVls/ZnZ1o5PWjnOORzqqFgzEP4fiy9BusSI7KbyOLTJ02l
         8876w3gNSLyj+3pvLiDakKTM4uU7bp1CsTjv7uWI0OcEBVJuqTxd2sh6nfp4cDpeVSxe
         Q4Mw==
X-Gm-Message-State: AO0yUKXMhrNL68wBs6FK9s43jl4793g5M+uWytjFvrQYDWLqrJmDgZio
        NEub3BZaJVgMk/xUgFhYsXkR/MJMXlYhx2BNO821IQ==
X-Google-Smtp-Source: AK7set96SkGNVBvYHSGJZ3iz6++ar4Ue8QCH3hMNkSyfuTrnnNkX5r6Q3Ca3jiY9tRNf2V6WqjfAMvP8nvc4pejgohs=
X-Received: by 2002:ab0:5607:0:b0:688:d612:2024 with SMTP id
 y7-20020ab05607000000b00688d6122024mr810014uaa.2.1676550785075; Thu, 16 Feb
 2023 04:33:05 -0800 (PST)
MIME-Version: 1.0
References: <Y+4c8k/+CXha53Le@black.fi.intel.com>
In-Reply-To: <Y+4c8k/+CXha53Le@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 16 Feb 2023 13:32:54 +0100
Message-ID: <CAMRc=MdgkfdSQKc+VE8JLXwVu4HNV+AUGd_TF2nd+ze_n-KWkQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.2-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 16, 2023 at 1:08 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> A couple of patches against GPIO ACPI library for the v6.2 cycle. Were a bit in
> the mailing list and Linux Next without any problems reported. Please, pull.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit ceaa837f96adb69c0df0397937cd74991d5d821a:
>
>   Linux 6.2-rc8 (2023-02-12 14:10:17 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.2-2
>
> for you to fetch changes up to a69982c37cd0586e6832268155349301b87f2e35:
>
>   gpiolib: acpi: Add a ignore wakeup quirk for Clevo NH5xAx (2023-02-15 16:58:45 +0200)
>
> ----------------------------------------------------------------
> intel-gpio for v6.2-2
>
> * Ignore spurious wakeup by touchpad on Clevo NH5xAx
> * Miscellaneous fix(es)
>
> The following is an automated git shortlog grouped by driver:
>
> gpiolib:
>  -  acpi: Add a ignore wakeup quirk for Clevo NH5xAx
>  -  acpi: remove redundant declaration
>
> ----------------------------------------------------------------
> Raag Jadav (1):
>       gpiolib: acpi: remove redundant declaration
>
> Werner Sembach (1):
>       gpiolib: acpi: Add a ignore wakeup quirk for Clevo NH5xAx
>
>  drivers/gpio/gpiolib-acpi.c | 12 ++++++++++++
>  drivers/gpio/gpiolib-acpi.h |  1 -
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Right in time, as I was about to send my last fixes PR to Linus.

Pulled, thanks!

Bart
