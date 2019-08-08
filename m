Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A59E5865AF
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 17:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732698AbfHHPZt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 11:25:49 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40886 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732662AbfHHPZt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 11:25:49 -0400
Received: by mail-ot1-f68.google.com with SMTP id l15so62896634oth.7
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PnlCb8zIdH0Mzv29QMVBuiwxizQzl0OfUx8xesbpVMk=;
        b=uPXlC+UUlE9aSNAm8U6y82/3/Y1MB+R7uVlo0PFGdYatwpJZkeTuE8t1v+ibxHUx4G
         c0/MBN8aWUMTWHwJwKbYVSPMsTgbxWNTVgaZlDER+23WVqDGtL2StVd6EGHsu89/z3wo
         0n001igcprEoveMJZh45k/i06nzA8TfFEK1EnD/XzcJtyEfGt6iCt+Hw7kdFs3zi5Ykp
         AfTwBylVrpCPJwK74ePYW5791Aaa5T30EWAhhHJOwbPKYnjm6tqEWyjM3nWzZvuPs5cu
         n0Ck2hHkCjw/VsONKCE1T5mVjPWtibVbsDjuV88fKCg4IuYh+nIOUipuWOLnQ+qoHhJm
         9Z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PnlCb8zIdH0Mzv29QMVBuiwxizQzl0OfUx8xesbpVMk=;
        b=NZXvvHb/eIsMMl7xQUBFoECXPVtja/2YM00UPO1pZGSHpX1sEV/38YJwAfDq9jkswP
         JZCLYzfljw8EFgeTPg91Fdo5BV9VxAPyjjj7uVePhCEPcpOOkhT95RprZEN6B3HpcXTB
         UmEQucB059wXKlbLSLZbe5bQk9+OG323oxoQVQX9uDt41Aht4AuL5r5Vohewo6TAkLLY
         2ctHx3yr1PjTcNjyJKGjsp1CVZYTY7odVf+Qg1uR1Zh+xxc2igJUETHOxKmvamdBE+8g
         2pNksFUyAXH7tsONl4bN8ciszE84XF7sruUo+G80ZkssnsXDfkv5zCqgVw+uRHZPP4DR
         AMsw==
X-Gm-Message-State: APjAAAX1QPI0FRikbMhHspcsNeczqkQ+Hq9tTIDfYQg2Hx1UA5nT7QjR
        WyyK9xFG4Zhoqp0CcgY2zUKwjy4qiIly5KFjsrTx0/4WwnA=
X-Google-Smtp-Source: APXvYqwB+27vwdDo72D9jY76IX5HjOgikwYshtxaRgmYiD5YooB8+EXkEiOLPfJnO6/CL88FBy5BsQes+I8wrvhTKa4=
X-Received: by 2002:a02:6a56:: with SMTP id m22mr5579652jaf.114.1565277947551;
 Thu, 08 Aug 2019 08:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190807195132.7538-1-alexander.stein@mailbox.org> <20190807195132.7538-4-alexander.stein@mailbox.org>
In-Reply-To: <20190807195132.7538-4-alexander.stein@mailbox.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 8 Aug 2019 17:25:36 +0200
Message-ID: <CAMRc=MdnbDR2fK1qrqwapTXGm2OMdKjmSpicEWg93XB=ORoJrA@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 4/5] bindings: cxx: Fix compile errors
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
> This fixes the following compile errors:
> tests-event.cpp:152:3: error: cannot declare reference to
> 'class std::system_error&', which is not a typedef or a template type
> argument
>   152 |   REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_error&);
>

Hi Alexander, thanks for working on this!

I'm getting the following warning when I don't use the reference:

In file included from tests-line.cpp:8:
tests-line.cpp: In function =E2=80=98void ____C_A_T_C_H____T_E_S_T____24()=
=E2=80=99:
tests-line.cpp:254:45: warning: catching polymorphic type =E2=80=98class
std::system_error=E2=80=99 by value [-Wcatch-value=3D]
  REQUIRE_THROWS_AS(line.get_value(), ::std::system_error);
                                             ^~~~~~~~~~~~
I'm also not getting any build errors with my current next or master
branch. My gcc is:

gcc (Debian 8.3.0-6) 8.3.0
Copyright (C) 2018 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Bart

> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
>  bindings/cxx/tests/tests-chip.cpp  |  8 ++++----
>  bindings/cxx/tests/tests-event.cpp |  4 ++--
>  bindings/cxx/tests/tests-line.cpp  | 16 ++++++++--------
>  3 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests=
-chip.cpp
> index 11c2d4c..c9eb8e5 100644
> --- a/bindings/cxx/tests/tests-chip.cpp
> +++ b/bindings/cxx/tests/tests-chip.cpp
> @@ -107,7 +107,7 @@ TEST_CASE("Uninitialized GPIO chip behaves correctly"=
, "[chip]")
>
>         SECTION("using uninitialized chip throws logic_error")
>         {
> -               REQUIRE_THROWS_AS(chip.name(), ::std::logic_error&);
> +               REQUIRE_THROWS_AS(chip.name(), ::std::logic_error);
>         }
>  }
>
> @@ -139,7 +139,7 @@ TEST_CASE("GPIO chip can be opened with the open() me=
thod with implicit lookup",
>
>  TEST_CASE("Trying to open a nonexistent chip throws system_error", "[chi=
p]")
>  {
> -       REQUIRE_THROWS_AS(::gpiod::chip("nonexistent-chip"), ::std::syste=
m_error&);
> +       REQUIRE_THROWS_AS(::gpiod::chip("nonexistent-chip"), ::std::syste=
m_error);
>  }
>
>  TEST_CASE("Chip object can be reset", "[chip]")
> @@ -244,12 +244,12 @@ TEST_CASE("Errors occurring when retrieving lines a=
re correctly reported", "[chi
>
>         SECTION("invalid offset (single line)")
>         {
> -               REQUIRE_THROWS_AS(chip.get_line(9), ::std::out_of_range&)=
;
> +               REQUIRE_THROWS_AS(chip.get_line(9), ::std::out_of_range);
>         }
>
>         SECTION("invalid offset (multiple lines)")
>         {
> -               REQUIRE_THROWS_AS(chip.get_lines({ 1, 19, 4, 7 }), ::std:=
:out_of_range&);
> +               REQUIRE_THROWS_AS(chip.get_lines({ 1, 19, 4, 7 }), ::std:=
:out_of_range);
>         }
>
>         SECTION("line not found by name")
> diff --git a/bindings/cxx/tests/tests-event.cpp b/bindings/cxx/tests/test=
s-event.cpp
> index b34347f..b41cf7e 100644
> --- a/bindings/cxx/tests/tests-event.cpp
> +++ b/bindings/cxx/tests/tests-event.cpp
> @@ -149,7 +149,7 @@ TEST_CASE("It's possible to retrieve the event file d=
escriptor", "[event][line]"
>
>         SECTION("error if not requested")
>         {
> -               REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_erro=
r&);
> +               REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_erro=
r);
>         }
>
>         SECTION("error if requested for values")
> @@ -157,7 +157,7 @@ TEST_CASE("It's possible to retrieve the event file d=
escriptor", "[event][line]"
>                 config.request_type =3D ::gpiod::line_request::DIRECTION_=
INPUT;
>
>                 line.request(config);
> -               REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_erro=
r&);
> +               REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_erro=
r);
>         }
>  }
>
> diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests=
-line.cpp
> index e827e60..08ff1e8 100644
> --- a/bindings/cxx/tests/tests-line.cpp
> +++ b/bindings/cxx/tests/tests-line.cpp
> @@ -122,7 +122,7 @@ TEST_CASE("Line bulk object works correctly", "[line]=
[bulk]")
>         {
>                 auto lines =3D chip.get_all_lines();
>
> -               REQUIRE_THROWS_AS(lines.get(11), ::std::out_of_range&);
> +               REQUIRE_THROWS_AS(lines.get(11), ::std::out_of_range);
>         }
>  }
>
> @@ -242,7 +242,7 @@ TEST_CASE("Exported line can be released", "[line]")
>         line.release();
>
>         REQUIRE_FALSE(line.is_requested());
> -       REQUIRE_THROWS_AS(line.get_value(), ::std::system_error&);
> +       REQUIRE_THROWS_AS(line.get_value(), ::std::system_error);
>  }
>
>  TEST_CASE("Uninitialized GPIO line behaves correctly", "[line]")
> @@ -256,7 +256,7 @@ TEST_CASE("Uninitialized GPIO line behaves correctly"=
, "[line]")
>
>         SECTION("using uninitialized line throws logic_error")
>         {
> -               REQUIRE_THROWS_AS(line.name(), ::std::logic_error&);
> +               REQUIRE_THROWS_AS(line.name(), ::std::logic_error);
>         }
>  }
>
> @@ -271,7 +271,7 @@ TEST_CASE("Uninitialized GPIO line_bulk behaves corre=
ctly", "[line][bulk]")
>
>         SECTION("using uninitialized line_bulk throws logic_error")
>         {
> -               REQUIRE_THROWS_AS(bulk.get(0), ::std::logic_error&);
> +               REQUIRE_THROWS_AS(bulk.get(0), ::std::logic_error);
>         }
>  }
>
> @@ -289,7 +289,7 @@ TEST_CASE("Cannot request the same line twice", "[lin=
e]")
>                 auto line =3D chip.get_line(3);
>
>                 REQUIRE_NOTHROW(line.request(config));
> -               REQUIRE_THROWS_AS(line.request(config), ::std::system_err=
or&);
> +               REQUIRE_THROWS_AS(line.request(config), ::std::system_err=
or);
>         }
>
>         SECTION("request the same line twice in line_bulk")
> @@ -300,7 +300,7 @@ TEST_CASE("Cannot request the same line twice", "[lin=
e]")
>                  */
>                 auto lines =3D chip.get_lines({ 2, 3, 4, 4 });
>
> -               REQUIRE_THROWS_AS(lines.request(config), ::std::system_er=
ror&);
> +               REQUIRE_THROWS_AS(lines.request(config), ::std::system_er=
ror);
>         }
>  }
>
> @@ -312,12 +312,12 @@ TEST_CASE("Cannot get/set values of unrequested lin=
es", "[line]")
>
>         SECTION("get value")
>         {
> -               REQUIRE_THROWS_AS(line.get_value(), ::std::system_error&)=
;
> +               REQUIRE_THROWS_AS(line.get_value(), ::std::system_error);
>         }
>
>         SECTION("set value")
>         {
> -               REQUIRE_THROWS_AS(line.set_value(1), ::std::system_error&=
);
> +               REQUIRE_THROWS_AS(line.set_value(1), ::std::system_error)=
;
>         }
>  }
>
> --
> 2.22.0
>
