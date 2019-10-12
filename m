Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB91D4B85
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2019 02:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbfJLAxr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 20:53:47 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44879 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbfJLAxr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 20:53:47 -0400
Received: by mail-pf1-f194.google.com with SMTP id q21so7011629pfn.11
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 17:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=EqD73+LqGOb0r1OOdNvMDqMWybK1wYmhUTy2/i5ff4U=;
        b=g++KoXV2t98yTAnVw9A7UQekbBiTG+CQb35S6kJLTzEC6/IrXuxlZ+3lzZgSA7Nqwn
         sCVpImAd7y9zJsbG3mLyjbcw3MS4j+yXSXu+/5iF0eJZeD9vviqeKNObPgG16wydoKd6
         5GQhDWlGTSArSPMaooMLHek3maP9L42KN0V/4MEUo4w9Fq9ngx5z/WOwA1R+CcaFW1tz
         XQP0K8pEp6VnuMRV8IbC56D2dvWvE5m3nwDDL3DYpV4vpw7O4cYTbKKEPZq10n4fTPzC
         B4GOJ2cdptSoV/FU0xMiuPe+nEW8Ea7p8a+AiUX+6R7N/hHUDPF4ET5qMjHpgHGUNH5w
         mZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=EqD73+LqGOb0r1OOdNvMDqMWybK1wYmhUTy2/i5ff4U=;
        b=rGv7ZaWl2J7GBBp1ovh2yHnr+5q87QGLyZ5VJRarUFMe1Zm2go5/5XvnNbsa+khohr
         1lEuUUR0BkI+C6c6ZzRfTgJyTex0n9e8dIhMldEtXuaAZbISoukstcRNGcHUqiGSIP4R
         /yEe+/tsRiLmW2pnfo9xSfmteB/QoSxoaOgNkcHU4FzJcdE5y374F5z5I/Vtt+yfAkyi
         IR092hscQTjBk0/6MdwxH1gbnNVAXk1oi7rtDBZgNZQiMrCUOQtcuoTzy92gKYr1gWyn
         +g4V9rye0Z0bwYkryutGRh83r3m+0TGOcsOTax8eBb7U3uUqHcOzhb0p6bd4uJE6u3EA
         6v4Q==
X-Gm-Message-State: APjAAAVsU/QRdrhMm0Ml1f7mueJA7CNzEnRKnzx70XN9X/hNmH+0FhJU
        PCW8YeNVXKL4mWV2MCmlCxvV3FL3sppsFA==
X-Google-Smtp-Source: APXvYqxLhArU0l4tnv+DoxuRgsyr7MPUDcdIJYNGpTiwzIdo7Rta4g9I3G1SxGmNWQUwbBL/gVEVGQ==
X-Received: by 2002:a62:6842:: with SMTP id d63mr19203190pfc.16.1570841626641;
        Fri, 11 Oct 2019 17:53:46 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id o15sm9413260pjs.14.2019.10.11.17.53.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 17:53:46 -0700 (PDT)
Date:   Sat, 12 Oct 2019 08:53:40 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH 0/5] gpio: expose pull-up/pull-down line flags to
 userspace
Message-ID: <20191012005340.GA4059@sol>
References: <20191011154650.1749-1-warthog618@gmail.com>
 <CAMRc=Mfkop3poFn7vaotxZfCJn=L+6w9uzNVCXTfa4AuVEmm1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfkop3poFn7vaotxZfCJn=L+6w9uzNVCXTfa4AuVEmm1g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 11, 2019 at 07:51:43PM +0200, Bartosz Golaszewski wrote:
> pt., 11 paź 2019 o 17:47 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > This series adds gross control of pull-up/pull-down to the GPIO uAPI.
> > Gross control means enabling and disabling of bias functionality,
> > not finer grained control such as setting biasing impedances.
> >
> > The support allows both input and output lines to have any one of the
> > following biases applied as part of the line handle or event request:
> >  0. As Is - bias is left alone.  This is the default for ABI compatibility.
> >  1. Pull Up - pull-up bias is enabled.
> >  2. Pull Down - pull-down bias is enabled.
> >  3. Pull None - bias is explicitly disabled.
> >
> > The biases are encoded in two flags, PULL_UP and PULL_DOWN, where
> > setting both is interpreted as Pull None. So the flags effectively form
> > a two bit field encoding the values above.
> >
> > The setting of biases on output lines may seem odd, but is to allow for
> > utilisation of internal pull-up/pull-down on open drain and open source
> > outputs, where supported in hardware.
> >
> > Patches are against:
> >   github.com/brgl/linux/commit/82fc38f6ab599ee03f7a8ed078de8abb41e6e611
> > which contains the initial patch from Drew Fustini, with Bartosz Golaszewski,
> > that adds support for pull-up/down flags in line handle requests.
> >
> > Patch 1 adds support to line event requests.
> > Patch 2 adds pull-up/down support to the gpio-mockup for uAPI testing.
> > Patch 3 rejects biasing changes to lines requested as-is.
> > Patch 4 adds support for disabling bias (pull none).
> > Patch 5 adds support for setting bias on output lines.
> >
> > Kent Gibson (5):
> >   gpiolib: add support for pull up/down to lineevent_create
> >   gpio: mockup: add set_config to support pull up/down
> >   gpiolib: pull requires explicit input mode
> >   gpiolib: disable bias on inputs when pull up/down are both set
> >   gpiolib: allow pull up/down on outputs
> >
> >  drivers/gpio/gpio-mockup.c | 94 ++++++++++++++++++++++++--------------
> >  drivers/gpio/gpiolib.c     | 55 ++++++++++++++++------
> >  2 files changed, 100 insertions(+), 49 deletions(-)
> >
> > --
> > 2.23.0
> >
> 
> Hi Kent,
> 
> thanks for doing that, but please make it easier to review. The cover
> letter shouldn't be sent in response to this thread but be part of the
> patch series.

Not sure what you mean - this is a new thread.
Should the updated series be a reply to this email (yours), or a new
v2 thread?

> Please don't rebase the patches on top of my
> development/experimental branch - every patch needs to spend some time
> on the mailing list. Rebase the series on top of the latest mainline
> release candidate. Pull in Drew's changes and just squash my code into
> your patches - it was not finished anyway. You can send patches from
> other developers or make them part of your series - there's no problem
> with that as long as you keep the authorship.
> 
> That'll make it much easier to review and understand.
>
Fair enough.  I was unsure about including others' patches in the
series, so kept it minimal. Will update the series as soon as I get the
chance (and know where to send it).

Cheers,
Kent.
