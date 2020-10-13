Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89A428CE50
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 14:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgJMM2A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 08:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgJMM2A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 08:28:00 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E14C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 05:28:00 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d6so10594155plo.13
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cabpnRp2aNg4b4683xzY+VbMdIC1j+S3qK+jKkF20FU=;
        b=P0gamn/spfsoapoSbtwFzsjJqgnRcazlEzix48s1pp9uZYJmlAgYbcGxdG+EQxNrqW
         1UadY+9vXBkY2+wcvtaTEnJSxp+2rD1otA9xPes5e9uWUZOEZiM0LxmmP7MhgszhWmMF
         CsbKIz0Zo2EXFNeCzV/bZqmpQf0fkdxu/Ipf1rWs8Sv1OExANJO01WMuEuzy+oX0BinT
         95ju/LrM5gtV+PEnS239TjaO8HY3mAdwhcnI/4qDKdU/3rSaOA7Q60i3RsUXGfASwtmk
         fFb4b9TQAdl3jr0R0BpmqnmTOYzzuAHwmOKCTgveq4YRWdi3/bwjmIactY2mKNLBvdBT
         AXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cabpnRp2aNg4b4683xzY+VbMdIC1j+S3qK+jKkF20FU=;
        b=noJ6rgnEDaJ7K4j2EClIJEufigUeLpYJR1gPLB5vj/HidYqcjN1VNHC4cYQG0vQNvK
         4dS1durHq/vaNoARODpFGeOu8+lIdVW5keYEFPWKkXasP9hVjeh3C8K2LPp4OCmSl7BD
         GemOc+OmLm9biQMYawlOK2lVDa80PJkb4AGcUL4YCkauSmGUrkLmYuM6FzUd5v2qQmXA
         sfH7+nz6aI7rGxBHOSA9uvbsMXhNR0AQ2G8YPlDO98R9cmhXQ0lBC5rjeBI/Ilnl7Np7
         JAyZvjPeUIWnnAdEplU65Vd4W4ItFoT65iT22IIWhr4hBm86w62fKh9joLnZPauA1EqO
         hWGA==
X-Gm-Message-State: AOAM531LbC1bdplXald6VEV7nM7rD7NsILh7qVqMEMbot9QFSk+BDVg+
        NoGUrYpwhd7rQeLAOMKwneI=
X-Google-Smtp-Source: ABdhPJysFZ1Pybeg2t94cIhIyASnyfB6bkHUIO3WLOtIJOVB8mswIc6hASriTpMdKCTgCHezBnbtKA==
X-Received: by 2002:a17:902:16b:b029:d2:565e:a70b with SMTP id 98-20020a170902016bb02900d2565ea70bmr28767639plb.42.1602592079652;
        Tue, 13 Oct 2020 05:27:59 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id j23sm14549131pgm.76.2020.10.13.05.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 05:27:58 -0700 (PDT)
Date:   Tue, 13 Oct 2020 20:27:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
Message-ID: <20201013122753.GA217897@sol>
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol>
 <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol>
 <CAMRc=McbDOQ1=SBfj6DbsMQ+fcRtZ9n4eiEqVeY74frcOM=wVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McbDOQ1=SBfj6DbsMQ+fcRtZ9n4eiEqVeY74frcOM=wVw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 13, 2020 at 02:05:35PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 13, 2020 at 10:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Oct 13, 2020 at 09:45:04AM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Oct 13, 2020 at 2:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Mon, Oct 12, 2020 at 05:15:25PM +0200, Bartosz Golaszewski wrote:
> > > > > Hi!

[snip]

> > > > >
> > > > > in the kernel) in struct gpiod_line and chain the lines together with
> > > > > struct gpiod_line_bulk containing the list head. That would mean only
> > > > > being able to store each line in a single bulk object. This is
> > > > > obviously too limiting.
> > > > >
> > > >
> > > > I don't think I've ever gotten my head fully around the libgpiod API,
> > > > or all its use cases, and I'm not clear on why this is too limiting.
> > > >
> > >
> > > For instance: we pass one bulk object to gpiod_line_event_wait_bulk()
> > > containing the lines to poll and use another to store the lines for
> > > which events were detected. Lines would need to live in two bulks.
> > >
> >
> > Ahh, ok.  So you want to keep that?  I prefer a streaming interface, but
> > I guess some prefer the select/poll style?
> >
> 
> Yeah I wanted to keep it. Why? We allow plugging into external event
> loops by providing a helper for accessing the underlying file
> descriptor but I think we still should have some basic wrappers for
> poll(). What exactly are you referring to as "streaming interface"?
> 

By "streaming interface" in this context I mean reading the events from
the fd. That stream of events retains ordering where select/poll on a bulk
doesn't.

Cheers,
Kent.

