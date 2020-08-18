Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F05248AFE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 18:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgHRQEM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 12:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgHRQEK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2020 12:04:10 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874A9C061389
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2020 09:04:10 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c19so15662117wmd.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2020 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H/SSNx3icWpJT89mMCtGFwsHM1i1Vg0MVuHbPEywY3M=;
        b=zPeYXXyKCw++knsh29bi95JvQHvxq/Rox6ERMqendYXGeHdIZ5aDWfxg7SwtRAGEEw
         CfThxa72nHp9N3WC7hqA/MPbkEkXO4FF9nF0rS9hdWDcwStZX+MgAiE8Sg7VxnDEPZRM
         bIPHiy1DoTKPh75BuW6Gj7qWsaZiYIO5bJtFgdBqk6Bgx39MxI1dpeVdEHOjC8lRvpyQ
         v4rcGvJXNgs6gRqsaDDgSoQxvysc1gRoNsdgirK3EU3L5opF00Cbro4ha/voSHFsQLn8
         fuHtwoI+CfRJP8LjdTGqSvIt8mH0ehJyELkXAKT52FgOuIY15zNc1JZ3Bkb9NOderhoR
         g43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H/SSNx3icWpJT89mMCtGFwsHM1i1Vg0MVuHbPEywY3M=;
        b=fgAwSXgCtM91uvjJJBSYbuWknQaERIUeoMyMi+lt3n/NXHL7dwcohdvkbRzgOCfGuJ
         YloyhD1QIO8NCoWLsUq2k7TiyZKUBEex0xM0VQ43agJq3PH1DzAUAnjfnz7U/mok0LQi
         utSHIcyCDTl0BeSaoDXV1WRMwNu6EFtfmIpUs/fgNG1J4Wole8j+k1NObHP35lhnOR5g
         zmi4RKercjMSUyEeqpwX7GqfxRQs7bxAS52K4e3MHbJXaMNPh66KQmk26XmUrAA8Fn2d
         yRwfm0xKVVPW0//4CTEN9KEBwiNuAl7v277gBt/mcxF6EQozcg/LyXUELdN6KCh02vN8
         OJNg==
X-Gm-Message-State: AOAM531CCGNnqxh8DmWDYD2bNEo05sxu78iII6Any6CQH6FSicpDbsDk
        vQh9qMlyDI/QDqpe29bOi135SejnUspsQw==
X-Google-Smtp-Source: ABdhPJxvnK12/Mqopog1yKUBBOmF+NX5ZilIOG9/JnsFD6CRIyTJLfRSLWe0nSXY/t/ZiCeQKupBYA==
X-Received: by 2002:a1c:2dcc:: with SMTP id t195mr549150wmt.166.1597766648310;
        Tue, 18 Aug 2020 09:04:08 -0700 (PDT)
Received: from p1g2 (2a01cb000f8e270038fe4c27b4fe9348.ipv6.abo.wanadoo.fr. [2a01:cb00:f8e:2700:38fe:4c27:b4fe:9348])
        by smtp.gmail.com with ESMTPSA id t13sm34248771wru.65.2020.08.18.09.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 09:04:07 -0700 (PDT)
Date:   Tue, 18 Aug 2020 18:04:06 +0200
From:   Gary Bisson <gary.bisson@boundarydevices.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 2/3] tools-common: fix build for Android
Message-ID: <20200818160406.GA500735@p1g2>
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
 <20200608090652.805516-3-gary.bisson@boundarydevices.com>
 <CAMRc=MdLXhcauwSeFKxeBbJUUTVTHCw3Pwkkxx3Emmao7MnXjw@mail.gmail.com>
 <20200817082303.GA91176@p1g2>
 <CAMRc=Md81RAdG9Ekh5u+=VtS6uNxP3NCOi_e+DwzXYLbGO+8=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md81RAdG9Ekh5u+=VtS6uNxP3NCOi_e+DwzXYLbGO+8=w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Aug 17, 2020 at 03:04:57PM +0200, Bartosz Golaszewski wrote:
> On Mon, Aug 17, 2020 at 10:23 AM Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
> >
> > Hi,
> >
> > Sorry for the delay.
> >
> > On Mon, Aug 10, 2020 at 09:15:18PM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Jun 8, 2020 at 11:07 AM Gary Bisson
> > > <gary.bisson@boundarydevices.com> wrote:
> > > >
> > > > program_invocation_name doesn't exist in Android, getprogname() should
> > > > be used instead.
> > > >
> > > > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > > > ---
> > > > Hi,
> > > >
> > > > I couldn't an equivalent to program_invocation_short_name, so the
> > > > program is now using program_invocation_name all the time, hope it's ok.
> > > >
> > > > Regards,
> > > > Gary
> > > > ---
> > > >  tools/tools-common.c | 10 +++++++---
> > > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/tools/tools-common.c b/tools/tools-common.c
> > > > index 12bde20..1d7fc2c 100644
> > > > --- a/tools/tools-common.c
> > > > +++ b/tools/tools-common.c
> > > > @@ -21,7 +21,11 @@
> > > >
> > > >  const char *get_progname(void)
> > > >  {
> > > > +#if defined __ANDROID__
> > >
> > > I'd prefer to keep libgpiod Android-agnostic. Does prctl() exist in
> > > Android? It too can be used for that.
> >
> > Yes I understand. prctl() can be used in Android so it would definitely
> > be a better option.
> >
> > Regards,
> > Gary
> 
> The name returned by prctl(PR_GET_NAME, ...) is equivalent to
> program_invocation_short_name. That would mean ditching the full
> executable path everywhere in messages. Alternatively we can just set
> the full program name at the start of every tool. I'm fine with the
> latter too as long as we don't stick these __ANDROID__ ifdefs in the
> tree.

Ok, I'll test this and send a v2. Might not be before next week though.

Regards,
Gary
