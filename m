Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA4F4103D04
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 15:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbfKTOOB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 09:14:01 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36973 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729682AbfKTOOB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 09:14:01 -0500
Received: by mail-pg1-f194.google.com with SMTP id b10so4867823pgd.4
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 06:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Bh5HWl9xcmF+XYggWreB6xO2luKuCSqe7RgA+6YQ4Aw=;
        b=Pz7fBnSzXHazv2ijbelVk//3xGK9JmsJ1WnXzkc1p4krvai5gD3bMDBpZDCxOj8y5U
         gUPLephcR/JRq0QsorO+XwcXv10r1x+dTXFTCfvPg9hO6+ymVoO4+oOq+Gp2ICDsRtTh
         KvX/tUA+K9Qg4cq4PuKu+Oznm2Nld9WKhO6BocvQHR220QskTqfoA4VmGfrvms6wjmZ9
         /L2+Ez55xZ6dG5DzI8f6oktLQAMfHvYBY5VBUBb5nLO0jmP6jR9Kp03NpBFub+5gSCNH
         /D22yM390GwMOQa4vIKaC7kW+in1CmyrZrt1ZkJLq+vxzdgi8uIfuhNhwyNJpb/hSChV
         FwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Bh5HWl9xcmF+XYggWreB6xO2luKuCSqe7RgA+6YQ4Aw=;
        b=fnADdJXrm3XwdPa1vAfNUxmHM/dLtjOKk72V65CmoJ102UPtkF4Bm+mUipUmD+04ai
         8iDHKz5ktCjiw7kWUfyCIELx9AM9QvopHjFvfNv5zv6DK6CE7bDLl3Nq4h0dukmYOFX4
         DOhIo6EANt8VPtIoAwMhFycs+jND4E3T5x9rhLryu+wew+R28ppkNXS2a8mRLQrLWee4
         Ztw4sLWigfUzreOntzHq5262TzFrSzaT+chJJdZQqcaZqefafy6ktQP6bxEWOZqYC6+M
         0sOCmsBnpVUq9f6hGQ2RMd6nIGUSbUcLLvS0u300o/DjZO+eTHr6iUgoZ3SWWBW1f727
         376g==
X-Gm-Message-State: APjAAAVIPnWUbGZ4BtYJJviSNQiYWiEZIjR6f5xfglKrf+dgCUNo4YCf
        d2nEngkoUf7R8SkQ0pMVdrfysqWq4bM=
X-Google-Smtp-Source: APXvYqzja5pplYFmiFqRSiW+mhBwhJ/+RuUJOYnYN/e/tLwOzJ+ZcE5+U4V7OqUHuMZQEZS33JVaOw==
X-Received: by 2002:aa7:85d7:: with SMTP id z23mr4350583pfn.24.1574259238762;
        Wed, 20 Nov 2019 06:13:58 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id l10sm6950399pjw.6.2019.11.20.06.13.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 06:13:58 -0800 (PST)
Date:   Wed, 20 Nov 2019 22:13:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
Message-ID: <20191120141353.GA5154@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-12-warthog618@gmail.com>
 <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
 <20191118144825.GE27359@sol>
 <20191119155249.GA20834@sol>
 <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
 <20191120135857.GA4218@sol>
 <CAMRc=McNdcaLJKG3TRvX08Ddwmi-V9AJUDG5zmBgqL8bwjCSYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McNdcaLJKG3TRvX08Ddwmi-V9AJUDG5zmBgqL8bwjCSYg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Golaszewski wrote:
> śr., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski wrote:
> > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > > > > > +
> > > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
> > > > > > > +{
> > > > > > > +       struct gpiod_line *line;
> > > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > > +       unsigned int i;
> > > > > > > +       int direction;
> > > > > > > +
> > > > > > > +       line = gpiod_line_bulk_get_line(bulk, 0);
> > > > > > > +       if (line->as_is) {
> > > > > >
> > > > > > Can you explain the purpose of this as_is field? I'm not sure this is
> > > > > > really needed.
> > > > > >
> > > > >
> > > > > It is there for gpiod_set_flags, which has to populate the direction
> > > > > flags in the SET_CONFIG ioctl. The existing line->direction is
> > > > > either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
> > > > > as-is is gets mapped to input.
> > > > > I didn't want to change the existing line->direction, and adding the
> > > > > as-is seemed clearer than adding another flavour of direction that
> > > > > contained all three.
> > > > >
> > > >
> > > > Hmmm, I think I see what you were getting at - the line->direction is the
> > > > direction from the kernel, so it doesn't hurt to use that value to set the
> > > > corresponding request flags - even if the original request was as-is??
> > > >
> > > > If that is the case then the line->as_is can be dropped throughout.
> > > >
> > > > Kent.
> > > >
> > >
> > > Yes, this is what I was thinking. Just need to make sure the value
> > > from the kernel is up-to-date.
> > >
> >
> > So fail if needs_update?
> >
> > Kent.
> 
> I'd say: do an implicit update before setting config.
> 

So gpiod_line_update if needs_update, and fail if that fails?

Kent.
