Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9925D104F3C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 10:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUJah (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 04:30:37 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34405 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUJah (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 04:30:37 -0500
Received: by mail-pf1-f195.google.com with SMTP id n13so1385689pff.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 01:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rarzi0gFmASvHANYoUksoz+mHADpvS3YhDtJSEN3UgY=;
        b=JhfZ7q/v05W8/HUt55pV7EcT6YCtpaNcQRzxcxoMGJA3TUd3us9gWaTmxXwwNs2+UO
         aAr25Fh/jcmNBihn68my1i7Y76Fu7FUXcQhHB7cSJ677vA0AWQAaXadYLTHmrKjUzDw5
         iuhbUHVDh+Z36AOBtMofYPouPryUiragZhaRT98no8sEJ34+tAVD2CjEMKa3lNdWN6zw
         VKSrkCPFtr1SeiKKIsCIG/DM3fTtu9eRn240pYIWlR6kSRzT8x/snXzKzwJsFXFNXwXc
         ppBkJOwDZRjldIo7X6qM4UIzwfpvhvLevPW95txI/WzlsgTE2SPS4CT2NJrH0aGb0GZI
         fo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rarzi0gFmASvHANYoUksoz+mHADpvS3YhDtJSEN3UgY=;
        b=jN+vFfkNpwE66XfiTfFJOp9RxFeF0Su6YaAskjpILfsiK0uVv0Ez9e0Al2+scEV3b3
         +7zLDoD89MPws4akSrn/wUse8Oyu1Gea1L0zlYzJ+9I2wPknYyz82ltNJMzjG5bNeRBb
         gIDtIHQIzQw57E1cMVHSbEbdu5UMbuoOrAgMeJIXKvBoFRFnMmbkcJOTMNAuXdiJluVR
         asHnsBzBX8yYq3K0I32hgKRPmtd22P8G8h22McA1bskTN1rCT+vL7WmcAVNCvbAQUZ9L
         57sE2oPvmjirBBQyW3YAOvwM6Hkvshc92WEzdGAskjohO/7hS4d1wGKX6Pwuv9QVxiVu
         DIMQ==
X-Gm-Message-State: APjAAAWREZeI4tqDQNJxze9iG3R4NzNerhSpatsaV+4LU8FjBEAR++6+
        YwZlvT9RA9mBo6UJyzvKkVQ=
X-Google-Smtp-Source: APXvYqxZ9ou3QFx8uh62a72TcdhSmJRPWVeGfEbGbuhANzAQ05aH4Erox87BAtrFJVBPtNvoRC0UkQ==
X-Received: by 2002:a62:e519:: with SMTP id n25mr9492586pff.220.1574328636336;
        Thu, 21 Nov 2019 01:30:36 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id x10sm2617906pfn.36.2019.11.21.01.30.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 01:30:35 -0800 (PST)
Date:   Thu, 21 Nov 2019 17:30:30 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
Message-ID: <20191121093030.GA19142@sol>
References: <20191120135857.GA4218@sol>
 <CAMRc=McNdcaLJKG3TRvX08Ddwmi-V9AJUDG5zmBgqL8bwjCSYg@mail.gmail.com>
 <20191120141353.GA5154@sol>
 <CAMRc=MdWj_+kd2wGUoRVRSd+kq597h-jetiHMwRiOvuUi8qRQQ@mail.gmail.com>
 <20191120143644.GA5865@sol>
 <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
 <20191121003443.GA7695@sol>
 <CAMRc=MebbS86gvXytYrCBOyNVr74fTiVXG+NP0sx0F6SkAL_+A@mail.gmail.com>
 <20191121074621.GA17026@sol>
 <CAMRc=MeOAsOU4PVuUd1CPVLhcTWaj_e7AzQSi4u-m3Gf9m3xqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeOAsOU4PVuUd1CPVLhcTWaj_e7AzQSi4u-m3Gf9m3xqQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 21, 2019 at 09:46:07AM +0100, Bartosz Golaszewski wrote:
> czw., 21 lis 2019 o 08:46 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Thu, Nov 21, 2019 at 08:13:42AM +0100, Bartosz Golaszewski wrote:
> > > czw., 21 lis 2019 o 01:34 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Wed, Nov 20, 2019 at 04:18:24PM +0100, Bartosz Golaszewski wrote:
> > > > > śr., 20 lis 2019 o 15:36 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > >
> > > > > > On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Golaszewski wrote:
> > > > > > > śr., 20 lis 2019 o 15:13 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > >
> > > > > > > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > śr., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > >
> > > > > > > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > > > >
> > > > > > > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > > > > > > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
> > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > > > > > > > > > > +       unsigned int i;
> > > > > > > > > > > > > > > +       int direction;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +       line = gpiod_line_bulk_get_line(bulk, 0);
> > > > > > > > > > > > > > > +       if (line->as_is) {
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Can you explain the purpose of this as_is field? I'm not sure this is
> > > > > > > > > > > > > > really needed.
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > It is there for gpiod_set_flags, which has to populate the direction
> > > > > > > > > > > > > flags in the SET_CONFIG ioctl. The existing line->direction is
> > > > > > > > > > > > > either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
> > > > > > > > > > > > > as-is is gets mapped to input.
> > > > > > > > > > > > > I didn't want to change the existing line->direction, and adding the
> > > > > > > > > > > > > as-is seemed clearer than adding another flavour of direction that
> > > > > > > > > > > > > contained all three.
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > Hmmm, I think I see what you were getting at - the line->direction is the
> > > > > > > > > > > > direction from the kernel, so it doesn't hurt to use that value to set the
> > > > > > > > > > > > corresponding request flags - even if the original request was as-is??
> > > > > > > > > > > >
> > > > > > > > > > > > If that is the case then the line->as_is can be dropped throughout.
> > > > > > > > > > > >
> > > > > > > > > > > > Kent.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Yes, this is what I was thinking. Just need to make sure the value
> > > > > > > > > > > from the kernel is up-to-date.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > So fail if needs_update?
> > > > > > > > > >
> > > > > > > > > > Kent.
> > > > > > > > >
> > > > > > > > > I'd say: do an implicit update before setting config.
> > > > > > > > >
> > > > > > > >
> > > > > > > > So gpiod_line_update if needs_update, and fail if that fails?
> > > > > > > >
> > > > > > > > Kent.
> > > > > > >
> > > > > > > Without the if - needs_update is only set if an implicit update fails
> > > > > > > in line_maybe_update(). But in this case we need to be sure, so do it
> > > > > > > unconditionally.
> > > > > > >
> > > > > >
> > > > > > Given that line_maybe_update is called at the end of request creation, and
> > > > > > whenever set_config is called, how can line->direction be inconsistent
> > > > > > with the kernel state - as long as needs_update is false?
> > > > > >
> > > > >
> > > > > I don't think we should call line_maybe_update() on set_config() - in
> > > > > this case we should call gpiod_line_update() and fail in set_config()
> > > > > if it fails.
> > > > >
> > > > > I hope that's clearer.
> > > > >
> > > >
> > > > Not really.  I was already shaky on the needs_update and I'm getting more
> > > > confused about the overall needs_update handling policy by the minute.
> > > >
> > >
> > > Yeah it's not optimal. If you have better ideas on how to handle the
> > > fact that the kernel can't really notify us about the changes in
> > > line's flags introduced by other processes - I'll be more than glad to
> > > give them a try. At some point I was thinking about another ioctl()
> > > that - for a requested line - would return a file descriptor which
> > > would emit events when a line changes - for instance, it's requested
> > > by someone else or its direction is changed etc.
> > >
> >
> > I didn't realise it was possible for a requested line's flags to be
> > changed by other processes.  Quite the opposite - I thought that was one
> > of the reasons for GPIOD was to allow the userspace to prevent other from
> > processes messing with requested lines.
> >
> 
> Ugh, sorry, was writing it before coffee. I was thinking about a
> non-requested line. Something like lineinfo ioctl() but returning an
> fd notifying about changes. Maybe we could even consider having
> lineinfo2 ioctl() which would be extended with this functionality -
> not only would it fill the relevant structure but also pass a new fd
> for notification about changes.
> 

Whew - that makes more sense. Had me worried there.

Not sure how useful an async info ioctl would be.  Couldn't you build
something equivalent in userspace with the existing API - as long as you
don't mind the daemon holding the line, and so having to control the
line via the daemon.  You want to be able to monitor without requesting
the line?

I'm still puzzled as to when the existing info ioctl could fail on a
requested line - which is when needs_update gets set in
line_maybe_update().  Hardware being unplugged?

Cheers,
Kent.
