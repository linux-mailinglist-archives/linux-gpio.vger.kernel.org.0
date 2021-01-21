Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8E62FE60B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 10:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbhAUJOa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 04:14:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbhAUJK6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 04:10:58 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD247C061757
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 01:10:17 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id w1so1522436ejf.11
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 01:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KvSZXCYCWOThZAfGsURUVFj6535QaWB9mdWG/Okc3Dc=;
        b=KwxrYMpHH9qLRqqFUZUCA/DpVUlNgagc9NdihZv6Bm4DwVruBYO7srGUU9Nq3fnieT
         5mkU7Hmeen6wQzsG8A5DBEisThlpyPJ+haaaE9pTRg1QnpDswmpCOd2KaB1y1kV90/I9
         WNRuxeh7payKI6+CrTTdR0mKCFBIamgnCzS997gxh1RUMHZgxiZIFrIl5Y82kNSvWZ+0
         UgY3NtQouMUwza9ORQ/KGtT+AdFxOWZtxlKdLyS4GdbFQtQhkaeQiZoteAoxI+PzTVGL
         +5KblkR4eZm1JIi1CybByAZJWA3BHsvxZJLkz2r72TfxDhzbtNroCZsXPBZT7xI/cdfz
         BelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KvSZXCYCWOThZAfGsURUVFj6535QaWB9mdWG/Okc3Dc=;
        b=kAWRDwOtxrRpjSRg9L0JOBA+CW9AelpJ2H2jCBFepSjme0ruXmB/g4g2/ACqgpw62c
         9yPD8uED5JaTK0eA+u0R9DMfYOFbMLCyKXsvUc5c3LFw6YgUiyE7Rcx7CAEKdzdw8FmL
         GwbWihRwChhPXpCbUnUZ9Hlw5ATLYB9XoVOJg+YZ1X+Arhnxs39tyYpbSq0gcD5OacaV
         p/rUL4Xd+ud+41iKi4r/GGzwbpvzD6WIrb1sShB/DHf0KyWw89hfb9GVDDrmQaIR+UD6
         pf91BkmmaRPz2AwUBCNnQh9OFA+DdndwRES+A1kOD41WG+UPCgxmnA+W2YpXz3YOkVbF
         OHOA==
X-Gm-Message-State: AOAM531IproAUwN1j2DE/hEe6QKGdF5CyD8TUBv65sgPOUWeB6M+Ig83
        UXclps/+ATuplipkI7RTqL97yulbB5NNUjL4uhNxDQ==
X-Google-Smtp-Source: ABdhPJzcDVgtUI8VbkH5psf2+PhlkdEMXEoekbPbL+gHtEGw/aDUCBqg1KYZYSHgu+t5lCtRgdvSbxl+tt0/5XpuByI=
X-Received: by 2002:a17:906:3146:: with SMTP id e6mr8232507eje.363.1611220216355;
 Thu, 21 Jan 2021 01:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20210119123059.102004-1-warthog618@gmail.com>
In-Reply-To: <20210119123059.102004-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 21 Jan 2021 10:10:05 +0100
Message-ID: <CAMpxmJVfeWW81UKpsx-pCQF1jhHwrFiuxVfvkgBxFLCHPeEXXQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] selftests: gpio: rework and port to GPIO uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 19, 2021 at 1:31 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Initially I just wanted to port the selftests to the latest GPIO uAPI,
> but on finding that, due to dependency issues, the selftests are not built
> for the buildroot environments that I do most of my GPIO testing in, I
> decided to take a closer look.
>
> The first patch is essentially a rewrite of the exising test suite.
> It uses a simplified abstraction of the uAPI interfaces to allow a common
> test suite to test the gpio-mockup using either of the uAPI interfaces.
> The simplified cdev interface is implemented in gpio-mockup.sh, with the
> actual driving of the uAPI implemented in gpio-mockup-cdev.c.
> The simplified sysfs interface replaces gpio-mockup-sysfs.sh and is
> loaded over the cdev implementation when selected.
>
> The new tests should also be simpler to extend to cover new mockup
> interfaces, such as the one Bart has been working on.
>
> I have dropped support for testing modules other than gpio-mockup from
> the command line options, as the tests are very gpio-mockup specific so
> I didn't see any calling for it.
>
> I have also tried to emphasise in the test output that the tests are
> covering the gpio-mockup itself.  They do perform some implicit testing
> of gpiolib and the uAPI interfaces, and so can be useful as smoke tests
> for those, but their primary focus is the gpio-mockup.
>
> Patches 2 through 5 do some cleaning up that is now possible with the
> new implementation, including enabling building in buildroot environments.
> Patch 4 doesn't strictly clean up all the old gpio references that it
> could - the gpio was the only Level 1 test, so the Level 1 tests could
> potentially be removed, but I was unsure if there may be other
> implications to removing a whole test level, or that it may be useful
> as a placeholder in case other static LDLIBS tests are added in
> the future??
>
> Patch 6 finally gets around to porting the tests to the latest GPIO uAPI.
>
> And Patch 7 updates the config to set the CONFIG_GPIO_CDEV option that
> was added in v5.10.
>
> Cheers,
> Kent.
>
> Changes v2 -> v3:
>  - remove 'commit' from Fixes tag in patch 1.
>  - rebase on Bart's gpio/for-next
>
> Changes v1 -> v2 (all in patch 1 and gpio-mockup.sh unless stated
>  otherwise):
>  - reorder includes in gpio-mockup-cdev.c
>  - a multitude of improvements to gpio-mockup.sh and gpio-mockup-sysfs.sh
>    based on Andy's review comments
>  - improved cleanup to ensure all child processes are killed on exit
>  - added race condition prevention or mitigation including the wait in
>    release_line, the retries in assert_mock, the assert_mock in set_mock,
>    and the sleep in set_line
>
> Kent Gibson (7):
>   selftests: gpio: rework and simplify test implementation
>   selftests: gpio: remove obsolete gpio-mockup-chardev.c
>   selftests: remove obsolete build restriction for gpio
>   selftests: remove obsolete gpio references from kselftest_deps.sh
>   tools: gpio: remove uAPI v1 code no longer used by selftests
>   selftests: gpio: port to GPIO uAPI v2
>   selftests: gpio: add CONFIG_GPIO_CDEV to config
>
>  tools/gpio/gpio-utils.c                       |  89 ----
>  tools/gpio/gpio-utils.h                       |   6 -
>  tools/testing/selftests/Makefile              |   9 -
>  tools/testing/selftests/gpio/Makefile         |  26 +-
>  tools/testing/selftests/gpio/config           |   1 +
>  .../testing/selftests/gpio/gpio-mockup-cdev.c | 198 +++++++
>  .../selftests/gpio/gpio-mockup-chardev.c      | 323 ------------
>  .../selftests/gpio/gpio-mockup-sysfs.sh       | 168 ++----
>  tools/testing/selftests/gpio/gpio-mockup.sh   | 497 ++++++++++++------
>  tools/testing/selftests/kselftest_deps.sh     |   4 +-
>  10 files changed, 603 insertions(+), 718 deletions(-)
>  create mode 100644 tools/testing/selftests/gpio/gpio-mockup-cdev.c
>  delete mode 100644 tools/testing/selftests/gpio/gpio-mockup-chardev.c
>
>
> base-commit: 64e6066e16b8c562983dd9d33e604c0001ae0fc7
> --
> 2.30.0
>

Series applied, thanks!

Bartosz
