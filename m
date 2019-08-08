Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 212A486605
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 17:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733259AbfHHPhc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 11:37:32 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40307 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbfHHPhc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 11:37:32 -0400
Received: by mail-ot1-f68.google.com with SMTP id l15so63059758oth.7
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 08:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y5KEj9LalZDSWGs3IdJ4C2d8MK7tspPf3CuGrbaFG44=;
        b=D4KTYDrhOq689cjueMnnc2/bCO7wvcgl7JwU+br69m4Nu8jdBTwU4MCKimAaPB7Qi9
         ++QBWX/h/sFW2nNMyrSLKFQyBI5WA7uKPvrE00MR44cAt587NQspbOsO24zat1nO3O47
         eVy5aAmfo7V86OBrxPh34hwhvdHhhUthaelgri1lhued6aDYqYWp/TfFkL8s912xCjLA
         wk+mvWBvVqXg7GvfF8TocKKEKe63l6tCom33Nvz+N5sshnkAVky3UMxOtxIxRFobVivb
         RYwflzca+aYZFtWuhz98NKeyJYmIutniFdKhIMAlKIF1/VfkDobzwmxqB8du7uQOdFlC
         jwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y5KEj9LalZDSWGs3IdJ4C2d8MK7tspPf3CuGrbaFG44=;
        b=YM3UOXNorQAZKI0SqN1P//m7LYHU/kPMtYuxEO+C+Rpk0ED0O+8t/44qZBlPbkApAd
         JzCsC5sjUvcBGWUZXHKJoJKmPTOExWEIyGeTygPs2Bg2DPRcNCX+A57Hrx3B/gmD/3AK
         03qPYQxpqzUHIRSKPV16C8hDN9XIgpEtcEdKlBRCpXb9OyHfRPM+WjjejyUleBozJbtk
         zbqJNiAyAN9HisA4MqUpOgFBBlipqdEmFBwljuBBV2w1kJ2arayXiw8vN5Jk8asfoMOY
         CKO+OAoUv7YPIPWFcPxjJ8pkLAiRFgr2rNc9pTeHKCzBZktFBDOD41SzDI8LHKdsjQUC
         vsjg==
X-Gm-Message-State: APjAAAVvpJlEKDwfAuaoqlWtnAjmAB8bei6R75LAqjJI84vKT/mIOPwO
        hg/6CHk9Qy9SQWKMuA8HB8EgnA78/cO9DShjrfylHQ==
X-Google-Smtp-Source: APXvYqxk6DCLJ7B9FPqPJXFVisAWxzQ9toY/ydtr6FwD0ZVIMgJ585/NFUIAxzFbFI+hsehtGC6MuY7WM7Xv9XUkKvU=
X-Received: by 2002:a5e:8a48:: with SMTP id o8mr6861867iom.287.1565278650338;
 Thu, 08 Aug 2019 08:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190807195132.7538-1-alexander.stein@mailbox.org>
 <20190807195132.7538-4-alexander.stein@mailbox.org> <CAMRc=MdnbDR2fK1qrqwapTXGm2OMdKjmSpicEWg93XB=ORoJrA@mail.gmail.com>
In-Reply-To: <CAMRc=MdnbDR2fK1qrqwapTXGm2OMdKjmSpicEWg93XB=ORoJrA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 8 Aug 2019 17:37:19 +0200
Message-ID: <CAMRc=McbDv1ArmLX8dnAUMazvN3j-25+6393sc6m9yAPpkvxyw@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 4/5] bindings: cxx: Fix compile errors
To:     Alexander Stein <alexander.stein@mailbox.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 8 sie 2019 o 17:25 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> =C5=9Br., 7 sie 2019 o 21:51 Alexander Stein <alexander.stein@mailbox.org=
>
> napisa=C5=82(a):
> >
> > This fixes the following compile errors:
> > tests-event.cpp:152:3: error: cannot declare reference to
> > 'class std::system_error&', which is not a typedef or a template type
> > argument
> >   152 |   REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_error&);
> >
>
> Hi Alexander, thanks for working on this!
>
> I'm getting the following warning when I don't use the reference:
>
> In file included from tests-line.cpp:8:
> tests-line.cpp: In function =E2=80=98void ____C_A_T_C_H____T_E_S_T____24(=
)=E2=80=99:
> tests-line.cpp:254:45: warning: catching polymorphic type =E2=80=98class
> std::system_error=E2=80=99 by value [-Wcatch-value=3D]
>   REQUIRE_THROWS_AS(line.get_value(), ::std::system_error);
>                                              ^~~~~~~~~~~~
> I'm also not getting any build errors with my current next or master
> branch. My gcc is:
>
> gcc (Debian 8.3.0-6) 8.3.0
> Copyright (C) 2018 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is N=
O
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.
>
> Bart

Nevermind that - I was using Debian's packaged version which happens
to be quite old. The current version actually does fail to build. I'll
test and pick up your patches tomorrow.

Bart

>
> > Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> > ---
> >  bindings/cxx/tests/tests-chip.cpp  |  8 ++++----
> >  bindings/cxx/tests/tests-event.cpp |  4 ++--
> >  bindings/cxx/tests/tests-line.cpp  | 16 ++++++++--------
> >  3 files changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tes=
ts-chip.cpp
> > index 11c2d4c..c9eb8e5 100644
> > --- a/bindings/cxx/tests/tests-chip.cpp
> > +++ b/bindings/cxx/tests/tests-chip.cpp
> > @@ -107,7 +107,7 @@ TEST_CASE("Uninitialized GPIO chip behaves correctl=
y", "[chip]")
> >
> >         SECTION("using uninitialized chip throws logic_error")
> >         {
> > -               REQUIRE_THROWS_AS(chip.name(), ::std::logic_error&);
> > +               REQUIRE_THROWS_AS(chip.name(), ::std::logic_error);
> >         }
> >  }
> >
> > @@ -139,7 +139,7 @@ TEST_CASE("GPIO chip can be opened with the open() =
method with implicit lookup",
> >
> >  TEST_CASE("Trying to open a nonexistent chip throws system_error", "[c=
hip]")
> >  {
> > -       REQUIRE_THROWS_AS(::gpiod::chip("nonexistent-chip"), ::std::sys=
tem_error&);
> > +       REQUIRE_THROWS_AS(::gpiod::chip("nonexistent-chip"), ::std::sys=
tem_error);
> >  }
> >
> >  TEST_CASE("Chip object can be reset", "[chip]")
> > @@ -244,12 +244,12 @@ TEST_CASE("Errors occurring when retrieving lines=
 are correctly reported", "[chi
> >
> >         SECTION("invalid offset (single line)")
> >         {
> > -               REQUIRE_THROWS_AS(chip.get_line(9), ::std::out_of_range=
&);
> > +               REQUIRE_THROWS_AS(chip.get_line(9), ::std::out_of_range=
);
> >         }
> >
> >         SECTION("invalid offset (multiple lines)")
> >         {
> > -               REQUIRE_THROWS_AS(chip.get_lines({ 1, 19, 4, 7 }), ::st=
d::out_of_range&);
> > +               REQUIRE_THROWS_AS(chip.get_lines({ 1, 19, 4, 7 }), ::st=
d::out_of_range);
> >         }
> >
> >         SECTION("line not found by name")
> > diff --git a/bindings/cxx/tests/tests-event.cpp b/bindings/cxx/tests/te=
sts-event.cpp
> > index b34347f..b41cf7e 100644
> > --- a/bindings/cxx/tests/tests-event.cpp
> > +++ b/bindings/cxx/tests/tests-event.cpp
> > @@ -149,7 +149,7 @@ TEST_CASE("It's possible to retrieve the event file=
 descriptor", "[event][line]"
> >
> >         SECTION("error if not requested")
> >         {
> > -               REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_er=
ror&);
> > +               REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_er=
ror);
> >         }
> >
> >         SECTION("error if requested for values")
> > @@ -157,7 +157,7 @@ TEST_CASE("It's possible to retrieve the event file=
 descriptor", "[event][line]"
> >                 config.request_type =3D ::gpiod::line_request::DIRECTIO=
N_INPUT;
> >
> >                 line.request(config);
> > -               REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_er=
ror&);
> > +               REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_er=
ror);
> >         }
> >  }
> >
> > diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tes=
ts-line.cpp
> > index e827e60..08ff1e8 100644
> > --- a/bindings/cxx/tests/tests-line.cpp
> > +++ b/bindings/cxx/tests/tests-line.cpp
> > @@ -122,7 +122,7 @@ TEST_CASE("Line bulk object works correctly", "[lin=
e][bulk]")
> >         {
> >                 auto lines =3D chip.get_all_lines();
> >
> > -               REQUIRE_THROWS_AS(lines.get(11), ::std::out_of_range&);
> > +               REQUIRE_THROWS_AS(lines.get(11), ::std::out_of_range);
> >         }
> >  }
> >
> > @@ -242,7 +242,7 @@ TEST_CASE("Exported line can be released", "[line]"=
)
> >         line.release();
> >
> >         REQUIRE_FALSE(line.is_requested());
> > -       REQUIRE_THROWS_AS(line.get_value(), ::std::system_error&);
> > +       REQUIRE_THROWS_AS(line.get_value(), ::std::system_error);
> >  }
> >
> >  TEST_CASE("Uninitialized GPIO line behaves correctly", "[line]")
> > @@ -256,7 +256,7 @@ TEST_CASE("Uninitialized GPIO line behaves correctl=
y", "[line]")
> >
> >         SECTION("using uninitialized line throws logic_error")
> >         {
> > -               REQUIRE_THROWS_AS(line.name(), ::std::logic_error&);
> > +               REQUIRE_THROWS_AS(line.name(), ::std::logic_error);
> >         }
> >  }
> >
> > @@ -271,7 +271,7 @@ TEST_CASE("Uninitialized GPIO line_bulk behaves cor=
rectly", "[line][bulk]")
> >
> >         SECTION("using uninitialized line_bulk throws logic_error")
> >         {
> > -               REQUIRE_THROWS_AS(bulk.get(0), ::std::logic_error&);
> > +               REQUIRE_THROWS_AS(bulk.get(0), ::std::logic_error);
> >         }
> >  }
> >
> > @@ -289,7 +289,7 @@ TEST_CASE("Cannot request the same line twice", "[l=
ine]")
> >                 auto line =3D chip.get_line(3);
> >
> >                 REQUIRE_NOTHROW(line.request(config));
> > -               REQUIRE_THROWS_AS(line.request(config), ::std::system_e=
rror&);
> > +               REQUIRE_THROWS_AS(line.request(config), ::std::system_e=
rror);
> >         }
> >
> >         SECTION("request the same line twice in line_bulk")
> > @@ -300,7 +300,7 @@ TEST_CASE("Cannot request the same line twice", "[l=
ine]")
> >                  */
> >                 auto lines =3D chip.get_lines({ 2, 3, 4, 4 });
> >
> > -               REQUIRE_THROWS_AS(lines.request(config), ::std::system_=
error&);
> > +               REQUIRE_THROWS_AS(lines.request(config), ::std::system_=
error);
> >         }
> >  }
> >
> > @@ -312,12 +312,12 @@ TEST_CASE("Cannot get/set values of unrequested l=
ines", "[line]")
> >
> >         SECTION("get value")
> >         {
> > -               REQUIRE_THROWS_AS(line.get_value(), ::std::system_error=
&);
> > +               REQUIRE_THROWS_AS(line.get_value(), ::std::system_error=
);
> >         }
> >
> >         SECTION("set value")
> >         {
> > -               REQUIRE_THROWS_AS(line.set_value(1), ::std::system_erro=
r&);
> > +               REQUIRE_THROWS_AS(line.set_value(1), ::std::system_erro=
r);
> >         }
> >  }
> >
> > --
> > 2.22.0
> >
