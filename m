Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6149F104CD4
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 08:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfKUHq1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 02:46:27 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42620 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfKUHq1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 02:46:27 -0500
Received: by mail-pl1-f193.google.com with SMTP id j12so1177402plt.9
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 23:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=v6/XEfMvJz2+57Ver1QqCf40bLCCbRj2C9rdZogouyg=;
        b=HQkub81qO2aI8DsaqTa/wUcS4vd8xb5q26M0BftVXH4C0ZVpDYXkDxEJvFrmx0E1Sh
         LxRT22LLpJVTVxi1etmzBsID4O4Bmfi7rTs1SsfjO9TnXufib+w9ujkU18Q2oOu/w2Ls
         6g6HuVAlragRVgO9oWo0Arn9O2UjiV4a9yoSsmOGVQvZoy6Wnys/0UN+szkOntRrTGub
         F5JArnH9Q/JChOwMVYuACrUG96aTQWv1lI1uPJKG81s7wpdhHYHWHyFqT3ItmlSIkQfQ
         HoGutB3AK6XJsFQOaJoCMjX34fgUBoCGKSrHwjojV6wZfziA5MHC3EUgAt4qo9pIi3dt
         UZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=v6/XEfMvJz2+57Ver1QqCf40bLCCbRj2C9rdZogouyg=;
        b=VGgwWCzyvxJAoVGsfbGjf0V6spANZyumeVaiuK5jf6YcDFwpWkEVn5L85aPYg4IV3M
         53KJfwEtn2eHDNkBMFhV/U4gaB7Elv43ywd2BNwTMZFw3j2n4B9RTJ5ayZIUM3a3+yXr
         6z2rnJQESwtHOCjaoOeeuPlbPKRwj7L1vRm/RhkbfL3x9ddBjg03cHdzxs9Rxmd6ThUW
         VkIpo0pTbycMvzQEJIONQaY1CklrpsNIYVAkXpnkijiG4SBkj+gjyjZi+wzY9vWpdFMT
         +PQEPlybf3JIO2GyU9mb242juPgi8esGe1x8+0Rm1/zFF4gkyIqkR+ZAhAMTz3gAuvAy
         JlTQ==
X-Gm-Message-State: APjAAAUcrviWqleVIlvqiLuU/QGea26jQ/d29m57I9cJYmIDv8WIr2U1
        qmRZoxzYTohFudZZt47UFXWE4AR6k4U=
X-Google-Smtp-Source: APXvYqzyQQNu15x5tiDWBHhMFmXvpZ5aBMnctYtHAejGxBtE5WT7HL0GYq6Y7f78CvtaYWDgmzbO6A==
X-Received: by 2002:a17:90a:634a:: with SMTP id v10mr9684500pjs.4.1574322386165;
        Wed, 20 Nov 2019 23:46:26 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id w7sm2041793pfb.101.2019.11.20.23.46.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 23:46:25 -0800 (PST)
Date:   Thu, 21 Nov 2019 15:46:21 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
Message-ID: <20191121074621.GA17026@sol>
References: <20191119155249.GA20834@sol>
 <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
 <20191120135857.GA4218@sol>
 <CAMRc=McNdcaLJKG3TRvX08Ddwmi-V9AJUDG5zmBgqL8bwjCSYg@mail.gmail.com>
 <20191120141353.GA5154@sol>
 <CAMRc=MdWj_+kd2wGUoRVRSd+kq597h-jetiHMwRiOvuUi8qRQQ@mail.gmail.com>
 <20191120143644.GA5865@sol>
 <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
 <20191121003443.GA7695@sol>
 <CAMRc=MebbS86gvXytYrCBOyNVr74fTiVXG+NP0sx0F6SkAL_+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MebbS86gvXytYrCBOyNVr74fTiVXG+NP0sx0F6SkAL_+A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 21, 2019 at 08:13:42AM +0100, Bartosz Golaszewski wrote:
> czw., 21 lis 2019 o 01:34 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Wed, Nov 20, 2019 at 04:18:24PM +0100, Bartosz Golaszewski wrote:
> > > śr., 20 lis 2019 o 15:36 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Golaszewski wrote:
> > > > > śr., 20 lis 2019 o 15:13 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > >
> > > > > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Golaszewski wrote:
> > > > > > > śr., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > >
> > > > > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > >
> > > > > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > > > > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
> > > > > > > > > > > > > +{
> > > > > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > > > > > > > > +       unsigned int i;
> > > > > > > > > > > > > +       int direction;
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +       line = gpiod_line_bulk_get_line(bulk, 0);
> > > > > > > > > > > > > +       if (line->as_is) {
> > > > > > > > > > > >
> > > > > > > > > > > > Can you explain the purpose of this as_is field? I'm not sure this is
> > > > > > > > > > > > really needed.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > It is there for gpiod_set_flags, which has to populate the direction
> > > > > > > > > > > flags in the SET_CONFIG ioctl. The existing line->direction is
> > > > > > > > > > > either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
> > > > > > > > > > > as-is is gets mapped to input.
> > > > > > > > > > > I didn't want to change the existing line->direction, and adding the
> > > > > > > > > > > as-is seemed clearer than adding another flavour of direction that
> > > > > > > > > > > contained all three.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Hmmm, I think I see what you were getting at - the line->direction is the
> > > > > > > > > > direction from the kernel, so it doesn't hurt to use that value to set the
> > > > > > > > > > corresponding request flags - even if the original request was as-is??
> > > > > > > > > >
> > > > > > > > > > If that is the case then the line->as_is can be dropped throughout.
> > > > > > > > > >
> > > > > > > > > > Kent.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Yes, this is what I was thinking. Just need to make sure the value
> > > > > > > > > from the kernel is up-to-date.
> > > > > > > > >
> > > > > > > >
> > > > > > > > So fail if needs_update?
> > > > > > > >
> > > > > > > > Kent.
> > > > > > >
> > > > > > > I'd say: do an implicit update before setting config.
> > > > > > >
> > > > > >
> > > > > > So gpiod_line_update if needs_update, and fail if that fails?
> > > > > >
> > > > > > Kent.
> > > > >
> > > > > Without the if - needs_update is only set if an implicit update fails
> > > > > in line_maybe_update(). But in this case we need to be sure, so do it
> > > > > unconditionally.
> > > > >
> > > >
> > > > Given that line_maybe_update is called at the end of request creation, and
> > > > whenever set_config is called, how can line->direction be inconsistent
> > > > with the kernel state - as long as needs_update is false?
> > > >
> > >
> > > I don't think we should call line_maybe_update() on set_config() - in
> > > this case we should call gpiod_line_update() and fail in set_config()
> > > if it fails.
> > >
> > > I hope that's clearer.
> > >
> >
> > Not really.  I was already shaky on the needs_update and I'm getting more
> > confused about the overall needs_update handling policy by the minute.
> >
> 
> Yeah it's not optimal. If you have better ideas on how to handle the
> fact that the kernel can't really notify us about the changes in
> line's flags introduced by other processes - I'll be more than glad to
> give them a try. At some point I was thinking about another ioctl()
> that - for a requested line - would return a file descriptor which
> would emit events when a line changes - for instance, it's requested
> by someone else or its direction is changed etc.
> 

I didn't realise it was possible for a requested line's flags to be
changed by other processes.  Quite the opposite - I thought that was one
of the reasons for GPIOD was to allow the userspace to prevent other from
processes messing with requested lines.

Kent.

> I then thought that nobody is requesting this yet and so it may be overkill.
> 
> Bart
> 
> > Perhaps it will be more productive to go to the code.
> > I'll send out what I have as v2 and we can go from there.
> >
> > Cheers,
> > Kent.
