Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAEB131B63C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 10:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbhBOJMX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 04:12:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhBOJMU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 04:12:20 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2866AC061574
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 01:11:40 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id t11so3857371pgu.8
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 01:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VUXlF5s7R/1KE/g0TgEy3YlyJ0O59xSEQWM9M2BNwBE=;
        b=ro1KeYpz8KENj5GpaVO4/2omsI/2MQFBlleCJoCrsqlzrBI3+UW/NHOLa9zI+STE2K
         uF6J78qhBJwg0W51+o/Vld9HARKsAcn/IgV2DInfQcMEhpI3l60H+VXAsw8TAiAFyVJt
         zSWs9II6wUYho4UIIYhnP8AL4OKqFemf5qKI8lcKY18WYf/LGKcH3BwTUKZ1VRBbFvLG
         PAAxCg9XZE4YYOAHXQm6bG1wSYgaFRvENswHJBx5gQkR1KPvnTw+xkfp5H0Tv3MmQw9r
         HUvYaMohPCuQM1yJjc37swG3XKqOVdk9RfRUf5mfzausxy3dUcCGBnbMoqoWGChMxVth
         ziYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VUXlF5s7R/1KE/g0TgEy3YlyJ0O59xSEQWM9M2BNwBE=;
        b=oYgPxWNQZhgHKSH9LYBNBpK9HMdoz1r95iHuouUgBczOI9vrtT6J1uPC4JXdbCgdzy
         OrfxLDsehfOh8C+euMMDhVUhUso4zAFzyt668pq88dPISguhMP7dxh8w5Gpo9xrALXle
         h8V/EOiBosmY9IjmJA77y1pjM8Ke83J9YrhVScg+WF+EjZ4EuNTmIY1eHyQx0LV2q7hm
         km7rwC4Rs1llkY4RrF3Zc5uSrR8QvwOpJWoQ+BkUy3dscGfRKqzfJJKokm5K6ANcZfix
         3Fh8i2cOPSzelik2DPp9hu1orV2oe8OLNsjvmMTyvKISJtmY2Xs6CQx2nli/aZMGz+k0
         Q0WA==
X-Gm-Message-State: AOAM530DACKX4W1u9Nm6sA3vDlogkQmPsHLCkJyrWL/s9noTTzdvc28E
        eKTuLLcpIkCWHQib3BmDP1nFUh5Hyd24Zg==
X-Google-Smtp-Source: ABdhPJwwmjsPYYyG5d4GxagiEGchpkOc4Hibpa0fPdzSHVcQLx0hZdyS/dGcjQTYp9B+SK9fZ0QwcQ==
X-Received: by 2002:a63:38c:: with SMTP id 134mr14112812pgd.302.1613380299611;
        Mon, 15 Feb 2021 01:11:39 -0800 (PST)
Received: from sol (106-69-179-46.dyn.iinet.net.au. [106.69.179.46])
        by smtp.gmail.com with ESMTPSA id e26sm17288135pfm.87.2021.02.15.01.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 01:11:38 -0800 (PST)
Date:   Mon, 15 Feb 2021 17:11:34 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Pedro Botella <pbotella@gmail.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod] Bug in python binding when requesting output?
Message-ID: <20210215091134.GA20088@sol>
References: <CAJAEvhib-M-UQeoCDs+aex-hdE-vJSQk=C5B7z4A9WmR+JcxQQ@mail.gmail.com>
 <20210213002336.GA7405@sol>
 <CAJAEvhjQv5hg9GvFXTFotq5ctsKnzXaTdb56KmkqQepAKcfAuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJAEvhjQv5hg9GvFXTFotq5ctsKnzXaTdb56KmkqQepAKcfAuA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 15, 2021 at 09:15:00AM +0100, Pedro Botella wrote:
> Okay, got it. I have understood the function incorrectly then.
> 
> What I wanted to achieve was for the output to keep its current state
> if it was already configured as an output, which I thought would be a
> reasonable behavior.

The general policy is that userspace takes responsibility for the state
of the GPIO lines it requests.
If selecting the line as an output then you should know the state you
want the line to be in - any residual state is generally irrelevant.
Having said that, the as-is option is there for any case where you
really need to know the existing state of the line before changing it,
but that should be very rare.

> So I will instead wrap my requests with this:
> 
> def gpiod_safe_request_out(line, consumer):
>     if line.direction() == gpiod.Line.DIRECTION_OUTPUT:
>         # already an output, request as is and the output value won't
> be modified
>         line.request(consumer=consumer, type=gpiod.LINE_REQ_DIR_AS_IS)
>     else:
>         # Read current value
>         line.request(consumer=consumer, type=gpiod.LINE_REQ_DIR_IN)
>         value = line.get_value()
>         line.release()
>         # Request as output current value as default value
>         line.request(consumer=consumer, type=gpiod.LINE_REQ_DIR_OUT,
> default_val=value)
> 
> Which won't modify outputs, and if it is currently an input, will keep
> the value at the pin.
> 

A line being an input is electrically very different from being an output.
If an output line is set to input then its value will depend on the
particular circuit - it may be pulled up or down or it may float.
Either way the existing input value doesn't generally mean much.

Again, if you know the line is suitable to use as an output then just set
the initial state to whichever level makes sense for your application.
And if you aren't sure the line is suitable to be an output then
definitely don't - that can make the smoke come out.

> I don't think I'm the most suitable for providing a patch for the
> uninitialized default_vals, I'm not very well versed in providing
> patches to the linux source tree, but I can give it a try if you want
> me to.
>

No problem - I can write a patch for it - just thought you might like to
take a swing at it since you found it.

Cheers,
Kent.

> Thanks for your help Kent!
> 
> Pedro
> 
> On Sat, Feb 13, 2021 at 1:23 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Feb 11, 2021 at 09:54:22PM +0100, Pedro Botella wrote:
> > > Hi,
> > >
> > > I'm experiencing what I think is a bug in the python bindings for libgpiod.
> > > I believe a line.request with type gpiod.LINE_REQ_DIR_OUT always
> > > results in that line being set to '0'.
> >
> > That is correct - when requesting a line as output at the kernel uAPI
> > the initial value must always be provided.  If you do not provide
> > default_vals via the Python API then the output should be defaulted to
> > '0' by the Python binding.
> >
> > > To reproduce:
> > > 1. request a line with type gpiod.LINE_REQ_DIR_OUT
> > > 2. set the line to '1'
> > > 3. release the line
> > > 4. request the same line with type gpiod.LINE_REQ_DIR_OUT
> > > 5. get the value, it should now be '0'
> > >
> >
> > To clarify, the expected behaviour is that the output is defaulted
> > to '0' if default values are not provided.
> > So the problem you are seeing is that the output is not consistently '0'?
> >
> > If you are expecting to see a '1' then you are expecting the lack of
> > default_vals in the kwds to leave the output value as is, but that is
> > not the case - it should default to '0'.
> >
> > > I think the issue is in "gpiod_LineBulk_request" in
> > > https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindings/python/gpiodmodule.c
> > > There a call to "gpiod_line_request_bulk" with default_vals being
> > > passed as a pointer. Later on in the code, this parameter is checked
> > > for NULL, if it is not NULL then the values in the array are used as
> > > default_vals.
> > > I believe that a NULL pointer should be passed instead if no
> > > default_vals have been requested when doing a Line.request from
> > > Python.
> > >
> >
> > Agreed - passing default_vals uninitialized to gpiod_line_request_bulk()
> > is a bug.
> > It should be zeroed, or a NULL pointer should be passed if the
> > default_vals were not provided in the kwds. Otherwise the output
> > value will be set based on the uninitializezd contents of default_vals.
> >
> > Would you like to provide a patch?
> >
> > In the meantime the obvious workaround is to always provide default_vals
> > in the kwds.
> >
> > Cheers,
> > Kent.
