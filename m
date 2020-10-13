Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCC628C984
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 09:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390362AbgJMHpR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 03:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390040AbgJMHpR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 03:45:17 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E7EC0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 00:45:16 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id g7so21137281iov.13
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 00:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Fl43eLbLShHIyZB1+nIinTgdqWH74v1phHZzIAK9j8=;
        b=DHF5eSIZIJ7xjdJW1UgW/g7HKZDANjOxis9I8aCirE/vl6KPt79poGwg2XinBmDRwX
         HnHGauDOuvHWcEtUDuSsH0i4/hn+g0u4igQsVBmhZZpxXwpvba6eVtmDL2runQL+Ni+y
         k+3JmsInHcgvk5GA1KUQmdQxDatZAui/Kuj2uWfCqJ3EHMAhGYIT9gjRC81skEgDN1vO
         wBznplnZyIF0kb4ou055SXa7UiPa+SzZATvSPjvCi81n2dCJ2XTtpMru8X2vGUDQlZdl
         VxikVbfLwWPxk+HxGqxYqMHI8vZUfXdPeoz2z0pxV34u9nUM2AsSnXRPQg5uCRaAdXyi
         kZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Fl43eLbLShHIyZB1+nIinTgdqWH74v1phHZzIAK9j8=;
        b=CaSu9C4Jxp2qMRWR8MfVeqTC8An82gJFWZthsxXK0IlVPhO9F7wpbxBbcSCU/YhWBy
         tHbOD/RqdtdnpnC2o9D8xYmxuc955G90VtjeDQ0rUjI9SNJ+T0PaGyjdw0rHBc/XaPWD
         +FAGF7uGSBj237e77LIJC0YNYj1zRcoYpjB2WTxJYyBhfbkweK23Lr/WlHjWcaYtte2l
         2cGYa1Mtjofk4obEVU9sjF8SFWrHdK+tXVMgv34GJjsSOU3BtNdIFuLhGgxevUPy8FRd
         KFqEw31smIfBPVCFdWNOA6n9YqgSpgvNJtiBqN8dNCnoJomKxPqWCi6ylq9DBAgTncdR
         4KBg==
X-Gm-Message-State: AOAM5329mOrBcf3dcr8A41dnITXFYN0uxp2NGuenHocy3JlppaYOtrUG
        rH10kTDjrBt5VN1ZuBsJIWJn+fN3SFzNjv1wftReYQ==
X-Google-Smtp-Source: ABdhPJz1mrnZFFH8VA8/Wx+kqxESXrufp4ASHC0s1t1etN3SnApdyno5g+3XU3TQJu3Y8ZPFcPFteyE7TKkGacTILuU=
X-Received: by 2002:a02:3f68:: with SMTP id c40mr13265983jaf.136.1602575115414;
 Tue, 13 Oct 2020 00:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol>
In-Reply-To: <20201013005252.GA9387@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Oct 2020 09:45:04 +0200
Message-ID: <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
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

On Tue, Oct 13, 2020 at 2:53 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Oct 12, 2020 at 05:15:25PM +0200, Bartosz Golaszewski wrote:
> > Hi!
> >
> > One of the things I'd like to address in libgpiod v2.0 is excessive
> > stack usage with struct gpiod_line_bulk. This structure is pretty big
> > right now: it's an array 64 pointers + 4 bytes size. That amounts to
> > 260 bytes on 32-bit and 516 bytes on 64-bit architectures
> > respectively. It's also used everywhere as all functions dealing with
> > single lines eventually end up calling bulk counterparts.
> >
> > I have some ideas for making this structure smaller and I thought I'd
> > run them by you.
> >
> > The most obvious approach would be to make struct gpiod_line_bulk
> > opaque and dynamically allocated. I don't like this idea due to the
> > amount of error checking this would involve and also calling malloc()
> > on virtually every value read, event poll etc.
> >
> > Another idea is to use embedded list node structs (see include/list.h
> > in the kernel) in struct gpiod_line and chain the lines together with
> > struct gpiod_line_bulk containing the list head. That would mean only
> > being able to store each line in a single bulk object. This is
> > obviously too limiting.
> >
>
> I don't think I've ever gotten my head fully around the libgpiod API,
> or all its use cases, and I'm not clear on why this is too limiting.
>

For instance: we pass one bulk object to gpiod_line_event_wait_bulk()
containing the lines to poll and use another to store the lines for
which events were detected. Lines would need to live in two bulks.

> What is the purpose of the gpiod_line_bulk, and how does that differ from the
> gpio_v2_line_request?
>

struct gpiod_line_bulk simply aggregates lines so that we can easily
operate on multiple lines at once. Just a convenience helper
basically.

> > An idea I think it relatively straightforward without completely
> > changing the current interface is making struct gpiod_line_bulk look
> > something like this:
> >
> > struct gpiod_line_bulk {
> >     unsigned int num_lines;
> >     uint64_t lines;
> > };
> >
> > Where lines would be a bitmap with set bits corresponding to offsets
> > of lines that are part of this bulk. We'd then provide a function that
> > would allow the user to get the line without it being updated (so
> > there's no ioctl() call that could fail). The only limit that we'd
> > need to introduce here is making it impossible to store lines from
> > different chips in a single line bulk object. This doesn't make sense
> > anyway so I'm fine with this.
> >
> > What do you think? Do you have any other ideas?
> >
>
> Doesn't that place a strict range limit on offset values, 0-63?
> The uAPI limits the number of offsets requested to 64, not their value.
> Otherwise I'd've used a bitmap there as well.
>
> Or is there some other mapping happening in the background that I'm
> missing?
>

Nah, you're right of course. The structure should actually look more like:

struct gpiod_line_bulk {
    struct gpiod_chip *owner;
    unsigned int num_lines;
    uint64_t lines;
};

And the 'lines' bitmap should actually refer to offsets at which the
owning chip stores the line pointers in its own 'lines' array - up to
64 lines.

But we'd still have to sanitize the values when adding lines to a bulk
object and probably check the return value. I'm wondering if there's a
better way to store group references to lines on the stack but I'm out
of ideas.

Bartosz
