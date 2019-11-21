Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E716F104793
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfKUAev (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:34:51 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40381 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfKUAev (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:34:51 -0500
Received: by mail-pf1-f195.google.com with SMTP id r4so674982pfl.7
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=w0jc3nhu3KAWiFKWh+zpyGdVs1iUHPccdIEeVjCy13s=;
        b=Wii2YRqwFMlbSaS+M+fPcA/HuRrG1/YoGNOOZbJpiJr1RUmYL01vr2lhEwMRyLiAK1
         7hXIRa+ws+jm6bludi//A1ToXTwyYYLXPE8d0o+/QKnDTcAhTUrewkpMSWTiC2j3ds9l
         rMCJFA24HkCkeKmdtpaVVLwylcspXdQQMm7c7ppCxa7UOsJwnyaAafJNc64NVsJqqEJ1
         dgIrgI9O1XIAnsk3oVWgRHtilPBHM8zTScIS8XtGvP7vCEelvBO9cUexDKFw5+PEokZW
         uqvLqN2tLfQG3OiyzWY73J5JYadgdzwdREW/gCbzg003r+fVfVShzVGT88SYJCSDbGFB
         toYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=w0jc3nhu3KAWiFKWh+zpyGdVs1iUHPccdIEeVjCy13s=;
        b=SllfwWgd2DAVhqHuLcLAb7Ew6g53VKE1BlaesCVNHuVZDXiZsYcv7A1NEbAK5K5vpq
         eHSaLY3lFHL1VGRv3A0jzeyEeVURO+jE5WpIfLFW2pzS7w/ajkT9d6XPVRRt2syqOlNY
         itOD55bFDM+xU4AkUnLWQCJIqqkehzBRkDn8Dq3l5f92r0Zqutb99k8JzaS7VWKgMKcw
         Y7jR5uYbraDxhzIYwLTVyPxNnaFQsgHd8NQSGgZtTL2tORBOLxEFx15+9buY5HoXIWg9
         MRC47zieTh4MQTZSviUK2wVTPW6W44qWXiv6F3BZCLjr1d1gc09/6mVq3jZQ8STzSIk9
         7Jkw==
X-Gm-Message-State: APjAAAWl9cUgSY+ZGSiafc5Vxk0ahK4iMS7rikAHN7XILzBwCkbWI8++
        zHAC1LB4V2Lg1fWo+SjtmydJPgetRbs=
X-Google-Smtp-Source: APXvYqw6P3KWVbWUUvauXWVrYw43IX2lXZmZ4n8GUGz8Fkb1BTyz3xhol6wzLxmxkh0TFBhzFeVJIQ==
X-Received: by 2002:a65:67c7:: with SMTP id b7mr6207953pgs.339.1574296489448;
        Wed, 20 Nov 2019 16:34:49 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id f7sm575283pfa.150.2019.11.20.16.34.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 16:34:48 -0800 (PST)
Date:   Thu, 21 Nov 2019 08:34:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
Message-ID: <20191121003443.GA7695@sol>
References: <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
 <20191118144825.GE27359@sol>
 <20191119155249.GA20834@sol>
 <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
 <20191120135857.GA4218@sol>
 <CAMRc=McNdcaLJKG3TRvX08Ddwmi-V9AJUDG5zmBgqL8bwjCSYg@mail.gmail.com>
 <20191120141353.GA5154@sol>
 <CAMRc=MdWj_+kd2wGUoRVRSd+kq597h-jetiHMwRiOvuUi8qRQQ@mail.gmail.com>
 <20191120143644.GA5865@sol>
 <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 20, 2019 at 04:18:24PM +0100, Bartosz Golaszewski wrote:
> śr., 20 lis 2019 o 15:36 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Golaszewski wrote:
> > > śr., 20 lis 2019 o 15:13 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Golaszewski wrote:
> > > > > śr., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > >
> > > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski wrote:
> > > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > >
> > > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > > > > > > > > > +
> > > > > > > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
> > > > > > > > > > > +{
> > > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > > > > > > +       unsigned int i;
> > > > > > > > > > > +       int direction;
> > > > > > > > > > > +
> > > > > > > > > > > +       line = gpiod_line_bulk_get_line(bulk, 0);
> > > > > > > > > > > +       if (line->as_is) {
> > > > > > > > > >
> > > > > > > > > > Can you explain the purpose of this as_is field? I'm not sure this is
> > > > > > > > > > really needed.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > It is there for gpiod_set_flags, which has to populate the direction
> > > > > > > > > flags in the SET_CONFIG ioctl. The existing line->direction is
> > > > > > > > > either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
> > > > > > > > > as-is is gets mapped to input.
> > > > > > > > > I didn't want to change the existing line->direction, and adding the
> > > > > > > > > as-is seemed clearer than adding another flavour of direction that
> > > > > > > > > contained all three.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Hmmm, I think I see what you were getting at - the line->direction is the
> > > > > > > > direction from the kernel, so it doesn't hurt to use that value to set the
> > > > > > > > corresponding request flags - even if the original request was as-is??
> > > > > > > >
> > > > > > > > If that is the case then the line->as_is can be dropped throughout.
> > > > > > > >
> > > > > > > > Kent.
> > > > > > > >
> > > > > > >
> > > > > > > Yes, this is what I was thinking. Just need to make sure the value
> > > > > > > from the kernel is up-to-date.
> > > > > > >
> > > > > >
> > > > > > So fail if needs_update?
> > > > > >
> > > > > > Kent.
> > > > >
> > > > > I'd say: do an implicit update before setting config.
> > > > >
> > > >
> > > > So gpiod_line_update if needs_update, and fail if that fails?
> > > >
> > > > Kent.
> > >
> > > Without the if - needs_update is only set if an implicit update fails
> > > in line_maybe_update(). But in this case we need to be sure, so do it
> > > unconditionally.
> > >
> >
> > Given that line_maybe_update is called at the end of request creation, and
> > whenever set_config is called, how can line->direction be inconsistent
> > with the kernel state - as long as needs_update is false?
> >
> 
> I don't think we should call line_maybe_update() on set_config() - in
> this case we should call gpiod_line_update() and fail in set_config()
> if it fails.
> 
> I hope that's clearer.
> 

Not really.  I was already shaky on the needs_update and I'm getting more
confused about the overall needs_update handling policy by the minute.

Perhaps it will be more productive to go to the code.
I'll send out what I have as v2 and we can go from there.

Cheers,
Kent.
