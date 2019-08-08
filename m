Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD505865B4
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 17:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732662AbfHHP10 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 11:27:26 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36135 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbfHHP10 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 11:27:26 -0400
Received: by mail-ot1-f67.google.com with SMTP id r6so120130302oti.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8EYoKaSRcLGAHqAj1P4POdFgfsddIZ1t+1yAZptyD9Y=;
        b=zEdj2NNtOPwFpuT0fV2YTpC9cmwcSm8TaDBnxnTv6iVYHMwHqWtQeIDc+I9EDJYcKL
         nEZvbKnw0t3n40wt4M2WXIFnilwUOdSrsPuxAxzJAInm/xP/BOZ60Ed8HG8LmFddiUQh
         KIUk1O9mFkyf8hjQgHIvlJZkjgF7qODyjnsHtE0TVVtzduzaWMme0rqkofVUTRrTOWFu
         LmheStIhb7qC8pLPTeNHg3mIJZJL9I6Btjd/ynLS5GwTQdwl4KVK0CZLsNuSBRTC2n87
         dM+9qTp15GhxMxdneiBWZ0HQ/NX1Ftnjjy2sUtpBgVmb78M5XzYEEjnXuf0ILOp9oFmP
         ruSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8EYoKaSRcLGAHqAj1P4POdFgfsddIZ1t+1yAZptyD9Y=;
        b=BvCcl3MrYzc0ar+esymuPxUagC400RwduxmVF+EhL4/8SbQDEWAhm8icBdOsDrCrJW
         UvJdKnecui6+Mi7Ao/BUo52hysuHS4KjvSzXRJqGEE5OT/JibsiZajzTYa7J/LYh1GJg
         4kpxFPAkAEE2z39/cwT5+l9hXl2C4Cz412dwSgk2jbe0ftDvGMRO7x+c6/VcsG6nGgTY
         PYiZDE42sKVI7uc04U31SPfK+lNXae2j/zlgAmp8K2+SlPJoa80eKze2sZN9jBb5K9TQ
         dXr3neBdm0T3vJm83Jpzr/IE9erUStzTnpk2vdrblotmGLVbZRXdoyvH1L2htb7ax2j5
         QBOg==
X-Gm-Message-State: APjAAAXvseWGUdKp8jrMIgpV3P8IZXHGUwnvOfmz3mR+wdtzD7WbmbV5
        19NlPGl/J3lkMc6k3ab3hzRpQHrnczJtIKle9JOn2rPA
X-Google-Smtp-Source: APXvYqxHR9XKbYc3DHhqrOx22FFr+Vt4GWf+J0IRC5e8d4npgzU+arKbrkcBQi6TVEw2R85DPCCJRfRLk3abcUCT1Uw=
X-Received: by 2002:a5e:9314:: with SMTP id k20mr16404408iom.235.1565278045371;
 Thu, 08 Aug 2019 08:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190807195132.7538-1-alexander.stein@mailbox.org> <20190807195132.7538-5-alexander.stein@mailbox.org>
In-Reply-To: <20190807195132.7538-5-alexander.stein@mailbox.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 8 Aug 2019 17:27:14 +0200
Message-ID: <CAMRc=McmKs=5ToTRLgQ_f30DRtqq-57OZRw-EnL1gm_M1kqUXQ@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 5/5] bindings: cxx: Workaround --success run
To:     Alexander Stein <alexander.stein@mailbox.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 7 sie 2019 o 21:51 Alexander Stein <alexander.stein@mailbox.org>
napisa=C5=82(a):
>
> If run with --success, all expressions are evaluated and printed out.
> But REQUIRE_FALSE(chip) tries to iterate over the chip resulting in this
> backtrace:
> #0  gpiod_chip_num_lines (chip=3Dchip@entry=3D0x0) at ../../lib/core.c:23=
5
> #1  gpiod_line_iter_new (chip=3D0x0) at ../../lib/iter.c:140
> #2  gpiod::(anonymous namespace)::make_line_iter (chip=3D0x0) at ../../..=
/bindings/cxx/iter.cpp:29
> #3  gpiod::line_iter::line_iter (this=3D0x7fffffffd690, owner=3D...) at .=
./../../bindings/cxx/iter.cpp:109
> #4  Catch::rangeToString<gpiod::chip> (range=3D...) at /usr/include/catch=
2/catch.hpp:1959
> [...]
>
> Workaround by forcing catch2 to call gpiod::chip::operator bool().
>
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> This actually looks like a flaw in the binding itself that the
> gpiod::line_iter can't cope with an empty gpiod::chip.
>

Do you want to submit a patch that fixes that? Otherwise I can fix it.
I think that simply throwing an exception on empty chip is enough,
right?

Bart

>  bindings/cxx/tests/tests-chip.cpp | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests=
-chip.cpp
> index c9eb8e5..1c69872 100644
> --- a/bindings/cxx/tests/tests-chip.cpp
> +++ b/bindings/cxx/tests/tests-chip.cpp
> @@ -70,7 +70,7 @@ TEST_CASE("GPIO chip can be opened with the open() meth=
od in different modes", "
>         mockup::probe_guard mockup_chips({ 8, 8, 8 });
>         ::gpiod::chip chip;
>
> -       REQUIRE_FALSE(chip);
> +       REQUIRE_FALSE(!!chip);
>
>         SECTION("open by name")
>         {
> @@ -102,7 +102,7 @@ TEST_CASE("Uninitialized GPIO chip behaves correctly"=
, "[chip]")
>
>         SECTION("uninitialized chip is 'false'")
>         {
> -               REQUIRE_FALSE(chip);
> +               REQUIRE_FALSE(!!chip);
>         }
>
>         SECTION("using uninitialized chip throws logic_error")
> @@ -149,7 +149,7 @@ TEST_CASE("Chip object can be reset", "[chip]")
>         ::gpiod::chip chip(mockup::instance().chip_name(0));
>         REQUIRE(chip);
>         chip.reset();
> -       REQUIRE_FALSE(chip);
> +       REQUIRE_FALSE(!!chip);
>  }
>
>  TEST_CASE("Chip info can be correctly retrieved", "[chip]")
> --
> 2.22.0
>
