Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59DC0476D24
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 10:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhLPJOS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 04:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235072AbhLPJOR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 04:14:17 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377D6C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 01:14:17 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id z29so4439281edl.7
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 01:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gppvYM317OwAix8DpL9bZ+crnvBvouB6BXN4CIKYMWc=;
        b=CTW6k1Zyy8+Je8LrG2pyuRY3/J2c9KUSExHXwprwbIw98Q3hsBmdjbpr9+iipBUOBm
         uw/izSxzXMzcssklFUfNRDqIMXhmd7xxYoaCfpplO8gxlqvXOqvbQEIWjdvrKBRatF7j
         9DkxYKhJbuAAcTKXFGGLALH5ifQaoUQJiuT1rceY0MLfM2zeGuJUrtuZ8s0mUnO8uBT/
         yjvCv/gGEbZ3AckBrFCV/izT+2+attmrWfYLKfccdAbcFsoPYQOYTS+zSx7WzuCE7bM8
         wAshUpE7KpTpCjebIMtB9MypFWjnsJDR6Y+3/yY1ETrdDyXCmdCvUInldPLa44qSU3UW
         N0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gppvYM317OwAix8DpL9bZ+crnvBvouB6BXN4CIKYMWc=;
        b=uAgVWLz3lArX/fP40PsNpGq1RC1xcX/FcfFDeO3Otfha9nGVvGgYgc0KXEhOTPjmXB
         WKnuh0qpLWpn/bc8PbRqm3lwyk8mEPXehGI5Su2/wzARgCC+QgIya6cTN7fkmZZky8IF
         CzVE42dWV8hSCPUa/nk3zlqUYp1o3Zyv423RI+s5wba6B56N82gKUCU+HI7TaGk9GkMZ
         RBwxd7YJmy8HA5GC1Snj9fvB4GvNoyK4QesGEWJMrbx26gu9FL4E+Pwf+yIV5NNSQIUj
         5aToypTah22ppPvA+4uv3cYnizHINr602GHGqS1TfkXDeuMAHgBmJ2UELIT5KMSSYV6C
         45Aw==
X-Gm-Message-State: AOAM533k6dkgqlgar6nOI/QMtHrPmAHjMtxKnGnq6CSGEPE9DBolkHvw
        zWKGjwspzy2gTFHxY5MJKNXwZNJiynh7W0PxKpn1NQ==
X-Google-Smtp-Source: ABdhPJzLD8VkW5oSQAMqdoLrWUnd5IiNI9G3Wl7+Hf1RveQF+saJTDUHuSItKbQBzYRYNoFJRM4RySboBCA8z1Tyyhs=
X-Received: by 2002:a17:906:249a:: with SMTP id e26mr5214625ejb.492.1639646055642;
 Thu, 16 Dec 2021 01:14:15 -0800 (PST)
MIME-Version: 1.0
References: <Ybn8pxv5xPgc5nGz@black.fi.intel.com>
In-Reply-To: <Ybn8pxv5xPgc5nGz@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 16 Dec 2021 10:14:05 +0100
Message-ID: <CAMRc=MceOZWt5Qb6kFSALOOwyYb_MikFusxZqt9KgqqQPfnwgQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.17-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 15, 2021 at 3:33 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Approximately a dozen of changes for v5.17 against Intel GPIO drivers and
> GPIO ACPI library. It has ben a while in Linux Next without any error reported.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
>
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.17-1
>
> for you to fetch changes up to 9d5f0f6644b1404f40266a2682add712dc9931f5:
>
>   gpio: sch: fix typo in a comment (2021-12-13 13:29:09 +0200)
>
> ----------------------------------------------------------------
> intel-gpio for v5.17-1
>
> * Don't set type for IRQ already in use in case of ACPI
> * Drop unused call from GPIO ACPI library
> * Clean up ML IOH and PCH GPIO drivers to make it closer to each other
> * Clarify use of register file version in DesignWare driver
>
> The following is an automated git shortlog grouped by driver:
>
> dwapb:
>  -  clarify usage of the register file version
>
> gpiolib:
>  -  acpi: Unify debug and other messages format
>  -  acpi: Do not set the IRQ type if the IRQ is already in use
>  -  acpi: shrink devm_acpi_dev_add_driver_gpios()
>  -  acpi: Remove never used devm_acpi_dev_remove_driver_gpios()
>
> ml-ioh:
>  -  Change whitespace to match gpio-pch.c
>  -  Use BIT() to match gpio-pch.c
>  -  Cache &pdev->dev to reduce repetition
>
> pch:
>  -  Cache &pdev->dev to reduce repetition
>  -  Use .driver_data instead of checking Device IDs again
>
> sch:
>  -  fix typo in a comment
>
> ----------------------------------------------------------------
> Andy Shevchenko (4):
>       gpiolib: acpi: Remove never used devm_acpi_dev_remove_driver_gpios()
>       gpiolib: acpi: shrink devm_acpi_dev_add_driver_gpios()
>       gpiolib: acpi: Unify debug and other messages format
>       gpio: dwapb: clarify usage of the register file version
>
> Bjorn Helgaas (5):
>       gpio: pch: Use .driver_data instead of checking Device IDs again
>       gpio: pch: Cache &pdev->dev to reduce repetition
>       gpio: ml-ioh: Cache &pdev->dev to reduce repetition
>       gpio: ml-ioh: Use BIT() to match gpio-pch.c
>       gpio: ml-ioh: Change whitespace to match gpio-pch.c
>
> Hans de Goede (1):
>       gpiolib: acpi: Do not set the IRQ type if the IRQ is already in use
>
> Jason Wang (1):
>       gpio: sch: fix typo in a comment
>
>  drivers/gpio/gpio-dwapb.c     | 10 +++++----
>  drivers/gpio/gpio-ml-ioh.c    | 52 +++++++++++++++++++++----------------------
>  drivers/gpio/gpio-pch.c       | 42 +++++++++++++++++-----------------
>  drivers/gpio/gpio-sch.c       |  2 +-
>  drivers/gpio/gpiolib-acpi.c   | 51 ++++++++++++++++++------------------------
>  include/linux/gpio/consumer.h |  2 --
>  6 files changed, 75 insertions(+), 84 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart
