Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9E328CEC7
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 14:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgJMMxl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 08:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbgJMMxl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 08:53:41 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A143C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 05:53:39 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id w17so1371217ilg.8
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 05:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WhQRpop8dGy7yxr8aJ60/WVkolgV67a2XRvIWmtXhtw=;
        b=Wpja6+c/5hjYxxxItLG3ePr69DvxV/7XMf7Fcco1CRD0rUtCBBiWYoc7gaBKChGnLD
         ax3UkTvGrRpBnHTSY8BBHSUsAotQGpgf/Y0mQstkM4IO8CFWCXbGdGaoaGFtGrECGmu7
         Ic4v5MPsFVJDc+n32uwtymPQa3HhlaY8ffbYtCLDmkEhayIZx36SQbvV8lcO6bzGLQsz
         sQHTFyVvMZCoMS+laq1b16DG2tU7Kb6ysF/8VF+bYFaO77cmCvzZiQHfMx5H5qmRqnRt
         ADbp3qCUAtA9yI/EEyXvPxXGGVdT3LkpsmZSL5g53RwQkUM5wit/ltC2XacMX7wdoWHZ
         aGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WhQRpop8dGy7yxr8aJ60/WVkolgV67a2XRvIWmtXhtw=;
        b=Y3+wOSdFaVJ25YOlcy8U8bI3KXCZT6pMSE9ym0ZcxmgMQQACwU9uZIQtel152WU7+H
         IeOjHgU+6H0V3zamC9zz/FQmPFxogVz2eARen1NiW0mkdR46r/JBpQJomGSj+RUAHGrS
         QWPJqbTKjlY+a07eKKJHvG61q+D2Q3Aojh1N8+QI6G+R6w1rxjWo3FwePRHD6TRitBYk
         XV1mD2Kj/LVvh2/TImoPbd3O9Pvgjh8yIHpDzR4sEOydZMDP7JRte9xgRyKG+fAVFeTo
         9Ht9sUZqqaQoxSU8k+2841nIjOsmo8QaTrilIxS56PhkKxrceEkQYKRtypaKkijBhSKy
         CfTw==
X-Gm-Message-State: AOAM530U6si2+93n83xLRog7nKjPlrnb/W5wv7jkIR9gL15qljkZ+y2p
        AZg6VSuRg/t7arPVI93LDagFBzUz90OIyEWT06IjsA==
X-Google-Smtp-Source: ABdhPJxD6uEcVU+iW209E9KnWWreyppUO7DH5oP1POY8yQfJeSq6eNO5FzpI3p+z4VE99Z7vTghkt+ownaW0QzBLpPw=
X-Received: by 2002:a92:b610:: with SMTP id s16mr3274074ili.6.1602593618935;
 Tue, 13 Oct 2020 05:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol> <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol> <CAMRc=McbDOQ1=SBfj6DbsMQ+fcRtZ9n4eiEqVeY74frcOM=wVw@mail.gmail.com>
 <20201013122753.GA217897@sol>
In-Reply-To: <20201013122753.GA217897@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Oct 2020 14:53:28 +0200
Message-ID: <CAMRc=MddS6xO0FY-J5cow9JPQCM4bLHn_RuSyUpuDWi02fOYSQ@mail.gmail.com>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 13, 2020 at 2:28 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Oct 13, 2020 at 02:05:35PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Oct 13, 2020 at 10:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Tue, Oct 13, 2020 at 09:45:04AM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, Oct 13, 2020 at 2:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > On Mon, Oct 12, 2020 at 05:15:25PM +0200, Bartosz Golaszewski wrote:
> > > > > > Hi!
>
> [snip]
>
> > > > > >
> > > > > > in the kernel) in struct gpiod_line and chain the lines together with
> > > > > > struct gpiod_line_bulk containing the list head. That would mean only
> > > > > > being able to store each line in a single bulk object. This is
> > > > > > obviously too limiting.
> > > > > >
> > > > >
> > > > > I don't think I've ever gotten my head fully around the libgpiod API,
> > > > > or all its use cases, and I'm not clear on why this is too limiting.
> > > > >
> > > >
> > > > For instance: we pass one bulk object to gpiod_line_event_wait_bulk()
> > > > containing the lines to poll and use another to store the lines for
> > > > which events were detected. Lines would need to live in two bulks.
> > > >
> > >
> > > Ahh, ok.  So you want to keep that?  I prefer a streaming interface, but
> > > I guess some prefer the select/poll style?
> > >
> >
> > Yeah I wanted to keep it. Why? We allow plugging into external event
> > loops by providing a helper for accessing the underlying file
> > descriptor but I think we still should have some basic wrappers for
> > poll(). What exactly are you referring to as "streaming interface"?
> >
>
> By "streaming interface" in this context I mean reading the events from
> the fd. That stream of events retains ordering where select/poll on a bulk
> doesn't.
>
> Cheers,
> Kent.
>

Ah right! Yes, you're right. Let's ditch this then and return events
referencing lines on which they occurred.

Bartosz
