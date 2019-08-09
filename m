Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACFF08727F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 08:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405510AbfHIG4C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 02:56:02 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39944 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbfHIG4C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 02:56:02 -0400
Received: by mail-ot1-f65.google.com with SMTP id l15so71602571oth.7
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 23:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q0yAdZCnl4yza0Qm5wDEWHe1HAJgCJfnoeF+H3gnS7o=;
        b=YvOZcNtZ6DNLAqvbpe7Td7fHrY6w3YhE1VwZ6BAmcKSXav7nqZ6XvPpLdgGszCp3ht
         mUMPz4VQdU9W5maFq4VcSWQgp1R3Tn/uWAQCnKDnIHU3672foN5oF5rLxixErlAv4XAs
         TwOS3c/9TMf15SJH3/Udn4YAbGyWHSG/GKWKUTH4qAeLdyyJvS3z/Ns4cUN9kM4XbxX9
         VbywtFBlK8lkCrGPMpeLFGRIDRRFANKozr1p0tFnlEgXh8hQ2Ft1wLIiSboCGX0TgwEn
         ZJrVU/wwqH1RdUJaCIBMMEPTa6snvyI813qTk+ikrccce5oF+M6XUaOUUVfesK7kxKAe
         OQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q0yAdZCnl4yza0Qm5wDEWHe1HAJgCJfnoeF+H3gnS7o=;
        b=q+SsHu10jnC4kHaNR90qJm995Ws0rwwk75/OAtgm8Ht/H4oyFB606QJZhqMiOJpevo
         WE6Uh98ZNT41PjNQgOvQVuwEqYarfk5WnIoRXkMtPBsl+Iy7MbVZjovSOk9s1s+oZpvC
         B5tF+4eiY9hJyaRAV11WD6PrPhJW7FPKbFTRRTD/u0XJsquaG3RlhiSBWLEgo1pUcsGw
         HucfPTrAFEsC6iQRJvsHIB7J2Leqr8s3OFCnPXPZU5gneCBe4E/HBKElByDc1kA2ignG
         gNd3Ur8tCOzdVdaCm5D3KHZiFJPHRr8LF9XxmMr4M+Uu2jtVk8jxrAVG6EOwyR1mv5cQ
         2A1A==
X-Gm-Message-State: APjAAAX2xcNbHliX35n3rHng0esFkAJ5pFQCHLAqTwJlzsFMek+7uIW4
        ZPSl7lWRNqnek5wr8ql/2ijCQnpc9gx4PEIVNpYaXg==
X-Google-Smtp-Source: APXvYqzg6R0mP9nyk4rls8eZDL/4RazH+/9Yf0PB4wEcK3N79LItWdhdt214RudLBxZAg4RaGKdXtDZYE9mEHA5rl40=
X-Received: by 2002:a02:37d6:: with SMTP id r205mr20528844jar.57.1565333760970;
 Thu, 08 Aug 2019 23:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190807195132.7538-1-alexander.stein@mailbox.org>
 <20190807195132.7538-5-alexander.stein@mailbox.org> <CAMRc=McmKs=5ToTRLgQ_f30DRtqq-57OZRw-EnL1gm_M1kqUXQ@mail.gmail.com>
 <6061947.U0Wa8ctkoo@kongar>
In-Reply-To: <6061947.U0Wa8ctkoo@kongar>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 9 Aug 2019 08:55:50 +0200
Message-ID: <CAMRc=MfBi77fYNgXFWFJ-wPSP_Eb6CoCf+vJA_ccZgie-_W42Q@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 5/5] bindings: cxx: Workaround --success run
To:     Alexander Stein <alexander.stein@mailbox.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 8 sie 2019 o 20:41 Alexander Stein <alexander.stein@mailbox.org>
napisa=C5=82(a):
>
>  On Thursday, August 8, 2019, 5:27:14 PM CEST Bartosz Golaszewski wrote:
> > =C5=9Br., 7 sie 2019 o 21:51 Alexander Stein <alexander.stein@mailbox.o=
rg>
> > napisa=C5=82(a):
> > >
> > > If run with --success, all expressions are evaluated and printed out.
> > > But REQUIRE_FALSE(chip) tries to iterate over the chip resulting in t=
his
> > > backtrace:
> > > #0  gpiod_chip_num_lines (chip=3Dchip@entry=3D0x0) at ../../lib/core.=
c:235
> > > #1  gpiod_line_iter_new (chip=3D0x0) at ../../lib/iter.c:140
> > > #2  gpiod::(anonymous namespace)::make_line_iter (chip=3D0x0) at ../.=
./../bindings/cxx/iter.cpp:29
> > > #3  gpiod::line_iter::line_iter (this=3D0x7fffffffd690, owner=3D...) =
at ../../../bindings/cxx/iter.cpp:109
> > > #4  Catch::rangeToString<gpiod::chip> (range=3D...) at /usr/include/c=
atch2/catch.hpp:1959
> > > [...]
> > >
> > > Workaround by forcing catch2 to call gpiod::chip::operator bool().
> > >
> > > Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> > > ---
> > > This actually looks like a flaw in the binding itself that the
> > > gpiod::line_iter can't cope with an empty gpiod::chip.
> > >
> >
> > Do you want to submit a patch that fixes that? Otherwise I can fix it.
> > I think that simply throwing an exception on empty chip is enough,
> > right?
>
> Reading that backtrace today, the actual problem is gpiod_chip_num_lines =
deferencing the nullptr.
> There are 2 possibilities:
> * if gpiod_chip is NULL in gpiod_line_iter_new(), return NULLL iter as we=
ll (which will raise an exception on line iter.cpp:31)
> * return an iter with num_lines =3D 0
>
> Can't rate the 2nd one if this will raise other problems.
>
> Best regards,
> Alexander
>
>
>

Hardening of argument validation in the core library (checking of
NULL-pointers, etc.) has been on my TODO list for some time now. It
seems I'll finally have to do it.

Thanks for the patches, all applied!

Bartosz
