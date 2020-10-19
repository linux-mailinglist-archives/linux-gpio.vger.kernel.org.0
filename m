Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFF0292B5F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 18:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730538AbgJSQXm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 12:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730495AbgJSQVt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 12:21:49 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07940C0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 09:21:49 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o3so231010pgr.11
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 09:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QBA3SaBcxADRmZndmd9d1LLGuPi8uxpA7+wzfruoDfI=;
        b=a2BqZ9LBqAcoOksjEx0cuNQ+ngs5IDRvqyjF3tojoq6lwyFz8xISm1xVVsfh8SCFwj
         LGVuJpZVPyUFLzzOeOuVcAq7xfOUrQdpfGTJTV77ILwL5tLc0ILq6ZNSedPYpNzMrp9O
         kX2eHdvQFmBVwadkko8L9cnp1xflqitgot80SDboBhL7OnOZap3IoNBOPuzaVnyice2u
         AyLL+H1cMzozKwYlg0rdxYQhKLVgEKFOfvPqsBaNJPB6UCDU8Lw3tXiKUQZsEJpY1zRD
         hp8xQRG89fHj2PVbgtERQaWo5mn4PD0HTyHQ0zEF9nt0kjAy7WRsU4vtcTs5Art1QzPa
         6J7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QBA3SaBcxADRmZndmd9d1LLGuPi8uxpA7+wzfruoDfI=;
        b=emaqgE0+jbLY2+VkjGpQE7ZSA+eDaN6WROTNr/KFmTX1IZiaenSvDgMwTYL+QQ0e9j
         QZKHr3tAJTd0cfBTG7S9eS+zTN/2X0DVsML5gpusSvILdswuGRJXv6Ev3jxu7c4SmTFI
         CNmx+VsUcZ6FlZwv/GDhPxDQ9DzdYEFkcJdpHc2N0KgiGjORNJoHzC+yUpmm4od9m7Lg
         24uU4RG3pmDvHWtttsKgmsVnsWWFzC2Bf4JzKpSV5DbLHIM1siPPaNcQg8tKrf7R4C78
         YOYRFdZkGyH7IIIhcJrjpU9BwhjOrAvL5MnkwZTCAscNIcFBrBMD9fDJKunbP9EMC4r7
         wRuA==
X-Gm-Message-State: AOAM532sMhWBm7TfgFTULfSLwXE3+nSk1fwEW8MIPP3W+y3y2zoEqC/e
        9Apv0Bf5EegKvCqTN4Ccp0H98V49WhF7zA==
X-Google-Smtp-Source: ABdhPJyTyRlJxUgjCTjd/XIW84WhQoaG0SEDf8QDABux4bp133uRchqLkpVXncLBLViypY8Tk4qDuw==
X-Received: by 2002:a63:1414:: with SMTP id u20mr342368pgl.297.1603124508411;
        Mon, 19 Oct 2020 09:21:48 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id d190sm293351pfc.185.2020.10.19.09.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 09:21:47 -0700 (PDT)
Date:   Tue, 20 Oct 2020 00:21:42 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
Message-ID: <20201019162142.GA85778@sol>
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol>
 <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol>
 <CAMRc=Mc_kNmWBUhyxMHvr9bComG03=_rR4KM8X4wgzkqjK6FZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc_kNmWBUhyxMHvr9bComG03=_rR4KM8X4wgzkqjK6FZw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 03:31:07PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 13, 2020 at 10:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip]
> 
> > >
> > > struct gpiod_line_bulk {
> > >     struct gpiod_chip *owner;
> > >     unsigned int num_lines;
> > >     uint64_t lines;
> > > };
> > >
> > > And the 'lines' bitmap should actually refer to offsets at which the
> > > owning chip stores the line pointers in its own 'lines' array - up to
> > > 64 lines.
> > >
> > > But we'd still have to sanitize the values when adding lines to a bulk
> > > object and probably check the return value. I'm wondering if there's a
> > > better way to store group references to lines on the stack but I'm out
> > > of ideas.
> > >
> >
> > So you are proposing keeping the bulk of the bulk in the background and
> > passing around a flyweight in its place.  Makes sense.
> >
> 
> So this won't fly of course because a bitmap doesn't hold enough
> information to reference an arbitrary number of lines in the chip in
> any meaningful way.
> 

Yeah, that is what I was trying to get at earlier, but from your replies
I assumed you would have an array mapping from bitmap index to line
hidden somewhere behind the scenes on a per-bulk basis...

> I have another idea. I can live with struct gpiod_bulk being allocated
> dynamically whenever users of the library use it - because it's quite
> unlikely they'd do it all that often. What I'd like to avoid is
> allocating a new bulk object whenever we want to package a single line
> passed to e.g. gpiod_line_request() before we propagate it to
> gpiod_line_request_bulk().
> 
> How about we define struct gpiod_line_bulk as:
> 
> struct gpiod_line_bulk {
>     unsigned int num_lines;
>     unsigned int max_num_lines;
>     struct gpiod_line *lines[1];
> };
> 
> And expose it in gpiod.h header?
> 

I don't have a problem with that definition, appropriately documented,
but I wouldn't want to expose that to the user, so my preference would
be to make it opaque, but....

... that will make the API more awkward to use, as the methods that
populate a bulk will now have to have that bulk constructed beforehand.
Or you change them to accept a struct gpiod_line_bulk ** to return the
bulk constructed by libgpiod.  Either way the user will have to free the
bulk afterwards.  But there are only a few of those of those methods.

And all the bulk accesor methods are currently inline - that would also
have to change if you go opaque, so you will get a code size and
performance hit as well.

Maybe keeping it exposed is the best - just heavily documented?
At least start out that way, since it is closest to what is already there.

Cheers,
Kent.

> That way we can still allocate it on the stack while using very little
> memory - whenever packaging a single line - or we can allocate it
> dynamically with the following interface:
> 
> struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines)
> {
>     struct gpiod_line_bulk *ret;
> 
>     if (max_lines < 1) {
>         errno = EINVAL;
>         return NULL;
>     }
> 
>     ret = malloc(sizeof(struct gpiod_line_bulk) + (max_lines - 1) *
> sizeof(struct gpiod_line *));
>     if (!ret)
>         return NULL;
> 
>     gpiod_line_bulk_init(max_lines);
> 
>     return ret;
> }
> 
> Or we can even not expose it to users, make it completely opaque,
> provide needed accessors and only allow internal users inside the
> library to use the stack for single line bulks.
> 
> Bartosz
