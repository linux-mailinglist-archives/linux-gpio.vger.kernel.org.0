Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E875E62B661
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 10:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238541AbiKPJXC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 04:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbiKPJWn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 04:22:43 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D27227142
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:22:39 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id f68so7922252vkc.8
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QLdSEHgO5ENQIQKfVL0HQg4gJ5LiyCmT4mc5M0SwRfU=;
        b=h2jFbi6F8nPsAM+/8yAov60I3JGC3kDmiu0lNZlfDHsWity2iYz4dEcyhZ2ou5+/Hl
         whRjULTkOuUwOMtglXMyzCRACLTFi3LKDXxQjwFlI6QwMl6J3iWTIXTFj/bX0YMDVl2w
         4dMqsKfYwApGUF+BgC5N3kMn7Z9oYUBQFgE2AcMe0WHoWfUDi7kIWPUzeYxZQNhqsRE2
         u7tBikx8NjJ43TaPlI+yFBOT8qtJ+tvrYoadtzGFh1Z7MDS7CihKVEx+kMJiXf0EouEY
         l0m+sXI+T183kfzmYEHSp7eslEskJL1DnpZaHQB131UfQCpStdWtNBy6mwe3ze54ab7C
         rjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLdSEHgO5ENQIQKfVL0HQg4gJ5LiyCmT4mc5M0SwRfU=;
        b=tDGn/EezidhWO0V56f6f+SaTxPf8Eda8nC4wVJxKZXubtTsSyOZJdfsXXMcA2wpRbL
         VT1av6oah3P/0U6WWJwZ8kZwr9sQMjgxLtwQdeDqbEs3e2h6+aj9Mrdlq0h1Pt3dsoNL
         k9g0rP2LzILxSd7p/O4LVXdDX+oTGFA/AL7EgswFtHwE/TnUPijxGEdijzdwgprMb0xb
         d3KMZFILNXzb7ugHF/EPE1ZmaKL2d/9053Uvsh5Pmosm8pB38XLTKBIue5EjIpPe37BP
         FCHIhJNccXYQTGO4XYD1j1FiqNp6I4YsrC2/HbqG6NTox5OMGMBB2jwD2UeXOfbJEp84
         b9BQ==
X-Gm-Message-State: ANoB5pn73ZAb9AQ00qEWpyIPjnUT4tEkMydLmDN+h5O5Sr0y61jC6pFr
        +1NQl66CkWdYTxGec/XMdCzI1Fp/lvRRjakLzhJZRUJFB5Q=
X-Google-Smtp-Source: AA0mqf4X9F8VBFT2A3rcYX1eaW5i2CTkE/2wW2weleDv6BE7hNhZVQZMTg4tRbeQfxlxcz/gQrNEgO74IaYWFvhoF0k=
X-Received: by 2002:a1f:27c6:0:b0:3ab:85c0:e1e8 with SMTP id
 n189-20020a1f27c6000000b003ab85c0e1e8mr12740149vkn.1.1668590558645; Wed, 16
 Nov 2022 01:22:38 -0800 (PST)
MIME-Version: 1.0
References: <Y3SnPaO3yhAs96tn@black.fi.intel.com>
In-Reply-To: <Y3SnPaO3yhAs96tn@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 16 Nov 2022 10:22:27 +0100
Message-ID: <CAMRc=McuWvT0EQ5DKe_3O0iAEWB8dOYg2sU0a3-k4K92mhZunw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.2-1
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

On Wed, Nov 16, 2022 at 10:02 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Rather quite small GPIO updates from me for the v6.2 cycle.
> Was a few weeks in Linux Next without any problems reported.
> Please pull!
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
>
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.2-1
>
> for you to fetch changes up to 8d259847243d1e21a866e828c4ce90d759f3d17b:
>
>   gpiolib: cdev: Fix typo in kernel doc for struct line (2022-10-25 19:48:55 +0300)
>
> ----------------------------------------------------------------
> intel-gpio for v6.2-1
>
> * Miscellaneous updates to the core (cdev, acpi) and Intel Merrifield driver
>
> The following is an automated git shortlog grouped by driver:
>
> gpiolib:
>  -  cdev: Fix typo in kernel doc for struct line
>  -  acpi: Use METHOD_NAME__AEI macro for acpi_walk_resources
>
> merrifield:
>  -  Use str_enable_disable() helper
>
> ----------------------------------------------------------------
> Andy Shevchenko (2):
>       gpio: merrifield: Use str_enable_disable() helper
>       gpiolib: cdev: Fix typo in kernel doc for struct line
>
> Xiang Yang (1):
>       gpiolib: acpi: Use METHOD_NAME__AEI macro for acpi_walk_resources
>
>  drivers/gpio/gpio-merrifield.c | 3 ++-
>  drivers/gpio/gpiolib-acpi.c    | 2 +-
>  drivers/gpio/gpiolib-cdev.c    | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart
