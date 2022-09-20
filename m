Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A7F5BE805
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Sep 2022 16:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbiITOFm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Sep 2022 10:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbiITOF3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Sep 2022 10:05:29 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC0FCD6
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 07:05:27 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u9so6447423ejy.5
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ZsigJrgZTMlJCvXV0JIC8q9Qi7TNohuEmhSDzWoFL1o=;
        b=Y1Bwe8GFf/+tL5SaeApc1k5XntRjb5w6LrBd/bJKfOHSMhv/+TvyAWxH7SQqjZwoxw
         rRqZ/d+DN9jgEHde1qHmCfwSZAW7YYQrVwUgPUNkXar1EZ8DHJi0LWHAz+PU2ccIVrbp
         EbSZaqIRaTp+XI8K3X1i6AtXko05poikjH/CR1oHV0oCIzJ0H3NN685k5LNTjyxcYCdO
         TQvbSQsNN3Mqrq9btaEkyKrQcSrA9LoQb1kV7O/vvDzRVchQvawaGgzxUkuy4cIGttNb
         ClZqPW09sc5e7pgSfHxO+jdJ83X6odK5tv91IuawljFANp0n8/7ftbRN5RV8U3Ody+SG
         V9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZsigJrgZTMlJCvXV0JIC8q9Qi7TNohuEmhSDzWoFL1o=;
        b=CMGtiOenWJnDeT4vLNFb6WPaBVIghaek+Bs2BYTJrwKmxXxBy0kwZX1xWzh/RqH4Ax
         rHU0zvyXEuC5BlRaVy4gNMYA2kpA7P9GcjXyncM+uNhoyg/A5QIOXdVuLLBel4L6O0bA
         UQjHK1v3VJFNOtbWz5cEZDDPAq7rjGbz+7gBqDKcQy6ieoVzi8rSDRpGr6qjuDuN6i3A
         aSjug5gPyXt7TKZqSF+NMYpah3TvsWZZhfDfqu96MRy0QrHpr03s3IACUSBaLABX6Jig
         JidNoZ3p4LrGDM2c1trx4f4ujmapjvUdoR52NP1hr5bfdbO8Qgaog3ICy+gti3nv35aX
         vQcg==
X-Gm-Message-State: ACrzQf0PlULxLNAzDN9U3ZRjM5srBOaIwDLwGHsWk3qrRKGqSjwpe4oG
        Vs8qrxoRvwsloWVWGf0vuuwn2hvlUJ3L8nz+0c8orw==
X-Google-Smtp-Source: AMsMyM6ZhqAFnCjKIFWhDOh9kI40KhsEYcM2qTiZX2GDtbyIt8b78RFhnFK/h0o9OPsV+2EPmzQhMRs16aNLaePC+2M=
X-Received: by 2002:a17:907:1c96:b0:780:602c:677c with SMTP id
 nb22-20020a1709071c9600b00780602c677cmr16949485ejc.736.1663682726141; Tue, 20
 Sep 2022 07:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <Yym/j+Y9MBOIhWtK@black.fi.intel.com>
In-Reply-To: <Yym/j+Y9MBOIhWtK@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 20 Sep 2022 16:05:14 +0200
Message-ID: <CAMRc=Me873ynTWMyM0oe434zMbb3kdFfAUELFVc+hquedDfKHg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.1-1
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

On Tue, Sep 20, 2022 at 3:26 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> A small quirk for GPIO ACPI library. Was a few weeks in Linux Next, shouldn't
> be any conflicts with anything. Please pull for v6.1.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
>
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.1-1
>

Pulled, but what happened with the git://git.kernel.org/... address? :(

Bart

> for you to fetch changes up to 0ea76c401f9245ac209f1b1ce03a7e1fb9de36e5:
>
>   gpiolib: acpi: Add a quirk for Asus UM325UAZ (2022-09-05 13:15:56 +0300)
>
> ----------------------------------------------------------------
> intel-gpio for v6.1-1
>
> * Add a quirk for Asus UM325UAZ to make GPIO interrupts working
>
> The following is an automated git shortlog grouped by driver:
>
> gpiolib:
>  -  acpi: Add a quirk for Asus UM325UAZ
>  -  acpi: Add support to ignore programming an interrupt
>
> ----------------------------------------------------------------
> Mario Limonciello (2):
>       gpiolib: acpi: Add support to ignore programming an interrupt
>       gpiolib: acpi: Add a quirk for Asus UM325UAZ
>
>  drivers/gpio/gpiolib-acpi.c | 38 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 34 insertions(+), 4 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
