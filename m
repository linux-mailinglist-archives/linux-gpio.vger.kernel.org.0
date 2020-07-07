Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94D02168A0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 10:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgGGIvs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 04:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgGGIvr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 04:51:47 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF43C061755
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 01:51:47 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id d27so31119755qtg.4
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 01:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yP72YWeLU5sMOPz/Z/RhgCtVC8i2Il0r0xFHo/2p+x4=;
        b=xr75r3K/EJacomCXakfRs113HimS6T0hlDgRyMMwKINy1HcHQ0PvFiF/EEIEDSvhcW
         /W02tE9hMOtwZKVrbL+6s4MnWPIu80uoxy7FWLEubQcHyH3vwXAvmVrU/pFQaAel0a0d
         TIHtwszIwylMHwlGod0n2YSxLW+ElEiMORsQH5/AEWZtTd2p58x9hwXtlyO3MLKSyvGt
         0n17cX4PZowIs1gxqps4mHLwIKz08FWUm4t+y4KbdWASLCvAeLVUHYyHU+NMz/9cpOU/
         sZaG41ZBUx8AShQcZf3fzGJP6t+AQ9hkfDvySYk/rUUFb+3sAP3r8YL48OXf7QUe5+as
         FuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yP72YWeLU5sMOPz/Z/RhgCtVC8i2Il0r0xFHo/2p+x4=;
        b=cuA1/ViCx5bHnZTJWmfs66pFV0tPAdHjONO/Xu9Y7r9yaiUWOf3wW3e6BcRKJ27aDa
         Alzwt7xfQ3bujB7vfiGp54fhM6sEo3YQ8FDntlTkefUmImUjWQfIJBMfhs4ruKTA3vPC
         XovIKw7K9AIyQrw5eQn6ZTOe2M0b0ouNpL/3NUU78K4Dk9R+G+YHPifq3QAZcVAWMzLD
         fQ/EyfiNqnS3da1un1a9E4zjpNvsQZctnuGwGdf9xfHBNq3EsAJaDQLueETp/pAmMOMG
         Kt13Gd0MPgI5UOFfaxIosO/c3FY4V7Oa34GKCuW62LJUGaXjy872c5xQ4uI4+It5SvkM
         S8bA==
X-Gm-Message-State: AOAM530cSD0LmR3KnN3j+GJLSg+fWFXywB7QEOJvZ9t4Duicit6Ch4SI
        W/BLbm4V1fdXGtGinTP+PYglBI8hJ87TsXXonqRZ4Nz3
X-Google-Smtp-Source: ABdhPJxPomvpM80WlooYqlNYhNyQd9PwQQsKMagUjwdNt/77QiXjX96SjCWCP9iYrMS7ZSBAdPhuv5jh3cD7RMWvM0M=
X-Received: by 2002:aed:21da:: with SMTP id m26mr34625825qtc.197.1594111906542;
 Tue, 07 Jul 2020 01:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200701013908.42359-1-warthog618@gmail.com>
In-Reply-To: <20200701013908.42359-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 7 Jul 2020 10:51:35 +0200
Message-ID: <CAMpxmJXe9VL3GT+QJvqOCu7mqLyEaTFL1LO=FQP1UA4UPhMRLA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: cxx: fix sign-compare compile
 warnings in tests
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 1, 2020 at 3:39 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Fix sign-compare compile warnings in cxx tests.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Just noticed these warnings while rebuilding in a fresh build environment.
> Not sure if they were triggered by an enviromental change, or if I just
> wasn't paying enough attention before, but either way this patch makes
> the compiler happier.
>
>  bindings/cxx/tests/tests-iter.cpp | 2 +-
>  bindings/cxx/tests/tests-line.cpp | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/cxx/tests/tests-iter.cpp b/bindings/cxx/tests/tests-iter.cpp
> index fdc2cb5..4c07613 100644
> --- a/bindings/cxx/tests/tests-iter.cpp
> +++ b/bindings/cxx/tests/tests-iter.cpp
> @@ -53,7 +53,7 @@ TEST_CASE("Line iterator works", "[iter][line]")
>  {
>         mockup::probe_guard mockup_chips({ 4 });
>         ::gpiod::chip chip(mockup::instance().chip_name(0));
> -       int count = 0;
> +       unsigned int count = 0;
>
>         for (auto& it: ::gpiod::line_iter(chip))
>                 REQUIRE(it.offset() == count++);
> diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
> index 5353093..e2e4cbc 100644
> --- a/bindings/cxx/tests/tests-line.cpp
> +++ b/bindings/cxx/tests/tests-line.cpp
> @@ -210,7 +210,7 @@ TEST_CASE("Line bulk object works correctly", "[line][bulk]")
>         SECTION("bulk iterator works")
>         {
>                 auto lines = chip.get_all_lines();
> -               int count = 0;
> +               unsigned int count = 0;
>
>                 for (auto& it: lines)
>                         REQUIRE(it.offset() == count++);
>
> base-commit: b56d6b6a452e47fee8c70514afb99ccd77ada677
> --
> 2.27.0
>

Applied, thanks!

Bartosz
