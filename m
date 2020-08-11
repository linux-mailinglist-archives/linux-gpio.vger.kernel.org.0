Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6F7242005
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Aug 2020 20:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgHKS7b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Aug 2020 14:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgHKS7a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Aug 2020 14:59:30 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8315EC06174A
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 11:59:30 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id g14so14020277iom.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 11:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nVEqlmy7LShlGVmg8Q+a9X44M3gP85kcMWQJtzyUnxk=;
        b=BHdnXc12mk7ZkF435+wvqcLW9bKAWPLOrJYLeFsN0g/2lMVFMIe8rAI5L/pszP+htr
         dvVLcZ5obZyUTCHc4QE+UzNBPrQBJPgCaTvIG1CokxIa0+d0ojyGlTj8OWGxd+ZoCpf6
         0ZFhFolG7HjMGQwoLVHDHiGSy6huA9zgEQsOMBaH8JynEEHY+Fh25PFRoEIB8LuBk8gD
         qY+YYrneL7DAyI3rKQmdgEPLAGB8KmDaZqFmZQuwpgYPwEBT808MTccoS/3Snl8cYBZh
         PaAcYPOsUAIMQn/vqWx5cnCZCyIjZ9xcEztf1fePpxVOtWd0qdIUf/MIdw7q4RapFG3Q
         AlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nVEqlmy7LShlGVmg8Q+a9X44M3gP85kcMWQJtzyUnxk=;
        b=KIJb5FSsvvLNmAbjaaaVNbDfm2PNvxh8fyVjr5a8vMpdt5HVjxYVDEQHCsgoXZtEbA
         8RpCrMXOo9uRTsJ7TA261njjQn9ptxn1tHAKURVAEILw3oIOJsneIMhpMJc0t7/fdP6Z
         xSoivPz8gOqninm0sWr4FarVviMbEorIQiPcmQLa4UQonhQiMX7UnRD/F3U+95YKFXo7
         reUTWyiQNSZ91rkXwr5LhTZma/p4edSzroKOcIolaXgAi8/z9drXsR8aBwFSfUMsHWpW
         iLREfRnpxTvU9tELIQh3OYhJeH/D8pv9GYXNHzbzaVdlAoZuAQLlSWPb1Yfa9gq8Vbgf
         hGKA==
X-Gm-Message-State: AOAM531z7LI4UWDiNn8OOEo+3wFKB7DsHFuUHToLOBv2d8zCzsHMu1Vk
        2A7uzqsJCYESOtWYwR9B2vyblFug6pzUwWWZ8eA2dQ==
X-Google-Smtp-Source: ABdhPJzwmWQ/qRWtJwDUDjds3O9A18U5+Y2CBXdrthmxrF+DlZJH4a/4d1K2cuVnBKQyIalNQAYwVoDBjrqlqzCZoFU=
X-Received: by 2002:a5d:89cd:: with SMTP id a13mr23852508iot.119.1597172369867;
 Tue, 11 Aug 2020 11:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200808095944.188479-1-alexander.stein@mailbox.org>
 <CAMRc=MeVKBHgU6u5gVjzaysQuwrudo3Zun+AHDb74pGXzkB4dg@mail.gmail.com>
 <20200811013950.GA25507@sol> <2066152.rvAzjVaaYW@kongar>
In-Reply-To: <2066152.rvAzjVaaYW@kongar>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 11 Aug 2020 20:59:19 +0200
Message-ID: <CAMRc=Mdm+840-fiTQ8TYtBOkPTzh=wpACAFyFPu_rG95-=GQKQ@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 0/5] Documentation improvements
To:     Alexander Stein <alexander.stein@mailbox.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 11, 2020 at 8:24 PM Alexander Stein
<alexander.stein@mailbox.org> wrote:
>
> Am Dienstag, 11. August 2020, 03:39:50 CEST schrieb Kent Gibson:
> > On Mon, Aug 10, 2020 at 06:49:21PM +0200, Bartosz Golaszewski wrote:
> > > On Sat, Aug 8, 2020 at 12:06 PM Alexander Stein
> > > <alexander.stein@mailbox.org> wrote:
> > > >
> > > > Hey,
> > > > this changeset improves the document generation by reducing warnings
> > > > as well as supporting building doc out of tree now.
> > > >
> > > > Alexander Stein (5):
> > > >   doc: Fix doxygen warnings
> > > >   doc: Use autotoolized Doxyfile
> > > >   doc: Fix doxygen warning
> > > >   doc: Remove obsolete PERL_PATH
> > > >   doc: Add @file to headers
> > > >
> > > >  .gitignore              |  1 +
> > > >  Doxyfile => Doxyfile.in |  8 ++++----
> > > >  Makefile.am             |  4 +---
> > > >  bindings/cxx/gpiod.hpp  |  6 +++++-
> > > >  configure.ac            |  1 +
> > > >  include/gpiod.h         | 30 +++++++++++++++++-------------
> > > >  6 files changed, 29 insertions(+), 21 deletions(-)
> > > >  rename Doxyfile => Doxyfile.in (93%)
> > > >
> > > > --
> > > > 2.28.0
> > > >
> > >
> > > Thanks for sending those! I guess I don't see any of the warnings you
> > > mention because doxygen on my laptop is too old (1.8.13)?
> > >
> >
> > For reference, I get some of the warnings addressed with doxygen 1.8.17
> > in my setup.
> > I don't get the a4wide (patch 3) so that might be new in 1.8.18, or
> > otherwise dependent on setup??
> >
> > Either way, it would be useful for the patch to mention what version
> > of doxygen is being targetted so everyone is on the same page.
>
> Yes, I'm on 1.8.18, current release for archlinux. You are right, I should
> have mentioned it in the patch though, sorry aobut that.
>

No worries, I'll add this to the commit message when applying.

Bartosz
