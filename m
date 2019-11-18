Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85672100711
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 15:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfKROJr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 09:09:47 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46337 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfKROJr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 09:09:47 -0500
Received: by mail-pf1-f195.google.com with SMTP id 193so10429875pfc.13
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 06:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bvmZN7XRPZ975N8/6O0S9JwjZ2/fHSsUiyJsUrkvQ9c=;
        b=UjRcuf3E2zDRAFm8IFM2W5Igp+/b3VAdHWygvyFcZh21hYYY+qrik5G1K+5VcjKTT/
         SOpJ0KKS//+0YyV6L95vVZ0T3eGN/AEKqnZNvfikryd4XDZkHcpRKIYz35ASTbnEx4jZ
         mCH4kqTao4DCp1zN4i17260aDJkBLI+hU9HAjVwCDu4E0h7T1aONthu9eDSYp4L9p/LX
         XtUYYHLp7QCdKBQmJEe2rGZDS3Rt3pwEVhw4u2I6UsG9Cs+jufckLz0XV+xYwS3xDisD
         CQtSWk3q1Kwgf/nYJ+4I+qRpnTVmtzQvIJzetfcvG7RGSrwstqyN2KF3SGzZ5dOOaY/y
         MVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=bvmZN7XRPZ975N8/6O0S9JwjZ2/fHSsUiyJsUrkvQ9c=;
        b=bBeMY56qW693wD11/4EnobBRuUhoMTDOrFYTEsj9F9Y/VGhTUIBVTZS3zyztJhOiz9
         cXSQ5Nr/qK1/NZjZ6CWaswNudtM49ezOLJO5b3RsLD19X1CJb/kFtB6VcFMXBqz2KVIF
         P5KyCKsKIY1hWhPmPT6JEuxE3FW434t7bapTO4n3akE0JQedhdUwX4ejqHoYR9p5ijMB
         wVgIVXWiiPh3Gdg87PfUQCncO6VAdF6/7wsUIfkHCiLygpYbQjwMWmbYeYczv60rtFyS
         sQMn/uWTaEVYD6EEHR5rpFOVgvQgZiLwHu1d6mZ6GC/GuX+cLFgE/c0Iiyk/vfWYbuNh
         u1EQ==
X-Gm-Message-State: APjAAAXG78OgXHEzjB2g4PriTJ2gqNLLQU8H15lrKJLRR8fcISAmyZ3y
        vtKCs2rKHqMIuyGbwRddZEg=
X-Google-Smtp-Source: APXvYqxXI+jMivZSaZB53sF1xzZUri6P1AmJFhOg1vahva0ZAiph60SLzqa6E5ainJo9oEGHw6pZQA==
X-Received: by 2002:a63:6c4:: with SMTP id 187mr33919116pgg.421.1574086186616;
        Mon, 18 Nov 2019 06:09:46 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id u7sm18544111pjx.19.2019.11.18.06.09.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:09:46 -0800 (PST)
Date:   Mon, 18 Nov 2019 22:09:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 00/19] Add support for bias flags and
 SET_CONFIG
Message-ID: <20191118140941.GA27359@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <CAMpxmJXVhUGGdD9jmUXqzQ7KW+6K9WYfHHRs7VhpJkxbCQNRSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXVhUGGdD9jmUXqzQ7KW+6K9WYfHHRs7VhpJkxbCQNRSQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 02:50:57PM +0100, Bartosz Golaszewski wrote:
> pt., 15 lis 2019 o 15:44 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > This patch series adds support for changes to the GPIO uAPI that are on
> > track to be included in the v5.5 kernel.  There are two components to the
> > uAPI changes - the addition of bias flags and a new SET_CONFIG ioctl.  This
> > series adds support to the libgpiod API, and to both C++ and Python
> > bindings, for both of those components.
> >
> > The libgpiod tools are also updated, where appropriate, to support the bias
> > flags.
> >
> > There are a few additional patches that serve to restructure the code to
> > simplify subsequent patches, or to fix minor problems discovered during
> > development. These patches are generally adjacent to the main patch most
> > relevant to that patch.
> >
> > The series is based on the current libgpiod master@9ed02fc.
> >
> > Kent Gibson (19):
> >   core: move request flag to handle flag conversion into a separate
> >     function
> >   API: add support for bias flags
> >   core: fix misspelling of parameter
> >   tests: add tests for bias flags
> >   bindings: cxx: drop noexcept from direction and active_state
> >   bindings: cxx: initialise bitset with integer instead of string
> >   bindings: cxx: add support for bias flags
> >   bindings: cxx: tests: add tests for bias flags
> >   bindings: python: add support for bias flags
> >   bindings: python: tests: add tests for bias flags
> >   API: add support for SET_CONFIG
> >   tests: add tests for SET_CONFIG
> >   core: allow gpiod_line_set_value_bulk to accept null values
> >   bindings: cxx: add support for SET_CONFIG
> >   bindings: cxx: tests: add tests for SET_CONFIG methods
> >   bindings: python: add support for SET_CONFIG
> >   bindings: python: tests: add tests for SET_CONFIG methods
> >   tools: add support for bias flags
> >   treewide: change "correspond with" to "correspond to"
> >
> >  bindings/cxx/gpiod.hpp                 |  85 +++-
> >  bindings/cxx/line.cpp                  |  60 ++-
> >  bindings/cxx/line_bulk.cpp             |  95 ++++-
> >  bindings/cxx/tests/tests-line.cpp      | 215 ++++++++++
> >  bindings/python/gpiodmodule.c          | 469 +++++++++++++++++++++-
> >  bindings/python/tests/gpiod_py_test.py | 254 ++++++++++++
> >  include/gpiod.h                        | 303 +++++++++++++-
> >  lib/core.c                             | 250 ++++++++++--
> >  lib/ctxless.c                          | 115 +++++-
> >  tests/mockup/gpio-mockup.c             |   2 +-
> >  tests/tests-ctxless.c                  |  64 ++-
> >  tests/tests-event.c                    | 120 ++++++
> >  tests/tests-line.c                     | 522 ++++++++++++++++++++++++-
> >  tools/gpioget.c                        |  24 +-
> >  tools/gpiomon.c                        |  28 +-
> >  tools/gpioset.c                        |  26 +-
> >  16 files changed, 2561 insertions(+), 71 deletions(-)
> >
> > --
> > 2.24.0
> >
> 
> Hi Kent,
> 
> the series looks quite good. I addressed some obvious things. I'll
> review v2 more in detail, but honestly, I don't think there'll be a
> lot of issues.
> 
> Would you mind if I applied patches 1, 3, 5, 6, 13 & 19 right away?
> They fix existing problems, so there's no need to carry them over to
> subsequent iterations of the series.
> 

I don't have a problem with that.

Cheers,
Kent.
