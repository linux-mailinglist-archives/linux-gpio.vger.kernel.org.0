Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3541D57B68D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jul 2022 14:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240842AbiGTMfw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jul 2022 08:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239519AbiGTMfw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jul 2022 08:35:52 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47911B7AD
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jul 2022 05:35:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id va17so32879439ejb.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jul 2022 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WgbjDJxnlsoUvGqV3p0oq3wEGrVhwZfOQ07rixfBDyc=;
        b=1EihxAR75uhhs1ZJzkLW6uPWyzjo+D4w/IX+hrrqPW1UvrLuGlCy+T4s8D45WUAH+d
         y//V4H6j+WTcasvfNN5IJPqoQBmfGspRSqOxymhx+JOe3NqD5WM2PqJgcRVRYryXrqiH
         x+yNbDrvnc0xfR6zaThLzILzBR0N/7RjT8PTWRpx+IN+mRcCzoeISWeVfgUO4SdcX0R4
         S4qHDqIUCsQIiC4diVDCFQiUA54xQbam8k7HDl36rhrxitH0nEPhdJTmmd6rFAdN0+Yy
         28QCqeZ/JJO1KtvztG2d3OwbwWEjiZ6sGehpgb5TMBeImgC85+KDBhwXt9x6aQQB36nM
         Eh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WgbjDJxnlsoUvGqV3p0oq3wEGrVhwZfOQ07rixfBDyc=;
        b=sUVWVyHXwP96k2tI9D2oyTgNiSoRhnpvcUyXyDALgSa2G0MYCQrQ1/Pc7is84WOznX
         PU9ACmTBGK35lapBN4EKm8CyAMGrJTeRu6BsKltAApYlakxax/591u2jxFG5/nrQjPjK
         XksLyg+C1r5B6LfHkSl3HZqSu0mvh0M9qTnyEHBc8eFQs7CKMVcS6SjYS3dz9ji3+6vc
         yNkwRmb7bGDOKYh7EGL1uGc7yGwpkOvsEi9s1X9/VmSqRz/PPlr3yOZyb87d/+Viww4v
         gAAc5+G1+hdbF9JJ5Id4OC2xfS1BHJmeD/M8lYev5AYU14gMfvj4nYU7o5HytnYy/1nQ
         85VA==
X-Gm-Message-State: AJIora9nq/jZMHltu7VxkXcdSCgB2pkPGblZpoAPp37bp74DPWnKKjfc
        sRBTZJt0HahEvxUugnLoHdUa5MdvZmmHTtkDlT4zKg==
X-Google-Smtp-Source: AGRyM1uhG4kCz0NJGlM2u+GQzufPCyNBBSU8Ghb0Zc+6Mta8PYJAw1xofFomiD6DS01G9Uyl4T6d+pzS+gPGTjlRoF0=
X-Received: by 2002:a17:907:1b16:b0:72b:8c16:dac0 with SMTP id
 mp22-20020a1709071b1600b0072b8c16dac0mr34200884ejc.286.1658320548402; Wed, 20
 Jul 2022 05:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220719110601.136474-1-warthog618@gmail.com>
In-Reply-To: <20220719110601.136474-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 20 Jul 2022 14:35:37 +0200
Message-ID: <CAMRc=McwEsmDw2SGfbf8EKm-sHpQCVoPcNj8QMuuAf-P59utnQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: gpio: fix include path to kernel headers for
 out of tree builds
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 19, 2022 at 1:06 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> When building selftests out of the kernel tree the gpio.h the include
> path is incorrect and the build falls back to the system includes
> which may be outdated.
>
> Add the KHDR_INCLUDES to the CFLAGS to include the gpio.h from the
> build tree.
>
> Fixes: 4f4d0af7b2d9 ("selftests: gpio: restore CFLAGS options")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> The test bot suggested
> 4f4d0af7b2d9 ("selftests: gpio: restore CFLAGS options")
> as the commit to be fixed, but the previous fix which turned out to be
> incomplete seems more appropriate.
>
>  tools/testing/selftests/gpio/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
> index 71b306602368..616ed4019655 100644
> --- a/tools/testing/selftests/gpio/Makefile
> +++ b/tools/testing/selftests/gpio/Makefile
> @@ -3,6 +3,6 @@
>  TEST_PROGS := gpio-mockup.sh gpio-sim.sh
>  TEST_FILES := gpio-mockup-sysfs.sh
>  TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info gpio-line-name
> -CFLAGS += -O2 -g -Wall -I../../../../usr/include/
> +CFLAGS += -O2 -g -Wall -I../../../../usr/include/ $(KHDR_INCLUDES)
>
>  include ../lib.mk
> --
> 2.37.1
>

Queued for fixes, thanks!

Bart
