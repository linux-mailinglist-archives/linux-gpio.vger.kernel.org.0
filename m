Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDA1354DB81
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jun 2022 09:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359300AbiFPH0C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jun 2022 03:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359274AbiFPHZ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jun 2022 03:25:56 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B795C367
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jun 2022 00:25:54 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id n28so936425edb.9
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jun 2022 00:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IXd5GHrMRSWqaYRiZMp6cxgQ+Mf0Qq8p0m+31elxZm4=;
        b=OK8rjAzru//fME8r4HTG67ZWe8Hk8dntP+1ENsIm6DZS7QumVwkE9CAqIzFw7h1L1j
         U7oMeBgs1jn+733WcmFA7WukiB+IHCtuejurExY2WLPYw25x8kDvdp8hSEvCBeDwAGj8
         ggZLd8F0IGmNHIoVkup/HATpEilwINVeR8iDLaVg5+n7L+trBRUbIagXZlutrT7rRncU
         fMH30lQvsn5H5iTlWA2qLGniDEZZ8tY7DEUd2B1BXOgRlef6Jny3uOQidOILVFmAgQM4
         waQ5YytUULciuZFqFFYSgkmC+gBCX7ws9u9QlivHwykmJ2BM7yR9B6/Y8f/eBZhajODV
         eBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IXd5GHrMRSWqaYRiZMp6cxgQ+Mf0Qq8p0m+31elxZm4=;
        b=MCGFqGuT9g7XxPQGx/uLBzzqCcRK6AXegUYbF0ebetiAWSjgRx29Lbycwc7Ucb8/yi
         Yv+gYhht6fgWz3afIbNHEd0v289gU0oZBh5MY59zKZo+PM39qrmR41twrlBkOO63tl4N
         PSTjPoJvYgi6bjl46HHH+gudeDybc4lkMIED13YROxOUDKa/veV/EXtSwdx/+rO8X6HA
         kQbmAtmA4d13U00XitsSrTXrbJpXq/QBHdLPVNLs/iJ7EggetCQxGf/3RV9f2JqKqU3F
         igcAjcvmJVHSG2GkwNzzK+AT+OP1F8u/SZHsE4dMoL47Wm6e+tuDPmemQX1ddW32Q58J
         wN/g==
X-Gm-Message-State: AJIora/ONoLSrLHOirfKNOmL4ZxjYD3FrVW3fJYtki5Vh6UPB4BVWfE/
        M2h59U0FIwqSlotEvY2P6n36jkJ/U09q+sxbyBzw9LUhOAE=
X-Google-Smtp-Source: AGRyM1vqU4zK78SKC2BlFRnpk8Ha8qMvdpJHmI8S+gggOfyDWUc5J5A87eItrorh4rFTKDnoSrGOqiRIqnmIJQa6R44=
X-Received: by 2002:a05:6402:4408:b0:42d:dc8d:a081 with SMTP id
 y8-20020a056402440800b0042ddc8da081mr4673091eda.69.1655364352598; Thu, 16 Jun
 2022 00:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220615102608.11230-1-yegorslists@googlemail.com>
In-Reply-To: <20220615102608.11230-1-yegorslists@googlemail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 16 Jun 2022 09:25:41 +0200
Message-ID: <CAMRc=MeNxW2bEkueCbRwZgUox9sZhnPTrq49u55rcKKwa834jA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] treewide: fix typos found with codespell
To:     yegorslists@googlemail.com
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 15, 2022 at 12:26 PM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  NEWS                                     | 6 +++---
>  bindings/cxx/gpiod.hpp                   | 2 +-
>  bindings/python/tests/gpiomockupmodule.c | 2 +-
>  include/gpiod.h                          | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/NEWS b/NEWS
> index c843c3c..0e173f8 100644
> --- a/NEWS
> +++ b/NEWS
> @@ -52,7 +52,7 @@ New features:
>
>  Improvements:
>  - constified function arguments where applicable in libgpiomockup
> -- fixed the name of the test exeucutable displayed at build time
> +- fixed the name of the test executable displayed at build time
>  - improved the function pointer casting in Python bindings to avoid warnings
>    emitted by GCC8
>  - switched to using the KERNEL_VERSION() macro in tests instead of handcoded
> @@ -65,7 +65,7 @@ Improvements:
>    using it to set the pull of dummy lines
>  - add several new test cases
>  - improved Python example programs (made gpiomon's output similar to the
> -  original tool, make gpioset wait for an ENTER pres by default)
> +  original tool, make gpioset wait for an ENTER press by default)
>  - fixed the major:minor number comparison between the device and sysfs
>  - deprecated the gpiod_line_needs_update() function and removed the logic
>    behind it from the library
> @@ -233,7 +233,7 @@ Bug fixes:
>    gpioget
>  - fix a line test case: don't use open-drain or open-source flags for input
>    mode
> -- fix the flags passed to ar in order to supress a build warning
> +- fix the flags passed to ar in order to suppress a build warning
>  - set the last error code in gpiod_chip_open_by_label() to ENOENT if a chip
>    can't be found
>  - fix checking the kernel version in the test suite
> diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
> index e3ce2fc..87ecf41 100644
> --- a/bindings/cxx/gpiod.hpp
> +++ b/bindings/cxx/gpiod.hpp
> @@ -282,7 +282,7 @@ public:
>
>         /**
>          * @brief Get the offset of this line.
> -        * @return Offet of this line.
> +        * @return Offset of this line.
>          */
>         unsigned int offset(void) const;
>
> diff --git a/bindings/python/tests/gpiomockupmodule.c b/bindings/python/tests/gpiomockupmodule.c
> index 761d431..46737c2 100644
> --- a/bindings/python/tests/gpiomockupmodule.c
> +++ b/bindings/python/tests/gpiomockupmodule.c
> @@ -61,7 +61,7 @@ static PyObject *gpiomockup_Mockup_probe(gpiomockup_MockupObject *self,
>                 return NULL;
>         } else if (num_chips == 0) {
>                 PyErr_SetString(PyExc_TypeError,
> -                               "Number of chips must be greater thatn 0");
> +                               "Number of chips must be greater than 0");
>                 return NULL;
>         }
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index a4ce01f..6a20a7d 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -114,7 +114,7 @@ unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip);
>   * @brief Get the handle to the GPIO line at given offset.
>   * @param chip The GPIO chip object.
>   * @param offset The offset of the GPIO line.
> - * @return Pointer to the GPIO line handle or NULL if an error occured.
> + * @return Pointer to the GPIO line handle or NULL if an error occurred.
>   */
>  struct gpiod_line *
>  gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset);
> --
> 2.17.0
>

Can you run this tool on the next/libgpiod-2.0 branch instead? It will
soon be merged into master and replace most of the code you're
updating here.

Bart
