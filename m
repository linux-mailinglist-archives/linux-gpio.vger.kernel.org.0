Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 725A41007B7
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 15:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfKROzs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 09:55:48 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33470 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbfKROzs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 09:55:48 -0500
Received: by mail-ot1-f67.google.com with SMTP id u13so14745762ote.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 06:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+ttkyeTPisvg1SzMtMuBsArteCZfBEg45hO+x+5crzI=;
        b=YTEWRnYMG3D1t7LbRlVp72c0wQInY4LZBUOWgIbomwVIY6Dys+N4L7fXU3nEczekqj
         GM0rnjEF8RdsTsmGrMsRWfb28kgEstUknCrY43dRhR+6yewcqMCvwChCjVgqEqYadslF
         5K7zWabWOfSHRot5z70pTiHWvINHDiczexrURIL2lpDGPNvTI9DO1iLJo8UyV3raAMdX
         doGePjyj7l7jeqS2I2tCddHepW8C1Yc9/nfq9PUXYIOXF74p2TLal08ARS12zKT3lTST
         BF8+6ZD/7D1KwEs70DSci4x+AhGdQLs9FD7IKbQsGIrTWo0EIF2PZWIlw9rZ2YOghtlA
         bDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+ttkyeTPisvg1SzMtMuBsArteCZfBEg45hO+x+5crzI=;
        b=I0ltL8+6fCvZIOxhPRKDGk1HEhvFrGe38w6TWqM1ECN4d+IyPzmgXFZUoJHT3stXFo
         q1B7CAiyEX9vUy8JyQzdSQmBPnDjzXjczBQR7QB8c9EfmxYHCGc46UID73sX0HHjRBdG
         3U9PnpGbNvALN4x4uKbVHyjbjiaMmAk4j2U5kupSMXadE0+gSDyHBFqe1+ZLOIzSiI8Q
         bUWRrqlrf2funWi7bWf8NhlI6aHDH5ze4JSisTy2CskzYu4xYDCuXv9Bm4s8sJ9ucH6g
         CEsSGmhOrjmKnf9wxiP2NnI/3kvmU1Fqs/+8BhlfXZ1RNDIzcioSY3l55v1mPKR2XycC
         +84A==
X-Gm-Message-State: APjAAAUJMsnyb8YrwqnwDL0E1hMSe/3wVWt+LW/e3cI0CeOfZ57f8KVX
        p15mqnCCV0Qkxvhko4+C0cGapg4+QcDAtkSiL+2aVIuu
X-Google-Smtp-Source: APXvYqwoQDAaDRQn+WEcATvUstQqRxqtq4sGRy8DF+N4T5NXu11nbvBF4w7wjkVDAs2Zn/Bx3mrjsyLcbws2Ro4Jad4=
X-Received: by 2002:a05:6830:453:: with SMTP id d19mr11601852otc.256.1574088947218;
 Mon, 18 Nov 2019 06:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20191115144355.975-1-warthog618@gmail.com> <CAMpxmJXVhUGGdD9jmUXqzQ7KW+6K9WYfHHRs7VhpJkxbCQNRSQ@mail.gmail.com>
 <20191118140941.GA27359@sol>
In-Reply-To: <20191118140941.GA27359@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 18 Nov 2019 15:55:36 +0100
Message-ID: <CAMpxmJVq0xpYGgtAjisMQKKn=mop_gvPkVm6cPVS6of21cNASQ@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 00/19] Add support for bias flags and SET_CONFIG
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 18 lis 2019 o 15:09 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Mon, Nov 18, 2019 at 02:50:57PM +0100, Bartosz Golaszewski wrote:
> > pt., 15 lis 2019 o 15:44 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > This patch series adds support for changes to the GPIO uAPI that are =
on
> > > track to be included in the v5.5 kernel.  There are two components to=
 the
> > > uAPI changes - the addition of bias flags and a new SET_CONFIG ioctl.=
  This
> > > series adds support to the libgpiod API, and to both C++ and Python
> > > bindings, for both of those components.
> > >
> > > The libgpiod tools are also updated, where appropriate, to support th=
e bias
> > > flags.
> > >
> > > There are a few additional patches that serve to restructure the code=
 to
> > > simplify subsequent patches, or to fix minor problems discovered duri=
ng
> > > development. These patches are generally adjacent to the main patch m=
ost
> > > relevant to that patch.
> > >
> > > The series is based on the current libgpiod master@9ed02fc.
> > >
> > > Kent Gibson (19):
> > >   core: move request flag to handle flag conversion into a separate
> > >     function
> > >   API: add support for bias flags
> > >   core: fix misspelling of parameter
> > >   tests: add tests for bias flags
> > >   bindings: cxx: drop noexcept from direction and active_state
> > >   bindings: cxx: initialise bitset with integer instead of string
> > >   bindings: cxx: add support for bias flags
> > >   bindings: cxx: tests: add tests for bias flags
> > >   bindings: python: add support for bias flags
> > >   bindings: python: tests: add tests for bias flags
> > >   API: add support for SET_CONFIG
> > >   tests: add tests for SET_CONFIG
> > >   core: allow gpiod_line_set_value_bulk to accept null values
> > >   bindings: cxx: add support for SET_CONFIG
> > >   bindings: cxx: tests: add tests for SET_CONFIG methods
> > >   bindings: python: add support for SET_CONFIG
> > >   bindings: python: tests: add tests for SET_CONFIG methods
> > >   tools: add support for bias flags
> > >   treewide: change "correspond with" to "correspond to"
> > >
> > >  bindings/cxx/gpiod.hpp                 |  85 +++-
> > >  bindings/cxx/line.cpp                  |  60 ++-
> > >  bindings/cxx/line_bulk.cpp             |  95 ++++-
> > >  bindings/cxx/tests/tests-line.cpp      | 215 ++++++++++
> > >  bindings/python/gpiodmodule.c          | 469 +++++++++++++++++++++-
> > >  bindings/python/tests/gpiod_py_test.py | 254 ++++++++++++
> > >  include/gpiod.h                        | 303 +++++++++++++-
> > >  lib/core.c                             | 250 ++++++++++--
> > >  lib/ctxless.c                          | 115 +++++-
> > >  tests/mockup/gpio-mockup.c             |   2 +-
> > >  tests/tests-ctxless.c                  |  64 ++-
> > >  tests/tests-event.c                    | 120 ++++++
> > >  tests/tests-line.c                     | 522 +++++++++++++++++++++++=
+-
> > >  tools/gpioget.c                        |  24 +-
> > >  tools/gpiomon.c                        |  28 +-
> > >  tools/gpioset.c                        |  26 +-
> > >  16 files changed, 2561 insertions(+), 71 deletions(-)
> > >
> > > --
> > > 2.24.0
> > >
> >
> > Hi Kent,
> >
> > the series looks quite good. I addressed some obvious things. I'll
> > review v2 more in detail, but honestly, I don't think there'll be a
> > lot of issues.
> >
> > Would you mind if I applied patches 1, 3, 5, 6, 13 & 19 right away?
> > They fix existing problems, so there's no need to carry them over to
> > subsequent iterations of the series.
> >
>
> I don't have a problem with that.
>

Done. You should be able to rebase on top of my master branch. Let's
hope there are no conflicts - I had to fix up a couple details.

Bart

> Cheers,
> Kent.
